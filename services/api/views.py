from rest_framework.authentication import TokenAuthentication
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.views import APIView


class PlaceholderView(APIView):
    """
    Simple placeholder view to verify installation.

    """
    # TODO Refactor into a base view class that requires this
    authentication_classes = (TokenAuthentication,)
    permission_classes = (IsAuthenticated,)

    def get(self, request):
        return Response(dict(message='This is the Placeholder API'))
