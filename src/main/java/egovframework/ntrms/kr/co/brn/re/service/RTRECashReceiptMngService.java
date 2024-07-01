/************************************************************************************
 * 
 * 1.Program  			: Common DataSet Service
 * 2.File Name			: RTRECashReceiptMngService.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.re.service;

import java.util.Map;

import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;

@SuppressWarnings("unchecked")
public interface RTRECashReceiptMngService {
	Map getCashReceiptTargetList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map cashReceiptAggregate(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;
	Map cashReceiptMakeData(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;
	Map cashReceiptResultFileUpload(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;
	Map cashReceiptProc(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;
	Map getSndRcvList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map getCashReceiptList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map cashReceiptsRegister(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map cashReceiptsRegisterOut(Map<String, DataSetMap> inDataset, Map <String, Object> inVar) throws Exception;
}
