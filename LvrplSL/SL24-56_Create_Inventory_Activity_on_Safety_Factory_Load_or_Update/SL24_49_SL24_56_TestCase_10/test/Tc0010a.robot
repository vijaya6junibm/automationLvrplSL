*** Settings ***
Resource     ../../../Resources/CreateOrderKeyword.robot
Library     ../../../Resources/read_write_all_excel.py
Resource    ../../../Resources/createSession.robot
Library    ../../../Resources/Prepare_Xml_Content.py
Library           DateTime
Library              OperatingSystem


*** Variables ***

*** Test Cases ***
Create Order TC_001
    [Tags]      REGRESSION    EPLSafetyFactorLoadSyncService
    Creating Session1     AddData
    ${sfLoadJson}=     Input File1    ${CURDIR}
    ${sfLoadResponse}=     Post On Session     AddData   ${base_url_flow}${EPLSafetyFactorLoadSyncService}     data=${sfLoadJson}
