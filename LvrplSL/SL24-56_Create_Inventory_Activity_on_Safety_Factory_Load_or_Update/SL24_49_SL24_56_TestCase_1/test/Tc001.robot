*** Settings ***
Resource     ../../../Resources/CreateOrderKeyword.robot
Library     ../../../Resources/read_write_all_excel.py
Resource    ../../../Resources/createSession.robot
Library    ../../../Resources/Prepare_Xml_Content.py
Library           DateTime
Library              OperatingSystem


*** Variables ***

*** Test Cases ***
Single Item and Node Safety Factor XML message received from SAP ITR with required attributes
    [Documentation]  The Safety Factor should be updated in the Sterling. Inventory activity should get created for item and node.
    [Tags]      REGRESSION    EPLSafetyFactorLoadSyncService
    Creating Session1     AddData
    ${manageItemJson}=     Manage Item With Dynamic Item        ${CURDIR}
    ${manageItemResponse}=     Post On Session     AddData   ${base_url_api}${manageItem}     data=${manageItemJson}
    status should be       204     ${manageItemResponse}
    ${jsonItemId}=     Manage Item With Dynamic Item1    ${CURDIR}
    ${sfLoadJson}=     Input File       ${jsonItemId}[ItemList][Item][_ItemID]         ${CURDIR}
    Log To Console    ${sfLoadJson}
    ${sfLoadResponse}=     Post On Session     AddData   ${base_url_flow}${EPLSafetyFactorLoadSyncService}     data=${sfLoadJson}
    Log To Console    ${sfLoadResponse.json()}
    ${itemNodeDefnJson}=     Generic Input File    ${jsonItemId}[ItemList][Item][_ItemID]         ${CURDIR}    ${getItemNodeDefnList}
    Log To Console    ${itemNodeDefnJson}
    ${itemNodeDefnResponse}=     Post On Session     AddData   ${base_url_api}${getItemNodeDefnList}     data=${itemNodeDefnJson}
    Log To Console    ${itemNodeDefnResponse.json()}[ItemNodeDefn][0][ItemID]
    Log To Console    '**************************************8'
    Should Be Equal As Strings     ${jsonItemId}[ItemList][Item][_ItemID]     ${itemNodeDefnResponse.json()}[ItemNodeDefn][0][ItemID]