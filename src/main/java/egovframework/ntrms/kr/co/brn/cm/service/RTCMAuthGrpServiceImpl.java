/************************************************************************************
 * 1.Program  			: Common DataSet Service Implement
 * 2.File Name			: RTCMAuthGrpServiceImpl.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.cm.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nexacro.xapi.data.DataSet;

import egovframework.ntrms.kr.co.brn.cm.dao.RTCMAuthGrpMapDAO;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTCMAuthGrpService")
@SuppressWarnings("unchecked")
public class RTCMAuthGrpServiceImpl extends EgovAbstractServiceImpl implements RTCMAuthGrpService{
	@Resource(name="rTCMAuthGrpMapDAO")
	RTCMAuthGrpMapDAO rTCMAuthGrpMapDAO;
	
	public Map listAuthGrp(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("listAuthGrp", 	rTCMAuthGrpMapDAO.listAuthGrp(inVar, outDataset));
		return result;
	}
	
	public Map saveAuthGrp(Map<String, DataSetMap> inDataset, Map <String, Object> inVar) throws Exception {
		DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
		inVar.put("inDsMap", inDsMap);
		inVar.put("sqlnamespace", "authGrp.saveAuthGr");
		Map result = rTCMAuthGrpMapDAO.saveAuthGrp(inVar);
		return result;	
	}
	
	public int checkAuthGrpCd(Map<String, Object> inVar) throws Exception {
		return rTCMAuthGrpMapDAO.checkAuthGrpCd(inVar);
	}
}
