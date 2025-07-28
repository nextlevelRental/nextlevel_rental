package egovframework.ntrms.kr.co.brn.cms.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

//import egovframework.com.kcp.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;








import egovframework.ntrms.kr.co.brn.cms.service.KCPHubBatchService;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;
import egovframework.rte.fdl.property.EgovPropertyService;

@Controller
public class KCPHubBatchController {
	protected Log logger = LogFactory.getLog(this.getClass());	
	
	@Resource(name="kCPHubBatchService")
	KCPHubBatchService kCPHubBatchService;
	
    @Resource(name="propertiesService")
    protected EgovPropertyService propertiesService;
	
	@RequestMapping("/rtms/cms/kcphubBatch.do") 
	public ModelAndView kcphubBatch(NexacroMapDTO xpDto, Model model, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("interface/auth/pp_cli_hub");
		
		try {
			Map loginInfo = (Map)request.getSession().getAttribute("User");
			Map <String, Object> inVar 				= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset 	= xpDto.getOutDataSetMap();
			inVar.put("regId", loginInfo.get("userId"));
			/***************************************************************************************************
			 * 		args += " site_cust_id=" 		+ nvl(this.div_search.edt_custNo.value);				//고객아이디
			 *		args += " group_id=" 	 		+ application.gv_group_id ;								//그룹번호
			 * 		args += " cust_name=" 			+ nvl(this.div_search.edt_custNoKeyword.value);			//고객명
			 *		args += " pay_type=" 	 		+ application.gv_pay_type;								//결제수단				
			 *		args += " pay_id=" 				+ nvl(this.divInfo.divChgInfo2.edtCardNo.value);		//카드번호
			 *		args += " pay_expiry_yy=" 		+ nvl(this.divInfo.divChgInfo2.edtYear.value);			//유효기간(년)
			 *		args += " pay_expiry_mm="		+ nvl(this.divInfo.divChgInfo2.edtMonth.value);			//유효기간(월)
			 *		args += " pay_owner_nm=" 		+ nvl(this.divInfo.divChgInfo2.edtDepositor.value);		//카드소유자명
			 *		args += " pay_cert_no="  		+ nvl(this.divInfo.divChgInfo2.edtBirth.value);			//생년월일
			 *********************************************************************************************************/
			
			DataSetMap dsm = new DataSetMap();
			Map paramMap = new HashMap();
			paramMap.put(NexacroConstant.DATASET_ROW_TYPE,  1);
			paramMap.put("dvsn", 			"I");
			paramMap.put("ccertDay",  	null);									//배치신청일
			paramMap.put("ccertSeq", 	null);									//일련번호
			paramMap.put("cardNo", 		(String)inVar.get("pay_id"));
			paramMap.put("expireYm", 	(String)inVar.get("pay_expiry_yy") + (String)inVar.get("pay_expiry_mm")); //카드유효기간
			
			
			paramMap.put("ownerNm",		(String)inVar.get("pay_owner_nm") ); 	//카드소지자명
			paramMap.put("custTp", 		(String)inVar.get("cmbGubun"));			//사용자구분
			
			paramMap.put("ebirDay", 	(String)inVar.get("pay_cert_no")); 		//생년월일
			paramMap.put("buslNo", 		(String)inVar.get("busl_no"));			//사업자번호
			
			paramMap.put("ccertId", 	null);
			paramMap.put("custNo", 		(String)inVar.get("site_cust_id"));		//고객아이디
			paramMap.put("custNm", 		(String)inVar.get("cust_name"));		//고객명
			paramMap.put("mobNo", 		null);									//핸드폰번호
			paramMap.put("emailAddr", 	null);									//이메일주소
			paramMap.put("bkeyChk", 	"N");									//성공여부
			paramMap.put("cardcomCd",   (String)inVar.get("cardcomCd"));		//은행코드(카드사코드)
			paramMap.put("batchKey", 	null);
			paramMap.put("group_id", 	(String)inVar.get("group_id"));
			
			dsm.add(paramMap);
			inVar.put("inDsMap",  dsm);
			inVar.put("sqlnamespace", "cardReqDAO.saveCardBatch");
			
			Map resultMap = kCPHubBatchService.kcphubBatch(inVar);
			
			
			
			mav.addObject("resultMap", resultMap);
			
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
	
	
	@RequestMapping("/ntrms/cm/kcphubBatchResult.do") 
	public ModelAndView kcphubBatchResult(NexacroMapDTO xpDto, Model model, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map loginInfo = (Map)request.getSession().getAttribute("User");
			DataSetMap tranInfo 						= xpDto.getTranInfoMap();
			Map <String, Object> inVar 				= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, Object> outVar 			= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			inVar.put("regId", loginInfo.get("userId"));
	       
			// 결과값을 리턴받아 로그 테이블에 성공여부 및 은행코드등을 수정한다.
			inVar.put("sqlnamespace", "cardReqDAO.saveCardBatchResult");
			Map resultMap = kCPHubBatchService.kcphubBatchResult(inDataset, inVar);
			
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			
			mav.addObject(NexacroConstant.ERROR_CODE, resultMap.get("successCode") + "");
			mav.addObject(NexacroConstant.ERROR_MSG, resultMap.get("returnMessage"));
		
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
}
