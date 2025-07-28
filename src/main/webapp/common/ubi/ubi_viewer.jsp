<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%
    String print_type = request.getParameter("print_type");
    String jrf_dir = request.getParameter("jrf_dir");
    String jrf = request.getParameter("jrf");
    String ds = request.getParameter("ds");
%>
<html>
<head>
<title>UbiReport Preview</title>
<script type="text/javascript" src="/common/ubi/ubiviewer.js"></script>
<script type="text/javascript" src="/common/nexacro/WebIF.js"></script>
<script language='javascript'>
<!--

    /* 기본 정보 */
    var host = self.location.host;                         // ip:port
    var app = "";                                          // WebApplication 명.
    var url = "http://" + host + (app==""?"":("/" + app)); // WebApplication URL.

    /* 환경 설정 정보 */
    var print_type  = '<%=print_type%>';
    var jrf_dir     = '<%=jrf_dir%>';
    var jrf         = '<%=jrf%>';
    var ds          = '<%=ds%>';
    
    var scale       = "120";
    var is_deflater = "true";
    var is_base64   = "true";
    var is_unicode  = "false";
    var utf_data    = "false";

    var w_gap = 12;
    var h_gap = 12;

    function getArg() {
    
        var args = 'arg1#arg1_value1#arg2#arg2_value#...#argn#argn_value#';
        return args;
    }

    function Ubi_Resize() {

        var w = ((self.innerWidth || (document.documentElement && document.documentElement.clientWidth) || document.body.clientWidth)) - w_gap;
        var h = ((self.innerHeight || (document.documentElement && document.documentElement.clientHeight) || document.body.clientHeight)) - h_gap;
        document.getElementById("UbiViewer").width = w + 'px';
        document.getElementById("UbiViewer").height = h + 'px';
    }

    function Ubi_Version() {
        var nl = Ubi_isIE?"\n":"\\n";
        Alert('Plugin : ' + Ubi_Object.GetVersion() + nl + nl + 'OCX : ' + document.getElementById('UbiViewer').GetOcxVersion() + '(' + Ubi_ActiveXEdition() + ')');
    }

    function finishLoad() 
    {    	 
    	// 일단 미리출력하는 방식으로 테스트...
    	document.UbiViewer.directPrint();
    	return;
    	
        //단건 출력일 경우 미리보기 완료 후 바로 출력
        if (print_type == "accounting_check_each_print")
        {
            document.UbiViewer.directPrint();
        }
    }

    function PrintEnd() {

        //Alert("출력이 완료되었습니다.");
        //Alert("Print has been completed successfully.");
        //fireOnusernotify("printed");
        
        if (document.UbiViewer.getPrintStatus() == 0)
        {
            //Alert("Print has been completed successfully.");          
            fireOnusernotify("printed");            
        }
    }
    
    //Nexacro 호출관련 초기화
    function NEXACRO_INIT() {
        window.NEXACROHTML.Init();
    }
    
    //Nexacro 호출
    function fireOnusernotify(val1) {
        window.NEXACROHTML.FireUserNotify(val1);
    }
//-->
</script>
</head>
<body style='margin:3px' onload="javascript:NEXACRO_INIT()" onresize="javascript:Ubi_Resize()">
<script type="text/javascript">
<!--

    if( Ubi_PluginCheck() ) {
        
        var w = ((self.innerWidth || (document.documentElement && document.documentElement.clientWidth) || document.body.clientWidth)) - w_gap;
        var h = ((self.innerHeight || (document.documentElement && document.documentElement.clientHeight) || document.body.clientHeight)) - h_gap;

        document.write("<object id='UbiViewer' type='" + Ubi_PluginType() + "' width='" + w + "px' height='" + h + "px'>");
        document.write("    <param name='ocxtype'               value='" + Ubi_ActiveXEdition() + "'>");
        document.write("    <param name='fileURL'               value=''>");
        document.write("    <param name='servletRootURL'        value=''>");
        document.write("    <param name='servletURL1'           value=''>");
        document.write("    <param name='servletURL2'           value=''>");
        document.write("    <param name='jrfFileDir'            value='" + jrf_dir + "'>");
        document.write("    <param name='jrfFileName'           value='" + jrf + "'>");
        document.write("    <param name='dataSource'            value='" + ds + "'>");
        document.write("    <param name='scale'                 value='" + scale + "'>");

        document.write("    <param name='isDeflater'            value='" + is_deflater + "'>");
        document.write("    <param name='isBase64'              value='" + is_base64 + "'>");
        document.write("    <param name='isUnicode'             value='" + is_unicode + "'>");
        document.write("    <param name='utfData'               value='" + utf_data + "'>");

        document.write("    <param name='execType'              value='TYPE4'>");   // 실행형태. 변경 불가.
        document.write("    <param name='margin'                value='true'>");    // 여백 마크 보임 여부 속성.
        document.write("    <param name='progress'              value='true'>");    // 프로그래스바 보임 여부 속성.
        document.write("    <param name='toolbar'               value='true'>");    // 툴바 보임 여부 속성.
        document.write("    <param name='fontRevision'          value='true'>");    // 폰트보정. 변경 불가.
        document.write("    <param name='printMarginRevision'   value='true'>");    // 출력보정. 변경 불가.
        document.write("</object>");
    }

//-->
</script>
</body>
</html>