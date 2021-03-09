*** Keywords ***

When send a request about the city weather
    &{params}=   Create Dictionary   q=${city}     appid=${API_KEY}
    Create Session  ${SESSION}  ${HOST_BASE}    headers=${HEADER}     disable_warnings=True
    ${RESPONSE}      GET On Session  ${SESSION}    ${WEATHER_ENDPOINT}   params=${params}    headers=${HEADER}
    Set Test Variable   ${RESPONSE}

Then validating the Response's success data
    Log                                 Response: ${RESPONSE.text}
    Log To Console                      Response: ${RESPONSE.text}
    Should Not Be Empty                 ${RESPONSE.json()}
    Dictionary Should Contain Item      ${RESPONSE.json()["sys"]}        country     ${COUNTRY}
    Dictionary Should Contain Item      ${RESPONSE.json()["coord"]}      coord       ${COORDINATES}
    Dictionary Should Contain Item      ${RESPONSE.json()["sys"]}        name        ${CITY}