package egovframework.ntrms.kr.co.brn.sd.service;

import java.util.List;
import java.util.Map;

import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;


@SuppressWarnings("unchecked")
public interface RTSDCustRegisterService {
	String safeKeyConfirm(Map<String, Object> inVar) throws Exception;
	String countSafeKey(Map<String, Object> inVar) throws Exception;
	Map saveSafeKey(Map <String, Object> inVar) throws Exception;
	int checkBuslNo(Map<String, Object> inVar) throws Exception;
	Map saveCustRegister(Map<String, DataSetMap> inDataset, Map <String, Object> inVar) throws Exception;
	Map getaccList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map saveAccData(Map<String, DataSetMap> inDataset, Map <String, Object> inVar) throws Exception;
	Map getcardList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map saveCardData(Map<String, DataSetMap> inDataset, Map <String, Object> inVar) throws Exception;
	Map selectRtsd0110(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map selectRtsd0111(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map selectRtsd0111_2(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map insertRtsd0110(Map<String, DataSetMap> inDataset, Map <String, Object> inVar) throws Exception;
	/*******************************
	 * IR전문통신이력 Service
	 *******************************/
	Map createIRSafeKey(Map<String, Object> inVar) throws Exception;
	Map createNiceTrust(Map<String, Object> inVar) throws Exception;
	Map searchTodayNiceData(Map<String, Object> inVar) throws Exception;
	Map createNice0202(Map<String, Object> inVar) throws Exception;
	
	String onlineEnterdupe(Map<String, Object> inVar) throws Exception;
	int onlineDupe(Map<String, Object> inVar) throws Exception;
	
	Map saveSmsMsg(Map<String, Object> inVar) throws Exception;
	
	List<Map> getReRentalInfo(Map <String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;
	
	void beforeCheckEmpInfo(Map <String, Object> inVar) throws Exception;
}