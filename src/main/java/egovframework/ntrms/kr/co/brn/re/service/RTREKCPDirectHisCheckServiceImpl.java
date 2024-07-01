package egovframework.ntrms.kr.co.brn.re.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ntrms.kr.co.brn.re.dao.RTREKCPDirectHisCheckMapDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTREKCPDirectHisCheckService")
@SuppressWarnings("unchecked")
public class RTREKCPDirectHisCheckServiceImpl extends EgovAbstractServiceImpl implements RTREKCPDirectHisCheckService {
	
	@Resource(name="rTREKCPDirectHisCheckMapDAO")
	RTREKCPDirectHisCheckMapDAO rTREKCPDirectHisCheckMapDAO;

	public Map selectCheckSet(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map  result= new HashMap();
		result.put("selectCheckSet", rTREKCPDirectHisCheckMapDAO.selectCheckSet(inVar, outDataset));
		return result;
	}
	
	public Map kcpDirectUploadFile(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		inVar.put("sqlnamespace", "rTREKCPDirectHisCheckMapDAO.KCPDirectUploadFile");
		Map result = rTREKCPDirectHisCheckMapDAO.kcpDirectUploadFile(inVar);	
		return result;			
	}
	
	public Map resultUpdateRtre0044Check(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		inVar.put("sqlnamespace", "rTREKCPDirectHisCheckMapDAO.resultUpdateRtre0044Check");
		Map result = rTREKCPDirectHisCheckMapDAO.resultUpdateRtre0044Check(inVar);	
		return result;			
	}
	
	public Map saveVerProcess(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
		inVar.put("inDsMap", inDsMap);
		inVar.put("sqlnamespace", "rTREKCPDirectHisCheckMapDAO.resultUpdateRtre0044Check");
		return rTREKCPDirectHisCheckMapDAO.resultUpdateRtre0044Check(inVar);
	}
	
	public Map selectSRtre0044(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map  result= new HashMap();
		result.put("selectSRtre0044", rTREKCPDirectHisCheckMapDAO.selectSRtre0044(inVar, outDataset));
		return result;
	}

}
