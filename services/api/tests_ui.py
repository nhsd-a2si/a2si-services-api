from django.test import TestCase


class UiHeaderTestCase(TestCase):
    def test_header_text_correct(self):
        response = self.client.get('/placeholder/',
                                   HTTP_ACCEPT='text/html')
        self.assertContains(response,
                            'A2SI Services API (prototype) - Func Tests')
