package egovframework.ntrms.kr.co.brn.sd.controller;

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
import egovframework.ntrms.kr.co.brn.sd.service.RTSDCarStandardRegisterService;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;
import egovframework.rte.fdl.property.EgovPropertyService;

@Controller
public class RTSDCarStandardRegisterController {
	protected Log logger = LogFactory.getLog(this.getClass());	
	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	@Resource(name="rTSDCarStandardRegisterService")
	RTSDCarStandardRegisterService rTSDCarStandardRegisterService;
	
	@Resource(name="commonService")
	CommonService commonService;
	
	@RequestMapping("/rtms/sd/initRTSDCarStandardRegister.do") 
	public ModelAndView initRTSDCarStandardRegister(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			//1.차종
			inVar.put("cdGrpCd", "S002");
			inVar.put("useYn", "Y");
			Map dsModelCd = commonService.listCommInfo(inVar);
			List listDsModelCd = (List)dsModelCd.get("result");	
			DataSetMap mapDsModelCd = new DataSetMap();
			mapDsModelCd.setRowMaps(listDsModelCd);
			outDataset.put("mapDsModelCd", mapDsModelCd);
			outDataset.put("mapDsModelCdGrid", mapDsModelCd);
			outDataset.put("mapDsModelCdS", mapDsModelCd);
			
			//2.사양
			inVar.put("cdGrpCd", "S003");
			inVar.put("useYn", "Y");
			Map dsContentsCd = commonService.listCommInfo(inVar);
			List listDsContentsCd = (List)dsContentsCd.get("result");	
			DataSetMap mapDsContentsCd = new DataSetMap();
			mapDsContentsCd.setRowMaps(listDsContentsCd);
			outDataset.put("mapDsContentsCd", mapDsContentsCd);
			outDataset.put("mapDsContentsCdGrid", mapDsContentsCd);
			
			//3.전후구분
			inVar.put("cdGrpCd", "S004");
			inVar.put("useYn", "Y");
			Map dsFrCd = commonService.listCommInfo(inVar);
			List listDsFrCd = (List)dsFrCd.get("result");	
			DataSetMap mapDsFrCd = new DataSetMap();
			mapDsFrCd.setRowMaps(listDsFrCd);
			outDataset.put("mapDsFrCd", mapDsFrCd);
			outDataset.put("mapDsFrCdGrid", mapDsFrCd);
			
			//4.PR(강도)
			inVar.put("cdGrpCd", "S009");
			inVar.put("useYn", "Y");
			Map dsPlyRating = commonService.listCommInfo(inVar);
			List listDsPlyRating = (List)dsPlyRating.get("result");	
			DataSetMap mapDsPlyRating = new DataSetMap();
			mapDsPlyRating.setRowMaps(listDsPlyRating);
			outDataset.put("mapDsPlyRating", mapDsPlyRating);
			outDataset.put("mapDsPlyRatingGrid", mapDsPlyRating);
			
			
			//5.단면폭
			inVar.put("cdGrpCd", "S006");
			inVar.put("useYn", "Y");
			Map dsSectionWidth = commonService.listCommInfo(inVar);
			List listDsSectionWidth = (List)dsSectionWidth.get("result");	
			DataSetMap mapDsSectionWidth = new DataSetMap();
			mapDsSectionWidth.setRowMaps(listDsSectionWidth);
			outDataset.put("mapDsSectionWidth", mapDsSectionWidth);
			outDataset.put("mapDsSectionWidthGrid", mapDsSectionWidth);
			
			//6.편평비
			inVar.put("cdGrpCd", "S007");
			inVar.put("useYn", "Y");
			Map dsAspectRatio = commonService.listCommInfo(inVar);
			List listDsAspectRatio = (List)dsAspectRatio.get("result");	
			DataSetMap mapDsAspectRatio = new DataSetMap();
			mapDsAspectRatio.setRowMaps(listDsAspectRatio);
			outDataset.put("mapDsAspectRatio", mapDsAspectRatio);
			outDataset.put("mapDsAspectRatioGrid", mapDsAspectRatio);
			
			//7.인치
			inVar.put("cdGrpCd", "S008");
			inVar.put("useYn", "Y");
			Map dsWheelInches = commonService.listCommInfo(inVar);
			List listDsWheelInches = (List)dsWheelInches.get("result");	
			DataSetMap mapDsWheelInches = new DataSetMap();
			mapDsWheelInches.setRowMaps(listDsWheelInches);
			outDataset.put("mapDsWheelInches", mapDsWheelInches);
			outDataset.put("mapDsWheelInchesGrid", mapDsWheelInches);
			
			//8.바퀴수
			inVar.put("cdGrpCd", "S010");
			inVar.put("useYn", "Y");
			Map dsWheelQty = commonService.listCommInfo(inVar);
			List listDsWheelQty = (List)dsWheelQty.get("result");	
			DataSetMap mapDsWheelQty = new DataSetMap();
			mapDsWheelQty.setRowMaps(listDsWheelQty);
			outDataset.put("mapDsWheelQty", mapDsWheelQty);
			outDataset.put("mapDsWheelQtyGrid", mapDsWheelQty);
			
			//9.장착가능 바퀴수
			inVar.put("cdGrpCd", "S011");
			inVar.put("useYn", "Y");
			Map dsWheelLimitQty = commonService.listCommInfo(inVar);
			List listDsWheelLimitQty = (List)dsWheelLimitQty.get("result");	
			DataSetMap mapDsWheelLimitQty = new DataSetMap();
			mapDsWheelLimitQty.setRowMaps(listDsWheelLimitQty);
			outDataset.put("mapDsWheelLimitQty", mapDsWheelLimitQty);
			outDataset.put("mapDsWheelLimitQtyGrid", mapDsWheelLimitQty);
			
			//10.차량분류
			inVar.put("cdGrpCd", "S015");
			inVar.put("useYn", "Y");
			Map dsClassCd = commonService.listCommInfo(inVar);
			List listDsClassCd = (List)dsClassCd.get("result");	
			DataSetMap mapDsClassCd = new DataSetMap();
			mapDsClassCd.setRowMaps(listDsClassCd);
			outDataset.put("mapDsClassCd", mapDsClassCd);
			outDataset.put("mapDsClassCdGrid", mapDsClassCd);
			
			//11.사용여부
			inVar.put("cdGrpCd", "C004");
			inVar.put("useYn", "Y");
			Map dsUseYn = commonService.listCommInfo(inVar);
			List listDsUseYn = (List)dsUseYn.get("result");	
			DataSetMap mapDsUseYn = new DataSetMap();
			mapDsUseYn.setRowMaps(listDsUseYn);
			outDataset.put("mapDsUseYn", mapDsUseYn);
			outDataset.put("mapDsUseYnGrid", mapDsUseYn);
			outDataset.put("mapDsUseYnS", mapDsUseYn);
			
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
	
	@RequestMapping("/rtms/sd/sRtsd0004ContentsCdSelect.do") 
	public ModelAndView sRtsd0004ContentsCdSelect(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rTSDCarStandardRegisterService.sRtsd0004ContentsCdSelect(inVar, outDataset);
			
			List sRtsd0004ContentsCdList = (List)result.get("sRtsd0004ContentsCdSelect");
			
			DataSetMap contentsCdSearchMap = new DataSetMap();
			contentsCdSearchMap.setRowMaps(sRtsd0004ContentsCdList);
			
			outDataset.put("contentsCdSearchMap", contentsCdSearchMap);
			
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
	
	@RequestMapping("/rtms/sd/sRtsd0004FrCdSelect.do") 
	public ModelAndView sRtsd0004FrCdSelect(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rTSDCarStandardRegisterService.sRtsd0004FrCdSelect(inVar, outDataset);
			
			List sRtsd0004FrCdList = (List)result.get("sRtsd0004FrCdSelect");
			
			DataSetMap fdCdSearchMap = new DataSetMap();
			fdCdSearchMap.setRowMaps(sRtsd0004FrCdList);
			
			outDataset.put("fdCdSearchMap", fdCdSearchMap);
			
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
	
	@RequestMapping("/rtms/sd/sRtsd0004PlyRatingCdSelect.do") 
	public ModelAndView sRtsd0004PlyRatingCdSelect(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rTSDCarStandardRegisterService.sRtsd0004PlyRatingCdSelect(inVar, outDataset);
			
			List sRtsd0004PlyRatingCdList = (List)result.get("sRtsd0004PlyRatingCdSelect");
			
			DataSetMap plyRatingCdSearchMap = new DataSetMap();
			plyRatingCdSearchMap.setRowMaps(sRtsd0004PlyRatingCdList);
			
			outDataset.put("plyRatingCdSearchMap", plyRatingCdSearchMap);
			
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
	
	@RequestMapping("/rtms/sd/sRtsd0004SectionWidthSelect.do") 
	public ModelAndView sRtsd0004SectionWidthSelect(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rTSDCarStandardRegisterService.sRtsd0004SectionWidthSelect(inVar, outDataset);
			
			List sRtsd0004SectionWidthList = (List)result.get("sRtsd0004SectionWidthSelect");
			
			DataSetMap sectionWidthSearchMap = new DataSetMap();
			sectionWidthSearchMap.setRowMaps(sRtsd0004SectionWidthList);
			
			outDataset.put("sectionWidthSearchMap", sectionWidthSearchMap);
			
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
	
	@RequestMapping("/rtms/sd/sRtsd0004AspectRatioSelect.do") 
	public ModelAndView sRtsd0004AspectRatioSelect(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rTSDCarStandardRegisterService.sRtsd0004AspectRatioSelect(inVar, outDataset);
			
			List sRtsd0004AspectRatioList = (List)result.get("sRtsd0004AspectRatioSelect");
			
			DataSetMap aspectRatioSearchMap = new DataSetMap();
			aspectRatioSearchMap.setRowMaps(sRtsd0004AspectRatioList);
			
			outDataset.put("aspectRatioSearchMap", aspectRatioSearchMap);
			
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
	
	@RequestMapping("/rtms/sd/sRtsd0004WheelInchesSelect.do") 
	public ModelAndView sRtsd0004WheelInchesSelect(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rTSDCarStandardRegisterService.sRtsd0004WheelInchesSelect(inVar, outDataset);
			
			List sRtsd0004WheelInchesList = (List)result.get("sRtsd0004WheelInchesSelect");
			
			DataSetMap wheelInchesSearchMap = new DataSetMap();
			wheelInchesSearchMap.setRowMaps(sRtsd0004WheelInchesList);
			
			outDataset.put("wheelInchesSearchMap", wheelInchesSearchMap);
			
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
	
	@RequestMapping("/rtms/sd/sRtsd0004Select.do") 
	public ModelAndView sRtsd0004Select(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rTSDCarStandardRegisterService.sRtsd0004Select(inVar, outDataset);
			
			List sRtsd0004SelectList = (List)result.get("sRtsd0004Select");
			
			DataSetMap rtsd0004SearchMap = new DataSetMap();
			rtsd0004SearchMap.setRowMaps(sRtsd0004SelectList);
			
			outDataset.put("rtsd0004SearchMap", rtsd0004SearchMap);
			
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
	
	@RequestMapping("/rtms/sd/saveRTSDCarStandardRegister.do") 
	public ModelAndView saveRTSDCarStandardRegister(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		Map loginInfo = (Map) req.getSession().getAttribute("User");
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, Object> outVar 		= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("regId", loginInfo.get("userId"));
			Map result = rTSDCarStandardRegisterService.saveRTSDCarStandardRegister(inDataset, inVar);
			
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
