package egovframework.ntrms.kr.co.brn.sd.service;

import java.util.Map;

import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;

@SuppressWarnings("unchecked")
public interface RTSDCustConditionService {
	// 고객정보 조회
	Map getCustResultList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	// 차량정보 조회
	Map getCarResultList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	// 계약현황 조회
	Map getOrderResultList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	// 결제내역 조회
	Map getPaymentList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	// 프리미엄서비스 조회
	Map getPremiumServiceList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	// 인바운드콜 조회
	Map getInboundCallList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	// 아웃바운드콜 조회
	Map getOutboundCallList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	// 클레임접수 조회
	Map getClaimReceiptList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	// 계약현황 조회New
	Map getOrderResultListNew(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
}
