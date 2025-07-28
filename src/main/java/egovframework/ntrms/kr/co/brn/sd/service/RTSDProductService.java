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

public interface RTSDProductService {
	Map detailProductInfo(Map<String, Object> inVar) throws Exception;
	Map saveProductInfo(Map<String, DataSetMap> inDataset, Map <String, Object> inVar) throws Exception;
	Map saveOrderNo(Map<String, DataSetMap> inDataset, Map <String, Object> inVar) throws Exception;
	Map TopMenuNoList(Map<String, Object> inVar) throws Exception;
	Map TopMenuNoList2(Map<String, Object> inVar) throws Exception;
	Map saveOrderNo2(Map<String, DataSetMap> inDataset, Map <String, Object> inVar) throws Exception;
}
