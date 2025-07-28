/************************************************************************************
 * 1.Program  			: Common DataSet Controller
 * 2.File Name			: RTREArrearsPaymentController.java
 * 3.Developer			: ncho
 * 4.Development Date	: 2018.11.12
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

import egovframework.ntrms.kr.co.brn.comm.service.CommonService;
import egovframework.ntrms.kr.co.brn.re.service.RTREArrearsPaymentService;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;

@Controller
public class RTREArrearsPaymentController {
	protected Log logger = LogFactory.getLog(this.getClass());
	
	@Resource(name="rTREArrearsPaymentService")
	RTREArrearsPaymentService rTREArrearsPaymentService;
	
	@Resource(name="commonService")
	CommonService commonService;
	
	/**
	 * 미납내역상세 조회
	 * @param	xpDto
	 * @param	model
	 * @return	ModelAndView
	 * @throws	Exception
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping("ntrms/re/retrieveUnpaidList.do")
	public ModelAndView retrieveUnpaidList(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map <String, Object> inVar = xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rTREArrearsPaymentService.retrieveUnpaidList(inVar, outDataset);
			
			List list = (List)result.get("listUnpaid");
			
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
}