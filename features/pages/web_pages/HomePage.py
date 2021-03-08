import yaml
from os import path, getcwd
from features.pages.web_pages.base.base_page import BasePage


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

    def __init__(self):
        super().__init__()
        self.path_mass_page = path.join(getcwd() + "/features/resources/mass_of_pages/mass_of_pages.yaml")
        self.COMPLEMENT = self.read_yaml(self.path_mass_page, 'COMPLEMENT')

    def gate_yes(self):
        self.click_element(self.locator.button_age_gate_yes)

    def inform_address(self, address):
        self.highlight(self.locator.search_address)
        self.trigger_event(self.locator.search_address, "focus")
        self.highlight(self.locator.input_address)
        self.input_text(self.locator.input_address, address)
        self.click_element(self.locator.address)
        self.highlight(self.locator.address_details_input_complement)
        self.input_text(self.locator.address_details_input_complement, self.COMPLEMENT)
        self.click_element(self.locator.adress_button_continue)

    def trigger_event(self, element_to_interact, trigger_event):
        self.set_jquery()
        web_element = self.selib.find_element(element_to_interact)
        js = "$(arguments[0]).trigger(\"%s\");" % trigger_event
        self.selib.execute_javascript('ARGUMENTS', web_element, 'JAVASCRIPT', js)

    def highlight(self, locator):
        self.set_jquery()
        web_element = self.selib.find_element(locator)
        js = "$(arguments[0]).css({'border':'5px solid red'}).delay( 800 );"
        self.selib.execute_javascript('ARGUMENTS', web_element, 'JAVASCRIPT', js)

    # read the jquery from a file to insert in site project.
    def set_jquery(self):
        with open(getcwd() + '/features/resources/jquery.min.js', 'r') as jquery_js:
            jquery = jquery_js.read()
            self.selib.execute_javascript(jquery)

    @staticmethod
    def read_yaml(file, content):
        with open(file) as file:
            data = yaml.safe_load(file)
        return data[content]
