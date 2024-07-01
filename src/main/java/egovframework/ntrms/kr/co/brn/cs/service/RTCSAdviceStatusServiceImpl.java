/************************************************************************************
 * 1.Program  			: Common DataSet Service Implement
 * 2.File Name			: RTCSAdviceStatusServiceImpl.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.cs.service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nexacro.xapi.data.DataSet;

import egovframework.ntrms.kr.co.brn.cs.dao.RTCSAdviceStatusMapDAO;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTCSAdviceStatusService")
@SuppressWarnings("unchecked")
public class RTCSAdviceStatusServiceImpl extends EgovAbstractServiceImpl implements RTCSAdviceStatusService {
	
	
	@Resource(name="rTCSAdviceStatusMapDAO")
	RTCSAdviceStatusMapDAO rTCSAdviceStatusMapDAO;

	
	public Map listAdvice(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("listAdvice", rTCSAdviceStatusMapDAO.listAdvice(inVar, outDataset));
		return result;
	}
	
	public Map listmessage(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("listmessage", rTCSAdviceStatusMapDAO.listmessage(inVar, outDataset));
		return result;
	}

	public Map listmessage2(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("listmessage2", rTCSAdviceStatusMapDAO.listmessage2(inVar, outDataset));
		return result;
	}
		
	public Map listProvisionalContract2(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("listProvisionalContract2", rTCSAdviceStatusMapDAO.listProvisionalContract2(inVar, outDataset));
		return result;
	}
	
	public Map saveAdvice(Map<String, DataSetMap> inDataset, Map <String, Object> inVar) throws Exception {
		DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
		inVar.put("inDsMap", inDsMap);
		inVar.put("sqlnamespace", "advice.saveAdvice");
		Map result = rTCSAdviceStatusMapDAO.saveAdvice(inVar);
		return result;	
	}
	
	public Map saveAdviceCust(Map<String, DataSetMap> inDataset, Map <String, Object> inVar) throws Exception {
		DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
		inVar.put("inDsMap", inDsMap);
		inVar.put("sqlnamespace", "advice.saveAdviceCust");
		Map result = rTCSAdviceStatusMapDAO.saveAdviceCust(inVar);
		return result;	
	}
	
	public Map AdvicelistInstall(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("AdvicelistInstall", rTCSAdviceStatusMapDAO.AdvicelistInstall(inVar, outDataset));
		return result;
	}
	
	//정기점검 컨택목록조회
	public List<Map> selectAdviceCallList(Map<String, Object> inVar) throws Exception {
		return rTCSAdviceStatusMapDAO.selectAdviceCallList(inVar);
	}
	
	public Map listcontractInfo(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("result", 	rTCSAdviceStatusMapDAO.listcontractInfo(inVar));
		return result;
	}
	
	//정기점검 컨택목록조회
	public List<Map> AdviceCallList(Map<String, Object> inVar) throws Exception {
		return rTCSAdviceStatusMapDAO.AdviceCallList(inVar);
	}
}
