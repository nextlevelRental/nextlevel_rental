<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<style>
* { font-family: Verdana }
</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<script type="text/javascript">
/* window.NEXACROHTML 객체 초기화 */
if(!window.NEXACROHTML) {
	window.NEXACROHTML = {};
}

var parentNexacro = null;
var bInit = false;

window.NEXACROHTML.Init = function() {
	var loopCnt = 0;
	var interval = setInterval(function() {
		parentNexacro = window.NEXACROWEBBROWSER;

		if(loopCnt >= 10 || parentNexacro) {
			bInit = true;
			clearInterval(interval);
		}

		loopCnt++;
	}, 50);
}

window.NEXACROHTML.FireUserNotify = function(userdata) {
	/* 넥사크로 호출 유형에 맞게 분기해서 처리(Runtime 사용하지않음) */
	if(parentNexacro || window.NEXACROWEBBROWSER) {
		window.NEXACROWEBBROWSER.on_fire_onusernotify(window.NEXACROWEBBROWSER, userdata);
	}
}

function init() {
	window.NEXACROHTML.Init();
}

function webCallback(data) {
	window.NEXACROHTML.FireUserNotify(data);
}

function JSONtoString(object) {
	return JSON.stringify(object);
}

$(document).ready(function() {
	/* 예금주조회 요청 */
	$("#doBtnR4").click(function() {
		$.ajax({
			  type	   : "post"
			, url	   : "https://testpay.settlebank.co.kr:/api/ApiMultiAction.do"
			, dataType : "json"
			, async	   : false
			, data	   : $("#frm4").serialize()
			, success  : function(data) {
				//if(data.PStatus == "0021") {
					//data = decodeURIComponent(JSONtoString(data)); /* JSON */
					data.payGbSeq = "4";
					webCallback(data);
// 				} else {
// 					alert("실패");
// 				}
			  }
			, error	   : function(e) {
				alert("에러발생");
				return;
			  }
		});
	});

	/* ARS 출금계좌등록 요청 */
	$("#doBtnR5").click(function() {
		$.ajax({
			  type	   : "post"
			, url	   : "https://testpay.settlebank.co.kr:/api/ApiMultiAction.do"
			, dataType : "json"
			, async	   : false
			, data	   : $("#frm5").serialize()
			, success  : function(data) {
				//if(data.PStatus == "0021") {
					//data = decodeURIComponent(JSONtoString(data)); /* JSON */
					data.payGbSeq = "5";
					webCallback(data);
// 				} else {
// 					alert("실패");
// 				}
			  }
			, error	   : function(e) {
				alert("에러발생");
				return;
			  }
		});
	});

	/* 결제인증 요청 */
	$("#doBtnR12").click(function() {
		$.ajax({
			  type	   : "post"
			, url	   : "https://testpay.settlebank.co.kr:/api/ApiMultiAction.do"
			, dataType : "json"
			, async	   : false
			, data	   : $("#frm12").serialize()
			, success  : function(data) {
				//if(data.PStatus == "0021") {
					//data = decodeURIComponent(JSONtoString(data)); /* JSON */
					data.payGbSeq = "12";
					webCallback(data);
// 				} else {
// 					alert("실패");
// 				}
			  }
			, error	   : function(e) {
				alert("에러발생");
				return;
			  }
		});
	});

	/* 결제승인 요청 */
	$("#doBtnR3").click(function() {
		$.ajax({
			  type	   : "post"
			//, url	   : "https://testpay.settlebank.co.kr:/api/ApiMultiAction.do"
			, url	   : "https://testpay.settlebank.co.kr:/shopnt/FirmPaymentAction.pay"
			, dataType : "json"
			, async	   : false
			, data	   : $("#frm3").serialize()
			, success  : function(data) {
				//if(data.PStatus == "0021") {
					//data = decodeURIComponent(JSONtoString(data)); /* JSON */
					data.payGbSeq = "3";
					webCallback(data);
// 				} else {
// 					alert("실패");
// 				}
			  }
			, error	:   function(e) {
				alert("에러발생");
				return;
			  }
		});
	});

	/* 업무 요청 */
	$("#doBtnR2").click(function() {
		$.ajax({
			  type	   : "post"
			//, url	   : "https://testpay.settlebank.co.kr:/api/ApiMultiAction.do"
			, url	   : "https://testpay.settlebank.co.kr:/shopnt/FirmPaymentAction.pay"
			, dataType : "json"
			, async	   : false
			, data	   : $("#frm2").serialize()
			, success  : function(data) {
				//if(data.PStatus == "0021") {
					//data = decodeURIComponent(JSONtoString(data)); /* JSON */
					data.payGbSeq = "2";
					webCallback(data);
// 				} else {
// 					alert("실패");
// 				}
			  }
			, error	:   function(e) {
				alert("에러발생");
				return;
			  }
		});
	});

	/* 계좌해지(DE) Non UI 요청 */
	$("#doBtnR11").click(function() {
		$.ajax({
			  type	   : "post"
			, url	   : "https://testpay.settlebank.co.kr:/api/ApiMultiAction.do"
			//, url	   : "https://testpay.settlebank.co.kr:/shopnt/FirmPaymentAction.pay"
			, dataType : "json"
			, async	   : false
			, data	   : $("#frm11").serialize()
			, success  : function(data) {
				//if(data.PStatus == "0021") {
					//data = decodeURIComponent(JSONtoString(data)); /* JSON */
					data.payGbSeq = "11";
					webCallback(data);
// 				} else {
// 					alert("실패");
// 				}
			  }
			, error	:   function(e) {
				alert("에러발생");
				return;
			  }
		});
	});
});
</script>
<body onload="init();">
	<!-- 예금주조회 요청 -->
	<form id="frm4" name="frm4">
		<input type="button" id="doBtnR4"/>
		<input type="hidden" value="" id="_method4"	name="_method"/>	<!-- API 구분		-->
		<input type="hidden" value="" id="payGb4"	name="payGb"/>		<!-- 업무구분		-->
		<input type="hidden" value="" id="PMid4"	name="PMid"/>		<!-- 상점아이디	-->
		<input type="hidden" value="" id="POid4"	name="POid"/>		<!-- 주문번호		-->
		<input type="hidden" value="" id="PTrDt4"	name="PTrDt"/>		<!-- 거래일자		-->
		<input type="hidden" value="" id="PTrTime4"	name="PTrTime"/>	<!-- 거래일시		-->
		<input type="hidden" value="" id="PBnkCd4"	name="PBnkCd"/>		<!-- 은행코드		-->
		<input type="hidden" value="" id="PCustNm4"	name="PCustNm"/>	<!--* 예금주명		-->
		<input type="hidden" value="" id="PAcctNo4"	name="PAcctNo"/>	<!--* 계좌번호		-->
		<input type="hidden" value="" id="PRrn4"	name="PRrn"/>		<!--* 생년월일		-->
		<input type="hidden" value="" id="PHash4"	name="PHash"/>		<!--* Hash 데이터	-->
	</form>
	<!-- ARS 출금계좌등록 요청 -->
	<form id="frm5" name="frm5">
		<input type="button" id="doBtnR5"/>
		<input type="hidden" value="" id="_method5"	name="_method"/>	<!-- API 구분		-->
		<input type="hidden" value="" id="payGb5"	name="payGb"/>		<!-- 업무구분		-->
		<input type="hidden" value="" id="PTrNo5"	name="PTrNo"/>		<!-- 거래번호		-->
		<input type="hidden" value="" id="PMid5"	name="PMid"/>		<!-- 상점아이디	-->
		<input type="hidden" value="" id="POid5"	name="POid"/>		<!-- 주문번호		-->
		<input type="hidden" value="" id="PBnkCd5"	name="PBnkCd"/>		<!-- 은행코드		-->
		<input type="hidden" value="" id="PAcctNo5"	name="PAcctNo"/>	<!--* 계좌번호		-->
		<input type="hidden" value="" id="PCustId5"	name="PCustId"/>	<!-- 고객ID		-->
		<input type="hidden" value="" id="PCustNm5"	name="PCustNm"/>	<!--* 예금주명		-->
		<input type="hidden" value="" id="PRrn5"	name="PRrn"/>		<!--* 생년월일		-->
		<input type="hidden" value="" id="PHash5"	name="PHash"/>		<!--* Hash 데이터	-->
	</form>
	<!-- 결제(RP) Non UI 요청 -->
	<form id="frm12" name="frm12">
		<input type="button" id="doBtnR12"/>
		<input type="hidden" value="" id="_method12" name="_method"/>	<!-- API 구분		-->
		<input type="hidden" value="" id="payGb12"	 name="payGb"/>		<!-- 업무구분		-->
		<input type="hidden" value="" id="PMid12"	 name="PMid"/>		<!-- 상점아이디	-->
		<input type="hidden" value="" id="PBname12"  name="PBname"/>	<!-- 통장인자명	-->
		<input type="hidden" value="" id="PCustId12" name="PCustId"/>	<!-- 고객ID		-->
		<input type="hidden" value="" id="PUname12"	 name="PUname"/>	<!-- 결제고객성명	-->
		<input type="hidden" value="" id="POid12"	 name="POid"/>		<!-- 주문번호		-->
		<input type="hidden" value="" id="PGoods12"	 name="PGoods"/>	<!-- 결제상품명	-->
		<input type="hidden" value="" id="PBnkCd12"	 name="PBnkCd"/>	<!-- 은행코드		-->
		<input type="hidden" value="" id="PAcctNo12" name="PAcctNo"/>	<!-- 출금계좌번호	-->
		<input type="hidden" value="" id="PAmt12"	 name="PAmt"/>		<!-- 거래금액		-->
		<input type="hidden" value="" id="PHash12"	 name="PHash"/>		<!--* Hash 데이터	-->
	</form>
	<!-- 결제승인 요청 -->
	<form id="frm3" name="frm3">
		<input type="button" id="doBtnR3"/>
		<input type="hidden" value="" id="payGb3" name="payGb"/>	<!-- 업무구분		-->
		<input type="hidden" value="" id="PMid3"  name="PMid"/>		<!-- 상점아이디	-->
		<input type="hidden" value="" id="PTrNo3" name="PTrNo"/>	<!-- 거래번호		-->
		<input type="hidden" value="" id="PHash3" name="PHash"/>	<!--* Hash 데이터	-->
	</form>
	<!-- 업무 요청 -->
	<form id="frm2" name="frm2">
		<input type="button" id="doBtnR2"/>
		<input type="hidden" value="" id="payGb2"	  name="payGb"/>		<!-- 업무구분				-->
		<input type="hidden" value="" id="PMid2"	  name="PMid"/>			<!-- 상점아이디			-->
		<input type="hidden" value="" id="PCustId2"	  name="PCustId"/>		<!-- 고객ID				-->
		<input type="hidden" value="" id="POid2"	  name="POid"/>			<!-- 주문번호				-->
		<input type="hidden" value="" id="PGoods2"	  name="PGoods"/>		<!-- 결제상품명			-->
		<input type="hidden" value="" id="PAmt2"	  name="PAmt"/>			<!-- 거래금액				-->
		<input type="hidden" value="" id="PBname2"	  name="PBname"/>		<!-- 통장인자명			-->
		<input type="hidden" value="" id="PNextUrl2"  name="PNextUrl"/>		<!-- 인증후 화면 Url		-->
		<input type="hidden" value="" id="PCancUrl2"  name="PCancUrl"/>		<!-- 인증취소 Url			-->
		<input type="hidden" value="" id="PRepayUrl2" name="PRepayUrl"/>	<!-- 관리자 페이지 완료후 Url	-->
		<input type="hidden" value="" id="PTrNo2"	  name="PTrNo"/>		<!-- 거래번호				-->
		<input type="hidden" value="" id="PHash2"	  name="PHash"/>		<!--* Hash 데이터			-->
	</form>
	<!-- 계좌해지(DE) Non UI 요청 -->
	<form id="frm11" name="frm11">
		<input type="button" id="doBtnR11"/>
		<input type="hidden" value="" id="_method11" name="_method"/>	<!-- API 구분		-->
		<input type="hidden" value="" id="payGb11"	 name="payGb"/>		<!-- 업무구분		-->
		<input type="hidden" value="" id="PMid11"	 name="PMid"/>		<!-- 상점아이디	-->
		<input type="hidden" value="" id="PCustId11" name="PCustId"/>	<!-- 고객ID		-->
		<input type="hidden" value="" id="PBnkCd11"	 name="PBnkCd"/>	<!-- 은행코드		-->
		<input type="hidden" value="" id="PHash11"	 name="PHash"/>		<!--* Hash 데이터	-->
	</form>
</body>
</html>