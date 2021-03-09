*** Settings ***
Library     BuiltIn

*** Variable ***
&{HEADER}             Content-Type=application/json
${API_KEY}            e2f1d841cc16cff49a0aa18b531d71e0
${API_KEY_INCORRETA}  e2f1d841cc16cff49a0aa18b531d71e0x
${SESSION}            weather
