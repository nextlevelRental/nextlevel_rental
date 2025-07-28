/************************************************************************************
 * 1.Program  			: Common DataSet Controller
 * 2.File Name			: RTCMTestPriceInputController.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.cm.controller;

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

import egovframework.ntrms.kr.co.brn.cm.service.RTCMTestPriceInputService;
import egovframework.ntrms.kr.co.brn.comm.service.CommonService;
import egovframework.ntrms.kr.co.brn.sd.service.RTSDPriceInputService;
import egovframework.ntrms.kr.co.brn.sd.service.RTSDProductService;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;

@Controller
public class RTCMTestPriceInputController {
	
	protected Log logger = LogFactory.getLog(this.getClass());	

	@Resource(name="commonService")
	CommonService commonService;
	
	@Resource(name="rTCMTestPriceInputService")
	RTCMTestPriceInputService rTCMTestPriceInputService;

	/************************************
	 * 공통코드 조회
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 ************************************/	
	@RequestMapping("/rtms/cm/initRTCMPriceInputCombo.do")
	public ModelAndView initProductAndPriceCombo(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("cdGrpCd", "S001");
			inVar.put("useYn", "Y");
			Map dsBrand = commonService.listCommInfo(inVar);
			
			inVar.put("cdGrpCd", "S002");
			inVar.put("useYn", "Y");
			Map dsModel  = commonService.listCommInfo(inVar);			
			
			inVar.put("cdGrpCd", "S004");
			inVar.put("useYn", "Y");
			Map dsFrCd = commonService.listCommInfo(inVar);

			inVar.put("cdGrpCd", "S014");
			inVar.put("useYn", "Y");
			Map dsSeasonCd = commonService.listCommInfo(inVar);
			
			inVar.put("cdGrpCd", "S015");
			inVar.put("useYn", "Y");
			Map dsCarGubun = commonService.listCommInfo(inVar);						
			
			inVar.put("cdGrpCd", "S021");
			inVar.put("useYn", "Y");
			Map dsPeriod = commonService.listCommInfo(inVar);
			
			inVar.put("cdGrpCd", "S022");
			inVar.put("useYn", "Y");
			Map dsCnt = commonService.listCommInfo(inVar);
			
			List listBrand	= (List)dsBrand.get("result");
			List listPeriod	= (List)dsPeriod.get("result");	
			List listCnt	= (List)dsCnt.get("result");
			List listSeasonCd	= (List)dsSeasonCd.get("result");
			List listCarGubun	= (List)dsCarGubun.get("result");
			List listFrCd	= (List)dsFrCd.get("result");
			List listDsModel = (List)dsModel.get("result");			
			
			DataSetMap mapBrand = new DataSetMap();
			DataSetMap mapPeriod = new DataSetMap();
			DataSetMap mapCnt = new DataSetMap();
			DataSetMap mapSeasonCd = new DataSetMap();
			DataSetMap mapCarGubun = new DataSetMap();
			DataSetMap mapFrCd = new DataSetMap();
			DataSetMap mapDsModel = new DataSetMap();			
			
			mapBrand.setRowMaps(listBrand);
			mapPeriod.setRowMaps(listPeriod);
			mapCnt.setRowMaps(listCnt);
			mapSeasonCd.setRowMaps(listSeasonCd);
			mapCarGubun.setRowMaps(listCarGubun);
			mapFrCd.setRowMaps(listFrCd);
			mapDsModel.setRowMaps(listDsModel);
			
			outDataset.put("mapBrand",		mapBrand);
			outDataset.put("mapPeriod",		mapPeriod);
			outDataset.put("mapCnt",		mapCnt);
			outDataset.put("mapSeasonCd",	mapSeasonCd);
			outDataset.put("mapCarGubun",	mapCarGubun);
			outDataset.put("mapFrCd",	mapFrCd);
			outDataset.put("mapDsModelGrid", mapDsModel);
			outDataset.put("mapDsModel", mapDsModel);			
			
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
	@RequestMapping("/rtms/cm/listProductAndPriceInfo.do") 
	public ModelAndView listProductAndPriceInfo(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try {
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			
			logger.debug("===================================================");
			logger.debug(inVar);
			logger.debug("===================================================");
			
			Map paramMap = new HashMap();
			paramMap.put("modelCd", 		inVar.get("modelCd"));
			paramMap.put("contentsCd", 		inVar.get("contentsCd"));
			paramMap.put("frCd", 			inVar.get("frCd"));
			paramMap.put("sectionWidth", 	inVar.get("sectionWidth"));
			paramMap.put("aspectRatio", 	inVar.get("aspectRatio"));
			paramMap.put("wheelInches", 	inVar.get("wheelInches"));
			paramMap.put("plyRating", 		inVar.get("plyRating"));
			paramMap.put("seasonCd", 		inVar.get("seasonCd"));
			paramMap.put("petternCd", 		inVar.get("petternCd"));
			paramMap.put("ordDay", 			inVar.get("ordDay"));
			paramMap.put("periodCd", 		inVar.get("periodCd"));
			paramMap.put("cntCd", 			inVar.get("cntCd"));
			paramMap.put("priceCd",         inVar.get("priceCd"));
			paramMap.put("matCd",         	inVar.get("matCd"));
			

			
			Map result = rTCMTestPriceInputService.listProductAndPriceInfo(paramMap);
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
	
	/* 저장 */
	@RequestMapping("/ntrms/cm/savePriceInfo.do")	
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
			
			logger.debug("===================================================");
			logger.debug(inDataset);
			logger.debug("===================================================");			
			
			Map result =  rTCMTestPriceInputService.savePriceInfo(inDataset, inVar);
			
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
