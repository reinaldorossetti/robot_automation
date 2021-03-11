*** Settings ***
Library  ../../pages/web_pages/ProductPage.py
Library  ../../pages/web_pages/HomePage.py

*** Keywords ***

That the informed region is eligible
    Run Keyword If    "${BROWSER}"=="headlesschrome"      Set Window Size  1400  800
    Gate Yes
    Inform Address  ${ADDRESS}

The user select amount of products
    Page Should Contain  ${TITLE_PRODUCT_CATEGORY}
    Select Product
    ${IsElementVisible}=  Run Keyword And Return Status    Element Should Be Visible   ${ELEMENT_COOKIES}
    Run Keyword If    ${IsElementVisible}  SeleniumLibrary.Click Element  ${ELEMENT_COOKIES}
    Add Amount Product
    Page Should Contain  ${PACKAGE_QUANTITY}
    Add One Product
    Page Should Contain  ${PACKAGE_QUANTITY_MORE_ONE}
    Capture Page Screenshot
    Add Products


The purchase price must be added in the cart
    Element Should Contain  ${LOCATOR_MSN_COLD_DRINK}  ${MSN_COLD_DRINK}
    Calculate Cart
    Capture Page Screenshot