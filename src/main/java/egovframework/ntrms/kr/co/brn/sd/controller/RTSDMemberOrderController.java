package egovframework.ntrms.kr.co.brn.sd.controller;

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

import egovframework.ntrms.kr.co.brn.sd.service.RTSDMemberOrderService;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;

@Controller
public class RTSDMemberOrderController {
	protected Log logger = LogFactory.getLog(this.getClass());	

	@Resource(name="rTSDMemberOrderService")
	RTSDMemberOrderService rTSDMemberOrderService;
	
	@RequestMapping("/rtms/sd/MemberOrderCombo.do") 
	public ModelAndView MemberOrderCombo(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("cdGrpCd", "S078");
			inVar.put("useYn", "Y");
			Map dsMatCd = rTSDMemberOrderService.listCommInfo(inVar); 
			
			inVar.put("cdGrpCd", "S021");
			inVar.put("useYn", "Y");
			Map dsPeriod = rTSDMemberOrderService.listCommInfo(inVar);
			
			inVar.put("cdGrpCd", "S022");
			inVar.put("useYn", "Y");
			Map dsCnt = rTSDMemberOrderService.listCommInfo(inVar);
			
			List listMatCd	= (List)dsMatCd.get("result");
			List listPeriod	= (List)dsPeriod.get("result");	
			List listCnt	= (List)dsCnt.get("result");
			
			DataSetMap mapMatCd = new DataSetMap();
			DataSetMap mapPeriod = new DataSetMap();
			DataSetMap mapCnt = new DataSetMap();
			
			mapMatCd.setRowMaps(listMatCd);
			mapPeriod.setRowMaps(listPeriod);
			mapCnt.setRowMaps(listCnt);
			
			outDataset.put("mapMatCd",		mapMatCd);
			outDataset.put("mapPeriod",		mapPeriod);
			outDataset.put("mapCnt",		mapCnt);
			
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
	
	
	@RequestMapping("/rtms/sd/saveMemberOrder.do") 
	public ModelAndView saveMemberOrder(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		Map loginInfo = (Map) req.getSession().getAttribute("User");
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, Object> outVar 		= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("regId", loginInfo.get("userId"));
			Map result =  rTSDMemberOrderService.saveMemberOrder(inDataset, inVar);
			outVar.put("resultOrdNo", result.get("ordNo"));
		
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
	 * 계약번호별 상품정보조회 조회팝업
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/rtms/sd/listAddSelProduct2.do") 
	public ModelAndView listAddSelProduct2(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		 
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rTSDMemberOrderService.listAddSelProduct2(inVar);
			
			List listAddSelProduct2	= (List)result.get("result");
			
			//사용자정보조회
			DataSetMap userDsMap = new DataSetMap();
			userDsMap.setRowMaps(listAddSelProduct2);
			
			outDataset.put("listAddSelProduct2",	userDsMap);
			
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
	
	@RequestMapping("/rtms/sd/getcheckOrdNo.do") 
	public ModelAndView getcheckOrdNo(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		Map loginInfo = (Map) req.getSession().getAttribute("User");
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, Object> outVal			= xpDto.getOutVariableMap();
			String getcheckOrdNo = (String)rTSDMemberOrderService.getcheckOrdNo(inVar);
			outVal.put("getcheckOrdNo",getcheckOrdNo);
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
