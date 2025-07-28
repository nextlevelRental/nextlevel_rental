package egovframework.ntrms.kr.co.brn.sd.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ntrms.kr.co.brn.sd.dao.RTSDCarStandardRegisterMapDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTSDCarStandardRegisterService")
@SuppressWarnings("unchecked")
public class RTSDCarStandardRegisterServiceImpl extends EgovAbstractServiceImpl implements RTSDCarStandardRegisterService{
	@Resource(name="rTSDCarStandardRegisterMapDAO")
	RTSDCarStandardRegisterMapDAO rTSDCarStandardRegisterMapDAO;
	
	public Map sRtsd0004ContentsCdSelect(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("sRtsd0004ContentsCdSelect", rTSDCarStandardRegisterMapDAO.sRtsd0004ContentsCdSelect(inVar, outDataset));
		return result;
	}
	
	public Map sRtsd0004FrCdSelect(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("sRtsd0004FrCdSelect", rTSDCarStandardRegisterMapDAO.sRtsd0004FrCdSelect(inVar, outDataset));
		return result;
	}
	
	public Map sRtsd0004PlyRatingCdSelect(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("sRtsd0004PlyRatingCdSelect", rTSDCarStandardRegisterMapDAO.sRtsd0004PlyRatingCdSelect(inVar, outDataset));
		return result;
	}
	
	public Map sRtsd0004SectionWidthSelect(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("sRtsd0004SectionWidthSelect", rTSDCarStandardRegisterMapDAO.sRtsd0004SectionWidthSelect(inVar, outDataset));
		return result;
	}
	
	public Map sRtsd0004AspectRatioSelect(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("sRtsd0004AspectRatioSelect", rTSDCarStandardRegisterMapDAO.sRtsd0004AspectRatioSelect(inVar, outDataset));
		return result;
	}
	
	public Map sRtsd0004WheelInchesSelect(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("sRtsd0004WheelInchesSelect", rTSDCarStandardRegisterMapDAO.sRtsd0004WheelInchesSelect(inVar, outDataset));
		return result;
	}
	
	public Map sRtsd0004Select(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("sRtsd0004Select", rTSDCarStandardRegisterMapDAO.sRtsd0004Select(inVar, outDataset));
		return result;
	}
	
	public Map saveRTSDCarStandardRegister(Map<String, DataSetMap> inDataset, Map <String, Object> inVar) throws Exception {
		DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
		inVar.put("inDsMap", inDsMap);
		inVar.put("sqlnamespace", "carStandardRegister.saveRTSDCarStandardRegister");
		Map result = rTSDCarStandardRegisterMapDAO.saveRTSDCarStandardRegister(inVar);
		return result;	
	}
}
