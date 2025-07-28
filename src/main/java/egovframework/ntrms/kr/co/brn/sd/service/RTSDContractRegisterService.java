package egovframework.ntrms.kr.co.brn.sd.service;

import java.util.Map;

import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;

@SuppressWarnings("unchecked")
public interface RTSDContractRegisterService {
	Map listRtsd0104(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map listRtsd0106(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map listRtsd0013(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map listRtsd0014(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map applyRtsd0014(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map listRateAmt(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map saveContractRegister(Map<String, DataSetMap> inDataset, Map <String, Object> inVar) throws Exception;
	int selectRtsd0108SaleCdCount(Map<String, Object> inVar) throws Exception;
	String selectSalesmanTel(Map<String, Object> inVar) throws Exception;
	String selectFirstDay(Map<String, Object> inVar) throws Exception;
	String selectFirstDayByTerm(Map<String, Object> inVar) throws Exception;
	String sRtsd0104ChanCd(Map<String, Object> inVar) throws Exception;
	Map sRtsd0113UserGrp(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map listAddProduct(Map<String, Object> inVar) throws Exception;
	Map listGrpAdd(Map<String, Object> inVar) throws Exception;
	Map cntPrdPymInfoList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map listAddSelProduct(Map<String, Object> inVar) throws Exception;
	Map prmmSrvcOrdList(Map<String, Object> inVar) throws Exception;
	Map listPrdInfo(Map<String, Object> inVar) throws Exception;
	Map combosetPettern(Map<String, Object> inVar) throws Exception;
	Map combosetStan(Map<String, Object> inVar) throws Exception;
	String wheelQty(Map<String, Object> inVar) throws Exception;
	String wheelQtyLt(Map<String, Object> inVar) throws Exception;
	Map saveRtsd0213(Map <String, Object> inVar) throws Exception;
	Map tmsSchedule(Map <String, Object> inVar) throws Exception;
	String o2oAgencyYn(Map <String, Object> inVar) throws Exception;
	Map o2oAgencyInfo(Map <String, Object> inVar) throws Exception;
	Map o2oAgencyTime(Map <String, Object> inVar) throws Exception;
	int o2oAgencyStock(Map <String, Object> inVar) throws Exception;
	int o2oAgencyStock2(Map <String, Object> inVar) throws Exception;
	int o2oAgencyStockTot(Map <String, Object> inVar) throws Exception;
	String selectBeforeAfterDay(Map <String, Object> inVar) throws Exception;
	Map listSendContract(Map<String, Object> inVar) throws Exception;
	String getIsDupOrder(Map<String, Object> inVar) throws Exception;
	void beforeOrderConfirm(Map <String, Object> inVar) throws Exception;
	Map<String, Object> contractTermsSend(Map<String, Object> inVar) throws Exception;
	Map<String, Object> contractTermsSendCheck(Map<String, Object> inVar) throws Exception;
}