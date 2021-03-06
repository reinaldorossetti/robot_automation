from features.resources.base_page import BasePage


class HomePage(BasePage):
    _locators = {
        "button_age_gate_yes": "id=age-gate-button-yes",
        "search_address": "id=fake-address-search-input",
        "input_address": "id=address-search-input-address",
        "address": "css:li[itemid='google-address'] div",
        "adress_input_number": "id=address-details-input-number",
        "address_details_input_complement": "id=address-details-input-complement",
        "adress_button_continue": "id=address-details-button-continue",
    }

    def gate_yes(self):
        self.click_element(self.locator.button_age_gate_yes)

    def inform_address(self, address):
        self.click_element(self.locator.search_address)
        self.input_text(self.locator.input_address, address)
        self.click_element(self.locator.address)
        self.input_text(self.locator.address_details_input_complement, 'Na Casa de Esquina')
        self.click_element(self.locator.adress_button_continue)
