package egovframework.com.nexa.common.domain;


/**
 *
 * WARNING: Auto create
 * Template File Version : 1.0
 * Create : Tue Jul 07 11:48:58 KST 2009
 *
 **/

public class Code extends BaseObject {

	private static final long serialVersionUID = -1585909996837400953L;
	
	// Fields
	private java.lang.String high_cd;
	private java.lang.String code_cd;
	private java.lang.String code_nm;
	private java.lang.String code_etc;
	private java.lang.String sort_cd;
	private java.lang.String code_note;
	private java.lang.String use_yn;
	private java.lang.String insert_id;
	private java.util.Date insert_dt;
	private java.lang.String update_id;
	private java.util.Date update_dt;
	private java.lang.String not_code_cd;
	private java.util.List<String> code_cds;

	public java.util.List<String> getCode_cds() {
		return code_cds;
	}
	public void setCode_cds(java.util.List<String> code_cds) {
		this.code_cds = code_cds;
	}
	// getter Method
	public java.lang.String getHigh_cd() {
		return high_cd;
	}
	public java.lang.String getCode_cd() {
		return code_cd;
	}
	public java.lang.String getCode_nm() {
		return code_nm;
	}
	public java.lang.String getCode_etc() {
		return code_etc;
	}
	public java.lang.String getSort_cd() {
		return sort_cd;
	}
	public java.lang.String geCodeNote() {
		return code_note;
	}
	public java.lang.String getUse_yn() {
		return use_yn;
	}
	public java.lang.String getInsert_id() {
		return insert_id;
	}
	public java.util.Date getInsert_dt() {
		return insert_dt;
	}
	public java.lang.String getUpdate_id() {
		return update_id;
	}
	public java.util.Date getUpdate_dt() {
		return update_dt;
	}

	// setter Method
	public void setHigh_cd(java.lang.String high_cd) {
		this.high_cd = high_cd;
	}
	public void setCode_cd(java.lang.String code_cd) {
		this.code_cd = code_cd;
	}
	public void setCode_nm(java.lang.String code_nm) {
		this.code_nm = code_nm;
	}
	public void setCode_etc(java.lang.String code_etc) {
		this.code_etc = code_etc;
	}
	public void setSort_cd(java.lang.String sort_cd) {
		this.sort_cd = sort_cd;
	}
	public void setCodeNote(java.lang.String code_note) {
		this.code_note = code_note;
	}
	public void setUse_yn(java.lang.String use_yn) {
		this.use_yn = use_yn;
	}
	public void setInsert_id(java.lang.String insert_id) {
		this.insert_id = insert_id;
	}
	public void setInsert_dt(java.util.Date insert_dt) {
		this.insert_dt = insert_dt;
	}
	public void setUpdate_id(java.lang.String update_id) {
		this.update_id = update_id;
	}
	public void setUpdate_dt(java.util.Date update_dt) {
		this.update_dt = update_dt;
	}
	public void setNot_code_cd(java.lang.String not_code_cd) {
		this.not_code_cd = not_code_cd;
	}
	public java.lang.String getNot_code_cd() {
		return not_code_cd;
	}


}