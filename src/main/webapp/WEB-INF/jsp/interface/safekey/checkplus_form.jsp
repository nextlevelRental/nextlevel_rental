<%@ page language="java" contentType="text/html; charset=euc-kr"%>
<%@ page import="java.net.* " %>
<%		
	request.setCharacterEncoding("euc-kr");


	String kunnr 		= request.getParameter("kunnr") 		== null ? "" : request.getParameter("kunnr");		//����ȣ
	String birthdate 		= request.getParameter("birthdate") 		== null ? "" : request.getParameter("birthdate");	//�����������			
	String mobileno 	= request.getParameter("mobNo")		== null ? "" : request.getParameter("mobNo");		//�ڵ�����ȣ
	String gender 		= request.getParameter("gender")		== null ? "" : request.getParameter("genderCd");	//����		
	String email 			= request.getParameter("email")			== null ? "" : request.getParameter("email");		//�̸���
	if("@".equals(email)) email = "";
	String str 			= request.getParameter("custNm") 		== null ? "" : request.getParameter("custNm");		//�̸�		
	String username 	= URLDecoder.decode(str, "utf-8") ;
	
%>

<html>
<head>
<title>�ؼ�Ÿ�̾� [������������]</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
	<style>
		body{overflow-y:auto}
		ol, ul { list-style: none;}
		#input_Data label {padding-left:15px; text-align:left; font-weight:bold; color:#444444; font-size:12px;line-height:26px; vertical-align:middle; width:200px;height:26px; float: left;}
		#input_Data {margin:0 auto;display:table;}
		#input_Data .input_blur{width:150px; height:26px; line-height:26px; margin-bottom:5px; margin-left:10px; border:1px solid #bebebe;font-size:12px;line-height:26px;color:#333;z-index:10; padding-left:10px;}
		#input_Data .input_blur2{width:15px; height:26px; line-height:26px; margin-bottom:5px; margin-left:10px; border:0px solid #C8C8C8; padding-left:10px; vertical-align:middle;font-size:12px;}
		#input_Data input,#input_Data select{ line-height:26px;}
		
	</style>
	
	<script type="text/javascript">
			
		function fn_onload(){
			fn_set_optval();
		}

		//���� Default set
		function fn_set_optval()
		{
			
			var vgender = "<%=gender%>";
			if(vgender !="0"){
				vgender = "1";
			}
			var frm = document.forms[0];
						
			for (var i=0; i<frm.rdo_gender.length; i++){				
				if (frm.rdo_gender[i].value == vgender){			
					frm.rdo_gender[i].checked = true;
				}
			}
			
		}

		function fn_move_main(sendgubun){	
			var frm = document.forms[0];
			var tmp_gender = RadioCheck(); 
			
			if (frm.txt_username.value == ""){
				alert("�̸��� �Է��� �ּ���.");
				frm.txt_username.focus();
				return;
			}
			
			if (frm.txt_birthdate.value == ""){
				alert("������������� �Է��� �ּ���.");
				frm.txt_birthdate.focus();
				return;
			} else {
				if(frm.txt_birthdate.value.length != "8"){
	                alert("������������� YYYYMMDD �������� �Է��� �ּ���.");
	                frm.txt_birthdate.focus();
	                return;					
				}
			}
			
			if (frm.txt_mobileno.value == ""){
				alert("�ڵ����� �Է��� �ּ���.");
				frm.txt_mobileno.focus();
				return;
            } else {
                if(frm.txt_mobileno.value.length < 10){
                    alert("�ڵ��� ��ȣ�� �Է����ּ���.");
                    frm.txt_mobileno.focus();
                    return;                 
                }
            }			
							
			if (tmp_gender == ""){
				alert("������ üũ�� �ּ���.");
				return;
			}

			if (sendgubun == "EMAIL" ){

				if (frm.txt_email.value == ""){
					alert("E-mail�� �Է��� �ּ���.");
					frm.txt_email.focus();
					return;
				}

				if(!emailCheck(frm.txt_email.value)) 
				{
					
					frm.txt_email.focus();
					return ;
				}

				if (frm.txt_email.value.indexOf("'") != -1)
				{
					alert('�̸��Ͽ� Ư�����ڸ� ����� �� �����ϴ�.');
					frm.txt_email.focus();
					return ;
				}
				
				
			}	
			
			alert("���������� ������û�� �Ͽ����ϴ�.");

			frm.kunnr.value 			= frm.txt_kunnr.value;
			frm.username.value 	= frm.txt_username.value;				
			frm.birthdate.value 		= frm.txt_birthdate.value;
			frm.mobileno.value 		= frm.txt_mobileno.value;
			frm.email.value 			= frm.txt_email.value;
			frm.sendgubun.value 	= sendgubun;			
			frm.gender.value 		= tmp_gender;
			
			//frm.action = "http://ext.lotterental.net:8001/ktrerp/safekey/checkplus_send_main.jsp";
			//var msg = "kunnr : " + frm.kunnr.value + ", username : " + frm.username.value + ", birthdate : " + frm.birthdate.value + ", mobileno : " + frm.mobileno.value +", email : " + frm.email.value + ", sendgubun : " + frm.sendgubun.value + ", gender : " + frm.gender.value;
			//alert(msg);
			frm.action = "http://1.254.67.135:8090/interface/web_safekey/checkplus_send_main.jsp";
			
			frm.target = "_self";
			frm.submit();
							
		}
		
		function fn_close(){
			try
			{
				if(navigator.userAgent.match(/iPad/))
				{
					window.location = "ktrentalcall://safekeyclose";//�����е� ȣ���
				}	
			}
			catch(e)
			{
				
			}
	
			/* �Ʒ� ������ window.open('', '_self').close()���� ����	*/
			/* self.close(); 													*/
			window.open('', '_self').close();
		}
				
 		function RadioCheck(){ 			
 			var size = document.form_st.elements['rdo_gender'].length;
 			var tmp_gender = "";
 			for(var i = 0; i < size; i++) {
 	             if(document.form_st.elements['rdo_gender'][i].checked) {
 	            	 tmp_gender = document.form_st.elements['rdo_gender'][i].value;
 	            	 break;
 	             }
         	}
 			return tmp_gender;
 		}
		
		//-[�̸��� ��ȿ�� üũ]-------------------------------------------------------------------------------------------------------------
			function emailCheck (emailStr)
			{ 
			 var checkTLD=1; 
			 var knownDomsPat=/^(com|net|org|edu|int|mil|gov|arpa|biz|aero|name|coop|info|pro|museum)$/; 
			 var emailPat=/^(.+)@(.+)$/; 
			 var specialChars="\\(\\)><@,;:\\\\\\\"\\.\\[\\]"; 
			 var validChars="\[^\\s" + specialChars + "\]"; 
			 var quotedUser="(\"[^\"]*\")"; 
			 var ipDomainPat=/^\[(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})\]$/; 
			 var atom=validChars + '+'; 
			 var word="(" + atom + "|" + quotedUser + ")"; 
			 var userPat=new RegExp("^" + word + "(\\." + word + ")*$"); 
			 var domainPat=new RegExp("^" + atom + "(\\." + atom +")*$"); 
			 var matchArray=emailStr.match(emailPat); 
			 
			 if (matchArray==null) { 
				 alert("E-mail�ּҰ� ��ȿ���� �ʽ��ϴ�.");
				 return false; 
			 } 

			 var user=matchArray[1]; 
			 var domain=matchArray[2]; 

			 for (i=0; i<domain.length; i++) { 
				  if (domain.charCodeAt(i)>127) { 
					  alert("E-mail�ּҰ� ��ȿ���� �ʽ��ϴ�.");
				  return false; 
				  } 
			 } 

			 if (user.match(userPat)==null) { 
				 alert("E-mail�ּҰ� ��ȿ���� �ʽ��ϴ�.");
				 return false; 
			 } 

			 var IPArray=domain.match(ipDomainPat); 
			 if (IPArray!=null) { 
				 for (var i=1;i<=4;i++) { 
					  if (IPArray[i]>255) { 
						  alert("E-mail�ּҰ� ��ȿ���� �ʽ��ϴ�.");  
						  return false; 
					  } 
				 } 
			  return true; 
			 } 
			 var atomPat=new RegExp("^" + atom + "$"); 
			 var domArr=domain.split("."); 
			 var len=domArr.length; 
			 for (i=0;i<len;i++) { 
				  if (domArr[i].search(atomPat)==-1) { 
					  alert("E-mail�ּҰ� ��ȿ���� �ʽ��ϴ�.");
					  return false; 
				  } 
			 } 

			 if (checkTLD && domArr[domArr.length-1].length!=2 && domArr[domArr.length-1].search(knownDomsPat)==-1) {
				 alert("E-mail�ּҰ� ��ȿ���� �ʽ��ϴ�.");  
				 return false; 
			 } 

			 if (len<2) { 
				 alert("E-mail�ּҰ� ��ȿ���� �ʽ��ϴ�.");
				 return false; 
			 } 

			 return true; 
			} 
		//--------------------------------------------------------------------------------------------------------------------------------		
	</script>

</head>
<body onload="fn_onload()" bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
	<form name="form_st" method="post">
 
	<table id="__01" width="500" height="600" border="0" cellpadding="0" cellspacing="0">
		<tbody>
		<tr>
			<td colspan="11">
				<img src="/ktrerp/xpforms/images/popup_head.jpg" width="500" height="138" alt=""></td>
		</tr>
		<tr>
			<td rowspan="5">
				<img src="/ktrerp/xpforms/images/ktr_popup_02.png" width="12" height="388" alt=""></td>
			<td colspan="9" width="475" height="250" style="text-align: center;" valign="top">
					<div id="input_Data" style="height:250px;padding: 0px; ">
					
				<table width="90%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td width="10"> </td>
						<td width ="200"><label for="txt_kunnr"> ����ȣ</label> </td>
						<td width ="150"><input type="text" name="txt_kunnr" value="<%=kunnr %>" placeholder="" class="input_blur" maxlength="10"></td>
					</tr>
					<tr>
						<td><font color="red">*</font></td>
						<td><label for="txt_username" class="blind">�̸�</label></td>
						<td><input type="text" name="txt_username" value="<%=username %>" placeholder="" class="input_blur" maxlength="30"></td>
					</tr>
					<tr>
						<td><font color="red">*</font></td>
						<td><label for="txt_username" class="blind">����������� (��:19001231)</label></td>
						<td><input type="text" name="txt_birthdate" value="<%=birthdate %>" placeholder="" class="input_blur" onkeydown="this.value=this.value.replace(/[^0-9]/g,'')" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" onblur="this.value=this.value.replace(/[^0-9]/g,'')" maxlength="8"></td>
					</tr>
					<tr>
						<td><font color="red">*</font></td>
						<td><label for="txt_mobileno" class="blind">�ڵ���('-' �����Է�)</label> </td>
						<td><input type="text" name="txt_mobileno" value="<%=mobileno %>" placeholder="" class="input_blur"   onkeydown="this.value=this.value.replace(/[^0-9]/g,'')" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" onblur="this.value=this.value.replace(/[^0-9]/g,'')" maxlength="11" /></td>
					</tr>
					<tr>
						<td></td>
						<td><label for="rdo_gender">����</label> </td>
						<td><input type="radio" name="rdo_gender" value="1" class="input_blur2">����
							<input type="radio" name="rdo_gender" value="0" class="input_blur2">����</td>
					</tr>
					<tr>
						<td></td>
						<td><label for="txt_email" class="blind">E-mail</label></td>
						<td><input type="text" name="txt_email" value="<%=email %>" placeholder="" class="input_blur" ></td>
				</tr>
				<tr>
						<td colspan="3" height="70"><label for="txt_email" class="blind"><font color="red">* </font>�� �ʼ��Է��Դϴ�.</label></td>
				</tr>
				
			</table>
			</div>
			</td>
			<td rowspan="5">
				<img src="/ktrerp/xpforms/images/ktr_popup_04.png" width="13" height="388" alt=""></td>
		</tr>
		<tr>
			<td rowspan="4" width="51" height="119">
				</td>
			<td>
				<a href="javascript:fn_move_main('WEB')"><img src="/ktrerp/xpforms/images/popup_btn01.jpg" width="111" height="56" alt="web����" border=0></a></td>
			<td rowspan="4" width="6" height="119"></td>
			<td colspan="3">
			<td rowspan="4" width="5" height="119"></td>
			<td>
			<td rowspan="4" width="50" height="119">	</td>
		</tr>
		<tr>
			<td rowspan="3" width="111" height="63"></td>
			<td colspan="3" width="141" height="22"></td>
			<td rowspan="3" width="111" height="63"></td>
		</tr>
		<tr>
			<td rowspan="2" width="7" height="41"></td>
			<td>
				<a href="javascript:fn_close()"><img src="/ktrerp/xpforms/images/popup_btnClose.jpg" width="126" height="38" alt="�ݱ�" border=0></a></td>
			<td rowspan="2" width="8" height="41"></td>
		</tr>
		<tr>
			<td width="126" height="3"></td>
		</tr>
		<tr>
			<td colspan="11">
				<img src="/ktrerp/xpforms/images/popup_bottom.jpg" width="500" height="74" alt=""></td>
		</tr>
	</tbody>
	
	</table>

	<input type="hidden" name="kunnr" value="">
	<input type="hidden" name="username" value="">
	<input type="hidden" name="birthdate" value="">
	<input type="hidden" name="gender" value="">
	<input type="hidden" name="mobileno" value="">	
	<input type="hidden" name="email" value="">		
	<input type="hidden" name="sendgubun" value="">
</form>
</body>
</html>