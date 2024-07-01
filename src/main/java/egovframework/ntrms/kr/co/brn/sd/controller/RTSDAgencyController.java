/************************************************************************************
 * 1.Program  			: Common DataSet Controller
 * 2.File Name			: RTSDAgencyController.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		    : ver 1.1 2016-04-15 이영근, '채널 대분류,중분류' 공통코드 가져옴
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
import egovframework.ntrms.kr.co.brn.sd.service.RTSDAgencyService;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;

@Controller
public class RTSDAgencyController {
	
	protected Log logger = LogFactory.getLog(this.getClass());	

	@Resource(name="commonService")
	CommonService commonService;
	
	@Resource(name="rTSDAgencyService")
	RTSDAgencyService rTSDAgencyService;

	@RequestMapping("/rtms/sd/initRTSDAgency.do") 
	public ModelAndView initRTSDAgency(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("cdGrpCd", "C004");
			inVar.put("useYn", "Y");
			Map dsUseYn = commonService.listCommInfo(inVar);
			List listDsUseYn = (List)dsUseYn.get("result");
			DataSetMap mapDsUseYn = new DataSetMap();
			mapDsUseYn.setRowMaps(listDsUseYn);
			outDataset.put("mapDsUseYn", mapDsUseYn);
			
			inVar.put("cdGrpCd", "S066");
			inVar.put("useYn", "Y");
			Map dsSeason = commonService.listCommInfo(inVar);
			List listDsSeason = (List)dsSeason.get("result");
			DataSetMap mapDsSeason = new DataSetMap();
			mapDsSeason.setRowMaps(listDsSeason);
			outDataset.put("mapDsSeason", mapDsSeason);
			
			inVar.put("cdGrpCd", "S079");
			inVar.put("useYn", "Y");
			Map dsTaxRqCd = commonService.listCommInfo(inVar);
			List listDsTaxRqCd = (List)dsTaxRqCd.get("result");	
			DataSetMap mapDsTaxRqCd = new DataSetMap();
			mapDsTaxRqCd.setRowMaps(listDsTaxRqCd);
			outDataset.put("mapDsTaxRqCd", mapDsTaxRqCd);
			
			// 2016-04-15 이영근, 채널 대분류,중분류 가져옴
			inVar.put("cdGrpCd", "S090");
			inVar.put("useYn", "Y");
			Map dsChanLclsCd = commonService.listCommInfo(inVar);
			List listDsChanLclsCd = (List)dsChanLclsCd.get("result");	
			DataSetMap mapDsChanLclsCd = new DataSetMap();
			mapDsChanLclsCd.setRowMaps(listDsChanLclsCd);
			outDataset.put("mapDsChanLclsCd", mapDsChanLclsCd);
			
			inVar.put("cdGrpCd", "S091");
			inVar.put("useYn", "Y");
			Map dsChanMclsCd = commonService.listCommInfo(inVar);
			List listDsChanMclsCd = (List)dsChanMclsCd.get("result");	
			DataSetMap mapDsChanMclsCd = new DataSetMap();
			mapDsChanMclsCd.setRowMaps(listDsChanMclsCd);
			outDataset.put("mapDsChanMclsCd", mapDsChanMclsCd);
			
			// 시/도 코드
			inVar.put("cdGrpCd", "S016");
			inVar.put("useYn", "Y");
			Map mapSidoCd = commonService.listCommInfo(inVar);
			List listSidoCd = (List)mapSidoCd.get("result");	
			DataSetMap dsmSidoCd = new DataSetMap();
			dsmSidoCd.setRowMaps(listSidoCd);
			outDataset.put("mapSidoCd", dsmSidoCd);			
			
			// 시/군/구 코드
			inVar.put("cdGrpCd", "S017");
			inVar.put("useYn", "Y");
			Map mapSigunCd = commonService.listCommInfo(inVar);
			List listSigunCd = (List)mapSigunCd.get("result");	
			DataSetMap dsmSigunCd = new DataSetMap();
			dsmSigunCd.setRowMaps(listSigunCd);
			outDataset.put("mapSigunCd", dsmSigunCd);
			
			// 계절구분 코드
			inVar.put("cdGrpCd", "S014");
			inVar.put("useYn", "Y");
			Map mapSeasonCd = commonService.listCommInfo(inVar);
			List listSeasonCd = (List)mapSeasonCd.get("result");	
			DataSetMap dsmSeasonCd = new DataSetMap();
			dsmSeasonCd.setRowMaps(listSeasonCd);
			outDataset.put("mapSeasonCd", dsmSeasonCd);
			
			// 탈착기 코드 [20180312_01]
			inVar.put("cdGrpCd", "S100");
			inVar.put("useYn", "Y");
			Map mapDesorptCd = commonService.listCommInfo(inVar);
			List listDesorptCd = (List)mapDesorptCd.get("result");	
			DataSetMap dsmDesorptCd = new DataSetMap();
			dsmDesorptCd.setRowMaps(listDesorptCd);
			outDataset.put("mapDesorptCd", dsmDesorptCd);
			
			// 얼라인먼트 코드 [20180312_01]
			inVar.put("cdGrpCd", "S101");
			inVar.put("useYn", "Y");
			Map mapAlignCd = commonService.listCommInfo(inVar);
			List listAlignCd = (List)mapAlignCd.get("result");	
			DataSetMap dsmAlignCd = new DataSetMap();
			dsmAlignCd.setRowMaps(listAlignCd);
			outDataset.put("mapAlignCd", dsmAlignCd);
			
			// 밸런스 코드 [20180312_01]
			inVar.put("cdGrpCd", "S102");
			inVar.put("useYn", "Y");
			Map mapBalanceCd = commonService.listCommInfo(inVar);
			List listBalanceCd = (List)mapBalanceCd.get("result");	
			DataSetMap dsmBalanceCd = new DataSetMap();
			dsmBalanceCd.setRowMaps(listBalanceCd);
			outDataset.put("mapBalanceCd", dsmBalanceCd);
			
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
	
	@RequestMapping("/rtms/sd/detailAgencyInfo.do") 
	public ModelAndView detailAgencyInfo(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try {
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rTSDAgencyService.detailAgencyInfo(inVar);
			List planInfo = (List)result.get("agencyList");
			DataSetMap dsplanInfo = new DataSetMap();
			dsplanInfo.setRowMaps(planInfo);
			outDataset.put("ds_output", dsplanInfo);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE, "0");
			mav.addObject(NexacroConstant.ERROR_MSG, "");
		}catch(Exception e){
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}

	@RequestMapping("rtms/sd/saveAgencyInfo.do") 
	public ModelAndView saveAgencyInfo(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		Map loginInfo = (Map) req.getSession().getAttribute("User");
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("regId", loginInfo.get("userId"));
			Map result =  rTSDAgencyService.saveAgencyInfo(inDataset, inVar);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE, result.get("successCode")+"");
			mav.addObject(NexacroConstant.ERROR_MSG,  result.get("returnMessage"));		
		
		}catch( Exception e ){
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	@RequestMapping("/rtms/sd/agencyCallList.do") 
	public ModelAndView agencyCallList(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rTSDAgencyService.agencyCallList(inVar);
			
			List listAgency = (List)result.get("agencyList");
			DataSetMap dsmAgencyList = new DataSetMap();
			dsmAgencyList.setRowMaps(listAgency);
			outDataset.put("ds_agency", dsmAgencyList);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE, "0");
			mav.addObject(NexacroConstant.ERROR_MSG, "");
		}catch(Exception e){
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
}
