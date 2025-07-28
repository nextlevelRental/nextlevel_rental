/************************************************************************************
 * 1.Program  			: Common DataSet Service
 * 2.File Name			: RTREMiddleFullPaymentService.java
 * 3.Developer			: kstka
 * 4.Development Date	: 2018.10.10
 * 5.Version			: 0.2
 * 6.Note				: 
 * 7.History			: ncho - 2018.12.10 - 수납공통 > 중도완납수납 개발
 ************************************************************************************/
package egovframework.ntrms.kr.co.brn.re.service;

import java.util.Map;

import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;

public interface RTREMiddleFullPaymentService {
	/* 납부예정금액 조회 */
	@SuppressWarnings("rawtypes")
	Map pSrtsd0109CancelList(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception;
	
	/* 결제정보 저장 */
	@SuppressWarnings("rawtypes")
	Map cancelSave(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;
}