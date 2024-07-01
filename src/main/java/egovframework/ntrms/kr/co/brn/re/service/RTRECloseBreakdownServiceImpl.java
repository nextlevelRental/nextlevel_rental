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

import egovframework.ntrms.kr.co.brn.re.dao.RTRECloseBreakdownMapDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTRECloseBreakdownService")
@SuppressWarnings("unchecked")
public class RTRECloseBreakdownServiceImpl extends EgovAbstractServiceImpl implements RTRECloseBreakdownService {
	
	@Resource(name="rTRECloseBreakdownMapDAO")
	RTRECloseBreakdownMapDAO rTRECloseBreakdownMapDAO;
	
	public Map rTRECloseBreakdownList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("rTRECloseBreakdownList", rTRECloseBreakdownMapDAO.rTRECloseBreakdownList(inVar, outDataset));
		return result;
	}
}
