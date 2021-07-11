from django.apps import AppConfig
from django.utils.translation import gettext_lazy as _


class ScientificResearchConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'scientific_research'
    verbose_name = _('Scientific Research')
