<%@ page language="java" contentType="text/html; charset=utf-8" %>
<html>
<head>
<title>Insert title here</title>
<script type="text/javascript" src="./nexacro_if.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c129bdaf1f1e9ab68a7e0aca25921b0d&libraries=services"></script>
<script type="text/javascript">
	var xpCallBackObj; //WebBrowser 로부터 결과를 전달받을 오브젝트 (XPLATFORM Form)
	var xpCallBackFn;
	function setCallback(obj, name) {
		window.NEXACROHTML.Init();
	};
	
	
	function fn_search(){
		var address = document.getElementById("address").value;
		var geocoder = new daum.maps.services.Geocoder();

		geocoder.addressSearch(address, function(result, status) {

			// 정상적으로 검색이 완료됐으면 
		     if (status === daum.maps.services.Status.OK) {
		    	 //alert(result[0].x + ":" + result[0].y);
		    	 
		    	 document.getElementById("xcoords").value = result[0].x;
		    	 document.getElementById("ycoords").value = result[0].y;
		    	 
		    	 try {
		 			window.NEXACROHTML.FireUserNotify(result[0].x + "_" + result[0].y);
		 		} catch (e) {
		 			alert(e + "error");
		 		}
		    } 
		});
	}
	</script>
</head>
<body onload="setCallback();">
	<form>
		<input type="hidden" id="address" value="">
		<input type="hidden" id="xcoords" value="">
		<input type="hidden" id="ycoords" value="">
	</form>
	
	<input type="button" id="fn_map" value="Proceed" onclick="javascript:fn_search();"></input>
</body>
</html>