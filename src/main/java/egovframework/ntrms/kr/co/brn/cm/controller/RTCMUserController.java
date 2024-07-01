/************************************************************************************
 * 1.Program  			: Common DataSet Controller
 * 2.File Name			: RTCMUserController.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 	: 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.cm.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import egovframework.ntrms.kr.co.brn.cm.service.RTCMUserService;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;

@Controller
public class RTCMUserController {


	protected Log logger = LogFactory.getLog(this.getClass());	

	@Resource(name="rTCMUserService")
	RTCMUserService rTCMUserService;
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/listUserInfo.do") 
	public ModelAndView listUserInfo(NexacroMapDTO xpDto) throws Exception {
	
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rTCMUserService.listUserInfo(inVar, outDataset);
			
			List listUserInfo	= (List)result.get("listUserInfo");
			List userGrp		= (List)result.get("userGrp");
			
			/** 기존 소스
			Map map = new HashMap();
			map.put("cd", "");
			map.put("cdNm", "전체");
			*/
			
			//사용자정보조회
			DataSetMap userDsMap = new DataSetMap();
			userDsMap.setRowMaps(listUserInfo);

			//공통코드(사용자그룹조회)
			DataSetMap grpDsMap = new DataSetMap();
			grpDsMap.setRowMaps(userGrp);
			
			outDataset.put("listUser",	userDsMap);
			outDataset.put("userGrp",	grpDsMap);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			
			mav.addObject(NexacroConstant.ERROR_CODE, "0");
			mav.addObject(NexacroConstant.ERROR_MSG, "");
		
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	/********************
	 * 아이디 중복확인
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 *********************/
	
	@RequestMapping("/checkIdExists.do") 
	public ModelAndView checkIdExists(NexacroMapDTO xpDto) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, Object> outVal			= xpDto.getOutVariableMap();
			
			//아이디 중복여부 조회
			int idx = (int)rTCMUserService.checkIdExists(inVar);
			outVal.put("resultCnt", idx);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			
			mav.addObject(NexacroConstant.ERROR_CODE, "0");
			mav.addObject(NexacroConstant.ERROR_MSG, "");
		
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	@RequestMapping("/saveUserInfo.do") 
	public ModelAndView saveUserInfo(NexacroMapDTO xpDto, HttpServletRequest req) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map<String, Object> loginInfo = (Map<String, Object>)req.getSession().getAttribute("User");
			
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, Object> outVar 		= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("regId", loginInfo.get("userId"));
			
			// 신규 사용자 저장
			Map<String, Object> result = rTCMUserService.saveUserInfo(inDataset, inVar);
			
			// 그리드에 보여줄 저장된 사용자 조회
			Map<String, Object> userListMap = rTCMUserService.listUserInfo(result, outDataset);
			List userList = (List)userListMap.get("listUserInfo");
			List userGrp = (List)userListMap.get("userGrp");
			
			// 사용자 정보
			DataSetMap userListDS = new DataSetMap();
			userListDS.setRowMaps(userList);
			
			//공통코드(사용자그룹조회)
			DataSetMap grpDS = new DataSetMap();
			grpDS.setRowMaps(userGrp);
			
			outDataset.put("listUser", userListDS);
			outDataset.put("userGrp", grpDS);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			
			mav.addObject(NexacroConstant.ERROR_CODE, result.get("successCode") + "");
			mav.addObject(NexacroConstant.ERROR_MSG, result.get("returnMessage"));
		
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	
	@RequestMapping("/clearPwd.do") 
	public ModelAndView clearPwd(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map loginInfo = (Map)req.getSession().getAttribute("User");
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, Object> outVar 		= xpDto.getOutVariableMap();
			
			inVar.put("regId", loginInfo.get("userId"));
			Map result = rTCMUserService.clearPwd(inVar);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			
			mav.addObject(NexacroConstant.ERROR_CODE,  result.get("successCode") + "");
			mav.addObject(NexacroConstant.ERROR_MSG, result.get("returnMessage"));
		
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
}
