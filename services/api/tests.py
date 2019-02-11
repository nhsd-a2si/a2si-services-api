from rest_framework.test import APITestCase


class PlaceholderTestCase(APITestCase):
    def test_placeholder_api(self):
        response = self.client.get('/placeholder/')
        self.assertEqual(
            'This is the Placeholder API',
            response.data['message']
        )


class HealthcheckTestCase(APITestCase):
    def test_healthcheck_api(self):
        response = self.client.get('/health')
        self.assertEqual(
            'OK',
            response.data['health']
        )
