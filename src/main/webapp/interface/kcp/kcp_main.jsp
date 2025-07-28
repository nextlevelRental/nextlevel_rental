<%@ page language="java" contentType="text/html; charset=euc-kr" %>
<%@ include file="./cfg/site_conf_inc.jsp"%>
<html>
<head>
	<title>KCP Main Page</title>
	<script type="text/javascript" src="./nexacro_if.js"></script>
	<script language='javascript'>
		var xpCallBackObj; /* WebBrowser �κ��� ����� ���޹��� ������Ʈ (XPLATFORM Form) */
		var xpCallBackFn;
		
		/*
		 * �ػ�ũ�� ���� ���� �ʱ�ȭ
		 */
		function setCallback(obj, name) {
			window.NEXACROHTML.Init();
		};
		
		window.name ="Parent_window";
		
		/*
		 * KCP ����ȭ�� �̵�
		 */
		function popupKcp(pOrdPageURL, reqTx) {
			window.open("", "popupChk", "width=800, height=800, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=yes");
			
			var doc;
			
			if(reqTx === "pay") {
				doc = document.formKcpArgs;
			} else if(reqTx === "mod") {
				doc = document.formKcpCancelArgs;
			}
			
			doc.action = pOrdPageURL
			doc.target = "popupChk";
			doc.submit();
		};
	</script>
</head>
<body onload="setCallback();">
	<input type="button" id="btnProc" value="Proceed" onClick="popupKcp('<%= g_ord_page %>', 'pay')"></input>
	
	<!--  �� �׸��� value ���� �ʿ��� ��� �ػ�ũ�� ȭ�鿡�� �������� ���� -->
	<form name="formKcpArgs" method="post">
		<input type="hidden" id="pay_method_name" name="pay_method_name" value="" />
		<input type="hidden" id="pay_method_cd"	  name="pay_method_cd"	 value="" />
		<input type="hidden" id="ord_no"		  name="ord_no"			 value="" />
		<input type="hidden" id="good_name"		  name="good_name"		 value="" />
		<input type="hidden" id="good_mny"		  name="good_mny"		 value="" />
		<input type="hidden" id="buyr_name"		  name="buyr_name"		 value="" />
		<input type="hidden" id="buyr_mail"		  name="buyr_mail"		 value="" />
		<input type="hidden" id="buyr_tel1"		  name="buyr_tel1"		 value="" />
		<input type="hidden" id="buyr_tel2"		  name="buyr_tel2"		 value="" />
		<input type="hidden" id="expire_term"	  name="expire_term"	 value="3" />
		<input type="hidden" id="expire_time"	  name="expire_time"	 value="235959" />
		<input type="hidden" id="use_tax_yn"	  name="use_tax_yn"		 value="N" />
		<input type="hidden" id="reg_id"		  name="reg_id"			 value="" />
		<input type="hidden" id="card_no"		  name="card_no"		 value="" />
		<input type="hidden" id="quotaopt"		  name="quotaopt"		 value="" />
		<input type="hidden" id="expiry_yy"		  name="expiry_yy"		 value="" />
		<input type="hidden" id="expiry_mm"		  name="expiry_mm"		 value="" />
		<input type="hidden" id="cardauth"		  name="cardauth"		 value="" />
		<input type="hidden" id="cardpwd"		  name="cardpwd"		 value="" />
	</form>
	
	<input type="button" id="btnCancelProc" value="Proceed" onClick="popupKcp('<%= g_cancel_page %>', 'mod')"></input>
	
	<!--  �� �׸��� value ���� �ʿ��� ��� �ػ�ũ�� ȭ�鿡�� �������� ���� -->
	<form name="formKcpCancelArgs" method="post">
		<input type="hidden" id="req_tx"   name="req_tx"   value="" />	<!-- ���μ��� ��û ���� ���� ����		-->
		<input type="hidden" id="mod_type" name="mod_type" value="" />	<!-- ���μ��� ��û�� ���� ����			-->
		<input type="hidden" id="tno"	   name="tno"	   value="" />	<!-- ���� �Ϸ� �� ���� �ǿ� ���� ���� ��	-->
		<input type="hidden" id="mod_mny"  name="mod_mny"  value="" />	<!-- ��ҿ�û �ݾ�					-->
		<input type="hidden" id="rem_mny"  name="rem_mny"  value="" />	<!-- �κ���� ������ ���� �ݾ�			-->
		<input type="hidden" id="mod_desc" name="mod_desc" value="" />	<!-- ���μ��� ��� ������ ���� ���� ��		-->
	</form>
</body>
</html>