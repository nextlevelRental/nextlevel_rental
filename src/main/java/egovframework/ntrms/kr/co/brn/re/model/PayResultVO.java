package egovframework.ntrms.kr.co.brn.re.model;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

import egovframework.ntrms.kr.co.brn.re.model.RTREEnums.KCPErrorType;

/**
 * 결과
 * 
 * @author 강신규
 * @since 2019. 2. 26. 오후 9:42:01
 * @see 
 * <pre>
 * ========== History ==========
 * 
 * 2019. 2. 26. / 강신규 : 최초생성
 * </pre>
 */
public class PayResultVO extends PayVOBase<PayResultVO> implements Serializable {
	/**  */
	private static final long serialVersionUID = -599559086270996195L;
	
	private String resCd		= "";	/* 결과 코드					*/
	private String resMsg		= "";	/* 결과 메시지					*/
	
	/** 주문, 부분취소 */
	private String amount		= "";	/* 총 금액						*/
	
	/** 주문 */
	private String tno			= "";	/* KCP 거래번호					*/
	private String crdCd		= "";	/* 결제카드사 코드				*/
	private String crdNm		= "";	/* 결제카드사 명				*/
	private String appTime		= "";	/* 승인시간						*/
	private String appNo		= "";	/* 승인번호						*/
	private String quota		= "";	/* 할부개월						*/
	private String noinf		= "";	/* 무이자 여부					*/
	private String noinfType	= "";	/* 무이자 결제 시 이벤트 구분	*/
	private String matNm		= "";	/* 상품명(추출)					*/
		
	/** 부분취소 */
	private String panc_mod_mny	= "";	/* 부분취소 요청금액			*/
	private String panc_rem_mny	= "";	/* 부분취소 가능금액			*/
	
	private Map<String, Object> customer = new HashMap<>();
	
	public String getResCd() {
		return resCd;
	}
	public String getResMsg() {
		return resMsg;
	}
	public String getTno() {
		return tno;
	}
	public String getCrdCd() {
		return crdCd;
	}
	public String getCrdNm() {
		return crdNm;
	}
	public String getAppTime() {
		return appTime;
	}
	public String getAppNo() {
		return appNo;
	}
	public String getQuota() {
		return quota;
	}
	public String getNoinf() {
		return noinf;
	}
	public String getNoinfType() {
		return noinfType;
	}
	public String getAmount() {
		return amount;
	}
	public String getPanc_mod_mny() {
		return panc_mod_mny;
	}
	public String getPanc_rem_mny() {
		return panc_rem_mny;
	}
	public String getMatNm() {
		return matNm;
	}
	
	public Map<String, Object> getCustomer() {
		return customer;
	}
	
	public PayResultVO setResCd(String resCd) {
		this.resCd = resCd;
		return this;
	}
	public PayResultVO setResMsg(String resMsg) {
		this.resMsg = resMsg;
		return this;
	}
	public PayResultVO setAmount(String amount) {
		this.amount = amount;
		return this;
	}
	public PayResultVO setTno(String tno) {
		this.tno = tno;
		return this;
	}
	public PayResultVO setCrdCd(String crdCd) {
		this.crdCd = crdCd;
		return this;
	}
	public PayResultVO setCrdNm(String crdNm) {
		this.crdNm = crdNm;
		return this;
	}
	public PayResultVO setAppTime(String appTime) {
		this.appTime = appTime;
		return this;
	}
	public PayResultVO setAppNo(String appNo) {
		this.appNo = appNo;
		return this;
	}
	public PayResultVO setQuota(String quota) {
		this.quota = quota;
		return this;
	}
	public PayResultVO setNoinf(String noinf) {
		this.noinf = noinf;
		return this;
	}
	public PayResultVO setNoinfType(String noinfType) {
		this.noinfType = noinfType;
		return this;
	}
	public PayResultVO setPanc_mod_mny(String panc_mod_mny) {
		this.panc_mod_mny = panc_mod_mny;
		return this;
	}
	public PayResultVO setPanc_rem_mny(String panc_rem_mny) {
		this.panc_rem_mny = panc_rem_mny;
		return this;
	}
	public PayResultVO setMatNm(String matNm) {
		this.matNm = matNm;
		return this;
	}
	public PayResultVO setCustomer(Map<String, Object> customer) {
		this.customer = customer;
		return this;
	}
	public PayResultVO setError(KCPErrorType errorType) {
		return setError(errorType.cd(), errorType.val());
	}
	public PayResultVO setError(KCPErrorType errorType, String msg) {
		return setError(errorType.cd(), msg);
	}
	public PayResultVO setError(String cd, String msg) {
		this.resCd = cd;
		this.resMsg = msg;
		return this;
	}
	
	public static PayResultVO of() {
		return new PayResultVO();
	}
}