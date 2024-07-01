/************************************************************************************
 * 1.Program  			: Common DataSet Service
 * 2.File Name			: RTREAccImmWthdrDtlService.java
 * 3.Developer			: ncho
 * 4.Development Date	: 2018.11.05
 * 5.Version			: 0.1
 * 6.Note				: 
 * 7.History			: 
 ************************************************************************************/

package egovframework.ntrms.kr.co.brn.re.service;

import java.util.Map;

import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;

public interface RTREAccImmWthdrDtlService {
	@SuppressWarnings("rawtypes")
	Map retrieveAccImmWthdrList(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception;
	
	@SuppressWarnings("rawtypes")
	Map retrieveAccImmWthdrDtlList(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception;
}