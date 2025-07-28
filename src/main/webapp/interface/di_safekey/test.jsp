<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8" />
<script type="text/javascript" src="./WebIF.js"></script>
<script type="text/javascript">
	var xpCallBackObj; //WebBrowser 로부터 결과를 전달받을 오브젝트 (XPLATFORM Form)
	var xpCallBackFn;

	function setCallback(obj, name) {
		window.NEXACROHTML.Init();
	};

	function submitContents() {
		// 에디터의 내용에 대한 값 검증은 이곳에서
		var objElement = document.getElementById("inputText1");

		try {
			window.NEXACROHTML.FireUserNotify(objElement.value);

		} catch (e) {
			alert(e + "error");
		}
	};
</script>
</head>
<BODY onload="setCallback();">
	<input type="hidden" id="inputText1" value="NEXACRO"></input>
	<input type="button" id="btnTest1" value="HTML5값전달" onClick="submitContents()"></input>
</BODY>
</html>
