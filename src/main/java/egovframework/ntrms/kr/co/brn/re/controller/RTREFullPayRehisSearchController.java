/************************************************************************************
 * 1.Program  			: Common DataSet Controller
 * 2.File Name			: RTREFullPayRehisSearchController.java
 * 3.Developer			: sunq
 * 4.Development Date	: 2018.12.07
 * 5.Version			: 0.1
 * 6.Note				: 
 * 7.History			: 
 ************************************************************************************/

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

import egovframework.ntrms.kr.co.brn.re.service.RTREFullPayRehisSearchService;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;

@Controller
public class RTREFullPayRehisSearchController {
	protected Log logger = LogFactory.getLog(this.getClass());
	
	@Resource(name="rTREFullPayRehisSearchService")
	RTREFullPayRehisSearchService rTREFullPayRehisSearchService;
	
	/**
	 * 중도완납/해지 내역조회
	 * @param nexacroMapDTO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("ntrms/re/fullPayRehSearchList.do")
	public ModelAndView fullPayRehisSearchCTRL(NexacroMapDTO nexacroMapDTO, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		logger.info("fullPayRehisSearchCTRL Enter");
		
		try {
			Map <String, Object> inVar = nexacroMapDTO.getInVariableMap();
			Map <String, DataSetMap> outDataset = nexacroMapDTO.getOutDataSetMap();
			Map<String, Object> result = rTREFullPayRehisSearchService.getFullPayRehisSearchSVC(inVar, outDataset);
			
			@SuppressWarnings({ "rawtypes", "unchecked" })
			List<Map> fullPayRehSearchList = (List<Map>)result.get("fullPayRehSearchList");
			
			// 중도완납/해지 내역조회
			DataSetMap accDsMap = new DataSetMap();
			accDsMap.setRowMaps(fullPayRehSearchList);
			
			
			outDataset.put("output", accDsMap);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	nexacroMapDTO.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	nexacroMapDTO.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE, "0");
			mav.addObject(NexacroConstant.ERROR_MSG, "");
		} catch(Exception e) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		
		return mav;
	}
	
	@RequestMapping("ntrms/re/commUserGroupCodeList.do")
	public ModelAndView commUserGroupCodeListCTRL(NexacroMapDTO nexacroMapDTO, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		logger.info("commUserGroupCodeListCTRL Enter");
		
		try {
			Map <String, Object> inVar = nexacroMapDTO.getInVariableMap();
			Map <String, DataSetMap> outDataset = nexacroMapDTO.getOutDataSetMap();
			Map<String, Object> result1 = rTREFullPayRehisSearchService.getCommUserGroupCodeListSVC(inVar, outDataset);
			
			
			@SuppressWarnings({ "rawtypes", "unchecked" })
			List<Map> commUserGroupCodeList = (List<Map>)result1.get("commUserGroupCodeList");
			
			logger.info(commUserGroupCodeList);
			
			//공통코드(사용자그룹조회)
			DataSetMap groupDataSetMap = new DataSetMap();
			groupDataSetMap.setRowMaps(commUserGroupCodeList);
			
			outDataset.put("output", groupDataSetMap);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	nexacroMapDTO.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	nexacroMapDTO.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE, "0");
			mav.addObject(NexacroConstant.ERROR_MSG, "");
		} catch(Exception e) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		
		return mav;
	}
	
}
