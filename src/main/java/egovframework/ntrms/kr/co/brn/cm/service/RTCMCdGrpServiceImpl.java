package egovframework.ntrms.kr.co.brn.cm.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nexacro.xapi.data.DataSet;

import egovframework.ntrms.kr.co.brn.cm.dao.RTCMCdGrpMapDAO;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTCMCdGrpService")
@SuppressWarnings("unchecked")
public class RTCMCdGrpServiceImpl extends EgovAbstractServiceImpl implements RTCMCdGrpService{
	
	@Resource(name="rTCMCdGrpMapDAO")
	RTCMCdGrpMapDAO rTCMCdGrpMapDAO;
	
	public Map listCdGrp(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("listCdGrp", rTCMCdGrpMapDAO.listCdGrp(inVar, outDataset));
		return result;
	}
	public Map listCdGrpChild(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("listCdGrpChild", rTCMCdGrpMapDAO.listCdGrpChild(inVar, outDataset));
		return result;
	}
	
	public int cdGrpCdOverlapConfirm(Map<String, Object> inVar) throws Exception {
		return rTCMCdGrpMapDAO.cdGrpCdOverlapConfirm(inVar);
	}
	
	public Map saveCdGrp(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		
		DataSetMap inDsMap1 = (DataSetMap)inDataset.get("input1");
		Map cdGrpMap = new HashMap();
		cdGrpMap.put("inDsMap", inDsMap1);
		cdGrpMap.put("sqlnamespace", "cdGrp.saveCdGrp");
		
		DataSetMap inDsMap2 = (DataSetMap)inDataset.get("input2");
		Map CdGrpChildMap = new HashMap();
		CdGrpChildMap.put("inDsMap", inDsMap2);
		CdGrpChildMap.put("sqlnamespace", "cdGrp.saveCdGrpChild");
		
		List list = new ArrayList();
		list.add(cdGrpMap);
		list.add(CdGrpChildMap);
				
		Map result = rTCMCdGrpMapDAO.saveCdGrp(inVar, list);
		return result;
	}
	
	public int checkCd(Map<String, Object> inVar) throws Exception {
		return rTCMCdGrpMapDAO.checkCd(inVar);
	}
}
