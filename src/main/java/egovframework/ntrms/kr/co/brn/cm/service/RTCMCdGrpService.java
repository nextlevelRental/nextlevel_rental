package egovframework.ntrms.kr.co.brn.cm.service;

import java.util.Map;

import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;

@SuppressWarnings("unchecked")
public interface RTCMCdGrpService {
	Map listCdGrp(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map listCdGrpChild(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	int cdGrpCdOverlapConfirm(Map<String, Object> inVar) throws Exception;
	Map saveCdGrp(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;
	int checkCd(Map<String, Object> inVar) throws Exception;
}