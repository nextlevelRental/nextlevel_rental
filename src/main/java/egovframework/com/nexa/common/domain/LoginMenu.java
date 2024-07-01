package egovframework.com.nexa.common.domain;

import java.io.Serializable;

/**
 *
 * WARNING: Manual create
 * Template File Version : 1.0
 * Create : Tue Jul 07 11:48:58 KST 2009
 *
 **/
public class LoginMenu implements Serializable { 

	private static final long serialVersionUID = 8258314270267851769L;

	// Fields
	private java.lang.String menu_level;
	private java.lang.String menu_cd;
	private java.lang.String menu_nm;
	private java.lang.String parent_cd;
	private java.lang.String menu_link;
	private java.lang.String menu_image;
	private java.lang.String sort_cd;
	private java.lang.String menu_note;
	private java.lang.String use_yn;
	private java.lang.String menu_auth;
	private java.lang.String menu_navi;
	

	// getter Method
	public java.lang.String getMenu_level() {
		return menu_level;
	}
	public java.lang.String getMenu_cd() {
		return menu_cd;
	}
	public java.lang.String getMenu_nm() {
		return menu_nm;
	}
	public java.lang.String getParent_cd() {
		return parent_cd;
	}
	public java.lang.String getMenu_link() {
		return menu_link;
	}
	public java.lang.String getMenu_image() {
		return menu_image;
	}
	public java.lang.String getSort_cd() {
		return sort_cd;
	}
	public java.lang.String getMenu_Note() {
		return menu_note;
	}
	public java.lang.String getUse_yn() {
		return use_yn;
	}
	public java.lang.String getMenu_auth() {
		return menu_auth;
	}	
	public java.lang.String getMenu_navi() {
		return menu_navi;
	}

	// setter Method
	public void setMenu_level(java.lang.String menu_level) {
		this.menu_level = menu_level;
	}
	public void setMenu_cd(java.lang.String menu_cd) {
		this.menu_cd = menu_cd;
	}
	public void setMenu_nm(java.lang.String menu_nm) {
		this.menu_nm = menu_nm;
	}
	public void setParent_cd(java.lang.String parent_cd) {
		this.parent_cd = parent_cd;
	}
	public void setMenu_link(java.lang.String menu_link) {
		this.menu_link = menu_link;
	}
	public void setMenu_image(java.lang.String menu_image) {
		this.menu_image = menu_image;
	}
	public void setSort_cd(java.lang.String sort_cd) {
		this.sort_cd = sort_cd;
	}
	public void setMenu_Note(java.lang.String menu_note) {
		this.menu_note = menu_note;
	}
	public void setUse_yn(java.lang.String use_yn) {
		this.use_yn = use_yn;
	}
	public void setMenu_auth(java.lang.String menu_auth) {
		this.menu_auth = menu_auth;
	}
	public void setMenu_navi(java.lang.String menu_navi) {
		this.menu_navi = menu_navi;
	}
	
}