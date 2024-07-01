package egovframework.com.nexa.common.domain;


/**
 *
 * WARNING: Auto create
 * Template File Version : 1.0
 * Create : Tue Jul 07 11:48:58 KST 2009
 *
 **/
public class Menu extends BaseObject {

	private static final long serialVersionUID = 8258314270267851769L;

	// Fields
	private java.lang.String 	menu_cd;
	private java.lang.String 	menu_nm;
	private java.lang.String 	parent_cd;
	private java.lang.String 	menu_link;
	private java.lang.String 	menu_image;
	private java.lang.String	sort_cd;
	private java.lang.String 	menu_note;
	private java.lang.String 	use_yn;
	private java.lang.String 	insert_id;
	private java.util.Date 		insert_dt;
	private java.lang.String 	update_id;
	private java.util.Date 		update_dt;
	
	private java.lang.String level;

	// getter Method
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
	public void setMenu_note(java.lang.String menu_note) {
		this.menu_note = menu_note;
	}
	public java.lang.String getMenu_note() {
		return menu_note;
	}
	public void setLevel(java.lang.String level) {
		this.level = level;
	}
	public java.lang.String getLevel() {
		return level;
	}

}