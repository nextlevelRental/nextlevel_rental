/************************************************************************************
 * 1.Program  			: Common DataSet Controller
 * 2.File Name			: RTREVaccMangController.java
 * 3.Developer			: ncho
 * 4.Development Date	: 2018.11.06
 * 5.Version			: 0.1
 * 6.Note				: 
 * 7.History			: 
 ************************************************************************************/

package egovframework.ntrms.kr.co.brn.re.controller;

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
import egovframework.ntrms.kr.co.brn.re.service.RTREVaccMangService;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;

@Controller
public class RTREVaccMangController {
	protected Log logger = LogFactory.getLog(this.getClass());
	
	@Resource(name="commonService")
	CommonService commonService;
	
	@Resource(name="rTREVaccMangService")
	RTREVaccMangService rTREVaccMangService;
	
	/**
	 * 공통코드 조회
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping("ntrms/re/getVaccMangCode.do")
	public ModelAndView getVaccMangCode(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map <String, Object> inVar = xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map map = new HashMap();
			map.put("cd",	"");
			map.put("cdNm",	"전체");
			
			/* 은행코드 */
			inVar.put("cdGrpCd", "R054");
			inVar.put("useYn", "Y");
			
			Map mapR054 = commonService.listCommInfo(inVar);
			List listR054 = (List)mapR054.get("result");
			
			DataSetMap dsR054Maps = new DataSetMap();
			listR054.add(0, map);
			dsR054Maps.setRowMaps(listR054);
			outDataset.put("outputR054", dsR054Maps);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE, "0");
			mav.addObject(NexacroConstant.ERROR_MSG, "");
		} catch(Exception e) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		
		return mav;
	}
	
	/**
	 * 가상계좌 현황 조회
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping("ntrms/re/retrieveVaccMangList.do")
	public ModelAndView retrieveVaccMangList(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map <String, Object> inVar = xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rTREVaccMangService.retrieveVaccMangList(inVar, outDataset);
			
			List listVaccMang = (List)result.get("vaccMang");
			
			DataSetMap accDsMap = new DataSetMap();
			
			accDsMap.setRowMaps(listVaccMang);
			
			outDataset.put("output", accDsMap);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME,   xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE, "0");
			mav.addObject(NexacroConstant.ERROR_MSG, "");
		} catch(Exception e) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		
		return mav;
	}
	
	/**
	 * 기간만료계좌 정리
	 * @param xpDto
	 * @param model
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping("/ntrms/re/prdExprArngm.do") 
	public ModelAndView prdExprArngm(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map<String, Object> inVar 		  = xpDto.getInVariableMap();
			Map<String, DataSetMap> inDataset = xpDto.getInDataSetMap();
			
			DataSetMap dsm = new DataSetMap();
			Map paramMap   = new HashMap();
			
			paramMap.put(NexacroConstant.DATASET_ROW_TYPE, 1);
			paramMap.put("bankCd", (String)inVar.get("bankCd")); /* 은행코드 */
			
			dsm.add(paramMap);
			inVar.put("inDsMap", dsm);
			
			Map result = rTREVaccMangService.prdExprArngm(inDataset, inVar);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE, result.get("successCode") + "");
			mav.addObject(NexacroConstant.ERROR_MSG,  result.get("returnMessage"));
		} catch(Exception e) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG,  e.toString());
		}
		
		return mav;
	}
}