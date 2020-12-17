#!/bin/bash
#
#Copyright 2019 VMware, Inc.
#SPDX-License-Identifier: BSD-2-Clause
#

###create index###
CREATE INDEX `userName_index` ON `flowgate`(`userName`, `_class`) where _class = "com.vmware.flowgate.common.model.WormholeUser";
CREATE INDEX `sourcecategory_index` ON `flowgate`(`assetSource`,`category`) WHERE `_class` = "com.vmware.flowgate.common.model.Asset";
CREATE INDEX `realTimeData_index` ON `flowgate`(`assetID`,`_class`,`time`) WHERE `_class` = "com.vmware.flowgate.common.model.RealTimeData";
CREATE INDEX `assetNameLike_index` ON `flowgate`(`_class`,`assetName`,`category`) WHERE `_class` = "com.vmware.flowgate.common.model.Asset";
CREATE INDEX `tpye_index` ON `flowgate`(`_class`,`category`) WHERE `_class` = "com.vmware.flowgate.common.model.Asset";
CREATE INDEX `vro_vc_index` ON `flowgate`(`vcID`,`vroID`) WHERE `_class` = "com.vmware.flowgate.common.model.ServerMapping";
CREATE INDEX `sddc_index` ON `flowgate`(`type`) WHERE `_class` = "com.vmware.flowgate.common.model.SDDCSoftwareConfig";
CREATE INDEX `like_index` ON `flowgate`(`category`,`assetName`) WHERE `_class` = "com.vmware.flowgate.common.model.Asset";
CREATE INDEX `facilityType_index` ON `flowgate`(`type`) WHERE `_class` = "com.vmware.flowgate.common.model.FacilitySoftwareConfig";
CREATE INDEX `jobconfig_index` ON `flowgate`(`jobType`) WHERE `_class` = "com.vmware.flowgate.common.model.JobConfig";
CREATE INDEX `queryByAssetName_index` ON `flowgate`(`assetName`) WHERE `_class` = "com.vmware.flowgate.common.model.Asset";
CREATE INDEX `class_index` ON `flowgate`(`_class`);

###create data###
INSERT INTO flowgate (KEY, VALUE) VALUES ("cleanRealTimeDataByTimeRange", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"cleanRealTimeDataByTimeRange","resource":[{"pattern":"/v1/assets/realtimedata/**","httpMethod":"DELETE","sortWeight":"2"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("getExpiredTimeRange", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"getExpiredTimeRange","resource":[{"pattern":"/v1/setting/datapersistenttime","httpMethod":"GET","sortWeight":"2"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("updateExpiredTimeRange", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"updateExpiredTimeRange","resource":[{"pattern":"/v1/setting/datapersistenttime/**","httpMethod":"PUT","sortWeight":"3"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("createAnAsset", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"createAnAsset","resource":[{"pattern":"/v1/assets","httpMethod":"POST","sortWeight":"2"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("createAssets", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"createAssets","resource":[{"pattern":"/v1/assets/batchoperation","httpMethod":"POST","sortWeight":"2"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("readAsset", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"readAsset","resource":[{"pattern":"/v1/assets/**","httpMethod":"GET","sortWeight":"1"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("readAssetBySource", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"readAssetBySource","resource":[{"pattern":"/v1/assets/source/**","httpMethod":"GET","sortWeight":"5"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("readAssetByAssetName", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"readAssetByAssetName","resource":[{"pattern":"/v1/assets/name/**","httpMethod":"GET","sortWeight":"97"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("readAssetBySourceAndType", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"readAssetBySourceAndType","resource":[{"pattern":"/v1/assets/source**/type/**","httpMethod":"GET","sortWeight":"96"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("readAssetByType", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"readAssetByType","resource":[{"pattern":"/v1/assets/type/**","httpMethod":"GET","sortWeight":"2"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("readMappedAsset", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"readMappedAsset","resource":[{"pattern":"/v1/assets/mappedasset/category/**","httpMethod":"GET","sortWeight":"100"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("readAssetByKeywords", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"readAssetByKeywords","resource":[{"pattern":"/v1/assets/page/**","httpMethod":"GET","sortWeight":"100"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("readAssetByPduIsNull", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"readAssetByPduIsNull","resource":[{"pattern":"/v1/assets/pdusisnull","httpMethod":"GET","sortWeight":"1"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("readAssetByPduIsNotNull", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"readAssetByPduIsNotNull","resource":[{"pattern":"/v1/assets/pdusisnotnull","httpMethod":"GET","sortWeight":"1"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("updateAsset", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"updateAsset","resource":[{"pattern":"/v1/assets","httpMethod":"PUT","sortWeight":"1"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("deleteAsset", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"deleteAsset","resource":[{"pattern":"/v1/assets/**","httpMethod":"DELETE","sortWeight":"2"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("createRealTimeSensorDatas", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"createRealTimeSensorDatas","resource":[{"pattern":"/v1/assets/sensordata/batchoperation","httpMethod":"POST","sortWeight":"10"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("createRealTimeSensorData", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"createRealTimeSensorData","resource":[{"pattern":"/v1/assets/**/sensordata","httpMethod":"POST","sortWeight":"10"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("createServerMapping", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"createServerMapping","resource":[{"pattern":"/v1/assets/mapping","httpMethod":"POST","sortWeight":"10"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("deleteServerMapping", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"deleteServerMapping","resource":[{"pattern":"/v1/assets/mapping/**","httpMethod":"DELETE","sortWeight":"11"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("readAssetsByVROID", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"readAssetsByVROID","resource":[{"pattern":"/v1/assets/vrops/**","httpMethod":"GET","sortWeight":"1"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("updateServerMapping", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"updateServerMapping","resource":[{"pattern":"/v1/assets/mapping","httpMethod":"PUT","sortWeight":"10"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("mergeServerMapping", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"mergeServerMapping","resource":[{"pattern":"/v1/assets/mapping/merge/**","httpMethod":"PUT","sortWeight":"10"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("readUnMappedServers", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"readUnMappedServers","resource":[{"pattern":"/v1/assets/mapping/unmappedservers","httpMethod":"GET","sortWeight":"30"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("readMappingsByVROIDAndPage", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"readMappingsByVROIDAndPage","resource":[{"pattern":"/v1/assets/mapping/vrops/**/page/**/pagesize/**","httpMethod":"GET","sortWeight":"100"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("readMappingsByVCIDAndPage", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"readMappingsByVCIDAndPage","resource":[{"pattern":"/v1/assets/mapping/vc/**/page/**/pagesize/**","httpMethod":"GET","sortWeight":"100"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("createHostNameAndIPMapping", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"createHostNameAndIPMapping","resource":[{"pattern":"/v1/assets/mapping/hostnameip","httpMethod":"POST","sortWeight":"10"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("readHostNameAndIPMapping", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"readHostNameAndIPMapping","resource":[{"pattern":"/v1/assets/mapping/hostnameip/ip/**","httpMethod":"GET","sortWeight":"30"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("readAssetsByVCID", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"readAssetsByVCID","resource":[{"pattern":"/v1/assets/vc/**","httpMethod":"GET","sortWeight":"10"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("createFacilitySoftwareConfig", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"createFacilitySoftwareConfig","resource":[{"pattern":"/v1/facilitysoftware","httpMethod":"POST","sortWeight":"5"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("readFacilityByID", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"readFacilityByID","resource":[{"pattern":"/v1/facilitysoftware/**","httpMethod":"GET","sortWeight":"5"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("readFacilityByType", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"readFacilityByType","resource":[{"pattern":"/v1/facilitysoftware/type/**","httpMethod":"GET","sortWeight":"5"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("readInternalFacilityByID", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"readInternalFacilityByID","resource":[{"pattern":"/v1/facilitysoftware/internal/**","httpMethod":"GET","sortWeight":"10"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("readInternalFacilityByType", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"readInternalFacilityByType","resource":[{"pattern":"/v1/facilitysoftware/internal/type/**","httpMethod":"GET","sortWeight":"10"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("readFacilityByPage", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"readFacilityByPage","resource":[{"pattern":"/v1/facilitysoftware/page/**","httpMethod":"GET","sortWeight":"15"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("facilityServerSyncDataByServerId", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"facilityServerSyncDataByServerId","resource":[{"pattern":"/v1/facilitysoftware/syncdatabyserverid/**","httpMethod":"POST","sortWeight":"8"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("deleteFacilitySoftwareConfig", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"deleteFacilitySoftwareConfig","resource":[{"pattern":"/v1/facilitysoftware/**","httpMethod":"DELETE","sortWeight":"3"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("updateFacilitySoftwareConfig", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"updateFacilitySoftwareConfig","resource":[{"pattern":"/v1/facilitysoftware","httpMethod":"PUT","sortWeight":"3"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("updateFacilitySoftwareConfigStatus", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"updateFacilitySoftwareConfigStatus","resource":[{"pattern":"/v1/facilitysoftware/status","httpMethod":"PUT","sortWeight":"4"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("startFullMappingAggregation", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"startFullMappingAggregation","resource":[{"pattern":"/v1/jobs/mergeservermapping","httpMethod":"POST","sortWeight":"6"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("generateServerPDUMapping", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"generateServerPDUMapping","resource":[{"pattern":"/v1/jobs/pduservermapping","httpMethod":"POST","sortWeight":"6"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("syncHostnameByIp", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"syncHostnameByIp","resource":[{"pattern":"/v1/jobs/synchostnamebyip/**","httpMethod":"POST","sortWeight":"6"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("readVROJobs", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"readVROJobs","resource":[{"pattern":"/v1/jobs/vrojobs","httpMethod":"GET","sortWeight":"6"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("readVCJobs", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"readVCJobs","resource":[{"pattern":"/v1/jobs/vcjobs","httpMethod":"GET","sortWeight":"6"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("readJobByType", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"readJobByType","resource":[{"pattern":"/v1/jobs/type/**","httpMethod":"GET","sortWeight":"6"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("tempHumidityMapping", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"tempHumidityMapping","resource":[{"pattern":"/v1/jobs/temphumiditymapping/fullsync/**","httpMethod":"POST","sortWeight":"1"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("createSddcSoftwareConfig", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"createSddcSoftwareConfig","resource":[{"pattern":"/v1/sddc","httpMethod":"POST","sortWeight":"8"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("deleteSddcSoftwareConfig", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"deleteSddcSoftwareConfig","resource":[{"pattern":"/v1/sddc/**","httpMethod":"DELETE","sortWeight":"8"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("updateSddcSoftwareConfig", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"updateSddcSoftwareConfig","resource":[{"pattern":"/v1/sddc","httpMethod":"PUT","sortWeight":"8"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("updateSddcSoftwareConfigStatus", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"updateSddcSoftwareConfigStatus","resource":[{"pattern":"/v1/sddc/status","httpMethod":"PUT","sortWeight":"9"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("readSddcSoftwareConfigByID", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"readSddcSoftwareConfigByID","resource":[{"pattern":"/v1/sddc/**","httpMethod":"GET","sortWeight":"8"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("syncDataByServerId", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"syncDataByServerId","resource":[{"pattern":"/v1/sddc/syncdatabyserverid/**","httpMethod":"POST","sortWeight":"8"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("readVROByUser", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"readVROByUser","resource":[{"pattern":"/v1/sddc/user/vrops","httpMethod":"GET","sortWeight":"8"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("readSddcSoftwareConfigByVC", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"readSddcSoftwareConfigByVC","resource":[{"pattern":"/v1/sddc/vc","httpMethod":"GET","sortWeight":"8"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("readSddcSoftwareConfigByUserAndPage", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"readSddcSoftwareConfigByUserAndPage","resource":[{"pattern":"/v1/sddc/page/**","httpMethod":"GET","sortWeight":"12"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("readVROsSddcSoftwareConfigByUser", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"readVROsSddcSoftwareConfigByUser","resource":[{"pattern":"/v1/sddc/vrops","httpMethod":"GET","sortWeight":"8"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("readSddcSoftwareConfigByTypeAndUser", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"readSddcSoftwareConfigByTypeAndUser","resource":[{"pattern":"/v1/sddc/type/**","httpMethod":"GET","sortWeight":"10"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("createSensorSetting", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"createSensorSetting","resource":[{"pattern":"/v1/sensors/setting","httpMethod":"POST","sortWeight":"1"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("readSensorSettingByID", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"readSensorSettingByID","resource":[{"pattern":"/v1/sensors/setting/**","httpMethod":"GET","sortWeight":"6"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("readSensorSettingsByPage", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"readSensorSettingsByPage","resource":[{"pattern":"/v1/sensors/setting/page/**/pagesize/**","httpMethod":"GET","sortWeight":"10"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("updateSensorSetting", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"updateSensorSetting","resource":[{"pattern":"/v1/sensors/setting","httpMethod":"PUT","sortWeight":"2"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("deleteSensorSetting", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"deleteSensorSetting","resource":[{"pattern":"/v1/sensors/setting/**","httpMethod":"DELETE","sortWeight":"2"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("deleteUser", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"deleteUser","resource":[{"pattern":"/v1/auth/user/**","httpMethod":"DELETE","sortWeight":"1"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("updateUser", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"updateUser","resource":[{"pattern":"/v1/auth/user","httpMethod":"PUT","sortWeight":"3"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("readUserByID", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"readUserByID","resource":[{"pattern":"/v1/auth/user/**","httpMethod":"GET","sortWeight":"1"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("readUserByUserName", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"readUserByUserName","resource":[{"pattern":"/v1/auth/user/username/**","httpMethod":"GET","sortWeight":"10"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("readUserByPage", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"readUserByPage","resource":[{"pattern":"/v1/auth/user/page/**","httpMethod":"GET","sortWeight":"10"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("readUsers", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"readUsers","resource":[{"pattern":"/v1/auth/user/users","httpMethod":"GET","sortWeight":"3"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("createRole", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"createRole","resource":[{"pattern":"/v1/auth/role","httpMethod":"POST","sortWeight":"1"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("readRole", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"readRole","resource":[{"pattern":"/v1/auth/role/**","httpMethod":"GET","sortWeight":"1"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("readRolesByPage", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"readRolesByPage","resource":[{"pattern":"/v1/auth/role","httpMethod":"GET","sortWeight":"10"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("deleteRole", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"deleteRole","resource":[{"pattern":"/v1/auth/role/**","httpMethod":"DELETE","sortWeight":"1"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("updateRole", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"updateRole","resource":[{"pattern":"/v1/auth/role","httpMethod":"PUT","sortWeight":"1"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("readPrivileges", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"readPrivileges","resource":[{"pattern":"/v1/auth/privileges","httpMethod":"GET","sortWeight":"1"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("readSystemSummary", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"readSystemSummary","resource":[{"pattern":"/v1/summary/systemsummary","httpMethod":"GET","sortWeight":"1"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("Default_Access_Privilege", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"Default_Access_Privilege","resource":[{"pattern":"/v1/auth/logout","httpMethod":"GET","sortWeight":"1"},{"pattern":"/v1/auth/user","httpMethod":"POST","sortWeight":"1"},{"pattern":"/v1/auth/token","httpMethod":"POST","sortWeight":"1"},{"pattern":"/v1/auth/token/refresh","httpMethod":"GET","sortWeight":"1"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("readMappingsByVROID", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"readMappingsByVROID","resource":[{"pattern":"/v1/assets/mapping/vrops/**","httpMethod":"GET","sortWeight":"10"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("readMappingsByVCID", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"readMappingsByVCID","resource":[{"pattern":"/v1/assets/mapping/vc/**","httpMethod":"GET","sortWeight":"10"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("readAssetByAssetNameAndAssetNumber", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"readAssetByAssetNameAndAssetNumber","resource":[{"pattern":"/v1/assets/assetnumber**/assetname/**","httpMethod":"GET","sortWeight":"10"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("readPDUMetricsDataByAssetID", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"readPDUMetricsDataByAssetID","resource":[{"pattern":"/v1/assets/pdu/**/realtimedata","httpMethod":"GET","sortWeight":"10"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("readServerMetricsDataByAssetID", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"readServerMetricsDataByAssetID","resource":[{"pattern":"/v1/assets/server/**/realtimedata","httpMethod":"GET","sortWeight":"10"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("readServerMappingByID", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"readServerMappingByID","resource":[{"pattern":"/v1/assets/mapping/**","httpMethod":"GET","sortWeight":"10"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("mappingfacility", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"mappingfacility","resource":[{"pattern":"/v1/assets/mappingfacility","httpMethod":"PUT","sortWeight":"10"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("readHostNameAndIPMappingByPage", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"readHostNameAndIPMappingByPage","resource":[{"pattern":"/v1/assets/mapping/hostnameip","httpMethod":"GET","sortWeight":"5"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("deleteHostNameAndIPMappingByID", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"deleteHostNameAndIPMappingByID","resource":[{"pattern":"/v1/assets/mapping/hostnameip/**","httpMethod":"DELETE","sortWeight":"10"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("updateHostNameAndIPMappingByID", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"updateHostNameAndIPMappingByID","resource":[{"pattern":"/v1/assets/mapping/hostnameip","httpMethod":"PUT","sortWeight":"10"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("searchAssetName", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"searchAssetName","resource":[{"pattern":"/v1/assets/names/**","httpMethod":"GET","sortWeight":"100"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("batchCreateAssetIpMapping", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"batchCreateAssetIpMapping","resource":[{"pattern":"/v1/assets/mapping/hostnameip/file","httpMethod":"POST","sortWeight":"100"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("createFacilityAdapter", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"createFacilityAdapter","resource":[{"pattern":"/v1/facilityadapter","httpMethod":"POST","sortWeight":"10"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("updateFacilityAdapter", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"updateFacilityAdapter","resource":[{"pattern":"/v1/facilityadapter","httpMethod":"PUT","sortWeight":"10"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("readAnFacilityAdapterById", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"readAnFacilityAdapterById","resource":[{"pattern":"/v1/facilityadapter/**","httpMethod":"GET","sortWeight":"10"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("deleteAnFacilityAdapterById", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"deleteAnFacilityAdapterById","resource":[{"pattern":"/v1/facilityadapter/**","httpMethod":"DELETE","sortWeight":"10"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("readFacilityAdaptersByPage", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"readFacilityAdaptersByPage","resource":[{"pattern":"/v1/facilityadapter/pagenumber/**","httpMethod":"GET","sortWeight":"20"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("readAllFacilityAdapters", {"_class":"com.vmware.flowgate.common.model.PrivilegeResourceMapping","privilegeName":"readAllFacilityAdapters","resource":[{"pattern":"/v1/facilityadapter","httpMethod":"GET","sortWeight":"5"}]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("e1edca8a53794289827896a1aa5aec0f", {"_class":"com.vmware.flowgate.common.model.WormholeRole","roleName":"admin","privilegeNames":["readAllFacilityAdapters","createFacilityAdapter","updateFacilityAdapter","readAnFacilityAdapterById","deleteAnFacilityAdapterById","readFacilityAdaptersByPage","batchCreateAssetIpMapping","updateHostNameAndIPMappingByID","searchAssetName","readHostNameAndIPMappingByPage","deleteHostNameAndIPMappingByID","mappingfacility","readServerMappingByID","readPDUMetricsDataByAssetID","readServerMetricsDataByAssetID","readAssetByAssetNameAndAssetNumber","updateExpiredTimeRange","getExpiredTimeRange","cleanRealTimeDataByTimeRange","readAssetByPduIsNotNull","deleteServerMapping","readMappingsByVROID","readMappingsByVCID","readAssetBySource","updateFacilitySoftwareConfigStatus","updateSddcSoftwareConfigStatus","readSystemSummary","tempHumidityMapping","readUserByUserName","facilityServerSyncDataByServerId","syncDataByServerId","readVROByUser","readUnMappedServers","readAssetsByVCID","readPrivileges","createAnAsset","createAssets","readAsset","readAssetByAssetName","readAssetBySourceAndType","readAssetByType","readMappedAsset","readAssetByKeywords","readAssetByPduIsNull","updateAsset","deleteAsset","createRealTimeSensorDatas","createRealTimeSensorData","readServerSensorData","createServerMapping","readAssetsByVROID","updateServerMapping","mergeServerMapping","readMappingsByVROIDAndPage","readMappingsByVCIDAndPage","createHostNameAndIPMapping","createFacilitySoftwareConfig","readFacilityByID","readFacilityByType","readInternalFacilityByID","readInternalFacilityByType","readFacilityByPage","deleteFacilitySoftwareConfig","updateFacilitySoftwareConfig","startFullMappingAggregation","generateServerPDUMapping","syncHostnameByIp","readVROJobs","readVCJobs","readJobByType","createSddcSoftwareConfig","deleteSddcSoftwareConfig","updateSddcSoftwareConfig","readSddcSoftwareConfigByID","readSddcSoftwareConfigByVC","readSddcSoftwareConfigByUserAndPage","readVROsSddcSoftwareConfigByUser","readSddcSoftwareConfigByTypeAndUser","createSensorSetting","readSensorSettingByID","readSensorSettingsByPage","updateSensorSetting","deleteSensorSetting","readHostNameAndIPMapping","deleteUser","updateUser","readUserByID","readUserByPage","readUsers","createRole","readRole","readRolesByPage","deleteRole","updateRole","Default_Access_Privilege"]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("e1edca8a53002379827896a1bc2aec9i", {"_class":"com.vmware.flowgate.common.model.WormholeRole","roleName":"api","privilegeNames":["mappingfacility","readServerMappingByID","syncHostnameByIp","readPDUMetricsDataByAssetID","readServerMetricsDataByAssetID","readAssetByAssetNameAndAssetNumber","readAssetByPduIsNotNull","deleteServerMapping","readMappingsByVROID","readMappingsByVCID","readAssetBySource","updateSddcSoftwareConfigStatus","readVROByUser","readAssetsByVCID","readAsset","readAssetByAssetName","readAssetBySourceAndType","readAssetByType","readMappedAsset","readAssetByKeywords","readAssetByPduIsNull","createServerMapping","readAssetsByVROID","updateServerMapping","mergeServerMapping","readMappingsByVROIDAndPage","readMappingsByVCIDAndPage","createSddcSoftwareConfig","deleteSddcSoftwareConfig","updateSddcSoftwareConfig","readSddcSoftwareConfigByID","readSddcSoftwareConfigByVC","readSddcSoftwareConfigByUserAndPage","readVROsSddcSoftwareConfigByUser","readSddcSoftwareConfigByTypeAndUser","readHostNameAndIPMapping","Default_Access_Privilege","readInternalFacilityByID","readInternalFacilityByType"]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("e1gyha7u84722379827896a1aa59mise", {"_class":"com.vmware.flowgate.common.model.WormholeRole","roleName":"user","privilegeNames":["mappingfacility","readServerMappingByID","deleteServerMapping","readPrivileges","updateSddcSoftwareConfigStatus","updateUser","syncDataByServerId","readUserByUserName","readVROByUser","readAssetsByVCID","readAsset","readAssetByAssetName","readAssetBySourceAndType","readAssetByType","readMappedAsset","readAssetByKeywords","readAssetByPduIsNull","createServerMapping","readAssetsByVROID","updateServerMapping","mergeServerMapping","readMappingsByVROIDAndPage","readMappingsByVCIDAndPage","createSddcSoftwareConfig","deleteSddcSoftwareConfig","updateSddcSoftwareConfig","readSddcSoftwareConfigByID","readSddcSoftwareConfigByVC","readSddcSoftwareConfigByUserAndPage","readVROsSddcSoftwareConfigByUser","readSddcSoftwareConfigByTypeAndUser","Default_Access_Privilege"]});
INSERT INTO flowgate (KEY, VALUE) VALUES ("e1edfv8953002379827896a1aaiqoose", {"_class":"com.vmware.flowgate.common.model.WormholeUser","userName":"admin","password":"$2a$10$FZKc/4rF0.QWyxNiFyFyzO9CQPQ0NiggFS2BqmQw2M.biqOVH5/wu", "roleNames" : [ "admin" ]});
