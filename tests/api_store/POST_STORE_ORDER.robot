*** Settings ***

Resource  ${ROOT}/resource/main.resource
Force Tags  API_store  EP_order

*** Test Cases ***

TC10: Insert a new order when informs a valid body
    [Tags]  TC10
    [Documentation]  Test responsible for making the user able to register a new animal by sending a valid body.
    Given perform a POST request "post/store/order" endpoint sending body "valid"
    Then expected status code "200"
    And the contract of the request "order registered successfully"

TC11: Unable to insert a new order without sending body
    [Tags]  TC11
    [Documentation]  Test responsible for validating that the user cannot register a new animal when he stops sending the body.
    Given perform a POST request "post/store/order" endpoint sending body ""
    Then expected status code "400"
   And the request must contain the return message "No data"