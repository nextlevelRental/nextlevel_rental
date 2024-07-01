package egovframework.ntrms.kr.co.brn.sd.controller;

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
import egovframework.ntrms.kr.co.brn.sd.service.RTSDAnalysisManagementService;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;



@Controller
public class RTSDAnalysisManagementController {
	protected Log logger = LogFactory.getLog(this.getClass());	
	
	@Resource(name="commonService")
	CommonService commonService;

	@Resource(name="rTSDAnalysisManagementService")
	RTSDAnalysisManagementService rTSDAnalysisManagementService;
	
	@RequestMapping("/rtms/sd/initRTSDRendalAnalysisStatus.do") 
	public ModelAndView initRTSDRendalAnalysisStatus(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("cdGrpCd", "S084");
			inVar.put("useYn", "Y");
			Map dsRASMenu = commonService.listCommInfo(inVar);
			List listDsRASMenu = (List)dsRASMenu.get("result");	
			DataSetMap mapDsRASMenu = new DataSetMap();
			mapDsRASMenu.setRowMaps(listDsRASMenu);
			outDataset.put("mapDsRASMenu", mapDsRASMenu);
			
			inVar.put("cdGrpCd", "S085");
			inVar.put("useYn", "Y");
			Map dsDisGb = commonService.listCommInfo(inVar);
			List listDsDisGb = (List)dsDisGb.get("result");	
			DataSetMap mapDsDisGb = new DataSetMap();
			mapDsDisGb.setRowMaps(listDsDisGb);
			outDataset.put("mapDsDisGb", mapDsDisGb);
			
			inVar.put("cdGrpCd", "S086");
			inVar.put("useYn", "Y");
			Map dsValGb = commonService.listCommInfo(inVar);
			List listDsValGb = (List)dsValGb.get("result");	
			DataSetMap mapDsValGb = new DataSetMap();
			mapDsValGb.setRowMaps(listDsValGb);
			outDataset.put("mapDsValGb", mapDsValGb);
			
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
	
	@RequestMapping("/rtms/sd/selectRTSDRendalAnalysisStatus.do") 
	public ModelAndView selectRTSDRendalAnalysisStatus(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rTSDAnalysisManagementService.selectRTSDRendalAnalysisStatus(inVar, outDataset);
			Map resultOuter = rTSDAnalysisManagementService.selectRTSDRendalAnalysisStatusOuter(inVar, outDataset);
			
			DataSetMap refCursor01Map = new DataSetMap();
			refCursor01Map.setRowMaps( (List)result.get("refCursor01") );
			outDataset.put("refCursor01Map", refCursor01Map);
			
			DataSetMap refCursor02Map = new DataSetMap();
			refCursor02Map.setRowMaps( (List)result.get("refCursor02") );
			outDataset.put("refCursor02Map", refCursor02Map);
			
			DataSetMap refCursor03Map = new DataSetMap();
			refCursor03Map.setRowMaps( (List)result.get("refCursor03") );
			outDataset.put("refCursor03Map", refCursor03Map);
			
			DataSetMap refCursor04Map = new DataSetMap();
			refCursor04Map.setRowMaps( (List)result.get("refCursor04") );
			outDataset.put("refCursor04Map", refCursor04Map);
			
			DataSetMap refCursor05Map = new DataSetMap();
			refCursor05Map.setRowMaps( (List)result.get("refCursor05") );
			outDataset.put("refCursor05Map", refCursor05Map);
			
			DataSetMap refCursor06Map = new DataSetMap();
			refCursor06Map.setRowMaps( (List)result.get("refCursor06") );
			outDataset.put("refCursor06Map", refCursor06Map);
			
			DataSetMap refCursor07Map = new DataSetMap();
			refCursor07Map.setRowMaps( (List)result.get("refCursor07") );
			outDataset.put("refCursor07Map", refCursor07Map);
			
			DataSetMap refCursor08Map = new DataSetMap();
			refCursor08Map.setRowMaps( (List)result.get("refCursor08") );
			outDataset.put("refCursor08Map", refCursor08Map);
			
			DataSetMap refCursor09Map = new DataSetMap();
			refCursor09Map.setRowMaps( (List)result.get("refCursor09") );
			outDataset.put("refCursor09Map", refCursor09Map);
			
			DataSetMap refCursor10Map = new DataSetMap();
			refCursor10Map.setRowMaps( (List)resultOuter.get("refCursor10") );
			outDataset.put("refCursor10Map", refCursor10Map);

			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE, "0");
			mav.addObject(NexacroConstant.ERROR_MSG, "");
		}catch( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	@RequestMapping("/rtms/sd/initRTSDOrderMonthAnalysis.do") 
	public ModelAndView initRTSDOrderMonthAnalysis(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("cdGrpCd", "S088");
			inVar.put("useYn", "Y");
			Map dsTimGb = commonService.listCommInfo(inVar);
			List listDsTimGb = (List)dsTimGb.get("result");	
			DataSetMap mapDsTimGb = new DataSetMap();
			mapDsTimGb.setRowMaps(listDsTimGb);
			outDataset.put("mapDsTimGb", mapDsTimGb);
			
			inVar.put("cdGrpCd", "S030");
			inVar.put("useYn", "Y");
			Map dsChanCd = commonService.listCommInfo(inVar);
			List listDsChanCd = (List)dsChanCd.get("result");	
			DataSetMap mapDsChanCd = new DataSetMap();
			mapDsChanCd.setRowMaps(listDsChanCd);
			outDataset.put("mapDsChanCd", mapDsChanCd);
			
			inVar.put("cdGrpCd", "S085");
			inVar.put("useYn", "Y");
			Map dsDisGb = commonService.listCommInfo(inVar);
			List listDsDisGb = (List)dsDisGb.get("result");	
			DataSetMap mapDsDisGb = new DataSetMap();
			mapDsDisGb.setRowMaps(listDsDisGb);
			outDataset.put("mapDsDisGb", mapDsDisGb);
			
			inVar.put("cdGrpCd", "S086");
			inVar.put("useYn", "Y");
			Map dsValGb = commonService.listCommInfo(inVar);
			List listDsValGb = (List)dsValGb.get("result");	
			DataSetMap mapDsValGb = new DataSetMap();
			mapDsValGb.setRowMaps(listDsValGb);
			outDataset.put("mapDsValGb", mapDsValGb);
			
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
	
	@RequestMapping("/rtms/sd/selectRTSDOrderMonthAnalysis.do") 
	public ModelAndView selectRTSDOrderMonthAnalysis(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rTSDAnalysisManagementService.selectRTSDOrderMonthAnalysis(inVar, outDataset);
			
			DataSetMap resultList = new DataSetMap();
			resultList.setRowMaps( (List)result.get("vcursor") );
			outDataset.put("resultList", resultList);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE, "0");
			mav.addObject(NexacroConstant.ERROR_MSG, "");
		}catch( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
}
