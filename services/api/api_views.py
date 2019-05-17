from rest_framework.authentication import (
    SessionAuthentication, TokenAuthentication)
from rest_framework.permissions import IsAuthenticated
from rest_framework.views import APIView


class ServicesAPIView(APIView):
    authentication_classes = (TokenAuthentication, SessionAuthentication)
    permission_classes = (IsAuthenticated,)
