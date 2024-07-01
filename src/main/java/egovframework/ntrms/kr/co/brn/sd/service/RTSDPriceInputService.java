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

public interface RTSDPriceInputService {
	Map listPriceInfo(Map<String, Object> inVar) throws Exception;
	Map listProductAndPriceInfo(Map<String, Object> inVar) throws Exception;
	Map savePriceInfo(Map<String, DataSetMap> inDataset, Map <String, Object> inVar) throws Exception;
}
