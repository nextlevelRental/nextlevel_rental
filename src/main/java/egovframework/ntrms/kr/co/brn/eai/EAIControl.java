package egovframework.ntrms.kr.co.brn.eai;

import java.io.StringReader;
import java.util.HashMap;
import java.util.Map;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathFactory;

import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import egovframework.ntrms.kr.co.brn.cs.dao.EAI.SMSManager;

public class EAIControl {
	protected Log logger = LogFactory.getLog(this.getClass());
	
	public EAIControl() {}
	
	/**EAI 연계
	 * <pre>
	 * EAI연계 XML형태로 데이터 전송 방식 
	 * 7개의 element만 전송
	 * CMP_MSG_ID, USED_CD, RCV_PHN_ID, SND_PHN_ID
	 * SND_MSG, CONTETN_CNT, CONTENT_MIME_TYPE
	 * </pre>	 
	 * @param CmSMSVO cmSmVO
	 */
	public Map sendEAI(Map inMap){
		logger.debug("<sendEAI> Controller Called!");
	
		Map<String, Object> rtnMap =new HashMap();
		
		try {	
			String ifId = (String)inMap.get("ifId");	// Interface ID
			
			logger.debug("ifId = [" +ifId + "]");
			
			String data = "<?xml version='1.0' encoding='UTF-8'?>";	    
			data = data + "<EaiSend>";	    
			data = data + "<v_Period>" + inMap.get("inParam01") + "</v_Period>";
			
			/*
			 * I/F 종류에 따라 Input Parameter 추가
			 */
			if ("NTRMS_104".equalsIgnoreCase(ifId))
				data = data + "<v_Postp_Tp>" + inMap.get("inParam02") + "</v_Postp_Tp>";
			
			data = data + "</EaiSend>";	   
			
			EAIService eaiSrvc = new EAIService(true);
			
			String retData = eaiSrvc.sendSync(ifId, data);
			
			/*
			 * EAI 결과를 parsing하여 XML 객체로 생성
			 */
			InputSource is = new InputSource(new StringReader(retData));
			Document document = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(is);	// XML Document 객체 생성

			XPath xpath = XPathFactory.newInstance().newXPath();

			/*
			 * EAI 결과의 모든 컬럼을 획득
			 * - 1 row만 반환될 것을 전재로 함
			 */
			NodeList cols1 = (NodeList)xpath.evaluate("//Reply_Msg/O_FLAG", document, XPathConstants.NODESET);
			NodeList cols2 = (NodeList)xpath.evaluate("//Reply_Msg/O_MESG", document, XPathConstants.NODESET);
			
	        // EAI 결과값 - S:성공, E:실패
			String oFlag = (String)cols1.item(0).getTextContent();
			String oMesg = (String)cols2.item(0).getTextContent();
			
			/*
			 * temp code for test
			 */
			//String oFlag = "S";
			//String oMesg = "Test Message";
			
			logger.debug("oFlag = [" + oFlag + "]");
			logger.debug("oMesg = [" + oMesg + "]");
			
			rtnMap.put("oFlag", oFlag);
			rtnMap.put("oMesg", oMesg);
			
		} catch (Exception e) {
			logger.debug(e);
			e.printStackTrace();
			
			rtnMap.put("oFlag", "E");
			rtnMap.put("oMesg", "[EAI통신오류] " + e.toString());
		}
		
		return rtnMap;
	}
	
	/**EAI 연계 (전표생성용)
	 * <pre>
	 * EAI연계 XML형태로 데이터 전송 방식 
	 * 7개의 element만 전송
	 * CMP_MSG_ID, USED_CD, RCV_PHN_ID, SND_PHN_ID
	 * SND_MSG, CONTETN_CNT, CONTENT_MIME_TYPE
	 * </pre>	 
	 * @param CmSMSVO cmSmVO
	 */
	public Map sendEAI_Posting(Map inMap){
		logger.debug("<sendEAI> Controller Called!");
	
		Map<String, Object> rtnMap =new HashMap();
		
		try {	
			String ifId = (String)inMap.get("ifId");	// Interface ID
			
			logger.debug("ifId = [" +ifId + "]");
			
			String data = "<?xml version='1.0' encoding='UTF-8'?>";	    
			data = data + "<EaiSend>";	    
			data = data + "<v_Period>" + inMap.get("zmonth") + "</v_Period>";
			data = data + "<v_StmtCd>" + inMap.get("stmtCd") + "</v_StmtCd>";
			data = data + "</EaiSend>";	   
			
			EAIService eaiSrvc = new EAIService(true);
			
			String retData = eaiSrvc.sendSync(ifId, data);
			
			/*
			 * EAI 결과를 parsing하여 XML 객체로 생성
			 */
			InputSource is = new InputSource(new StringReader(retData));
			Document document = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(is);	// XML Document 객체 생성

			XPath xpath = XPathFactory.newInstance().newXPath();

			/*
			 * EAI 결과의 모든 컬럼을 획득
			 * - 1 row만 반환될 것을 전재로 함
			 */
			NodeList cols1 = (NodeList)xpath.evaluate("//Reply_Msg/E_SUBRC", document, XPathConstants.NODESET);
			NodeList cols2 = (NodeList)xpath.evaluate("//Reply_Msg/E_REMSG", document, XPathConstants.NODESET);
			NodeList cols3 = (NodeList)xpath.evaluate("//Reply_Msg/E_BELNR", document, XPathConstants.NODESET);
			
			
	        // EAI 결과값 - S:성공, E:실패
			String oFlag = (String)cols1.item(0).getTextContent();
			String oMesg = (String)cols2.item(0).getTextContent();
			String oPnum = (String)cols3.item(0).getTextContent();
			
			/*
			 * temp code for test
			 */
			//String oFlag = "S";
			//String oMesg = "Test Message";
			
			logger.debug("oFlag = [" + oFlag + "]");
			logger.debug("oMesg = [" + oMesg + "]");
			logger.debug("oPnum = [" + oPnum + "]");
			
			rtnMap.put("oFlag", oFlag);
			rtnMap.put("oMesg", oMesg);
			rtnMap.put("oPnum", oPnum);
			
		} catch (Exception e) {
			logger.debug(e);
			e.printStackTrace();
			
			rtnMap.put("oFlag", "E");
			rtnMap.put("oMesg", "[EAI통신오류] " + e.toString());
		}
		
		return rtnMap;
	}
}
