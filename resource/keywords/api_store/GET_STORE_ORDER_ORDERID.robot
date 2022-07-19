*** Settings ***
Resource  ${ROOT}/resource/main.resource

*** Keywords ***

Given perform a GET request "get/store/order/{orderId}" endpoint sending orderId "${orderId}"
    IF  "${orderId}" == "valid"
         ${orderId}  Set Variable  ${ID}
    END
    ${new_url}  Format String  ${URL_API_ENDPOINT.store}  orderId=${orderId}
    ${response}  GET   ${URL_BASE.base}${new_url}  expected_status=any
    Set Test Variable  ${response}