package egovframework.ntrms.kr.co.brn.cs.service;

import java.util.Map;

import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;

@SuppressWarnings("unchecked")
public interface RTCSWarehouseService {
	int checkWarehCd(Map<String, Object> inVar) throws Exception;
	Map saveRTCSWarehouseRegister(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;
	Map selectRTCSWarehouseRegister(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map selectRTCSWarehouseUpdateList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map saveRTCSWarehAgencyRegister(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;
	Map selectRTCSWarehAgencyRegister(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
}
