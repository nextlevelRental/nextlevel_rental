<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.math.*" %>
<%
	Map mp = new HashMap();
	mp = (Map)request.getAttribute("result");
	String retMsg = "";
	if(mp != null) {
		retMsg = (String)mp.get("retMsg");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>error</title>
</head>
<script type="text/javascript">
	alert('<%=retMsg%>');
	self.close();
</script>
<body>
</body>
</html>