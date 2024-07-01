/************************************************************************************
 * 1.Program  			: Common DataSet Controller
 * 2.File Name			: RTCMUserController.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.sd.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
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

import egovframework.ntrms.kr.co.brn.cm.service.RTCMProRegService;
import egovframework.ntrms.kr.co.brn.cm.service.RTCMUserService;
import egovframework.ntrms.kr.co.brn.comm.service.CommonService;
import egovframework.ntrms.kr.co.brn.sd.service.RTSDClaimService;
import egovframework.ntrms.kr.co.brn.sd.service.RTSDPlanService;
import egovframework.ntrms.kr.co.comm.util.DateUtil;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;

@Controller
public class RTSDPlanController {
	
	protected Log logger = LogFactory.getLog(this.getClass());	

	@Resource(name="commonService")
	CommonService commonService;
	
	@Resource(name="rTSDPlanService")
	RTSDPlanService rTSDPlanService;
	
	@RequestMapping("/rtms/sd/listPlan.do") 
	public ModelAndView listPlan(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rTSDPlanService.listPlanInfo(inVar, outDataset);
			
			List planInfo = (List)result.get("planList");
			
			DataSetMap dsplanInfo = new DataSetMap();
			dsplanInfo.setRowMaps(planInfo);
			
			outDataset.put("planInfo", dsplanInfo);
			
			
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
	
	//계좌저장
		@RequestMapping("rtms/sd/savePlanInfo.do") 
		public ModelAndView savePlanInfo(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
			Map loginInfo = (Map) req.getSession().getAttribute("User");
			
			ModelAndView mav = new ModelAndView("nexacroMapView");
			
			try
			{
				DataSetMap tranInfo 				= xpDto.getTranInfoMap();
				Map <String, Object> inVar 			= xpDto.getInVariableMap();
				Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
				Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
				
				inVar.put("regId", loginInfo.get("userId"));
				
				DataSetMap dsm = new DataSetMap();
				Map paramMap = new HashMap();
				paramMap.put(NexacroConstant.DATASET_ROW_TYPE,  1);
				paramMap.put("dvsn", 			"I");
				paramMap.put("ordNo",  		inVar.get("ordNo"));					//배치신청일
				paramMap.put("procDay", 	inVar.get("procDay"));					//일련번호
				dsm.add(paramMap);
				inVar.put("inDsMap",  dsm);
				inVar.put("sqlnamespace", "plan.insertPlan");
				
				Map result =  rTSDPlanService.savePlanData(inDataset, inVar);
				
				mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
				mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());

				mav.addObject(NexacroConstant.ERROR_CODE, result.get("successCode")+"");
				mav.addObject(NexacroConstant.ERROR_MSG,  result.get("returnMessage"));		
			
			} catch ( Exception e ) {
				e.printStackTrace();
				mav.addObject(NexacroConstant.ERROR_CODE, "-1");
				mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
			}
			return mav;
		}
	
}
