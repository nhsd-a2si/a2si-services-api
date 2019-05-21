from django.conf.urls import url

from accounts import views


app_name = 'accounts'
urlpatterns = [
    url(r'^create/$', views.UserCreationView.as_view(), name='create'),
]
