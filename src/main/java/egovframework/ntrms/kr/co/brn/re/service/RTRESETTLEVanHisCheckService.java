package egovframework.ntrms.kr.co.brn.re.service;

import java.util.Map;

import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;

@SuppressWarnings("unchecked")
public interface RTRESETTLEVanHisCheckService {
	Map selectCheckSet(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map settleVanUploadFile(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;
	Map resultUpdateRtre0046Check(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;
	Map saveVerProcess(Map<String, DataSetMap> inDataset, Map <String, Object> inVar) throws Exception;
	Map selectSRtre0046(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
}
