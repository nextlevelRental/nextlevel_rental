/************************************************************************************
 * 1.Program  			: Common DataSet Controller
 * 2.File Name			: RTCMUserController.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History			: 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.sd.controller;

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

import egovframework.ntrms.kr.co.brn.sd.service.RTSDRentalCustLinkService;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;

@Controller
public class RTSDRentalCustLinkController {
	protected Log logger = LogFactory.getLog(this.getClass());

	@Resource(name="rTSDRentalCustLinkService")
	RTSDRentalCustLinkService rTSDRentalCustLinkService;
	
	/************************************
	 * 렌탈지사/지점 목록조회
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 ************************************/
	@RequestMapping("/rtms/sd/listRentalCustLinkMstInfo.do") 
	public ModelAndView listRentalCustLinkMstInfo(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try {
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			logger.debug("===================================================");
			logger.debug(inVar);
			logger.debug("===================================================");
			
			Map paramMap = new HashMap();
			paramMap.put("cdNm",inVar.get("cdNm"));
			
			Map result = rTSDRentalCustLinkService.listRentalCustLinkMstInfo(paramMap);
			List planInfo = (List)result.get("RentalCustLinkMstInfo");
			DataSetMap dsResult = new DataSetMap();
			dsResult.setRowMaps(planInfo);
			
			outDataset.put("ds_output", dsResult);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE, "0");
			mav.addObject(NexacroConstant.ERROR_MSG, "");
		} catch(Exception e) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		
		return mav;
	}
	
	/************************************
	 * 판매인 목록조회
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 ************************************/
	@RequestMapping("/rtms/sd/listRentalCustLinkDtlInfo.do") 
	public ModelAndView listRentalCustLinkDtlInfo(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try {
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map paramMap = new HashMap();
			paramMap.put("grpCd",   inVar.get("grpCd"));
			paramMap.put("cd",      inVar.get("cd"));
			paramMap.put("agencyGbn",inVar.get("agencyGbn"));
			paramMap.put("agencyNm",inVar.get("agencyNm"));
			
			Map result = rTSDRentalCustLinkService.listRentalCustLinkDtlInfo(paramMap);
			List planInfo = (List)result.get("RentalCustLinkDtlInfo");
			DataSetMap dsResult = new DataSetMap();
			dsResult.setRowMaps(planInfo);
			
			outDataset.put("ds_output", dsResult);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE, "0");
			mav.addObject(NexacroConstant.ERROR_MSG, "");
		} catch(Exception e) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		
		return mav;
	}
	
	/************************************
	 * 저장 - 판매인정보
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 ************************************/
	@RequestMapping("/rtms/sd/saveRentalCustLink.do")
	public ModelAndView saveRentalCustLink(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		Map loginInfo = (Map) req.getSession().getAttribute("User");
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset	= xpDto.getInDataSetMap();
			Map <String, DataSetMap> outDataset	= xpDto.getOutDataSetMap();
			
			inVar.put("regId", loginInfo.get("userId"));
			
			Map result =  rTSDRentalCustLinkService.saveRentalCustLink(inDataset, inVar);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			
			mav.addObject(NexacroConstant.ERROR_CODE, result.get("successCode")+"");
			mav.addObject(NexacroConstant.ERROR_MSG,  result.get("returnMessage"));
		} catch(Exception e) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		
		return mav;
	}
	
	/************************************
	 * 미반영판매자 조회
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 ************************************/
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping("ntrms/sd/retrieveUnRlsSelerList.do") 
	public ModelAndView retrieveUnRlsSelerList(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try {
			Map <String, Object> inVar 		   = xpDto.getInVariableMap();
			Map <String, DataSetMap> mapOutDSM = xpDto.getOutDataSetMap();
			
			Map result = rTSDRentalCustLinkService.retrieveUnRlsSelerList(inVar);
			
			List listUnRlsSeler = (List)result.get("listUnRlsSeler");
			
			DataSetMap dsMap = new DataSetMap();
			dsMap.setRowMaps(listUnRlsSeler);
			mapOutDSM.put("dsunRlsSelerList", dsMap);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE, "0");
			mav.addObject(NexacroConstant.ERROR_MSG, "");
		} catch(Exception e) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		
		return mav;
	}
}