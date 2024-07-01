package egovframework.ntrms.kr.co.brn.cm.controller;

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

import egovframework.ntrms.kr.co.brn.cm.service.RTCMRentalMasterAuthService;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;

@Controller
public class RTCMRentalMasterAuthController {
	private Log log = LogFactory.getLog(RTCMRentalMasterAuthController.class);
	
	@Resource(name = "rTCMRentalMasterAuthService")
	RTCMRentalMasterAuthService rTCMRentalMasterAuthService;
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/ntrms/cm/commCodeRtlMaster.do")
	public ModelAndView getCommCodeRtlMasterComboBoxCTRL(NexacroMapDTO xpDto, Model model) {
		log.info("commCodeRtlMasterListCTRL Enter.");
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		Map <String, Object> inVar 			= xpDto.getInVariableMap();
		Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
		List<Map> resultList1 = null;
		List<Map> resultList2 = null;
		List<Map> resultList3 = null;
		List<Map> resultList4 = null;
		
		try {
			
			Map<String, Object> resultMap1 = rTCMRentalMasterAuthService.commonCodeRtlMasterComboListSVC(inVar);
			Map<String, Object> resultMap2 = rTCMRentalMasterAuthService.commonCodeRtlMasterHoboComboListSVC(inVar);
			Map<String, Object> resultMap3 = rTCMRentalMasterAuthService.rtlMasterListSVC(inVar);
			Map<String, Object> resultMap4 = rTCMRentalMasterAuthService.rtlHOBOListSVC(inVar);
			
			resultList1	= (List<Map>)resultMap1.get("result");	
			resultList2	= (List<Map>)resultMap2.get("result");	
			resultList3	= (List<Map>)resultMap3.get("result");	
			resultList4	= (List<Map>)resultMap4.get("result");	
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			
			mav.addObject(NexacroConstant.ERROR_CODE, "0");
			mav.addObject(NexacroConstant.ERROR_MSG, "");
		
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		
		DataSetMap codeDsMap1 = new DataSetMap();
		DataSetMap codeDsMap2 = new DataSetMap();
		DataSetMap codeDsMap3 = new DataSetMap();
		DataSetMap codeDsMap4 = new DataSetMap();
		codeDsMap1.setRowMaps(resultList1);
		codeDsMap2.setRowMaps(resultList2);
		codeDsMap3.setRowMaps(resultList3);
		codeDsMap4.setRowMaps(resultList4);
		outDataset.put("output1", codeDsMap1);
		outDataset.put("output2", codeDsMap2);
		outDataset.put("output3", codeDsMap3);
		outDataset.put("output4", codeDsMap4);
		
		return mav;
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/ntrms/cm/rtlMasterList.do")
	public ModelAndView getRtlMasterListCTRL(NexacroMapDTO xpDto, Model model) {
		
		log.debug("getRtlMasterListCTRL Enter.");
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		Map <String, Object> inVar 			= xpDto.getInVariableMap();
		Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
		List<Map> resultList = null;
		
		try {
			
			Map<String, Object> resultMap = rTCMRentalMasterAuthService.rtlMasterListSVC(inVar);
			resultList	= (List<Map>)resultMap.get("result");	
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			
			mav.addObject(NexacroConstant.ERROR_CODE, "0");
			mav.addObject(NexacroConstant.ERROR_MSG, "");
			
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		
		DataSetMap codeDsMap = new DataSetMap();
		codeDsMap.setRowMaps(resultList);
		outDataset.put("output", codeDsMap);
		
		return mav;
		
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/ntrms/cm/rtlHOBOList.do")
	public ModelAndView getRtlHOBOListCTRL(NexacroMapDTO xpDto, Model model) {
		
		log.debug("getRtlHOBOListCTRL Enter.");
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		Map <String, Object> inVar 			= xpDto.getInVariableMap();
		Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
		List<Map> resultList = null;
		
		try {
			
			Map<String, Object> resultMap = rTCMRentalMasterAuthService.rtlHOBOListSVC(inVar);
			resultList	= (List<Map>)resultMap.get("result");	
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			
			mav.addObject(NexacroConstant.ERROR_CODE, "0");
			mav.addObject(NexacroConstant.ERROR_MSG, "");
			
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		
		DataSetMap codeDsMap = new DataSetMap();
		codeDsMap.setRowMaps(resultList);
		outDataset.put("output", codeDsMap);
		
		return mav;
		
	}
	
	@RequestMapping(value = "/ntrms/cm/getRentalMasterInfo.do")
	public ModelAndView getRentalMasterInfo(NexacroMapDTO xpDto, Model model) {
		
		log.debug("getRentalMasterInfo Enter.");
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		Map <String, Object> inVar 			= xpDto.getInVariableMap();
		Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
		List<Map> resultList = null;
		
		try {
			
			Map<String, Object> resultMap = rTCMRentalMasterAuthService.getRentalMasterInfo(inVar);
			resultList	= (List<Map>)resultMap.get("result");	
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			
			mav.addObject(NexacroConstant.ERROR_CODE, "0");
			mav.addObject(NexacroConstant.ERROR_MSG, "");
			
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		
		DataSetMap codeDsMap = new DataSetMap();
		codeDsMap.setRowMaps(resultList);
		outDataset.put("output", codeDsMap);
		
		return mav;
		
	}
	
	@RequestMapping(value = "/ntrms/cm/saveRentalMasterInfo.do")
	public ModelAndView saveRentalMasterInfo(NexacroMapDTO xpDto, Model model, HttpServletRequest req) {
		Map loginInfo = (Map) req.getSession().getAttribute("User");
		
		log.debug("saveRentalMasterInfo Enter.");
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		Map <String, Object> inVar 			= xpDto.getInVariableMap();
		Map <String, DataSetMap> inDataset = xpDto.getInDataSetMap();		
		try {
			
			Map<String, Object> result = rTCMRentalMasterAuthService.saveRentalMasterInfo(inVar, inDataset);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			
			mav.addObject(NexacroConstant.ERROR_CODE, result.get("successCode"));
			mav.addObject(NexacroConstant.ERROR_MSG, result.get("returnMessage"));
			
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		
		return mav;
		
	}
	
	@RequestMapping(value = "/ntrms/cm/deleteRentalMasterInfo.do")
	public ModelAndView deleteRentalMasterInfo(NexacroMapDTO xpDto, Model model, HttpServletRequest req) {
		Map loginInfo = (Map) req.getSession().getAttribute("User");
		
		log.debug("saveRentalMasterInfo Enter.");
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		Map <String, Object> inVar 			= xpDto.getInVariableMap();
		Map <String, DataSetMap> inDataset = xpDto.getInDataSetMap();		
		try {
			
			Map<String, Object> result = rTCMRentalMasterAuthService.deleteRentalMasterInfo(inVar, inDataset);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			
			mav.addObject(NexacroConstant.ERROR_CODE, result.get("successCode"));
			mav.addObject(NexacroConstant.ERROR_MSG, result.get("returnMessage"));
			
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		
		return mav;
		
	}
	
	@RequestMapping(value = "/ntrms/cm/saveRentalMaster.do")
	public ModelAndView saveRentalMaster(NexacroMapDTO xpDto, Model model, HttpServletRequest req) {
		Map loginInfo = (Map) req.getSession().getAttribute("User");
		
		log.debug("saveRentalMaster Enter.");
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		Map <String, Object> inVar 			= xpDto.getInVariableMap();
		Map <String, DataSetMap> inDataset = xpDto.getInDataSetMap();		
		try {
			
			Map<String, Object> result = rTCMRentalMasterAuthService.saveRentalMaster(inVar, inDataset);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			
			mav.addObject(NexacroConstant.ERROR_CODE, result.get("successCode"));
			mav.addObject(NexacroConstant.ERROR_MSG, result.get("returnMessage"));
			
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		
		return mav;		
	}
	
	@RequestMapping(value = "/ntrms/cm/listRentalMaster.do")
	public ModelAndView listRentalMaster(NexacroMapDTO xpDto, Model model) {
		
		log.debug("getRentalMasterInfo Enter.");
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		Map <String, Object> inVar 			= xpDto.getInVariableMap();
		Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
		List<Map> resultList = null;
		
		try {
			
			Map<String, Object> resultMap = rTCMRentalMasterAuthService.listRentalMaster(inVar);
			resultList	= (List<Map>)resultMap.get("result");	
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			
			mav.addObject(NexacroConstant.ERROR_CODE, "0");
			mav.addObject(NexacroConstant.ERROR_MSG, "");
			
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		
		DataSetMap codeDsMap = new DataSetMap();
		codeDsMap.setRowMaps(resultList);
		outDataset.put("output", codeDsMap);
		
		return mav;
		
	}
	
}
