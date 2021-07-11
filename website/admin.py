from django.contrib import admin
import website.models as models


class SectionAdmin(admin.ModelAdmin):
    list_display = ('name', 'page', 'title')


admin.site.register(models.Section, SectionAdmin)
