/************************************************************************************
 * 
 * 1.Program  			: Common DataSet Service
 * 2.File Name			: RTCSCounselorService.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.cs.service;

import java.util.List;
import java.util.Map;

import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;

@SuppressWarnings("unchecked")

public interface RTCSCounselorService {
	List<Map> getCounselorList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	List<Map> selectCounselorMasterList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map saveCounselorInfo(Map<String, DataSetMap> inDataset, Map inVar) throws Exception;
	Map saveCounselorMaster(Map<String, DataSetMap> inDataset, Map inVar) throws Exception;
}
