package egovframework.ntrms.kr.co.brn.sd.service;

import java.util.Map;

import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;

@SuppressWarnings("unchecked")
public interface RTSDArrivalAlarmListService {
	Map selectArrivalAlarmList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map aggregateArrivalAlarmList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map sendArrivalAlarmList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map saveArrivalAlarmList(Map <String, DataSetMap> mapInDSM, Map <String, Object> mapInVar) throws Exception;
	Map selectArrivalAlarmHistList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map renewArrivalAlarmList(Map <String, DataSetMap> mapInDSM, Map <String, Object> mapInVar) throws Exception;
	Map selectArrivalAlarmByLogisticsList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map getLogisticsStatus(String sendUrl, Map <String, Object> settingMap, Map <String, Object> paramMap) throws Exception;
	Map getLogistics(String sendUrl, Map <String, Object> settingMap, Map <String, Object> paramMap) throws Exception;
	Map processLogistics(Map<String, Object> inVar) throws Exception;
	Map batchLogisticsStatus(Map<String, Object> inVar) throws Exception;
	String getLogisticsCodeName(Map<String, Object> inVar) throws Exception;
	String getLogisticsCode(Map<String, Object> inVar) throws Exception;
}
