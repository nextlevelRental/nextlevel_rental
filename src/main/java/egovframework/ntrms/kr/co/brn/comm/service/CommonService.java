/************************************************************************************
 * 
 * 1.Program  			: Common DataSet Service
 * 2.File Name			: RTCMUserService.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.comm.service;

import java.util.Map;

@SuppressWarnings("unchecked")
public interface CommonService {
	Map listCommInfo(Map<String, Object> inVar) throws Exception;
	String getCodeName(Map<String, Object> inVar) throws Exception;
	String getAgencyName(Map<String, Object> inVar) throws Exception;
	Map listTireInfo(Map<String, Object> inVar) throws Exception;
	Map listTireDetailInfo(Map<String, Object> inVar) throws Exception;
	Map listSellProduct(Map<String, Object> inVar) throws Exception;
	Map listTireDetailInfo2(Map<String, Object> inVar) throws Exception;
	Map<String, Object> listControlAuth(Map<String, Object> inVar) throws Exception;
	Map runQuery(Map<String, Object> inVar) throws Exception;
}
