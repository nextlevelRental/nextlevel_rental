/************************************************************************************
 * 1.Program  			: Common DataSet Service
 * 2.File Name			: RTREFullPayRehisSearchService.java
 * 3.Developer			: sunq
 * 4.Development Date	: 2018.12.07
 * 5.Version			: 0.1
 * 6.Note				: 
 * 7.History			: 
 ************************************************************************************/
package egovframework.ntrms.kr.co.brn.re.service;

import java.util.Map;

import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;

public interface RTREFullPayRehisSearchService {
	
	/**
	 * <pre>
	 * 중도완납/해지 내역조회 서비스 메소드
	 * </pre>
	 * @param inVar
	 * @param outDataset
	 * @return
	 * @throws Exception
	 */
	Map<String, Object> getFullPayRehisSearchSVC(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception;
	
	/**
	 * <pre>
	 * 공통코드 사용자 그룹 목록 조회 서비스 메소드
	 * </pre>
	 * @param inVar
	 * @param outDataset
	 * @return
	 * @throws Exception
	 */
	Map<String, Object> getCommUserGroupCodeListSVC(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception;
}
