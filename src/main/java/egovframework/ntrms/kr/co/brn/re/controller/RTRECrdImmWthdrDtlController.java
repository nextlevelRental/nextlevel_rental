/************************************************************************************
 * 1.Program  			: Common DataSet Controller
 * 2.File Name			: RTRECrdImmWthdrDtlController.java
 * 3.Developer			: ncho
 * 4.Development Date	: 2018.11.06
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

import egovframework.ntrms.kr.co.brn.re.service.RTRECrdImmWthdrDtlService;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;

@Controller
public class RTRECrdImmWthdrDtlController {
	protected Log logger = LogFactory.getLog(this.getClass());
	
	@Resource(name="rTRECrdImmWthdrDtlService")
	RTRECrdImmWthdrDtlService rTRECrdImmWthdrDtlService;
	
	/**
	 * 카드즉시출금 내역조회
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping("ntrms/re/retrieveCrdImmWthdrList.do")
	public ModelAndView retrieveCrdImmWthdrList(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map <String, Object> inVar = xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rTRECrdImmWthdrDtlService.retrieveCrdImmWthdrList(inVar, outDataset);
			
			List listCrdImmWthdr = (List)result.get("listCrdImmWthdr");
			
			DataSetMap crdDsMap = new DataSetMap();
			
			crdDsMap.setRowMaps(listCrdImmWthdr);
			
			outDataset.put("output", crdDsMap);
			
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
	
	/**
	 * 수납내역 상세조회
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping("ntrms/re/retrieveCrdImmWthdrDtlList.do")
	public ModelAndView retrieveCrdImmWthdrDtlList(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map <String, Object> inVar = xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rTRECrdImmWthdrDtlService.retrieveCrdImmWthdrDtlList(inVar, outDataset);
			
			List listCrdImmWthdrDtl = (List)result.get("listCrdImmWthdrDtl");
			
			DataSetMap crdDsMap = new DataSetMap();
			
			crdDsMap.setRowMaps(listCrdImmWthdrDtl);
			
			outDataset.put("output", crdDsMap);
			
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
}