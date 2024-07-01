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

import egovframework.ntrms.kr.co.brn.sd.dao.RTSDAgencyMapDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTSDAgencyService")
@SuppressWarnings("unchecked")
public class RTSDAgencyServiceImpl extends EgovAbstractServiceImpl implements RTSDAgencyService {
	
	@Resource(name="rTSDAgencyMapDAO")
	RTSDAgencyMapDAO rTSDAgencyMapDAO;
	
	//장착 정보 List
	public Map detailAgencyInfo(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("agencyList", rTSDAgencyMapDAO.detailAgencyInfo(inVar));
		return  result;
	}
	
	//계좌 데이타생성, 수정, 삭제
	public Map saveAgencyInfo(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
		inVar.put("inDsMap", inDsMap);
		inVar.put("sqlnamespace", "agency.saveAgencyInfo");
		return rTSDAgencyMapDAO.saveAgencyInfo(inVar);
	}
	
	// 콜센터용 대리점 정보 조회
	public Map agencyCallList(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("agencyList", rTSDAgencyMapDAO.agencyCallList(inVar));
		return  result;
	}

}
