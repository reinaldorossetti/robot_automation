*** Settings ***
Resource  ../../pages/resources/imports_web.robot
Resource  ../../steps_definitions/web/cart_steps_spec.robot

Test Setup      Go to site
Test Teardown   Close
Force Tags      cart_page

*** Test Case ***

validating cart page values
    [Tags]  cart_page_001
    Given that the informed region is eligible
    When the user select amount of products
    Then the purchase price must be added in the cart