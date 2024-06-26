<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page language="java" contentType="text/html;charset=euc-kr"%>
<%
/* ============================================================================== */
/* =	PAGE : 결제 결과 출력 PAGE													= */
/* = -------------------------------------------------------------------------- = */
/* =	결제 요청 결과값을 출력하는 페이지입니다.											= */
/* = -------------------------------------------------------------------------- = */
/* =	연동시 오류가 발생하는 경우 아래의 주소로 접속하셔서 확인하시기 바랍니다.						= */
/* =	접속 주소 : http://kcp.co.kr/technique.requestcode.do						= */
/* = -------------------------------------------------------------------------- = */
/* =	Copyright (c)  2016  NHN KCP Inc.   All Rights Reserverd.				= */
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
request.setCharacterEncoding("euc-kr");
/* ============================================================================== */
/* =	지불 결과																	= */
/* = -------------------------------------------------------------------------- = */
String site_cd		  = f_get_parm(request.getParameter("site_cd"));		/* 사이트 코드				*/
String req_tx		  = f_get_parm(request.getParameter("req_tx"));			/* 요청 구분(승인/취소)		*/
String use_pay_method = f_get_parm(request.getParameter("use_pay_method"));	/* 사용 결제 수단			*/
String bSucc		  = f_get_parm(request.getParameter("bSucc"));			/* 업체 DB 정상처리 완료 여부	*/
/* = -------------------------------------------------------------------------- = */
String res_cd		  = f_get_parm(request.getParameter("res_cd"));			/* 결과 코드				*/
String res_msg		  = f_get_parm(request.getParameter("res_msg"));		/* 결과 메시지				*/
String res_msg_bsucc  = "";
/* = -------------------------------------------------------------------------- = */
String panc_mod_mny	  = f_get_parm(request.getParameter("panc_mod_mny"));	/* 부분취소 금액			*/
String panc_rem_mny	  = f_get_parm(request.getParameter("panc_rem_mny"));	/* 부분취소 가능 금액			*/
String mod_type		  = f_get_parm(request.getParameter("mod_type"));		/* 요청종류				*/
String mod_desc		  = f_get_parm(request.getParameter("mod_desc"));		/* 취소사유				*/
/* = -------------------------------------------------------------------------- = */
String amount		  = f_get_parm(request.getParameter("amount"));			/* 금액					*/
String ordr_idxx	  = f_get_parm(request.getParameter("ordr_idxx"));		/* 주문번호				*/
String tno			  = f_get_parm(request.getParameter("tno"));			/* KCP 거래번호			*/
String good_mny		  = f_get_parm(request.getParameter("good_mny"));		/* 결제 금액				*/
String good_name	  = f_get_parm(request.getParameter("good_name"));		/* 상품명					*/
String buyr_name	  = f_get_parm(request.getParameter("buyr_name"));		/* 구매자명				*/
String buyr_tel1	  = f_get_parm(request.getParameter("buyr_tel1"));		/* 구매자 전화번호			*/
String buyr_tel2	  = f_get_parm(request.getParameter("buyr_tel2"));		/* 구매자 휴대폰번호			*/
String buyr_mail	  = f_get_parm(request.getParameter("buyr_mail"));		/* 구매자 E-Mail			*/
/* = -------------------------------------------------------------------------- = */
/* 공통 */
String pnt_issue	  = f_get_parm(request.getParameter("pnt_issue"));		/* 포인트 서비스사			*/
String app_time		  = f_get_parm(request.getParameter("app_time"));		/* 승인시간 (공통)			*/
/* = -------------------------------------------------------------------------- = */
/* 신용카드 */
String card_no		  = f_get_parm(request.getParameter("card_no"));		/* 카드 번호				*/
String card_cd		  = f_get_parm(request.getParameter("card_cd"));		/* 카드 코드				*/
String card_name	  = f_get_parm(request.getParameter("card_name"));		/* 카드명					*/
String noinf		  = f_get_parm(request.getParameter("noinf"));			/* 무이자 여부				*/
String quota		  = f_get_parm(request.getParameter("quota"));			/* 할부개월				*/
String app_no		  = f_get_parm(request.getParameter("app_no"));			/* 승인번호				*/
/* = -------------------------------------------------------------------------- = */
/* 계좌이체 */
String bank_name	  = f_get_parm(request.getParameter("bank_name"));		/* 은행명					*/
String bank_code	  = f_get_parm(request.getParameter("bank_code"));		/* 은행코드				*/
/* = -------------------------------------------------------------------------- = */
/* 가상계좌 */
String bankname		  = f_get_parm(request.getParameter("bankname"));		/* 입금할 은행				*/
String depositor	  = f_get_parm(request.getParameter("depositor"));		/* 입금할 계좌 예금주			*/
String account		  = f_get_parm(request.getParameter("account"));		/* 입금할 계좌 번호			*/
String va_date		  = f_get_parm(request.getParameter("va_date"));		/* 가상계좌 입금마감시간		*/
/* = -------------------------------------------------------------------------- = */
/* 포인트 */
String add_pnt		  = f_get_parm(request.getParameter("add_pnt"));		/* 발생 포인트				*/
String use_pnt		  = f_get_parm(request.getParameter("use_pnt"));		/* 사용가능 포인트			*/
String rsv_pnt		  = f_get_parm(request.getParameter("rsv_pnt"));		/* 적립 포인트				*/
String pnt_app_time	  = f_get_parm(request.getParameter("pnt_app_time"));	/* 승인시간				*/
String pnt_app_no	  = f_get_parm(request.getParameter("pnt_app_no"));		/* 승인번호				*/
String pnt_amount	  = f_get_parm(request.getParameter("pnt_amount"));		/* 적립금액 or 사용금액		*/
/* = -------------------------------------------------------------------------- = */
/* 휴대폰 */
String commid		  = f_get_parm(request.getParameter("commid"));			/* 통신사 코드				*/
String mobile_no	  = f_get_parm(request.getParameter("mobile_no"));		/* 휴대폰 번호				*/
/* = -------------------------------------------------------------------------- = */
/* 상품권 */
String tk_van_code	  = f_get_parm(request.getParameter("tk_van_code"));	/* 발급사 코드				*/
String tk_app_no	  = f_get_parm(request.getParameter("tk_app_no"));		/* 승인 번호				*/
/* = -------------------------------------------------------------------------- = */
/* 현금영수증 */
String cash_yn		  = f_get_parm(request.getParameter("cash_yn"));		/* 현금 영수증 등록 여부		*/
String cash_authno	  = f_get_parm(request.getParameter("cash_authno"));	/* 현금 영수증 승인 번호		*/
String cash_tr_code	  = f_get_parm(request.getParameter("cash_tr_code"));	/* 현금 영수증 발행 구분		*/
String cash_id_info	  = f_get_parm(request.getParameter("cash_id_info"));	/* 현금 영수증 등록 번호		*/
/* ============================================================================== */
String req_tx_name = "";

if(req_tx.equals("pay")) {
	req_tx_name = "지불";
} else if(req_tx.equals("mod")) {
	req_tx_name = "취소/매입";
}

/* ============================================================================== */
/* =	가맹점 측 DB 처리 실패시 상세 결과 메시지 설정										= */
/* = -------------------------------------------------------------------------- = */
if("pay".equals(req_tx)) {
	/* 업체 DB 처리 실패 */
	if("false".equals(bSucc)) {
		if("0000".equals(res_cd)) {
			res_msg_bsucc = "결제는 정상적으로 이루어졌지만 쇼핑몰에서 결제 결과를 처리하는 중 오류가 발생하여 시스템에서 자동으로 취소 요청을 하였습니다. <br> 쇼핑몰로 전화하여 확인하시기 바랍니다.";
		} else {
			res_msg_bsucc = "결제는 정상적으로 이루어졌지만 쇼핑몰에서 결제 결과를 처리하는 중 오류가 발생하여 시스템에서 자동으로 취소 요청을 하였으나, <br> <b>취소가 실패 되었습니다.</b><br> 쇼핑몰로 전화하여 확인하시기 바랍니다.";
		}
	}
}

/* = -------------------------------------------------------------------------- = */
/* =   가맹점 측 DB 처리 실패시 상세 결과 메시지 설정 끝										= */
/* ============================================================================== */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>*** NHN KCP [AX-HUB Version] ***</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr"/>
<link href="css/style.css" rel="stylesheet" type="text/css" id="cssLink"/>
<script type="text/javascript">
/* 신용카드 영수증 */
/* 실결제시 : "https://admin8.kcp.co.kr/assist/bill.BillAction.do?cmd=card_bill&tno=" */
/* 테스트시 : "https://testadmin8.kcp.co.kr/assist/bill.BillAction.do?cmd=card_bill&tno=" */
function receiptView(tno, ordr_idxx, amount) {
	receiptWin = "https://admin8.kcp.co.kr/assist/bill.BillActionNew.do?cmd=card_bill&tno=";
	receiptWin += tno + "&";
	receiptWin += "order_no=" + ordr_idxx + "&"; 
	receiptWin += "trade_mony=" + amount ;
	
	window.open(receiptWin, "", "width=455, height=815");
}

</script>
</head>
<body>
	<form name="cancel" method="post">
		<div id="sample_wrap">
			<h1>[NEXT LEVEL]<span> KCP 카드즉시출금 결과</span></h1>
			<div class="sample">
				<p>
					요청 결과를 출력하는 페이지 입니다.<br/>
					요청이 정상적으로 처리된 경우 결과코드(res_cd)값이 0000으로 표시됩니다.
				</p>
				<%
				/* ============================================================================== */
				/* =	결제 결과 코드 및 메시지 출력(결과페이지에 반드시 출력해주시기 바랍니다.)						= */
				/* = -------------------------------------------------------------------------- = */
				/* =	결제 정상 : res_cd값이 0000으로 설정됩니다.										= */
				/* =	결제 실패 : res_cd값이 0000이외의 값으로 설정됩니다.								= */
				/* = -------------------------------------------------------------------------- = */
				%>
				<h2>&sdot; 처리 결과</h2>
				<table class="tbl" cellpadding="0" cellspacing="0">
					<!-- 결과 코드 -->
					<tr>
						<th>결과 코드</th>
						<td><%= res_cd %></td>
					</tr>
					<!-- 결과 메시지 -->
					<tr>
						<th>결과 메세지</th>
						<td><%= res_msg %></td>
					</tr>
					<%
					/* 처리 페이지(pp_cli_hub.jsp)에서 가맹점 DB처리 작업이 실패한 경우 상세메시지를 출력합니다. */
					if(!"".equals(res_msg_bsucc)) {
					%>
					<tr>
						<th>결과 상세 메세지</th>
						<td><%= res_msg_bsucc %></td>
					</tr>
					<%
					}
					%>
				</table>
				<%
				/* = -------------------------------------------------------------------------- = */
				/* =	결제 결과 코드 및 메시지 출력 끝													= */
				/* ============================================================================== */
				%>
				
				<%
				/* ============================================================================== */
				/* =	01. 결제 결과 출력															= */
				/* = -------------------------------------------------------------------------- = */
				if("pay".equals(req_tx)) {
					/* ============================================================================== */
					/* =	01-1. 업체 DB 처리 정상(bSucc값이 false가 아닌 경우)								= */
					/* = -------------------------------------------------------------------------- = */
					if(!"false".equals(bSucc)) {
						/* ============================================================================== */
						/* =	01-1-1. 정상 결제시 결제 결과 출력 ( res_cd값이 0000인 경우)							= */
						/* = -------------------------------------------------------------------------- = */
						if("0000".equals(res_cd)) {
				%>
				<h2>&sdot; 주문 정보</h2>
				<table class="tbl" cellpadding="0" cellspacing="0">
					<!-- 주문번호 -->
					<tr>
						<th>주문 번호</th>
						<td><%= ordr_idxx %></td>
					</tr>
					<!-- KCP 거래번호 -->
					<tr>
						<th>KCP 거래번호</th>
						<td><%= tno %></td>
					</tr>
					<!-- 결제금액 -->
					<tr>
						<th>결제 금액</th>
						<td><%= good_mny %>원</td>
					</tr>
					<!-- 상품명(good_name) -->
					<tr>
						<th>상 품 명</th>
						<td><%= good_name %></td>
					</tr>
					<!-- 주문자명 -->
					<tr>
						<th>주문자명</th>
						<td><%= buyr_name %></td>
					</tr>
					<!-- 주문자 전화번호 -->
					<tr>
						<th>주문자 전화번호</th>
						<td><%= buyr_tel1 %></td>
					</tr>
					<!-- 주문자 휴대폰번호 -->
					<tr>
						<th>주문자 휴대폰번호</th>
						<td><%= buyr_tel2 %></td>
					</tr>
					<!-- 주문자 E-mail -->
					<tr>
						<th>주문자 E-mail</th>
						<td><%= buyr_mail %></td>
					</tr>
				</table>
							<%
							/* ============================================================================== */
							/* =	신용카드 결제 결과 출력														= */
							/* = -------------------------------------------------------------------------- = */
							if(use_pay_method.equals("100000000000")) {
							%>
				<h2>&sdot; 신용카드 정보</h2>
				<table class="tbl" cellpadding="0" cellspacing="0">
					<!-- 결제수단 : 신용카드 -->
					<tr>
						<th>결제 수단</th>
						<td>신용 카드</td>
					</tr>
					<!-- 결제 카드 -->
					<tr>
						<th>결제 카드</th>
						<td><%= card_cd %> / <%= card_name %></td>
					</tr>
					<!-- 승인시간 -->
					<tr>
						<th>승인 시간</th>
						<td><%= app_time %></td>
					</tr>
					<!-- 승인번호 -->
					<tr>
						<th>승인 번호</th>
						<td><%= app_no %></td>
					</tr>
					<!-- 할부개월 -->
					<tr>
						<th>할부 개월</th>
						<td><%= quota %></td>
					</tr>
					<!-- 무이자 여부 -->
					<tr>
						<th>무이자 여부</th>
						<td><%= noinf %></td>
					</tr>
					<%
					/* ============================================================================== */
					/* =	신용카드 영수증 출력															= */
					/* = -------------------------------------------------------------------------- = */
					/* =	실제 거래건에 대해서 영수증을 출력할 수 있습니다.										= */
					/* = -------------------------------------------------------------------------- = */
					%>
					<tr>
						<th>영수증 확인</th>
						<td class="sub_content1">
							<a href="javascript:receiptView('<%=tno%>', '<%= ordr_idxx %>', '<%= amount %>')">
								<img src="./img/btn_receipt.png" alt="영수증을 확인합니다." />
							</a>
						</td>
					</tr>
				</table>
						<%
							}
						}
					}
					/* = -------------------------------------------------------------------------- = */
					/* =	01-1. 업체 DB 처리 정상 END													= */
					/* ============================================================================== */
				}
				/* = -------------------------------------------------------------------------- = */
				/* =	01. 결제 결과 출력 END														= */
				/* ============================================================================== */
				
				/* = -------------------------------------------------------------------------- = */
				/* =	02. 부분취소시 취소 결과 출력													= */
				/* ============================================================================== */
				if("mod".equals(req_tx)) {
					if("STPC".equals(mod_type)) {
						if("0000".equals(res_cd)) {
								%>
				<h2>&sdot; 부분취소 정보</h2>
				<table class="tbl" cellpadding="0" cellspacing="0">
					<!-- 총 금액 -->
					<tr>
						<th>총 금액</th>
						<td><%= amount %></td>
					</tr>
					<!-- 부분취소 요청금액 -->
					<tr>
						<th>부분취소 요청금액</th>
						<td><%= panc_mod_mny %></td>
					</tr>
					<!-- 부분취소 가능금액 -->
					<tr>
						<th>부분취소 가능금액</th>
						<td><%= panc_rem_mny %></td>
					</tr>
				</table>
						<%
						}
					}
				}
				/* = -------------------------------------------------------------------------- = */
				/* =	01-1-1. 정상 결제시 결제 결과 출력 END											= */
				/* ============================================================================== */
						%>
				<!-- 매입 요청/처음으로 이미지 버튼 -->
				<div class="btnset">
					<a href="javascript:window.close();" class="home">닫기</a>
				</div>
			</div>
			<div class="footer">
				Copyright (c) NHN KCP INC. All Rights reserved.
			</div>
		</div>
	</form>
</body>
</html>