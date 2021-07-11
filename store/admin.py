from django.contrib import admin
import store.models as models


class ProductAdmin(admin.ModelAdmin):
    list_display = ('title', 'description', 'quantity', 'reserved', 'disposal', 'price')
    list_filter = ('available', )


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


class OrderAdmin(admin.ModelAdmin):
    list_display = ('created_at', 'customer', 'status', 'product_names', 'total_price')
    list_filter = ('status', 'customer', 'products')
    readonly_fields = ('total_price', )
    inlines = [OrderItemInline]


admin.site.register(models.Order, OrderAdmin)


class CustomerAdmin(admin.ModelAdmin):
    list_display = ('username', 'email')


admin.site.register(models.Customer, CustomerAdmin)
