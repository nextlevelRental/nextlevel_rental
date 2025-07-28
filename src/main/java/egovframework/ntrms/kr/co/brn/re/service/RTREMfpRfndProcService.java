/************************************************************************************
 * 1.Program  			: Common DataSet Service
 * 2.File Name			: RTREMfpRfndProcService.java
 * 3.Developer			: ncho
 * 4.Development Date	: 2018.12.21
 * 5.Version			: 0.1
 * 6.Note				: 
 * 7.History			: 
 ************************************************************************************/

package egovframework.ntrms.kr.co.brn.re.service;

import java.util.Map;

import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;

public interface RTREMfpRfndProcService {
	@SuppressWarnings("rawtypes")
	/* 중도완납환불대상내역조회 */
	Map retrieveMfpRfndTrgtList(Map<String, Object> mapInVar, Map<String, DataSetMap> mapOutDSM) throws Exception;
	
}