<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="CheckPlus.kisinfo.*" %>
<%@ page import="java.security.*"%>
<%@ page import="javax.crypto.Cipher"%>
<%@ page import="javax.crypto.spec.SecretKeySpec"%>

<%@ page import="java.*"%>
<%@ page import="java.util.*"%>


<%!
public static String digestSHA256(String plain) throws Exception {
	StringBuffer sb = new StringBuffer();
	MessageDigest sh = MessageDigest.getInstance("SHA-256");
	if (plain != null) {
		sh.update(plain.getBytes());
		byte[] byteData = sh.digest();
		for (int i = 0; i < byteData.length; i++) {
			sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
		}
		return sb.toString();
	}
	return null;
}


public static byte[] aesEncryptEcb(String sKey, String sText) {
	byte[] key = null;
	byte[] text = null;
	byte[] encrypted = null;
	final int AES_KEY_SIZE_128 = 128;

	try {
		// UTF-8
		key = sKey.getBytes("UTF-8");

		// Key size (128bit, 16byte)
		key = Arrays.copyOf(key, AES_KEY_SIZE_128 / 8);

		// UTF-8
		text = sText.getBytes("UTF-8");

		// AES/EBC/PKCS5Padding
		Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
		cipher.init(Cipher.ENCRYPT_MODE, new SecretKeySpec(key, "AES"));
		encrypted = cipher.doFinal(text);
	} catch (Exception e) {
		encrypted = null;
		e.printStackTrace();
	}

	return encrypted;
}

public static String toHexString(byte[] b) {
	StringBuffer sb = new StringBuffer();

	for (int i = 0; i < b.length; i++) {
		sb.append(String.format("%02X", b[i]));
	}

	return sb.toString();
}
%>

<%
	out.println("---------------Hash--------------------------" + "<br/>");
	String hashVal = digestSHA256("NAnexent1t201810151432061002033670828%EB%B0%95%EC%B2%A0ST160621162001215412");
	out.println(hashVal + "<br/>");
	out.println("[해쉬변환 비교 NAnexent1t2018010151701371002033670828%EB%B0%95%EC%B2%A0ST160621162001215412 ] 해쉬 변환값 : 1199ae2ff0b7cf92f681327e8433c4fb574863952c9b8fd4ae25fe1a8eef0e37"  + "<br/>");
	
	out.println("---------------Hash re--------------------------" + "<br/>");
	String acctNo = toHexString(aesEncryptEcb("SETTLEBANKISGOOD", "1002033670828"));
	out.println(acctNo + "<br/>");
	out.println("[계좌변환 비교 1002033670828 ]HEX 변환값   : 2819A0FAD2BA5B2CE9D2412892ECAA7D"  + "<br/>");
	
	String custNm = toHexString(aesEncryptEcb("SETTLEBANKISGOOD", "박철"));
	String rrn = toHexString(aesEncryptEcb("SETTLEBANKISGOOD", "750320"));
	
%>
 <html>
 <head>
 <title>JarInfo</title>
 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 
 <style>
 * { font-family: Verdana }
 </style>
 
 
 </head>
 <body>

	<table borde="1" width="100%">	 
	 <form id="frm" name="frm">	 	
		<tr>
	        <td>API 구분</td>
	        <td><input type="text" class="form-control input-default " value="authAcctOwnerName" id="_method" name="_method" /></td>
	    </tr>
	    <tr>
	        <td>업무구분</td>
	        <td><input type="text" class="form-control input-default " value="NA" id="payGb" name="payGb" readonly="readonly" /></td>
	    </tr>	   
	    <tr>
	        <td>상점아이디</td>
	        <td><input type="text" class="form-control input-default " value="nexent1t" id="PMid" name="PMid" readonly="readonly" /></td>
	    </tr>
	    <tr>
	        <td>주문번호</td>
	        <td><input type="text" class="form-control input-default " value="1234" id="POid" name="POid" /></td>
	    </tr>
	    <tr>
	        <td>거래일자</td>
	        <td><input type="text" class="form-control input-default " value="20181015" id="PTrDt" name="PTrDt" /></td>
	    </tr>
	    <tr>
	        <td>거래일시</td>
	        <td><input type="text" class="form-control input-default " value="143206" id="PTrTime" name="PTrTime" /></td>
	    </tr>
	    <tr>
	        <td>은행코드</td>
	        <td><input type="text" class="form-control input-default " value="020" id="PBnkCd" name="PBnkCd" /></td>
	    </tr>
	   
	
	    <tr>
	        <td>* Hash 값</td>
	        <td><input type="text" class="form-control input-default " value="<%=hashVal%>" id="PHash" name="PHash" size="50" /></td>
	    </tr>	    

	    <tr>
	        <td>* 예금주명</td>
	        <td><input type="text" class="form-control input-default " value="<%=custNm%>" id="PCustNm" name="PCustNm" size="50" /></td>
	    </tr>
	    
	    <tr>
	        <td>* 계좌번호</td>
	        <td><input type="text" class="form-control input-default " value="<%=acctNo%>" id="PAcctNo" name="PAcctNo" size="50" /></td>
	    </tr>
	    <tr>
	        <td>* 생년월일</td>
	        <td><input type="text" class="form-control input-default " value="<%=rrn%>" id=PRrn name="PRrn" size="50" /></td>
	    </tr>
	    <tr>
	    	<button type="button" class="btn btn-danger btn-rounded m-b-10" id="doBtnR"><i class="fa fa-check"></i>결과보기</button>
	    </tr>
	
	</form>	 
	</table>
	
 
 </body>
 </html>

 
 <script type="text/javascript">
 
 	function JSONtoString(object)
	{
	    return JSON.stringify(object);
	}
 

	$(document).ready(function(){
				
		$("#doBtnR").click(function(){
			console.log($("#frm").serialize());
			$.ajax({
	    		type: "post",
	    		url: 'https://testpay.settlebank.co.kr:/api/ApiMultiAction.do',
	    		dataType : "json",
	    		async: false,
	    		data: $("#frm").serialize(),
	    		success:function(data){
	    			alert(data.PStatus);
	    			if(data.PStatus == "0021"){
	    				alert('성공');
	    				alert(decodeURIComponent(JSONtoString(data)));
	    				//alert("Result Json", decodeURIComponent(JSONtoString(data)), "success");
	    			}else{
	    				alert('실폐');
	    				//alert("Result Json", decodeURIComponent(JSONtoString(data)), "error");
	    			}
	    		},
	    		error:function(e){
	    			alert("에러발생");
	    			return;
	    		}		
    		});
		});
	});
	
</script>