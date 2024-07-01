package egovframework.ntrms.kr.co.brn.cms.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SefeKeyConfirmController {
	protected Log logger = LogFactory.getLog(this.getClass());	
	
	@RequestMapping("rtms/cms/safekeyForm.do") 
	public ModelAndView safekeyForm(HttpServletRequest request) throws Exception {
		return new ModelAndView("interface/safekey/checkplus_form");
	}
}
