package egovframework.ntrms.kr.co.brn.interceptors;

import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class AuthenticInterceptor extends HandlerInterceptorAdapter{
	private Set<String> permittedURL;

	public void setPermittedURL(Set<String> permittedURL) {
		this.permittedURL = permittedURL;
	}

	/**
	 * 세션에 계정정보가 있는지 여부로 인증 여부를 체크한다. 계정정보가 없다면, 로그인 페이지로
	 * 이동한다.
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		System.out.println("##############################################################");
		String requestURI = request.getRequestURI(); // 요청 URI
		boolean isPermittedURL = false;

		Map loginVO = (Map)request.getSession().getAttribute("User");

		if (loginVO != null) {
			return true;
		} else {

			for (Iterator<String> it = this.permittedURL.iterator(); it.hasNext();) {
				String urlPattern = request.getContextPath() + (String) it.next();

				if (Pattern.matches(urlPattern, requestURI)) {// 정규표현식을 이용해서 요청
																// URI가 허용된 URL에
																// 맞는지 점검함.
					isPermittedURL = true;
				}

			}

			if (!isPermittedURL) {
				ModelAndView modelAndView = new ModelAndView(
						"redirect:/nxui/index.html");
				throw new ModelAndViewDefiningException(modelAndView);
			} else {
				return true;
			}
		}
	}
}
