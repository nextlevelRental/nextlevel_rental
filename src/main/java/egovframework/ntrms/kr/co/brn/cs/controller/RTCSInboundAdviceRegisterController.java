/************************************************************************************
 * 1.Program  			: Common DataSet Controller
 * 2.File Name			: RTCMUserController.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.cs.controller;

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
import egovframework.ntrms.kr.co.brn.cs.service.RTCSInboundAdviceRegisterService;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;

@Controller
public class RTCSInboundAdviceRegisterController {
	protected Log logger = LogFactory.getLog(this.getClass());
	@Resource(name="rTCSInboundAdviceRegisterService")
	RTCSInboundAdviceRegisterService rTCSInboundAdviceRegisterService;
	
	@Resource(name="commonService")
	CommonService commonService;
	
	@RequestMapping("/rtms/cs/initRTCSInboundAdviceRegister.do") 
	public ModelAndView initRTSDCarMasterRegister(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("cdGrpCd", "H005");
			inVar.put("useYn", "Y");
			Map dsRecvTp = commonService.listCommInfo(inVar);
			List listDsRecvTp = (List)dsRecvTp.get("result");	
			DataSetMap mapDsRecvTp = new DataSetMap();
			mapDsRecvTp.setRowMaps(listDsRecvTp);
			outDataset.put("mapDsRecvTp", mapDsRecvTp);
			
			Map sRtcs0103RegionResult = rTCSInboundAdviceRegisterService.sRtcs0103Region(inVar, outDataset);
			List sRtcs0103Region = (List)sRtcs0103RegionResult.get("sRtcs0103Region");
			DataSetMap sRtcs0103RegionMap = new DataSetMap();
			sRtcs0103RegionMap.setRowMaps(sRtcs0103Region);
			outDataset.put("sRtcs0103RegionMap", sRtcs0103RegionMap);
			
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
	
	@RequestMapping("/rtms/cs/sRtcs0103City.do") 
	public ModelAndView sRtcs0103City(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map sRtcs0103CityResult = rTCSInboundAdviceRegisterService.sRtcs0103City(inVar, outDataset);
			List sRtcs0103City = (List)sRtcs0103CityResult.get("sRtcs0103City");
			DataSetMap sRtcs0103CityMap = new DataSetMap();
			sRtcs0103CityMap.setRowMaps(sRtcs0103City);
			outDataset.put("sRtcs0103CityMap", sRtcs0103CityMap);
			
			
			
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
	
	@RequestMapping("/rtms/cs/selectRTCSInboundAdviceRegister.do") 
	public ModelAndView selectRTCSInboundAdviceRegister(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map sRtcs0102CtfResult = rTCSInboundAdviceRegisterService.sRtcs0102Ctf(inVar, outDataset);
			List sRtcs0102Ctf = (List)sRtcs0102CtfResult.get("sRtcs0102Ctf");
			DataSetMap sRtcs0102CtfMap = new DataSetMap();
			sRtcs0102CtfMap.setRowMaps(sRtcs0102Ctf);
			outDataset.put("sRtcs0102CtfMap", sRtcs0102CtfMap);
			
			Map sRtcs0102ObfResult = rTCSInboundAdviceRegisterService.sRtcs0102Obf(inVar, outDataset);
			List sRtcs0102Obf = (List)sRtcs0102ObfResult.get("sRtcs0102Obf");
			DataSetMap sRtcs0102ObfMap = new DataSetMap();
			sRtcs0102ObfMap.setRowMaps(sRtcs0102Obf);
			outDataset.put("sRtcs0102ObfMap", sRtcs0102ObfMap);
			
			
			Map sRtcs0102IbfResult = rTCSInboundAdviceRegisterService.sRtcs0102Ibf(inVar, outDataset);
			List sRtcs0102Ibf = (List)sRtcs0102IbfResult.get("sRtcs0102Ibf");
			DataSetMap sRtcs0102IbfMap = new DataSetMap();
			sRtcs0102IbfMap.setRowMaps(sRtcs0102Ibf);
			outDataset.put("sRtcs0102IbfMap", sRtcs0102IbfMap);
			
			
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
	
	@RequestMapping("/rtms/cs/selectRTCSInboundAdviceDetail.do") 
	public ModelAndView selectRTCSInboundAdviceDetail(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map sRtcs0102ObfResult = rTCSInboundAdviceRegisterService.sRtcs0102Obf(inVar, outDataset);
			List sRtcs0102Obf = (List)sRtcs0102ObfResult.get("sRtcs0102Obf");
			DataSetMap sRtcs0102ObfMap = new DataSetMap();
			sRtcs0102ObfMap.setRowMaps(sRtcs0102Obf);
			outDataset.put("sRtcs0102ObfMap", sRtcs0102ObfMap);

			
			Map sRtcs0102IbfResult = rTCSInboundAdviceRegisterService.sRtcs0102Ibf(inVar, outDataset);
			List sRtcs0102Ibf = (List)sRtcs0102IbfResult.get("sRtcs0102Ibf");
			DataSetMap sRtcs0102IbfMap = new DataSetMap();
			sRtcs0102IbfMap.setRowMaps(sRtcs0102Ibf);
			outDataset.put("sRtcs0102IbfMap", sRtcs0102IbfMap);
			
			
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
	
	@RequestMapping("/rtms/cs/saveRTCSInboundAdviceRegister.do") 
	public ModelAndView saveRTCSInboundAdviceRegister(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		Map loginInfo = (Map) req.getSession().getAttribute("User");
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		Map result = null;
		try
		{
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, Object> outVar 		= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("regId", loginInfo.get("userId"));
			result = rTCSInboundAdviceRegisterService.saveRTCSInboundAdviceRegister(inDataset, inVar);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			
			mav.addObject(NexacroConstant.ERROR_CODE, result.get("successCode")+"");
			mav.addObject(NexacroConstant.ERROR_MSG,  result.get("returnMessage"));
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, result.get("returnMessage"));
		}
		return mav;
	}
	
	@RequestMapping("/rtms/cs/selectSysdate.do") 
	public ModelAndView selectSysdate(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, Object> outVal			= xpDto.getOutVariableMap();
			
			String selectSysdate = (String)rTCSInboundAdviceRegisterService.selectSysdate(inVar);
			outVal.put("selectSysdate", selectSysdate);
			
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
	
	@RequestMapping("/rtms/cs/qusUpdateRTCS.do") 
	public ModelAndView qusUpdateRTCSInboundAdviceRegister(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		Map loginInfo = (Map) req.getSession().getAttribute("User");
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		Map result = null;
		try
		{
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, Object> outVar 		= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("regId", loginInfo.get("userId"));
			result = rTCSInboundAdviceRegisterService.qusUpdateRTCSInboundAdviceRegister(inDataset, inVar);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			
			mav.addObject(NexacroConstant.ERROR_CODE, result.get("successCode")+"");
			mav.addObject(NexacroConstant.ERROR_MSG,  result.get("returnMessage"));
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, result.get("returnMessage"));
		}
		return mav;
	}
}
