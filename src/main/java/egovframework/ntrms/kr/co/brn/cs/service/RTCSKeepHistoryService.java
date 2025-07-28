package egovframework.ntrms.kr.co.brn.cs.service;

import java.util.Map;

import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;

@SuppressWarnings("unchecked")
public interface RTCSKeepHistoryService {
	Map selectRTCSKeepHistory(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map pSRtcs0202UseAgencyWareh(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map saveRtcs0203WinterIn(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;
	Map saveRtcs0203WinterOut(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;
	Map sRtcs0203FilePathName(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
}
