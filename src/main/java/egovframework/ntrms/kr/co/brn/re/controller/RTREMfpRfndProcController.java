/************************************************************************************
 * 1.Program  			: Common DataSet Controller
 * 2.File Name			: RTREMfpRfndProcController.java
 * 3.Developer			: ncho
 * 4.Development Date	: 2018.12.21
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
import egovframework.ntrms.kr.co.brn.re.service.RTREMfpRfndProcService;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;

@Controller
public class RTREMfpRfndProcController {
	protected Log logger = LogFactory.getLog(this.getClass());
	
	@Resource(name="rTREMfpRfndProcService")
	RTREMfpRfndProcService rTREMfpRfndProcService;
	
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
	@RequestMapping("/rtms/re/initRTREMiddleFullPayment.do")
	public ModelAndView initRTREMiddleFullPayment(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map<String, Object> inVar = xpDto.getInVariableMap();
			Map<String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map map = new HashMap();
			map.put("cd",	"");
			map.put("cdNm",	"전체");
			
			inVar.put("cdGrpCd", "S070");
			inVar.put("useYn", "Y");
			Map dsEndTp = commonService.listCommInfo(inVar);
			
			List listDsEndTp = (List)dsEndTp.get("result");
			DataSetMap mapDsEndTp = new DataSetMap();
			mapDsEndTp.setRowMaps(listDsEndTp);
			outDataset.put("mapDsEndTp", mapDsEndTp);
			
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
	 * 중도완납환불대상내역조회
	 * @param	xpDto
	 * @param	model
	 * @return	ModelAndView
	 * @throws	Exception
	 */
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping("ntrms/re/retrieveMfpRfndTrgtList.do")
	public ModelAndView retrieveMfpRfndTrgtList(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map<String, Object> mapInVar = xpDto.getInVariableMap();
			Map<String, DataSetMap> mapOutDSM = xpDto.getOutDataSetMap();
			
			Map result = rTREMfpRfndProcService.retrieveMfpRfndTrgtList(mapInVar, mapOutDSM);
			
			List list = (List)result.get("listMfpRfndTrgt");
			
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