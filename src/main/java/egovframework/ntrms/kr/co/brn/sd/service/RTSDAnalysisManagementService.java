package egovframework.ntrms.kr.co.brn.sd.service;

import java.util.Map;

import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;

@SuppressWarnings("unchecked")
public interface RTSDAnalysisManagementService {
	Map selectRTSDRendalAnalysisStatus(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map selectRTSDRendalAnalysisStatusOuter(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map selectRTSDOrderMonthAnalysis(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
}
