<%@ page language="java" contentType="text/html;charset=euc-kr"%>
<%
    /* ============================================================================== */
    /* =   PAGE : ���� �뺸 PAGE                                                    = */
    /* = -------------------------------------------------------------------------- = */
    /* =   ������ ������ �߻��ϴ� ��� �Ʒ��� �ּҷ� �����ϼż� Ȯ���Ͻñ� �ٶ��ϴ�.= */
    /* =   ���� �ּ� : http://kcp.co.kr/technique.requestcode.do                    = */
    /* = -------------------------------------------------------------------------- = */
    /* =   Copyright (c)  2016   NHN KCP Inc.   All Rights Reserverd.               = */
    /* ============================================================================== */
%>
	<%@ page import="java.sql.*"%>
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
<% request.setCharacterEncoding("UTF-8"); //���� euc-kr ���� �ѱ��� ���� ������ %>
<%
    /* ============================================================================== */
    /* =   01. ���� �뺸 ������ ����(�ʵ�!!)                                        = */
    /* = -------------------------------------------------------------------------- = */
    /* =   ���� �뺸 ������������,                                                  = */
    /* =   ������� �Ա� �뺸 �����͸� KCP�� ���� �ǽð����� �뺸 ���� �� �ֽ��ϴ�. = */
    /* =                                                                            = */
    /* =   common_return �������� �̷��� �뺸 �����͸� �ޱ� ���� ���� ������        = */
    /* =   �Դϴ�. ������ �������� ��ü�� �°� �����Ͻ� ��, �Ʒ� ������ �����ϼż�  = */
    /* =   KCP ������ �������� ����� �ֽñ� �ٶ��ϴ�.                              = */
    /* =                                                                            = */
    /* =   ��� ����� ������ �����ϴ�.                                             = */
    /* =  - KCP ������������(admin.kcp.co.kr)�� �α��� �մϴ�.                      = */
    /* =  - [���θ� ����] -> [��������] -> [���� URL ����] -> ���� URL ���� �Ŀ�    = */
    /* =    ������ URL�� �Է��մϴ�.                                                = */
    /* ============================================================================== */
    System.out.println("1. KCP �����뺸 ������(common_return.jsp) ȣ��");
    
    /* ============================================================================== */
    /* = * ����/� ���� ����                                                      = */
    /* =----------------------------------------------------------------------------= */
    /* = * KCP ���ǰ��� �ƴ� �ؼ�Ÿ�̾� ��ü ������                                 = */    
    /* = * PROD : �, DEV : ����, LOCAL : ����                                    = */
    /* ============================================================================== */
    String sUrl = request.getRequestURL().toString();
    sUrl = sUrl.toLowerCase();
    
    String g_dev_mode       = "PROD";
    
    if (sUrl.indexOf("172.17.0.135")!=-1) {		// ����
    	g_dev_mode          = "DEV";               
    } else if (sUrl.indexOf("localhost")!=-1) {	// ����                                                                                           
    	g_dev_mode          = "LOCAL";  
	}
    
    /* ============================================================================== */
    /* = * ���������ý��� DB �������� ����                                          = */
    /* =----------------------------------------------------------------------------= */
    /* = * KCP ���ǰ��� �ƴ� �ؼ�Ÿ�̾� ��ü ������                                 = */    
    /* ============================================================================== */
    String g_db_conn        = "jdbc:oracle:thin:@172.17.0.135:1521:NXNEWBIZDEV";
    String g_db_user        = "NXRADMIN";
    String g_db_pw          = "rental~2015^*";
    
    if ("PROD".equals(g_dev_mode)) {
    	g_db_conn           = "jdbc:oracle:thin:@172.17.0.138:1521:NXNEWBIZ";
    	g_db_pw             = "admin_9_rental";
    }


    /* ============================================================================== */
    /* =   02. ���� �뺸 ������ �ޱ�                                                = */
    /* = -------------------------------------------------------------------------- = */
    String site_cd      = f_get_parm( request.getParameter( "site_cd"      ) );  // ����Ʈ �ڵ�
    String tno          = f_get_parm( request.getParameter( "tno"          ) );  // KCP �ŷ���ȣ
    String order_no     = f_get_parm( request.getParameter( "order_no"     ) );  // �ֹ���ȣ
    String tx_cd        = f_get_parm( request.getParameter( "tx_cd"        ) );  // ����ó�� ���� �ڵ�
    String tx_tm        = f_get_parm( request.getParameter( "tx_tm"        ) );  // ����ó�� �Ϸ� �ð�
    /* = -------------------------------------------------------------------------- = */
    String ipgm_name    = "";                                                    // �ֹ��ڸ�
    String remitter     = "";                                                    // �Ա��ڸ�
    String ipgm_mnyx    = "";                                                    // �Ա� �ݾ�
    String ipgm_time    = "";                                                    // �Ա� �ð�
    String bank_code    = "";                                                    // �����ڵ�
    String account      = "";                                                    // ������� �Աݰ��¹�ȣ
    String op_cd        = "";                                                    // ó������ �ڵ�
    String noti_id      = "";                                                    // �뺸 ���̵�
    String cash_no      = "";                                                    // ���ݿ����� �ŷ���ȣ
    String cash_a_no    = "";                                                    // ���ݿ����� ���ι�ȣ
    String cash_a_dt    = "";                                                    // ���ݿ����� ���νð�
                                                        
                                                        
    
    /* = -------------------------------------------------------------------------- = */
    
    System.out.println("2. ���� �뺸 ������");
    System.out.println("tno       = [" + tno + "]"      );
   	System.out.println("site_cd   = [" + site_cd + "]"  );
   	System.out.println("order_no  = [" + order_no + "]" );
   	System.out.println("tx_cd     = [" + tx_cd + "]"    );
   	System.out.println("tx_tm     = [" + tx_tm + "]"    );

    /* = -------------------------------------------------------------------------- = */
    /* =   02-1. ������� �Ա� �뺸 ������ �ޱ�                                     = */
    /* = -------------------------------------------------------------------------- = */
    if ( tx_cd.equals("TX00") )
    {
        ipgm_name = f_get_parm( request.getParameter( "ipgm_name" ) );           // �ֹ��ڸ�
        remitter  = f_get_parm( request.getParameter( "remitter"  ) );           // �Ա��ڸ�
        ipgm_mnyx = f_get_parm( request.getParameter( "ipgm_mnyx" ) );           // �Ա� �ݾ�
        ipgm_time = f_get_parm( request.getParameter( "ipgm_time" ) );           // �Ա� �ð�
        bank_code = f_get_parm( request.getParameter( "bank_code" ) );           // �����ڵ�
        account   = f_get_parm( request.getParameter( "account"   ) );           // ������� �Աݰ��¹�ȣ
        op_cd     = f_get_parm( request.getParameter( "op_cd"     ) );           // ó������ �ڵ�
        noti_id   = f_get_parm( request.getParameter( "noti_id"   ) );           // �뺸 ���̵�
        cash_no   = f_get_parm( request.getParameter( "cash_no"   ) );           // ���ݿ����� �ŷ���ȣ
        cash_a_no = f_get_parm( request.getParameter( "cash_a_no" ) );           // ���ݿ����� ���ι�ȣ
        cash_a_dt = f_get_parm( request.getParameter( "cash_a_dt" ) );           // ���ݿ����� ���νð�
        
        System.out.println("3. ������� �Ա� �뺸 ������");
        System.out.println("ipgm_name = [" + ipgm_name + "]");
    	System.out.println("ipgm_mnyx = [" + ipgm_mnyx + "]");
    	System.out.println("ipgm_time = [" + ipgm_time + "]");
    	System.out.println("account   = [" + account + "]"  );
    	System.out.println("noti_id   = [" + noti_id + "]"  );
    	System.out.println("op_cd     = [" + op_cd + "]"    );
    	System.out.println("remitter  = [" + remitter + "]" );
    	System.out.println("cash_no   = [" + cash_no + "]"  );
    	System.out.println("cash_a_no = [" + cash_a_no + "]");
    	System.out.println("cash_a_dt = [" + cash_a_dt + "]");
    }


    /* ============================================================================== */
    /* =   03. ���� �뺸 ����� ��ü ��ü������ DB ó�� �۾��Ͻô� �κ��Դϴ�.      = */
    /* = -------------------------------------------------------------------------- = */
    /* =   �뺸 ����� DB �۾� �ϴ� �������� ���������� �뺸�� �ǿ� ���� DB �۾���  = */
    /* =   �����Ͽ� DB update �� �Ϸ���� ���� ���, ����� ���뺸 ���� �� �ִ�     = */
    /* =   ���μ����� �����Ǿ� �ֽ��ϴ�.                                            = */
    /* =                                                                            = */
    /* =   * DB update�� ���������� �Ϸ�� ���                                     = */
    /* =   �ϴ��� [04. result �� ���� �ϱ�] ���� result ���� value���� 0000����     = */
    /* =   ������ �ֽñ� �ٶ��ϴ�.                                                  = */
    /* =                                                                            = */
    /* =   * DB update�� ������ ���                                                = */
    /* =   �ϴ��� [04. result �� ���� �ϱ�] ���� result ���� value���� 0000�̿���   = */
    /* =   ������ ������ �ֽñ� �ٶ��ϴ�.                                           = */
    /* = -------------------------------------------------------------------------- = */

    /* = -------------------------------------------------------------------------- = */
    /* =   03-1. ������� �Ա� �뺸 ������ DB ó�� �۾� �κ�                        = */
    /* = -------------------------------------------------------------------------- = */
    if ( tx_cd.equals("TX00") )
    {
    	System.out.println("4. ������� �Ա��뺸 DBó�� ����");
    	    	    	    	
    	Connection conn         = null;
    	CallableStatement cstm  = null;
    	CallableStatement cstm2 = null;
    	
    	try {
    		Class.forName("oracle.jdbc.driver.OracleDriver");
        	conn = DriverManager.getConnection(g_db_conn, g_db_user, g_db_pw); // dev
        	
        	/* 1. �Ա��뺸 ���� ���� */
        	cstm = conn.prepareCall("{call NXRADMIN.PKG_RTRE0142.p_CreateRtre0142KcpNoti(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}");

        	cstm.setString(1, tno);	       								//KCP �ŷ���ȣ
        	cstm.setString(2, site_cd);	   								//����Ʈ �ڵ�
        	cstm.setString(3, order_no);   								//�ֹ���ȣ
        	cstm.setString(4, tx_cd);      								//����ó�� ���� �ڵ�
        	cstm.setString(5, tx_tm);      								//����ó�� �Ϸ� �ð�
        	cstm.setString(6, ipgm_name);  								//�ֹ��ڸ�
        	cstm.setInt(7, Integer.parseInt(ipgm_mnyx));				//�����Աݱݾ�
        	cstm.setInt(8, Integer.parseInt(ipgm_mnyx));				//�Աݱݾ��հ�
        	cstm.setString(9, ipgm_time); 								//�Ա��Ͻ�
        	cstm.setString(10, account);   								//�Աݰ�����¹�ȣ
        	cstm.setString(11, noti_id);   								//�Ա��뺸ID
        	cstm.setString(12, op_cd);     								//�Աݰ���ڵ�
        	cstm.setString(13, remitter);  								//�Ա��ڸ�
        	cstm.setString(14, cash_no);        						//���ݿ����� �ŷ���ȣ
        	cstm.setString(15, cash_a_no); 								//���ݿ����� ���ι�ȣ
        	cstm.setString(16, cash_a_dt); 								//���ݿ����� ���νð�
        	cstm.registerOutParameter(17, java.sql.Types.DECIMAL);
        	cstm.registerOutParameter(18, java.sql.Types.VARCHAR);
        	cstm.registerOutParameter(19, java.sql.Types.VARCHAR);
        	
        	cstm.execute();
        	
			String logData = "5. ������� �Ա��뺸 ������ = V_SUCCESS_CODE:" + cstm.getInt(17) + "\t" + "V_RETURN_MESSAGE:" + cstm.getString(18)+  "\t" + "V_ERRORTEXT:" + cstm.getString(19);
			System.out.println(logData);
			
			/* 2. ����ó�� */
			if (op_cd != "13" && cstm.getInt(17) == 0) {
				cstm2 = conn.prepareCall("{call NXRADMIN.PKG_RTRE0142.p_CreateRtre0142VaReceive(?, ?, ?, ?, ?, ?)}");

	        	cstm2.setString(1, tno);								//KCP �ŷ���ȣ
	        	cstm2.setString(2, noti_id);							//�Ա��뺸ID
	        	cstm2.setString(3, "KCP_NOTI");							//�����ID
	        	cstm2.registerOutParameter(4, java.sql.Types.DECIMAL);
	        	cstm2.registerOutParameter(5, java.sql.Types.VARCHAR);
	        	cstm2.registerOutParameter(6, java.sql.Types.VARCHAR);
	        	
	        	cstm2.execute();
	        	
				String logData2 = "6. ������� ����ó�� ��� = V_SUCCESS_CODE:" + cstm2.getInt(4) + "\t" + "V_RETURN_MESSAGE:" + cstm2.getString(5)+  "\t" + "V_ERRORTEXT:" + cstm2.getString(6);
				System.out.println(logData2);
			}
        	
    	} catch (SQLException e) {
    		throw new SQLException(e.getMessage(), e.getCause());
    	} finally {
    		cstm.close();
    		cstm2.close();
    		conn.close();
    	}
    }

    /* = -------------------------------------------------------------------------- = */
    /* =   03-2. ����ϰ�����ü �뺸 ������ DB ó�� �۾� �κ�                       = */
    /* = -------------------------------------------------------------------------- = */
    else if ( tx_cd.equals("TX08") )
    {
    }
    /* ============================================================================== */


    /* ============================================================================== */
    /* =   04. result �� ���� �ϱ�                                                  = */
    /* = -------------------------------------------------------------------------- = */
    /* =   ���������� ó���� ��� value���� 0000���� �����Ͽ� �ֽñ� �ٶ��ϴ�.      = */
    /* ============================================================================== */
%>
<html><body><form><input type="hidden" name="result" value="0000"></form></body></html>