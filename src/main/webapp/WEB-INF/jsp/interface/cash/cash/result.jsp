<%@ page language="java" contentType="text/html;charset=euc-kr" %>
<%
    /* ============================================================================== */
    /* =   PAGE : ��� ó�� PAGE                                                    = */
    /* = -------------------------------------------------------------------------- = */
    /* =   ������ ������ �߻��ϴ� ��� �Ʒ��� �ּҷ� �����ϼż� Ȯ���Ͻñ� �ٶ��ϴ�.= */
    /* =   ���� �ּ� : http://testpay.kcp.co.kr/pgsample/FAQ/search_error.jsp       = */
    /* = -------------------------------------------------------------------------- = */
    /* =   Copyright (c)  2007   KCP Inc.   All Rights Reserved.                    = */
    /* ============================================================================== */
%>
    <%@ include file="../configure/site.conf"%>

<%
    /* ============================================================================== */
    request.setCharacterEncoding("euc-kr") ;
    /* ============================================================================== */
    /* =   ���� ���                                                                = */
    /* = -------------------------------------------------------------------------- = */
    String req_tx	    = request.getParameter( "req_tx"       ) ;                  // ��û ����
    String bSucc	    = request.getParameter( "bSucc"        ) ;                  // DBó�� ����
    String trad_time    = request.getParameter( "trad_time"    ) ;                  // ���ŷ� �ð�
    /* = --------------------------------------------------------------------------= */
    String ordr_idxx    = request.getParameter( "ordr_idxx"    ) ;                  // �ֹ���ȣ
    String buyr_name    = request.getParameter( "buyr_name"    ) ;                  // �ֹ��� �̸�
    String buyr_tel1    = request.getParameter( "buyr_tel1"    ) ;                  // �ֹ��� ��ȭ��ȣ
    String buyr_mail    = request.getParameter( "buyr_mail"    ) ;                  // �ֹ��� ����
    String good_name    = request.getParameter( "good_name"    ) ;                  // �ֹ���ǰ��
    String comment      = request.getParameter( "comment"      ) ;                  // ���
    /* = --------------------------------------------------------------------------= */
    String corp_type    = request.getParameter( "corp_type"    ) ;                  // ����� ����
    String corp_tax_type= request.getParameter( "corp_tax_type") ;                  // ����/�鼼 ����
    String corp_tax_no  = request.getParameter( "corp_tax_no"  ) ;                  // ���� ����� ��ȣ
    String corp_nm      = request.getParameter( "corp_nm"      ) ;                  // ��ȣ
    String corp_owner_nm= request.getParameter( "corp_owner_nm") ;                  // ��ǥ�ڸ�
    String corp_addr    = request.getParameter( "corp_addr"    ) ;                  // ������ּ�
    String corp_telno   = request.getParameter( "corp_telno"   ) ;                  // ����� ��ǥ ����ó
    /* = --------------------------------------------------------------------------= */
    String user_type    = request.getParameter( "user_type"    ) ;                  // ����� ����
    String tr_code      = request.getParameter( "tr_code"      ) ;                  // ����뵵
    String id_info      = request.getParameter( "id_info"      ) ;                  // �ź�Ȯ�� ID
    String amt_tot      = request.getParameter( "amt_tot"      ) ;                  // �ŷ��ݾ� �� ��
    String amt_sup      = request.getParameter( "amt_sup"      ) ;                  // ���ް���
    String amt_svc      = request.getParameter( "amt_svc"      ) ;                  // �����
    String amt_tax      = request.getParameter( "amt_tax"      ) ;                  // �ΰ���ġ��
    String pay_type     = request.getParameter( "pay_type"     ) ;                  // ���� ���� ����
    String pay_trade_no = request.getParameter( "pay_trade_no" ) ;                  // ���� �ŷ���ȣ
    /* = --------------------------------------------------------------------------= */                                                                   
    String mod_type     = request.getParameter( "mod_type"     ) ;                  // ���� Ÿ��
    String mod_value    = request.getParameter( "mod_value"    ) ;                  // ���� ��û �ŷ���ȣ
    String mod_gubn     = request.getParameter( "mod_gubn"     ) ;                  // ���� ��û �ŷ���ȣ ����
    String mod_mny      = request.getParameter( "mod_mny"      ) ;                  // ���� ��û �ݾ�
    String rem_mny      = request.getParameter( "rem_mny"      ) ;                  // ����ó�� ���� �ݾ�
    /* = --------------------------------------------------------------------------= */
    String res_cd       = request.getParameter( "res_cd"       ) ;                  // �����ڵ�
    String res_msg      = request.getParameter( "res_msg"      ) ;                  // ����޽���
    String cash_no      = request.getParameter( "cash_no"      ) ;                  // ���ݿ����� �ŷ���ȣ
    String receipt_no   = request.getParameter( "receipt_no"   ) ;                  // ���ݿ����� ���ι�ȣ
    String app_time     = request.getParameter( "app_time"     ) ;                  // ���νð�(YYYYMMDDhhmmss)
    String reg_stat     = request.getParameter( "reg_stat"     ) ;                  // ��� ���� �ڵ�
    String reg_desc     = request.getParameter( "reg_desc"     ) ;                  // ��� ���� ����
    /* = -------------------------------------------------------------------------- = */

    String req_tx_name = "" ;

    if( req_tx.equals( "pay" ) )
        req_tx_name = "���" ;
    else if( req_tx.equals( "mod" ) )
        req_tx_name = "����/��ȸ" ;
%>
    <html>
    <head>
    <link href="css/sample.css" rel="stylesheet" type="text/css">
    <script language="javascript">
        <!-- ���ݿ����� ���� ��ũ��Ʈ -->
        function receiptView(term_id, orderid, bill_yn, authno)
        {
        	if( term_id.length == 5 )
        		term_id = "PGNW"+term_id;

            receiptWin = "https://admin.kcp.co.kr/Modules/Service/Cash/Cash_Bill_Common_View.jsp?"+"term_id="+term_id+"&"+"orderid="+orderid+"&"+"bill_yn="+bill_yn+"&"+"authno="+authno;
            window.open(receiptWin , "" , "width=360, height=640")
        }
    </script>
    </head>
    <body>
    <center>
    <table border="0" cellpadding="0" cellspacing="1" width="500" align="center">
        <tr>
            <td align="left" height="25"><img src="./img/KcpLogo.jpg" border="0" width="65" height="50"></td>
            <td align="right" class="txt_main">KCP Online Payment System [CASH HUB JSP Version]</td>
        </tr>
        <tr>
            <td bgcolor="CFCFCF" height="3" colspan="2"></td>
        </tr>
        <tr>
            <td colspan="2">
                <br>
                <table width="90%" align="center">
                    <tr>
                        <td bgcolor="CFCFCF" height="2"></td>
                    </tr>
                    <tr>
                        <td align="center">��� ������(���ݿ����� <%=req_tx_name%>)</td>
                    </tr>
                    <tr>
                        <td bgcolor="CFCFCF" height="2"></td>
                    </tr>
                </table>
<%
    if ( req_tx.equals ( "pay" ) )                      // �ŷ� ���� : ���
    {
        if ( !bSucc.equals ( "false" ) )                 // ��ü DB ó�� ����
        {
            if ( res_cd.equals ( "0000" ) )             // ���� ����
            {
%>
                <table width="85%" align="center" border="0" cellpadding="0" cellspacing="1">
                    <tr>
                        <td>����ڵ�</td>
                        <td><%=res_cd%></td>
                    </tr>
                    <tr><td colspan="2"><IMG SRC="./img/dot_line.gif" width="100%"></td></tr>
                    <tr>
                        <td>��� �޼���</td>
                        <td><%=res_msg%></td>
                    </tr>
                    <tr><td colspan="2"><IMG SRC="./img/dot_line.gif" width="100%"></td></tr>
                    <tr>
                        <td>���ݿ����� �ŷ���ȣ</td>
                        <td><%=cash_no%></td>
                    </tr>
                    <tr><td colspan="2"><IMG SRC="./img/dot_line.gif" width="100%"></td></tr>
                    <tr>
                        <td>���ݿ����� ���ι�ȣ</td>
                        <td><%=receipt_no%></td>
                    </tr>
                    <tr><td colspan="2"><IMG SRC="./img/dot_line.gif" width="100%"></td></tr>
                    <tr>
                        <td>��� ���� �ڵ�</td>
                        <td><%=reg_stat%></td>
                    </tr>
                    <tr><td colspan="2"><IMG SRC="./img/dot_line.gif" width="100%"></td></tr>
                    <tr>
                        <td>��� ���� ����</td>
                        <td><%=reg_desc%></td>
                    </tr>
                    <tr><td colspan="2"><IMG SRC="./img/dot_line.gif" width="100%"></td></tr>
                    <tr>
                        <td>���νð�</td>
                        <td><%=app_time%></td>
                    </tr>
                    <tr><td colspan="2"><IMG SRC="./img/dot_line.gif" width="100%"></td></tr>
                    <tr>
                        <td>���ݿ����� URL</td>
                        <td><input type="button" name="receiptView" value="������ Ȯ��" class="box" onClick="javascript:receiptView('<%=cash_no%>')"></td>
                    </tr>
                    <tr><td colspan="2"><IMG SRC="./img/dot_line.gif" width="100%"></td></tr>
                    <tr>
                        <td colspan="2">�� ������ Ȯ���� �� ����� ��쿡�� �����մϴ�.</td>
                    </tr>
                </table>
<%
            }
            else
            {                                        // ���� ����
%>
                <table width="85%" align="center" border="0" cellpadding="0" cellspacing="1">
                    <tr>
                        <td>����ڵ�</td>
                        <td><%=res_cd%></td>
                    </tr>
                    <tr><td colspan="2"><IMG SRC="./img/dot_line.gif" width="100%"></td></tr>
                    <tr>
                        <td>��� �޼���</td>
                        <td><%=res_msg%></td>
                    </tr>
                </table>
<%
            }
        }
        else                                            // ��ü DB ó�� ����
        {
%>
                <table width="85%" align="center" border="0" cellpadding="0" cellspacing="1">
                    <tr>
                        <td nowrap>��� ����ڵ�</td>
                        <td><%=res_cd%></td>
                    </tr>
                    <tr><td colspan="2"><IMG SRC="./img/dot_line.gif" width="100%"></td></tr>
                    <tr>
                        <td nowrap>��� ��� �޼���</td>
                        <td><%=res_msg%></td>
                    </tr>
                    <tr><td colspan="2"><IMG SRC="./img/dot_line.gif" width="100%"></td></tr>
                    <tr>
                        <td nowrap>�󼼸޼���</td>
                        <td>
<%
            if ( res_cd.equals ( "0000" ) )
            {
                out.println("������ ���������� �̷�������� ���θ����� ���� ����� ó���ϴ� �� ������ �߻��Ͽ� �ý��ۿ��� �ڵ����� ��� ��û�� �Ͽ����ϴ�. <br> ���θ��� ��ȭ�Ͽ� Ȯ���Ͻñ� �ٶ��ϴ�.") ;
            }
            else
            {
                out.println("������ ���������� �̷�������� ���θ����� ���� ����� ó���ϴ� �� ������ �߻��Ͽ� �ý��ۿ��� �ڵ����� ��� ��û�� �Ͽ�����, <br> <b>��Ұ� ���� �Ǿ����ϴ�.</b><br> ���θ��� ��ȭ�Ͽ� Ȯ���Ͻñ� �ٶ��ϴ�.") ;

            }

%>
                        </td>
                    </tr>
                </table>
<%
        }
    }
    else if ( req_tx.equals ( "mod" ) )                      // �ŷ� ���� : ��ȸ/��� ��û
    {
    	if ( res_cd.equals ( "0000" ) )
    	{
%>

                <table width="85%" align="center" border="0" cellpadding="0" cellspacing="1">
                    <tr>
                        <td>����ڵ�</td>
                        <td><%=res_cd%></td>
                    </tr>
                    <tr><td colspan="2"><IMG SRC="./img/dot_line.gif" width="100%"></td></tr>
                    <tr>
                        <td>��� �޼���</td>
                        <td><%=res_msg%></td>
                    </tr>
                    <tr><td colspan="2"><IMG SRC="./img/dot_line.gif" width="100%"></td></tr>
                    <tr>
                        <td>���ݿ����� �ŷ���ȣ</td>
                        <td><%=cash_no%></td>
                    </tr>
                    <tr><td colspan="2"><IMG SRC="./img/dot_line.gif" width="100%"></td></tr>
                    <tr>
                        <td>���ݿ����� ���ι�ȣ</td>
                        <td><%=receipt_no%></td>
                    </tr>
                    <tr><td colspan="2"><IMG SRC="./img/dot_line.gif" width="100%"></td></tr>
                    <tr>
                        <td>��� ���� �ڵ�</td>
                        <td><%=reg_stat%></td>
                    </tr>
                    <tr><td colspan="2"><IMG SRC="./img/dot_line.gif" width="100%"></td></tr>
                    <tr>
                        <td>��� ���� ����</td>
                        <td><%=reg_desc%></td>
                    </tr>
                    <tr><td colspan="2"><IMG SRC="./img/dot_line.gif" width="100%"></td></tr>
                    <tr>
                        <td>���νð�</td>
                        <td><%=app_time%></td>
                    </tr>
                    <tr><td colspan="2"><IMG SRC="./img/dot_line.gif" width="100%"></td></tr>
                    <tr>
                        <td>���ݿ����� URL</td>
                        <td><input type="button" name="receiptView" value="������ Ȯ��" class="box" onClick="javascript:receiptView('<%=g_conf_site_id%>', '<%=ordr_idxx%>', 'Y', '<%=receipt_no%>')"></td>
                    </tr>
                    <tr><td colspan="2"><IMG SRC="./img/dot_line.gif" width="100%"></td></tr>
                    <tr>
                        <td colspan="2">�� ������ Ȯ���� �� ����� ��쿡�� �����մϴ�.</td>
                    </tr>
                </table>
<%
        }
		else
		{
%>
                <table width="85%" align="center" border="0" cellpadding="0" cellspacing="1">
                    <tr>
                        <td>����ڵ�</td>
                        <td><%= res_cd %></td>
                    </tr>
                    <tr><td colspan="2"><IMG SRC="./img/dot_line.gif" width="100%"></td></tr>
                    <tr>
                        <td>��� �޼���</td>
                        <td><%= res_msg %></td>
                    </tr>
                </table>
<%
		}
    }
%>
                <table width="90%" border="0" align="center">
                    <tr>
                        <td bgcolor="CFCFCF" height="2"></td>
                    </tr>
                    <tr>
                        <td height="2">&nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td bgcolor="CFCFCF" height="3" colspan="2"></td>
        </tr>
    </table>
    </center>
    </body>
    </html>