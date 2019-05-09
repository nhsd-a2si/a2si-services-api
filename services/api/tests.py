import json

from rest_framework.test import APITestCase


class PlaceholderTestCase(APITestCase):
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
