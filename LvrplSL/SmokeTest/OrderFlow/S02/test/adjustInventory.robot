*** Settings ***
Resource     ../../../../Resources/CreateOrderKeyword.robot
Library     ../../../../Resources/read_write_all_excel.py
Resource     ../../../../Resources/createSession.robot
Library    ../../../../Resources/Prepare_Xml_Content.py
Library           DateTime


*** Variables ***

*** Test Cases ***
Manage Item And Adjust Inventory TC_001
    [Tags]      HAPPYFLOW    ADJUSTiNVENTORY
    Creating Session1     AddData
    ${manageItemJson}=     Manage Item With Dynamic Item    ${CURDIR}
    ${manageItemResponse}=     Post On Session     AddData   ${base_url_api}${manageItem}     data=${manageItemJson}
    status should be       204     ${manageItemResponse}
    ${jsonItemId}=     Manage Item With Dynamic Item1    ${CURDIR}
    Dictionary Should Contain Key     ${jsonItemId}     ItemList
         ${Item_ID_Path}=    Get From Dictionary     ${jsonItemId}    ItemList
         ${jsonAdjInv}=     Adjust Inventory File          ${jsonItemId}[ItemList][Item][_ItemID]    ${CURDIR}
    ${adjInvresponse}=     Post On Session     AddData   ${base_url_api}${adjustInventory}     data=${jsonAdjInv}    headers=${headers}
    status should be       204     ${adjInvresponse}