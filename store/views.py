from django.shortcuts import render, redirect
from django.contrib import auth
from store.models import Product, Customer, get_cart
from store.forms import CustomerCreationForm, AuthenticationForm
from django.utils.translation import gettext_lazy as _


def signup(request):
    if request.method == 'POST':
        form = CustomerCreationForm(request.POST)
        if form.is_valid():
            form.save()
            username = form.cleaned_data.get(Customer.USERNAME_FIELD)
            password = form.cleaned_data.get('password1')
            user = auth.authenticate(username=username, password=password)
            auth.login(request, user)
            return redirect('home')
    else:
        form = CustomerCreationForm()
    return render(request, 'form.html', {
        'title': _('My profile'),
        'form': form
    })


def login(request):
    if request.method == 'POST':
        form = AuthenticationForm(data=request.POST)
        if form.is_valid():
            auth.login(request, form.get_user())
            return redirect('cart')
    else:
        form = AuthenticationForm()
    return render(request, 'form.html', {
        'title': _('Login'),
        'form': form
    })


def logout(request):
    auth.logout(request)
    return redirect('cart')


def store(request):
    return render(request, 'artigos.html', {
        'products': Product.objects.all()
    })


def add_to_cart(request):
    product = Product.objects.get(pk=request.GET['product'])
    get_cart(request).add(product, request.GET['quantity'])
    return redirect('cart')


def cart(request):
    return render(request, 'carrinho.html', {
        'order': get_cart(request)
    })
