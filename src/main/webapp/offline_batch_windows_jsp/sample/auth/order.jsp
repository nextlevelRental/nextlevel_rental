<%@ page language="java" contentType="text/html;charset=euc-kr"%>
<%
    /* ============================================================================== */
    /* =   PAGE : ���� ���� PAGE                                                    = */
    /* = -------------------------------------------------------------------------- = */
    /* =   Copyright (c)  2007   KCP Inc.   All Rights Reserved.                    = */
    /* ============================================================================== */
    /* = -------------------------------------------------------------------------- = */
    /* =   ������ ������ �߻��ϴ� ��� �Ʒ��� �ּҷ� �����ϼż� Ȯ���Ͻñ� �ٶ��ϴ�.= */
    /* =   ���� �ּ� : http://kcp.co.kr/technique.requestcode.do                    = */
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
    /* =   ������ �ʿ��� �ֹ� ������ �Է� �� �����մϴ�.                            = */
    /* = -------------------------------------------------------------------------- = */
%>
                    <h1>[�ֹ���û] <span> �ſ�ī�� ������� ��û�� ���� ������</span></h1>
                    <!-- ��� ���� -->
                    <div class="sample">
                            <p>�� �������� ������� �ǽð� ��ġŰ ��û ����(����)������ �Դϴ�.</br>
                            ���������� �����ڴ� �ҽ� ���� �߿� �ּ� �κ��� �ݵ�� Ȯ���Ͻð�, �����Ͻ� �κ��� Ư�� �����Ͽ� �ͻ��� �䱸�� �°� ������ ���� �����Ͻñ� �ٶ��ϴ�.</p>
                    <!-- ��� ���̺� End -->

                    <!-- �ʼ� �׸� Ÿ��Ʋ -->
                    <h2>&sdot; �ʼ� �׸�</h2>
                    <table class="tbl" cellpadding="0" cellspacing="0">

                    <!-- �׷�ID -->
                    <tr>
                        <th>�׷�ID</th>
                        <td><input type="text" name="group_id" class="w100" value="BA0011000328" size="15" maxlength="12" /></td>
                    </tr>
                    <!-- ��û(����)���� -->
                    <tr>
                        <th>��û(����)����</th>
                        <td><input type="text" name="site_apply_ymd" class="w50" size="8" maxlength="8" value=""></td>
                    </tr>
                    <!-- ��û���� �Ϸù�ȣ -->
                    <tr>
                        <th>��û���� �Ϸù�ȣ</th>
                        <td><input type="text" name="site_apply_no" class="w150" size="30" maxlength="30" value=""></td>
                    </tr>
                    <!-- ����ȣ -->
                    <tr>
                        <th>����ȣ</th>
                        <td><input type="text" name="site_cust_id" class="w150" size="30"  maxlength="30" value=""></td>
                    </tr>
                    <!-- �������� -->
                    <tr>
                        <th>��������</th>
                        <td>
                            <select name ="bill_type" class="w100">
                                <option value="01" selected>����</option>
                                <option value="02">����+������  </option>
                                <option value="03">������       </option>
                            </select>
                        </td>
                    </tr>
                    <!-- �����ݾ� -->
                    <tr>
                        <th>�����ݾ�</th>
                        <td><input type="text" name="bill_mony" class="w100" size="12" maxlength="12" value="" /></td>
                    </tr>
                    <!-- ������ -->
                    <tr>
                        <th>������</th>
                        <td>
                            <select name="bill_day" class="w100">
                                <option value="01" selected>1��</option>
                                <option value="02">2��</option>
                                <option value="03">3��</option>
                                <option value="04">4��</option>
                                <option value="05">5��</option>
                                <option value="06">6��</option>
                                <option value="07">7��</option>
                                <option value="08">8��</option>
                                <option value="09">9��</option>
                                <option value="10">10��</option>
                                <option value="11">11��</option>
                                <option value="12">12��</option>
                                <option value="13">13��</option>
                                <option value="14">14��</option>
                                <option value="15">15��</option>
                                <option value="16">16��</option>
                                <option value="17">17��</option>
                                <option value="18">18��</option>
                                <option value="19">19��</option>
                                <option value="20">20��</option>
                                <option value="21">21��</option>
                                <option value="22">22��</option>
                                <option value="23">23��</option>
                                <option value="24">24��</option>
                                <option value="25">25��</option>
                                <option value="26">26��</option>
                                <option value="27">27��</option>
                                <option value="28">28��</option>
                                <option value="29">29��</option>
                                <option value="30">30��</option>
                                <option value="31">31��</option>
                            </select>
                        </td>
                    </tr>
                    <!-- ���� ������ -->
                    <tr>
                        <th>���� ������</th>
                        <td>
                            <select name ="init_bill_ym" class="w100">
                                <option value="201303" selected>2013�� 03��</option>
                                <option value="201304">2013�� 04��</option>
                                <option value="201305">2013�� 05��</option>
                                <option value="201306">2013�� 06��</option>
                                <option value="201307">2013�� 07��</option>
                                <option value="201308">2013�� 08��</option>
                            </select>
                        </td>
                    </tr>
                    <!-- ������� -->
                    <tr>
                        <th>�������</th>
                        <td>
                            <select name ="noti_type" class="w100">
                                <option value="00" selected>��������</option>
                                <option value="03">��û�����</option>
                                <option value="15">��û��� + ������û</option>
                                <option value="63">��û��� + ������û + �������</option>
                            </select>
                        </td>
                    </tr>
                    <!-- ������ -->
                    <tr>
                        <th>������</th>
                        <td>
                            <select name ="cust_type" class="w100">
                                <option value="P" selected>����</option>
                                <option value="C">����         </option>
                            </select>
                        </td>
                    </tr>
                    <!-- ���� -->
                    <tr>
                        <th>����</th>
                        <td><input type="text" name="cust_name" class="w100" size="40" maxlength="40" value=""></td>
                    </tr>
                    <!-- �޴�����ȣ -->
                    <tr>
                        <th>�޴�����ȣ</th>
                        <td><input type="text" name="mobile_no" class="w100" size="16" maxlength="12" value=""></td>
                    </tr>
                    <!-- ��ȭ��ȣ -->
                    <tr>
                        <th>��ȭ��ȣ</th>
                        <td><input type="text" name="tel_no" class="w100" size="16" maxlength="12" value=""></td>
                    </tr>
                    <!-- E-Mail -->
                    <tr>
                        <th>E-Mail</th>
                        <td><input type="text" name="email" class="w150" size="50" maxlength="50" value=""></td>
                    </tr>
                    <!-- ����� -->
                    <tr>
                        <th>�����</th>
                        <td>
                            <select name ="pay_relation" class="w100">
                                <option value="����" selected>����</option>
                                <option value="����">����</option>
                                <option value="��Ÿ">��Ÿ</option>
                            </select>
                        </td>
                    </tr>
                    <!-- �������� -->
                    <tr>
                        <th>��������</th>
                        <td>
                            <select name ="pay_type" class="frmselect">
                                <option value="PACA" selected>�ſ�ī��</option>
                            </select>
                        </td>
                    </tr>
                    <!-- ī���ȣ -->
                    <tr>
                        <th>ī���ȣ</th>
                        <td><input type="text" name="pay_id" class="w100" size="20" maxlength="20" value="" /></td>
                    </tr>
                    <!-- ��ȿ�Ⱓ(YY) -->
                    <tr>
                        <th>��ȿ�Ⱓ(YY)</th>
                        <td>
                            <select name ="pay_expiry_yy" class="w100">
                                <option value="13" selected>2013��</option>
                                <option value="14">2014��</option>
                                <option value="15">2015��</option>
                                <option value="16">2016��</option>
                                <option value="17">2017��</option>
                                <option value="18">2018��</option>
                                <option value="19">2019��</option>
                                <option value="20">2020��</option>
                            </select>
                        </td>
                    </tr>
                    <!-- ��ȿ�Ⱓ(MM) -->
                    <tr>
                        <th>��ȿ�Ⱓ(MM)</th>
                        <td>
                            <select name ="pay_expiry_mm" class="w100">
                                <option value="01" selected>1��</option>
                                <option value="02">2��</option>
                                <option value="03">3��</option>
                                <option value="04">4��</option>
                                <option value="05">5��</option>
                                <option value="06">6��</option>
                                <option value="07">7��</option>
                                <option value="08">8��</option>
                                <option value="09">9��</option>
                                <option value="10">10��</option>
                                <option value="11">11��</option>
                                <option value="12">12��</option>
                            </select>
                        </td>
                    </tr>
                    <!-- �Һΰ����� -->
                    <tr>
                        <th>�Һΰ�����</th>
                        <td>
                            <select name ="pay_quota" class="w100">
                                <option value="00" selected>�Ͻú�</option>
                                <option value="02">2����</option>
                                <option value="03">3����</option>
                                <option value="06">6����</option>
                            </select>
                        </td>
                    </tr>
                    <!-- ī������ڸ� -->
                    <tr>
                        <th>ī������ڸ�</th>
                        <td><input type="text" name="pay_owner_nm" class="w100" size="30" maxlength="30" value="" /></td>
                    </tr>
                    <!-- ������� -->
                    <tr>
                         <th>�������(ex:8601010000000)</th>
                         <td><input type="text" name="pay_cert_no" class="w100" size="13" maxlength="13" value=""></td>
                    </tr>
                    </table>
                    <!-- �ʼ� �׸� Ÿ��Ʋ End -->

                <!-- ���� ��ư ���̺� Start -->
                    <div class="btnset">
                        <table align="center" cellspacing="0" cellpadding="0" class="margin_top_20"> 
                            <tr id="show_pay_btn">
                                <td colspan="2" align="center"> 
                                  <input name="" type="submit" class="submit" value="������û" onclick="goSubmit();" alt="������ ��û�մϴ�" /></a>
                                  <a href="../index.html" class="home">ó������</a>
                     </div>
                                </td>
                            </tr>
                            <!-- ���� ���� ���Դϴ�. �޽��� -->
                            <tr id="show_progress" style="display:none">
                                <td colspan="2" class="center red" >���� ���� ���Դϴ�. ��ø� ��ٷ� �ֽʽÿ�...</td>
                            </tr>
                        </table>
                    </div>
                <!-- ���� ��ư ���̺� End -->

                </div>
        <div class="footer">
            Copyright (c) KCP INC. All Rights reserved.
        </div>