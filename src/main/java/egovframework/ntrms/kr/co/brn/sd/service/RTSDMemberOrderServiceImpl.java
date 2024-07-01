/************************************************************************************
 * 1.Program  			: Common DataSet Service Implement
 * 2.File Name			: RTCMUserServiceImpl.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.sd.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ntrms.kr.co.brn.sd.dao.RTSDMemberOrderMapDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTSDMemberOrderService")
@SuppressWarnings("unchecked")
public class RTSDMemberOrderServiceImpl extends EgovAbstractServiceImpl implements RTSDMemberOrderService {
	
	@Resource(name="rTSDMemberOrderMapDAO")
	RTSDMemberOrderMapDAO rTSDMemberOrderMapDAO;
	
	public Map listCommInfo(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("result", 	rTSDMemberOrderMapDAO.listCommInfo(inVar));
		return result;
	}
	
	public Map saveMemberOrder(Map<String, DataSetMap> inDataset, Map <String, Object> inVar) throws Exception {
		
		DataSetMap bank = (DataSetMap)inDataset.get("dsRtre0010");
		DataSetMap card = (DataSetMap)inDataset.get("dsRtre0020");
		
		Map bankAndCardMap = new HashMap();
		if( bank.size() != 0 ){
			bankAndCardMap.put("bankAndCardMap", bank);
			bankAndCardMap.put("sqlnamespace", "contact.saveBank");
		}else if( card.size() != 0 ){
			bankAndCardMap.put("bankAndCardMap", card);
			bankAndCardMap.put("sqlnamespace", "contact.saveCard");
		}
		
		
		DataSetMap dsRtsd0100 = (DataSetMap)inDataset.get("dsRtsd0100");
		Map dsRtsd0100Map = new HashMap();
		dsRtsd0100Map.put("dsRtsd0100Map", dsRtsd0100);
		dsRtsd0100Map.put("sqlnamespace", "contact.dsRtsd0100Member");
		
		DataSetMap dsRtsd0104 = (DataSetMap)inDataset.get("dsRtsd0104");
		Map dsRtsd0104Map = new HashMap();
		dsRtsd0104Map.put("dsRtsd0104Map", dsRtsd0104);
		dsRtsd0104Map.put("sqlnamespace", "contact.dsRtsd0104Member");
		
		DataSetMap dsRtsd0106 = (DataSetMap)inDataset.get("dsRtsd0106");
		Map dsRtsd0106Map = new HashMap();
		dsRtsd0106Map.put("dsRtsd0106Map", dsRtsd0106);
		dsRtsd0106Map.put("sqlnamespaceDel", "contact.f_DeleteRtsd0106Member");
		dsRtsd0106Map.put("sqlnamespace", "contact.dsRtsd0106Member");
		
		DataSetMap dsRtsd0013 = (DataSetMap)inDataset.get("dsRtsd0013");
		Map dsRtsd0013Map = new HashMap();
		dsRtsd0013Map.put("dsRtsd0013Map", dsRtsd0013);
		dsRtsd0013Map.put("sqlnamespaceDel", "contact.f_DeleteRtsd0013Member");
		dsRtsd0013Map.put("sqlnamespace", "contact.dsRtsd0013Member");
		
		
		return rTSDMemberOrderMapDAO.saveMemberOrder(bankAndCardMap, dsRtsd0100Map, dsRtsd0104Map, dsRtsd0106Map, dsRtsd0013Map, inVar);		
	}
	
	public Map listAddSelProduct2(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("result", 	rTSDMemberOrderMapDAO.listAddSelProduct2(inVar));
		return result;
	}
	
	public String getcheckOrdNo(Map<String, Object> inVar) throws Exception {
		return rTSDMemberOrderMapDAO.getcheckOrdNo(inVar);
	}
	
}
