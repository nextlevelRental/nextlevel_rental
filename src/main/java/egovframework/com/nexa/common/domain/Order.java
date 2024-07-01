package egovframework.com.nexa.common.domain;


/**
 *
 * WARNING: Auto create
 * Template File Version : 1.0
 * Create : Mon Nov 16 19:46:51 KST 2009
 *
 **/
public class Order extends BaseObject {

	private static final long serialVersionUID = -4204958154542248267L;
	// Fields
	private java.lang.String order_num;
	private java.lang.String order_dt;
	private java.lang.String salesman_id;
	private java.lang.String sale_type;
	private java.lang.String cust_id;
	private java.lang.String order_first_nm;
	private java.lang.String order_middle_nm;
	private java.lang.String order_last_nm;
	private java.lang.String order_email;
	private java.lang.String order_tel;
	private java.lang.String order_cp;
	private java.lang.String receive_type;
	private java.lang.String order_note;
	private java.lang.String delivery_type;
	private java.lang.String delivery_nm;
	private java.lang.String payment_type;
	private java.lang.String payment_nm;
	private java.lang.String total_pay_amt;
	private java.lang.String hgr_credit_amt;
	private java.lang.String check_bank;
	private java.lang.String check_num;
	private java.lang.String insert_id;
	private java.util.Date insert_dt;
	private java.lang.String update_id;
	private java.util.Date update_dt;
	
	private java.lang.String order_cancel_yn;
	private java.lang.String order_amt;
	private java.lang.String tax_rate;
	private java.lang.String tax_exemption_yn;
	private java.lang.String pay_dt;
	private java.lang.String return_method;
	private java.lang.String ebay_order_num;
	private java.lang.String ebay_record_num;
	
	public Order(){
		System.out.println("==================================================================");
		System.out.println(System.currentTimeMillis());
		System.out.println(this.toString());
		System.out.println("==================================================================");
	}
	

	// getter Method
	public java.lang.String getSale_type() {
		return sale_type;
	}
	
	public java.lang.String getOrder_cancel_yn() {
		return order_cancel_yn;
	}
	
	public java.lang.String getOrder_amt() {
		return order_amt;
	}
	
	public java.lang.String getOrder_num() {
		return order_num;
	}
	public java.lang.String getOrder_dt() {
		return order_dt;
	}
	public java.lang.String getSalesman_id() {
		return salesman_id;
	}

	public java.lang.String getCust_id() {
		return cust_id;
	}
	public java.lang.String getOrder_first_nm() {
		return order_first_nm;
	}
	public java.lang.String getOrder_middle_nm() {
		return order_middle_nm;
	}
	public java.lang.String getOrder_last_nm() {
		return order_last_nm;
	}
	public java.lang.String getOrder_email() {
		return order_email;
	}
	public java.lang.String getOrder_tel() {
		return order_tel;
	}
	public java.lang.String getOrder_cp() {
		return order_cp;
	}
	public java.lang.String getReceive_type() {
		return receive_type;
	}
	public java.lang.String getOrder_note() {
		return order_note;
	}
	public java.lang.String getDelivery_type() {
		return delivery_type;
	}
	public java.lang.String getPayment_type() {
		return payment_type;
	}
	public java.lang.String getTotal_pay_amt() {
		return total_pay_amt;
	}
	public java.lang.String getHgr_credit_amt() {
		return hgr_credit_amt;
	}
	public java.lang.String getCheck_bank() {
		return check_bank;
	}
	public java.lang.String getCheck_num() {
		return check_num;
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
	public void setSale_type(java.lang.String sale_type) {
		this.sale_type = sale_type;
	}
	public void setOrder_cancel_yn(java.lang.String order_cancel_yn) {
		this.order_cancel_yn = order_cancel_yn;
	}
	public void setOrder_amt(java.lang.String order_amt) {
		this.order_amt = order_amt;
	}	
	public void setOrder_num(java.lang.String order_num) {
		this.order_num = order_num;
	}
	public void setOrder_dt(java.lang.String order_dt) {
		this.order_dt = order_dt;
	}
	public void setSalesman_id(java.lang.String salesman_id) {
		this.salesman_id = salesman_id;
	}

	public void setCust_id(java.lang.String cust_id) {
		this.cust_id = cust_id;
	}
	public void setOrder_first_nm(java.lang.String order_first_nm) {
		this.order_first_nm = order_first_nm;
	}
	public void setOrder_middle_nm(java.lang.String order_middle_nm) {
		this.order_middle_nm = order_middle_nm;
	}
	public void setOrder_last_nm(java.lang.String order_last_nm) {
		this.order_last_nm = order_last_nm;
	}
	public void setOrder_email(java.lang.String order_email) {
		this.order_email = order_email;
	}
	public void setOrder_tel(java.lang.String order_tel) {
		this.order_tel = order_tel;
	}
	public void setOrder_cp(java.lang.String order_cp) {
		this.order_cp = order_cp;
	}
	public void setReceive_type(java.lang.String receive_type) {
		this.receive_type = receive_type;
	}
	public void setOrder_note(java.lang.String order_note) {
		this.order_note = order_note;
	}
	public void setDelivery_type(java.lang.String delivery_type) {
		this.delivery_type = delivery_type;
	}
	public void setPayment_type(java.lang.String payment_type) {
		this.payment_type = payment_type;
	}
	public void setTotal_pay_amt(java.lang.String total_pay_amt) {
		this.total_pay_amt = total_pay_amt;
	}
	public void setHgr_credit_amt(java.lang.String hgr_credit_amt) {
		this.hgr_credit_amt = hgr_credit_amt;
	}
	public void setCheck_bank(java.lang.String check_bank) {
		this.check_bank = check_bank;
	}
	public void setCheck_num(java.lang.String check_num) {
		this.check_num = check_num;
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

	public void setTax_rate(java.lang.String tax_rate) {
		this.tax_rate = tax_rate;
	}

	public java.lang.String getTax_rate() {
		return tax_rate;
	}

	public void setPay_dt(java.lang.String pay_dt) {
		this.pay_dt = pay_dt;
	}

	public java.lang.String getPay_dt() {
		return pay_dt;
	}

	public void setReturn_method(java.lang.String return_method) {
		this.return_method = return_method;
	}

	public java.lang.String getReturn_method() {
		return return_method;
	}

	public void setEbay_order_num(java.lang.String ebay_order_num) {
		this.ebay_order_num = ebay_order_num;
	}

	public java.lang.String getEbay_order_num() {
		return ebay_order_num;
	}

	public void setEbay_record_num(java.lang.String ebay_record_num) {
		this.ebay_record_num = ebay_record_num;
	}

	public java.lang.String getEbay_record_num() {
		return ebay_record_num;
	}

	public java.lang.String getDelivery_nm() {
		return delivery_nm;
	}

	public void setDelivery_nm(java.lang.String delivery_nm) {
		this.delivery_nm = delivery_nm;
	}

	public java.lang.String getPayment_nm() {
		return payment_nm;
	}

	public void setPayment_nm(java.lang.String payment_nm) {
		this.payment_nm = payment_nm;
	}

	public void setTax_exemption_yn(java.lang.String tax_exemption_yn) {
		this.tax_exemption_yn = tax_exemption_yn;
	}

	public java.lang.String getTax_exemption_yn() {
		return tax_exemption_yn;
	}

}