from django.contrib import admin
import communications.models as models


class MessageAdmin(admin.ModelAdmin):
    list_display = ('name','status','email','whatsapp')
    list_filter = ('status',)
    readonly_fields = ('name','email','whatsapp','message')
    search_fields = ['name','status','email','whatsapp','message']


admin.site.register(models.Message, MessageAdmin)
