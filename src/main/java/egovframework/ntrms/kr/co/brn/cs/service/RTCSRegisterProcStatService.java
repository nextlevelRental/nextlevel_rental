package egovframework.ntrms.kr.co.brn.cs.service;

import java.util.List;
import java.util.Map;

import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;

@SuppressWarnings("unchecked")

public interface RTCSRegisterProcStatService {

//	정기점거 처리현황 조회
	List<Map> registerProcStatList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;

}
