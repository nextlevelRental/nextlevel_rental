/************************************************************************************
 * 
 * 1.Program  			: Common DataSet Service
 * 2.File Name			: RTCMUserService.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.sd.service;

import java.util.List;
import java.util.Map;

import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;

@SuppressWarnings("unchecked")

public interface RTSDGroupRegisterService {
	Map listGroupInfo(Map<String, Object> inVar) throws Exception;
	Map saveGroupInfo(Map<String, DataSetMap> inDataset, Map <String, Object> inVar) throws Exception;
	Map cancelOrdInfo(Map<String, DataSetMap> inDataset, Map <String, Object> inVar) throws Exception;
	Map cancelOrdInfo_All(Map<String, DataSetMap> inDataset, Map <String, Object> inVar) throws Exception;	
	Map listAddPackageInfo(Map<String, Object> inVar) throws Exception;
	Map cancelPackage(Map<String, DataSetMap> inDataset, Map <String, Object> inVar) throws Exception;
	Map cancelOrdNo2(Map<String, DataSetMap> inDataset, Map <String, Object> inVar) throws Exception;
	String cancelPrice(Map<String, Object> inVar) throws Exception;
}
