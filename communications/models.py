from django.db import models
from django.utils.translation import gettext_lazy as _


class Message(models.Model):
    name = models.CharField(max_length=100)
    whatsapp = models.CharField(max_length=11)
    email = models.EmailField(max_length=1024)
    message = models.TextField()

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = _('message')
        verbose_name_plural = _('messages')
