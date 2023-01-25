*** Settings ***
Documentation       This file contains test cases related to invalid login

Resource    ../resource/base/common_functionalities.resource

Library     SeleniumLibrary
Test Setup      Launch Browser And Navigate To Url
Test Teardown   Close Browser
Test Template   Valid Login Template

*** Test Cases ***
TC1     Admin   admin123    Dashboard
*** Keywords ***
Valid Login Template
    [Arguments]     ${username}     ${password}     ${expected_error}
    Input Text    name=username    ${username}
    Input Text    name=password    ${password}
    Click Element    xpath=//*[@type='submit']
    Element Should Contain    xpath=//*[contains(@class,'topbar-header-breadcrumb-module')]    ${expected_error}



