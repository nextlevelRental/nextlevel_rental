/************************************************************************************
 * 1.Program  			: Common DataSet Controller
 * 2.File Name			: RTCMMenuController.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.cm.controller;

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

import egovframework.ntrms.kr.co.brn.cm.service.RTCMMenuService;
import egovframework.ntrms.kr.co.brn.comm.service.CommonService;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;

@Controller
public class RTCMMenuController {
	
	protected Log logger = LogFactory.getLog(this.getClass());	

	@Resource(name="rTCMMenuService")
	RTCMMenuService rTCMMenuService;
	
	@Resource(name="commonService")
	CommonService commonService;
	
	@RequestMapping("/ntrms/cm/listTreeMenu.do") 
	public ModelAndView listTreeMenu(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rTCMMenuService.listTreeMenu(inVar, outDataset);
			
			//콤보에 선택항목 추가
			Map map = new HashMap();
			map.put("cd","");
			map.put("cdNm","선택");
			
			//메뉴관리 조회기준 코드
			inVar.put("cdGrpCd", "C006");
			inVar.put("useYn", "Y");
			
			Map rsMenuCd = commonService.listCommInfo(inVar);
			
			//모듈코드 
			inVar.put("cdGrpCd", "C003");
			inVar.put("useYn", "Y");				
			
			Map rsMdlCd = commonService.listCommInfo(inVar);
			
			//사용여부코드
			inVar.put("cdGrpCd", "C004");
			inVar.put("useYn", "Y");				
			
			Map rsUseYnCd = commonService.listCommInfo(inVar);			
			
			List listTreeMenu	= (List)result.get("listTreeMenu");
			List listComm2		= (List)rsMenuCd.get("result");		
			List listComm3		= (List)rsMdlCd.get("result");		
			List listComm4		= (List)rsUseYnCd.get("result");					
			
			//선택항목 추가
			listComm2.add(0, map);

			DataSetMap menuDsMap = new DataSetMap();
			DataSetMap codeDsMap2 = new DataSetMap();
			DataSetMap codeDsMap3 = new DataSetMap();			
			DataSetMap codeDsMap4 = new DataSetMap();	
			
			menuDsMap.setRowMaps(listTreeMenu);
			codeDsMap2.setRowMaps(listComm2);			
			codeDsMap3.setRowMaps(listComm3);				
			codeDsMap4.setRowMaps(listComm4);		

			outDataset.put("output",	menuDsMap);
			outDataset.put("output2",	codeDsMap2);		
			outDataset.put("output3",	codeDsMap3);					
			outDataset.put("output4",	codeDsMap4);					
			
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
	
	@RequestMapping("/ntrms/cm/listMenu.do") 
	public ModelAndView listMenu(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rTCMMenuService.listMenu(inVar, outDataset);
			
			List listMenu	= (List)result.get("listMenu");

			DataSetMap menuDsMap = new DataSetMap();
			menuDsMap.setRowMaps(listMenu);


			outDataset.put("output",	menuDsMap);
			
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
	
	/********************
	 * 메뉴코드 중복확인
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 *********************/
	
	@RequestMapping("/ntrms/cm/checkMenuCdExists.do") 
	public ModelAndView checkIdExists(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, Object> outVal			= xpDto.getOutVariableMap();
			
			//메뉴코드 중복여부 조회
			int idx = (int)rTCMMenuService.checkMenuCdExists(inVar);
			
			outVal.put("resultCnt", idx);
			outVal.put("chkMenuCd", inVar.get("menuCd"));
			
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
	
	@RequestMapping("/ntrms/cm/saveMenuInfo.do") 
	public ModelAndView saveMenuInfo(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map loginInfo = (Map) req.getSession().getAttribute("User");
			
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, Object> outVar 		= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();

			inVar.put("regId", loginInfo.get("userId"));
			Map result =  rTCMMenuService.saveMenuInfo(inDataset, inVar);

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
}
