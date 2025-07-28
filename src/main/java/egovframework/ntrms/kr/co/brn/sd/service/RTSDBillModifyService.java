package egovframework.ntrms.kr.co.brn.sd.service;

import java.util.Map;

import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;

@SuppressWarnings("unchecked")

public interface RTSDBillModifyService {
	Map listBillInfo(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map saveBillData(Map<String, DataSetMap> inDataset, Map <String, Object> inVar) throws Exception;

}
