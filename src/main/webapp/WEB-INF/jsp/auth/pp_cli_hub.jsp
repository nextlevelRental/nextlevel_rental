<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.http.HttpServlet"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>
<%@ page import="javax.servlet.http.HttpServletResponse"%>
<%@ page import="javax.servlet.ServletException"%>
<%@ page import="java.io.IOException"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.nexacro.xapi.data.PlatformData" %>
<%@ page import="com.nexacro.xapi.data.VariableList" %>
<%@ page import="com.nexacro.xapi.data.DataSet" %>
<%@ page import="com.nexacro.xapi.tx.HttpPlatformResponse" %>
<%@ page import="com.nexacro.xapi.data.DataTypes" %>
<%@ page import="com.nexacro.xapi.data.ColumnHeader" %>


<%
    /* ============================================================================== */
    /* =   PAGE : 지불 요청 PAGE                                                    = */
    /* = -------------------------------------------------------------------------- = */
    /* =   Copyright (c)  2013   KCP Inc.   All Rights Reserverd.                   = */
    /* ============================================================================== */
%>
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
<%
    /* ============================================================================== */
    /* = 라이브러리 및 사이트 정보 include                                          = */
    /* = -------------------------------------------------------------------------- = */
%>
    <%@ page import="com.kcp.*"%>
    <%@ page import="java.net.URLEncoder"%>
    <%@ include file="../../cfg/site_conf_inc.jsp"%>
<%



Map resultMap = (Map)request.getAttribute("resultMap");
System.out.println("======================================================");
System.out.println(resultMap);
System.out.println("======================================================");
    /* ============================================================================== */

	  request.setCharacterEncoding("utf-8") ;
    /* ============================================================================== */
    /* =   01. 지불 요청 정보 설정                                                  = */
    /* = -------------------------------------------------------------------------- = */
    String    tran_cd         		= "00100500";                                           // 거래구분코드
    String    cust_ip        			= request.getRemoteAddr();                          // 요청IP
    String    res_cd          		= "";                                                   // 결과코드
    String    res_msg         		= "";                                                   // 결과메시지
	String    group_id        		= "";                                                   // 그룹ID
    String    batch_key       		= "";                                                   // 배치키
	String    pay_type        		= "";                                                   // 결제수단
	String    pay_id          		= "";                                                   // 카드번호
	String    pay_cert_no     		= "";                                                   // 주민(사업자)번호
	String    pay_issue_cd    		= "";                                                   // 카드발급사코드
	String    pay_issue_nm    		= "";                                                   // 카드발급사이름
    int       pay_data_set    		=  0;
    int       common_data_set 	=  0;
    int       batch_data_set  		=  0;
    /* ============================================================================== */


    /* ============================================================================== */
    /* =   02. 인스턴스 생성 및 초기화                                              = */
    /* = -------------------------------------------------------------------------- = */
    C_PP_CLI  c_PayPlus = new C_PP_CLI();

    c_PayPlus.mf_init( g_conf_home_dir, g_conf_gw_url, g_conf_gw_port, g_conf_key_dir, g_conf_log_dir, 0 );
    c_PayPlus.mf_init_set();
    /* ============================================================================== */


    /* ============================================================================== */
    /* =   03. 처리 요청 정보 설정, 실행                                            = */
    /* = -------------------------------------------------------------------------- = */

    // 업체 환경 정보
    pay_data_set    = c_PayPlus.mf_add_set( "payx_data" );

    // 공통 정보
    common_data_set = c_PayPlus.mf_add_set( "common"    );

    c_PayPlus.mf_set_us( common_data_set, "currency"    , "410"   );
    c_PayPlus.mf_set_us( common_data_set, "media_type"  , "R"     );
    c_PayPlus.mf_set_us( common_data_set, "cust_ip"     , cust_ip );

    c_PayPlus.mf_add_rs( pay_data_set, common_data_set );


    // 배치 신청정보
    batch_data_set = c_PayPlus.mf_add_set( "real_batch" ) ;

    c_PayPlus.mf_set_us( batch_data_set, "tx_type"        , "BC01" );
    c_PayPlus.mf_set_us( batch_data_set, "tx_sub_type"    , "MG01" );


    // ▣ 과금정보
	/*c_PayPlus.mf_set_us( batch_data_set, "group_id"       , request.getParameter("group_id")       ); //그룹ID
    c_PayPlus.mf_set_us( batch_data_set, "site_cust_id"   , request.getParameter("site_cust_id")   ); //고객번호
	c_PayPlus.mf_set_us( batch_data_set, "site_apply_ymd" , request.getParameter("site_apply_ymd") ); //신청접수 일자
    c_PayPlus.mf_set_us( batch_data_set, "site_apply_no"  , request.getParameter("site_apply_no")  ); //신청접수 일련번호    
    c_PayPlus.mf_set_us( batch_data_set, "bill_type"      , request.getParameter("bill_type")      ); //결제유형
    c_PayPlus.mf_set_us( batch_data_set, "bill_mony"      , request.getParameter("bill_mony")      ); //결제금액
    c_PayPlus.mf_set_us( batch_data_set, "bill_period"    , request.getParameter("bill_period")    ); //결제주기
    c_PayPlus.mf_set_us( batch_data_set, "bill_day"       , request.getParameter("bill_day")       ); //결제일
    c_PayPlus.mf_set_us( batch_data_set, "init_bill_ym"   , request.getParameter("init_bill_ym")   ); //최초 결제월
    c_PayPlus.mf_set_us( batch_data_set, "noti_type"      , request.getParameter("noti_type")      ); //고지방법*/


    
    c_PayPlus.mf_set_us( batch_data_set, "group_id", 			(String)resultMap.get("group_id")); 		//그룹ID
    c_PayPlus.mf_set_us( batch_data_set, "site_cust_id",    	(String)resultMap.get("custNo")); 			//고객번호
	c_PayPlus.mf_set_us( batch_data_set, "site_apply_ymd", 	(String)resultMap.get("ccertDay")); 		//신청접수 일자
    c_PayPlus.mf_set_us( batch_data_set, "site_apply_no", 	(String)resultMap.get("ccertSeq")); 		//신청접수 일련번호  
    
    System.out.println("########################################");
    System.out.println((String)resultMap.get("ccertDay"));
    System.out.println((String)resultMap.get("ccertSeq"));
    System.out.println("########################################");
    
    
    
    c_PayPlus.mf_set_us( batch_data_set, "bill_type", 			"01"); 											//결제유형
    c_PayPlus.mf_set_us( batch_data_set, "bill_mony", 			"1004"); 										//결제금액
    c_PayPlus.mf_set_us( batch_data_set, "bill_period", 		"12" ); 										//결제주기
    c_PayPlus.mf_set_us( batch_data_set, "bill_day", 			"01"); 											//결제일
    c_PayPlus.mf_set_us( batch_data_set, "init_bill_ym", 		""); 											//최초 결제월
    c_PayPlus.mf_set_us( batch_data_set, "noti_type", 			"111"); 										//고지방법
    
    // ▣ 고객정보
    String cust_type = resultMap.get("cmbGubun") == null ? "" : (String)resultMap.get("cmbGubun") ; //개인, 법인구분

	if("01".equals(cust_type)) {
    	c_PayPlus.mf_set_us( batch_data_set, "cust_type", 	 		"P"); 											//고객유형(P개인, C법인)
	} else if("02".equals(cust_type)) {
    	c_PayPlus.mf_set_us( batch_data_set, "cust_type", 	 		"C"); 											//고객유형(P개인, C법인)
	}
   
    
    c_PayPlus.mf_set_us( batch_data_set, "cust_name", 		(String)resultMap.get("custNm")); 		//고객명
    c_PayPlus.mf_set_us( batch_data_set, "mobile_no", 		(String)resultMap.get("mobNo")); 		//휴대폰번호
    c_PayPlus.mf_set_us( batch_data_set, "tel_no",				""); //전화번호
    c_PayPlus.mf_set_us( batch_data_set, "email", 				(String)resultMap.get("emailAddr")); 		//E-Mail
    c_PayPlus.mf_set_us( batch_data_set, "pay_relation", 		""); //결제자와 관계


    // ▣ 결제정보
    c_PayPlus.mf_set_us( batch_data_set, "pay_type", 			"PACA"							       ); //결제수단
    c_PayPlus.mf_set_us( batch_data_set, "pay_id", 				(String)resultMap.get("cardNo"));   //카드번호
    
    String yyyy = (String)resultMap.get("expireYm");
    String yy    = "";
    String mm  = "";
   	 if(!"".equals(yyyy)) {
   		yy = yyyy.substring(2, 4);
   		mm = yyyy.substring(4, 6);
   	} else {
   		yy = "00";
   		mm = "00";
   	}
   	System.out.println((String)resultMap.get("pay_expiry_mm") + "==========================================" );
    c_PayPlus.mf_set_us( batch_data_set, "pay_expiry"     ,  yy     //유효기간(YY)
                                                          			+ mm ); //유효기간(MM)
    c_PayPlus.mf_set_us( batch_data_set, "pay_quota", 		""); //할부 개월수
    c_PayPlus.mf_set_us( batch_data_set, "pay_owner_nm", (String)resultMap.get("ownerNm")   ); //카드소유자명
   
    
    if("01".equals(cust_type)) {
    	c_PayPlus.mf_set_us( batch_data_set, "pay_cert_no"    , (String)resultMap.get("pay_cert_no") + "*******"   ); 	//주민등록번호
    } else if("02".equals(cust_type)) {
    	c_PayPlus.mf_set_us( batch_data_set, "pay_cert_no"    , (String)resultMap.get("busl_no") ); 							//사업자번호
    }

    c_PayPlus.mf_add_rs( pay_data_set, batch_data_set ) ;

    /* ============================================================================== */
    /* =   03-3. 실행                                                               = */
    /* ------------------------------------------------------------------------------ */
    c_PayPlus.mf_do_tx( g_conf_site_cd, g_conf_site_key, tran_cd, cust_ip, "0", "3", "0" );

    res_cd  = c_PayPlus.m_res_cd;                              // 결과 코드
    res_msg = c_PayPlus.m_res_msg;                             // 결과 메시지

    
    if(res_cd.equals("0000"))
    {
        group_id     		= c_PayPlus.mf_get_res( "group_id"     ); // 그룹ID
        batch_key    		= c_PayPlus.mf_get_res( "batch_key"    ); // 배치키
        pay_type     		= c_PayPlus.mf_get_res( "pay_type"     ); // 결제수단
        pay_id       		= c_PayPlus.mf_get_res( "pay_id"       ); // 사업자번호
        pay_cert_no  	= c_PayPlus.mf_get_res( "pay_cert_no"  ); // 주민(사업자번호)
        pay_issue_cd 	= c_PayPlus.mf_get_res( "pay_issue_cd" ); // 카드발급사코드
        pay_issue_nm 	= c_PayPlus.mf_get_res( "pay_issue_nm" ); // 카드발급사이름

    }
    
	PlatformData resData = new PlatformData();
	VariableList resVarList = resData.getVariableList(); 
	DataSet ds = new DataSet("batch_output");
	ds.addColumn(new ColumnHeader("res_cd", 			DataTypes.STRING));
	ds.addColumn(new ColumnHeader("res_msg", 		DataTypes.STRING));
	ds.addColumn(new ColumnHeader("group_id", 		DataTypes.STRING));
	ds.addColumn(new ColumnHeader("batchKey", 		DataTypes.INT));
	ds.addColumn(new ColumnHeader("pay_type", 		DataTypes.INT));
	ds.addColumn(new ColumnHeader("pay_id", 			DataTypes.INT));
	ds.addColumn(new ColumnHeader("pay_cert_no", 	DataTypes.STRING));
	ds.addColumn(new ColumnHeader("cardcomCd", 		DataTypes.STRING));
	ds.addColumn(new ColumnHeader("pay_issue_nm", 	DataTypes.STRING));
	ds.addColumn(new ColumnHeader("ccertDay", 		DataTypes.STRING));
	ds.addColumn(new ColumnHeader("ccertSeq", 		DataTypes.STRING));
    
	int row = ds.newRow();
	ds.set(row, "res_cd", 			res_cd);
	ds.set(row, "res_msg", 			res_msg);
	ds.set(row, "group_id", 		group_id);
	ds.set(row, "batchKey", 		batch_key);
	ds.set(row, "pay_type", 			pay_type);
	ds.set(row, "pay_id", 			pay_id);
	ds.set(row, "pay_cert_no", 		pay_cert_no);
	ds.set(row, "cardcomCd", 		pay_issue_cd);
	ds.set(row, "pay_issue_nm", 	pay_issue_nm);
	ds.set(row, "ccertDay",	 		(String)resultMap.get("ccertDay"));
	ds.set(row, "ccertSeq", 			(String)resultMap.get("ccertSeq"));
    
	resData.addDataSet(ds);
	resVarList.add("ErrorCode", 0);
	resVarList.add("ErrorMsg", "SUCC");
	
	System.out.println("#####################################");
	System.out.println(resData.saveXml());
	System.out.println("#####################################");
	
	HttpPlatformResponse res = new HttpPlatformResponse(response);
	res.setData(resData);
	res.sendData();
%>
