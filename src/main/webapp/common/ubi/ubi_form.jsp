<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script type="text/javascript" src="/common/nexacro/WebIF.js"></script>
<script language="JavaScript">	
	//Nexacro 호출관련 초기화
	function NEXACRO_INIT() {
	    window.NEXACROHTML.Init();
	}
	
	function reportReady()
	{
	    document.frm.action = "/common/ubi/ubi_viewer.jsp";
	    document.frm.submit();
	}
</script>
</head>
<body onload="javascript:NEXACRO_INIT()">
	<form name="frm" id="frm" method="post">
		<input name="btnReady"    id="btnReady"   type="hidden"  width="0" height="0" onClick="reportReady()"></input>
		<input name="print_type"  id="print_type" type="hidden"  size="100">
		<input name="jrf_dir"     id="jrf_dir"    type="hidden"  size="100">
		<input name="jrf"         id="jrf"        type="hidden"  size="100">
		<input name="ds"          id="ds"         type="hidden"  size="100">
	</form>
</body>
</html>