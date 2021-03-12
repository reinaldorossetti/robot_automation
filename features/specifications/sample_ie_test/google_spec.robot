*** Settings ***
Library           Selenium2Library
Library           OperatingSystem
Force Tags        ie_google

*** Variables ***
${BROWSER}        ie
${url_google}     http://www.google.com/


# need set webdriver.ie.driver in your path system with value is path file.
# set driver path in path system.
# https://github.com/robotframework/SeleniumLibrary/issues/227

*** Test Cases ***
Google for macarronada using IE
    Set Environment Variable    no_proxy    127.0.0.1
    Open Browser    ${url_google}    ${BROWSER}
    Wait Until Page Contains    Google
    Input Text    name=q    macarronada
    Click Button    name=btnI
    Wait Until Page Contains    macarronada
    Close Browser