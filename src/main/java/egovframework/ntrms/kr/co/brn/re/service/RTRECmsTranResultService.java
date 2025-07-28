/************************************************************************************
 * 
 * 1.Program  			: Common DataSet Service
 * 2.File Name			: RTRECmsTranResultService.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.re.service;

import java.util.Map;

import egovframework.ntrms.kr.co.brn.exception.NtRmsDaoException;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;

@SuppressWarnings("unchecked")
public interface RTRECmsTranResultService {
	//출금이체결과처리 결과파일반영
	Map makeFileData(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;
	//CMS수납처리
	Map cmsTranReceipt(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;
	//CMS수납처리완료여부
	Map cmsTranEnd(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws NtRmsDaoException;
}
