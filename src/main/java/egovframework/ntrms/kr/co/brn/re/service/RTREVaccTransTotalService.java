/************************************************************************************
 * 1.Program  			: Common DataSet Service
 * 2.File Name			: RTREVaccTransTotalService.java
 * 3.Developer			: ncho
 * 4.Development Date	: 2018.11.02
 * 5.Version			: 0.1
 * 6.Note				: 
 * 7.History			: 
 ************************************************************************************/

package egovframework.ntrms.kr.co.brn.re.service;

import java.util.Map;

import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;

public interface RTREVaccTransTotalService {
	@SuppressWarnings("rawtypes")
	Map retrieveVaccTransTotalList(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception;
}