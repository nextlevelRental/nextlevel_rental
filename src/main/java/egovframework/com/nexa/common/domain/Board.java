package egovframework.com.nexa.common.domain;


/**
 *
 * WARNING: Auto create
 * Template File Version : 1.0
 * Create : Tue Oct 06 18:27:58 KST 2014
 *
 **/
public class Board extends BaseObject {

	//private static final long serialVersionUID = 1657431909881492135L;
	
	// Fields
	private java.lang.String title;
	private java.lang.String reg_id;
	private java.util.Date reg_date;
	private java.lang.String post_id;
	private java.lang.String contents;
	private java.lang.String community_id;
	
	private java.util.List<String> board_set;

	// getter Method
	public java.lang.String getTitle() {
		return title;
	}
	

	public java.lang.String getReg_id() {
		return reg_id;
	}
	
	public java.util.Date getReg_date() {
		return reg_date;
	}
	
	public java.lang.String getPost_id() {
		return post_id;
	}
	
	public java.lang.String getContents() {
		return contents;
	}
	
	public java.lang.String getCommunity_id() {
		return community_id;
	}
	
	// setter Method
	public void setTitle(java.lang.String title) {
		this.title = title;
	}
	
	public void setReg_id(java.lang.String reg_id) {
		this.reg_id = reg_id;
	}
	
	public void setReg_date(java.util.Date reg_date) {
		this.reg_date = reg_date;
	}
	
	
	public void setPost_id(java.lang.String post_id) {
		this.post_id = post_id;
	}
	
	public void setContents(java.lang.String contents) {
		this.contents = contents;
	}
	
	public void setCommunity_id(java.lang.String community_id) {
		this.community_id = community_id;
	}
	
	public java.util.List<String> getBoard_set() {
		return board_set;
	}
	public void setBoard_set(java.util.List<String> board_set) {
		this.board_set = board_set;
	}

}