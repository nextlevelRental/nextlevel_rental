package egovframework.ntrms.kr.co.brn.sd.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ntrms.kr.co.brn.sd.dao.RTSDOrdAgentMapDAO;
import egovframework.ntrms.kr.co.exec.handler.service.ComService;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;

@Service("rTSDOrdAgentService")
@SuppressWarnings("unchecked")
//public class RTSDOrdAgentServiceImpl extends EgovAbstractServiceImpl implements RTSDOrdAgentService {
public class RTSDOrdAgentServiceImpl extends ComService implements RTSDOrdAgentService {
	
	@Resource(name="rTSDOrdAgentMapDAO")
	RTSDOrdAgentMapDAO rTSDOrdAgentMapDAO;
	
	public Map selectOrdAgentList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map  result= new HashMap();
		result.put("selectOrdAgentList", rTSDOrdAgentMapDAO.selectOrdAgentList(inVar, outDataset));
		return result;
	}
	
	public Map selectOrdAgentOrderList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map  result= new HashMap();
		result.put("selectOrdAgentOrderList", rTSDOrdAgentMapDAO.selectOrdAgentOrderList(inVar, outDataset));
		return result;
	}
	
	public List<?> selectOrdAgentOrderListNew(Map<String, Object> inVar) throws Exception {
	    this.queryForObject( "rTSDOrdAgent.selectOrdAgentOrderListNew", inVar );
        return ( List ) inVar.get( "vcursor" );
	}
	
	public Map selectRTSDOrdAgentRegister(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map  result= new HashMap();
		result.put("selectRTSDOrdAgentRegister", rTSDOrdAgentMapDAO.selectRTSDOrdAgentRegister(inVar, outDataset));
		return result;
	}
	
	public Map saveRTSDOrdAgentRegister(Map<String, DataSetMap> inDataset,Map<String, Object> inVar) throws Exception {
		DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
		inVar.put("inDsMap", inDsMap);
		inVar.put("sqlnamespace", "rTSDOrdAgent.saveRTSDOrdAgentRegister");
		return rTSDOrdAgentMapDAO.saveRTSDOrdAgentRegister(inVar);
	}
	
	public int checkOrdAgent(Map<String, Object> inVar) throws Exception {
		inVar.put("result", "result");
		return rTSDOrdAgentMapDAO.checkOrdAgent(inVar);
	}
}
