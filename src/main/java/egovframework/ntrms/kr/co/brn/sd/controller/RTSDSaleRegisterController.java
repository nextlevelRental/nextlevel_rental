/************************************************************************************
 * 1.Program  			: Common DataSet Controller
 * 2.File Name			: RTSDSaleRegisterController.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

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
import egovframework.ntrms.kr.co.brn.sd.service.RTSDSaleRegisterService;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;

@Controller
public class RTSDSaleRegisterController {
	
	protected Log logger = LogFactory.getLog(this.getClass());	

	@Resource(name="rTSDSaleRegisterService")
	RTSDSaleRegisterService rTSDSaleRegisterService;
	
	@Resource(name="commonService")
	CommonService commonService;

	
	@RequestMapping("/ntrms/sd/saleGubunCode.do")
	public ModelAndView saleGubunCodeList(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
	
		try {
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, Object> outVal			= xpDto.getOutVariableMap();
			
			Map map = new HashMap();
			map.put("cd", " ");
			map.put("cdNm", "-All-");
			
			inVar.put("cdGrpCd","S207");
			inVar.put("useYn","Y");
			
			Map mapS207 = commonService.listCommInfo(inVar);
			List list0207 = (List)mapS207.get("result");
			list0207.add(0,map);
			DataSetMap dsS207Maps = new DataSetMap();
			dsS207Maps.setRowMaps(list0207);
			outDataset.put("outputS207", dsS207Maps);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE, "0");
			mav.addObject(NexacroConstant.ERROR_MSG, "");
		} catch(Exception e) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/ntrms/sd/saleList.do") 
	public ModelAndView saleList(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			@SuppressWarnings("rawtypes")
			List li = rTSDSaleRegisterService.saleList(inVar, outDataset);
			DataSetMap outDsMap = new DataSetMap();
			outDsMap.setRowMaps(li);
			outDataset.put("saleOutput", outDsMap);
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

	@RequestMapping("/ntrms/sd/saleSaveDaset.do") 
	public ModelAndView saleSaveDaset(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		Map loginInfo = (Map) req.getSession().getAttribute("User");
		try
		{
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, Object> outVar 		= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("regId", loginInfo.get("userId"));
			
			Map result = rTSDSaleRegisterService.saveSaleInfo(inDataset, inVar);
			
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
