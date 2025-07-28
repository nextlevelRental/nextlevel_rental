package egovframework.ntrms.kr.co.brn.re.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ntrms.kr.co.brn.re.dao.RTREKCPPayHisCheckMapDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTREKCPPayHisCheckService")
@SuppressWarnings("unchecked")
public class RTREKCPPayHisCheckServiceImpl extends EgovAbstractServiceImpl implements RTREKCPPayHisCheckService {
	
	@Resource(name="rTREKCPPayHisCheckMapDAO")
	RTREKCPPayHisCheckMapDAO rTREKCPPayHisCheckMapDAO;

	public Map selectCheckSet(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map  result= new HashMap();
		result.put("selectCheckSet", rTREKCPPayHisCheckMapDAO.selectCheckSet(inVar, outDataset));
		return result;
	}
	
	public Map accApproveUploadFile(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		inVar.put("sqlnamespace", "rTREKCPPayHisCheckMapDAO.accApproveUploadFile");
		Map result = rTREKCPPayHisCheckMapDAO.accApproveUploadFile(inVar);	
		return result;			
	}
	
	public Map resultUpdateRtre0043Check(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		inVar.put("sqlnamespace", "rTREKCPPayHisCheckMapDAO.resultUpdateRtre0043Check");
		Map result = rTREKCPPayHisCheckMapDAO.resultUpdateRtre0043Check(inVar);	
		return result;			
	}
	
	public Map saveVerProcess(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
		inVar.put("inDsMap", inDsMap);
		inVar.put("sqlnamespace", "rTREKCPPayHisCheckMapDAO.resultUpdateRtre0043Check");
		return rTREKCPPayHisCheckMapDAO.resultUpdateRtre0043Check(inVar);
	}
	
	public Map selectSRtre0043(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map  result= new HashMap();
		result.put("selectSRtre0043", rTREKCPPayHisCheckMapDAO.selectSRtre0043(inVar, outDataset));
		return result;
	}
}
