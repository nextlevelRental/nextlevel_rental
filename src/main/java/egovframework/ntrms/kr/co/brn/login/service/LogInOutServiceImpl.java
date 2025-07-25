/**************************************************************************************
 * nexacro Login check
 * Copyright(c) 2009 nexacro ALLRIGHTS RESERVED.
 * 
 * 1.Program Name       : 
 * 2.File Name	        : LogInOutServiceImpl.java
 * 3.Developer          : sian
 * 4.Development Date	: 2014.09.06 
 * 5.Version     		: 0.1
 * 6.Explanation		: Location LocationServiceImpl
 * 7.History		 
 * 	1) 2014.09.06
 *************************************************************************************/
package egovframework.ntrms.kr.co.brn.login.service;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import egovframework.ntrms.kr.co.brn.exception.NtRmsServiceException;
import egovframework.ntrms.kr.co.brn.login.dao.LogInOutDAO;
import egovframework.ntrms.kr.co.comm.util.MenuUtil;
import egovframework.ntrms.kr.co.comm.util.ObjectUtil;
import egovframework.ntrms.kr.co.comm.util.SecurityUtil;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;


@Service("logInOutService")
@SuppressWarnings("unchecked")

public class LogInOutServiceImpl extends EgovAbstractServiceImpl implements LogInOutService 
{
	@Resource(name = "sqlMapLogInOutDAO")
	LogInOutDAO logInOutDAO;
	MenuUtil menuUtil = new MenuUtil();
	
	public void login() throws NtRmsServiceException {}
	
	public void getUserinfo(ModelAndView mav, Map userMap, HttpServletRequest request, Map<String, DataSetMap> outDataset) throws NtRmsServiceException {

		//2차 인증여부 확인
		HttpSession session = request.getSession(false);
		Boolean authVerified = (session != null) ? (Boolean) session.getAttribute("authVerified") : null;
		String authUserId = (session != null) ? (String) session.getAttribute("authUserId") : null;
		String userId = (String)userMap.get("userId");

		if (session == null || authVerified == null || !authVerified || !userId.equals(authUserId)) {
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, "Two-factor authentication incomplete.");
			throw new NtRmsServiceException();
		}
		
		Map user = null;
		String userIp = (String)userMap.get("userIp");
		user = logInOutDAO.getUserinfo(userMap);
		
		if (user == null) {
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, "User ID is Not Correct.");
			throw new NtRmsServiceException();
		} else if (user != null && !userMap.get("password").equals(user.get("password"))) {
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, "User Password is Not Correct.");
			throw new NtRmsServiceException();
		} else {
			user.put("userIp", userIp);
			List listMenu = logInOutDAO.loginMenu(user);
			List<Map> listUser = ObjectUtil.getObjectToList(user, "UPPER_CASE");
			request.getSession().setAttribute("User", user);
            
			Calendar ca = Calendar.getInstance();
			
			request.getSession().setAttribute("day", 	ca.get(Calendar.DAY_OF_MONTH));
			request.getSession().setAttribute("month", 	ca.get(Calendar.MONTH));
			request.getSession().setAttribute("year", 	ca.get(Calendar.YEAR));
			
			List li2 = new ArrayList();
			li2.add(user);
			
			//[DataSet] Login User
			DataSetMap outUserDsMap = new DataSetMap();
			outUserDsMap.setRowMaps(li2);
			outDataset.put("gds_userInfo", outUserDsMap);

			//[DataSet] Login User Menu
			DataSetMap outMenuDsMap = new DataSetMap();
			outMenuDsMap.setRowMaps(listMenu);
			outDataset.put("gds_menu", outMenuDsMap);
		}
	}
	
	public void getList(DataSetMap tranInfo, Map<String, Object> inVar, Map<String, DataSetMap> inDataset, Map<String, Object> outVar, Map<String, DataSetMap> outDataset) throws Exception {
		String[] arySqlId = ((String)inVar.get("sqlId")).split(" ");
		for (int i = 0; i < arySqlId.length; i++) {
			DataSetMap inDsMap = (DataSetMap)inDataset.get("input" + (i+1));
			Map inMap = null;
			if (inDsMap != null)
				inMap = inDsMap.get(0);
				List <Map> records;
			if (inMap != null) {
				records = logInOutDAO.getList(arySqlId[i], inMap);
			} else {
				records = logInOutDAO.getList(arySqlId[i], inVar);
			}
			DataSetMap outDsMap = new DataSetMap();
			outDsMap.setRowMaps(records);
			outDataset.put("output" + (i+1), outDsMap);
		}
	}
	
	private void loadConfig( HttpSession session ){
		Map model = null;
		List config = logInOutDAO.loginConfig(model);
		Map newMap = new HashMap();
		for (int i = 0; i < config.size(); i++) {
			Map map = (Map) config.get(i);
			newMap.put(map.get("CONFIG_CD"), map.get("CONFIG_VALUE"));
		}
		session.setAttribute("Config", newMap);
	}
	

	public void loadConfig(HttpServletRequest request, Map reqMap) throws NtRmsServiceException {
		loadConfig(request.getSession());
		try {
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	public Map chgUserPwd(Map<String, DataSetMap> inDataset) throws Exception {
		// TODO Auto-generated method stub
		DataSetMap inDsMap = (DataSetMap)inDataset.get("chg_pwd");
		Map pwd_map = inDsMap.get(0);
		String password 	= (String)pwd_map.get("password");
		String oldPassword 	= (String)pwd_map.get("oldPassword");
		pwd_map.remove("password");
		pwd_map.remove("oldPassword");
		pwd_map.put("password", 	SecurityUtil.ChangePassword(password));
		pwd_map.put("oldPassword", 	SecurityUtil.ChangePassword(oldPassword));
		return logInOutDAO.chgUserPwd(pwd_map);
	}
	
	public Map getPassWordVerification(Map<String, DataSetMap> inDataset) throws Exception {
		// TODO Auto-generated method stub
		DataSetMap inDsMap = (DataSetMap)inDataset.get("chg_pwd");
		Map pwd_map = inDsMap.get(0);
		return logInOutDAO.getPassWordVerification(pwd_map);
	}

	/**
	 * 사용자 로그인 확인
	 */
	public void isUserExists(ModelAndView mav, Map userMap, HttpServletRequest request, Map<String, DataSetMap> outDataset) throws NtRmsServiceException {

		Map user = null;
		String userIp = (String)userMap.get("userIp");
		user = logInOutDAO.getUserinfo(userMap);

		if (user == null) {
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, "User ID is Not Correct.");
			throw new NtRmsServiceException();
		} else if (user != null && !userMap.get("password").equals(user.get("password"))) {
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, "User Password is Not Correct.");
			throw new NtRmsServiceException();
		} else {
			user.put("userIp", userIp);

			List list = new ArrayList();
			list.add(user);

			//[DataSet] ����� ����
			DataSetMap outUserDsMap = new DataSetMap();
			outUserDsMap.setRowMaps(list);
			outDataset.put("gds_userInfo", outUserDsMap);
		}
	}

	/**
	 * 사용자 인증전송 휴대폰번호 조회
	 */
	public Map getMobNoList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("mobNoList", 	logInOutDAO.getMobNoList(inVar, outDataset));
		return result;
	}

	/**
	 * 사용자 인증 휴대폰번호 여부 확인
	 */
	public boolean getUserAuthinfo(ModelAndView mav, Map userMap, HttpServletRequest request, Map<String, DataSetMap> outDataset) throws NtRmsServiceException {

		boolean result = false;
		Map user = null;
		user = logInOutDAO.getUserAuthinfo(userMap);

		if (user != null) {
			result = true;
		}
		return result;
	}

	/**
	 * SMS 템플릿 조회
	 */
	public Map getSmsTmpl(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		return logInOutDAO.getSmsTmpl(inVar, outDataset);
	}
}
