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
import egovframework.ntrms.kr.co.brn.sd.service.RTSDPriceInputService;
import egovframework.ntrms.kr.co.brn.sd.service.RTSDProductService;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;

@Controller
public class RTSDPriceInputController {
	
	protected Log logger = LogFactory.getLog(this.getClass());	

	@Resource(name="commonService")
	CommonService commonService;
	
	@Resource(name="rTSDPriceInputService")
	RTSDPriceInputService rTSDPriceInputService;
	
	/************************************
	 * 공통코드DataSet조회
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 ************************************/
	@RequestMapping("/rtms/sd/listCommInfo.do") 
	public ModelAndView listCommInfo(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try {
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			//가격, 금액유형
			Map com = new HashMap();
			com.put("cdGrpCd", "S020");
			com.put("useYn", "Y");
			Map commMap = commonService.listCommInfo(com);
			List listComm	= (List)commMap.get("result");
			DataSetMap dsPrice = new DataSetMap();
			dsPrice.setRowMaps(listComm);
			outDataset.put("com_price", dsPrice);
			
			//기간코드
			com.remove("cdGrpCd");
			com.put("cdGrpCd", "S021");
			Map commMap2 = commonService.listCommInfo(com);
			List listComm2	= (List)commMap2.get("result");
			DataSetMap period = new DataSetMap();
			period.setRowMaps(listComm2);
			outDataset.put("com_period", period);
			
			//타이어본수
			com.remove("cdGrpCd");
			com.put("cdGrpCd", "S022");
			Map commMap3 = commonService.listCommInfo(com);
			List listComm3	= (List)commMap3.get("result");
			DataSetMap cntCd = new DataSetMap();
			cntCd.setRowMaps(listComm3);
			outDataset.put("com_cnt_cd", cntCd);
			
			//등록비코드
			com.remove("cdGrpCd");
			com.put("cdGrpCd", "S023");
			Map commMap4 = commonService.listCommInfo(com);
			List listComm4	= (List)commMap4.get("result");
			DataSetMap regi = new DataSetMap();
			regi.setRowMaps(listComm4);
			outDataset.put("com_regi", regi);
			
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
	 * 가격목록조회
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 ************************************/
	@RequestMapping("/rtms/sd/listPriceInfo.do") 
	public ModelAndView listPriceInfo(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try {
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			
			logger.debug("===================================================");
			logger.debug(inVar);
			logger.debug("===================================================");
			
			Map paramMap = new HashMap();
			paramMap.put("priceCd", 	null);
			paramMap.put("matCd", 		inVar.get("matCd"));
			paramMap.put("periodCd", 	null);
			paramMap.put("cntCd", 		null);
			paramMap.put("regiCd", 		null);
			paramMap.put("strDay", 		null);
			paramMap.put("endDay", 		null);
			paramMap.put("seq", 		null);
			paramMap.put("amt", 		null);
			paramMap.put("useYn", 		null);
			paramMap.put("regId", 		null);
			
			Map result = rTSDPriceInputService.listPriceInfo(paramMap);
			List planInfo = (List)result.get("priceList");
			DataSetMap dsplanInfo = new DataSetMap();
			dsplanInfo.setRowMaps(planInfo);
			
			outDataset.put("ds_output", dsplanInfo);
			
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
	 * 상품및가격목록조회
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 ************************************/
	@RequestMapping("/rtms/sd/listProductAndPriceInfo.do") 
	public ModelAndView listProductAndPriceInfo(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try {
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			
			logger.debug("===================================================");
			logger.debug(inVar);
			logger.debug("===================================================");
			
			Map paramMap = new HashMap();
			paramMap.put("modelCd", 	inVar.get("modelCd"));
			paramMap.put("contentsCd", 		inVar.get("contentsCd"));
			paramMap.put("frCd", 	inVar.get("frCd"));
			paramMap.put("sectionWidth", 		inVar.get("sectionWidth"));
			paramMap.put("aspectRatio", 		inVar.get("aspectRatio"));
			paramMap.put("wheelInches", 		inVar.get("wheelInches"));
			paramMap.put("plyRating", 		inVar.get("plyRating"));
			paramMap.put("seasonCd", 		inVar.get("seasonCd"));
			paramMap.put("petternCd", 		inVar.get("petternCd"));
			paramMap.put("ordDay", 		inVar.get("ordDay"));
			paramMap.put("periodCd", 		inVar.get("periodCd"));
			paramMap.put("cntCd", 		inVar.get("cntCd"));
			
			Map result = rTSDPriceInputService.listProductAndPriceInfo(paramMap);
			List planInfo = (List)result.get("productAndPriceList");
			DataSetMap dsplanInfo = new DataSetMap();
			dsplanInfo.setRowMaps(planInfo);
			
			outDataset.put("ds_output", dsplanInfo);
			
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
	@RequestMapping("rtms/sd/savePriceInfo.do") 
	public ModelAndView savePriceInfo(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		Map loginInfo = (Map) req.getSession().getAttribute("User");
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("regId", loginInfo.get("userId"));
			
			Map result =  rTSDPriceInputService.savePriceInfo(inDataset, inVar);
			
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
