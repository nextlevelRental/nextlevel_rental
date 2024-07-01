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
import egovframework.ntrms.kr.co.brn.re.service.RTREDrawDayRegisterService;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;

@Controller
public class RTREDrawDayRegisterController {
	protected Log logger = LogFactory.getLog(this.getClass());	

	@Resource(name="rTREDrawDayRegisterService")
	RTREDrawDayRegisterService rTREDrawDayRegisterService;
	
	@Resource(name="commonService")
	CommonService commonService;
	
	/**
	 * 인터페이스 시점(공통코드)
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/rtms/re/rTREDrawDayCommCode.do") 
	public ModelAndView getDrawDayRegisterCommCode(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map map = new HashMap();
			
			map.put("cd", " ");
			map.put("cdNm","전체");
			
			inVar.put("cdGrpCd", "R066");
			inVar.put("useYn", "Y");
			
			Map mapR066 = commonService.listCommInfo(inVar);
			
			List listR066 = (List)mapR066.get("result");
			listR066.add(0, map);
			
			DataSetMap dsR066Maps = new DataSetMap();
			dsR066Maps.setRowMaps(listR066);
			outDataset.put("R066", dsR066Maps);
			
			map.put("cd", " ");
			map.put("cdNm","전체");
			
			inVar.put("cdGrpCd", "C033");
			inVar.put("useYn", "Y");
			
			Map mapC033 = commonService.listCommInfo(inVar);
			
			List listC033 = (List)mapC033.get("result");
			listC033.add(0, map);
			
			DataSetMap dsC033Maps = new DataSetMap();
			dsC033Maps.setRowMaps(listC033);
			outDataset.put("C033", dsC033Maps);	
			
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
	
	@RequestMapping("/rtms/re/rTREDrawDayList.do") 
	public ModelAndView rTREDrawDayList(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rTREDrawDayRegisterService.rTREDrawDayList(inVar);
			
			List rTREDrawDayList = (List)result.get("rTREDrawDayList");
			
			DataSetMap output = new DataSetMap();
			output.setRowMaps(rTREDrawDayList);
			
			outDataset.put("output", output);
			
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
	
	@RequestMapping("rtms/re/rTREDrawDayRegist.do")
	public ModelAndView rTREDrawDayRegister(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map loginInfo = (Map) req.getSession().getAttribute("User");
			
			Map <String, Object> inVar = xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset = xpDto.getInDataSetMap();
			
			inVar.put("regId", loginInfo.get("userId"));  //등록자 ID		
			
			Map result = rTREDrawDayRegisterService.rTREDrawDayRegist(inVar, inDataset);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME,	  xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE,			  result.get("successCode"));
			mav.addObject(NexacroConstant.ERROR_MSG,			  result.get("returnMessage"));
		} catch(Exception e) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG,  e.toString());
		}
		
		return mav;
	}
	
}
