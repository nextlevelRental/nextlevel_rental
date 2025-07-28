package egovframework.ntrms.kr.co.brn.re.service;

import java.util.Map;

import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;

@SuppressWarnings("unchecked")
public interface RTREDrawDayRegisterService {
	Map rTREDrawDayList(Map<String, Object> inVar) throws Exception;
	Map rTREDrawDayRegist(Map<String, Object> inVar, Map<String, DataSetMap> inDataset) throws Exception;
}