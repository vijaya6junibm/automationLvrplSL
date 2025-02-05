*** Settings ***
Resource     ../../Resources/PrepareKeyword.robot
Resource    ../../Resources/createSession.robot

*** Variables ***
${CUR_DIR}     ${CURDIR}

*** Test Cases ***
Add Item Adjust Inventory Check records in yfs_inventory_activity
    [Tags]    RTAM
    Creating Session1     AddData
    ${json_data} =    Json Manage Item File   ${CUR_DIR}
    ${item_id} =      Get Item ID    ${json_data}    ${CUR_DIR}
    Adjust Inventory    ${itemId}    ${CUR_DIR}
    Check Inventory Activity    ${itemId}    ${CUR_DIR}
    Disconnect From Database

Find Inventory and Check records in yfs_inventory_activity
    [Tags]    RTAM
    Creating Session Generic     AddData    manageItem
    ${item_id} =    Manage Item   ${CUR_DIR}
    Log To Console    'json data in tc001 file'
    Log To Console    ${item_id}
    Adjust Inventory    ${itemId}    ${CUR_DIR}
    Check Inventory Activity    ${itemId}    ${CUR_DIR}
    Find Inventory    ${itemId}    ${CUR_DIR}    findInv
    Check Inventory Activity    ${itemId}    ${CUR_DIR}
    Disconnect From Database

Create Order and Check records in yfs_inventory_activity
    [Tags]    RTAM
    Creating Session Generic     AddData    manageItem
    ${item_id} =    Manage Item   ${CUR_DIR}
    Log To Console    'json data in tc001 file'
    Log To Console    ${item_id}
    Adjust Inventory    ${itemId}    ${CUR_DIR}
    Check Inventory Activity    ${itemId}    ${CUR_DIR}
    Find Inventory    ${itemId}    ${CUR_DIR}    findInv
    Check Inventory Activity    ${itemId}    ${CUR_DIR}
    Creating Session1    AddData
    Create Order    ${itemId}    ${CUR_DIR}
    Check Inventory Activity    ${itemId}    ${CUR_DIR}
    Disconnect From Database
