<%@ page language="java" contentType="text/html;charset=euc-kr"%>
<%
    /* ============================================================================== */
    /* =   PAGE : ��� ó�� PAGE                                                    = */
    /* = -------------------------------------------------------------------------- = */
    /* =   Copyright (c)  2013   KCP Inc.   All Rights Reserverd.                   = */
    /* ============================================================================== */
%>
<%!
    /* ============================================================================== */
    /* =   null ���� ó���ϴ� �޼ҵ�                                                = */
    /* = -------------------------------------------------------------------------- = */
        public String f_get_parm( String val )
        {
          if ( val == null ) val = "";
          return  val;
        }
    /* ============================================================================== */
%>
<%

    request.setCharacterEncoding("euc-kr") ;
    /* ============================================================================== */
    /* =   ���� ���                                                                = */
    /* = -------------------------------------------------------------------------- = */

        String res_cd           = f_get_parm( request.getParameter( "res_cd"         ) );
        String res_msg          = f_get_parm( request.getParameter( "res_msg"        ) );
        String group_id         = f_get_parm( request.getParameter( "group_id"       ) );
        String batch_key        = f_get_parm( request.getParameter( "batch_key"      ) );
        String pay_type         = f_get_parm( request.getParameter( "pay_type"       ) );
        String pay_id           = f_get_parm( request.getParameter( "pay_id"         ) );
        String pay_cert_no      = f_get_parm( request.getParameter( "pay_cert_no"    ) );
        String pay_issue_cd     = f_get_parm( request.getParameter( "pay_issue_cd"   ) );
        String pay_issue_nm     = f_get_parm( request.getParameter( "pay_issue_nm"   ) );

    /* ============================================================================== */

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http:'www.w3.org/1999/xhtml" >

<head>
    <title>*** KCP Payment System ***</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
    <link href="css/style.css" rel="stylesheet" type="text/css" id="cssLink"/>
</head>

<body>
    <div id="sample_wrap">
    <form name="mod" method="post">
        <h1>[������]<span> �� �������� ���� ����� ����ϴ� ����(����) �������Դϴ�.</span></h1>
    <div class="sample">
        <p>
          ��û ����� ����ϴ� ������ �Դϴ�.<br />
          ��û�� ���������� ó���� ��� ����ڵ�(res_cd)���� 0000���� ǥ�õ˴ϴ�.
        </p>
<%
    /* ============================================================================== */
    /* =   ���� ��� �ڵ� �� �޽��� ���(����������� �ݵ�� ������ֽñ� �ٶ��ϴ�.)= */
    /* = -------------------------------------------------------------------------- = */
    /* =   ���� ���� : res_cd���� 0000���� �����˴ϴ�.                              = */
    /* =   ���� ���� : res_cd���� 0000�̿��� ������ �����˴ϴ�.                     = */
    /* = -------------------------------------------------------------------------- = */
%>
                    <h2>&sdot; ó�� ���</h2>
                    <table class="tbl" cellpadding="0" cellspacing="0">
                        <!-- ��� �ڵ� -->
                        <tr>
                          <th>��� �ڵ�</th>
                          <td><%=res_cd%></td>
                        </tr>
                        <!-- ��� �޽��� -->
                        <tr>
                          <th>��� �޼���</th>
                          <td><%=res_msg%></td>
                        </tr>
                    </table>
<%
                /* = -------------------------------------------------------------------------- = */
                /* =   ���� ��� �ڵ� �� �޽��� ��� ��                                         = */
                /* ============================================================================== */

                /* ============================================================================== */
                /* =   01. ���� ��� ���                                                       = */
                /* = -------------------------------------------------------------------------- = */

                if(res_cd.equals("0000"))
                {
%>
                    <h2>&sdot; ���� ���� ����</h2>
                    <table class="tbl" cellpadding="0" cellspacing="0">

                        <!-- �׷�ID -->
                        <tr>
                            <th>�׷�ID</th>
                            <td><%=group_id%></td>
                        </tr>
                        <!-- ��ġŰ -->
                        <tr>
                            <th>��ġŰ</th>
                            <td><%=batch_key%></td>
                        </tr>
                        <!-- �������� -->
                        <tr>
                            <th>��������</th>
                            <td><%=pay_type%></td>
                        </tr>
                        <!-- ī���ȣ -->
                        <tr>
                            <th>ī���ȣ</th>
                            <td><%=pay_id%></td>
                        </tr>
                        <!-- �ֹ�(����ڹ�ȣ) -->
                        <tr>
                            <th>�ֹ�(����ڹ�ȣ)</th>
                            <td><%=pay_cert_no%></td>
                        </tr>
                        <!-- ī��߱޻��ڵ� -->
                        <tr>
                            <th>ī��߱޻��ڵ�</th>
                            <td><%=pay_issue_cd%></td>
                        </tr>
                        <!-- ī��߱޻��̸� -->
                        <tr>
                            <th>ī��߱޻��̸�</th>
                            <td><%=pay_issue_nm%></td>
                        </tr>
                    </table>
<%
                }
                /* = -------------------------------------------------------------------------- = */
                /* =   01. ���� ��� ��� END                                                   = */
                /* ============================================================================== */
%>
                    <!-- ó������ �̹��� ��ư -->
                <tr>
                <div class="btnset">
                <a href="../index.html" class="home">ó������</a>
                </div>
                </tr>
              </tr>
            </div>
        <div class="footer">
                Copyright (c) KCP INC. All Rights reserved.
        </div>
    </div>
  </body>
</html>
