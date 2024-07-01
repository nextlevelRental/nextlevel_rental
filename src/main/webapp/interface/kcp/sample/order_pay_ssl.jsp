<%@ page language="java" contentType="text/html;charset=euc-kr"%>
<%
/* ============================================================================== */
/* =	PAGE : �Ϲݰ��� ���� ó�� PAGE												= */
/* = -------------------------------------------------------------------------- = */
/* =	������ ������ �߻��ϴ� ��� �Ʒ��� �ּҷ� �����ϼż� Ȯ���Ͻñ� �ٶ��ϴ�.						= */
/* =	���� �ּ� : http://kcp.co.kr/technique.requestcode.do						= */
/* = -------------------------------------------------------------------------- = */
/* =	Copyright (c)  2016  NHN KCP Inc.   All Rights Reserverd.				= */
/* ============================================================================== */

/* ============================================================================== */
/* =	ȯ�� ���� ���� Include														= */
/* = -------------------------------------------------------------------------- = */
/* =	�� ���� ��																	= */
/* =	�׽�Ʈ �� �ǰ��� ������ site_conf_inc.jsp������ �����Ͻñ� �ٶ��ϴ�.					= */
/* = -------------------------------------------------------------------------- = */
%>
<%@ page import="java.util.Calendar"%>
<%@ include file = "./../cfg/site_conf_inc.jsp"%>
<%
/* = -------------------------------------------------------------------------- = */
/* = 	ȯ�� ���� ���� Include End													= */
/* ============================================================================== */
%>
<%!
/* ============================================================================== */
/* =   Null ó�� Method															= */
/* = -------------------------------------------------------------------------- = */
public String f_get_parm(String val) {
	if(val == null) val = "";
	
	return val;
}
/* ============================================================================== */
%>
<%
request.setCharacterEncoding("euc-kr");
/* ============================================================================== */
/* =	01. ���� ��û ���� ����														= */
/* = -------------------------------------------------------------------------- = */
String pay_method = f_get_parm(request.getParameter("pay_method_cd"));	/* ���� ���			*/
String ordr_idxx  = f_get_parm(request.getParameter("ord_no"));			/* �ֹ� ��ȣ			*/
String good_name  = f_get_parm(request.getParameter("good_name"));		/* ��ǰ ����			*/
String good_mny	  = f_get_parm(request.getParameter("good_mny" ));		/* ���� �ݾ�			*/
String buyr_name  = f_get_parm(request.getParameter("buyr_name"));		/* �ֹ��� �̸�			*/
String buyr_mail  = f_get_parm(request.getParameter("buyr_mail"));		/* �ֹ��� E-Mail		*/
String buyr_tel1  = f_get_parm(request.getParameter("buyr_tel1"));		/* �ֹ��� ��ȭ��ȣ		*/
String buyr_tel2  = f_get_parm(request.getParameter("buyr_tel2"));		/* �ֹ��� �޴�����ȣ		*/
String req_t	  = f_get_parm(request.getParameter("req_tx"));			/* ��û ����			*/
String currency	  = f_get_parm(request.getParameter("currency"));		/* ȭ����� (WON/USD)	*/
String quotaopt	  = f_get_parm(request.getParameter("quotaopt"));		/* �Һΰ����� �ɼ�		*/
String cardNo	  = f_get_parm(request.getParameter("card_no"));		/* ī���ȣ			*/
String expiryYy	  = f_get_parm(request.getParameter("expiry_yy"));		/* ��ȿ�Ⱓ(��)		*/
String expiryMm	  = f_get_parm(request.getParameter("expiry_mm"));		/* ��ȿ�Ⱓ(��)		*/
String cardauth	  = f_get_parm(request.getParameter("cardauth"));		/* ��������			*/
String cardpwd	  = f_get_parm(request.getParameter("cardpwd"));		/* ��й�ȣ			*/
/* ============================================================================== */

/* ============================================================================== */
/* =   02. HTML ������ ���� ó��														= */
/* = -------------------------------------------------------------------------- = */
StringBuffer quota_list		   = new StringBuffer();	/* �Һ� ���� ����Ʈ ǥ��		*/
StringBuffer expire_year_list  = new StringBuffer();	/* ��ȿ�Ⱓ(��) ����Ʈ ǥ��	*/
StringBuffer expire_month_list = new StringBuffer();	/* ��ȿ�Ⱓ(��) ����Ʈ ǥ��	*/
String quota = "00";

quota_list.append("<select name=\"quota\" class=\"frmselect\" disabled>");
quota_list.append("<option value=\"00\" selected>�Ͻú�</option>");

/* �Һΰ��� ����Ʈ ǥ�� */
if(Integer.parseInt(good_mny) >= 50000) {
	if(quotaopt.equals("")) {
		quotaopt = "0";
	}
	
	for(int index = 2; index <= Integer.parseInt(quotaopt); index++) {
		if(index < 10) {
			if(index == Integer.parseInt(quotaopt)) {
				quota_list.append("<option value=\"0" + index + "\" selected>" + index + "����</option>");
				quota = "0" + String.valueOf(index);
			} else {
				quota_list.append("<option value=\"0" + index + "\">" + index + "����</option>");
			}
		} else {
			if(index == Integer.parseInt(quotaopt)) {
				quota_list.append("<option value=\""  + index + "\" selected>" + index + "����</option>");
				quota = String.valueOf(index);
			} else {
				quota_list.append("<option value=\""  + index + "\">" + index + "����</option>");
			}
		}
	}
}

quota_list.append("</select>");

/* ��ȿ�Ⱓ(��) ����Ʈ ǥ�� */
Calendar cal = Calendar.getInstance();

int	   nYear = cal.get(Calendar.YEAR);
String sYear = String.valueOf(nYear).substring(2, 4);

final int CURR_YEAR	= Integer.parseInt(sYear);
final int MAX_YEAR	= CURR_YEAR + 5;

expire_year_list.append("<select name=\"expiry_yy\" class=\"frmselect\" disabled>\n")
				.append("<option value=\"xx\">����</option>\n");

for(int index = CURR_YEAR; index <= MAX_YEAR; index++) {
	if(index < 10) {
		if(index == Integer.parseInt(expiryYy)) {
			expire_year_list.append("<option value=\"0"	+ index + "\"selected>0" + index + "</option>\n");
			expiryYy = "0" + String.valueOf(index);
		} else {
			expire_year_list.append("<option value=\"0"	+ index + "\">0" + index + "</option>\n");
		}
		
	} else {
		if(index == Integer.parseInt(expiryYy)) {
			expire_year_list.append("<option value=\""	+ index + "\"selected>"  + index + "</option>\n");
			expiryYy = String.valueOf(index);
		} else {
			expire_year_list.append("<option value=\""	+ index + "\">"  + index + "</option>\n");
		}
	}
}

expire_year_list.append("</select>");

/* ��ȿ�Ⱓ(��) ����Ʈ ǥ�� */
expire_month_list.append("<select name=\"expiry_mm\"  class=\"frmselect\" disabled>\n")
				 .append("<option value=\"xx\">����</option>\n");

for(int index = 1; index < 13; index++) {
	if(index < 10) {
		if(index == Integer.parseInt(expiryMm)) {
			expire_month_list.append("<option value=\"0" + index + "\" selected>0" + index + "</option>\n");
			expiryMm = "0" + String.valueOf(index);
		} else {
			expire_month_list.append("<option value=\"0" + index + "\">0" + index + "</option>\n");
		}
	} else {
		if(index == Integer.parseInt(expiryMm)) {
			expire_month_list.append("<option value=\""	 + index + "\"selected>"  + index + "</option>\n");
			expiryMm = String.valueOf(index);
		} else {
			expire_month_list.append("<option value=\""	 + index + "\">"  + index + "</option>\n");
		}
	}
}

expire_month_list.append("</select>\n");
/* ============================================================================== */

/* ============================================================================== */
/* =   03. �Ϲ� KEY-IN ���� ������ ����												= */
/* ============================================================================== */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
	<title>*** NHN KCP Online Payment System Ver 7.0[HUB Version] ***</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
	<link href="css/style.css" rel="stylesheet" type="text/css" id="cssLink"/>
	<script type="text/javascript" src="<%= g_conf_js_url %>"></script>
	<script type="text/javascript">
	
	function jsf__show_progress(show) {
		if ( show == true ) {
			window.show_pay_btn.style.display  = "none";
			window.show_progress.style.display = "inline";
		} else {
			window.show_pay_btn.style.display  = "inline";
			window.show_progress.style.display = "none";
		}
	}
	
	function jsf__chk_ssl_card(form) {
		cardno	  = form.card_no.value;
		cardnolen = form.card_no.value.length;
		
		if(cardnolen < 13 || cardnolen > 16) {
			alert("ī���ȣ�� ���̴� �ּ� 13�ڸ����� �ִ� 16�ڸ��Դϴ�.");
			form.card_no.focus();
			form.card_no.select();
			return false;
		}
		
		for(var inx = 0; inx < cardnolen; inx++) {
			if(cardno.charAt(inx) > "9" || cardno.charAt(inx) < "0") {
				alert("ī���ȣ�� \'-\' ���� ���ڸ� �Է��Ͽ� �ֽʽÿ�.");
				form.card_no.focus();
				form.card_no.select();
				return false;
			}
		}
	}
	
	function jsf__pay_card(form) {
		var return_Val = false;
		
		jsf__show_progress(true);
		
		if(jsf__chk_ssl_card(form) == false) {
			jsf__show_progress(false);
			return false;
		}
		
// 		if(form.cardtype.value == "3") {
// 			form.cardauth.value = form.cardauth2.value;
// 		} else if(form.cardtype.value == "4") {
// 			form.quota.value	= "00";
// 			form.cardauth.value	= "";
// 			form.cardpwd.value	= "";
// 		}
		
		return_Val = true;
		
		//return return_Val;
		
		var frm=document.order_info;
		frm.action="pp_cli_hub.jsp";
		frm.submit();
	}
	</script>
</head>
<body>
	<div id="sample_wrap">
<!-- 		<form name="order_info" action="pp_cli_hub.jsp" method="post"> -->
		<form name="order_info" method="post">
			<!-- ��� ���� -->
			<h1>[������û] <span> <%= g_ord_title %></span></h1>
			<!-- ��� ���� End -->
			<div class="sample">
				<p>�� �������� �ؼ�Ÿ�̾� ��Ż ���� ������ ��û�ϴ� �������Դϴ�.</p>
				<!-- ���� ���� ��� ���̺� Start -->
				<h2>&sdot; ���� ����</h2>
				<%
				/* ============================================================================== */
				/* =	1-1. ���� ���� ���� ����														= */
				/* = -------------------------------------------------------------------------- = */
				/* =	������ �ʿ��� ���� ���� ������ �����մϴ�.											= */
				/* =																			= */
				/* =	�ſ�ī��	: 100000000000, ������ü	: 010000000000, �������	: 001000000000	= */
				/* =	����Ʈ	: 000100000000, �޴���	: 000010000000, ��ǰ��	: 000000001000	= */
				/* =	ARS		: 000000000010													= */
				/* =																			= */
				/* =	���� ���� ������ ��� PayPlus Plugin���� ������ ���������� ǥ�õ˴ϴ�.					= */
				/* =	Payplug Plugin���� ���� ���������� ǥ���ϰ� ������ ��� �����Ͻ÷��� ����					= */
				/* =	���ܿ� �ش��ϴ� ��ġ�� �ش��ϴ� ���� 1�� �����Ͽ� �ֽʽÿ�.								= */
				/* =																			= */
				/* =	��) �ſ�ī��, ������ü, ������¸� ���ÿ� ǥ���ϰ��� �ϴ� ���							= */
				/* =	pay_method = "111000000000"												= */
				/* =	�ſ�ī��(100000000000), ������ü(010000000000), �������(001000000000)�� 		= */
				/* =	�ش��ϴ� ���� ��� �����ָ� �˴ϴ�.												= */
				/* =																			= */
				/* =	�� �ʼ�																	= */
				/* =	KCP�� ��û�� �����������θ� ������ �����մϴ�.										= */
				/* = -------------------------------------------------------------------------- = */
				%>
				<input type="hidden" name="pay_method"					 value="<%= request.getParameter("pay_method_cd") %>"/>		<!-- ���ҹ���ڵ�		-->
				<input type="hidden" name="pay_method_name"	class="w100" value="<%= request.getParameter("pay_method_name") %>"/>	<!-- ���ҹ����		-->
				<input type="hidden" name="ordr_idxx"		class="w200" value="<%= ordr_idxx %>"/>									<!-- �ֹ���ȣ			-->
				<input type="hidden" name="good_name"		class="w100" value="<%= good_name %>"/>									<!-- ��ǰ��			-->
				<input type="hidden" name="good_mny"		class="w100" value="<%= good_mny  %>"/>									<!-- ���� �ݾ�			-->
				<input type="hidden" name="buyr_name"		class="w100" value="<%= buyr_name %>"/>									<!-- �ֹ��ڸ�			-->
				<input type="hidden" name="buyr_mail"		class="w200" value="<%= buyr_mail %>"/>									<!-- �ֹ��� E-Mail		-->
				<input type="hidden" name="buyr_tel1"		class="w100" value="<%= buyr_tel1 %>"/>									<!-- �ֹ��� ��ȭ��ȣ		-->
				<input type="hidden" name="buyr_tel2"		class="w100" value="<%= buyr_tel2 %>"/>									<!-- �ֹ��� �޴�����ȣ	-->
				<input type="hidden" name="quota"			class="w100" value="<%= quota	  %>"/>									<!-- �Һΰ���			-->
				<input type="hidden" name="expiry_yy"		class="w100" value="<%= expiryYy  %>"/>									<!-- ��ȿ�Ⱓ(��)		-->
				<input type="hidden" name="expiry_mm"		class="w100" value="<%= expiryMm  %>"/>									<!-- ��ȿ�Ⱓ(��)		-->
				<table class="tbl" cellpadding="0" cellspacing="0">
					<!-- ��û ��� : �ſ�ī�� �Ϲ� -->
					<tr>
						<th>���� ���</th>
						<td><%= request.getParameter("pay_method_name") %></td>
					</tr>
					<!-- ���� �ݾ� -->
					<tr>
						<th>���� �ݾ�</th>
						<td><%= good_mny %>��</td>
					</tr>
					<!-- ī�� ��ȣ -->
					<tr>
						<th>ī�� ��ȣ</th>
						<td><input type="text" name="card_no" value="<%= request.getParameter("card_no") %>" size="20" maxlength="16" class="frminput" readonly/>('-' ���� ���ڸ�, 14 ~ 16�ڸ�)</td>
					</tr>
					<!-- �Һ� ���� -->
					<tr id="show_quota">
						<th>�Һ� ����</th>
						<td><%= quota_list.toString() %></td>
					</tr>
					<!-- ��ȿ �Ⱓ -->
					<tr>
						<th>��ȿ �Ⱓ</th>
						<td><%= expire_year_list.toString() %>�� <%= expire_month_list.toString() %>��</td>
					</tr>
					<!-- ���� ���� -->
					<tr>
						<th>���� ����</th>
						<td><input type="password" name="cardauth" value="<%= request.getParameter("cardauth") %>" size="14" maxlength="10" class="frminput" readonly/>(�ֹι�ȣ �� 6�ڸ�, ����ڹ�ȣ 10�ڸ�)</td>
					</tr>
					<!-- ��й�ȣ -->
					<tr>
						<th>��� ��ȣ</th>
						<td><input type="password" name="cardpwd" value="<%= request.getParameter("cardpwd") %>" size="3" maxlength="2" class="frminput" readonly/>(ī���й�ȣ ��2�ڸ�)</td>
					</tr>
				</table>
				<!-- ���� ���� ��� ���̺� End -->
				<!-- ���� ��ư ���̺� Start -->
				<div class="btnset" id="show_pay_btn" style="display:block">
					<!-- ���� ��û/ó������ ��ư -->
					<input name="" type="submit" class="submit" value="������û" onclick="return jsf__pay_card(this.form);"/>
					<a href="#" class="home" onclick="javascript:window.close()">ó������</a>
				</div>
				<div id="show_progress" style="display:none">
					<!-- ���� ���� ���Դϴ�. �޽��� -->
					<td colspan="2" class="center red" >���� ���� ���Դϴ�. ��ø� ��ٷ� �ֽʽÿ�...</td>
				</div>
				<!-- ���� ��ư ���̺� End -->
			</div>
			<div class="footer">
				Copyright (c) NHN KCP INC. All Rights reserved.
			</div>
			<!-- KCP ���� ���� -->
			<input type="hidden" name="card_pay_method" value="SSL"/>
			<%
			/* = -------------------------------------------------------------------------- = */
			/* =	1. �ֹ� ���� �Է� END														= */
			/* ============================================================================== */
			%>
			<%
			/* ============================================================================== */
			/* =	2. ������ �ʼ� ���� ����														= */
			/* = -------------------------------------------------------------------------- = */
			/* =	�� �ʼ� - ������ �ݵ�� �ʿ��� �����Դϴ�.											= */
			/* =	site_conf_inc.jsp ������ �����ϼż� �����Ͻñ� �ٶ��ϴ�.							= */
			/* = -------------------------------------------------------------------------- = */
			/* ��û���� : ����(pay) / ���, ����(mod) ��û�� ��� */
			%>
			<input type="hidden" name="req_tx"	  value="pay" />
			<input type="hidden" name="site_cd"	  value="<%= g_conf_site_cd %>" />
			<input type="hidden" name="site_name" value="<%= g_conf_site_name %>" />
			<%
			/* = -------------------------------------------------------------------------- = */
			/* =	�Һοɼ� : Payplus Plug-in���� ī������� �ִ�� ǥ���� �Һΰ��� ���� �����մϴ�.			= */
			/* =			(0 ~ 18 ���� ���� ����)												= */
			/* =	�� ���� - �Һ� ������ �����ݾ��� 50,000�� �̻��� ��쿡�� ����							= */
			/* =		   50,000�� �̸��� �ݾ��� �Ͻúҷθ� ǥ��˴ϴ�	.								= */
			/* =	��) value ���� "5" �� �������� ��� => ī������� ����â�� �ϽúҺ��� 5�������� ���ð���		= */
			/* = -------------------------------------------------------------------------- = */
			%>
			<input type="hidden" name="quotaopt" value="<%= quotaopt %>"/>
			<input type="hidden" name="currency" value="WON"/> <!-- �ʼ� �׸� : ���� �ݾ�/ȭ����� -->
			<%
			/* = -------------------------------------------------------------------------- = */
			/* =	2. ������ �ʼ� ���� ���� END													= */
			/* ============================================================================== */
			%>
			<%
			/* ============================================================================== */
			/* =	3. Payplus Plugin �ʼ� ����(���� �Ұ�)										= */
			/* = -------------------------------------------------------------------------- = */
			/* =	������ �ʿ��� �ֹ� ������ �Է� �� �����մϴ�.											= */
			/* = -------------------------------------------------------------------------- = */
			%>
			<!-- PLUGIN ���� �����Դϴ�(���� �Ұ�) -->
			<input type="hidden" name="module_type" value="<%= module_type %>"/>
			<!-- �ʼ� �׸� : Payplus Plugin���� ���� �����ϴ� �κ����� �ݵ�� ���ԵǾ�� �մϴ� ���� �������� ���ʽÿ� -->
			<input type="hidden" name="res_cd"		   value=""/>
			<input type="hidden" name="res_msg"		   value=""/>
			<input type="hidden" name="enc_info"	   value=""/>
			<input type="hidden" name="enc_data"	   value=""/>
			<input type="hidden" name="ret_pay_method" value=""/>
			<input type="hidden" name="tran_cd"		   value=""/>
			<input type="hidden" name="use_pay_method" value="<%= pay_method %>"/>
			
			<!-- �ֹ����� ���� ���� ���� : Payplus Plugin ���� �����ϴ� �����Դϴ� -->
			<input type="hidden" name="ordr_chk"	   value=""/>
			
			<!--  ���ݿ����� ���� ���� : Payplus Plugin ���� �����ϴ� �����Դϴ� -->
			<input type="hidden" name="cash_yn"		   value=""/>
			<input type="hidden" name="cash_tr_code"   value=""/>
			<input type="hidden" name="cash_id_info"   value=""/>
			
			<!-- 2012�� 8�� 18�� ���ڻ�ŷ��� ���� ���� ���� �κ� -->
			<!-- ���� �Ⱓ ���� 0:��ȸ�� 1:�Ⱓ����(ex 1:2012010120120131) -->
			<input type="hidden" name="good_expr"	   value="0"/>
			<%
			/* = -------------------------------------------------------------------------- = */
			/* =	3. Payplus Plugin �ʼ� ���� END												= */
			/* ============================================================================== */
			%>
			<input type="hidden" name="reg_id"		   value="<%= request.getParameter("reg_id") %>"/>
		</form>
	</div>
</body>
</html>