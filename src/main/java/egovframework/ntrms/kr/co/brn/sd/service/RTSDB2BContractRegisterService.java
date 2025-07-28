package egovframework.ntrms.kr.co.brn.sd.service;

import java.util.Map;

import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;

@SuppressWarnings("unchecked")
public interface RTSDB2BContractRegisterService {
	Map saveB2BContractRegister(Map<String, DataSetMap> inDataset, Map <String, Object> inVar) throws Exception;
}