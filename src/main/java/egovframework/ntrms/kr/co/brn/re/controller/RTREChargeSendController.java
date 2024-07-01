/************************************************************************************
 * 1.Program  			: Common DataSet Controller
 * 2.File Name			: RTREArrearsPaymentController.java
 * 3.Developer			: ncho
 * 4.Development Date	: 2018.11.12
 * 5.Version			: 0.1
 * 6.Note				: 
 * 7.History			: 
 ************************************************************************************/

package egovframework.ntrms.kr.co.brn.re.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import egovframework.ntrms.kr.co.brn.comm.service.CommonService;
import egovframework.ntrms.kr.co.brn.re.service.RTREChargeSendService;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;

@Controller
public class RTREChargeSendController {
	protected Log logger = LogFactory.getLog(this.getClass());
	
	@Resource(name="rTREChargeSendService")
	RTREChargeSendService rTREChargeSendService;
	
	@Resource(name="commonService")
	CommonService commonService;
	
	/**
	 * 벤더정보업데이트
	 * @param	xpDto
	 * @param	model
	 * @return	ModelAndView
	 * @throws	Exception
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping("ntrms/re/saveVendorList.do")
	public ModelAndView saveVendorList(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map loginInfo = (Map) req.getSession().getAttribute("User");
			
			Map <String, Object> inVar = xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset = xpDto.getInDataSetMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("regId", loginInfo.get("userId"));  //등록자 ID		
			
			Map result = rTREChargeSendService.saveVendorList(inDataset, inVar);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME,	  xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE,			  String.valueOf(result.get("successCode")));
			mav.addObject(NexacroConstant.ERROR_MSG,			  result.get("returnMessage"));
		} catch(Exception e) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG,  e.toString());
		}
		
		return mav;
	}
	
	/**
	 * 수수료정보업데이트
	 * @param	xpDto
	 * @param	model
	 * @return	ModelAndView
	 * @throws	Exception
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping("ntrms/re/saveChargeList.do")
	public ModelAndView saveChargeList(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map loginInfo = (Map) req.getSession().getAttribute("User");
			
			Map <String, Object> inVar = xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset = xpDto.getInDataSetMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("regId", loginInfo.get("userId"));  //등록자 ID		
			
			Map result = rTREChargeSendService.saveChargeList(inDataset, inVar);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME,	  xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE,			  String.valueOf(result.get("successCode")));
			mav.addObject(NexacroConstant.ERROR_MSG,			  result.get("returnMessage"));
		} catch(Exception e) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG,  e.toString());
		}
		
		return mav;
	}
	
	/**
	 * SMS정보 생성
	 * @param	xpDto
	 * @param	model
	 * @return	ModelAndView
	 * @throws	Exception
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping("ntrms/re/aggregateSms.do")
	public ModelAndView aggregateSms(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map loginInfo = (Map) req.getSession().getAttribute("User");
			
			Map <String, Object> inVar = xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset = xpDto.getInDataSetMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("regId", loginInfo.get("userId"));  //등록자 ID		
			
			Map result = rTREChargeSendService.aggregateSms(inVar);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME,	  xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE,			  String.valueOf(result.get("successCode")));
			mav.addObject(NexacroConstant.ERROR_MSG,			  result.get("returnMessage"));
		} catch(Exception e) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG,  e.toString());
		}
		
		return mav;
	}
	
	/**
	 * SMS발송
	 * @param	xpDto
	 * @param	model
	 * @return	ModelAndView
	 * @throws	Exception
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping("ntrms/re/saveSendSms.do")
	public ModelAndView saveSendSms(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map loginInfo = (Map) req.getSession().getAttribute("User");
			
			Map <String, Object> inVar = xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset = xpDto.getInDataSetMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("regId", loginInfo.get("userId"));  //등록자 ID		
			
			Map result = rTREChargeSendService.saveSendSms(inVar);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME,	  xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE,			  String.valueOf(result.get("successCode")));
			mav.addObject(NexacroConstant.ERROR_MSG,			  result.get("returnMessage"));
		} catch(Exception e) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG,  e.toString());
		}
		
		return mav;
	}
}