<%@ page contentType="text/html;charset=euc-kr" %>

<%
/* ============================================================================== */
/* =	PAGE : ��� ��û PAGE														= */
/* = -------------------------------------------------------------------------- = */
/* =	�Ʒ��� �� ���� �� �κ��� �� �����Ͻÿ� ������ �����Ͻñ� �ٶ��ϴ�.							= */
/* = -------------------------------------------------------------------------- = */
/* =	������ ������ �߻��ϴ� ��� �Ʒ��� �ּҷ� �����ϼż� Ȯ���Ͻñ� �ٶ��ϴ�.						= */
/* =	���� �ּ� : http://kcp.co.kr/technique.requestcode.do						= */
/* = -------------------------------------------------------------------------- = */
/* =	Copyright (c)  2016  NHN KCP Inc.   All Rights Reserverd.				= */
/* ============================================================================== */
%>
<%@ include file = "./../cfg/site_conf_inc.jsp"%>
<%!
/* ============================================================================== */
/* =   Null ó�� Method															= */
/* = -------------------------------------------------------------------------- = */
public String f_get_parm(String val) {
	if(val == null) val = "";
	
	return val;
}
/* ============================================================================== */
%>
<%
request.setCharacterEncoding("euc-kr");
/* ============================================================================== */
/* =	01. ��� ��û ���� ����														= */
/* = -------------------------------------------------------------------------- = */
String mod_type	= f_get_parm(request.getParameter("mod_type"));	/* ��û����		*/
String tno		= f_get_parm(request.getParameter("tno"));		/* KCP �ŷ���ȣ	*/
String mod_desc	= f_get_parm(request.getParameter("mod_desc"));	/* �������		*/
String mod_mny	= f_get_parm(request.getParameter("mod_mny"));	/* ��ҿ�û�ݾ�		*/
String rem_mny	= f_get_parm(request.getParameter("rem_mny"));	/* ��Ұ����ܾ�		*/
/* ============================================================================== */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<title>*** NHN KCP [AX-HUB Version] ***</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<link href="css/style.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript">
/* ��� ��ư�� ������ �� ȣ�� */
function jsf__go_cancel(form) {
	var RetVal = false ;
	
	if(document.getElementById("mod_type").value != "" && document.getElementById("mod_type").value != null) {
// 		if(form.tno.value.length < 14) {
// 			alert("KCP �ŷ� ��ȣ�� �Է��ϼ���");
// 			form.tno.focus();
// 			form.tno.select();
// 		} else {
			RetVal = true;
// 		}
	} else {
		alert("�ŷ� ������ �����Ͽ� �ֽʽÿ�.");
		form.mod_type.focus();
	}
	
	return RetVal;
}
</script>
<body>
	<div id="sample_wrap">
		<%
		/* ============================================================================== */
		/* =	1. ��� ��û ���� �Է� ��(cancel_info)											= */
		/* = -------------------------------------------------------------------------- = */
		/* =	��� ��û�� �ʿ��� ������ �����մϴ�.												= */
		/* = -------------------------------------------------------------------------- = */
		%>
		<form name="cancel_info" action="pp_cli_hub.jsp" method="post">
			<!-- Ÿ��Ʋ Start-->
			<h1>[��ҿ�û] <span>�� �������� �����ǿ� ���� ��Ҹ� ��û�ϴ� ����(����) �������Դϴ�.</span></h1>
			<!-- Ÿ��Ʋ End -->
			
			<!-- ���� Start -->
			<div class="sample">
				<!-- ��� ���̺� Start -->
				<p>
					�ҽ� ���� �� �ҽ� �ȿ� <span>�� ���� ��</span> ǥ�ð� ���Ե� ������ �������� ��Ȳ�� �°� ������ ���� <br/>
					�����Ͻñ� �ٶ��ϴ�.<br/>
					<span>�� �������� ������ �ǿ� ���� ��Ҹ� ��û�ϴ� ������ �Դϴ�.</span><br/>
					������ ���εǸ� ��������� KCP �ŷ���ȣ(tno)���� ������ �� �ֽ��ϴ�.<br/>
					������������ KCP �ŷ���ȣ(tno)������ ��ҿ�û�� �Ͻ� �� �ֽ��ϴ�.
				</p>
				<!-- ��� ���̺� End -->
				
				<!-- ��� ��û ���� �Է� ���̺� Start -->
				<h2>&sdot; ��� ��û</h2>
				<table class="tbl" cellpadding="0" cellspacing="0">
					<!-- ��û ���� : ��� -->
					<tr>
						<th>��û ����</th>
						<td>
							<input type="hidden" name="mod_type" id="mod_type" value="<%= mod_type %>"/>
							<select name="mod_type" onChange="jsf__chk_mod_type()" disabled>
								<option value="mod_type_not_sel">�����Ͻʽÿ�</option>
								<%
								if("STSC".equals(mod_type)) {
								%>
								<option value="STSC" selected>��ü���</option>
								<option value="STPC">�κ����</option>
								<%
								} else if("STPC".equals(mod_type)) {
								%>
								<option value="STSC">��ü���</option>
								<option value="STPC" selected>�κ����</option>
								<%
								}
								%>
							</select>
						</td>
					</tr>
					<!-- Input : ������ ���� �ŷ���ȣ(14 byte) �Է� -->
					<tr>
						<th>KCP �ŷ���ȣ</th>
						<td><input type="text" name="tno" value="<%= tno %>" class="w200" maxlength="14" readonly/></td>
					</tr>
					<!-- Input : ���� ����(mod_desc) �Է� -->
					<tr>
						<th>���� ����</th>
						<td><input type="text" name="mod_desc" value="<%= mod_desc %>" class="w200" maxlength="50" readonly/></td>
					</tr>
					<!-- Input : ��� ��û �ݾ�(mod_mny) �Է� -->
					<tr>
						<th>��� ��û �ݾ�<br/>(�κ���ҽ� ���)</th>
						<td><input type="text" name="mod_mny" value="<%= mod_mny %>" class="w200" size="20" maxlength="14" readonly/></td>
					</tr>
					<!-- Input : ��� ���� �ݾ�(rem_mny) �Է� -->
					<tr>
						<th>��� ���� �ܾ�<br/>(�κ���ҽ� ���)</th>
						<td><input type="text" name="rem_mny" value="<%= rem_mny %>" class="w200" size="20" maxlength="14" readonly/></td>
					</tr>
				</table>
				<!-- ��� ��û ���� �Է� ���̺� End -->
				
				<!-- ���� ��ư ���̺� Start -->
				<div class="btnset">
					<input name="" type="submit" class="submit" value="��ҿ�û" onclick="return jsf__go_cancel(this.form);"/>
					<a href="#" class="home" onclick="javascript:window.close()">ó������</a>
				</div>
				<!-- ���� ��ư ���̺� End -->
			</div>
			<!-- ���� End -->
			<div class="footer">
				Copyright (c) NHN KCP INC. All Rights reserved.
			</div>
			<%
			/* ============================================================================== */
			/* =	1-1. ��� ��û �ʼ� ���� ����													= */
			/* = -------------------------------------------------------------------------- = */
			/* =	�� �ʼ� - �ݵ�� �ʿ��� �����Դϴ�.												= */
			/* = -------------------------------------------------------------------------- = */
			%>
			<input type="hidden" name="req_tx" value="mod" />
		</form>
		<%
		/* = -------------------------------------------------------------------------- = */
		/* =	1. ��� ��û ���� END														= */
		/* ============================================================================== */
		%>
	</div>
</body>
</html>