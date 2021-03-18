*** Settings ***
Documentation   Simple example using AppiumLibrary
Library         AppiumLibrary       15      run_on_failure=Log Source
Library         FakerLibrary        locale=pt_BR
Library         String
Variables       ../../pages/mobile_pages/locators/locators.yaml
Resource        ../../commons/mobile_tests/setup.robot
Resource        ../../steps_definitions/mobile/user_registration_steps.robot
Force Tags      mobile_tests

*** Test Cases ***
Test scenario - User registration
  Given open test application
  And select create account
  When fill of the user registration
  And submit user registration
  Then validate phone confirmation screen