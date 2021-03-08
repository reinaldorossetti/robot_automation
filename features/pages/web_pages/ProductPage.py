from features.pages.web_pages.base.base_page import BasePage


class ProductPage(BasePage):
    _locators = {
        "select_product": "xpath:(//*[@id='product-card'])[position()=1]",
        "add_amount_six": "id=add-amount-6",
        "add_plus": "id=plus-button",
        "accept_check": "id=checkbox-accept-rgb",
        "add_product": "id=product-amount",
        "product_amount1": "css=div[class*=productContainer] div[class*=containerAddCustomButton] div[id*=amount]",
        "product_amount2": "id=product-amount",
        "product_name1": "css=div[id*=next] div[class*=productTitle]",
        "product_name2": "css=div[id=product-card] div[class*=productTitle]",
        "product_value1": "css=div[class*=priceText]",
        "product_value2": "css=#product-card-price div",
        "sub_product_value": "id=subtotal",
        "shipping": "id=shipping-price",
        "total_value": "id=total-price"
    }

    def __init__(self):
        super().__init__()
        self.product_value1 = ""
        self.product_value2 = ""
        self.value_output = ""
        self.value_product_total = ""
        self.product_amount1 = ""
        self.product_amount2 = ""
        self.sub_product_value = ""
        self.quantity = 0
        self.shipping = ""
        self.product_name1 = ""

    def select_product(self):
        self.click_element(self.locator.select_product)

    def add_amount_product(self):
        self.click_element(self.locator.add_amount_six)

    def add_one_product(self):
        self.click_element(self.locator.add_plus)

    def add_products(self):
        self.product_amount1 = self.selib.get_text(self.locator.product_amount1)
        self.product_name1 = self.selib.get_text(self.locator.product_name1)
        self.product_value1 = self.selib.get_text(self.locator.product_value1)
        self.logger.info(self.product_value1)
        self.click_element(self.locator.accept_check)
        self.click_element(self.locator.add_product)

    def get_products_value(self):
        self.check_element_is_visible(self.locator.product_value2)
        self.product_value2 = self.selib.get_text(self.locator.product_value2)
        self.logger.info(self.product_value2)

        # validated the price of the product is the same on the shopping cart page.
        assert self.product_value1, self.product_value2

        self.sub_product_value = self.selib.get_text(self.locator.sub_product_value)
        self.logger.info(self.sub_product_value)
        total_value = self.selib.get_text(self.locator.total_value)
        self.shipping = self.selib.get_text(self.locator.shipping)
        self.logger.info(total_value)

    def get_value_quantity(self):
        self.quantity = self.selib.get_text(self.locator.product_amount2)
        self.logger.info(self.quantity)

        # validated the value of the product is the same on the shopping cart page.
        assert self.product_amount1, self.quantity

    def calculate_cart(self):
        self.get_products_value()
        self.get_value_quantity()

        # validated the product name
        self.selib.element_text_should_be(self.locator.product_name2, self.product_name1)

        # validated the sub total value
        value_output_product = self.convert_to_float(self.product_value2)
        total_value_sub = value_output_product * float(self.quantity)
        value_output_product_str = str(total_value_sub).replace('.', ',')
        self.selib.element_text_should_be(self.locator.sub_product_value, "R$ " + value_output_product_str)

        # validated the total value
        value_output_product = self.convert_to_float(self.sub_product_value)
        value_output_shipping = self.convert_to_float(self.shipping)
        total_value_sub = value_output_product + value_output_shipping
        value_output_product_str = str(total_value_sub).replace('.', ',')
        self.selib.element_text_should_be(self.locator.total_value, "R$ " + value_output_product_str)
