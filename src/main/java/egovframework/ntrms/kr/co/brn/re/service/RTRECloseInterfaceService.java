package egovframework.ntrms.kr.co.brn.re.service;

import java.util.Map;

import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;

@SuppressWarnings("unchecked")
public interface RTRECloseInterfaceService {
	Map rTRECloseInterfaceList(Map<String, Object> inVar) throws Exception;
	
	Map ifRTRECloseSendEai(Map<String, Object> inVar) throws Exception;
	
	Map <String, Object> updateCloseInterfaceResult(Map<String, Object> inVar) throws Exception;
	
	Map <String, Object> aggregateData(Map<String, Object> inVar) throws Exception;
	
	Map <String, Object> createEAIList(Map<String, Object> inVar) throws Exception;
}