*** Settings ***
Library       Collections
Library       RequestsLibrary
Library     ../Resources/Create_Order_Xml_Content.py
Library      JSONLibrary

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


*** Keywords ***
Sequence Create Order POS TC001 Seq1
    ${jsonbody}=     Create Order        ${dirpath}       ${TC001_Path}
    RETURN  ${jsonbody}

Sequence Create Order OOM TC001 Seq1
    ${jsonbody}=     Create Order With Dynamic Item    ${dirpath1}       ${TC001_Manage_Item_Path}
    RETURN  ${jsonbody}

Sequence Create Order Tests TC001 Seq1             ${it}
    ${jsonbody}=     Create Order        ${dirpath1}       ${TC001_Manage_Item_Path}        ${it}
    RETURN  ${jsonbody}

TC_003_CreateOrderApp - create normal order
    ${jsonbody}=     Create Order        ${dirpath}       ${TC003_Path}
    RETURN  ${jsonbody}

TC_004_CreateOrderApp - create normal order ClickandCollect
    ${jsonbody}=     Create Order        ${dirpath}       ${TC004_Path}
    RETURN  ${jsonbody}

Sequence Manage Item TC001 Seq1
    ${jsonbody}=     Manage Item        ${dirpath1}       ${TC001_Manage_Item_Path}
    RETURN  ${jsonbody}

