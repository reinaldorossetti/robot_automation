import logging
import coloredlogs
from PageObjectLibrary import PageObject
import re

fileh = logging.FileHandler('logfile_execution', 'a')
formatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')
fileh.setFormatter(formatter)
log = logging.getLogger()
for hdlr in log.handlers[:]:  # remove all old handlers
    log.removeHandler(hdlr)
log.addHandler(fileh)

class BasePage(PageObject):

    def __init__(self, timeout=30):
        super().__init__()
        self.wait_timeout = timeout
        coloredlogs.install()
        self.logger("Timeout: %s" % timeout)


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
