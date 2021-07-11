#!/mnt/c/Users/Junto Seguros/PycharmProjects/microsservices/caep/linux/bin/python
# When the django-_admin.py deprecation ends, remove this script.
import warnings

from django.core import management

try:
    from django.utils.deprecation import RemovedInDjango40Warning
except ImportError:
    raise ImportError(
        'django-_admin.py was deprecated in Django 3.1 and removed in Django '
        '4.0. Please manually remove this script from your virtual environment '
        'and use django-_admin instead.'
    )

if __name__ == "__main__":
    warnings.warn(
        'django-_admin.py is deprecated in favor of django-_admin.',
        RemovedInDjango40Warning,
    )
    management.execute_from_command_line()
