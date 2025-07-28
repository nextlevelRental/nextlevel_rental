/************************************************************************************
 * 1.Program  			: Common DataSet Controller
 * 2.File Name			: RTREAccReqController.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.re.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import egovframework.ntrms.kr.co.brn.comm.service.CommonService;
import egovframework.ntrms.kr.co.brn.re.service.RTREPostponeService;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;

@Controller
public class RTREPostponeController {
	
	protected Log logger = LogFactory.getLog(this.getClass());	

	@Resource(name="rTREPostponeService")
	RTREPostponeService rTREPostponeService;
	
	@Resource(name="commonService")
	CommonService commonService;
	
	@RequestMapping("/rtms/re/initRTREPostpone.do") 
	public ModelAndView initRTREPostpone(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("cdGrpCd", "R037");
			inVar.put("useYn", "Y");
			Map dsPostpTp = commonService.listCommInfo(inVar);
			
			inVar.put("cdGrpCd", "R038");
			inVar.put("useYn", "Y");
			Map dsPostpStat = commonService.listCommInfo(inVar);
			
			List listDsPostpTp  = (List)dsPostpTp.get("result");	
			List listDsPostpStat	= (List)dsPostpStat.get("result");
			
			DataSetMap mapDsPostpTp  = new DataSetMap();
			DataSetMap mapDsPostpStat = new DataSetMap();
			
			mapDsPostpTp.setRowMaps(listDsPostpTp);
			mapDsPostpStat.setRowMaps(listDsPostpStat);
			
			outDataset.put("mapDsPostpTp",  mapDsPostpTp);
			outDataset.put("mapDsPostpStat", mapDsPostpStat);
			
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
	
	@RequestMapping("/rtms/re/rTREPostponeList.do") 
	public ModelAndView rTREPostponeList(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rTREPostponeService.rTREPostponeList(inVar, outDataset);
			
			List rTREPostponeList = (List)result.get("rTREPostponeList");
			
			DataSetMap postponeMap = new DataSetMap();
			postponeMap.setRowMaps(rTREPostponeList);
			
			outDataset.put("postponeMap", postponeMap);
			
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
	
	@RequestMapping("/rtms/re/rTREPostponeListExcel.do") 
	public ModelAndView rTREPostponeListExcel(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rTREPostponeService.rTREPostponeListExcel(inVar, outDataset);
			
			List rTREPostponeListExcel = (List)result.get("rTREPostponeListExcel");
			
			DataSetMap postponeExcelMap = new DataSetMap();
			postponeExcelMap.setRowMaps(rTREPostponeListExcel);
			
			outDataset.put("postponeExcelMap", postponeExcelMap);
			
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
