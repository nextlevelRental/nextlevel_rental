/************************************************************************************
 * 
 * 1.Program  			: Common DataSet Service
 * 2.File Name			: RTCSRegisterService.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.cs.service;

import java.util.List;
import java.util.Map;

import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;

@SuppressWarnings("unchecked")

public interface RTCSRegisterService {
	List<Map> getRegisterList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	List<Map> getRegisterInfo(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map getListQuestion(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	List<Map> getListAnswer(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map saveRegisterInfo(Map<String, DataSetMap> inDataset, Map inVar) throws Exception;
	List<Map> sRtcs0100ServiceHistory(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
}
