/************************************************************************************
 * 1.Program  			: Common DataSet Service Implement
 * 2.File Name			: RTCMUserServiceImpl.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.sd.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ntrms.kr.co.brn.sd.dao.RTSDDirectOrderMapDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTSDDirectOrderService")
@SuppressWarnings("unchecked")
public class RTSDDirectOrderServiceImpl extends EgovAbstractServiceImpl implements RTSDDirectOrderService {
	
	@Resource(name="rTSDDirectOrderMapDAO")
	RTSDDirectOrderMapDAO rTSDDirectOrderMapDAO;
	
	public Map directseqOrdNo(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map  result= new HashMap();
		result.put("selectOrdAgentList", rTSDDirectOrderMapDAO.directseqOrdNo(inVar, outDataset));
		return result;
	}
	
	public Map saveDirectOrder(Map<String, DataSetMap> inDataset, Map <String, Object> inVar) throws Exception {
		
		DataSetMap dsRtsd0100 = (DataSetMap)inDataset.get("dsRtsd0100");
		Map dsRtsd0100Map = new HashMap();
		dsRtsd0100Map.put("dsRtsd0100Map", dsRtsd0100);
		dsRtsd0100Map.put("sqlnamespace", "contact.dsRtsd0100");
		
		DataSetMap dsRtsd0104 = (DataSetMap)inDataset.get("dsRtsd0104");
		Map dsRtsd0104Map = new HashMap();
		dsRtsd0104Map.put("dsRtsd0104Map", dsRtsd0104);
		dsRtsd0104Map.put("sqlnamespace", "contact.dsRtsd0104Direct");
		
		DataSetMap dsRtsd0106 = (DataSetMap)inDataset.get("dsRtsd0106");
		Map dsRtsd0106Map = new HashMap();
		dsRtsd0106Map.put("dsRtsd0106Map", dsRtsd0106);
		dsRtsd0106Map.put("sqlnamespaceDel", "contact.f_DeleteRtsd0106Direct");
		dsRtsd0106Map.put("sqlnamespace", "contact.dsRtsd0106Direct");
		
		DataSetMap dsRtsd0013 = (DataSetMap)inDataset.get("dsRtsd0013");
		Map dsRtsd0013Map = new HashMap();
		dsRtsd0013Map.put("dsRtsd0013Map", dsRtsd0013);
		dsRtsd0013Map.put("sqlnamespaceDel", "contact.f_DeleteRtsd0013Direct");
		dsRtsd0013Map.put("sqlnamespace", "contact.dsRtsd0013Direct");

		
		DataSetMap dsRtsd0041 = (DataSetMap)inDataset.get("dsRtsd0041");
		Map dsRtsd0041Map = new HashMap();
		dsRtsd0041Map.put("dsRtsd0041Map", dsRtsd0041);
		dsRtsd0041Map.put("sqlnamespaceDel", "contact.f_DeleteRtsd0041Direct");
		dsRtsd0041Map.put("sqlnamespace", "contact.dsRtsd0041Direct");
				
		// [20181122_01] 방문장착 추가
		DataSetMap dsRtsd0401 = (DataSetMap)inDataset.get("dsRtsd0401");
		Map dsRtsd0401Map = new HashMap();
		dsRtsd0401Map.put("dsRtsd0401Map", dsRtsd0401);
		dsRtsd0401Map.put("sqlnamespace", "contact.dsRtsd0401"); 

		return rTSDDirectOrderMapDAO.saveDirectOrder(dsRtsd0100Map, dsRtsd0104Map, dsRtsd0106Map, dsRtsd0013Map, dsRtsd0041Map, dsRtsd0401Map, inVar);		
	}
	
	public Map listAddSelProduct3(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("result", 	rTSDDirectOrderMapDAO.listAddSelProduct3(inVar));
		return result;
	}
	
	public Map saveDirectOrder2(Map<String, DataSetMap> inDataset, Map <String, Object> inVar) throws Exception {
		
		DataSetMap dsRtsd0104 = (DataSetMap)inDataset.get("dsRtsd0104");
		Map dsRtsd0104Map = new HashMap();
		dsRtsd0104Map.put("dsRtsd0104Map", dsRtsd0104);
		dsRtsd0104Map.put("sqlnamespace", "contact.dsRtsd0104Direct");
		
		DataSetMap dsRtsd0106 = (DataSetMap)inDataset.get("dsRtsd0106");
		Map dsRtsd0106Map = new HashMap();
		dsRtsd0106Map.put("dsRtsd0106Map", dsRtsd0106);
		dsRtsd0106Map.put("sqlnamespaceDel", "contact.f_DeleteRtsd0106Direct");
		dsRtsd0106Map.put("sqlnamespace", "contact.dsRtsd0106Direct");
		
		DataSetMap dsRtsd0013 = (DataSetMap)inDataset.get("dsRtsd0013");
		Map dsRtsd0013Map = new HashMap();
		dsRtsd0013Map.put("dsRtsd0013Map", dsRtsd0013);
		dsRtsd0013Map.put("sqlnamespaceDel", "contact.f_DeleteRtsd0013Direct");
		dsRtsd0013Map.put("sqlnamespace", "contact.dsRtsd0013Direct");

		
		DataSetMap dsRtsd0041 = (DataSetMap)inDataset.get("dsRtsd0041");
		Map dsRtsd0041Map = new HashMap();
		dsRtsd0041Map.put("dsRtsd0041Map", dsRtsd0041);
		dsRtsd0041Map.put("sqlnamespaceDel", "contact.f_DeleteRtsd0041Direct");
		dsRtsd0041Map.put("sqlnamespace", "contact.dsRtsd0041Direct");
				
		
		return rTSDDirectOrderMapDAO.saveDirectOrder2(dsRtsd0104Map, dsRtsd0106Map, dsRtsd0013Map, dsRtsd0041Map, inVar);		
	}
	
}
