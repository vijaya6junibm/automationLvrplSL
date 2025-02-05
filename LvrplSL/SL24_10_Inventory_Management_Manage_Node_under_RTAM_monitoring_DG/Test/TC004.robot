*** Settings ***
Resource     ../../Resources/PrepareKeyword.robot
Resource    ../../Resources/createSession.robot

*** Variables ***
${CUR_DIR}     ${CURDIR}

*** Test Cases ***
Deliver Order and Check records in yfs_inventory_activity
    [Tags]    RTAM
    Creating Session Generic     AddData    manageItem
    ${item_id} =    Manage Item   ${CUR_DIR}
    Adjust Inventory    ${itemId}    ${CUR_DIR}
    Check Inventory Activity    ${itemId}    ${CUR_DIR}
    Find Inventory    ${itemId}    ${CUR_DIR}    findInv
    Check Inventory Activity    ${itemId}    ${CUR_DIR}
    ${Order_No}    ${Order_Header_Key}=    Create Order    ${itemId}    ${CUR_DIR}
    Log To Console    Order No: ${Order_No}, Order Header Key: ${Order_Header_Key}
    Check Inventory Activity    ${itemId}    ${CUR_DIR}
    Schedule Order   AddData     ${Order_No}    ${Order_Header_Key}    ${CUR_DIR}
    Release Order   AddData     ${Order_No}    ${Order_Header_Key}    ${CUR_DIR}
    ${values}=     Get Order Details  AddData     ${Order_No}     ${Order_Header_Key}  ${CUR_DIR}
    Log To Console    'values *********************************8'
    Log To Console    ${values}[0]
    SOMSNS Order    AddData     ${Order_No}     "${values}[0]"     ${CUR_DIR}
    Disconnect From Database
