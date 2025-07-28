/************************************************************************************
 * 
 * 1.Program  			: Common DataSet Service
 * 2.File Name			: RTREClosingMngService.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.re.service;

import java.util.Map;

import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;

@SuppressWarnings("unchecked")
public interface RTREClosingMngService {
	//선수금 내역
	Map getPrePayList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	//선수금 정리 내역
	Map getPrePayArrangeList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	//선수금 관리 정리
	Map prePayArrange(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;
	//선수금 관리 정리취소
	Map prePayArrangeCancel(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;
	//선수금 관리 집계
	Map prePaymentAggregate(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;
	//자산별 매출원가 취득처리 집계
	Map acquisitionAggregate(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;	
	//이연처리 변경대상 적용 집계
	Map deferChgTargetAggregate(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;	
	//렌탈등록비 이연처리 집계
	Map deferProcAggregate(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;	
	//선수내역 집계
	Map prePaymentHistAggregate(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;	
	//선수금 환불 처리
	Map prePayRefund(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;
	
}
