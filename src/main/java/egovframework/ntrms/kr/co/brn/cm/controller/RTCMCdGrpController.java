/************************************************************************************
 * 1.Program  			: Common DataSet Controller
 * 2.File Name			: RTCMAuthGrpController.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/
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

import egovframework.ntrms.kr.co.brn.cm.service.RTCMCdGrpService;
import egovframework.ntrms.kr.co.brn.comm.service.CommonService;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;

@Controller
public class RTCMCdGrpController {
	protected Log logger = LogFactory.getLog(this.getClass());	

	@Resource(name="rTCMCdGrpService")
	RTCMCdGrpService rTCMCdGrpService;
	
	@Resource(name="commonService")
	CommonService commonService;
	
	@RequestMapping("/rtms/cm/listcdGrpCombo.do") 
	public ModelAndView listcdGrpCombo(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("cdGrpCd", "C008");
			inVar.put("useYn", "Y");
			Map dsSearchCondition = commonService.listCommInfo(inVar);
			
			inVar.put("cdGrpCd", "C003");
			inVar.put("useYn", "Y");
			Map dsMdlCd = commonService.listCommInfo(inVar);
			
			inVar.put("cdGrpCd", "C004");
			inVar.put("useYn", "Y");
			Map dsUseYn = commonService.listCommInfo(inVar);
			
			List listComm1	= (List)dsSearchCondition.get("result");
			List listComm2	= (List)dsMdlCd.get("result");		
			List listComm3	= (List)dsUseYn.get("result");
			
			DataSetMap codeDsMap1 = new DataSetMap();
			DataSetMap codeDsMap2 = new DataSetMap();
			DataSetMap codeDsMap3 = new DataSetMap();	
			DataSetMap codeDsMap4 = new DataSetMap();
			DataSetMap codeDsMap5 = new DataSetMap();
			
			codeDsMap1.setRowMaps(listComm1);
			codeDsMap2.setRowMaps(listComm1);
			codeDsMap3.setRowMaps(listComm2);
			codeDsMap4.setRowMaps(listComm3);
			codeDsMap5.setRowMaps(listComm3);
			
			outDataset.put("output1",	codeDsMap1);
			outDataset.put("output2",	codeDsMap2);
			outDataset.put("output3",	codeDsMap3);				
			outDataset.put("output4",	codeDsMap4);
			outDataset.put("output5",	codeDsMap5);
			
			
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
	
	@RequestMapping("/rtms/cm/listCdGrp.do") 
	public ModelAndView listCdGrp(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rTCMCdGrpService.listCdGrp(inVar, outDataset);
			
			List listCdGrp	= (List)result.get("listCdGrp");
			
			DataSetMap mapCdGrp = new DataSetMap();
			
			mapCdGrp.setRowMaps(listCdGrp);
			
			outDataset.put("mapCdGrp", mapCdGrp);
			
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
	
	@RequestMapping("/rtms/cm/listCdGrpChild.do") 
	public ModelAndView listCdGrpChild(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rTCMCdGrpService.listCdGrpChild(inVar, outDataset);
			
			List listCdGrpChild = (List)result.get("listCdGrpChild");
			
			DataSetMap mapCdGrpChild = new DataSetMap();
			mapCdGrpChild.setRowMaps(listCdGrpChild);
			
			outDataset.put("mapCdGrpChild", mapCdGrpChild);
			
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
	
	@RequestMapping("/rtms/cm/cdGrpCdOverlapConfirm.do") 
	public ModelAndView cdGrpCdOverlapConfirm(NexacroMapDTO xpDto) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, Object> outVal			= xpDto.getOutVariableMap();
			
			int idx = (int)rTCMCdGrpService.cdGrpCdOverlapConfirm(inVar);
			outVal.put("resultCnt", idx);
			
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
	
	@RequestMapping("/rtms/cm/checkCd.do") 
	public ModelAndView checkCdGrpCd(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, Object> outVal			= xpDto.getOutVariableMap();
			
			int idx = (int)rTCMCdGrpService.checkCd(inVar);
			outVal.put("resultCnt", idx);
			outVal.put("checkCd", inVar.get("cd"));
			
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
	
	@RequestMapping("/rtms/cm/saveCdGrp.do") 
	public ModelAndView saveCdGrp(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
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
			
			Map result =  rTCMCdGrpService.saveCdGrp(inDataset, inVar);
			
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
