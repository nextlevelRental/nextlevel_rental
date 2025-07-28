/************************************************************************************
 * 1.Program  			: Common DataSet Service Implement
 * 2.File Name			: RTCMUserServiceImpl.java
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

import egovframework.ntrms.kr.co.brn.cs.dao.RTCSCarmasterAreaMapDAO;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTCSCarmasterAreaService")
@SuppressWarnings("unchecked")
public class RTCSCarmasterAreaServiceImpl extends EgovAbstractServiceImpl implements RTCSCarmasterAreaService {
	
	
	@Resource(name="rTCSCarmasterAreaMapDAO")
	RTCSCarmasterAreaMapDAO rTCSCarmasterAreaMapDAO;

	//목록조회
	public List<Map> getCarmasterAreaList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		return rTCSCarmasterAreaMapDAO.getCarmasterAreaList(inVar, outDataset);
	}
		
	//데이타생성, 수정, 삭제
	public Map saveCarmasterAreaInfo(Map<String, DataSetMap> inDataset, Map inVar) throws Exception {
		DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
		
		inVar.put("inDsMap", inDsMap);
		inVar.put("sqlnamespace", "carMasterArea.updateCarmasterArea");
		return rTCSCarmasterAreaMapDAO.saveCarmasterAreaInfo(inVar);
		
	}
	
	//카마스터팝업
	public List<Map> carmasterPopUp(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		return rTCSCarmasterAreaMapDAO.carmasterPopUp(inVar, outDataset);
	}
	
	/**
	 * 사번으로 로디안 정보를 조회한다
	 * 
	 * @param inVar
	 * @param outDataset
	 * @return List
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2017-06-22	wjim		[20170622_01] 신규생성
	 */
	public List<Map> carmasterNu(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		return rTCSCarmasterAreaMapDAO.carmasterNu(inVar, outDataset);
	}
	
	//미스터로디안 수정, 삭제
	public Map saveCarmasterMemReg(Map<String, DataSetMap> inDataset, Map inVar) throws Exception {
		DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
		
		inVar.put("inDsMap", inDsMap);
		inVar.put("sqlnamespace", "carMasterArea.iudCarmasterMemGeg");
		return rTCSCarmasterAreaMapDAO.saveCarmasterAreaInfo(inVar);
		
	}	
	
	
}
