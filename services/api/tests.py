import json

from django.contrib.auth.models import User
from rest_framework.authtoken.models import Token
from rest_framework.test import APITestCase


class PlaceholderAnonymousTestCase(APITestCase):
    def test_anonymous_get_fails(self):
        response = self.client.get('/placeholder/')
        self.assertEqual(
            401,
            response.status_code
        )
        self.assertEqual(
            response['WWW-Authenticate'],
            'Token'
        )


class PlaceholderTestCase(APITestCase):
    def setUp(self):
        user = User.objects.create_user(
            'user',
            'user@example.com',
            'password')
        good_token = Token.objects.create(user=user)
        self.client.credentials(
            HTTP_AUTHORIZATION='Token {}'.format(good_token))

    def test_placeholder_api(self):
        response = self.client.get('/placeholder/')
        self.assertEqual(
            response.data['message'],
            'This is the Placeholder API'
        )


class HealthcheckTestCase(APITestCase):
    def test_healthcheck_api(self):
        response = self.client.get('/health')
        data = json.loads(response.content.decode('utf-8'))
        self.assertEqual(
            data['health'],
            'OK'
        )

    def test_healthcheck_ignores_allowed_hosts(self):
        response = self.client.get('/health',
                                   HTTP_HOST='unknown.hostname')
        self.assertEqual(response.status_code, 200)

    def test_allowed_hosts_honoured_for_write_methods(self):
        for method in (self.client.put, self.client.post, self.client.delete):
            with self.subTest(method=method):
                response = method('/health',
                                  HTTP_HOST='unknown.hostname')
                self.assertEqual(response.status_code, 400)
