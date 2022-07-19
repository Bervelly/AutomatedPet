*** Settings ***
Resource  ${ROOT}/resource/main.resource

*** Keywords ***

Given perform a GET request "get/pet/{petid}" endpoint sending petId "${pet_id}"
    IF  "${pet_id}" == "valid"
         ${pet_id}  Set Variable  ${ID}
    END
    
    ${new_url}  Format String  ${URL_API_ENDPOINT.pet_id}  petId=${pet_id}
    ${response}  GET   ${URL_BASE.base}${new_url}  expected_status=any
    Set Test Variable  ${response}