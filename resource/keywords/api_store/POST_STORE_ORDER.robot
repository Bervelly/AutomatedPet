*** Settings ***
Resource  ${ROOT}/resource/main.resource

*** Keywords ***

Given perform a POST request "post/store/order" endpoint sending body "${body}"

     &{headers}  Create Dictionary  Content-Type=application/json
    IF  "${body}" == "valid"
        ${body}  Get File  ${BODY_POST_STORE}
        ${new_body}  Evaluate  json.loads($body)  json
       
        ${response}  POST   ${URL_BASE.base}${URL_API_ENDPOINT.order}  expected_status=any  json=${new_body}  headers=&{headers}
        Log          ${response.json()["id"]}
        ${ID}   Get from Dictionary  ${response.json()}    id
        Set Test Variable  ${ID}
    ELSE  
         ${new_body}  Get File  ${BODY_EMPTY}
         ${response}  POST  ${URL_BASE.base}${URL_API_ENDPOINT.order}  data=${new_body}  headers=&{headers}  expected_status=any
    END
    Set Test Variable  ${response}