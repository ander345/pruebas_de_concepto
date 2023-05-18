from django import views
from django.shortcuts import render

# Create your views here.

class Home(views.View):
    def get(self, request):
        return render(request, 'home/home.html')

class Landing(views.View):
    def get(self, request):
        return render(request, 'home/landing.html')