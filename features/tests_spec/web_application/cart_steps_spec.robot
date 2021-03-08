*** Settings ***
Library  ../../pages/web_pages/ProductPage.py
Library  ../../pages/web_pages/HomePage.py

*** Keywords ***

That the informed region is eligible
    Gate Yes
    Inform Address  ${ADDRESS}

The user select amount of products
    Page Should Contain  ${TITLE_PRODUCT_CATEGORY}
    Select Product
    Add Amount Product
    Page Should Contain  ${PACKAGE_QUANTITY}
    Add One Product
    Page Should Contain  ${PACKAGE_QUANTITY_MORE_ONE}
    Add Products
    
The purchase price must be added in the cart
    Element Should Contain  ${LOCATOR_MSN_COLD_DRINK}  ${MSN_COLD_DRINK}
    Calculate Cart
    Capture Page Screenshot