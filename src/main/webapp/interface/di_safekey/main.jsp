<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page language="java" import="Kisinfo.Check.IPINClient" %>

<%
	/********************************************************************************************************************************************
	 * IPIN 인증 START 
	/********************************************************************************************************************************************/
	/********************************************************************************************************************************************
		NICE평가정보 Copyright(c) KOREA INFOMATION SERVICE INC. ALL RIGHTS RESERVED
		서비스명 : 가상주민번호서비스 (IPIN) 서비스
		페이지명 : 가상주민번호서비스 (IPIN) 호출 페이지
	*********************************************************************************************************************************************/
	String ipin_sSiteCode				= "L743";					// IPIN 서비스 사이트 코드		(NICE평가정보에서 발급한 사이트코드)
	String sSitePw						= "Qwer1234";			// IPIN 서비스 사이트 패스워드	(NICE평가정보에서 발급한 사이트패스워드)
	
	/*
	┌ sReturnURL 변수에 대한 설명  ─────────────────────────────────────────────────────
		NICE평가정보 팝업에서 인증받은 사용자 정보를 암호화하여 귀사로 리턴합니다.
		따라서 암호화된 결과 데이타를 리턴받으실 URL 정의해 주세요.
		* URL 은 http 부터 입력해 주셔야하며, 외부에서도 접속이 유효한 정보여야 합니다.
		* 당사에서 배포해드린 샘플페이지 중, ipin_process.jsp 페이지가 사용자 정보를 리턴받는 예제 페이지입니다.
		아래는 URL 예제이며, 귀사의 서비스 도메인과 서버에 업로드 된 샘플페이지 위치에 따라 경로를 설정하시기 바랍니다.
		예 - http://www.test.co.kr/ipin_process.jsp, https://www.test.co.kr/ipin_process.jsp, https://test.co.kr/ipin_process.jsp
	└────────────────────────────────────────────────────────────────────
	*/
	String sReturnURL				= "http://portal.tirerental.co.kr/interface/ipin/ipin_process.jsp";
	
	/*
	┌ sCPRequest 변수에 대한 설명  ─────────────────────────────────────────────────────
		[CP 요청번호]로 귀사에서 데이타를 임의로 정의하거나, 당사에서 배포된 모듈로 데이타를 생성할 수 있습니다.
		CP 요청번호는 인증 완료 후, 암호화된 결과 데이타에 함께 제공되며
		데이타 위변조 방지 및 특정 사용자가 요청한 것임을 확인하기 위한 목적으로 이용하실 수 있습니다.
		따라서 귀사의 프로세스에 응용하여 이용할 수 있는 데이타이기에, 필수값은 아닙니다.
	└────────────────────────────────────────────────────────────────────
	*/
	String sCPRequest				= "";
	
	// 객체 생성
	IPINClient pClient = new IPINClient();
	// 앞서 설명드린 바와같이, CP 요청번호는 배포된 모듈을 통해 아래와 같이 생성할 수 있습니다.
	sCPRequest = pClient.getRequestNO(ipin_sSiteCode);
	// CP 요청번호를 세션에 저장합니다.
	// 현재 예제로 저장한 세션은 ipin_result.jsp 페이지에서 데이타 위변조 방지를 위해 확인하기 위함입니다.
	// 필수사항은 아니며, 보안을 위한 권고사항입니다.
	session.setAttribute("CPREQUEST" , sCPRequest);
	
	// Method 결과값(iRtn)에 따라, 프로세스 진행여부를 파악합니다.
	int iRtn = pClient.fnRequest(ipin_sSiteCode, sSitePw, sCPRequest, sReturnURL);
	
	String sRtnMsg					= "";			// 처리결과 메세지
	String sEncData					= "";			// 암호화 된 데이타
	
	// Method 결과값에 따른 처리사항
	if (iRtn == 0) {
		// fnRequest 함수 처리시 업체정보를 암호화한 데이터를 추출합니다.
		// 추출된 암호화된 데이타는 당사 팝업 요청시, 함께 보내주셔야 합니다.
		sEncData = pClient.getCipherData();		//암호화 된 데이타
		sRtnMsg = "정상 처리되었습니다.";
	} else if (iRtn == -1 || iRtn == -2) {
		sRtnMsg =	"배포해 드린 서비스 모듈 중, 귀사 서버환경에 맞는 모듈을 이용해 주시기 바랍니다.<BR>" +
						"귀사 서버환경에 맞는 모듈이 없다면 ..<BR><B>iRtn 값, 서버 환경정보를 정확히 확인하여 메일로 요청해 주시기 바랍니다.</B>";
	}
	else if (iRtn == -9) {
		sRtnMsg = "입력값 오류 : fnRequest 함수 처리시, 필요한 4개의 파라미터값의 정보를 정확하게 입력해 주시기 바랍니다.";
	} else {
		sRtnMsg = "iRtn 값 확인 후, NICE평가정보 개발 담당자에게 문의해 주세요.";
	}
	/********************************************************************************************************************************************
	 * IPIN 인증 END 
	/********************************************************************************************************************************************/
	
	/********************************************************************************************************************************************
	 * 핸드폰  인증 START 
	/********************************************************************************************************************************************/
	NiceID.Check.CPClient niceCheck = new  NiceID.Check.CPClient();

	String sSiteCode 			= "G9177";							// NICE로부터 부여받은 사이트 코드
    String sSitePassword 		= "0S6ZT2AYXPFY";					// NICE로부터 부여받은 사이트 패스워드
    String sRequestNumber 	= "REQ0000000001";        		// 요청 번호, 이는 성공/실패후에 같은 값으로 되돌려주게 되므로 
    sRequestNumber = niceCheck.getRequestNO(sSiteCode);
  	
    System.out.println(sRequestNumber + "##################################");
    session.setAttribute("REQ_SEQ" , sRequestNumber);			// 해킹등의 방지를 위하여 세션을 쓴다면, 세션에 요청번호를 넣는다.
  	
   	String sAuthType = "";      										// 없으면 기본 선택화면, M: 핸드폰, C: 신용카드, X: 공인인증서
   	
   	String popgubun 	= "N";											// Y : 취소버튼 있음 / N : 취소버튼 없음
	String customize 	= "";											// 없으면 기본 웹페이지 / Mobile : 모바일페이지
		
    // CheckPlus(본인인증) 처리 후, 결과 데이타를 리턴 받기위해 다음예제와 같이 http부터 입력합니다.
    String sReturnUrl 	= "https://portal.tirerental.co.kr/interface/di_safekey/checkplus_success.jsp";      	// 성공시 이동될 URL
    String sErrorUrl 	= "https://portal.tirerental.co.kr/interface/di_safekey/checkplus_fail.jsp";          		// 실패시 이동될 URL

    // 입력될 plain 데이타를 만든다.
    String sPlainData = "7:REQ_SEQ" 			+ sRequestNumber.getBytes().length 	+ ":" + sRequestNumber +
                        	"8:SITECODE" 			+ sSiteCode.getBytes().length 				+ ":" + sSiteCode +
                       		"9:AUTH_TYPE" 			+ sAuthType.getBytes().length 			+ ":" + sAuthType +
                        	"7:RTN_URL" 				+ sReturnUrl.getBytes().length 			+ ":" + sReturnUrl +
                        	"7:ERR_URL" 				+ sErrorUrl.getBytes().length 				+ ":" + sErrorUrl +
                        	"11:POPUP_GUBUN" 	+ popgubun.getBytes().length 			+ ":" + popgubun +
                        	"9:CUSTOMIZE" 			+ customize.getBytes().length 			+ ":" + customize;
    
    String sMessage = "";
    String disEncData = "";
    
    int iReturn = niceCheck.fnEncode(sSiteCode, sSitePassword, sPlainData);
    if( iReturn == 0 )
    {
    	disEncData = niceCheck.getCipherData();
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
	<title>NICE평가정보 가상주민번호 서비스</title>
	<script type="text/javascript" src="https://portal.tirerental.co.kr/interface/di_safekey/WebIF.js"></script>
	<script language='javascript'>
	var xpCallBackObj; //WebBrowser 로부터 결과를 전달받을 오브젝트 (XPLATFORM Form)
	var xpCallBackFn;
	function setCallback(obj, name) {
		window.NEXACROHTML.Init();
	};
	
	function submitContents() {
		// 에디터의 내용에 대한 값 검증은 이곳에서
		var objElement = document.getElementById("di");
		//var objElement2 = document.getElementById("ci");
		try {
			window.NEXACROHTML.FireUserNotify(objElement.value);
			//window.NEXACROHTML.FireUserNotify(objElement2.value);

		} catch (e) {
			alert(e + "error");
		}
	};
	
	
	window.name ="Parent_window";
	
	function fnPopup(){
		
		window.open('', 'popupIPIN2', 'width=450, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
		document.form_ipin.target = "popupIPIN2";
		document.form_ipin.action = "https://cert.vno.co.kr/ipin.cb";
		document.form_ipin.submit();
	}
	
	function diFnPopup(){
		window.open('', 'popupChk', 'width=500, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
		document.form_chk.action = "https://nice.checkplus.co.kr/CheckPlusSafeModel/checkplus.cb";
		document.form_chk.target = "popupChk";
		document.form_chk.submit();
	}
	

	</script>
</head>

<body onload="setCallback();">
	<input type="hidden" id="inputText1" value="NEXACRO"></input>
	<input type="button" id="btnTest1" value="HTML5값전달" onClick="submitContents()"></input>
	<!-- IPIN 초기설정 결과 Start -->
	iRtn : <%= iRtn %> - <%= sRtnMsg %>
	업체정보 암호화 데이타 : [<%= sEncData %>]
	<!-- 핸드폰 초기설정 결과 -->
	<%= sMessage %>
	업체정보 암호화 데이타 : [<%= disEncData %>]

	<!-- IPIN 본인인증 서비스 Start -->
	<!-- 가상주민번호 서비스 팝업을 호출하기 위해서는 다음과 같은 form이 필요합니다. -->
	<form name="form_ipin" method="post">
		<input type="hidden" name="m" value="pubmain">						<!-- 필수 데이타로, 누락하시면 안됩니다. -->
	    <input type="hidden"  id="enc_data" name="enc_data" value="<%= sEncData %>">		<!-- 위에서 업체정보를 암호화 한 데이타입니다. -->
	    <!-- 업체에서 응답받기 원하는 데이타를 설정하기 위해 사용할 수 있으며, 인증결과 응답시 해당 값을 그대로 송신합니다.
	    	 해당 파라미터는 추가하실 수 없습니다. -->
	    <input type="hidden" name="param_r1" value="">
	    <input type="hidden" name="param_r2" value="">
	    <input type="hidden" name="param_r3" value="">
	    <a href="javascript:fnPopup();"><img src="https://image.creditbank.co.kr/static/img/vno/new_img/bt_17.gif"  id="fn_popup" width=218 height=40 border=0 onclick="fnPopup();"></a>
	</form>

	<!-- 가상주민번호 서비스 팝업 페이지에서 사용자가 인증을 받으면 암호화된 사용자 정보는 해당 팝업창으로 받게됩니다.
		  따라서 부모 페이지로 이동하기 위해서는 다음과 같은 form이 필요합니다. -->
	<form name="vnoform"  id="vnoform" method="post">
		<input type="hidden" name="enc_data">								<!-- 인증받은 사용자 정보 암호화 데이타입니다. -->
		<!-- 업체에서 응답받기 원하는 데이타를 설정하기 위해 사용할 수 있으며, 인증결과 응답시 해당 값을 그대로 송신합니다.
	    	 해당 파라미터는 추가하실 수 없습니다. -->
	    <input type="hidden" name="param_r1" value="">
	    <input type="hidden" name="param_r2" value="">
	    <input type="hidden" name="param_r3" value="">
	</form>
	<!-- IPIN 본인인증 서비스 End -->
	
	
	
	<!-- 핸드폰 본인인증서비스 Start -->
	<!-- 본인인증 서비스 팝업을 호출하기 위해서는 다음과 같은 form이 필요합니다. -->
	<form name="form_chk" method="post">
		<input type="hidden" name="m" value="checkplusSerivce">						<!-- 필수 데이타로, 누락하시면 안됩니다. -->
		<input type="hidden" name="EncodeData" value="<%= disEncData %>">		<!-- 위에서 업체정보를 암호화 한 데이타입니다. -->
	    
	    <!-- 업체에서 응답받기 원하는 데이타를 설정하기 위해 사용할 수 있으며, 인증결과 응답시 해당 값을 그대로 송신합니다.
	    	 해당 파라미터는 추가하실 수 없습니다. -->
		<input type="hidden" name="param_r1" value="">
		<input type="hidden" name="param_r2" value="">
		<input type="hidden" name="param_r3" value="">
	    
		<a href="javascript:diFnPopup();"><img src="https://image.creditbank.co.kr/static/img/vno/new_img/bt_17.gif"  id="di_fn_popup" width=218 height=40 border=0 onclick="diFnPopup();"></a>
	</form>
	<!-- 핸드폰 본인인증서비스 End -->
	<input type="hidden" id="di" 			value=""  name="di" />
	<input type="hidden" id="ci" 			value=""  name="ci" />
	<input type="hidden" id="sName" 		value=""  name="sName" />
	<input type="hidden" id="sBirthDate" 	value=""  name="sBirthDate" />
	<input type="hidden" id="sGender" 		value=""  name="sGender" />
	<input type="hidden" id="sNationalInfo" value=""  name="sNationalInfo" />
</body>
</html>