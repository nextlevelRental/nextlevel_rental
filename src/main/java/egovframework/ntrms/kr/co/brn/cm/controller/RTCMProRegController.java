/************************************************************************************
 * 1.Program  			: Common DataSet Controller
 * 2.File Name			: RTCMUserController.java
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

import egovframework.ntrms.kr.co.brn.cm.service.RTCMProRegService;
import egovframework.ntrms.kr.co.brn.comm.service.CommonService;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;

@Controller
public class RTCMProRegController {
	
	protected Log logger = LogFactory.getLog(this.getClass());	

	@Resource(name="rTCMProRegService")
	RTCMProRegService rTCMProRegService;
	
	@Resource(name="commonService")
	CommonService commonService;
	

	@RequestMapping("/proRegController.do") 
	public ModelAndView proRegController(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			//DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			//Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			//Map <String, Object> outVar 		= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			//권한그룹 조회기준 코드
			inVar.put("cdGrpCd", "C007");
			inVar.put("useYn", "Y");
			
			Map authCd = commonService.listCommInfo(inVar);
			
			//프로그램 조회기준 코드 
			inVar.put("cdGrpCd", "C005");
			inVar.put("useYn", "Y");
			
			Map proCd = commonService.listCommInfo(inVar);
			
			//사용여부
			inVar.put("cdGrpCd", "C004");
			inVar.put("useYn", "Y");
			
			Map useYn = commonService.listCommInfo(inVar);
			
			List li = rTCMProRegService.getGrpRegList(inVar, outDataset);
			
			List li2 =(List)authCd.get("result");	
			List li3 = (List)proCd.get("result");
			List li4 = (List)useYn.get("result");
			
			DataSetMap outDsMap  = new DataSetMap();
			DataSetMap outDsMap2 = new DataSetMap();
			DataSetMap outDsMap3 = new DataSetMap();
			DataSetMap outDsMap4 = new DataSetMap();
			
			outDsMap.setRowMaps(li);
			outDsMap2.setRowMaps(li2);
			outDsMap3.setRowMaps(li3);
			outDsMap4.setRowMaps(li4);
			
			outDataset.put("output", outDsMap);
			outDataset.put("output2", outDsMap2);
			outDataset.put("output3", outDsMap3);
			outDataset.put("output4", outDsMap4);
			
			
			
			
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
	
	@RequestMapping("/proRegController11.do") 
	public ModelAndView proRegController11(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			List li = rTCMProRegService.authGroupProList(inVar, outDataset);
			List li2 = rTCMProRegService.authGroupProNotList(inVar, outDataset);
			
			DataSetMap outDsMap = new DataSetMap();
			DataSetMap outDsMap2 = new DataSetMap();
			outDsMap.setRowMaps(li);
			outDsMap2.setRowMaps(li2);
			outDataset.put("listAuth", outDsMap);
			outDataset.put("listUser", outDsMap2);
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
	
	@RequestMapping("/proRegController22.do") 
	public ModelAndView proRegController22(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			//DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			//Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			//Map <String, Object> outVar 		= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			List li = rTCMProRegService.authGroupProNotList(inVar, outDataset);
			
			DataSetMap outDsMap = new DataSetMap();
			outDsMap.setRowMaps(li);
			outDataset.put("output", outDsMap);
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
	
	
	@RequestMapping("/proRegSaveDaset.do") 
	public ModelAndView proRegSaveDaset(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map usrMap = (Map)req.getSession().getAttribute("User");
			String id = (String)usrMap.get("userId");
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, Object> outVar 		= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("regId", id);
			Map result = rTCMProRegService.proRegSaveDaset(inDataset, inVar);
			
			
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
