from rest_framework.response import Response
from rest_framework.views import APIView


class PlaceholderView(APIView):
    """
    Simple placeholder view to verify installation.

    """
    def get(self, request):
        return Response(dict(message='This is the Placeholder API'))
