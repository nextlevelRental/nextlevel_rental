package egovframework.ntrms.kr.co.brn.cs.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ntrms.kr.co.brn.cs.dao.RTCSEngineOilRepSerMapDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTCSEngineOilRepSerService")
@SuppressWarnings("unchecked")
public class RTCSEngineOilRepSerServiceImpl extends EgovAbstractServiceImpl implements RTCSEngineOilRepSerService {
	
	@Resource(name="rTCSEngineOilRepSerMapDAO")
	RTCSEngineOilRepSerMapDAO rTCSEngineOilRepSerMapDAO;
	
	public String selectServrqDay(Map<String, Object> inVar) throws Exception {
		return rTCSEngineOilRepSerMapDAO.selectServrqDay(inVar);
	}
	
	public String selectServrqDayByTerm(Map<String, Object> inVar) throws Exception {
		return rTCSEngineOilRepSerMapDAO.selectServrqDayByTerm(inVar);
	}
	
	public String selectEngineOilServrqDay(Map<String, Object> inVar) throws Exception {
		return rTCSEngineOilRepSerMapDAO.selectEngineOilServrqDay(inVar);
	}	
	
	public Map selectRTCSEngineOilRepSer(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("pSRtcs0009SelectOrderList", rTCSEngineOilRepSerMapDAO.pSRtcs0009SelectOrderList(inVar, outDataset));
		return result;
	}
	
	public Map saveRTCSEngineOilRepSer(Map<String, DataSetMap> inDataset,Map<String, Object> inVar) throws Exception {
		DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
		inVar.put("inDsMap", inDsMap);
		inVar.put("sqlnamespace", "rTCSEngineOilRep.p_IUDRtcs0009");
		return rTCSEngineOilRepSerMapDAO.saveRTCSEngineOilRepSer(inVar);
	}
	
	public Map saveRTCSEngineOilInvMan(Map<String, DataSetMap> inDataset,Map<String, Object> inVar) throws Exception {
		DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
		inVar.put("inDsMap", inDsMap);
		inVar.put("sqlnamespace", "rTCSEngineOilRep.p_UpdateRtcs0009TrspDoc");
		return rTCSEngineOilRepSerMapDAO.saveRTCSEngineOilInvMan(inVar);
	}
	
	public Map engineOilChangeServiceList(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("engineOilChangeServiceList", rTCSEngineOilRepSerMapDAO.engineOilChangeServiceList(inVar, outDataset));
		return result;
	}

	public Map engineOilChangeServiceExcelDown(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		inVar.put("sqlnamespace", "rTCSEngineOilRep.engineOilChangeServiceExcelDown");
		Map result = (Map)rTCSEngineOilRepSerMapDAO.engineOilChangeServiceExcelDown(inVar);
		return result;	
	}
	
	public Map engineOilChangeServiceDownList(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("engineOilChangeServiceDownList", rTCSEngineOilRepSerMapDAO.engineOilChangeServiceDownList(inVar, outDataset));
		return result;
	}

	public Map selectRTCSZeroServiceList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("pSRtcs0010SelectOrderList", rTCSEngineOilRepSerMapDAO.pSRtcs0010SelectOrderList(inVar, outDataset)); 
		return result;
	}	  

	public Map saveRTCSZeroRepSer(Map<String, DataSetMap> inDataset,Map<String, Object> inVar) throws Exception {
		DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
		DataSetMap inDsMap1 = (DataSetMap)inDataset.get("input1");
		inVar.put("inDsMap", inDsMap);
		inVar.put("inDsMap1", inDsMap1);
		inVar.put("sqlnamespace", "rTCSZeroRep.p_IUDRtcs0010");
		return rTCSEngineOilRepSerMapDAO._saveRTCSEngineOilRepSer(inVar);
	}

	public Map zeroChangeServiceList(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("zeroChangeServiceList", rTCSEngineOilRepSerMapDAO.zeroChangeServiceList(inVar, outDataset));
		return result;
	}	
	
	public Map saveRTSD0213(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		DataSetMap inDsRtsd0213Map = (DataSetMap)inDataset.get("input1");
		inVar.put("inDsMap", inDsRtsd0213Map);
		inVar.put("sqlnamespace", "comm.insertOmsIFLog");
		return rTCSEngineOilRepSerMapDAO.saveRTSD0213(inVar);
	}
}
