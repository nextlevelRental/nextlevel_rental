package egovframework.com.nexa.common.domain;

import java.io.Serializable;

/**
 *
 * WARNING: Auto create
 * Template File Version : 1.0
 * Create : Tue Jul 07 11:48:58 KST 2009
 *
 **/

public class Category implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7066327876411343627L;
	// Fields
	private java.lang.String category_cd;
	private java.lang.String category_nm;
	private java.lang.String parent_cd;
	private java.lang.String related_category_cd;

	private java.lang.String sort_cd;
	private java.lang.String category_note;
	private java.lang.String use_yn;
	private java.lang.String main_yn;
	private java.lang.String category_sort_cd;
	
	private java.lang.String insert_id;
	private java.util.Date insert_dt;
	private java.lang.String update_id;
	private java.util.Date update_dt;

	// getter Method
	public java.lang.String getCategory_cd() {
		return category_cd;
	}
	public java.lang.String getCategory_nm() {
		return category_nm;
	}
	public java.lang.String getParent_cd() {
		return parent_cd;
	}
	public java.lang.String getSort_cd() {
		return sort_cd;
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
	public void setCategory_cd(java.lang.String category_cd) {
		this.category_cd = category_cd;
	}
	public void setCategory_nm(java.lang.String category_nm) {
		this.category_nm = category_nm;
	}
	public void setParent_cd(java.lang.String parent_cd) {
		this.parent_cd = parent_cd;
	}
	public void setSort_cd(java.lang.String sort_cd) {
		this.sort_cd = sort_cd;
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
	public void setCategory_note(java.lang.String category_note) {
		this.category_note = category_note;
	}
	public java.lang.String getCategory_note() {
		return category_note;
	}
	public java.lang.String getRelated_category_cd() {
		return related_category_cd;
	}
	public void setRelated_category_cd(java.lang.String related_category_cd) {
		this.related_category_cd = related_category_cd;
	}
	public java.lang.String getMain_yn() {
		return main_yn;
	}
	public void setMain_yn(java.lang.String main_yn) {
		this.main_yn = main_yn;
	}
	public java.lang.String getCategory_sort_cd() {
		return category_sort_cd;
	}
	public void setCategory_sort_cd(java.lang.String category_sort_cd) {
		this.category_sort_cd = category_sort_cd;
	}
	

}