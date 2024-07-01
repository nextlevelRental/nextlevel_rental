/************************************************************************************
 * 1.Program  			: Common DataSet Service Implement
 * 2.File Name			: RTREAccReqServiceImpl.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.re.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ntrms.kr.co.brn.re.dao.RTREAccReqMapDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTREAccReqService")
@SuppressWarnings("unchecked")
public class RTREAccReqServiceImpl extends EgovAbstractServiceImpl implements RTREAccReqService {
	
	@Resource(name="rTREAccReqMapDAO")
	RTREAccReqMapDAO rTREAccReqMapDAO;

	//계좌신청 조회
	public Map listAccReq(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("listAccReq", 	rTREAccReqMapDAO.listAccReq(inVar, outDataset));
		return result;
	}
}
