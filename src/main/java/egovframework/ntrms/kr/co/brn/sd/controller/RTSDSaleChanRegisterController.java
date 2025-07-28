/************************************************************************************
 * 1.Program  			: Common DataSet Controller
 * 2.File Name			: RTSDSaleChanRegisterController.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

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

import egovframework.ntrms.kr.co.brn.sd.service.RTSDSaleChanRegisterService;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;

@Controller
public class RTSDSaleChanRegisterController {
	
	protected Log logger = LogFactory.getLog(this.getClass());	

	@Resource(name="rTSDSaleChanRegisterService")
	RTSDSaleChanRegisterService rTSDSaleChanRegisterService;
	

	@SuppressWarnings("unchecked")
	@RequestMapping("/ntrms/sd/saleChanRegList.do") 
	public ModelAndView saleList(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			@SuppressWarnings("rawtypes")
			List li = rTSDSaleChanRegisterService.saleChanList(inVar, outDataset);
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
	
}
