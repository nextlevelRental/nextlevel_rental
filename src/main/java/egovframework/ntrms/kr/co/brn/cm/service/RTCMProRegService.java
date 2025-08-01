/************************************************************************************
 * 
 * 1.Program  			: Common DataSet Service
 * 2.File Name			: RTCMUserService.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.cm.service;

import java.util.List;
import java.util.Map;

import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;

@SuppressWarnings("unchecked")

public interface RTCMProRegService {
	List<Map> getGrpRegList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	
	Map proRegSaveDaset(Map<String, DataSetMap> inDataset,Map <String, Object> inVar ) throws Exception;
	
	List<Map> authGroupProList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	
	List<Map> authGroupProNotList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
}
