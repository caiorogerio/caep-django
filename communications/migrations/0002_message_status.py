# Generated by Django 3.2.3 on 2021-07-16 03:32

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('communications', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='message',
            name='status',
            field=models.CharField(choices=[('Unread', 'Unread'), ('Read', 'Read')], default='Unread', max_length=10),
        ),
    ]