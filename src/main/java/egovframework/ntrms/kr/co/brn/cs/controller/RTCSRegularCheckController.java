/************************************************************************************
 * 1.Program  			: Common DataSet Controller
 * 2.File Name			: RTCSResultController.java
 * 3.Version			: 1.1
 * 4.Note				: 
 * 5.History		 
 * Ver		Date		Author		Description
 * ----		----------	--------	-----------
 * 1.1		2017-03-24	wjim		[20170324_02] 정기점검 컨택 프로그램 개발
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.cs.controller;

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
import egovframework.ntrms.kr.co.brn.cs.service.RTCSRegularCheckService;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;

@Controller
public class RTCSRegularCheckController {
	
	protected Log logger = LogFactory.getLog(this.getClass());	
	
	@Resource(name="commonService")
	CommonService commonService;

	@Resource(name="rTCSRegularCheckService")
	RTCSRegularCheckService rTCSRegularCheckService;
	
	/**
	 * 관련 공통코드를 조회한다
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.1		2017-03-24	wjim		[20170324_02] 추가
	 * 1.2		2017-06-08	wjim		[20170608_01] 처리상태 공통코드 추가
	 */
	@RequestMapping("/rtms/cs/commCodeRegularCheck.do") 
	public ModelAndView getRegularCheckCommCode(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try{
			Map <String, Object>     mapInVar  = xpDto.getInVariableMap();
			Map <String, DataSetMap> mapOutDSM = xpDto.getOutDataSetMap();
			
			/*
			 * 컨택상태 공통코드 조회
			 */
			mapInVar.put("cdGrpCd", "C027");
			mapInVar.put("useYn"  , "Y");
			
			Map <String, Object> mapC027 = commonService.listCommInfo(mapInVar);
			
			List listC027 = (List)mapC027.get("result");						
			DataSetMap dsmC027 = new DataSetMap();
			dsmC027.setRowMaps(listC027);
			mapOutDSM.put("ds_C027", dsmC027);	
			
			/*
			 * 컨택세부상태 공통코드 조회
			 */
			mapInVar.put("cdGrpCd", "C028");
			mapInVar.put("useYn"  , "Y");
			
			Map <String, Object> mapC028 = commonService.listCommInfo(mapInVar);
			
			List listC028 = (List)mapC028.get("result");						
			DataSetMap dsmC028 = new DataSetMap();
			dsmC028.setRowMaps(listC028);
			mapOutDSM.put("ds_C028", dsmC028);
			
			/*
			 * 처리상태 공통코드 조회
			 */
			mapInVar.put("cdGrpCd", "H008");
			mapInVar.put("useYn"  , "Y");
			
			Map <String, Object> mapH008 = commonService.listCommInfo(mapInVar);
			
			List listH008 = (List)mapH008.get("result");						
			DataSetMap dsmH008 = new DataSetMap();
			dsmH008.setRowMaps(listH008);
			mapOutDSM.put("ds_H008", dsmH008);
						
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME  , xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE            , "0");
			mav.addObject(NexacroConstant.ERROR_MSG             , "");
		}catch( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE            , "-1");
			mav.addObject(NexacroConstant.ERROR_MSG             , e.toString());
		}
		
		return mav;
	}

	/******************************
	 * 정기정검 작업목록조회
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	
	@RequestMapping("/rtms/cs/selectWorkList.do") 
	public ModelAndView selectWorkList(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try {
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			List li = rTCSRegularCheckService.selectWorkList(inVar);
			DataSetMap outDsMap = new DataSetMap();
			outDsMap.setRowMaps(li);
			outDataset.put("out_work_list", outDsMap);
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
	
	/*************************************
	 * 정보변경을위한 자료조회
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/rtms/cs/infoChange.do") 
	public ModelAndView infoChange(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try {
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			
			//파라미터Row처리
			DataSetMap inDsMap = (DataSetMap)inDataset.get("param_chg");
			Map map = inDsMap.get(0);
			
			List li = rTCSRegularCheckService.infoChange(map);
			DataSetMap outDsMap = new DataSetMap();
			outDsMap.setRowMaps(li);
			outDataset.put("out_chg", outDsMap);
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
	
	/*************************************
	 * 정보변경(텝) 자료등록
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 * @history
	 * ----------------------------------------
	 * 변경일		변경자		변경내용
	 * ----------------------------------------
	 * 2016-06-03	wjim		변경자ID 추가
	 */
	@RequestMapping("/rtms/cs/saveReqularCheck.do") 
	public ModelAndView saveReqularCheck(NexacroMapDTO xpDto, Model model,  HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try {
			Map loginInfo = (Map)req.getSession().getAttribute("User");
			
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			
			inDataset.get("in_chg").getRowMaps().get(0).put("regId", loginInfo.get("userId"));	// 변경자ID
			
			Map result = rTCSRegularCheckService.saveReqularCheck(inDataset);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			
			mav.addObject(NexacroConstant.ERROR_CODE, result.get("successCode") + "");
			mav.addObject(NexacroConstant.ERROR_MSG,  result.get("returnMessage"));
		
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	/*************************************
	 * 우편번호별 MR. Roadian 정보 조회
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/rtms/cs/getMrCd.do") 
	public ModelAndView getMrCd(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try {
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, Object> outVal			= xpDto.getOutVariableMap();
			
			String mrCd = rTCSRegularCheckService.getMrCd(inVar);
			
			outVal.put("mrCd", mrCd);
			
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
	
	
	/*************************************
	 * 정기점검 작업목록(처리결과) 조회
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/rtms/cs/infoResult.do") 
	public ModelAndView infoResult(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try {
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			
			//파라미터Row처리
			DataSetMap inDsMap = (DataSetMap)inDataset.get("param_chg");
			Map map = inDsMap.get(0);
			
			List li = rTCSRegularCheckService.infoResult(map);
			DataSetMap outDsMap = new DataSetMap();
			outDsMap.setRowMaps(li);
			outDataset.put("out_chg", outDsMap);
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
	
	/*************************************
	 * 처리결과 (텝) 자료등록
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/rtms/cs/saveInfoResult.do") 
	public ModelAndView saveInfoResult(NexacroMapDTO xpDto, Model model,  HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map loginInfo = (Map)req.getSession().getAttribute("User");

			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			
			inDataset.get("in_result").getRowMaps().get(0).put("regId", loginInfo.get("userId"));

			logger.debug("======================================================");
			
			logger.debug(inDataset.get("in_result").getRowMaps().get(0));
			
			logger.debug("======================================================");
			Map result = rTCSRegularCheckService.saveInfoResult(inDataset);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			
			mav.addObject(NexacroConstant.ERROR_CODE, result.get("successCode") + "");
			mav.addObject(NexacroConstant.ERROR_MSG,  result.get("returnMessage"));
		
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	/*************************************
	 * 정기점검 작업목록(처리결과) 조회
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/rtms/cs/serviceHistory.do") 
	public ModelAndView serviceHistory(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try {
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			
			List li = rTCSRegularCheckService.serviceHistory(inVar);
			DataSetMap mapHistory = new DataSetMap();
			mapHistory.setRowMaps(li);
			outDataset.put("mapHistory", mapHistory);
			
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
	
	@RequestMapping("/rtms/cs/selectUserInfo.do") 
	public ModelAndView selectUserInfo(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try {
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			
			List li = rTCSRegularCheckService.selectUserInfo(inVar);
			DataSetMap mapUserInfo = new DataSetMap();
			mapUserInfo.setRowMaps(li);
			outDataset.put("mapUserInfo", mapUserInfo);
			
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
	 * 정기점검 컨택목록을 조회한다.
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.1		2017-03-24	wjim		[20170324_02] 추가
	 */
	@RequestMapping("/rtms/cs/selectCallList.do") 
	public ModelAndView selectCallList(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			List li = rTCSRegularCheckService.selectCallList(inVar);
			
			DataSetMap outDsMap = new DataSetMap();
			
			outDsMap.setRowMaps(li);
			outDataset.put("ds_list_main", outDsMap);
			
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
	 * 정기점검 상담정보 목록을 조회한다
	 * 
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2017-03-27	wjim		신규생성
	 */
	@RequestMapping("/rtms/cs/selectContactList.do") 
	public ModelAndView listContact(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map <String, Object>     mapInVar  = xpDto.getInVariableMap();
			Map <String, DataSetMap> mapOutDSM = xpDto.getOutDataSetMap();
			
			Map <String, Object> mapResult = rTCSRegularCheckService.listContact(mapInVar);
			
			List listContact = (List)mapResult.get("regularCheckContactList");
			
			DataSetMap dsmResult = new DataSetMap();
			dsmResult.setRowMaps(listContact);			
			mapOutDSM.put("ds_contactList", dsmResult);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME  , xpDto.getOutDataSetMap());			
			mav.addObject(NexacroConstant.ERROR_CODE            , "0");
			mav.addObject(NexacroConstant.ERROR_MSG             , "");
		
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE            , "-1");
			mav.addObject(NexacroConstant.ERROR_MSG             , e.toString());
		}
		
		return mav;
	}
	
	/**
	 * 정기점검 컨택정보 엑셀 다운로드용 목록을 조회한다
	 * 
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2017-03-29	wjim		신규생성
	 */
	@RequestMapping("/rtms/cs/selectContactExcelList.do") 
	public ModelAndView listExcelContact(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map <String, Object>     mapInVar  = xpDto.getInVariableMap();
			Map <String, DataSetMap> mapOutDSM = xpDto.getOutDataSetMap();
			
			Map <String, Object> mapResult = rTCSRegularCheckService.listExcelContact(mapInVar);
			
			List listContact = (List)mapResult.get("regularCheckContactExcelList");
			
			DataSetMap dsmResult = new DataSetMap();
			dsmResult.setRowMaps(listContact);			
			mapOutDSM.put("ds_contactExcel", dsmResult);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME  , xpDto.getOutDataSetMap());			
			mav.addObject(NexacroConstant.ERROR_CODE            , "0");
			mav.addObject(NexacroConstant.ERROR_MSG             , "");
		
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE            , "-1");
			mav.addObject(NexacroConstant.ERROR_MSG             , e.toString());
		}
		
		return mav;
	}
	
	/**
	 * 정기점검 상담정보를 저장(등록, 수정)한다
	 * 
	 * @param xpDto
	 * @param model
	 * @param req
	 * @return
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2017-03-27	wjim		신규생성
	 */
	@RequestMapping("/rtms/cs/saveContact.do")
	public ModelAndView saveContact(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		Map loginInfo = (Map)req.getSession().getAttribute("User");		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map <String, Object>     mapInVar	= xpDto.getInVariableMap();
			Map <String, DataSetMap> mapInDSM   = xpDto.getInDataSetMap();
			
			mapInVar.put("regId", loginInfo.get("userId"));
						
			Map <String, Object> mapResult = rTCSRegularCheckService.saveContact(mapInDSM, mapInVar);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME  , xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE            , mapResult.get("successCode")+"");
			mav.addObject(NexacroConstant.ERROR_MSG             , mapResult.get("returnMessage"));		
		
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE            , "-1");
			mav.addObject(NexacroConstant.ERROR_MSG             , e.toString());
		}
		
		return mav;
	}
	
	/**
	 * 정기점검 컨택 변경사항을 저장(등록, 수정)한다
	 * 
	 * @param xpDto
	 * @param model
	 * @param req
	 * @return
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2017-03-27	wjim		신규생성
	 */
	@RequestMapping("/rtms/cs/saveContactChange.do") 
	public ModelAndView saveContactChange(NexacroMapDTO xpDto, Model model,  HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try {
			Map loginInfo = (Map)req.getSession().getAttribute("User");
			
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			
			inDataset.get("ds_chg").getRowMaps().get(0).put("regId", loginInfo.get("userId"));	// 변경자ID
			
			Map result = rTCSRegularCheckService.saveContactChange(inDataset);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			
			mav.addObject(NexacroConstant.ERROR_CODE, result.get("successCode") + "");
			mav.addObject(NexacroConstant.ERROR_MSG,  result.get("returnMessage"));
		
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	/**
	 * 주소(빌딩코드)별 담당 로디안 정보를 조회한다
	 * 
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2017-03-28	wjim		신규생성
	 */
	@RequestMapping("/rtms/cs/selectBldMr.do") 
	public ModelAndView selectBldMr(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map <String, Object>     mapInVar  = xpDto.getInVariableMap();
			Map <String, DataSetMap> mapOutDSM = xpDto.getOutDataSetMap();
			
			Map <String, Object> mapResult = rTCSRegularCheckService.selectBldMr(mapInVar);
			
			List listContact = (List)mapResult.get("mrInfo");
			
			DataSetMap dsmResult = new DataSetMap();
			dsmResult.setRowMaps(listContact);			
			mapOutDSM.put("ds_mr", dsmResult);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME  , xpDto.getOutDataSetMap());			
			mav.addObject(NexacroConstant.ERROR_CODE            , "0");
			mav.addObject(NexacroConstant.ERROR_MSG             , "");
		
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE            , "-1");
			mav.addObject(NexacroConstant.ERROR_MSG             , e.toString());
		}
		
		return mav;
	}
	
	/**
	 * 시군구별 담당 로디안 정보를 조회한다
	 * 
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2017-04-04	wjim		신규생성
	 */
	@RequestMapping("/rtms/cs/selectAddr1Mr.do") 
	public ModelAndView selectAddr1Mr(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map <String, Object>     mapInVar  = xpDto.getInVariableMap();
			Map <String, DataSetMap> mapOutDSM = xpDto.getOutDataSetMap();
			
			Map <String, Object> mapResult = rTCSRegularCheckService.selectAddr1Mr(mapInVar);
			
			List listContact = (List)mapResult.get("mrInfo");
			
			DataSetMap dsmResult = new DataSetMap();
			dsmResult.setRowMaps(listContact);
			mapOutDSM.put("ds_mr", dsmResult);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME  , xpDto.getOutDataSetMap());			
			mav.addObject(NexacroConstant.ERROR_CODE            , "0");
			mav.addObject(NexacroConstant.ERROR_MSG             , "");
		
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE            , "-1");
			mav.addObject(NexacroConstant.ERROR_MSG             , e.toString());
		}
		
		return mav;
	}
	
	/**
	 * 월별 로디안별 방문점검 컨택 완료건수를 조회한다
	 * 
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2017-04-06	wjim		신규생성
	 */
	@RequestMapping("/rtms/cs/selectMrMonDecideCnt.do") 
	public ModelAndView selectMrMonDecideCnt(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map <String, Object>     mapInVar  = xpDto.getInVariableMap();
			Map <String, DataSetMap> mapOutDSM = xpDto.getOutDataSetMap();
			
			Map <String, Object> mapResult = rTCSRegularCheckService.selectMrMonDecideCnt(mapInVar);
			
			List listResult = (List)mapResult.get("mrMonDecideCnt");
			
			DataSetMap dsmResult = new DataSetMap();
			dsmResult.setRowMaps(listResult);
			mapOutDSM.put("ds_mrMonDecideCnt", dsmResult);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME  , xpDto.getOutDataSetMap());			
			mav.addObject(NexacroConstant.ERROR_CODE            , "0");
			mav.addObject(NexacroConstant.ERROR_MSG             , "");
		
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE            , "-1");
			mav.addObject(NexacroConstant.ERROR_MSG             , e.toString());
		}
		
		return mav;
	}
	
	/**
	 * 일자별 로디안별 방문점검 컨택 완료건을 조회한다
	 * 
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2017-04-06	wjim		신규생성
	 */
	@RequestMapping("/rtms/cs/selectMrDayDecide.do") 
	public ModelAndView selectMrDayDecide(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map <String, Object>     mapInVar  = xpDto.getInVariableMap();
			Map <String, DataSetMap> mapOutDSM = xpDto.getOutDataSetMap();
			
			Map <String, Object> mapResult = rTCSRegularCheckService.selectMrDayDecide(mapInVar);
			
			List listResult = (List)mapResult.get("mrDayDecide");
			
			DataSetMap dsmResult = new DataSetMap();
			dsmResult.setRowMaps(listResult);
			mapOutDSM.put("ds_mrDayDecide", dsmResult);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME  , xpDto.getOutDataSetMap());			
			mav.addObject(NexacroConstant.ERROR_CODE            , "0");
			mav.addObject(NexacroConstant.ERROR_MSG             , "");
		
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE            , "-1");
			mav.addObject(NexacroConstant.ERROR_MSG             , e.toString());
		}
		
		return mav;
	}
	
	/**
	 * 정기점검 거부철회정보를 조회한다
	 * 
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2017-07-26	wjim		[20170726_01] 신규생성
	 */
	@RequestMapping("/rtms/cs/selectDenyList.do") 
	public ModelAndView selectDenyList(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map <String, Object>     mapInVar  = xpDto.getInVariableMap();
			Map <String, DataSetMap> mapOutDSM = xpDto.getOutDataSetMap();
			
			Map <String, Object> mapResult = rTCSRegularCheckService.selectDenyList(mapInVar);
			
			List listResult = (List)mapResult.get("listDeny");
			
			DataSetMap dsmResult = new DataSetMap();
			dsmResult.setRowMaps(listResult);
			mapOutDSM.put("ds_listDeny", dsmResult);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME  , xpDto.getOutDataSetMap());			
			mav.addObject(NexacroConstant.ERROR_CODE            , "0");
			mav.addObject(NexacroConstant.ERROR_MSG             , "");
		
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE            , "-1");
			mav.addObject(NexacroConstant.ERROR_MSG             , e.toString());
		}
		
		return mav;
	}
	
	/**
	 * 정기점검 거부를 등록한다
	 * 
	 * @param xpDto
	 * @param model
	 * @param req
	 * @return
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2017-07-26	wjim		[20170726_01] 신규생성
	 */
	@RequestMapping("/rtms/cs/saveDeny.do") 
	public ModelAndView saveDeny(NexacroMapDTO xpDto, Model model,  HttpServletRequest req) throws Exception {
			ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map loginInfo = (Map) req.getSession().getAttribute("User");
			
			Map <String, Object>     inVar     = xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset = xpDto.getInDataSetMap();
			
			DataSetMap dsm = new DataSetMap();
			Map <String, Object> paramMap = new HashMap();
			
			paramMap.put(NexacroConstant.DATASET_ROW_TYPE, 1);
			paramMap.put("ordNo"    , (String)inVar.get("ordNo"));
			paramMap.put("equNo"    , (String)inVar.get("equNo"));
			paramMap.put("denyStdYm", (String)inVar.get("denyStdYm"));
			paramMap.put("denyDesc" , (String)inVar.get("denyDesc"));
			
			dsm.add(paramMap);
			inVar.put("inDsMap",  dsm);			
			inVar.put("regId", loginInfo.get("userId"));  //등록자 ID		
			
			Map result =  rTCSRegularCheckService.saveDeny(inDataset, inVar);			
			
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
	 * 정기점검 거부철회를 등록한다
	 * 
	 * @param xpDto
	 * @param model
	 * @param req
	 * @return
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2017-07-26	wjim		[20170726_01] 신규생성
	 */
	@RequestMapping("/rtms/cs/saveWithdraw.do")
	public ModelAndView saveWithdraw(NexacroMapDTO xpDto, Model model,  HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
	
		try {
			Map loginInfo = (Map) req.getSession().getAttribute("User");
			
			Map <String, Object>     inVar     = xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset = xpDto.getInDataSetMap();
			
			DataSetMap dsm = new DataSetMap();
			Map <String, Object> paramMap = new HashMap();
			
			paramMap.put(NexacroConstant.DATASET_ROW_TYPE, 1);
			paramMap.put("ordNo"      , (String)inVar.get("ordNo"));
			paramMap.put("equNo"      , (String)inVar.get("equNo"));
			paramMap.put("denySeq"    , (String)inVar.get("denySeq"));
			paramMap.put("wthdrwStdYm", (String)inVar.get("wthdrwStdYm"));
			paramMap.put("wthdrwDesc" , (String)inVar.get("wthdrwDesc"));
			
			dsm.add(paramMap);
			inVar.put("inDsMap",  dsm);			
			inVar.put("regId"  , loginInfo.get("userId"));  //등록자 ID		
			
			Map result =  rTCSRegularCheckService.saveWithdraw(inDataset, inVar);			
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME  , xpDto.getOutDataSetMap());
			
			mav.addObject(NexacroConstant.ERROR_CODE, result.get("successCode")+"");
			mav.addObject(NexacroConstant.ERROR_MSG , result.get("returnMessage"));			
			
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	@RequestMapping("/rtms/cs/saveRollBack.do")
	public ModelAndView saveRollBack(NexacroMapDTO xpDto, Model model,  HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
	
		try {
			Map loginInfo = (Map) req.getSession().getAttribute("User");
			
			Map <String, Object>     inVar     = xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset = xpDto.getInDataSetMap();
			
//			DataSetMap dsm = new DataSetMap();
//			Map <String, Object> paramMap = new HashMap();
//			
//			paramMap.put(NexacroConstant.DATASET_ROW_TYPE, 1);
//			paramMap.put("ordNo"      , (String)inVar.get("ordNo"));
//			paramMap.put("stdYm"      , (String)inVar.get("stdYm"));
//			
//			dsm.add(paramMap);
//			inVar.put("inDsMap",  dsm);	
			
			inVar.put("ordNo"      , (String)inVar.get("ordNo"));
			inVar.put("stdYm"      , (String)inVar.get("stdYm"));
			inVar.put("regId"  , loginInfo.get("userId"));  //등록자 ID		
			
			Map result =  rTCSRegularCheckService.saveRollBack(inDataset, inVar);			
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME  , xpDto.getOutDataSetMap());
			
			mav.addObject(NexacroConstant.ERROR_CODE, result.get("successCode")+"");
			mav.addObject(NexacroConstant.ERROR_MSG , result.get("returnMessage"));			
			
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	/**
	 * 정기점검 거부철회를 등록한다
	 * 
	 * @param xpDto
	 * @param model
	 * @param req
	 * @return
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2017-07-26	wjim		[20170726_01] 신규생성
	 */
//	@RequestMapping("/rtms/cs/exportTest.do")
//	public ModelAndView excelExportTest(NexacroMapDTO xpDto, Model model,  HttpServletRequest req) throws Exception {
//		ModelAndView mav = new ModelAndView("nexacroMapView");
//	
//		try {
//			Map loginInfo = (Map) req.getSession().getAttribute("User");
//			
//			Map <String, Object>     inVar     = xpDto.getInVariableMap();
//			Map <String, DataSetMap> inDataset = xpDto.getInDataSetMap();
//			
//			rTCSRegularCheckService.excelExportTest(inVar);			
//			
//			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, xpDto.getOutVariableMap());
//			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME  , xpDto.getOutDataSetMap());
//			
//		} catch ( Exception e ) {
//			e.printStackTrace();
//			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
//			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
//		}
//		return mav;
//	}
	
	/**
	 * 홈쇼핑 가계약 임시 정보를 저장(등록, 수정)한다
	 * 
	 * @param xpDto
	 * @param model
	 * @param req
	 * @return
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2017-12-22	kstka		신규생성 
	 */
	@RequestMapping("rtms/cs/saveVisitChangeTemp.do")
	public ModelAndView saveVisitChangeTemp(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		Map loginInfo = (Map)req.getSession().getAttribute("User");		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map <String, Object>     mapInVar	= xpDto.getInVariableMap();
			Map <String, DataSetMap> mapInDSM   = xpDto.getInDataSetMap();
			
			mapInVar.put("regId", loginInfo.get("userId"));
						
			Map <String, Object> mapResult = rTCSRegularCheckService.saveVisitChangeTemp(mapInDSM, mapInVar);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME  , xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE            , mapResult.get("successCode")+"");
			mav.addObject(NexacroConstant.ERROR_MSG             , mapResult.get("returnMessage"));		
		
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE            , "-1");
			mav.addObject(NexacroConstant.ERROR_MSG             , e.toString());
		}
		
		return mav;
	}
	
	/**
	 * 홈쇼핑 가계약 임시 정보를 저장(등록, 수정)한다
	 * 
	 * @param xpDto
	 * @param model
	 * @param req
	 * @return
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2017-12-22	kstka		신규생성 
	 */
	@RequestMapping("rtms/cs/saveRTCSChangeVisitSchedule.do")
	public ModelAndView saveRTCSChangeVisitSchedule(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		Map loginInfo = (Map)req.getSession().getAttribute("User");		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map <String, Object>     mapInVar	= xpDto.getInVariableMap();
			Map <String, DataSetMap> mapInDSM   = xpDto.getInDataSetMap();
			
			mapInVar.put("regId", loginInfo.get("userId"));
						
			Map <String, Object> mapResult = rTCSRegularCheckService.saveChangeVisitSchedule(mapInDSM, mapInVar);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME  , xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE            , mapResult.get("successCode")+"");
			mav.addObject(NexacroConstant.ERROR_MSG             , mapResult.get("returnMessage"));		
		
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE            , "-1");
			mav.addObject(NexacroConstant.ERROR_MSG             , e.toString());
		}
		
		return mav;
	}
}