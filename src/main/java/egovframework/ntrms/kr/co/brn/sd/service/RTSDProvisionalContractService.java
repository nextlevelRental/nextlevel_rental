package egovframework.ntrms.kr.co.brn.sd.service;

import java.util.Map;

import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;

public interface RTSDProvisionalContractService {
	
	Map <String, Object> listProvisionalContract(Map <String, Object> mapInVar) throws Exception;
	
	Map <String, Object> listExcelProvisionalContract(Map <String, Object> mapInVar) throws Exception;
	
	Map <String, Object> saveProvisionalContract(Map<String, DataSetMap> mapInDSM, Map<String, Object> mapInVar) throws Exception;
	
	Map <String, Object> listProvisionalContractContact(Map <String, Object> mapInVar) throws Exception;
	
	Map <String, Object> saveProvisionalContractContact(Map<String, DataSetMap> mapInDSM, Map<String, Object> mapInVar) throws Exception;
	
	Map <String, Object> saveHomeProvisionalTemp(Map<String, DataSetMap> mapInDSM, Map<String, Object> mapInVar) throws Exception;
	
	Map <String, Object> saveHomeProvisionalContract(Map<String, Object> mapInVar) throws Exception;
	
	Map <String, Object> selectOutboundAssignInfo(Map <String, Object> mapInVar) throws Exception;
	
	Map <String, Object> aggregateOutboundListDivide(Map<String, Object> mapInVar) throws Exception;
	
	String[] makeList2Array(Map <String, DataSetMap> inDataset) throws Exception;
	
	Map <String, Object> updateOutboundListRevoke(Map<String, Object> mapInVar) throws Exception;
	
}