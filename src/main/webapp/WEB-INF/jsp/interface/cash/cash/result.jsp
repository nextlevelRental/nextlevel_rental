<%@ page language="java" contentType="text/html;charset=euc-kr" %>
<%
    /* ============================================================================== */
    /* =   PAGE : 결과 처리 PAGE                                                    = */
    /* = -------------------------------------------------------------------------- = */
    /* =   연동시 오류가 발생하는 경우 아래의 주소로 접속하셔서 확인하시기 바랍니다.= */
    /* =   접속 주소 : http://testpay.kcp.co.kr/pgsample/FAQ/search_error.jsp       = */
    /* = -------------------------------------------------------------------------- = */
    /* =   Copyright (c)  2007   KCP Inc.   All Rights Reserved.                    = */
    /* ============================================================================== */
%>
    <%@ include file="../configure/site.conf"%>

<%
    /* ============================================================================== */
    request.setCharacterEncoding("euc-kr") ;
    /* ============================================================================== */
    /* =   지불 결과                                                                = */
    /* = -------------------------------------------------------------------------- = */
    String req_tx	    = request.getParameter( "req_tx"       ) ;                  // 요청 종류
    String bSucc	    = request.getParameter( "bSucc"        ) ;                  // DB처리 여부
    String trad_time    = request.getParameter( "trad_time"    ) ;                  // 원거래 시각
    /* = --------------------------------------------------------------------------= */
    String ordr_idxx    = request.getParameter( "ordr_idxx"    ) ;                  // 주문번호
    String buyr_name    = request.getParameter( "buyr_name"    ) ;                  // 주문자 이름
    String buyr_tel1    = request.getParameter( "buyr_tel1"    ) ;                  // 주문자 전화번호
    String buyr_mail    = request.getParameter( "buyr_mail"    ) ;                  // 주문자 메일
    String good_name    = request.getParameter( "good_name"    ) ;                  // 주문상품명
    String comment      = request.getParameter( "comment"      ) ;                  // 비고
    /* = --------------------------------------------------------------------------= */
    String corp_type    = request.getParameter( "corp_type"    ) ;                  // 사업장 구분
    String corp_tax_type= request.getParameter( "corp_tax_type") ;                  // 과세/면세 구분
    String corp_tax_no  = request.getParameter( "corp_tax_no"  ) ;                  // 발행 사업자 번호
    String corp_nm      = request.getParameter( "corp_nm"      ) ;                  // 상호
    String corp_owner_nm= request.getParameter( "corp_owner_nm") ;                  // 대표자명
    String corp_addr    = request.getParameter( "corp_addr"    ) ;                  // 사업장주소
    String corp_telno   = request.getParameter( "corp_telno"   ) ;                  // 사업장 대표 연락처
    /* = --------------------------------------------------------------------------= */
    String user_type    = request.getParameter( "user_type"    ) ;                  // 사용자 구분
    String tr_code      = request.getParameter( "tr_code"      ) ;                  // 발행용도
    String id_info      = request.getParameter( "id_info"      ) ;                  // 신분확인 ID
    String amt_tot      = request.getParameter( "amt_tot"      ) ;                  // 거래금액 총 합
    String amt_sup      = request.getParameter( "amt_sup"      ) ;                  // 공급가액
    String amt_svc      = request.getParameter( "amt_svc"      ) ;                  // 봉사료
    String amt_tax      = request.getParameter( "amt_tax"      ) ;                  // 부가가치세
    String pay_type     = request.getParameter( "pay_type"     ) ;                  // 결제 서비스 구분
    String pay_trade_no = request.getParameter( "pay_trade_no" ) ;                  // 결제 거래번호
    /* = --------------------------------------------------------------------------= */                                                                   
    String mod_type     = request.getParameter( "mod_type"     ) ;                  // 변경 타입
    String mod_value    = request.getParameter( "mod_value"    ) ;                  // 변경 요청 거래번호
    String mod_gubn     = request.getParameter( "mod_gubn"     ) ;                  // 변경 요청 거래번호 구분
    String mod_mny      = request.getParameter( "mod_mny"      ) ;                  // 변경 요청 금액
    String rem_mny      = request.getParameter( "rem_mny"      ) ;                  // 변경처리 이전 금액
    /* = --------------------------------------------------------------------------= */
    String res_cd       = request.getParameter( "res_cd"       ) ;                  // 응답코드
    String res_msg      = request.getParameter( "res_msg"      ) ;                  // 응답메시지
    String cash_no      = request.getParameter( "cash_no"      ) ;                  // 현금영수증 거래번호
    String receipt_no   = request.getParameter( "receipt_no"   ) ;                  // 현금영수증 승인번호
    String app_time     = request.getParameter( "app_time"     ) ;                  // 승인시간(YYYYMMDDhhmmss)
    String reg_stat     = request.getParameter( "reg_stat"     ) ;                  // 등록 상태 코드
    String reg_desc     = request.getParameter( "reg_desc"     ) ;                  // 등록 상태 설명
    /* = -------------------------------------------------------------------------- = */

    String req_tx_name = "" ;

    if( req_tx.equals( "pay" ) )
        req_tx_name = "등록" ;
    else if( req_tx.equals( "mod" ) )
        req_tx_name = "변경/조회" ;
%>
    <html>
    <head>
    <link href="css/sample.css" rel="stylesheet" type="text/css">
    <script language="javascript">
        <!-- 현금영수증 연동 스크립트 -->
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
                        <td align="center">결과 페이지(현금영수증 <%=req_tx_name%>)</td>
                    </tr>
                    <tr>
                        <td bgcolor="CFCFCF" height="2"></td>
                    </tr>
                </table>
<%
    if ( req_tx.equals ( "pay" ) )                      // 거래 구분 : 등록
    {
        if ( !bSucc.equals ( "false" ) )                 // 업체 DB 처리 정상
        {
            if ( res_cd.equals ( "0000" ) )             // 정상 승인
            {
%>
                <table width="85%" align="center" border="0" cellpadding="0" cellspacing="1">
                    <tr>
                        <td>결과코드</td>
                        <td><%=res_cd%></td>
                    </tr>
                    <tr><td colspan="2"><IMG SRC="./img/dot_line.gif" width="100%"></td></tr>
                    <tr>
                        <td>결과 메세지</td>
                        <td><%=res_msg%></td>
                    </tr>
                    <tr><td colspan="2"><IMG SRC="./img/dot_line.gif" width="100%"></td></tr>
                    <tr>
                        <td>현금영수증 거래번호</td>
                        <td><%=cash_no%></td>
                    </tr>
                    <tr><td colspan="2"><IMG SRC="./img/dot_line.gif" width="100%"></td></tr>
                    <tr>
                        <td>현금영수증 승인번호</td>
                        <td><%=receipt_no%></td>
                    </tr>
                    <tr><td colspan="2"><IMG SRC="./img/dot_line.gif" width="100%"></td></tr>
                    <tr>
                        <td>등록 상태 코드</td>
                        <td><%=reg_stat%></td>
                    </tr>
                    <tr><td colspan="2"><IMG SRC="./img/dot_line.gif" width="100%"></td></tr>
                    <tr>
                        <td>등록 상태 설명</td>
                        <td><%=reg_desc%></td>
                    </tr>
                    <tr><td colspan="2"><IMG SRC="./img/dot_line.gif" width="100%"></td></tr>
                    <tr>
                        <td>승인시간</td>
                        <td><%=app_time%></td>
                    </tr>
                    <tr><td colspan="2"><IMG SRC="./img/dot_line.gif" width="100%"></td></tr>
                    <tr>
                        <td>현금영수증 URL</td>
                        <td><input type="button" name="receiptView" value="영수증 확인" class="box" onClick="javascript:receiptView('<%=cash_no%>')"></td>
                    </tr>
                    <tr><td colspan="2"><IMG SRC="./img/dot_line.gif" width="100%"></td></tr>
                    <tr>
                        <td colspan="2">※ 영수증 확인은 실 등록의 경우에만 가능합니다.</td>
                    </tr>
                </table>
<%
            }
            else
            {                                        // 승인 실패
%>
                <table width="85%" align="center" border="0" cellpadding="0" cellspacing="1">
                    <tr>
                        <td>결과코드</td>
                        <td><%=res_cd%></td>
                    </tr>
                    <tr><td colspan="2"><IMG SRC="./img/dot_line.gif" width="100%"></td></tr>
                    <tr>
                        <td>결과 메세지</td>
                        <td><%=res_msg%></td>
                    </tr>
                </table>
<%
            }
        }
        else                                            // 업체 DB 처리 실패
        {
%>
                <table width="85%" align="center" border="0" cellpadding="0" cellspacing="1">
                    <tr>
                        <td nowrap>취소 결과코드</td>
                        <td><%=res_cd%></td>
                    </tr>
                    <tr><td colspan="2"><IMG SRC="./img/dot_line.gif" width="100%"></td></tr>
                    <tr>
                        <td nowrap>취소 결과 메세지</td>
                        <td><%=res_msg%></td>
                    </tr>
                    <tr><td colspan="2"><IMG SRC="./img/dot_line.gif" width="100%"></td></tr>
                    <tr>
                        <td nowrap>상세메세지</td>
                        <td>
<%
            if ( res_cd.equals ( "0000" ) )
            {
                out.println("결제는 정상적으로 이루어졌지만 쇼핑몰에서 결제 결과를 처리하는 중 오류가 발생하여 시스템에서 자동으로 취소 요청을 하였습니다. <br> 쇼핑몰로 전화하여 확인하시기 바랍니다.") ;
            }
            else
            {
                out.println("결제는 정상적으로 이루어졌지만 쇼핑몰에서 결제 결과를 처리하는 중 오류가 발생하여 시스템에서 자동으로 취소 요청을 하였으나, <br> <b>취소가 실패 되었습니다.</b><br> 쇼핑몰로 전화하여 확인하시기 바랍니다.") ;

            }

%>
                        </td>
                    </tr>
                </table>
<%
        }
    }
    else if ( req_tx.equals ( "mod" ) )                      // 거래 구분 : 조회/취소 요청
    {
    	if ( res_cd.equals ( "0000" ) )
    	{
%>

                <table width="85%" align="center" border="0" cellpadding="0" cellspacing="1">
                    <tr>
                        <td>결과코드</td>
                        <td><%=res_cd%></td>
                    </tr>
                    <tr><td colspan="2"><IMG SRC="./img/dot_line.gif" width="100%"></td></tr>
                    <tr>
                        <td>결과 메세지</td>
                        <td><%=res_msg%></td>
                    </tr>
                    <tr><td colspan="2"><IMG SRC="./img/dot_line.gif" width="100%"></td></tr>
                    <tr>
                        <td>현금영수증 거래번호</td>
                        <td><%=cash_no%></td>
                    </tr>
                    <tr><td colspan="2"><IMG SRC="./img/dot_line.gif" width="100%"></td></tr>
                    <tr>
                        <td>현금영수증 승인번호</td>
                        <td><%=receipt_no%></td>
                    </tr>
                    <tr><td colspan="2"><IMG SRC="./img/dot_line.gif" width="100%"></td></tr>
                    <tr>
                        <td>등록 상태 코드</td>
                        <td><%=reg_stat%></td>
                    </tr>
                    <tr><td colspan="2"><IMG SRC="./img/dot_line.gif" width="100%"></td></tr>
                    <tr>
                        <td>등록 상태 설명</td>
                        <td><%=reg_desc%></td>
                    </tr>
                    <tr><td colspan="2"><IMG SRC="./img/dot_line.gif" width="100%"></td></tr>
                    <tr>
                        <td>승인시간</td>
                        <td><%=app_time%></td>
                    </tr>
                    <tr><td colspan="2"><IMG SRC="./img/dot_line.gif" width="100%"></td></tr>
                    <tr>
                        <td>현금영수증 URL</td>
                        <td><input type="button" name="receiptView" value="영수증 확인" class="box" onClick="javascript:receiptView('<%=g_conf_site_id%>', '<%=ordr_idxx%>', 'Y', '<%=receipt_no%>')"></td>
                    </tr>
                    <tr><td colspan="2"><IMG SRC="./img/dot_line.gif" width="100%"></td></tr>
                    <tr>
                        <td colspan="2">※ 영수증 확인은 실 등록의 경우에만 가능합니다.</td>
                    </tr>
                </table>
<%
        }
		else
		{
%>
                <table width="85%" align="center" border="0" cellpadding="0" cellspacing="1">
                    <tr>
                        <td>결과코드</td>
                        <td><%= res_cd %></td>
                    </tr>
                    <tr><td colspan="2"><IMG SRC="./img/dot_line.gif" width="100%"></td></tr>
                    <tr>
                        <td>결과 메세지</td>
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