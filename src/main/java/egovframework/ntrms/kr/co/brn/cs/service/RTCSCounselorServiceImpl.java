/************************************************************************************
 * 1.Program  			: Common DataSet Service Implement
 * 2.File Name			: RTCSCounselorServiceImpl.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.cs.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ntrms.kr.co.brn.cs.dao.RTCSCounselorMapDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTCSCounselorService")
@SuppressWarnings("unchecked")
public class RTCSCounselorServiceImpl extends EgovAbstractServiceImpl implements RTCSCounselorService {
	
	
	@Resource(name="rTCSCounselorMapDAO")
	RTCSCounselorMapDAO rTCSCounselorMapDAO;

	//목록조회
	public List<Map> getCounselorList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		return rTCSCounselorMapDAO.getCounselorList(inVar, outDataset);
	}
	
	//상담사 마스터 정보 조회
	public List<Map> selectCounselorMasterList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		return rTCSCounselorMapDAO.selectCounselorMasterList(inVar, outDataset);
	}
		
	//상담사 마스터 정보 생성, 수정, 삭제
	public Map saveCounselorMaster(Map<String, DataSetMap> inDataset, Map inVar) throws Exception {
		DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
		inVar.put("inDsMap", inDsMap);
		inVar.put("sqlnamespace", "counselor.updateCounselorMaster");
		return rTCSCounselorMapDAO.saveCounselorMaster(inVar);
	}
			
		
	//데이타생성, 수정, 삭제
	public Map saveCounselorInfo(Map<String, DataSetMap> inDataset, Map inVar) throws Exception {
		DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
		inVar.put("inDsMap", inDsMap);
		inVar.put("sqlnamespace", "counselor.updateCounselor");
		return rTCSCounselorMapDAO.saveCounselorInfo(inVar);
	}
		
}
