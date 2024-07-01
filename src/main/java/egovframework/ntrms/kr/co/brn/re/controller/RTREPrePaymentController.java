/************************************************************************************
 * 1.Program  			: Common DataSet Controller
 * 2.File Name			: RTREPrePaymentController.java
 * 3.Developer			: ncho
 * 4.Development Date	: 2018.12.10
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
import egovframework.ntrms.kr.co.brn.re.service.RTREPrePaymentService;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;

@Controller
public class RTREPrePaymentController {
	protected Log logger = LogFactory.getLog(this.getClass());
	
	@Resource(name="rTREPrePaymentService")
	RTREPrePaymentService rTREPrePaymentService;
	
	@Resource(name="commonService")
	CommonService commonService;
	
	/**
	 * 선납개월 선택항목 조회
	 * @param	xpDto
	 * @param	model
	 * @return	ModelAndView
	 * @throws	Exception
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping("ntrms/re/retrievePrptMonList.do")
	public ModelAndView retrievePrptMonList(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map<String, Object> inVar = xpDto.getInVariableMap();
			Map<String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rTREPrePaymentService.retrievePrptMonList(inVar, outDataset);
			
			List list = (List)result.get("listPrptMon");
			
			DataSetMap accDsMap = new DataSetMap();
			accDsMap.setRowMaps(list);
			outDataset.put("output", accDsMap);
			
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
	 * 선납금액계산
	 * @param	xpDto
	 * @param	model
	 * @return	ModelAndView
	 * @throws	Exception
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping("ntrms/re/retrievePrePymntAmtCalc.do")
	public ModelAndView retrievePrePymntAmtCalc(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map<String, Object> inVar = xpDto.getInVariableMap();
			Map<String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rTREPrePaymentService.retrievePrePymntAmtCalc(inVar, outDataset);
			
			List list = (List)result.get("listPrePymntAmtCalc");
			
			DataSetMap accDsMap = new DataSetMap();
			accDsMap.setRowMaps(list);
			outDataset.put("output", accDsMap);
			
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
	 * 납부예정상세 조회
	 * @param	xpDto
	 * @param	model
	 * @return	ModelAndView
	 * @throws	Exception
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping("ntrms/re/retrievePymntSchdlDtlList.do")
	public ModelAndView retrievePymntSchdlDtlList(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map<String, Object> inVar = xpDto.getInVariableMap();
			Map<String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rTREPrePaymentService.retrievePymntSchdlDtlList(inVar, outDataset);
			
			List list = (List)result.get("listPymntSchdlDtl");
			
			DataSetMap accDsMap = new DataSetMap();
			accDsMap.setRowMaps(list);
			outDataset.put("output", accDsMap);
			
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
	 * 선납할인가능여부체크
	 * @param	xpDto
	 * @param	model
	 * @return	ModelAndView
	 * @throws	Exception
	 */
	@SuppressWarnings({ "rawtypes" })
	@RequestMapping("ntrms/re/checkPrePaymentAbleYn.do")
	public ModelAndView checkPrePaymentAbleYn(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map<String, Object> inVar  = xpDto.getInVariableMap();
			Map<String, Object> outVar = xpDto.getOutVariableMap();
			
			Map result = rTREPrePaymentService.checkPrePaymentAbleYn(inVar);
			
			String prptYn = (String)result.get("prptYn");
			
			outVar.put("prptYn", prptYn);
			
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