package egovframework.ntrms.kr.co.brn.re.service;

import java.util.Map;

import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;

@SuppressWarnings("unchecked")
public interface RTREKCPDirectHisCheckService {
	Map selectCheckSet(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map kcpDirectUploadFile(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;
	Map resultUpdateRtre0044Check(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;
	Map saveVerProcess(Map<String, DataSetMap> inDataset, Map <String, Object> inVar) throws Exception;
	Map selectSRtre0044(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
}
