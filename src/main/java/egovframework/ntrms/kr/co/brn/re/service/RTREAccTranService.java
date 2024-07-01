/************************************************************************************
 * 
 * 1.Program  			: Common DataSet Service
 * 2.File Name			: RTREAccTranService.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.re.service;

import java.util.Map;

import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;

@SuppressWarnings("unchecked")
public interface RTREAccTranService {
	Map getAccTranOrdNoList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map getAccTranBankList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
}
