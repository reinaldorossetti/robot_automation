*** Settings ***
Library  SeleniumLibrary
Library  ../pages/ProductPage.py
Library  ../pages/HomePage.py


*** Keywords ***

that the informed region is eligible
    Gate Yes
    Set Test Variable  ${ADDRESS}  Avenida Guilherme Perereca Guglielmo, 676, Barueri -SP, Brasil
    Inform Address  ${ADDRESS}

the user select amount of products
    Page Should Contain  Cervejas
    Select Product
    Add Amount Product
    Page Should Contain  6
    Add One Product
    Page Should Contain  7
    Add Products
    
the purchase price must be updated in the cart
    Calculate Cart
    Capture Page Screenshot