from core import models
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


class Order(models.Model):
    STATES = ('Cart', 'Paid', 'Shipped', 'Canceled')
    STATES = [(i, i) for i in STATES]
    customer = models.ForeignKey(Customer, on_delete=models.CASCADE, null=True)
    products = models.ManyToManyField(Product, through='OrderItem')
    status = models.CharField(max_length=10, choices=STATES, default='Cart')

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
