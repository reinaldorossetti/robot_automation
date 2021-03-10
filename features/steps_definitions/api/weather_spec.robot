*** Variable ***
${STATUS_SUCCESS}              200
${ID_CITY}                     3448439

*** Keywords ***

Given I start the session
    Create Session  ${SESSION}  ${HOST_BASE}    headers=${HEADER}     disable_warnings=True

When send a request about the city weather
    &{params}=   Create Dictionary   q=${city}     appid=${API_KEY}

    ${RESPONSE}      GET On Session  ${SESSION}    ${WEATHER_ENDPOINT}   params=${params}    headers=${HEADER}
    Set Test Variable   ${RESPONSE}

Then validating the Response's success data
    Log                                 Response: ${RESPONSE.text}
    Log To Console                      Response: ${RESPONSE.text}
    Should Not Be Empty                 ${RESPONSE.json()}
    Dictionary Should Contain Item      ${RESPONSE.json()["sys"]}       country     ${COUNTRY}
    Dictionary Should Contain Item      ${RESPONSE.json()}              coord       ${COORDINATES}
    Dictionary Should Contain Item      ${RESPONSE.json()}              name        ${CITY}
    Should Be Equal As Strings          ${RESPONSE.status_code}                     ${STATUS_SUCCESS}


When send a request about the city weather by id
    &{params}=   Create Dictionary   id=${ID_CITY}     appid=${API_KEY}

    ${RESPONSE}      GET On Session  ${SESSION}    ${WEATHER_ENDPOINT}   params=${params}    headers=${HEADER}
    Set Test Variable   ${RESPONSE}