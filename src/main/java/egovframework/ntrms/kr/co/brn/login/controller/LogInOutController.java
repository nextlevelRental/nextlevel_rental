package egovframework.ntrms.kr.co.brn.login.controller;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
}