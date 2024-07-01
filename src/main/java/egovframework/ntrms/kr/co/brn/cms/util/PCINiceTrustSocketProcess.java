package egovframework.ntrms.kr.co.brn.cms.util;

import java.net.*;
import java.io.*;
import java.util.*;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class PCINiceTrustSocketProcess {
	
	protected Log logger = LogFactory.getLog(this.getClass());	
	
	private Socket sock;
	private String host 				= "";
	private int port 				= 0;
	private String flag 				= "";
	private DataInputStream 		in;
	private DataOutputStream 	out;
	private String message 		= "";
	private byte[] head 			= new byte[2];
	private String shead 			= "";
	private byte[] body 			= null;
	private String sbody 			= "";
	private int sendDataLength 	= 0;
	private String recvData 		= "";
	private String strKey 	 		= "";
	private String sendMsg		= "";
	private String resultMsg		= "";


	public void init() {
		try {
			this.sock 	= new Socket(this.host, this.port);
			this.in 	= new DataInputStream(new BufferedInputStream(this.sock.getInputStream()));
			this.out 	= new DataOutputStream(new BufferedOutputStream(this.sock.getOutputStream()));
		
		} catch (UnknownHostException e1) {
			logger.debug("Unkown Host!!!");
		} catch (Exception e) {
			logger.debug("서버가 활성화되었는지 먼저 확인하십시요.!!!");
		}

		boolean flag = true;
		flag = this.sendMsg();

		if (!flag) {
			logger.debug("#######################################################");
			logger.debug("#               Sending DATA Error [데이타 전송실패] 					     #");
			logger.debug("#######################################################");
		}
		
		flag = this.receive();
		

		if (!flag) {
			logger.debug("Receiving DATA Error!!!");
		}
	}
	synchronized public boolean sendMsg() {
		boolean recv = true;
		try {
			this.out.writeBytes("0000000167" + this.sendMsg);
			this.out.flush();
		}catch(Exception e) {
			return false;
		}
		return recv;
	}


	// 서버로부터 데이터를 수신
	synchronized public boolean receive() {
		boolean flag = true;
		String recvData = "";

		try {
			byte[] data = this.getSocketMessage();
			byte[] decryptText = data;
			logger.debug("#############################[리턴 메시지 출력]#############################");
			System.out.write(decryptText);
			logger.debug("\n");
			
			String byteToString = new String(decryptText, 0, decryptText.length);
			this.resultMsg = byteToString;
			
		} catch (IOException e) {
			logger.debug("Read DATA Exception!!!");
			e.printStackTrace();
			return false;
		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
		}

		try {
			this.sock.close();
		} catch (Exception e1) {
		}

		return flag;
	}

	public byte[] getSocketMessage() {

		byte[] tempBuffer = new byte[1024];
		byte[] buffer = null;
		byte[] base64Buffer = null;

		try {
			int count = 0;

			if (this.in.read(tempBuffer) != -1) {
				for (int i = 0; i < tempBuffer.length; i++) {
					if (tempBuffer[i] == 0x00)
						break;
					count++;
				}
			}
			buffer = new byte[count];

			for (int j = 0; j < count; j++) {
				buffer[j] = tempBuffer[j];
			}
			base64Buffer = buffer;
		} catch (Exception e) {
			System.out.println("Socket Reading Exceptione!!1");
			e.printStackTrace();
		}
		return base64Buffer;

	}

	private String convertAsciiToKor(String uni) {
		String result = null;

		try {
			if (uni == null)
				return null;
			result = new String(uni.getBytes("8859_1"), "KSC5601");
		} catch (Exception e) {
			System.out.println(e);
		}
		return result;
	}

	public String getNiceTrustInfo(Map<String, String> params) {
		
	
		try {
			/*******************************************************************************************************
			 *  공통부 정의 Start
			 *******************************************************************************************************/
			java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat ("yyyyMMddHHmmss", java.util.Locale.KOREA);
			String date = formatter.format(new java.util.Date());
			String transactionCode 		= params.get("transactionCode"); 			//Transaction Code  
			String docGroupCd      		= params.get("docGroupCd");       			//전문그룹코드            
			String tradeTypeCd  	 		= params.get("tradeTypeCd");  				//거래종별코드        
			String traceGbCd   	 			= params.get("traceGbCd");   					//거래구분코드            
			String sendReceiveFlag 		= params.get("sendReceiveFlag");  			//송수신Flag           
			String terminalGb  	 			= params.get("terminalGb");  					//단말기구분         
			String receiveCd       			= params.get("receiveCd");        				//응답코드      
			String gigwanId        			= params.get("gigwanId");        				//기관아이디             
			String gigwanDocNo 	 		= params.get("gigwanDocNo"); 				//기관전문 관리번호             
			String gigwanDocTime   		= params.get("gigwanDocTime");    	 		//기관전문 전송시간         
			String niceDocNo   	 		= params.get("niceDocNo");   				//NICE 전문 관리번호  
			String niceDocTime 	 		= params.get("niceDocTime"); 				//NICE 전문 전송시간  
			String primaryBitmap   		= params.get("primaryBitmap");   			//Primary Bitmap    
			String searchAgreeCd   		= params.get("searchAgreeCd");    			//조회동의사유코드      

			
			
			String header = "";
					header += transactionCode 	 ;
					header += docGroupCd      	 ;
					header += tradeTypeCd  	     ;
					header += traceGbCd   	 	 ;
					header += sendReceiveFlag 	 ;
					header += terminalGb  	 	 ;
					header += receiveCd       	 ;
					header += gigwanId        	 ;
					header += gigwanDocNo 	 ;
					header += gigwanDocTime    ;
					header += niceDocNo   	 	 ;
					header += niceDocTime 	 	 ;
					header += primaryBitmap   	 ;
					header += searchAgreeCd   	 ;
			logger.debug(header + "] => 01");
			/*******************************************************************************************************
			 *  공통부 정의 End
			 *******************************************************************************************************/
			
			String userType      		 	= params.get("userType");       				//개인/사업자/법인 구분       
			String userSerialNo       	 	= params.get("userSerialNo");       			//주민등록번호                 
			String searchCause    			= params.get("searchCause");    				//조회사유 코드                    
			String searchUserCd    		= params.get("searchUserCd");    			//조회자 식별코드                       
			String repeatCnt       		 	= params.get("repeatCnt");       				//재요청횟수         
			String reportInfoNo       	 	= params.get("reportInfoNo");       			//보고서 인증번호               
			String avgServiceReceiveCnt	= params.get("avgServiceReceiveCnt");		//평점서비스 수신건수             
			String avgServiceRequestCnt 	= params.get("avgServiceRequestCnt");   	//평점서비스 요청건수             
			String avgServiceGb       	 	= params.get("avgServiceGb");       			//평점서비스구분 정보( 64 )       
			String avgTable       		 	= params.get("avgTable");       				//평점표  ID            
			
			String body = "";
					body += userType      			;
					body += userSerialNo       	    ;
					body += searchCause    		    ;
					body += searchUserCd    		;
					body += repeatCnt       			;
					body += reportInfoNo       	    ;
					body += avgServiceReceiveCnt	;
					body += avgServiceRequestCnt	;
					body += avgServiceGb       	    ;
					body += avgTable       		    ;
			
			String sendMsg = header + body ;
			this.host = params.get("ip");
			this.port = Integer.parseInt(params.get("port"));
			this.sendMsg = sendMsg;
			this.init();
			
		} catch (ArrayIndexOutOfBoundsException e) {
			System.out.println("Usage : java  PCIClient  <server-ip>  <port>  <sample.txt> Y  <Key>");
		}
		return this.resultMsg;
	}
}
