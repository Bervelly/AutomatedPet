*** Settings ***

Resource  ${ROOT}/resource/main.resource
Force Tags  API_store  EP_orderId

*** Test Cases ***

TC06: Search purchase order by valid id
    [Tags]  TC06
    [Setup]  Given perform a POST request "post/store/order" endpoint sending body "valid"
    [Documentation]  Test responsible for making the user able to search for order information by sending a valid orderId
    Given perform a GET request "get/store/order/{orderId}" endpoint sending orderId "valid"
    Then expected status code "200"
    And the contract of the request "orderId successfully"

TC07: Validate error message when informing invalid id
    [Tags]  TC07
    [Documentation]  Test responsible for validating that the user is unable to fetch order information by sending an invalid orderId.
    Given perform a GET request "get/store/order/{orderId}" endpoint sending orderId "00"
    Then expected status code "404"
    And the request must contain the return message "Order not found"

TC08: Validate error message when informing an ID greater than allowed
    [Tags]  TC08
    [Documentation]  Test responsible for validating that the user is unable to fetch order information by sending an invalid orderId.
    Given perform a GET request "get/store/order/{orderId}" endpoint sending orderId "11"
    Then expected status code "404"
    And the request must contain the return message "Order not found"

TC09: Search purchase order by sending empty 
    [Tags]  TC09
    [Documentation]  Test responsible for validating that the user cannot retrieve order information by sending an empty orderId.
    Given perform a GET request "get/store/order/{orderId}" endpoint sending orderId ""
    Then expected status code "405"