/************************************************************************************
 * nexacro DataFlo SYSTEM 
 * Copyright(c) 2009 nexacro ALLRIGHTS RESERVED.
 * 
 * 1.Program  			: Common DataSet Controller
 * 2.File Name			: XPController.java
 * 3.Developer			: sian
 * 4.Development Date	: 2014.09.06
 * 5.Version			: 0.1
 * 6.Note				: 
 * 7.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.sample.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.StringReader;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLDecoder;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import com.nexacro.xapi.data.DataSet;

import egovframework.ntrms.kr.co.brn.cms.util.PCINiceTrustSocketProcess;
import egovframework.ntrms.kr.co.brn.cms.util.PCISocketProcess;
import egovframework.ntrms.kr.co.brn.comm.service.CommonService;
import egovframework.ntrms.kr.co.brn.sample.service.SampleService;
import egovframework.ntrms.kr.co.brn.sd.service.RTSDCustRegisterService;
import egovframework.ntrms.kr.co.comm.util.DateUtil;
import egovframework.ntrms.kr.co.comm.util.SecurityUtil;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;
import egovframework.rte.fdl.property.EgovPropertyService;

@Controller
public class SampleController {
	
	protected Log logger = LogFactory.getLog(this.getClass());	

	@Resource(name="sampleService")
	SampleService sampleService;
	
	
	@Resource(name="rTSDCustRegisterService")
	RTSDCustRegisterService rTSDCustRegisterService;	
	
	@Resource(name="commonService")
	CommonService commonService;
	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	
	@RequestMapping("/sampleController.do") 
	public ModelAndView operate(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			//DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			//Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			//Map <String, Object> outVar 		= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			
			List li = sampleService.getList(inVar, outDataset);
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
	
	@RequestMapping("/exampleSaveDaset.do") 
	public ModelAndView exampleSaveDaset(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, Object> outVar 		= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			sampleService.exampleSaveDaset(inDataset);
			
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
	
	@RequestMapping("/exampleArray.do") 
	public ModelAndView exampleArray(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, Object> outVar 		= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			sampleService.exampleArray(inDataset);
			
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
	
	/*******************************************
	 * web_safekey 생성후 RTSD0100 데이타생성
	 * @param xpDto
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/rtcms/sd/saveWebSafeKey.do") 
	public ModelAndView saveWebSafeKey(NexacroMapDTO xpDto, Model model, HttpServletRequest request) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map  session = (Map)request.getSession().getAttribute("User");
			String regId = (String)session.get("userId");
			java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat ("yyyyMMdd", java.util.Locale.KOREA);
			String date = formatter.format(new java.util.Date());
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, Object> outVar 		= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			
			String safekey 		= request.getParameter("safeKey");
			String birthDay 	= request.getParameter("birthDay");
			String custNm 		= request.getParameter("custNm");
			
			String str = URLDecoder.decode(custNm, "UTF-8");
			
			String mobNo 		= request.getParameter("mobNo");
			String genderCd 	= request.getParameter("genderCd");
			
			DataSetMap safeKeyDsm = new DataSetMap();
			Map safekeyMap = new HashMap();
			safekeyMap.put(NexacroConstant.DATASET_ROW_TYPE,  DataSet.ROW_TYPE_UPDATED);
			safekeyMap.put("dvsn", 		"I");
			safekeyMap.put("safekey", 	safekey);
			safekeyMap.put("creTp", 	"C");
			safekeyMap.put("creDay", 	date);
			safekeyMap.put("birthDay", 	birthDay);
			safekeyMap.put("custNm", 	str);
			safekeyMap.put("mobNo", 	mobNo);
			safekeyMap.put("genderCd", 	genderCd);
			
			safeKeyDsm.add(safekeyMap);
			
			//기존 정보삭제후 저장처리
			Map in = new HashMap();
			in.put("inDsMap",  safeKeyDsm);
			in.put("sqlnamespace", "cust.saveSafeKey");
			in.put("regId", regId);
			Map result = rTSDCustRegisterService.saveSafeKey(in);

			
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
	
	
	/*******************************************
	 * 신용조회 데이타 조회
	 * @param xpDto
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/ntrms/sd/niceTrustInfoCnt.do") 
	public ModelAndView niceTrustInfoCnt(NexacroMapDTO xpDto, Model model, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try
		{
			java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat ("yyyyMMdd", java.util.Locale.KOREA);
			String date = formatter.format(new java.util.Date());
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, Object> outVar 		= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			List list = new ArrayList();
			
			inVar.put("creDay", date);
			Map map =rTSDCustRegisterService.searchTodayNiceData(inVar);
			
			if(map != null) {
				inVar.put("cdGrpCd", "S048");
				inVar.put("useYn", "Y");
				Map result = commonService.listCommInfo(inVar);
				List listComm	= (List)result.get("result");
				String level = (String)((Map)listComm.get(0)).get("cd");
				
				logger.debug("============================================================");
				logger.debug(map);
				logger.debug(level);
				logger.debug("============================================================");
				
				map.put("cdLevel", level);
				list.add(map);
			}
			
			
			
			
			//사용자정보조회
			DataSetMap userDsMap = new DataSetMap();
			userDsMap.setRowMaps(list);

			outDataset.put("dsNiceCheck",	userDsMap);
			
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
	@RequestMapping("/rtms/sd/niceTrustInfo.do") 
	public ModelAndView niceTrustInfo(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		Map loginInfo = (Map) req.getSession().getAttribute("User");
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try {
			
			DataSetMap tranInfo 						= xpDto.getTranInfoMap();
			Map <String, Object> inVar 					= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 			= xpDto.getInDataSetMap();
			Map <String, Object> outVar 				= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset 		= xpDto.getOutDataSetMap();
			inVar.put("regId", loginInfo.get("userId"));
			
			//전문통신을위한 ip, port를 선언한다.
			String ip 		= propertiesService.getString("doc.send.host");
			String port 	= propertiesService.getString("doc.send.port");
			String size     = propertiesService.getString("nice.send.docSize");
			
			java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat ("yyyyMMddHHmmss", java.util.Locale.KOREA);
			String date = formatter.format(new java.util.Date());
			/******************************************************************************************
			 * 공통부 선언 START -- 전송
			 ******************************************************************************************/
			String transactionCode 			= "";								//Transaction Code
			String docGroupCd				= "NICEIF   ";						//전문그룹코드
			String tradeTypeCd				= "0200";							//거래종별코드
			String traceGbCd				= "1F003";							//거래구분코드
			String sendReceiveFlag 			= "B";								//송수신Flag
			String terminalGb				= "503";							//단말기구분
			String receiveCd				= "    ";							//응답코드
			String gigwanId					= "NEXEN    ";						//기관아이디
			String gigwanDocNo				= "0000000001";						//기관전문 관리번호
			String gigwanDocTime			= date;								//기관전문 전송시간
			String niceDocNo				= "          ";						//NICE 전문 관리번호
			String niceDocTime				= "              ";					//NICE 전문 전송시간
			String primaryBitmap			= "F500000000000001";				//Primary Bitmap
			String searchAgreeCd			= "1";								//조회동의사유코드
			/******************************************************************************************
			 * 공통부 선언 END -- 전송
			 ******************************************************************************************/
			String userType					= "1";								//개인/사업자/법인 구분
			String userSerialNo				= (String)inVar.get("safekey");		//주민등록번호(SafeKey)
			String searchCause 				= "03";								//조회사유 코드
			String searchUserCd				= "00000000000000000001";			//조회자 식별코드
			String repeatCnt				= "01"								;//재요청횟수
			String reportInfoNo				= "000000000000";					//보고서 인증번호
			String avgServiceReceiveCnt		= "000";							//평점서비스 수신건수
			String avgServiceRequestCnt  	= "01";								//평점서비스 요청건수
			String avgServiceGb				= "64";								//평점서비스구분 정보( 64 )
			String avgTable					= "RK0600_000";						//평점표  ID
			
			Map paramMap = new HashMap();
			paramMap.put("safekey", 		userSerialNo);              			//인증번호                         
			paramMap.put("yn", 				"N");              						//IF 성공여부                      
			paramMap.put("iNd01", 			"");              						//[송신]Transaction Code           
			paramMap.put("iNd02", 			docGroupCd);              			//[송신]전문송신기관코드           
			paramMap.put("iNd03", 			tradeTypeCd);              			//[송신]전문구분코드               
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
			List niceList = new ArrayList();
			Map  irMap = new HashMap();
			irMap.put("ip", ip);
			irMap.put("port", port);
			irMap.put("headerSize", size);
			
			niceList.add(transactionCode); 			//Transaction Code  
			niceList.add(docGroupCd);       		//전문그룹코드            
			niceList.add(tradeTypeCd);  			//거래종별코드        
			niceList.add(traceGbCd);   				//거래구분코드            
			niceList.add(sendReceiveFlag);  		//송수신Flag           
			niceList.add(terminalGb);  				//단말기구분         
			niceList.add(receiveCd);        		//응답코드      
			niceList.add(gigwanId);        			//기관아이디             
			niceList.add(gigwanDocNo); 				//기관전문 관리번호             
			niceList.add(gigwanDocTime);    	 	//기관전문 전송시간         
			niceList.add(niceDocNo);   				//NICE 전문 관리번호  
			niceList.add(niceDocTime); 				//NICE 전문 전송시간  
			niceList.add(primaryBitmap);   			//Primary Bitmap    
			niceList.add(searchAgreeCd);    		//조회동의사유코드      

			niceList.add(userType);       			//개인/사업자/법인 구분       
			niceList.add(userSerialNo);       		//주민등록번호                 
			niceList.add(searchCause);    			//조회사유 코드                    
			niceList.add(searchUserCd);    			//조회자 식별코드                       
			niceList.add(repeatCnt);       			//재요청횟수         
			niceList.add(reportInfoNo);       		//보고서 인증번호               
			niceList.add(avgServiceReceiveCnt);		//평점서비스 수신건수             
			niceList.add(avgServiceRequestCnt);   	//평점서비스 요청건수             
			niceList.add(avgServiceGb);       		//평점서비스구분 정보( 64 )       
			niceList.add(avgTable);       			//평점표  ID            
			
			//Socket 데이타를 세팅한다.
			irMap.put("irDsList", niceList);
			
			//소켓을 통해 NICE 신용조회를 진행한다.
			PCISocketProcess process = new PCISocketProcess();
			String resultString = process.getIRSafeKey(irMap);
			
			logger.debug("############################## [Nice 응답 데이타] ###############################");
			logger.debug("[" + resultString + "]");
			logger.debug("############################################################################");
			
			//응답코드에 해당되는 자료로 업데이트 실행
			
			/******************************************************************************************
			 * 공통부 선언 START -- 응답
			 ******************************************************************************************/
			/*String transactionCode2 			= "";					//Transaction Code
			String docGroupCd2					= "";					//전문그룹코드
			String tradeTypeCd2					= "";					//거래종별코드
			String traceGbCd2					= "";					//거래구분코드
			String sendReceiveFlag2 			= "";					//송수신Flag
			String terminalGb2					= "";					//단말기구분
			String receiveCd2					= "";					//응답코드
			String gigwanId2					= "";					//기관아이디
			String gigwanDocNo2					= "";					//기관전문 관리번호
			String gigwanDocTime2				= "";					//기관전문 전송시간
			String niceDocNo2					= "";					//NICE 전문 관리번호
			String niceDocTime2					= "";					//NICE 전문 전송시간
			String primaryBitmap2				= "";					//Primary Bitmap
			String space						= "";					//공란
*/			/******************************************************************************************
			 * 공통부 선언 END -- 전송
			 ******************************************************************************************/
			/*String userType2					= "";					//개인/사업자/법인 구분
			String userSerialNo2				= "";					//주민등록번호
			String infoConsecutively 			= "";					//정보연속
			String repeatCnt2					= "";					//재요청횟수
			String userNm						= "";					//성명
			String reportInfoNo2				= "";					//보고서 인증번호
			String avgServiceCnt2				= "";					//평점정보 총건수
			String avgServiceReceiveCnt2  		= "";					//평점정보 응답건수
			String avgServiceGb2				= "";					//평점서비스구분 정보( 64 )
			String	avgTable2					= "";					//평점표  ID
			String returnDocCd					= "";					//문서전문
*/
			//byte[] b 	= resultString.getBytes("ksc5601");
			byte[] b 	= resultString.getBytes();
			byte[] b2 	= resultString.getBytes("utf-8");
			
			String returnDocHeader			  = new String(b, 0, 10);
			//String transactionCode2			  = "";
			String docGroupCode				  = new String(b, 10, 9);	//전문그룹코드	
			String tradeTypeCode			  = new String(b, 19, 4);	//거래종별코드
			String tradeGbCode				  = new String(b, 23, 5);	//거래구분코드
			String flag2				  	  = new String(b, 28, 1);	//송수신Flag
			String terminalGb2				  = new String(b, 29, 3);	//단말기구분
			String returnCode				  = new String(b, 32, 4);	//응답코드
			String gigwanCode				  = new String(b, 36, 9);	//User ID
			String gigwanNo				  	  = new String(b, 45, 10);	//기관전문 관리번호
			String gigwanSendTime			  = new String(b, 55, 14);	//기관전문 전송시간
			String niceNo				 	  = new String(b, 69, 10);	//NICE 전문 관리번호
			String niceTime				  	  = new String(b, 79, 14);	//NICE 전문 전송시간
			String primaryBitmap2			  = new String(b, 93, 16);	///Primary Bitmap
			String space001				  	  = new String(b, 109, 1);	//공백
			String userGb				  	  = new String(b, 110, 1);	//개인/사업자/법인 구분
			String safekey 				  	  = new String(b, 111, 13);	//주민등록번호
			String infoType				  	  = new String(b, 124, 1);	//정보 연속
			String repeatCnt2				  = new String(b, 125, 2);	//재요청횟수
			String custNm				  	  = new String(b ,127, 12);	//성명
			String docCheckInfo				  = new String(b, 139, 12);	//보고서 인증번호
			String avgTotalCnt				  = new String(b, 151, 3);	//평점정보 총건수
			String replyCnt				  	  = new String(b, 154, 2);	//평점정보 응답건수
			String infoGb				  	  = new String(b, 156, 2);	//정보구분
			
			String avgResult				  = new String(b, 158, 2);	//
			String cbScore				  	  = new String(b, 160, 10);
			String setEtc1				  	  = new String(b, 170, 4);
			String setEtc2				  	  = new String(b, 174, 4);
			String setEtc3				  	  = new String(b, 178, 4);
			String avgSetEtc1				  = new String(b, 182, 4);
			String avgSetEtc2				  = new String(b, 186, 4);
			String avgSetEtc3				  = new String(b, 190, 4);
			String avgSetEtc4				  = new String(b, 194, 4);
			String avgSetEtc5				  = new String(b, 198, 4);
			String avgSetEtc6				  = new String(b, 202, 4);
			String trustScore				  = new String(b, 206, 4);
			String trustLevel				  = new String(b, 210, 4);
			String avgResult1				  = new String(b, 214, 9);
			String avgResult2				  = new String(b, 223, 9);
			String avgResult3				  = new String(b, 232, 9);
			String errCode				  	  = new String(b, 241, 4);
			String profileCode1			  	  = new String(b, 245, 3);
			String profileCode2			  	  = new String(b, 248, 3);
			String profileCode3			  	  = new String(b, 251, 3);
			//String space2			  	  	  = new String(b, 254, 2);
			
			
			logger.debug("returnDocHeader		" + returnDocHeader		);	
			//System.out.println("transactionCode		" + transactionCode2	);	
			logger.debug("docGroupCode		" + docGroupCode		);	
			logger.debug("tradeTypeCode		" + tradeTypeCode		);	
			logger.debug("tradeGbCode		" + tradeGbCode			);	
			logger.debug("flag2				" + flag2				);  	
			logger.debug("terminalGb		" + terminalGb2			);	
			logger.debug("returnCode		" + returnCode			);	
			logger.debug("gigwanCode		" + gigwanCode			);	
			logger.debug("gigwanNo			" + gigwanNo			);  	
			logger.debug("gigwanSendTime	" + gigwanSendTime		);	
			logger.debug("niceNo			" + niceNo				); 	
			logger.debug("niceTime			" + niceTime			);  	
			logger.debug("primaryBitmap2	" + primaryBitmap2		);	
			logger.debug("space001			" + space001			);  	
			logger.debug("userGb			" + userGb				);  	
			logger.debug("safekey 			" + safekey 			);  	
			logger.debug("infoType			" + infoType			);  	
			logger.debug("repeatCnt2		" + repeatCnt2			);	
			logger.debug("custNm			" + custNm				);  	
			logger.debug("docCheckInfo		" + docCheckInfo		);	
			logger.debug("avgTotalCnt		" + avgTotalCnt			);	
			logger.debug("replyCnt			" + replyCnt			);  	
			logger.debug("infoGb			" + infoGb				);  	
			//System.out.println("avgResult			" + avgResult			);	
			logger.debug("cbScore			" + cbScore				);  	
			logger.debug("setEtc1			" + setEtc1				);  	
			logger.debug("setEtc2			" + setEtc2				);  	
			logger.debug("setEtc3			" + setEtc3				);  	
			logger.debug("avgSetEtc1		" + avgSetEtc1			);	
			logger.debug("avgSetEtc2		" + avgSetEtc2			);	
			logger.debug("avgSetEtc3		" + avgSetEtc3			);	
			logger.debug("avgSetEtc4		" + avgSetEtc4			);	
			logger.debug("avgSetEtc5		" + avgSetEtc5			);	
			logger.debug("avgSetEtc6		" + avgSetEtc6			);	
			logger.debug("trustScore		" + trustScore			);	
			logger.debug("trustLevel		" + trustLevel			);	
			logger.debug("avgResult1		" + avgResult1			);	
			logger.debug("avgResult2		" + avgResult2			);	
			logger.debug("avgResult3		" + avgResult3			);	
			logger.debug("errCode			" + errCode				);  	
			logger.debug("profileCode1		" + profileCode1		);  	
			logger.debug("profileCode2		" + profileCode2		);  	
			logger.debug("profileCode3		" + profileCode3		);  	
			//System.out.println("space2			  " + space2			);  	
			
			paramMap.put("eNd01", 		"");  	            		//[수신]Transaction Code           
			paramMap.put("eNd02", 		docGroupCode);              //[수신]전문수신기관코드           
			paramMap.put("eNd03", 		tradeTypeCode);             //[수신]전문구분코드               
			paramMap.put("eNd04", 		tradeGbCode);              	//[수신]거래구분코드               
			paramMap.put("eNd05", 		flag2);              		//[수신]수신 FLAG                  
			paramMap.put("eNd06", 		terminalGb2);              	//[수신]단말기구분                 
			paramMap.put("eNd07", 		returnCode);              	//[수신]응답코드                   
			paramMap.put("eNd08", 		gigwanCode);              	//[수신]User ID                    
			paramMap.put("eNd09", 		gigwanNo);              	//[수신]기관전문 관리번호          
			paramMap.put("eNd10", 		gigwanSendTime);            //[수신]기관전문 전송시간          
			paramMap.put("eNd11", 		niceNo);              		//[수신]NICE 전문 관리번호         
			paramMap.put("eNd12", 		niceTime);              	//[수신]NICE 전문 전송시간         
			paramMap.put("eNd13", 		primaryBitmap2);            //[수신]Primary Bitmap             
			paramMap.put("eNd14", 		space001);              	//공란                             
			paramMap.put("eNd15", 		userGb);              		//[수신]개인_법인 구분             
			paramMap.put("eNd16", 		safekey);              		//[수신]주민번호                   
			paramMap.put("eNd17", 		infoType);                  //[수신]정보연속                   
			paramMap.put("eNd18", 		repeatCnt2);                //[수신]재요청 횟수                
			paramMap.put("eNd19", 		custNm);                    //[수신]성명                       
			paramMap.put("eNd20",		docCheckInfo);              //[수신]인증번호                   
			paramMap.put("eNd21", 		avgTotalCnt);               //[수신]평점 총건수            
			paramMap.put("eNd22", 		replyCnt);                  //[수신]평점 응답건수          
			paramMap.put("eNd23", 		infoGb);                    //[수신]요약1 정보구분         
			paramMap.put("eNd24", 		"");                        //[수신]요약코드1              
			paramMap.put("eNd25", 		"");                        //[수신]평점 정보구분          
			paramMap.put("eNd26", 		"");                        //[수신]평점 평점결과코드    
			paramMap.put("eNd27", 		cbScore);                   //[수신]평점 CB 스코어구분명  
			paramMap.put("eNd28", 		setEtc1);                   //[수신]평점적용배제사유1
			paramMap.put("eNd29", 		setEtc2);                   //[수신]평점적용배제사유2
			paramMap.put("eNd30", 		setEtc3);                   //[수신]평점적용배제사유3
			paramMap.put("eNd31", 		avgSetEtc1);                //[수신]평점 평점사유1     
			paramMap.put("eNd32", 		avgSetEtc2);                //[수신]평점 평점사유2     
			paramMap.put("eNd33", 		avgSetEtc3);                //[수신]평점 평점사유3     
			paramMap.put("eNd34", 		avgSetEtc4);                //[수신]평점 평점사유4     
			paramMap.put("eNd35", 		avgSetEtc5);                //[수신]평점 평점사유5     
			paramMap.put("eNd36",		avgSetEtc6);                //[수신]평점 평점사유6     
			paramMap.put("eNd37", 		trustScore);                //[수신]평점 신용평점          
			paramMap.put("eNd38", 		trustLevel);                //[수신]평점 신용등급          
			paramMap.put("eNd39", 		avgResult1);                //[수신]평점 결과값1           
			paramMap.put("eNd40", 		avgResult2);                //[수신]평점 결과값2           
			paramMap.put("eNd41", 		avgResult3);                //[수신]평점 결과값3           
			paramMap.put("eNd42", 		errCode);                   //[수신]에러코드                   
			paramMap.put("eNd43", 		profileCode1);              //Profile Code 1                   
			paramMap.put("eNd44", 		profileCode2);              //Profile Code 2                   
			paramMap.put("eNd45", 		profileCode3);              //Profile Code 3                   
			paramMap.put("eNd46", 		"");                        //공란     
		
			paramMap.remove("dvsn");
			paramMap.put("dvsn", 					"U");
			dsm.add(paramMap);
			inVar.remove("inDsMap");
			inVar.put("inDsMap",  dsm);
			inVar.remove("sqlnamespace");
			inVar.put("sqlnamespace", "custGrp.createNiceTrust");
			
			
			//응답결과를 업데이트한다.
			rTSDCustRegisterService.createNiceTrust(inVar);
			
			
			if("P000".equals(returnCode)) {
				DataSetMap dsm2 = new DataSetMap();
				//RTSD0202테이블에 신규자료를 생성한다.
				Map param202 = new HashMap();
				param202.put(NexacroConstant.DATASET_ROW_TYPE,  1);
				param202.put("dvsn", 	"I");
				param202.put("safekey", safekey);
				param202.put("creDay", 	date.substring(0, 8));
//				param202.put("crGrade", trustLevel);
				param202.put("crGrade", trustScore);		//20201220 kstka 신용등급 -> 신용평점		
				dsm2.add(param202);
				
				inVar.remove("inDsMap");
				inVar.put("inDsMap",  dsm2);
				inVar.remove("sqlnamespace");
				inVar.put("sqlnamespace", "cust.createNiceTrustInfoMap");
				
				sampleService.createNiceTrustInfoMap(inVar);
			}
			
			Map comMap = new HashMap();
			comMap.put("cdGrpCd", "S048");
			comMap.put("useYn", "Y");
			Map result = commonService.listCommInfo(comMap);
			List listComm	= (List)result.get("result");
			String level = (String)((Map)listComm.get(0)).get("cd");
			
			Map resultMap2 = new HashMap();
			resultMap2.put("returnCode", returnCode);
//			resultMap2.put("trustLevel", trustLevel);
			resultMap2.put("trustLevel", trustScore);		//20201220 kstka 신용등급 -> 신용평점		
			resultMap2.put("cdLevel", level);
			
			System.out.println("trustLevel" + "::" + trustScore );
			
			List resultList = new ArrayList();
			resultList.add(resultMap2);
			
			//신용정보 조회후 결과값리턴
			DataSetMap userDsMap = new DataSetMap();
			userDsMap.setRowMaps(resultList);
			outDataset.put("dsNiceCheck",	userDsMap);			
			
			
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
	
	
	@RequestMapping("/ntrms/sd/niceBisinessSearch.do") 
	public ModelAndView niceBisinessSearch(NexacroMapDTO xpDto, Model model, HttpServletRequest request) throws Exception {
		
		ModelAndView mav =  new ModelAndView("nexacroMapView");
		
		String nice_url	= propertiesService.getString("nice.business.url");
		//String apikey 	= propertiesService.getString("nice.business.apikey");
		String apikey	= SecurityUtil.getCryptoApiKey();
		String resgp 	= propertiesService.getString("nice.business.resgp");
		String uid 		= propertiesService.getString("nice.business.uid");
		String business	= propertiesService.getString("nice.business.business");
		
		URL url = null;
        URLConnection urlConnection = null;
        Map loginInfo = null;
		
        String grade = "";
        
        try {
        	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat ("yyyyMMdd", java.util.Locale.KOREA);
			String date = formatter.format(new java.util.Date());
			
			loginInfo = (Map)request.getSession().getAttribute("User");
			
			Map <String, Object> inVar 				= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset 	= xpDto.getOutDataSetMap();
			
			inVar.put("regId", loginInfo.get("userId"));
			url = new URL(nice_url + apikey + "&" + resgp + "&" + uid + "&" + business + inVar.get("businessNo"));
			
			logger.debug("======================================================================================");
			logger.debug(url.toURI());
			logger.debug("======================================================================================");
			
			urlConnection = url.openConnection();
			InputStream is = urlConnection.getInputStream();
			byte[] buf  = new byte[1024];
			int len = -1;
			
			try {
				while((len = is.read(buf, 0, buf.length)) != -1) {
					System.out.write(buf, 0, len);
				}
				
				String byteToString = new String(buf, 0, buf.length);
				
				DocumentBuilderFactory factory  =  DocumentBuilderFactory.newInstance();
			    DocumentBuilder builder    		=  factory.newDocumentBuilder();
			    Document document     			=  builder.parse(new InputSource(new StringReader(byteToString.trim())));
			    
			    NodeList nodelist     			=  document.getElementsByTagName("Item");
			    Map ins= new HashMap();
			    for(int i = 0; i<nodelist.getLength(); i++) {
			    	Node nNode = nodelist.item(i);
			    	logger.debug("Element :" + nNode.getNodeName());
			    	Element eElement = (Element) nNode;
                    logger.debug("Designation:	"		+ eElement.getAttribute("desc"));
                    logger.debug("basedate:	"			+ eElement.getAttribute("basedate"));
                    logger.debug("source:	"			+ eElement.getAttribute("source"));
                    logger.debug("appridate:	"		+ eElement.getAttribute("appridate"));
                    logger.debug("grade:	"			+ eElement.getAttribute("grade"));
                    logger.debug("crratdivnm:	"		+ eElement.getAttribute("crratdivnm"));
                    logger.debug("crratdivcd:	"		+ eElement.getAttribute("crratdivcd"));
                   
                    ins.put(NexacroConstant.DATASET_ROW_TYPE,  1);
                    ins.put("dvsn", 	"I");
                    ins.put("buslNo", 	inVar.get("businessNo"));
                    ins.put("creDay", 	date);
                    ins.put("coGrade", 	(String)eElement.getAttribute("grade"));
                    grade = (String)eElement.getAttribute("grade");
			    }
			    DataSetMap dsm = new DataSetMap();
				//상태값을 신규생성상태로 세팅한다.
			    dsm.add(ins);
				inVar.put("inDsMap",  dsm);
				inVar.put("sqlnamespace", "cust.createNiceBusinessInfo");
				sampleService.createNiceBusinessInfo(inVar);
				
				Map comMap = new HashMap();
				comMap.put("cdGrpCd", "S050");
				comMap.put("cd", grade);
				String cdNm = sampleService.selectBusinessInfo(comMap);
				//조회된 법인사업자의레벨의 사용여부를 추가한다.
				ins.put("gradeYn", cdNm);
				
				List bisList = new ArrayList();
				bisList.add(ins);
				//신용정보 조회후 결과값리턴
				DataSetMap userDsMap = new DataSetMap();
				userDsMap.setRowMaps(bisList);
				outDataset.put("ds_bis_out",	userDsMap);
				
			}catch(IOException ie) {
				ie.printStackTrace();
			}
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			
			mav.addObject(NexacroConstant.ERROR_CODE, "0");
			mav.addObject(NexacroConstant.ERROR_MSG, "");
			
		} catch(Exception e ) {
			
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	//당일 등록된 법인신용평가정보를 조회한다.
	@RequestMapping("/ntrms/sd/existsBisinessSearch.do") 
	public ModelAndView existsBisinessSearch(NexacroMapDTO xpDto, Model model, HttpServletRequest request) throws Exception {
		
		ModelAndView mav 	=  new ModelAndView("nexacroMapView");
        
        try {
        	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat ("yyyyMMdd", java.util.Locale.KOREA);
			String date = formatter.format(new java.util.Date());
			Map <String, Object> inVar 				= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset 	= xpDto.getOutDataSetMap();
			
			inVar.put("buslNo", inVar.get("businessNo"));
			inVar.put("creDay", date);
			List li = sampleService.searchTodayBisData(inVar, outDataset);
			
			String grade = null;
			String cdNm = null;
			
			if( li.size() != 0 ){
				grade  = (String)((Map)li.get(0)).get("coGrade");
			}
			
			Map map = new HashMap();
			List result = new ArrayList();
			if(grade != null) {
				Map comMap = new HashMap();
				comMap.put("cdGrpCd", "S050");
				comMap.put("cd", grade.trim());
				cdNm = sampleService.selectBusinessInfo(comMap);
				//조회된 법인사업자의레벨의 사용여부를 추가한다.
				map.put("gradeYn", cdNm);
				map.put("grade", grade);
				//신용정보 조회후 결과값리턴
				result.add(map);
			}
			
			
			
			DataSetMap userDsMap = new DataSetMap();
			userDsMap.setRowMaps(result);
			outDataset.put("ds_bis_out",	userDsMap);
			
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			
			mav.addObject(NexacroConstant.ERROR_CODE, "0");
			mav.addObject(NexacroConstant.ERROR_MSG, "");
			
		} catch(Exception e ) {
			
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	} 
	
	/*//당일 등록된 법인신용평가정보를 조회한다.
	@RequestMapping("/cm/comm/userTest.do") 
	public ModelAndView userTest(HttpServletRequest request) throws Exception {
		
		ModelAndView mav 	=  new ModelAndView("nexacroMapView");
		JSONObject obj = new JSONObject();
		obj.put("name", "nexen");
		obj.put("id", 	"nexen");
		obj.put("msg", 	"JSON을 통한 데이타 전송");

        try {
        	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat ("yyyyMMdd", java.util.Locale.KOREA);
			String date = formatter.format(new java.util.Date());
			
			
		} catch(Exception e ) {
			e.printStackTrace();
		}
		return mav;
	} */
	
	
	
	/***********************************************************************************************
	 * 신용평가원 실시간 계좌실명조회 이용기관 전문 
	 ***********************************************************************************************/
	@RequestMapping("/rtms/sms/kftcCmsDocInfo_.do") 
	public ModelAndView kftcCmsDocInfo(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		
		Map loginInfo = (Map) req.getSession().getAttribute("User");
		ModelAndView mav = new ModelAndView("nexacroMapView");
		String userType = "00";	//사업자:01, 개인:00
		String bankCd	= "";	//은행코드
		String acctCd	= "";	//계좌번호
		String bizNo	= "";	//생년월일, 사업자번호
		String custNo	= "";	//고객번호
		String custNm	= "";	//고객명
		String ownerNm  = "";	//예금주
		
		try {
			
			DataSetMap tranInfo 						= xpDto.getTranInfoMap();
			Map <String, Object> inVar 					= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 			= xpDto.getInDataSetMap();
			Map <String, Object> outVar 				= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset 		= xpDto.getOutDataSetMap();
			
			inVar.put("regId", loginInfo.get("userId"));
			//개인 법인구분
			userType 	= (String)inVar.get("userType");
			//은행코드
			bankCd 		= (String)inVar.get("bankCd");
			//계좌번호	
			acctCd		= (String)inVar.get("acctCd");
			//사업자번호 및 생년월일
			bizNo		= (String)inVar.get("bizNo");
			//고객번호
			custNo		= (String)inVar.get("custNo");
			//고객명
			custNm		= (String)inVar.get("custNm");
			//예금주
			ownerNm		= (String)inVar.get("ownerNm");
			
			
			System.out.println("------------------------------");
			System.out.println(inVar);
			System.out.println("------------------------------");
			
			//전문통신을위한 ip, port를 선언한다.
			String ip 		= propertiesService.getString("doc.kftc.host");
			String port 	= propertiesService.getString("doc.kftc.port");
			
			//날짜타입선언
			String date 	= DateUtil.getFormatString("MMddHHmmss");
			String date2 	= DateUtil.getFormatString("HHmmss");
			String date3 	= DateUtil.getFormatString("MMdd");

			//
			String serialKey = date.substring(date.length() - 6, date.length());
			
			
			//=======================================================================================================
			// 전문내용 시작
			//=======================================================================================================
			String transactionCode 			= "";													//트랜젝션코드
			//String byteSize				= "0200";												//TCP/IP전문 Byte수
			String byteSize					= "";													//TCP/IP전문 Byte수
			String openTxt  				= "ISO";												//TEXT 개시문자
			String docHeader				= "023400052";											//전문헤더
			String docType					= "0200";												//전문TYPE
			String primaryBitmap			= "2238000120601000";									//PRIMARY BITMAP
			String tradeGbCd				= "000020";												//거래구분코드
			String docSendTime				= date;													//전문전송일시
			String docCheckNo				= "000001";												//일련번호(임시 : 현재시분초중 6자리)
			String tradStartTime			= date2;												//거래개시시간
			String tradStartDt				= date3; 												//거래개시일
			//String gigwanCd				= "070020000";											//참가기관코드(07고정 + 은행코드 + 0000)
			String gigwanCd					= "07" + bankCd + "0000";								//참가기관코드(07고정 + 은행코드 + 0000)
			//String checkoutAccount		= "379584712536598                        ";			//지정출금계좌번호(37고정 + 계좌번호 + 공백 : 총39자리)
			
			//계좌번호를 제외한 모든 자리수를 공백으로 대체한다.
			int size = 37;
			int len = size - acctCd.length();
			for(int i = 0; i<len; i++) {
				acctCd = acctCd + " ";
			}
			
			String checkoutAccount			= "37" + acctCd;			//지정출금계좌번호(37고정 + 계좌번호 + 공백 : 총39자리)
			String gigwanTypeCd				= "9924216388     ";									//이용기관 식별코드
			String serialNo					= "";
			if("01".equals(userType)) {
				serialNo					= "                         01" + bizNo + "   ";			//납부자번호/생년월일(사업자번호)
			} else {
				serialNo					= "0000000000               00" + bizNo + "       ";			//납부자번호/생년월일(사업자번호)
			}
			String gigwanPwd				= "                ";									//비밀번호
			//String accountRealNm			= "040                                        ";		//계좌실명
			//String returnCode				= "004    ";			
			//============================================================================
			// 전문내용 종료
			//============================================================================
			
			//============================================================================
			// 전문내용저장Map
			//============================================================================
			Map kftHIMap = new HashMap();
			kftHIMap.put("acertDay"		  	,DateUtil.getFormatString("yyyyMMdd")); 	
			kftHIMap.put("acertSeq"		  	,"");	
			kftHIMap.put("bankCd"		  	,bankCd);
			kftHIMap.put("acctNo"	  		,acctCd.trim());
			if("00".equals(userType)) {
				kftHIMap.put("custTp"		  	,"01");	
			} else {
				kftHIMap.put("custTp"		  	,"02");	
			}
			
			if("00".equals(userType)) {
				kftHIMap.put("ebirDay"  		,bizNo);
				kftHIMap.put("buslNo"	  		,null);
			} else {
				kftHIMap.put("ebirDay"  		,null);
				kftHIMap.put("buslNo"	  		,bizNo);
				
			}
			kftHIMap.put("acertId"	  		,loginInfo.get("userId"));	
			kftHIMap.put("custNo"	  		,custNo);
			kftHIMap.put("custNm"  			,custNm);
			kftHIMap.put("acertChk"	  		,"N");	
			kftHIMap.put("acertErrcd"		,"");	
			kftHIMap.put("acertDesc"		,"");	
			kftHIMap.put("ownerNm"	  		,ownerNm);	
			kftHIMap.put("chkcnt"		  	,"0");	
			
			DataSetMap dsm = new DataSetMap();
			//상태값을 신규생성상태로 세팅한다.
			kftHIMap.put(NexacroConstant.DATASET_ROW_TYPE,  DataSet.ROW_TYPE_INSERTED);
			kftHIMap.put("dvsn", 					"I");
			
			dsm.add(kftHIMap);
			inVar.put("inDsMap",  dsm);
			inVar.put("sqlnamespace", "cust.kftcCmsDocInfo");
			Map seqMap = (Map)sampleService.kftcCmsDocInfo(inVar);
			
			System.out.println("--------------------------------------------------------------");
			System.out.println("----------------------결과 " + seqMap + "----------------------------------------");
			System.out.println("--------------------------------------------------------------");
			
			
			//저장에성공한경우 IR Interface를 수행한다.
			//소켓통신결과 로 RTSD0012 테이블 이력업데이트
			List niceList = new ArrayList();
			Map  irMap = new HashMap();
			irMap.put("ip", ip);
			irMap.put("port", port);
			
			List kftcList = new ArrayList();
			kftcList.add(transactionCode); 	
			kftcList.add(byteSize		);	
			kftcList.add(openTxt  		);
			kftcList.add(docHeader		);
			kftcList.add(docType		);	
			kftcList.add(primaryBitmap	);
			kftcList.add(tradeGbCd		);
			kftcList.add(docSendTime	);	
			kftcList.add(docCheckNo		);
			kftcList.add(tradStartTime	);
			kftcList.add(tradStartDt	);	
			kftcList.add(gigwanCd		);	
			kftcList.add(checkoutAccount);	
			kftcList.add(gigwanTypeCd	);	
			kftcList.add(serialNo		);	
			kftcList.add(gigwanPwd		);	
			
			irMap.put("irDsList", kftcList);
			
			//소켓을 통해 IR SafeKey를 조회한다.
			PCISocketProcess process = new PCISocketProcess();
			String resultString = process.getIRSafeKey(irMap);
			
			logger.debug("############################## [Nice 응답 데이타] ###############################");
			logger.debug("[" + resultString + "]");
			logger.debug("############################################################################");
			
			String transactionCode2 	= "";			
			String byteSize2			= "";		
			String openTxt2  			= "";	
			String docHeader2			= "";	
			String docType2				= "";	
			String primaryBitmap2		= "";	
			String tradeGbCd2			= "";	
			String docSendTime2			= "";	
			String docCheckNo2			= "";	
			String tradStartTime2		= "";	
			String tradStartDt2			= "";	
			String gigwanCd2			= "";		
			String checkoutAccount2		= "";	
			String gigwanTypeCd2		= "";		
			String serialNo2	        = "";
			String gigwanPwd2			= "";	
			String accountRealNm2		= "";	
			String returnCode2			= "";
			
			//응답코드에 해당되는 자료로 업데이트 실행
			//응답코드로 업데이트처리(정상적인 리턴인경우만 처리하도록 한다.
			try {
				byte[] b = resultString.getBytes("ksc5601");
				byte[] b2 = resultString.getBytes("utf-8");
				
				byteSize2			  = 	new String(b, 0, 4);		//TCP-IP전문 BYTE수
				openTxt2			  = 	new String(b, 4, 3);		//TEXT개시문자
				docHeader2			  =     new String(b, 7, 9);		//전문헤더
				docType2			  =     new String(b, 16, 4);		//전문TYPE
				primaryBitmap2		  =     new String(b, 20, 16);		//PRIMARY BITMAP
				tradeGbCd2			  =     new String(b, 36, 6);		//거래구분코드
				docSendTime2		  =     new String(b, 42, 10);		//전문전송일시
				docCheckNo2			  =     new String(b, 52, 6);		//전문추적번호
				tradStartTime2		  =     new String(b, 58, 6);		//거래개시시간
				tradStartDt2		  =     new String(b, 64, 4);		//거래개시일
				gigwanCd2			  =     new String(b, 68, 9);		//참가기관코드
				checkoutAccount2	  =     new String(b, 77, 39);		//지정출금계좌번호
				gigwanTypeCd2		  =     new String(b, 116, 15);		//이용기관식별코드
				serialNo2	          =     new String(b, 131, 40);		//납부자번호/생년월일(사업자번호)
				accountRealNm2		  =     new String(b2,171, 43);		//계좌실명
				returnCode2			  =   	new String(b, 214, 7);		//응답코드
				
//				kftHIMap.put("acertErrcd", 		returnCode2);
				kftHIMap.put("acertErrcd", 		"0000");
				kftHIMap.put("acertDesc", 		"");
			} catch(Exception e) {
				//e.printStackTrace();
				
			}
			kftHIMap.put("acertErrcd", 		"0000");
			
			kftHIMap.remove(NexacroConstant.DATASET_ROW_TYPE);
			kftHIMap.put(NexacroConstant.DATASET_ROW_TYPE,  DataSet.ROW_TYPE_UPDATED);
			kftHIMap.remove("dvsn");
			kftHIMap.put("dvsn", 					"U");
			kftHIMap.put("acertSeq", seqMap.get("acertSeq"));
			
			
			DataSetMap dsm2 = new DataSetMap();
			dsm2.add(kftHIMap);
			inVar.put("inDsMap",  dsm2);
			//응답결과를 업데이트한다.
			sampleService.kftcCmsDocInfo(inVar);
			
			
			String returnCode = "0000";
			
			Map cmsOut = new HashMap();
			cmsOut.put("returnCode", returnCode);
			
			List cms = new ArrayList();
			cms.add(cmsOut);
			
			DataSetMap dsm3 = new DataSetMap();
			dsm3.setRowMaps(cms);
			outDataset.put("cmdKey", dsm3);
			
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
}
