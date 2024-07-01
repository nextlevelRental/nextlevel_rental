/************************************************************************************
 * 1.Program  			: Common DataSet Service Implement
 * 2.File Name			: RTCMMenuServiceImpl.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.cm.service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nexacro.xapi.data.DataSet;

import egovframework.ntrms.kr.co.brn.cm.dao.RTCMMenuProRegMapDAO;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTCMMenuProRegService")
@SuppressWarnings("unchecked")
public class RTCMMenuProRegServiceImpl extends EgovAbstractServiceImpl implements RTCMMenuProRegService {
	
	
	@Resource(name="rTCMMenuProRegMapDAO")
	RTCMMenuProRegMapDAO rTCMMenuProRegMapDAO;
	
	//트리 목록조회
	public Map listTreeMenu(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("listTreeMenu", 	rTCMMenuProRegMapDAO.listTreeMenu(inVar, outDataset));
		return result;
	}
	
	//목록조회
	public Map listMenu(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("listMenu", 	rTCMMenuProRegMapDAO.listMenu(inVar, outDataset));
		return result;
	}	
	//데이타생성, 수정, 삭제
	public Map saveMenuInfo(Map<String, DataSetMap> inDataset, Map<String, Object> inVar)
		throws Exception {
		DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
		
		for(int i = 0; i<inDsMap.size(); i++) {
			Map map = inDsMap.get(i);
			map.put("menuCd", inVar.get("menuCd"));
			map.put("regId", inVar.get("regId"));
			int rowType = ((Integer) map.get(NexacroConstant.DATASET_ROW_TYPE)).intValue(); 
			if(rowType == DataSet.ROW_TYPE_INSERTED) {
				map.put("dvsn", "I");
				
			} else if(rowType == DataSet.ROW_TYPE_UPDATED) {
				map.put("dvsn", "U");
				
			} else if(rowType == DataSet.ROW_TYPE_DELETED) {
				map.put("dvsn", "D");
				
			}
		}
		inVar.put("inDsMap", inDsMap);
		inVar.put("sqlnamespace", "menuPro.saveMenuInfoPro");
		return rTCMMenuProRegMapDAO.saveMenuInfo(inVar);
		
	}
	
	public Map listMenuAuthPro(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("authList", 	rTCMMenuProRegMapDAO.listMenuAuthPro(inVar, outDataset));
		return result;
	}	
	
	public Map listMenuAuthNotPro(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("authNotList", 	rTCMMenuProRegMapDAO.listMenuAuthNotPro(inVar, outDataset));
		return result;
	}	

}
