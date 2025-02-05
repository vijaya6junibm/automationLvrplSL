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
    ${manageItemJson}=     Generic Input File1       ${CURDIR}    ${manageItem}
    ${manageItemResponse}=     Post On Session     AddData   ${base_url_api}${manageItem}     data=${manageItemJson}
    status should be       204     ${manageItemResponse}
    ${sfLoadJson}=     Input File1    ${CURDIR}
    ${sfLoadResponse}=     Post On Session     AddData   ${base_url_flow}${EPLSafetyFactorLoadSyncService}     data=${sfLoadJson}
    Log To Console    ${sfLoadResponse.json()}
    ${itemNodeDefnJson}=     Generic Input File1    ${CURDIR}    ${getItemNodeDefnList}
    Log To Console    ${itemNodeDefnJson}
    ${itemNodeDefnResponse}=     Post On Session     AddData   ${base_url_api}${getItemNodeDefnList}     data=${itemNodeDefnJson}
    Log To Console    ${itemNodeDefnResponse}
    Log To Console    '**************************************8'
    Should Be Equal As Strings     it123     ${itemNodeDefnResponse.json()}[ItemNodeDefn][0][ItemID]