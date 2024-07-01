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
import egovframework.ntrms.kr.co.brn.sd.service.RTSDCarMasterRegisterService;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;
import egovframework.rte.fdl.property.EgovPropertyService;

@Controller
public class RTSDCarMasterRegisterController {
	protected Log logger = LogFactory.getLog(this.getClass());	
	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	@Resource(name="rTSDCarMasterRegisterService")
	RTSDCarMasterRegisterService rTSDCarMasterRegisterService;
	
	@Resource(name="commonService")
	CommonService commonService;
	
	@RequestMapping("/rtms/sd/initRTSDCarMasterRegister.do") 
	public ModelAndView initRTSDCarMasterRegister(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try
		{
			
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("cdGrpCd", "S001");
			inVar.put("useYn", "Y");
			Map dsMaker = commonService.listCommInfo(inVar);
			List listDsMaker = (List)dsMaker.get("result");	
			DataSetMap mapDsMaker = new DataSetMap();
			mapDsMaker.setRowMaps(listDsMaker);
			outDataset.put("mapDsMakerSearch", mapDsMaker);
			outDataset.put("mapDsMakerGrid", mapDsMaker);
			outDataset.put("mapDsMaker", mapDsMaker);
			
			
			inVar.put("cdGrpCd", "S002");
			inVar.put("useYn", "Y");
			Map dsModel  = commonService.listCommInfo(inVar);
			List listDsModel = (List)dsModel.get("result");	
			DataSetMap mapDsModel = new DataSetMap();
			mapDsModel.setRowMaps(listDsModel);
			outDataset.put("mapDsModelGrid", mapDsModel);
			outDataset.put("mapDsModel", mapDsModel);
			
			inVar.put("cdGrpCd", "S003");
			inVar.put("useYn", "Y");
			Map dsContents = commonService.listCommInfo(inVar);
			List listDsContents = (List)dsContents.get("result");	
			DataSetMap mapDsContents = new DataSetMap();
			mapDsContents.setRowMaps(listDsContents);
			outDataset.put("mapDsContentsGrid", mapDsContents);
			outDataset.put("mapDsContents", mapDsContents);
			
			inVar.put("cdGrpCd", "S004");
			inVar.put("useYn", "Y");
			Map dsFrCd = commonService.listCommInfo(inVar);
			List listDsFrCd = (List)dsFrCd.get("result");	
			DataSetMap mapDsFrCd = new DataSetMap();
			mapDsFrCd.setRowMaps(listDsFrCd);
			outDataset.put("mapDsFrCdGrid", mapDsFrCd);
			outDataset.put("mapDsFrCd", mapDsFrCd);
			
			
			inVar.put("cdGrpCd", "C004");
			inVar.put("useYn", "Y");
			Map dsUseYn = commonService.listCommInfo(inVar);
			List listDsUseYn = (List)dsUseYn.get("result");	
			DataSetMap mapDsUseYn = new DataSetMap();
			mapDsUseYn.setRowMaps(listDsUseYn);
			outDataset.put("mapDsUseYnSearch", mapDsUseYn);
			outDataset.put("mapDsUseYnGrid", mapDsUseYn);
			outDataset.put("mapDsUseYn", mapDsUseYn);
			
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
	
	@RequestMapping("/rtms/sd/sRtsd0001ModelSelect.do") 
	public ModelAndView sRtsd0001ModelSelect(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rTSDCarMasterRegisterService.sRtsd0001ModelSelect(inVar, outDataset);
			
			List sRtsd0001ModelSelect = (List)result.get("sRtsd0001ModelSelect");
			
			DataSetMap modelSearchMap = new DataSetMap();
			modelSearchMap.setRowMaps(sRtsd0001ModelSelect);
			
			outDataset.put("modelSearchMap", modelSearchMap);
			
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
	
	@RequestMapping("/rtms/sd/sRtsd0001ModelByClassSelect.do") 
	public ModelAndView sRtsd0001ModelByClassSelect(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rTSDCarMasterRegisterService.sRtsd0001ModelByClassSelect(inVar, outDataset);
			
			List sRtsd0001ModelByClassSelect = (List)result.get("sRtsd0001ModelByClassSelect");
			
			DataSetMap modelSearchMap = new DataSetMap();
			modelSearchMap.setRowMaps(sRtsd0001ModelByClassSelect);
			
			outDataset.put("modelSearchMap", modelSearchMap);
			
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
	
	@RequestMapping("/rtms/sd/sRtsd0001ContentsSelect.do") 
	public ModelAndView sRtsd0001ContentsSelect(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rTSDCarMasterRegisterService.sRtsd0001ContentsSelect(inVar, outDataset);
			
			List sRtsd0001ContentsSelect = (List)result.get("sRtsd0001ContentsSelect");
			
			DataSetMap contentsSearchMap = new DataSetMap();
			contentsSearchMap.setRowMaps(sRtsd0001ContentsSelect);
			
			outDataset.put("contentsSearchMap", contentsSearchMap);
			
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
	
	@RequestMapping("/rtms/sd/carMasterSelect.do") 
	public ModelAndView carMasterSelect(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rTSDCarMasterRegisterService.carMasterSelect(inVar, outDataset);
			
			List carMasterSelect = (List)result.get("carMasterSelect");
			
			DataSetMap carMasterSelectMap = new DataSetMap();
			carMasterSelectMap.setRowMaps(carMasterSelect);
			
			outDataset.put("carMasterSelectMap", carMasterSelectMap);
			
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
	
	@RequestMapping("/rtms/sd/saveRTSDCarMasterRegister.do") 
	public ModelAndView saveRTSDCarMasterRegister(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
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
			Map result =  rTSDCarMasterRegisterService.saveRTSDCarMasterRegister(inDataset, inVar);
			
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
