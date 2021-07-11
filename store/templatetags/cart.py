from django import template
from store.models import get_cart

register = template.Library()


@register.simple_tag(takes_context=True)
def cart_count(context):
    return get_cart(context['request']).order_items.count()


@register.simple_tag(takes_context=True)
def cart_price(context):
    return get_cart(context['request']).total_price
