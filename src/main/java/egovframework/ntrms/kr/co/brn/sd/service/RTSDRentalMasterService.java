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

public interface RTSDRentalMasterService {
	Map listRentalMaster(Map<String, Object> inVar) throws Exception;
	Map listMgmtArea(Map<String, Object> inVar) throws Exception;	
	Map listSalesAgent(Map<String, Object> inVar) throws Exception;
	public int getNuSeq(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception;
	Map saveRentalMaster(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;	
	
}
