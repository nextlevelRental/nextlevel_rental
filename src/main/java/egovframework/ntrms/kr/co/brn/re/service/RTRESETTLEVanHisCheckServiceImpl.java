package egovframework.ntrms.kr.co.brn.re.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ntrms.kr.co.brn.re.dao.RTRESETTLEVanHisCheckMapDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTRESETTLEVanHisCheckService")
@SuppressWarnings("unchecked")
public class RTRESETTLEVanHisCheckServiceImpl extends EgovAbstractServiceImpl implements RTRESETTLEVanHisCheckService {
	
	@Resource(name="rTRESETTLEVanHisCheckMapDAO")
	RTRESETTLEVanHisCheckMapDAO rTRESETTLEVanHisCheckMapDAO;

	public Map selectCheckSet(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map  result= new HashMap();
		result.put("selectCheckSet", rTRESETTLEVanHisCheckMapDAO.selectCheckSet(inVar, outDataset));
		return result;
	}
	
	public Map settleVanUploadFile(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		inVar.put("sqlnamespace", "rTRESETTLEVanHisCheckMapDAO.SETTLEVanUploadFile");
		Map result = rTRESETTLEVanHisCheckMapDAO.settleVanUploadFile(inVar);	
		return result;			
	}
	
	public Map resultUpdateRtre0046Check(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		inVar.put("sqlnamespace", "rTRESETTLEVanHisCheckMapDAO.resultUpdateRtre0046Check");
		Map result = rTRESETTLEVanHisCheckMapDAO.resultUpdateRtre0046Check(inVar);	
		return result;			
	}
	
	public Map saveVerProcess(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
		inVar.put("inDsMap", inDsMap);
		inVar.put("sqlnamespace", "rTRESETTLEVanHisCheckMapDAO.resultUpdateRtre0046Check");
		return rTRESETTLEVanHisCheckMapDAO.resultUpdateRtre0046Check(inVar);
	}
	
	public Map selectSRtre0046(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map  result= new HashMap();
		result.put("selectSRtre0046", rTRESETTLEVanHisCheckMapDAO.selectSRtre0046(inVar, outDataset));
		return result;
	}

}
