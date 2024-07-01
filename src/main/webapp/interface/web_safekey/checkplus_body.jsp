<%@ page language="java" contentType="text/html; charset=euc-kr"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<html>
<head>
<title>넥센타이어 [본인인증서비스]</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
	<script type="text/javascript">
	//document.domain = "localhost";
	
	window.name="Parent_window";
	
	function safekeyOpen() {
		var frm = document.myform;
		
		var kunnr 		= frm.kunnr.value;
		var username 	= frm.username.value; 		
		/* username			= encodeURI(encodeURIComponent(username));
		frm.username.value = username; */
		var birthdate 	= frm.birthdate.value;
		var mobileno 	= frm.mobileno.value; 
		var email 		= frm.email.value; 
		
		var gender 		= frm.gender.value; 
		var args   = "";
		//args += "?kunnr=" + kunnr + "&username=" + username + "&birthdate=" + birthdate + "&mobileno=" + mobileno + "&email=" + email + "&gender=" + gender; 
		//alert(args);
		window.open('', 'popupChk', 'width=500, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
//		frm.action = "http://localhost/interface/web_safekey/checkplus_form.jsp";
		frm.action = "https://portal.tirerental.co.kr/interface/web_safekey/checkplus_send_main.jsp";
		frm.target = "popupChk";
		frm.submit();
		

		
	}
	
	function setSafeKey() {
		alert('1');
	}
		
		//--------------------------------------------------------------------------------------------------------------------------------		
	</script>

</head>
<body   leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
	
<form name="myform" id="myfrom" method="post">
	<input type="hidden" name="kunnr"  	 	id="kunnr"  		value="">
	<input type="hidden" name="username"  	id="username"  		value="">
	<input type="hidden" name="birthdate"  	id="birthdate"  	value="">
	<input type="hidden" name="gender"  	id="gender"  		value="">
	<input type="hidden" name="mobileno" 	id="mobileno"  		value="">	
	<input type="hidden" name="email" 		id="email" 			value="">		
	<input type="hidden" name="sendgubun" 	id="sendgubun" 		value="">		
</form>
<a href="#"><img src="https://image.creditbank.co.kr/static/img/vno/new_img/bt_17.gif"  id="safe_fn_popup" width=218 height=40 border=0 onclick="safekeyOpen();"></a>
</body>
</html>