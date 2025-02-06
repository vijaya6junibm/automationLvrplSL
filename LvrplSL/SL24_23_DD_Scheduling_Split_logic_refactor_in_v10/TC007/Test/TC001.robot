*** Settings ***
Resource     ../../../Resources/PrepareKeyword.robot
Resource    ../../../Resources/createSession.robot

*** Variables ***
${CUR_DIR}     ${CURDIR}

*** Test Cases ***
Create Order with one line and 10 qty.Complete inventory is available at node 103.
    [Documentation]  Create Order with one line and 10 qty.Complete inventory is available at node 103.
    [Tags]   REGRESSION  EPLSplit
    Creating Session Generic     AddData    manageItem
    ${item_id} =    Manage Item Multiline   ${CUR_DIR}
    Adjust Inventory Multiline    ${CUR_DIR}
    Find Inventory Multiline    ${CUR_DIR}    findInv
    ${Order_No}    ${Order_Header_Key}=    Create Order Multiline    ${CUR_DIR}
    Log    Order No: ${Order_No}, Order Header Key: ${Order_Header_Key}
    Creating Session Generic     AddData    ${scheduleOrder}
    Schedule Order   AddData     ${Order_No}    ${Order_Header_Key}    ${CUR_DIR}