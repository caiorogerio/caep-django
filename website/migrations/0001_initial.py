# Generated by Django 3.2.3 on 2021-07-10 04:50

from django.db import migrations, models
import tinymce.models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Section',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('page', models.CharField(max_length=100)),
                ('name', models.CharField(max_length=100, unique=True)),
                ('title', models.CharField(max_length=1024)),
                ('content', tinymce.models.HTMLField()),
            ],
            options={
                'verbose_name': 'section',
                'verbose_name_plural': 'sections',
            },
        ),
    ]
