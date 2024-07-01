/**************************************************************************************
 * nexacro Login check
 * Copyright(c) 2009 nexacro ALLRIGHTS RESERVED.
 * 
 * 1.Program Name       : 
 * 2.File Name	        : LogInOutService.java
 * 3.Developer          : sian
 * 4.Development Date	: 2014.09.06 
 * 5.Version     		: 0.1
 * 6.Explanation		: Location Service
 * 7.History		 
 * 	1) 2014.09.06
*************************************************************************************/
package egovframework.ntrms.kr.co.brn.login.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import egovframework.com.nexa.common.domain.User;
import egovframework.ntrms.kr.co.brn.exception.NtRmsServiceException;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;

@SuppressWarnings("unchecked")
public interface LogInOutService {
	
	public void login() throws NtRmsServiceException;
	//public void loginCheck(ModelAndView mav, User user, HttpServletRequest request, Map<String, DataSetMap> outDataset) throws NtRmsServiceException;
	public void loadConfig(HttpServletRequest request, Map reqMap) throws NtRmsServiceException;
	public void getUserinfo(ModelAndView mav, Map user, HttpServletRequest request, Map<String, DataSetMap> outDataset) throws NtRmsServiceException;
	public Map chgUserPwd(Map<String, DataSetMap> inDataset) throws Exception;
	public Map getPassWordVerification(Map<String, DataSetMap> inDataset) throws Exception;
	public void getList(DataSetMap tranInfo,
			Map<String, Object> inVar, Map<String, DataSetMap> inDataset,
			Map<String, Object> outVar, Map<String, DataSetMap> outDataset)
		throws Exception;
}
