*** Keywords ***
open test application
    Open Application  http://127.0.0.1:4723/wd/hub  automationName=${ANDROID_AUTOMATION_NAME}
    ...  platformName=${ANDROID_PLATFORM_NAME}
    ...  app=${ANDROID_APP}  appPackage=${APP_PACKAGE}     appActivity=${APP_ACTIVITY}
    ...  autoGrantPermissions=true
    ...  gpsEnabled=true
    ...  newCommandTimeout=60000
    ...  appWaitDuration=60000
    ...  autoWebviewTimeout=30000
    ...  disableWindowAnimation=true
    Setting variables globais

And select create account
    Wait Until Element Is Visible               ${CREATE-ACCOUNT}      timeout=20
    Click Element                               ${CREATE-ACCOUNT}
    Run Keyword And Ignore Error	            Wait Until Element Is Visible             ${FULL_NAME}       timeout=10
    # Strange behavior to load again after animation
    ${IsElementVisible}=  Run Keyword And Return Status    Wait Until Element Is Visible  ${CREATE-ACCOUNT}  timeout=10
    Run Keyword If  ${IsElementVisible}  AppiumLibrary.Click Element  ${CREATE-ACCOUNT}


When fill of the user registration
    Wait Until Element Is Visible     ${FULL_NAME}           timeout=15
    Input Text                        ${FULL_NAME}           ${NAME_VALUE}
    Input Text                        ${EMAIL_ADDRESS}       ${EMAIL_VALUE}
    Input Text                        ${PASSWORD}            ${PASSWORD_VALUE}
    Input Text                        ${DOCUMENT}            ${CPF_VALUE}
    Input Text                        ${PHONE}               ${CELLPHONE_VALUE}
    Swipe Down                        ${PHONE}
    Click Element                     ${AGE}
    Wait Until Element Is Visible     ${AGE_BUTTON}          timeout=15
    Click Element                     ${AGE_BUTTON}
    Wait Until Element Is Visible     ${CHECKBOX-TERM}       timeout=15
    Click Element                     ${CHECKBOX-TERM}
    Click Element                     ${CHECKBOX-MARKETING}

submit user registration
    Wait Until Element Is Visible     ${SIGNUP}              timeout=15
    Click Element                     ${SIGNUP}

Swipe Down
    [Arguments]                         ${ELEMENT}
    ${element_size}=        Get Element Size    ${ELEMENT}
    ${element_location}=    Get Element Location    ${ELEMENT}
    ${start_x}=             Evaluate      ${element_location['x']} + (${element_size['width']})
    ${start_y}=             Evaluate      ${element_location['y']} + (${element_size['height']})
    ${end_x}=               Evaluate      ${element_size['width']} * 0.5
    ${end_y}=               Evaluate      ${element_size['height']} * 0.5
    Swipe                   ${start_x}    ${start_y}  ${end_x}  ${end_y}  2000

Then validate phone confirmation screen
    Wait Until Element Is Visible          ${COUNTER}          timeout=15
    page should contain text               ${MSN_CODE_SEND}
    page should contain text               ${CELLPHONE_MASK}
    page should contain text               ${MSN_CODIGO_VERIFICACAO}
    Capture Page Screenshot
    Close

Setting variables globais
    ${EMAIL_VALUE}=         FakerLibrary.Email
    log to console          ${EMAIL_VALUE}
    set global variable     ${EMAIL_VALUE}
    ${CPF_VALUE}=           FakerLibrary.CPF
    log to console          ${CPF_VALUE}
    set global variable     ${CPF_VALUE}
    ${PASSWORD_VALUE}=      Generate Random String    length=10    chars=[UPPER][NUMBERS][LOWER]
    log to console          ${PASSWORD_VALUE}
    set global variable     ${PASSWORD_VALUE}
    ${NAME_VALUE}=          FakerLibrary.NAME
    log to console          ${NAME_VALUE}
    set global variable     ${NAME_VALUE}