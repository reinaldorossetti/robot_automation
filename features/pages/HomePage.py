from features.resources.base_page import BasePage
import os

class HomePage(BasePage):
    _locators = {
        "button_age_gate_yes": "id=age-gate-button-yes",
        "search_address": "id=fake-address-search-input",
        "input_address": "css=input[id=address-search-input-address]",
        "address": "css:li[itemid='google-address'] div",
        "adress_input_number": "id=address-details-input-number",
        "address_details_input_complement": "id=address-details-input-complement",
        "adress_button_continue": "id=address-details-button-continue",
    }

    def gate_yes(self):
        self.age = self.selib.get_text(self.locator.button_age_gate_yes)
        self.click_element(self.locator.button_age_gate_yes)

    def inform_address(self, address):
        path = os.getcwd()
        web_element = self.selib.find_element(self.locator.search_address)
        self.exec_javascript(web_element, "focus")
        # with open(path + '/features/resources/jquery.min.js', 'r') as jquery_js:  # read the jquery from a file
        #     jquery = jquery_js.read()
        #     self.selib.execute_javascript(jquery)
        #
        # web_element = self.selib.find_element(self.locator.search_address)
        # js = "$(arguments[0]).trigger(\"focus\");"
        # self.selib.execute_javascript('ARGUMENTS', web_element, 'JAVASCRIPT', js)
        self.input_text(self.locator.input_address, address)
        self.click_element(self.locator.address)
        self.input_text(self.locator.address_details_input_complement, 'Na Casa de Esquina')
        self.click_element(self.locator.adress_button_continue)
