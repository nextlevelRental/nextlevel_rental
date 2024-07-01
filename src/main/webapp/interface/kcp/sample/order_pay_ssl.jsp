<%@ page language="java" contentType="text/html;charset=euc-kr"%>
<%
/* ============================================================================== */
/* =	PAGE : 일반결제 지불 처리 PAGE												= */
/* = -------------------------------------------------------------------------- = */
/* =	연동시 오류가 발생하는 경우 아래의 주소로 접속하셔서 확인하시기 바랍니다.						= */
/* =	접속 주소 : http://kcp.co.kr/technique.requestcode.do						= */
/* = -------------------------------------------------------------------------- = */
/* =	Copyright (c)  2016  NHN KCP Inc.   All Rights Reserverd.				= */
/* ============================================================================== */

/* ============================================================================== */
/* =	환경 설정 파일 Include														= */
/* = -------------------------------------------------------------------------- = */
/* =	※ 주의 ※																	= */
/* =	테스트 및 실결제 연동시 site_conf_inc.jsp파일을 수정하시기 바랍니다.					= */
/* = -------------------------------------------------------------------------- = */
%>
<%@ page import="java.util.Calendar"%>
<%@ include file = "./../cfg/site_conf_inc.jsp"%>
<%
/* = -------------------------------------------------------------------------- = */
/* = 	환경 설정 파일 Include End													= */
/* ============================================================================== */
%>
<%!
/* ============================================================================== */
/* =   Null 처리 Method															= */
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
/* =	01. 지불 요청 정보 설정														= */
/* = -------------------------------------------------------------------------- = */
String pay_method = f_get_parm(request.getParameter("pay_method_cd"));	/* 결제 방법			*/
String ordr_idxx  = f_get_parm(request.getParameter("ord_no"));			/* 주문 번호			*/
String good_name  = f_get_parm(request.getParameter("good_name"));		/* 상품 정보			*/
String good_mny	  = f_get_parm(request.getParameter("good_mny" ));		/* 결제 금액			*/
String buyr_name  = f_get_parm(request.getParameter("buyr_name"));		/* 주문자 이름			*/
String buyr_mail  = f_get_parm(request.getParameter("buyr_mail"));		/* 주문자 E-Mail		*/
String buyr_tel1  = f_get_parm(request.getParameter("buyr_tel1"));		/* 주문자 전화번호		*/
String buyr_tel2  = f_get_parm(request.getParameter("buyr_tel2"));		/* 주문자 휴대폰번호		*/
String req_t	  = f_get_parm(request.getParameter("req_tx"));			/* 요청 종류			*/
String currency	  = f_get_parm(request.getParameter("currency"));		/* 화폐단위 (WON/USD)	*/
String quotaopt	  = f_get_parm(request.getParameter("quotaopt"));		/* 할부개월수 옵션		*/
String cardNo	  = f_get_parm(request.getParameter("card_no"));		/* 카드번호			*/
String expiryYy	  = f_get_parm(request.getParameter("expiry_yy"));		/* 유효기간(년)		*/
String expiryMm	  = f_get_parm(request.getParameter("expiry_mm"));		/* 유효기간(월)		*/
String cardauth	  = f_get_parm(request.getParameter("cardauth"));		/* 인증정보			*/
String cardpwd	  = f_get_parm(request.getParameter("cardpwd"));		/* 비밀번호			*/
/* ============================================================================== */

/* ============================================================================== */
/* =   02. HTML 페이지 관련 처리														= */
/* = -------------------------------------------------------------------------- = */
StringBuffer quota_list		   = new StringBuffer();	/* 할부 개월 리스트 표시		*/
StringBuffer expire_year_list  = new StringBuffer();	/* 유효기간(년) 리스트 표시	*/
StringBuffer expire_month_list = new StringBuffer();	/* 유효기간(월) 리스트 표시	*/
String quota = "00";

quota_list.append("<select name=\"quota\" class=\"frmselect\" disabled>");
quota_list.append("<option value=\"00\" selected>일시불</option>");

/* 할부개월 리스트 표시 */
if(Integer.parseInt(good_mny) >= 50000) {
	if(quotaopt.equals("")) {
		quotaopt = "0";
	}
	
	for(int index = 2; index <= Integer.parseInt(quotaopt); index++) {
		if(index < 10) {
			if(index == Integer.parseInt(quotaopt)) {
				quota_list.append("<option value=\"0" + index + "\" selected>" + index + "개월</option>");
				quota = "0" + String.valueOf(index);
			} else {
				quota_list.append("<option value=\"0" + index + "\">" + index + "개월</option>");
			}
		} else {
			if(index == Integer.parseInt(quotaopt)) {
				quota_list.append("<option value=\""  + index + "\" selected>" + index + "개월</option>");
				quota = String.valueOf(index);
			} else {
				quota_list.append("<option value=\""  + index + "\">" + index + "개월</option>");
			}
		}
	}
}

quota_list.append("</select>");

/* 유효기간(년) 리스트 표시 */
Calendar cal = Calendar.getInstance();

int	   nYear = cal.get(Calendar.YEAR);
String sYear = String.valueOf(nYear).substring(2, 4);

final int CURR_YEAR	= Integer.parseInt(sYear);
final int MAX_YEAR	= CURR_YEAR + 5;

expire_year_list.append("<select name=\"expiry_yy\" class=\"frmselect\" disabled>\n")
				.append("<option value=\"xx\">선택</option>\n");

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

/* 유효기간(월) 리스트 표시 */
expire_month_list.append("<select name=\"expiry_mm\"  class=\"frmselect\" disabled>\n")
				 .append("<option value=\"xx\">선택</option>\n");

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
/* =   03. 일반 KEY-IN 결제 페이지 구현												= */
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
			alert("카드번호의 길이는 최소 13자리에서 최대 16자리입니다.");
			form.card_no.focus();
			form.card_no.select();
			return false;
		}
		
		for(var inx = 0; inx < cardnolen; inx++) {
			if(cardno.charAt(inx) > "9" || cardno.charAt(inx) < "0") {
				alert("카드번호는 \'-\' 없이 숫자만 입력하여 주십시오.");
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
			<!-- 상단 문구 -->
			<h1>[결제요청] <span> <%= g_ord_title %></span></h1>
			<!-- 상단 문구 End -->
			<div class="sample">
				<p>이 페이지는 넥센타이어 렌탈 관련 결제를 요청하는 페이지입니다.</p>
				<!-- 결제 정보 출력 테이블 Start -->
				<h2>&sdot; 결제 정보</h2>
				<%
				/* ============================================================================== */
				/* =	1-1. 결제 수단 정보 설정														= */
				/* = -------------------------------------------------------------------------- = */
				/* =	결제에 필요한 결제 수단 정보를 설정합니다.											= */
				/* =																			= */
				/* =	신용카드	: 100000000000, 계좌이체	: 010000000000, 가상계좌	: 001000000000	= */
				/* =	포인트	: 000100000000, 휴대폰	: 000010000000, 상품권	: 000000001000	= */
				/* =	ARS		: 000000000010													= */
				/* =																			= */
				/* =	위와 같이 설정한 경우 PayPlus Plugin에서 설정한 결제수단이 표시됩니다.					= */
				/* =	Payplug Plugin에서 여러 결제수단을 표시하고 싶으신 경우 설정하시려는 결제					= */
				/* =	수단에 해당하는 위치에 해당하는 값을 1로 변경하여 주십시오.								= */
				/* =																			= */
				/* =	예) 신용카드, 계좌이체, 가상계좌를 동시에 표시하고자 하는 경우							= */
				/* =	pay_method = "111000000000"												= */
				/* =	신용카드(100000000000), 계좌이체(010000000000), 가상계좌(001000000000)에 		= */
				/* =	해당하는 값을 모두 더해주면 됩니다.												= */
				/* =																			= */
				/* =	※ 필수																	= */
				/* =	KCP에 신청된 결제수단으로만 결제가 가능합니다.										= */
				/* = -------------------------------------------------------------------------- = */
				%>
				<input type="hidden" name="pay_method"					 value="<%= request.getParameter("pay_method_cd") %>"/>		<!-- 지불방법코드		-->
				<input type="hidden" name="pay_method_name"	class="w100" value="<%= request.getParameter("pay_method_name") %>"/>	<!-- 지불방법명		-->
				<input type="hidden" name="ordr_idxx"		class="w200" value="<%= ordr_idxx %>"/>									<!-- 주문번호			-->
				<input type="hidden" name="good_name"		class="w100" value="<%= good_name %>"/>									<!-- 상품명			-->
				<input type="hidden" name="good_mny"		class="w100" value="<%= good_mny  %>"/>									<!-- 결제 금액			-->
				<input type="hidden" name="buyr_name"		class="w100" value="<%= buyr_name %>"/>									<!-- 주문자명			-->
				<input type="hidden" name="buyr_mail"		class="w200" value="<%= buyr_mail %>"/>									<!-- 주문자 E-Mail		-->
				<input type="hidden" name="buyr_tel1"		class="w100" value="<%= buyr_tel1 %>"/>									<!-- 주문자 전화번호		-->
				<input type="hidden" name="buyr_tel2"		class="w100" value="<%= buyr_tel2 %>"/>									<!-- 주문자 휴대폰번호	-->
				<input type="hidden" name="quota"			class="w100" value="<%= quota	  %>"/>									<!-- 할부개월			-->
				<input type="hidden" name="expiry_yy"		class="w100" value="<%= expiryYy  %>"/>									<!-- 유효기간(년)		-->
				<input type="hidden" name="expiry_mm"		class="w100" value="<%= expiryMm  %>"/>									<!-- 유효기간(월)		-->
				<table class="tbl" cellpadding="0" cellspacing="0">
					<!-- 요청 방법 : 신용카드 일반 -->
					<tr>
						<th>결제 방법</th>
						<td><%= request.getParameter("pay_method_name") %></td>
					</tr>
					<!-- 결제 금액 -->
					<tr>
						<th>결제 금액</th>
						<td><%= good_mny %>원</td>
					</tr>
					<!-- 카드 번호 -->
					<tr>
						<th>카드 번호</th>
						<td><input type="text" name="card_no" value="<%= request.getParameter("card_no") %>" size="20" maxlength="16" class="frminput" readonly/>('-' 없이 숫자만, 14 ~ 16자리)</td>
					</tr>
					<!-- 할부 개월 -->
					<tr id="show_quota">
						<th>할부 개월</th>
						<td><%= quota_list.toString() %></td>
					</tr>
					<!-- 유효 기간 -->
					<tr>
						<th>유효 기간</th>
						<td><%= expire_year_list.toString() %>년 <%= expire_month_list.toString() %>월</td>
					</tr>
					<!-- 인증 정보 -->
					<tr>
						<th>인증 정보</th>
						<td><input type="password" name="cardauth" value="<%= request.getParameter("cardauth") %>" size="14" maxlength="10" class="frminput" readonly/>(주민번호 앞 6자리, 사업자번호 10자리)</td>
					</tr>
					<!-- 비밀번호 -->
					<tr>
						<th>비밀 번호</th>
						<td><input type="password" name="cardpwd" value="<%= request.getParameter("cardpwd") %>" size="3" maxlength="2" class="frminput" readonly/>(카드비밀번호 앞2자리)</td>
					</tr>
				</table>
				<!-- 결제 정보 출력 테이블 End -->
				<!-- 결제 버튼 테이블 Start -->
				<div class="btnset" id="show_pay_btn" style="display:block">
					<!-- 결제 요청/처음으로 버튼 -->
					<input name="" type="submit" class="submit" value="결제요청" onclick="return jsf__pay_card(this.form);"/>
					<a href="#" class="home" onclick="javascript:window.close()">처음으로</a>
				</div>
				<div id="show_progress" style="display:none">
					<!-- 결제 진행 중입니다. 메시지 -->
					<td colspan="2" class="center red" >결제 진행 중입니다. 잠시만 기다려 주십시오...</td>
				</div>
				<!-- 결제 버튼 테이블 End -->
			</div>
			<div class="footer">
				Copyright (c) NHN KCP INC. All Rights reserved.
			</div>
			<!-- KCP 관련 셋팅 -->
			<input type="hidden" name="card_pay_method" value="SSL"/>
			<%
			/* = -------------------------------------------------------------------------- = */
			/* =	1. 주문 정보 입력 END														= */
			/* ============================================================================== */
			%>
			<%
			/* ============================================================================== */
			/* =	2. 가맹점 필수 정보 설정														= */
			/* = -------------------------------------------------------------------------- = */
			/* =	※ 필수 - 결제에 반드시 필요한 정보입니다.											= */
			/* =	site_conf_inc.jsp 파일을 참고하셔서 수정하시기 바랍니다.							= */
			/* = -------------------------------------------------------------------------- = */
			/* 요청종류 : 승인(pay) / 취소, 매입(mod) 요청시 사용 */
			%>
			<input type="hidden" name="req_tx"	  value="pay" />
			<input type="hidden" name="site_cd"	  value="<%= g_conf_site_cd %>" />
			<input type="hidden" name="site_name" value="<%= g_conf_site_name %>" />
			<%
			/* = -------------------------------------------------------------------------- = */
			/* =	할부옵션 : Payplus Plug-in에서 카드결제시 최대로 표시할 할부개월 수를 설정합니다.			= */
			/* =			(0 ~ 18 까지 설정 가능)												= */
			/* =	※ 주의 - 할부 선택은 결제금액이 50,000원 이상일 경우에만 가능							= */
			/* =		   50,000원 미만의 금액은 일시불로만 표기됩니다	.								= */
			/* =	예) value 값을 "5" 로 설정했을 경우 => 카드결제시 결제창에 일시불부터 5개월까지 선택가능		= */
			/* = -------------------------------------------------------------------------- = */
			%>
			<input type="hidden" name="quotaopt" value="<%= quotaopt %>"/>
			<input type="hidden" name="currency" value="WON"/> <!-- 필수 항목 : 결제 금액/화폐단위 -->
			<%
			/* = -------------------------------------------------------------------------- = */
			/* =	2. 가맹점 필수 정보 설정 END													= */
			/* ============================================================================== */
			%>
			<%
			/* ============================================================================== */
			/* =	3. Payplus Plugin 필수 정보(변경 불가)										= */
			/* = -------------------------------------------------------------------------- = */
			/* =	결제에 필요한 주문 정보를 입력 및 설정합니다.											= */
			/* = -------------------------------------------------------------------------- = */
			%>
			<!-- PLUGIN 설정 정보입니다(변경 불가) -->
			<input type="hidden" name="module_type" value="<%= module_type %>"/>
			<!-- 필수 항목 : Payplus Plugin에서 값을 설정하는 부분으로 반드시 포함되어야 합니다 값을 설정하지 마십시오 -->
			<input type="hidden" name="res_cd"		   value=""/>
			<input type="hidden" name="res_msg"		   value=""/>
			<input type="hidden" name="enc_info"	   value=""/>
			<input type="hidden" name="enc_data"	   value=""/>
			<input type="hidden" name="ret_pay_method" value=""/>
			<input type="hidden" name="tran_cd"		   value=""/>
			<input type="hidden" name="use_pay_method" value="<%= pay_method %>"/>
			
			<!-- 주문정보 검증 관련 정보 : Payplus Plugin 에서 설정하는 정보입니다 -->
			<input type="hidden" name="ordr_chk"	   value=""/>
			
			<!--  현금영수증 관련 정보 : Payplus Plugin 에서 설정하는 정보입니다 -->
			<input type="hidden" name="cash_yn"		   value=""/>
			<input type="hidden" name="cash_tr_code"   value=""/>
			<input type="hidden" name="cash_id_info"   value=""/>
			
			<!-- 2012년 8월 18일 전자상거래법 개정 관련 설정 부분 -->
			<!-- 제공 기간 설정 0:일회성 1:기간설정(ex 1:2012010120120131) -->
			<input type="hidden" name="good_expr"	   value="0"/>
			<%
			/* = -------------------------------------------------------------------------- = */
			/* =	3. Payplus Plugin 필수 정보 END												= */
			/* ============================================================================== */
			%>
			<input type="hidden" name="reg_id"		   value="<%= request.getParameter("reg_id") %>"/>
		</form>
	</div>
</body>
</html>