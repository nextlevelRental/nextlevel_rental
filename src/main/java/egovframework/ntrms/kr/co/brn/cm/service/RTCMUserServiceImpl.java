/************************************************************************************
 * 1.Program  			: Common DataSet Service Implement
 * 2.File Name			: RTCMUserServiceImpl.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.cm.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ntrms.kr.co.brn.cm.dao.RTCMUserMapDAO;
import egovframework.ntrms.kr.co.comm.util.SecurityUtil;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.property.EgovPropertyService;

@Service("rTCMUserService")
public class RTCMUserServiceImpl extends EgovAbstractServiceImpl implements RTCMUserService {
	
	
	@Resource(name="rTCMUserMapDAO")
	RTCMUserMapDAO rTCMUserMapDAO;
	
    @Resource(name="propertiesService")
    protected EgovPropertyService propertiesService;
	
	//목록조회
	public Map<String, Object> listUserInfo(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("listUserInfo", 	rTCMUserMapDAO.listUserInfo(inVar, outDataset));
		result.put("userGrp", 		rTCMUserMapDAO.userGrp(inVar));
		return result;
	}
	
	/*************************
	 * 아이디 중복확인
	 *************************/
	public int checkIdExists(Map<String, Object> inVar) throws Exception {
		// TODO Auto-generated method stub
		inVar.put("result", "result");
		return rTCMUserMapDAO.checkIdExists(inVar);
	}
	
	//데이타생성, 수정, 삭제
	@SuppressWarnings("unchecked")
	public Map<String, Object> saveUserInfo(Map<String, DataSetMap> inDataset,Map<String, Object> inVar)
		throws Exception {
		DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
		/*
		for(int i = 0; i<inDsMap.size(); i++) {
			inDsMap.get(i).put("password", SecurityUtil.ChangePassword(propertiesService.getString("global.user.pass")));
		}
		*/
		inVar.put("inDsMap", inDsMap);
		inVar.put("sqlnamespace", "user.saveUserInfo");
		return rTCMUserMapDAO.saveUserInfo(inVar);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> clearPwd(Map<String, Object> inVar) throws Exception {
		// TODO Auto-generated method stub
		inVar.put("password", SecurityUtil.ChangePassword(propertiesService.getString("global.user.pass")));
		return rTCMUserMapDAO.clearPwd(inVar);
	}
}
