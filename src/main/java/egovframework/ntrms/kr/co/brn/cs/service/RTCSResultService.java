/************************************************************************************
 * 
 * 1.Program  			: Common DataSet Service
 * 2.File Name			: RTCSResultService.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.cs.service;

import java.util.List;
import java.util.Map;

import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;

@SuppressWarnings("unchecked")

public interface RTCSResultService {
	List<Map> getResultList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	List<Map> getListQustAns(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
}
