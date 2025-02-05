*** Settings ***
Resource     ../../../Resources/CreateOrderKeyword.robot
Library     ../../../Resources/read_write_all_excel.py
Resource    ../../../Resources/createSession.robot
Library    ../../../Resources/Prepare_Xml_Content.py
Library           DateTime
Library              OperatingSystem


*** Variables ***

*** Test Cases ***
Create Order TC_001
    [Tags]      REGRESSION    EPLSafetyFactorLoadSyncService
    Creating Session1     AddData
    ${manageItemJson}=     Manage Item With Dynamic Item        ${CURDIR}
    ${manageItemResponse}=     Post On Session     AddData   ${base_url_api}${manageItem}     data=${manageItemJson}
    status should be       204     ${manageItemResponse}
    ${jsonItemId}=     Manage Item With Dynamic Item1    ${CURDIR}
    ${sfLoadJson}=     Input File       ${jsonItemId}[ItemList][Item][_ItemID]         ${CURDIR}
    Log To Console    ${sfLoadJson}
    ${response}=     Post On Session     AddData   ${base_url_flow}${EPLSafetyFactorLoadSyncService}     data=${sfLoadJson}
    Log To Console    '*************************'
        Log To Console        ${response}
    Log To Console        ${response.json}
     Dictionary Should Contain Key     ${response.json()}     Errors
         ${err_error}=    Get From Dictionary     ${response.json()}    Errors
         log  ${err_error}
         Log To Console        'This is error'
         Log To Console        ${err_error}
         log  ${response.json()}[Error]
         Log To Console        'ErrorCode----------------------------- block1'
         Log To Console        ${response.json()}[Error]
         Log To Console        'ErrorCode----------------------------- block2'
         Log To Console        'ErrorCode -------------- block3'
         Log To Console        ${response.json()}[Error][0]
         Log To Console        'ErrorCode -------------- block4'
         Log To Console        ${response.json()}[Error][0][ErrorDescription]
         Log To Console        'ErrorCode -------------- block5'
         Should be Equal as Strings     ${error_description}    ${response.json()}[Error][0][ErrorDescription]
         status should be       400     ${response}