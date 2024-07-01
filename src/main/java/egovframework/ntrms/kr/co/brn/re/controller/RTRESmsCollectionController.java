package egovframework.ntrms.kr.co.brn.re.controller;

import java.util.HashMap;
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
import egovframework.ntrms.kr.co.brn.re.service.RTRESmsCollectionService;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;

@Controller
public class RTRESmsCollectionController {
	protected Log logger = LogFactory.getLog(this.getClass());	

	@Resource(name="rTRESmsCollectionService")
	RTRESmsCollectionService rTRESmsCollectionService;
	
	@Resource(name="commonService")
	CommonService commonService;
	
	/**
	 * 인터페이스 시점(공통코드)
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/rtms/re/rTRESendSmsCode.do") 
	public ModelAndView getSendSmsCode(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map map = new HashMap();
			
			map.put("cd", " ");
			map.put("cdNm","전체");
			
			inVar.put("cdGrpCd", "R082");
			inVar.put("useYn", "Y");
			
			Map mapR082 = commonService.listCommInfo(inVar);
			
			List listR082 = (List)mapR082.get("result");
			listR082.add(0, map);
			
			DataSetMap dsR082Maps = new DataSetMap();
			dsR082Maps.setRowMaps(listR082);
			outDataset.put("outputR082", dsR082Maps);	
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE, "0");
			mav.addObject(NexacroConstant.ERROR_MSG, "");
		}catch( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	@RequestMapping("/rtms/re/rTRESmsCollectionList.do") 
	public ModelAndView rTRESmsCollectionList(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rTRESmsCollectionService.rTRESmsCollectionList(inVar);
			
			List rTRESmsCollectionList = (List)result.get("rTRESmsCollectionList");
			
			DataSetMap smsCollectionList = new DataSetMap();
			smsCollectionList.setRowMaps(rTRESmsCollectionList);
			
			outDataset.put("output", smsCollectionList);
			
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
