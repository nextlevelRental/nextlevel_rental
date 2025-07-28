package egovframework.ntrms.kr.co.brn.cs.dao.EAI;

import java.io.StringReader;
import java.util.Map;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathFactory;

import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.apache.commons.lang3.StringEscapeUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
/**
 * EAI 연계통한 SMS전송
 * <p> 예외처리에 대한 SMS 전송  </p>
 * @category  예외처리에 대한 SMS전송
 * @author		한승훈
 * @since		2015. 8. 13.
 * @version
 *
 */
@SuppressWarnings("deprecation")
public class SMSControl {
	protected Log logger = LogFactory.getLog(this.getClass());
	//EAI SystemID 설정(SMS공통)
	private static String SYSTEMID = "NTRMS";
	//EAI InterfaceID 설정(SMS공통)
	private static String INTERFACEID1 = "NTRMS_102";
	private static String INTERFACEID2 = "NTRMS_103";

	public SMSControl() {}
	/**SMS 전송 전 데이터 체크 및 EAI Call
	 * <pre>
	 * 데이터 체크 후 문제없으면 EAI Call
	 * </pre>	 
	 * @param CmSMSVO cmSmsVo
	 */
	public String sendSms(CmSMSVO cmSmsVo) {
		//리턴 메시지 전송
		String retMsg = null;
		try {
			//보내는사람 번호체크
			if(cmSmsVo.getSndPhnId() != null && cmSmsVo.getSndPhnId().length() > 0){
				cmSmsVo.setSndPhnId(cmSmsVo.getSndPhnId().trim());
				cmSmsVo.setSndPhnId(cmSmsVo.getSndPhnId().replaceAll("-",""));
			}else{
				throw new Exception("보내는사람 번호가 없습니다. 확인바랍니다.");
			}
			//받는사람 번호체크
			if(cmSmsVo.getRcvPhnId() != null && cmSmsVo.getRcvPhnId().length() > 0){
				cmSmsVo.setRcvPhnId(cmSmsVo.getRcvPhnId().trim());
				cmSmsVo.setRcvPhnId(cmSmsVo.getRcvPhnId().replaceAll("-",""));
			}else{
				throw new Exception("받는사람 번호가 없습니다. 확인바랍니다.");		
			}
			if(cmSmsVo.getSndMsg() != null && cmSmsVo.getSndMsg().length() > 0){
				//메세지 본문 Byte 체크 
				int msgLength = chkByte(cmSmsVo.getSndMsg());
				if(msgLength <= 80){
					//SMS인 경우
					cmSmsVo.setUsedCd("00");
					cmSmsVo.setContentMimeType("");
				}else{
					//LMS이거나 MMS인 경우 
					cmSmsVo.setUsedCd("10");
					cmSmsVo.setContentMimeType("text/plain");
				};				
			}else{
				throw new Exception("메시지가 없습니다. 확인바랍니다.");		
			}

			//VO를 받아서 DMS 내 DB에 데이터를 Insert(EAI Call하기전에 DB에 데이터 저장)
			//String cmpMsgId = (String)SMSDAO.getInstance().insertSMS(cmSmsVo);
			//CMP_MSG_ID 값 설정
			//cmSmsVo.setCmpMsgId(cmpMsgId);

			//EAI로 SMS정보 전송 
			//if("S".equals(sendEAI(cmSmsVo))){
			//	retMsg = "전송에 성공하였습니다.";
			//}else{
			//	retMsg = "전송에 실패하였습니다. 확인바랍니다.";
			//}
		} catch (Exception  e) {
			e.printStackTrace();
		}
		return retMsg;
	}
	/**String을 Byte로 Return
	 * <pre>
	 * Byte로 SMS, LMS 구분 
	 * </pre>	 
	 * @param msg String
	 */
	private int chkByte(String msg) throws Exception{
		return msg.getBytes().length;
	}

	/**EAI 연계
	 * <pre>
	 * EAI연계 XML형태로 데이터 전송 방식 
	 * 7개의 element만 전송
	 * CMP_MSG_ID, USED_CD, RCV_PHN_ID, SND_PHN_ID
	 * SND_MSG, CONTETN_CNT, CONTENT_MIME_TYPE
	 * </pre>	 
	 * @param CmSMSVO cmSmVO
	 */
	public Map sendEAI(Map map){
		try {
			String data = "<?xml version='1.0' encoding='UTF-8'?>";	    
			data = data + "<EaiSend>";	    
			data = data + "<I_IF_SEQ>"			+	map.get("callNo")	+"</I_IF_SEQ>";
			data = data + "<I_CONTRACT_NO>"		+	map.get("ordNo")	+"</I_CONTRACT_NO>";
			data = data + "<I_CST_NAME>"		+	map.get("custNm")	+"</I_CST_NAME>";
			data = data + "<I_CST_MOBILE_01>"	+	map.get("callDtl1")	+"</I_CST_MOBILE_01>";
			data = data + "<I_CST_MOBILE_02>"	+	map.get("callDtl2")	+"</I_CST_MOBILE_02>";
			data = data + "<I_CST_MOBILE_03>"	+	map.get("callDtl3")	+"</I_CST_MOBILE_03>";
			data = data + "<I_CAR_LIC>"			+	map.get("carNo")	+"</I_CAR_LIC>";
			data = data + "<I_REC_DATE>"		+	map.get("recvDay")	+"</I_REC_DATE>";
			data = data + "<I_REC_TIME>"		+	map.get("recvTm")	+"</I_REC_TIME>";
			data = data + "<I_REC_CONTENT>"		+	StringEscapeUtils.escapeXml10(map.get("smsTx").toString())	+"</I_REC_CONTENT>";	// 특수문자 치환 20250610
			data = data + "<I_REGION_NO>"		+	map.get("regionNo")	+"</I_REGION_NO>";
			data = data + "<I_CITY_NO>"			+	map.get("cityNo")	+"</I_CITY_NO>";
			data = data + "<I_ENT_USER_ID>"		+	map.get("regId")	+"</I_ENT_USER_ID>";
			data = data + "<I_REG_TYPE>"		+	map.get("chanCd")	+"</I_REG_TYPE>";
			data = data + "</EaiSend>";	   

			logger.debug(":::EAI::::::::::::::::::::::::::::::::::::::::::");
			String data1 = "<?xml version='1.0' encoding='UTF-8'?>\n";
			data1 = data1 + "<EaiSend>\n";	    
			data1 = data1 + "<I_IF_SEQ>"			+	map.get("callNo")	+"</I_IF_SEQ>\n";
			data1 = data1 + "<I_CONTRACT_NO>"		+	map.get("ordNo")	+"</I_CONTRACT_NO>\n";
			data1 = data1 + "<I_CST_NAME>"			+	map.get("custNm")	+"</I_CST_NAME>\n";
			data1 = data1 + "<I_CST_MOBILE_01>"		+	map.get("callDtl1")	+"</I_CST_MOBILE_01>\n";
			data1 = data1 + "<I_CST_MOBILE_02>"		+	map.get("callDtl2")	+"</I_CST_MOBILE_02>\n";
			data1 = data1 + "<I_CST_MOBILE_03>"		+	map.get("callDtl3")	+"</I_CST_MOBILE_03>\n";
			data1 = data1 + "<I_CAR_LIC>"			+	map.get("carNo")	+"</I_CAR_LIC>\n";
			data1 = data1 + "<I_REC_DATE>"			+	map.get("recvDay")	+"</I_REC_DATE>\n";
			data1 = data1 + "<I_REC_TIME>"			+	map.get("recvTm")	+"</I_REC_TIME>\n";
			data1 = data1 + "<I_REC_CONTENT>"		+	StringEscapeUtils.escapeXml10(map.get("smsTx").toString())	+"</I_REC_CONTENT>\n";	// 특수문자 치환 20250610
			data1 = data1 + "<I_REGION_NO>"			+	map.get("regionNo")	+"</I_REGION_NO>\n";
			data1 = data1 + "<I_CITY_NO>"			+	map.get("cityNo")	+"</I_CITY_NO>\n";
			data1 = data1 + "<I_ENT_USER_ID>"		+	map.get("regId")	+"</I_ENT_USER_ID>\n";
			data1 = data1 + "<I_REG_TYPE>"			+	map.get("chanCd")	+"</I_REG_TYPE>\n";
			data1 = data1 + "</EaiSend>";	   
			logger.debug(data1);
			logger.debug(":::EAI::::::::::::::::::::::::::::::::::::::::::");

			SMSManager smsManager = new SMSManager();
			logger.debug(":::EAI START::::::::::::::::::::::::::::::::::::::::::");
			String retData = smsManager.sendSync(SYSTEMID, INTERFACEID1, data);
			logger.debug(":::EAI END::::::::::::::::::::::::::::::::::::::::::");
			//EAI 결과값 Parsing
			// XML Document 객체 생성
			InputSource is = new InputSource(new StringReader(retData));
			Document document = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(is);
			// xpath 생성
			XPath xpath = XPathFactory.newInstance().newXPath();
			// NodeList 가져오기 : row 아래에 있는 모든 col1 을 선택
			NodeList cols1 = (NodeList)xpath.evaluate("//QMS_Reply_Msg/O_FLAG", document, XPathConstants.NODESET);
			NodeList cols2 = (NodeList)xpath.evaluate("//QMS_Reply_Msg/O_MESG", document, XPathConstants.NODESET);
			NodeList cols3 = (NodeList)xpath.evaluate("//QMS_Reply_Msg/O_CLAIM_NO", document, XPathConstants.NODESET);

			// EAI 결과값 - S:성공, E:실패
			String oFlag 	= (String)cols1.item(0).getTextContent();
			String oMesg 	= (String)cols2.item(0).getTextContent();
			String oClaimNo = (String)cols3.item(0).getTextContent();

			logger.debug(":::oFlag::::::::::::::::::::::::::::::::::::::::::" + oFlag);
			logger.debug(":::oMesg::::::::::::::::::::::::::::::::::::::::::" + oMesg);
			logger.debug(":::oClaimNo::::::::::::::::::::::::::::::::::::::::::" + oClaimNo);

			map.put("oFlag", oFlag);
			map.put("oMesg", oMesg);
			map.put("oClaimNo", oClaimNo);

		} catch (Exception e) {
			logger.debug("QMS통신 실패_SMSControl.java:::::::::::::::::::::::::::::::::");
			logger.debug(e);
			logger.debug("QMS통신 실패_SMSControl.java:::::::::::::::::::::::::::::::::");
			e.printStackTrace();
		}
		return map;
	}

	public Map resultEAI(Map map){
		try {
			String data = "<?xml version='1.0' encoding='UTF-8'?>";	    
			data = data + "<EaiSend>";	    
			data = data + "<CLAIM_NO>" + map.get("claimNo")	+"</CLAIM_NO>";
			data = data + "</EaiSend>";	   

			logger.debug(":::EAI::::::::::::::::::::::::::::::::::::::::::");
			String data1 = "<?xml version='1.0' encoding='UTF-8'?>\n";
			data1 = data1 + "<EaiSend>\n";	    
			data1 = data1 + "<CLAIM_NO>" + map.get("claimNo") +"</CLAIM_NO>\n";
			data1 = data1 + "</EaiSend>";	   
			logger.debug(data1);
			logger.debug(":::EAI::::::::::::::::::::::::::::::::::::::::::");

			SMSManager smsManager = new SMSManager();
			String retData = smsManager.sendSync(SYSTEMID, INTERFACEID2, data);

			//EAI 결과값 Parsing
			// XML Document 객체 생성
			InputSource is = new InputSource(new StringReader(retData));
			Document document = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(is);
			// xpath 생성
			XPath xpath = XPathFactory.newInstance().newXPath();
			// NodeList 가져오기 : row 아래에 있는 모든 col1 을 선택

			NodeList cols1 = (NodeList)xpath.evaluate("//QMS_Reply_Msg/CLAIM_NO", document, XPathConstants.NODESET);
			NodeList cols2 = (NodeList)xpath.evaluate("//QMS_Reply_Msg/REC_CONTENT", document, XPathConstants.NODESET);
			NodeList cols3 = (NodeList)xpath.evaluate("//QMS_Reply_Msg/CLAIM_TYPE", document, XPathConstants.NODESET);
			NodeList cols4 = (NodeList)xpath.evaluate("//QMS_Reply_Msg/CLAIM_CLASS", document, XPathConstants.NODESET);
			NodeList cols5 = (NodeList)xpath.evaluate("//QMS_Reply_Msg/CLAIM_NAME", document, XPathConstants.NODESET);
			NodeList cols6 = (NodeList)xpath.evaluate("//QMS_Reply_Msg/TIRE_CNT", document, XPathConstants.NODESET);
			NodeList cols7 = (NodeList)xpath.evaluate("//QMS_Reply_Msg/REWARD_CNT", document, XPathConstants.NODESET);
			NodeList cols8 = (NodeList)xpath.evaluate("//QMS_Reply_Msg/CLAIM_STAS", document, XPathConstants.NODESET);
			NodeList cols9 = (NodeList)xpath.evaluate("//QMS_Reply_Msg/EMP_NAME", document, XPathConstants.NODESET);
			NodeList cols10 = (NodeList)xpath.evaluate("//QMS_Reply_Msg/EMP_MOBILENO", document, XPathConstants.NODESET);
			NodeList cols11 = (NodeList)xpath.evaluate("//QMS_Reply_Msg/O_FLAG", document, XPathConstants.NODESET);
			NodeList cols12 = (NodeList)xpath.evaluate("//QMS_Reply_Msg/O_MESG", document, XPathConstants.NODESET);

			String claimNo		= (String)cols1.item(0).getTextContent(); 
			String recContent	= (String)cols2.item(0).getTextContent(); 
			String claimType	= (String)cols3.item(0).getTextContent(); 
			String claimClass	= (String)cols4.item(0).getTextContent(); 
			String claimName	= (String)cols5.item(0).getTextContent(); 
			String tireCnt		= (String)cols6.item(0).getTextContent(); 
			String rewardCnt	= (String)cols7.item(0).getTextContent(); 
			String claimStas	= (String)cols8.item(0).getTextContent(); 
			String empName		= (String)cols9.item(0).getTextContent(); 
			String empMobileno 	= (String)cols10.item(0).getTextContent(); 
			String oFlag		= (String)cols11.item(0).getTextContent(); 
			String oMesg		= (String)cols12.item(0).getTextContent();

			logger.debug(":::claimNo:::::::::::::::::::::::::::::::::::::::" + claimNo);
			logger.debug(":::recContent::::::::::::::::::::::::::::::::::::" + recContent);
			logger.debug(":::claimType:::::::::::::::::::::::::::::::::::::" + claimType);
			logger.debug(":::claimClass::::::::::::::::::::::::::::::::::::" + claimClass);
			logger.debug(":::claimName:::::::::::::::::::::::::::::::::::::" + claimName);
			logger.debug(":::tireCnt:::::::::::::::::::::::::::::::::::::::" + tireCnt);
			logger.debug(":::rewardCnt:::::::::::::::::::::::::::::::::::::" + rewardCnt);
			logger.debug(":::claimStas:::::::::::::::::::::::::::::::::::::" + claimStas);
			logger.debug(":::empName:::::::::::::::::::::::::::::::::::::::" + empName);
			logger.debug(":::empMobileno:::::::::::::::::::::::::::::::::::" + empMobileno);
			logger.debug(":::oFlag:::::::::::::::::::::::::::::::::::::::::" + oFlag);
			logger.debug(":::oMesg:::::::::::::::::::::::::::::::::::::::::" + oMesg);

			map.put("claimNo", claimNo);
			map.put("recContent", recContent);
			map.put("claimType", claimType);
			map.put("claimClass", claimClass);
			map.put("claimName", claimName);
			map.put("tireCnt", tireCnt);
			map.put("rewardCnt", rewardCnt);
			map.put("claimStas", claimStas);
			map.put("empName", empName);
			map.put("empMobileno", empMobileno);
			map.put("oFlag", oFlag);
			map.put("oMesg", oMesg);

			logger.debug("result map::::::::::::::::::::::::::::::::::::::::::");
			logger.debug(map);
			logger.debug("result map::::::::::::::::::::::::::::::::::::::::::");

		} catch (Exception e) {

			e.printStackTrace();
		}
		return map;
	}
}
