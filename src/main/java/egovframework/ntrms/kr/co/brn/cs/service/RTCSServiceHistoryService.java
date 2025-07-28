package egovframework.ntrms.kr.co.brn.cs.service;

import java.util.Map;

import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;


@SuppressWarnings("unchecked")
public interface RTCSServiceHistoryService {
	Map serviceHistoryList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map saveRTCS0008(Map<String, Object> inVar) throws Exception;
}
