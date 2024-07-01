package egovframework.ntrms.kr.co.brn.sd.service;

import java.util.Map;

import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;


@SuppressWarnings("unchecked")
public interface RTSDContractStatusService {
	Map listStatus(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map listInstall(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map listPay(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map listDiscount(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map listAgree(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map listPreminum(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map listSeller(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map listEleSig(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map saveOrdCancel(Map<String, DataSetMap> inDataset, Map <String, Object> inVar) throws Exception;
	Map rtsd0104AgencyUpdate(Map<String, DataSetMap> inDataset, Map <String, Object> inVar) throws Exception;
	Map pIUDRtsd0118(Map<String, Object> inVar) throws Exception;
	int s082Cnt(Map<String, Object> inVar) throws Exception;
	String codeName(Map<String, Object> inVar) throws Exception;
	Map signHistory(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map saveRTCOMMCarInfoUpdate(Map<String, DataSetMap> inDataset, Map <String, Object> inVar) throws Exception;
	Map saveRTCOMMOrdDelete(Map<String, Object> inVar) throws Exception;
	Map saveRTCOMMSvcDelete(Map<String, Object> inVar) throws Exception;
	Map saveRTRE100Update(Map<String, DataSetMap> inDataset, Map <String, Object> inVar) throws Exception;
	Map saveServiceB00006(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;
	String sRtcs0204WriteYn(Map<String, Object> inVar) throws Exception;
	Map AdviceStatus(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map saveRtsd0213(Map <String, Object> inVar) throws Exception;
	Map addNewService(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;
	Map addServCnt0(Map<String, Object> inVar) throws Exception;
	Map listEndContract(Map<String, Object> inVar) throws Exception;
	Map listCancContract(Map<String, Object> inVar) throws Exception;
	Map getOrgInfoList(Map<String, Object> inVar) throws Exception;
}