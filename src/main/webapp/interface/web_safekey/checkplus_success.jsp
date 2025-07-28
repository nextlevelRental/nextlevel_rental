<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ page import="java.net.URLDecoder" %>
<%
	//request.setCharacterEncoding("euc-kr");

    NiceID.Check.CPClient niceCheck = new  NiceID.Check.CPClient();

    String sEncodeData = requestReplace(request.getParameter("EncodeData"), "encodeData");
    //String sReserved1  = requestReplace(request.getParameter("param_r1"), "");
    String sReserved1  = request.getParameter("param_r1");
    String sReserved2  = requestReplace(request.getParameter("param_r2"), "");
   // String sReserved3  = requestReplace(request.getParameter("param_r3"), "");
    
    String sReserved3  = request.getParameter("param_r3");

    String arrydata[]	= sReserved3.split("-"); 
    String nBirthDay	= arrydata[0];
    String nGender		= arrydata[1] == null ? "" : arrydata[1]; 
    
		if(!"".equals(nGender)  ||  nGender != null) {
			if("0".equals(nGender)) {
				nGender = "2";
			}
		}
       

    String sSiteCode = "0023586";				// NICE로부터 부여받은 사이트 코드
    String sSitePassword = "2U81V4C0ZRH0";			// NICE로부터 부여받은 사이트 패스워드

    String sCipherTime = "";			// 복호화한 시간
    String sRequestNumber = "";			// 요청 번호
    String sResponseNumber = "";		// 인증 고유번호  
    String sSafekey = "";				// 안심키
    String sAuthType = "";				// 본인인증 수단
    String sReturnCode = "";			// 결과코드
    String sReturnMsg = "";				// 결과 메시지
    String sRequestTime = "";			// 요청시간
    String sAuthTime = "";				// 인증시간    
    String sAgree1Map = "";				// 이용자가 선택한 나이스 필수 동의문
    String sAgree2Map = "";				// 이용자가 선택한 업체 필수 동의문    
    String sAgree3Map = "";    			// 이용자가 선택한 업체 선택 동의문
    String sCi = ""; 					// CI정보
    String sMessage = "";
    String sPlainData = "";

    int iReturn = niceCheck.fnDecode(sSiteCode, sSitePassword, sEncodeData);

    if( iReturn == 0 )
    {
        sPlainData = niceCheck.getPlainData();
        sCipherTime = niceCheck.getCipherDateTime();
        
        // 데이타를 추출합니다.
        java.util.HashMap mapresult = niceCheck.fnParse(sPlainData);
        
        //아래는 실제 데이타를 가져 오는 부분이다.
        sSafekey = (String)mapresult.get("SAFE_KEY");
        sRequestNumber = (String)mapresult.get("REQ_SEQ");
        sResponseNumber = (String)mapresult.get("RES_SEQ");
        sReturnCode = (String)mapresult.get("RETURN_CODE");
        sReturnMsg = (String)mapresult.get("RETURN_MSG");
        sRequestTime = (String)mapresult.get("REQ_DATETIME");
        sAuthTime = (String)mapresult.get("AUTH_DATETIME");        
        sAuthType = (String)mapresult.get("AUTH_TYPE");
        sAgree1Map = (String)mapresult.get("AGREE1_MAP");
        sAgree2Map = (String)mapresult.get("AGREE2_MAP");
        sAgree3Map = (String)mapresult.get("AGREE3_MAP");
        sCi = (String)mapresult.get("CI");
        
        String session_sRequestNumber = (String)session.getAttribute("REQ_SEQ");
        if(!sRequestNumber.equals(session_sRequestNumber))
        {
            sMessage = "세션값이 다릅니다. 올바른 경로로 접근하시기 바랍니다.";
            sResponseNumber = "";
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

	<title>안심키 인증결과</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<link type="text/css" rel="stylesheet" href="../css/common.css" media="all">
	<link type="text/css" rel="stylesheet" href="../css/contents.css" media="all">
    <script type="text/javascript">
    	//opener.window.name = "Parent_window";
    	//location.href = "./test.jsp";
    	function submitContents() {
    		//alert(document.safekey_web.custNm2.value);
    		//var custNm = encodeURIComponent(document.safekey_web.custNm2.value);
    		//alert(custNm);
    		document.safekey_web.action="/rtcms/sd/saveWebSafeKey.do"; //?custNm="+custNm;
    		document.safekey_web.target = "save_sf";
    		document.safekey_web.submit();
    		
    		//self.close();
    	}

    </script>
</head>

<body onload="submitContents();">

<!-- width:800px, height:676px; -->
	<div id="pop_contents">
		<h1>안심키 인증결과</h1>
		<div class="pop_conts">
			<!-- 상단 검색폼-->
			<table summary="안심키 인증결과 테이블" class="tbl04 key_tbl" width="100%">
				<caption></caption>
				<colgroup>
					<col style="width:33%" />
					<col />
				</colgroup>
				<thead>
					<tr>
						<th scope="col">항목</th>
						<th scope="col">결과</th>
					</tr>
				</thead>
				<tbody>
					<%-- <tr>
						<th scope="row">복호회한 시간</th>
						<td>&nbsp;<%= sCipherTime %></td>
					</tr>
					<tr>
						<th scope="row">요청 번호</th>
						<td>&nbsp;<%= sRequestNumber %></td>
					</tr>
					<tr>
						<th scope="row">NICE응답 번호</th>
						<td>&nbsp;<%= sResponseNumber %></td>
					</tr>
					<tr>
						<th scope="row">결과코드</th>
						<td>&nbsp;<%= sReturnCode %></td>
					</tr> --%>
					<tr>
						<th scope="row">결과메세지</th>
						<td>&nbsp;<%= sReturnMsg %></td>
					</tr>
					<%-- <tr>
						<th scope="row">인증수단</th>
						<td>&nbsp;<%= sAuthType %></td>
					</tr>
					<tr>
						<th scope="row">요청 시간</th>
						<td>&nbsp;<%= sRequestTime %></td>
					</tr>
					<tr>
						<th scope="row">인증 시간</th>
						<td>&nbsp;<%= sAuthTime %></td>
					</tr> --%>
					<tr>
						<th scope="row">안심키</th>
						<td>&nbsp;<%= sSafekey %></td>
					</tr>
					<%-- <tr>
						<th scope="row">나이스 필수 동의문 선택 결과</th>
						<td>&nbsp;<%= sAgree1Map %></td>
					</tr>
					<tr>
						<th scope="row">업체 필수 동의문 선택 결과</th>
						<td>&nbsp;<%= sAgree2Map %></td>
					</tr>
					<tr>
						<th scope="row">업체 선택 동의문 선택 결과</th>
						<td>&nbsp;<%= sAgree3Map %></td>
					</tr>
					
					<tr>
						<th scope="row">CI정보</th>
						<td>&nbsp;<%= sCi %></td>
					</tr>
					<tr>
						<th scope="row">RESERVED1</th>
						<td>&nbsp;<%= sReserved1 %></td>
					</tr>
					<tr>
						<th scope="row">RESERVED2</th>
						<td>&nbsp;<%= sReserved2 %></td>
					</tr>
					<tr>
						<th scope="row">RESERVED3</th>
						<td>&nbsp;<%= sReserved3 %></td>
					</tr> --%>
					<tr>
						<td colspan="2" align="center">
							<div class="btn_group ac">
								<a class="btn_yellow" style="text-decoration:none;" href="#" onclick="self.close();">확인</a>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
    <%//= sMessage %>
    <form name="safekey_web" id="safekey_web" method="post">
    	<input type="hidden" name="safeKey" 	id="safeKey" 	value="<%= sSafekey %>"> 
    	<input type="hidden" name="birthDay" 	id="birthDay" 	value="<%= nBirthDay %>">
    	<input type="hidden" name="custNm222" 	id="custNm222" 	value="<%//= URLDecoder.decode(sReserved1, "EUC-KR") %>">
    	<input type="hidden" name="custNm" 		id="custNm" 	value="<%= URLDecoder.decode(sReserved1, "UTF-8") %>">
    	<input type="hidden" name="mobNo" 		id="mobNo" 		value="<%= sReserved2 %>">
    	<input type="hidden" name="genderCd" 	id="genderCd" 	value="<%= nGender %>">
    </form>
    <iframe id="save_sf" name="save_sf"  width="0" height="0 src=""></iframe>
</body>
</html>