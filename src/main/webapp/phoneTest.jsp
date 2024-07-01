<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="CheckPlus.kisinfo.*" %>
 <html>
 <head>
 <title>JarInfo</title>
 <style>
 * { font-family: Verdana }
 </style>
 </head>
 <body>
 <pre>
 <%
	String sSiteCode	= "BC980";		// 사이트 코드 (NICE평가정보에서 발급한 사이트코드)
	String sSitePw		= "jIyNtDmpIv0y"; 	// 사이트 패스워드 (NICE평가정보에서 발급한 사이트패스워드)
				
	String sJumin			= "0000000000000";		// 주민등록번호 체크안함
	String sMobileCo	= "1";		// 이통사 구분 없음
	String sMobileNo	= "01026569142";		// 휴대폰 번호
	
	/*
	┌ sCPRequest 변수에 대한 설명  ─────────────────────────────────────────────────────
		[CP 요청번호]로 귀사에서 데이타를 임의로 정의하시면 됩니다.
		
		CP 요청번호는 인증 완료 후, 결과 데이타에 함께 제공되며
		데이타 위변조 방지 및 특정 사용자가 요청한 것임을 확인하기 위한 목적으로 이용하실 수 있습니다.
		
		따라서 귀사의 프로세스에 응용하여 이용할 수 있는 데이타이기에, 필수값은 아닙니다.
	└────────────────────────────────────────────────────────────────────
	*/
	String sCPRequest		= "";
	
	
	
	// 객체 생성
	SCheckPlus cpMobile = new SCheckPlus();
	
	// Method 결과값(iRtn)에 따라, 프로세스 진행여부를 파악합니다.
	int iRtn = cpMobile.fnRequestSMSAuth(sSiteCode, sSitePw, sJumin, "", sMobileCo, sMobileNo, sCPRequest);
	
	// Method 결과값에 따른 처리사항
	if (iRtn == 0)
	{
		/*
			- 응답코드에 따라 SMS 인증 여부를 판단합니다.
			
			- 응답코드 정의 : 첨부해드린 xls 파일을 참고하세요.
		*/
		out.println("RETURN_CODE=" + cpMobile.getReturnCode());              // 응답코드
		out.println("REQ_SEQ=" + cpMobile.getRequestSEQ());                  // 요청 고유번호
		out.println("RES_SEQ=" + cpMobile.getResponseSEQ());                 // 응답 고유번호
 }
 else if (iRtn == -7 || iRtn == -8)
 {
 	out.println("서버 네트웍크 및 방확벽 관련하여 아래 IP와 Port를 오픈해 주셔야 이용 가능합니다.");
 	out.println("IP : 203.234.219.235 / Port : 3700 ~ 3715");
	}
	else if (iRtn == -9 || iRtn == -10)
	{
		out.println("입력값 오류 : fnRequest 함수 처리시, 필요한 6개의 파라미터값의 정보를 정확하게 입력해 주시기 바랍니다.");
	}
	else
	{
		out.println("iRtn 값 확인 후, NICE신용평가정보 개발 담당자에게 문의해 주세요.");
	}
 %>
 </pre>
 </body>
 </html>