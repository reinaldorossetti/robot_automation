*** Settings ***
Library            RequestsLibrary
Resource           ../../steps_definitions/api/weather_steps.robot

### TODO code refactoring.

*** Keywords ***

When send a request about the city weather
    Setting the parameters for city weather test
    Setting session to weather using GET method

When send a request about the city weather by id
    Setting the parameters for weather test by id
    Setting session to weather using GET method