/************************************************************************************
 * 
 * 1.Program  			: Common DataSet Service
 * 2.File Name			: RTCMUserService.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.sd.service;

import java.util.Map;

import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;

public interface RTSDRentalCustLinkService {
	@SuppressWarnings("rawtypes")
	Map listRentalCustLinkMstInfo(Map<String, Object> inVar) throws Exception;
	
	@SuppressWarnings("rawtypes")
	Map listRentalCustLinkDtlInfo(Map<String, Object> inVar) throws Exception;
	
	@SuppressWarnings("rawtypes")
	Map saveRentalCustLink(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;
	
	@SuppressWarnings("rawtypes")
	Map retrieveUnRlsSelerList(Map<String, Object> inVar) throws Exception;
}