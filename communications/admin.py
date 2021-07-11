from django.contrib import admin
import communications.models as models


class MessageAdmin(admin.ModelAdmin):
    list_display = ('name','email','whatsapp')


admin.site.register(models.Message, MessageAdmin)
