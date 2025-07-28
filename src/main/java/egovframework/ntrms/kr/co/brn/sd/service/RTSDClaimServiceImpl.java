/************************************************************************************
 * 1.Program  			: Common DataSet Service Implement
 * 2.File Name			: RTCMUserServiceImpl.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.sd.service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nexacro.xapi.data.DataSet;

import egovframework.ntrms.kr.co.brn.cm.dao.RTCMMenuProRegMapDAO;
import egovframework.ntrms.kr.co.brn.cm.dao.RTCMProRegMapDAO;
import egovframework.ntrms.kr.co.brn.cm.dao.RTCMProMapDAO;
import egovframework.ntrms.kr.co.brn.cm.dao.RTCMUserMapDAO;
import egovframework.ntrms.kr.co.brn.sample.service.ProGramService;
import egovframework.ntrms.kr.co.brn.sd.dao.RTSDClaimMapDAO;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTSDClaimService")
@SuppressWarnings("unchecked")
public class RTSDClaimServiceImpl extends EgovAbstractServiceImpl implements RTSDClaimService {
	
	@Resource(name="rTSDClaimMapDAO")
	RTSDClaimMapDAO rTSDClaimMapDAO;
	
	//청구스케줄 리스트
	public Map getClaimList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("result", rTSDClaimMapDAO.getClaimRegList(inVar, outDataset));
		return  result;
	}

	
}
