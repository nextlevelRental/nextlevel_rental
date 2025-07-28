package egovframework.ntrms.kr.co.brn.cs.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ntrms.kr.co.brn.cs.dao.RTCSKeepHistoryMapDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTCSKeepHistoryService")
@SuppressWarnings("unchecked")
public class RTCSKeepHistoryServiceImpl extends EgovAbstractServiceImpl implements RTCSKeepHistoryService {
	@Resource(name="rTCSKeepHistoryMapDAO")
	RTCSKeepHistoryMapDAO rTCSKeepHistoryMapDAO;
	
	public Map selectRTCSKeepHistory(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("selectRTCSKeepHistory", rTCSKeepHistoryMapDAO.selectRTCSKeepHistory(inVar, outDataset));
		return result;
	}
	
	public Map pSRtcs0202UseAgencyWareh(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("pSRtcs0202UseAgencyWareh", rTCSKeepHistoryMapDAO.pSRtcs0202UseAgencyWareh(inVar, outDataset));
		return result;
	}
	
	public Map saveRtcs0203WinterIn(Map<String, DataSetMap> inDataset,Map<String, Object> inVar) throws Exception {
		DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
		inVar.put("inDsMap", inDsMap);
		inVar.put("sqlnamespace", "rTCSWarehouse.saveRtcs0203WinterIn");
		return rTCSKeepHistoryMapDAO.saveRtcs0203WinterIn(inVar);
	}
	
	public Map saveRtcs0203WinterOut(Map<String, DataSetMap> inDataset,Map<String, Object> inVar) throws Exception {
		DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
		inVar.put("inDsMap", inDsMap);
		inVar.put("sqlnamespace", "rTCSWarehouse.saveRtcs0203WinterOut");
		return rTCSKeepHistoryMapDAO.saveRtcs0203WinterOut(inVar);
	}
	
	public Map sRtcs0203FilePathName(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		return rTCSKeepHistoryMapDAO.sRtcs0203FilePathName(inVar, outDataset);
	}
}
