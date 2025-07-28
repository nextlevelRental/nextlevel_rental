<%@ page language="java" contentType="text/html;charset=euc-kr"%>
<%
    /* ============================================================================== */
    /* =   PAGE : ���� ��û PAGE                                                    = */
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
    /* ============================================================================== */
    /* = ���̺귯�� �� ����Ʈ ���� include                                          = */
    /* = -------------------------------------------------------------------------- = */
%>
    <%@ page import="com.kcp.*"%>
    <%@ page import="java.net.URLEncoder"%>
    <%@ include file="../../cfg/site_conf_inc.jsp"%>
<%


	Map paramMap = (Map)request.getAttribute("paramMap");
	Map resultMap = (Map)request.getAttribute("resultMap");

	System.out.println(paramMap);
	System.out.println(resultMap);
	
    /* ============================================================================== */

	  request.setCharacterEncoding("euc-kr") ;
    /* ============================================================================== */
    /* =   01. ���� ��û ���� ����                                                  = */
    /* = -------------------------------------------------------------------------- = */
    String    tran_cd         = "00100500";                                           // �ŷ������ڵ�
    String    cust_ip         = request.getRemoteAddr();                              // ��ûIP
    String    res_cd          = "";                                                   // ����ڵ�
    String    res_msg         = "";                                                   // ����޽���
	String    group_id        = "";                                                   // �׷�ID
    String    batch_key       = "";                                                   // ��ġŰ
	String    pay_type        = "";                                                   // ��������
	String    pay_id          = "";                                                   // ī���ȣ
	String    pay_cert_no     = "";                                                   // �ֹ�(�����)��ȣ
	String    pay_issue_cd    = "";                                                   // ī��߱޻��ڵ�
	String    pay_issue_nm    = "";                                                   // ī��߱޻��̸�
    int       pay_data_set    =  0;
    int       common_data_set =  0;
    int       batch_data_set  =  0;
    /* ============================================================================== */


    /* ============================================================================== */
    /* =   02. �ν��Ͻ� ���� �� �ʱ�ȭ                                              = */
    /* = -------------------------------------------------------------------------- = */
    C_PP_CLI  c_PayPlus = new C_PP_CLI();

    c_PayPlus.mf_init( g_conf_home_dir, g_conf_gw_url, g_conf_gw_port, g_conf_key_dir, g_conf_log_dir, 0 );
    c_PayPlus.mf_init_set();
    /* ============================================================================== */


    /* ============================================================================== */
    /* =   03. ó�� ��û ���� ����, ����                                            = */
    /* = -------------------------------------------------------------------------- = */

    // ��ü ȯ�� ����
    pay_data_set    = c_PayPlus.mf_add_set( "payx_data" );

    // ���� ����
    common_data_set = c_PayPlus.mf_add_set( "common"    );

    c_PayPlus.mf_set_us( common_data_set, "currency"    , "410"   );
    c_PayPlus.mf_set_us( common_data_set, "media_type"  , "R"     );
    c_PayPlus.mf_set_us( common_data_set, "cust_ip"     , cust_ip );

    c_PayPlus.mf_add_rs( pay_data_set, common_data_set );


    // ��ġ ��û����
    batch_data_set = c_PayPlus.mf_add_set( "real_batch" ) ;

    c_PayPlus.mf_set_us( batch_data_set, "tx_type"        , "BC01" );
    c_PayPlus.mf_set_us( batch_data_set, "tx_sub_type"    , "MG01" );


    // �� ��������
	c_PayPlus.mf_set_us( batch_data_set, "group_id"       , request.getParameter("group_id")       ); //�׷�ID
    c_PayPlus.mf_set_us( batch_data_set, "site_cust_id"   , request.getParameter("site_cust_id")   ); //����ȣ
	c_PayPlus.mf_set_us( batch_data_set, "site_apply_ymd" , request.getParameter("site_apply_ymd") ); //��û���� ����
    c_PayPlus.mf_set_us( batch_data_set, "site_apply_no"  , request.getParameter("site_apply_no")  ); //��û���� �Ϸù�ȣ    
    c_PayPlus.mf_set_us( batch_data_set, "bill_type"      , request.getParameter("bill_type")      ); //��������
    c_PayPlus.mf_set_us( batch_data_set, "bill_mony"      , request.getParameter("bill_mony")      ); //�����ݾ�
    c_PayPlus.mf_set_us( batch_data_set, "bill_period"    , request.getParameter("bill_period")    ); //�����ֱ�
    c_PayPlus.mf_set_us( batch_data_set, "bill_day"       , request.getParameter("bill_day")       ); //������
    c_PayPlus.mf_set_us( batch_data_set, "init_bill_ym"   , request.getParameter("init_bill_ym")   ); //���� ������
    c_PayPlus.mf_set_us( batch_data_set, "noti_type"      , request.getParameter("noti_type")      ); //�������


    // �� ������
    c_PayPlus.mf_set_us( batch_data_set, "cust_type"      , request.getParameter("cust_type")      ); //������
    c_PayPlus.mf_set_us( batch_data_set, "cust_name"      , request.getParameter("cust_name")      ); //����
    c_PayPlus.mf_set_us( batch_data_set, "mobile_no"      , request.getParameter("mobile_no")      ); //�޴�����ȣ
    c_PayPlus.mf_set_us( batch_data_set, "tel_no"         , request.getParameter("tel_no")         ); //��ȭ��ȣ
    c_PayPlus.mf_set_us( batch_data_set, "email"          , request.getParameter("email")          ); //E-Mail
    c_PayPlus.mf_set_us( batch_data_set, "pay_relation"   , request.getParameter("pay_relation")   ); //�����ڿ� ����


    // �� ��������
    c_PayPlus.mf_set_us( batch_data_set, "pay_type"       , "PACA"							       ); //��������
    c_PayPlus.mf_set_us( batch_data_set, "pay_id"         , request.getParameter("pay_id")         ); //ī���ȣ
    c_PayPlus.mf_set_us( batch_data_set, "pay_expiry"     , request.getParameter("pay_expiry_yy")     //��ȿ�Ⱓ(YY)
                                                          + request.getParameter("pay_expiry_mm")  ); //��ȿ�Ⱓ(MM)
    c_PayPlus.mf_set_us( batch_data_set, "pay_quota"      , request.getParameter("pay_quota")      ); //�Һ� ������
    c_PayPlus.mf_set_us( batch_data_set, "pay_owner_nm"   , request.getParameter("pay_owner_nm")   ); //ī������ڸ�
    c_PayPlus.mf_set_us( batch_data_set, "pay_cert_no"    , request.getParameter("pay_cert_no")    ); //�ֹε�Ϲ�ȣ


    c_PayPlus.mf_add_rs( pay_data_set, batch_data_set ) ;

    /* ============================================================================== */
    /* =   03-3. ����                                                               = */
    /* ------------------------------------------------------------------------------ */
    c_PayPlus.mf_do_tx( g_conf_site_cd, g_conf_site_key, tran_cd, cust_ip, "0", "3", "0" );

    res_cd  = c_PayPlus.m_res_cd;                              // ��� �ڵ�
    res_msg = c_PayPlus.m_res_msg;                             // ��� �޽���

    if(res_cd.equals("0000"))
    {
        group_id     = c_PayPlus.mf_get_res( "group_id"     ); // �׷�ID
        batch_key    = c_PayPlus.mf_get_res( "batch_key"    ); // ��ġŰ
        pay_type     = c_PayPlus.mf_get_res( "pay_type"     ); // ��������
        pay_id       = c_PayPlus.mf_get_res( "pay_id"       ); // ����ڹ�ȣ
        pay_cert_no  = c_PayPlus.mf_get_res( "pay_cert_no"  ); // �ֹ�(����ڹ�ȣ)
        pay_issue_cd = c_PayPlus.mf_get_res( "pay_issue_cd" ); // ī��߱޻��ڵ�
        pay_issue_nm = c_PayPlus.mf_get_res( "pay_issue_nm" ); // ī��߱޻��̸�

    }
%>

    <html>
    <head>
    <script>
        function goResult()
        {
            document.pay_info.submit();
        }
    </script>
    </head>
    <body onload="goResult()">
    <form name="pay_info" method="post" action="./result.jsp">
        <input type="hidden" name="res_cd"       value="<%=res_cd       %>">           <!-- ��� �ڵ�        -->
        <input type="hidden" name="res_msg"      value="<%=res_msg      %>">           <!-- ��� �޼���      -->
        <input type="hidden" name="group_id"     value="<%=group_id     %>">           <!-- �׷�ID           -->
        <input type="hidden" name="batch_key"    value="<%=batch_key    %>">           <!-- ��ġŰ           -->
        <input type="hidden" name="pay_type"     value="<%=pay_type     %>">           <!-- ��������         -->
        <input type="hidden" name="pay_id"       value="<%=pay_id       %>">           <!-- ����ڹ�ȣ       -->
        <input type="hidden" name="pay_cert_no"  value="<%=pay_cert_no  %>">           <!-- �ֹ�(����ڹ�ȣ) -->
        <input type="hidden" name="pay_issue_cd" value="<%=pay_issue_cd %>">           <!-- ī��߱޻��ڵ�   -->
        <input type="hidden" name="pay_issue_nm" value="<%=pay_issue_nm %>">           <!-- ī��߱޻��̸�   -->
    </form>
    </body>
    </html>
