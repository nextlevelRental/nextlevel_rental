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

import java.util.HashMap;
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

import egovframework.ntrms.kr.co.brn.comm.service.CommonService;
import egovframework.ntrms.kr.co.brn.re.service.RTREChargeExceptService;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;

@Controller
public class RTREChargeExceptController {
	protected Log logger = LogFactory.getLog(this.getClass());
	
	@Resource(name="rTREChargeExceptService")
	RTREChargeExceptService rTREChargeExceptService;
	
	@Resource(name="commonService")
	CommonService commonService;
	
	/************************************
	 * 공통코드DataSet조회
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 ************************************/
	@RequestMapping("/rtms/re/chargeExceptComm.do") 
	public ModelAndView listCommInfo(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try {
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			//가격, 금액유형
			Map com = new HashMap();
			com.put("cdGrpCd", "R069");
			com.put("useYn", "Y");
			Map commMap = commonService.listCommInfo(com);
			List listComm	= (List)commMap.get("result");
			DataSetMap r069 = new DataSetMap();
			r069.setRowMaps(listComm);
			outDataset.put("R069", r069);
			
			//기간코드
			com.remove("cdGrpCd");
			com.put("cdGrpCd", "C033");
			com.put("useYn", "Y");
			Map commMap2 = commonService.listCommInfo(com);
			List listComm2	= (List)commMap2.get("result");
			DataSetMap c033 = new DataSetMap();
			c033.setRowMaps(listComm2);
			outDataset.put("C033", c033);
			
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
	
	/**
	 * 당월연체대상집계
	 * @param	xpDto
	 * @param	model
	 * @return	ModelAndView
	 * @throws	Exception
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping("ntrms/re/saveChargeExcept.do")
	public ModelAndView saveChargeExcept(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map loginInfo = (Map) req.getSession().getAttribute("User");
			
			Map <String, Object> inVar = xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset = xpDto.getInDataSetMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("regId", loginInfo.get("userId"));  //등록자 ID		
			
			Map result = rTREChargeExceptService.saveChargeExcept(inDataset, inVar);
			
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
	
	@RequestMapping("/rtms/re/listChargeExcept.do") 
	public ModelAndView listChargeExcept(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rTREChargeExceptService.listChargeExcept(inVar);
			
			List listChargeExcept = (List)result.get("listChargeExcept");
			
			DataSetMap chrgeExceptMap = new DataSetMap();
			chrgeExceptMap.setRowMaps(listChargeExcept);
			
			outDataset.put("output", chrgeExceptMap);
			
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
}