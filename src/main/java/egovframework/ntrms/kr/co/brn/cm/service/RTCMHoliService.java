package egovframework.ntrms.kr.co.brn.cm.service;

import java.util.Map;

import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;


@SuppressWarnings("unchecked")
public interface RTCMHoliService {
	Map listHoli(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map saveHoli(Map<String, DataSetMap> inDataset, Map <String, Object> inVar) throws Exception;
	int checkHDate(Map<String, Object> inVar) throws Exception;
}