from bs4 import BeautifulSoup
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
        soup = BeautifulSoup(response.content)
        self.assertTrue(soup.find('input', attrs={'name': 'username'}))
        self.assertTrue(soup.find('input', attrs={'name': 'password1'}))
        self.assertTrue(soup.find('input', attrs={'name': 'password2'}))

