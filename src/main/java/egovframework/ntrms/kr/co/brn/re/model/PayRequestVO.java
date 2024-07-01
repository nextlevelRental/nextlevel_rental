package egovframework.ntrms.kr.co.brn.re.model;

import java.io.Serializable;

/**
 * 결재 / 환불 파라미터
 * 
 * @author 강신규
 * @since 2019. 2. 26. 오후 9:28:26
 * @see 
 * <pre>
 * ========== History ==========
 * 
 * 2019. 2. 26. / 강신규 : 최초생성
 * </pre>
 */
public class PayRequestVO extends PayVOBase<PayRequestVO> implements Serializable {
	/**  */
	private static final long serialVersionUID = -687391207636181418L;
	
	/** 공통 */
	private String reqTx		 = "";		/* 결제/취소구분(PAY / MOD)								*/
	private String custNo		 = "";		/* 고객번호												*/
	private String ordNo		 = "";		/* 계약번호												*/
	private String recvDay		 = "";		/* 수납일자												*/
	private String workCd		 = "";		/* 업무구분(선납 : PRPT / 중도완납 : MFP)				*/
	private String regId		 = "";		/* 등록자 ID											*/
	private String requestURL	 = "";
	private String remoteAddr	 = "";		/* 등록자 IP											*/
	private String currency		 = "WON";	/* 화폐단위(WON / USD)									*/
	
	/** 수납(공통) */
	private String payMethodCd	 = "";		/* 지불방법코드											*/
	private String payMethodName = "";		/* 지불방법명											*/
	private String recpAmt		 = "";		/* 결제금액												*/
	private String email		 = "";		/* 주문자 E-mail										*/
	private String servAmt		 = "";		/* 추가납부금액											*/
	private String crdNo		 = "";		/* 카드번호												*/
	private String quotaopt		 = "";		/* 할부개월												*/
	private String expiryYy		 = "";		/* 유효기간(년)											*/
	private String expiryMm		 = "";		/* 유효기간(월)											*/
	private String cardauth		 = "";		/* 인증정보												*/
	private String cardpwd		 = "";		/* 카드비밀번호											*/
	
	/** 선납 */
	private String dcCd			 = "";		/* 할인코드												*/
	private String prptMon		 = "";		/* 선납개월												*/
	
	/** 중도완납 */
	private String cncDay		 = "";		/* 중도완납일											*/
	private String mfpCd		 =  "";		/* 종료유형												*/
	private String mfpRsnCd		 = "";		/* 완납해지사유코드										*/
	private String mfpDesc		 = "";		/* 완납해지상세사유										*/
	
	/** 환불 */
	private String modType		 = "";		/* 요청구분(전체: STSC / 부분 : STPC)					*/
	private String recvSeq		 = "";		/* 수납거래번호											*/
	private String modMny		 = "";		/* 취소요청금액											*/
	private String remMny		 = "";		/* 취소가능잔액											*/
	private String prptSeq		 = "";		/* 요청일련번호(선납)									*/
	private String tno			 = "";		/* KCP거래번호											*/
	private String modDesc		 = "";		/* 요청사유												*/
	
	public String getReqTx() {
		return reqTx;
	}
	
	public String getCustNo() {
		return custNo;
	}
	
	public String getOrdNo() {
		return ordNo;
	}
	
	public String getRecvDay() {
		return recvDay;
	}
	
	public String getPayMethodCd() {
		return payMethodCd;
	}
	
	public String getPayMethodName() {
		return payMethodName;
	}
	
	public String getRecpAmt() {
		return recpAmt;
	}
	
	public String getEmail() {
		return email;
	}
	
	public String getServAmt() {
		return servAmt;
	}
	
	public String getCrdNo() {
		return crdNo;
	}
	
	public String getQuotaopt() {
		return quotaopt;
	}
	
	public String getExpiryYy() {
		return expiryYy;
	}
	
	public String getExpiryMm() {
		return expiryMm;
	}
	
	public String getCardauth() {
		return cardauth;
	}
	
	public String getCardpwd() {
		return cardpwd;
	}
	
	public String getDcCd() {
		return dcCd;
	}
	
	public String getPrptMon() {
		return prptMon;
	}
	
	public String getCncDay() {
		return cncDay;
	}
	
	public String getMfpCd() {
		return mfpCd;
	}
	
	public String getMfpRsnCd() {
		return mfpRsnCd;
	}
	
	public String getMfpDesc() {
		return mfpDesc;
	}
	
	public String getWorkCd() {
		return workCd;
	}
	
	public String getModType() {
		return modType;
	}
	
	public String getRecvSeq() {
		return recvSeq;
	}
	
	public String getModMny() {
		return modMny;
	}
	
	public String getRemMny() {
		return remMny;
	}
	
	public String getPrptSeq() {
		return prptSeq;
	}
	
	public String getTno() {
		return tno;
	}
	
	public String getModDesc() {
		return modDesc;
	}
	
	public String getCurrency() {
		return currency;
	}
	
	public String getRegId() {
		return regId;
	}
	
	public String getRequestURL() {
		return requestURL;
	}
	
	public String getRemoteAddr() {
		return remoteAddr;
	}
	
	
	public PayRequestVO setReqTx( String reqTx ) {
		this.reqTx = reqTx;
		return this;
	}
	
	public PayRequestVO setCustNo( String custNo ) {
		this.custNo = custNo;
		return this;
	}
	
	public PayRequestVO setOrdNo( String ordNo ) {
		this.ordNo = ordNo;
		return this;
	}
	
	public PayRequestVO setRecvDay( String recvDay ) {
		this.recvDay = recvDay;
		return this;
	}
	
	public PayRequestVO setPayMethodCd( String payMethodCd ) {
		this.payMethodCd = payMethodCd;
		return this;
	}
	
	public PayRequestVO setPayMethodName( String payMethodName ) {
		this.payMethodName = payMethodName;
		return this;
	}
	
	public PayRequestVO setRecpAmt( String recpAmt ) {
		this.recpAmt = recpAmt;
		return this;
	}
	
	public PayRequestVO setEmail( String email ) {
		this.email = email;
		return this;
	}
	
	public PayRequestVO setServAmt( String servAmt ) {
		this.servAmt = servAmt;
		return this;
	}
	
	public PayRequestVO setCrdNo( String crdNo ) {
		this.crdNo = crdNo;
		return this;
	}
	
	public PayRequestVO setQuotaopt( String quotaopt ) {
		this.quotaopt = quotaopt;
		return this;
	}
	
	public PayRequestVO setExpiryYy( String expiryYy ) {
		this.expiryYy = expiryYy;
		return this;
	}
	
	public PayRequestVO setExpiryMm( String expiryMm ) {
		this.expiryMm = expiryMm;
		return this;
	}
	
	public PayRequestVO setCardauth( String cardauth ) {
		this.cardauth = cardauth;
		return this;
	}
	
	public PayRequestVO setCardpwd( String cardpwd ) {
		this.cardpwd = cardpwd;
		return this;
	}
	
	public PayRequestVO setDcCd( String dcCd ) {
		this.dcCd = dcCd;
		return this;
	}
	
	public PayRequestVO setPrptMon( String prptMon ) {
		this.prptMon = prptMon;
		return this;
	}
	
	public PayRequestVO setCncDay( String cncDay ) {
		this.cncDay = cncDay;
		return this;
	}
	
	public PayRequestVO setMfpCd( String mfpCd ) {
		this.mfpCd = mfpCd;
		return this;
	}
	
	public PayRequestVO setMfpRsnCd( String mfpRsnCd ) {
		this.mfpRsnCd = mfpRsnCd;
		return this;
	}
	
	public PayRequestVO setMfpDesc( String mfpDesc ) {
		this.mfpDesc = mfpDesc;
		return this;
	}
	
	public PayRequestVO setWorkCd( String workCd ) {
		this.workCd = workCd;
		return this;
	}
	
	public PayRequestVO setModType( String modType ) {
		this.modType = modType;
		return this;
	}
	
	public PayRequestVO setRecvSeq( String recvSeq ) {
		this.recvSeq = recvSeq;
		return this;
	}
	
	public PayRequestVO setModMny( String modMny ) {
		this.modMny = modMny;
		return this;
	}
	
	public PayRequestVO setRemMny( String remMny ) {
		this.remMny = remMny;
		return this;
	}
	
	public PayRequestVO setPrptSeq( String prptSeq ) {
		this.prptSeq = prptSeq;
		return this;
	}
	
	public PayRequestVO setTno( String tno ) {
		this.tno = tno;
		return this;
	}
	
	public PayRequestVO setModDesc( String modDesc ) {
		this.modDesc = modDesc;
		return this;
	}
	
	public PayRequestVO setCurrency( String currency ) {
		this.currency = currency;
		return this;
	}
	
	public PayRequestVO setRegId( String regId ) {
		this.regId = regId;
		return this;
	}
	
	public PayRequestVO setRequestURL( String requestURL ) {
		this.requestURL = requestURL;
		return this;
	}
	
	public PayRequestVO setRemoteAddr( String remoteAddr ) {
		this.remoteAddr = remoteAddr;
		return this;
	}
	
	public static PayRequestVO of() {
		return new PayRequestVO();
	}
}