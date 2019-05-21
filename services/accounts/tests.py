from django.test import TestCase
from django.urls import reverse


class CreateViewTestCase(TestCase):
    url = reverse('accounts:create')

    def test_create_page_loads(self):
        response = self.client.get(self.url)
        self.assertContains(
            response,
            '<h1>Create Account</h1>',
        )
