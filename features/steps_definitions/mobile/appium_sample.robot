*** Settings ***
Documentation   Simple example using AppiumLibrary
Library         AppiumLibrary       15      run_on_failure=Log Source
Variables   ../../pages/mobile_pages/locators/locators.yaml
Resource    ../../commons/mobile_tests/setup.robot


*** Test Cases ***
Should send keys to search box and then check the value
  Open Test Application
  Select create account
  Fill of the user registration
  Submit user registration

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
  sleep  10 s  # wait animation the same break test.

Select create account
  Wait Until Element Is Visible     ${CREATE-ACCOUNT}      timeout=15
  Click Element                     ${CREATE-ACCOUNT}

Fill of the user registration
  Wait Until Element Is Visible     ${FULL_NAME}           timeout=15
  Input Text                        ${FULL_NAME}           Reinaldo Mateus
  Input Text                        ${EMAIL_ADDRESS}       reinaldo.rossetti@outlook.com
  Input Text                        ${PASSWORD}            rei12345
  Input Text                        ${DOCUMENT}            52540430244
  Input Text                        ${PHONE}               19971508380
  Swipe Down                        ${PHONE}
  Click Element                     ${AGE}
  Wait Until Element Is Visible     ${AGE_BUTTON}          timeout=15
  Click Element                     ${AGE_BUTTON}
  wait until page contains          Declaro que li         timeout=15
  Click Text                        Declaro que li
  Click Text                        Quero receber

Submit user registration
  Wait Until Element Is Visible     ${SIGNUP}          timeout=15
  Click Element                     ${SIGNUP}

Swipe Down
  [Arguments]                         ${ELEMENT}
  ${element_size}=    Get Element Size    ${ELEMENT}
  ${element_location}=    Get Element Location    ${ELEMENT}
  ${start_x}=         Evaluate      ${element_location['x']} + (${element_size['width']})
  ${start_y}=         Evaluate      ${element_location['y']} + (${element_size['height']})
  ${end_x}=           Evaluate      ${element_size['width']} * 0.5
  ${end_y}=           Evaluate      ${element_size['height']} * 0.5
  Swipe               ${start_x}    ${start_y}  ${end_x}  ${end_y}  2000
