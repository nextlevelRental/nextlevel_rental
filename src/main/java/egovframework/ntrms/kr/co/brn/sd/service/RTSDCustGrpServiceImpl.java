package egovframework.ntrms.kr.co.brn.sd.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ntrms.kr.co.brn.sd.dao.RTSDCustGrpMapDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTSDCustGrpService")
@SuppressWarnings("unchecked")
public class RTSDCustGrpServiceImpl extends EgovAbstractServiceImpl implements RTSDCustGrpService{
	@Resource(name="rTSDCustGrpMapDAO")
	RTSDCustGrpMapDAO rTSDCustGrpMapDAO;
	
	
	public Map grpNoCrate(Map<String, DataSetMap> inDataset, Map <String, Object> inVar) throws Exception {
		DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
		inVar.put("inDsMap", inDsMap);
		inVar.put("sqlnamespace", "custGrp.saveCustGrp1");
		Map result = rTSDCustGrpMapDAO.grpNoCrate(inVar);
		return result;	
	}
	
	public Map listGrpNo1(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("listGrpNo1", 	rTSDCustGrpMapDAO.listGrpNo1(inVar, outDataset));
		return result;
	}
	
	public Map listGrpNo2(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("listGrpNo2", 	rTSDCustGrpMapDAO.listGrpNo2(inVar, outDataset));
		return result;
	}
	
	public String selectCustGrpCustNo(Map<String, Object> inVar) throws Exception {
		return rTSDCustGrpMapDAO.selectCustGrpCustNo(inVar);
	}
	
	public Map saveCustGrp1(Map<String, DataSetMap> inDataset, Map <String, Object> inVar) throws Exception {
		DataSetMap inDsMap1 = (DataSetMap)inDataset.get("input1");
		Map saveCustGrp1 = new HashMap();
		saveCustGrp1.put("inDsMap", inDsMap1);
		saveCustGrp1.put("sqlnamespace", "custGrp.saveCustGrp1");
		
		DataSetMap inDsMap2 = (DataSetMap)inDataset.get("input2");
		Map saveCustGrp2 = new HashMap();
		saveCustGrp2.put("inDsMap", inDsMap2);
		saveCustGrp2.put("sqlnamespace", "custGrp.saveCustGrp2");
		
		List list = new ArrayList();
		list.add(saveCustGrp1);
		list.add(saveCustGrp2);
				
		Map result = rTSDCustGrpMapDAO.saveCustGrp1(inVar, list);
		return result;	
	}
	
	public Map saveCustGrp2(Map<String, DataSetMap> inDataset, Map <String, Object> inVar) throws Exception {
		DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
		inVar.put("inDsMap", inDsMap);
		inVar.put("sqlnamespace", "custGrp.saveCustGrp2");
		Map result = rTSDCustGrpMapDAO.saveCustGrp2(inVar);
		return result;	
	}
}
