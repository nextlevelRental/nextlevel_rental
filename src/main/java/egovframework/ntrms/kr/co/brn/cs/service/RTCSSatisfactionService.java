package egovframework.ntrms.kr.co.brn.cs.service;

import java.util.List;
import java.util.Map;

import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;


@SuppressWarnings("unchecked")
public interface RTCSSatisfactionService {
	Map selectKakaoSatisfactionList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map updateKakaoSatisfaction(Map<String, DataSetMap> inDataset,Map<String, Object> inVar) throws Exception;
	Map selectAgencySatisfactionList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;

}
