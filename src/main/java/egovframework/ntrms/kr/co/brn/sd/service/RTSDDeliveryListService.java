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

@SuppressWarnings("unchecked")

public interface RTSDDeliveryListService {
	List<Map> getDeliveryInfoRealTime(Map<String, Object> inputParams, List paramList, Map<String, Object> addParam) throws Exception;
}
