from selenium import webdriver
from selenium.webdriver.firefox.options import Options
import unittest

class NewVisitorTest(unittest.TestCase):
    def setUp(self):
        options = Options()
        options.headless=True
        self.browser = webdriver.Firefox(options=options)

    def tearDown(self):
        self.browser.quit()

    def test_can_sign_up(self):
        # Emmy has heard about this Geph website that helps you
        # schedule boardgames. She visits it in her browser
        self.browser.get('http://web:8000')

        # She notices the page is titled 'Geph'
        self.assertIn('Geph', self.browser.title)
        self.fail('Finish the test!')

if __name__ == '__main__':
    unittest.main()
