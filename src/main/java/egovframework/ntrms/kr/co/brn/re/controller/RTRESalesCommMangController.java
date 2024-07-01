package egovframework.ntrms.kr.co.brn.re.controller;
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
import egovframework.ntrms.kr.co.brn.re.service.RTRESalesCommMangService;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;

@Controller
public class RTRESalesCommMangController {
	protected Log logger = LogFactory.getLog(this.getClass());	
	@Resource(name="rTRESalesCommMangService")
	RTRESalesCommMangService rTRESalesCommMangService;
	
	@Resource(name="commonService")
	CommonService commonService;

	@RequestMapping("/rtms/re/RTRESalesCommMang_tab1.do") 
	public ModelAndView RTRESalesCommMang_tab1(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("cdGrpCd", "C004");
			inVar.put("useYn", "Y");
			Map dsUseYn = commonService.listCommInfo(inVar);
			List listDsUseYn = (List)dsUseYn.get("result");
			DataSetMap mapDsUseYn = new DataSetMap();
			mapDsUseYn.setRowMaps(listDsUseYn);
			outDataset.put("mapDsUseYn", mapDsUseYn);
			
			inVar.put("cdGrpCd", "S030");
			inVar.put("useYn", "Y");
			Map dsChanCd = commonService.listCommInfo(inVar);
			List listDsChanCd = (List)dsChanCd.get("result");
			
			DataSetMap mapDsChanCdSelect = new DataSetMap();
			mapDsChanCdSelect.setRowMaps(listDsChanCd);
			outDataset.put("mapDsChanCdSelect", mapDsChanCdSelect);
			
			DataSetMap mapDsChanCdInsert = new DataSetMap();
			mapDsChanCdInsert.setRowMaps(listDsChanCd);
			outDataset.put("mapDsChanCdInsert",mapDsChanCdInsert);
			
			// 2016-04-15 이영근, 채널 대분류,중분류 가져옴
			inVar.put("cdGrpCd", "S090");
			inVar.put("useYn", "Y");
			Map dsChanLclsCd = commonService.listCommInfo(inVar);
			List listDsChanLclsCd = (List)dsChanLclsCd.get("result");	
			DataSetMap mapDsChanLclsCd = new DataSetMap();
			mapDsChanLclsCd.setRowMaps(listDsChanLclsCd);
			outDataset.put("mapDsChanLclsCd", mapDsChanLclsCd);
			
			inVar.put("cdGrpCd", "S091");
			inVar.put("useYn", "Y");
			Map dsChanMclsCd = commonService.listCommInfo(inVar);
			List listDsChanMclsCd = (List)dsChanMclsCd.get("result");	
			DataSetMap mapDsChanMclsCd = new DataSetMap();
			mapDsChanMclsCd.setRowMaps(listDsChanMclsCd);
			outDataset.put("mapDsChanMclsCd", mapDsChanMclsCd);			
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE, "0");
			mav.addObject(NexacroConstant.ERROR_MSG, "");
		}catch ( Exception e ){
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	@RequestMapping("/rtms/re/selectRTRESalesCommMang.do") 
	public ModelAndView selectRTRESalesCommMang(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try {
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rTRESalesCommMangService.selectRTRESalesCommMang(inVar);
			List list = (List)result.get("selectRTRESalesCommMang");
			DataSetMap outList = new DataSetMap();
			outList.setRowMaps(list);
			outDataset.put("outList", outList);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE, "0");
			mav.addObject(NexacroConstant.ERROR_MSG, "");
		}catch(Exception e){
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	@RequestMapping("rtms/re/saveRTRESalesCommMang.do") 
	public ModelAndView saveRTRESalesCommMang(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		Map loginInfo = (Map) req.getSession().getAttribute("User");
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("regId", loginInfo.get("userId"));
			Map result =  rTRESalesCommMangService.saveRTRESalesCommMang(inDataset, inVar);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE, result.get("successCode")+"");
			mav.addObject(NexacroConstant.ERROR_MSG,  result.get("returnMessage"));
		}catch( Exception e ){
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	@RequestMapping("/rtms/re/RTRESalesCommMangOpenMall.do") 
	public ModelAndView RTRESalesCommMangOpenMall(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("cdGrpCd", "C004");
			inVar.put("useYn", "Y");
			Map dsUseYn = commonService.listCommInfo(inVar);
			List listDsUseYn = (List)dsUseYn.get("result");
			DataSetMap mapDsUseYn = new DataSetMap();
			mapDsUseYn.setRowMaps(listDsUseYn);
			outDataset.put("mapDsUseYn", mapDsUseYn);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE, "0");
			mav.addObject(NexacroConstant.ERROR_MSG, "");
		}catch ( Exception e ){
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	@RequestMapping("/rtms/re/selectRTRESalesCommMangOpenMall.do") 
	public ModelAndView selectRTRESalesCommMangOpenMall(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try {
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rTRESalesCommMangService.selectRTRESalesCommMangOpenMall(inVar);
			List list = (List)result.get("selectRTRESalesCommMangOpenMall");
			DataSetMap outList = new DataSetMap();
			outList.setRowMaps(list);
			outDataset.put("outList", outList);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE, "0");
			mav.addObject(NexacroConstant.ERROR_MSG, "");
		}catch(Exception e){
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	@RequestMapping("rtms/re/saveRTRESalesCommMangOpenMall.do") 
	public ModelAndView saveRTRESalesCommMangOpenMall(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		Map loginInfo = (Map) req.getSession().getAttribute("User");
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("regId", loginInfo.get("userId"));
			Map result =  rTRESalesCommMangService.saveRTRESalesCommMangOpenMall(inDataset, inVar);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE, result.get("successCode")+"");
			mav.addObject(NexacroConstant.ERROR_MSG,  result.get("returnMessage"));
		}catch( Exception e ){
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	@RequestMapping("/rtms/re/RTREInstallCommMang_tab1.do") 
	public ModelAndView RTREInstallCommMang_tab1(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("cdGrpCd", "C004");
			inVar.put("useYn", "Y");
			Map dsUseYn = commonService.listCommInfo(inVar);
			List listDsUseYn = (List)dsUseYn.get("result");
			DataSetMap mapDsUseYn = new DataSetMap();
			mapDsUseYn.setRowMaps(listDsUseYn);
			outDataset.put("mapDsUseYn", mapDsUseYn);
			
			// 2016-04-15 이영근, 채널 대분류,중분류 가져옴
			inVar.put("cdGrpCd", "S090");
			inVar.put("useYn", "Y");
			Map dsChanLclsCd = commonService.listCommInfo(inVar);
			List listDsChanLclsCd = (List)dsChanLclsCd.get("result");	
			DataSetMap mapDsChanLclsCd = new DataSetMap();
			mapDsChanLclsCd.setRowMaps(listDsChanLclsCd);
			outDataset.put("mapDsChanLclsCd", mapDsChanLclsCd);
			
			inVar.put("cdGrpCd", "S091");
			inVar.put("useYn", "Y");
			Map dsChanMclsCd = commonService.listCommInfo(inVar);
			List listDsChanMclsCd = (List)dsChanMclsCd.get("result");	
			DataSetMap mapDsChanMclsCd = new DataSetMap();
			mapDsChanMclsCd.setRowMaps(listDsChanMclsCd);
			outDataset.put("mapDsChanMclsCd", mapDsChanMclsCd);			
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE, "0");
			mav.addObject(NexacroConstant.ERROR_MSG, "");
		}catch ( Exception e ){
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	@RequestMapping("/rtms/re/selectRTREInstallCommMang.do") 
	public ModelAndView selectRTREInstallCommMang(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try {
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rTRESalesCommMangService.selectRTREInstallCommMang(inVar);
			List list = (List)result.get("selectRTREInstallCommMang");
			DataSetMap outList = new DataSetMap();
			outList.setRowMaps(list);
			outDataset.put("outList", outList);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE, "0");
			mav.addObject(NexacroConstant.ERROR_MSG, "");
		}catch(Exception e){
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	@RequestMapping("rtms/re/saveRTREInstallCommMang.do") 
	public ModelAndView saveRTREInstallCommMang(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		Map loginInfo = (Map) req.getSession().getAttribute("User");
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("regId", loginInfo.get("userId"));
			Map result =  rTRESalesCommMangService.saveRTREInstallCommMang(inDataset, inVar);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE, result.get("successCode")+"");
			mav.addObject(NexacroConstant.ERROR_MSG,  result.get("returnMessage"));
		}catch( Exception e ){
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	@RequestMapping("/rtms/re/RTREServiceCommMang_tab1.do") 
	public ModelAndView RTREServiceCommMang_tab1(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("cdGrpCd", "C004");
			inVar.put("useYn", "Y");
			Map dsUseYn = commonService.listCommInfo(inVar);
			List listDsUseYn = (List)dsUseYn.get("result");
			DataSetMap mapDsUseYn = new DataSetMap();
			mapDsUseYn.setRowMaps(listDsUseYn);
			outDataset.put("mapDsUseYn", mapDsUseYn);
			
			inVar.put("cdGrpCd", "S015");
			inVar.put("useYn", "Y");
			Map dsS015 = commonService.listCommInfo(inVar);
			List listDsS015 = (List)dsS015.get("result");
			DataSetMap mapDsS015 = new DataSetMap();
			mapDsS015.setRowMaps(listDsS015);
			outDataset.put("mapDsS015", mapDsS015);
			
			inVar.put("cdGrpCd", "S044");
			inVar.put("useYn", "Y");
			Map dsS044 = commonService.listCommInfo(inVar);
			List listDsS044 = (List)dsS044.get("result");
			
			DataSetMap mapDsS044Select = new DataSetMap();
			mapDsS044Select.setRowMaps(listDsS044);
			outDataset.put("mapDsS044Select", mapDsS044Select);
			
			DataSetMap mapDsS044Insert = new DataSetMap();
			mapDsS044Insert.setRowMaps(listDsS044);
			outDataset.put("mapDsS044Insert", mapDsS044Insert);
			
			// 2016-04-15 이영근, 채널 대분류,중분류 가져옴
			inVar.put("cdGrpCd", "S090");
			inVar.put("useYn", "Y");
			Map dsChanLclsCd = commonService.listCommInfo(inVar);
			List listDsChanLclsCd = (List)dsChanLclsCd.get("result");	
			DataSetMap mapDsChanLclsCd = new DataSetMap();
			mapDsChanLclsCd.setRowMaps(listDsChanLclsCd);
			outDataset.put("mapDsChanLclsCd", mapDsChanLclsCd);
			
			inVar.put("cdGrpCd", "S091");
			inVar.put("useYn", "Y");
			Map dsChanMclsCd = commonService.listCommInfo(inVar);
			List listDsChanMclsCd = (List)dsChanMclsCd.get("result");	
			DataSetMap mapDsChanMclsCd = new DataSetMap();
			mapDsChanMclsCd.setRowMaps(listDsChanMclsCd);
			outDataset.put("mapDsChanMclsCd", mapDsChanMclsCd);
			
			inVar.put("cdGrpCd", "S309");
			inVar.put("useYn", "Y");
			Map dsCarTypeCd = commonService.listCommInfo(inVar);
			List listDsCarTypeCd = (List)dsCarTypeCd.get("result");	
			DataSetMap mapDsCarTypeCd = new DataSetMap();
			mapDsCarTypeCd.setRowMaps(listDsCarTypeCd);
			outDataset.put("mapDsCarTypeCd", mapDsCarTypeCd);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE, "0");
			mav.addObject(NexacroConstant.ERROR_MSG, "");
		}catch ( Exception e ){
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	@RequestMapping("/rtms/re/selectRTREServiceCommMang.do") 
	public ModelAndView selectRTREServiceCommMang(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try {
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rTRESalesCommMangService.selectRTREServiceCommMang(inVar);
			List list = (List)result.get("selectRTREServiceCommMang");
			DataSetMap outList = new DataSetMap();
			outList.setRowMaps(list);
			outDataset.put("outList", outList);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE, "0");
			mav.addObject(NexacroConstant.ERROR_MSG, "");
		}catch(Exception e){
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	@RequestMapping("rtms/re/saveRTREServiceCommMang.do") 
	public ModelAndView saveRTREServiceCommMang(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		Map loginInfo = (Map) req.getSession().getAttribute("User");
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("regId", loginInfo.get("userId"));
			Map result =  rTRESalesCommMangService.saveRTREServiceCommMang(inDataset, inVar);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE, result.get("successCode")+"");
			mav.addObject(NexacroConstant.ERROR_MSG,  result.get("returnMessage"));
		}catch( Exception e ){
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	
	@RequestMapping("/ntrms/re/rtreSalesChargeInsentive.do") 
	public ModelAndView rtreSalesChargeInsentive(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		
     ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map loginInfo = (Map) req.getSession().getAttribute("User");
			
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, Object> outVar 		= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			DataSetMap dsm = new DataSetMap();
			Map paramMap = new HashMap();
			paramMap.put(NexacroConstant.DATASET_ROW_TYPE,  1);
			paramMap.put("period"	, (String)inVar.get("period"));	//기준일자(마감월)
			dsm.add(paramMap);
			inVar.put("inDsMap",  dsm);
			
			inVar.put("regId", loginInfo.get("userId"));  //등록자 ID	
			
			System.out.println("등록자ID" + loginInfo.get("userId")); 
			
			Map result =  rTRESalesCommMangService.rtreSalesChargeInsentive(inDataset, inVar);
			
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
