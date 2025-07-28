/************************************************************************************
 * 
 * 1.Program  			: Common DataSet Service
 * 2.File Name			: RTREBondMngService.java
 * 3.Version			: 0.1
 * 4.Note				: 채권관리
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.re.service;

import java.util.Map;

import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;

@SuppressWarnings("unchecked")
public interface RTREBondMngService {
	//연체내역 조회
	Map getArrearsList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	//연체대상 집계내역 count
	int delyAggregateCnt(Map<String, Object> inVar) throws Exception;	
	//연체대상 집계
	Map delyAggregate(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;
	//채권 관리 내역 Count
	int bondTargetAggregateCnt(Map<String, Object> inVar) throws Exception;
	//채권관리대상 집계
	Map bondTargetAggregate(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;
	//채권계정내역 조회
	Map getBondList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;	
	//계약별내역 조회
	Map getBondByOrdList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;	
	//채권컨택내역 조회
	Map getContactList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;	
	//채권추심관리내역 등록/수정/삭제
	Map saveContactInfo(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;
	//첨부파일 조회
	Map getFileInfo(Map<String, Object> inVar, Map <String, DataSetMap> inDataset) throws Exception;
	//계약번호별 연체내역 조회
	Map getArrearsResultList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	//방문별 서비스 조회
	Map visitorService(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	
	Map visitorService2(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;

	Map saveVisitorService(Map<String, DataSetMap> inDataset, Map inVar) throws Exception;
	//수수료 콤보박스
	Map listSusuInfo(Map<String, Object> inVar) throws Exception;
	//인센티브 조회
	Map selectInsentiveList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	//인센티브 저장
	Map saveInsentive(Map<String, DataSetMap> inDataset, Map inVar) throws Exception;
	//연체내역 백업
	Map processArrears(Map<String, DataSetMap> inDataset, Map inVar) throws Exception;
	//연체내역 백업
	Map backupArrears(Map<String, DataSetMap> inDataset, Map inVar) throws Exception;
	//연체내역 롤백
	Map rollbackArrears(Map<String, DataSetMap> inDataset, Map inVar) throws Exception;
	//연체금액조회
	int getMonthDelyAmt(Map<String, Object> inVar) throws Exception;
	//채권매각대상 조회
	Map selectSaleBondList(Map<String, Object> inVar) throws Exception;
}
