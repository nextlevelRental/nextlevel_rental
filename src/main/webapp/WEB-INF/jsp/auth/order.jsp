<%@ page language="java" contentType="text/html;charset=euc-kr"%>
<%
    /* ============================================================================== */
    /* =   PAGE : 결제 시작 PAGE                                                    = */
    /* = -------------------------------------------------------------------------- = */
    /* =   Copyright (c)  2007   KCP Inc.   All Rights Reserved.                    = */
    /* ============================================================================== */
    /* = -------------------------------------------------------------------------- = */
    /* =   연동시 오류가 발생하는 경우 아래의 주소로 접속하셔서 확인하시기 바랍니다.= */
    /* =   접속 주소 : http://kcp.co.kr/technique.requestcode.do                    = */
    /* = -------------------------------------------------------------------------- = */
    /* =   Copyright (c)  2013   KCP Inc.   All Rights Reserverd.                   = */
    /* ============================================================================== */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<title></title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
    <link href="css/style.css" rel="stylesheet" type="text/css" id="cssLink"/>
        <script language="javascript">

        function goSubmit()
        {
            document.formOrder.submit();
        }

    </script>

</head>
<body>
<div id="sample_wrap">

        <form name="formOrder" method="post" action="./pp_cli_hub.jsp">
<%
    /* = -------------------------------------------------------------------------- = */
    /* =   결제에 필요한 주문 정보를 입력 및 설정합니다.                            = */
    /* = -------------------------------------------------------------------------- = */
%>
                    <h1>[주문요청] <span> 신용카드 정기과금 신청서 샘플 페이지</span></h1>
                    <!-- 상단 문구 -->
                    <div class="sample">
                            <p>이 페이지는 정기과금 실시간 배치키 신청 샘플(예제)페이지 입니다.</br>
                            결제페이지 개발자는 소스 내용 중에 주석 부분을 반드시 확인하시고, 수정하실 부분은 특히 주의하여 귀사의 요구에 맞게 적절히 수정 적용하시길 바랍니다.</p>
                    <!-- 상단 테이블 End -->

                    <!-- 필수 항목 타이틀 -->
                    <h2>&sdot; 필수 항목</h2>
                    <table class="tbl" cellpadding="0" cellspacing="0">

                    <!-- 그룹ID -->
                    <tr>
                        <th>그룹ID</th>
                        <td><input type="text" name="group_id" class="w100" value="BA0011000328" size="15" maxlength="12" /></td>
                    </tr>
                    <!-- 신청(접수)일자 -->
                    <tr>
                        <th>신청(접수)일자</th>
                        <td><input type="text" name="site_apply_ymd" class="w50" size="8" maxlength="8" value=""></td>
                    </tr>
                    <!-- 신청접수 일련번호 -->
                    <tr>
                        <th>신청접수 일련번호</th>
                        <td><input type="text" name="site_apply_no" class="w150" size="30" maxlength="30" value=""></td>
                    </tr>
                    <!-- 고객번호 -->
                    <tr>
                        <th>고객번호</th>
                        <td><input type="text" name="site_cust_id" class="w150" size="30"  maxlength="30" value=""></td>
                    </tr>
                    <!-- 결제유형 -->
                    <tr>
                        <th>결제유형</th>
                        <td>
                            <select name ="bill_type" class="w100">
                                <option value="01" selected>정액</option>
                                <option value="02">정액+비정액  </option>
                                <option value="03">비정액       </option>
                            </select>
                        </td>
                    </tr>
                    <!-- 결제금액 -->
                    <tr>
                        <th>결제금액</th>
                        <td><input type="text" name="bill_mony" class="w100" size="12" maxlength="12" value="" /></td>
                    </tr>
                    <!-- 결제일 -->
                    <tr>
                        <th>결제일</th>
                        <td>
                            <select name="bill_day" class="w100">
                                <option value="01" selected>1일</option>
                                <option value="02">2일</option>
                                <option value="03">3일</option>
                                <option value="04">4일</option>
                                <option value="05">5일</option>
                                <option value="06">6일</option>
                                <option value="07">7일</option>
                                <option value="08">8일</option>
                                <option value="09">9일</option>
                                <option value="10">10일</option>
                                <option value="11">11일</option>
                                <option value="12">12일</option>
                                <option value="13">13일</option>
                                <option value="14">14일</option>
                                <option value="15">15일</option>
                                <option value="16">16일</option>
                                <option value="17">17일</option>
                                <option value="18">18일</option>
                                <option value="19">19일</option>
                                <option value="20">20일</option>
                                <option value="21">21일</option>
                                <option value="22">22일</option>
                                <option value="23">23일</option>
                                <option value="24">24일</option>
                                <option value="25">25일</option>
                                <option value="26">26일</option>
                                <option value="27">27일</option>
                                <option value="28">28일</option>
                                <option value="29">29일</option>
                                <option value="30">30일</option>
                                <option value="31">31일</option>
                            </select>
                        </td>
                    </tr>
                    <!-- 최초 결제월 -->
                    <tr>
                        <th>최초 결제월</th>
                        <td>
                            <select name ="init_bill_ym" class="w100">
                                <option value="201303" selected>2013년 03월</option>
                                <option value="201304">2013년 04월</option>
                                <option value="201305">2013년 05월</option>
                                <option value="201306">2013년 06월</option>
                                <option value="201307">2013년 07월</option>
                                <option value="201308">2013년 08월</option>
                            </select>
                        </td>
                    </tr>
                    <!-- 고지방법 -->
                    <tr>
                        <th>고지방법</th>
                        <td>
                            <select name ="noti_type" class="w100">
                                <option value="00" selected>고지안함</option>
                                <option value="03">신청결과만</option>
                                <option value="15">신청결과 + 결제요청</option>
                                <option value="63">신청결과 + 결제요청 + 결제결과</option>
                            </select>
                        </td>
                    </tr>
                    <!-- 고객구분 -->
                    <tr>
                        <th>고객구분</th>
                        <td>
                            <select name ="cust_type" class="w100">
                                <option value="P" selected>개인</option>
                                <option value="C">법인         </option>
                            </select>
                        </td>
                    </tr>
                    <!-- 고객명 -->
                    <tr>
                        <th>고객명</th>
                        <td><input type="text" name="cust_name" class="w100" size="40" maxlength="40" value=""></td>
                    </tr>
                    <!-- 휴대폰번호 -->
                    <tr>
                        <th>휴대폰번호</th>
                        <td><input type="text" name="mobile_no" class="w100" size="16" maxlength="12" value=""></td>
                    </tr>
                    <!-- 전화번호 -->
                    <tr>
                        <th>전화번호</th>
                        <td><input type="text" name="tel_no" class="w100" size="16" maxlength="12" value=""></td>
                    </tr>
                    <!-- E-Mail -->
                    <tr>
                        <th>E-Mail</th>
                        <td><input type="text" name="email" class="w150" size="50" maxlength="50" value=""></td>
                    </tr>
                    <!-- 고객비고 -->
                    <tr>
                        <th>고객비고</th>
                        <td>
                            <select name ="pay_relation" class="w100">
                                <option value="본인" selected>본인</option>
                                <option value="가족">가족</option>
                                <option value="기타">기타</option>
                            </select>
                        </td>
                    </tr>
                    <!-- 결제수단 -->
                    <tr>
                        <th>결제수단</th>
                        <td>
                            <select name ="pay_type" class="frmselect">
                                <option value="PACA" selected>신용카드</option>
                            </select>
                        </td>
                    </tr>
                    <!-- 카드번호 -->
                    <tr>
                        <th>카드번호</th>
                        <td><input type="text" name="pay_id" class="w100" size="20" maxlength="20" value="" /></td>
                    </tr>
                    <!-- 유효기간(YY) -->
                    <tr>
                        <th>유효기간(YY)</th>
                        <td>
                            <select name ="pay_expiry_yy" class="w100">
                                <option value="13" selected>2013년</option>
                                <option value="14">2014년</option>
                                <option value="15">2015년</option>
                                <option value="16">2016년</option>
                                <option value="17">2017년</option>
                                <option value="18">2018년</option>
                                <option value="19">2019년</option>
                                <option value="20">2020년</option>
                            </select>
                        </td>
                    </tr>
                    <!-- 유효기간(MM) -->
                    <tr>
                        <th>유효기간(MM)</th>
                        <td>
                            <select name ="pay_expiry_mm" class="w100">
                                <option value="01" selected>1월</option>
                                <option value="02">2월</option>
                                <option value="03">3월</option>
                                <option value="04">4월</option>
                                <option value="05">5월</option>
                                <option value="06">6월</option>
                                <option value="07">7월</option>
                                <option value="08">8월</option>
                                <option value="09">9월</option>
                                <option value="10">10월</option>
                                <option value="11">11월</option>
                                <option value="12">12월</option>
                            </select>
                        </td>
                    </tr>
                    <!-- 할부개월수 -->
                    <tr>
                        <th>할부개월수</th>
                        <td>
                            <select name ="pay_quota" class="w100">
                                <option value="00" selected>일시불</option>
                                <option value="02">2개월</option>
                                <option value="03">3개월</option>
                                <option value="06">6개월</option>
                            </select>
                        </td>
                    </tr>
                    <!-- 카드소유자명 -->
                    <tr>
                        <th>카드소유자명</th>
                        <td><input type="text" name="pay_owner_nm" class="w100" size="30" maxlength="30" value="" /></td>
                    </tr>
                    <!-- 생년월일 -->
                    <tr>
                         <th>생년월일(ex:8601010000000)</th>
                         <td><input type="text" name="pay_cert_no" class="w100" size="13" maxlength="13" value=""></td>
                    </tr>
                    </table>
                    <!-- 필수 항목 타이틀 End -->

                <!-- 결제 버튼 테이블 Start -->
                    <div class="btnset">
                        <table align="center" cellspacing="0" cellpadding="0" class="margin_top_20"> 
                            <tr id="show_pay_btn">
                                <td colspan="2" align="center"> 
                                  <input name="" type="submit" class="submit" value="인증요청" onclick="goSubmit();" alt="결제를 요청합니다" /></a>
                                  <a href="../index.html" class="home">처음으로</a>
                     </div>
                                </td>
                            </tr>
                            <!-- 결제 진행 중입니다. 메시지 -->
                            <tr id="show_progress" style="display:none">
                                <td colspan="2" class="center red" >결제 진행 중입니다. 잠시만 기다려 주십시오...</td>
                            </tr>
                        </table>
                    </div>
                <!-- 결제 버튼 테이블 End -->

                </div>
        <div class="footer">
            Copyright (c) KCP INC. All Rights reserved.
        </div>