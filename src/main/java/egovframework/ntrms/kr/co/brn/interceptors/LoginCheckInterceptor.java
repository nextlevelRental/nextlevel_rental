/**************************************************************************************
 * nexacro Login
 * Copyright(c) 2009 nexacro ALLRIGHTS RESERVED.
 *
 * 1.프로그램명  	: LoginCheckInterceptor
 * 2.파일명		: LoginCheckInterceptor.java
 * 3.개발자		: sian
 * 4.개발일자		: 2014.09.06
 * 5.버젼		: 0.1
 * 6.설명		: Controller 호출시 Interceptor로 Session Check 담당
 * 7.이력
 * 8.추가사항		: Session Check 추가
 *************************************************************************************/
package egovframework.ntrms.kr.co.brn.interceptors;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.view.RedirectView;

import com.nexacro.xapi.tx.HttpPlatformRequest;

import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroAdaptorImp;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {

		String uri = request.getRequestURI();

		HttpSession session = request.getSession(true);
		session.setAttribute("url", uri);
		// web.xml 의 session-config 설정은 이 웹 어플리케이션에서 생성하는 모든 세션에 대한 
		// 타임아웃 시간을 전역 설정합니다. 
		// 아래 코드는 이 로직을 타는 특정 리퀘스트의 세션 타임아웃을 1800초 (30분) * 10 = 5시간동안 
		// 유지하는 것으로 세팅합니다. 세션 주기를 1분으로 맞추고 싶을 경우, web.xml에 session-config
		// 값을 1로 세팅하고 아래 코드를 주석 처리해 주세요. 
		// 세션이 만료되었을 경우 view 처리는 이어지는 아래 로직의 throw new ModelAndViewDefiningException(mav);
		// 에서 처리될 것으로 생각되는데, 그 이전에 HttpPlatformRequest를 초기화하는 부분이나 
		// NexacroAdaptorImp 인스턴스를 생성하는 부분이 해당 시나리오에 수행해야 하는 루틴인지 
		// 판단하여 아래 루틴을 그대로 태우거나, 그 이전에 throw new ModelAndViewDefiningException(mav);
		// 를 던지도록 분기처리하면 될 것으로 보입니다. 
		//session.setMaxInactiveInterval(1800 * 10);

//		System.out.println("==============================preHandle");
//		System.out.println("==============================");
//		System.out.println("==============================");
//		System.out.println("요청정보 컨텐트타입 =" + request.getContentType());
//		System.out.println("요청정보 프로토콜 =" + request.getProtocol());
//		System.out.println("요청정보 전송방식 =" + request.getMethod());
//		System.out.println("요청 URI =" + request.getRequestURI());
//		System.out.println("컨텍스트 경로 = " + request.getContextPath());
//		System.out.println("서버이름 = " + request.getServerName());
//		System.out.println("서버포트 = " + request.getServerPort());

		String exUrl = request.getRequestURI();
		boolean b = (exUrl.indexOf("loginCheck.do") > 0 || exUrl.indexOf("chgUserPwd.do") > 0);
		
//		System.out.println(b + "##############################################");
//		System.out.println(session.getAttribute("User") + "##############################################");
		
		if (session.getAttribute("User") == null && !b) {
			HttpPlatformRequest httpPlatformRequest = null;
			try {
				httpPlatformRequest = new HttpPlatformRequest(request);
				httpPlatformRequest.receiveData();
			} catch (Exception ex) {
				ex.getStackTrace();
				throw new Exception("HttpPlatformRequest error");
			}

			NexacroAdaptorImp xpImp = new NexacroAdaptorImp();
			NexacroMapDTO xpDto = (NexacroMapDTO) xpImp.converte4In(
					httpPlatformRequest, request);
			DataSetMap tranInfo = xpDto.getTranInfoMap();

			// WEB Access
			if (tranInfo.size() == 0) {
				// TODO : 웹에서 세션없이 접근 시, 화면전환 처리(임시로 로그인 페이지 이동)
				/*if (null == (request.getParameterMap()).get("WISEGRID_DATA")) {
					String url = "/"; // exclude extension(.jsp)
					throw new ModelAndViewDefiningException(new ModelAndView("redirect"));
					
				} else { // WISE GRID
					Map paramMap = new HashMap();
					paramMap = egovframework.ntrms.kr.co.comm.util.ObjectUtil.getParameterMap(request);
					PrintWriter out = null;

					try {
						out = response.getWriter();

					} finally {
						out.close();
					}
					return false;
				}*/
				return false;
				// NEXACRO Access
			} else {
				ModelAndView mav = new ModelAndView("nexacroMapView");

				mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME,
						xpDto.getOutVariableMap());
				mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME,
						xpDto.getOutDataSetMap());

				mav.addObject(NexacroConstant.ERROR_CODE, "-9");
				mav.addObject(NexacroConstant.ERROR_MSG, "세션이 만료되었습니다.");
				
				throw new ModelAndViewDefiningException(mav);
			}
		}

		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {

		super.afterCompletion(request, response, handler, ex);

	}

}
