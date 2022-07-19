*** Settings ***

# Libraries 
Library  RequestsLibrary
Library  JSONLibrary
Library  String
Library  Collections
Library  OperatingSystem
Library  BuiltIn
Library  JSONLibrary
Library  JsonValidator
Library  ${ROOT}/resource/utils/config_helper.py


# Keywords

Resource  ${ROOT}/resource/keywords/kws_shared.robot
Resource  ${ROOT}/resource/utils/helper.robot

### keywords pet
Resource  ${ROOT}/resource/keywords/api_pet/GET_PET_PETID.robot
Resource  ${ROOT}/resource/keywords/api_pet/POST_PET.robot
Resource  ${ROOT}/resource/keywords/api_pet/PUT_PET.robot

### keywords store
Resource  ${ROOT}/resource/keywords/api_store/GET_STORE_ORDER_ORDERID.robot
Resource  ${ROOT}/resource/keywords/api_store/POST_STORE_ORDER.robot


# Variables
Resource  ${ROOT}/resource/data/input/input_paths.resource
Resource  ${ROOT}/resource/API/index_api.robot

