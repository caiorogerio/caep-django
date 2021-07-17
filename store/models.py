from core import models
from django.db.models import Q
from django.contrib.auth.models import AbstractUser
from django.contrib.auth.signals import user_logged_in
from django.utils.translation import gettext_lazy as _


def get_cart(request, create=True):
    try:
        if not create:
            raise

        cart, created = Order.objects.get_or_create(status='Cart', customer=request.user)
        if created:
            cart.save()
    except:
        try:
            if 'cart' in request.session:
                cart = Order.objects.get(pk=request.session['cart'], status='Cart')
            else:
                raise
        except:
            cart = Order.objects.create(status='Cart')
            request.session['cart'] = cart.pk
            request.session.save()

    return cart


@user_logged_in.connect
def on_customer_login(sender, user, request, **kwargs):
    cart = get_cart(request, create=False)
    if cart.customer is None:
        Order.objects.filter(customer=user, status='Cart').update(status='Canceled')
        cart.customer = user
        cart.save()
        del request.session['cart']


class Customer(AbstractUser):
    USERNAME_FIELD = 'email'
    address = models.CharField(_('Address'), max_length=1024)
    email = models.EmailField(_('Email'), unique=True)
    REQUIRED_FIELDS = []

    @property
    def cart(self):
        return Order.objects.get_or_create(customer=self, status='Cart')

    def __str__(self):
        return self.email


class Product(models.Model):
    title = models.CharField(max_length=100)
    description = models.TextField()
    image = models.ImageField(upload_to='store/product/images')
    price = models.DecimalField(max_digits=5, decimal_places=2)

    @property
    def received(self):
        return SupplyItem.objects\
            .filter(product=self, supply__status='Received')\
            .aggregate(models.Sum('quantity'))['quantity__sum'] or 0

    @property
    def reserved(self):
        return OrderItem.objects\
            .filter(product=self, order__status='Paid')\
            .aggregate(models.Sum('quantity'))['quantity__sum'] or 0

    @property
    def shipped(self):
        return OrderItem.objects\
            .filter(product=self, order__status='Shipped')\
            .aggregate(models.Sum('quantity'))['quantity__sum'] or 0

    @property
    def quantity(self):
        return self.received - self.shipped

    @property
    def disposal(self):
        return self.quantity - self.reserved

    @property
    def available(self):
        return self.disposal > 0

    def __str__(self):
        return self.title

    class Meta:
        verbose_name = _('product')
        verbose_name_plural = _('products')


class Supply(models.Model):
    STATES = ('Open', 'In transit', 'Received')
    STATES = [(i, i) for i in STATES]
    products = models.ManyToManyField(Product, through='SupplyItem')
    status = models.CharField(max_length=10, choices=STATES, default='Open')

    @property
    def product_names(self):
        return ', '.join([product.title for product in self.products.all()])

    @property
    def total_cost(self):
        return sum([item.total for item in self.supply_items.all()])

    def __str__(self):
        return str(self.created_at)


class SupplyItem(models.Model):
    product = models.ForeignKey(Product, on_delete=models.CASCADE, related_name='supply_items')
    supply = models.ForeignKey(Supply, on_delete=models.CASCADE, related_name='supply_items')
    quantity = models.IntegerField()
    cost = models.DecimalField(max_digits=6, decimal_places=2)

    @property
    def total(self):
        return (self.quantity or 0) * (self.cost or 0)

    def __str__(self):
        return '%s (%d)' % (self.product, self.quantity)


class OrderQuerySet(models.QuerySet):
    CLOSED_STATES = ('Closed', 'Paid', 'Shipped', 'Delivered',)

    def post_close(self):
        q = Q()
        for status in self.CLOSED_STATES:
            q |= Q(status=status)
        return self.filter(q)

    def closed(self):
        return self.filter(status='Closed')

    def paid(self):
        return self.filter(status='Paid')

    def shipped(self):
        return self.filter(status='Shipped')

    def delivered(self):
        return self.filter(status='Delivered')


class OrderManager(models.Manager):
    def get_queryset(self):
        return OrderQuerySet(self.model, using=self._db)

    def post_close(self):
        return self.get_queryset().post_close()

    def closed(self):
        return self.get_queryset().closed()

    def paid(self):
        return self.get_queryset().paid()

    def shipped(self):
        return self.get_queryset().shipped()

    def delivered(self):
        return self.get_queryset().delivered()


class Order(models.Model):
    STATES = ('Cart', 'Closed', 'Paid', 'Shipped', 'Delivered', 'Canceled')
    STATES = [(i, i) for i in STATES]
    customer = models.ForeignKey(Customer, on_delete=models.CASCADE, null=True)
    products = models.ManyToManyField(Product, through='OrderItem')
    status = models.CharField(max_length=10, choices=STATES, default='Cart')
    address = models.CharField(_('Address'), max_length=1024)

    objects = OrderManager()

    def __str__(self):
        return str(self.id)

    def save(self, *args, **kwargs):
        if self.customer:
            self.address = self.customer.address
        super(Order, self).save(*args, **kwargs)

    @property
    def total_price(self):
        return sum([item.total for item in self.order_items.all()])

    @property
    def product_names(self):
        return ', '.join([product.title for product in self.products.all()])

    def add(self, product, quantity):
        if self.pk is None:
            self.save()
        order_item, created = OrderItem.objects.get_or_create(product=product, order=self, defaults={
            'quantity': 0
        })
        order_item.quantity = quantity
        order_item.save()

    def close(self):
        self.status = 'Closed'
        self.save()

    def cancel(self):
        self.status = 'Canceled'
        self.save()

    def paid(self):
        self.status = 'Paid'
        self.save()

    def shipped(self):
        self.status = 'Shipped'
        self.save()

    def delivered(self):
        self.status = 'Delivered'
        self.save()

    def closed(self, *args, **kwargs):
        return self.objects.filter(Q(status='Closed') | Q(status='Paid') | Q(status='Shipped') | Q(status='Delivered'))


class OrderItem(models.Model):
    order = models.ForeignKey(Order, on_delete=models.CASCADE, related_name='order_items')
    product = models.ForeignKey(Product, on_delete=models.CASCADE, related_name='order_items')
    quantity = models.IntegerField()
    price = models.DecimalField(max_digits=6, decimal_places=2)

    def save(self, *args, **kwargs):
        if self.price is None:
            self.price = self.product.price
        super(OrderItem, self).save(*args, **kwargs)

    @property
    def total(self):
        return (self.quantity or 0) * (self.price or 0)

    def __str__(self):
        return '%s (%d)' % (self.product, self.quantity)


class Payment(models.Model):
    TYPES = ('Visa', 'Mastercard', 'Elo', 'Pix', 'Boleto', 'Dinheiro')
    TYPES = [(i, i) for i in TYPES]
    order = models.ForeignKey(Order, related_name='payments', on_delete=models.CASCADE)
    value = models.DecimalField(max_digits=6, decimal_places=2)
    type = models.CharField(max_length=15, choices=TYPES)

    def __str__(self):
        return 'R$%s (%s)' % (self.value, self.type)

    def save(self, *args, **kwargs):
        super(Payment, self).save(*args, **kwargs)
        total_paid = self.order.payments.aggregate(models.Sum('value'))['value__sum']

        if total_paid >= self.order.total_price:
            self.order.paid()


class Shipping(models.Model):
    TYPES = ('Correios', 'Mercado Livre', 'Rappi', 'Em mãos')
    TYPES = [(i, i) for i in TYPES]
    order = models.OneToOneField(Order, on_delete=models.CASCADE)
    type = models.CharField(max_length=15, choices=TYPES)
    estimated_delivery = models.DateField(blank=True)
    tracking_number = models.CharField(max_length=13, blank=True)

    def __str__(self):
        return str(self.created_at)

    def save(self, *args, **kwargs):
        super(Shipping, self).save(*args, **kwargs)
        self.order.shipped()
