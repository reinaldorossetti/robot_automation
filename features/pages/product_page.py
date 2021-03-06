from features.resources.base_page import BasePage


class ProductPage(BasePage):
    _locators = {
        "select_product": "xpath:(//*[@id='product-card'])[position()=1]",
        "add_amount_six": "id=add-amount-6",
        "add_plus": "id=plus-button",
        "accept_check": "id=checkbox-accept-rgb",
        "add_product": "id=product-amount",
        "product_amount": "id=product-amount",
        "product_value": "css=#product-card-price div",
        "sub_product_value": "id=subtotal",
        "total_value": "id=subtotal"
    }

    def __init__(self):
        super().__init__()
        self.value_product = ""
        self.value_output = ""
        self.value_product_total = ""
        self.value_amount = ""

    def select_product(self):
        self.click_element(self.locator.select_product)

    def add_amount_product(self):
        self.click_element(self.locator.add_amount_six)

    def add_one_product(self):
        self.click_element(self.locator.add_plus)

    def add_products(self):
        self.click_element(self.locator.accept_check)
        self.click_element(self.locator.add_product)

    def get_products_value(self):
        self.check_element_is_visible(self.locator.product_value)
        self.value_product = self.selib.get_text(self.locator.product_value)
        self.value_product_total = self.selib.get_text(self.locator.total_value)
        self.selib.log_source(self.value_product)

    def get_value_amount(self):
        self.value_amount = self.selib.get_text(self.locator.product_amount)
        self.selib.log_source(self.value_amount)

    def calculate_cart(self):
        self.get_products_value()
        self.get_value_amount()

        # value_output_product = self.convert_to_float(self.value_product)
        # value_amount = self.convert_to_float(self.value_amount)
        # total_value_sub = value_output_product * value_amount
        # value_output_product_str = str(total_value_sub).replace('.', ',')
        # self.selib.element_text_should_be(self.locator.total_value, "R$ " + value_output_product_str)
