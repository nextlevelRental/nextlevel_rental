package egovframework.ntrms.kr.co.brn.cms.controller;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.sql.CallableStatement;
import java.sql.Clob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import oracle.sql.CLOB;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.nexacro.xapi.data.DataSet;

import egovframework.ntrms.kr.co.brn.cms.service.CMSInterfaceService;
import egovframework.ntrms.kr.co.brn.cms.util.PCISocketProcess;
import egovframework.ntrms.kr.co.brn.sample.service.SampleService;
import egovframework.ntrms.kr.co.comm.contants.NexenConstants;
import egovframework.ntrms.kr.co.comm.util.DateUtil;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;
import egovframework.rte.fdl.property.EgovPropertyService;

@Controller
public class CMSInterfaceConnection {
	protected Log logger = LogFactory.getLog(this.getClass());	
	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	@Resource(name="cMSInterfaceService")
	CMSInterfaceService cMSInterfaceService;
	
	@Resource(name="sampleService")
	SampleService sampleService;
	
	@RequestMapping("rtms/cms/cmsInterfaceConnection.do") 
	public ModelAndView cmsInterfaceConnection(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map <String, Object> inVar 				= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset 	= xpDto.getOutDataSetMap();
			
			Map resultMap = null;
			DataSetMap codeDsMap1 = new DataSetMap();
			DataSetMap codeDsMap2 = new DataSetMap();
			
			String ip 		= propertiesService.getString("doc.send.host");
			String port 	= propertiesService.getString("doc.send.port");
			String size     = propertiesService.getString("ir.send.docSize");
			
			try {
				/*******************************************************************************************************
				 *  공통부 정의 Start
				 *******************************************************************************************************/
				java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat ("yyyyMMddHHmmss", java.util.Locale.KOREA);
				String date = formatter.format(new java.util.Date());
				
				//====================================================================
				// 전문내용 시작
				//====================================================================
				String transactionCode 			= "";													//트랜젝션코드
				String byteSize					= "0200";												//TCP/IP전문 Byte수
				String openTxt  				= "ISO";												//TEXT 개시문자
				String docHeader				= "023400052";											//전문헤더
				String docType					= "0200";												//전문TYPE
				String primaryBitmap			= "223800012060100";									//PRIMARY BITMAP
				String tradeGbCd				= "000020";												//거래구분코드
				String docSendTime				= date.substring(4, 14);								//전문전송일시
				String docCheckNo				= "000000";												//일련번호
				String tradStartTime			= date.substring(8, 14);								//거래개시시간
				String tradStartDt				= date.substring(4, 8); 								//거래개시일
				String gigwanCd					= "070000000";											//참가기관코드
				String checkoutAccount			= "1234567890                             ";			//지정출금계좌번호
				String gigwanTypeCd				= "0000000001     ";									//이용기관 식별코드
				String serialNo					= "19990101                 011990101      ";			//납부자번호/생년월일(사업자번호)
				String gigwanPwd				= "                ";									//비밀번호
				String accountRealNm			= "040                                        ";		//계좌실명
				//============================================================================
				// 전문내용 종료
				//============================================================================
				
				DataSetMap dsm = new DataSetMap();
				Map paramMap  = new HashMap();
				//상태값을 신규생성상태로 세팅한다.
				paramMap.put(NexacroConstant.DATASET_ROW_TYPE,  1);
				paramMap.put("dvsn", 					"I");
				
				paramMap.put("transactionCode",    transactionCode 	);
				paramMap.put("byteSize",    byteSize			);
				paramMap.put("openTxt",    openTxt  			);
				paramMap.put("docHeader			    ",    docHeader			);
				paramMap.put("docType				",    docType			);
				paramMap.put("primaryBitmap		    ",    primaryBitmap		);
				paramMap.put("tradeGbCd			    ",    tradeGbCd			);
				paramMap.put("docSendTime			",    docSendTime		);
				paramMap.put("docCheckNo			",    docCheckNo		);
				paramMap.put("tradStartTime		    ",    tradStartTime		);
				paramMap.put("tradStartDt			",    tradStartDt		);
				paramMap.put("gigwanCd				",    gigwanCd			);
				paramMap.put("checkoutAccount		",    checkoutAccount	);
				paramMap.put("gigwanTypeCd			",    gigwanTypeCd		);
				paramMap.put("serialNo				",    serialNo			);
				paramMap.put("gigwanPwd			    ",    gigwanPwd			);
				paramMap.put("accountRealNm		    ",    accountRealNm		);
				
				
				dsm.add(paramMap);
				inVar.put("inDsMap",  dsm);
				inVar.put("sqlnamespace", "custGrp.createIRSafeKey");

			}catch(Exception e) {
				
			}
			String returnCode = "0000";
			
			Map cmsOut = new HashMap();
			cmsOut.put("returnCode", returnCode);
			
			List cms = new ArrayList();
			cms.add(cmsOut);
			
			DataSetMap dsm = new DataSetMap();
			dsm.setRowMaps(cms);
			outDataset.put("cmdKey", dsm);
			
			//logger.debug(resultMap.get("resultMsg"));
			//logger.debug(resultMap.get("resultCode"));
			
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
	

	/***********************************************************************************************
	 * 신용평가원 실시간 계좌실명조회 이용기관 전문 
	 ***********************************************************************************************/
	@RequestMapping("/rtms/sms/kftcCmsDocInfo.do") 
	public ModelAndView kftcCmsDocInfo(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		
		Map loginInfo = (Map) req.getSession().getAttribute("User");
		ModelAndView mav = new ModelAndView("nexacroMapView");
		String userType = "01";	//개인:01, 법인:02
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
			
			
			String s_date 	= DateUtil.getFormatString("yyyyMMdd");
			Map<String, Object> sMap = new HashMap<String, Object>();
			sMap.put("acertDay", 	s_date);
			sMap.put("bankCd", 		bankCd);
			sMap.put("acctCd", 		acctCd);
			sMap.put("userType", 	userType);
			sMap.put("bizNo", 		bizNo);
			Map resultMap = cMSInterfaceService.existsCmsInterface(sMap);
			List li = (List)resultMap.get("vcursor");
			
			//결과가 있고 결과가 0000 인경우 별도 인터페이스 없이 진행되도록 처리
			//결과가 없거나 0000 이 아닌경우 Interface를 실행한다.
			
			String returnCode2 = "";	//화면에 리턴하기위한 결과코드
			
			String tmpResultCd = "";	//기저장된 리턴코드를 받기위한 변수선언
			
			if(li.size() > 0) {
				tmpResultCd = (String)((Map)li.get(0)).get("returnCode");
			}
			
			if("0000".equals(tmpResultCd)) {
				returnCode2 = tmpResultCd;
			} else {
			
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
				if("02".equals(userType)) {
					serialNo					= "                         01" + bizNo + "   ";			//납부자번호/생년월일(사업자번호)
				} else {
					serialNo					= "0000000000               00" + bizNo + "       ";		//납부자번호/생년월일(사업자번호)
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
				
				
				//02 사업자
				//01 개인
				
				if("01".equals(userType)) {
					kftHIMap.put("custTp"		  	,"01");	
				} else {
					kftHIMap.put("custTp"		  	,"02");	
				}
				
				if("01".equals(userType)) {
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
				Map seqMap = (Map)cMSInterfaceService.kftcCmsDocInfo(inVar);
				
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
				String resultString = "";
				try {
					logger.debug("전문통신 Start!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
					PCISocketProcess process = new PCISocketProcess();
					resultString = process.getIRSafeKey(irMap);
					logger.debug("전문통신 End!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
				} catch(Exception e) {
					logger.debug( e );
				}
				//String resultString = "                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           ";
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
				//String returnCode2			= "";
				
				//응답코드에 해당되는 자료로 업데이트 실행
				//응답코드로 업데이트처리(정상적인 리턴인경우만 처리하도록 한다.
				try {
					byte[] b = resultString.getBytes();
					byte[] b2 = resultString.getBytes("utf-8");
					
					//byteSize2			  = 	new String(b, 0, 4);		//TCP-IP전문 BYTE수
					openTxt2			  = 	new String(b, 0, 3);		//TEXT개시문자
					docHeader2			  =     new String(b, 3, 9);		//전문헤더
					docType2			  =     new String(b, 12, 4);		//전문TYPE
					primaryBitmap2		  =     new String(b, 16, 16);		//PRIMARY BITMAP
					tradeGbCd2			  =     new String(b, 32, 6);		//거래구분코드
					docSendTime2		  =     new String(b, 38, 10);		//전문전송일시
					docCheckNo2			  =     new String(b, 48, 6);		//전문추적번호
					tradStartTime2		  =     new String(b, 54, 6);		//거래개시시간
					tradStartDt2		  =     new String(b, 60, 4);		//거래개시일
					gigwanCd2			  =     new String(b, 64, 9);		//참가기관코드
					checkoutAccount2	  =     new String(b, 73, 39);		//지정출금계좌번호
					gigwanTypeCd2		  =     new String(b, 112, 15);		//이용기관식별코드
					serialNo2	          =     new String(b, 127, 40);		//납부자번호/생년월일(사업자번호)
					accountRealNm2		  =     new String(b,167, 43);		//계좌실명
					returnCode2			  =   	new String(b, 213, 4);		//응답코드
					
	//				kftHIMap.put("acertErrcd", 		returnCode2);
					//kftHIMap.put("acertErrcd", 		"0000");
					//kftHIMap.put("acertDesc", 		"");
				} catch(Exception e) {
					//e.printStackTrace();
					
				}
				kftHIMap.remove("acertErrcd");	
				kftHIMap.put("acertErrcd", 		returnCode2);
				
				kftHIMap.remove(NexacroConstant.DATASET_ROW_TYPE);
				kftHIMap.put(NexacroConstant.DATASET_ROW_TYPE,  DataSet.ROW_TYPE_UPDATED);
				kftHIMap.remove("dvsn");
				kftHIMap.put("dvsn", 					"U");
				kftHIMap.put("acertSeq", seqMap.get("acertSeq"));
				
				
				kftHIMap.remove("acertChk");
				
				if("0000".equals(returnCode2)) {
					kftHIMap.put("acertChk", "Y");
				} else {
					kftHIMap.put("acertChk", "N");
				}
				
				DataSetMap dsm2 = new DataSetMap();
				dsm2.add(kftHIMap);
				inVar.put("inDsMap",  dsm2);
				//응답결과를 업데이트한다.
				cMSInterfaceService.kftcCmsDocInfo(inVar);
				
			}
			
			//String returnCode = "0000";
			
			//응답코드에 해당되는 메시지를 조회한다.
			
			//commonService.listCommInfo(map);
			Map comMap = new HashMap();
			comMap.put("cdGrpCd", "R003");
			comMap.put("cd", returnCode2);
			String returnMsg = sampleService.selectBusinessInfo(comMap);
			
			Map cmsOut = new HashMap();
			cmsOut.put("returnCode", returnCode2);
			cmsOut.put("returnMsg", returnMsg);
			
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
	
	@RequestMapping("/ntrms/cms/existsCmsInterface.do") 
	public ModelAndView existsCmsInterface(NexacroMapDTO xpDto, Model model, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map loginInfo = (Map)request.getSession().getAttribute("User");
			DataSetMap tranInfo 						= xpDto.getTranInfoMap();
			Map <String, Object> inVar 					= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 			= xpDto.getInDataSetMap();
			Map <String, Object> outVar 				= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset 		= xpDto.getOutDataSetMap();
			inVar.put("regId", loginInfo.get("userId"));
	       
			
			String date 	= DateUtil.getFormatString("yyyyMMdd");
			inVar.put("acertDay", date);
			Map resultMap = cMSInterfaceService.existsCmsInterface(inVar);
			List li = (List)resultMap.get("vcursor");
			
			DataSetMap dsOut = new DataSetMap();
			dsOut.setRowMaps(li);
			outDataset.put("cms_output", dsOut);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			
			mav.addObject(NexacroConstant.ERROR_CODE, resultMap.get("successCode") + "");
			mav.addObject(NexacroConstant.ERROR_MSG, resultMap.get("returnMessage"));
		
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
		
	@RequestMapping("/rtms/sms/arsCallService.do") 
	public ModelAndView arsCallService(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		
		Map loginInfo = (Map) req.getSession().getAttribute("User");
		ModelAndView mav = new ModelAndView("nexacroMapView");
		String userType = "01";	//개인:01, 법인:02
		String bankCd	= "";	//은행코드
		String acctCd	= "";	//계좌번호
		String bizNo	= "";	//생년월일, 사업자번호
		String custNo	= "";	//고객번호
		String custNm	= "";	//고객명
		String ownerNm  = "";	//예금주
		String authInquery = "";
		String bankNm = "";
		String mobNo = "";
		String trCd = "2300";
        String recordData = "";
        String respTrCd = "";
        String txtNo = "";	
        String rsltMsg = "";
        String rsltCd = "";
        String authNo = "00";
        Connection conn = null;
		CallableStatement cs = null;        
		
        URL url = null;
        URLConnection urlConnection = null;	
        //String sUrl = "http://dev.coocon.co.kr/sol/gateway/ars_wapi.jsp"; // dev
        String sUrl = "https://gw.coocon.co.kr/sol/gateway/ars_wapi.jsp"; //real  
//        sUrl = "https://dev2.coocon.co.kr:8443/sol/gateway/ars_wapi.jsp"; //test

		try {
			DataSetMap tranInfo 						= xpDto.getTranInfoMap();
			Map <String, Object> inVar 					= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 			= xpDto.getInDataSetMap();
			Map <String, Object> outVar 				= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset 		= xpDto.getOutDataSetMap();
			
			inVar.put("regId", loginInfo.get("userId")); 
			userType 	= (String)inVar.get("userType"); //개인 법인구분
			bankCd 		= (String)inVar.get("bankCd"); //은행코드	
			acctCd		= (String)inVar.get("acctCd"); //계좌번호
			bizNo		= (String)inVar.get("bizNo"); //사업자번호 및 생년월일
			custNo		= (String)inVar.get("custNo"); //고객번호 
			custNm		= (String)inVar.get("custNm"); //고객명
			ownerNm		= (String)inVar.get("ownerNm"); //예금주
			bankNm		= (String)inVar.get("bankNm"); 
			mobNo		= (String)inVar.get("mobNo"); 
			

			JSONObject jsonObject = new JSONObject(); //최종 완성될 JSONObject 선언(전체)
			//JSONArray personArray = new JSONArray(); //person의 JSON정보를 담을 Array 선언
			JSONObject personInfo = new JSONObject(); //person의 한명 정보가 들어갈 JSONObject 선언
			
			Calendar calendar = Calendar.getInstance();
            java.util.Date date = calendar.getTime();
            String callDt = (new SimpleDateFormat("yyyyMMddHHmmss").format(date));
            
	        personInfo.put("TR_CD", trCd); //정보 입력
	        personInfo.put("SECR_KEY", "jj0V4mXT1U4qeqx5CFAL");
	        personInfo.put("ORG_CD", "20018");
	        personInfo.put("DATE", callDt);
	        personInfo.put("PHONE", mobNo);
	        long tmpNo = (long) Math.floor(Math.random() * 100);
	        authNo = String.format("%02d", tmpNo);
	        personInfo.put("AUTH_NO", authNo);
	        if(userType.equals("01")){
	        	authInquery = "안녕하세요 넥센타이어입니다. " + bizNo.substring(0,4) + "년 " + Integer.parseInt(bizNo.substring(4,6)) + "월 " 
	        				+ Integer.parseInt(bizNo.substring(6,8)) + "일생 " + ownerNm + " 고객님의 " + bankNm 
    		                + "<digit>" + acctCd + "</digit> 계좌에서 넥센타이어로 자동이체 출금에 대해 동의하시겠습니까?";
    		}else{
    			authInquery = "안녕하세요 넥센타이어입니다. 사업자번호 <digit>" + bizNo + "</digit> " + ownerNm + " 고객님의 " + bankNm 
    			            + "<digit>" + acctCd + "</digit> 계좌에서 넥센타이어로 자동이체 출금에 대해 동의하시겠습니까?";
    		}	   
	        //authInquery ="안녕하세요"; // test
	        personInfo.put("AUTH_INQUERY", authInquery);
	        personInfo.put("REC_INQUERY", "");
	        personInfo.put("FILE_SAVE_YN", "");
	        personInfo.put("FILE_NM", "");

	        String jsonInfo = personInfo.toJSONString(); //JSONObject를 String 객체에 할당

            url = new URL(sUrl);
            urlConnection = url.openConnection();
            urlConnection.setDoOutput(true);

            printByOutputStream(urlConnection.getOutputStream(), "JSONData=" + encodeURIComponent(encodeURIComponent(jsonInfo)));
            
            String outJsonInfo = printByInputStream(urlConnection.getInputStream());
            JSONParser jsonParser = new JSONParser(); //JSON데이터를 넣어 JSON Object 로 만들어 준다.
            JSONObject outJsonObject = (JSONObject) jsonParser.parse(outJsonInfo);
            JSONArray infoArray = (JSONArray) outJsonObject.get("RESP_DATA"); //배열을 추출

            if(infoArray != null && !infoArray.equals(null)){
            	for(int i=0; i<infoArray.size(); i++){                 
	                JSONObject jObject = (JSONObject) infoArray.get(i); //배열 안에 있는것도 JSON형식 이기 때문에 JSON Object 로 추출
	                 
	                respTrCd = (String)jObject.get("TR_CD"); //JSON name으로 추출
	                recordData = (String)jObject.get("RECORD_DATA");
	                txtNo = (String)jObject.get("TXT_NO"); 
	            }
            }
            rsltMsg = (String)outJsonObject.get("RSLT_MSG");
            rsltCd = (String)outJsonObject.get("RSLT_CD");
            
    		ByteArrayOutputStream baos = new ByteArrayOutputStream();
    		if(rsltCd.equals("0000")){
    			FileOutputStream fos = new FileOutputStream(NexenConstants.EI13_ARS_PATH + txtNo + ".mp3");

    		    for(int i=0; i < recordData.length(); i+= 2){
    		    	int b = Integer.parseInt(recordData.substring(i, i+2), 16);
    		    	baos.write(b);
    		    	//fos.write(b);
    			} 
    		    baos.writeTo(fos); 
    		    fos.close();		    
    		}
    		
    		ByteArrayInputStream bis = new ByteArrayInputStream(baos.toByteArray());

	        Class.forName("oracle.jdbc.driver.OracleDriver");
	        //conn = DriverManager.getConnection("jdbc:oracle:thin:@172.17.0.135:1521:NXNEWBIZDEV", "NXRADMIN", "rental~2015^*"); // dev
	        conn = DriverManager.getConnection("jdbc:oracle:thin:@172.17.0.138:1521:NXNEWBIZ", "NXRADMIN", "admin_9_rental"); // real
			cs = conn.prepareCall("{call NXRADMIN.Pkg_Rtre0013.p_IUDRtre0013( 'I', ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}");
			
	        cs.setString(1, mobNo);
	        cs.setString(2, ownerNm);
	        cs.setString(3, userType);
    		if(userType.equals("01")){
    	        cs.setString(4, bizNo);
    	        cs.setString(5, "");        			
    		}else{
    	        cs.setString(4, "");
    	        cs.setString(5, bizNo);        			
    		}     	        
	        cs.setString(6, bankCd);
	        cs.setString(7, acctCd);
	        cs.setString(8, trCd);
	        cs.setString(9, callDt);
	        cs.setString(10, rsltCd);
	        cs.setString(11, rsltMsg);
	        cs.setString(12, respTrCd);
	        cs.setString(13, txtNo);
	        cs.setBinaryStream(14, bis, baos.size()); // recordData	        
	        cs.setString(15, loginInfo.get("userId").toString());
			cs.registerOutParameter(16, java.sql.Types.DECIMAL);
			cs.registerOutParameter(17, java.sql.Types.VARCHAR);
			cs.registerOutParameter(18, java.sql.Types.VARCHAR);
			cs.execute();
			String logData = "V_SUCCESS_CODE:" + cs.getInt(16) + "\t" + "V_RETURN_MESSAGE:" + cs.getString(17)+  "\t" + "V_ERRORTEXT:" + cs.getString(18);
			System.out.println(logData);
    			
    		if(rsltCd.equals("0000")){
    			mav.addObject(NexacroConstant.ERROR_CODE, cs.getInt(16) + ""); // string 변환 필수
    			mav.addObject(NexacroConstant.ERROR_MSG, cs.getString(17));
    		}else{
    			mav.addObject(NexacroConstant.ERROR_CODE, rsltCd);
    			mav.addObject(NexacroConstant.ERROR_MSG, rsltMsg);    			
    		}
            baos.close();
            bis.close();    		
	        
		}
		catch( SQLException e ) {
			throw new SQLException( e.getMessage(), e.getCause() );	
		}
		catch( ClassNotFoundException e ) {
			throw new ClassNotFoundException( e.getMessage(), e.getCause() );
		}
		finally{
			if( cs != null ) {
				try {
					cs.close();
					conn.close();
				}
				catch( SQLException e ) {
					mav.addObject(NexacroConstant.ERROR_CODE, "-1");
					mav.addObject(NexacroConstant.ERROR_MSG, e.toString());							
				}
			}
		}		
	        
		return mav;
	}	
	
    // 웹 서버로 부터 받은 웹 페이지 결과를 콘솔에 출력하는 메소드
    public static String printByInputStream(InputStream is) {
        byte[] buf = new byte[2048];
        StringBuffer sb = new StringBuffer(); 
        ByteArrayOutputStream bout = new ByteArrayOutputStream();
        byte[] resMessage = null;
        String output = "";

        try {
            while (true) {
                int n = is.read(buf);
                if (n == -1){ 
                	break;
                }
                bout.write(buf, 0, n);
            }
            bout.flush(); 
            resMessage = bout.toByteArray();   
            output = new String(resMessage, "EUC-KR");
            
        } catch(IOException e) {
            e.printStackTrace();
        }
		return output;
    }
 
    // 웹 서버로 파라미터명과 값의 쌍을 전송하는 메소드
    public static void printByOutputStream(OutputStream os, String msg) {
        try {
            byte[] msgBuf = msg.getBytes("UTF-8");
            os.write(msgBuf, 0, msgBuf.length);
            os.flush();
        } catch(IOException e) {
            e.printStackTrace();
        }
    }	
    
    public static String encodeURIComponent(String s)
    {
    	String result = null;  
    	
    	try{
    		result = URLEncoder.encode(s, "UTF-8")
    				.replaceAll("\\+", "%20")
    				.replaceAll("\\%21", "!")
    				.replaceAll("\\%27", "'")
    				.replaceAll("\\%28", "(")
    				.replaceAll("\\%29", ")")
    				.replaceAll("\\%7E", "~");
    	}catch (UnsupportedEncodingException e)
    	{
    		result = s;
    	}  
    	return result;
    }    
    
    private Clob createClob(byte[] data, Connection conn) {
        CLOB clob = null; 

        try { 
            clob = CLOB.createTemporary(conn, false, oracle.sql.CLOB.DURATION_SESSION);

            clob.open(CLOB.MODE_READWRITE);

            OutputStream out = (OutputStream) clob.setAsciiStream(0L);

            out.write(data);
            out.flush();
            out.close();
        }
        catch (Exception e) {
            logger.error("", e);
        }
        finally {
            try {
                if (clob != null && clob.isOpen()) clob.close();
            }
            catch (SQLException e) {
                logger.error("Unable to close CLOB", e);
            }
        }

        return clob;
    }    
}
