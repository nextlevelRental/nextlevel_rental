package egovframework.ntrms.kr.co.brn.sd.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.config.PropertiesFactoryBean;
import org.springframework.context.annotation.Bean;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import egovframework.ntrms.kr.co.brn.sd.service.RTSDArrivalAlarmListService;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;
import egovframework.rte.fdl.property.EgovPropertyService;



@Controller
public class RTSDArrivalAlarmListController {
	protected Log logger = LogFactory.getLog(this.getClass());	
	
	@Resource(name="rTSDArrivalAlarmListService")
	RTSDArrivalAlarmListService rTSDArrivalAlarmListService;
	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	/**
	 * @author kstka
	 * @version 1.0
	 * @since 2021. 9. 13.
	 * 도착 알람 문자 집계내역 조회
	 */
	@RequestMapping("/rtms/sd/selectArrivalAlarmList.do") 
	public ModelAndView selectArrivalAlarmList(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		Map loginInfo = (Map) req.getSession().getAttribute("User");
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, Object> outVar 		= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("regId", loginInfo.get("userId"));
			Map result =  rTSDArrivalAlarmListService.selectArrivalAlarmList(inVar, inDataset);
			
			List list		= (List)result.get("result");	
			DataSetMap outDs = new DataSetMap();
			outDs.setRowMaps(list);		
			outDataset.put("output", outDs);	
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE, result.get("successCode")+"");
			mav.addObject(NexacroConstant.ERROR_MSG,  result.get("returnMessage"));
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	/**
	 * @author kstka
	 * @version 1.0
	 * @since 2021. 9. 13.
	 * 도착알람문자 집계
	 */
	@RequestMapping("/rtms/sd/aggregateArrivalAlarmList.do") 
	public ModelAndView aggregateArrivalAlarmList(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		Map loginInfo = (Map) req.getSession().getAttribute("User");
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, Object> outVar 		= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			DataSetMap dsm = new DataSetMap();
			Map paramMap = new HashMap();
			paramMap.put(NexacroConstant.DATASET_ROW_TYPE,  1);
			paramMap.put("dayF",  	(String)inVar.get("dayF"));	//발송일자
			paramMap.put("dayT",  	(String)inVar.get("dayT"));	//발송일자
			dsm.add(paramMap);
			inVar.put("inDsMap",  dsm);
			
			inVar.put("regId", loginInfo.get("userId"));
			Map result =  rTSDArrivalAlarmListService.aggregateArrivalAlarmList(inVar, inDataset);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE, result.get("successCode")+"");
			mav.addObject(NexacroConstant.ERROR_MSG,  result.get("returnMessage"));
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	/**
	 * @author kstka
	 * @version 1.0
	 * @since 2021. 9. 13.
	 * 도착알람문자 발송
	 */
	@RequestMapping("/rtms/sd/sendArrivalAlarmList.do") 
	public ModelAndView sendArrivalAlarmList(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		Map loginInfo = (Map) req.getSession().getAttribute("User");
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, Object> outVar 		= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			DataSetMap dsm = new DataSetMap();
			Map paramMap = new HashMap();
			paramMap.put(NexacroConstant.DATASET_ROW_TYPE,  1);
			paramMap.put("sendDay",  	(String)inVar.get("sendDay"));	//발송일자
			paramMap.put("sendCnt",  	(String)inVar.get("sendCnt"));	//발송횟수
			dsm.add(paramMap);
			inVar.put("inDsMap",  dsm);
			
			inVar.put("regId", loginInfo.get("userId"));
			Map result =  rTSDArrivalAlarmListService.sendArrivalAlarmList(inVar, inDataset);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE, result.get("successCode")+"");
			mav.addObject(NexacroConstant.ERROR_MSG,  result.get("returnMessage"));
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	/**
	 * @author kstka
	 * @version 1.0
	 * @since 2021. 9. 13.
	 * 저장
	 */
	@RequestMapping("/rtms/sd/saveArrivalAlarmList.do") 
	public ModelAndView saveArrivalAlarmList(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		Map loginInfo = (Map) req.getSession().getAttribute("User");
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, Object> outVar 		= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("regId", loginInfo.get("userId"));
			Map result =  rTSDArrivalAlarmListService.saveArrivalAlarmList(inDataset, inVar);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE, result.get("successCode")+"");
			mav.addObject(NexacroConstant.ERROR_MSG,  result.get("returnMessage"));
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	/**
	 * @author kstka
	 * @version 1.0
	 * @since 2021. 9. 13.
	 * 도착 알람 문자 집계내역 조회
	 */
	@RequestMapping("/rtms/sd/selectArrivalAlarmHistList.do") 
	public ModelAndView selectArrivalAlarmHistList(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		Map loginInfo = (Map) req.getSession().getAttribute("User");
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, Object> outVar 		= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("regId", loginInfo.get("userId"));
			Map result =  rTSDArrivalAlarmListService.selectArrivalAlarmHistList(inVar, inDataset);
			
			List list		= (List)result.get("result");	
			DataSetMap outDs = new DataSetMap();
			outDs.setRowMaps(list);		
			outDataset.put("output", outDs);	
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE, result.get("successCode")+"");
			mav.addObject(NexacroConstant.ERROR_MSG,  result.get("returnMessage"));
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	/**
	 * @author kstka
	 * @version 1.0
	 * @since 2021. 9. 13.
	 * 갱신
	 */
	@RequestMapping("/rtms/sd/renewArrivalAlarmList.do") 
	public ModelAndView renewArrivalAlarmList(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		Map loginInfo = (Map) req.getSession().getAttribute("User");
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, Object> outVar 		= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			DataSetMap dsm = new DataSetMap();
			Map paramMap = new HashMap();
			paramMap.put(NexacroConstant.DATASET_ROW_TYPE,  1);
			paramMap.put("dayF",  	(String)inVar.get("dayF"));	//시작일자
			paramMap.put("dayT",  	(String)inVar.get("dayT"));	//종료일자
			dsm.add(paramMap);
			inVar.put("inDsMap",  dsm);
			
			inVar.put("regId", loginInfo.get("userId"));
			Map result =  rTSDArrivalAlarmListService.renewArrivalAlarmList(inDataset, inVar);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE, result.get("successCode")+"");
			mav.addObject(NexacroConstant.ERROR_MSG,  result.get("returnMessage"));
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	/**
	 * @author kstka
	 * @version 1.0
	 * @since 2022. 7. 4.
	 * 택배사 마스터 정보 인터페이스
	 */
	@RequestMapping("/rtms/sd/updateLogistics.do") 
	public ModelAndView updateLogistics(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		Map<String, Object> loginInfo = (Map<String, Object>) req.getSession().getAttribute("User");
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			
			//스마트택배 서버 주소
			String rootUrl = propertiesService.getString("smartbox.interface.root.url");
			String subUrl = propertiesService.getString("smartbox.interface.company.url");
			
			//파라미터 세팅			
			Map<String, Object> settingMap = new HashMap<>();
			settingMap.put("timeout", 300000);
			settingMap.put("method", "GET");
			
			//파라미터 세팅			
			Map<String, Object> paramMap = new HashMap<>();
			paramMap.put("t_key", propertiesService.getString("smartbox.interface.key"));
			paramMap.put("regId", loginInfo.get("userId"));
			
			inVar.put("setting", settingMap);
			inVar.put("param", paramMap);
			inVar.put("sendUrl", rootUrl + subUrl);
			
			Map<String, Object> result = rTSDArrivalAlarmListService.processLogistics(inVar);
			
			mav.addObject(NexacroConstant.ERROR_CODE, result.get("successCode")+"");
			mav.addObject(NexacroConstant.ERROR_MSG,  result.get("returnMessage"));
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	/**
	 * @author kstka
	 * @version 1.0
	 * @since 2022. 7. 4.
	 * 택배 배송 상태 인터페이스
	 */
	@RequestMapping("/rtms/sd/batchLogisticsStatus.do") 
	public ModelAndView batchLogisticsStatus(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		Map<String, Object> loginInfo = (Map<String, Object>) req.getSession().getAttribute("User");
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			
			//스마트택배 서버 주소
			String rootUrl = propertiesService.getString("smartbox.interface.root.url");
			String subUrl = propertiesService.getString("smartbox.interface.tracking.url");
			
			//파라미터 세팅			
			Map<String, Object> settingMap = new HashMap<>();
			settingMap.put("timeout", 300000);
			settingMap.put("method", "GET");
			settingMap.put("t_key", propertiesService.getString("smartbox.interface.key"));
			
			//파라미터 세팅			
			Map<String, Object> paramMap = new HashMap<>();
						
			inVar.put("setting", settingMap);
			inVar.put("param", paramMap);
			inVar.put("sendUrl", rootUrl + subUrl);
			inVar.put("userId", loginInfo.get("userId"));
			
			Map<String, Object> result = rTSDArrivalAlarmListService.batchLogisticsStatus(inVar);
			
			mav.addObject(NexacroConstant.ERROR_CODE, result.get("successCode")+"");
			mav.addObject(NexacroConstant.ERROR_MSG,  result.get("returnMessage"));
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
}
