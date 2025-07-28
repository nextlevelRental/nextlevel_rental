package egovframework.ntrms.kr.co.brn.cs.service;

import java.util.Map;

import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;


@SuppressWarnings("unchecked")
public interface RTCSEngineOilRepSerService {
	String selectServrqDay(Map<String, Object> inVar) throws Exception;
	String selectServrqDayByTerm(Map<String, Object> inVar) throws Exception;
	//엔진오일 교체 대상 일자 
	String selectEngineOilServrqDay(Map<String, Object> inVar) throws Exception;
	Map selectRTCSEngineOilRepSer(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map saveRTCSEngineOilRepSer(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;
	Map saveRTCSEngineOilInvMan(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;
	//엔진오일 교체 서비스 내역 조회
	Map engineOilChangeServiceList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	//엑셀 다운로드 상태 업데이트 
	Map engineOilChangeServiceExcelDown(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;
	//다운로드 대상 조회
	Map engineOilChangeServiceDownList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	//걱정제로 서비스 대상 조회
	Map selectRTCSZeroServiceList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map saveRTCSZeroRepSer(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;
	//걱정제로 교체 서비스 내역 조회
	Map zeroChangeServiceList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map saveRTSD0213(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;
}
