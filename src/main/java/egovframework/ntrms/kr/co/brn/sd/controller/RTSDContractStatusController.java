package egovframework.ntrms.kr.co.brn.sd.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import egovframework.ntrms.kr.co.brn.comm.service.CommonService;
import egovframework.ntrms.kr.co.brn.mail.MailService;
import egovframework.ntrms.kr.co.brn.sd.service.RTSDContractStatusService;
import egovframework.ntrms.kr.co.comm.api.KafkaProducerApi;
import egovframework.ntrms.kr.co.comm.util.CommonUtil;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;
import egovframework.rte.fdl.property.EgovPropertyService;

@Controller
public class RTSDContractStatusController {
	protected Log logger = LogFactory.getLog(this.getClass());	

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	@Resource(name="rTSDContractStatusService")
	RTSDContractStatusService rTSDContractStatusService;
	
	@Resource(name="commonService")
	CommonService commonService;
	
	@Autowired
	KafkaProducerApi kafkaProducerApi;
	
	@Autowired
	private MailService mailService;
	
	@RequestMapping("/rtms/sd/initRTSDContractStatus.do") 
	public ModelAndView initRTCMContractStatus(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, Object> outVal			= xpDto.getOutVariableMap();
			
			inVar.put("cdGrpCd", "S308");
			inVar.put("useYn", "Y");
			Map dsS308 = commonService.listCommInfo(inVar);
						
			List listDsS308		= (List)dsS308.get("result");	
			
			DataSetMap mapDsS308 			= new DataSetMap();
			mapDsS308.setRowMaps(listDsS308);
					
			outDataset.put("mapDsS308",		mapDsS308);
			
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
	
	@RequestMapping("/rtms/sd/listStatus.do") 
	public ModelAndView listStatus(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rTSDContractStatusService.listStatus(inVar, outDataset);
			List listStatus = (List)result.get("listStatus");
			DataSetMap mapStatus = new DataSetMap();
			mapStatus.setRowMaps(listStatus);
			outDataset.put("mapStatus", mapStatus);
			
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
	
	@RequestMapping("/rtms/sd/listInstall.do") 
	public ModelAndView listInstall(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rTSDContractStatusService.listInstall(inVar, outDataset);
			List listInstall = (List)result.get("listInstall");
			DataSetMap mapInstall = new DataSetMap();
			mapInstall.setRowMaps(listInstall);
			outDataset.put("mapInstall", mapInstall);
			
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
	
	@RequestMapping("/rtms/sd/listPay.do") 
	public ModelAndView listPay(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rTSDContractStatusService.listPay(inVar, outDataset);
			List listPay = (List)result.get("listPay");
			DataSetMap mapPay = new DataSetMap();
			mapPay.setRowMaps(listPay);
			outDataset.put("mapPay", mapPay);
			
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
	
	@RequestMapping("/rtms/sd/listDiscount.do") 
	public ModelAndView listDiscount(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rTSDContractStatusService.listDiscount(inVar, outDataset);
			List listDiscount = (List)result.get("listDiscount");
			DataSetMap mapDiscount = new DataSetMap();
			mapDiscount.setRowMaps(listDiscount);
			outDataset.put("mapDiscount", mapDiscount);
			
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
	
	@RequestMapping("/rtms/sd/listAgree.do") 
	public ModelAndView listAgree(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rTSDContractStatusService.listAgree(inVar, outDataset);
			List listAgree = (List)result.get("listAgree");
			DataSetMap mapAgree = new DataSetMap();
			mapAgree.setRowMaps(listAgree);
			outDataset.put("mapAgree", mapAgree);
			
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
	
	@RequestMapping("/rtms/sd/listPreminum.do") 
	public ModelAndView listPreminum(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rTSDContractStatusService.listPreminum(inVar, outDataset);
			List listPreminum = (List)result.get("listPreminum");
			DataSetMap mapPreminum = new DataSetMap();
			mapPreminum.setRowMaps(listPreminum);
			outDataset.put("mapPreminum", mapPreminum);
			
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
	
	@RequestMapping("/rtms/sd/listSeller.do") 
	public ModelAndView listSeller(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rTSDContractStatusService.listSeller(inVar, outDataset);
			List listSeller = (List)result.get("listSeller");
			DataSetMap mapSeller = new DataSetMap();
			mapSeller.setRowMaps(listSeller);
			outDataset.put("mapSeller", mapSeller);
			
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
	
	@RequestMapping("/rtms/sd/listEleSig.do") 
	public ModelAndView listEleSig(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rTSDContractStatusService.listEleSig(inVar, outDataset);
			List listEleSig = (List)result.get("listEleSig");
			DataSetMap mapEleSig = new DataSetMap();
			mapEleSig.setRowMaps(listEleSig);
			outDataset.put("mapEleSig", mapEleSig);
			
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
	
	@RequestMapping("/ntrms/sd/tabInfo9EleSigFileDown.do")
	public ModelAndView tabInfo9EleSigFileDown(NexacroMapDTO xpDto, HttpServletRequest req) {
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
				
				String paramOrdNo	 = req.getParameter("ordNo");
				String paramSheetId  = req.getParameter("sheetId");
				String paramFileName = req.getParameter("fileName");
				
				inVar.put("ordNo", 		paramOrdNo);
				inVar.put("sheetId", 	paramSheetId);
				inVar.put("fileName", 	paramFileName);
				
				Map result = rTSDContractStatusService.listEleSig(inVar, outDataset);
				List listEleSig = (List)result.get("listEleSig");
				DataSetMap mapEleSig = new DataSetMap();
				mapEleSig.setRowMaps(listEleSig);
				
				/*
				for(int i = 0 ; i < mapEleSig.size() ; i++){
					String selectSheetId  = (String)mapEleSig.get(i).get("sheetId");
					String selectFileName = (String)mapEleSig.get(i).get("fileName");
					if( (paramSheetId.equals(selectSheetId)) && (paramFileName.equals(selectFileName)) ){
						tmpPath  = (String)mapEleSig.get(i).get("pathDec");
						fileName = (String)mapEleSig.get(i).get("fileName");
						break;
					}
				}
				*/
				
				String tmpPath 		 = (String)mapEleSig.get(0).get("pathDec");
				String fileName 	 = (String)mapEleSig.get(0).get("fileName");
				
				System.out.println("tmpPath::" + tmpPath);
				System.out.println("fileName::" + fileName);
				try{
					File file = new File(tmpPath + "/" + fileName);
					if(!file.exists()) {
						model = new ModelAndView("error/error");
						Map errMap = new HashMap();
						errMap.put("retMsg", "[파일미존재]파일을 읽는중 오류가 발생되었습니다.");
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
						paramMap.put("ordNo",  			paramOrdNo);
						paramMap.put("seq",  			null);
						paramMap.put("custNo",  		(String)mapEleSig.get(0).get("custNo"));
						paramMap.put("sheetId",  		(String)mapEleSig.get(0).get("sheetId"));
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
							logger.error("**********서식조회 오류_1**********");
							model = new ModelAndView("error/error");
							Map errMap = new HashMap();
							errMap.put("retMsg", "파일을 읽는중 오류가 발생되었습니다.");
							errMap.put("retCd", -1);
							model.addObject("result", errMap);
						}
					}
				}catch(Exception e){
					e.printStackTrace();
					logger.error("**********서식조회 오류_2**********");
					model = new ModelAndView("error/error");
					Map errMap = new HashMap();
					errMap.put("retMsg", "파일을 읽는중 오류가 발생되었습니다.");
					errMap.put("retCd", -1);
					model.addObject("result", errMap);
				}
			}else{
				logger.error("**********서식조회 오류_3**********");
				model = new ModelAndView("error/error");
				Map errMap = new HashMap();
				errMap.put("retMsg", "사용자 정보가 없습니다.");
				errMap.put("retCd", -1);
			}
		}catch(Exception e){
			e.printStackTrace();
			logger.error("**********서식조회 오류_4**********");
			model = new ModelAndView("error/error");
			Map errMap = new HashMap();
			errMap.put("retMsg", "서식조회 오류가 발생되었습니다..");
			errMap.put("retCd", -1);
			model.addObject("result", errMap);
		}
		return model;
	}
	
	@RequestMapping("/rtms/sd/tabInfo9EleSigEmail.do") 
	public ModelAndView tabInfo9EleSigEmail(NexacroMapDTO xpDto, HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		Map result = null;
		try {			
			Map loginInfo = (Map) req.getSession().getAttribute("User");
			if( !loginInfo.get("userId").equals(null) ){
				DataSetMap 					tranInfo 	= xpDto.getTranInfoMap();
				Map <String, Object> 		inVar 		= xpDto.getInVariableMap();
				Map <String, DataSetMap> 	inDataset 	= xpDto.getInDataSetMap();
				Map <String, Object> 		outVar 		= xpDto.getOutVariableMap();
				Map <String, DataSetMap> 	outDataset  = xpDto.getOutDataSetMap();
				
				//계약서/장착확인서인 경우만 kakao로 발송
				if(inVar.get("sheetId").equals("02") || inVar.get("sheetId").equals("03")){
					
					result = rTSDContractStatusService.getOrgInfoList(inVar);
					
					List orgInfoList = (List)result.get("orgInfoList");
					
					if(orgInfoList.size() > 0){
						
						Map<String, Object> jsonMap = new HashMap<>();
						jsonMap.put("VSUBJECT", "계약서");
						jsonMap.put("TEMPLATE", "A");
						jsonMap.put("CONTRACT_INFO", orgInfoList.get(0));
						
						kafkaProducerApi.sendAsync(new Gson().toJson(jsonMap));
						
						mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
						mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
						mav.addObject(NexacroConstant.ERROR_CODE, "0");
						mav.addObject(NexacroConstant.ERROR_MSG,  "정상 발송되었습니다.");
					} else {
						
						mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
						mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
						mav.addObject(NexacroConstant.ERROR_CODE, "-1");
						mav.addObject(NexacroConstant.ERROR_MSG,  "계약서 정보를 찾을 수 없습니다.");
					}
					
				} else {
					
					result = rTSDContractStatusService.listEleSig(inVar, outDataset);
					List listEleSig = (List)result.get("listEleSig");
					DataSetMap mapEleSig = new DataSetMap();
					mapEleSig.setRowMaps(listEleSig);
					
					String sheetNm 	 = (String)mapEleSig.get(0).get("sheetNm");
					String sheetId 	 = (String)mapEleSig.get(0).get("sheetId");
					String tmpPath 	 = (String)mapEleSig.get(0).get("pathEnc");
					String fileName  = (String)mapEleSig.get(0).get("fileName");
					String custNm 	 = (String)mapEleSig.get(0).get("custNm");
					String custNo 	 = (String)mapEleSig.get(0).get("custNo");
					
					String subject	 = "[넥스트레벨]"+custNm+"고객님, 타이어렌탈에 대한 "+sheetNm+"입니다.";
					String emailAddr = "";
					String textImg 	 = "";
					
					File file = new File(tmpPath + "/" + fileName);
					
					if( !file.exists() ){
						String[] arrFileName = fileName.split("_");
						file = new File(tmpPath + "/" + arrFileName[0]+".pdf");
					}
					
					if(!file.exists()) {
						mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
						mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
						mav.addObject(NexacroConstant.ERROR_CODE, "-1");
						mav.addObject(NexacroConstant.ERROR_MSG,  "파일을 읽는중 오류가 발생되었습니다.");
					}else{
						Map <String, Object> paramS082 = xpDto.getInVariableMap();
						paramS082.put("cd", "S082");
						paramS082.put("cdGrp", "01");
						int s082Cnt = rTSDContractStatusService.s082Cnt(paramS082);
						
						if( s082Cnt == 1){
							emailAddr = rTSDContractStatusService.codeName(paramS082);
						}else{
							emailAddr = (String)mapEleSig.get(0).get("emailAddr");
						}
						
						Map <String, Object> paramS083 = xpDto.getInVariableMap();
						paramS083.put("cd", "S083");
						paramS083.put("cdGrp", sheetId);
						textImg = rTSDContractStatusService.codeName(paramS083);
						
						DataSetMap paramDataSetMap = new DataSetMap();
						Map paramMap = new HashMap();
						paramMap.put(NexacroConstant.DATASET_ROW_TYPE,  1);
						paramMap.put("dvsn", 			"I");
						paramMap.put("ordNo",  			inVar.get("ordNo"));
						paramMap.put("seq",  			null);
						paramMap.put("custNo",  		(String)mapEleSig.get(0).get("custNo"));
						paramMap.put("sheetId",  		(String)mapEleSig.get(0).get("sheetId"));
						paramMap.put("filePath",  		tmpPath);
						paramMap.put("fileName",  		fileName);
						paramMap.put("jobCd",  			"02");
						paramMap.put("autoYn",  		"N");
						paramMap.put("emailAddr",  		emailAddr);
						paramMap.put("dispId",  		loginInfo.get("userId"));
						paramMap.put("dispNm",  		loginInfo.get("userNm"));
						inVar.put("regId", loginInfo.get("userId"));
						
						paramDataSetMap.add(paramMap);
						inVar.put("inDsMap",  paramDataSetMap);
						inVar.put("sqlnamespace", "contractStatus.pIUDRtsd0118");
						Map result0118 = rTSDContractStatusService.pIUDRtsd0118(inVar);
						
						if(result0118.get("successCode").toString().equals("0")){
							
	//						Map <String, Object> paramS099 = xpDto.getInVariableMap();
	//						paramS083.put("cd", "S099");
	//						paramS083.put("cdGrp", sheetId);
	//						textImg = rTSDContractStatusService.codeName(paramS099);
	//						
	//						File[] attachments = new File[]{};
	//						File attachment1 = new File(tmpPath + "/" + fileName);
	//						File attachment2;
	//						
	//						attachments[0] = attachment1;
	//						if(sheetId == "02"){
	//							attachment2 = new File("");
	//						}
							
							boolean	sendResult = mailService.sendMail(emailAddr, subject, textImg, tmpPath, fileName);
							if(sendResult){
								mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
								mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
								mav.addObject(NexacroConstant.ERROR_CODE, "0");
								mav.addObject(NexacroConstant.ERROR_MSG,  "메일발송하였습니다.");
							}else{
								mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
								mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
								mav.addObject(NexacroConstant.ERROR_CODE, "-1");
								mav.addObject(NexacroConstant.ERROR_MSG,  "메일발송을 실패하였습니다.");
							}
						}else{
							mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
							mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
							mav.addObject(NexacroConstant.ERROR_CODE, result.get("successCode")+"");
							mav.addObject(NexacroConstant.ERROR_MSG,  result.get("returnMessage"));
						}
					}
				}
			}else{
				mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
				mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
				mav.addObject(NexacroConstant.ERROR_CODE, "-1");
				mav.addObject(NexacroConstant.ERROR_MSG,  "사용자정보가 없습니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	@RequestMapping("/rtms/sd/saveOrdCancel.do") 
	public ModelAndView saveOrdCancel(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		Map loginInfo = (Map) req.getSession().getAttribute("User");
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, Object> outVar 		= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("regId", loginInfo.get("userId"));
			inVar.put("host", propertiesService.getString("oms.send.host") + inDataset.get("input1").get(0).get("sendURL").toString());
			inVar.put("server_key", propertiesService.getString("oms.send.key"));
			
			//세션정보 삭제 - 속도 이슈
			((DataSetMap)inDataset.get("input1")).getRowMaps().get(0).remove("USER");
			((DataSetMap)inDataset.get("input1")).getRowMaps().get(0).remove("PAGE");
			
			Map result = rTSDContractStatusService.saveOrdCancel(inDataset, inVar);
			outVar.put("returnOrdNo", result.get("ordNo"));
			
			
			//온라인 계약(02,03,04), 거점인 경우
			DataSetMap dsRtsd0213 = (DataSetMap) inDataset.get("input1");
			String o2oYn = dsRtsd0213.get(0).get("o2oYn").toString();
			String successCode = result.get("successCode").toString();
			if(o2oYn.equals("Y")){
				
				//연계 이력 저장
				Map<String, Object> parameterMap = (Map<String, Object>) dsRtsd0213.get(0);
				Map<String, Object> paramMap = (Map<String, Object>) result.get("rtsd0213");
				if(paramMap != null){
//					parameterMap.put("dvsn", "I");
//					parameterMap.put("col01", paramMap.get("rentIfCntrNo"));
//					parameterMap.put("col02", paramMap.get("ordDe"));
//					parameterMap.put("col03", paramMap.get("saleTyCd"));
//					parameterMap.put("col04", paramMap.get("rentIfReqSn"));
//					parameterMap.put("col05", paramMap.get("rentIfBfistSeCd"));
//					parameterMap.put("col06", paramMap.get("custNm"));
//					parameterMap.put("col07", paramMap.get("carNo"));
//					parameterMap.put("col08", paramMap.get("iplMobNo"));
//					parameterMap.put("col09", paramMap.get("iplTelNo"));
//					parameterMap.put("col10", paramMap.get("istBpCd"));
//					parameterMap.put("col11", paramMap.get("itemCd"));
//					parameterMap.put("col12", paramMap.get("ordQy"));
//					parameterMap.put("col13", paramMap.get("dlvTyDtlCd"));
//					parameterMap.put("col14", paramMap.get("istReqDe"));
//					parameterMap.put("col15", paramMap.get("pickupZip"));
//					parameterMap.put("col16", paramMap.get("pickupBassAddr"));
//					parameterMap.put("col17", paramMap.get("pickupDtlAddr"));
//					parameterMap.put("col18", paramMap.get("iplZip"));
//					parameterMap.put("col19", paramMap.get("iplAddr"));
//					parameterMap.put("col20", paramMap.get("iplDtlAddr"));
//					parameterMap.put("col21", paramMap.get("regUsrId"));
//					parameterMap.put("col22", paramMap.get("ordRsn"));
//					parameterMap.put("col23", paramMap.get("opertSts"));
//					parameterMap.put("col24", paramMap.get("opertDe"));
//					parameterMap.put("col25", paramMap.get("drgMil"));
//					parameterMap.put("col26", paramMap.get("rtnCode"));
//					parameterMap.put("col27", paramMap.get("rtnMsg"));
//					parameterMap.put("col28", paramMap.get("ordNo"));
//					parameterMap.put("col29", "");
//					parameterMap.put("col30", "");
					
					parameterMap.put("dvsn", "I");
					parameterMap.put("custNo", CommonUtil.isNull(paramMap.get("custNo")));
					parameterMap.put("sendUrl",CommonUtil.isNull(paramMap.get("sendURL")));
					parameterMap.put("sendFlag", CommonUtil.isNull(paramMap.get("rentIfBfistSeCd")));
					parameterMap.put("regId", CommonUtil.isNull(loginInfo.get("userId")));
					parameterMap.put("inputData", CommonUtil.isNull(result.get("paramStr")));
					parameterMap.put("outputData", CommonUtil.isNull(result.get("returnStr")));
					parameterMap.put("resultCode", CommonUtil.isNull(result.get("successCode")));
					parameterMap.put("resultMsg", CommonUtil.isNull(result.get("returnMessage")));
					
					try{
						rTSDContractStatusService.saveRtsd0213(parameterMap);
					}catch(Exception e){
						e.printStackTrace();
					}
				}
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
	
	@RequestMapping("/rtms/sd/rtsd0104AgencyUpdate.do") 
	public ModelAndView rtsd0104AgencyUpdate(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		Map loginInfo = (Map) req.getSession().getAttribute("User");
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, Object> outVar 		= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("regId", loginInfo.get("userId"));
			Map result = rTSDContractStatusService.rtsd0104AgencyUpdate(inDataset, inVar);
			
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
	
	@RequestMapping("/rtms/sd/signHistory.do") 
	public ModelAndView signHistory(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rTSDContractStatusService.signHistory(inVar, outDataset);
			List signHistory = (List)result.get("signHistory");
			DataSetMap mapSignHistory = new DataSetMap();
			mapSignHistory.setRowMaps(signHistory);
			outDataset.put("mapSignHistory", mapSignHistory);
			
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
	
	@RequestMapping("/rtms/sd/initRTCOMMCarInfoUpdate.do") 
	public ModelAndView initRTCMCustRegister(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, Object> outVal			= xpDto.getOutVariableMap();
			
			inVar.put("cdGrpCd", "S001");
			inVar.put("useYn", "Y");
			Map dsMaker = commonService.listCommInfo(inVar);
			
			List listDsMaker = (List)dsMaker.get("result");
			DataSetMap mapDsMaker = new DataSetMap();
			mapDsMaker.setRowMaps(listDsMaker);
			outDataset.put("mapDsMaker", mapDsMaker);
			
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
	
	@RequestMapping("rtms/sd/saveRTCOMMCarInfoUpdate.do") 
	public ModelAndView saveRTCOMMCarInfoUpdate(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		Map loginInfo = (Map) req.getSession().getAttribute("User");
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("regId", loginInfo.get("userId"));
			Map result =  rTSDContractStatusService.saveRTCOMMCarInfoUpdate(inDataset, inVar);
			
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
	
	@RequestMapping("rtms/sd/saveRTCOMMOrdDelete.do") 
	public ModelAndView saveRTCOMMOrdDelete(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		
		Map loginInfo = (Map) req.getSession().getAttribute("User");
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			
			inVar.put("regId", loginInfo.get("userId"));
			Map result =  rTSDContractStatusService.saveRTCOMMOrdDelete(inVar);
			
			mav.addObject(NexacroConstant.ERROR_CODE, result.get("successCode")+"");
			mav.addObject(NexacroConstant.ERROR_MSG,  result.get("returnMessage"));		
		}catch(Exception e){
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	@RequestMapping("rtms/sd/deleteService.do") 
	public ModelAndView saveRTCOMMSvcDelete(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		
		Map loginInfo = (Map) req.getSession().getAttribute("User");
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			
			inVar.put("regId", loginInfo.get("userId"));
			Map result =  rTSDContractStatusService.saveRTCOMMSvcDelete(inVar);
			
			mav.addObject(NexacroConstant.ERROR_CODE, result.get("successCode")+"");
			mav.addObject(NexacroConstant.ERROR_MSG,  result.get("returnMessage"));		
		}catch(Exception e){
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	@RequestMapping("rtms/sd/saveRTRE100Update.do") 
	public ModelAndView saveRTRE100Update(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		Map loginInfo = (Map) req.getSession().getAttribute("User");
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("regId", loginInfo.get("userId"));
			Map result =  rTSDContractStatusService.saveRTRE100Update(inDataset, inVar);
			
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
	
	@RequestMapping("rtms/sd/saveServiceB00006.do") 
	public ModelAndView saveServiceB00006(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		Map loginInfo = (Map) req.getSession().getAttribute("User");
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("regId", loginInfo.get("userId"));
			Map result =  rTSDContractStatusService.saveServiceB00006(inDataset, inVar);
			
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
	
	@RequestMapping("rtms/sd/selectServiceB00006.do") 
	public ModelAndView selectServiceB00006(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		Map loginInfo = (Map) req.getSession().getAttribute("User");
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, Object> outVar 			= xpDto.getOutVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			
			inVar.put("regId", loginInfo.get("userId"));
			String result =  rTSDContractStatusService.sRtcs0204WriteYn(inVar);
			
			outVar.put("writeYn", result);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE, "0");
		
		}catch( Exception e ){
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	@RequestMapping("/rtms/sd/AdviceStatus.do") 
	public ModelAndView AdviceStatus(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rTSDContractStatusService.AdviceStatus(inVar, outDataset);
			List AdviceStatus = (List)result.get("AdviceStatus");
			DataSetMap mapStatus = new DataSetMap();
			mapStatus.setRowMaps(AdviceStatus);
			outDataset.put("mapStatus", mapStatus);
			
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
	
	@RequestMapping("rtms/sd/addNewService.do") 
	public ModelAndView addNewService(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		Map loginInfo = (Map) req.getSession().getAttribute("User");
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("regId", loginInfo.get("userId"));
			Map result =  rTSDContractStatusService.addNewService(inDataset, inVar);
			
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
	
	@RequestMapping("rtms/sd/addServCnt0.do") 
	public ModelAndView addServCnt0(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		Map loginInfo = (Map) req.getSession().getAttribute("User");
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("regId", loginInfo.get("userId"));
			Map result =  rTSDContractStatusService.addServCnt0(inVar);
			
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
	
	/*******************************
	 * 계약만료고객조회
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/rtms/sd/listEndContract.do") 
	public ModelAndView listSendContract(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rTSDContractStatusService.listEndContract(inVar);
			
			List listEndContract	= (List)result.get("listEndContract");
			
			//계약만료대상조회
			DataSetMap dsEndContractList = new DataSetMap();
			dsEndContractList.setRowMaps(listEndContract);
			
			outDataset.put("listEndContract",	dsEndContractList);
			
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
	 * 계약취소고객조회
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/rtms/sd/listCancContract.do") 
	public ModelAndView listCancContract(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rTSDContractStatusService.listCancContract(inVar);
			
			List listCancContract	= (List)result.get("listCancContract");
			
			//계약취소대상조회
			DataSetMap dsCancContractList = new DataSetMap();
			dsCancContractList.setRowMaps(listCancContract);
			
			outDataset.put("listCancContract",	dsCancContractList);
			
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
