from django.shortcuts import render
from scientific_research.models import Subject
from communications.models import Message
from website.models import Section


def home(request):
    contents = {content.name: content for content in Section.objects.filter(page='home')}
    return render(request, 'home.html', contents)


def info(request):
    return render(request, 'informacoes.html', {
        'subjects': Subject.objects.all()
    })


def send_message(request):
    msg = Message()
    msg.name = request.POST['name']
    msg.email = request.POST['email']
    msg.whatsapp = request.POST['whatsapp']
    msg.message = request.POST['message']
    msg.save()
    return render(request, 'mensagem-enviada.html')
