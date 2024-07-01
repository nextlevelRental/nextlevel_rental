/************************************************************************************
 * 1.Program  			: Common DataSet Service
 * 2.File Name			: RTREPaymentCommService.java
 * 3.Developer			: ncho
 * 4.Development Date	: 2018.12.10
 * 5.Version			: 0.1
 * 6.Note				: 
 * 7.History			: 
 ************************************************************************************/

package egovframework.ntrms.kr.co.brn.re.service;

import java.util.Map;

import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;

public interface RTREPaymentCommService {
	/* 카드즉시출금결제 저장 */
	Map<String, Object> saveCrdImmWthdrPayment(Map<String, DataSetMap> mapInDSM, Map<String, Object> mapInVar) throws Exception;
	
	/* 카드즉시출금결제이력 저장 */
	Map<String, Object> saveCardPaymentHst(Map<String, DataSetMap> mapInDSM, Map<String, Object> mapInVar) throws Exception;
	
	/* 카드즉시출금취소 저장 */
	Map<String, Object> saveCrdImmWthdrCancel(Map<String, DataSetMap> mapInDSM, Map<String, Object> mapInVar) throws Exception;
	
	/* 카드 선수납처리 */
	Map<String, Object> crdPartClear(Map<String, DataSetMap> mapInDSM, Map<String, Object> mapInVar) throws Exception;
	
	/* 계좌 선수납처리 */
	Map<String, Object> accPartClear(Map<String, DataSetMap> mapInDSM, Map<String, Object> mapInVar) throws Exception;
	
	/* 카드즉시출금취소이력 저장 */
	Map<String, Object> saveCardCancelHst(Map<String, DataSetMap> mapInDSM, Map<String, Object> mapInVar) throws Exception;
	
	/* 계좌즉시출금결제 저장 */
	Map<String, Object> saveAccImmWthdrPayment(Map<String, DataSetMap> mapInDSM, Map<String, Object> mapInVar) throws Exception;
	
	/* 계좌즉시출금결제이력 저장 */
	Map<String, Object> saveAccImmWthdrPaymentHst(Map<String, DataSetMap> mapInDSM, Map<String, Object> mapInVar) throws Exception;
	
	/* 계좌즉시출금취소 저장 */
	Map<String, Object> saveAccImmWthdrCancel(Map<String, DataSetMap> mapInDSM, Map<String, Object> mapInVar) throws Exception;
	
	/* 계좌즉시출금취소이력 저장 */
	Map<String, Object> saveAccCancelHst(Map<String, DataSetMap> mapInDSM, Map<String, Object> mapInVar) throws Exception;
	
	/* 가상계좌발급 */
	Map<String, Object> vaccIssued(Map<String, DataSetMap> mapInDSM, Map<String, Object> mapInVar) throws Exception;
}