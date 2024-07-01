/***********************************************************************************
 * 1.Program  			: Common DataSet Controller
 * 2.File Name			: RTSDSaleItemRegisterController.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
**************************************************************************************/

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
import egovframework.ntrms.kr.co.brn.sd.service.RTSDSaleItemRegisterService;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;

@Controller
public class RTSDSaleItemRegisterController {
	
	protected Log logger = LogFactory.getLog(this.getClass());	

	@Resource(name="rTSDSaleItemRegisterService")
	RTSDSaleItemRegisterService rTSDSaleItemRegisterService;
	
	@Resource(name="commonService")
	CommonService commonService;

	@RequestMapping("/ntrms/sd/saleItemCommCode.do") 
	public ModelAndView saleItemCommCode(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map map = new HashMap();
			map.put("cd", " ");
			map.put("cdNm", "-All-");
			
			//채널구분
			inVar.put("cdGrpCd", "S214");
			inVar.put("useYn", "Y");
			Map dsChanGubun = commonService.listCommInfo(inVar);
			
			//홈쇼핑구분
			inVar.put("cdGrpCd", "S096");
			inVar.put("useYn", "Y");
			Map dsHShopGubun  = commonService.listCommInfo(inVar);
			
			//상품군(렌탈상품구분)
			inVar.put("cdGrpCd", "S205");
			inVar.put("useYn", "Y");
			Map dsPrdtGrpGubun = commonService.listCommInfo(inVar);
			
			//일시납판매
			inVar.put("cdGrpCd", "S212");
			inVar.put("useYn", "Y");
			Map dsFrayYn = commonService.listCommInfo(inVar);
			
			//단체판매구분
			inVar.put("cdGrpCd", "S209");
			inVar.put("useYn", "Y");
			Map dsGrpSaleGb = commonService.listCommInfo(inVar);

			//상품군상세(렌탈상품구분)
			inVar.put("cdGrpCd", "S219");
			inVar.put("useYn", "Y");
			Map dsPrdtGrpDtlGubun = commonService.listCommInfo(inVar);

			//고객유형
			inVar.put("cdGrpCd", "S221");
			inVar.put("useYn", "Y");
			Map dsCustTypeGubun = commonService.listCommInfo(inVar);

			//연령제한
			inVar.put("cdGrpCd", "S222");
			inVar.put("useYn", "Y");
			Map dsAgeLimitGubun = commonService.listCommInfo(inVar);
			
			List listDsChanGubun	= (List)dsChanGubun.get("result");	
			listDsChanGubun.add(0,map);
			
			List listDsHShopGubun	= (List)dsHShopGubun.get("result");
			listDsHShopGubun.add(0,map);
			
			List listDsPrdtGrpGubun	= (List)dsPrdtGrpGubun.get("result");
			
			List listDsFrayYn		= (List)dsFrayYn.get("result");
			
			List listDsGrpSaleGb	= (List)dsGrpSaleGb.get("result");
			
			List listDsPrdtGrpDtl	= (List)dsPrdtGrpDtlGubun.get("result");
			
			List listDsCustType		= (List)dsCustTypeGubun.get("result");
			
			List listDsAgeLimit		= (List)dsAgeLimitGubun.get("result");

			DataSetMap mapDsChanGubun 		= new DataSetMap();
			DataSetMap mapDsHShopGubun 		= new DataSetMap();
			DataSetMap mapDsPrdtGrpGubun 	= new DataSetMap();
			DataSetMap mapDsFrayYn			= new DataSetMap();
			DataSetMap mapDsGrpSaleGb 		= new DataSetMap();
			DataSetMap mapDsPrdtGrpGubunDtl	= new DataSetMap();
			DataSetMap mapDsCustType		= new DataSetMap();
			DataSetMap mapDsAgeLimit		= new DataSetMap();
			
			
			mapDsChanGubun.setRowMaps(listDsChanGubun);
			mapDsHShopGubun.setRowMaps(listDsHShopGubun);
			mapDsPrdtGrpGubun.setRowMaps(listDsPrdtGrpGubun);
			mapDsFrayYn.setRowMaps(listDsFrayYn);
			mapDsGrpSaleGb.setRowMaps(listDsGrpSaleGb);
			mapDsPrdtGrpGubunDtl.setRowMaps(listDsPrdtGrpDtl);
			mapDsCustType.setRowMaps(listDsCustType);
			mapDsAgeLimit.setRowMaps(listDsAgeLimit);
			
			outDataset.put("mapDsChanGubun", mapDsChanGubun);
			outDataset.put("mapDsHShopGubun", mapDsHShopGubun);
			outDataset.put("mapDsPrdtGrpGubun",	mapDsPrdtGrpGubun);
			outDataset.put("mapDsFrayYn", mapDsFrayYn);
			outDataset.put("mapDsGrpSaleGb", mapDsGrpSaleGb);
			outDataset.put("mapDsPrdtGrpGubunDtl", mapDsPrdtGrpGubunDtl);
			outDataset.put("mapDsCustType", mapDsCustType);
			outDataset.put("mapDsAgeLimit", mapDsAgeLimit);
			
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
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/ntrms/sd/saleItemList.do") 
	public ModelAndView saleItemList(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, Object> patternInVar 	= xpDto.getInVariableMap();
			Map <String, Object> saleProdinVar 	= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			@SuppressWarnings("rawtypes")
			
			List li = rTSDSaleItemRegisterService.saleItemList(inVar, outDataset);
			DataSetMap outDsMap = new DataSetMap();
			outDsMap.setRowMaps(li);
			outDataset.put("saleItemOutput", outDsMap);
			
			patternInVar.put("gdsGb", "1");
			List tireLi = rTSDSaleItemRegisterService.saleTirePatternList(patternInVar, outDataset);
			DataSetMap outTireMap = new DataSetMap();
			outTireMap.setRowMaps(tireLi);
			outDataset.put("saleTirePatternOutput", outTireMap);
			
			saleProdinVar.put("gdsGb", "2");
			List saleProdLi = rTSDSaleItemRegisterService.saleSaleProdList(saleProdinVar, outDataset);
			DataSetMap outSaleProdMap = new DataSetMap();
			outSaleProdMap.setRowMaps(saleProdLi);
			outDataset.put("saleProdListOutput", outSaleProdMap);
			
			List primServiceLi = rTSDSaleItemRegisterService.salePrimServiceList(inVar, outDataset);
			DataSetMap outPrimServiceMap = new DataSetMap();
			outPrimServiceMap.setRowMaps(primServiceLi);
			outDataset.put("salePrimServiceOutput", outPrimServiceMap);
			
			List regAmtLi = rTSDSaleItemRegisterService.saleRegAmtList(inVar, outDataset);
			DataSetMap outRegAmtMap = new DataSetMap();
			outRegAmtMap.setRowMaps(regAmtLi);
			outDataset.put("saleRegAmtOutput", outRegAmtMap);
			
			List exemptionLi = rTSDSaleItemRegisterService.saleExemptiontList(inVar, outDataset);
			DataSetMap outExempMap = new DataSetMap();
			outExempMap.setRowMaps(exemptionLi);
			outDataset.put("saleExempOutput", outExempMap);

			//채널구분 조회(기존정보 조회, 추가조회는 별로 method호출)
			List chnList = rTSDSaleItemRegisterService.saleExistingChnList(inVar, outDataset);
			DataSetMap outChnListMap = new DataSetMap();
			outChnListMap.setRowMaps(chnList);			
			outDataset.put("saleChnOutput", outChnListMap);			
			
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

	@RequestMapping("/ntrms/sd/saleRegiAmtInfo.do") 
	public ModelAndView saleRegiAmtInfo(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map map = new HashMap();
			map.put("cd", " ");
			map.put("cdNm", "-All-");
			
			Map dsSaleRegiAmt = rTSDSaleItemRegisterService.listSaleRegAmtInfo(inVar);
			List listDsSaleRegiAmt	= (List)dsSaleRegiAmt.get("result");
			listDsSaleRegiAmt.add(0,map);
			DataSetMap mapDsSaleRegiAmt 		= new DataSetMap();
			mapDsSaleRegiAmt.setRowMaps(listDsSaleRegiAmt);
			outDataset.put("mapDsSaleRegiAmt", mapDsSaleRegiAmt);
			
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

	
	@RequestMapping("/ntrms/sd/saleItemSaveDaset.do") 
	public ModelAndView saleItemSaveDaset(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		
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
			
			Map result = rTSDSaleItemRegisterService.saveSaleItemInfo(inDataset, inVar);
			
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

	@RequestMapping("/ntrms/sd/maxSaleCd.do") 
	public ModelAndView maxSaleCd(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, Object> outVal			= xpDto.getOutVariableMap();
			
			String maxSaleCd = (String)rTSDSaleItemRegisterService.maxSaleCd(inVar);
			
			outVal.put("maxSaleCd", maxSaleCd);
			
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
	@RequestMapping("/ntrms/sd/saveTireDetail.do") 
	public ModelAndView saveTireDetail(NexacroMapDTO xpDto, HttpServletRequest req) throws Exception {
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
			Map result = rTSDSaleItemRegisterService.saveTireDetail(inDataset, inVar);
							
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

	
	//채널 조회[추가]
	@SuppressWarnings("unchecked")
	@RequestMapping("/ntrms/sd/saleChnList.do") 
	public ModelAndView saleChnList(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			@SuppressWarnings("rawtypes")
					
			List regAmtLi = rTSDSaleItemRegisterService.saleChnList(inVar, outDataset);
			DataSetMap outRegAmtMap = new DataSetMap();
			outRegAmtMap.setRowMaps(regAmtLi);
			outDataset.put("saleChnOutput", outRegAmtMap);
			
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

	//필터조회
	@SuppressWarnings("unchecked")
	@RequestMapping("/ntrms/sd/saleChannelFilter.do") 
	public ModelAndView saleChannelFilter(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			@SuppressWarnings("rawtypes")
					
			List regAmtLi = rTSDSaleItemRegisterService.saleChannelFilter(inVar, outDataset);
			DataSetMap outRegAmtMap = new DataSetMap();
			outRegAmtMap.setRowMaps(regAmtLi);
			outDataset.put("saleChnOutput", outRegAmtMap);
			
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
	
	//채널 상세조회[추가]
	@SuppressWarnings("unchecked")
	@RequestMapping("/ntrms/sd/saleChnDtl.do") 
	public ModelAndView saleChnDtl(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			@SuppressWarnings("rawtypes")

			Map paramMap = new HashMap();
			paramMap.put("pChanCd",inVar.get("pChanCd"));			
			
			List regAmtLi = rTSDSaleItemRegisterService.saleChnDtl(paramMap, outDataset);
			DataSetMap outRegAmtMap = new DataSetMap();
			outRegAmtMap.setRowMaps(regAmtLi);
			outDataset.put("saleChnDtlOutput", outRegAmtMap);
			
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
	
	//채널 상세조회 - 기존
	@SuppressWarnings("unchecked")
	@RequestMapping("/ntrms/sd/exclusiveList.do") 
	public ModelAndView exclusiveList(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			@SuppressWarnings("rawtypes")

			Map paramMap = new HashMap();
			paramMap.put("saleCd",inVar.get("saleCd"));
			paramMap.put("pChanCd",inVar.get("pChanCd"));			
			
			List regAmtLi = rTSDSaleItemRegisterService.exclusiveList(paramMap, outDataset);
			DataSetMap outRegAmtMap = new DataSetMap();
			outRegAmtMap.setRowMaps(regAmtLi);
			outDataset.put("saleChnDtlOutput", outRegAmtMap);
			
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
