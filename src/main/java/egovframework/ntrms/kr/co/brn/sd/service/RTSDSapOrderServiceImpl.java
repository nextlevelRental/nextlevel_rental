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

import egovframework.ntrms.kr.co.brn.sd.dao.RTSDSapOrderMapDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTSDSapOrderService")
@SuppressWarnings("unchecked")
public class RTSDSapOrderServiceImpl extends EgovAbstractServiceImpl implements RTSDSapOrderService {
	
	@Resource(name="rTSDSapOrderMapDAO")
	RTSDSapOrderMapDAO rTSDSapOrderMapDAO;
	
	public Map detailSapOrderInfo(Map<String, Object> inVar) throws Exception {
		Map  result= new HashMap();
		result.put("sapOrderResult", rTSDSapOrderMapDAO.selectRTSDSapOrder(inVar));
		return result;
	}
}
