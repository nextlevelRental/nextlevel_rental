/************************************************************************************
 * 1.Program  			: Common DataSet Service Implement
 * 2.File Name			: RTCMUserServiceImpl.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.sd.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ntrms.kr.co.brn.sd.dao.RTSDAnalyzePDFMapDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTSDAnalyzePDFService")
@SuppressWarnings("unchecked")
public class RTSDAnalyzePDFServiceImpl extends EgovAbstractServiceImpl implements RTSDAnalyzePDFService {
	
	@Resource(name="rTSDAnalyzePDFMapDAO")
	RTSDAnalyzePDFMapDAO rTSDAnalyzePDFMapDAO;
	
	//메인 Detail List
	public Map listAnalyzePDF(Map<String, Object> inVar, Map <String, DataSetMap>outDataset) throws Exception {
		Map result = new HashMap();
		result.put("output", rTSDAnalyzePDFMapDAO.listAnalyzePDF(inVar, outDataset));
		return  result;
	}

	
}
