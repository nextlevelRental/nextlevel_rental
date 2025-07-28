package egovframework.ntrms.kr.co.brn.re.service;

import java.util.Map;

import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;

public interface RTRECollectionMoneyService {
	/* 수금내역 조회 */
	@SuppressWarnings("rawtypes")
	Map getCollectionMoneyList(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception;
	
	/* 청구내역 조회 */
	@SuppressWarnings("rawtypes")
	Map getBillingRecordList(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception;
	
	/* 수납관리 팝업용 청구/수납내역 조회 */
	@SuppressWarnings("rawtypes")
	Map getCollectForReq(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception;
	
	/* 수납내역 조회 */
	@SuppressWarnings("rawtypes")
	Map getReceiptList(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception;
	
	/* 수납내역 조회 */
	@SuppressWarnings("rawtypes")
	Map getCancelReceiptList(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception;
	
	/* 수납내역 조회 */
	@SuppressWarnings("rawtypes")
	Map cancelReceipt(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception;
	
	/* 수납내역 조회 */
	@SuppressWarnings("rawtypes")
	Map getCancelExOContractList(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception;
		
	/* 수납내역 조회 */
	@SuppressWarnings("rawtypes")
	Map cancelExOContract(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception;
	
	/* 취소시퀀스 */
	public int getRecSeq(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception;
	
	/* 가상계좌 내역 조회 */
	@SuppressWarnings("rawtypes")
	Map getVaList(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception;
	
	/* 가상계좌 세부내역 조회(PG결제 - 가상계좌) */
	@SuppressWarnings("rawtypes")
	Map getVaDetail0141List(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception;
	
	/* 가상계좌 세부내역 조회(세틀뱅크 고정형 가상계좌) */
	@SuppressWarnings("rawtypes")
	Map getVaDetail0221List(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception;
		
	/* 가상계좌 내역 등록 */
	@SuppressWarnings("rawtypes")
	Map saveVaccount(Map<String, DataSetMap> mapInDSM, Map<String, Object> mapInVar) throws Exception;
	
	/* 가상계좌 연체조회 [20180104_01] */
	@SuppressWarnings("rawtypes")
	Map getVaOrdDelyList(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception;
}