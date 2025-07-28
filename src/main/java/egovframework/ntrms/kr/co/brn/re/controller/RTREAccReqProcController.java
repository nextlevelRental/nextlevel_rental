/************************************************************************************
 * 1.Program  			: Common DataSet Controller
 * 2.File Name			: RTREAccReqProcController.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.re.controller;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
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
import egovframework.ntrms.kr.co.brn.re.service.RTREAccReqProcService;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;

@Controller
public class RTREAccReqProcController {
	
	protected Log logger = LogFactory.getLog(this.getClass());	

	@Resource(name="rTREAccReqProcService")
	RTREAccReqProcService rTREAccReqProcService;
	
	@Resource(name="commonService")
	CommonService commonService;
	
	/**
	 * 공통코드 조회
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/ntrms/re/getAccReqProcCommCode.do") 
	public ModelAndView getCodeInfo(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			//파일위치코드
			inVar.put("cdGrpCd", "R016");
			inVar.put("useYn", "Y");
			
			Map mapR016 = commonService.listCommInfo(inVar);
			List listR016 = (List)mapR016.get("result");		
			logger.debug("listR016>>>>>>>>>>>>>>>>" + listR016);
			DataSetMap dsR016Maps = new DataSetMap();
			dsR016Maps.setRowMaps(listR016);
			outDataset.put("outputR016",	dsR016Maps);	
			
			
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
	
	/**
	 * 영업일조회
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/ntrms/re/getAccReqDate.do") 
	public ModelAndView getAccReqDate(NexacroMapDTO xpDto, Model model) throws Exception {
		
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, Object> outVal			= xpDto.getOutVariableMap();
			
			Date today = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			SimpleDateFormat sdf2 = new SimpleDateFormat("HH");
			
			//inVar.put("serchGb", "-"); //작업구분(-.+)
			//inVar.put("days", 1);	   //검색기간(일자)
			inVar.put("stdDay", sdf.format(today)); //기준일자

			String bfAfDay = (String)rTREAccReqProcService.getAccReqDate(inVar);
			//10시이후에는 계좌신청일 세팅 안함
			//if(Integer.parseInt(sdf2.format(today)) > 10) {
			//	outVal.put("bfAfDay", "");			
			//}
			//else {
			
			//}
			outVal.put("bfAfDay", bfAfDay);		
			outVal.put("toDay", sdf.format(today)); //현재일자
			outVal.put("toHour", sdf2.format(today)); //현재시간
			
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
	
	/***
	 * 영업일조회-5d
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/ntrms/re/getCheckDate.do") 
	public ModelAndView getCheckDate(NexacroMapDTO xpDto, Model model) throws Exception {
		
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, Object> outVal			= xpDto.getOutVariableMap();
			
			Date today = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			SimpleDateFormat sdf2 = new SimpleDateFormat("HH");
			
			//inVar.put("serchGb", "-"); //작업구분(-.+)
			//inVar.put("days", 1);	   //검색기간(일자)
			inVar.put("stdDay", sdf.format(today)); //기준일자

			String checkDay = (String)rTREAccReqProcService.getAccReqDate(inVar);

			outVal.put("checkDay", checkDay);		
			
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
	
	/**
	 * 결제정보변경일 조회
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/ntrms/re/getPayChgDate.do") 
	public ModelAndView getPayChgDate(NexacroMapDTO xpDto, Model model) throws Exception {
		
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, Object> outVal			= xpDto.getOutVariableMap();
			
			Calendar cal = Calendar.getInstance();
			cal.add(Calendar.DATE, -1);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");    
			String prevDay = sdf.format(cal.getTime()); 

			String rpcDay = (String)rTREAccReqProcService.getPayChgDate(inVar);
			
			outVal.put("prevDay", prevDay); //현재일자-1
			outVal.put("rpcDay", rpcDay); //결제정보변경일
			
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
	
	/**
	 * 계좌신청대상 조회
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/ntrms/re/getAccReqTargetList.do") 
	public ModelAndView getAccReqTargetList(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, Object> outVal			= xpDto.getOutVariableMap();			
			
			Map result = rTREAccReqProcService.getAccReqTargetList(inVar, outDataset);
			
			List li= (List)result.get("listaccReqTarget");
			
			Map map	= (Map)result.get("msgMap");
			logger.debug("map>>>>>>>>>>>>>>>" +map);
			logger.debug("map.get(successCode) >>> "+ map.get("successCode"));

			outVal.put("returnMsg", map.get("returnMessage"));
			outVal.put("returnCode", (BigDecimal) map.get("successCode"));
			DataSetMap accDsMap = new DataSetMap();
		
			accDsMap.setRowMaps(li);

			outDataset.put("output",	accDsMap);
			
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
	
	/**
	 * 확인완료(전송처리 업무상태 업데이트)
	 * @param xpDto
	 * @param model
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/ntrms/re/confirmProc.do") 
	public ModelAndView confirmProc(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map loginInfo = (Map) req.getSession().getAttribute("User");
			
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, Object> outVar 		= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			DataSetMap dsm = new DataSetMap();
			Map paramMap = new HashMap();
			paramMap.put(NexacroConstant.DATASET_ROW_TYPE,  1);
			paramMap.put("dvsn", 			"I");
			paramMap.put("fileTp",  	(String)inVar.get("fileTp"));				//송수신파일구분
			paramMap.put("rqstDay", 		(String)inVar.get("rqstDay"));			//파일명	
			paramMap.put("fileNm", 		(String)inVar.get("fileNm"));				//파일명	
			paramMap.put("cnfStep", 		(String)inVar.get("cnfStep"));			//송신처리단계
			dsm.add(paramMap);
			inVar.put("inDsMap",  dsm);			
			
			inVar.put("regId", loginInfo.get("userId"));  //등록자 ID		
			
			Map result =  rTREAccReqProcService.confirmProc(inDataset, inVar);		
			
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
	 * 집계
	 * @param xpDto
	 * @param model
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/ntrms/re/setAggregate.do") 
	public ModelAndView setAggregate(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map loginInfo = (Map) req.getSession().getAttribute("User");
			
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, Object> outVar 		= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			DataSetMap dsm = new DataSetMap();
			Map paramMap = new HashMap();
			paramMap.put(NexacroConstant.DATASET_ROW_TYPE,  1);
			paramMap.put("dvsn", 			"I");
			paramMap.put("acrqDay",  	(String)inVar.get("acrqDay"));				//계좌신청일
			paramMap.put("frRpcDay", 		(String)inVar.get("frRpcDay"));			//결제정보 변경시작일자
			paramMap.put("toRpcDay", 		(String)inVar.get("toRpcDay"));			//결제정보 변경종료일자		
			dsm.add(paramMap);
			inVar.put("inDsMap",  dsm);		
			
			inVar.put("regId", loginInfo.get("userId"));  //등록자 ID		
			
			Map result =  rTREAccReqProcService.setAggregate(inDataset, inVar);			
			
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
	 * 계좌신청 송신대상 내역 생성
	 * @param xpDto
	 * @param model
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/ntrms/re/accReqMakeData.do") 
	public ModelAndView accReqMakeData(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map loginInfo = (Map) req.getSession().getAttribute("User");
			
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, Object> outVar 		= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			DataSetMap dsm = new DataSetMap();
			Map paramMap = new HashMap();
			paramMap.put(NexacroConstant.DATASET_ROW_TYPE,  1);
			paramMap.put("dvsn", 			"I");
			paramMap.put("rqstDay",  	(String)inVar.get("rqstDay"));				//요청일자
			paramMap.put("fileNm", 		(String)inVar.get("fileNm"));				//파일명	
			dsm.add(paramMap);
			inVar.put("inDsMap",  dsm);
			
			inVar.put("regId", loginInfo.get("userId"));  //등록자 ID
			
			Map result;
			
			logger.debug("------------------------------");
			logger.debug(((String)inVar.get("fileNm")).substring(0, 4));
			logger.debug("------------------------------");
			
			if ("EB13".equals(((String)inVar.get("fileNm")).substring(0, 4))) {
				result =  rTREAccReqProcService.accReqMakeData(inDataset, inVar);
			} else {
				result =  rTREAccReqProcService.accReqMakeLData(inDataset, inVar);
			}			
			
			List list = (List)result.get("vcursor");
			
			logger.debug("==============================");
			logger.debug(list);
			logger.debug("==============================");
			
			DataSetMap outDsMap = new DataSetMap();
			outDsMap.setRowMaps(list);
			outDataset.put("output",	outDsMap);
			outVar.put("crlfYn", result.get("crlfYn"));			
			
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
}
