from django.shortcuts import render, redirect, reverse
from django.contrib import auth
from store.models import Product, Customer, Order, get_cart
from store.forms import *


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
        'title': 'Meu perfil',
        'submit': 'Cadastrar',
        'form': form
    })


def forgot_password(request):
    if request.method == 'POST':
        form = PasswordResetForm(request.POST)
        if form.is_valid():
            form.save(from_email='default@caep.tk', request=request)
            return redirect('cart')
    else:
        form = PasswordResetForm()
    return render(request, 'form.html', {
        'title': 'Esqueci minha senha',
        'submit': 'Enviar nova senha',
        'form': form
    })


def reset_password(request, uidb64, token):
    form = SetPasswordForm()


def edit_profile(request):
    if request.method == 'POST':
        form = CustomerChangeForm(None, request.POST)
        if form.is_valid():
            form.save()
            return redirect('cart')
    else:
        form = CustomerChangeForm()
    return render(request, 'form.html', {
        'title': 'Meu perfil',
        'submit': 'Salvar',
        'form': form
    })


def login(request):
    if request.method == 'POST':
        form = AuthenticationForm(data=request.POST)
        if form.is_valid():
            auth.login(request, form.get_user())
            return redirect('store')
    else:
        form = AuthenticationForm()
    return render(request, 'form.html', {
        'title': 'Login',
        'submit': 'Entrar',
        'buttons': {
            'Cadastro': reverse('signup'),
            'Esqueci minha senha': reverse('forgot-password'),
        },
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


def clear_cart(request):
    get_cart(request).close()
    return redirect('cart')


def close_order(request):
    order = get_cart(request)
    order.close()
    return render(request, 'pedido-fechado.html', {
        'order': order
    })


def orders(request):
    return render(request, 'pedidos.html', {
        'orders': Order.objects.post_close().filter(customer=request.user).order_by('-created_at')
    })


def order(request, id):
    return render(request, 'pedido.html', {
        'states': {
            'Closed': 'Pedido fechado',
            'Paid': 'Pagamento confirmado',
            'Shipped': 'Enviado',
            'Delivered': 'Pedido entregue',
        },
        'order': Order.objects.get(pk=id)
    })


def order_delivered(request, id):
    Order.objects.get(pk=id).delivered()
    return redirect('order', id=id)
