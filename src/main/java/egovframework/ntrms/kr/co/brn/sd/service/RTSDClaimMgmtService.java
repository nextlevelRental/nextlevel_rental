package egovframework.ntrms.kr.co.brn.sd.service;

import java.util.List;
import java.util.Map;

import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;

@SuppressWarnings("unchecked")

public interface  RTSDClaimMgmtService {

//	클레임관리 조회
	List<Map> claimMgmtList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	
//	클레임관리 고객 조회
	List<Map> claimMgmtAddList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	
	
	
//클레임관리 IUD
	@SuppressWarnings("rawtypes")
	Map claimMgmtSave(Map<String, DataSetMap> mapInDSM, Map<String, Object> mapInVar) throws Exception;
}
