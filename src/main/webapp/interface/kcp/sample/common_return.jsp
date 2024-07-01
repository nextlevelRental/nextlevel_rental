<%@ page language="java" contentType="text/html;charset=euc-kr"%>
<%
    /* ============================================================================== */
    /* =   PAGE : 공통 통보 PAGE                                                    = */
    /* = -------------------------------------------------------------------------- = */
    /* =   연동시 오류가 발생하는 경우 아래의 주소로 접속하셔서 확인하시기 바랍니다.= */
    /* =   접속 주소 : http://kcp.co.kr/technique.requestcode.do                    = */
    /* = -------------------------------------------------------------------------- = */
    /* =   Copyright (c)  2016   NHN KCP Inc.   All Rights Reserverd.               = */
    /* ============================================================================== */
%>
	<%@ page import="java.sql.*"%>
<%!
    /* ============================================================================== */
    /* =   null 값을 처리하는 메소드                                                = */
    /* = -------------------------------------------------------------------------- = */
        public String f_get_parm( String val )
        {
          if ( val == null ) val = "";
          return  val;
        }
    /* ============================================================================== */
%>
<% request.setCharacterEncoding("UTF-8"); //기존 euc-kr 에서 한글이 깨져 변경함 %>
<%
    /* ============================================================================== */
    /* =   01. 공통 통보 페이지 설명(필독!!)                                        = */
    /* = -------------------------------------------------------------------------- = */
    /* =   공통 통보 페이지에서는,                                                  = */
    /* =   가상계좌 입금 통보 데이터를 KCP를 통해 실시간으로 통보 받을 수 있습니다. = */
    /* =                                                                            = */
    /* =   common_return 페이지는 이러한 통보 데이터를 받기 위한 샘플 페이지        = */
    /* =   입니다. 현재의 페이지를 업체에 맞게 수정하신 후, 아래 사항을 참고하셔서  = */
    /* =   KCP 관리자 페이지에 등록해 주시기 바랍니다.                              = */
    /* =                                                                            = */
    /* =   등록 방법은 다음과 같습니다.                                             = */
    /* =  - KCP 관리자페이지(admin.kcp.co.kr)에 로그인 합니다.                      = */
    /* =  - [쇼핑몰 관리] -> [정보변경] -> [공통 URL 정보] -> 공통 URL 변경 후에    = */
    /* =    가맹점 URL을 입력합니다.                                                = */
    /* ============================================================================== */
    System.out.println("1. KCP 공통통보 페이지(common_return.jsp) 호출");
    
    /* ============================================================================== */
    /* = * 개발/운영 구분 설정                                                      = */
    /* =----------------------------------------------------------------------------= */
    /* = * KCP 정의값이 아닌 넥센타이어 자체 설정값                                 = */    
    /* = * PROD : 운영, DEV : 개발, LOCAL : 로컬                                    = */
    /* ============================================================================== */
    String sUrl = request.getRequestURL().toString();
    sUrl = sUrl.toLowerCase();
    
    String g_dev_mode       = "PROD";
    
    if (sUrl.indexOf("172.17.0.135")!=-1) {		// 개발
    	g_dev_mode          = "DEV";               
    } else if (sUrl.indexOf("localhost")!=-1) {	// 로컬                                                                                           
    	g_dev_mode          = "LOCAL";  
	}
    
    /* ============================================================================== */
    /* = * 영업관리시스템 DB 접속정보 설정                                          = */
    /* =----------------------------------------------------------------------------= */
    /* = * KCP 정의값이 아닌 넥센타이어 자체 설정값                                 = */    
    /* ============================================================================== */
    String g_db_conn        = "jdbc:oracle:thin:@172.17.0.135:1521:NXNEWBIZDEV";
    String g_db_user        = "NXRADMIN";
    String g_db_pw          = "rental~2015^*";
    
    if ("PROD".equals(g_dev_mode)) {
    	g_db_conn           = "jdbc:oracle:thin:@172.17.0.138:1521:NXNEWBIZ";
    	g_db_pw             = "admin_9_rental";
    }


    /* ============================================================================== */
    /* =   02. 공통 통보 데이터 받기                                                = */
    /* = -------------------------------------------------------------------------- = */
    String site_cd      = f_get_parm( request.getParameter( "site_cd"      ) );  // 사이트 코드
    String tno          = f_get_parm( request.getParameter( "tno"          ) );  // KCP 거래번호
    String order_no     = f_get_parm( request.getParameter( "order_no"     ) );  // 주문번호
    String tx_cd        = f_get_parm( request.getParameter( "tx_cd"        ) );  // 업무처리 구분 코드
    String tx_tm        = f_get_parm( request.getParameter( "tx_tm"        ) );  // 업무처리 완료 시간
    /* = -------------------------------------------------------------------------- = */
    String ipgm_name    = "";                                                    // 주문자명
    String remitter     = "";                                                    // 입금자명
    String ipgm_mnyx    = "";                                                    // 입금 금액
    String ipgm_time    = "";                                                    // 입금 시간
    String bank_code    = "";                                                    // 은행코드
    String account      = "";                                                    // 가상계좌 입금계좌번호
    String op_cd        = "";                                                    // 처리구분 코드
    String noti_id      = "";                                                    // 통보 아이디
    String cash_no      = "";                                                    // 현금영수증 거래번호
    String cash_a_no    = "";                                                    // 현금영수증 승인번호
    String cash_a_dt    = "";                                                    // 현금영수증 승인시간
                                                        
                                                        
    
    /* = -------------------------------------------------------------------------- = */
    
    System.out.println("2. 공통 통보 데이터");
    System.out.println("tno       = [" + tno + "]"      );
   	System.out.println("site_cd   = [" + site_cd + "]"  );
   	System.out.println("order_no  = [" + order_no + "]" );
   	System.out.println("tx_cd     = [" + tx_cd + "]"    );
   	System.out.println("tx_tm     = [" + tx_tm + "]"    );

    /* = -------------------------------------------------------------------------- = */
    /* =   02-1. 가상계좌 입금 통보 데이터 받기                                     = */
    /* = -------------------------------------------------------------------------- = */
    if ( tx_cd.equals("TX00") )
    {
        ipgm_name = f_get_parm( request.getParameter( "ipgm_name" ) );           // 주문자명
        remitter  = f_get_parm( request.getParameter( "remitter"  ) );           // 입금자명
        ipgm_mnyx = f_get_parm( request.getParameter( "ipgm_mnyx" ) );           // 입금 금액
        ipgm_time = f_get_parm( request.getParameter( "ipgm_time" ) );           // 입금 시간
        bank_code = f_get_parm( request.getParameter( "bank_code" ) );           // 은행코드
        account   = f_get_parm( request.getParameter( "account"   ) );           // 가상계좌 입금계좌번호
        op_cd     = f_get_parm( request.getParameter( "op_cd"     ) );           // 처리구분 코드
        noti_id   = f_get_parm( request.getParameter( "noti_id"   ) );           // 통보 아이디
        cash_no   = f_get_parm( request.getParameter( "cash_no"   ) );           // 현금영수증 거래번호
        cash_a_no = f_get_parm( request.getParameter( "cash_a_no" ) );           // 현금영수증 승인번호
        cash_a_dt = f_get_parm( request.getParameter( "cash_a_dt" ) );           // 현금영수증 승인시간
        
        System.out.println("3. 가상계좌 입금 통보 데이터");
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
    /* =   03. 공통 통보 결과를 업체 자체적으로 DB 처리 작업하시는 부분입니다.      = */
    /* = -------------------------------------------------------------------------- = */
    /* =   통보 결과를 DB 작업 하는 과정에서 정상적으로 통보된 건에 대해 DB 작업에  = */
    /* =   실패하여 DB update 가 완료되지 않은 경우, 결과를 재통보 받을 수 있는     = */
    /* =   프로세스가 구성되어 있습니다.                                            = */
    /* =                                                                            = */
    /* =   * DB update가 정상적으로 완료된 경우                                     = */
    /* =   하단의 [04. result 값 세팅 하기] 에서 result 값의 value값을 0000으로     = */
    /* =   설정해 주시기 바랍니다.                                                  = */
    /* =                                                                            = */
    /* =   * DB update가 실패한 경우                                                = */
    /* =   하단의 [04. result 값 세팅 하기] 에서 result 값의 value값을 0000이외의   = */
    /* =   값으로 설정해 주시기 바랍니다.                                           = */
    /* = -------------------------------------------------------------------------- = */

    /* = -------------------------------------------------------------------------- = */
    /* =   03-1. 가상계좌 입금 통보 데이터 DB 처리 작업 부분                        = */
    /* = -------------------------------------------------------------------------- = */
    if ( tx_cd.equals("TX00") )
    {
    	System.out.println("4. 가상계좌 입금통보 DB처리 시작");
    	    	    	    	
    	Connection conn         = null;
    	CallableStatement cstm  = null;
    	CallableStatement cstm2 = null;
    	
    	try {
    		Class.forName("oracle.jdbc.driver.OracleDriver");
        	conn = DriverManager.getConnection(g_db_conn, g_db_user, g_db_pw); // dev
        	
        	/* 1. 입금통보 내역 저장 */
        	cstm = conn.prepareCall("{call NXRADMIN.PKG_RTRE0142.p_CreateRtre0142KcpNoti(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}");

        	cstm.setString(1, tno);	       								//KCP 거래번호
        	cstm.setString(2, site_cd);	   								//사이트 코드
        	cstm.setString(3, order_no);   								//주문번호
        	cstm.setString(4, tx_cd);      								//업무처리 구분 코드
        	cstm.setString(5, tx_tm);      								//업무처리 완료 시간
        	cstm.setString(6, ipgm_name);  								//주문자명
        	cstm.setInt(7, Integer.parseInt(ipgm_mnyx));				//실제입금금액
        	cstm.setInt(8, Integer.parseInt(ipgm_mnyx));				//입금금액합계
        	cstm.setString(9, ipgm_time); 								//입금일시
        	cstm.setString(10, account);   								//입금가상계좌번호
        	cstm.setString(11, noti_id);   								//입금통보ID
        	cstm.setString(12, op_cd);     								//입금결과코드
        	cstm.setString(13, remitter);  								//입금자명
        	cstm.setString(14, cash_no);        						//현금영수증 거래번호
        	cstm.setString(15, cash_a_no); 								//현금영수증 승인번호
        	cstm.setString(16, cash_a_dt); 								//현금영수증 승인시간
        	cstm.registerOutParameter(17, java.sql.Types.DECIMAL);
        	cstm.registerOutParameter(18, java.sql.Types.VARCHAR);
        	cstm.registerOutParameter(19, java.sql.Types.VARCHAR);
        	
        	cstm.execute();
        	
			String logData = "5. 가상계좌 입금통보 저장결과 = V_SUCCESS_CODE:" + cstm.getInt(17) + "\t" + "V_RETURN_MESSAGE:" + cstm.getString(18)+  "\t" + "V_ERRORTEXT:" + cstm.getString(19);
			System.out.println(logData);
			
			/* 2. 수납처리 */
			if (op_cd != "13" && cstm.getInt(17) == 0) {
				cstm2 = conn.prepareCall("{call NXRADMIN.PKG_RTRE0142.p_CreateRtre0142VaReceive(?, ?, ?, ?, ?, ?)}");

	        	cstm2.setString(1, tno);								//KCP 거래번호
	        	cstm2.setString(2, noti_id);							//입금통보ID
	        	cstm2.setString(3, "KCP_NOTI");							//등록자ID
	        	cstm2.registerOutParameter(4, java.sql.Types.DECIMAL);
	        	cstm2.registerOutParameter(5, java.sql.Types.VARCHAR);
	        	cstm2.registerOutParameter(6, java.sql.Types.VARCHAR);
	        	
	        	cstm2.execute();
	        	
				String logData2 = "6. 가상계좌 수납처리 결과 = V_SUCCESS_CODE:" + cstm2.getInt(4) + "\t" + "V_RETURN_MESSAGE:" + cstm2.getString(5)+  "\t" + "V_ERRORTEXT:" + cstm2.getString(6);
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
    /* =   03-2. 모바일계좌이체 통보 데이터 DB 처리 작업 부분                       = */
    /* = -------------------------------------------------------------------------- = */
    else if ( tx_cd.equals("TX08") )
    {
    }
    /* ============================================================================== */


    /* ============================================================================== */
    /* =   04. result 값 세팅 하기                                                  = */
    /* = -------------------------------------------------------------------------- = */
    /* =   정상적으로 처리된 경우 value값을 0000으로 설정하여 주시기 바랍니다.      = */
    /* ============================================================================== */
%>
<html><body><form><input type="hidden" name="result" value="0000"></form></body></html>