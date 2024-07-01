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

public interface RTREChargeSendService {
	@SuppressWarnings("rawtypes")
	/* 벤더정보등록 */
	Map saveVendorList(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;
	/* 수수료정보등록 */
	Map saveChargeList(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;
	/* SMS생성 */
	Map aggregateSms(Map<String, Object> inVar) throws Exception;
	/* SMS발송 */
	Map saveSendSms(Map<String, Object> inVar) throws Exception;
}