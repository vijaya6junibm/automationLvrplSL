*** Settings ***
Resource     ../../Resources/PrepareKeyword.robot
Resource    ../../Resources/createSession.robot

*** Variables ***
${CUR_DIR}     ${CURDIR}

*** Test Cases ***
Get Yfs inventory activity records
    Creating Session1     AddData
    ${json_data} =    Json Manage Item File   ${CUR_DIR}
    ${item_id} =      Get Item ID    ${json_data}    ${CUR_DIR}
    Check Inventory Activity    ${itemId}    ${CUR_DIR}
    Disconnect From Database
