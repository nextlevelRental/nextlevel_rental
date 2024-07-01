/************************************************************************************
 * 1.Program  			: Common DataSet Service
 * 2.File Name			: RTREVaccMangService.java
 * 3.Developer			: ncho
 * 4.Development Date	: 2018.11.06
 * 5.Version			: 0.1
 * 6.Note				: 
 * 7.History			: 
 ************************************************************************************/

package egovframework.ntrms.kr.co.brn.re.service;

import java.util.Map;

import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;

public interface RTREVaccMangService {
	/* 가상계좌 현황 조회 */
	@SuppressWarnings("rawtypes")
	Map retrieveVaccMangList(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception;
	
	/* 기간만료계좌정리 */
	@SuppressWarnings("rawtypes")
	Map prdExprArngm(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;
}