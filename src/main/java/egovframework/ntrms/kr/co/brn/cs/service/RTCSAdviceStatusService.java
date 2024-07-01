/************************************************************************************
 * 
 * 1.Program  			: Common DataSet Service
 * 2.File Name			: RTCSAdviceStatusService.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.cs.service;

import java.util.List;
import java.util.Map;

import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;

@SuppressWarnings("unchecked")

public interface RTCSAdviceStatusService {

	Map listAdvice(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map listmessage(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map listmessage2(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map listProvisionalContract2(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map saveAdvice(Map<String, DataSetMap> inDataset, Map <String, Object> inVar) throws Exception;
	Map saveAdviceCust(Map<String, DataSetMap> inDataset, Map <String, Object> inVar) throws Exception;
	Map AdvicelistInstall(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	List<Map> selectAdviceCallList(Map<String, Object> inVar) throws Exception;
	Map listcontractInfo(Map<String, Object> inVar) throws Exception;
	List<Map> AdviceCallList(Map<String, Object> inVar) throws Exception;
}
