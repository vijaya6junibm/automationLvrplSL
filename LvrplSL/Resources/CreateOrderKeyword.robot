*** Settings ***
Library       Collections
Library       RequestsLibrary
Library     ../Resources/Create_Order_Xml_Content.py
Library      JSONLibrary
Library      ../Resources/read_write_all_excel.py
Library      ../Resources/Prepare_Xml_Content.py
Library           DateTime
Library              OperatingSystem

*** Variables ***
${base_url_api}         http://localhost:9080/smcfs/restapi/invoke/
${base_url_flow}         http://localhost:9080/smcfs/restapi/executeFlow/
${user}             admin
${passwd}           ChangeIt4m3
&{headers}          Content-Type=application/xml  Authorization=Basic YWRtaW46cGFzc3dvcmQ=
${auth}=  Create List  ${user}  ${passwd}
${error_description}        Item(Item Id and UOM) does not exist
${file}           TestResults.csv
${file1}           TestResults1.csv
${createOrder}             createOrder
${scheduleOrder}             scheduleOrder
${releaseOrder}             releaseOrder
${manageItem}             manageItem
${multiApi}             multiApi
${adjustInventory}             adjustInventory
${findInventory}             findInventory
${getOrderDetails}             getOrderDetails
${EPLSafetyFactorLoadSyncService}             EPLSafetyFactorLoadSyncService
${getItemNodeDefnList}             getItemNodeDefnList
${SOMSNS}             SOMSNS
${EPLFindInventorySyncService}             EPLFindInventorySyncService
${getOrderDetails}             getOrderDetails
${TC001_Path}             TC_001_CreateOrderPos - create normal order
${TC002_Path}             TC_002_CreateOrderPos - create normal order ClickandCollect
${TC003_Path}             TC_003_CreateOrderApp - create normal order
${TC004_Path}             TC_004_CreateOrderApp - create normal order ClickandCollect
${TC001_Manage_Item_Path}             ItemDynamic
${dirpath}        C:/EPL-Liverpool-SL/CreateOrder
${dirpath1}        C:/EPL-Liverpool-SL/EPLOpenOrdersMigration
#flash stores
${ePLCreateFlashStoreSyncService}             EPLCreateFlashStoreSyncService
${ePLUpdateExtnFlashStoreSyncService}             EPLChangeFlashStoreSyncService
${ePLGetFlashStoreListSyncService}             EPLGetFlashStoreListSyncService
${ePLDeleteFlashStoreSyncService}                EPLDeleteFlashStoreSyncService
${EPLFlashStoreLoadSyncService}                EPLFlashStoreLoadSyncService
${EPLManageDistRuleSyncService}                EPLManageDistRuleSyncService
${EPLPusblishToBackorderEWMQ}                EPLPusblishToBackorderEWMQ
${EPLPublishToBackorderAppSurtidoQ}                EPLPublishToBackorderAppSurtidoQ


*** Keywords ***
Create Order SL
    [Arguments]         ${jsonItemId}    ${CUR_DIR}
    ${jsonCreateOrder}=     Create Order File      ${jsonItemId}[ItemList][Item][_ItemID]    ${CUR_DIR}
    ${createOrderResponse}=     Post On Session     AddData   ${base_url_api}${createOrder}     data=${jsonCreateOrder}    headers=${headers}
    ${resp2}=    convert to string   ${createOrderResponse.json()}
    Write Output File       ${resp2}        'createOrder'        ${CUR_DIR}
    ${timestamp} =    Get Current Date    result_format=%Y%m%d-%H%M
         Dictionary Should Contain Key     ${createOrderResponse.json()}     OrderNo
         ${Order_No}=    Get From Dictionary     ${createOrderResponse.json()}    OrderNo
         Dictionary Should Contain Key     ${createOrderResponse.json()}     OrderHeaderKey
         ${Order_Header_Key}=    Get From Dictionary     ${createOrderResponse.json()}    OrderHeaderKey
         Append Excel File1  ${file}    ${Order_No}     ${TEST NAME}    ${timestamp}    ${jsonCreateOrder}     ${createOrderResponse.json()}
    

