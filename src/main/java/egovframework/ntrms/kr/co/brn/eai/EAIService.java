package egovframework.ntrms.kr.co.brn.eai;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.miracom.oneoone.transceiverx.ErrorCode;
import com.miracom.oneoone.transceiverx.Message;
import com.miracom.oneoone.transceiverx.Session;
import com.miracom.oneoone.transceiverx.Transceiver;
import com.miracom.oneoone.transceiverx.TrxException;

/**
 * EAI 송수신
 * @author		wjim
 * @since		2016.06.08
 * @version		1.0
 */
public class EAIService {
	// log 객체 생성
	protected Log logger = LogFactory.getLog(this.getClass());
	
	private Transceiver transceiver;
	private Session session;
	private boolean isXml;				// if data format = XML then 'true' else 'false'
	
	/*
	 * EAI Server 접속정보 | SYSTEM ID
	 * - 운영기 : 172.17.32.145:10101;172.17.32.146:10101 | LIVE/NTRMS 
	 * - 개발기 : 172.17.32.147:10101 | DEV/NTRMS
	 */
	private static final String CONN_STR  = "172.17.32.145:10101;172.17.32.146:10101";
	private static final String SYSTEM_ID = "LIVE/NTRMS";
	private static final long DEFAULT_TTL = 600000;	//EAI접속 및 I/F 작업시간(5분=300초=300000밀리초)을 고려하여 세팅할 것
	
	public EAIService() {
		isXml = true;
	}
	
	public EAIService(boolean isXml) {
		this.isXml = isXml;
	}
	
	public String sendSync(String interfaceID, String data) throws Exception {
		return sendSync(interfaceID, data, DEFAULT_TTL);
	}
	
	public String sendSync(String interfaceID, String data, long timeOut) throws Exception {
		logger.debug("<EAIServie.sendSync> called..");
		
		String replyData = null;

		try {
			initSession();
			
			Message msg = createMsg(interfaceID, data, timeOut);	// 메시지 생성
			Message replyMsg = session.sendRequest(msg);			// 생성된 메시지 EAI로 송수신
			
			if (replyMsg == null)
				throw new TrxException(ErrorCode.INVALID_MESSAGE);

			replyData = readMsg(replyMsg);
			
			logger.debug("replyData = [" + replyData + "]");
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
			
		} finally {
			try {
				termSession();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return replyData;
	}
	
	private Message createMsg(String interfaceID, String data, long ttl) throws Exception {
		Message msg = session.createMessage();
		
		if (isXml) {
			msg.setData(data.getBytes("UTF-8"));
		} else {
			msg.setData(data.getBytes());
		}

		msg.setTTL(ttl);

		String channel =  "/"+ SYSTEM_ID + "/" + interfaceID;

		msg.setChannel(channel);
		
		return msg;
	}

	private String readMsg(Message msg) throws Exception {
		byte[] data = (byte[]) msg.getData();

		if (isXml) {
			return new String(data, "UTF-8");
		} else {
			return new String(data);
		}
	}
		
	private void initSession() throws Exception {
		transceiver = new Transceiver(null, 0);
		
		session = Transceiver.createSession(null, Session.SESSION_PULL_DELIVERY_MODE | Session.SESSION_INTER_STATION_MODE);
		
		session.setDefaultTTL(DEFAULT_TTL);
		session.setAutoRecovery(true);
		session.connect(CONN_STR);
	}
	
	private void termSession() throws Exception {
		session.destroy();
		transceiver.term();
	}	
}
