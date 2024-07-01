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

import egovframework.ntrms.kr.co.brn.sd.dao.RTSDOrderChangeListMapDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTSDOrderChangeListService")
@SuppressWarnings("unchecked")
public class RTSDOrderChangeListServiceImpl extends EgovAbstractServiceImpl implements RTSDOrderChangListService {
	
	@Resource(name="rTSDOrderChangeListMapDAO")
	RTSDOrderChangeListMapDAO rTSDOrderChangeListMapDAO;
	
	//주문변경정보 List
	public Map listPlanInfo(Map<String, Object> inVar, Map <String, DataSetMap>outDataset) throws Exception {
		Map result = new HashMap();
		result.put("orderChangeList", rTSDOrderChangeListMapDAO.listOrderChangeListInfo(inVar, outDataset));
		return  result;
	}

}
