<%@ page contentType="text/html;charset=euc-kr" %>

<%
/* ============================================================================== */
/* =	PAGE : 취소 요청 PAGE														= */
/* = -------------------------------------------------------------------------- = */
/* =	아래의 ※ 주의 ※ 부분을 꼭 참고하시여 연동을 진행하시기 바랍니다.							= */
/* = -------------------------------------------------------------------------- = */
/* =	연동시 오류가 발생하는 경우 아래의 주소로 접속하셔서 확인하시기 바랍니다.						= */
/* =	접속 주소 : http://kcp.co.kr/technique.requestcode.do						= */
/* = -------------------------------------------------------------------------- = */
/* =	Copyright (c)  2016  NHN KCP Inc.   All Rights Reserverd.				= */
/* ============================================================================== */
%>
<%@ include file = "./../cfg/site_conf_inc.jsp"%>
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
/* =	01. 취소 요청 정보 설정														= */
/* = -------------------------------------------------------------------------- = */
String mod_type	= f_get_parm(request.getParameter("mod_type"));	/* 요청구분		*/
String tno		= f_get_parm(request.getParameter("tno"));		/* KCP 거래번호	*/
String mod_desc	= f_get_parm(request.getParameter("mod_desc"));	/* 변경사유		*/
String mod_mny	= f_get_parm(request.getParameter("mod_mny"));	/* 취소요청금액		*/
String rem_mny	= f_get_parm(request.getParameter("rem_mny"));	/* 취소가능잔액		*/
/* ============================================================================== */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<title>*** NHN KCP [AX-HUB Version] ***</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<link href="css/style.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript">
/* 취소 버튼을 눌렀을 때 호출 */
function jsf__go_cancel(form) {
	var RetVal = false ;
	
	if(document.getElementById("mod_type").value != "" && document.getElementById("mod_type").value != null) {
// 		if(form.tno.value.length < 14) {
// 			alert("KCP 거래 번호를 입력하세요");
// 			form.tno.focus();
// 			form.tno.select();
// 		} else {
			RetVal = true;
// 		}
	} else {
		alert("거래 구분을 선택하여 주십시요.");
		form.mod_type.focus();
	}
	
	return RetVal;
}
</script>
<body>
	<div id="sample_wrap">
		<%
		/* ============================================================================== */
		/* =	1. 취소 요청 정보 입력 폼(cancel_info)											= */
		/* = -------------------------------------------------------------------------- = */
		/* =	취소 요청에 필요한 정보를 설정합니다.												= */
		/* = -------------------------------------------------------------------------- = */
		%>
		<form name="cancel_info" action="pp_cli_hub.jsp" method="post">
			<!-- 타이틀 Start-->
			<h1>[취소요청] <span>이 페이지는 결제건에 대해 취소를 요청하는 샘플(예시) 페이지입니다.</span></h1>
			<!-- 타이틀 End -->
			
			<!-- 본문 Start -->
			<div class="sample">
				<!-- 상단 테이블 Start -->
				<p>
					소스 수정 시 소스 안에 <span>※ 주의 ※</span> 표시가 포함된 문장은 가맹점의 상황에 맞게 적절히 수정 <br/>
					적용하시길 바랍니다.<br/>
					<span>이 페이지는 결제된 건에 대한 취소를 요청하는 페이지 입니다.</span><br/>
					결제가 승인되면 결과값으로 KCP 거래번호(tno)값을 받으실 수 있습니다.<br/>
					가맹점에서는 KCP 거래번호(tno)값으로 취소요청을 하실 수 있습니다.
				</p>
				<!-- 상단 테이블 End -->
				
				<!-- 취소 요청 정보 입력 테이블 Start -->
				<h2>&sdot; 취소 요청</h2>
				<table class="tbl" cellpadding="0" cellspacing="0">
					<!-- 요청 구분 : 취소 -->
					<tr>
						<th>요청 구분</th>
						<td>
							<input type="hidden" name="mod_type" id="mod_type" value="<%= mod_type %>"/>
							<select name="mod_type" onChange="jsf__chk_mod_type()" disabled>
								<option value="mod_type_not_sel">선택하십시오</option>
								<%
								if("STSC".equals(mod_type)) {
								%>
								<option value="STSC" selected>전체취소</option>
								<option value="STPC">부분취소</option>
								<%
								} else if("STPC".equals(mod_type)) {
								%>
								<option value="STSC">전체취소</option>
								<option value="STPC" selected>부분취소</option>
								<%
								}
								%>
							</select>
						</td>
					</tr>
					<!-- Input : 결제된 건의 거래번호(14 byte) 입력 -->
					<tr>
						<th>KCP 거래번호</th>
						<td><input type="text" name="tno" value="<%= tno %>" class="w200" maxlength="14" readonly/></td>
					</tr>
					<!-- Input : 변경 사유(mod_desc) 입력 -->
					<tr>
						<th>변경 사유</th>
						<td><input type="text" name="mod_desc" value="<%= mod_desc %>" class="w200" maxlength="50" readonly/></td>
					</tr>
					<!-- Input : 취소 요청 금액(mod_mny) 입력 -->
					<tr>
						<th>취소 요청 금액<br/>(부분취소시 사용)</th>
						<td><input type="text" name="mod_mny" value="<%= mod_mny %>" class="w200" size="20" maxlength="14" readonly/></td>
					</tr>
					<!-- Input : 취소 가능 금액(rem_mny) 입력 -->
					<tr>
						<th>취소 가능 잔액<br/>(부분취소시 사용)</th>
						<td><input type="text" name="rem_mny" value="<%= rem_mny %>" class="w200" size="20" maxlength="14" readonly/></td>
					</tr>
				</table>
				<!-- 취소 요청 정보 입력 테이블 End -->
				
				<!-- 결제 버튼 테이블 Start -->
				<div class="btnset">
					<input name="" type="submit" class="submit" value="취소요청" onclick="return jsf__go_cancel(this.form);"/>
					<a href="#" class="home" onclick="javascript:window.close()">처음으로</a>
				</div>
				<!-- 결제 버튼 테이블 End -->
			</div>
			<!-- 본문 End -->
			<div class="footer">
				Copyright (c) NHN KCP INC. All Rights reserved.
			</div>
			<%
			/* ============================================================================== */
			/* =	1-1. 취소 요청 필수 정보 설정													= */
			/* = -------------------------------------------------------------------------- = */
			/* =	※ 필수 - 반드시 필요한 정보입니다.												= */
			/* = -------------------------------------------------------------------------- = */
			%>
			<input type="hidden" name="req_tx" value="mod" />
		</form>
		<%
		/* = -------------------------------------------------------------------------- = */
		/* =	1. 취소 요청 정보 END														= */
		/* ============================================================================== */
		%>
	</div>
</body>
</html>