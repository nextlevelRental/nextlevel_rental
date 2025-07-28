package egovframework.ntrms.kr.co.brn.re.controller;

import java.math.BigDecimal;
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
import egovframework.ntrms.kr.co.brn.re.service.RTRECloseInterfaceService;
import egovframework.ntrms.kr.co.brn.re.service.RTREClosePostingService;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;

@Controller
public class RTREClosePostingController {
	protected Log logger = LogFactory.getLog(this.getClass());	

	@Resource(name="rTREClosePostingService")
	RTREClosePostingService rTREClosePostingService;
	
	@Resource(name="rTRECloseInterfaceService")
	RTRECloseInterfaceService rTRECloseInterfaceService;
	
	@Resource(name="commonService")
	CommonService commonService;
	
	/**
	 * 인터페이스 시점(공통코드)
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/rtms/re/rTREClosePostingCommCode.do") 
	public ModelAndView getClosePostingCommCode(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map map = new HashMap();
			
			map.put("cd", " ");
			map.put("cdNm","전체");
			
			inVar.put("cdGrpCd", "R051");
			inVar.put("useYn", "Y");
			
			Map mapR051 = commonService.listCommInfo(inVar);
			
			List listR051 = (List)mapR051.get("result");
			listR051.add(0, map);
			
			DataSetMap dsR051Maps = new DataSetMap();
			dsR051Maps.setRowMaps(listR051);
			outDataset.put("outputR051", dsR051Maps);	
			
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
	
	@RequestMapping("/rtms/re/rTREClosePostingList.do") 
	public ModelAndView rTREClosePostingList(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rTREClosePostingService.rTREClosePostingList(inVar);
			
			List rTREClosePostingList = (List)result.get("rTREClosePostingList");
			
			DataSetMap output = new DataSetMap();
			output.setRowMaps(rTREClosePostingList);
			
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
	
	@RequestMapping("/rtms/re/aggregatePostingData.do") 
	public ModelAndView aggregatePostingData(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map loginInfo = (Map) req.getSession().getAttribute("User");
			
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("regId", loginInfo.get("userId"));  //등록자 ID		
			
			Map result = rTREClosePostingService.aggregatePostingData(inVar);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			
			mav.addObject(NexacroConstant.ERROR_CODE, result.get("successCode").toString());
			mav.addObject(NexacroConstant.ERROR_MSG, result.get("returnMessage"));
		
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	@RequestMapping("/rtms/re/updatePostingData.do") 
	public ModelAndView updatePostingData(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map loginInfo = (Map) req.getSession().getAttribute("User");
			
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("regId", loginInfo.get("userId"));  //등록자 ID		
			
			Map result = rTREClosePostingService.updatePostInterfaceResult(inVar);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			
			mav.addObject(NexacroConstant.ERROR_CODE, result.get("successCode").toString());
			mav.addObject(NexacroConstant.ERROR_MSG, result.get("errorText"));
		
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	
	/**
	 * 마감전표 EAI 전송
	 */
	@RequestMapping("/rtms/re/ifRTREClosePostingEai.do")
	@SuppressWarnings("unchecked")
	public ModelAndView ifRTREClosePostingEai(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		Map loginInfo = (Map)req.getSession().getAttribute("User");
		
		Map <String, Object> closeIfRowMap = new HashMap();
		Map <String, Object> resultDaoMap = new HashMap();
		
		String oFlag, oMesg, oPnum, rtnMsg = null;
		String secElapse = "0";
		String rtnCd = "0";
		
		try {
			Map <String, DataSetMap> inDSMap   = xpDto.getInDataSetMap();
			Map <String, Object> 	   inVarMap   = xpDto.getInVariableMap();
			Map <String, Object>     outVarMap = xpDto.getOutVariableMap();
			
			DataSetMap inPostIfDSMap = inDSMap.get("ds_postingList");			
			/*
			 * 화면에서 넘어온 (수정된)데이터셋 row 만큼 반복 수행
			 */
			for (int rowIdx=0; rowIdx < inPostIfDSMap.size(); rowIdx++) {
				
				String chk      = (String)inPostIfDSMap.getMapValue(rowIdx, "chk");
				String reltCode = (String)inPostIfDSMap.getMapValue(rowIdx, "eSubrc");
				/*
				 * 화면에서 작업대상으로 체크한 건 중에 이미 인터페이스 성공한 것은 제외
				 * - 화면에서 대상전체 선택 시(헤드의 체크박스 클릭) 보이지는 않지만 작업대상으로 체크가 된 상태로 넘어옴
				 */
				if ("1".equals(chk) && !("S".equals(reltCode))) {
					
					closeIfRowMap.clear();
					
					closeIfRowMap.put("chgId"    , loginInfo.get("userId"));										// 변경자 ID
					closeIfRowMap.put("zmonth"     , inPostIfDSMap.getMapValue(rowIdx, "zmonth"));    // 마감월
					closeIfRowMap.put("stmtCd"     , inPostIfDSMap.getMapValue(rowIdx, "stmtCd"));		// 전표일련번호
					closeIfRowMap.put("stmtSeq"     , inPostIfDSMap.getMapValue(rowIdx, "stmtSeq"));		// 전표일련번호
					
					closeIfRowMap.put("ifId"     , inVarMap.get("ifId"));		// 인터페이스 ID
					
					long timeStart = System.currentTimeMillis();
					
					// EAI 인터페이스
					Map <String, Object> resultMap = rTREClosePostingService.ifRTRECloseSendEai(closeIfRowMap);
					
					long timeEnd = System.currentTimeMillis();
					
					// EAI 인터페이스 결과를 DB에 저장하기 위해 Map에 적재
					secElapse = (int)Math.ceil((timeEnd - timeStart) / (double) 1000)+"";				// I/F 수행시간(초)
					oFlag     = (String)resultMap.get("oFlag");
					oMesg     = (String)resultMap.get("oMesg");
					oPnum     = (String)resultMap.get("oPnum");
					
					closeIfRowMap.put("exeSec"  , secElapse);
					closeIfRowMap.put("eSubrc", oFlag);					//리턴코드
					closeIfRowMap.put("eBelnr" , oPnum);				//전표번호 (리턴코드가 S인경우만)
					closeIfRowMap.put("eRemsg" , oMesg); 		    //결과메세지
					
					logger.debug("secElapse = [" + secElapse + "]");
					logger.debug("eSubrc = [" + oFlag + "]");
					logger.debug("eBelnr = [" + oPnum + "]");
					logger.debug("eRemsg = [" + oMesg + "]");
					
					// EAI 인터페이스 결과를 DB에 저장
					resultDaoMap = rTREClosePostingService.updatePostInterfaceResult(closeIfRowMap);
					
					rtnCd  = String.valueOf(resultDaoMap.get("sqlCode"));
					rtnMsg = (String)resultDaoMap.get("errText");
				}
			}
			
			outVarMap.put("returnCd" , rtnCd+"");
			outVarMap.put("returnMsg", rtnMsg);
			
			logger.debug("returnCd = [" + outVarMap.get("returnCd") + "]");
			logger.debug("returnMsg = [" + outVarMap.get("returnMsg") + "]");

			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME,   xpDto.getOutDataSetMap());

			mav.addObject(NexacroConstant.ERROR_CODE, rtnCd+"");
			mav.addObject(NexacroConstant.ERROR_MSG , rtnMsg);
			
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		
		return mav;
	}
}
