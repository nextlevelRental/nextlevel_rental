package egovframework.ntrms.kr.co.brn.login.controller;
import java.net.URLDecoder;
import java.util.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import egovframework.ntrms.kr.co.brn.exception.NtRmsServiceException;
import egovframework.ntrms.kr.co.brn.re.model.config.KCPConfig;
import egovframework.ntrms.kr.co.brn.re.model.config.KCPConfigFactory;
import egovframework.ntrms.kr.co.brn.sd.service.RTSDCustRegisterService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;




import egovframework.com.nexa.common.domain.User;
import egovframework.ntrms.kr.co.brn.login.service.LogInOutService;
import egovframework.ntrms.kr.co.comm.util.SecurityUtil;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;
import egovframework.rte.fdl.property.EgovPropertyService;

import java.lang.reflect.Method;


@Controller("logInOutController")
@SuppressWarnings("unchecked")
public class LogInOutController {
	
	protected Log logger = LogFactory.getLog(this.getClass());
	
	/** LogInOutService 비즈니스 객체 생성 **/
	@Resource(name="logInOutService")
	LogInOutService logInOutService;
	
    @Resource(name="propertiesService")
    protected EgovPropertyService propertiesService;

	@Resource(name="rTSDCustRegisterService")
	RTSDCustRegisterService rTSDCustRegisterService;

	/**
	 * Login Check
	 * @param user
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/loginCheck.do")
    public ModelAndView loginCheck(NexacroMapDTO xpDto, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, Object> outVar 		= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
		
			String sUserId 	= (String)inVar.get("V_USER_ID");
			String sPswd 	= (String)inVar.get("V_USER_PWD");
			String userIp 	= request.getRemoteAddr();
			if(("").equals(sUserId)){
				mav.addObject(NexacroConstant.ERROR_CODE, "-1");
				mav.addObject(NexacroConstant.ERROR_MSG, "ERROR");
				return mav;
			}
			
			if(("").equals(sPswd)){
				mav.addObject(NexacroConstant.ERROR_CODE, "-1");
				mav.addObject(NexacroConstant.ERROR_MSG, "ERROR");
				return mav;
			}
			
			Map map = new HashMap();
			map.put("userId", 	sUserId);
//			map.put("password", sPswd);
			map.put("password", SecurityUtil.ChangePassword(sPswd));
			map.put("userIp", userIp);
			
			
			logInOutService.getUserinfo(mav, map, request, outDataset);

			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			
			mav.addObject(NexacroConstant.ERROR_CODE, "0");
			mav.addObject(NexacroConstant.ERROR_MSG, "");
		
		} catch ( Exception e )
		{
			e.printStackTrace();
		}
		return mav;		
    }
	
	/**
	 * Login Check
	 * @param user
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/authController.do")
	public ModelAndView operate(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, Object> outVar 		= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Object bean = logInOutService;
			Method method = getMethod(bean, (String)inVar.get("method"));
			try{
				method.invoke(bean, new Object[] {tranInfo, inVar, inDataset, outVar, outDataset});
			} catch (Exception e){
				Throwable te = e.getCause();
				logger.debug("Can not invoke a dispatch method name", te);
				throw new Exception(te.getMessage(), te);
			}

			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			
			mav.addObject(NexacroConstant.ERROR_CODE, "0");
			mav.addObject(NexacroConstant.ERROR_MSG, "");
		
		} catch ( Exception e )
		{
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	/**
	 * Logout
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/logout.do")
	public ModelAndView loginOut(NexacroMapDTO xpDto, HttpServletRequest request) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		HttpSession session = request.getSession(false);
		if(session != null){
			session.invalidate();
			
			mav.addObject(NexacroConstant.ERROR_CODE, "0");
			mav.addObject(NexacroConstant.ERROR_MSG, "");
		}
		
		return mav;
	}
	
	private Method getMethod(Object bean, String methodName) throws Exception{
		Method[] methods = bean.getClass().getMethods();

		for(int i = 0 ; i < methods.length ; i++) {
			if( methods[i].getName().equals(methodName)) {
				return methods[i];
			}
		}
		throw new Exception("Cann't find " + methodName + ".");
	}
	
	/**
	 * 사용자 비밀번호변경
	 * @param user
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/rtms/comm/chgUserPwd.do")
	public ModelAndView chgUserPwd(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		Map result = null;
		try
		{
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, Object> outVar 		= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			result = logInOutService.getPassWordVerification(inDataset);
			String successCode 		= result.get("successCode") + "";
			String returnMessage 	= (String)result.get("returnMessage");
			System.out.println("--------------------------------------");
			System.out.println(result);
			System.out.println("--------------------------------------");
			
			if(Integer.parseInt(successCode) >= 0) {
				result = logInOutService.chgUserPwd(inDataset);
				successCode 		= result.get("successCode") + "";
				returnMessage 	= (String)result.get("returnMessage");
			}

			System.out.println("-------------------------------------------");
			System.out.println(result);
			System.out.println("-------------------------------------------");
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			
			mav.addObject(NexacroConstant.ERROR_CODE, successCode);
			mav.addObject(NexacroConstant.ERROR_MSG,  returnMessage);
		
		} catch ( Exception e )
		{
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}

	/**
	 * 사용자 확인
	 * @param user
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/isUserExists.do")
	public ModelAndView isUserExists(NexacroMapDTO xpDto, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");

		try
		{
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, Object> outVar 		= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();

			String sUserId 	= (String)inVar.get("V_USER_ID");
			String sPswd 	= (String)inVar.get("V_USER_PWD");
			String userIp 	= request.getRemoteAddr();
			if(("").equals(sUserId)){
				mav.addObject(NexacroConstant.ERROR_CODE, "-1");
				mav.addObject(NexacroConstant.ERROR_MSG, "ERROR");
				return mav;
			}

			if(("").equals(sPswd)){
				mav.addObject(NexacroConstant.ERROR_CODE, "-1");
				mav.addObject(NexacroConstant.ERROR_MSG, "ERROR");
				return mav;
			}

			Map map = new HashMap();
			map.put("userId", 	sUserId);
//			map.put("password", sPswd);
			map.put("password", SecurityUtil.ChangePassword(sPswd));
			map.put("userIp", userIp);


			logInOutService.isUserExists(mav, map, request, outDataset);

			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());

			mav.addObject(NexacroConstant.ERROR_CODE, "0");
			mav.addObject(NexacroConstant.ERROR_MSG, "");

		} catch ( Exception e )
		{
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, "ERROR");
		}
		return mav;
	}

	/**
	 * 사용자 인증전송 휴대폰번호 조회
	 * @param searchVo
	 * @return NexacroResult
	 * @throws
	 */
	@RequestMapping("/searchMobNoList.do")
	public ModelAndView getMobNoList(NexacroMapDTO xpDto, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");

		try
		{
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, Object> outVar 		= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();

			String sUserId 	= (String)inVar.get("userId");
			if(("").equals(sUserId)){
				mav.addObject(NexacroConstant.ERROR_CODE, "-1");
				mav.addObject(NexacroConstant.ERROR_MSG, "ERROR");
				return mav;
			}

			//사용자 인증가능 휴대폰 list
			Map result = logInOutService.getMobNoList(inVar, outDataset);
			List list = (List)result.get("mobNoList");
			DataSetMap outDsMap = new DataSetMap();
			outDsMap.setRowMaps(list);
			outDataset.put("dsMobNoList", outDsMap);

			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());

			mav.addObject(NexacroConstant.ERROR_CODE, "0");
			mav.addObject(NexacroConstant.ERROR_MSG, "");

		} catch ( Exception e )
		{
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE            , "-1");
			mav.addObject(NexacroConstant.ERROR_MSG             , e.toString());
		}
		return mav;
	}

	/**
	 * 사용자 로그인 - 2차인증 번호 전송
	 * @param searchVo
	 * @return NexacroResult
	 * @throws
	 */
	@RequestMapping("/sendUserAuthCode.do")
	public ModelAndView sendUserAuthCode(NexacroMapDTO xpDto, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");

		try {
			DataSetMap tranInfo = xpDto.getTranInfoMap();
			Map<String, Object> inVar = xpDto.getInVariableMap();
			Map<String, DataSetMap> inDataset = xpDto.getInDataSetMap();
			Map<String, Object> outVar = xpDto.getOutVariableMap();
			Map<String, DataSetMap> outDataset = xpDto.getOutDataSetMap();

			//사용자 인증 휴대폰번호 여부 확인
			if(!logInOutService.getUserAuthinfo(mav, inVar, request, outDataset)) {
				mav.addObject(NexacroConstant.ERROR_CODE, "-1");
				mav.addObject(NexacroConstant.ERROR_MSG, "Verification Failed.");
				throw new NtRmsServiceException();
			}

			Map mapSms = new HashMap();
			String sUserId 	 = (String) inVar.get("userId");
			String rcvPhnNo  = (String) inVar.get("mobNo");
			String sndPhnNo  = "18550100";		//넥센타이어 고객센터
			String sendMsg  = "";

			Random generator = new Random();
			StringBuffer sb = new StringBuffer();
			sb.append(String.valueOf(generator.nextInt(10)));
			sb.append(String.valueOf(generator.nextInt(10)));
			sb.append(String.valueOf(generator.nextInt(10)));
			sb.append(String.valueOf(generator.nextInt(10)));
			sb.append(String.valueOf(generator.nextInt(10)));
			sb.append(String.valueOf(generator.nextInt(10)));

			request.getSession().setAttribute("_auth_no", sb.toString());
			logger.debug("_auth_no : " + sb.toString());
			String reqUrl = request.getRequestURL().toString();
			
			//local 개발환경 한글깨짐 이슈로 서버체크
			if(reqUrl.indexOf("localhost") != -1 || reqUrl.indexOf("127.0.0.1") != -1) {
				sendMsg = "SMS Verification Code  [" + sb.toString() + "] ";
			}else{
				sendMsg = "[넥센타이어] 본인확인 인증번호는 [" + sb.toString() + "] 입니다.";
			}

			mapSms.put(NexacroConstant.DATASET_ROW_TYPE,  1);
			mapSms.put("reservedFg"  , "I");													// 예약전송여부 (I:즉시발송, R:예약발송)
			mapSms.put("reservedDttm", "00000000000000");										// 예약전송시간 (yyyyMMddHHmmss, 즉시발송의 경우 '0'으로 세팅하면 DB에서 현재시간으로 전환)
			mapSms.put("rcvPhnId"    , rcvPhnNo);												// 받는 전화번호
			mapSms.put("sndPhnId"    , sndPhnNo);												// 보내는 전화번호
			mapSms.put("sndMsg"      , sendMsg);												// 메시지내용
			mapSms.put("etcChar1"    , "S035");													// 사용자지정1(=메시지ID)
			mapSms.put("etcChar2"    , "");														// 사용자지정2
			mapSms.put("etcChar3"    , "");														// 사용자지정3
			mapSms.put("etcChar4"    , "");														// 사용자지정4

			DataSetMap dsmSms = new DataSetMap();
			dsmSms.add(mapSms);

			inVar.put("inDsMap"     , dsmSms);
			inVar.put("regId"       , sUserId);
			inVar.put("sqlnamespace", "cust.saveSmsMsg");

			Map <String, Object> mapResult = rTSDCustRegisterService.saveSmsMsg(inVar);

			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME  , xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE            , mapResult.get("successCode")+"");
			mav.addObject(NexacroConstant.ERROR_MSG             , mapResult.get("returnMessage"));

		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}

	/**
	 * 사용자 로그인 - 2차인증 확인
	 * @param searchVo
	 * @return NexacroResult
	 * @throws
	 */
	@RequestMapping("/checkCertNum.do")
	public ModelAndView checkCertNum(NexacroMapDTO xpDto, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");

		try {
			DataSetMap tranInfo = xpDto.getTranInfoMap();
			Map<String, Object> inVar = xpDto.getInVariableMap();
			Map<String, DataSetMap> inDataset = xpDto.getInDataSetMap();
			Map<String, Object> outVar = xpDto.getOutVariableMap();
			Map<String, DataSetMap> outDataset = xpDto.getOutDataSetMap();

			String sUserId    = (String) inVar.get("userId");
			String sCertNum    = (String) inVar.get("certNum");

			String sessionAuthNo = (String) request.getSession().getAttribute("_auth_no");
			if(!StringUtils.isEmpty(sessionAuthNo) && sessionAuthNo.equals(sCertNum)){
				//인증여부 세션에 추가
				HttpSession session = request.getSession();
				session.setAttribute("authVerified", true);
				session.setAttribute("authUserId", sUserId);

				mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, xpDto.getOutVariableMap());
				mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());

				mav.addObject(NexacroConstant.ERROR_CODE, "0");
				mav.addObject(NexacroConstant.ERROR_MSG, "");
			}else{
				mav.addObject(NexacroConstant.ERROR_CODE, "-1");
				mav.addObject(NexacroConstant.ERROR_MSG, "Verification Failed.");
				throw new NtRmsServiceException();
			}
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
}