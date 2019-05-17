from django.test import TestCase


class UiHeaderTestCase(TestCase):
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

    def test_header_text_correct(self):
        response = self.client.get('/placeholder/',
                                   HTTP_ACCEPT='text/html')
        self.assertContains(response,
                            'A2SI Services API (prototype) - Func Tests')
