*** Settings ***
Resource  ./cart_res.robot
Resource  ../commons/tear_down.robot
Resource  ../commons/setup.robot

Test Setup      Go to site
Test Teardown   Close


*** Test Case ***

update cart value
    [Tags]  update_value
    Given that the informed region is eligible
    When the user select amount of products
    Then the purchase price must be updated in the cart