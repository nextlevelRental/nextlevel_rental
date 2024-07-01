package egovframework.ntrms.kr.co.brn.re.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ntrms.kr.co.brn.re.dao.RTRESalesCommMangMapDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTRESalesCommMangService")
@SuppressWarnings("unchecked")
public class RTRESalesCommMangServiceImpl extends EgovAbstractServiceImpl implements RTRESalesCommMangService {
	@Resource(name="rTRESalesCommMangMapDAO")
	RTRESalesCommMangMapDAO rTRESalesCommMangMapDAO;

	public Map selectRTRESalesCommMang(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("selectRTRESalesCommMang", rTRESalesCommMangMapDAO.selectRTRESalesCommMang(inVar));
		return  result;
	}
	
	public Map saveRTRESalesCommMang(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
		inVar.put("inDsMap", inDsMap);
		inVar.put("sqlnamespace", "rTRESalesCommMang.saveRTRESalesCommMang");
		return rTRESalesCommMangMapDAO.saveRTRESalesCommMang(inVar);
	}
	
	public Map selectRTRESalesCommMangOpenMall(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("selectRTRESalesCommMangOpenMall", rTRESalesCommMangMapDAO.selectRTRESalesCommMangOpenMall(inVar));
		return  result;
	}
	
	public Map saveRTRESalesCommMangOpenMall(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
		inVar.put("inDsMap", inDsMap);
		inVar.put("sqlnamespace", "rTRESalesCommMang.saveRTRESalesCommMangOpenMall");
		return rTRESalesCommMangMapDAO.saveRTRESalesCommMangOpenMall(inVar);
	}
	
	public Map selectRTREInstallCommMang(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("selectRTREInstallCommMang", rTRESalesCommMangMapDAO.selectRTREInstallCommMang(inVar));
		return  result;
	}
	
	public Map saveRTREInstallCommMang(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
		inVar.put("inDsMap", inDsMap);
		inVar.put("sqlnamespace", "rTRESalesCommMang.saveRTREInstallCommMang");
		return rTRESalesCommMangMapDAO.saveRTREInstallCommMang(inVar);
	}
	
	public Map selectRTREServiceCommMang(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("selectRTREServiceCommMang", rTRESalesCommMangMapDAO.selectRTREServiceCommMang(inVar));
		return  result;
	}
	
	public Map saveRTREServiceCommMang(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
		inVar.put("inDsMap", inDsMap);
		inVar.put("sqlnamespace", "rTRESalesCommMang.saveRTREServiceCommMang");
		return rTRESalesCommMangMapDAO.saveRTREServiceCommMang(inVar);
	}

	public Map rtreSalesChargeInsentive(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("rtreSalesChargeInsentive", rTRESalesCommMangMapDAO.rtreSalesChargeInsentive(inVar));
		return  result;
	}
}
