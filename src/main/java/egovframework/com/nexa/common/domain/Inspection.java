package egovframework.com.nexa.common.domain;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

/**
 *
 * WARNING: Auto create
 * Template File Version : 1.0
 * Create : Mon Aug 10 18:47:20 KST 2009
 *
 **/
public class Inspection extends BaseObject {

	private static final long serialVersionUID = -8569474840179699513L;

	// Fields
	private java.lang.String ins_num;
	private java.lang.String new_ins_num;
	private java.lang.String ins_status;
	private java.lang.String ins_status_nm;
	private java.lang.String exception_yn;
	private java.lang.String ins_dt;
	private java.lang.String ins_buyer_id;
	private java.lang.String pay_method;
	private java.lang.String hgr_credit_cust_id;
	private java.lang.String hgr_credit_cust_nm;
	private java.lang.String comp_cd;
	private java.lang.String comp_nm;
	private java.lang.String comp_contact;
	private java.lang.String comp_tel;
	private java.lang.String comp_fax;
	private java.lang.String comp_email;
	private java.lang.String comp_zipcode;
	private java.lang.String comp_state;
	private java.lang.String comp_city;
	private java.lang.String comp_addr1;
	private java.lang.String comp_addr2;
	private java.lang.String expected_input_cost;
	//private java.lang.String expected_input_cost;
	private java.lang.String pricing_package_yn;
	private java.lang.String pricing_package_yn_tran;
	private java.lang.String loading_hgr_yn;
	private java.lang.String box_trailers_num;
	private java.lang.String flatbeds_num;
	private java.lang.String lowboys_num;
	private java.lang.String other_num;
	private java.lang.String tm_id;
	private java.lang.String lead_from_type;
	private java.lang.String ins_note;
	private java.lang.String offer_buyer_only_yn;
	private java.lang.String sms_buyer_only_yn;
	private java.lang.String offer_receiver;
	private java.lang.String offer_attention;
	private java.lang.String offer_content;
	private java.lang.String note_for_buyer;
	private java.lang.String ins_type;
	private java.lang.String pay_interval_day;
	private java.lang.String consign_ratio;
	private java.lang.String pay_zipcode;
	private java.lang.String pay_state;
	private java.lang.String pay_city;
	private java.lang.String pay_addr1;
	private java.lang.String pay_addr2;
	private java.lang.String est_cost_trucking_amt;
	private java.lang.String trucking_payment_type;
	private java.lang.String trucking_ratio_hgr;
	private java.lang.String package_price;
	private java.lang.String insert_id;
	private java.util.Date insert_dt;
	private java.lang.String update_id;
	private java.util.Date update_dt;
	private java.lang.String cogs_ratio;
	private java.lang.String est_prepayment_amt;
	private java.lang.String prepayment_yn;
	private java.lang.String package_premium_amt;
	private java.lang.String comp_canada_province;
	private java.lang.String comp_country;
	private java.lang.String comp_other_city;
	private java.lang.String comp_other_region;
	private java.lang.String pay_canada_province;
	private java.lang.String pay_country;
	private java.lang.String pay_other_city;
	private java.lang.String pay_other_region;
	private java.lang.String pay_comp_nm;
	

	private Map files;
	private List filelist;
	
	//private java.lang.String ins_item_cnt;
	//private java.lang.String bid_sum;
	//private java.lang.String nego_sum;
	
	// inspection item
	private java.lang.String item_num;
	private java.lang.String item_nm;
	private java.lang.String mfg_nm;
	private java.lang.String model_num;
	private java.lang.String serial_num;
	private java.lang.String item_location;
	private java.lang.String item_qty;
	private java.lang.String item_vid;
	private java.lang.String item_capacity;
	private java.lang.String item_note;
	private java.lang.String bid_type;
	private java.lang.String bid_qty;
	private java.lang.String bid_retail_price;
	private java.lang.String bid_price;
	private java.lang.String bid_excclude_yn;
	private java.lang.String nego_type;
	private java.lang.String nego_qty;
	private java.lang.String nego_price;
	private java.lang.String po_num;
	private java.lang.String receive_qty;
	private java.lang.String receive_note;
	
	// item temp variable
	// inspection item
	//private java.lang.String i_item_num;
	private java.lang.String i_item_nm;
	private java.lang.String i_mfg_nm;
	//private java.lang.String i_model_num;
	//private java.lang.String i_serial_num;
	private java.lang.String i_item_location;
	private java.lang.String i_item_qty;
	private java.lang.String i_item_vid;
	private java.lang.String i_item_capacity;
	private java.lang.String i_item_note;
	private java.lang.String i_bid_type;
	//private java.lang.String i_bid_qty;
	//private java.lang.String i_bid_retail_price;
	//private java.lang.String i_bid_price;
	//private java.lang.String i_bid_excclude_yn;
	//private java.lang.String i_nego_type;
	//private java.lang.String i_nego_qty;
	//private java.lang.String i_nego_price;
	//private java.lang.String i_po_num;
	//private java.lang.String i_receive_qty;
	//private java.lang.String i_receive_note;
	
	// negotiation contact data
	private java.util.List<String> nego_seqs;
	private java.util.List<String> nego_dts;
	private java.util.List<String> nego_titles;
	private java.util.List<String> nego_texts;
	private java.util.List<String> alarm_dts;
	private java.util.List<String> alarm_yns;
	private java.lang.String del_nego_seq;
	
	
	private java.lang.String bid_complete_ready_yn;
	private java.lang.String bid_complete_ready_note;
	
	private java.lang.String dead_type;
	private java.lang.String dead_type_nm;
	private java.lang.String dead_note;
	
	private java.lang.String additional_offer_note;
	private java.lang.String po_note;
	
	

	
	public java.lang.String getPo_note() {
		return po_note;
	}
	public void setPo_note(java.lang.String po_note) {
		this.po_note = po_note;
	}
	public java.lang.String getAdditional_offer_note() {
		return additional_offer_note;
	}
	public void setAdditional_offer_note(java.lang.String additional_offer_note) {
		this.additional_offer_note = additional_offer_note;
	}
	public java.lang.String getDead_type_nm() {
		return dead_type_nm;
	}
	public void setDead_type_nm(java.lang.String dead_type_nm) {
		this.dead_type_nm = dead_type_nm;
	}
	public java.lang.String getDead_type() {
		return dead_type;
	}
	public void setDead_type(java.lang.String dead_type) {
		this.dead_type = dead_type;
	}
	public java.lang.String getDead_note() {
		return dead_note;
	}
	public void setDead_note(java.lang.String dead_note) {
		this.dead_note = dead_note;
	}
	
	public java.lang.String getBid_complete_ready_yn() {
		return bid_complete_ready_yn;
	}
	public void setBid_complete_ready_yn(java.lang.String bid_complete_ready_yn) {
		this.bid_complete_ready_yn = bid_complete_ready_yn;
	}
	public java.lang.String getBid_complete_ready_note() {
		return bid_complete_ready_note;
	}
	public void setBid_complete_ready_note(java.lang.String bid_complete_ready_note) {
		this.bid_complete_ready_note = bid_complete_ready_note;
	}

	// getter Method
	public java.lang.String getPay_comp_nm() {
		return pay_comp_nm;
	}

	public java.lang.String getPricing_package_yn_tran() {
		return pricing_package_yn_tran;
	}	
	public java.lang.String getIns_num() {
		return ins_num;
	}
	public java.lang.String getIns_status() {
		return ins_status;
	}
	public java.lang.String getIns_status_nm() {
		return ins_status_nm;
	}
	public java.lang.String getException_yn() {
		return exception_yn;
	}
	public java.lang.String getIns_dt() {
		return ins_dt;
	}
	public java.lang.String getIns_buyer_id() {
		return ins_buyer_id;
	}
	public java.lang.String getPay_method() {
		return pay_method;
	}
	public java.lang.String getHgr_credit_cust_id() {
		return hgr_credit_cust_id;
	}
	public java.lang.String getHgr_credit_cust_nm() {
		return hgr_credit_cust_nm;
	}
	public java.lang.String getComp_cd() {
		return comp_cd;
	}
	public java.lang.String getComp_nm() {
		return comp_nm;
	}
	public void setComp_nm(java.lang.String comp_nm) {
		this.comp_nm = comp_nm;
	}
	public java.lang.String getComp_contact() {
		return comp_contact;
	}
	public java.lang.String getComp_tel() {
		return comp_tel;
	}
	public java.lang.String getComp_fax() {
		return comp_fax;
	}
	public java.lang.String getComp_email() {
		return comp_email;
	}
	public java.lang.String getComp_zipcode() {
		return comp_zipcode;
	}
	public java.lang.String getComp_state() {
		return comp_state;
	}
	public java.lang.String getComp_city() {
		return comp_city;
	}
	public java.lang.String getComp_addr1() {
		return comp_addr1;
	}
	public java.lang.String getComp_addr2() {
		return comp_addr2;
	}
	public java.lang.String getExpected_input_cost() {
		return expected_input_cost;
	}
	public java.lang.String getPricing_package_yn() {
		return pricing_package_yn;
	}
	public java.lang.String getLoading_hgr_yn() {
		return loading_hgr_yn;
	}
	public java.lang.String getBox_trailers_num() {
		return box_trailers_num;
	}
	public java.lang.String getFlatbeds_num() {
		return flatbeds_num;
	}
	public java.lang.String getLowboys_num() {
		return lowboys_num;
	}
	public java.lang.String getOther_num() {
		return other_num;
	}
	public java.lang.String getTm_id() {
		return tm_id;
	}
	public java.lang.String getLead_from_type() {
		return lead_from_type;
	}
	public java.lang.String getOffer_buyer_only_yn() {
		return offer_buyer_only_yn;
	}
	public java.lang.String getSms_buyer_only_yn() {
		return sms_buyer_only_yn;
	}
	public java.lang.String getOffer_receiver() {
		return offer_receiver;
	}
	public java.lang.String getOffer_attention() {
		return offer_attention;
	}
	public java.lang.String getOffer_content() {
		return offer_content;
	}
	public java.lang.String getNote_for_buyer() {
		return note_for_buyer;
	}
	public java.lang.String getIns_type() {
		return ins_type;
	}
	public java.lang.String getPay_interval_day() {
		return pay_interval_day;
	}
	public java.lang.String getConsign_ratio() {
		return consign_ratio;
	}
	public java.lang.String getPay_zipcode() {
		return pay_zipcode;
	}
	public java.lang.String getPay_state() {
		return pay_state;
	}
	public java.lang.String getPay_city() {
		return pay_city;
	}
	public java.lang.String getPay_addr1() {
		return pay_addr1;
	}
	public java.lang.String getPay_addr2() {
		return pay_addr2;
	}
	public java.lang.String getEst_cost_trucking_amt() {
		return est_cost_trucking_amt;
	}
	public java.lang.String getTrucking_payment_type() {
		return trucking_payment_type;
	}
	public java.lang.String getTrucking_ratio_hgr() {
		return trucking_ratio_hgr;
	}	
	public java.lang.String getPackage_price() {
		return package_price;
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
	// inspecton item getter Method
	public java.lang.String getItem_num() {
		return item_num;
	}
	public java.lang.String getItem_nm() {
		return item_nm;
	}
	public java.lang.String getMfg_nm() {
		return mfg_nm;
	}
	public java.lang.String getModel_num() {
		return model_num;
	}
	public java.lang.String getSerial_num() {
		return serial_num;
	}
	public java.lang.String getItem_location() {
		return item_location;
	}
	public java.lang.String getItem_qty() {
		return item_qty;
	}
	public java.lang.String getItem_vid() {
		return item_vid;
	}
	public java.lang.String getItem_capacity() {
		return item_capacity;
	}
	public java.lang.String getItem_note() {
		return item_note;
	}
	public java.lang.String getBid_type() {
		return bid_type;
	}
	public java.lang.String getBid_qty() {
		return bid_qty;
	}
	public java.lang.String getBid_retail_price() {
		return bid_retail_price;
	}
	public java.lang.String getBid_price() {
		return bid_price;
	}
	public java.lang.String getBid_excclude_yn() {
		return bid_excclude_yn;
	}
	public java.lang.String getNego_type() {
		return nego_type;
	}
	public java.lang.String getNego_qty() {
		return nego_qty;
	}
	public java.lang.String getNego_price() {
		return nego_price;
	}
	public java.lang.String getPo_num() {
		return po_num;
	}
	public java.lang.String getReceive_qty() {
		return receive_qty;
	}
	public java.lang.String getReceive_note() {
		return receive_note;
	}

	// setter Method
	public void setPay_comp_nm(java.lang.String pay_comp_nm) {
		this.pay_comp_nm = pay_comp_nm;
	}		
	public void setPricing_package_yn_tran(java.lang.String pricing_package_yn_tran) {
		this.pricing_package_yn_tran = pricing_package_yn_tran;
	}	
	public void setIns_num(java.lang.String ins_num) {
		this.ins_num = ins_num;
	}
	public void setIns_status(java.lang.String ins_status) {
		this.ins_status = ins_status;
	}
	public void setIns_status_nm(java.lang.String ins_status_nm) {
		this.ins_status_nm = ins_status_nm;
	}
	public void setException_yn(java.lang.String exception_yn) {
		this.exception_yn = exception_yn;
	}
	public void setIns_dt(java.lang.String ins_dt) {
		this.ins_dt = ins_dt;
	}
	public void setIns_buyer_id(java.lang.String ins_buyer_id) {
		this.ins_buyer_id = ins_buyer_id;
	}
	public void setPay_method(java.lang.String pay_method) {
		this.pay_method = pay_method;
	}
	public void setHgr_credit_cust_id(java.lang.String hgr_credit_cust_id) {
		this.hgr_credit_cust_id = hgr_credit_cust_id;
	}
	public void setHgr_credit_cust_nm(java.lang.String hgr_credit_cust_nm) {
		this.hgr_credit_cust_nm = hgr_credit_cust_nm;
	}
	public void setComp_cd(java.lang.String comp_cd) {
		this.comp_cd = comp_cd;
	}
	public void setComp_contact(java.lang.String comp_contact) {
		this.comp_contact = comp_contact;
	}
	public void setComp_tel(java.lang.String comp_tel) {
		this.comp_tel = comp_tel;
	}
	public void setComp_fax(java.lang.String comp_fax) {
		this.comp_fax = comp_fax;
	}
	public void setComp_email(java.lang.String comp_email) {
		this.comp_email = comp_email;
	}
	public void setComp_zipcode(java.lang.String comp_zipcode) {
		this.comp_zipcode = comp_zipcode;
	}
	public void setComp_state(java.lang.String comp_state) {
		this.comp_state = comp_state;
	}
	public void setComp_city(java.lang.String comp_city) {
		this.comp_city = comp_city;
	}
	public void setComp_addr1(java.lang.String comp_addr1) {
		this.comp_addr1 = comp_addr1;
	}
	public void setComp_addr2(java.lang.String comp_addr2) {
		this.comp_addr2 = comp_addr2;
	}
	public void setExpected_input_cost(java.lang.String expected_input_cost) {
		this.expected_input_cost = expected_input_cost;
	}
	public void setPricing_package_yn(java.lang.String pricing_package_yn) {
		this.pricing_package_yn = pricing_package_yn;
	}
	public void setLoading_hgr_yn(java.lang.String loading_hgr_yn) {
		this.loading_hgr_yn = loading_hgr_yn;
	}
	public void setBox_trailers_num(java.lang.String box_trailers_num) {
		this.box_trailers_num = box_trailers_num;
	}
	public void setFlatbeds_num(java.lang.String flatbeds_num) {
		this.flatbeds_num = flatbeds_num;
	}
	public void setLowboys_num(java.lang.String lowboys_num) {
		this.lowboys_num = lowboys_num;
	}
	public void setOther_num(java.lang.String other_num) {
		this.other_num = other_num;
	}
	public void setTm_id(java.lang.String tm_id) {
		this.tm_id = tm_id;
	}
	public void setLead_from_type(java.lang.String lead_from_type) {
		this.lead_from_type = lead_from_type;
	}
	public void setOffer_buyer_only_yn(java.lang.String offer_buyer_only_yn) {
		this.offer_buyer_only_yn = offer_buyer_only_yn;
	}
	public void setSms_buyer_only_yn(java.lang.String sms_buyer_only_yn) {
		this.sms_buyer_only_yn = sms_buyer_only_yn;
	}
	public void setOffer_receiver(java.lang.String offer_receiver) {
		this.offer_receiver = offer_receiver;
	}
	public void setOffer_attention(java.lang.String offer_attention) {
		this.offer_attention = offer_attention;
	}
	public void setOffer_content(java.lang.String offer_content) {
		this.offer_content = offer_content;
	}
	public void setNote_for_buyer(java.lang.String note_for_buyer) {
		this.note_for_buyer = note_for_buyer;
	}
	public void setIns_type(java.lang.String ins_type) {
		this.ins_type = ins_type;
	}
	public void setPay_interval_day(java.lang.String pay_interval_day) {
		this.pay_interval_day = pay_interval_day;
	}
	public void setConsign_ratio(java.lang.String consign_ratio) {
		this.consign_ratio = consign_ratio;
	}
	public void setPay_zipcode(java.lang.String pay_zipcode) {
		this.pay_zipcode = pay_zipcode;
	}
	public void setPay_state(java.lang.String pay_state) {
		this.pay_state = pay_state;
	}
	public void setPay_city(java.lang.String pay_city) {
		this.pay_city = pay_city;
	}
	public void setPay_addr1(java.lang.String pay_addr1) {
		this.pay_addr1 = pay_addr1;
	}
	public void setPay_addr2(java.lang.String pay_addr2) {
		this.pay_addr2 = pay_addr2;
	}
	public void setEst_cost_trucking_amt(java.lang.String est_cost_trucking_amt) {
		this.est_cost_trucking_amt = est_cost_trucking_amt;
	}
	public void setTrucking_payment_type(java.lang.String trucking_payment_type) {
		this.trucking_payment_type = trucking_payment_type;
	}
	public void setTrucking_ratio_hgr(java.lang.String trucking_ratio_hgr) {
		this.trucking_ratio_hgr = trucking_ratio_hgr;
	}
	public void setPackage_price(java.lang.String package_price) {
		this.package_price = package_price;
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
	public java.lang.String getCogs_ratio() {
		return cogs_ratio;
	}
	public void setCogs_ratio(java.lang.String cogs_ratio) {
		this.cogs_ratio = cogs_ratio;
	}
	public java.lang.String getEst_prepayment_amt() {
		return est_prepayment_amt;
	}
	public void setEst_prepayment_amt(java.lang.String est_prepayment_amt) {
		this.est_prepayment_amt = est_prepayment_amt;
	}
	public java.lang.String getPrepayment_yn() {
		return prepayment_yn;
	}
	public void setPrepayment_yn(java.lang.String prepayment_yn) {
		this.prepayment_yn = prepayment_yn;
	}	
	
	
	
	// inspection item setter Method
	public void setItem_num(java.lang.String item_num) {
		this.item_num = item_num;
	}
	public void setItem_nm(java.lang.String item_nm) {
		this.item_nm = item_nm;
	}
	public void setMfg_nm(java.lang.String mfg_nm) {
		this.mfg_nm = mfg_nm;
	}
	public void setModel_num(java.lang.String model_num) {
		this.model_num = model_num;
	}
	public void setSerial_num(java.lang.String serial_num) {
		this.serial_num = serial_num;
	}
	public void setItem_location(java.lang.String item_location) {
		this.item_location = item_location;
	}
	public void setItem_qty(java.lang.String item_qty) {
		this.item_qty = item_qty;
	}
	public void setItem_vid(java.lang.String item_vid) {
		this.item_vid = item_vid;
	}
	public void setItem_capacity(java.lang.String item_capacity) {
		this.item_capacity = item_capacity;
	}
	public void setItem_note(java.lang.String item_note) {
		this.item_note = item_note;
	}
	public void setBid_type(java.lang.String bid_type) {
		this.bid_type = bid_type;
	}
	public void setBid_qty(java.lang.String bid_qty) {
		this.bid_qty = bid_qty;
	}
	public void setBid_retail_price(java.lang.String bid_retail_price) {
		this.bid_retail_price = bid_retail_price;
	}
	public void setBid_price(java.lang.String bid_price) {
		this.bid_price = bid_price;
	}
	public void setBid_excclude_yn(java.lang.String bid_excclude_yn) {
		this.bid_excclude_yn = bid_excclude_yn;
	}
	public void setNego_type(java.lang.String nego_type) {
		this.nego_type = nego_type;
	}
	public void setNego_qty(java.lang.String nego_qty) {
		this.nego_qty = nego_qty;
	}
	public void setNego_price(java.lang.String nego_price) {
		this.nego_price = nego_price;
	}
	public void setPo_num(java.lang.String po_num) {
		this.po_num = po_num;
	}
	public void setReceive_qty(java.lang.String receive_qty) {
		this.receive_qty = receive_qty;
	}
	public void setReceive_note(java.lang.String receive_note) {
		this.receive_note = receive_note;
	}
	
	// item temp setter and getter
	/*
	public java.lang.String getI_item_num() {
		return i_item_num;
	}
	public void setI_item_num(java.lang.String i_item_num) {
		this.i_item_num = i_item_num;
	}
	*/
	
	public java.lang.String getI_item_nm() {
		return i_item_nm;
	}
	public void setI_item_nm(java.lang.String i_item_nm) {
		this.i_item_nm = i_item_nm;
	}
	
	public java.lang.String getI_mfg_nm() {
		return i_mfg_nm;
	}
	public void setI_mfg_nm(java.lang.String i_mfg_nm) {
		this.i_mfg_nm = i_mfg_nm;
	}
	
	public java.lang.String getI_item_location() {
		return i_item_location;
	}
	public void setI_item_location(java.lang.String i_item_location) {
		this.i_item_location = i_item_location;
	}
	
	public java.lang.String getI_item_qty() {
		return i_item_qty;
	}
	public void setI_item_qty(java.lang.String i_item_qty) {
		this.i_item_qty = i_item_qty;
	}
	
	public java.lang.String getI_item_vid() {
		return i_item_vid;
	}
	public void setI_item_vid(java.lang.String i_item_vid) {
		this.i_item_vid = i_item_vid;
	}
	
	public java.lang.String getI_item_capacity() {
		return i_item_capacity;
	}
	public void setI_item_capacity(java.lang.String i_item_capacity) {
		this.i_item_capacity = i_item_capacity;
	}
	
	public java.lang.String getI_item_note() {
		return i_item_note;
	}
	public void setI_item_note(java.lang.String i_item_note) {
		this.i_item_note = i_item_note;
	}
	
	public java.lang.String getI_bid_type() {
		return i_bid_type;
	}
	public void setI_bid_type(java.lang.String i_bid_type) {
		this.i_bid_type = i_bid_type;
	}
	
	// negotiation contact data
	public java.util.List<String> getNego_seqs() {
		return nego_seqs;
	}
	public void setNego_seqs(java.util.List<String> nego_seqs) {
		this.nego_seqs = nego_seqs;
	}
	public java.util.List<String> getNego_dts() {
		return nego_dts;
	}
	public void setNego_dts(java.util.List<String> nego_dts) {
		this.nego_dts = nego_dts;
	}
	public java.util.List<String> getNego_titles() {
		return nego_titles;
	}
	public void setNego_titles(java.util.List<String> nego_titles) {
		this.nego_titles = nego_titles;
	}
	public java.util.List<String> getNego_texts() {
		return nego_texts;
	}
	public void setNego_texts(java.util.List<String> nego_texts) {
		this.nego_texts = nego_texts;
	}
	public java.util.List<String> getAlarm_dts() {
		return alarm_dts;
	}
	public void setAlarm_dts(java.util.List<String> alarm_dts) {
		this.alarm_dts = alarm_dts;
	}
	public java.util.List<String> getAlarm_yns() {
		return alarm_yns;
	}
	public void setAlarm_yns(java.util.List<String> alarm_yns) {
		this.alarm_yns = alarm_yns;
	}
	public java.lang.String getDel_nego_seq() {
		return del_nego_seq;
	}
	public void setDel_nego_seq(java.lang.String del_nego_seq) {
		this.del_nego_seq = del_nego_seq;
	}
	public java.lang.String getNew_ins_num() {
		return new_ins_num;
	}
	public void setNew_ins_num(java.lang.String new_ins_num) {
		this.new_ins_num = new_ins_num;
	}
	public void setIns_note(java.lang.String ins_note) {
		this.ins_note = ins_note;
	}
	public java.lang.String getIns_note() {
		return ins_note;
	}
	public java.lang.String getPackage_premium_amt() {
		return package_premium_amt;
	}
	public void setPackage_premium_amt(java.lang.String package_premium_amt) {
		this.package_premium_amt = package_premium_amt;
	}
	public Map getFiles() {
		return files;
	}
	public List getFilelist() {
		return filelist;
	}
	public String getFilelist(int index) {
		return (String)filelist.get(index);
	}
	public MultipartFile getFiles(String index) {
		return (MultipartFile)files.get(index);
	}
	public void setFiles(Map files) {
		this.files = files;
	}
	public void setFilelist(List filelist) {
		this.filelist = filelist;
	}
	public void setComp_canada_province(java.lang.String comp_canada_province) {
		this.comp_canada_province = comp_canada_province;
	}
	public java.lang.String getComp_canada_province() {
		return comp_canada_province;
	}
	public void setComp_country(java.lang.String comp_country) {
		this.comp_country = comp_country;
	}
	public java.lang.String getComp_country() {
		return comp_country;
	}
	public void setComp_other_city(java.lang.String comp_other_city) {
		this.comp_other_city = comp_other_city;
	}
	public java.lang.String getComp_other_city() {
		return comp_other_city;
	}
	public void setPay_canada_province(java.lang.String pay_canada_province) {
		this.pay_canada_province = pay_canada_province;
	}
	public java.lang.String getPay_canada_province() {
		return pay_canada_province;
	}
	public void setPay_country(java.lang.String pay_country) {
		this.pay_country = pay_country;
	}
	public java.lang.String getPay_country() {
		return pay_country;
	}
	public void setPay_other_city(java.lang.String pay_other_city) {
		this.pay_other_city = pay_other_city;
	}
	public java.lang.String getPay_other_city() {
		return pay_other_city;
	}
	public void setComp_other_region(java.lang.String comp_other_region) {
		this.comp_other_region = comp_other_region;
	}
	public java.lang.String getComp_other_region() {
		return comp_other_region;
	}
	public void setPay_other_region(java.lang.String pay_other_region) {
		this.pay_other_region = pay_other_region;
	}
	public java.lang.String getPay_other_region() {
		return pay_other_region;
	}
	
}