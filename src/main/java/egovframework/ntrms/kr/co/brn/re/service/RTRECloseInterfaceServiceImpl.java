package egovframework.ntrms.kr.co.brn.re.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ntrms.kr.co.brn.eai.EAIControl;
import egovframework.ntrms.kr.co.brn.re.dao.RTRECloseInterfaceDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.TableMetaDataAspectJ;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTRECloseInterfaceService")
@SuppressWarnings("unchecked")
public class RTRECloseInterfaceServiceImpl extends EgovAbstractServiceImpl implements RTRECloseInterfaceService {
	@Resource(name="rTRECloseInterfaceDAO")
	RTRECloseInterfaceDAO rTRECloseInterfaceDAO;
	
	public Map rTRECloseInterfaceList(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("rTRECloseInterfaceList", rTRECloseInterfaceDAO.rTRECloseInterfaceList(inVar));
		return result;
	}
	
	public Map ifRTRECloseSendEai(Map<String, Object> inVar) throws Exception {
		Map resultMap = new HashMap();

		EAIControl eaiCtrl = new EAIControl();
		resultMap = eaiCtrl.sendEAI(inVar);

		return resultMap;
	}
		
	public Map <String, Object> updateCloseInterfaceResult(Map<String, Object> inVar) throws Exception {
		return rTRECloseInterfaceDAO.updateCloseInterfaceResult(inVar);
	}
	
	public Map <String, Object> aggregateData(Map<String, Object> inVar) throws Exception {
		return rTRECloseInterfaceDAO.aggregateData(inVar);
	}
	
	public Map <String, Object> createEAIList(Map<String, Object> inVar) throws Exception {
		return rTRECloseInterfaceDAO.createEAIList(inVar);
	}
}
