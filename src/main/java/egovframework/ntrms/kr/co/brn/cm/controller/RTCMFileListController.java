/************************************************************************************
 * 1.Program  			: Common DataSet Controller
 * 2.File Name			: RTCMUserController.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.cm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;








import egovframework.ntrms.kr.co.brn.cm.dao.RTCMNoticeMapDAO;
import egovframework.ntrms.kr.co.brn.cm.service.RTCMFileListService;
import egovframework.ntrms.kr.co.brn.cm.service.RTCMNoticeService;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;

@Controller
public class RTCMFileListController {

	protected Log logger = LogFactory.getLog(this.getClass());	
	@Resource(name="rTCMFileListService")
	RTCMFileListService rTCMFileListService;
	
	@RequestMapping("/ntrms/cm/listFileInfo.do") 
	public ModelAndView listFileInfo(NexacroMapDTO xpDto) throws Exception {
	
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			List result = rTCMFileListService.listFileInfo(inVar, outDataset);
			//업로드 파일 목록조회
			DataSetMap userDsMap = new DataSetMap();
			userDsMap.setRowMaps(result);
			
			outDataset.put("listFileInfo",	userDsMap);
			
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
	
	/*
	 * PoC 점수조회 (테스트용)
	 * @param xpDto
	 * @return ModelAndView
	 * @throws Exception
	 */
	@RequestMapping("/ntrms/cm/listPocScore.do") 
	public ModelAndView listPocScore(NexacroMapDTO xpDto) throws Exception {
	
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			List result = rTCMFileListService.listPocScore(inVar, outDataset);
			
			//업로드 파일 목록조회
			DataSetMap userDsMap = new DataSetMap();
			userDsMap.setRowMaps(result);			
			outDataset.put("listPocScore",	userDsMap);
			
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
