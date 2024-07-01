package egovframework.ntrms.kr.co.brn.sd.service;

import java.util.Map;

import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;

public interface RTSDVisitInstallService {
	Map <String, Object> listVisitInstall(Map <String, Object> mapInVar) throws Exception;
	
	Map <String, Object> saveVisitInstall(Map<String, DataSetMap> mapInDSM, Map<String, Object> mapInVar) throws Exception;
	
	Map <String, Object> listVisitInstallLog(Map <String, Object> mapInVar) throws Exception;
}