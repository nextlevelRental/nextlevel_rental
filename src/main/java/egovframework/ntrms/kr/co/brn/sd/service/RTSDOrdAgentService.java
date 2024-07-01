package egovframework.ntrms.kr.co.brn.sd.service;

import java.util.List;
import java.util.Map;

import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;

@SuppressWarnings("unchecked")

public interface RTSDOrdAgentService {
	Map selectOrdAgentList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map selectOrdAgentOrderList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	List<?> selectOrdAgentOrderListNew(Map<String, Object> inVar) throws Exception;
	Map selectRTSDOrdAgentRegister(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map saveRTSDOrdAgentRegister(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;
	int checkOrdAgent(Map<String, Object> inVar) throws Exception;
}
