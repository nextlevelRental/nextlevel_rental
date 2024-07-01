package egovframework.ntrms.kr.co.brn.re.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ntrms.kr.co.brn.eai.EAIControl;
import egovframework.ntrms.kr.co.brn.re.dao.RTREClosePostingDAO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTREClosePostingService")
@SuppressWarnings("unchecked")
public class RTREClosePostingServiceImpl extends EgovAbstractServiceImpl implements RTREClosePostingService {
	@Resource(name="rTREClosePostingDAO")
	RTREClosePostingDAO rTREClosePostingDAO;
	
	public Map rTREClosePostingList(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("rTREClosePostingList", rTREClosePostingDAO.rTREClosePostingList(inVar));
		return result;
	}
	
	public Map ifRTRECloseSendEai(Map<String, Object> inVar) throws Exception {
		Map resultMap = new HashMap();

		EAIControl eaiCtrl = new EAIControl();
		resultMap = eaiCtrl.sendEAI_Posting(inVar);

		return resultMap;
	}
	
	public Map <String, Object> updatePostInterfaceResult(Map<String, Object> inVar) throws Exception {
		return rTREClosePostingDAO.updatePostInterfaceResult(inVar);
	}

	@Override
	public Map aggregatePostingData(Map<String, Object> inVar) throws Exception {
		return rTREClosePostingDAO.aggregatePostingData(inVar);
	}
}
