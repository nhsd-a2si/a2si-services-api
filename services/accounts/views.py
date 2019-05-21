from django.shortcuts import render
from django.views import View


class UserCreationView(View):
    template_name = 'accounts/create.html'

    def get(self, request):
        return render(
            request,
            self.template_name
        )
