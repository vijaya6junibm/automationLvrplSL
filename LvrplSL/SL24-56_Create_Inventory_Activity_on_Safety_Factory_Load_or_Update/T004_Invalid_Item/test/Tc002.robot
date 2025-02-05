*** Settings ***
Resource     ../../../Resources/CreateOrderKeyword.robot
Library     ../../../Resources/read_write_all_excel.py
Resource    ../../../Resources/createSession.robot
Library    ../../../Resources/Prepare_Xml_Content.py
Library           DateTime
Library              OperatingSystem


*** Variables ***
${error_description}        Item(Item Id and UOM) does not exist

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
    log      ${response}
    Log To Console    '*************************** 0'
    Log To Console        ${response}
    Log To Console    '*************************** 1'
    Log To Console        ${response.json}
    Log To Console    '*************************** 2'
    Log To Console        ${response.json()}[errors]
    Log To Console    '***************************'
     Dictionary Should Contain Key     ${response.json()}     Error
         ${err_error}=    Get From Dictionary     ${response.json()}    Error
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
         status should be       200     ${response}