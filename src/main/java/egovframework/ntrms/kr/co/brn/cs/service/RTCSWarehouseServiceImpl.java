package egovframework.ntrms.kr.co.brn.cs.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ntrms.kr.co.brn.cs.dao.RTCSWarehouseMapDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTCSWarehouseService")
@SuppressWarnings("unchecked")
public class RTCSWarehouseServiceImpl extends EgovAbstractServiceImpl implements RTCSWarehouseService {
	
	@Resource(name="rTCSWarehouseMapDAO")
	RTCSWarehouseMapDAO rTCSWarehouseMapDAO;
	
	public int checkWarehCd(Map<String, Object> inVar) throws Exception {
		inVar.put("result", "result");
		return rTCSWarehouseMapDAO.checkWarehCd(inVar);
	}
	
	public Map saveRTCSWarehouseRegister(Map<String, DataSetMap> inDataset,Map<String, Object> inVar) throws Exception {
		DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
		inVar.put("inDsMap", inDsMap);
		inVar.put("sqlnamespace", "rTCSWarehouse.p_IUDRtcs0200");
		return rTCSWarehouseMapDAO.saveRTCSWarehouseRegister(inVar);
	}
	
	public Map selectRTCSWarehouseRegister(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("selectRTCSWarehouseRegister", rTCSWarehouseMapDAO.selectRTCSWarehouseRegister(inVar, outDataset));
		return result;
	}
	
	public Map selectRTCSWarehouseUpdateList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("selectRTCSWarehouseUpdateList", rTCSWarehouseMapDAO.selectRTCSWarehouseUpdateList(inVar, outDataset));
		return result;
	}
	
	public Map saveRTCSWarehAgencyRegister(Map<String, DataSetMap> inDataset,Map<String, Object> inVar) throws Exception {
		DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
		inVar.put("inDsMap", inDsMap);
		inVar.put("sqlnamespace", "rTCSWarehouse.p_IUDRtcs0202");
		return rTCSWarehouseMapDAO.saveRTCSWarehAgencyRegister(inVar);
	}
	
	public Map selectRTCSWarehAgencyRegister(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("selectRTCSWarehAgencyRegister", rTCSWarehouseMapDAO.selectRTCSWarehAgencyRegister(inVar, outDataset));
		return result;
	}
}
