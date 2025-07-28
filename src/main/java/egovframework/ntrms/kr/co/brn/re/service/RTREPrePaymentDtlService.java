/************************************************************************************
 * 1.Program  			: Common DataSet Service
 * 2.File Name			: RTREPrePaymentDtlService.java
 * 3.Developer			: ncho
 * 4.Development Date	: 2018.12.18
 * 5.Version			: 0.1
 * 6.Note				: 
 * 7.History			: 
 ************************************************************************************/

package egovframework.ntrms.kr.co.brn.re.service;

import java.util.Map;

import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;

public interface RTREPrePaymentDtlService {
	@SuppressWarnings("rawtypes")
	/* 선납내역조회 */
	Map retrievePrePaymentMstList(Map<String, Object> mapInVar, Map<String, DataSetMap> mapOutDSM) throws Exception;
	
	@SuppressWarnings("rawtypes")
	/* 선납내역상세조회 */
	Map retrievePrePaymentDtlList(Map<String, Object> mapInVar, Map<String, DataSetMap> mapOutDSM) throws Exception;
	
	@SuppressWarnings("rawtypes")
	/* 선납할인금액계산 */
	Map prePymntDscntAmtCalc(Map<String, Object> mapInVar, Map<String, DataSetMap> mapOutDSM) throws Exception;
}