package egovframework.ntrms.kr.co.brn.cs.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ntrms.kr.co.brn.cs.dao.RTCSServiceHistoryMapDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTCSServiceHistoryService")
@SuppressWarnings("unchecked")
public class RTCSServiceHistoryServiceImpl extends EgovAbstractServiceImpl implements RTCSServiceHistoryService {
	
	@Resource(name="rTCSServiceHistoryMapDAO")
	RTCSServiceHistoryMapDAO rTCSServiceHistoryMapDAO;
	
	public Map serviceHistoryList(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("serviceHistoryList", rTCSServiceHistoryMapDAO.serviceHistoryList(inVar, outDataset));
		return result;
	}		
	
	public Map saveRTCS0008(Map<String, Object> inVar) throws Exception {
		return rTCSServiceHistoryMapDAO.saveRTCS0008(inVar);
	}
}
