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
import egovframework.ntrms.kr.co.brn.re.service.RTREArrearsSendSmsService;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;

@Controller
public class RTREArrearsSendSmsController {
	protected Log logger = LogFactory.getLog(this.getClass());
	
	@Resource(name="rTREArrearsSendSmsService")
	RTREArrearsSendSmsService rTREArrearsSendSmsService;
	
	@Resource(name="commonService")
	CommonService commonService;
	
	/**
	 * 당월연체대상집계
	 * @param	xpDto
	 * @param	model
	 * @return	ModelAndView
	 * @throws	Exception
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping("ntrms/re/arrSendAggregate.do")
	public ModelAndView arrSendAggregate(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map loginInfo = (Map) req.getSession().getAttribute("User");
			
			Map <String, Object> inVar = xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			DataSetMap dsm = new DataSetMap();
			Map paramMap = new HashMap();
			paramMap.put(NexacroConstant.DATASET_ROW_TYPE,  1);
			paramMap.put("dvsn", 			"I");
			paramMap.put("delyDay",  	(String)inVar.get("delyDay"));	//연체집계일자
			paramMap.put("rcmsDay",  	(String)inVar.get("rcmsDay"));	//cms집계일자
			paramMap.put("rcrdDay",  	(String)inVar.get("rcrdDay"));	//카드집계일자
			paramMap.put("payDd",  	(String)inVar.get("payDd"));		    //청구일자
			dsm.add(paramMap);
			inVar.put("inDsMap",  dsm);		
			
			inVar.put("regId", loginInfo.get("userId"));  //등록자 ID		
			
			Map result = rTREArrearsSendSmsService.arrSendAggregate(inVar, outDataset);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME,	  xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE,			  result.get("successCode"));
			mav.addObject(NexacroConstant.ERROR_MSG,			  result.get("returnMessage"));
		} catch(Exception e) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG,  e.toString());
		}
		
		return mav;
	}
	
	@RequestMapping("ntrms/re/arrAggregateDelete.do")
	public ModelAndView arrAggregateDelete(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map loginInfo = (Map) req.getSession().getAttribute("User");
			
			Map <String, Object> inVar = xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("regId", loginInfo.get("userId"));  //등록자 ID		
			
			Map result = rTREArrearsSendSmsService.arrAggregateDelete(inVar, outDataset);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME,	  xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE,			  inVar.get("successCode").toString());
			mav.addObject(NexacroConstant.ERROR_MSG,			  inVar.get("errorText"));
		} catch(Exception e) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG,  e.toString());
		}
		
		return mav;
	}
	
	/**
	 * 당월연체대상 내역 Count
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/ntrms/re/arrSendAggregateCnt.do") 
	public ModelAndView arrSendAggregateCnt(NexacroMapDTO xpDto, Model model) throws Exception {
		
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, Object> outVal			= xpDto.getOutVariableMap();
			
			int currCount = (Integer)rTREArrearsSendSmsService.arrSendAggregateCnt(inVar);
			
			outVal.put("currCount", currCount); //당월연체내역 Count
			
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
	
	@RequestMapping("ntrms/re/arrSmsAggregate.do")
	public ModelAndView arrSmsAggregate(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map loginInfo = (Map) req.getSession().getAttribute("User");
			
			Map <String, Object> inVar = xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			
			DataSetMap dsm = new DataSetMap();
			Map paramMap = new HashMap();
			paramMap.put(NexacroConstant.DATASET_ROW_TYPE,  1);
			paramMap.put("dvsn", 			"I");
			paramMap.put("dvsn", 			"I");
			paramMap.put("delyDay",  	(String)inVar.get("delyDay"));		//연체집계일자
			paramMap.put("sendStart",  	(String)inVar.get("sendStart"));		//발송시간
			paramMap.put("sendTerm",  	(String)inVar.get("sendTerm"));	//발송간격
			paramMap.put("sendCnt",  	(String)inVar.get("sendCnt"));		//발송건수
			dsm.add(paramMap);
			inVar.put("inDsMap",  dsm);		
			
			inVar.put("regId", loginInfo.get("userId"));  //등록자 ID		
			
			Map result = rTREArrearsSendSmsService.arrSmsAggregate(inVar, outDataset);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME,	  xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE,			  result.get("successCode"));
			mav.addObject(NexacroConstant.ERROR_MSG,			  result.get("returnMessage"));
		} catch(Exception e) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG,  e.toString());
		}
		
		return mav;
	}
	
	@RequestMapping("ntrms/re/arrSendSms.do")
	public ModelAndView arrSendSms(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map loginInfo = (Map) req.getSession().getAttribute("User");
			
			Map <String, Object> inVar = xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			
			DataSetMap dsm = new DataSetMap();
			Map paramMap = new HashMap();
			paramMap.put(NexacroConstant.DATASET_ROW_TYPE,  1);
			paramMap.put("dvsn", 			"I");
			paramMap.put("delyDay",  	(String)inVar.get("delyDay"));		//연체집계일자
			paramMap.put("sendStart",  	(String)inVar.get("sendStart"));		//발송시간
			paramMap.put("sendTerm",  	(String)inVar.get("sendTerm"));	//발송간격
			paramMap.put("sendCnt",  	(String)inVar.get("sendCnt"));		//발송건수
			dsm.add(paramMap);
			inVar.put("inDsMap",  dsm);		
			
			inVar.put("regId", loginInfo.get("userId"));  //등록자 ID		
			
			Map result = rTREArrearsSendSmsService.arrSendSms(inVar, outDataset);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME,	  xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE,			  result.get("successCode"));
			mav.addObject(NexacroConstant.ERROR_MSG,			  result.get("returnMessage"));
		} catch(Exception e) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG,  e.toString());
		}
		
		return mav;
	}
}