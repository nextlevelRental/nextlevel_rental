package egovframework.com.nexa.common.domain;

import org.springframework.web.multipart.MultipartFile;

/**
 *
 * WARNING: Auto create
 * Template File Version : 1.0
 * Create : Fri Sep 25 19:39:47 KST 2009
 *
 **/

public class Customer extends BaseObject {

	private static final long serialVersionUID = -7693281364808963297L;
	// Fields
	private java.lang.String cust_id;
	private java.lang.String first_nm;
	private java.lang.String middle_nm;
	private java.lang.String last_nm;
	private java.lang.String cust_pwd;
	private java.lang.String pwd_question;
	private java.lang.String pwd_answer;
	private java.lang.String original_country;
	private java.lang.String cust_country;
	private java.lang.String cust_zipcode;
	private java.lang.String cust_state;
	private java.lang.String cust_city;
	private java.lang.String cust_addr1;
	private java.lang.String cust_addr2;
	private java.lang.String cust_cp;
	private java.lang.String cust_tel;
	private java.lang.String extra_tel;
	private java.lang.String cust_fax;
	private java.lang.String cust_web_site;
	private java.lang.String cust_email;
	private java.lang.String email_special_yn;
	private java.lang.String email_markdown_yn;
	private java.lang.String email_new_arrival_yn;
	private java.lang.String email_manufacturer1;
	private java.lang.String email_manufacturer2;
	private java.lang.String email_category1;
	private java.lang.String email_category2;
	private java.lang.String parent_cd1;
	private java.lang.String parent_cd2;
	private java.lang.String cust_type;
	private java.lang.String business_type;
	private java.lang.String company_nm;
	private java.lang.String company_title;
	private java.lang.String company_employee_num;
	private java.lang.String cust_sex;
	private java.lang.String cust_age_group;
	private java.lang.String receive_email_yn;
	private java.lang.String receive_tel_yn;
	private java.lang.String receive_newsletter_yn;
	private java.lang.String join_type;
	private java.lang.String join_dt;
	private java.lang.String withdrawal_dt;
	private java.lang.String withdrawal_reason;
	private java.lang.String withdrawal_email;
	private java.lang.String cust_class;
	private java.lang.String current_hgr_credit_amt;
	private java.lang.String cust_salesman_id;
	private java.lang.String tax_exemption_yn;
	private java.lang.String tax_file_seq;
	private java.lang.String tax_file_nm;
	private java.lang.String cust_note;
	private java.lang.String insert_id;
	private java.util.Date insert_dt;
	private java.lang.String update_id;
	private java.util.Date update_dt;
	private java.lang.String cust_salesman_nm;
	private java.lang.String tax_filr_url;
	private java.lang.String settle_type;
	private MultipartFile file;
	private java.lang.String comp_cd;
	private java.lang.String cust_nm;
	private java.lang.String comp_nm;
	private java.lang.String cust_barcode;
	private java.lang.String staff_id;
	private java.lang.String tot_apar_sum;
	private java.lang.String cust_other_region;
	private java.lang.String cust_other_city;
	private java.lang.String cust_canada_province;

	// getter Method
	public java.lang.String getTot_apar_sum() {
		return tot_apar_sum;
	}
	
	public java.lang.String getSettle_type() {
		return settle_type;
	}

	public java.lang.String getComp_cd() {
		return comp_cd;
	}

	public java.lang.String getCust_nm() {
		return cust_nm;
	}

	public java.lang.String getCust_id() {
		return cust_id;
	}
	public java.lang.String getFirst_nm() {
		return first_nm;
	}
	public java.lang.String getMiddle_nm() {
		return middle_nm;
	}
	public java.lang.String getLast_nm() {
		return last_nm;
	}
	public java.lang.String getCust_pwd() {
		return cust_pwd;
	}
	public java.lang.String getPwd_question() {
		return pwd_question;
	}
	public java.lang.String getPwd_answer() {
		return pwd_answer;
	}
	public java.lang.String getOriginal_country() {
		return original_country;
	}
	public java.lang.String getCust_country() {
		return cust_country;
	}
	public java.lang.String getCust_zipcode() {
		return cust_zipcode;
	}
	public java.lang.String getCust_state() {
		return cust_state;
	}
	public java.lang.String getCust_city() {
		return cust_city;
	}
	public java.lang.String getCust_addr1() {
		return cust_addr1;
	}
	public java.lang.String getCust_addr2() {
		return cust_addr2;
	}
	public java.lang.String getCust_cp() {
		return cust_cp;
	}
	public java.lang.String getCust_tel() {
		return cust_tel;
	}
	public java.lang.String getExtra_tel() {
		return extra_tel;
	}
	public java.lang.String getCust_fax() {
		return cust_fax;
	}
	public java.lang.String getCust_web_site() {
		return cust_web_site;
	}
	public java.lang.String getCust_email() {
		return cust_email;
	}
	public java.lang.String getEmail_special_yn() {
		return email_special_yn;
	}
	public java.lang.String getEmail_markdown_yn() {
		return email_markdown_yn;
	}
	public java.lang.String getEmail_new_arrival_yn() {
		return email_new_arrival_yn;
	}
	public java.lang.String getEmail_manufacturer1() {
		return email_manufacturer1;
	}
	public java.lang.String getEmail_manufacturer2() {
		return email_manufacturer2;
	}
	public java.lang.String getEmail_category1() {
		return email_category1;
	}
	public java.lang.String getEmail_category2() {
		return email_category2;
	}
	public java.lang.String getCust_type() {
		return cust_type;
	}
	public java.lang.String getBusiness_type() {
		return business_type;
	}
	public java.lang.String getCompany_nm() {
		return company_nm;
	}
	public java.lang.String getCompany_title() {
		return company_title;
	}
	public java.lang.String getCompany_employee_num() {
		return company_employee_num;
	}
	public java.lang.String getCust_sex() {
		return cust_sex;
	}
	public java.lang.String getCust_age_group() {
		return cust_age_group;
	}
	public java.lang.String getReceive_email_yn() {
		return receive_email_yn;
	}
	public java.lang.String getReceive_tel_yn() {
		return receive_tel_yn;
	}
	public java.lang.String getReceive_newsletter_yn() {
		return receive_newsletter_yn;
	}
	public java.lang.String getJoin_type() {
		return join_type;
	}
	public java.lang.String getJoin_dt() {
		return join_dt;
	}
	public java.lang.String getWithdrawal_dt() {
		return withdrawal_dt;
	}
	public java.lang.String getWithdrawal_reason() {
		return withdrawal_reason;
	}
	public java.lang.String getWithdrawal_email() {
		return withdrawal_email;
	}
	public java.lang.String getCust_class() {
		return cust_class;
	}
	public java.lang.String getCust_salesman_id() {
		return cust_salesman_id;
	}
	public java.lang.String getTax_exemption_yn() {
		return tax_exemption_yn;
	}
	public java.lang.String getTax_file_seq() {
		return tax_file_seq;
	}
	public java.lang.String getCust_note() {
		return cust_note;
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
	public void setTot_apar_sum(java.lang.String tot_apar_sum) {
		this.tot_apar_sum = tot_apar_sum;
	}		
	public void setSettle_type(java.lang.String settle_type) {
		this.settle_type = settle_type;
	}
	public void setCust_nm(java.lang.String cust_nm) {
		this.cust_nm = cust_nm;
	}
	public void setComp_cd(java.lang.String comp_cd) {
		this.comp_cd = comp_cd;
	}
	public void setCust_id(java.lang.String cust_id) {
		this.cust_id = cust_id;
	}
	public void setFirst_nm(java.lang.String first_nm) {
		this.first_nm = first_nm;
	}
	public void setMiddle_nm(java.lang.String middle_nm) {
		this.middle_nm = middle_nm;
	}
	public void setLast_nm(java.lang.String last_nm) {
		this.last_nm = last_nm;
	}
	public void setCust_pwd(java.lang.String cust_pwd) {
		this.cust_pwd = cust_pwd;
	}
	public void setPwd_question(java.lang.String pwd_question) {
		this.pwd_question = pwd_question;
	}
	public void setPwd_answer(java.lang.String pwd_answer) {
		this.pwd_answer = pwd_answer;
	}
	public void setOriginal_country(java.lang.String original_country) {
		this.original_country = original_country;
	}
	public void setCust_country(java.lang.String cust_country) {
		this.cust_country = cust_country;
	}
	public void setCust_zipcode(java.lang.String cust_zipcode) {
		this.cust_zipcode = cust_zipcode;
	}
	public void setCust_state(java.lang.String cust_state) {
		this.cust_state = cust_state;
	}
	public void setCust_city(java.lang.String cust_city) {
		this.cust_city = cust_city;
	}
	public void setCust_addr1(java.lang.String cust_addr1) {
		this.cust_addr1 = cust_addr1;
	}
	public void setCust_addr2(java.lang.String cust_addr2) {
		this.cust_addr2 = cust_addr2;
	}
	public void setCust_cp(java.lang.String cust_cp) {
		this.cust_cp = cust_cp;
	}
	public void setCust_tel(java.lang.String cust_tel) {
		this.cust_tel = cust_tel;
	}
	public void setExtra_tel(java.lang.String extra_tel) {
		this.extra_tel = extra_tel;
	}
	public void setCust_fax(java.lang.String cust_fax) {
		this.cust_fax = cust_fax;
	}
	public void setCust_web_site(java.lang.String cust_web_site) {
		this.cust_web_site = cust_web_site;
	}
	public void setCust_email(java.lang.String cust_email) {
		this.cust_email = cust_email;
	}
	public void setEmail_special_yn(java.lang.String email_special_yn) {
		this.email_special_yn = email_special_yn;
	}
	public void setEmail_markdown_yn(java.lang.String email_markdown_yn) {
		this.email_markdown_yn = email_markdown_yn;
	}
	public void setEmail_new_arrival_yn(java.lang.String email_new_arrival_yn) {
		this.email_new_arrival_yn = email_new_arrival_yn;
	}
	public void setEmail_manufacturer1(java.lang.String email_manufacturer1) {
		this.email_manufacturer1 = email_manufacturer1;
	}
	public void setEmail_manufacturer2(java.lang.String email_manufacturer2) {
		this.email_manufacturer2 = email_manufacturer2;
	}
	public void setEmail_category1(java.lang.String email_category1) {
		this.email_category1 = email_category1;
	}
	public void setEmail_category2(java.lang.String email_category2) {
		this.email_category2 = email_category2;
	}
	public void setCust_type(java.lang.String cust_type) {
		this.cust_type = cust_type;
	}
	public void setBusiness_type(java.lang.String business_type) {
		this.business_type = business_type;
	}
	public void setCompany_nm(java.lang.String company_nm) {
		this.company_nm = company_nm;
	}
	public void setCompany_title(java.lang.String company_title) {
		this.company_title = company_title;
	}
	public void setCompany_employee_num(java.lang.String company_employee_num) {
		this.company_employee_num = company_employee_num;
	}
	public void setCust_sex(java.lang.String cust_sex) {
		this.cust_sex = cust_sex;
	}
	public void setCust_age_group(java.lang.String cust_age_group) {
		this.cust_age_group = cust_age_group;
	}
	public void setReceive_email_yn(java.lang.String receive_email_yn) {
		this.receive_email_yn = receive_email_yn;
	}
	public void setReceive_tel_yn(java.lang.String receive_tel_yn) {
		this.receive_tel_yn = receive_tel_yn;
	}
	public void setReceive_newsletter_yn(java.lang.String receive_newsletter_yn) {
		this.receive_newsletter_yn = receive_newsletter_yn;
	}
	public void setJoin_type(java.lang.String join_type) {
		this.join_type = join_type;
	}
	public void setJoin_dt(java.lang.String join_dt) {
		this.join_dt = join_dt;
	}
	public void setWithdrawal_dt(java.lang.String withdrawal_dt) {
		this.withdrawal_dt = withdrawal_dt;
	}
	public void setWithdrawal_reason(java.lang.String withdrawal_reason) {
		this.withdrawal_reason = withdrawal_reason;
	}
	public void setWithdrawal_email(java.lang.String withdrawal_email) {
		this.withdrawal_email = withdrawal_email;
	}
	public void setCust_class(java.lang.String cust_class) {
		this.cust_class = cust_class;
	}
	public void setCust_salesman_id(java.lang.String cust_salesman_id) {
		this.cust_salesman_id = cust_salesman_id;
	}
	public void setTax_exemption_yn(java.lang.String tax_exemption_yn) {
		this.tax_exemption_yn = tax_exemption_yn;
	}
	public void setTax_file_seq(java.lang.String tax_file_seq) {
		this.tax_file_seq = tax_file_seq;
	}
	public void setCust_note(java.lang.String cust_note) {
		this.cust_note = cust_note;
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
	public void setCust_salesman_nm(java.lang.String cust_salesman_nm) {
		this.cust_salesman_nm = cust_salesman_nm;
	}
	public java.lang.String getCust_salesman_nm() {
		return cust_salesman_nm;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setTax_filr_url(java.lang.String tax_filr_url) {
		this.tax_filr_url = tax_filr_url;
	}
	public java.lang.String getTax_filr_url() {
		return tax_filr_url;
	}


	public void setCust_barcode(java.lang.String cust_barcode) {
		this.cust_barcode = cust_barcode;
	}


	public java.lang.String getCust_barcode() {
		return cust_barcode;
	}


	public void setComp_nm(java.lang.String comp_nm) {
		this.comp_nm = comp_nm;
	}


	public java.lang.String getComp_nm() {
		return comp_nm;
	}


	public void setStaff_id(java.lang.String staff_id) {
		this.staff_id = staff_id;
	}


	public java.lang.String getStaff_id() {
		return staff_id;
	}


	public void setParent_cd1(java.lang.String parent_cd1) {
		this.parent_cd1 = parent_cd1;
	}


	public java.lang.String getParent_cd1() {
		return parent_cd1;
	}


	public void setParent_cd2(java.lang.String parent_cd2) {
		this.parent_cd2 = parent_cd2;
	}


	public java.lang.String getParent_cd2() {
		return parent_cd2;
	}


	public void setCurrent_hgr_credit_amt(java.lang.String current_hgr_credit_amt) {
		this.current_hgr_credit_amt = current_hgr_credit_amt;
	}


	public java.lang.String getCurrent_hgr_credit_amt() {
		return current_hgr_credit_amt;
	}


	public void setTax_file_nm(java.lang.String tax_file_nm) {
		this.tax_file_nm = tax_file_nm;
	}


	public java.lang.String getTax_file_nm() {
		return tax_file_nm;
	}

	public void setCust_other_region(java.lang.String cust_other_region) {
		this.cust_other_region = cust_other_region;
	}

	public java.lang.String getCust_other_region() {
		return cust_other_region;
	}

	public void setCust_other_city(java.lang.String cust_other_city) {
		this.cust_other_city = cust_other_city;
	}

	public java.lang.String getCust_other_city() {
		return cust_other_city;
	}

	public void setCust_canada_province(java.lang.String cust_canada_province) {
		this.cust_canada_province = cust_canada_province;
	}

	public java.lang.String getCust_canada_province() {
		return cust_canada_province;
	}

}