*** Settings ***
Resource  ${ROOT}/resource/main.resource
Force Tags  API_pet  EP_pet

*** Test Cases ***

TC04: Insert animal successfully
    [Tags]  TC04
    [Documentation]  Test responsible for making the user able to register a new animal by sending a valid body.
    Given perform a POST request "post/pet" endpoint sending body "valid"
    Then expected status code "200"
    And the contract of the request "pet registered successfully"

TC05: Unable to insert animal without sending the body
    [Tags]  TC05
    [Documentation]  Test responsible for validating that the user cannot register a new animal when he stops sending the body.
    Given perform a POST request "post/pet" endpoint sending body ""
    Then expected status code "405"
    And the request must contain the return message "no data"