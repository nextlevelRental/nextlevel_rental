<%@ page language="java" contentType="text/html;charset=euc-kr" %>
<%
    NiceID.Check.CPClient niceCheck = new  NiceID.Check.CPClient();
    String sEncodeData = requestReplace(request.getParameter("EncodeData"), "encodeData");
    String sReserved1  = requestReplace(request.getParameter("param_r1"), "");
    String sReserved2  = requestReplace(request.getParameter("param_r2"), "");
    String sReserved3  = requestReplace(request.getParameter("param_r3"), "");
    String sSiteCode 		= "0023586";				// NICE로부터 부여받은 사이트 코드
    String sSitePassword 	= "2U81V4C0ZRH0";			// NICE로부터 부여받은 사이트 패스워드
    String sCipherTime 		= "";			// 복호화한 시간
    String sRequestNumber 	= "";			// 요청 번호
    String sAuthType 		= "";			// 본인인증 수단
    String sReturnCode 		= "";			// 결과코드
    String sReturnMsg 		= "";			// 결과 메시지
    String sRequestTime 	= "";			// 요청시간
    String sMessage 		= "";
    String sPlainData 		= "";
    String session_sRequestNumber = "";

    int iReturn = niceCheck.fnDecode(sSiteCode, sSitePassword, sEncodeData);
    if( iReturn == 0 ) {
        sPlainData = niceCheck.getPlainData();
        sCipherTime = niceCheck.getCipherDateTime();
        // 데이타를 추출합니다.
        java.util.HashMap mapresult = niceCheck.fnParse(sPlainData);
        
        //아래는 실제 데이타를 가져 오는 부분이다.
        sRequestNumber = (String)mapresult.get("REQ_SEQ");
        sReturnCode = (String)mapresult.get("RETURN_CODE");
        sReturnMsg = (String)mapresult.get("RETURN_MSG");
        sRequestTime = (String)mapresult.get("REQ_DATETIME");      
        sAuthType = (String)mapresult.get("AUTH_TYPE");
        session_sRequestNumber = (String)session.getAttribute("REQ_SEQ");
        if(!sRequestNumber.equals(session_sRequestNumber)) {
            sMessage = "세션값이 다릅니다. 올바른 경로로 접근하시기 바랍니다.";
            sAuthType = "";
        }
    }
    else if( iReturn == -1)
    {
        sMessage = "복호화 시스템 에러입니다.";
    }    
    else if( iReturn == -4)
    {
        sMessage = "복호화 처리오류입니다.";
    }    
    else if( iReturn == -5)
    {
        sMessage = "복호화 해쉬 오류입니다.";
    }    
    else if( iReturn == -6)
    {
        sMessage = "복호화 데이터 오류입니다.";
    }    
    else if( iReturn == -9)
    {
        sMessage = "입력 데이터 오류입니다.";
    }    
    else if( iReturn == -12)
    {
        sMessage = "사이트 패스워드 오류입니다.";
    }    
    else
    {
        sMessage = "알수 없는 에러 입니다. iReturn : " + iReturn;
    }

%>
<%!
public static String requestReplace (String paramValue, String gubun) {
        String result = "";
        
        if (paramValue != null) {
        	
        	paramValue = paramValue.replaceAll("<", "&lt;").replaceAll(">", "&gt;");

        	paramValue = paramValue.replaceAll("\\*", "");
        	paramValue = paramValue.replaceAll("\\?", "");
        	paramValue = paramValue.replaceAll("\\[", "");
        	paramValue = paramValue.replaceAll("\\{", "");
        	paramValue = paramValue.replaceAll("\\(", "");
        	paramValue = paramValue.replaceAll("\\)", "");
        	paramValue = paramValue.replaceAll("\\^", "");
        	paramValue = paramValue.replaceAll("\\$", "");
        	paramValue = paramValue.replaceAll("'", "");
        	paramValue = paramValue.replaceAll("@", "");
        	paramValue = paramValue.replaceAll("%", "");
        	paramValue = paramValue.replaceAll(";", "");
        	paramValue = paramValue.replaceAll(":", "");
        	paramValue = paramValue.replaceAll("-", "");
        	paramValue = paramValue.replaceAll("#", "");
        	paramValue = paramValue.replaceAll("--", "");
        	paramValue = paramValue.replaceAll("-", "");
        	paramValue = paramValue.replaceAll(",", "");
        	
        	if(gubun != "encodeData"){
        		paramValue = paramValue.replaceAll("\\+", "");
        		paramValue = paramValue.replaceAll("/", "");
            paramValue = paramValue.replaceAll("=", "");
        	}
        	
        	result = paramValue;
            
        }
        return result;
  }
%>
<html>
<head>
    <title>NICE신용평가정보 - 안심키 테스트</title>
</head>
<script language="javascript">

	function setSafeKey() {
		//typeof top.opener.opener;
		//alert(top.opener.document);
		//window.opener.document;
	}
</script>
<body>
    <center>
    <p><p><p><p>
    안심키 인증 결과<br>
    <table border=1>
        <tr>
            <td>복호화한 시간</td>
            <td><%= sCipherTime %> (YYMMDDHHMMSS)</td>
        </tr>
        <tr>
            <td>요청 번호</td>
            <td><%= sRequestNumber %></td>
        </tr>
				<tr>
            <td>요청 번호(session)</td>
            <td><%= session_sRequestNumber %></td>
        </tr>
        <tr>
            <td>결과코드</td>
            <td><%= sReturnCode %></td>
        </tr> 
        <tr>
            <td>결과메세지</td>
            <td><%= sReturnCode %></td>
        </tr>
        <tr>
            <td>인증수단</td>
            <td><%= sAuthType %></td>
        </tr>  
        <tr>
            <td>RESERVED1</td>
            <td><%= sReserved1 %></td>
        </tr>
        <tr>
            <td>RESERVED2</td>
            <td><%= sReserved2 %></td>
        </tr>
        <tr>
            <td>RESERVED3</td>
            <td><%= sReserved3 %></td>
        </tr>
    </table><br>
    <input type="button" id="saveNewSafekey"  value="결과저장" name="saveNewSafekey" onclick="setSafeKey();">
    <br>        
    <%= sMessage %><br>
    </center>
</body>

</html>