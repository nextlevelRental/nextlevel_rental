package egovframework.ntrms.kr.co.brn.cs.dao.EAI;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.miracom.oneoone.transceiverx.ErrorCode;
import com.miracom.oneoone.transceiverx.Message;
import com.miracom.oneoone.transceiverx.Session;
import com.miracom.oneoone.transceiverx.Transceiver;
import com.miracom.oneoone.transceiverx.TrxException;

/**
 *SMS정보를 받아 EAI로 넘겨준다. 20150813 생성 
 * 
 * @author 한승훈 
 * @deprecated
 *
 */
public class SMSManager{
	protected Log logger = LogFactory.getLog(this.getClass());
	//private static final String connectString = "localhost:10101";		// LOCAL
	private static final String connectString = "172.17.64.36:10101"; 	// DEV
	//private static final String connectString = "172.17.64.42:10101";	// PROD
	private Transceiver transceiver;
	private Session session;	

	private boolean isXml; // if data format = XML then 'true' else 'false'

	public SMSManager() {
		isXml = true;
	}

	//	public SMSManager(boolean isXml) {
	//		this.isXml = isXml;
	//	}

	public String sendSync(String systemID, String interfaceID, String data) throws Exception {
		return sendSync(systemID, interfaceID, data, 30000);
	}

	public String sendSync(String systemID, String interfaceID, String data, long timeOut) throws Exception {
		String replyData = null;

		try {
			initSession();
			Message msg = createMsg(systemID, interfaceID, data, timeOut);
			Message replyMsg = session.sendRequest(msg);
			if (replyMsg == null)
				throw new TrxException(ErrorCode.INVALID_MESSAGE);

			replyData = readMsg(replyMsg);
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

	private void initSession() throws Exception {
		transceiver = new Transceiver(null, 0);
		session = Transceiver.createSession(null, Session.SESSION_PULL_DELIVERY_MODE | Session.SESSION_INTER_STATION_MODE);

		session.setDefaultTTL(30000);
		session.setAutoRecovery(true);

		session.connect(connectString);

	}

	private void termSession() throws Exception {
		session.destroy();
		transceiver.term();
	}

	private Message createMsg(String systemID, String interfaceID, String data, long ttl) throws Exception {
		Message msg = session.createMessage();
		if (isXml)
			msg.setData(data.getBytes("UTF-8"));
		else
			msg.setData(data.getBytes());

		msg.setTTL(ttl);

		String channel =  "/"+ systemID + "/" + interfaceID;
		logger.debug("channel::::::::::::::::::::::::::::::::::::");
		logger.debug("::::::::::::" + channel);
		logger.debug("channel::::::::::::::::::::::::::::::::::::");
		msg.setChannel(channel);
		return msg;
	}

	private String readMsg(Message msg) throws Exception {
		byte[] data = (byte[]) msg.getData();

		if (isXml)
			return new String(data, "UTF-8");
		else
			return new String(data);
	}
}	