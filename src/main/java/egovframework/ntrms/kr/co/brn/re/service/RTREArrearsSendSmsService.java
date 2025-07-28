/************************************************************************************
 * 1.Program  			: Common DataSet Service
 * 2.File Name			: RTREArrearsPaymentService.java
 * 3.Developer			: ncho
 * 4.Development Date	: 2018.11.12
 * 5.Version			: 0.1
 * 6.Note				: 
 * 7.History			: 
 ************************************************************************************/

package egovframework.ntrms.kr.co.brn.re.service;

import java.util.Map;

import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;

public interface RTREArrearsSendSmsService {
	@SuppressWarnings("rawtypes")
	/* 당월연체대상집계 */
	Map arrSendAggregate(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception;
	/* 당월연체대상 특정내역 삭제 */
	Map arrAggregateDelete(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception;
	/* 당월연체대상 count */
	int arrSendAggregateCnt(Map<String, Object> inVar) throws Exception;
	/* 당월연체 SMS발송대상 집계 */
	Map arrSmsAggregate(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception;
	/* 당월연체대상 SMS발송 */
	Map arrSendSms(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception;
}