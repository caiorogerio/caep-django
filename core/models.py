from django.db.models import *


class MoneyField(DecimalField):

    def __init__(self):
        super().__init__(max_digits=5, decimal_places=2)


class Model(Model):

    created_at = DateTimeField(auto_now_add=True)
    updated_at = DateTimeField(auto_now=True)

    class Meta:
        abstract = True
