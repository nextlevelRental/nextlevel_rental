package egovframework.ntrms.kr.co.brn.sd.controller;

import java.util.ArrayList;
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

import egovframework.ntrms.kr.co.brn.sd.service.RTSDDeliveryListService;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;
import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * 렌탈 배송 현황 조회 관련 함수
 * @author kstka
 * @version 1.0
 * @since 2022. 11. 16.
 */
@Controller
public class RTSDDeliveryListController {
	protected Log logger = LogFactory.getLog(this.getClass());	
	
	@Resource(name = "propertiesService")
	EgovPropertyService propertiesService;
	
	@Resource(name = "rtsdDeliveryListService")
	RTSDDeliveryListService rtsdDeliveryListService;
	
	/**
	 * 실시간 배송현황조회 Controller
	 * @author kstka
	 * @version 1.0
	 * @since 2022. 12. 22.
	 */
	@RequestMapping("/rtms/sd/deliveryListByOrder.do")
	public ModelAndView getDeliveryListByOrder(NexacroMapDTO xpDto, Model model, HttpServletRequest req){
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		Map loginInfo = (Map) req.getSession().getAttribute("User");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			List paramList = new ArrayList();		
			
			Map<String, Object> inputParams = new HashMap<String, Object>();
			inputParams.put("I_BSTKD", inVar.get("ordNo"));

			Map<String, Object> addParam = new HashMap<String, Object>();
			addParam.put("reqNum", inVar.get("reqNum"));
			
			List<Map> resultList = rtsdDeliveryListService.getDeliveryInfoRealTime(inputParams, paramList, addParam);
						
			DataSetMap mapDs = new DataSetMap();
			mapDs.setRowMaps(resultList);
			outDataset.put("output", mapDs);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			
			mav.addObject(NexacroConstant.ERROR_CODE, "0");
			mav.addObject(NexacroConstant.ERROR_MSG, "");
		}catch(Exception e){
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
		
	}
}
