/************************************************************************************
 * 1.Program  			: Common DataSet Service Implement
 * 2.File Name			: RTCMMenuServiceImpl.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.cm.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ntrms.kr.co.brn.cm.dao.RTCMMenuMapDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTCMMenuService")
@SuppressWarnings("unchecked")
public class RTCMMenuServiceImpl extends EgovAbstractServiceImpl implements RTCMMenuService {
	
	
	@Resource(name="rTCMMenuMapDAO")
	RTCMMenuMapDAO rTCMMenuMapDAO;
	
	//트리 목록조회
	public Map listTreeMenu(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("listTreeMenu", 	rTCMMenuMapDAO.listTreeMenu(inVar, outDataset));
		return result;
	}
	
	//목록조회
	public Map listMenu(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("listMenu", 	rTCMMenuMapDAO.listMenu(inVar, outDataset));
		return result;
	}	
	
	//데이타생성, 수정, 삭제
	public Map saveMenuInfo(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
		
		inVar.put("inDsMap", inDsMap);
		inVar.put("sqlnamespace", "menu.saveMenuInfo");
		

		Map result = rTCMMenuMapDAO.saveMenuInfo(inVar);
		return result;		
	}

	/*************************
	 * 메뉴코드 중복확인
	 *************************/
	public int checkMenuCdExists(Map<String, Object> inVar) throws Exception {
		// TODO Auto-generated method stub
		inVar.put("result", "result");
		return rTCMMenuMapDAO.checkMenuCdExists(inVar);
	}
}
