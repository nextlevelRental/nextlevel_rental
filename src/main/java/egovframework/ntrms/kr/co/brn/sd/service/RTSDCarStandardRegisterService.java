package egovframework.ntrms.kr.co.brn.sd.service;

import java.util.HashMap;
import java.util.Map;

import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;

@SuppressWarnings("unchecked")
public interface RTSDCarStandardRegisterService {
	Map sRtsd0004ContentsCdSelect(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map sRtsd0004FrCdSelect(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map sRtsd0004PlyRatingCdSelect(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map sRtsd0004SectionWidthSelect(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map sRtsd0004AspectRatioSelect(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map sRtsd0004WheelInchesSelect(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map sRtsd0004Select(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map saveRTSDCarStandardRegister(Map<String, DataSetMap> inDataset, Map <String, Object> inVar) throws Exception;
}