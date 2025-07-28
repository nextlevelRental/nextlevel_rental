package egovframework.com.nexa.common.domain;


/**
 *
 * WARNING: Auto create
 * Template File Version : 1.0
 * Create : Tue Jul 07 11:48:58 KST 2009
 *
 **/

public class Dept extends BaseObject {

	private static final long serialVersionUID = 4642814818980540239L;
	// Fields
	private java.lang.String dept_cd;
	private java.lang.String dept_nm;
	private java.lang.String parent_cd;
	private java.lang.String dept_tel;
	private java.lang.String dept_fax;
	private java.lang.String establish_dt;
	private java.lang.String dept_note;
	private java.lang.String use_yn;
	private java.lang.String insert_id;
	private java.util.Date insert_dt;
	private java.lang.String update_id;
	private java.util.Date update_dt;
	private java.util.List<String> dept_cds;
	
	// getter Method
	public java.lang.String getDept_cd() {
		return dept_cd;
	}
	public java.lang.String getDept_nm() {
		return dept_nm;
	}
	public java.lang.String getParent_cd() {
		return parent_cd;
	}
	public java.lang.String getDept_tel() {
		return dept_tel;
	}
	public java.lang.String getDept_fax() {
		return dept_fax;
	}
	public java.lang.String getEstablish_dt() {
		return establish_dt;
	}
	public java.lang.String getDept_note() {
		return dept_note;
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
	public java.util.List<String> getDept_cds() {
		return dept_cds;
	}
	
	// setter Method
	public void setDept_cd(java.lang.String dept_cd) {
		this.dept_cd = dept_cd;
	}
	public void setDept_nm(java.lang.String dept_nm) {
		this.dept_nm = dept_nm;
	}
	public void setParent_cd(java.lang.String parent_cd) {
		this.parent_cd = parent_cd;
	}
	public void setDept_tel(java.lang.String dept_tel) {
		this.dept_tel = dept_tel;
	}
	public void setDept_fax(java.lang.String dept_fax) {
		this.dept_fax = dept_fax;
	}
	public void setEstablish_dt(java.lang.String establish_dt) {
		this.establish_dt = establish_dt;
	}
	public void setDept_note(java.lang.String dept_note) {
		this.dept_note = dept_note;
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
	public void setDept_cds(java.util.List<String> dept_cds) {
		this.dept_cds = dept_cds;
	}
}