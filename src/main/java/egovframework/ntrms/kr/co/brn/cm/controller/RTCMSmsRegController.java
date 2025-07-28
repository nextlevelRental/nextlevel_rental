package egovframework.ntrms.kr.co.brn.cm.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import egovframework.ntrms.kr.co.brn.cm.service.RTCMSmsRegService;
import egovframework.ntrms.kr.co.brn.cm.vo.RTCMSmsParamVO;
import egovframework.ntrms.kr.co.brn.cm.vo.RTCMSmsRegVO;
import egovframework.ntrms.kr.co.comm.util.ObjectUtil;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;

@Controller
public class RTCMSmsRegController {

	protected Log logger = LogFactory.getLog(this.getClass());	
	
	@Autowired
	RTCMSmsRegService rtcmSmsRegService;
	
	@RequestMapping("rtms/cm/listSmsHeaderCd.do")
	public ModelAndView selectSmsHeaderCd(NexacroMapDTO xpDto, Model model) {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		Map <String, Object> inVar 			    = xpDto.getInVariableMap();
		Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
		try {
			RTCMSmsRegVO vo = new RTCMSmsRegVO();
			vo.setMidGrpCd(String.valueOf(inVar.get("midGrpCd")));
			
			List<RTCMSmsRegVO> headers = rtcmSmsRegService.selectSmsHeaderCd(vo);
			
			List<Map> resultList = new ArrayList<>();
			resultList = ObjectUtil.getListToList(headers, null);
			
			DataSetMap outDs = new DataSetMap();
			outDs.setRowMaps(resultList);
			outDataset.put("output",	outDs);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	@RequestMapping("rtms/cm/listSmsDetailCd.do")
	public ModelAndView selectSmsDetailCd(NexacroMapDTO xpDto, Model model) {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		Map <String, Object> inVar 			    = xpDto.getInVariableMap();
		Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
		try {
			RTCMSmsRegVO vo = new RTCMSmsRegVO();
			vo.setMidGrpCd(String.valueOf(inVar.get("midGrpCd")));
			vo.setCd(String.valueOf(inVar.get("cd")));
			
			List<RTCMSmsRegVO> details = rtcmSmsRegService.selectSmsDetailCd(vo);
			
			List<Map> resultList = new ArrayList<>();
			resultList = ObjectUtil.getListToList(details, null);
			
			DataSetMap outDs = new DataSetMap();
			outDs.setRowMaps(resultList);
			outDataset.put("output",	outDs);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	@RequestMapping("rtms/cm/listSmsParamInfo.do")
	public ModelAndView selectSmsParamInfo(NexacroMapDTO xpDto, Model model) {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		Map <String, Object> inVar 			    = xpDto.getInVariableMap();
		Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
		try {
			
			List<RTCMSmsParamVO> details = rtcmSmsRegService.selectSmsParamInfo(inVar);
			
			List<Map> resultList = new ArrayList<>();
			resultList = ObjectUtil.getListToList(details, null);
			
			DataSetMap outDs = new DataSetMap();
			outDs.setRowMaps(resultList);
			outDataset.put("output",	outDs);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	@RequestMapping("rtms/cm/selectSeqSmsPosNo.do")
	public ModelAndView selectSeqSmsPosNo(NexacroMapDTO xpDto, Model model) {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		Map <String, Object> outVar 		= xpDto.getOutVariableMap();
		
		try {
			String seqNo = rtcmSmsRegService.selectSeqSmsPosNo(new RTCMSmsRegVO());
			
			outVar.put("seqNo", seqNo);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	@RequestMapping("rtms/cm/listSmsSendPos.do")
	public ModelAndView listSmsSendPos(NexacroMapDTO xpDto, Model model) {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		Map <String, Object> inVar 			    = xpDto.getInVariableMap();
		Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
		try {
			
			List<RTCMSmsRegVO> details = rtcmSmsRegService.selectSmsSendPos(new RTCMSmsRegVO());
			
			List<Map> resultList = new ArrayList<>();
			resultList = ObjectUtil.getListToList(details, null);
			
			DataSetMap outDs = new DataSetMap();
			outDs.setRowMaps(resultList);
			outDataset.put("output",	outDs);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	@RequestMapping("rtms/cm/checkSmsCd.do")
	public ModelAndView checkSmsCd(NexacroMapDTO xpDto, Model model) {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		Map <String, Object> inVar 			= xpDto.getInVariableMap();
		Map <String, Object> outVar 		= xpDto.getOutVariableMap();
		
		try {
			
			RTCMSmsRegVO vo = new RTCMSmsRegVO();
			vo.setMidGrpCd(String.valueOf(inVar.get("midGrpCd")));
			vo.setCd(String.valueOf(inVar.get("cd")));
			
			int resultCnt = rtcmSmsRegService.selectSmsCheckCd(vo);
			
			outVar.put("resultCnt", resultCnt);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	@RequestMapping("rtms/cm/selectSmsMessage.do")
	public ModelAndView selectSmsMessage( NexacroMapDTO xpDto , Model model ) {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		Map <String, Object> inVar 			    = xpDto.getInVariableMap();
		Map <String, Object> outVar 			= xpDto.getOutVariableMap();
		try {
			
			String message = rtcmSmsRegService.makeSmsMessage(inVar);
			logger.debug( message );
			
			outVar.put( "fSmsMessage" , message );
			
			mav.addObject( NexacroConstant.OUT_VARIABLES_ATT_NAME , 	xpDto.getOutVariableMap() );
			mav.addObject( NexacroConstant.OUT_DATASET_ATT_NAME , 	xpDto.getOutDataSetMap() );
			
			mav.addObject( NexacroConstant.ERROR_CODE , "0" );
			mav.addObject( NexacroConstant.ERROR_MSG , "" );
			
		} catch ( Exception e ) {
			
			logger.error(e.getMessage());
			mav.addObject( NexacroConstant.ERROR_CODE , "-1" );
			mav.addObject( NexacroConstant.ERROR_MSG , e.toString() );
			
		}
		return mav;
	}
}
