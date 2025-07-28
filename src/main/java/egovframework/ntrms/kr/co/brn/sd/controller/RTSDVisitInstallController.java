package egovframework.ntrms.kr.co.brn.sd.controller;

import java.io.File;
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

import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;
import egovframework.ntrms.kr.co.brn.comm.service.CommonService;
import egovframework.ntrms.kr.co.brn.sd.service.RTSDVisitInstallService;

@Controller
@SuppressWarnings("unchecked")
public class RTSDVisitInstallController {
	protected Log logger = LogFactory.getLog(this.getClass());
	
	@Resource(name="commonService")
	CommonService commonService;

	@Resource(name="rTSDVisitInstallService")
	RTSDVisitInstallService visitInstallService;	
	
	/**
	 * 관련 공통코드를 조회한다
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2018-11-29	wjim		[20181122_01] 신규생성
	 */
	@RequestMapping("rtms/sd/commCodeVisitInstall.do") 
	public ModelAndView getVisitInstallCommCode(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try{
			Map <String, Object>     mapInVar  = xpDto.getInVariableMap();
			Map <String, DataSetMap> mapOutDSM = xpDto.getOutDataSetMap();
			
			/*
			 * 방문장착 신청 상태 공통코드 조회
			 */
			mapInVar.put("cdGrpCd", "S105");
			mapInVar.put("useYn"  , "Y");
			
			Map <String, Object> mapS105 = commonService.listCommInfo(mapInVar);
			
			List listS105 = (List)mapS105.get("result");						
			DataSetMap dsmS105 = new DataSetMap();
			dsmS105.setRowMaps(listS105);
			mapOutDSM.put("ds_S105", dsmS105);
			
			/*
			 * 방문장착 신청 세부상태 공통코드 조회
			 */
			mapInVar.put("cdGrpCd", "S106");
			mapInVar.put("useYn"  , "Y");
			
			Map <String, Object> mapS106 = commonService.listCommInfo(mapInVar);
			
			List listS106 = (List)mapS106.get("result");						
			DataSetMap dsmS106 = new DataSetMap();
			dsmS106.setRowMaps(listS106);
			mapOutDSM.put("ds_S106", dsmS106);
			
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
	
	
	/**
	 * 방문장착정보 목록을 조회한다
	 * 
	 * @param  xpDto
	 * @param  model
	 * @return
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2018-12-01	wjim		[20181122_01] 신규생성
	 */
	@RequestMapping("rtms/sd/listVisitInstall.do") 
	public ModelAndView listVisitInstall(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");		
		
		try {
			Map <String, Object>     mapInVar  = xpDto.getInVariableMap();
			Map <String, DataSetMap> mapOutDSM = xpDto.getOutDataSetMap();
			
			Map <String, Object> mapResult = visitInstallService.listVisitInstall(mapInVar);
			
			List listVisitInstall = (List)mapResult.get("visitInstallList");
			
			DataSetMap dsmResult = new DataSetMap();
			dsmResult.setRowMaps(listVisitInstall);			
			mapOutDSM.put("ds_visitList", dsmResult);
			
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
	 * 방문장착정보를 저장(등록, 수정)한다
	 * 
	 * @param xpDto
	 * @param model
	 * @param req
	 * @return
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2018-12-01	wjim		[20181122_01] 신규생성
	 */
	@RequestMapping("rtms/sd/saveVisitInstall.do")
	public ModelAndView saveProvisionalContract(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		Map loginInfo = (Map)req.getSession().getAttribute("User");		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map <String, Object>     mapInVar	= xpDto.getInVariableMap();
			Map <String, DataSetMap> mapInDSM   = xpDto.getInDataSetMap();
			
			mapInVar.put("regId", loginInfo.get("userId"));
						
			Map <String, Object> mapResult = visitInstallService.saveVisitInstall(mapInDSM, mapInVar);
			
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
	 * 방문장착 이력정보 목록을 조회한다
	 * 
	 * @param  xpDto
	 * @param  model
	 * @return
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2018-12-03	wjim		[20181122_01] 신규생성
	 */
	@RequestMapping("rtms/sd/listVisitInstallLog.do") 
	public ModelAndView listVisitInstallLog(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");		
		
		try {
			Map <String, Object>     mapInVar  = xpDto.getInVariableMap();
			Map <String, DataSetMap> mapOutDSM = xpDto.getOutDataSetMap();
			
			Map <String, Object> mapResult = visitInstallService.listVisitInstallLog(mapInVar);
			
			List listVisitInstallLog = (List)mapResult.get("visitInstallListLog");
			
			DataSetMap dsmResult = new DataSetMap();
			dsmResult.setRowMaps(listVisitInstallLog);			
			mapOutDSM.put("ds_visitListLog", dsmResult);
			
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
	
}