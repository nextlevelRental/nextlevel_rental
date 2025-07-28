/**
 * 
 */
package egovframework.ntrms.kr.co.brn.cm.vo;

/**
 * @author   kstka
 * @since     2024. 1. 22.
 * @version  1.0
 *
 * << 변경이력 (Modification Information) >>
 *
 * 변경번호:  #1
 * 변경일자:  2024. 1. 22.
 * 변경자:     kstka
 * 변경내용:
 */
public class RTCMSmsParamVO {

	private String midGrpCd;
	private String cd;
	private String paramCd;
	private String paramCdNm;
	private String paramCdDesc;
	private int orderPt;
	private String useYn;
	
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
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
}
