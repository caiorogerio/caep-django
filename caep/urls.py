"""caep URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from django.conf import settings
from django.conf.urls.static import static
import website.views
import store.views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', website.views.home, name='home'),
    path('artigos/', store.views.store, name='store'),
    path('cadastro/', store.views.signup, name='signup'),
    path('login/', store.views.login, name='login'),
    path('logout/', store.views.logout, name='logout'),
    path('carrinho/', store.views.cart, name='cart'),
    path('carrinho/adicionar/', store.views.add_to_cart, name='add-to-cart'),
    path('informacoes/', website.views.info, name='info'),
    path('informacoes/mensagem/', website.views.send_message, name='message-sent'),
    path('tinymce/', include('tinymce.urls')),
] + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
