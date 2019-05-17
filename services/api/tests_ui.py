from django.contrib.auth.models import User
from django.test import TestCase


class UiAnonymousTestCase(TestCase):
    def test_anonymous_get_fails(self):
        response = self.client.get('/placeholder/',
                                   HTTP_ACCEPT='text/html')
        self.assertEqual(
            401,
            response.status_code
        )
        self.assertEqual(
            response['WWW-Authenticate'],
            'Token'
        )


class UiHeaderTestCase(TestCase):
    def setUp(self):
        user = User.objects.create_user(
            'user',
            'user@example.com',
            'password')
        self.client.force_login(user)

    def test_header_text_correct(self):

        response = self.client.get('/placeholder/',
                                   HTTP_ACCEPT='text/html')
        self.assertContains(response,
                            'A2SI Services API (prototype) - Func Tests')
