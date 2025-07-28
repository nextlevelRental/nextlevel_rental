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

import egovframework.ntrms.kr.co.brn.comm.service.CommonService;
import egovframework.ntrms.kr.co.brn.sd.service.RTSDClaimMgmtService;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;
@Controller
public class RTSDClaimMgmtController {
	
	protected Log logger = LogFactory.getLog(this.getClass());	
	

	@Resource(name="rTSDClaimMgmtService")
	RTSDClaimMgmtService rTSDClaimMgmtService;
	
	@Resource(name="commonService")
		CommonService commonService;
	
//	공통코드 콤보박스
	@RequestMapping("/rtms/sd/claimMgmtCombo.do") 
	public ModelAndView saleItemCommCode(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			inVar.put("cdGrpCd", "S230");
			inVar.put("useYn", "Y");
			Map dsCgb = commonService.listCommInfo(inVar);
			
			inVar.put("cdGrpCd", "S230");
			inVar.put("useYn", "Y");
			Map dsCgbDetail = commonService.listCommInfo(inVar);
			
			inVar.put("cdGrpCd", "S231");
			inVar.put("useYn", "Y");
			Map dsCtpV = commonService.listCommInfo(inVar);
			
			inVar.put("cdGrpCd", "S232");
			inVar.put("useYn", "Y");
			Map dsCtpP = commonService.listCommInfo(inVar);
			
			inVar.put("cdGrpCd", "C027");
			inVar.put("useYn", "Y");
			Map dsPstate = commonService.listCommInfo(inVar);
			
			inVar.put("cdGrpCd", "C027");
			inVar.put("useYn", "Y");
			Map dsPstateDe = commonService.listCommInfo(inVar);
			
			inVar.put("cdGrpCd", "S002");
			inVar.put("useYn", "Y");
			Map dsModelNm = commonService.listCommInfo(inVar);
			
			List listDsCgb		= (List)dsCgb.get("result");
			List listDsCgbDetail		= (List)dsCgbDetail.get("result");
			List listDsCtpV		= (List)dsCtpV.get("result");
			List listDsCtpP		= (List)dsCtpP.get("result");
			List listDsPstate		= (List)dsPstate.get("result");
			List listDsPstateDe		= (List)dsPstateDe.get("result");
			List listDsModelNm			= (List)dsModelNm.get("result");
			
			DataSetMap mapDsCgb = new DataSetMap();
			DataSetMap mapDsCgbDeteail = new DataSetMap();
			DataSetMap maptDsCtpV = new DataSetMap();
			DataSetMap maptDsCtpP = new DataSetMap();
			DataSetMap mapDsPstate = new DataSetMap();
			DataSetMap mapDsPstateDe = new DataSetMap();
			DataSetMap mapDsModelNm = new DataSetMap();
			
			mapDsCgb.setRowMaps(listDsCgb);
			mapDsCgbDeteail.setRowMaps(listDsCgbDetail);
			maptDsCtpV.setRowMaps(listDsCtpV);
			maptDsCtpP.setRowMaps(listDsCtpP);
			mapDsPstate.setRowMaps(listDsPstate);
			mapDsPstateDe.setRowMaps(listDsPstateDe);
			mapDsModelNm.setRowMaps(listDsModelNm);
			
			outDataset.put("mapDsCgb",	mapDsCgb);
			outDataset.put("mapDsCgbDeteail",	mapDsCgbDeteail);
			outDataset.put("maptDsCtpV",	maptDsCtpV);
			outDataset.put("maptDsCtpP",	maptDsCtpP);
			outDataset.put("mapDsPstate",	mapDsPstate);
			outDataset.put("mapDsPstateDe",	mapDsPstateDe);
			outDataset.put("mapDsModelNm",mapDsModelNm);
			
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
	
//	클레임관리 조회
	@SuppressWarnings("unchecked")
	@RequestMapping("/ntrms/sd/claimMgmtList.do") 
	public ModelAndView claimMgmtList(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, Object> patternInVar 	= xpDto.getInVariableMap();
			Map <String, Object> saleProdinVar 	= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			@SuppressWarnings("rawtypes")
			
			List li = rTSDClaimMgmtService.claimMgmtList(inVar, outDataset);
			DataSetMap outDsMap = new DataSetMap();
			outDsMap.setRowMaps(li);
			outDataset.put("output", outDsMap);
			
			
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
	
//	클레임관리 고객 조회
	@SuppressWarnings("unchecked")
	@RequestMapping("/ntrms/sd/claimMgmtAddList.do") 
	public ModelAndView claimMgmtAddList(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, Object> patternInVar 	= xpDto.getInVariableMap();
			Map <String, Object> saleProdinVar 	= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			@SuppressWarnings("rawtypes")
			
			List li = rTSDClaimMgmtService.claimMgmtAddList(inVar, outDataset);
			DataSetMap outDsMap = new DataSetMap();
			outDsMap.setRowMaps(li);
			outDataset.put("output", outDsMap);
			
			
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
	
//	클레임관리 저장,수정
	@RequestMapping("/ntrms/sd/claimMgmtSave.do") 
	public ModelAndView claimMgmtSave(NexacroMapDTO xpDto, Model model,  HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try {
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, Object> outVar 		= xpDto.getOutVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();

			// 로그인 사용자 정보 획득
			Map loginInfo = (Map)req.getSession().getAttribute("User");
			
			// 로그인중인 아이디			
			inVar.put("regId" , loginInfo.get("userId"));
			
			// 클레임 관리 저장
			Map result = rTSDClaimMgmtService.claimMgmtSave(inDataset, inVar);
			
			// 화면으로 값 전달

			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			
			mav.addObject(NexacroConstant.ERROR_CODE, result.get("successCode") + "");
			mav.addObject(NexacroConstant.ERROR_MSG,  result.get("returnMessage"));
		
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		
		return mav;
	}
	
	
}
