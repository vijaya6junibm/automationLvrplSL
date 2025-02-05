*** Settings ***
Resource     ../../../Resources/CreateOrderKeyword.robot
Library     ../../../Resources/read_write_all_excel.py
Resource    ../../../Resources/createSession.robot
Library    ../../../Resources/Prepare_Xml_Content.py
Library           DateTime
Library              OperatingSystem
Library     Process


*** Variables ***


*** Test Cases ***
TC_001
    [Documentation]  Sample Error XML
    [Tags]      REGRESSION    Sourcing_I1001_Inventory_Availability
    Creating Session1     AddData
    ${manageItemJson}=     Manage Item With Dynamic Item        ${CURDIR}
    ${manageItemResponse}=     Post On Session     AddData   ${base_url_api}${manageItem}     data=${manageItemJson}
    status should be       204     ${manageItemResponse}
    ${jsonItemId}=     Manage Item With Dynamic Item1    ${CURDIR}
    Dictionary Should Contain Key     ${jsonItemId}     ItemList
         ${Item_ID_Path}=    Get From Dictionary     ${jsonItemId}    ItemList
         ${jsonAdjInv}=     Adjust Inventory File          ${jsonItemId}[ItemList][Item][_ItemID]    ${CURDIR}
    ${adjInvresponse}=     Post On Session     AddData   ${base_url_api}${adjustInventory}     data=${jsonAdjInv}    headers=${headers}
    status should be       204     ${adjInvresponse}
         ${jsonfindInventory}=     Find Inventory File       ${jsonItemId}[ItemList][Item][_ItemID]    ${CURDIR}
    ${findInventoryResponse}=     Post On Session     AddData   ${base_url_flow}${EPLFindInventorySyncService}     data=${jsonfindInventory}    headers=${headers}
    Log To Console    ${findInventoryResponse.json()}
    ${resp}=    convert to string   ${findInventoryResponse.json()}
    Write Output File       ${resp}        'findInv'    ${CURDIR}
         Set Test Message    fails with ErrorDescription Organization code is mandatory for this operation
