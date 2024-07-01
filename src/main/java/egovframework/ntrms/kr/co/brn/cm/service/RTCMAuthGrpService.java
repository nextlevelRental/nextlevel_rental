/************************************************************************************
 * 1.Program  			: Common DataSet Service Implement
 * 2.File Name			: RTCMAuthGrpService.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/
package egovframework.ntrms.kr.co.brn.cm.service;

import java.util.Map;

import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;

@SuppressWarnings("unchecked")
public interface RTCMAuthGrpService {
	Map listAuthGrp(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map saveAuthGrp(Map<String, DataSetMap> inDataset, Map <String, Object> inVar) throws Exception;
	int checkAuthGrpCd(Map<String, Object> inVar) throws Exception;
}