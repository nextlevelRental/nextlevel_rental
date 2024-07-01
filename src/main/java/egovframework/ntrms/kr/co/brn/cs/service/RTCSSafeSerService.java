package egovframework.ntrms.kr.co.brn.cs.service;

import java.util.List;
import java.util.Map;

import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;


@SuppressWarnings("unchecked")
public interface RTCSSafeSerService {
	Map selectRTCSSafeServiceApply(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map selectRTCSSafeImgList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map saveRTCSSafeApply(Map<String, DataSetMap> inDataset,Map<String, Object> inVar) throws Exception;
	Map selectRTCSSafeServiceRegister(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map saveRTCSSafeRegister(Map<String, DataSetMap> inDataset,Map<String, Object> inVar) throws Exception;
	Map selectRTCSSafeServiceList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	String getJoinRate(Map<String, Object> inVar) throws Exception;
	void moveToLocalFile(List<Map<String, Object>> imgList, String targetPath) throws Exception;
}
