<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page language="java" import="Kisinfo.Check.IPINClient" %>

<%
	/********************************************************************************************************************************************
	 * IPIN ���� START 
	/********************************************************************************************************************************************/
	/********************************************************************************************************************************************
		NICE������ Copyright(c) KOREA INFOMATION SERVICE INC. ALL RIGHTS RESERVED
		���񽺸� : �����ֹι�ȣ���� (IPIN) ����
		�������� : �����ֹι�ȣ���� (IPIN) ȣ�� ������
	*********************************************************************************************************************************************/
	String ipin_sSiteCode				= "L743";					// IPIN ���� ����Ʈ �ڵ�		(NICE���������� �߱��� ����Ʈ�ڵ�)
	String sSitePw						= "Qwer1234";			// IPIN ���� ����Ʈ �н�����	(NICE���������� �߱��� ����Ʈ�н�����)
	
	/*
	�� sReturnURL ������ ���� ����  ����������������������������������������������������������������������������������������������������������
		NICE������ �˾����� �������� ����� ������ ��ȣȭ�Ͽ� �ͻ�� �����մϴ�.
		���� ��ȣȭ�� ��� ����Ÿ�� ���Ϲ����� URL ������ �ּ���.
		* URL �� http ���� �Է��� �ּž��ϸ�, �ܺο����� ������ ��ȿ�� �������� �մϴ�.
		* ��翡�� �����ص帰 ���������� ��, ipin_process.jsp �������� ����� ������ ���Ϲ޴� ���� �������Դϴ�.
		�Ʒ��� URL �����̸�, �ͻ��� ���� �����ΰ� ������ ���ε� �� ���������� ��ġ�� ���� ��θ� �����Ͻñ� �ٶ��ϴ�.
		�� - http://www.test.co.kr/ipin_process.jsp, https://www.test.co.kr/ipin_process.jsp, https://test.co.kr/ipin_process.jsp
	������������������������������������������������������������������������������������������������������������������������������������������
	*/
	String sReturnURL				= "http://portal.tirerental.co.kr/interface/ipin/ipin_process.jsp";
	
	/*
	�� sCPRequest ������ ���� ����  ����������������������������������������������������������������������������������������������������������
		[CP ��û��ȣ]�� �ͻ翡�� ����Ÿ�� ���Ƿ� �����ϰų�, ��翡�� ������ ���� ����Ÿ�� ������ �� �ֽ��ϴ�.
		CP ��û��ȣ�� ���� �Ϸ� ��, ��ȣȭ�� ��� ����Ÿ�� �Բ� �����Ǹ�
		����Ÿ ������ ���� �� Ư�� ����ڰ� ��û�� ������ Ȯ���ϱ� ���� �������� �̿��Ͻ� �� �ֽ��ϴ�.
		���� �ͻ��� ���μ����� �����Ͽ� �̿��� �� �ִ� ����Ÿ�̱⿡, �ʼ����� �ƴմϴ�.
	������������������������������������������������������������������������������������������������������������������������������������������
	*/
	String sCPRequest				= "";
	
	// ��ü ����
	IPINClient pClient = new IPINClient();
	// �ռ� ����帰 �ٿͰ���, CP ��û��ȣ�� ������ ����� ���� �Ʒ��� ���� ������ �� �ֽ��ϴ�.
	sCPRequest = pClient.getRequestNO(ipin_sSiteCode);
	// CP ��û��ȣ�� ���ǿ� �����մϴ�.
	// ���� ������ ������ ������ ipin_result.jsp ���������� ����Ÿ ������ ������ ���� Ȯ���ϱ� �����Դϴ�.
	// �ʼ������� �ƴϸ�, ������ ���� �ǰ�����Դϴ�.
	session.setAttribute("CPREQUEST" , sCPRequest);
	
	// Method �����(iRtn)�� ����, ���μ��� ���࿩�θ� �ľ��մϴ�.
	int iRtn = pClient.fnRequest(ipin_sSiteCode, sSitePw, sCPRequest, sReturnURL);
	
	String sRtnMsg					= "";			// ó����� �޼���
	String sEncData					= "";			// ��ȣȭ �� ����Ÿ
	
	// Method ������� ���� ó������
	if (iRtn == 0) {
		// fnRequest �Լ� ó���� ��ü������ ��ȣȭ�� �����͸� �����մϴ�.
		// ����� ��ȣȭ�� ����Ÿ�� ��� �˾� ��û��, �Բ� �����ּž� �մϴ�.
		sEncData = pClient.getCipherData();		//��ȣȭ �� ����Ÿ
		sRtnMsg = "���� ó���Ǿ����ϴ�.";
	} else if (iRtn == -1 || iRtn == -2) {
		sRtnMsg =	"������ �帰 ���� ��� ��, �ͻ� ����ȯ�濡 �´� ����� �̿��� �ֽñ� �ٶ��ϴ�.<BR>" +
						"�ͻ� ����ȯ�濡 �´� ����� ���ٸ� ..<BR><B>iRtn ��, ���� ȯ�������� ��Ȯ�� Ȯ���Ͽ� ���Ϸ� ��û�� �ֽñ� �ٶ��ϴ�.</B>";
	}
	else if (iRtn == -9) {
		sRtnMsg = "�Է°� ���� : fnRequest �Լ� ó����, �ʿ��� 4���� �Ķ���Ͱ��� ������ ��Ȯ�ϰ� �Է��� �ֽñ� �ٶ��ϴ�.";
	} else {
		sRtnMsg = "iRtn �� Ȯ�� ��, NICE������ ���� ����ڿ��� ������ �ּ���.";
	}
	/********************************************************************************************************************************************
	 * IPIN ���� END 
	/********************************************************************************************************************************************/
	
	/********************************************************************************************************************************************
	 * �ڵ���  ���� START 
	/********************************************************************************************************************************************/
	NiceID.Check.CPClient niceCheck = new  NiceID.Check.CPClient();

	String sSiteCode 			= "G9177";							// NICE�κ��� �ο����� ����Ʈ �ڵ�
    String sSitePassword 		= "0S6ZT2AYXPFY";					// NICE�κ��� �ο����� ����Ʈ �н�����
    String sRequestNumber 	= "REQ0000000001";        		// ��û ��ȣ, �̴� ����/�����Ŀ� ���� ������ �ǵ����ְ� �ǹǷ� 
    sRequestNumber = niceCheck.getRequestNO(sSiteCode);
  	
    System.out.println(sRequestNumber + "##################################");
    session.setAttribute("REQ_SEQ" , sRequestNumber);			// ��ŷ���� ������ ���Ͽ� ������ ���ٸ�, ���ǿ� ��û��ȣ�� �ִ´�.
  	
   	String sAuthType = "";      										// ������ �⺻ ����ȭ��, M: �ڵ���, C: �ſ�ī��, X: ����������
   	
   	String popgubun 	= "N";											// Y : ��ҹ�ư ���� / N : ��ҹ�ư ����
	String customize 	= "";											// ������ �⺻ �������� / Mobile : �����������
		
    // CheckPlus(��������) ó�� ��, ��� ����Ÿ�� ���� �ޱ����� ���������� ���� http���� �Է��մϴ�.
    String sReturnUrl 	= "https://portal.tirerental.co.kr/interface/di_safekey/checkplus_success.jsp";      	// ������ �̵��� URL
    String sErrorUrl 	= "https://portal.tirerental.co.kr/interface/di_safekey/checkplus_fail.jsp";          		// ���н� �̵��� URL

    // �Էµ� plain ����Ÿ�� �����.
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
        sMessage = "��ȣȭ �ý��� �����Դϴ�.";
    }    
    else if( iReturn == -2)
    {
        sMessage = "��ȣȭ ó�������Դϴ�.";
    }    
    else if( iReturn == -3)
    {
        sMessage = "��ȣȭ ������ �����Դϴ�.";
    }    
    else if( iReturn == -9)
    {
        sMessage = "�Է� ������ �����Դϴ�.";
    }    
    else
    {
        sMessage = "�˼� ���� ���� �Դϴ�. iReturn : " + iReturn;
    }
%>

<html>
<head>
	<title>NICE������ �����ֹι�ȣ ����</title>
	<script type="text/javascript" src="https://portal.tirerental.co.kr/interface/di_safekey/WebIF.js"></script>
	<script language='javascript'>
	var xpCallBackObj; //WebBrowser �κ��� ����� ���޹��� ������Ʈ (XPLATFORM Form)
	var xpCallBackFn;
	function setCallback(obj, name) {
		window.NEXACROHTML.Init();
	};
	
	function submitContents() {
		// �������� ���뿡 ���� �� ������ �̰�����
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
	<input type="button" id="btnTest1" value="HTML5������" onClick="submitContents()"></input>
	<!-- IPIN �ʱ⼳�� ��� Start -->
	iRtn : <%= iRtn %> - <%= sRtnMsg %>
	��ü���� ��ȣȭ ����Ÿ : [<%= sEncData %>]
	<!-- �ڵ��� �ʱ⼳�� ��� -->
	<%= sMessage %>
	��ü���� ��ȣȭ ����Ÿ : [<%= disEncData %>]

	<!-- IPIN �������� ���� Start -->
	<!-- �����ֹι�ȣ ���� �˾��� ȣ���ϱ� ���ؼ��� ������ ���� form�� �ʿ��մϴ�. -->
	<form name="form_ipin" method="post">
		<input type="hidden" name="m" value="pubmain">						<!-- �ʼ� ����Ÿ��, �����Ͻø� �ȵ˴ϴ�. -->
	    <input type="hidden"  id="enc_data" name="enc_data" value="<%= sEncData %>">		<!-- ������ ��ü������ ��ȣȭ �� ����Ÿ�Դϴ�. -->
	    <!-- ��ü���� ����ޱ� ���ϴ� ����Ÿ�� �����ϱ� ���� ����� �� ������, ������� ����� �ش� ���� �״�� �۽��մϴ�.
	    	 �ش� �Ķ���ʹ� �߰��Ͻ� �� �����ϴ�. -->
	    <input type="hidden" name="param_r1" value="">
	    <input type="hidden" name="param_r2" value="">
	    <input type="hidden" name="param_r3" value="">
	    <a href="javascript:fnPopup();"><img src="https://image.creditbank.co.kr/static/img/vno/new_img/bt_17.gif"  id="fn_popup" width=218 height=40 border=0 onclick="fnPopup();"></a>
	</form>

	<!-- �����ֹι�ȣ ���� �˾� ���������� ����ڰ� ������ ������ ��ȣȭ�� ����� ������ �ش� �˾�â���� �ްԵ˴ϴ�.
		  ���� �θ� �������� �̵��ϱ� ���ؼ��� ������ ���� form�� �ʿ��մϴ�. -->
	<form name="vnoform"  id="vnoform" method="post">
		<input type="hidden" name="enc_data">								<!-- �������� ����� ���� ��ȣȭ ����Ÿ�Դϴ�. -->
		<!-- ��ü���� ����ޱ� ���ϴ� ����Ÿ�� �����ϱ� ���� ����� �� ������, ������� ����� �ش� ���� �״�� �۽��մϴ�.
	    	 �ش� �Ķ���ʹ� �߰��Ͻ� �� �����ϴ�. -->
	    <input type="hidden" name="param_r1" value="">
	    <input type="hidden" name="param_r2" value="">
	    <input type="hidden" name="param_r3" value="">
	</form>
	<!-- IPIN �������� ���� End -->
	
	
	
	<!-- �ڵ��� ������������ Start -->
	<!-- �������� ���� �˾��� ȣ���ϱ� ���ؼ��� ������ ���� form�� �ʿ��մϴ�. -->
	<form name="form_chk" method="post">
		<input type="hidden" name="m" value="checkplusSerivce">						<!-- �ʼ� ����Ÿ��, �����Ͻø� �ȵ˴ϴ�. -->
		<input type="hidden" name="EncodeData" value="<%= disEncData %>">		<!-- ������ ��ü������ ��ȣȭ �� ����Ÿ�Դϴ�. -->
	    
	    <!-- ��ü���� ����ޱ� ���ϴ� ����Ÿ�� �����ϱ� ���� ����� �� ������, ������� ����� �ش� ���� �״�� �۽��մϴ�.
	    	 �ش� �Ķ���ʹ� �߰��Ͻ� �� �����ϴ�. -->
		<input type="hidden" name="param_r1" value="">
		<input type="hidden" name="param_r2" value="">
		<input type="hidden" name="param_r3" value="">
	    
		<a href="javascript:diFnPopup();"><img src="https://image.creditbank.co.kr/static/img/vno/new_img/bt_17.gif"  id="di_fn_popup" width=218 height=40 border=0 onclick="diFnPopup();"></a>
	</form>
	<!-- �ڵ��� ������������ End -->
	<input type="hidden" id="di" 			value=""  name="di" />
	<input type="hidden" id="ci" 			value=""  name="ci" />
	<input type="hidden" id="sName" 		value=""  name="sName" />
	<input type="hidden" id="sBirthDate" 	value=""  name="sBirthDate" />
	<input type="hidden" id="sGender" 		value=""  name="sGender" />
	<input type="hidden" id="sNationalInfo" value=""  name="sNationalInfo" />
</body>
</html>