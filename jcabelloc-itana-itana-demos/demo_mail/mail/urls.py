from django.urls import path

from mail import views

urlpatterns = [
    path('send/', views.Send.as_view(), name='send'),
]
