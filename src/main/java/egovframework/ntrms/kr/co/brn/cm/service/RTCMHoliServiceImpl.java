package egovframework.ntrms.kr.co.brn.cm.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nexacro.xapi.data.DataSet;

import egovframework.ntrms.kr.co.brn.cm.dao.RTCMHoliMapDAO;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTCMHoliService")
@SuppressWarnings("unchecked")
public class RTCMHoliServiceImpl extends EgovAbstractServiceImpl implements RTCMHoliService{
	
	@Resource(name="rTCMHoliMapDAO")
	RTCMHoliMapDAO rTCMHoliMapDAO;
	
	public Map listHoli(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("listHoli", 	rTCMHoliMapDAO.listHoli(inVar, outDataset));
		return result;
	}
	
	public int checkHDate(Map<String, Object> inVar) throws Exception {
		return rTCMHoliMapDAO.checkHDate(inVar);
	}
	
	public Map saveHoli(Map<String, DataSetMap> inDataset, Map <String, Object> inVar) throws Exception {
		DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
		inVar.put("inDsMap", inDsMap);
		inVar.put("sqlnamespace", "holi.saveHoli");
		Map result = rTCMHoliMapDAO.saveHoli(inVar);
		return result;	
	}
}
