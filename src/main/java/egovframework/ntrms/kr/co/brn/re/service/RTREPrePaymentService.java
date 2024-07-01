/************************************************************************************
 * 1.Program  			: Common DataSet Service
 * 2.File Name			: RTREPrePaymentService.java
 * 3.Developer			: ncho
 * 4.Development Date	: 2018.12.10
 * 5.Version			: 0.1
 * 6.Note				: 
 * 7.History			: 
 ************************************************************************************/

package egovframework.ntrms.kr.co.brn.re.service;

import java.util.Map;

import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;

public interface RTREPrePaymentService {
	@SuppressWarnings("rawtypes")
	/* 선납개월 선택항목 조회 */
	Map retrievePrptMonList(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception;
	
	@SuppressWarnings("rawtypes")
	/* 선납금액계산 */
	Map retrievePrePymntAmtCalc(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception;
	
	@SuppressWarnings("rawtypes")
	/* 납부예정상세 조회 */
	Map retrievePymntSchdlDtlList(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception;
	
	/* 선납할인가능여부체크 */
	Map checkPrePaymentAbleYn(Map<String, Object> inVar) throws Exception;
}