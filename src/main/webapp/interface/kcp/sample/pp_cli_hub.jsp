<%@ page language="java" contentType="text/html;charset=euc-kr"%>
<%
/* ============================================================================== */
/* =	PAGE : 지불 요청 및 결과 처리 PAGE												= */
/* = -------------------------------------------------------------------------- = */
/* =	연동시 오류가 발생하는 경우 아래의 주소로 접속하셔서 확인하시기 바랍니다.= */
/* =	접속 주소 : http://kcp.co.kr/technique.requestcode.do						= */
/* = -------------------------------------------------------------------------- = */
/* =	Copyright (c)  2016  NHN KCP Inc.   All Rights Reserverd.				= */
/* ============================================================================== */

/* ============================================================================== */
/* =	환경 설정 파일 Include														= */
/* = -------------------------------------------------------------------------- = */
/* =	※ 필수																	= */
/* =	테스트 및 실결제 연동시 site_conf_inc.jsp파일을 수정하시기 바랍니다.					= */
/* = -------------------------------------------------------------------------- = */
%>
<%@ page import="com.kcp.*" %>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.sql.*"%>
<%@ include file="../cfg/site_conf_inc.jsp"%>
<%
/* = -------------------------------------------------------------------------- = */
/* =	환경 설정 파일 Include END													= */
/* ============================================================================== */
%>
<%!
/* ============================================================================== */
/* =	Null 처리 Method															= */
/* = -------------------------------------------------------------------------- = */
public String f_get_parm(String val) {
	if(val == null) val = "";
	
	return val;
}
/* ============================================================================== */
%>
<%
/* ============================================================================== */
/* =	POST 형식 Check															= */
/* = -------------------------------------------------------------------------- = */
if(request.getMethod() != "POST") {
	out.println("잘못된 경로로 접속하였습니다.");
	
	return;
}
/* ============================================================================== */
%>
<%
request.setCharacterEncoding("euc-kr");
/* ============================================================================== */
/* =	01. 지불 요청 정보 설정														= */
/* = -------------------------------------------------------------------------- = */
String req_tx			= f_get_parm(request.getParameter("req_tx"));					/* 요청 종류							*/
String tran_cd			= f_get_parm(request.getParameter("tran_cd"));					/* 처리 종류							*/
/* = -------------------------------------------------------------------------- = */
String cust_ip			= f_get_parm(request.getRemoteAddr());							/* 요청 IP							*/
String ordr_idxx		= f_get_parm(request.getParameter("ordr_idxx"));				/* 쇼핑몰 주문번호						*/
String good_name		= f_get_parm(request.getParameter("good_name"));				/* 상품명								*/
String good_mny			= f_get_parm(request.getParameter("good_mny"));					/* 결제 총금액							*/
/* = -------------------------------------------------------------------------- = */
String res_cd			= "";															/* 응답코드							*/
String res_msg			= "";															/* 응답 메세지							*/
String tno				= f_get_parm(request.getParameter("tno"));						/* KCP 거래 고유 번호					*/
/* = -------------------------------------------------------------------------- = */
String buyr_name		= f_get_parm(request.getParameter("buyr_name"));				/* 주문자명							*/
String buyr_tel1		= f_get_parm(request.getParameter("buyr_tel1"));				/* 주문자 전화번호						*/
String buyr_tel2		= f_get_parm(request.getParameter("buyr_tel2"));				/* 주문자 핸드폰 번호						*/
String buyr_mail		= f_get_parm(request.getParameter("buyr_mail"));				/* 주문자 E-mail 주소					*/
/* = -------------------------------------------------------------------------- = */
String use_pay_method	= f_get_parm(request.getParameter("use_pay_method"));			/* 결제 방법							*/
String bSucc			= "";															/* 업체 DB 처리 성공 여부					*/
String tx_cd			= "";															/* 트랜잭션 코드						*/
String currency			= f_get_parm(request.getParameter("currency"));					/* 화폐단위 (WON/USD)					*/
/* = -------------------------------------------------------------------------- = */
String app_time			= "";															/* 승인시간 (모든 결제 수단 공통)			*/
String mod_type			= f_get_parm( request.getParameter("mod_type"));				/* 변경TYPE(승인취소시 필요)				*/
String mod_desc			= f_get_parm( request.getParameter("mod_desc"));				/* 변경사유							*/
String panc_mod_mny		= "";															/* 부분취소 금액						*/
String panc_rem_mny		= "";															/* 부분취소 가능 금액						*/
String amount			= "";															/* KCP 실제 거래금액					*/
String total_amount		= "0";															/* 복합결제시 총 거래금액					*/
String coupon_mny		= "";															/* 쿠폰금액							*/
/* = -------------------------------------------------------------------------- = */
//String card_no			= "";															/* 신용카드 번호						*/
String card_cd			= "";															/* 신용카드 코드						*/
String card_name		= "";															/* 신용카드 명							*/
String app_no			= "";															/* 신용카드 승인번호						*/
String noinf			= "";															/* 신용카드 무이자 여부					*/
String quota			= "";															/* 신용카드 할부개월						*/
String partcanc_yn		= "";															/* 부분취소 가능유무						*/
String card_bin_type_01	= "";															/* 카드구분1							*/
String card_bin_type_02	= "";															/* 카드구분2							*/
String card_mny			= "";															/* 카드결제금액							*/
String cardpwd			= f_get_parm(request.getParameter("cardpwd"));					/* 카드비밀번호							*/
String cardauth			= f_get_parm(request.getParameter("cardauth"));					/* 카드인증번호							*/
/* = -------------------------------------------------------------------------- = */
String bank_name		= "";															/* 은행명								*/
String bank_code		= "";															/* 은행코드							*/
String bk_mny			= "";															/* 계좌이체결제금액						*/
/* = -------------------------------------------------------------------------- = */
String bankname			= "";															/* 입금 은행명							*/
String bankcode			= "";															/* 입금 은행명							*/
String depositor		= "";															/* 입금 계좌 예금주 성명					*/
String account			= "";															/* 입금 계좌 번호						*/
String va_date			= "";															/* 가상계좌 입금마감시간					*/
/* = -------------------------------------------------------------------------- = */
String pnt_issue		= "";															/* 결제 포인트사 코드						*/
String pnt_amount		= "";															/* 적립금액 or 사용금액					*/
String pnt_app_time		= "";															/* 승인시간							*/
String pnt_app_no		= "";															/* 승인번호							*/
String add_pnt			= "";															/* 발생 포인트							*/
String use_pnt			= "";															/* 사용가능 포인트						*/
String rsv_pnt			= "";															/* 총 누적 포인트						*/
/* = -------------------------------------------------------------------------- = */
String commid			= "";															/* 통신사코드							*/
String mobile_no		= "";															/* 휴대폰번호							*/
/* = -------------------------------------------------------------------------- = */
String shop_user_id		= f_get_parm(request.getParameter("shop_user_id"));				/* 가맹점 고객 아이디						*/
String tk_van_code		= "";															/* 발급사코드							*/
String tk_app_no		= "";															/* 승인번호							*/
/* = -------------------------------------------------------------------------- = */
String cash_yn			= f_get_parm(request.getParameter("cash_yn"));					/* 현금 영수증 등록 여부					*/
String cash_authno		= "";															/* 현금 영수증 승인 번호					*/
String cash_tr_code		= f_get_parm(request.getParameter("cash_tr_code"));				/* 현금 영수증 발행 구분					*/
String cash_id_info		= f_get_parm(request.getParameter("cash_id_info"));				/* 현금 영수증 등록 번호					*/
String expire_term		= f_get_parm(request.getParameter("vcnt_expire_term"));			/* 가상계좌 입금기한						*/
String expire_time		= f_get_parm(request.getParameter("vcnt_expire_term_time"));	/* 가상계좌 입금마감시간					*/
String reg_id			= f_get_parm(request.getParameter("reg_id"));					/* 등록자(KCP양식 아님. 자체필요에 의해 추가)	*/
/* ============================================================================== */
/* =	01. 지불 요청 정보 설정 END													= */
/* ============================================================================== */

/* ============================================================================== */
/* =	02. 인스턴스 생성 및 초기화(변경 불가)											= */
/* = -------------------------------------------------------------------------- = */
/* =	결제에 필요한 인스턴스를 생성하고 초기화 합니다.										= */
/* = -------------------------------------------------------------------------- = */
J_PP_CLI_N c_PayPlus = new J_PP_CLI_N();

c_PayPlus.mf_init("", g_conf_gw_url, g_conf_gw_port, g_conf_tx_mode, g_conf_log_dir);
c_PayPlus.mf_init_set();
/* ============================================================================== */

/* ============================================================================== */
/* =	03. 처리 요청 정보 설정														= */
/* = -------------------------------------------------------------------------- = */
/* = -------------------------------------------------------------------------- = */
/* =	03-1. 승인 요청 정보 설정														= */
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
	
	/* 주문 정보 */
	int ordr_data_set;
	
	ordr_data_set = c_PayPlus.mf_add_set("ordr_data");
	
	c_PayPlus.mf_set_us(ordr_data_set, "ordr_idxx",	ordr_idxx);
	c_PayPlus.mf_set_us(ordr_data_set, "good_name",	good_name);
	c_PayPlus.mf_set_us(ordr_data_set, "good_mny",	good_mny);
	c_PayPlus.mf_set_us(ordr_data_set, "buyr_name",	buyr_name);
	c_PayPlus.mf_set_us(ordr_data_set, "buyr_tel1",	buyr_tel1);
	c_PayPlus.mf_set_us(ordr_data_set, "buyr_tel2",	buyr_tel2);
	c_PayPlus.mf_set_us(ordr_data_set, "buyr_mail",	buyr_mail);
	
	/* 카드결제 */
	if("100000000000".equals(use_pay_method)) {
		int card_data_set;
		
		card_data_set = c_PayPlus.mf_add_set("card");
		
		c_PayPlus.mf_set_us(card_data_set, "card_mny",	   good_mny); /* 결제 금액 */
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
/* =	03-2. 취소 / 매입 요청														= */
/* ------------------------------------------------------------------------------ */
else if("mod".equals(req_tx)) {
	int mod_data_set_no;
	
	tx_cd = "00200000";
	mod_data_set_no = c_PayPlus.mf_add_set("mod_data");
	
	c_PayPlus.mf_set_us(mod_data_set_no, "tno",		 request.getParameter("tno"));		/* KCP 원거래 거래번호	*/
	c_PayPlus.mf_set_us(mod_data_set_no, "mod_type", mod_type);							/* 원거래 변경 요청 종류	*/
	c_PayPlus.mf_set_us(mod_data_set_no, "mod_ip",	 cust_ip);							/* 변경 요청자 IP		*/
	c_PayPlus.mf_set_us(mod_data_set_no, "mod_desc", request.getParameter("mod_desc"));	/* 변경 사유			*/
	
	/* 부분취소의 경우 */
	if("STPC".equals(mod_type)) {
		c_PayPlus.mf_set_us( mod_data_set_no, "mod_mny", request.getParameter("mod_mny")); /* 취소요청금액 */
		c_PayPlus.mf_set_us( mod_data_set_no, "rem_mny", request.getParameter("rem_mny")); /* 취소가능잔액 */
	}
}

/* = -------------------------------------------------------------------------- = */
/* =	03-3. 실행																= */
/* ------------------------------------------------------------------------------ */
if(tx_cd.length() > 0) {
	c_PayPlus.mf_do_tx(g_conf_site_cd, g_conf_site_key, tx_cd, cust_ip, ordr_idxx, g_conf_log_level, "0");
} else {
	c_PayPlus.m_res_cd	= "9562";
	c_PayPlus.m_res_msg	= "연동 오류";
}

res_cd	= c_PayPlus.m_res_cd;	/* 결과 코드	*/
res_msg	= c_PayPlus.m_res_msg;	/* 결과 메시지	*/
/* ============================================================================== */

/* ============================================================================== */
/* =	04. 승인 결과 처리															= */
/* ------------------------------------------------------------------------------ */
if("pay".equals(req_tx)) {
	/* 정상 결제시 */
	if("0000".equals(res_cd)) {
		tno = c_PayPlus.mf_get_res("tno");	/* KCP 거래고유번호 */
		
		/* ------------------------------------------------------------------------------ */
		/* =	04-1. 신용카드 승인 결과 처리													= */
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
/* =	05. 취소 / 매입 결과 처리														= */
/* ------------------------------------------------------------------------------ */
else if("mod".equals(req_tx)) {
	if("0000".equals(res_cd)) {
		if("STPC".equals(mod_type)) {
			amount		 = c_PayPlus.mf_get_res("amount");		 /* 총 금액			*/
			panc_mod_mny = c_PayPlus.mf_get_res("panc_mod_mny"); /* 부분취소 요청금액	*/
			panc_rem_mny = c_PayPlus.mf_get_res("panc_rem_mny"); /* 부분취소 가능금액	*/
		}
	}
}
/* ============================================================================== */
/* ============================================================================== */
/* =	06. 폼 구성 및 결과페이지 호출													= */
/* ------------------------------------------------------------------------------ */
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>*** NHN KCP [AX-HUB Version] ***</title>
<script type="text/javascript">
/* window.NEXACROHTML 객체 초기화 */
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
	/* 넥사크로 호출 유형에 맞게 분기해서 처리(Runtime 사용하지않음) */
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

/* 결제 중 새로고침 방지 샘플 스크립트 */
function noRefresh() {
	/* CTRL + N키 방지. */
	if((event.keyCode == 78) && (event.ctrlKey == true)) {
		event.keyCode = 0;
		
		return false;
	}
	
	/* F5 번키 방지. */
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
		<input type="hidden" name="site_cd"			 value="<%= g_conf_site_cd	 %>"/> <!-- 사이트 코드				-->
		<input type="hidden" name="req_tx"			 value="<%= req_tx			 %>"/> <!-- 요청 구분				-->
		<input type="hidden" name="use_pay_method"	 value="<%= use_pay_method	 %>"/> <!-- 사용한 결제 수단			-->
		<input type="hidden" name="bSucc"			 value="<%= bSucc			 %>"/> <!-- 쇼핑몰 DB 처리 성공 여부	-->
		<input type="hidden" name="amount"			 value="<%= amount			 %>"/> <!-- 금액					-->
		<input type="hidden" name="res_cd"			 value="<%= res_cd			 %>"/> <!-- 결과 코드				-->
		<input type="hidden" name="res_msg"			 value="<%= res_msg			 %>"/> <!-- 결과 메세지				-->
		<input type="hidden" name="ordr_idxx"		 value="<%= ordr_idxx		 %>"/> <!-- 주문번호				-->
		<input type="hidden" name="tno"				 value="<%= tno				 %>"/> <!-- KCP 거래번호			-->
		<input type="hidden" name="good_mny"		 value="<%= good_mny		 %>"/> <!-- 결제금액				-->
		<input type="hidden" name="good_name"		 value="<%= good_name		 %>"/> <!-- 상품명				-->
		<input type="hidden" name="buyr_name"		 value="<%= buyr_name		 %>"/> <!-- 주문자명				-->
		<input type="hidden" name="buyr_tel1"		 value="<%= buyr_tel1		 %>"/> <!-- 주문자 전화번호			-->
		<input type="hidden" name="buyr_tel2"		 value="<%= buyr_tel2		 %>"/> <!-- 주문자 휴대폰번호		-->
		<input type="hidden" name="buyr_mail"		 value="<%= buyr_mail		 %>"/> <!-- 주문자 E-mail			-->
		<input type="hidden" name="app_time"		 value="<%= app_time		 %>"/> <!-- 승인시간				-->
		
		<!-- 결제취소 정보 -->
		<input type="hidden" name="panc_mod_mny"	 value="<%= panc_mod_mny	 %>"/> <!-- 부분취소금액			-->
		<input type="hidden" name="panc_rem_mny"	 value="<%= panc_rem_mny	 %>"/> <!-- 부분취소가능금액			-->
		<input type="hidden" name="mod_type"		 value="<%= mod_type		 %>"/> <!-- 요청구분				-->
		<input type="hidden" name="mod_desc"		 value="<%= mod_desc		 %>"/> <!-- 취소사유				-->
		
		<!-- 신용카드 정보 -->
<%-- 		<input type="hidden" name="card_no"			 value="<%= card_no			 %>"/> <!-- 카드번호				--> --%>
		<input type="hidden" name="card_cd"			 value="<%= card_cd			 %>"/> <!-- 카드코드				-->
		<input type="hidden" name="card_name"		 value="<%= card_name		 %>"/> <!-- 카드이름				-->
		<input type="hidden" name="app_no"			 value="<%= app_no			 %>"/> <!-- 승인번호				-->
		<input type="hidden" name="noinf"			 value="<%= noinf			 %>"/> <!-- 무이자여부				-->
		<input type="hidden" name="quota"			 value="<%= quota			 %>"/> <!-- 할부개월				-->
		<input type="hidden" name="partcanc_yn"		 value="<%= partcanc_yn		 %>"/> <!-- 부분취소가능유무			-->
		<input type="hidden" name="card_bin_type_01" value="<%= card_bin_type_01 %>"/> <!-- 카드구분1				-->
		<input type="hidden" name="card_bin_type_02" value="<%= card_bin_type_02 %>"/> <!-- 카드구분2				-->
		
		<!-- 계좌이체 정보 -->
		<input type="hidden" name="bank_name"		 value="<%= bank_name		 %>"/> <!-- 은행명				-->
		<input type="hidden" name="bank_code"		 value="<%= bank_code		 %>"/> <!-- 은행코드				-->
		
		<!-- 가상계좌 정보 -->
		<input type="hidden" name="bankname"		 value="<%= bankname		 %>"/> <!-- 입금 은행				-->
		<input type="hidden" name="depositor"		 value="<%= depositor		 %>"/> <!-- 입금계좌 예금주			-->
		<input type="hidden" name="account"			 value="<%= account			 %>"/> <!-- 입금계좌 번호			-->
		<input type="hidden" name="va_date"			 value="<%= va_date			 %>"/> <!-- 가상계좌 입금마감시간		-->
		
		<!-- 포인트 정보 -->
		<input type="hidden" name="pnt_issue"		 value="<%= pnt_issue		 %>"/> <!-- 포인트 서비스사			-->
		<input type="hidden" name="pnt_app_time"	 value="<%= pnt_app_time	 %>"/> <!-- 승인시간				-->
		<input type="hidden" name="pnt_app_no"		 value="<%= pnt_app_no		 %>"/> <!-- 승인번호				-->
		<input type="hidden" name="pnt_amount"		 value="<%= pnt_amount		 %>"/> <!-- 적립금액 or 사용금액		-->
		<input type="hidden" name="add_pnt"			 value="<%= add_pnt			 %>"/> <!-- 발생 포인트				-->
		<input type="hidden" name="use_pnt"			 value="<%= use_pnt			 %>"/> <!-- 사용가능 포인트			-->
		<input type="hidden" name="rsv_pnt"			 value="<%= rsv_pnt			 %>"/> <!-- 총 누적 포인트			-->
		
		<!-- 휴대폰 정보 -->
		<input type="hidden" name="commid"			 value="<%= commid			 %>"/> <!-- 통신사 코드				-->
		<input type="hidden" name="mobile_no"		 value="<%= mobile_no		 %>"/> <!-- 휴대폰 번호				-->
		
		<!-- 상품권 정보 -->
		<input type="hidden" name="tk_van_code"		 value="<%= tk_van_code		 %>"/> <!-- 발급사 코드				-->
		<input type="hidden" name="tk_app_no"		 value="<%= tk_app_no		 %>"/> <!-- 승인 번호				-->
		
		<!-- 현금영수증 정보 -->
		<input type="hidden" name="cash_yn"			 value="<%= cash_yn			 %>"/> <!-- 현금영수증 등록 여부		-->
		<input type="hidden" name="cash_authno"		 value="<%= cash_authno		 %>"/> <!-- 현금 영수증 승인 번호		-->
		<input type="hidden" name="cash_tr_code"	 value="<%= cash_tr_code	 %>"/> <!-- 현금 영수증 발행 구분		-->
		<input type="hidden" name="cash_id_info"	 value="<%= cash_id_info	 %>"/> <!-- 현금 영수증 등록 번호		-->
	</form>
</body>
</html>