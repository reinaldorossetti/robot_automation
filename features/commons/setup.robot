*** Settings ***
Library  SeleniumLibrary
Library  BuiltIn

*** Keywords ***
Go to site
    Create WebDriver                     ${BROWSER}
    Go to                                https://www.ze.delivery/
    Maximize Browser Window
    Set Selenium Speed                   0.30 s
