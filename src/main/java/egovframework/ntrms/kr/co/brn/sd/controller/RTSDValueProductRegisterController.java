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
import egovframework.ntrms.kr.co.brn.sd.service.RTSDValueProductRegisterService;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;

@Controller
public class RTSDValueProductRegisterController {
	
	protected Log logger = LogFactory.getLog(this.getClass());	

	@Resource(name="commonService")
	CommonService commonService;
	
	@Resource(name="rTSDValueProductRegisterService")
	RTSDValueProductRegisterService rTSDValueProductRegisterService;
	
	/************************************
	 * 공통코드DataSet조회
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 ************************************/
	@RequestMapping("/rtms/sd/listAddProductCommInfo.do") 
	public ModelAndView listCommInfo(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try {
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			//제품군
			Map com = new HashMap();
			com.put("cdGrpCd", "S210");
			com.put("useYn", "Y");
			Map commMap = commonService.listCommInfo(com);
			List listComm	= (List)commMap.get("result");
			DataSetMap dsPrice = new DataSetMap();
			dsPrice.setRowMaps(listComm);
			outDataset.put("com_grp", dsPrice);
			
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
	 * 부가제품목록조회
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 ************************************/
	@RequestMapping("/rtms/sd/listAddProductInfo.do") 
	public ModelAndView listProductInfo(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try {
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();			
			
			logger.debug("===================================================");
			logger.debug(inVar);
			logger.debug("===================================================");
			
			Map paramMap = new HashMap();
			paramMap.put("addGdsCd",null);
			paramMap.put("addGdsNm",inVar.get("addGdsNm"));
			paramMap.put("amt", 	null);
			paramMap.put("makerNm", inVar.get("makerNm"));
			paramMap.put("gdsGb", 	null);
			paramMap.put("gdsDesc", null);  
			paramMap.put("gdsDescDt", null);
			paramMap.put("regId", 	null);    
			paramMap.put("regDt", 	null);    
			paramMap.put("chgId", 	null);    
			paramMap.put("chgDt", 	null);    
			paramMap.put("gdsGrp", 	null);   
			paramMap.put("useYn", 	inVar.get("useYn"));    
			paramMap.put("dcAmt", 	null);
			
			Map result = rTSDValueProductRegisterService.listProductInfo(paramMap);
			List planInfo = (List)result.get("priceList");
			DataSetMap dsproductInfo = new DataSetMap();
			dsproductInfo.setRowMaps(planInfo);
			
			outDataset.put("ds_output", dsproductInfo);
			
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

	/* 저장 */
	@RequestMapping("rtms/sd/saveAddProductInfo.do")	
	public ModelAndView saveProductInfo(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		Map loginInfo = (Map) req.getSession().getAttribute("User");
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("regId", loginInfo.get("userId"));
			
			Map result =  rTSDValueProductRegisterService.saveProductInfo(inDataset, inVar);
			
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
	
	/************************************
	 * 부가제품추가팝업 목록조회
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 ************************************/
	@RequestMapping("/rtms/sd/listAddProductPopInfo.do") 
	public ModelAndView listProductPopInfo(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try {
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();			
			
			logger.debug("===================================================");
			logger.debug(inVar);
			logger.debug("===================================================");
			
			Map paramMap = new HashMap();
			paramMap.put("addGdsNm",inVar.get("addGdsNm"));
			paramMap.put("saleCd",inVar.get("saleCd"));

			
			Map result = rTSDValueProductRegisterService.listProductPopInfo(paramMap);
			List planInfo = (List)result.get("priceList");
			DataSetMap dsproductInfo = new DataSetMap();
			dsproductInfo.setRowMaps(planInfo);
			
			outDataset.put("ds_output", dsproductInfo);
			
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
	 * 주문번호별 부가제품 조회 List
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 ************************************/
	@RequestMapping("/rtms/sd/listProductInfoSch.do") 
	public ModelAndView listProductInfoSch(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try {
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();			
				
			Map result = rTSDValueProductRegisterService.listProductInfoSch(inVar);
			List listProductInfoSch = (List)result.get("result");
			
			DataSetMap userDsMap = new DataSetMap();
			userDsMap.setRowMaps(listProductInfoSch);
			
			outDataset.put("listProductInfoSch", userDsMap);
			
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
