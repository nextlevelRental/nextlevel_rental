package egovframework.ntrms.kr.co.brn.cms.util;

import java.net.*;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.charset.Charset;
import java.io.*;
import java.util.*;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class PCISocketProcess {
	
	protected Log logger = LogFactory.getLog(this.getClass());	
	
	private Socket sock;
	private String host 			= "";
	private int port 				= 0;
	private String flag 			= "";
	private DataInputStream 		in;
	private DataOutputStream 		out;
	private String message 			= "";
	private byte[] head 			= new byte[2];
	private String shead 			= "";
	private byte[] body 			= null;
	private String sbody 			= "";
	private int sendDataLength 		= 0;
	private String recvData 		= "";
	private String strKey 	 		= "";
	private String sendMsg			= "";
	private String resultMsg		= "";
	private String headerSize		= "";


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
			logger.debug("#      Sending DATA Error [데이타 전송실패] 				#");
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
			this.out.write(((this.headerSize == null ? "" : this.headerSize)  + this.sendMsg).getBytes("KSC5601"));
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
			System.out.write(decryptText);
			logger.debug("\n");
			
			CharBuffer cbuffer = CharBuffer.wrap((new String(data, "KSC5601")).toCharArray());
			Charset utf8charset = Charset.forName("UTF-8");
			ByteBuffer bbuffer  = utf8charset.encode(cbuffer);
			
			//BufferedReader in = new BufferedReader(new InputStreamReader(socket.getInputStream(), "UTF8"));
			//main.title = in.readLine();			
			String byteToString = new String(decryptText, 0, decryptText.length);
			/*String tmpStr = new String (bbuffer.array());
			
			logger.debug("1. ====================================== start");
			logger.debug(byteToString);
			logger.debug("1. ====================================== end");
			
			logger.debug("2. ====================================== start");
			logger.debug(new String(bbuffer.array()));
			logger.debug("2. ====================================== end");
			
			logger.debug("2. ====================================== start");
			logger.debug(new String(bbuffer.array()));
			logger.debug("2. ====================================== end");
			
			
			logger.debug("utf-8(1) : " + new String(byteToString.getBytes("utf-8"), "euc-kr"));
			logger.debug("utf-8(2) : " + new String(byteToString.getBytes("utf-8"), "ksc5601"));
			logger.debug("utf-8(3) : " + new String(byteToString.getBytes("utf-8"), "x-windows-949"));
			logger.debug("utf-8(4) : " + new String(byteToString.getBytes("utf-8"), "iso-8859-1"));
			 
			logger.debug("iso-8859-1(1) : " + new String(byteToString.getBytes("iso-8859-1"), "euc-kr"));
			logger.debug("iso-8859-1(2) : " + new String(byteToString.getBytes("iso-8859-1"), "ksc5601"));
			logger.debug("iso-8859-1(3) : " + new String(byteToString.getBytes("iso-8859-1"), "x-windows-949"));
			logger.debug("iso-8859-1(4) : " + new String(byteToString.getBytes("iso-8859-1"), "utf-8"));
			 
			logger.debug("euc-kr(1) : " + new String(byteToString.getBytes("euc-kr"), "ksc5601"));
			logger.debug("euc-kr(2) : " + new String(byteToString.getBytes("euc-kr"), "utf-8"));
			logger.debug("euc-kr(3) : " + new String(byteToString.getBytes("euc-kr"), "x-windows-949"));
			logger.debug("euc-kr(4) : " + new String(byteToString.getBytes("euc-kr"), "iso-8859-1"));
			 
			logger.debug("ksc5601(1) : " + new String(byteToString.getBytes("ksc5601"), "euc-kr"));
			logger.debug("ksc5601(2) : " + new String(byteToString.getBytes("ksc5601"), "utf-8"));
			logger.debug("ksc5601(3) : " + new String(byteToString.getBytes("ksc5601"), "x-windows-949"));
			logger.debug("ksc5601(4) : " + new String(byteToString.getBytes("ksc5601"), "iso-8859-1"));
			 
			logger.debug("x-windows-949(1) : " + new String(byteToString.getBytes("x-windows-949"), "euc-kr"));
			logger.debug("x-windows-949(2) : " + new String(byteToString.getBytes("x-windows-949"), "utf-8"));
			logger.debug("x-windows-949(3) : " + new String(byteToString.getBytes("x-windows-949"), "ksc5601"));
			logger.debug("x-windows-949(4) : " + new String(byteToString.getBytes("x-windows-949"), "iso-8859-1"));

			
			logger.debug("utf-8(1) : " + new String(tmpStr.getBytes("utf-8"), "euc-kr"));
			logger.debug("utf-8(2) : " + new String(tmpStr.getBytes("utf-8"), "ksc5601"));
			logger.debug("utf-8(3) : " + new String(tmpStr.getBytes("utf-8"), "x-windows-949"));
			logger.debug("utf-8(4) : " + new String(tmpStr.getBytes("utf-8"), "iso-8859-1"));
			 
			logger.debug("iso-8859-1(1) : " + new String(tmpStr.getBytes("iso-8859-1"), "euc-kr"));
			logger.debug("iso-8859-1(2) : " + new String(tmpStr.getBytes("iso-8859-1"), "ksc5601"));
			logger.debug("iso-8859-1(3) : " + new String(tmpStr.getBytes("iso-8859-1"), "x-windows-949"));
			logger.debug("iso-8859-1(4) : " + new String(tmpStr.getBytes("iso-8859-1"), "utf-8"));
			 
			logger.debug("euc-kr(1) : " + new String(tmpStr.getBytes("euc-kr"), "ksc5601"));
			logger.debug("euc-kr(2) : " + new String(tmpStr.getBytes("euc-kr"), "utf-8"));
			logger.debug("euc-kr(3) : " + new String(tmpStr.getBytes("euc-kr"), "x-windows-949"));
			logger.debug("euc-kr(4) : " + new String(tmpStr.getBytes("euc-kr"), "iso-8859-1"));
			 
			logger.debug("ksc5601(1) : " + new String(tmpStr.getBytes("ksc5601"), "euc-kr"));
			logger.debug("ksc5601(2) : " + new String(tmpStr.getBytes("ksc5601"), "utf-8"));
			logger.debug("ksc5601(3) : " + new String(tmpStr.getBytes("ksc5601"), "x-windows-949"));
			logger.debug("ksc5601(4) : " + new String(tmpStr.getBytes("ksc5601"), "iso-8859-1"));
			 
			logger.debug("x-windows-949(1) : " + new String(tmpStr.getBytes("x-windows-949"), "euc-kr"));
			logger.debug("x-windows-949(2) : " + new String(tmpStr.getBytes("x-windows-949"), "utf-8"));
			logger.debug("x-windows-949(3) : " + new String(tmpStr.getBytes("x-windows-949"), "ksc5601"));
			logger.debug("x-windows-949(4) : " + new String(tmpStr.getBytes("x-windows-949"), "iso-8859-1"));*/

			//변환된 UTF-8 문자열
			//String tmpDecode = new String(bbuffer.array());
			
			
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
	
	
	public static String encode(String str, String charset) {
        StringBuilder sb = new StringBuilder();
        try {
            byte[] key_source = str.getBytes(charset);
            for(byte b : key_source) {
                String hex = String.format("%02x", b).toUpperCase();
                sb.append("%");
                sb.append(hex);
            }
        } catch(UnsupportedEncodingException e) { }//Exception
        return sb.toString();
    }
     
    public static String decode(String hex, String charset) {
        byte[] bytes = new byte[hex.length()/3];
        int len = hex.length();
        for(int i = 0 ; i < len ;) {
            int pos = hex.substring(i).indexOf("%");
            if(pos == 0) {
                String hex_code = hex.substring(i+1, i+3);
                bytes[i/3] = (byte)Integer.parseInt(hex_code, 16);
                i += 3;
            } else {
                i += pos;
            }
        }
        try {
            return new String(bytes, charset);
        } catch(UnsupportedEncodingException e) { }//Exception
        return "";
    }
     
    public static String changeCharset(String str, String charset) {
        try {
            byte[] bytes = str.getBytes(charset);
            return new String(bytes, charset);
        } catch(UnsupportedEncodingException e) { }//Exception
        return "";
    }


	public String getIRSafeKey(Map<String, Object> params) {
		List list = null;
		try {
			list = (List)params.get("irDsList");
			/*******************************************************************************************************
			 *  공통부 정의 Start
			 *******************************************************************************************************/
			/*String transactionCode 		= (String)params.get("transactionCode");					//트랜젝션코드
			String docSendGigwanCd  	= (String)params.get("docSendGigwanCd");				//전문송신기관
			String docGbCd					= (String)params.get("docGbCd");							//전문구분코드
			String bizGbCd					= (String)params.get("bizGbCd");							//거래구분코드
			String sendReceiveFlag			= (String)params.get("sendReceiveFlag");					//송수신Flag
			String terminalGB				= (String)params.get("terminalGB");						//단말기구분
			String returnCd					= (String)params.get("returnCd");							//응답코드
			String gigwanId					= (String)params.get("gigwanId");							//기관 아이디
			String gigwanNo				= (String)params.get("gigwanNo");						//기관 관리번호
			String gigwanSendTime		= (String)params.get("gigwanSendTime");				//기관전문 전송시간
			String niceDocNo				= (String)params.get("niceDocNo");						//NICE 전문 관리번호
			String niceDocSendTime		= (String)params.get("niceDocSendTime");				//NICE 전문 전송시간
			String sendSpace				= (String)params.get("sendSpace");						//공란
			
			String header = "";
					header += transactionCode;
					header += docSendGigwanCd;
					header += docGbCd;
					header += bizGbCd;
					header += sendReceiveFlag;
					header +=  terminalGB;
					header += returnCd;
					header +=  gigwanId;
					header +=  gigwanNo;
					header +=  gigwanSendTime;
					header += niceDocNo;
					header += niceDocSendTime;
					header += sendSpace;
			logger.debug(header + "] => 01");*/
			/*******************************************************************************************************
			 *  공통부 정의 End
			 *******************************************************************************************************/
			/*******************************************************************************************************
			 *  개별요청부 Start
			 *******************************************************************************************************/
			/*String userBirthDay					= (String)params.get("userBirthDay");			//생년월일
			String userName					= (String)params.get("userName");			//성명
			String userGenderCd				= (String)params.get("userGenderCd");		//성별
			String repeatCnt						= (String)params.get("repeatCnt");				//반복부 건수
			String	sendSpace2					= (String)params.get("sendSpace2");			//공란2
			
			String body = "";
					body += userBirthDay;
					body += userName;
					body += userGenderCd;
					body += repeatCnt;
					body += sendSpace2;
			
			logger.debug(body + "] => 02");*/
			/*******************************************************************************************************
			 *  개별요청부 End
			 *******************************************************************************************************/
			/*******************************************************************************************************
			 *  반복부01 Start
			 *******************************************************************************************************/
			/*String sendInfoGb01				= (String)params.get("sendInfoGb01");				//정보구분
			String sendHandPhone01			= (String)params.get("sendHandPhone01");			//휴대폰번호(상)
			String sendHandPhone02			= (String)params.get("sendHandPhone02");				//휴대폰번호(중)
			String sendHandPhone03			= (String)params.get("sendHandPhone03");				//휴대폰번호(하)
			String sendSpace3					= (String)params.get("sendSpace3");	
			
			String repeat01 = "";
					repeat01 += sendInfoGb01;
					repeat01 += sendHandPhone01;
					repeat01 += sendHandPhone02;
					repeat01 += sendHandPhone03;
					repeat01 += sendSpace3;
			
			System.out.println(repeat01 + "] => 03");*/
			/*******************************************************************************************************
			 *  반복부01 ENd
			 *******************************************************************************************************/
			//String sendMsg = header + body + repeat01;
			
			String sendMsg = "";
			
			for(int i = 0; i<list.size(); i++) {
				sendMsg += (String)list.get(i);
			}
			
			
			logger.debug("==============================================================");
			logger.debug("입력 메시지 : [" + sendMsg + "]");
			logger.debug("==============================================================");
			this.host = (String)params.get("ip");
			this.port = Integer.parseInt((String)params.get("port"));
			this.headerSize = (String)params.get("headerSize") == null ? "" : (String)params.get("headerSize");
			this.sendMsg = sendMsg;
			this.init();
			 
		} catch (ArrayIndexOutOfBoundsException e) {
			System.out.println("Usage : java  PCIClient  <server-ip>  <port>  <sample.txt> Y  <Key>");
		}
		return this.resultMsg;
	}
}
