*** Settings ***
Resource  cart_steps_spec.robot
Resource  ../../resources/imports.robot

Test Setup      Go to site
Test Teardown   Close

*** Test Case ***

validating cart page values
    [Tags]  update_value
    Given that the informed region is eligible
    When the user select amount of products
    Then the purchase price must be added in the cart