package egovframework.ntrms.kr.co.brn.re.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ntrms.kr.co.brn.re.dao.RTREDrawDayRegisterDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTREDrawDayRegisterService")
@SuppressWarnings("unchecked")
public class RTREDrawDayRegisterServiceImpl extends EgovAbstractServiceImpl implements RTREDrawDayRegisterService {
	@Resource(name="rTREDrawDayRegisterDAO")
	RTREDrawDayRegisterDAO rTREDrawDayRegisterDAO;
	
	public Map rTREDrawDayList(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("rTREDrawDayList", rTREDrawDayRegisterDAO.rTREDrawDayList(inVar));
		return result;
	}
	
	public Map rTREDrawDayRegist(Map<String, Object> inVar, Map<String, DataSetMap> inDataset) throws Exception {
		inVar.put("inDsMap", inDataset.get("input"));
		inVar.put("sqlnamespace", "rTREDrawDayRegisterDAO.IUDRtre0055");
		Map result = rTREDrawDayRegisterDAO.rTREDrawDayRegist(inVar);
		return result;
	}
}
