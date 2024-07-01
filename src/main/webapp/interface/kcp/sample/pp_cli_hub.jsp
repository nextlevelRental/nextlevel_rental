<%@ page language="java" contentType="text/html;charset=euc-kr"%>
<%
/* ============================================================================== */
/* =	PAGE : ���� ��û �� ��� ó�� PAGE												= */
/* = -------------------------------------------------------------------------- = */
/* =	������ ������ �߻��ϴ� ��� �Ʒ��� �ּҷ� �����ϼż� Ȯ���Ͻñ� �ٶ��ϴ�.= */
/* =	���� �ּ� : http://kcp.co.kr/technique.requestcode.do						= */
/* = -------------------------------------------------------------------------- = */
/* =	Copyright (c)  2016  NHN KCP Inc.   All Rights Reserverd.				= */
/* ============================================================================== */

/* ============================================================================== */
/* =	ȯ�� ���� ���� Include														= */
/* = -------------------------------------------------------------------------- = */
/* =	�� �ʼ�																	= */
/* =	�׽�Ʈ �� �ǰ��� ������ site_conf_inc.jsp������ �����Ͻñ� �ٶ��ϴ�.					= */
/* = -------------------------------------------------------------------------- = */
%>
<%@ page import="com.kcp.*" %>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.sql.*"%>
<%@ include file="../cfg/site_conf_inc.jsp"%>
<%
/* = -------------------------------------------------------------------------- = */
/* =	ȯ�� ���� ���� Include END													= */
/* ============================================================================== */
%>
<%!
/* ============================================================================== */
/* =	Null ó�� Method															= */
/* = -------------------------------------------------------------------------- = */
public String f_get_parm(String val) {
	if(val == null) val = "";
	
	return val;
}
/* ============================================================================== */
%>
<%
/* ============================================================================== */
/* =	POST ���� Check															= */
/* = -------------------------------------------------------------------------- = */
if(request.getMethod() != "POST") {
	out.println("�߸��� ��η� �����Ͽ����ϴ�.");
	
	return;
}
/* ============================================================================== */
%>
<%
request.setCharacterEncoding("euc-kr");
/* ============================================================================== */
/* =	01. ���� ��û ���� ����														= */
/* = -------------------------------------------------------------------------- = */
String req_tx			= f_get_parm(request.getParameter("req_tx"));					/* ��û ����							*/
String tran_cd			= f_get_parm(request.getParameter("tran_cd"));					/* ó�� ����							*/
/* = -------------------------------------------------------------------------- = */
String cust_ip			= f_get_parm(request.getRemoteAddr());							/* ��û IP							*/
String ordr_idxx		= f_get_parm(request.getParameter("ordr_idxx"));				/* ���θ� �ֹ���ȣ						*/
String good_name		= f_get_parm(request.getParameter("good_name"));				/* ��ǰ��								*/
String good_mny			= f_get_parm(request.getParameter("good_mny"));					/* ���� �ѱݾ�							*/
/* = -------------------------------------------------------------------------- = */
String res_cd			= "";															/* �����ڵ�							*/
String res_msg			= "";															/* ���� �޼���							*/
String tno				= f_get_parm(request.getParameter("tno"));						/* KCP �ŷ� ���� ��ȣ					*/
/* = -------------------------------------------------------------------------- = */
String buyr_name		= f_get_parm(request.getParameter("buyr_name"));				/* �ֹ��ڸ�							*/
String buyr_tel1		= f_get_parm(request.getParameter("buyr_tel1"));				/* �ֹ��� ��ȭ��ȣ						*/
String buyr_tel2		= f_get_parm(request.getParameter("buyr_tel2"));				/* �ֹ��� �ڵ��� ��ȣ						*/
String buyr_mail		= f_get_parm(request.getParameter("buyr_mail"));				/* �ֹ��� E-mail �ּ�					*/
/* = -------------------------------------------------------------------------- = */
String use_pay_method	= f_get_parm(request.getParameter("use_pay_method"));			/* ���� ���							*/
String bSucc			= "";															/* ��ü DB ó�� ���� ����					*/
String tx_cd			= "";															/* Ʈ����� �ڵ�						*/
String currency			= f_get_parm(request.getParameter("currency"));					/* ȭ����� (WON/USD)					*/
/* = -------------------------------------------------------------------------- = */
String app_time			= "";															/* ���νð� (��� ���� ���� ����)			*/
String mod_type			= f_get_parm( request.getParameter("mod_type"));				/* ����TYPE(������ҽ� �ʿ�)				*/
String mod_desc			= f_get_parm( request.getParameter("mod_desc"));				/* �������							*/
String panc_mod_mny		= "";															/* �κ���� �ݾ�						*/
String panc_rem_mny		= "";															/* �κ���� ���� �ݾ�						*/
String amount			= "";															/* KCP ���� �ŷ��ݾ�					*/
String total_amount		= "0";															/* ���հ����� �� �ŷ��ݾ�					*/
String coupon_mny		= "";															/* �����ݾ�							*/
/* = -------------------------------------------------------------------------- = */
//String card_no			= "";															/* �ſ�ī�� ��ȣ						*/
String card_cd			= "";															/* �ſ�ī�� �ڵ�						*/
String card_name		= "";															/* �ſ�ī�� ��							*/
String app_no			= "";															/* �ſ�ī�� ���ι�ȣ						*/
String noinf			= "";															/* �ſ�ī�� ������ ����					*/
String quota			= "";															/* �ſ�ī�� �Һΰ���						*/
String partcanc_yn		= "";															/* �κ���� ��������						*/
String card_bin_type_01	= "";															/* ī�屸��1							*/
String card_bin_type_02	= "";															/* ī�屸��2							*/
String card_mny			= "";															/* ī������ݾ�							*/
String cardpwd			= f_get_parm(request.getParameter("cardpwd"));					/* ī���й�ȣ							*/
String cardauth			= f_get_parm(request.getParameter("cardauth"));					/* ī��������ȣ							*/
/* = -------------------------------------------------------------------------- = */
String bank_name		= "";															/* �����								*/
String bank_code		= "";															/* �����ڵ�							*/
String bk_mny			= "";															/* ������ü�����ݾ�						*/
/* = -------------------------------------------------------------------------- = */
String bankname			= "";															/* �Ա� �����							*/
String bankcode			= "";															/* �Ա� �����							*/
String depositor		= "";															/* �Ա� ���� ������ ����					*/
String account			= "";															/* �Ա� ���� ��ȣ						*/
String va_date			= "";															/* ������� �Աݸ����ð�					*/
/* = -------------------------------------------------------------------------- = */
String pnt_issue		= "";															/* ���� ����Ʈ�� �ڵ�						*/
String pnt_amount		= "";															/* �����ݾ� or ���ݾ�					*/
String pnt_app_time		= "";															/* ���νð�							*/
String pnt_app_no		= "";															/* ���ι�ȣ							*/
String add_pnt			= "";															/* �߻� ����Ʈ							*/
String use_pnt			= "";															/* ��밡�� ����Ʈ						*/
String rsv_pnt			= "";															/* �� ���� ����Ʈ						*/
/* = -------------------------------------------------------------------------- = */
String commid			= "";															/* ��Ż��ڵ�							*/
String mobile_no		= "";															/* �޴�����ȣ							*/
/* = -------------------------------------------------------------------------- = */
String shop_user_id		= f_get_parm(request.getParameter("shop_user_id"));				/* ������ �� ���̵�						*/
String tk_van_code		= "";															/* �߱޻��ڵ�							*/
String tk_app_no		= "";															/* ���ι�ȣ							*/
/* = -------------------------------------------------------------------------- = */
String cash_yn			= f_get_parm(request.getParameter("cash_yn"));					/* ���� ������ ��� ����					*/
String cash_authno		= "";															/* ���� ������ ���� ��ȣ					*/
String cash_tr_code		= f_get_parm(request.getParameter("cash_tr_code"));				/* ���� ������ ���� ����					*/
String cash_id_info		= f_get_parm(request.getParameter("cash_id_info"));				/* ���� ������ ��� ��ȣ					*/
String expire_term		= f_get_parm(request.getParameter("vcnt_expire_term"));			/* ������� �Աݱ���						*/
String expire_time		= f_get_parm(request.getParameter("vcnt_expire_term_time"));	/* ������� �Աݸ����ð�					*/
String reg_id			= f_get_parm(request.getParameter("reg_id"));					/* �����(KCP��� �ƴ�. ��ü�ʿ信 ���� �߰�)	*/
/* ============================================================================== */
/* =	01. ���� ��û ���� ���� END													= */
/* ============================================================================== */

/* ============================================================================== */
/* =	02. �ν��Ͻ� ���� �� �ʱ�ȭ(���� �Ұ�)											= */
/* = -------------------------------------------------------------------------- = */
/* =	������ �ʿ��� �ν��Ͻ��� �����ϰ� �ʱ�ȭ �մϴ�.										= */
/* = -------------------------------------------------------------------------- = */
J_PP_CLI_N c_PayPlus = new J_PP_CLI_N();

c_PayPlus.mf_init("", g_conf_gw_url, g_conf_gw_port, g_conf_tx_mode, g_conf_log_dir);
c_PayPlus.mf_init_set();
/* ============================================================================== */

/* ============================================================================== */
/* =	03. ó�� ��û ���� ����														= */
/* = -------------------------------------------------------------------------- = */
/* = -------------------------------------------------------------------------- = */
/* =	03-1. ���� ��û ���� ����														= */
/* = -------------------------------------------------------------------------- = */
if("pay".equals(req_tx)) {
	tx_cd = "00100000";
	
	int payx_data_set;
	int common_data_set;
	
	payx_data_set	= c_PayPlus.mf_add_set("payx_data");
	common_data_set	= c_PayPlus.mf_add_set("common");
	
	c_PayPlus.mf_set_us(common_data_set, "amount",	 good_mny);
	c_PayPlus.mf_set_us(common_data_set, "currency", currency);
	c_PayPlus.mf_set_us(common_data_set, "cust_ip",	 cust_ip);
	c_PayPlus.mf_set_us(common_data_set, "escw_mod", "N");
	
	c_PayPlus.mf_add_rs(payx_data_set, common_data_set);
	
	/* �ֹ� ���� */
	int ordr_data_set;
	
	ordr_data_set = c_PayPlus.mf_add_set("ordr_data");
	
	c_PayPlus.mf_set_us(ordr_data_set, "ordr_idxx",	ordr_idxx);
	c_PayPlus.mf_set_us(ordr_data_set, "good_name",	good_name);
	c_PayPlus.mf_set_us(ordr_data_set, "good_mny",	good_mny);
	c_PayPlus.mf_set_us(ordr_data_set, "buyr_name",	buyr_name);
	c_PayPlus.mf_set_us(ordr_data_set, "buyr_tel1",	buyr_tel1);
	c_PayPlus.mf_set_us(ordr_data_set, "buyr_tel2",	buyr_tel2);
	c_PayPlus.mf_set_us(ordr_data_set, "buyr_mail",	buyr_mail);
	
	/* ī����� */
	if("100000000000".equals(use_pay_method)) {
		int card_data_set;
		
		card_data_set = c_PayPlus.mf_add_set("card");
		
		c_PayPlus.mf_set_us(card_data_set, "card_mny",	   good_mny); /* ���� �ݾ� */
		c_PayPlus.mf_set_us(card_data_set, "card_tx_type", "11121000");
		c_PayPlus.mf_set_us(card_data_set, "quota",		   request.getParameter("quota"));
		c_PayPlus.mf_set_us(card_data_set, "card_no",	   request.getParameter("card_no"));
		c_PayPlus.mf_set_us(card_data_set, "card_expiry",  request.getParameter("expiry_yy") + request.getParameter("expiry_mm"));
		c_PayPlus.mf_set_us(card_data_set, "card_taxno",   cardauth);
		c_PayPlus.mf_set_us(card_data_set, "card_pwd",	   cardpwd);
		
		c_PayPlus.mf_add_rs(payx_data_set, card_data_set);
	}
}

/* = -------------------------------------------------------------------------- = */
/* =	03-2. ��� / ���� ��û														= */
/* ------------------------------------------------------------------------------ */
else if("mod".equals(req_tx)) {
	int mod_data_set_no;
	
	tx_cd = "00200000";
	mod_data_set_no = c_PayPlus.mf_add_set("mod_data");
	
	c_PayPlus.mf_set_us(mod_data_set_no, "tno",		 request.getParameter("tno"));		/* KCP ���ŷ� �ŷ���ȣ	*/
	c_PayPlus.mf_set_us(mod_data_set_no, "mod_type", mod_type);							/* ���ŷ� ���� ��û ����	*/
	c_PayPlus.mf_set_us(mod_data_set_no, "mod_ip",	 cust_ip);							/* ���� ��û�� IP		*/
	c_PayPlus.mf_set_us(mod_data_set_no, "mod_desc", request.getParameter("mod_desc"));	/* ���� ����			*/
	
	/* �κ������ ��� */
	if("STPC".equals(mod_type)) {
		c_PayPlus.mf_set_us( mod_data_set_no, "mod_mny", request.getParameter("mod_mny")); /* ��ҿ�û�ݾ� */
		c_PayPlus.mf_set_us( mod_data_set_no, "rem_mny", request.getParameter("rem_mny")); /* ��Ұ����ܾ� */
	}
}

/* = -------------------------------------------------------------------------- = */
/* =	03-3. ����																= */
/* ------------------------------------------------------------------------------ */
if(tx_cd.length() > 0) {
	c_PayPlus.mf_do_tx(g_conf_site_cd, g_conf_site_key, tx_cd, cust_ip, ordr_idxx, g_conf_log_level, "0");
} else {
	c_PayPlus.m_res_cd	= "9562";
	c_PayPlus.m_res_msg	= "���� ����";
}

res_cd	= c_PayPlus.m_res_cd;	/* ��� �ڵ�	*/
res_msg	= c_PayPlus.m_res_msg;	/* ��� �޽���	*/
/* ============================================================================== */

/* ============================================================================== */
/* =	04. ���� ��� ó��															= */
/* ------------------------------------------------------------------------------ */
if("pay".equals(req_tx)) {
	/* ���� ������ */
	if("0000".equals(res_cd)) {
		tno = c_PayPlus.mf_get_res("tno");	/* KCP �ŷ�������ȣ */
		
		/* ------------------------------------------------------------------------------ */
		/* =	04-1. �ſ�ī�� ���� ��� ó��													= */
		/* ------------------------------------------------------------------------------ */
		if("100000000000".equals(use_pay_method)) {
			//card_no	  = c_PayPlus.mf_get_res("card_no");
			card_cd	  = c_PayPlus.mf_get_res("card_cd");
			card_name = c_PayPlus.mf_get_res("card_name");
			app_time  = c_PayPlus.mf_get_res("app_time");
			app_no	  = c_PayPlus.mf_get_res("app_no");
			noinf	  = c_PayPlus.mf_get_res("noinf");
			quota	  = c_PayPlus.mf_get_res("quota");
		}
	}
}
/* ============================================================================== */

/* ============================================================================== */
/* =	05. ��� / ���� ��� ó��														= */
/* ------------------------------------------------------------------------------ */
else if("mod".equals(req_tx)) {
	if("0000".equals(res_cd)) {
		if("STPC".equals(mod_type)) {
			amount		 = c_PayPlus.mf_get_res("amount");		 /* �� �ݾ�			*/
			panc_mod_mny = c_PayPlus.mf_get_res("panc_mod_mny"); /* �κ���� ��û�ݾ�	*/
			panc_rem_mny = c_PayPlus.mf_get_res("panc_rem_mny"); /* �κ���� ���ɱݾ�	*/
		}
	}
}
/* ============================================================================== */
/* ============================================================================== */
/* =	06. �� ���� �� ��������� ȣ��													= */
/* ------------------------------------------------------------------------------ */
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>*** NHN KCP [AX-HUB Version] ***</title>
<script type="text/javascript">
/* window.NEXACROHTML ��ü �ʱ�ȭ */
if(!window.NEXACROHTML) {
	window.NEXACROHTML = {};
}

var parentNexacro = null;
var bInit = false;

window.NEXACROHTML.Init = function() {
	var loopCnt = 0;
	var interval = setInterval(function() {
		parentNexacro = window.NEXACROWEBBROWSER;

		if(loopCnt >= 10 || parentNexacro) {
			bInit = true;
			clearInterval(interval);
		}

		loopCnt++;
	}, 50);
}

window.NEXACROHTML.FireUserNotify = function(userdata) {
	/* �ػ�ũ�� ȣ�� ������ �°� �б��ؼ� ó��(Runtime �����������) */
	if(parentNexacro || window.NEXACROWEBBROWSER) {
		window.NEXACROWEBBROWSER.on_fire_onusernotify(window.NEXACROWEBBROWSER, userdata);
	} else if(opener.NEXACROWEBBROWSER) {
		opener.NEXACROWEBBROWSER.on_fire_onusernotify(opener.NEXACROWEBBROWSER, userdata);
	}
}

function init() {
	window.NEXACROHTML.Init();
}

function webCallback(data) {
	window.NEXACROHTML.FireUserNotify(data);
}

function closeResult(goodMny, buyrMail, tno, cardCd, cardName, appTime, appNo, noinf, quota, resCd, resMsg) {
	var data = {  "reqTx"	: "pay"
				, "recpAmt"	: goodMny
				, "email"	: buyrMail
				, "tno"		: tno
				, "crdCd"	: cardCd
				, "crdNm"	: cardName
				, "appTime"	: appTime
				, "appNo"	: appNo
				, "noinf"	: noinf
				, "quota"	: quota
				, "resCd"	: resCd
				, "resMsg"	: resMsg
	};
	
	webCallback(data);
}

function closeCancelResult(tno, modType, modMny, remMny, modDesc, resCd, resMsg) {
	var data = {  "reqTx"	: "mod"
				, "tno"		: tno
				, "modType"	: modType
				, "modMny"	: modMny
				, "remMny"	: remMny
				, "modDesc"	: modDesc
				, "resCd"	: resCd
				, "resMsg"	: resMsg
	};
	
	webCallback(data);
}

function popupResult() {
	window.open("", "popupChk", "width=800, height=800, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=yes");
	
	var doc = document.pay_info;
	
	doc.action = location.protocol + "//" + location.host + "/interface/kcp/sample/result.jsp";
	doc.target = "popupChk";
	doc.submit();
}

function goResult() {
	var reqTx		 = document.getElementsByName("req_tx")[0].value;
	var usePayMethod = document.getElementsByName("use_pay_method")[0].value;
	var goodMny		 = document.getElementsByName("good_mny")[0].value;
	var buyrMail	 = document.getElementsByName("buyr_mail")[0].value;
	var tno			 = document.getElementsByName("tno")[0].value;
	var cardCd		 = document.getElementsByName("card_cd")[0].value;
	var cardName	 = document.getElementsByName("card_name")[0].value;
	var appTime		 = document.getElementsByName("app_time")[0].value;
	var appNo		 = document.getElementsByName("app_no")[0].value;
	var noinf		 = document.getElementsByName("noinf")[0].value;
	var quota		 = document.getElementsByName("quota")[0].value;
	
	var modType		 = document.getElementsByName("mod_type")[0].value;
	var pancModMny	 = document.getElementsByName("panc_mod_mny")[0].value;
	var pancRemMny	 = document.getElementsByName("panc_rem_mny")[0].value;
	var modDesc		 = document.getElementsByName("mod_desc")[0].value;
	
	var resCd		 = document.getElementsByName("res_cd")[0].value;
	var resMsg		 = document.getElementsByName("res_msg")[0].value;
	
	if(usePayMethod == "100000000000") {
		if(reqTx == "pay") {
			closeResult(goodMny, buyrMail, tno, cardCd, cardName, appTime, appNo, noinf, quota, resCd, resMsg);
		} else if(reqTx == "mod") {
			closeCancelResult(tno, modType, pancModMny, pancRemMny, modDesc, resCd, resMsg);
		}
	}
	
	var openwin = window.open("proc_win.html", "proc_win", "");
	
	document.pay_info.submit();
	openwin.close();
	
	popupResult();
}

/* ���� �� ���ΰ�ħ ���� ���� ��ũ��Ʈ */
function noRefresh() {
	/* CTRL + NŰ ����. */
	if((event.keyCode == 78) && (event.ctrlKey == true)) {
		event.keyCode = 0;
		
		return false;
	}
	
	/* F5 ��Ű ����. */
	if(event.keyCode == 116) {
		event.keyCode = 0;
		
		return false;
	}
}

document.onkeydown = noRefresh;
</script>
</head>
<body onload="goResult()">
	<form name="pay_info">
		<input type="hidden" name="site_cd"			 value="<%= g_conf_site_cd	 %>"/> <!-- ����Ʈ �ڵ�				-->
		<input type="hidden" name="req_tx"			 value="<%= req_tx			 %>"/> <!-- ��û ����				-->
		<input type="hidden" name="use_pay_method"	 value="<%= use_pay_method	 %>"/> <!-- ����� ���� ����			-->
		<input type="hidden" name="bSucc"			 value="<%= bSucc			 %>"/> <!-- ���θ� DB ó�� ���� ����	-->
		<input type="hidden" name="amount"			 value="<%= amount			 %>"/> <!-- �ݾ�					-->
		<input type="hidden" name="res_cd"			 value="<%= res_cd			 %>"/> <!-- ��� �ڵ�				-->
		<input type="hidden" name="res_msg"			 value="<%= res_msg			 %>"/> <!-- ��� �޼���				-->
		<input type="hidden" name="ordr_idxx"		 value="<%= ordr_idxx		 %>"/> <!-- �ֹ���ȣ				-->
		<input type="hidden" name="tno"				 value="<%= tno				 %>"/> <!-- KCP �ŷ���ȣ			-->
		<input type="hidden" name="good_mny"		 value="<%= good_mny		 %>"/> <!-- �����ݾ�				-->
		<input type="hidden" name="good_name"		 value="<%= good_name		 %>"/> <!-- ��ǰ��				-->
		<input type="hidden" name="buyr_name"		 value="<%= buyr_name		 %>"/> <!-- �ֹ��ڸ�				-->
		<input type="hidden" name="buyr_tel1"		 value="<%= buyr_tel1		 %>"/> <!-- �ֹ��� ��ȭ��ȣ			-->
		<input type="hidden" name="buyr_tel2"		 value="<%= buyr_tel2		 %>"/> <!-- �ֹ��� �޴�����ȣ		-->
		<input type="hidden" name="buyr_mail"		 value="<%= buyr_mail		 %>"/> <!-- �ֹ��� E-mail			-->
		<input type="hidden" name="app_time"		 value="<%= app_time		 %>"/> <!-- ���νð�				-->
		
		<!-- ������� ���� -->
		<input type="hidden" name="panc_mod_mny"	 value="<%= panc_mod_mny	 %>"/> <!-- �κ���ұݾ�			-->
		<input type="hidden" name="panc_rem_mny"	 value="<%= panc_rem_mny	 %>"/> <!-- �κ���Ұ��ɱݾ�			-->
		<input type="hidden" name="mod_type"		 value="<%= mod_type		 %>"/> <!-- ��û����				-->
		<input type="hidden" name="mod_desc"		 value="<%= mod_desc		 %>"/> <!-- ��һ���				-->
		
		<!-- �ſ�ī�� ���� -->
<%-- 		<input type="hidden" name="card_no"			 value="<%= card_no			 %>"/> <!-- ī���ȣ				--> --%>
		<input type="hidden" name="card_cd"			 value="<%= card_cd			 %>"/> <!-- ī���ڵ�				-->
		<input type="hidden" name="card_name"		 value="<%= card_name		 %>"/> <!-- ī���̸�				-->
		<input type="hidden" name="app_no"			 value="<%= app_no			 %>"/> <!-- ���ι�ȣ				-->
		<input type="hidden" name="noinf"			 value="<%= noinf			 %>"/> <!-- �����ڿ���				-->
		<input type="hidden" name="quota"			 value="<%= quota			 %>"/> <!-- �Һΰ���				-->
		<input type="hidden" name="partcanc_yn"		 value="<%= partcanc_yn		 %>"/> <!-- �κ���Ұ�������			-->
		<input type="hidden" name="card_bin_type_01" value="<%= card_bin_type_01 %>"/> <!-- ī�屸��1				-->
		<input type="hidden" name="card_bin_type_02" value="<%= card_bin_type_02 %>"/> <!-- ī�屸��2				-->
		
		<!-- ������ü ���� -->
		<input type="hidden" name="bank_name"		 value="<%= bank_name		 %>"/> <!-- �����				-->
		<input type="hidden" name="bank_code"		 value="<%= bank_code		 %>"/> <!-- �����ڵ�				-->
		
		<!-- ������� ���� -->
		<input type="hidden" name="bankname"		 value="<%= bankname		 %>"/> <!-- �Ա� ����				-->
		<input type="hidden" name="depositor"		 value="<%= depositor		 %>"/> <!-- �Աݰ��� ������			-->
		<input type="hidden" name="account"			 value="<%= account			 %>"/> <!-- �Աݰ��� ��ȣ			-->
		<input type="hidden" name="va_date"			 value="<%= va_date			 %>"/> <!-- ������� �Աݸ����ð�		-->
		
		<!-- ����Ʈ ���� -->
		<input type="hidden" name="pnt_issue"		 value="<%= pnt_issue		 %>"/> <!-- ����Ʈ ���񽺻�			-->
		<input type="hidden" name="pnt_app_time"	 value="<%= pnt_app_time	 %>"/> <!-- ���νð�				-->
		<input type="hidden" name="pnt_app_no"		 value="<%= pnt_app_no		 %>"/> <!-- ���ι�ȣ				-->
		<input type="hidden" name="pnt_amount"		 value="<%= pnt_amount		 %>"/> <!-- �����ݾ� or ���ݾ�		-->
		<input type="hidden" name="add_pnt"			 value="<%= add_pnt			 %>"/> <!-- �߻� ����Ʈ				-->
		<input type="hidden" name="use_pnt"			 value="<%= use_pnt			 %>"/> <!-- ��밡�� ����Ʈ			-->
		<input type="hidden" name="rsv_pnt"			 value="<%= rsv_pnt			 %>"/> <!-- �� ���� ����Ʈ			-->
		
		<!-- �޴��� ���� -->
		<input type="hidden" name="commid"			 value="<%= commid			 %>"/> <!-- ��Ż� �ڵ�				-->
		<input type="hidden" name="mobile_no"		 value="<%= mobile_no		 %>"/> <!-- �޴��� ��ȣ				-->
		
		<!-- ��ǰ�� ���� -->
		<input type="hidden" name="tk_van_code"		 value="<%= tk_van_code		 %>"/> <!-- �߱޻� �ڵ�				-->
		<input type="hidden" name="tk_app_no"		 value="<%= tk_app_no		 %>"/> <!-- ���� ��ȣ				-->
		
		<!-- ���ݿ����� ���� -->
		<input type="hidden" name="cash_yn"			 value="<%= cash_yn			 %>"/> <!-- ���ݿ����� ��� ����		-->
		<input type="hidden" name="cash_authno"		 value="<%= cash_authno		 %>"/> <!-- ���� ������ ���� ��ȣ		-->
		<input type="hidden" name="cash_tr_code"	 value="<%= cash_tr_code	 %>"/> <!-- ���� ������ ���� ����		-->
		<input type="hidden" name="cash_id_info"	 value="<%= cash_id_info	 %>"/> <!-- ���� ������ ��� ��ȣ		-->
	</form>
</body>
</html>