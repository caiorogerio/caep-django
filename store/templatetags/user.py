from django import template

register = template.Library()


@register.simple_tag(takes_context=True)
def is_authenticated(context):
    return context['request'].user.is_authenticated or False


@register.simple_tag(takes_context=True)
def user(context, attr):
    return getattr(context['request'].user, attr, None)
