*** Settings ***
Resource  ${ROOT}/resource/main.resource
Force Tags  API_pet  EP_put

*** Test Cases ***

TC12: Update the ID and name attributes of an existent pet
    [Tags]  TC12
    [Documentation]  Test responsible for update an existing pet successfully by sending a valid body.
    Given perform a PUT request "put/pet" endpoint sending body "valid"
    Then expected status code "200"
    And the contract of the request "pet changed successfully"

TC13: Unable to update an existing pet without sending the body
    [Tags]  TC13
    [Documentation]  Test responsible for validating that the user cannot update an existing pet when he stops sending the body.
    Given perform a PUT request "put/pet" endpoint sending body ""
    Then expected status code "405"
    And the request must contain the return message "no data"