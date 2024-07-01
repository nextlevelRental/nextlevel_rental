/************************************************************************************
 * 
 * 1.Program  			: Common DataSet Service
 * 2.File Name			: RTREAccReqProcService.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.re.service;

import java.util.Map;

import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;

@SuppressWarnings("unchecked")
public interface RTREAccReqProcService {
	String getAccReqDate(Map<String, Object> inVar) throws Exception;
	String getPayChgDate(Map<String, Object> inVar) throws Exception;
	Map getAccReqTargetList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map confirmProc(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;
	Map setAggregate(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;
	Map accReqMakeData(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;
	Map accReqMakeLData(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;
}
