package egovframework.ntrms.kr.co.brn.sd.service;

import java.util.Map;

import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;



@SuppressWarnings("unchecked")
public interface RTSDCustGrpService {
	Map grpNoCrate(Map<String, DataSetMap> inDataset, Map <String, Object> inVar) throws Exception;
	Map listGrpNo1(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map listGrpNo2(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	String selectCustGrpCustNo(Map<String, Object> inVar) throws Exception;
	Map saveCustGrp1(Map<String, DataSetMap> inDataset, Map <String, Object> inVar) throws Exception;
	Map saveCustGrp2(Map<String, DataSetMap> inDataset, Map <String, Object> inVar) throws Exception;
}