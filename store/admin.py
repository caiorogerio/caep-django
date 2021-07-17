from django.contrib import admin
import store.models as models


class ProductAdmin(admin.ModelAdmin):
    list_display = ('title', 'description', 'quantity', 'reserved', 'disposal', 'price')
    search_fields = [
        'title',
        'description',
    ]


admin.site.register(models.Product, ProductAdmin)


class SupplyItemInline(admin.TabularInline):
    model = models.SupplyItem
    readonly_fields = ('total', )


class SupplyAdmin(admin.ModelAdmin):
    list_display = ('created_at', 'status', 'product_names', 'total_cost')
    list_filter = ('status', 'products')
    readonly_fields = ('total_cost', )
    inlines = [SupplyItemInline]


admin.site.register(models.Supply, SupplyAdmin)


class OrderItemInline(admin.TabularInline):
    model = models.OrderItem
    readonly_fields = ('price', 'total')


class PaymentInline(admin.TabularInline):
    model = models.Payment


class ShippingInline(admin.TabularInline):
    model = models.Shipping


class OrderAdmin(admin.ModelAdmin):
    list_display = ('created_at', 'customer', 'status', 'product_names', 'total_price')
    list_filter = ('status', 'customer', 'products', 'created_at')
    search_fields = [
        'customer__email',
        'customer__first_name',
        'customer__last_name',
        'products__title',
        'products__description',
        'payments__type',
        'shipping__type',
        'status',
    ]
    readonly_fields = ('status', 'total_price')
    inlines = [OrderItemInline]

    def get_inlines(self, request, obj):
        if obj.status == 'Closed':
            return [OrderItemInline, PaymentInline]
        elif obj.status in ('Paid','Shipped'):
            return [OrderItemInline, PaymentInline, ShippingInline]
        else:
            return [OrderItemInline]


admin.site.register(models.Order, OrderAdmin)


class CustomerAdmin(admin.ModelAdmin):
    list_display = ('username', 'email')


admin.site.register(models.Customer, CustomerAdmin)


class PaymentAdmin(admin.ModelAdmin):
    list_display = ('created_at', 'type', 'value', 'order')
    list_filter = ('type', 'order__customer')
    search_fields = [
        'type',
        'order__customer__first_name',
        'order__customer__last_name',
        'order__products__title',
        'order__products__description',
    ]

    def render_change_form(self, request, context, *args, **kwargs):
        context['adminform'].form.fields['order'].queryset = models.Order.objects.closed().order_by('-created_at')
        return super(PaymentAdmin, self).render_change_form(request, context, *args, **kwargs)


admin.site.register(models.Payment, PaymentAdmin)


class ShippingAdmin(admin.ModelAdmin):
    list_display = ('created_at', 'type', 'order')
    list_filter = ('type', 'order__customer', 'order__payments__type')
    search_fields = [
        'type',
        'order__customer__first_name',
        'order__customer__last_name',
        'order__products__title',
        'order__products__description',
        'order__payments__type',
    ]

    def render_change_form(self, request, context, *args, **kwargs):
        context['adminform'].form.fields['order'].queryset = models.Order.objects.paid().order_by('-created_at')
        return super(ShippingAdmin, self).render_change_form(request, context, *args, **kwargs)


admin.site.register(models.Shipping, ShippingAdmin)
