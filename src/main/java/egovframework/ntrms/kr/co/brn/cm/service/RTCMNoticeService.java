/************************************************************************************
 * 
 * 1.Program  			: Common DataSet Service
 * 2.File Name			: RTCMUserService.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.cm.service;

import java.util.Map;

import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;

@SuppressWarnings("unchecked")
public interface RTCMNoticeService {
	Map listNoticeInfo(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map setDetailNoticeInfo(Map<String, Object> inVar, Map <String, DataSetMap> inDataset) throws Exception;
	Map saveNoticeInfo(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;
	
	Map fileInfo(Map<String, Object> inVar) throws Exception;
}
