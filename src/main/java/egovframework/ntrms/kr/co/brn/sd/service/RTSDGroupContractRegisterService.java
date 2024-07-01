package egovframework.ntrms.kr.co.brn.sd.service;

import java.util.Map;

import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;

@SuppressWarnings("unchecked")
public interface RTSDGroupContractRegisterService {
	Map saveGroupContractRegister(Map<String, DataSetMap> inDataset, Map <String, Object> inVar) throws Exception;	
	Map getUserChanCdList(Map<String, Object> inVar) throws Exception;
	String getregiAmtRt(Map<String, Object> inVar) throws Exception;
	Map setRegiAmtPay(Map<String, Object> inVar) throws Exception;
}