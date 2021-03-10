*** Settings ***
Library            Collections
Library            RequestsLibrary
Resource           ../../steps_definitions/api/weather_spec.robot
Resource           ../../pages/resources/imports_api.robot
Force Tags         api_tests

*** Test Case ***

Checking the weather by city
    [Tags]  weather_by_city
    Given I start the session
    When send a request about the city weather
    Then validating the Response's success data

Checking the weather by id
    [Tags]  weather_by_id
    Given I start the session
    When send a request about the city weather by id
    Then validating the Response's success data

Checking weather by longitude and latitude
    [Tags]  weather_long_lati
    Given I start the session
    When send a request about weather by longitude and latitude
    Then validating the Response's success data

Checking weather by zip code
    [Tags]  weather_zipcod
    Given I start the session
    When send a request about weather by zip code us
    Then expect API response will be code   200

Checking cities within a rectangle zone
    [Tags]  weather_rectangle_zone
    Given I start the session
    When send a request about cities within a rectangle zone
    Then expect API response will be code   200

Checking cities in circle
    [Tags]  cities_circle
    Given I start the session
    When send a request about weather by cities in circle
    Then expect API response will be code   200

