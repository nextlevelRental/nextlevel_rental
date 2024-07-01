<%@ page language="java" contentType="text/html;charset=euc-kr"%>
<%
    /* ============================================================================== */
    /* =   PAGE : 결과 처리 PAGE                                                    = */
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

    request.setCharacterEncoding("euc-kr") ;
    /* ============================================================================== */
    /* =   지불 결과                                                                = */
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
        <h1>[결과출력]<span> 이 페이지는 결제 결과를 출력하는 샘플(예시) 페이지입니다.</span></h1>
    <div class="sample">
        <p>
          요청 결과를 출력하는 페이지 입니다.<br />
          요청이 정상적으로 처리된 경우 결과코드(res_cd)값이 0000으로 표시됩니다.
        </p>
<%
    /* ============================================================================== */
    /* =   결제 결과 코드 및 메시지 출력(결과페이지에 반드시 출력해주시기 바랍니다.)= */
    /* = -------------------------------------------------------------------------- = */
    /* =   결제 정상 : res_cd값이 0000으로 설정됩니다.                              = */
    /* =   결제 실패 : res_cd값이 0000이외의 값으로 설정됩니다.                     = */
    /* = -------------------------------------------------------------------------- = */
%>
                    <h2>&sdot; 처리 결과</h2>
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
                    </table>
<%
                /* = -------------------------------------------------------------------------- = */
                /* =   결제 결과 코드 및 메시지 출력 끝                                         = */
                /* ============================================================================== */

                /* ============================================================================== */
                /* =   01. 결제 결과 출력                                                       = */
                /* = -------------------------------------------------------------------------- = */

                if(res_cd.equals("0000"))
                {
%>
                    <h2>&sdot; 정기 과금 정보</h2>
                    <table class="tbl" cellpadding="0" cellspacing="0">

                        <!-- 그룹ID -->
                        <tr>
                            <th>그룹ID</th>
                            <td><%=group_id%></td>
                        </tr>
                        <!-- 배치키 -->
                        <tr>
                            <th>배치키</th>
                            <td><%=batch_key%></td>
                        </tr>
                        <!-- 결제수단 -->
                        <tr>
                            <th>결제수단</th>
                            <td><%=pay_type%></td>
                        </tr>
                        <!-- 카드번호 -->
                        <tr>
                            <th>카드번호</th>
                            <td><%=pay_id%></td>
                        </tr>
                        <!-- 주민(사업자번호) -->
                        <tr>
                            <th>주민(사업자번호)</th>
                            <td><%=pay_cert_no%></td>
                        </tr>
                        <!-- 카드발급사코드 -->
                        <tr>
                            <th>카드발급사코드</th>
                            <td><%=pay_issue_cd%></td>
                        </tr>
                        <!-- 카드발급사이름 -->
                        <tr>
                            <th>카드발급사이름</th>
                            <td><%=pay_issue_nm%></td>
                        </tr>
                    </table>
<%
                }
                /* = -------------------------------------------------------------------------- = */
                /* =   01. 결제 결과 출력 END                                                   = */
                /* ============================================================================== */
%>
                    <!-- 처음으로 이미지 버튼 -->
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
