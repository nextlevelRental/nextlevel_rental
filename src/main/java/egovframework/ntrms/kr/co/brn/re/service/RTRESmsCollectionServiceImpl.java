package egovframework.ntrms.kr.co.brn.re.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ntrms.kr.co.brn.re.dao.RTRESmsCollectionDAO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTRESmsCollectionService")
@SuppressWarnings("unchecked")
public class RTRESmsCollectionServiceImpl extends EgovAbstractServiceImpl implements RTRESmsCollectionService {
	@Resource(name="rTRESmsCollectionDAO")
	RTRESmsCollectionDAO rTRESmsCollectionDAO;
	
	public Map rTRESmsCollectionList(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("rTRESmsCollectionList", rTRESmsCollectionDAO.rTRESmsCollectionList(inVar));
		return result;
	}
}
