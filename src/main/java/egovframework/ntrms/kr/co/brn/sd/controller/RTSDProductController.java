/************************************************************************************
 * 1.Program  			: Common DataSet Controller
 * 2.File Name			: RTCMUserController.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
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

import egovframework.ntrms.kr.co.brn.comm.service.CommonService;
import egovframework.ntrms.kr.co.brn.sd.service.RTSDProductService;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;

@Controller
public class RTSDProductController {
	
	protected Log logger = LogFactory.getLog(this.getClass());	

	@Resource(name="commonService")
	CommonService commonService;
	
	@Resource(name="rTSDProductService")
	RTSDProductService rTSDProductService;
	
	/************************************
	 * 상품정보 상세조회
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 ************************************/
	@RequestMapping("/rtms/sd/getCommSeason.do") 
	public ModelAndView getCommSeason(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try {
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			//계절구분코드 조회
			inVar.put("cdGrpCd", "S014");
			inVar.put("useYn", "Y");
			Map season = commonService.listCommInfo(inVar);
			List listComm1	= (List)season.get("result");	
			
			DataSetMap dsplanInfo = new DataSetMap();
			dsplanInfo.setRowMaps(listComm1);
			
			outDataset.put("ds_output", dsplanInfo);
			
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
	
	
	/************************************
	 * 상품정보 상세조회
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 ************************************/
	@RequestMapping("/rtms/sd/detailProductInfo.do") 
	public ModelAndView detailProductInfo(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try {
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map result = rTSDProductService.detailProductInfo(inVar);
			List planInfo = (List)result.get("productList");
			DataSetMap dsplanInfo = new DataSetMap();
			dsplanInfo.setRowMaps(planInfo);
			
			outDataset.put("ds_output", dsplanInfo);
			
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
	
	//계좌저장
	@RequestMapping("rtms/sd/saveProductInfo.do") 
	public ModelAndView saveProductInfo(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		Map loginInfo = (Map) req.getSession().getAttribute("User");
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("regId", loginInfo.get("userId"));
			
			Map result =  rTSDProductService.saveProductInfo(inDataset, inVar);
			
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
	
	//패키지대상 업데이트 
		@RequestMapping("rtms/sd/saveOrderNo.do") 
		public ModelAndView saveOrderNo(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
			Map loginInfo = (Map) req.getSession().getAttribute("User");
			ModelAndView mav = new ModelAndView("nexacroMapView");
			try
			{
				DataSetMap tranInfo 				= xpDto.getTranInfoMap();
				Map <String, Object> inVar 			= xpDto.getInVariableMap();
				Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
				Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
				
				inVar.put("regId", loginInfo.get("userId"));
				
				Map result =  rTSDProductService.saveOrderNo(inDataset, inVar);
				
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
		
		@RequestMapping("/rtms/sd/TopMenuNoList.do") 
		public ModelAndView TopMenuNoList(NexacroMapDTO xpDto, Model model) throws Exception {
			ModelAndView mav = new ModelAndView("nexacroMapView");
			try {
				Map <String, Object> inVar 			= xpDto.getInVariableMap();
				Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
				
				Map result = rTSDProductService.TopMenuNoList(inVar);
				
				List TopMenuNoList	= (List)result.get("result");
				
				//사용자정보조회
				DataSetMap userDsMap = new DataSetMap();
				userDsMap.setRowMaps(TopMenuNoList);

				outDataset.put((String)inVar.get("nodeNm"),	userDsMap);
				
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
		
		@RequestMapping("/rtms/sd/TopMenuNoList2.do") 
		public ModelAndView TopMenuNoList2(NexacroMapDTO xpDto, Model model) throws Exception {
			ModelAndView mav = new ModelAndView("nexacroMapView");
			try {
				Map <String, Object> inVar 			= xpDto.getInVariableMap();
				Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
				
				Map result = rTSDProductService.TopMenuNoList2(inVar);
				
				List TopMenuNoList2	= (List)result.get("result");
				
				//사용자정보조회
				DataSetMap userDsMap = new DataSetMap();
				userDsMap.setRowMaps(TopMenuNoList2);

				outDataset.put((String)inVar.get("nodeNm"),	userDsMap);
				
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
		
		//패키지대상 업데이트 
		@RequestMapping("rtms/sd/saveOrderNo2.do") 
		public ModelAndView saveOrderNo2(NexacroMapDTO xpDto, HttpServletRequest req) throws Exception {
			ModelAndView mav = new ModelAndView("nexacroMapView");
			Map loginInfo = (Map) req.getSession().getAttribute("User");
			try
			{
				
				DataSetMap tranInfo 				= xpDto.getTranInfoMap();
				Map <String, Object> inVar 			= xpDto.getInVariableMap();
				Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
				Map <String, Object> outVar 		= xpDto.getOutVariableMap();
				Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
				
				inVar.put("regId", loginInfo.get("userId"));
				
				Map result = rTSDProductService.saveOrderNo2(inDataset, inVar);
								
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
