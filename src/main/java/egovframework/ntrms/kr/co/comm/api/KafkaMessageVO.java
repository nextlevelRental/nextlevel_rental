package egovframework.ntrms.kr.co.comm.api;

public class KafkaMessageVO {

	private String sendPos;
	private String midGrpCd;
	private String cd;
	private String custNo;
	private String ordNo;
	private String rcvPhnId;
	private String sndPhnId;
	private String reservedDttm;
	private String reservedFg;
	
	
	public String getSendPos() {
		return sendPos;
	}
	public void setSendPos(String sendPos) {
		this.sendPos = sendPos;
	}
	public String getMidGrpCd() {
		return midGrpCd;
	}
	public void setMidGrpCd(String midGrpCd) {
		this.midGrpCd = midGrpCd;
	}
	public String getCd() {
		return cd;
	}
	public void setCd(String cd) {
		this.cd = cd;
	}
	public String getCustNo() {
		return custNo;
	}
	public void setCustNo(String custNo) {
		this.custNo = custNo;
	}
	public String getOrdNo() {
		return ordNo;
	}
	public void setOrdNo(String ordNo) {
		this.ordNo = ordNo;
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
	public String getReservedDttm() {
		return reservedDttm;
	}
	public void setReservedDttm(String reservedDttm) {
		this.reservedDttm = reservedDttm;
	}
	public String getReservedFg() {
		return reservedFg;
	}
	public void setReservedFg(String reservedFg) {
		this.reservedFg = reservedFg;
	}


}
