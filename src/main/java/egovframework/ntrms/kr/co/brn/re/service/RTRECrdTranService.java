/************************************************************************************
 * 
 * 1.Program  			: Common DataSet Service
 * 2.File Name			: RTRECrdTranService.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.re.service;

import java.util.Map;

import egovframework.ntrms.kr.co.brn.exception.NtRmsDaoException;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;

@SuppressWarnings("unchecked")
public interface RTRECrdTranService {
	//카드이체조회(계약번호별 내역조회)
	Map getCrdTranOrdNoList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	//카드이체조회(카드사별 내역조회)
	Map getCrdTranCardList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	//카드이체 대상집계
	Map crdTranAggregate(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;
	//카드이체대상 조회
	Map getCrdTranTargetList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	//카드이체 결과파일 반영
	Map crdMakeFileData(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;
	//카드이체수납처리
	Map crdTranReceipt(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;
	//카드이체처리 파일생성
	Map crdTranMakeData(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;
	//카드이체처리 완료여부
	Map crdTranEnd(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws NtRmsDaoException;
	//access token 신규 발급
	Map getAccessToken(String sendUrl, Map<String, Object> paramMap) throws NtRmsDaoException;
	//파일 생성
	Map exportFile(String sendUrl, Map<String, Object> paramMap) throws NtRmsDaoException;
	//파일 업로드
	Map upanddownKCP(String sendUrl, Map<String, Object> paramMap) throws NtRmsDaoException;
	
}
