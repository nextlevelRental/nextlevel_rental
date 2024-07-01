/************************************************************************************
 * nexacro DataFlo SYSTEM 
 * Copyright(c) 2009 nexacro ALLRIGHTS RESERVED.
 * 
 * 1.Program  			: Common DataSet Service Implement
 * 2.File Name			: XPServiceImpl.java
 * 3.Developer			: sian
 * 4.Development Date	: 2014.09.06
 * 5.Version			: 0.1
 * 6.Note				: 
 * 7.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.sample.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.nexacro.xapi.data.DataSet;

import egovframework.ntrms.kr.co.brn.cms.util.PCISocketProcess;
import egovframework.ntrms.kr.co.brn.comm.service.CommonService;
import egovframework.ntrms.kr.co.brn.sample.dao.SampleMapDAO;
import egovframework.ntrms.kr.co.brn.sd.service.RTSDCustRegisterService;
import egovframework.ntrms.kr.co.comm.util.StringUtil;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.property.EgovPropertyService;

@Service("sampleService")
@SuppressWarnings("unchecked")
public class SampleServiceImpl extends EgovAbstractServiceImpl implements SampleService {
	protected Log logger = LogFactory.getLog(this.getClass());	
	
	@Resource(name="sampleMapDAO")
	SampleMapDAO sampleMapDAO;
	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	@Resource(name="rTSDCustRegisterService")
	RTSDCustRegisterService rTSDCustRegisterService;
	
	@Resource(name="commonService")
	CommonService commonService;
	
	//목록조회
	public List<Map> getList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		return sampleMapDAO.getList(inVar, outDataset);
	}
	
	//데이타생성, 수정, 삭제
	public void exampleSaveDaset(Map<String, DataSetMap> inDataset)
		throws Exception {
		DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
		for(int i = 0; i<inDsMap.size(); i++) {
			Map map = inDsMap.get(i);
			int rowType = ((Integer) map.get(NexacroConstant.DATASET_ROW_TYPE)).intValue(); 
			if(rowType == DataSet.ROW_TYPE_INSERTED) {
				map.put("dvsn", "I");
				System.out.println(map);
			} else if(rowType == DataSet.ROW_TYPE_UPDATED) {
				map.put("dvsn", "U");
				System.out.println(map);
			} else if(rowType == DataSet.ROW_TYPE_DELETED) {
				map.put("dvsn", "D");
				System.out.println(map);
			}
			sampleMapDAO.saveUserInfo(map);
		}
	}
	
	
	//데이타생성, 수정, 삭제
		public void exampleArray(Map<String, DataSetMap> inDataset)	throws Exception {
			Map aryMap = new HashMap();
			String[] args = new String[10];
			args[0] = "테스트01";
			args[1] = "테스트02";
			args[2] = "테스트03";
			args[3] = "테스트04";
			args[4] = "테스트05";
			args[5] = "테스트06";
			args[6] = "테스트07";
			args[7] = "테스트08";
			args[8] = "테스트09";
			args[9] = "테스트10";
			String[] args2 = new String[10];
			args2[0] = "코드01";
			args2[1] = "코드02";
			args2[2] = "코드03";
			args2[3] = "코드04";
			args2[4] = "코드05";
			args2[5] = "코드06";
			args2[6] = "코드07";
			args2[7] = "코드08";
			args2[8] = "코드09";
			args2[9] = "코드10";
			
			aryMap.put("ary01", args);
			aryMap.put("ary02", args2);
			sampleMapDAO.exampleArray(aryMap);
		}

	public void createNiceTrustInfoMap(Map<String, Object> inVar) throws Exception {
		// TODO Auto-generated method stub
		sampleMapDAO.createNiceTrustInfoMap(inVar) ;
	}
	public void createNiceBusinessInfo(Map<String, Object> inVar) throws Exception {
		// TODO Auto-generated method stub
		sampleMapDAO.createNiceBusinessInfo(inVar) ;
	}
		
	public String selectBusinessInfo(Map<String, Object> inVar) throws Exception {
		// TODO Auto-generated method stub
		return sampleMapDAO.selectBusinessInfo(inVar);
	}
	
	//목록조회
	public List<Map> searchTodayBisData(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		return sampleMapDAO.searchTodayBisData(inVar, outDataset);
	}
	
	//금융결제원 계좌유효성체크 전문내용저장
	public Map kftcCmsDocInfo(Map<String, Object> inVar) throws Exception {
		// TODO Auto-generated method stub
		return sampleMapDAO.kftcCmsDocInfo(inVar) ;
	}
	
	//Nice신용조회 전문 조회 처리
	public Map sendNiceTrustInfo(Map<String, Object> inVar) throws Exception{
		
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
		byte[] b 	    = resultString.getBytes();
		byte[] b2 	= resultString.getBytes("utf-8");
		
		String returnCode = "ZZZZ";
		String trustScore = "0";
		
		if(resultString.getBytes().length > 0) {
		
//			String returnDocHeader			  = new String(b, 0, 10);
//			//String transactionCode2			  = "";
//			String docGroupCode				  = new String(b, 10, 9);	//전문그룹코드	
//			String tradeTypeCode			      = new String(b, 19, 4);	//거래종별코드
//			String tradeGbCode				      = new String(b, 23, 5);	//거래구분코드
//			String flag2				  	          = new String(b, 28, 1);	//송수신Flag
//			String terminalGb2				      = new String(b, 29, 3);	//단말기구분
//			returnCode				      		  = new String(b, 32, 4);	//응답코드
//			String gigwanCode				      = new String(b, 36, 9);	//User ID
//			String gigwanNo				  	  = new String(b, 45, 10);	//기관전문 관리번호
//			String gigwanSendTime			  = new String(b, 55, 14);	//기관전문 전송시간
//			String niceNo				 	      = new String(b, 69, 10);	//NICE 전문 관리번호
//			String niceTime				  	      = new String(b, 79, 14);	//NICE 전문 전송시간
//			String primaryBitmap2			      = new String(b, 93, 16);	///Primary Bitmap
//			String space001				  	      = new String(b, 109, 1);	//공백
//			String userGb				  	      = new String(b, 110, 1);	//개인/사업자/법인 구분
//			String safekey 				  	      = new String(b, 111, 13);	//주민등록번호
//			String infoType				  	      = new String(b, 124, 1);	//정보 연속
//			String repeatCnt2				      = new String(b, 125, 2);	//재요청횟수
//			String custNm				  	      = new String(b ,127, 12);	//성명
//			String docCheckInfo				  = new String(b, 139, 12);	//보고서 인증번호
//			String avgTotalCnt				      = new String(b, 151, 3);	//평점정보 총건수
//			String replyCnt				  	      = new String(b, 154, 2);	//평점정보 응답건수
//			String infoGb				  	      = new String(b, 156, 2);	//정보구분
//			
//			String avgResult				          = new String(b, 158, 2);	//
//			String cbScore				  	      = new String(b, 160, 10);
//			String setEtc1				  	      = new String(b, 170, 4);
//			String setEtc2				  	      = new String(b, 174, 4);
//			String setEtc3				  	      = new String(b, 178, 4);
//			String avgSetEtc1				      = new String(b, 182, 4);
//			String avgSetEtc2				      = new String(b, 186, 4);
//			String avgSetEtc3				      = new String(b, 190, 4);
//			String avgSetEtc4				      = new String(b, 194, 4);
//			String avgSetEtc5				      = new String(b, 198, 4);
//			String avgSetEtc6				      = new String(b, 202, 4);
//			trustScore				              = new String(b, 206, 4);
//			String trustLevel				          = new String(b, 210, 4);
//			String avgResult1				      = new String(b, 214, 9);
//			String avgResult2				      = new String(b, 223, 9);
//			String avgResult3				      = new String(b, 232, 9);
//			String errCode				  	      = new String(b, 241, 4);
//			String profileCode1			  	      = new String(b, 245, 3);
//			String profileCode2			  	      = new String(b, 248, 3);
//			String profileCode3			  	      = new String(b, 251, 3);
//			//String space2			  	  	  = new String(b, 254, 2);
			
			
			
			
			String returnDocHeader			  = StringUtil.byteToString(b, 0, 10);
			String docGroupCode				  = StringUtil.byteToString(b, 10, 9);		//전문그룹코드	
			String tradeTypeCode			      = StringUtil.byteToString(b, 19, 4);		//거래종별코드
			String tradeGbCode				      = StringUtil.byteToString(b, 23, 5);		//거래구분코드
			String flag2				  	          = StringUtil.byteToString(b, 28, 1);		//송수신Flag
			String terminalGb2				      = StringUtil.byteToString(b, 29, 3);		//단말기구분
			        returnCode				      = StringUtil.byteToString(b, 32, 4);		//응답코드
			String gigwanCode				      = StringUtil.byteToString(b, 36, 9);		//User ID
			String gigwanNo				  	  = StringUtil.byteToString(b, 45, 10);		//기관전문 관리번호
			String gigwanSendTime			  = StringUtil.byteToString(b, 55, 14);		//기관전문 전송시간
			String niceNo				 	      = StringUtil.byteToString(b, 69, 10);		//NICE 전문 관리번호
			String niceTime				  	      = StringUtil.byteToString(b, 79, 14);		//NICE 전문 전송시간
			String primaryBitmap2			      = StringUtil.byteToString(b, 93, 16);		///Primary Bitmap
			String space001				  	      = StringUtil.byteToString(b, 109, 1);		//공백
			String userGb				  	      = StringUtil.byteToString(b, 110, 1);		//개인/사업자/법인 구분
			String safekey 				  	      = StringUtil.byteToString(b, 111, 13);	//주민등록번호
			String infoType				  	      = StringUtil.byteToString(b, 124, 1);		//정보 연속
			String repeatCnt2				      = StringUtil.byteToString(b, 125, 2);		//재요청횟수
			String custNm				  	      = StringUtil.byteToString(b ,127, 12);	//성명
			String docCheckInfo				  = StringUtil.byteToString(b, 139, 12);	//보고서 인증번호
			String avgTotalCnt				      = StringUtil.byteToString(b, 151, 3);		//평점정보 총건수
			String replyCnt				  	      = StringUtil.byteToString(b, 154, 2);		//평점정보 응답건수
			String infoGb				  	      = StringUtil.byteToString(b, 156, 2);		//정보구분
			String avgResult				          = StringUtil.byteToString(b, 158, 2);	
			String cbScore				  	      = StringUtil.byteToString(b, 160, 10);
			String setEtc1				  	      = StringUtil.byteToString(b, 170, 4);
			String setEtc2				  	      = StringUtil.byteToString(b, 174, 4);
			String setEtc3				  	      = StringUtil.byteToString(b, 178, 4);
			String avgSetEtc1				      = StringUtil.byteToString(b, 182, 4);
			String avgSetEtc2				      = StringUtil.byteToString(b, 186, 4);
			String avgSetEtc3				      = StringUtil.byteToString(b, 190, 4);
			String avgSetEtc4				      = StringUtil.byteToString(b, 194, 4);
			String avgSetEtc5				      = StringUtil.byteToString(b, 198, 4);
			String avgSetEtc6				      = StringUtil.byteToString(b, 202, 4);
			        trustScore				      = StringUtil.nvl(StringUtil.byteToString(b, 206, 4), "0");
			String trustLevel				          = StringUtil.byteToString(b, 210, 4);
			String avgResult1				      = StringUtil.byteToString(b, 214, 9);
			String avgResult2				      = StringUtil.byteToString(b, 223, 9);
			String avgResult3				      = StringUtil.byteToString(b, 232, 9);
			String errCode				  	      = StringUtil.byteToString(b, 241, 4);
			String profileCode1			  	      = StringUtil.byteToString(b, 245, 3);
			String profileCode2			  	      = StringUtil.byteToString(b, 248, 3);
			String profileCode3			  	      = StringUtil.byteToString(b, 251, 3);
			
			logger.debug("returnDocHeader		" + returnDocHeader		);	
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
			logger.debug("avgResult2			" + avgResult2			);	
			logger.debug("avgResult3			" + avgResult3			);	
			logger.debug("errCode				" + errCode				);  	
			logger.debug("profileCode1		" + profileCode1		);  	
			logger.debug("profileCode2		" + profileCode2		);  	
			logger.debug("profileCode3		" + profileCode3		);  	
			
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
	//			param202.put("crGrade", trustLevel);
				param202.put("crGrade", trustScore);		//20201220 kstka 신용등급 -> 신용평점		
				dsm2.add(param202);
				
				inVar.remove("inDsMap");
				inVar.put("inDsMap",  dsm2);
				inVar.remove("sqlnamespace");
				inVar.put("sqlnamespace", "cust.createNiceTrustInfoMap");
				
				createNiceTrustInfoMap(inVar);
			}
		}
		
		Map comMap = new HashMap();
		comMap.put("cdGrpCd", "S048");
		comMap.put("useYn", "Y");
		Map result = commonService.listCommInfo(comMap);
		List listComm	= (List)result.get("result");
		String level = (String)((Map)listComm.get(0)).get("cd");
		
		Map resultMap2 = new HashMap();
		resultMap2.put("returnCode", returnCode);
//		resultMap2.put("trustLevel", trustLevel);
		resultMap2.put("trustLevel", trustScore);		//20201220 kstka 신용등급 -> 신용평점		
		resultMap2.put("cdLevel", level);
		
		return resultMap2;
	}
}
