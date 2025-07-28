package egovframework.ntrms.kr.co.brn.sd.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ntrms.kr.co.brn.sd.dao.RTSDCarMasterRegisterMapDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTSDCarMasterRegisterService")
@SuppressWarnings("unchecked")
public class RTSDCarMasterRegisterServiceImpl extends EgovAbstractServiceImpl implements RTSDCarMasterRegisterService{
	@Resource(name="rTSDCarMasterRegisterMapDAO")
	RTSDCarMasterRegisterMapDAO rTSDCarMasterRegisterMapDAO;
	
	public Map sRtsd0001ModelSelect(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("sRtsd0001ModelSelect", rTSDCarMasterRegisterMapDAO.sRtsd0001ModelSelect(inVar, outDataset));
		return result;
	}
	
	public Map sRtsd0001ModelByClassSelect(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("sRtsd0001ModelByClassSelect", rTSDCarMasterRegisterMapDAO.sRtsd0001ModelByClassSelect(inVar, outDataset));
		return result;
	}
	
	public Map sRtsd0001ContentsSelect(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("sRtsd0001ContentsSelect", rTSDCarMasterRegisterMapDAO.sRtsd0001ContentsSelect(inVar, outDataset));
		return result;
	}
	
	public Map carMasterSelect(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map  result= new HashMap();
		result.put("carMasterSelect", rTSDCarMasterRegisterMapDAO.carMasterSelect(inVar, outDataset));
		return result;
	}
	
	public Map saveRTSDCarMasterRegister(Map<String, DataSetMap> inDataset, Map <String, Object> inVar) throws Exception {
		DataSetMap dsRtre0001 	= (DataSetMap)inDataset.get("dsRtre0001");
		DataSetMap dsRtre0002 	= (DataSetMap)inDataset.get("dsRtre0002");
		DataSetMap dsRtreUpdate = (DataSetMap)inDataset.get("dsRtreUpdate");
		
		Map dsRtre0001Map = new HashMap();
		dsRtre0001Map.put("dsRtre0001Map", dsRtre0001);
		dsRtre0001Map.put("sqlnamespace", "carMasterRegister.dsRtre0001");
		
		Map dsRtre0002Map = new HashMap();
		dsRtre0002Map.put("dsRtre0002Map", dsRtre0002);
		dsRtre0002Map.put("sqlnamespace", "carMasterRegister.dsRtre0002");
		
		Map dsRtreUpdateMap = new HashMap();
		dsRtreUpdateMap.put("dsRtreUpdateMap", dsRtreUpdate);
		dsRtreUpdateMap.put("sqlnamespace", "carMasterRegister.dsRtreUpdateMap");
		
		return rTSDCarMasterRegisterMapDAO.saveRTSDCarMasterRegister(dsRtre0001Map, dsRtre0002Map, dsRtreUpdateMap, inVar);		
	}
}
