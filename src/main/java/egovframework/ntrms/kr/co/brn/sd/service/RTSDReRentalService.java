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

public interface RTSDReRentalService {
	Map listReRental(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	
	Map listReRentalForExcel(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	
	Map rtsd0108OrdList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	
	Map <String, Object> saveRerentalContract(Map <String, DataSetMap> mapInDSM, Map <String, Object> mapInVar) throws Exception;
	
	Map createRtsd0123(Map<String, Object> mapInVar, Map<String, DataSetMap> mapInDSM) throws Exception;
	
	Map updateCustInfo(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
}
