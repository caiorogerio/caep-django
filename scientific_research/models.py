from django.db import models
from django.utils.translation import gettext_lazy as _


class Subject(models.Model):
    title = models.CharField(max_length=1024)
    description = models.TextField()

    def __str__(self):
        return self.title

    class Meta:
        verbose_name = _('subject')
        verbose_name_plural = _('subjects')
