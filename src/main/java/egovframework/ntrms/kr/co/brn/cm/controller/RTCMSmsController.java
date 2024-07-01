package egovframework.ntrms.kr.co.brn.cm.controller;

import java.io.File;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringEscapeUtils;
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
import egovframework.ntrms.kr.co.brn.sd.service.RTSDCustRegisterService;

@Controller
@SuppressWarnings("unchecked")
public class RTCMSmsController {
	protected Log logger = LogFactory.getLog(this.getClass());
	
	@Resource(name="commonService")
	CommonService commonService;

	@Resource(name="rTSDCustRegisterService")
	RTSDCustRegisterService rTSDCustRegisterService;
	
	/**
	 * 관련 공통코드를 조회한다
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2017-06-16	wjim		신규생성
	 */
	@RequestMapping("/rtms/cm/commCodeSms.do") 
	public ModelAndView getSmsCommCode(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map <String, Object>     mapInVar  = xpDto.getInVariableMap();
			Map <String, DataSetMap> mapOutDSM = xpDto.getOutDataSetMap();
			
			/*
			 * 'SMS 메시지 구분' 공통코드 조회
			 */
			mapInVar.put("cdGrpCd", "C029");
			mapInVar.put("useYn"  , "Y");
			
			Map <String, Object> mapC029 = commonService.listCommInfo(mapInVar);
			
			List listC029 = (List)mapC029.get("result");						
			DataSetMap dsmC029 = new DataSetMap();
			dsmC029.setRowMaps(listC029);
			mapOutDSM.put("ds_C029", dsmC029);	
			
			/*
			 * 'SMS 메시지 구분상세' 공통코드 조회
			 */
			mapInVar.put("cdGrpCd", "C030");
			mapInVar.put("useYn"  , "Y");
			
			Map <String, Object> mapC030 = commonService.listCommInfo(mapInVar);
			
			List listC030 = (List)mapC030.get("result");						
			DataSetMap dsmC030 = new DataSetMap();
			dsmC030.setRowMaps(listC030);
			mapOutDSM.put("ds_C030", dsmC030);
			

			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME  , xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE            , "0");
			mav.addObject(NexacroConstant.ERROR_MSG             , "");
			
		} catch(Exception e) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE            , "-1");
			mav.addObject(NexacroConstant.ERROR_MSG             , e.toString());
		}
		
		return mav;
	}
	
	@RequestMapping("/rtms/cm/sendSms.do") 
	public ModelAndView saveRTCSWarehouseRegister(NexacroMapDTO xpDto, HttpServletRequest req) throws Exception {		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map <String, Object>     mapInVar	= xpDto.getInVariableMap();
			
			Map loginInfo = (Map)req.getSession().getAttribute("User");
						
			Map mapSms = new HashMap();			
			
			mapSms.put(NexacroConstant.DATASET_ROW_TYPE,  1);
			mapSms.put("reservedFg"  , (String)mapInVar.get("reservedFg"));						// 예약전송여부
			mapSms.put("reservedDttm", (String)mapInVar.get("reservedDttm"));					// 예약전송시간
			mapSms.put("rcvPhnId"    , ((String)mapInVar.get("rcvPhnId")).replaceAll("-", ""));	// 받는 전화번호
			mapSms.put("sndPhnId"    , ((String)mapInVar.get("sndPhnId")).replaceAll("-", ""));	// 보내는 전화번호
			mapSms.put("sndMsg"      , URLDecoder.decode((String)mapInVar.get("sndMsg")));							// 메시지내용
			mapSms.put("etcChar1"    , (String)mapInVar.get("etcChar1"));						// 사용자지정1(=메시지ID)
			mapSms.put("etcChar2"    , (String)mapInVar.get("etcChar2"));						// 사용자지정2
			mapSms.put("etcChar3"    , (String)mapInVar.get("etcChar3"));						// 사용자지정3
			mapSms.put("etcChar4"    , (String)mapInVar.get("etcChar4"));						// 사용자지정4
		
			DataSetMap dsmSms = new DataSetMap();
			dsmSms.add(mapSms);
			
			mapInVar.put("inDsMap"     , dsmSms);
			mapInVar.put("regId"       , loginInfo.get("userId"));
			mapInVar.put("sqlnamespace", "cust.saveSmsMsg");				
			
			Map <String, Object> mapResult = rTSDCustRegisterService.saveSmsMsg(mapInVar);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME  , xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE            , mapResult.get("successCode")+"");
			mav.addObject(NexacroConstant.ERROR_MSG             , mapResult.get("returnMessage"));
			
		} catch(Exception e) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE            , "-1");
			mav.addObject(NexacroConstant.ERROR_MSG             , e.toString());
		}
		
		return mav;
	}
}
