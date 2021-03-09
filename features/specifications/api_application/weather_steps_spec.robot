*** Settings ***
Library            Collections
Library            RequestsLibrary
Resource           weather_spec.robot
Resource           ../../pages/resources/imports_api.robot

*** Test Case ***

Checking the weather by city
    [Tags]  update_value
    When send a request about the city weather
    Then validating the Response's success data

#Consult weather by id
#    [Tags] consultById
#        Given address of API to consult weather
#        When send a request about weather in São Paulo by id
#        Then expect API response will be code 200
#
#Consult weather by longitude and latitude
#    [Tags] consultByLonLat
#        Given address of API to consult weather
#        When send a request about weather in São Paulo by longitude and latitude
#        Then expect API response will be code 200
#
#Consult weather by zip code failed
#    [Tags] consultByZipCodeFailed
#        Given address of API to consult weather
#        When send a request about weather by zip code more than 5 numbers
#        Then expect API error response will be code 404
#
#Consult weather by zip code
#    [Tags] consultByZipCodeSuccess
#        Given address of API to consult weather
#        When send a request about weather by zip code less or equal 5 numbers
#        Then expect API response will be code 200
#
#Consult weather in São Paulo failed
#    [Tags] consulByCityFailed
#        Given address of API to consult weather
#        When send a request about weather in São Paulo
#        And use a different country
#        Then expect API error response will be code 404
#
#Consult weather by longitude and latitude failed
#    [Tags] consultByLonLatFailed
#        Given address of API to consult weather
#        When send a request about weather by wrong latitude and longitude
#        Then expect API error response will be 400
#
#Search weather data by city name with invalid api key
#    [Tags]  apiKeyInvalid
#        When performing a GET to check the weather conditions in the city with an invalid api key
#        Then validate error message for invalid api key
#        Then expect API error response will be "401"