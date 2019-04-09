from django.conf import settings
from rest_framework.renderers import BrowsableAPIRenderer


class ServicesBrowsableAPIRenderer(BrowsableAPIRenderer):
    def get_context(self, *args, **kwargs):
        context = super().get_context(*args, **kwargs)
        context.update({
            'page_title': settings.PAGE_TITLE
        })
        return context
