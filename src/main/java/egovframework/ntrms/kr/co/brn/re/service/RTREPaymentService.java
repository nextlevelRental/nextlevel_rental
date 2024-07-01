/************************************************************************************
 * 
 * 1.Program  			: Common DataSet Service
 * 2.File Name			: RTREPaymentService.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.re.service;

import java.util.Map;

import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;

@SuppressWarnings("unchecked")
public interface RTREPaymentService {
	Map listPayInfo(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map listPaymentHist(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map savePaymentInfo(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;
	Map delPaymentInfo(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;
	Map listTodayCmsInfos(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
}
