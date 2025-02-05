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
    [Documentation]  Inventory available from multiple stores
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
    ${resp}=    convert to string   ${findInventoryResponse.json()}
    Write Output File       ${resp}        'findInv'    ${CURDIR}
    Dictionary Should Contain Key     ${findInventoryResponse.json()}     SuggestedOption
         ${Order_No}=    Get From Dictionary     ${findInventoryResponse.json()}    SuggestedOption
         ${Option}  Get From Dictionary  ${Order_No}  Option
          ${PromiseLines}  Get From Dictionary  ${Option}  PromiseLines
         ${PromiseLine}  Get From Dictionary  ${PromiseLines}  PromiseLine
          ${AssignmentsList}  Get From List  ${PromiseLine}  0
          ${assignments}  Get From Dictionary  ${AssignmentsList}  Assignments
          ${assignment}  Get From Dictionary  ${Assignments}  Assignment
         ${assignmentList}  Get From List  ${assignment}  0
         ${ShipNode}  Get From Dictionary  ${assignmentList}  ShipNode
         Log    ${ShipNode}
         ${FlashStores}  Get From Dictionary  ${AssignmentsList}  FlashStores
         Set Test Message    ShipNode 127b suggested in Assignment ShipNode from response is ${ShipNode}
