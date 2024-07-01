package egovframework.ntrms.kr.co.brn.re.service;

import java.util.Map;

import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;


@SuppressWarnings("unchecked")
public interface RTRESalesCommMangService {
	Map selectRTRESalesCommMang(Map<String, Object> inVar) throws Exception;
	Map saveRTRESalesCommMang(Map<String, DataSetMap> inDataset, Map <String, Object> inVar) throws Exception;
	Map selectRTRESalesCommMangOpenMall(Map<String, Object> inVar) throws Exception;
	Map saveRTRESalesCommMangOpenMall(Map<String, DataSetMap> inDataset, Map <String, Object> inVar) throws Exception;
	Map selectRTREInstallCommMang(Map<String, Object> inVar) throws Exception;
	Map saveRTREInstallCommMang(Map<String, DataSetMap> inDataset, Map <String, Object> inVar) throws Exception;
	Map selectRTREServiceCommMang(Map<String, Object> inVar) throws Exception;
	Map saveRTREServiceCommMang(Map<String, DataSetMap> inDataset, Map <String, Object> inVar) throws Exception;
	
	//판매장려 인센티브
	Map rtreSalesChargeInsentive(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;
}
