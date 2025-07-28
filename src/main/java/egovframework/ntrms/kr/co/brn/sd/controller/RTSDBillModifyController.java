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
import egovframework.ntrms.kr.co.brn.sd.service.RTSDBillModifyService;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;

@Controller
public class RTSDBillModifyController {
	
	protected Log logger = LogFactory.getLog(this.getClass());	
    
	@Resource(name="commonService")
	CommonService commonService;
	
	@Resource(name="rtsdBillModifyService")
	RTSDBillModifyService rtsdBillModifyService;
	
	//발행여부 공통코드
	@RequestMapping("/rtms/sd/initBillModifyBillYn.do") 
	public ModelAndView initRTSDRendalAnalysisStatus(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("cdGrpCd", "S087");
			inVar.put("useYn", "Y");
			Map dsRASMenu = commonService.listCommInfo(inVar);
			List listDsRASMenu = (List)dsRASMenu.get("result");	
			DataSetMap mapDsRASMenu = new DataSetMap();
			mapDsRASMenu.setRowMaps(listDsRASMenu);
			outDataset.put("mapDsRASMenu", mapDsRASMenu);
			
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

	//계산서 LIST
	@RequestMapping("/rtms/sd/listBill.do") 
	public ModelAndView listBill(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rtsdBillModifyService.listBillInfo(inVar, outDataset); 
			
			List billInfo = (List)result.get("billList");
			
			DataSetMap dsbillInfo = new DataSetMap();
			dsbillInfo.setRowMaps(billInfo);
			
			outDataset.put("billInfo", dsbillInfo);
			
			
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
	
	//발행여부 업데이트 
	@RequestMapping("/rtms/sd/saveBillInfo.do") 
	public ModelAndView saveRTSDOrdAgentRegister(NexacroMapDTO xpDto, HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map loginInfo = (Map)req.getSession().getAttribute("User");
			
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, Object> outVar 		= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("regId", loginInfo.get("userId"));
			
			Map result = rtsdBillModifyService.saveBillData(inDataset, inVar);
			
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
