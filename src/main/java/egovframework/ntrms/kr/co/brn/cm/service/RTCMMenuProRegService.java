/************************************************************************************
 * 
 * 1.Program  			: Common DataSet Service
 * 2.File Name			: RTCMMenuService.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.cm.service;

import java.util.List;
import java.util.Map;

import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;

@SuppressWarnings("unchecked")
public interface RTCMMenuProRegService {
	Map listTreeMenu(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map listMenu(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map saveMenuInfo(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;
	Map listMenuAuthPro(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map listMenuAuthNotPro(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
}
