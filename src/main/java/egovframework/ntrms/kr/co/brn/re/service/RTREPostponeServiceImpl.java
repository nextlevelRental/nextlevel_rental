/************************************************************************************
 * 1.Program  			: Common DataSet Service Implement
 * 2.File Name			: RTREAccReqProcServiceImpl.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.re.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ntrms.kr.co.brn.re.dao.RTREPostponeMapDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTREPostponeService")
@SuppressWarnings("unchecked")
public class RTREPostponeServiceImpl extends EgovAbstractServiceImpl implements RTREPostponeService {
	
	@Resource(name="rTREPostponeMapDAO")
	RTREPostponeMapDAO rTREPostponeMapDAO;
	
	public Map rTREPostponeList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("rTREPostponeList", rTREPostponeMapDAO.rTREPostponeList(inVar, outDataset));
		return result;
	}
	
	public Map rTREPostponeListExcel(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("rTREPostponeListExcel", rTREPostponeMapDAO.rTREPostponeListExcel(inVar, outDataset));
		return result;
	}
}
