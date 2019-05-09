from rest_framework.response import Response

from .api_views import ServicesAPIView


class PlaceholderView(ServicesAPIView):
    """
    Simple placeholder view to verify installation.

    """
    def get(self, request):
        return Response(dict(message='This is the Placeholder API'))
