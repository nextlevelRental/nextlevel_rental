/************************************************************************************
 * 1.Program  			: Common DataSet Controller
 * 2.File Name			: RTREPrePaymentDtlController.java
 * 3.Developer			: ncho
 * 4.Development Date	: 2018.12.18
 * 5.Version			: 0.1
 * 6.Note				: 
 * 7.History			: 
 ************************************************************************************/

package egovframework.ntrms.kr.co.brn.re.controller;

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
import egovframework.ntrms.kr.co.brn.re.service.RTREPrePaymentDtlService;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;

@Controller
public class RTREPrePaymentDtlController {
	protected Log logger = LogFactory.getLog(this.getClass());
	
	@Resource(name="rTREPrePaymentDtlService")
	RTREPrePaymentDtlService rTREPrePaymentDtlService;
	
	@Resource(name="commonService")
	CommonService commonService;
	
	/**
	 * 선납내역조회
	 * @param	xpDto
	 * @param	model
	 * @return	ModelAndView
	 * @throws	Exception
	 */
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping("ntrms/re/retrievePrePaymentMstList.do")
	public ModelAndView retrievePrePaymentMstList(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map<String, Object> mapInVar = xpDto.getInVariableMap();
			Map<String, DataSetMap> mapOutDSM = xpDto.getOutDataSetMap();
			
			Map result = rTREPrePaymentDtlService.retrievePrePaymentMstList(mapInVar, mapOutDSM);
			
			List list = (List)result.get("listPrePaymentMst");
			
			DataSetMap accDsMap = new DataSetMap();
			accDsMap.setRowMaps(list);
			mapOutDSM.put("output", accDsMap);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME,	  xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE,			  "0");
			mav.addObject(NexacroConstant.ERROR_MSG,			  "");
		} catch(Exception e) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG,  e.toString());
		}
		
		return mav;
	}
	
	/**
	 * 선납내역상세 조회
	 * @param	xpDto
	 * @param	model
	 * @return	ModelAndView
	 * @throws	Exception
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping("ntrms/re/retrievePrePaymentDtlList.do")
	public ModelAndView retrievePrePaymentDtlList(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map<String, Object> mapInVar = xpDto.getInVariableMap();
			Map<String, DataSetMap> mapOutDSM = xpDto.getOutDataSetMap();
			
			Map result = rTREPrePaymentDtlService.retrievePrePaymentDtlList(mapInVar, mapOutDSM);
			
			List list = (List)result.get("listPrePaymentDtl");
			
			DataSetMap accDsMap = new DataSetMap();
			accDsMap.setRowMaps(list);
			mapOutDSM.put("output", accDsMap);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME,	  xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE,			  "0");
			mav.addObject(NexacroConstant.ERROR_MSG,			  "");
		} catch(Exception e) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG,  e.toString());
		}
		
		return mav;
	}
	
	/**
	 * 선납할인금액계산
	 * @param	xpDto
	 * @param	model
	 * @return	ModelAndView
	 * @throws	Exception
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping("ntrms/re/prePymntDscntAmtCalc.do")
	public ModelAndView prePymntDscntAmtCalc(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map<String, Object> mapInVar = xpDto.getInVariableMap();
			Map<String, DataSetMap> mapOutDSM = xpDto.getOutDataSetMap();
			
			Map result = rTREPrePaymentDtlService.prePymntDscntAmtCalc(mapInVar, mapOutDSM);
			
			List list = (List)result.get("prePymntDscntAmtCalc");
			
			DataSetMap accDsMap = new DataSetMap();
			accDsMap.setRowMaps(list);
			mapOutDSM.put("output", accDsMap);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME,	  xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE,			  "0");
			mav.addObject(NexacroConstant.ERROR_MSG,			  "");
		} catch(Exception e) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG,  e.toString());
		}
		
		return mav;
	}
}