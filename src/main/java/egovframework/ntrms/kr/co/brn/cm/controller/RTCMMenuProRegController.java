/************************************************************************************
 * 1.Program  			: Common DataSet Controller
 * 2.File Name			: RTCMMenuController.java
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

import com.nexacro.xapi.data.DataSet;

import egovframework.ntrms.kr.co.brn.cm.service.RTCMMenuProRegService;
import egovframework.ntrms.kr.co.brn.cm.service.RTCMMenuService;
import egovframework.ntrms.kr.co.brn.comm.service.CommonService;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;

@Controller
public class RTCMMenuProRegController {
	
	protected Log logger = LogFactory.getLog(this.getClass());	

	@Resource(name="rTCMMenuProRegService")
	RTCMMenuProRegService rTCMMenuProRegService;
	
	@Resource(name="commonService")
	CommonService commonService;
	
	@RequestMapping("/ntrms/cm/listTreeMenuPro.do")
	public ModelAndView listTreeMenuPro(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rTCMMenuProRegService.listTreeMenu(inVar, outDataset);
			
			//프로그램 조회기준 코드 
			inVar.put("cdGrpCd", "C005");
			inVar.put("useYn", "Y");
			
			Map proCd = commonService.listCommInfo(inVar);
			
			List listTreeMenu	= (List)result.get("listTreeMenu");
			List listComm		= (List)proCd.get("result");	
			
			DataSetMap menuDsMap = new DataSetMap();
			DataSetMap codeDsMap = new DataSetMap();
			
			menuDsMap.setRowMaps(listTreeMenu);
			codeDsMap.setRowMaps(listComm);		

			outDataset.put("output",	menuDsMap);
			outDataset.put("output2",	codeDsMap);			
			
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
	
	@RequestMapping("/ntrms/cm/listMenuPro.do") 
	public ModelAndView listMenuPro(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("menuCd", inVar.get("uprMenuCd"));
			
			Map result = rTCMMenuProRegService.listMenu(inVar, outDataset);
			Map result2 = rTCMMenuProRegService.listMenuAuthPro(inVar, outDataset);
			Map result3 = rTCMMenuProRegService.listMenuAuthNotPro(inVar, outDataset);
			
			List listMenu	= (List)result.get("listMenu");
			List authList	= (List)result2.get("authList");
			List authNotList	= (List)result3.get("authNotList");
			
			DataSetMap menuDsMap = new DataSetMap();
			DataSetMap authDsMap = new DataSetMap();
			DataSetMap authNotDsMap = new DataSetMap();
			
			menuDsMap.setRowMaps(listMenu);
			authDsMap.setRowMaps(authList);
			authNotDsMap.setRowMaps(authNotList);

			outDataset.put("output",	menuDsMap);
			outDataset.put("output2",	authDsMap);
			outDataset.put("output3",	authNotDsMap);
			
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
	

	@RequestMapping("/ntrms/cm/menuProSaveDaset.do") 
	public ModelAndView menuProSaveDaset(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map loginInfo = (Map) req.getSession().getAttribute("User");
			
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, Object> outVar 		= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();

			inVar.put("regId", loginInfo.get("userId"));
			
			Map result = rTCMMenuProRegService.saveMenuInfo(inDataset, inVar);
			
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
	//조회
	@RequestMapping("/ntrms/cm/authNotInfo.do") 
	public ModelAndView authNotInfo(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			//DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			//Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			//Map <String, Object> outVar 		= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map authNotList = rTCMMenuProRegService.listMenuAuthNotPro(inVar, outDataset);
			List li =  (List)authNotList.get("authNotList");
			
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
}
