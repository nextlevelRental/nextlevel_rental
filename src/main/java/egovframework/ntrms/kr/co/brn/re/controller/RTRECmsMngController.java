/************************************************************************************
 * 1.Program  			: Common DataSet Controller
 * 2.File Name			: RTREAccReqController.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.re.controller;

import java.io.File;
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

import egovframework.ntrms.kr.co.brn.re.service.RTRECmsMngService;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;

@Controller
public class RTRECmsMngController {
	
	protected Log logger = LogFactory.getLog(this.getClass());	

	@Resource(name="rTRECmsMngService")
	RTRECmsMngService rTRECmsMngService;

	@RequestMapping("/ntrms/re/testDown.do") 
	public ModelAndView testDown(NexacroMapDTO xpDto, HttpServletRequest req) throws Exception {
		
		String fileNm = req.getParameter("test");
		
		File file = new File("C:\\" + fileNm);
		Map fileMap = new HashMap<String, Object>();
		fileMap.put("file_data", file);
		fileMap.put("file_ori_nm", fileNm);
		fileMap.put("deleteYn", "N");

		return new ModelAndView("file", "downloadFile", fileMap);
	}
	
	@RequestMapping("/ntrms/re/listRtsd0109.do") 
	public ModelAndView listRtsd0109(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map dsRtsd0109 = rTRECmsMngService.getRtsd0109(inVar);
			List listDsRtsd0109 = (List)dsRtsd0109.get("vcursor");	
			DataSetMap mapDsRtsd0109 = new DataSetMap();
			mapDsRtsd0109.setRowMaps(listDsRtsd0109);
			outDataset.put("mapDsRtsd0109", mapDsRtsd0109);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			
			mav.addObject(NexacroConstant.ERROR_CODE, "0");
			mav.addObject(NexacroConstant.ERROR_MSG, "");
		}catch(Exception e){
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		
		return mav;
	}
	
	/**
	 * 무통장 입금내역 저장
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/ntrms/re/saveCmsMng.do") 
	public ModelAndView saveCmsMng(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset = xpDto.getInDataSetMap();
			
			Map result = rTRECmsMngService.saveCmsProc(inDataset);
			
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
