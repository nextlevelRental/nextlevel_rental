package egovframework.ntrms.kr.co.brn.cs.controller;

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

import egovframework.ntrms.kr.co.brn.cs.service.RTCSServiceHistoryService;
import egovframework.ntrms.kr.co.exec.handler.controller.ControllerBase;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;

@Controller
public class RTCSServiceHistoryController extends ControllerBase {
	
	protected Log logger = LogFactory.getLog(this.getClass());	

	@Resource(name="rTCSServiceHistoryService")
	RTCSServiceHistoryService rTCSServiceHistoryService;
	
	@RequestMapping("/rtms/cs/selectServiceHistory.do") 
	public ModelAndView selectEngineOilServrqDay(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, Object> outVal			= xpDto.getOutVariableMap();
			
			Map serviceHistoryMap = rTCSServiceHistoryService.serviceHistoryList(inVar, outDataset);
			List serviceHistoryList = (List)serviceHistoryMap.get("serviceHistoryList");
			
			DataSetMap ds_serviceHistoryList = new DataSetMap();
			ds_serviceHistoryList.setRowMaps(serviceHistoryList);
			outDataset.put("output", ds_serviceHistoryList);
			
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
		
	@RequestMapping("/rtms/cs/saveRTCS0008DlvcYn.do") 
	public ModelAndView saveRTCS0008DlvcYn(NexacroMapDTO xpDto, HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map loginInfo = (Map)req.getSession().getAttribute("User");
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, Object> outVar 		= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			inVar.put("regId", loginInfo.get("userId"));

			Map result = rTCSServiceHistoryService.saveRTCS0008(inVar);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE, result.get("successCode") + "");
			mav.addObject(NexacroConstant.ERROR_MSG, result.get("returnMessage"));
		}catch( Exception e ){
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
}
