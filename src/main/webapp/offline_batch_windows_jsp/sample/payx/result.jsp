<%@ page language="java" contentType="text/html;charset=euc-kr"%>
<%
    /* ============================================================================== */
    /* =   PAGE : 결제 결과 출력 PAGE                                               = */
    /* = -------------------------------------------------------------------------- = */
    /* =   결제 요청 결과값을 출력하는 페이지입니다.                                = */
    /* = -------------------------------------------------------------------------- = */
    /* =   연동시 오류가 발생하는 경우 아래의 주소로 접속하셔서 확인하시기 바랍니다.= */
    /* =   접속 주소 : http://kcp.co.kr/technique.requestcode.do                    = */
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
    request.setCharacterEncoding ( "euc-kr" ) ;
    /* ============================================================================== */
    /* =   지불 결과                                                                = */
    /* = -------------------------------------------------------------------------- = */
    String req_tx           = f_get_parm( request.getParameter( "req_tx"         ) );      // 요청 구분(승인/취소)
    String pay_method       = f_get_parm( request.getParameter( "pay_method"     ) );      // 사용 결제 수단
    String bSucc            = f_get_parm( request.getParameter( "bSucc"          ) );      // 업체 DB 정상처리 완료 여부
    /* = -------------------------------------------------------------------------- = */
    String res_cd           = f_get_parm( request.getParameter( "res_cd"         ) );      // 결과 코드
    String res_msg          = f_get_parm( request.getParameter( "res_msg"        ) );      // 결과 메시지
    String res_msg_bsucc    = "" ;
    String amount           = f_get_parm( request.getParameter( "amount"         ) );      // 총금액
    String panc_mod_mny     = f_get_parm( request.getParameter( "panc_mod_mny"   ) );      // 부분취소 요청금액
    String panc_rem_mny     = f_get_parm( request.getParameter( "panc_rem_mny"   ) );      // 부분취소 가능금액
    String mod_type         = f_get_parm( request.getParameter( "mod_type"       ) );
    /* = -------------------------------------------------------------------------- = */
    String ordr_idxx        = f_get_parm( request.getParameter( "ordr_idxx"      ) );      // 주문번호
    String tno              = f_get_parm( request.getParameter( "tno"            ) );      // KCP 거래번호
    String good_mny         = f_get_parm( request.getParameter( "good_mny"       ) );      // 결제 금액
    String good_name        = f_get_parm( request.getParameter( "good_name"      ) );      // 상품명
    String buyr_name        = f_get_parm( request.getParameter( "buyr_name"      ) );      // 구매자명
    String buyr_tel1        = f_get_parm( request.getParameter( "buyr_tel1"      ) );      // 구매자 전화번호
    String buyr_tel2        = f_get_parm( request.getParameter( "buyr_tel2"      ) );      // 구매자 휴대폰번호
    String buyr_mail        = f_get_parm( request.getParameter( "buyr_mail"      ) );      // 구매자 E-Mail
    /* = -------------------------------------------------------------------------- = */
    // 신용카드
    String card_cd          = f_get_parm( request.getParameter( "card_cd"        ) );      // 카드 코드
    String card_no          = f_get_parm( request.getParameter( "card_no"        ) );      // 카드 번호
    String card_name        = f_get_parm( request.getParameter( "card_name"      ) );      // 카드명
    String app_time         = f_get_parm( request.getParameter( "app_time"       ) );      // 승인시간 (공통)
    String app_no           = f_get_parm( request.getParameter( "app_no"         ) );      // 승인번호
    String quota            = f_get_parm( request.getParameter( "quota"          ) );      // 할부개월
    String noinf            = f_get_parm( request.getParameter( "noinf"          ) );      // 무이자여부
    /* = -------------------------------------------------------------------------- = */

    String req_tx_name = "";

    if     ( req_tx.equals( "pay" ) ) { req_tx_name = "지불" ;      }
    else if( req_tx.equals( "mod" ) ) { req_tx_name = "취소/매입" ; }

    /* ============================================================================== */
    /* =   가맹점 측 DB 처리 실패시 상세 결과 메시지 설정                           = */
    /* = -------------------------------------------------------------------------- = */

    if ( "pay".equals ( req_tx ) )
    {
        // 업체 DB 처리 실패
        if ( "false".equals ( bSucc ) )
        {
            if ( "0000".equals ( res_cd ) )
                res_msg_bsucc = "결제는 정상적으로 이루어졌지만 쇼핑몰에서 결제 결과를 처리하는 중 오류가 발생하여 시스템에서 자동으로 취소 요청을 하였습니다. <br> 쇼핑몰로 전화하여 확인하시기 바랍니다." ;
            else
                res_msg_bsucc = "결제는 정상적으로 이루어졌지만 쇼핑몰에서 결제 결과를 처리하는 중 오류가 발생하여 시스템에서 자동으로 취소 요청을 하였으나, <br> <b>취소가 실패 되었습니다.</b><br> 쇼핑몰로 전화하여 확인하시기 바랍니다." ;
        }
    }

    /* = -------------------------------------------------------------------------- = */
    /* =   가맹점 측 DB 처리 실패시 상세 결과 메시지 설정 끝                        = */
    /* ============================================================================== */

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >

<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript">
        // 신용카드 영수증 연동 스크립트
        function receiptView(tno)
        {
            receiptWin = "https://testadmin8.kcp.co.kr/assist/bill.BillAction.do?cmd=card_bill&tno=" + tno ;
             // 실결제시 "https://admin8.kcp.co.kr/assist/bill.BillAction.do?cmd=card_bill&tno=" 적용
            window.open(receiptWin , "" , "width=460, height=820") ;
        }
    </script>
</head>

<body>
    <div id="sample_wrap">

      <!-- 타이틀 Start -->
        <h1>[결과출력] <span>이 페이지는 결제 결과를 출력하는 샘플(예시) 페이지입니다.</span></h1>
      <!-- 타이틀 End -->

        <div class="sample">

          <!--상단 테이블 Start-->
            <p>
            결제 결과를 출력하는 페이지입니다.<br />
            요청이 정상적으로 처리된 경우 결과코드(res_cd)값이 0000으로 표시됩니다.
            </p>
          <!--상단 테이블 End-->
<%
    /* ============================================================================== */
    /* =   결제 결과 코드 및 메시지 출력(결과페이지에 반드시 출력해주시기 바랍니다.)= */
    /* = -------------------------------------------------------------------------- = */
    /* =   결제 정상 : res_cd값이 0000으로 설정됩니다.                              = */
    /* =   결제 실패 : res_cd값이 0000이외의 값으로 설정됩니다.                     = */
    /* = -------------------------------------------------------------------------- = */
%>
        <h2>&sdot; 결제 결과</h2>
        <table class="tbl" cellpadding="0" cellspacing="0">
            <!-- 결과 코드 -->
            <tr>
              <th>결과 코드</th>
              <td><%=res_cd%></td>
            </tr>
                  <!-- 결과 메시지 -->
            <tr>
              <th>결과 메세지</th>
              <td><%=res_msg%></td>
            </tr>
<%
    // 처리 페이지(pp_cli_hub.jsp)에서 가맹점 DB처리 작업이 실패한 경우 상세메시지를 출력합니다.
    if( !"".equals ( res_msg_bsucc ) )
    {
%>
         <tr>
           <th>결과 상세 메세지</th>
           <td><%=res_msg_bsucc%></td>
         </tr>
<%
    }
%>
                    </table>
<%
    /* = -------------------------------------------------------------------------- = */
    /* =   결제 결과 코드 및 메시지 출력 끝                                         = */
    /* ============================================================================== */
%>

<%
    /* ============================================================================== */
    /* =   결제 결과 출력                                                           = */
    /* = -------------------------------------------------------------------------- = */
    if ( "pay".equals ( req_tx ) )
    {
        /* ============================================================================== */
        /* =   업체 DB 처리 정상(bSucc값이 false가 아닌 경우)                           = */
        /* = -------------------------------------------------------------------------- = */
        if ( ! "false".equals ( bSucc ) )
        {
            /* ============================================================================== */
            /* =   1. 정상 결제시 결제 결과 출력 ( res_cd값이 0000인 경우)                  = */
            /* = -------------------------------------------------------------------------- = */
            if ( "0000".equals ( res_cd ) )
            {
%>
                    <h2>&sdot; 주문 정보</h2>
                    <table class="tbl" cellpadding="0" cellspacing="0">
                        <!-- 주문번호 -->
                        <tr>
                          <th>주문 번호</th>
                          <td><%= ordr_idxx %></td>
                        </tr>
                        <!-- KCP 거래번호 -->
                        <tr>
                          <th>KCP 거래번호</th>
                          <td><%= tno %></td>
                        </tr>
                        <!-- 결제금액 -->
                        <tr>
                          <th>결제 금액</th>
                          <td><%= good_mny %>원</td>
                        </tr>
                        <!-- 상품명(good_name) -->
                        <tr>
                          <th>상 품 명</th>
                          <td><%= good_name %></td>
                        </tr>
                        <!-- 주문자명 -->
                        <tr>
                          <th>주문자명</th>
                          <td><%= buyr_name %></td>
                        </tr>
                        <!-- 주문자 전화번호 -->
                        <tr>
                          <th>주문자 전화번호</th>
                          <td><%= buyr_tel1 %></td>
                        </tr>
                        <!-- 주문자 휴대폰번호 -->
                        <tr>
                          <th>주문자 휴대폰번호</th>
                          <td><%= buyr_tel2 %></td>
                        </tr>
                        <!-- 주문자 E-mail -->
                        <tr>
                          <th>주문자 E-mail</th>
                          <td><%= buyr_mail %></td>
                        </tr>
                    </table>
<%
                /* ============================================================================== */
                /* =   1-1. 신용카드 결제 결과 출력                                             = */
                /* = -------------------------------------------------------------------------- = */
                if ( "CARD".equals ( pay_method ) )
                {
%>
                    <h2>&sdot; 카드 정보</h2>
                    <table class="tbl" cellpadding="0" cellspacing="0">
                        <!-- 결제수단 : 신용카드 -->
                        <tr>
                          <th>결제 수단</th>
                          <td>신용 카드</td>
                        </tr>
                        <!-- 결제 카드 -->
                        <tr>
                          <th>결제 카드</th>
                          <td><%= card_cd %> / <%= card_name %></td>
                        </tr>
                        <!-- 승인시간 -->
                        <tr>
                          <th>승인 시간</th>
                          <td><%= app_time %></td>
                        </tr>
                        <!-- 승인번호 -->
                        <tr>
                          <th>승인 번호</th>
                          <td><%= app_no %></td>
                        </tr>
                        <!-- 할부개월 -->
                        <tr>
                          <th>할부 개월</th>
                          <td><%= quota %></td>
                        </tr>
                        <!-- 무이자 여부 -->
                        <tr>
                          <th>무이자 여부</th>
                          <td><%= noinf %></td>
                        </tr>
<%
                    /* ============================================================================== */
                    /* =   1-1-2. 신용카드 영수증 출력                                              = */
                    /* = -------------------------------------------------------------------------- = */
                    /* =   실제 거래건에 대해서 영수증을 출력할 수 있습니다.                        = */
                    /* = -------------------------------------------------------------------------- = */
%>
                        <tr>
                          <th>영수증 확인</th>
                            <td class="sub_content1"><a href="javascript:receiptView('<%=tno%>')"><img src="./img/btn_receipt.gif" alt="영수증을 확인합니다." />
                        </td>
                    </table>
<%
                }
            }
        }
    }
            /* = -------------------------------------------------------------------------- = */
            /* =   01-1-3. 부분취소시 취소 결과 출력                                        = */
            /* ============================================================================== */
            if( "mod".equals ( req_tx ) )
            {
                if( "STPC".equals ( mod_type ) )
                {
                    if( "0000".equals ( res_cd ) )
                    {
%>
             <h2>&sdot; 부분취소 정보</h2>
             <table class="tbl" cellpadding="0" cellspacing="0">
                 <!-- 총 금액 -->
                    <tr>
                      <th>총 금액</th>
                      <td><%= amount %></td>
                    </tr>
                 <!-- 부분취소 요청금액 -->
                     <tr>
                       <th>부분취소 요청금액</th>
                       <td><%= panc_mod_mny %></td>
                      </tr>
                 <!-- 부분취소 가능금액 -->
                      <tr>
                        <th>부분취소 가능금액</th>
                        <td><%= panc_rem_mny %></td>
                      </tr>
             </table>
<%
                    }
                }
            }
            /* = -------------------------------------------------------------------------- = */
            /* =   1. 정상 결제시 결제 결과 출력 END                                        = */
            /* ============================================================================== */
%>
                    <!-- 매입 요청/처음으로 이미지 버튼 -->
                <tr>

                <div class="btnset">
                <a href="../index.html" class="home">처음으로</a>
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