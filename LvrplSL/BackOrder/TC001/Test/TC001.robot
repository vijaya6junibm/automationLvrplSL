*** Settings ***
Resource     ../../../Resources/PrepareKeyword.robot
Resource    ../../../Resources/createSession.robot

*** Variables ***
${CUR_DIR}     ${CURDIR}

*** Test Cases ***
EPLPusblishToBackorderEWMQ
    [Documentation]  EPLPusblishToBackorderEWMQ
    [Tags]   REGRESSION  Backorder
    Creating Session Generic     AddData    manageItem
    ${json_data} =    Manage Item Multiline   ${CUR_DIR}
    ${item_id} =      Get Item ID ML    ${json_data}    ${CUR_DIR}
    Log    ${item_id}
    Adjust Inventory Multiline    ${CUR_DIR}
    Find Inventory Multiline    ${CUR_DIR}    findInv
    ${Order_No}    ${Order_Header_Key}=    Create Order Multiline    ${CUR_DIR}
    Log    Order No: ${Order_No}, Order Header Key: ${Order_Header_Key}
    Creating Session Generic     AddData    ${scheduleOrder}
    Schedule Order   AddData     ${Order_No}    ${Order_Header_Key}    ${CUR_DIR}
    Release Order   AddData     ${Order_No}    ${Order_Header_Key}    ${CUR_DIR}
    BackOrder  AddData     ${Order_No}     ${item_id}     ${CUR_DIR}    EPLPusblishToBackorderEWMQ

EPLPublishToBackorderAppSurtidoQ
    [Documentation]  EPLPublishToBackorderAppSurtidoQ
    [Tags]   REGRESSION  Backorder
    Creating Session Generic     AddData    manageItem
    ${json_data} =    Manage Item Multiline   ${CUR_DIR}
    ${item_id} =      Get Item ID ML    ${json_data}    ${CUR_DIR}
    Log    ${item_id}
    Adjust Inventory Multiline    ${CUR_DIR}
    Find Inventory Multiline    ${CUR_DIR}    findInv
    ${Order_No}    ${Order_Header_Key}=    Create Order Multiline    ${CUR_DIR}
    Log    Order No: ${Order_No}, Order Header Key: ${Order_Header_Key}
    Creating Session Generic     AddData    ${scheduleOrder}
    Schedule Order   AddData     ${Order_No}    ${Order_Header_Key}    ${CUR_DIR}
    Release Order   AddData     ${Order_No}    ${Order_Header_Key}    ${CUR_DIR}
    BackOrder  AddData     ${Order_No}     ${item_id}     ${CUR_DIR}    EPLPublishToBackorderAppSurtidoQ