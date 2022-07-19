*** Settings ***
Resource  ${ROOT}/resource/main.resource
Force Tags  API_pet  EP_petId

*** Test Cases ***

TC01: Search animal by valid id
    [Tags]  TC01
    [Setup]  Given perform a POST request "post/pet" endpoint sending body "valid"
    [Documentation]  Test responsible for making the user able to search for registration information by sending a valid petId.
    Given perform a GET request "get/pet/{petid}" endpoint sending petId "valid"
    Then expected status code "200"
    And the contract of the request "petId successfully"

TC02: Validate behavior when informing invalid id
    [Tags]  TC02
    [Documentation]  Test responsible for validating that the user cannot retrieve information from the registration by sending an invalid petId.
    Given perform a GET request "get/pet/{petid}" endpoint sending petId "9999999"
    Then expected status code "404"
    And the request must contain the return message "Pet not found"

TC03: Search animal sending empty id
    [Tags]  TC03
    [Documentation]  Test responsible for validating that the user cannot retrieve information from the registration by sending an empty petId.
    Given perform a GET request "get/pet/{petid}" endpoint sending petId ""
    Then expected status code "405"