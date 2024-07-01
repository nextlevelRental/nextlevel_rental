/************************************************************************************
 * 
 * 1.Program  			: Common DataSet Service
 * 2.File Name			: RTCMUserService.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.cm.service;

import java.util.Map;

import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;

public interface RTCMUserService {
	Map<String, Object> listUserInfo(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	//void saveUserInfo(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;
	Map<String, Object> saveUserInfo(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;
	int checkIdExists(Map<String, Object> inVar) throws Exception;
	Map<String, Object> clearPwd(Map<String, Object> inVar) throws Exception;
}
