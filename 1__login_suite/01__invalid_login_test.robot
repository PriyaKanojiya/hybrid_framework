*** Settings ***
Documentation       This file contains test cases related to invalid login

Resource    ../resource/base/common_functionalities.resource

Library     SeleniumLibrary
Library     DataDriver      file=../test_data/orange_data.xlsx      sheet_name=Invalid Login Test
Test Setup      Launch Browser And Navigate To Url
Test Teardown   Close Browser
Test Template   Invalid Login Template

*** Test Cases ***
TC1
*** Keywords ***
Invalid Login Template
    [Arguments]     ${username}     ${password}     ${expected_error}
    Input Text    name=username    ${username}
    Input Text    name=password    ${password}
    Click Element    xpath=//*[@type='submit']
    Element Should Contain    xpath=//*[contains(@class,'oxd-alert')]    ${expected_error}


