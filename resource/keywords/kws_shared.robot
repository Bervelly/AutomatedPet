*** Settings ***
Resource  ${ROOT}/resource/main.resource

*** Keywords ***

Then expected status code "${expected}"
    [Documentation]  Keyword responsible for validating the status code upon test requirement.
    Status Should be  ${expected}

And the contract of the request "${schema}"
    [Documentation]  Keyword responsible for getting the schema model received by parameter by gherkin and validating it with the api response.
    ${arg_schema}   Get Schema Json  ${schema}
    Validate JsonSchema From File   ${response.text}    ${ROOT}/resource/data/schemas/${arg_schema}

And the request must contain the return message "${message}"
     Should Contain  ${response.text}  "${message}"