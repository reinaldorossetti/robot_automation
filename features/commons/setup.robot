*** Settings ***
Library     SeleniumLibrary
Library     BuiltIn

*** Keywords ***
Go to site
    Create WebDriver                     ${BROWSER}
    Go to                                ${URL}
    Maximize Browser Window
    Set Selenium Implicit Wait	         ${WAIT_MAX}
