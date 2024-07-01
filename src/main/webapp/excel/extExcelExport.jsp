<%@ page contentType="text/html; charset=utf-8" pageEncoding="UTF-8" %>
<%@ page import="java.awt.Color"%>
<%@ page language="java"%>

 
<%@ page import="java.util.Date"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.*" %>


<!-- EcoSystem of TOBESOFT -->
<%@ page import="egovframework.ntrms.kr.co.ext.excel.*" %>


<!-- nexacro -->
<%@ page import="com.nexacro.xapi.data.*" %>
<%@ page import="com.nexacro.xapi.tx.*" %>


<!-- log4j -->
<%@ page  import="org.apache.log4j.*" %>

<!-- Apache POI : http://poi.apache.org -->
<%@ page import="org.apache.poi.poifs.filesystem.POIFSFileSystem" %>
<%@ page import="org.apache.poi.hssf.record.*" %>
<%@ page import="org.apache.poi.hssf.model.*" %>
<%@ page import="org.apache.poi.hssf.usermodel.*" %>
<%@ page import="org.apache.poi.hssf.util.*" %>
<%@ page import="org.apache.poi.ss.usermodel.*" %>
<%@ page import="org.apache.poi.ss.util.WorkbookUtil" %>
<%@ page import="org.apache.poi.xssf.usermodel.*" %>

<!--  json-simple -->
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="org.json.simple.JSONValue" %>
<%@ page import="org.json.simple.JSONArray" %>
<%
 /*
Copyright [2013] [EcoSystem of TOBESOFT]

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/ 

    try {
    	    request.setCharacterEncoding("UTF-8");
    	    
    	    ExportExcel ee = new ExportExcel(request, response);
    	        	    

    } catch(Exception e) {

    	e.printStackTrace();

    } finally {

        //에러로그 발생방지
        //java.lang.IllegalStateException: getOutputStream() has already been called for this response
        //jsp에서 해당 함수를 사용할때 servlet에서 생성된 writer 객체와 중복이 되서 발생.
        out.clear();
        out = pageContext.pushBody();
    }
    
    
%>