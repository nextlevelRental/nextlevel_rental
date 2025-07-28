<%@ page language="java" contentType="text/html;charset=euc-kr" %>

<%

    NiceID.Check.CPClient niceCheck = new  NiceID.Check.CPClient();

    String sEncodeData = requestReplace(request.getParameter("EncodeData"), "encodeData");
    String sReserved1  = requestReplace(request.getParameter("param_r1"), "");
    String sReserved2  = requestReplace(request.getParameter("param_r2"), "");
    String sReserved3  = requestReplace(request.getParameter("param_r3"), "");

    String sSiteCode = "";				// NICE�κ��� �ο����� ����Ʈ �ڵ�
    String sSitePassword = "";			// NICE�κ��� �ο����� ����Ʈ �н�����

    String sCipherTime = "";			// ��ȣȭ�� �ð�
    String sRequestNumber = "";			// ��û ��ȣ
    String sResponseNumber = "";		// ���� ������ȣ  
    String sSafekey = "";				// �Ƚ�Ű
    String sAuthType = "";				// �������� ����
    String sReturnCode = "";			// ����ڵ�
    String sReturnMsg = "";				// ��� �޽���
    String sRequestTime = "";			// ��û�ð�
    String sAuthTime = "";				// �����ð�    
    String sAgree1Map = "";				// �̿��ڰ� ������ ���̽� �ʼ� ���ǹ�
    String sAgree2Map = "";				// �̿��ڰ� ������ ��ü �ʼ� ���ǹ�    
    String sAgree3Map = "";    			// �̿��ڰ� ������ ��ü ���� ���ǹ�
    String sCi = ""; 					// CI����
    String sMessage = "";
    String sPlainData = "";
    
    int iReturn = niceCheck.fnDecode(sSiteCode, sSitePassword, sEncodeData);

    if( iReturn == 0 )
    {
        sPlainData = niceCheck.getPlainData();
        sCipherTime = niceCheck.getCipherDateTime();
        
        // ����Ÿ�� �����մϴ�.
        java.util.HashMap mapresult = niceCheck.fnParse(sPlainData);
        
        //�Ʒ��� ���� ����Ÿ�� ���� ���� �κ��̴�.
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
            sMessage = "���ǰ��� �ٸ��ϴ�. �ùٸ� ��η� �����Ͻñ� �ٶ��ϴ�.";
            sResponseNumber = "";
            sAuthType = "";
        }
    }
    else if( iReturn == -1)
    {
        sMessage = "��ȣȭ �ý��� �����Դϴ�.";
    }    
    else if( iReturn == -4)
    {
        sMessage = "��ȣȭ ó�������Դϴ�.";
    }    
    else if( iReturn == -5)
    {
        sMessage = "��ȣȭ �ؽ� �����Դϴ�.";
    }    
    else if( iReturn == -6)
    {
        sMessage = "��ȣȭ ������ �����Դϴ�.";
    }    
    else if( iReturn == -9)
    {
        sMessage = "�Է� ������ �����Դϴ�.";
    }    
    else if( iReturn == -12)
    {
        sMessage = "����Ʈ �н����� �����Դϴ�.";
    }    
    else
    {
        sMessage = "�˼� ���� ���� �Դϴ�. iReturn : " + iReturn;
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
    <title>NICE�ſ������� - �Ƚ�Ű �׽�Ʈ</title>
</head>
<body>
    <center>
    <p><p><p><p>
    �Ƚ�Ű ���� ���<br>
    <table border=1>
        <tr>
            <td>��ȣȭ�� �ð�</td>
            <td><%= sCipherTime %> (YYMMDDHHMMSS)</td>
        </tr>
        <tr>
            <td>��û ��ȣ</td>
            <td><%= sRequestNumber %></td>
        </tr>            
        <tr>
            <td>NICE���� ��ȣ</td>
            <td><%= sResponseNumber %></td>
        </tr> 
        <tr>
            <td>����ڵ�</td>
            <td><%= sReturnCode %></td>
        </tr> 
        <tr>
            <td>����޼���</td>
            <td><%= sReturnMsg %></td>
        </tr>            
        <tr>
            <td>��������</td>
            <td><%= sAuthType %></td>
        </tr>        
        <tr>
            <td>��û �ð�</td>
            <td><%= sRequestTime %></td>
        </tr>            
        <tr>
            <td>���� �ð�</td>
            <td><%= sAuthTime %></td>
        </tr> 
        <tr>
            <td>�Ƚ�Ű</td>
            <td><%= sSafekey %></td>
        </tr>
        <tr>
            <td>���̽� �ʼ� ���ǹ� ���� ���</td>
            <td><%= sAgree1Map %></td>
        </tr>
        <tr>
            <td>��ü �ʼ� ���ǹ� ���� ���</td>
            <td><%= sAgree2Map %></td>
        </tr>
        <tr>
            <td>��ü ���� ���ǹ� ���� ���</td>
            <td><%= sAgree3Map %></td>
        </tr>
        <tr>
            <td>CI����</td>
            <td><%= sCi %></td>
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
        <tr>
            <td>RESERVED3</td>
            <td><%= sReserved3 %></td>
        </tr>
    </table><br><br>        
    <%= sMessage %><br>
    </center>
</body>
</html>