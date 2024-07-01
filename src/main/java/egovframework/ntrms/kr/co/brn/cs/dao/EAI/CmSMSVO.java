package egovframework.ntrms.kr.co.brn.cs.dao.EAI;

/**
 * @author		한승훈
 * @category 	SMS
 * @since		2015.08.13
 */
public class CmSMSVO {
	private String cmpMsgId;
	private String usedCd;
	private String rcvPhnId;
	private String sndPhnId;
	private String sndMsg;
	private int contentCnt;
	private String contentMimeType;
	public String getCmpMsgId() {
		return cmpMsgId;
	}
	public void setCmpMsgId(String cmpMsgId) {
		this.cmpMsgId = cmpMsgId;
	}
	public String getUsedCd() {
		return usedCd;
	}
	public void setUsedCd(String usedCd) {
		this.usedCd = usedCd;
	}
	
	public String getRcvPhnId() {
		return rcvPhnId;
	}
	public void setRcvPhnId(String rcvPhnId) {
		this.rcvPhnId = rcvPhnId;
	}
	public String getSndPhnId() {
		return sndPhnId;
	}
	public void setSndPhnId(String sndPhnId) {
		this.sndPhnId = sndPhnId;
	}
	public String getSndMsg() {
		return sndMsg;
	}
	public void setSndMsg(String sndMsg) {
		this.sndMsg = sndMsg;
	}
	public int getContentCnt() {
		return contentCnt;
	}
	public void setContentCnt(int contentCnt) {
		this.contentCnt = contentCnt;
	}
	public String getContentMimeType() {
		return contentMimeType;
	}
	public void setContentMimeType(String contentMimeType) {
		this.contentMimeType = contentMimeType;
	}
	
	
	
}
