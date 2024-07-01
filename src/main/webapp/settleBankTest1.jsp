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
	out.println(digestSHA256("NAnexent1t2018010151701371002033670828%EB%B0%95%EC%B2%A0ST160621162001215412") + "<br/>");
	out.println("[해쉬변환 비교 NAnexent1t2018010151701371002033670828%EB%B0%95%EC%B2%A0ST160621162001215412 ] 해쉬 변환값 : 1199ae2ff0b7cf92f681327e8433c4fb574863952c9b8fd4ae25fe1a8eef0e37"  + "<br/>");
	
	out.println("---------------Hash re--------------------------" + "<br/>");
	out.println(toHexString(aesEncryptEcb("SETTLEBANKISGOOD", "1002033670828")) + "<br/>");
	out.println("[계좌변환 비교 1002033670828 ]HEX 변환값   : 2819A0FAD2BA5B2CE9D2412892ECAA7D"  + "<br/>");
	
	
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
                                   		<div class="form-group">
                                           <p class="text-muted m-b-15 f-s-12">API 구분</p>
                                           <input type="text" class="form-control input-default " value="authAcctOwnerName" id="_method" name="_method" readonly="readonly">
                                       </div>
                                       <div class="form-group">
                                           <p class="text-muted m-b-15 f-s-12">업무구분</p>
                                           <input type="text" class="form-control input-default " value="NA" id="payGb" name="payGb" readonly="readonly">
                                       </div>
                                       <div class="form-group">
                                           <p class="text-muted m-b-15 f-s-12">상점아이디</p>
                                           <input type="text" class="form-control input-default " value="nexent1t" id="PMid" name="PMid" readonly="readonly">
                                       </div>
                                       <div class="form-group">
                                           <p class="text-muted m-b-15 f-s-12">주문번호</p>
                                           <input type="text" class="form-control input-default " value="1234" id="POid" name="POid">
                                       </div>
                                       <div class="form-group">
                                           <p class="text-muted m-b-15 f-s-12">거래일자</p>
                                           <input type="text" class="form-control input-default " value="20181015" id="trDt" name="trDt">
                                       </div>
                                       <div class="form-group">
                                           <p class="text-muted m-b-15 f-s-12">거래일시</p>
                                           <input type="text" class="form-control input-default " value="143206" id="trTime" name="trTime"/>
                                       </div>
                                       <div class="form-group">
                                           <p class="text-muted m-b-15 f-s-12">은행코드</p>
                                           <input type="text" class="form-control input-default " value="020" id="bnkCd" name="bnkCd"/>
                                       </div>
                                       <div class="form-group">
                                           <p class="text-muted m-b-15 f-s-12">계좌번호</p>
                                           <input type="text" class="form-control input-default " value="1002033670828" id="acctNo" name="acctNo"/>
                                       </div>
                                       <div class="form-group">
                                           <p class="text-muted m-b-15 f-s-12">예금주명</p>
                                           <input type="text" class="form-control input-default " value="박철" id="custNm" name="custNm"/>
                                       </div>
                                       <div class="form-group">
                                           <p class="text-muted m-b-15 f-s-12">생년월일</p>
                                           <input type="text" class="form-control input-default " value="750320" id="rrn" name="rrn"/>
                                       </div>
                                       <div class="form-group">
                                       		<button type="button" class="btn btn-danger btn-rounded m-b-10" id="doBtn"><i class="fa fa-check"></i> 조회</button>
                                       </div>
                                       <input type="hidden" id="_method" name="_method"/>
                                       <input type="hidden" id="PTrDt" name="PTrDt"/>
                                       <input type="hidden" id="PTrTime" name="PTrTime"/>
                                       <input type="hidden" id="PBnkCd" name="PBnkCd"/>
                                       <input type="text" id="PAcctNo" name="PAcctNo"/>
                                       <input type="text" id="PCustNm" name="PCustNm"/>
                                       <input type="text" id="PRrn" name="PRrn"/>
                                       <input type="text" id="PHash" name="PHash" size=80/>
                                       
                                       
                                       <input type="text" id="p_custNm" name="p_custNm"  size=80/>
                                       
                                   </form>

	</table>
	
 
 </body>
 </html>

 
 <script type="text/javascript">
 
 

	/* function JSONtoString(object)
	{
	    return JSON.stringify(object);
	} */

	/* window.alert = function(msg)
	{
		swal(msg);
	}; */
	
	
	
	function getDate() {
		var date = new Date();
		var month = date.getMonth(); 
		var day = date.getDate();
		month = month > 10 ? month + 1: "0" + (month + 1);
		day = day > 10 ? day : "0" + day; 
		
		return date.getFullYear() + month + day;
	}
	
	function getTime() {
		var date = new Date();
		var hour = date.getHours(); 
		var minute = date.getMinutes();
		var second = date.getSeconds();
		hour = hour > 10 ? hour + 1: "0" + hour;
		minute = minute > 10 ? minute : "0" + minute;
		second = second > 10 ? second : "0" + second;
		return hour + "" + minute + "" + second;
	}
	
	

 $(document).ready(function(){
	 
	  	$('#p_custNm').val(encodeURIComponent($("#custNm").val()));
		
	 	//$("#trDt").val(getDate()); 
		//$("#trTime").val(getTime());
		
		$("#doBtn").click(function(){
			
			
			//setDataToCookie();

			//hash 생성
			$.ajax({
				type: "post",
				url: "https://testpay.settlebank.co.kr:/api/ApiMultiAction.do?_method=getHashDataForAcctAuth",
				dataType : "json",
				data: {
						  payGb : $("#payGb").val()
						, PMid : $("#PMid").val() 
						, PTrDt : $("#trDt").val()
						, PTrTime : $("#trTime").val()
						, PAcctNo : $("#acctNo").val()
						, PCustNm : encodeURIComponent($("#custNm").val())
						, PRrn : $("#rrn").val()
					},
				success:function(data){
					//해쉬코드 data 설정
					$("#PHash").val(data.msg);
					console.log("hash " + data.msg);
					//1. 계좌번호 암호화
					$.ajax({
						type: "post",
						url: "https://testpay.settlebank.co.kr:/api/ApiMultiAction.do?_method=getAcctAuthEncryptData",
						dataType : "json",
						data: { mid: $("#PMid").val(), plainData : $("#acctNo").val() },
						success:function(data){
							//암호화된 data 설정
							$("#PAcctNo").val(data.msg);
							console.log("acctNo " + data.msg);
							$.ajax({
								type: "post",
								url: "https://testpay.settlebank.co.kr:/api/ApiMultiAction.do?_method=getAcctAuthEncryptData",
								dataType : "json",
								data: { mid: $("#PMid").val(), plainData : $("#custNm").val() },
								success:function(data){
									//암호화된 data 설정
									$("#PCustNm").val(data.msg);
									console.log("PCustNm " + data.msg);
									$.ajax({
										type: "post",
										url: "https://testpay.settlebank.co.kr:/api/ApiMultiAction.do?_method=getAcctAuthEncryptData",
										dataType : "json",
										data: { mid: $("#PMid").val(), plainData : $("#rrn").val() },
										success:function(data){
											//암호화된 data 설정
											$("#PRrn").val(data.msg);
											console.log("PRrn " + data.msg);
											//등록시 보낼데이터 set
											$("#PMid").val($("#PMid").val());
											$("#POid").val($("#POid").val());
											$("#PTrDt").val($("#trDt").val());
											$("#PTrTime").val($("#trTime").val());
											$("#PBnkCd").val($("#bnkCd").val());

											//setDataToCookie();

								    		$.ajax({
									    		type: "post",
									    		url: 'https://testpay.settlebank.co.kr:/api/ApiMultiAction.do',
									    		dataType : "json",
									    		async: false,
									    		data: $("#frm").serialize(),
									    		success:function(data){
									    			alert(data.PStatus);
									    			if(data.PStatus == "0021"){
									    				alert("Result Json", decodeURIComponent(JSONtoString(data)), "success");
									    			}else{
									    				alert("Result Json", decodeURIComponent(JSONtoString(data)), "error");
									    			}
									    		},
									    		error:function(e){
									    			alert("에러발생");
									    			return;
									    		}		
								    		});
										},
										error:function(e){
											alert("에러발생");
											return;
										}		
									});
								},
								error:function(e){
									alert("에러발생");
									return;
								}		
							});
						      
						},
						error:function(e){
							alert("에러발생");
							return;
						}		
					});
					 
				},
				error:function(e){
					alert("에러발생");
					return;
				}		
			});
		});
	});

	//getDataFromCookie();

</script>