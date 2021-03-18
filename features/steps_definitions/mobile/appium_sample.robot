*** Settings ***
Documentation   Simple example using AppiumLibrary
Library         AppiumLibrary       15      run_on_failure=Log Source
Variables   ../../pages/mobile_pages/locators/locators.yaml
Resource    ../../commons/mobile_tests/setup.robot


*** Test Cases ***
Should send keys to search box and then check the value
  Open Test Application
  Select create account
  Submit Search

*** Keywords ***
Open Test Application
  Open Application  http://127.0.0.1:4723/wd/hub  automationName=${ANDROID_AUTOMATION_NAME}
  ...  platformName=${ANDROID_PLATFORM_NAME}
  ...  app=${ANDROID_APP}  appPackage=${APP_PACKAGE}     appActivity=${APP_ACTIVITY}
  ...  autoGrantPermissions=true
  ...  gpsEnabled=true
  ...  newCommandTimeout=60000
  ...  appWaitDuration=60000
  ...  autoWebviewTimeout=30000
  ...  disableWindowAnimation=true

  Set Appium Timeout	15 seconds
  sleep  10s

Select create account
  Wait Until Element Is Visible          ${CREATE-ACCOUNT}      timeout=15
  Click Element                          ${CREATE-ACCOUNT}
  Wait Until Element Is Visible          ${FULL_NAME}          timeout=15
  Input Text            ${FULL_NAME}                    Reinaldo Mateus
  Input Text            ${EMAIL_ADDRESS}                reinaldo.rossetti@outlook.com
  Input Text            ${PASSWORD}                     rei12345
  Input Text            ${DOCUMENT}                     52540430244
  Input Text            ${PHONE}                        19971508380
  Swipe Down            ${AGE}
  Swipe                 611    611    328    328
  Click Text            ${AGE}
  click element         ${AGE_BUTTON}
  Click Text            Declaro que li
  click text            Quero receber
  Sleep  10

Submit Search
  Click Element  btn_start_search

Swipe Down
  [Arguments]                         ${ELEMENT}
  ${element_size}=    Get Element Size    ${ELEMENT}
  ${element_location}=    Get Element Location    ${ELEMENT}
  ${start_x}=         Evaluate      ${element_location['x']} + (${element_size['width']} * 0.5)
  ${start_y}=         Evaluate      ${element_location['y']} + (${element_size['height']} * 0.3)
  ${end_x}=           Evaluate      ${element_location['x']} + (${element_size['width']} * 0.5)
  ${end_y}=           Evaluate      ${element_location['y']} + (${element_size['height']} * 0.7)
  Swipe               ${start_x}    ${start_y}  ${end_x}  ${end_y}  500
  Sleep  3