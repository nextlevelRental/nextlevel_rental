/************************************************************************************
 * 1.Program  			: Common DataSet Controller
 * 2.File Name			: RTCMUserController.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.sd.controller;

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
import egovframework.ntrms.kr.co.brn.sd.service.RTSDSaleSubsidyService;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;

@Controller
public class RTSDSaveSubsidyController {
	
	protected Log logger = LogFactory.getLog(this.getClass());	

	@Resource(name="commonService")
	CommonService commonService;
	
	@Resource(name="rTSDSaleSubsidyService")
	RTSDSaleSubsidyService rTSDSaleSubsidyService;
		
	/************************************
	 * 공통코드DataSet조회
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 ************************************/
	@RequestMapping("/rtms/sd/listSaleSubsidyComm.do") 
	public ModelAndView listSaleSubsidyComm(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try {
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();			
			
			logger.debug("===================================================");
			logger.debug(inVar);
			logger.debug("===================================================");

			Map com = new HashMap();
			com.put("cdGrpCd", "R060"); //판매처구분
			com.put("useYn", "Y");
			Map commMap = commonService.listCommInfo(com);
			List listCommR060	= (List)commMap.get("result");
			DataSetMap dsR060 = new DataSetMap();
			dsR060.setRowMaps(listCommR060);
			outDataset.put("dsR060", dsR060);

			com.put("cdGrpCd", "R061");	//보너스구분
			com.put("useYn", "Y");
			commMap = commonService.listCommInfo(com);
			List listComm061 = (List)commMap.get("result");
			DataSetMap dsR061 = new DataSetMap();
			dsR061.setRowMaps(listComm061);
			outDataset.put("dsR061",  dsR061);

			com.put("cdGrpCd", "R062");	//지급구분
			com.put("useYn", "Y");
			commMap = commonService.listCommInfo(com);
			List listComm062 = (List)commMap.get("result");
			DataSetMap dsR062 = new DataSetMap();
			dsR062.setRowMaps(listComm062);
			outDataset.put("dsR062",  dsR062);

			com.put("cdGrpCd", "R063");	//결산구분
			com.put("useYn", "Y");
			commMap = commonService.listCommInfo(com);
			List listComm063 = (List)commMap.get("result");
			DataSetMap dsR063 = new DataSetMap();
			dsR063.setRowMaps(listComm063);
			outDataset.put("dsR063",  dsR063);
			
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

	/************************************
	 * 판매보조금정책항목 목록조회
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 ************************************/
	@RequestMapping("/rtms/sd/listSaleSubsidyInfo.do") 
	public ModelAndView listSaleSubsidyInfo(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try {
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();			

			Map paramMap = new HashMap();
			paramMap.put("plcCdNm", inVar.get("plcCdNm"));
			paramMap.put("slsCd",   inVar.get("slsCd"));
			paramMap.put("bnsCd",   inVar.get("bnsCd"));
			paramMap.put("pymCd",   inVar.get("pymCd"));
			paramMap.put("acnCd",   inVar.get("acnCd"));
			
			Map result = rTSDSaleSubsidyService.listSaleSubsidyInfo(paramMap);
			List planInfo = (List)result.get("SaleSubsidyInfo");
			DataSetMap dsResult = new DataSetMap();
			dsResult.setRowMaps(planInfo);
			
			outDataset.put("ds_output", dsResult);
			
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
	
	/************************************
	 * 저장 - 판매보조금정책항목
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 ************************************/
	@RequestMapping("/rtms/sd/saveSaleSubsidy.do")	
	public ModelAndView saveSaleSubsidy(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		Map loginInfo = (Map) req.getSession().getAttribute("User");
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();

			inVar.put("regId", loginInfo.get("userId"));
			
			Map result =  rTSDSaleSubsidyService.saveSaleSubsidy(inDataset, inVar);
			
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
