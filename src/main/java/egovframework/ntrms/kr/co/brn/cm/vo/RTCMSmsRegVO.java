package egovframework.ntrms.kr.co.brn.cm.vo;

import java.util.Date;
import java.util.List;

public class RTCMSmsRegVO {

	private String lrgGrpCd = null;
	private String midGrpCd = null;
	private String cd = null;
	
	private String midGrpNm = null;
	private String cdNm = null;
	private String midGrpDesc = null;
	 
	private String paramCd = null;
	private String paramCdNm = null;
	private String paramCdDesc = null;
	
	private int orderPt = 0;
	private int seq = 0;
	
	private String msgContents = null;
	private String kakaoMsgCd = null;
	private String msgType = null;
	private String reservedType = null;
	
	private String useYn = null;
	private String useYnNm = null;
	
	private String regId = null;
	private String chgId = null;
	
	private Date regDt = null;
	private Date chgDt = null;
	
	private List<RTCMSmsRegVO> result  = null;
	
	private String seqSmsPosSeqNo = "00000";

	private String sendPos;
	private String remark;
	
	private int checkCdCnt;
	
	public String getLrgGrpCd() {
		return lrgGrpCd;
	}

	public void setLrgGrpCd(String lrgGrpCd) {
		this.lrgGrpCd = lrgGrpCd;
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

	public String getMidGrpNm() {
		return midGrpNm;
	}

	public void setMidGrpNm(String midGrpNm) {
		this.midGrpNm = midGrpNm;
	}

	public String getCdNm() {
		return cdNm;
	}

	public void setCdNm(String cdNm) {
		this.cdNm = cdNm;
	}

	public String getMidGrpDesc() {
		return midGrpDesc;
	}

	public void setMidGrpDesc(String midGrpDesc) {
		this.midGrpDesc = midGrpDesc;
	}

	public String getParamCd() {
		return paramCd;
	}

	public void setParamCd(String paramCd) {
		this.paramCd = paramCd;
	}

	public String getParamCdNm() {
		return paramCdNm;
	}

	public void setParamCdNm(String paramCdNm) {
		this.paramCdNm = paramCdNm;
	}

	public String getParamCdDesc() {
		return paramCdDesc;
	}

	public void setParamCdDesc(String paramCdDesc) {
		this.paramCdDesc = paramCdDesc;
	}

	public int getOrderPt() {
		return orderPt;
	}

	public void setOrderPt(int orderPt) {
		this.orderPt = orderPt;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getMsgContents() {
		return msgContents;
	}

	public void setMsgContents(String msgContents) {
		this.msgContents = msgContents;
	}

	public String getKakaoMsgCd() {
		return kakaoMsgCd;
	}

	public void setKakaoMsgCd(String kakaoMsgCd) {
		this.kakaoMsgCd = kakaoMsgCd;
	}

	public String getMsgType() {
		return msgType;
	}

	public void setMsgType(String msgType) {
		this.msgType = msgType;
	}

	public String getReservedType() {
		return reservedType;
	}

	public void setReservedType(String reservedType) {
		this.reservedType = reservedType;
	}

	public String getUseYn() {
		return useYn;
	}

	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}

	protected String getUseYnNm() {
		return useYnNm;
	}

	protected void setUseYnNm(String useYnNm) {
		this.useYnNm = useYnNm;
	}

	public String getRegId() {
		return regId;
	}

	public void setRegId(String regId) {
		this.regId = regId;
	}

	public String getChgId() {
		return chgId;
	}

	public void setChgId(String chgId) {
		this.chgId = chgId;
	}

	public Date getRegDt() {
		return regDt;
	}

	public void setRegDt(Date regDt) {
		this.regDt = regDt;
	}

	public Date getChgDt() {
		return chgDt;
	}

	public void setChgDt(Date chgDt) {
		this.chgDt = chgDt;
	}

	public String getSeqSmsPosSeqNo() {
		return seqSmsPosSeqNo;
	}

	public void setSeqSmsPosSeqNo(String seqSmsPosSeqNo) {
		this.seqSmsPosSeqNo = seqSmsPosSeqNo;
	}

	public String getSendPos() {
		return sendPos;
	}

	public void setSendPos(String sendPos) {
		this.sendPos = sendPos;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public int getCheckCdCnt() {
		return checkCdCnt;
	}

	public void setCheckCdCnt(int checkCdCnt) {
		this.checkCdCnt = checkCdCnt;
	}

	public List<RTCMSmsRegVO> getResult() {
		return result;
	}

	public void setResult(List<RTCMSmsRegVO> result) {
		this.result = result;
	}
	
}
