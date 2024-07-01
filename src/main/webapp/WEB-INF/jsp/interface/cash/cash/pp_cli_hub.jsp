<%@ page language="java" contentType="text/html;charset=utf-8" %>
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
<%@ page import="org.apache.commons.logging.Log" %>
<%@ page import="org.apache.commons.logging.LogFactory" %>
<%
/* ============================================================================== */
/* =   PAGE : 등록/변경 처리 PAGE                                               = */
/* = -------------------------------------------------------------------------- = */
/* =   연동시 오류가 발생하는 경우 아래의 주소로 접속하셔서 확인하시기 바랍니다.= */
/* =   접속 주소 : http://testpay.kcp.co.kr/pgsample/FAQ/search_error.jsp       = */
/* = -------------------------------------------------------------------------- = */
/* =   Copyright (c)  2007   KCP Inc.   All Rights Reserved.                    = */
/* ============================================================================== */

/* ============================================================================== */
/* = 라이브러리 및 사이트 정보 include                                          = */
/* = -------------------------------------------------------------------------- = */
%>
<%@ page import="com.kcp.*" %>
<%@ include file="../configure/site.conf" %>

<%!
    /* ============================================================================== */
    /* =   null 값을 처리하는 메소드                                                 = */
    /* = -------------------------------------------------------------------------- = */
        public String f_get_parm( String val ){
          if ( val == null ) val = "";
          return  val;
        }
    /* ============================================================================== */
%>

<%
	Map result = (Map)request.getAttribute("result");
    request.setCharacterEncoding("utf-8") ;
    Log logger = LogFactory.getLog(this.getClass());





    logger.debug("[START_01. 요청 정보 설정]pp_cli_hub.jsp==================================");
    logger.debug("작업구분(C:발행,D:취소) 		: "+(String)result.get("jobGb"));			
	logger.debug("수납거래번호 					: "+result.get("recvSeq")+"");			
	logger.debug("등록자 ID 					: "+(String)result.get("regId"));		
	logger.debug("현금영수증 발행 일련번호 		: "+result.get("cashSeq")+"");				
	logger.debug("현금영수증 이력번호 			: "+result.get("cashIseq")+"");				
	logger.debug("주문구분번호 					: "+(String)result.get("ordrIdxx"));		
	logger.debug("상품명 						: "+(String)result.get("goodNm"));	
	logger.debug("주문자명 						: "+(String)result.get("buyrNm"));	
	logger.debug("주문자 전화번호 				: "+(String)result.get("buyrTel"));			
	logger.debug("요청 종류 					: "+(String)result.get("reqTx"));		
	logger.debug("사업장 구분 					: "+(String)result.get("coType"));		
	logger.debug("과세/면세 구분 				: "+(String)result.get("CtaxType"));		
	logger.debug("발행 사업자번호 				: "+(String)result.get("ctaxNo"));			
	logger.debug("상호			 				: "+(String)result.get("coNm"));			
	logger.debug("대표자명						: "+(String)result.get("cownerNm"));	
	logger.debug("사업장 주소 					: "+(String)result.get("coAdd"));	
	logger.debug("사업장 대표 연락처 			: "+(String)result.get("coTel"));		
	logger.debug("원 거래시각 					: "+(String)result.get("tradTm"));			
	logger.debug("발행용도 						: "+(String)result.get("trCode"));		
	logger.debug("신분확인 ID					: "+(String)result.get("idInfo"));	
	logger.debug("거래금액 총 합				: "+(String)result.get("amtTot"));		
	logger.debug("공급가액 						: "+(String)result.get("amtSup"));			
	logger.debug("봉사료 						: "+(String)result.get("amtSvc"));	
	logger.debug("부가가치세					: "+(String)result.get("amtTax"));	
	logger.debug("변경 타입 					: "+(String)result.get("modType"));			
	logger.debug("변경요청 거래번호 구분 		: "+(String)result.get("modGb"));		
	logger.debug("변경요청 거래번호 			: "+(String)result.get("modVal"));			
	logger.debug("변경요청 금액					: "+(String)result.get("modMny"));			
	logger.debug("변경처리 이전 금액 			: "+(String)result.get("remMny"));			
	logger.debug("successCode 					: "+result.get("successCode")+"");			
	logger.debug("returnMessage 				: "+(String)result.get("returnMessage"));
	logger.debug("errorText 					: "+(String)result.get("errorText"));
	logger.debug("[END_01. 요청 정보 설정]pp_cli_hub.jsp==================================");





/* ============================================================================== */
/* =   01. 요청 정보 설정                                                       = */
    String res_cd       = "";                               // 결과코드
    String res_msg      = "";                               // 결과메시지
    String tx_cd        = "";                               // 트랜잭션 코드
    String bSucc        = "";                               // DB 작업 성공 여부
    /* = --------------------------------------------------------------------------= */
    String pay_type	    = "";								//request.getParameter( "pay_type"     ) ;// 결제 서비스 구분
    String pay_trade_no = "";								//request.getParameter( "pay_trade_no" ) ;// 결제거래번호
    /* = --------------------------------------------------------------------------= */
    String req_tx	    = (String)result.get("reqTx");		//request.getParameter( "req_tx"       ) ;// 요청 종류
    String trad_time    = (String)result.get("tradTm");		//request.getParameter( "trad_time"    ) ;// 원거래 시각
    /* = --------------------------------------------------------------------------= */
    String ordr_idxx    = (String)result.get("ordrIdxx");	//request.getParameter( "ordr_idxx"    ) ;// 주문번호
    String buyr_name    = (String)result.get("buyrNm");		//request.getParameter( "buyr_name"    ) ;// 주문자 이름
    String buyr_tel1    = (String)result.get("buyrTel");	//request.getParameter( "buyr_tel1"    ) ;// 주문자 전화번호
    String buyr_tel2    = "";								//request.getParameter( "buyr_tel2"    ) ;// 주문자 전화번호
    String buyr_mail    = "";								//request.getParameter( "buyr_mail"    ) ;// 주문자 메일
    String good_name    = (String)result.get("goodNm");		//request.getParameter( "good_name"    ) ;// 주문상품명
    String comment      = "";								//request.getParameter( "comment"      ) ;// 비고
    /* = ---------------------------------------------.-----------------------------= */
    String cash_no      = "" ;                              // 현금영수증 거래번호
    String receipt_no   = "" ;                              // 현금영수증 승인번호
    String app_time     = "" ;                              // 승인시간(YYYYMMDDhhmmss)
    String reg_stat     = "" ;                              // 등록 상태 코드
    String reg_desc     = "" ;                              // 등록 상태 설명
    /* = --------------------------------------------------------------------------= */
    String corp_type    = (String)result.get("coType");		//request.getParameter( "corp_type"    ) ;// 사업장 구분
    String corp_tax_type= (String)result.get("CtaxType");	//request.getParameter( "corp_tax_type") ;// 과세/면세 구분
    String corp_tax_no  = (String)result.get("ctaxNo");		//request.getParameter( "corp_tax_no"  ) ;// 발행 사업자 번호
    String corp_nm      = (String)result.get("coNm");		//request.getParameter( "corp_nm"      ) ;// 상호
    String corp_owner_nm= (String)result.get("cownerNm");	//request.getParameter( "corp_owner_nm") ;// 대표자명
    String corp_addr    = (String)result.get("coAdd");		//request.getParameter( "corp_addr"    ) ;// 사업장주소
    String corp_telno   = (String)result.get("coTel");		//request.getParameter( "corp_telno"   ) ;// 사업장 대표 연락처
    /* = --------------------------------------------------------------------------= */
    String user_type    = "";								//request.getParameter( "user_type"    ) ;// 사용자 구분
    String tr_code      = (String)result.get("trCode");		//request.getParameter( "tr_code"      ) ;// 발행용도
    String id_info      = (String)result.get("idInfo");		//request.getParameter( "id_info"      ) ;// 신분확인 ID
    String amt_tot      = (String)result.get("amtTot");		//request.getParameter( "amt_tot"      ) ;// 거래금액 총 합
    String amt_sup      = (String)result.get("amtSup");		//request.getParameter( "amt_sup"      ) ;// 공급가액
    String amt_svc      = (String)result.get("amtSvc");		//request.getParameter( "amt_svc"      ) ;// 봉사료
    String amt_tax      = (String)result.get("amtTax");		//request.getParameter( "amt_tax"      ) ;// 부가가치세
    /* = --------------------------------------------------------------------------= */
    String mod_type     = (String)result.get("modType");	//request.getParameter( "mod_type"     ) ;// 변경 타입
    String mod_value    = (String)result.get("modVal");		//request.getParameter( "mod_value"    ) ;// 변경 요청 거래번호
    String mod_gubn     = (String)result.get("modGb");		//request.getParameter( "mod_gubn"     ) ;// 변경 요청 거래번호 구분
    String mod_mny      = (String)result.get("modMny");		//request.getParameter( "mod_mny"      ) ;// 변경 요청 금액
    String rem_mny      = (String)result.get("remMny");		//request.getParameter( "rem_mny"      ) ;// 변경처리 이전 금액
/* ============================================================================== */





/* ============================================================================== */
/* =   02. 인스턴스 생성 및 초기화                                              = */
    C_PP_CLI  c_PayPlus = new C_PP_CLI();
    c_PayPlus.mf_init( g_conf_home_dir, g_conf_pa_url, g_conf_pa_port, g_conf_key_dir, g_conf_log_dir, g_conf_tx_mode );
    c_PayPlus.mf_init_set();
/* ============================================================================== */





/* ============================================================================== */
/* =   03. 처리 요청 정보 설정, 실행                                            = */
    // 업체 환경 정보
    String cust_ip = request.getRemoteAddr();
    if( req_tx.equals("pay") ){
/* =   03-1. 승인 요청                                                          = */
        tx_cd = "07010000" ; // 현금영수증 등록 요청
        
        int rcpt_data_set ;
        int ordr_data_set ;
        int corp_data_set ;

        rcpt_data_set   = c_PayPlus.mf_add_set( "rcpt_data" ) ;
		ordr_data_set   = c_PayPlus.mf_add_set( "ordr_data" ) ;
		corp_data_set   = c_PayPlus.mf_add_set( "corp_data" ) ;

		// 현금영수증 정보
		c_PayPlus.mf_set_us( rcpt_data_set, "user_type", g_conf_user_type ) ;
        c_PayPlus.mf_set_us( rcpt_data_set, "trad_time", trad_time ) ;
        c_PayPlus.mf_set_us( rcpt_data_set, "tr_code"  , tr_code   ) ;
        c_PayPlus.mf_set_us( rcpt_data_set, "id_info"  , id_info   ) ;
        c_PayPlus.mf_set_us( rcpt_data_set, "amt_tot"  , amt_tot   ) ;
        c_PayPlus.mf_set_us( rcpt_data_set, "amt_sup"  , amt_sup   ) ;
        c_PayPlus.mf_set_us( rcpt_data_set, "amt_svc"  , amt_svc   ) ;
        c_PayPlus.mf_set_us( rcpt_data_set, "amt_tax"  , amt_tax   ) ;
        c_PayPlus.mf_set_us( rcpt_data_set, "pay_type" , "PAXX"    ) ;

        // 주문 정보
        c_PayPlus.mf_set_us( ordr_data_set, "ordr_idxx", ordr_idxx ) ;
        c_PayPlus.mf_set_us( ordr_data_set, "good_name", good_name ) ;
        c_PayPlus.mf_set_us( ordr_data_set, "buyr_name", buyr_name ) ;
        c_PayPlus.mf_set_us( ordr_data_set, "buyr_tel1", buyr_tel1 ) ;
        c_PayPlus.mf_set_us( ordr_data_set, "buyr_mail", buyr_mail ) ;
        c_PayPlus.mf_set_us( ordr_data_set, "comment"  , comment   ) ;

        // 가맹점 정보
        c_PayPlus.mf_set_us( corp_data_set, "corp_type" , corp_type ) ;

        // 입점몰인 경우 판매상점 DATA 전문 생성
        if( "1".equals( corp_type ) ){
            c_PayPlus.mf_set_us( corp_data_set, "corp_tax_type"   , corp_tax_type  ) ;
            c_PayPlus.mf_set_us( corp_data_set, "corp_tax_no"     , corp_tax_no    ) ;
            c_PayPlus.mf_set_us( corp_data_set, "corp_sell_tax_no", corp_tax_no    ) ;
            c_PayPlus.mf_set_us( corp_data_set, "corp_nm"         , corp_nm        ) ;
            c_PayPlus.mf_set_us( corp_data_set, "corp_owner_nm"   , corp_owner_nm  ) ;
            c_PayPlus.mf_set_us( corp_data_set, "corp_addr"       , corp_addr      ) ;
            c_PayPlus.mf_set_us( corp_data_set, "corp_telno"      , corp_telno     ) ;
        }

        c_PayPlus.mf_add_rs( ordr_data_set , rcpt_data_set ) ;
        c_PayPlus.mf_add_rs( ordr_data_set , corp_data_set ) ;
    }else if( req_tx.equals("mod") ) {
/* =   03-2. 취소 요청                                                          = */
        int mod_data_set_no ;
        mod_data_set_no = c_PayPlus.mf_add_set( "mod_data" ) ;
        if( mod_type.equals("STSQ") ){
            tx_cd = "07030000" ;     		// 조회 요청
        }else{
            tx_cd = "07020000" ;     		// 취소 요청
        }

        if( mod_type.equals( "STPC" ) ){	// 부분 취소
            c_PayPlus.mf_set_us( mod_data_set_no, "mod_mny"  , mod_mny ) ;
            c_PayPlus.mf_set_us( mod_data_set_no, "rem_mny"  , rem_mny ) ;
        }

        c_PayPlus.mf_set_us( mod_data_set_no, "mod_type"  , mod_type  ) ;
        c_PayPlus.mf_set_us( mod_data_set_no, "mod_value" , mod_value ) ;
        c_PayPlus.mf_set_us( mod_data_set_no, "mod_gubn"  , mod_gubn  ) ;
        c_PayPlus.mf_set_us( mod_data_set_no, "trad_time" , trad_time ) ;
    }
/* ============================================================================== */





/* ============================================================================== */
    if ( tx_cd.length() > 0 ){
        c_PayPlus.mf_do_tx( g_conf_site_id, "", tx_cd, cust_ip, ordr_idxx, g_conf_log_level, "0" ) ;
    }else{
        c_PayPlus.m_res_cd  = "9562" ;
        c_PayPlus.m_res_msg = "연동 오류" ;
    }
    res_cd  = c_PayPlus.m_res_cd ;	// 결과 코드
    res_msg = c_PayPlus.m_res_msg ;	// 결과 메시지
/* ============================================================================== */




logger.debug("KCP 응답 START*****************************************");
logger.debug("결과 코드   				: " + res_cd);
logger.debug("결과 메시지 				: " + res_msg);
logger.debug("req_tx 					: " + req_tx);
logger.debug("현금영수증 거래번호 	 	: " + c_PayPlus.mf_get_res( "cash_no"    ));
logger.debug("현금영수증 승인번호 	 	: " + c_PayPlus.mf_get_res( "receipt_no" ));
logger.debug("승인시간(YYYYMMDDhhmmss) 	: " + c_PayPlus.mf_get_res( "app_time"   ));
logger.debug("등록 상태 코드 			: " + c_PayPlus.mf_get_res( "reg_stat"   ));
logger.debug("등록 상태 설명 			: " + c_PayPlus.mf_get_res( "reg_desc"   ));
logger.debug("KCP 응답 END*****************************************");




/* ============================================================================== */
/* =   04. 승인 결과 처리                                                       = */
    if ( req_tx.equals("pay") ){
        if ( res_cd.equals("0000") ){
        	cash_no    = c_PayPlus.mf_get_res( "cash_no"    ) ;     // 현금영수증 거래번호
            receipt_no = c_PayPlus.mf_get_res( "receipt_no" ) ;     // 현금영수증 승인번호
            app_time   = c_PayPlus.mf_get_res( "app_time"   ) ;     // 승인시간(YYYYMMDDhhmmss)
            reg_stat   = c_PayPlus.mf_get_res( "reg_stat"   ) ;     // 등록 상태 코드
            reg_desc   = c_PayPlus.mf_get_res( "reg_desc"   ) ;     // 등록 상태 설명
    /* = -------------------------------------------------------------------------- = */
    /* =   04-1. 승인 결과를 업체 자체적으로 DB 처리 작업하시는 부분입니다.           = */
    /* = -------------------------------------------------------------------------- = */
    /* =         승인 결과를 DB 작업 하는 과정에서 정상적으로 승인된 건에 대해         = */
    /* =         DB 작업을 실패하여 DB update 가 완료되지 않은 경우, 자동으로         = */
    /* =         승인 취소 요청을 하는 프로세스가 구성되어 있습니다.                  = */
    /* =         DB 작업이 실패 한 경우, bSucc 라는 변수(String)의 값을 "false"      = */
    /* =         로 세팅해 주시기 바랍니다. (DB 작업 성공의 경우에는 "false" 이외의   = */
    /* =         값을 세팅하시면 됩니다.)                                            = */
    /* = -------------------------------------------------------------------------- = */
            bSucc = "" ;             // DB 작업 실패일 경우 "false" 로 세팅
    /* = -------------------------------------------------------------------------- = */
    /* =   04-2. DB 작업 실패일 경우 자동 승인 취소                                  = */
    /* = -------------------------------------------------------------------------- = */
            if ( bSucc.equals("false") ){
                int mod_data_set_no ;

                mod_data_set_no = c_PayPlus.mf_add_set( "mod_data" ) ;

                tx_cd = "07020000" ;	// 취소 요청

		        c_PayPlus.mf_set_us( mod_data_set_no, "mod_type" ,  "STSC"   ) ;
		        c_PayPlus.mf_set_us( mod_data_set_no, "mod_value", cash_no   ) ;
		        c_PayPlus.mf_set_us( mod_data_set_no, "mod_gubn" ,  "MG01"   ) ;
		        c_PayPlus.mf_set_us( mod_data_set_no, "trad_time", trad_time ) ;

                c_PayPlus.mf_do_tx( g_conf_site_id, "", tx_cd, cust_ip, ordr_idxx, g_conf_log_level, "0" ) ;

                res_cd  = c_PayPlus.m_res_cd ;
                res_msg = c_PayPlus.m_res_msg ;

            }
            // End of [res_cd = "0000"]

        }else{
			/* =   04-3. 등록 실패를 업체 자체적으로 DB 처리 작업하시는 부분입니다.            = */	
        }
    }else if ( req_tx.equals ("mod") ){//05. 변경 결과 처리
        if ( res_cd.equals ("0000") ){
            cash_no    = c_PayPlus.mf_get_res( "cash_no"    ) ;  // 현금영수증 거래번호
            receipt_no = c_PayPlus.mf_get_res( "receipt_no" ) ;  // 현금영수증 승인번호
            app_time   = c_PayPlus.mf_get_res( "app_time"   ) ;  // 승인시간(YYYYMMDDhhmmss)
            reg_stat   = c_PayPlus.mf_get_res( "reg_stat"   ) ;  // 등록 상태 코드
            reg_desc   = c_PayPlus.mf_get_res( "reg_desc"   ) ;  // 등록 상태 설명
        }
    }else{
   		/* =   05-1. 변경 실패를 업체 자체적으로 DB 처리 작업하시는 부분입니다.            = */
    }





logger.debug("RESULT START*****************************************");
logger.debug("jobGb 		: "+(String)result.get("jobGb"));
logger.debug("recvSeq 		: "+result.get("recvSeq")+"");
logger.debug("cashSeq 		: "+result.get("cashSeq")+"");
logger.debug("cashIseq 		: "+result.get("cashIseq")+"");
logger.debug("res_cd		: "+res_cd);
logger.debug("res_msg 		: "+res_msg);
logger.debug("cash_no 		: "+cash_no);
logger.debug("receipt_no	: "+receipt_no);
logger.debug("app_time 		: "+app_time);
logger.debug("reg_stat 		: "+reg_stat);
logger.debug("reg_desc 		: "+reg_desc);
logger.debug("regId 		: "+(String)result.get("regId"));
logger.debug("RESULT END*****************************************");





	PlatformData resData = new PlatformData();
	VariableList resVarList = resData.getVariableList();
	try{
		DataSet ds = new DataSet("cash_output");
	    ds.addColumn(new ColumnHeader("jobGb", 		DataTypes.STRING));
	    ds.addColumn(new ColumnHeader("recvSeq", 	DataTypes.STRING));
	    ds.addColumn(new ColumnHeader("cashSeq", 	DataTypes.STRING));
	    ds.addColumn(new ColumnHeader("cashIseq", 	DataTypes.STRING));
	    ds.addColumn(new ColumnHeader("resCd", 		DataTypes.STRING));
	    ds.addColumn(new ColumnHeader("resMsg", 	DataTypes.STRING));
	    ds.addColumn(new ColumnHeader("CashTno", 	DataTypes.STRING));
	    ds.addColumn(new ColumnHeader("cashappNo", 	DataTypes.STRING));
	    ds.addColumn(new ColumnHeader("cashappTm", 	DataTypes.STRING));
	    ds.addColumn(new ColumnHeader("cregSt", 	DataTypes.STRING));
	    ds.addColumn(new ColumnHeader("CregDesc", 	DataTypes.STRING));
	    ds.addColumn(new ColumnHeader("regId", 		DataTypes.STRING));
	
	    int row = ds.newRow();
	    ds.set(row, "jobGb", 		(String)result.get("jobGb"));
	    ds.set(row, "recvSeq", 		result.get("recvSeq")+"");
	    ds.set(row, "cashSeq", 		result.get("cashSeq")+"");
	    ds.set(row, "cashIseq", 	result.get("cashIseq")+"");
	    ds.set(row, "resCd", 		res_cd);
	    ds.set(row, "resMsg", 		res_msg);
	    ds.set(row, "CashTno", 		cash_no);
	    ds.set(row, "cashappNo", 	receipt_no);
	    ds.set(row, "cashappTm", 	app_time);
	    ds.set(row, "cregSt",	 	reg_stat);
	    ds.set(row, "CregDesc", 	reg_desc);
	    ds.set(row, "regId", 		(String)result.get("regId"));
	
	    resData.addDataSet(ds);
	    resVarList.add("ErrorCode", 0);
	    resVarList.add("ErrorMsg", "SUCCES");
	}catch(Exception e){
		resVarList.add("ErrorCode", -1);
	    resVarList.add("ErrorMsg", "FAIL");
	}
    HttpPlatformResponse res = new HttpPlatformResponse(response);
    res.setData(resData);
    res.sendData();
%>