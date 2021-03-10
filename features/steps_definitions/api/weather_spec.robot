*** Variable ***
${ID_CITY}                     3448439
${STATUS_ESPERADO}             200
${LONGITUDE}                   -46.6361
${LATITUDE}                    -23.5475
${ZIP_CODE_US}                 94040,us
${BBOX}                        12,32,15,37,10
${CNT}                         10

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
    Should Be Equal As Strings          ${RESPONSE.status_code}                     ${STATUS_ESPERADO}

Then expect API response will be code
    [Arguments]                         ${STATUS_CODE}
    Log                                 Response: ${RESPONSE.text}
    Log To Console                      Response: ${RESPONSE.text}
    Should Be Equal As Strings          ${RESPONSE.status_code}                     ${STATUS_CODE}

When send a request about the city weather by id
    &{params}=   Create Dictionary   id=${ID_CITY}     appid=${API_KEY}

    ${RESPONSE}      GET On Session  ${SESSION}    ${WEATHER_ENDPOINT}   params=${params}    headers=${HEADER}
    Set Test Variable   ${RESPONSE}

When send a request about weather by longitude and latitude
    &{params}=   Create Dictionary   lat=${LATITUDE}   lon=${LONGITUDE}     appid=${API_KEY}
    Log                 Parameters: {params}
    ${RESPONSE}      GET On Session  ${SESSION}    ${WEATHER_ENDPOINT}   params=${params}    headers=${HEADER}
    Set Test Variable   ${RESPONSE}

When send a request about weather by zip code wrong
    &{params}=   Create Dictionary   lat=${LATITUDE}   lon=${LONGITUDE}     appid=${API_KEY}

    ${RESPONSE}      GET On Session  ${SESSION}    ${WEATHER_ENDPOINT}   params=${params}    headers=${HEADER}
    Set Test Variable   ${RESPONSE}

When send a request about weather by zip code us
    &{params}=   Create Dictionary   zip=${ZIP_CODE_US}     appid=${API_KEY}

    ${RESPONSE}      GET On Session  ${SESSION}    ${WEATHER_ENDPOINT}   params=${params}    headers=${HEADER}
    Set Test Variable   ${RESPONSE}

When send a request about cities within a rectangle zone
    &{params}=   Create Dictionary   bbox=${BBOX}     appid=${API_KEY}

    ${RESPONSE}      GET On Session  ${SESSION}    ${CITY_ENDPOINT}   params=${params}    headers=${HEADER}
    Set Test Variable   ${RESPONSE}

When send a request about weather by cities in circle
    &{params}=   Create Dictionary   lat=${LATITUDE}   lon=${LONGITUDE}     cnt=${CNT}     appid=${API_KEY}

    ${RESPONSE}      GET On Session  ${SESSION}    ${WEATHER_ENDPOINT}   params=${params}    headers=${HEADER}
    Set Test Variable   ${RESPONSE}