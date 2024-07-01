package egovframework.ntrms.kr.co.brn.re.service;

import java.util.Map;

import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;

@SuppressWarnings("unchecked")
public interface RTREKCPPayHisCheckService {
	Map selectCheckSet(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map accApproveUploadFile(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;
	Map resultUpdateRtre0043Check(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;
	Map saveVerProcess(Map<String, DataSetMap> inDataset, Map <String, Object> inVar) throws Exception;
	Map selectSRtre0043(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
}
