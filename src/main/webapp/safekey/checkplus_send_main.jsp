<%@ page language="java" contentType="text/html;charset=euc-kr" %>
<%@ page import="java.net.URLEncoder" %>
<%
	request.setCharacterEncoding("euc-kr");
	NiceID.Check.CPClient niceCheck = new  NiceID.Check.CPClient();
	

	// NICE 받은 사이트 코드,패스워드
	String sSiteCode 		= "0070168";							// NICE로부터 부여받은 사이트 코드
	String sSitePassword 	= "ZR5YS19XWOEX";				// NICE로부터 부여받은 사이트 패스워드
	
	
	/*
		요청번호 생성
		요청번호는 안심키인증이 끝난 후 성공/실패 결과값에 포함하여 전송됩니다.
	*/
	String sRequestNumber 	= "";
	sRequestNumber 			= "REQ0000000001";							// 모듈 대신 임의값을 업체에서 생성하여 사용가능
	sRequestNumber 			= niceCheck.getRequestNO(sSiteCode);		// 모듈을 통한 생성	
	session.setAttribute("REQ_SEQ" , sRequestNumber);						// 해킹등의 방지를 위하여 세션을 쓴다면, 세션에 요청번호를 넣는다.
	
	/*
		요청일시 생성 yyyyMMddHHmmss		
	*/
	java.util.Calendar cal = java.util.Calendar.getInstance();
	java.text.SimpleDateFormat df = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
	String req_datetime  = df.format(cal.getTime());
		
	/*
		값은 총 3자리로 첫번째자리는 휴대폰인증사용여부, 두번째자리는 신용카드인증사용여부, 세번째자리는 공인인증서인증사용여부를 입력합니다.
		값은 반드시 3자리로 입력해 주셔야 됩니다.
		사용인 경우는 1,미사용인 경우는 0으로 표기합니다.
		예) 휴대폰인증사용,신용카드인증미사용,공인인증서인증사용 인 경우 
		    sAuthType = "101";
	*/
	String sAuthType = "101";

	/*
		생년월일 정보로 8자리로 입력합니다.(년 4자리, 월 2자리, 일 2자리)
		예) 생년월일이 '9999년 1월 20일' 인 경우
		    birthdate = "99990120";
	*/
	//String birthdate = "99990120";
	String birthdate = request.getParameter("birthdate");
	System.out.println("[]" + birthdate + "] 생년월일");
	/*
		성별정보 남자는 1, 여자는 0으로 입력합니다.
		예) '남자' 인 경우
		    gender = "1";
	*/
	String gender = request.getParameter("gender");
	System.out.println("[" + gender + "] 성별");
	/*
		안심키 대상에 성명을 적어주시면 됩니다.
		예) 이름이 '홍길동' 인 경우
		    username = "홍길동";
	*/
	String username = request.getParameter("username") == null ? "" : URLEncoder.encode(request.getParameter("username"), "euc-kr");
	System.out.println("[" + username + "] 이름");
	

	/*
		동의문에 대한 사용여부를 결정하는 코드입니다.		
		동의문종류 
		- 신용인증송부 서비스 신청 동의
		
		예) 신용인증송부 서비스 신청 동의를 원하는 경우 
			agree1_map = "1000000000";
			신용인증송부 서비스 신청 동의 원하지 않을 경우
			agree1_map = "0000000000";
	*/
	String agree1_map = "0000000000"; // 신용인증송부 서비스 신청 동의
	
	/*
		동의문에 대한 사용여부를 결정하는 코드입니다.
		업체에서 사전에 등록한 동의문정보를 기준으로 작성해주시면됩니다.
		동의문종류 		
		- 업체 필수 동의 (업체에서 제공하는 필수 동의문)
		- 업체 선택 동의 (업체에서 제공하는 선택 동의문)
		각 동의문은 최대 10개까지 등록이 가능합니다.
		입력 값은 등록하신 동의문이 없어도 반드시 10자리 입력해 주셔야 됩니다.
		사용여부는 사용인 경우 1, 미사용인 경우 0로 표기합니다.
		예) 등록된 동의문 중 동의문 중 1,3,5,6,번째 동의문만 사용하고 싶은 경우
			agree2_map = "1010110000";
			동록뢴 동의문이 없는 경우
			agree3_map = "0000000000";
	*/
	String agree2_map = "0000000000"; // 업체 필수 동의문
	String agree3_map = "0000000000"; // 업체 선택 동의문
	
	/*
		결과로 CI값을 결과값으로 받을지를 결정
		Y : CI를 결과값으로 받음, N : CI를 결과값으로 받지 않음
		
		CI는 본인확인을 정상적으로 성공한 경우만 받을 수 있습니다.
	*/
	String cigubun 	= "N";
	
	/*
		발송 수단 구분(값이 없는 경우 기본 SMS발송)
		sendgubun = "SMS";
		sendgubun = "EMAIL";
	*/
	String sendgubun 	= request.getParameter("sendgubun");
	System.out.println("[" + sendgubun + "] 전송구분");

	/*
		안심키에 대한 모바일 인증정보를 보낼 휴대폰번호 
		sendgubun값이 SMS이거나 없는 경우 필수
		예) mobileno ="01000000000";
	*/
	String mobileno = request.getParameter("mobileno");
	System.out.println("[" + mobileno + "] 핸드폰번호");

	/*
		안심키에 대한 모바일 인증정보를 보낼 이메일주소
		sendgubun값이 EMAIL인 경우 필수
		예) email ="이메일아이디@이메일도메인";
		미구현 상태입니다.
	*/
	String email 	= request.getParameter("email");
	System.out.println("[" + email + "] 이메일주소");

		/*
		팝업창을 구분하는 입력값으로 제공되는 페이지에 취소버튼 즉 팝업창을 닫는 버튼이 없어집니다.
		Y : 취소버튼 있음, N : 취소버튼 없음
	*/
	String popgubun 	= "N";
	
	/*
		안심키에 대한 모바일 인증 연결정보를 전달에 대한 결과 페이지
	*/
	//String sSendResultUrl = "http://www.test.co.kr/checkplus_send_result.jsp";
	
	String sSendResultUrl = "/safekey/checkplus_send_result.jsp";
	
	/*
		안심키 결과 데이타를 리턴 받기위해 다음예제와 같이 http부터 입력합니다.
		받을 page는 https://~, http://~ 부터 입력해 주시기 바랍니다.
		부모창에 페이지와 결과페이지에 도메인은 반드시 일치하도록 입력해 주시기 바랍니다.
	*/
	String sReturnUrl = "/safekey/checkplus_success.jsp";      // 성공시 이동될 URL
	String sErrorUrl   = "/safekey/checkplus_fail.jsp";          	// 실패시 이동될 URL

	// 입력될 plain 데이타를 만든다.
	String sPlainData =	"7:REQ_SEQ" 		+ sRequestNumber.getBytes().length 	+ ":" + sRequestNumber +  
						"12:REQ_DATETIME" 	+ req_datetime.getBytes().length 			+ ":" + req_datetime +
						"8:SITECODE" 			+ sSiteCode.getBytes().length 				+ ":" + sSiteCode +
						"9:AUTH_TYPE" 			+ sAuthType.getBytes().length 			+ ":" + sAuthType +
						"10:AGREE1_MAP"  		+ agree1_map.getBytes().length 			+ ":" + agree1_map +
						"10:AGREE2_MAP"  		+ agree2_map.getBytes().length 			+ ":" + agree2_map +
						"10:AGREE3_MAP" 		+ agree3_map.getBytes().length 			+ ":" + agree3_map +
						"8:USERNAME"  			+ username.getBytes().length 			+ ":" + username +
						"9:BIRTHDATE"  			+ birthdate.getBytes().length 				+ ":" + birthdate +
						"6:GENDER"  			+ gender.getBytes().length 				+ ":" + gender +
						"8:CI_GUBUN" 			+ cigubun.getBytes().length 				+ ":" + cigubun +
						"11:POPUP_GUBUN" 	+ popgubun.getBytes().length 			+ ":" + popgubun +
						"7:RTN_URL" 				+ sReturnUrl.getBytes().length 			+ ":" + sReturnUrl +
						"7:ERR_URL" 				+ sErrorUrl.getBytes().length 				+ ":" + sErrorUrl +
						"10:SEND_GUBUN" 		+ sendgubun.getBytes().length 			+ ":" + sendgubun +
						"8:MOBILENO" 			+ mobileno.getBytes().length 				+ ":" + mobileno +
						"5:EMAIL" 				+ email.getBytes().length 					+ ":" + email +
						"15:SEND_RESULT_URL"+ sSendResultUrl.getBytes().length	 	+ ":" + sSendResultUrl;

	String sMessage = "";
	String sEncData = "";

	int iReturn = niceCheck.fnEncode(sSiteCode, sSitePassword, sPlainData);
	if( iReturn == 0 )
	{
		sEncData = niceCheck.getCipherData();
	}
	else if( iReturn == -1)
	{
		sMessage = "암호화 시스템 에러입니다.";
	}
		else if( iReturn == -2)
	{
		sMessage = "암호화 처리오류입니다.";
	}
	else if( iReturn == -3)
	{
		sMessage = "암호화 데이터 오류입니다.";
	}
		else if( iReturn == -9)
	{
		sMessage = "입력 데이터 오류입니다.";
	}
	else
	{
		sMessage = "알수 없는 에러 입니다. iReturn : " + iReturn;
	}
%>

<html>
<head>
<title>NICE신용평가정보 - CheckPlus 안심본인인증 테스트</title>

<script language='javascript'>
window.name ="Parent_window";

function fnPopup(){
window.open('', 'popupChk', 'width=500, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
document.form_chk.action = "https://nice.checkplus.co.kr/CheckPlusSafekeyModel/checkplus.cb";
document.form_chk.target = "popupChk";
document.form_chk.submit();
window.close();
}
</script>
</head>
<body onload="fnPopup();">
<!-- 안심키 서비스 팝업을 호출하기 위해서는 다음과 같은 form이 필요합니다. -->
<form name="form_chk" method="post">
<!-- <input type="hidden" name="m" value="safekeySendService"> -->						<!-- 필수 데이타로, 누락하시면 안됩니다. -->
<input type="hidden" name="m" value="safekeyService">						<!-- 필수 데이타로, 누락하시면 안됩니다. -->
<input type="hidden" name="EncodeData" value="<%= sEncData %>">		<!-- 위에서 업체정보를 암호화 한 데이타입니다. -->

<!-- 업체에서 응답받기 원하는 데이타를 설정하기 위해 사용할 수 있으며, 인증결과 응답시 해당 값을 그대로 송신합니다.
	    	 해당 파라미터는 추가하실 수 없습니다. -->
<input type="hidden" name="param_r1" value="">
<input type="hidden" name="param_r2" value="">
<input type="hidden" name="param_r3" value="">

</form>
</body>
</html>
