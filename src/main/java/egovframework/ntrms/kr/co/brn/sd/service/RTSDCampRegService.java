/************************************************************************************
 * 
 * 1.Program  			: Common DataSet Service
 * 2.File Name			: RTCMUserService.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.sd.service;

import java.util.List;
import java.util.Map;

import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;

@SuppressWarnings("unchecked")

public interface RTSDCampRegService {
	
	Map listProductInfo(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map listCampRegInfo(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	int countRegInfo(Map<String, Object> inVar) throws Exception;
	Map saveCampRegData(Map<String, DataSetMap> inDataset, Map <String, Object> inVar) throws Exception;
	int countNext(Map<String, Object> inVar) throws Exception;
	int updateBeFore(Map <String, Object> inVar) throws Exception;
	
}
