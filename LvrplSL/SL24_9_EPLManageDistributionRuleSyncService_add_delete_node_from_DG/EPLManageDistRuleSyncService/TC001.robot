*** Settings ***
Resource     ../../Resources/PrepareKeyword.robot
Resource    ../../Resources/createSession.robot
Library    XML
Library    JSONLibrary

*** Variables ***
${CUR_DIR}     ${CURDIR}

*** Test Cases ***
Add Node From DG EPL_RTAM_ALL_DG
    [Documentation]  Add Node From DG
    [Tags]      EPLManageDistRuleSyncService    REGRESSION
    Creating Session1     AddData
    ${json_data} =    Add Node From DG    ${CUR_DIR}    TC001
    Log To Console    ${json_data.json()}
    Dictionary Should Contain Key     ${json_data.json()}     ItemShipNodes
         ${ItemShipNodes}    Get From Dictionary     ${json_data.json()}    ItemShipNodes
         ${ItemShipNode}  Get From Dictionary  ${ItemShipNodes}  ItemShipNode
         # Access the first dictionary inside the list
         ${first_item}=    Get From List    ${item_ship_node}    0
         # Get the 'DistributionRuleId' from the first item
         ${distribution_rule_id}=    Get From Dictionary    ${first_item}    DistributionRuleId
         # Log the DistributionRuleId value
         Log        ${distribution_rule_id}
         Set Test Message   Node is added to DG  ${distribution_rule_id}

Add Node From DG Purpose blank EPL_RTAM_ALL_DG
    [Documentation]  Add Node From DG Purpose blank
    [Tags]      EPLManageDistRuleSyncService    REGRESSION
    Creating Session1     AddData
    ${json_data} =    Add Node From DG    ${CUR_DIR}    TC002
    Log To Console    ${json_data.json()}
    Dictionary Should Contain Key     ${json_data.json()}     ItemShipNodes
         ${ItemShipNodes}    Get From Dictionary     ${json_data.json()}    ItemShipNodes
         ${ItemShipNode}  Get From Dictionary  ${ItemShipNodes}  ItemShipNode
         # Access the first dictionary inside the list
         ${first_item}=    Get From List    ${item_ship_node}    0
         # Get the 'DistributionRuleId' from the first item
         ${distribution_rule_id}=    Get From Dictionary    ${first_item}    DistributionRuleId
         # Log the DistributionRuleId value
         Log        ${distribution_rule_id}
         Set Test Message   Node is added to DG  ${distribution_rule_id}

Add Node From DG Adding Item Id EPL_RTAM_ALL_DG
    [Documentation]  Add Node From DG Adding Item Id
    [Tags]      EPLManageDistRuleSyncService    REGRESSION
    Creating Session1     AddData
    ${json_data} =    Add Node From DG    ${CUR_DIR}    TC003
    Log To Console    ${json_data.json()}
    Dictionary Should Contain Key     ${json_data.json()}     ItemShipNodes
         ${ItemShipNodes}    Get From Dictionary     ${json_data.json()}    ItemShipNodes
         ${ItemShipNode}  Get From Dictionary  ${ItemShipNodes}  ItemShipNode
         # Access the first dictionary inside the list
         ${first_item}=    Get From List    ${item_ship_node}    0
         # Get the 'DistributionRuleId' from the first item
         ${distribution_rule_id}=    Get From Dictionary    ${first_item}    DistributionRuleId
         # Log the DistributionRuleId value
         Log        ${distribution_rule_id}
         Set Test Message   Node is added to DG  ${distribution_rule_id}

Remove Node From DG Operation Delete EPL_RTAM_ALL_DG
    [Documentation]  Remove Node From DG Operation Delete
    [Tags]      EPLManageDistRuleSyncService    REGRESSION
    Creating Session1     AddData
    ${json_data} =    Add Node From DG    ${CUR_DIR}    TC004
    Log To Console    ${json_data.json()}
    Dictionary Should Contain Key     ${json_data.json()}     ItemShipNodes
         ${ItemShipNodes}    Get From Dictionary     ${json_data.json()}    ItemShipNodes
         ${ItemShipNode}  Get From Dictionary  ${ItemShipNodes}  ItemShipNode
         # Access the first dictionary inside the list
         ${first_item}=    Get From List    ${item_ship_node}    0
         # Get the 'DistributionRuleId' from the first item
         ${distribution_rule_id}=    Get From Dictionary    ${first_item}    DistributionRuleId
         # Log the DistributionRuleId value
         Log        ${distribution_rule_id}
         Set Test Message   Node is removed from DG  ${distribution_rule_id}

Exception scenario DistributionRuleId passed is empty
    [Documentation]  Exception scenario DistributionRuleId passed is empty
    [Tags]      EPLManageDistRuleSyncService    REGRESSION
    Creating Session1     AddData
    ${response} =    Add Node From DG    ${CUR_DIR}    TC005
    Run Keyword If    '${response.status_code}' == '400'
    Extract Error Description    ${response}
    Run Keyword If    '${response.status_code}' != '400'    Log    No error, status code: ${response.status_code}

Add Node From DG EPL_LP_RTAM_NODE_DG
    [Documentation]  Add Node From DG
    [Tags]      EPLManageDistRuleSyncService    REGRESSION
    Creating Session1     AddData
    ${json_data} =    Add Node From DG    ${CUR_DIR}    TC006
    Log To Console    ${json_data.json()}
    Dictionary Should Contain Key     ${json_data.json()}     ItemShipNodes
         ${ItemShipNodes}    Get From Dictionary     ${json_data.json()}    ItemShipNodes
         ${ItemShipNode}  Get From Dictionary  ${ItemShipNodes}  ItemShipNode
         # Access the first dictionary inside the list
         ${first_item}=    Get From List    ${item_ship_node}    0
         # Get the 'DistributionRuleId' from the first item
         ${distribution_rule_id}=    Get From Dictionary    ${first_item}    DistributionRuleId
         # Log the DistributionRuleId value
         Log        ${distribution_rule_id}
         Set Test Message   Node is added to DG  ${distribution_rule_id}

Add Node From DG Purpose blank EPL_LP_RTAM_NODE_DG
    [Documentation]  Add Node From DG Purpose blank
    [Tags]      EPLManageDistRuleSyncService    REGRESSION
    Creating Session1     AddData
    ${json_data} =    Add Node From DG    ${CUR_DIR}    TC007
    Log To Console    ${json_data.json()}
    Dictionary Should Contain Key     ${json_data.json()}     ItemShipNodes
         ${ItemShipNodes}    Get From Dictionary     ${json_data.json()}    ItemShipNodes
         ${ItemShipNode}  Get From Dictionary  ${ItemShipNodes}  ItemShipNode
         # Access the first dictionary inside the list
         ${first_item}=    Get From List    ${item_ship_node}    0
         # Get the 'DistributionRuleId' from the first item
         ${distribution_rule_id}=    Get From Dictionary    ${first_item}    DistributionRuleId
         # Log the DistributionRuleId value
         Log        ${distribution_rule_id}
         Set Test Message   Node is added to DG  ${distribution_rule_id}

Add Node From DG Adding Item Id EPL_LP_RTAM_NODE_DG
    [Documentation]  Add Node From DG Adding Item Id
    [Tags]      EPLManageDistRuleSyncService    REGRESSION
    Creating Session1     AddData
    ${json_data} =    Add Node From DG    ${CUR_DIR}    TC008
    Log To Console    ${json_data.json()}
    Dictionary Should Contain Key     ${json_data.json()}     ItemShipNodes
         ${ItemShipNodes}    Get From Dictionary     ${json_data.json()}    ItemShipNodes
         ${ItemShipNode}  Get From Dictionary  ${ItemShipNodes}  ItemShipNode
         # Access the first dictionary inside the list
         ${first_item}=    Get From List    ${item_ship_node}    0
         # Get the 'DistributionRuleId' from the first item
         ${distribution_rule_id}=    Get From Dictionary    ${first_item}    DistributionRuleId
         # Log the DistributionRuleId value
         Log        ${distribution_rule_id}
         Set Test Message   Node is added to DG  ${distribution_rule_id}

Remove Node From DG Operation Delete EPL_LP_RTAM_NODE_DG
    [Documentation]  Remove Node From DG Operation Delete
    [Tags]      EPLManageDistRuleSyncService    REGRESSION
    Creating Session1     AddData
    ${json_data} =    Add Node From DG    ${CUR_DIR}    TC009
    Log To Console    ${json_data.json()}
    Dictionary Should Contain Key     ${json_data.json()}     ItemShipNodes
         ${ItemShipNodes}    Get From Dictionary     ${json_data.json()}    ItemShipNodes
         ${ItemShipNode}  Get From Dictionary  ${ItemShipNodes}  ItemShipNode
         # Access the first dictionary inside the list
         ${first_item}=    Get From List    ${item_ship_node}    0
         # Get the 'DistributionRuleId' from the first item
         ${distribution_rule_id}=    Get From Dictionary    ${first_item}    DistributionRuleId
         # Log the DistributionRuleId value
         Log        ${distribution_rule_id}
         Set Test Message   Node is removed from DG  ${distribution_rule_id}