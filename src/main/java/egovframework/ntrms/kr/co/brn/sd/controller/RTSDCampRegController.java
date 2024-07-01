/************************************************************************************
 * 1.Program  			: Common DataSet Controller
 * 2.File Name			: RTCMUserController.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.sd.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
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

import egovframework.ntrms.kr.co.brn.cm.service.RTCMProRegService;
import egovframework.ntrms.kr.co.brn.cm.service.RTCMUserService;
import egovframework.ntrms.kr.co.brn.comm.service.CommonService;
import egovframework.ntrms.kr.co.brn.sd.service.RTSDClaimService;
import egovframework.ntrms.kr.co.brn.sd.service.RTSDCampRegService;
import egovframework.ntrms.kr.co.comm.util.DateUtil;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;

@Controller
public class RTSDCampRegController {
	
	protected Log logger = LogFactory.getLog(this.getClass());	

	@Resource(name="commonService")
	CommonService commonService;
	
	@Resource(name="rTSDCampRegService")
	RTSDCampRegService rTSDCampRegService;
	
	/*******************************
	 * 캠페인등록 
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/rtms/sd/initCampReg.do") 
	public ModelAndView initCampReg(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
		
			//할인유형 코드 
			inVar.put("cdGrpCd", "S028");
			inVar.put("useYn", "Y");
			
			Map proCd = commonService.listCommInfo(inVar);
			List listComm		= (List)proCd.get("result");	
			
			DataSetMap codeDsMap = new DataSetMap();
			
			codeDsMap.setRowMaps(listComm);		

			outDataset.put("output", codeDsMap);			
			
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

	
	/*******************************
	 * 상품 조회 팝업(상품명)
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/rtms/sd/listCampProductPop.do") 
	public ModelAndView listCampProductPop(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rTSDCampRegService.listProductInfo(inVar, outDataset);
			
			List listProductPop = (List)result.get("listProductPop");
			
			DataSetMap mapProduct = new DataSetMap();
			
			mapProduct.setRowMaps(listProductPop);
			
			outDataset.put("mapProduct", mapProduct);
			
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
	
	/*******************************
	 * 캠페인 조회
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/rtms/sd/listCampRegInfo.do") 
	public ModelAndView listCampRegInfo(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rTSDCampRegService.listCampRegInfo(inVar, outDataset);
			
			List listCampReg = (List)result.get("listCampRegInfo");
			
			DataSetMap mapCampReg = new DataSetMap();
			
			mapCampReg.setRowMaps(listCampReg);
			
			outDataset.put("mapCampReg", mapCampReg);
			
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
	
	/*******************************
	 * 캠페인 등록(저장)
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("rtms/sd/saveCampRegInfo.do") 
	public ModelAndView saveCampRegInfo(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		Map loginInfo = (Map) req.getSession().getAttribute("User");
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("regId", loginInfo.get("userId")); //사용자 정보
			
			DataSetMap dsm = new DataSetMap();
			Map paramMap = new HashMap();
			paramMap.put(NexacroConstant.DATASET_ROW_TYPE,  1);
			paramMap.put("dvsn", 	"I");
			paramMap.put("dcTp",  	inVar.get("dcTp"));
			paramMap.put("matCd", 	inVar.get("matCd"));
			paramMap.put("strDay", 	inVar.get("strDay"));
			paramMap.put("endDay", 	inVar.get("endDay"));
			paramMap.put("dcRate", 	inVar.get("dcRate"));
			paramMap.put("dcAmt", 	inVar.get("dcAmt"));
			paramMap.put("useYn", 	inVar.get("useYn"));
			
			dsm.add(paramMap);
			inVar.put("inDsMap",  dsm);
			inVar.put("sqlnamespace", "campReg.saveCampRegInfo");
			
			int countNext = rTSDCampRegService.countNext(inVar); //동일상품, 적용일자가 겹치는 할인내역 건수 count
			
			Map result = null;
			if(countNext == 0) {
				result =  rTSDCampRegService.saveCampRegData(inDataset, inVar); //저장
			} else {
				paramMap.remove("dvsn");
				paramMap.put("dvsn", 	"U");
				rTSDCampRegService.updateBeFore(inVar); //동일건 이전 데이터 종료일자를 신규건 시작일 -1로 업데이트
				paramMap.remove("dvsn");
				paramMap.put("dvsn", 	"I");
				result =  rTSDCampRegService.saveCampRegData(inDataset, inVar); //저장
			}
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());

			mav.addObject(NexacroConstant.ERROR_CODE, result.get("successCode")+"");
			mav.addObject(NexacroConstant.ERROR_MSG,  result.get("returnMessage"));		
		
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	/*******************************
	 * 해당상품으로 등록된 계약 건수 count
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/rtms/sd/countRegInfo.do") 
	public ModelAndView countRegInfo(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try
		{
			Map <String, Object> inVar = xpDto.getInVariableMap();
			Map <String, Object> outVar = xpDto.getOutVariableMap();
			
			int countRegInfo = rTSDCampRegService.countRegInfo(inVar); //해당상품으로 등록된 계약 건수 count
				
			outVar.put("countRegInfo", countRegInfo);
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
	
	/*******************************
	 * 상품, 적용일자가 겹치는 할인내역 건수 count
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/rtms/sd/countNext.do") 
	public ModelAndView countNext(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try
		{
			Map <String, Object> inVar = xpDto.getInVariableMap();
			Map <String, Object> outVar = xpDto.getOutVariableMap();
			
			int countNext = rTSDCampRegService.countNext(inVar); //상품, 적용일자가 겹치는 할인내역 건수 count
			
			outVar.put("countNext", countNext);
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


}
