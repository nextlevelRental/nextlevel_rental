<%@ page language="java" contentType="text/html;charset=euc-kr" %>

<%
	NiceID.Check.CPClient niceCheck = new  NiceID.Check.CPClient();
	
	// NICE ���� ����Ʈ �ڵ�,�н�����
	String sSiteCode = "";				// NICE�κ��� �ο����� ����Ʈ �ڵ�
	String sSitePassword = "";		// NICE�κ��� �ο����� ����Ʈ �н�����
	
	
	/*
		��û��ȣ ����
		��û��ȣ�� �Ƚ�Ű������ ���� �� ����/���� ������� �����Ͽ� ���۵˴ϴ�.
	*/
	String sRequestNumber = "";
	sRequestNumber = "REQ0000000001";        			  // ��� ��� ���ǰ��� ��ü���� �����Ͽ� ��밡��
	sRequestNumber = niceCheck.getRequestNO(sSiteCode); // ����� ���� ����
	session.setAttribute("REQ_SEQ" , sRequestNumber);	// ��ŷ���� ������ ���Ͽ� ������ ���ٸ�, ���ǿ� ��û��ȣ�� �ִ´�.
	
	/*
		��û�Ͻ� ���� yyyyMMddHHmmss		
	*/
	java.util.Calendar cal = java.util.Calendar.getInstance();
	java.text.SimpleDateFormat df = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
	String req_datetime  = df.format(cal.getTime());
		
	/*
		���� �� 3�ڸ��� ù��°�ڸ��� �޴���������뿩��, �ι�°�ڸ��� �ſ�ī��������뿩��, ����°�ڸ��� ����������������뿩�θ� �Է��մϴ�.
		���� �ݵ�� 3�ڸ��� �Է��� �ּž� �˴ϴ�.
		����� ���� 1,�̻���� ���� 0���� ǥ���մϴ�.
		��) �޴����������,�ſ�ī�������̻��,����������������� �� ��� 
		    sAuthType = "101";
	*/
	String sAuthType = "101";

	/*
		������� ������ 8�ڸ��� �Է��մϴ�.(�� 4�ڸ�, �� 2�ڸ�, �� 2�ڸ�)
		��) ��������� '9999�� 1�� 20��' �� ���
		    birthdate = "99990120";
	*/
	String birthdate = "99990120";

	/*
		�������� ���ڴ� 1, ���ڴ� 0���� �Է��մϴ�.
		��) '����' �� ���
		    gender = "1";
	*/
	String gender = "1";

	/*
		�Ƚ�Ű ��� ������ �����ֽø� �˴ϴ�.
		��) �̸��� 'ȫ�浿' �� ���
		    username = "ȫ�浿";
	*/
	String username = "ȫ�浿";

	
	/*
		���ǹ��� ���� ��뿩�θ� �����ϴ� �ڵ��Դϴ�.		
		���ǹ����� 
		- �ſ������ۺ� ���� ��û ����
		
		��) �ſ������ۺ� ���� ��û ���Ǹ� ���ϴ� ��� 
			agree1_map = "1000000000";
			�ſ������ۺ� ���� ��û ���� ������ ���� ���
			agree1_map = "0000000000";
	*/
	String agree1_map = "0000000000"; // �ſ������ۺ� ���� ��û ����

	/*
		���ǹ��� ���� ��뿩�θ� �����ϴ� �ڵ��Դϴ�.
		��ü���� ������ ����� ���ǹ������� �������� �ۼ����ֽø�˴ϴ�.
		���ǹ����� 		
		- ��ü �ʼ� ���� (��ü���� �����ϴ� �ʼ� ���ǹ�)
		- ��ü ���� ���� (��ü���� �����ϴ� ���� ���ǹ�)
		�� ���ǹ��� �ִ� 10������ ����� �����մϴ�.
		�Է� ���� ����Ͻ� ���ǹ��� ��� �ݵ�� 10�ڸ� �Է��� �ּž� �˴ϴ�.
		��뿩�δ� ����� ��� 1, �̻���� ��� 0�� ǥ���մϴ�.
		��) ��ϵ� ���ǹ� �� ���ǹ� �� 1,3,5,6,��° ���ǹ��� ����ϰ� ���� ���
			agree2_map = "1010110000";
			���Ϸ� ���ǹ��� ���� ���
			agree3_map = "0000000000";
	*/
	String agree2_map = "0000000000"; // ��ü �ʼ� ���ǹ�
	String agree3_map = "0000000000"; // ��ü ���� ���ǹ�
	
	/*
		����� CI���� ��������� �������� ����
		Y : CI�� ��������� ����, N : CI�� ��������� ���� ����
		
		CI�� ����Ȯ���� ���������� ������ ��츸 ���� �� �ֽ��ϴ�.
	*/
	String cigubun 	= "N";

	/*
		�˾�â�� �����ϴ� �Է°����� �����Ǵ� �������� ��ҹ�ư �� �˾�â�� �ݴ� ��ư�� �������ϴ�.
		Y : ��ҹ�ư ����, N : ��ҹ�ư ����
	*/
	String popgubun 	= "N";

	/*
		�Ƚ�Ű ��� ����Ÿ�� ���� �ޱ����� ���������� ���� http���� �Է��մϴ�.
		���� page�� https://~, http://~ ���� �Է��� �ֽñ� �ٶ��ϴ�.
		�θ�â�� �������� ����������� �������� �ݵ�� ��ġ�ϵ��� �Է��� �ֽñ� �ٶ��ϴ�.
	*/ 
	String sReturnUrl = "http://www.test.co.kr/checkplus_success.jsp";      // ������ �̵��� URL
	String sErrorUrl = "http://www.test.co.kr/checkplus_fail.jsp";          // ���н� �̵��� URL

	// �Էµ� plain ����Ÿ�� �����.
	String sPlainData =	"7:REQ_SEQ" 		+ sRequestNumber.getBytes().length 	+ ":" + sRequestNumber +  
						"12:REQ_DATETIME" 	+ req_datetime.getBytes().length 			+ ":" + req_datetime +
						"8:SITECODE" 			+ sSiteCode.getBytes().length 				+ ":" + sSiteCode +
						"9:AUTH_TYPE" 			+ sAuthType.getBytes().length 			+ ":" + sAuthType +
						"10:AGREE1_MAP"  		+ agree1_map.getBytes().length 			+ ":" + agree1_map +
						"10:AGREE2_MAP"  		+ agree2_map.getBytes().length 			+ ":" + agree2_map +
						"10:AGREE3_MAP"  		+ agree3_map.getBytes().length 			+ ":" + agree3_map +
						"8:USERNAME"  			+ username.getBytes().length 			+ ":" + username +
						"9:BIRTHDATE"  			+ birthdate.getBytes().length	 			+ ":" + birthdate +
						"6:GENDER"  			+ gender.getBytes().length 				+ ":" + gender +
						"8:CI_GUBUN" 			+ cigubun.getBytes().length 				+ ":" + cigubun +
						"11:POPUP_GUBUN" 	+ popgubun.getBytes().length 			+ ":" + popgubun +
						"7:RTN_URL" 				+ sReturnUrl.getBytes().length 			+ ":" + sReturnUrl +
						"7:ERR_URL" 				+ sErrorUrl.getBytes().length 				+ ":" + sErrorUrl;

	String sMessage = "";
	String sEncData = "";

	int iReturn = niceCheck.fnEncode(sSiteCode, sSitePassword, sPlainData);
	if( iReturn == 0 )
	{
		sEncData = niceCheck.getCipherData();
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
<title>NICE�ſ������� - CheckPlus �Ƚɺ������� �׽�Ʈ</title>

<script language='javascript'>
window.name ="Parent_window";

function fnPopup(){
window.open('', 'popupChk', 'width=500, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
document.form_chk.action = "https://nice.checkplus.co.kr/CheckPlusSafekeyModel/checkplus.cb";
document.form_chk.target = "popupChk";
document.form_chk.submit();
}
</script>
</head>
<body>
<%= sMessage %><br><br>
��ü���� ��ȣȭ ����Ÿ : [<%= sEncData %>]<br><br>

<!-- �Ƚ�Ű ���� �˾��� ȣ���ϱ� ���ؼ��� ������ ���� form�� �ʿ��մϴ�. -->
<form name="form_chk" method="post">
<input type="hidden" name="m" value="safekeyService">						<!-- �ʼ� ����Ÿ��, �����Ͻø� �ȵ˴ϴ�. -->
<input type="hidden" name="EncodeData" value="<%= sEncData %>">		<!-- ������ ��ü������ ��ȣȭ �� ����Ÿ�Դϴ�. -->

<!-- ��ü���� ����ޱ� ���ϴ� ����Ÿ�� �����ϱ� ���� ����� �� ������, ������� ����� �ش� ���� �״�� �۽��մϴ�.
	    	 �ش� �Ķ���ʹ� �߰��Ͻ� �� �����ϴ�. -->
<input type="hidden" name="param_r1" value="">
<input type="hidden" name="param_r2" value="">
<input type="hidden" name="param_r3" value="">

<a href="javascript:fnPopup();"> �Ƚ�Ű���� ����</a>
</form>
</body>
</html>
