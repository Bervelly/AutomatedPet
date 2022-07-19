*** Settings ***
Resource  ${ROOT}/resource/main.resource

*** Keywords ***

Given perform a PUT request "put/pet" endpoint sending body "${body}"
    &{headers}  Create Dictionary  Content-Type=application/json
    IF  "${body}" == "valid"
        ${body}  Get File  ${BODY_PUT}
        ${new_body}  Evaluate  json.loads($body)  json
       
        ${response}  PUT  ${URL_BASE.base}${URL_API.pet}  json=${new_body}  headers=&{headers}  expected_status=any
        Log          ${response.json()["id"]}
        ${ID}   Get from Dictionary  ${response.json()}    id
        Set Test Variable  ${ID}
    ELSE  
         ${new_body}  Get File  ${BODY_EMPTY}
        ${response}  PUT  ${URL_BASE.base}${URL_API.pet}  data=${new_body}  headers=&{headers}  expected_status=any
    END
    Set Test Variable  ${response}