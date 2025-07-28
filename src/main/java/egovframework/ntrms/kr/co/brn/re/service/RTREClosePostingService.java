package egovframework.ntrms.kr.co.brn.re.service;

import java.util.Map;

import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;

@SuppressWarnings("unchecked")
public interface RTREClosePostingService {
	Map rTREClosePostingList(Map<String, Object> inVar) throws Exception;
	
	Map ifRTRECloseSendEai(Map<String, Object> inVar) throws Exception;
	
	Map aggregatePostingData(Map<String, Object> inVar) throws Exception;
	
	Map <String, Object> updatePostInterfaceResult(Map<String, Object> inVar) throws Exception;
	
}