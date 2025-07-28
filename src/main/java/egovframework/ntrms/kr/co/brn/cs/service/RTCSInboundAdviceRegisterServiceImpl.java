/************************************************************************************
 * 1.Program  			: Common DataSet Service Implement
 * 2.File Name			: RTCMUserServiceImpl.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.cs.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ntrms.kr.co.brn.cs.dao.RTCSInboundAdviceRegisterMapDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTCSInboundAdviceRegisterService")
@SuppressWarnings("unchecked")
public class RTCSInboundAdviceRegisterServiceImpl extends EgovAbstractServiceImpl implements RTCSInboundAdviceRegisterService {
	@Resource(name="rTCSInboundAdviceRegisterMapDAO")
	RTCSInboundAdviceRegisterMapDAO rTCSInboundAdviceRegisterMapDAO;
	
	public Map sRtcs0103Region(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map  result= new HashMap();
		result.put("sRtcs0103Region", rTCSInboundAdviceRegisterMapDAO.sRtcs0103Region(inVar, outDataset));
		return result;
	}
	
	public Map sRtcs0103City(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map  result= new HashMap();
		result.put("sRtcs0103City", rTCSInboundAdviceRegisterMapDAO.sRtcs0103City(inVar, outDataset));
		return result;
	}
	
	public Map sRtcs0102Ctf(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map  result= new HashMap();
		result.put("sRtcs0102Ctf", rTCSInboundAdviceRegisterMapDAO.sRtcs0102Ctf(inVar, outDataset));
		return result;
	}
	
	public Map sRtcs0102Obf(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map  result= new HashMap();
		result.put("sRtcs0102Obf", rTCSInboundAdviceRegisterMapDAO.sRtcs0102Obf(inVar, outDataset));
		return result;
	}
	
	public Map sRtcs0102Ibf(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map  result= new HashMap();
		result.put("sRtcs0102Ibf", rTCSInboundAdviceRegisterMapDAO.sRtcs0102Ibf(inVar, outDataset));
		return result;
	}
	
	public Map saveRTCSInboundAdviceRegister(Map<String, DataSetMap> inDataset, Map <String, Object> inVar) throws Exception {
		DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
		inVar.put("inDsMap", inDsMap);
		inVar.put("sqlnamespace", "inboundAdviceRegister.saveRTCSInboundAdviceRegister");
		Map result = rTCSInboundAdviceRegisterMapDAO.saveRTCSInboundAdviceRegister(inVar);
		return result;	
	}
	
	public String selectSysdate(Map<String, Object> inVar) throws Exception {
		return rTCSInboundAdviceRegisterMapDAO.selectSysdate(inVar);
	}
	
	public Map qusUpdateRTCSInboundAdviceRegister(Map<String, DataSetMap> inDataset, Map <String, Object> inVar) throws Exception {
		DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
		inVar.put("inDsMap", inDsMap);
		Map result = rTCSInboundAdviceRegisterMapDAO.qusUpdateRTCSInboundAdviceRegister(inVar);
		return result;	
	}
}
