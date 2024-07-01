/************************************************************************************
 * 1.Program  			: Common DataSet Controller
 * 2.File Name			: RTREMiddleFullPaymentController.java
 * 3.Developer			: kstka
 * 4.Development Date	: 2018.10.10
 * 5.Version			: 0.2
 * 6.Note				: 
 * 7.History			: ncho - 2018.12.10 - 수납공통 > 중도완납수납 개발
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
import egovframework.ntrms.kr.co.brn.re.service.RTREMiddleFullPaymentService;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;

@Controller
public class RTREMiddleFullPaymentController {
	protected Log logger = LogFactory.getLog(this.getClass());
	
	@Resource(name="rTREMiddleFullPaymentService")
	RTREMiddleFullPaymentService rTREMiddleFullPaymentService;
	
	@Resource(name="commonService")
	CommonService commonService;
	
	/**
	 * 계약종료유형 선택항목 조회
	 * @param	xpDto
	 * @param	model
	 * @return	ModelAndView
	 * @throws	Exception
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping("/rtms/re/getEndTpCode.do")
	public ModelAndView getEndTpCode(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map<String, Object> inVar = xpDto.getInVariableMap();
			Map<String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map map = new HashMap();
			map.put("cd",	"");
			map.put("cdNm",	"전체");
			
			/* 계약종료유형 */
			inVar.put("cdGrpCd", "S070");
			inVar.put("useYn", "Y");
			Map dsEndTp = commonService.listCommInfo(inVar);
			
			List listDsEndTp = (List)dsEndTp.get("result");
			DataSetMap mapDsEndTp = new DataSetMap();
			listDsEndTp.add(0, map);
			mapDsEndTp.setRowMaps(listDsEndTp);
			outDataset.put("output", mapDsEndTp);
			
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
	 * 중도완납사유 선택항목 조회
	 * @param	xpDto
	 * @param	model
	 * @return	ModelAndView
	 * @throws	Exception
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping("ntrms/re/retrieveMfpRsnList.do")
	public ModelAndView retrieveMfpRsnList(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map<String, Object> inVar = xpDto.getInVariableMap();
			Map<String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("cdGrpCd", "R053");
			inVar.put("useYn", "Y");
			Map dsEndTp = commonService.listCommInfo(inVar);
			
			List listDsEndTp = (List)dsEndTp.get("result");
			DataSetMap mapDsEndTp = new DataSetMap();
			mapDsEndTp.setRowMaps(listDsEndTp);
			outDataset.put("output", mapDsEndTp);
			
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
	 * 납부예정금액 조회
	 * @param	xpDto
	 * @param	model
	 * @return	ModelAndView
	 * @throws	Exception
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping("/rtms/re/pSrtsd0109CancelList.do")
	public ModelAndView pSrtsd0109CancelList(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map<String, Object> inVar = xpDto.getInVariableMap();
			Map<String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rTREMiddleFullPaymentService.pSrtsd0109CancelList(inVar, outDataset);
			
			List pSrtsd0109CancelList = (List)result.get("pSrtsd0109CancelList");
			
			DataSetMap mapCancelList = new DataSetMap();
			mapCancelList.setRowMaps(pSrtsd0109CancelList);
			
			outDataset.put("mapCancelList", mapCancelList);
			
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
	 * 결제정보 저장
	 * @param	xpDto
	 * @param	model
	 * @return	ModelAndView
	 * @throws	Exception
	 */
	@SuppressWarnings({ "rawtypes" })
	@RequestMapping("/rtms/sd/cancelSave.do") 
	public ModelAndView cancelSave(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		Map loginInfo = (Map) req.getSession().getAttribute("User");
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map<String, Object> inVar = xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset = xpDto.getInDataSetMap();
			
			inVar.put("regId", loginInfo.get("userId"));
			
			Map result = rTREMiddleFullPaymentService.cancelSave(inDataset, inVar);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, xpDto.getOutDataSetMap());
			
			mav.addObject(NexacroConstant.ERROR_CODE, result.get("successCode") + "");
			mav.addObject(NexacroConstant.ERROR_MSG, result.get("returnMessage"));
			
		} catch(Exception e) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		
		return mav;
	}
}