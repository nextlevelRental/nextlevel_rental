package egovframework.ntrms.kr.co.brn.sd.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.nexacro.xapi.data.DataSet;

import egovframework.ntrms.kr.co.brn.cms.util.PCINiceTrustSocketProcess;
import egovframework.ntrms.kr.co.brn.cms.util.PCISocketProcess;
import egovframework.ntrms.kr.co.brn.comm.service.CommonService;
import egovframework.ntrms.kr.co.brn.sd.service.RTSDCustRegisterService;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;
import egovframework.rte.fdl.property.EgovPropertyService;

@Controller
public class RTSDCustRegisterController {
	protected Log logger = LogFactory.getLog(this.getClass());	

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	@Resource(name="rTSDCustRegisterService")
	RTSDCustRegisterService rTSDCustRegisterService;

	@Resource(name="commonService")
	CommonService commonService;

	@RequestMapping("/rtms/sd/initRTCMCustRegister.do") 
	public ModelAndView initRTCMCustRegister(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");

		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();

			inVar.put("cdGrpCd", "S024");
			inVar.put("useYn", "Y");
			Map dsCustTp = commonService.listCommInfo(inVar);
			Map dsBankCustTp = commonService.listCommInfo(inVar);

			inVar.put("cdGrpCd", "S034");
			inVar.put("useYn", "Y");
			Map dsCertification  = commonService.listCommInfo(inVar);

			inVar.put("cdGrpCd", "S026");
			inVar.put("useYn", "Y");
			Map dsGenderCd = commonService.listCommInfo(inVar);

			inVar.put("cdGrpCd", "S027");
			inVar.put("useYn", "Y");
			Map dsLfcd = commonService.listCommInfo(inVar);

			inVar.put("cdGrpCd", "S039");
			inVar.put("useYn", "Y");
			Map dsMobFirm = commonService.listCommInfo(inVar);

			inVar.put("cdGrpCd", "S042");
			inVar.put("useYn", "Y");
			Map dsEmailAddr2 = commonService.listCommInfo(inVar);

			inVar.put("cdGrpCd", "S025");
			inVar.put("useYn", "Y");
			Map dsCustTp2 = commonService.listCommInfo(inVar);

			inVar.put("cdGrpCd", "R001");
			inVar.put("useYn", "Y");
			Map dsBankCd = commonService.listCommInfo(inVar);

			inVar.put("cdGrpCd", "C004");
			inVar.put("useYn", "Y");
			Map dsUseYn = commonService.listCommInfo(inVar);

			inVar.put("cdGrpCd", "S047");
			inVar.put("useYn", "Y");
			Map dsSafekeyResult = commonService.listCommInfo(inVar);

			inVar.put("cdGrpCd", "S071");
			inVar.put("useYn", "Y");
			Map dsNagYn = commonService.listCommInfo(inVar);

			List listDsCustTp			= (List)dsCustTp.get("result");	
			List listDsCertification	= (List)dsCertification.get("result");
			List listDsGenderCd			= (List)dsGenderCd.get("result");
			List listDsLfcd				= (List)dsLfcd.get("result");
			List listDsMobFirm			= (List)dsMobFirm.get("result");
			List listDsEmailAddr2		= (List)dsEmailAddr2.get("result");
			List listDsCustTp2			= (List)dsCustTp2.get("result");
			List listDsBankCustTp		= (List)dsBankCustTp.get("result");
			List bank					= (List)dsBankCd.get("result");
			List use					= (List)dsUseYn.get("result");
			List listDsSafekeyResult	= (List)dsSafekeyResult.get("result");
			List listDsNagYn			= (List)dsNagYn.get("result");

			DataSetMap mapDsCustTp 			= new DataSetMap();
			DataSetMap mapDsCertification 	= new DataSetMap();
			DataSetMap mapDsGenderCd 		= new DataSetMap();
			DataSetMap mapDsLfcd 			= new DataSetMap();
			DataSetMap mapDsMobFirm 		= new DataSetMap();
			DataSetMap mapEmailAddr2 		= new DataSetMap();
			DataSetMap mapDsCustTp2 		= new DataSetMap();
			DataSetMap mapDsBankCustTp	 	= new DataSetMap();
			DataSetMap bankType 			= new DataSetMap();
			DataSetMap useType 				= new DataSetMap();
			DataSetMap mapDsSafekeyResult 	= new DataSetMap();
			DataSetMap mapDsNagYn 			= new DataSetMap();


			mapDsCustTp.setRowMaps(listDsCustTp);
			mapDsCertification.setRowMaps(listDsCertification);
			mapDsGenderCd.setRowMaps(listDsGenderCd);
			mapDsLfcd.setRowMaps(listDsLfcd);
			mapDsMobFirm.setRowMaps(listDsMobFirm);
			mapEmailAddr2.setRowMaps(listDsEmailAddr2);
			mapDsCustTp2.setRowMaps(listDsCustTp2);
			mapDsBankCustTp.setRowMaps(listDsBankCustTp);
			bankType.setRowMaps(bank);
			useType.setRowMaps(use);
			mapDsSafekeyResult.setRowMaps(listDsSafekeyResult);
			mapDsNagYn.setRowMaps(listDsNagYn);

			outDataset.put("mapDsCustTp", mapDsCustTp);
			outDataset.put("mapDsCertification", mapDsCertification);
			outDataset.put("mapDsGenderCd",	mapDsGenderCd);
			outDataset.put("mapDsLfcd", mapDsLfcd);
			outDataset.put("mapDsMobFirm", mapDsMobFirm);
			outDataset.put("mapEmailAddr2",	mapEmailAddr2);
			outDataset.put("mapDsCustTp2", mapDsCustTp2);
			outDataset.put("mapDsBankCustTp", mapDsBankCustTp);
			outDataset.put("bankType", bankType);
			outDataset.put("useType", useType);
			outDataset.put("mapDsSafekeyResult", mapDsSafekeyResult);
			outDataset.put("mapDsNagYn", mapDsNagYn);

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

	@RequestMapping("/rtms/sd/saveBeforSafeKeyConfirm.do") 
	public ModelAndView saveBeforSafeKeyConfirm(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, Object> outVal			= xpDto.getOutVariableMap();

			String selectSafekey = (String)rTSDCustRegisterService.safeKeyConfirm(inVar);

			outVal.put("selectSafekey", selectSafekey);

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

	@RequestMapping("/rtms/sd/saveBeforSafeKeySelect.do") 
	public ModelAndView saveBeforSafeKeySelect(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, Object> outVal			= xpDto.getOutVariableMap();

			String resultCustNo = (String)rTSDCustRegisterService.countSafeKey(inVar);

			outVal.put("resultCustNo", resultCustNo);

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


	@RequestMapping("/rtms/sd/safeKeyConfirm.do") 
	public ModelAndView safeKeyConfirm(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		String returnCd2 = "";	//응답코드
		String returnMsg = "";
		try
		{
			Map session = (Map)req.getSession().getAttribute("User");

			Map <String, Object> inVar 						= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset 			= xpDto.getOutDataSetMap();
			Map <String, Object> outVal						= xpDto.getOutVariableMap();

			inVar.put("regId", session.get("userId"));
			String resultSafekey = "0";
			String resultCustNo  = "0"; 

			String selectSafekey = (String)rTSDCustRegisterService.safeKeyConfirm(inVar);

			//safekey가 존재하지 않는경우 신규발급을 위해 인터페이스 실행
			if( selectSafekey.equals("0") ){
				//본인인증 I/F
				/*
				int random1 = (int) (Math.random()*10);				int random2 = (int) (Math.random()*10);				int random3 = (int) (Math.random()*10);				int random4 = (int) (Math.random()*10);
				int random5 = (int) (Math.random()*10);				int random6 = (int) (Math.random()*10);				int random7 = (int) (Math.random()*10);				int random8 = (int) (Math.random()*10);
				int random9 = (int) (Math.random()*10);				int random10 = (int) (Math.random()*10);			int random11 = (int) (Math.random()*10);			int random12 = (int) (Math.random()*10);
				int random13 = (int) (Math.random()*10);

				String random ="";

				random += Integer.toString(random1);	random += Integer.toString(random2);	random += Integer.toString(random3);	random += Integer.toString(random4);	random += Integer.toString(random5);
				random += Integer.toString(random6);	random += Integer.toString(random7);	random += Integer.toString(random8);	random += Integer.toString(random9);	random += Integer.toString(random10);
				random += Integer.toString(random11);	random += Integer.toString(random12);	random += Integer.toString(random13);

				resultSafekey=random;
				inVar.put("safekey", resultSafekey);

				Map loginInfo = (Map) req.getSession().getAttribute("User");

				DataSetMap dsm = new DataSetMap();
				Map paramMap = new HashMap();

				paramMap.put(NexacroConstant.DATASET_ROW_TYPE,  DataSet.ROW_TYPE_UPDATED);
				paramMap.put("dvsn", "I");
				paramMap.put("safekey", resultSafekey);
				paramMap.put("creTp", "C");
				paramMap.put("creDay", "20150822");
				paramMap.put("birthDay", inVar.get("birthDay"));
				paramMap.put("custNm", inVar.get("custNm"));
				paramMap.put("mobNo", inVar.get("mobNo"));
				paramMap.put("genderCd", inVar.get("genderCd"));
				dsm.add(paramMap);

				inVar.put("regId",  loginInfo.get("userId"));
				inVar.put("inDsMap",  dsm);
				inVar.put("sqlnamespace", "cust.saveSafeKey");
				 */
				//Map result = rTSDCustRegisterService.saveSafeKey(inVar);

				//1. IR을 통해 NICE 에등록된 safekey를 우선적으로 조회(결과값을 rTSDCustRegisterService.saveSafeKey(inVar) 로 저장처리
				//2. IR로 조회된 결과가 없는경우 아래 팝업출력(이후 결과값을 rTSDCustRegisterService.saveSafeKey(inVar) 로 저장처리

				//IR전문통신은 추후에 추가하도록

				//소켓을 통해 IR전문통신전 RTSD0201 테이블 이력생성(실행시) 입력값등록
				/*******************************************************************************************************
				 *  공통부 정의 Start
				 *******************************************************************************************************/
				String ip 		= propertiesService.getString("doc.send.host");
				String port 	= propertiesService.getString("doc.send.port");
				String size     = propertiesService.getString("ir.send.docSize");

				//String ip = "172.17.163.147";
				//String port = "8090";
				/*String userNm2 = (String)inVar.get("custNm");
				userNm2 = new String(userNm2.getBytes(), "KSC5601");*/

				/*******************************************************************************************************
				 *  공통부 정의 Start
				 *******************************************************************************************************/
				java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat ("yyyyMMddHHmmss", java.util.Locale.KOREA);
				String date = formatter.format(new java.util.Date());
				String transactionCode 			= "";																	//트랜젝션코드
				String docSendGigwanCd  		= "NICEIF   ";														//전문송신기관
				String docGbCd					= "0200";																//전문구분코드
				String bizGbCd					= "76031";															//거래구분코드
				String sendReceiveFlag			= "B";																	//송수신Flag
				String terminalGB				= "503";																//단말기구분
				String returnCd					= "    ";																//응답코드
				String gigwanId					= "NEXEN    ";														//기관 아이디
				String gigwanNo					= "0000000001";														//기관 관리번호
				String gigwanSendTime			= date;																//기관전문 전송시간
				String niceDocNo				= "          ";															//NICE 전문 관리번호
				String niceDocSendTime			= "              ";														//NICE 전문 전송시간
				String sendSpace				= "                 ";													//공란

				/*******************************************************************************************************
				 *  개별요청부 Start
				 *******************************************************************************************************/
				String userBirthDay				= (String)inVar.get("birthDay");								//생년월일

				String userName					= (String)inVar.get("custNm");//inVar.get("custNm") + "                                  ";	//성명


				int totalSize = 40;
				int nmSize = userName.getBytes("ksc5601").length;
				int len = totalSize - nmSize;
				for(int i = 0; i<len; i++) {
					userName = userName + " ";
				}

				//String userName					= userNm2 + "                                  ";	//성명
				String userGenderCd				= (String)inVar.get("genderCd");								//성별
				// 전문형식변경(성별)
				String userGenderCd_			= "2".equals(userGenderCd) ? "0" : userGenderCd;
				String repeatCnt				= "01";															//반복부 건수
				String	sendSpace2				= "                                                 ";				//공란2

				/*******************************************************************************************************
				 *  반복부01 Start
				 *******************************************************************************************************/
				String sendInfoGb01				= "01";															//정보구분
				String mob = (String)inVar.get("mobNo");
				String handPhone01  = "";
				String handPhone02  = "";
				String handPhone03  = "";
				String handPhone04  = "";
				if(mob.length() >= 11) {
					handPhone01 = mob.substring(0, 3) + " ";
					handPhone02 = mob.substring(3, 7);
					handPhone03 = mob.substring(7, 11);
					handPhone04 = "";
				} else {
					handPhone01 = mob.substring(0, 3) + " ";
					handPhone02 = mob.substring(3, 6) + " ";
					handPhone03 = mob.substring(6, 10);
					handPhone04 = "";
				}

				String sendSpace3					= "                                                                                                                                                                                                                                            ";					//공란2


				DataSetMap dsm = new DataSetMap();
				Map paramMap  = new HashMap();
				//상태값을 신규생성상태로 세팅한다.
				paramMap.put(NexacroConstant.DATASET_ROW_TYPE,  1);
				paramMap.put("dvsn", 					"I");

				paramMap.put("custNm",  			inVar.get("custNm"));					//신청자
				paramMap.put("birthDay", 			inVar.get("birthDay"));					//신청자생년월일
				paramMap.put("genderCd", 			inVar.get("genderCd"));					//성별
				paramMap.put("mobNo", 				inVar.get("mobNo")); 					//핸드폰번호
				paramMap.put("yn", 					"N");             			 			//IF 성공여부       
				paramMap.put("prgmCd",				"");              		 				//프로그램 코드     
				paramMap.put("iNd01N", 				"");              	 					//Transaction Code  
				paramMap.put("iNd02N", 				docGbCd);             					//전문그룹코드      
				paramMap.put("iNd03N", 				"");              		 				//거래종별코드      
				paramMap.put("iNd04N",              bizGbCd);             					//거래구분코드      
				paramMap.put("iNd05N",              sendReceiveFlag);    					//송수신 Flag       
				paramMap.put("iNd06N",              terminalGB);          					//단말기구분        
				paramMap.put("iNd07N",              returnCd);            					//응답코드          
				paramMap.put("iNd08N",              gigwanId);              				//User_ID           
				paramMap.put("iNd09N",              gigwanNo);              				//기관전문 관리번호 
				paramMap.put("iNd10N",              date);              					//기관전문 전송시간 
				paramMap.put("iNd11N",              niceDocNo);              				//Nice 전문 관리번호
				paramMap.put("iNd12N",              niceDocSendTime);						//Nice 전문전송시간 
				paramMap.put("iNd13N",              sendSpace);              				//공란              
				paramMap.put("iNd14N",              "");              						//조회동의 사유     
				paramMap.put("iNd15N",              userBirthDay);              			//생년월일          
				paramMap.put("iNd16N",              userName);              				//성명              
				paramMap.put("iNd17N",              "");              						//휴대폰번호        
				paramMap.put("iNd18N",              userGenderCd);             				//성별              
				paramMap.put("iNd19N",              sendSpace2);              				//공란              


				dsm.add(paramMap);
				inVar.put("inDsMap",  dsm);
				inVar.put("sqlnamespace", "custGrp.createIRSafeKey");
				Map resultMap = rTSDCustRegisterService.createIRSafeKey(inVar);
				//저장에성공한경우 IR Interface를 수행한다.
				//소켓통신결과 로 RTSD0201 테이블 이력업데이트

				Map  irMap = new HashMap();
				irMap.put("ip", ip);
				irMap.put("port", port);
				irMap.put("headerSize", size);

				//NICE IR SAFEKEY 전문데이타
				List list = new ArrayList();

				list.add(transactionCode);
				list.add(docSendGigwanCd);
				list.add(docGbCd);
				list.add(bizGbCd);
				list.add(sendReceiveFlag);
				list.add(terminalGB);
				list.add(returnCd);
				list.add(gigwanId);
				list.add(gigwanNo);
				list.add(gigwanSendTime);
				list.add(niceDocNo);
				list.add(niceDocSendTime);
				list.add(sendSpace);

				list.add(userBirthDay);
				list.add(userName);
				//list.add(userGenderCd);
				list.add(userGenderCd_);
				list.add(repeatCnt);
				list.add(sendSpace2);

				list.add(sendInfoGb01);
				list.add(handPhone01);
				list.add(handPhone02);
				list.add(handPhone03);
				list.add(handPhone04);
				list.add(sendSpace3);

				irMap.put("irDsList", list);
				//소켓을 통해 IR SafeKey를 조회한다.
				PCISocketProcess process = new PCISocketProcess();
				String resultString = process.getIRSafeKey(irMap);

				logger.debug("=======================================");
				logger.debug("결과 메시지[" + resultString + "]");
				logger.debug("=======================================");

				String returnDocCd				= "";
				String transactionCode2        	= "";
				String docSendGigwanCd2     	= "";
				String docGbCd2			        = "";
				String bizGbCd2			        = "";
				String sendReceiveFlag2	        = "";
				String terminalGB2		        = "";
				//String returnCd2		        = "";
				String gigwanId2		        = "";
				String gigwanNo2		        = "";
				String gigwanSendTime2	        = "";
				String niceDocNo2		        = "";
				String niceDocSendTime2	        = "";
				String returnSpace2		        = "";
				String userBirthDay2	        = "";
				String userName2		        = "";
				String userGenderCd2	        = "";
				String safekey			        = "";
				String	matchingCd		       	= "";
				String	sendSpace22		        = "";

				//응답코드로 업데이트처리(정상적인 리턴인경우만 처리하도록 한다.
				//byte[] b = resultString.getBytes("ksc5601");
				byte[] b = resultString.getBytes();
				byte[] b2 = resultString.getBytes("utf-8");

				//if(resultString.length() >= 210) { 


				returnDocCd			  = new String(b, 0, 10);	//
				logger.debug("returnDocCd			         " + returnDocCd			);
				docSendGigwanCd2      = new String(b, 10, 9);
				logger.debug("docSendGigwanCd2               " + docSendGigwanCd2       );
				docGbCd2			  = new String(b, 19, 4);
				logger.debug("docGbCd2			             " + docGbCd2			    );
				bizGbCd2			  = new String(b, 23, 5);
				logger.debug("bizGbCd2			             " + bizGbCd2			    );
				sendReceiveFlag2	  = new String(b, 28, 1);
				logger.debug("sendReceiveFlag2	             " + sendReceiveFlag2	    );
				terminalGB2		      = new String(b, 29, 3);
				logger.debug("terminalGB2		             " + terminalGB2		    );
				returnCd2		      = new String(b, 32, 4);
				logger.debug("returnCd2		                 " + returnCd2		        );
				gigwanId2		      = new String(b, 36, 9);
				logger.debug("gigwanNo2		                 " + gigwanNo2		        );
				gigwanNo2		      = new String(b, 45, 10);
				logger.debug("gigwanId2		                 " + gigwanId2		        );
				gigwanSendTime2	      = new String(b, 55, 14);
				logger.debug("gigwanSendTime2	             " + gigwanSendTime2	    );
				niceDocNo2		      = new String(b, 69, 10);
				logger.debug("niceDocNo2		             " + niceDocNo2		        );
				niceDocSendTime2	  = new String(b, 79, 14);
				logger.debug("niceDocSendTime2	             " + niceDocSendTime2	    );
				returnSpace2		  = new String(b, 93, 17);
				logger.debug("returnSpace2		             " + returnSpace2		    );
				userBirthDay2	      = new String(b, 110, 8);
				logger.debug("userBirthDay2	                 " + userBirthDay2	        );
				userName2		      = new String(b, 118, 40);
				logger.debug("userName2		                 " + userName2		        );
				userGenderCd2	      = new String(b, 158, 1);
				logger.debug("userGenderCd2	                 " + userGenderCd2	        );
				safekey			      = new String(b, 159, 13);
				logger.debug("safekey			             " + safekey			    );
				matchingCd		      = new String(b, 172, 2);
				logger.debug("matchingCd		             " + matchingCd		        );
				sendSpace22		      = new String(b, 174, 36);
				logger.debug("sendSpace22		             " + sendSpace22		    );

				/*docSendGigwanCd2      = new String(b, 0, 9);
					docGbCd2			  = new String(b, 9, 4);
					bizGbCd2			  = new String(b, 13, 5);
					sendReceiveFlag2	  = new String(b, 18, 1);
					terminalGB2		      = new String(b, 19, 3);
					returnCd2		      = new String(b, 22, 4);
					gigwanId2		      = new String(b, 26, 9);
					gigwanNo2		      = new String(b, 35, 10);
					gigwanSendTime2	      = new String(b, 45, 14);
					niceDocNo2		      = new String(b, 59, 10);
					niceDocSendTime2	  = new String(b, 69, 14);
					returnSpace2		 = new String(b, 83, 17);
					userBirthDay2	      = new String(b, 100, 8);
					userName2		      = new String(b2,108, 40);
					userGenderCd2	      = new String(b, 148, 1);
					safekey			      = new String(b, 149, 13);
					matchingCd		      = new String(b, 162, 2);
					sendSpace22		      = new String(b, 164, 36);*/




				paramMap.put("eNd01N",              transactionCode2);             	//Transaction Code  
				paramMap.put("eNd02N",              "");              				//전문그룹코드      
				paramMap.put("eNd03N",              "");             				//거래종별코드      
				paramMap.put("eNd04N",              bizGbCd2);              		//거래구분코드      
				paramMap.put("eNd05N",              sendReceiveFlag2);              //송수신 Flag       
				paramMap.put("eNd06N",              terminalGB2);              		//단말기구분        
				paramMap.put("eNd07N",              returnCd2);              		//응답코드          
				paramMap.put("eNd08N",              gigwanId2);             		//User_ID           
				paramMap.put("eNd09N",              gigwanNo2);              		//기관전문 관리번호 
				paramMap.put("eNd10N",              gigwanSendTime2);              	//기관전문 전송시간 
				paramMap.put("eNd11N",              niceDocNo2);              		//Nice 전문 관리번호
				paramMap.put("eNd12N",              niceDocSendTime2);              //Nice 전문전송시간 
				paramMap.put("eNd13N",              returnSpace2);              	//공란              
				paramMap.put("eNd14N",              "");              				//조회동의사유      
				paramMap.put("eNd15N",              userBirthDay2);              	//생년월일          
				paramMap.put("eNd16N",              userName2);              		//성명              
				paramMap.put("eNd17N",              "");              				//휴대폰번호        
				paramMap.put("eNd18N",              safekey);              			//SAFE_KEY          
				paramMap.put("eNd19N",              userGenderCd2);              	//성별              
				paramMap.put("eNd20N",              sendSpace22);              		//공란   

				paramMap.put(NexacroConstant.DATASET_ROW_TYPE,  1);
				paramMap.remove("dvsn");
				paramMap.put("dvsn", 					"U");

				//검색결과로 UPDATE처리한다.
				DataSetMap dsm2 = new DataSetMap();
				dsm2.add(paramMap);
				inVar.remove("inDsMap");
				inVar.put("inDsMap",  dsm2);
				Map resultMap2 = rTSDCustRegisterService.createIRSafeKey(inVar);

				//처리결과가 P000(성공)인경우 신규IR SafeKey를 등록한다.
				//returnCd2 = "P001";
				logger.debug("#######################################################################");
				logger.debug(returnCd2);
				logger.debug("#######################################################################");
				if("P000".equals(returnCd2)) {
					//저장확인용자료
					//safekey = "8833888888882";
					DataSetMap safeKeyDsm = new DataSetMap();
					Map safekeyMap = new HashMap();
					safekeyMap.put(NexacroConstant.DATASET_ROW_TYPE,  DataSet.ROW_TYPE_UPDATED);
					safekeyMap.put("dvsn", "I");
					safekeyMap.put("safekey", safekey);
					safekeyMap.put("creTp", "R");
					safekeyMap.put("creDay", date.substring(0, 8));
					safekeyMap.put("birthDay", inVar.get("birthDay"));
					safekeyMap.put("custNm", inVar.get("custNm"));
					safekeyMap.put("mobNo", inVar.get("mobNo"));
					safekeyMap.put("genderCd", inVar.get("genderCd"));
					safeKeyDsm.add(safekeyMap);

					//기존 정보삭제후 저장처리
					inVar.remove("inDsMap");
					inVar.put("inDsMap",  safeKeyDsm);
					inVar.remove("sqlnamespace");
					inVar.put("sqlnamespace", "cust.saveSafeKey");
					Map result = rTSDCustRegisterService.saveSafeKey(inVar);

					//내부인터페이스를 통해 SAFEKEY가 존재하는경우 해당KEY를 리턴한다.
					resultSafekey = safekey;
					inVar.put("safekey", resultSafekey);
				}
				//}
			} else {	//safekey 가존재하는경우 해당 키를 반환한다.
				resultSafekey = selectSafekey;
				inVar.put("safekey", resultSafekey);
				returnCd2 = "P000";
			}

			if( resultSafekey != "0"){
				resultCustNo = (String)rTSDCustRegisterService.countSafeKey(inVar);
			}

			outVal.put("resultSafekey", 	resultSafekey);
			outVal.put("resultCustNo" , 	resultCustNo);
			outVal.put("resultSuccessCd" , 	returnCd2);
			outVal.put("resultSuccessMsg", 	propertiesService.getString("safekey.msg." + returnCd2));

			//P000	정상
			//S003	데이터 없음		
			//P015	중복건 존재		
			//P001	주민번호 등 요청번호 오류		
			//P017	SafeKey 처리 불가 기관		
			//S602	개별요청부 오류 (성명, 휴대폰 미입력 등)		
			//S702	서비스 이용 권한 오류		
			//S738	대상자정보 오류 (생년월일, 성별)		
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



	@RequestMapping("/rtms/sd/checkBuslNo.do") 
	public ModelAndView checkCdGrpCd(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, Object> outVal			= xpDto.getOutVariableMap();

			int idx = (int)rTSDCustRegisterService.checkBuslNo(inVar);
			outVal.put("resultBuslCnt", idx);
			outVal.put("checkbuslNo", inVar.get("buslNo"));

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

	@RequestMapping("/rtms/sd/saveCustRegister.do") 
	public ModelAndView saveCustRegister(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		Map loginInfo = (Map) req.getSession().getAttribute("User");

		ModelAndView mav = new ModelAndView("nexacroMapView");

		try
		{
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, Object> outVar 		= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();

			inVar.put("regId", loginInfo.get("userId"));

			Map result =  rTSDCustRegisterService.saveCustRegister(inDataset, inVar);

			outVar.put("resultCustNo", result.get("custNo"));

			if (StringUtils.isNotEmpty(inVar.get("docSeq").toString())) {
				inVar.put("receiverSeq", inVar.get("seq"));
				inVar.put("custNo", result.get("custNo"));
				inVar.put("chgId", loginInfo.get("userId"));
				commonService.updateCustNoRtsd0218(inVar);
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


	//계좌 상세내역 select
	@RequestMapping("/rtms/sd/accList.do") 
	public ModelAndView accList(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");

		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();

			Map result = rTSDCustRegisterService.getaccList(inVar, outDataset);

			inVar.put("cdGrpCd", "R001"); //은행코드, 이름
			inVar.put("useYn", "Y");
			Map bankCd = commonService.listCommInfo(inVar);

			inVar.put("cdGrpCd", "S024"); //구분
			inVar.put("useYn", "Y");
			Map dsCustTp = commonService.listCommInfo(inVar);

			inVar.put("cdGrpCd", "C004"); //사용여부
			inVar.put("useYn", "Y");
			Map useYn = commonService.listCommInfo(inVar);

			List resultList	= (List)result.get("accList");

			List bank			= (List)bankCd.get("result");
			List listDsCustTp	= (List)dsCustTp.get("result");	
			List use			= (List)useYn.get("result");

			DataSetMap accList = new DataSetMap();

			DataSetMap bankType = new DataSetMap();
			DataSetMap mapDsCustTp = new DataSetMap();
			DataSetMap useType = new DataSetMap();

			accList.setRowMaps(resultList);
			bankType.setRowMaps(bank);
			mapDsCustTp.setRowMaps(listDsCustTp);
			useType.setRowMaps(use);

			outDataset.put("accList", accList);
			outDataset.put("bankType",	bankType);
			outDataset.put("mapDsCustTp",	mapDsCustTp);
			outDataset.put("useType",	useType);

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

	//계좌저장
	@RequestMapping("/rtms/sd/accSaveDaset.do") 
	public ModelAndView accSaveDaset(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		Map loginInfo = (Map) req.getSession().getAttribute("User");

		ModelAndView mav = new ModelAndView("nexacroMapView");

		try
		{
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, Object> outVar 		= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();

			inVar.put("regId", loginInfo.get("userId"));

			Map result =  rTSDCustRegisterService.saveAccData(inDataset, inVar);

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

	//카드 상세내역 select
	@RequestMapping("/rtms/sd/cardList.do") 
	public ModelAndView cardList(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");

		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();

			Map result = rTSDCustRegisterService.getcardList(inVar, outDataset);

			inVar.put("cdGrpCd", "R002"); //카드코드, 이름
			inVar.put("useYn", "Y");
			Map cardCd = commonService.listCommInfo(inVar);

			inVar.put("cdGrpCd", "S024"); //구분
			inVar.put("useYn", "Y");
			Map dsCustTp = commonService.listCommInfo(inVar);

			inVar.put("cdGrpCd", "C004"); //사용여부
			inVar.put("useYn", "Y");
			Map useYn = commonService.listCommInfo(inVar);

			List resultList	= (List)result.get("cardList");

			List card			= (List)cardCd.get("result");
			List listDsCustTp	= (List)dsCustTp.get("result");	
			List use			= (List)useYn.get("result");

			DataSetMap cardList = new DataSetMap();

			DataSetMap cardType = new DataSetMap();
			DataSetMap mapDsCustTp = new DataSetMap();
			DataSetMap useType = new DataSetMap();

			cardList.setRowMaps(resultList);
			cardType.setRowMaps(card);
			mapDsCustTp.setRowMaps(listDsCustTp);
			useType.setRowMaps(use);

			outDataset.put("cardList", cardList);
			outDataset.put("cardType",	cardType);
			outDataset.put("mapDsCustTp",	mapDsCustTp);
			outDataset.put("useType",	useType);

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

	//카드저장
	@RequestMapping("/rtms/sd/cardSave.do") 
	public ModelAndView cardSave(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		Map loginInfo = (Map) req.getSession().getAttribute("User");

		ModelAndView mav = new ModelAndView("nexacroMapView");

		try
		{
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, Object> outVar 		= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();

			inVar.put("regId", loginInfo.get("userId"));

			Map result =  rTSDCustRegisterService.saveCardData(inDataset, inVar);
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

	@RequestMapping("/rtms/sd/selectRtsd0110.do") 
	public ModelAndView selectRtsd0110(NexacroMapDTO xpDto, Model model) throws Exception {

		ModelAndView mav = new ModelAndView("nexacroMapView");

		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();

			Map result = rTSDCustRegisterService.selectRtsd0110(inVar, outDataset);

			List selectRtsd0110 = (List)result.get("selectRtsd0110");

			DataSetMap mapRtsd0110  = new DataSetMap();
			mapRtsd0110.setRowMaps(selectRtsd0110);

			outDataset.put("mapRtsd0110", mapRtsd0110);

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

	@RequestMapping("/rtms/sd/selectRtsd0111.do") 
	public ModelAndView selectRtsd0111(NexacroMapDTO xpDto, Model model) throws Exception {

		ModelAndView mav = new ModelAndView("nexacroMapView");

		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();

			Map result = rTSDCustRegisterService.selectRtsd0111(inVar, outDataset);

			List selectRtsd0111 = (List)result.get("selectRtsd0111");

			DataSetMap mapRtsd0111  = new DataSetMap();
			mapRtsd0111.setRowMaps(selectRtsd0111);

			outDataset.put("mapRtsd0111", mapRtsd0111);

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

	@RequestMapping("/rtms/sd/selectRtsd0111_2.do") 
	public ModelAndView selectRtsd0111_2(NexacroMapDTO xpDto, Model model) throws Exception {

		ModelAndView mav = new ModelAndView("nexacroMapView");

		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();

			Map result = rTSDCustRegisterService.selectRtsd0111_2(inVar, outDataset);

			List selectRtsd0111_2 = (List)result.get("selectRtsd0111_2");

			DataSetMap mapRtsd0111_2  = new DataSetMap();
			mapRtsd0111_2.setRowMaps(selectRtsd0111_2);

			outDataset.put("mapRtsd0111_2", mapRtsd0111_2);

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

	//NICE 신용정보 조회
	@RequestMapping("/rtms/sd/niceTrustInfo2.do") 
	public ModelAndView niceTrustInfo2(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		Map loginInfo = (Map) req.getSession().getAttribute("User");

		ModelAndView mav = new ModelAndView("nexacroMapView");

		try {

			DataSetMap tranInfo 						= xpDto.getTranInfoMap();
			Map <String, Object> inVar 				= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, Object> outVar 			= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			inVar.put("regId", loginInfo.get("userId"));

			//전문통신을위한 ip, port를 선언한다.
			String ip 		= propertiesService.getString("doc.send.host");
			String port 	= propertiesService.getString("doc.send.port");
			java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat ("yyyyMMddHHmmss", java.util.Locale.KOREA);
			String date = formatter.format(new java.util.Date());
			/******************************************************************************************
			 * 공통부 선언 START -- 전송
			 ******************************************************************************************/
			String transactionCode 		= "";								//Transaction Code
			String docGroupCd				= "NICEIF   ";					//전문그룹코드
			String tradeTypeCd				= "0200";							//거래종별코드
			String traceGbCd				= "1F003";						//거래구분코드
			String sendReceiveFlag 		= "B";								//송수신Flag
			String terminalGb				= "503";							//단말기구분
			String receiveCd					= "    ";							//응답코드
			String gigwanId					= "NEXEN    ";					//기관아이디
			String gigwanDocNo			= "0000000001";					//기관전문 관리번호
			String gigwanDocTime			= date;							//기관전문 전송시간
			String niceDocNo				= "          ";						//NICE 전문 관리번호
			String niceDocTime				= "              ";					//NICE 전문 전송시간
			String primaryBitmap			= "F500000000000001";			//Primary Bitmap
			String searchAgreeCd			= "1";								//조회동의사유코드
			/******************************************************************************************
			 * 공통부 선언 END -- 전송
			 ******************************************************************************************/
			String userType					= "1";								//개인/사업자/법인 구분
			String userSerialNo				= "7305191063521";				//주민등록번호
			String searchCause 			= "03";							//조회사유 코드
			String searchUserCd			= "00000000000000000001";	//조회자 식별코드
			String repeatCnt					= "01"								;//재요청횟수
			String reportInfoNo				= "000000000000";				//보고서 인증번호
			String avgServiceReceiveCnt	= "000";							//평점서비스 수신건수
			String avgServiceRequestCnt  = "99";							//평점서비스 요청건수
			String avgServiceGb				= "64";							//평점서비스구분 정보( 64 )
			String	avgTable					= "RK0202_000";					//평점표  ID

			Map paramMap = new HashMap();
			paramMap.put("safekey", 		userSerialNo);              			//인증번호                         
			paramMap.put("yn", 			"N");              						//IF 성공여부                      
			paramMap.put("iNd01", 		"");              						//[송신]Transaction Code           
			paramMap.put("iNd02", 		docGroupCd);              			//[송신]전문송신기관코드           
			paramMap.put("iNd03", 		tradeTypeCd);              			//[송신]전문구분코드               
			paramMap.put("iNd04",       	traceGbCd);              				//[송신]거래구분코드               
			paramMap.put("iNd05",       	sendReceiveFlag);              		//[송신]송신 FLAG                  
			paramMap.put("iNd06",       	terminalGb);              			//[송신]단말기구분                 
			paramMap.put("iNd07",       	receiveCd);              				//[송신]응답코드                   
			paramMap.put("iNd08",       	gigwanId);              				//[송신]참가기관ID                 
			paramMap.put("iNd09",       	gigwanDocNo);              		//[송신]기관전문 관리번호          
			paramMap.put("iNd10",       	gigwanDocTime);              		//[송신]기관전문 전송시간          
			paramMap.put("iNd11",       	niceDocNo);              			//[송신]NICE 전문 관리번호         
			paramMap.put("iNd12",       	niceDocTime);              			//[송신]NICE 전문 전송시간         
			paramMap.put("iNd13",       	primaryBitmap);              		//[송신]Primary Bitmap             
			paramMap.put("iNd14",       	searchAgreeCd);              		//[송신]조회동의사유코드           
			paramMap.put("iNd15",       	userType);              				//[송신]개인_법인 구분             
			paramMap.put("iNd16",       	userSerialNo);              			//[송신]주민번호                   
			paramMap.put("iNd17",       	searchCause);              			//[송신]조회사유코드               
			paramMap.put("iNd18",       	searchUserCd);              			//[송신]조회자 식별코드            
			paramMap.put("iNd19",       	repeatCnt);              				//[송신]재요청횟수                 
			paramMap.put("iNd20",       	reportInfoNo);              			//[송신]인증번호                   
			paramMap.put("iNd21",       	avgServiceReceiveCnt);				//[송신]평점서비스 수신건수        
			paramMap.put("iNd22",       	avgServiceRequestCnt);				//[송신]평점서비스 요청건수        
			paramMap.put("iNd23",       	avgServiceGb);              			//[송신]평점정보구분               
			paramMap.put("iNd24",       	avgTable);              				//[송신]평점정보코드               


			DataSetMap dsm = new DataSetMap();
			//상태값을 신규생성상태로 세팅한다.
			paramMap.put(NexacroConstant.DATASET_ROW_TYPE,  1);
			paramMap.put("dvsn", 					"I");

			dsm.add(paramMap);
			inVar.put("inDsMap",  dsm);
			inVar.put("sqlnamespace", "custGrp.createNiceTrust");
			Map resultMap = rTSDCustRegisterService.createNiceTrust(inVar);
			//저장에성공한경우 IR Interface를 수행한다.
			//소켓통신결과 로 RTSD0201 테이블 이력업데이트


			Map  irMap = new HashMap();
			irMap.put("ip", ip);
			irMap.put("port", port);
			irMap.put("transactionCode",				transactionCode			); 			//Transaction Code  
			irMap.put("docGroupCd",		    		docGroupCd		    	);       	//전문그룹코드            
			irMap.put("tradeTypeCd",		    		tradeTypeCd		    	);  			//거래종별코드        
			irMap.put("traceGbCd",		        		traceGbCd		    	);   		//거래구분코드            
			irMap.put("sendReceiveFlag", 	    		sendReceiveFlag 		);  			//송수신Flag           
			irMap.put("terminalGb",		    		terminalGb		    	);  			//단말기구분         
			irMap.put("receiveCd",		        		receiveCd		       	 	);        	//응답코드      
			irMap.put("gigwanId",			    		gigwanId					);        	//기관아이디             
			irMap.put("gigwanDocNo",				gigwanDocNo			); 			//기관전문 관리번호             
			irMap.put("gigwanDocTime",	    		gigwanDocTime	    	);    	 	//기관전문 전송시간         
			irMap.put("niceDocNo",		    		niceDocNo		    	);   		//NICE 전문 관리번호  
			irMap.put("niceDocTime",		    		niceDocTime		    	); 			//NICE 전문 전송시간  
			irMap.put("primaryBitmap",	    		primaryBitmap	    	);   		//Primary Bitmap    
			irMap.put("searchAgreeCd",	    		searchAgreeCd	    	);    		//조회동의사유코드      

			irMap.put("userType",				   		userType					);       	//개인/사업자/법인 구분       
			irMap.put("userSerialNo",			   		userSerialNo				);       	//주민등록번호                 
			irMap.put("searchCause", 			   		searchCause 			);    		//조회사유 코드                    
			irMap.put("searchUserCd",			   		searchUserCd			);    		//조회자 식별코드                       
			irMap.put("repeatCnt",			   			repeatCnt			    	);       	//재요청횟수         
			irMap.put("reportInfoNo",			   		reportInfoNo				);       	//보고서 인증번호               
			irMap.put("avgServiceReceiveCnt",	   	avgServiceReceiveCnt	);			//평점서비스 수신건수             
			irMap.put("avgServiceRequestCnt",    	avgServiceRequestCnt	);   		//평점서비스 요청건수             
			irMap.put("avgServiceGb",			   		avgServiceGb			 	);       	//평점서비스구분 정보( 64 )       
			irMap.put("avgTable",			       		avgTable			     	);       	//평점표  ID            

			//소켓을 통해 NICE 신용조회를 진행한다.
			PCINiceTrustSocketProcess process = new PCINiceTrustSocketProcess();
			String resultString = process.getNiceTrustInfo(irMap);

			logger.debug("############################## [Nice 응답 데이타] ###############################");
			logger.debug( resultString);
			logger.debug("############################################################################");

			//응답코드에 해당되는 자료로 업데이트 실행

			/******************************************************************************************
			 * 공통부 선언 START -- 응답
			 ******************************************************************************************/
			String transactionCode2 			= "";					//Transaction Code
			String docGroupCd2				= "";					//전문그룹코드
			String tradeTypeCd2				= "";					//거래종별코드
			String traceGbCd2					= "";					//거래구분코드
			String sendReceiveFlag2 			= "";					//송수신Flag
			String terminalGb2					= "";					//단말기구분
			String receiveCd2					= "";					//응답코드
			String gigwanId2					= "";					//기관아이디
			String gigwanDocNo2				= "";					//기관전문 관리번호
			String gigwanDocTime2			= "";					//기관전문 전송시간
			String niceDocNo2					= "";					//NICE 전문 관리번호
			String niceDocTime2				= "";					//NICE 전문 전송시간
			String primaryBitmap2				= "";					//Primary Bitmap
			String space							= "";					//공란
			/******************************************************************************************
			 * 공통부 선언 END -- 전송
			 ******************************************************************************************/
			String userType2					= "";					//개인/사업자/법인 구분
			String userSerialNo2				= "";					//주민등록번호
			String infoConsecutively 			= "";					//정보연속
			String repeatCnt2					= "";					//재요청횟수
			String userNm						= "";					//성명
			String reportInfoNo2				= "";					//보고서 인증번호
			String avgServiceCnt2				= "";					//평점정보 총건수
			String avgServiceReceiveCnt2  	= "";					//평점정보 응답건수

			String avgServiceGb2				= "";					//평점서비스구분 정보( 64 )
			String	avgTable2					= "";					//평점표  ID


			if(resultString.length() >= 258) {
				docGroupCd2 = resultString.substring(0, 9);
				tradeTypeCd2 = resultString.substring(0, 9);
				docGroupCd2 = resultString.substring(0, 9);
				docGroupCd2 = resultString.substring(0, 9);
				docGroupCd2 = resultString.substring(0, 9);
				docGroupCd2 = resultString.substring(0, 9);
				docGroupCd2 = resultString.substring(0, 9);
				docGroupCd2 = resultString.substring(0, 9);
				docGroupCd2 = resultString.substring(0, 9);
				docGroupCd2 = resultString.substring(0, 9);
				docGroupCd2 = resultString.substring(0, 9);
				docGroupCd2 = resultString.substring(0, 9);
			}
			paramMap.put("eNd01", 		"");  	            					//[수신]Transaction Code           
			paramMap.put("eNd02", 		"");              						//[수신]전문수신기관코드           
			paramMap.put("eNd03", 		"");              						//[수신]전문구분코드               
			paramMap.put("eNd04", 		"");              						//[수신]거래구분코드               
			paramMap.put("eNd05", 		"");              						//[수신]수신 FLAG                  
			paramMap.put("eNd06", 		"");              						//[수신]단말기구분                 
			paramMap.put("eNd07", 		"");              						//[수신]응답코드                   
			paramMap.put("eNd08", 		"");              						//[수신]User ID                    
			paramMap.put("eNd09", 		"");              						//[수신]기관전문 관리번호          
			paramMap.put("eNd10", 		"");              						//[수신]기관전문 전송시간          
			paramMap.put("eNd11", 		"");              						//[수신]NICE 전문 관리번호         
			paramMap.put("eNd12", 		"");              						//[수신]NICE 전문 전송시간         
			paramMap.put("eNd13", 		"");              						//[수신]Primary Bitmap             
			paramMap.put("eNd14", 		"");              						//공란                             
			paramMap.put("eNd15", 		"");              						//[수신]개인_법인 구분             
			paramMap.put("eNd16", 		"");              						//[수신]주민번호                   
			paramMap.put("eNd17", 		"");                                 	//[수신]정보연속                   
			paramMap.put("eNd18", 		"");                                   	//[수신]재요청 횟수                
			paramMap.put("eNd19", 		"");                                   	//[수신]성명                       
			paramMap.put("eNd20",		"");                                   	//[수신]인증번호                   
			paramMap.put("eNd21", 		"");                                   	//[수신]평점 총건수            
			paramMap.put("eNd22", 		"");                                   	//[수신]평점 응답건수          
			paramMap.put("eNd23", 		"");                                   	//[수신]요약1 정보구분         
			paramMap.put("eNd24", 		"");                                   	//[수신]요약코드1              
			paramMap.put("eNd25", 		"");                                  	//[수신]평점 정보구분          
			paramMap.put("eNd26", 		"");                                   	//[수신]평점 평점결과코드    
			paramMap.put("eNd27", 		"");                                   	//[수신]평점 CB 스코어구분명  
			paramMap.put("eNd28", 		"");                                   	//[수신]평점적용배제사유1
			paramMap.put("eNd29", 		"");                                   	//[수신]평점적용배제사유2
			paramMap.put("eNd30", 		"");                                   	//[수신]평점적용배제사유3
			paramMap.put("eNd31", 		"");                                   	//[수신]평점 평점사유1     
			paramMap.put("eNd32", 		"");                                   	//[수신]평점 평점사유2     
			paramMap.put("eNd33", 		"");                                   	//[수신]평점 평점사유3     
			paramMap.put("eNd34", 		"");                                   	//[수신]평점 평점사유4     
			paramMap.put("eNd35", 		"");                                   	//[수신]평점 평점사유5     
			paramMap.put("eNd36",		"");                                   	//[수신]평점 평점사유6     
			paramMap.put("eNd37", 		"");                                   	//[수신]평점 신용평점          
			paramMap.put("eNd38", 		"");                                   	//[수신]평점 신용등급          
			paramMap.put("eNd39", 		"");                                   	//[수신]평점 결과값1           
			paramMap.put("eNd40", 		"");                                   	//[수신]평점 결과값2           
			paramMap.put("eNd41", 		"");                                   	//[수신]평점 결과값3           
			paramMap.put("eNd42", 		"");                                   	//[수신]에러코드                   
			paramMap.put("eNd43", 		"");                                   	//Profile Code 1                   
			paramMap.put("eNd44", 		"");                                   	//Profile Code 2                   
			paramMap.put("eNd45", 		"");                                   	//Profile Code 3                   
			paramMap.put("eNd46", 		"");                                   	//공란     

			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());

			mav.addObject(NexacroConstant.ERROR_CODE, "0");
			mav.addObject(NexacroConstant.ERROR_MSG,  "");	

		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}

	@RequestMapping("/rtms/sd/onlineEnterdupe.do") 
	public ModelAndView onlineEnterdupe(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, Object> outVal			= xpDto.getOutVariableMap();

			String checkCustId = (String)rTSDCustRegisterService.onlineEnterdupe(inVar);
			outVal.put("checkCustId", checkCustId);

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

	@RequestMapping("/rtms/sd/onlineDupe.do") 
	public ModelAndView onlineDupe(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, Object> outVal			= xpDto.getOutVariableMap();

			int countCustId = (int)rTSDCustRegisterService.onlineDupe(inVar);
			outVal.put("countCustId", countCustId);

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

	@RequestMapping("/rtms/sd/insertRtsd0110.do") 
	public ModelAndView insertRtsd0110(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		Map loginInfo = (Map) req.getSession().getAttribute("User");

		ModelAndView mav = new ModelAndView("nexacroMapView");

		try
		{
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, Object> outVar 		= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();

			inVar.put("regId", loginInfo.get("userId"));

			Map result =  rTSDCustRegisterService.insertRtsd0110(inDataset, inVar);
			//System.out.println("###########result##############:"+result);
			outVar.put("resultCustNo", result.get("custNo"));

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

	@RequestMapping("/rtms/sd/getReRentalInfo.do") 
	public ModelAndView getReRentalYN(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		Map loginInfo = (Map) req.getSession().getAttribute("User");

		ModelAndView mav = new ModelAndView("nexacroMapView");

		try
		{
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();

			List result =  rTSDCustRegisterService.getReRentalInfo(inDataset, inVar);

			DataSetMap mapDSReRental  = new DataSetMap();
			mapDSReRental.setRowMaps(result);
			outDataset.put("mapDSReRental", mapDSReRental);

			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());

			mav.addObject(NexacroConstant.ERROR_CODE, outDataset.get("successCode")+"");
			mav.addObject(NexacroConstant.ERROR_MSG,  outDataset.get("returnMessage"));		

		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}


	/**
	 * 
	 * 주문관리 - 고객등록 - 정보제공동의 발송
	 * <p>정보제공동의 여부를 페이싸인 서비스를 통해 발송.</p>
	 *
	 * @param xpDto
	 * @param model
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/rtms/sd/infoPrvAgreeSend.do")  
	public ModelAndView infoPrvAgreeSend(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		Map loginInfo = (Map)req.getSession().getAttribute("User");

		try {
			Map<String, Object> inVar = xpDto.getInVariableMap();
			inVar.put("userId", loginInfo.get("userId"));
			Map<String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map<String, Object> result = rTSDCustRegisterService.infoPrvAgreeSend(inVar);

			DataSetMap mapDsWiderlabSeq  = new DataSetMap();
			mapDsWiderlabSeq.add(result);
			outDataset.put("mapDsWiderlabSeq", mapDsWiderlabSeq);

			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());

			if (result.get("docSeq").equals("")) {
				throw new Exception("와이더랩 오류 입니다. [docSeq 생성 실패]");
			}

			mav.addObject(NexacroConstant.ERROR_CODE, "0");
			mav.addObject(NexacroConstant.ERROR_MSG, "");
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}


	/**
	 * 
	 * 주문관리 - 고객등록 - 정보제공동의 발송 확인
	 * <p>정보제공동의 여부를 페이싸인 서비스를 통해 발송 확인.</p>
	 *
	 * @param xpDto
	 * @param model
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/rtms/sd/infoPrvAgreeSendCheck.do")  
	public ModelAndView infoPrvAgreeSendCheck(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		Map loginInfo = (Map)req.getSession().getAttribute("User");

		try {
			Map<String, Object> inVar = xpDto.getInVariableMap();
			inVar.put("userId", loginInfo.get("userId"));
			Map<String, Object> result = rTSDCustRegisterService.infoPrvAgreeSendCheck(inVar);

			mav.addObject(NexacroConstant.ERROR_CODE, result.get("successCode").toString());
			mav.addObject(NexacroConstant.ERROR_MSG, result.get("returnMessage").toString());
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}


	/**
	 * 
	 * 주문관리 - 고객등록 - 이력조회
	 * <p>고객등록 전 고객의 정보를 통해 과거이력 확인. 채권매각, 연체, 온라인계약고객 등의 정보를 통해 해당 고객의 가입여부를 확인함.</p>
	 *
	 * @param xpDto
	 * @param model
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/rtms/sd/beforeCheckEmpInfo.do")  
	public ModelAndView beforeCheckEmpInfo(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try {
			Map <String, Object> inVar = xpDto.getInVariableMap();

			String srvUrl = req.getRequestURL().toString().toLowerCase();

			if (!(srvUrl.contains("1.254.67.135") || srvUrl.contains("localhost"))) {
				rTSDCustRegisterService.beforeCheckEmpInfo(inVar);
			}

			mav.addObject(NexacroConstant.ERROR_CODE, "0");
			mav.addObject(NexacroConstant.ERROR_MSG, "");
		} catch (Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}

}
