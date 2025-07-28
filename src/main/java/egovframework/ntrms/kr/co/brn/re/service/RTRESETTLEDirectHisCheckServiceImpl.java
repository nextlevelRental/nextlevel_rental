package egovframework.ntrms.kr.co.brn.re.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ntrms.kr.co.brn.re.dao.RTRESETTLEDirectHisCheckMapDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTRESETTLEDirectHisCheckService")
@SuppressWarnings("unchecked")
public class RTRESETTLEDirectHisCheckServiceImpl extends EgovAbstractServiceImpl implements RTRESETTLEDirectHisCheckService {
	
	@Resource(name="rTRESETTLEDirectHisCheckMapDAO")
	RTRESETTLEDirectHisCheckMapDAO rTRESETTLEDirectHisCheckMapDAO;

	public Map selectCheckSet(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map  result= new HashMap();
		result.put("selectCheckSet", rTRESETTLEDirectHisCheckMapDAO.selectCheckSet(inVar, outDataset));
		return result;
	}
	
	public Map settleDirectUploadFile(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		inVar.put("sqlnamespace", "rTRESETTLEDirectHisCheckMapDAO.SETTLEDirectUploadFile");
		Map result = rTRESETTLEDirectHisCheckMapDAO.settleDirectUploadFile(inVar);	
		return result;			
	}
	
	public Map resultUpdateRtre0045Check(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		inVar.put("sqlnamespace", "rTRESETTLEDirectHisCheckMapDAO.resultUpdateRtre0045Check");
		Map result = rTRESETTLEDirectHisCheckMapDAO.resultUpdateRtre0045Check(inVar);	
		return result;			
	}
	
	public Map saveVerProcess(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
		inVar.put("inDsMap", inDsMap);
		inVar.put("sqlnamespace", "rTRESETTLEDirectHisCheckMapDAO.resultUpdateRtre0045Check");
		return rTRESETTLEDirectHisCheckMapDAO.resultUpdateRtre0045Check(inVar);
	}
	
	public Map selectSRtre0045(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map  result= new HashMap();
		result.put("selectSRtre0045", rTRESETTLEDirectHisCheckMapDAO.selectSRtre0045(inVar, outDataset));
		return result;
	}

}
