from django.db import models
# from tinymce.models import HTMLField
from django.utils.translation import gettext_lazy as _


class Section(models.Model):
    page = models.CharField(max_length=100)
    name = models.CharField(max_length=100, unique=True)
    title = models.CharField(max_length=1024)
    content = models.TextField()

    def __str__(self):
        return self.title

    class Meta:
        verbose_name = _('section')
        verbose_name_plural = _('sections')
