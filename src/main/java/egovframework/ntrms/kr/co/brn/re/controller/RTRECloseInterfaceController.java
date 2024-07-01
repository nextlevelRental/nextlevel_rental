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
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;

@Controller
public class RTRECloseInterfaceController {
	protected Log logger = LogFactory.getLog(this.getClass());	

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
	@RequestMapping("/rtms/re/rTRECloseInterfaceCommCode.do") 
	public ModelAndView getindividualCommissionCommCode(NexacroMapDTO xpDto, Model model) throws Exception {
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
	
	@RequestMapping("/rtms/re/rTRECloseInterfaceList.do") 
	public ModelAndView rTRECloseInterfaceList(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rTRECloseInterfaceService.rTRECloseInterfaceList(inVar);
			
			List rTRECloseInterfaceList = (List)result.get("rTRECloseInterfaceList");
			
			DataSetMap closeListMap = new DataSetMap();
			closeListMap.setRowMaps(rTRECloseInterfaceList);
			
			outDataset.put("closeListMap", closeListMap);
			
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
	 * 월마감 EAI 전송
	 */
	@RequestMapping("/rtms/re/ifRTRECloseSendEai.do")
	@SuppressWarnings("unchecked")
	public ModelAndView ifRTRECloseSendEai(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		Map loginInfo = (Map)req.getSession().getAttribute("User");
		
		Map <String, Object> closeIfRowMap = new HashMap();
		Map <String, Object> resultDaoMap = new HashMap();
		
		String oFlag, oMesg, rtnMsg = null;
		String secElapse = "0";
		String rtnCd = "0";
		
		try {
			Map <String, DataSetMap> inDSMap   = xpDto.getInDataSetMap();
			Map <String, Object>     outVarMap = xpDto.getOutVariableMap();
			
			DataSetMap inCloseIfDSMap = inDSMap.get("ds_closeIfList");			
			/*
			 * 화면에서 넘어온 (수정된)데이터셋 row 만큼 반복 수행
			 */
			for (int rowIdx=0; rowIdx < inCloseIfDSMap.size(); rowIdx++) {
				String chk      = (String)inCloseIfDSMap.getMapValue(rowIdx, "chk");
				String reltCode = (String)inCloseIfDSMap.getMapValue(rowIdx, "reltCode");
				/*
				 * 화면에서 작업대상으로 체크한 건 중에 이미 인터페이스 성공한 것은 제외
				 * - 화면에서 대상전체 선택 시(헤드의 체크박스 클릭) 보이지는 않지만 작업대상으로 체크가 된 상태로 넘어옴
				 */
				if ("1".equals(chk) && !("S".equals(reltCode))) {
					closeIfRowMap.clear();
					
					closeIfRowMap.put("chgId"    , loginInfo.get("userId"));							// 변경자 ID
					closeIfRowMap.put("ifNo"     , inCloseIfDSMap.getMapValue(rowIdx, "ifNo"));			// 인터페이스 (일련)번호
					closeIfRowMap.put("ifId"     , inCloseIfDSMap.getMapValue(rowIdx, "ifId"));			// 인터페이스 ID
					closeIfRowMap.put("inParam01", inCloseIfDSMap.getMapValue(rowIdx, "inParam01"));	// 입력파라미터1
					closeIfRowMap.put("inParam02", inCloseIfDSMap.getMapValue(rowIdx, "inParam02"));	// 입력파라미터2
					
					long timeStart = System.currentTimeMillis();
					
					// EAI 인터페이스
					Map <String, Object> resultMap = rTRECloseInterfaceService.ifRTRECloseSendEai(closeIfRowMap);
					
					long timeEnd = System.currentTimeMillis();
					
					// EAI 인터페이스 결과를 DB에 저장하기 위해 Map에 적재
					secElapse = (int)Math.ceil((timeEnd - timeStart) / (double) 1000)+"";				// I/F 수행시간(초)
					oFlag     = (String)resultMap.get("oFlag");
					oMesg     = (String)resultMap.get("oMesg");
					
					closeIfRowMap.put("exeSec"  , secElapse);
					closeIfRowMap.put("reltCode", oFlag);
					closeIfRowMap.put("reltMsg" , oMesg);
					
					logger.debug("secElapse = [" + secElapse + "]");
					logger.debug("oFlag = [" + oFlag + "]");
					logger.debug("oMesg = [" + oMesg + "]");
					
					// EAI 인터페이스 결과를 DB에 저장
					resultDaoMap = rTRECloseInterfaceService.updateCloseInterfaceResult(closeIfRowMap);
					
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
	
	/**
	 * 월마감 EAI 전송
	 */
	@RequestMapping("/rtms/re/ifRTRECloseSendEai_New.do")
	@SuppressWarnings("unchecked")
	public ModelAndView ifRTRECloseSendEai_New(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		Map loginInfo = (Map)req.getSession().getAttribute("User");
		
		Map <String, Object> closeIfRowMap = new HashMap();
		Map <String, Object> resultDaoMap = new HashMap();
		Map <String, Object> rtnMap = new HashMap(); //데이터 집계후 total count
		
		String oFlag, oMesg, oPnum, rtnMsg = null;
		String secElapse = "0";
		String rtnCd = "0";
		
		BigDecimal totCnt = new BigDecimal("1"); //집계데이터 count
		int times = 1; //전송횟수
		
		try {
			Map <String, DataSetMap> inDSMap   = xpDto.getInDataSetMap();
			Map <String, Object>     outVarMap = xpDto.getOutVariableMap();
			
			DataSetMap inCloseIfDSMap = inDSMap.get("ds_closeIfList");			
			/*
			 * 화면에서 넘어온 (수정된)데이터셋 row 만큼 반복 수행
			 */
			for (int rowIdx=0; rowIdx < inCloseIfDSMap.size(); rowIdx++) {
				String multiSendYn = (String)inCloseIfDSMap.getMapValue(rowIdx, "multiSendYn"); //분리전송여부
				String rawDataProc = (String)inCloseIfDSMap.getMapValue(rowIdx, "rawDataProc"); //row data집계
				int amount = new BigDecimal(inCloseIfDSMap.getMapValue(rowIdx, "sendAmount").toString()).intValue(); //분리전송건수
				String chk      = (String)inCloseIfDSMap.getMapValue(rowIdx, "chk");
				String reltCode = (String)inCloseIfDSMap.getMapValue(rowIdx, "reltCode");
				/*
				 * 화면에서 작업대상으로 체크한 건 중에 이미 인터페이스 성공한 것은 제외
				 * - 화면에서 대상전체 선택 시(헤드의 체크박스 클릭) 보이지는 않지만 작업대상으로 체크가 된 상태로 넘어옴
				 */
				if ("1".equals(chk) && !("S".equals(reltCode))) {
					
					closeIfRowMap.clear();
					
					closeIfRowMap.put("chgId"    , loginInfo.get("userId"));							// 변경자 ID
					closeIfRowMap.put("ifNo"     , inCloseIfDSMap.getMapValue(rowIdx, "ifNo"));			// 인터페이스 (일련)번호
					closeIfRowMap.put("ifId"     , inCloseIfDSMap.getMapValue(rowIdx, "ifId"));			// 인터페이스 ID
					closeIfRowMap.put("inParam01", inCloseIfDSMap.getMapValue(rowIdx, "inParam01"));	// 입력파라미터1
					closeIfRowMap.put("inParam02", inCloseIfDSMap.getMapValue(rowIdx, "inParam02"));	// 입력파라미터2
					
					//Data집계
					if(multiSendYn.equals("Y")){
						closeIfRowMap.put("namespace", "rTRECloseInterfaceDAO." + rawDataProc);
						rtnMap = rTRECloseInterfaceService.aggregateData(closeIfRowMap);
						
						totCnt = (BigDecimal)rtnMap.get("totCnt"); //집계데이터 count
						times = (totCnt.intValue() / amount) + 1; //전송횟수
					}
					
					oFlag = null;
					for(int cnt=1; cnt <= times; cnt++){
						
						if(oFlag == null || oFlag.equals("S")) {
							//횟수별 전송 진행
							if(multiSendYn.equals("Y")){
								closeIfRowMap.put("inParam01", amount * cnt);	// 입력파라미터1
							}
							
							long timeStart = System.currentTimeMillis();
							
							// EAI 인터페이스
							Map <String, Object> resultMap = rTRECloseInterfaceService.ifRTRECloseSendEai(closeIfRowMap);
							
							long timeEnd = System.currentTimeMillis();
							
							// EAI 인터페이스 결과를 DB에 저장하기 위해 Map에 적재
							secElapse = (int)Math.ceil((timeEnd - timeStart) / (double) 1000)+"";				// I/F 수행시간(초)
							oFlag     = (String)resultMap.get("oFlag");
							oMesg     = (String)resultMap.get("oMesg");
							oPnum     = (String)resultMap.get("oPnum");
							
							closeIfRowMap.put("exeSec"  , secElapse);
							closeIfRowMap.put("reltCode", oFlag);
							closeIfRowMap.put("reltMsg" , oMesg);
							
							logger.debug("secElapse = [" + secElapse + "]");
							logger.debug("oFlag = [" + oFlag + "]");
							logger.debug("oMesg = [" + oMesg + "]");
							
							// EAI 인터페이스 결과를 DB에 저장
							resultDaoMap = rTRECloseInterfaceService.updateCloseInterfaceResult(closeIfRowMap);
							
							rtnCd  = String.valueOf(resultDaoMap.get("sqlCode"));
							rtnMsg = (String)resultDaoMap.get("errText");
						}
					}
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
	
	/**
	 * EAI전송리스트 생성
	 */
	@RequestMapping("/rtms/re/ifRTRECreateEaiList.do")
	@SuppressWarnings("unchecked")
	public ModelAndView createEAIList(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, Object>     outVarMap = xpDto.getOutVariableMap();
		
			Map resultMap = null;
			resultMap = rTRECloseInterfaceService.createEAIList(inVar);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME,   xpDto.getOutDataSetMap());
	
			mav.addObject(NexacroConstant.ERROR_CODE, resultMap.get("successCode").toString());
			mav.addObject(NexacroConstant.ERROR_MSG , resultMap.get("returnMessage"));
			
		}catch(Exception e){
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		
		return mav;
	}
}
