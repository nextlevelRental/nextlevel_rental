package egovframework.ntrms.kr.co.brn.cm.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ntrms.kr.co.brn.cm.dao.RTCMRentalMasterAuthDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTCMRentalMasterAuthService")
public class RTCMRentalMasterAuthServiceImpl extends EgovAbstractServiceImpl implements RTCMRentalMasterAuthService {
	
	@Resource(name = "rTCMRentalMasterAuthDAO")
	RTCMRentalMasterAuthDAO rTCMRentalMasterAuthDAO;
	
	public Map<String, Object> commonCodeRtlMasterComboListSVC(Map<String, Object> paramMap) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", rTCMRentalMasterAuthDAO.getCommonCodeRtlMasterComboList(paramMap));
		
		return resultMap;
	}

	public Map<String, Object> commonCodeRtlMasterHoboComboListSVC(Map<String, Object> paramMap) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", rTCMRentalMasterAuthDAO.getCommonCodeRtlMasterHoboComboList(paramMap));
		
		return resultMap;
	}

	public Map<String, Object> rtlMasterListSVC(Map<String, Object> paramMap) throws Exception {

		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", rTCMRentalMasterAuthDAO.getRtlMasterList(paramMap));
		return resultMap;
	}

	public Map<String, Object> rtlHOBOListSVC(Map<String, Object> paramMap) throws Exception {

		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", rTCMRentalMasterAuthDAO.getRtlHOBOList(paramMap));
		
		return resultMap;
	}
	
	public Map<String, Object> getRentalMasterInfo(Map<String, Object> paramMap) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", rTCMRentalMasterAuthDAO.getRentalMasterInfo(paramMap));
		
		return resultMap;
	}

	public Map<String, Object> saveRentalMasterInfo(Map<String, Object> inVar, Map<String, DataSetMap> inDataSet) throws Exception {
		
		return rTCMRentalMasterAuthDAO.saveRentalMasterInfo(inVar, inDataSet);
	}
	
	public Map<String, Object> deleteRentalMasterInfo(Map<String, Object> inVar, Map<String, DataSetMap> inDataSet) throws Exception {
		
		return rTCMRentalMasterAuthDAO.deleteRentalMasterInfo(inVar, inDataSet);
	}
	
	public Map<String, Object> saveRentalMaster(Map<String, Object> inVar, Map<String, DataSetMap> inDataSet) throws Exception {
			
			return rTCMRentalMasterAuthDAO.saveRentalMaster(inVar, inDataSet);
	}

	public Map<String, Object> listRentalMaster(Map<String, Object> paramMap) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", rTCMRentalMasterAuthDAO.listRentalMaster(paramMap));
		
		return resultMap;
	}
}
