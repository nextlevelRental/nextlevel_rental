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

public interface RTCSInboundService {
	List<Map> getInboundList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map qmsList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
}
