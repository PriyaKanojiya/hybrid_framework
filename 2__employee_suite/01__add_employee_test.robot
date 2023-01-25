*** Settings ***
Documentation       This file contains test cases related to valid employee

Resource    ../resource/base/common_functionalities.resource

Library     SeleniumLibrary
Library     DataDriver  file=../test_data/orange_data.xlsx      sheet_name=Add Employee Test
Test Setup      Launch Browser And Navigate To Url
Test Teardown   Close Browser
Test Template   Add Valid Employee Template

*** Test Cases ***
Add Valid Employee Template_${test_name}

*** Keywords ***
Add Valid Employee Template
    [Arguments]     ${username}     ${password}     ${first_name}   ${middle_name}      ${last_name}    ${expected_1}   ${expected_2}
    Input Text    name=username    ${username}
    Input Password    name=password    ${password}
    Click Element    xpath=//*[@type='submit']
    Click Element    xpath=//span[contains(normalize-space(),'PIM')]
    Click Element    partial link=Add Employee
    Input Text    name=firstName    ${first_name}
    Input Text    name=middleName    ${middle_name}
    Input Text    name=lastName    ${last_name}
    Sleep    5s
    Click Element    xpath=//*[@type='submit']
    Element Should Contain    xpath=//h6[contains(normalize-space(),'${first_name}')]    ${expected_1}
    Element Attribute Value Should Be    name=firstName    value    ${expected_2}


