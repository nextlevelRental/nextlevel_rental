package egovframework.ntrms.kr.co.brn.cs.controller;

import java.io.File;
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
import egovframework.ntrms.kr.co.brn.cs.service.RTCSKeepHistoryService;
import egovframework.ntrms.kr.co.brn.sd.service.RTSDContractStatusService;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;

@Controller
public class RTCSKeepHistoryController {
	
	protected Log logger = LogFactory.getLog(this.getClass());	

	@Resource(name="rTCSKeepHistoryService")
	RTCSKeepHistoryService rTCSKeepHistoryService;
	
	@Resource(name="rTSDContractStatusService")
	RTSDContractStatusService rTSDContractStatusService;
	
	@Resource(name="commonService")
	CommonService commonService;
	
	@RequestMapping("/rtms/cs/initRTCSKeepHistory.do") 
	public ModelAndView initRTCSWarehouseRegister(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("cdGrpCd", "C014");
			inVar.put("useYn", "Y");
			Map dsStrgStat = commonService.listCommInfo(inVar);
			List listStrgStat = (List)dsStrgStat.get("result");
			DataSetMap mapStrgStat = new DataSetMap();
			mapStrgStat.setRowMaps(listStrgStat);
			outDataset.put("mapStrgStat",  mapStrgStat);
			
			inVar.put("cdGrpCd", "C015");
			inVar.put("useYn", "Y");
			Map dsStrgMthd = commonService.listCommInfo(inVar);
			List listStrgMthd = (List)dsStrgMthd.get("result");
			DataSetMap mapStrgMthd = new DataSetMap();
			mapStrgMthd.setRowMaps(listStrgMthd);
			outDataset.put("mapStrgMthd",  mapStrgMthd);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE, "0");
			mav.addObject(NexacroConstant.ERROR_MSG, "");
		}catch( Exception e ){
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	@RequestMapping("/rtms/cs/selectRTCSKeepHistory.do") 
	public ModelAndView selectRTCSKeepHistory(NexacroMapDTO xpDto, HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map result = rTCSKeepHistoryService.selectRTCSKeepHistory(inVar, outDataset);
			List listRTCSKeepHistory = (List)result.get("selectRTCSKeepHistory");
			DataSetMap mapRtcs0203 = new DataSetMap();
			mapRtcs0203.setRowMaps(listRTCSKeepHistory);
			outDataset.put("mapRtcs0203", mapRtcs0203);
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE, "0");
			mav.addObject(NexacroConstant.ERROR_MSG, "");
		}catch( Exception e ){
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	@RequestMapping("/rtms/cs/initRTCOMMStrgRegister.do") 
	public ModelAndView initRTCOMMStrgRegister(NexacroMapDTO xpDto, Model model) throws Exception {
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
			outDataset.put("mapDsUseYn",  mapDsUseYn);
			
			inVar.put("cdGrpCd", "C015");
			inVar.put("useYn", "Y");
			Map dsStrgMthd = commonService.listCommInfo(inVar);
			List listDSStrgMthd = (List)dsStrgMthd.get("result");
			DataSetMap mapDsStrgMthd = new DataSetMap();
			mapDsStrgMthd.setRowMaps(listDSStrgMthd);
			outDataset.put("mapDsStrgMthd",  mapDsStrgMthd);
			
			//타이어제조사
			inVar.put("cdGrpCd", "C009");
			inVar.put("useYn", "Y");
			Map dsDsMfCd = commonService.listCommInfo(inVar);
			List listDsMfCd = (List)dsDsMfCd.get("result");
			DataSetMap mapDsMfCd_1 = new DataSetMap();
			mapDsMfCd_1.setRowMaps(listDsMfCd);
			outDataset.put("mapDsMfCd_1",  mapDsMfCd_1);
			DataSetMap mapDsMfCd_2 = new DataSetMap();
			mapDsMfCd_2.setRowMaps(listDsMfCd);
			outDataset.put("mapDsMfCd_2",  mapDsMfCd_2);
			DataSetMap mapDsMfCd_3 = new DataSetMap();
			mapDsMfCd_3.setRowMaps(listDsMfCd);
			outDataset.put("mapDsMfCd_3",  mapDsMfCd_3);
			
			//폭
			inVar.put("cdGrpCd", "C010");
			inVar.put("useYn", "Y");
			Map dsDsSelectionWidth = commonService.listCommInfo(inVar);
			List listDsSelectionWidth = (List)dsDsSelectionWidth.get("result");
			DataSetMap mapDsSelectionWidth_1 = new DataSetMap();
			mapDsSelectionWidth_1.setRowMaps(listDsSelectionWidth);
			outDataset.put("mapDsSelectionWidth_1",  mapDsSelectionWidth_1);
			DataSetMap mapDsSelectionWidth_2 = new DataSetMap();
			mapDsSelectionWidth_2.setRowMaps(listDsSelectionWidth);
			outDataset.put("mapDsSelectionWidth_2",  mapDsSelectionWidth_2);
			DataSetMap mapDsSelectionWidth_3 = new DataSetMap();
			mapDsSelectionWidth_3.setRowMaps(listDsSelectionWidth);
			outDataset.put("mapDsSelectionWidth_3",  mapDsSelectionWidth_3);
			
			//시리즈
			inVar.put("cdGrpCd", "C011");
			inVar.put("useYn", "Y");
			Map dsDsAspectRatio = commonService.listCommInfo(inVar);
			List listDsAspectRatio = (List)dsDsAspectRatio.get("result");
			DataSetMap mapDsAspectRatio_1 = new DataSetMap();
			mapDsAspectRatio_1.setRowMaps(listDsAspectRatio);
			outDataset.put("mapDsAspectRatio_1",  mapDsAspectRatio_1);
			DataSetMap mapDsAspectRatio_2 = new DataSetMap();
			mapDsAspectRatio_2.setRowMaps(listDsAspectRatio);
			outDataset.put("mapDsAspectRatio_2",  mapDsAspectRatio_2);
			DataSetMap mapDsAspectRatio_3 = new DataSetMap();
			mapDsAspectRatio_3.setRowMaps(listDsAspectRatio);
			outDataset.put("mapDsAspectRatio_3",  mapDsAspectRatio_3);
			
			//인치
			inVar.put("cdGrpCd", "C012");
			inVar.put("useYn", "Y");
			Map dsDsWheelInches = commonService.listCommInfo(inVar);
			List listDsWheelInches = (List)dsDsWheelInches.get("result");
			DataSetMap mapDsWheelInches_1 = new DataSetMap();
			mapDsWheelInches_1.setRowMaps(listDsWheelInches);
			outDataset.put("mapDsWheelInches_1",  mapDsWheelInches_1);
			DataSetMap mapDsWheelInches_2 = new DataSetMap();
			mapDsWheelInches_2.setRowMaps(listDsWheelInches);
			outDataset.put("mapDsWheelInches_2",  mapDsWheelInches_2);
			DataSetMap mapDsWheelInches_3 = new DataSetMap();
			mapDsWheelInches_3.setRowMaps(listDsWheelInches);
			outDataset.put("mapDsWheelInches_3",  mapDsWheelInches_3);
			
			//강도
			inVar.put("cdGrpCd", "C013");
			inVar.put("useYn", "Y");
			Map dsDsPlyRating = commonService.listCommInfo(inVar);
			List listDsPlyRating = (List)dsDsPlyRating.get("result");
			DataSetMap mapDsPlyRating_1 = new DataSetMap();
			mapDsPlyRating_1.setRowMaps(listDsPlyRating);
			outDataset.put("mapDsPlyRating_1",  mapDsPlyRating_1);
			DataSetMap mapDsPlyRating_2 = new DataSetMap();
			mapDsPlyRating_2.setRowMaps(listDsPlyRating);
			outDataset.put("mapDsPlyRating_2",  mapDsPlyRating_2);
			DataSetMap mapDsPlyRating_3 = new DataSetMap();
			mapDsPlyRating_3.setRowMaps(listDsPlyRating);
			outDataset.put("mapDsPlyRating_3",  mapDsPlyRating_3);
			
			//수량
			inVar.put("cdGrpCd", "C016");
			inVar.put("useYn", "Y");
			Map dsDsTireCnt_1 = commonService.listCommInfo(inVar);
			List listDsTireCnt_1 = (List)dsDsTireCnt_1.get("result");
			DataSetMap mapDsTireCnt_1 = new DataSetMap();
			mapDsTireCnt_1.setRowMaps(listDsTireCnt_1);
			outDataset.put("mapDsTireCnt_1",  mapDsTireCnt_1);
			
			//수량
			inVar.put("cdGrpCd", "C017");
			inVar.put("useYn", "Y");
			Map dsDsTireCnt_2 = commonService.listCommInfo(inVar);
			List listDsTireCnt_2 = (List)dsDsTireCnt_2.get("result");
			DataSetMap mapDsTireCnt_2 = new DataSetMap();
			mapDsTireCnt_2.setRowMaps(listDsTireCnt_2);
			outDataset.put("mapDsTireCnt_2",  mapDsTireCnt_2);
			DataSetMap mapDsTireCnt_3 = new DataSetMap();
			mapDsTireCnt_3.setRowMaps(listDsTireCnt_2);
			outDataset.put("mapDsTireCnt_3",  mapDsTireCnt_3);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE, "0");
			mav.addObject(NexacroConstant.ERROR_MSG, "");
		}catch( Exception e ){
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	@RequestMapping("/rtms/cs/pSRtcs0202UseAgencyWareh.do") 
	public ModelAndView pSRtcs0202UseAgencyWareh(NexacroMapDTO xpDto) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map result = rTCSKeepHistoryService.pSRtcs0202UseAgencyWareh(inVar, outDataset);
			List listUseAgencyWareh	= (List)result.get("pSRtcs0202UseAgencyWareh");
			DataSetMap mapUseAgencyWareh = new DataSetMap();
			mapUseAgencyWareh.setRowMaps(listUseAgencyWareh);
			outDataset.put("mapUseAgencyWareh", mapUseAgencyWareh);
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE, result.get("successCode") + "");
			mav.addObject(NexacroConstant.ERROR_MSG, result.get("returnMessage"));
		}catch( Exception e ){
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	@RequestMapping("/rtms/cs/saveRtcs0203WinterIn.do") 
	public ModelAndView saveRtcs0203WinterIn(NexacroMapDTO xpDto, HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map loginInfo = (Map)req.getSession().getAttribute("User");
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, Object> outVar 		= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			inVar.put("regId", loginInfo.get("userId"));
			Map result = rTCSKeepHistoryService.saveRtcs0203WinterIn(inDataset, inVar);
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE, result.get("successCode") + "");
			mav.addObject(NexacroConstant.ERROR_MSG, result.get("returnMessage"));
		}catch( Exception e ){
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	@RequestMapping("/rtms/cs/initRTCOMMDlvrRegister.do") 
	public ModelAndView initRTCOMMDlvrRegister(NexacroMapDTO xpDto, Model model) throws Exception {
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
			outDataset.put("mapDsUseYn",  mapDsUseYn);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE, "0");
			mav.addObject(NexacroConstant.ERROR_MSG, "");
		}catch( Exception e ){
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	@RequestMapping("/rtms/cs/saveRtcs0203WinterOut.do") 
	public ModelAndView saveRtcs0203WinterOut(NexacroMapDTO xpDto, HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map loginInfo = (Map)req.getSession().getAttribute("User");
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, Object> outVar 		= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			inVar.put("regId", loginInfo.get("userId"));
			Map result = rTCSKeepHistoryService.saveRtcs0203WinterOut(inDataset, inVar);
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE, result.get("successCode") + "");
			mav.addObject(NexacroConstant.ERROR_MSG, result.get("returnMessage"));
		}catch( Exception e ){
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	@RequestMapping("/ntrms/cs/strgSRtcs0203FilePathName.do")
	public ModelAndView strgSRtcs0203FilePathName(NexacroMapDTO xpDto, HttpServletRequest req) {
		ModelAndView model = null;
		Map fileMap = null;
		try {			
			Map loginInfo = (Map) req.getSession().getAttribute("User");
			if( !loginInfo.get("userId").equals(null) ){
				DataSetMap 					tranInfo 	= xpDto.getTranInfoMap();
				Map <String, Object> 		inVar 		= xpDto.getInVariableMap();
				Map <String, DataSetMap> 	inDataset 	= xpDto.getInDataSetMap();
				Map <String, Object> 		outVar 		= xpDto.getOutVariableMap();
				Map <String, DataSetMap> 	outDataset  = xpDto.getOutDataSetMap();
				
				inVar.put("ordNo", 	req.getParameter("ordNo"));
				inVar.put("strgSeq", req.getParameter("strgSeq"));
				Map result = rTCSKeepHistoryService.sRtcs0203FilePathName(inVar, outDataset);
				
				List resultList = (List)result.get("vcursor");
				String ordNo 	= (String)((Map)resultList.get(0)).get("ordNo");
				String custNo   = (String)((Map)resultList.get(0)).get("custNo");
				String tmpPath 	= (String)((Map)resultList.get(0)).get("strgFilePath");
				String fileName = (String)((Map)resultList.get(0)).get("strgFileName");
				try {
					File file = new File(tmpPath + "/" + fileName);
					
					if( !file.exists() ){
						model = new ModelAndView("error/error");
						Map errMap = new HashMap();
						errMap.put("retMsg", "파일을 읽는중 오류가 발생되었습니다.");
						errMap.put("retCd", -1);
						model.addObject("result", errMap);
					}else{
						fileMap = new HashMap<String, Object>();
						fileMap.put("file_data", file);
						fileMap.put("file_ori_nm", fileName);
						fileMap.put("deleteYn", "N");
						
						DataSetMap paramDataSetMap = new DataSetMap();
						Map paramMap = new HashMap();
						paramMap.put(NexacroConstant.DATASET_ROW_TYPE,  1);
						paramMap.put("dvsn", 			"I");
						paramMap.put("ordNo",  			ordNo);
						paramMap.put("seq",  			null);
						paramMap.put("custNo",  		custNo);
						paramMap.put("sheetId",  		"05");
						paramMap.put("filePath",  		tmpPath);
						paramMap.put("fileName",  		fileName);
						paramMap.put("jobCd",  			"01");
						paramMap.put("autoYn",  		"N");
						paramMap.put("emailAddr",  		"");
						paramMap.put("dispId",  		loginInfo.get("userId"));
						paramMap.put("dispNm",  		loginInfo.get("userNm"));
						inVar.put("regId", loginInfo.get("userId"));
						
						paramDataSetMap.add(paramMap);
						inVar.put("inDsMap",  paramDataSetMap);
						inVar.put("sqlnamespace", "contractStatus.pIUDRtsd0118");
						Map result0118 = rTSDContractStatusService.pIUDRtsd0118(inVar);
						
						if( result0118.get("successCode").toString().equals("0") ){
							model = new ModelAndView("file", "downloadFile", fileMap);
						}else{
							model = new ModelAndView("error/error");
							Map errMap = new HashMap();
							errMap.put("retMsg", "보관증이력 저장중 오류가 발생되었습니다.");
							errMap.put("retCd", -1);
							model.addObject("result", errMap);
						}
					}
				} catch (Exception e) {
					e.printStackTrace();
					model.addObject(NexacroConstant.ERROR_CODE, "-1");
					model.addObject(NexacroConstant.ERROR_MSG, "파일을 읽는중 오류가 발생되었습니다.");
				}
			}else{
				model.addObject(NexacroConstant.ERROR_CODE, "-1");
				model.addObject(NexacroConstant.ERROR_MSG, "사용자정보가 없습니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addObject(NexacroConstant.ERROR_CODE, "-1");
			model.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return model;
	}
	
	@RequestMapping("/ntrms/cs/dlvrSRtcs0203FilePathName.do")
	public ModelAndView dlvrSRtcs0203FilePathName(NexacroMapDTO xpDto, HttpServletRequest req) {
		ModelAndView model = null;
		Map fileMap = null;
		try {			
			Map loginInfo = (Map) req.getSession().getAttribute("User");
			if( !loginInfo.get("userId").equals(null) ){
				DataSetMap 					tranInfo 	= xpDto.getTranInfoMap();
				Map <String, Object> 		inVar 		= xpDto.getInVariableMap();
				Map <String, DataSetMap> 	inDataset 	= xpDto.getInDataSetMap();
				Map <String, Object> 		outVar 		= xpDto.getOutVariableMap();
				Map <String, DataSetMap> 	outDataset  = xpDto.getOutDataSetMap();
				
				inVar.put("ordNo", 	req.getParameter("ordNo"));
				inVar.put("strgSeq", req.getParameter("strgSeq"));
				Map result = rTCSKeepHistoryService.sRtcs0203FilePathName(inVar, outDataset);
				
				List resultList = (List)result.get("vcursor");
				String ordNo 	= (String)((Map)resultList.get(0)).get("ordNo");
				String custNo   = (String)((Map)resultList.get(0)).get("custNo");
				String tmpPath 	= (String)((Map)resultList.get(0)).get("dlvrFilePath");
				String fileName = (String)((Map)resultList.get(0)).get("dlvrFileName");
				
				try {
					File file = new File(tmpPath + "/" + fileName);
					
					if(!file.exists()) {
						model = new ModelAndView("error/error");
						Map errMap = new HashMap();
						errMap.put("retMsg", "파일을 읽는중 오류가 발생되었습니다.");
						errMap.put("retCd", -1);
						model.addObject("result", errMap);

					} else {
						fileMap = new HashMap<String, Object>();
						fileMap.put("file_data", file);
						fileMap.put("file_ori_nm", fileName);
						fileMap.put("deleteYn", "N");
						
						DataSetMap paramDataSetMap = new DataSetMap();
						Map paramMap = new HashMap();
						paramMap.put(NexacroConstant.DATASET_ROW_TYPE,  1);
						paramMap.put("dvsn", 			"I");
						paramMap.put("ordNo",  			ordNo);
						paramMap.put("seq",  			null);
						paramMap.put("custNo",  		custNo);
						paramMap.put("sheetId",  		"06");
						paramMap.put("filePath",  		tmpPath);
						paramMap.put("fileName",  		fileName);
						paramMap.put("jobCd",  			"01");
						paramMap.put("autoYn",  		"N");
						paramMap.put("emailAddr",  		"");
						paramMap.put("dispId",  		loginInfo.get("userId"));
						paramMap.put("dispNm",  		loginInfo.get("userNm"));
						inVar.put("regId", loginInfo.get("userId"));
						
						paramDataSetMap.add(paramMap);
						inVar.put("inDsMap",  paramDataSetMap);
						inVar.put("sqlnamespace", "contractStatus.pIUDRtsd0118");
						Map result0118 = rTSDContractStatusService.pIUDRtsd0118(inVar);
						
						if( result0118.get("successCode").toString().equals("0") ){
							model = new ModelAndView("file", "downloadFile", fileMap);
						}else{
							model = new ModelAndView("error/error");
							Map errMap = new HashMap();
							errMap.put("retMsg", "출고증이력 저장중 오류가 발생되었습니다.");
							errMap.put("retCd", -1);
							model.addObject("result", errMap);
						}
					}
				} catch (Exception e) {
					e.printStackTrace();
					model.addObject(NexacroConstant.ERROR_CODE, "-1");
					model.addObject(NexacroConstant.ERROR_MSG, "파일을 읽는중 오류가 발생되었습니다.");
				}
			}else{
				model.addObject(NexacroConstant.ERROR_CODE, "-1");
				model.addObject(NexacroConstant.ERROR_MSG, "파일을 읽는중 오류가 발생되었습니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addObject(NexacroConstant.ERROR_CODE, "-1");
			model.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return model;
	}
}
