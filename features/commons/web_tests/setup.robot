*** Settings ***
Library     BuiltIn

*** Keywords ***
Go to site
    Open Browser     about:blank         ${BROWSER}
    Go to                                ${URL}
    Maximize Browser Window
    Set Selenium Implicit Wait	         ${WAIT_MAX}
