/************************************************************************************
 * 
 * 1.Program  			: Common DataSet Service
 * 2.File Name			: RTREAccResultService.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.re.service;

import java.util.Map;

import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;

@SuppressWarnings("unchecked")
public interface RTREAccResultService {
	//결과파일 반영조회
	Map getAccResultList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;	
	//결과파일 반영
	Map saveFileMakeData(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;
	//계촤신청 결과반영(회사접수분)
	Map accReqResultApplyA(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;
	//계촤신청 결과반영(은행접수분)
	Map accReqResultApplyB(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;
	//계촤신청 결과반영(은행접수분) 파일생성
	Map makeFileApplyB(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;
}
