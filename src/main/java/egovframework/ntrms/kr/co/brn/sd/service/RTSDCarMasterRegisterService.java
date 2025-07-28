package egovframework.ntrms.kr.co.brn.sd.service;

import java.util.Map;

import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;


@SuppressWarnings("unchecked")
public interface RTSDCarMasterRegisterService {
	Map sRtsd0001ModelSelect(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map sRtsd0001ModelByClassSelect(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map sRtsd0001ContentsSelect(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map carMasterSelect(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map saveRTSDCarMasterRegister(Map<String, DataSetMap> inDataset, Map <String, Object> inVar) throws Exception;
}