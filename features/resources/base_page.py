from PageObjectLibrary import PageObject
import re


class BasePage(PageObject):

    def __init__(self, timeout=20):
        super().__init__()
        self.wait_timeout = timeout
        self.selib.set_selenium_implicit_wait(self.wait_timeout)

    def wait_element_iterable(self, element_to_interact):
        self.selib.wait_until_page_contains_element(element_to_interact, self.wait_timeout)
        self.selib.wait_until_element_is_visible(element_to_interact, self.wait_timeout)

    def click_element(self, element_to_interact):
        self.wait_element_iterable(element_to_interact)
        self.selib.click_element(element_to_interact)

    def check_element_is_visible(self, element_to_interact):
        self.wait_element_iterable(element_to_interact)

    def input_text(self, element_to_interact, text):
        self.wait_element_iterable(element_to_interact)
        self.selib.input_text(element_to_interact, text)

    def exec_javascript(self, element_to_interact, trigger_event):
        # read the jquery from a file to insert in site project.
        with open('jquery.min.js', 'r') as jquery_js:
            jquery = jquery_js.read()
            self.selib.execute_javascript(jquery)

        web_element = self.selib.find_element(element_to_interact)
        js = "$(arguments[0]).trigger(\"%s\");" % trigger_event
        self.selib.execute_javascript('ARGUMENTS', web_element, 'JAVASCRIPT', js)

    def select_from_list_by_index(self, element_to_interact, index):
        self.wait_element_iterable(element_to_interact)
        self.selib.select_from_list_by_index(element_to_interact, index)

    def select_from_list_by_value(self, element_to_interact, value):
        self.wait_element_iterable(element_to_interact)
        self.selib.select_from_list_by_value(element_to_interact, value)

    def get_value(self, element_to_interact):
        self.wait_element_iterable(element_to_interact)
        self.selib.get_text(element_to_interact)

    @staticmethod
    def convert_to_float(value):
        value_output = re.findall(r"\d*.\d*", value)
        return float(value_output[0].replace(',', '.'))
