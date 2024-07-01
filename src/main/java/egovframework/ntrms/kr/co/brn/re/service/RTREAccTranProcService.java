/************************************************************************************
 * 
 * 1.Program  			: Common DataSet Service
 * 2.File Name			: RTREAccTranProcService.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.re.service;

import java.util.Map;

import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;

@SuppressWarnings("unchecked")
public interface RTREAccTranProcService {
	//출금이체처리 대상조회
	Map getAccTranTargetList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	//출금이체처리 집계
	Map tranAggregate(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;
	//출금이체처리 파일생성
	Map accTranMakeData(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;
}
