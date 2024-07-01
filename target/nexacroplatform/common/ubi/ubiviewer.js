//====================================================================================================
// 플러그인 설치 정보를 기입합니다.
// (모든 변수와 함수는 JavaScript 응용 프로그램과의 충돌을 막기 위하여 Ubi_ 로 시작하였습니다.)
//====================================================================================================

//----------------------------------------------------------------------------------------------------
// Context 폴더 설정
//----------------------------------------------------------------------------------------------------
var Ubi_App = "";

//----------------------------------------------------------------------------------------------------
// 버전관리 : 플러그인 버전, 래퍼 버전
//----------------------------------------------------------------------------------------------------
var Ubi_PluginFile = "UbiViewer.exe"		//플러그인 통합설치 파일. UbiViewer.exe, UbiViewerBcqre.exe, UbiViewerBcqreUni.exe, UbiViewerMarkAny.exe, TrustUbiBcqre.exe
var Ubi_PluginVersion = "2.502.1411.701";
var Ubi_ViewerFile = "UbiViewerXUniP.cab";	//뷰어 파일. UbiViewerXUniP.cab, UbiViewerXBcqreP.cab, UbiViewerXBcqreUniP.cab, UbiViewerXMarkAnyP.cab
var Ubi_ViewerVersion = "2.502.1411.701";

//----------------------------------------------------------------------------------------------------
// 배포 설치본 관리
//----------------------------------------------------------------------------------------------------
var Ubi_Host = self.location.host;											// ip:port
var Ubi_BaseUrl = "http://" + Ubi_Host + (Ubi_App==""?"":("/" + Ubi_App));	// WebApplication URL.

var Ubi_InstallPagePath = Ubi_BaseUrl + "/common/ubi/install.html";			// 미설치 시 제공되는 설치 페이지
var Ubi_InstallImagePath = Ubi_BaseUrl + "/common/ubi";						// 제공되는 설치 페이지에서 사용되는 이미지 경로

var Ubi_InstallPath = Ubi_BaseUrl + "/common/ubi/" + Ubi_PluginFile;		// 플러그인 통합본 설치
var Ubi_IE_AutoInstall = false; // 플러그인 화면을 GET방식으로 새로고침해도 문제가 없을때에 true로 설정하여 F5(새로고침) 을 누르지 않고도 자동 반영되도록 한다.(IE만 해당) false 설정시 Firefox/Chrome 처럼 F5(새로고침) 누르라는 화면이 표시됨.

//----------------------------------------------------------------------------------------------------
// 배포 모듈 관리
//----------------------------------------------------------------------------------------------------
var Ubi_UpdateXml = "";
Ubi_UpdateXml += "<update>";
Ubi_UpdateXml += "<file title='UbiViewer' url='" + Ubi_BaseUrl + "/common/ubi/" + Ubi_ViewerFile + "' version='" + Ubi_ViewerVersion + "'/>";	// 뷰어에 따라 배포 파일 변경
Ubi_UpdateXml += "</update>";

//----------------------------------------------------------------------------------------------------
// 안내 메세지
//----------------------------------------------------------------------------------------------------
var Ubi_HelpSafari = "ㆍIn the Safari browser, close the browser after the installation, then <font color='#ff6600'>reconnect again</font>.<br>";
var Ubi_HelpFireFox = "ㆍIf you are required to execute permissions in the FireFox browser, be sure to press the <font color='#ff6600'>[allow]→[recall/ remember]></font> buttons in sequence<br>ㆍIf not stalled, please check the blocked plug-ins.<br>";
var Ubi_HelpChrome = "ㆍIf you are required to execute permissions in the Chrome browser, be sure to press the <font color='#ff6600'>[Always run on this site]</font>buttonㆍIf not stalled, please check the blocked plug-ins.<br>";
var Ubi_HelpOpera = "ㆍIn the Opera browser, please download the file.<br>";
var Ubi_HelpIE = "ㆍWhen the file download is blocked in IE browser, please run the [Direct Download].<br>";

//====================================================================================================
// 플러그인 모듈 관리 프로그램 - 아래를 수정하거나 지우지 마십시오.
//====================================================================================================
var Ubi_currentInstalledVersion = "";
var Ubi_UpdateModuleInfo = "";
var Ubi_mustUpdateMainUrl="";
var Ubi_mustUpdateSubUrl="";
var Ubi_Object = null;
var Ubi_PluginId = "UbiViewerPlugin";
var Ubi_isupgrade = false;

var Ubi_isIE = false;
var Ubi_isOpera = false;
var Ubi_isChrome = false;
var Ubi_isFirefox = false;
var Ubi_isSafari = false;

var Ubi_HelpRefresh = "<table width='100%' height='100%' style='z-index:99999999;'><tr><td align='center'><img src='"+Ubi_InstallImagePath+"/install_complete.png'></td></tr></table>";
var Ubi_Help64bit = "<table width='100%' height='100%' style='z-index:99999999;'><tr><td align='center'><img src='"+Ubi_InstallImagePath+"/install_64bit.png'></td></tr></table>";

if (navigator.userAgent.indexOf('Trident/7')!= -1 && navigator.appName.indexOf("Netscape")!= -1 && navigator.product == "Gecko") {
	Ubi_isIE = true;
}else if (navigator.userAgent.indexOf('Chrome')!= -1) {
	if (navigator.userAgent.indexOf('OPR')!= -1) {
		Ubi_isOpera = true;
	} else {
		Ubi_isChrome = true;
	}
}else if (navigator.userAgent.indexOf('Firefox')!= -1) {
	Ubi_isFirefox = true;
}else if ((navigator.userAgent.indexOf('Safari')!= -1)||(navigator.userAgent.indexOf('Konqueror') != -1)) {
	Ubi_isSafari = true;
}else if (navigator.userAgent.indexOf('Opera')!= -1) {
	Ubi_isOpera = true;
}else if (navigator.appName.indexOf("Microsoft")!= -1) {
	Ubi_isIE = true;
}else {
	Ubi_isFirefox = true;
};

//----------------------------------------------------------------------------------------------------
// 플러그인의 설치가 필요하면 설치를 유도한다.
//----------------------------------------------------------------------------------------------------
function Ubi_PluginCheck()
{
	if(Ubi_InstallCheck(Ubi_PluginChecker(), "UbiDecision.UbiViewerPlugin.1")){
		if(Ubi_UpgradeCheck()){
			Ubi_UpdateCheck();
			return true;
		}else{
			Ubi_ShowInstallPage(true);
		}
	}else{
			Ubi_ShowInstallPage(false);
			if(!Ubi_isupgrade){setTimeout(function(){Ubi_WaitForInstall(true);},1000);}
	}
}

//----------------------------------------------------------------------------------------------------
// 플러그인의 설치 버전 체크
//----------------------------------------------------------------------------------------------------
function Ubi_InstallCheck(mimetype, progid)
{
	document.write("<iframe id='checkFrame' style='position:absolute;left:-100px;top:-100px;width:1px;height:1px;'></iframe>");
	document.write("<object id='" + Ubi_PluginId + "' type='"+Ubi_PluginChecker()+"' width='1px' height='1px' style='position:absolute;left:-1000px;top:-1000px;visibility:hidden'></object>");
	Ubi_Object = document.getElementById(Ubi_PluginId);
	try{
		Ubi_currentInstalledVersion = Ubi_Object.GetVersion();
		return true; // 설치버전 있음
	}catch(e){
		return false; // 설치안됨
	}
	return false;
}

//----------------------------------------------------------------------------------------------------
// 플러그인의 업그레이드 버전 체크
//----------------------------------------------------------------------------------------------------
function Ubi_UpgradeCheck()
{
	if(Ubi_PluginVersion == Ubi_currentInstalledVersion) return true;
	Ubi_currentInstalledVersion = Ubi_currentInstalledVersion.replace(/,/gi, ".");
	var ver1 = Ubi_currentInstalledVersion.split(".");
	var ver2 = Ubi_PluginVersion.split(".");
	if(parseInt(ver1[0])>parseInt(ver2[0])) {return true;}
	else if(parseInt(ver1[0])<parseInt(ver2[0])) {return false;}
	else if(parseInt(ver1[1])>parseInt(ver2[1])) {return true;}
	else if(parseInt(ver1[1])<parseInt(ver2[1])) {return false;}
	else if(parseInt(ver1[2])>parseInt(ver2[2])) {return true;}
	else if(parseInt(ver1[2])<parseInt(ver2[2])) {return false;}
	else if(parseInt(ver1[3])>parseInt(ver2[3])) {return true;}
	return false;
}

//----------------------------------------------------------------------------------------------------
// 플러그인의 모듈 업데이트 체크
//----------------------------------------------------------------------------------------------------
function Ubi_UpdateCheck()
{
	var xmlDoc;
	var url;
	var title;
	var version;

	var XML = "";
	var resultXML = '';

	if (window.DOMParser){
		parser=new DOMParser();
		xmlDoc=parser.parseFromString(Ubi_UpdateXml,"text/xml");
	}else{ // IE
		xmlDoc=new ActiveXObject("Microsoft.XMLDOM");
		xmlDoc.async=false;
		xmlDoc.loadXML(Ubi_UpdateXml);
	}

  for(i=0;i<xmlDoc.getElementsByTagName("file").length;i++)
  {
		title = xmlDoc.getElementsByTagName("file")[i].attributes[0].value; // title
		try{
			url = xmlDoc.getElementsByTagName("file")[i].attributes['url'].value; // url
			version = xmlDoc.getElementsByTagName("file")[i].attributes['version'].value; // version
		}catch(e){
			url = xmlDoc.getElementsByTagName("file")[i].attributes[1].value; // url
			version = xmlDoc.getElementsByTagName("file")[i].attributes[2].value; // version
		}

	  var result = Ubi_UpdateCheckVersion(Ubi_Object.getFileVersion(url.substring(url.lastIndexOf("/")+1,url.length)), version);
	  if(result==false){
  		XML += "<file title='"+title+"' url='"+url+"'>";
  	}
  }
  resultXML = "<update>"+XML+"</update>";

  if(XML==''){
		return true;//업글없이 바로 표시
  }else{
		Ubi_Object.setUpdateXml(resultXML);
		return false;
	}
}

//----------------------------------------------------------------------------------------------------
// 버전 비교
//----------------------------------------------------------------------------------------------------
function Ubi_UpdateCheckVersion(cur, last)
{
	last = last.replace(/,/gi, ".");

	if(last == cur) return true;
	var ver1 = cur.split(".");
	var ver2 = last.split(".");

	if(parseInt(ver1[0])>parseInt(ver2[0])) {return true;}
	else if(parseInt(ver1[0])<parseInt(ver2[0])) {return false;}
	else if(parseInt(ver1[1])>parseInt(ver2[1])) {return true;}
	else if(parseInt(ver1[1])<parseInt(ver2[1])) {return false;}
	else if(parseInt(ver1[2])>parseInt(ver2[2])) {return true;}
	else if(parseInt(ver1[2])<parseInt(ver2[2])) {return false;}
	else if(parseInt(ver1[3])>parseInt(ver2[3])) {return true;}
	return false;
}

function Ubi_AddEvent(obj, name, func){if(obj){if(obj.attachEvent){obj.attachEvent("on"+name,func);}else{obj.addEventListener(name,func,false);}}}


function Ubi_PluginChecker(){
	return "application/x-ubiviewerplugin";
}

function Ubi_PluginType(){
	return "application/x-ubiviewer";
}

//----------------------------------------------------------------------------------------------------
// 에디션 자동 구별
//----------------------------------------------------------------------------------------------------
function Ubi_ActiveXEdition()
{
	if(Ubi_UpdateXml.indexOf("UbiViewerXP.cab")>=0){
		return "MBCS";
	}
	if(Ubi_UpdateXml.indexOf("UbiViewerXUniP.cab")>=0){
		return "UNICODE";
	}
	if(Ubi_UpdateXml.indexOf("UbiViewerXMarkAnyP.cab")>=0){
		return "MARKANY";
	}
	if(Ubi_UpdateXml.indexOf("UbiViewerXBcqreP.cab")>=0){
		return "BCQRE";
	}
	if(Ubi_UpdateXml.indexOf("UbiViewerXBcqreUniP.cab")>=0){
		return "BCQREUNI";
	}
}

//----------------------------------------------------------------------------------------------------
// 설치여부 파악
//----------------------------------------------------------------------------------------------------
function Ubi_WaitForInstall(isFirst)
{
	var doc = document.getElementById('checkFrame').contentWindow.document;
	var checkScript = "";
	checkScript += "<html><head><title></title>";
	checkScript += "</head><body><object id='checkObj' type='"+Ubi_PluginChecker()+"' width='1px' height='1px'></object>";
	checkScript += "<script type='text/javascript'>try{var Ubi_InstallCheckVersion='';Ubi_InstallCheckVersion=document.getElementById('checkObj').GetVersion();}catch(e){}";
	checkScript += "<"+"/script>";
	checkScript += "</body></html>";

	doc.open();
	doc.write(checkScript);
	doc.close();

	var checkResult = document.getElementById('checkFrame').contentWindow.Ubi_InstallCheckVersion;
	if(Ubi_isupgrade==false && checkResult!='')
	{
		if(document.getElementById('installDesign'))
		{
			document.getElementById('installDesign').innerHTML = Ubi_HelpRefresh;
		}
		if(Ubi_isIE && Ubi_IE_AutoInstall)
		{
			try{

				document.location.href = document.location.href;
			}catch(e){}
		}
	}
	else
	{
		setTimeout(function(){Ubi_WaitForInstall(false)},1000); // 더 기다려야됨.
	}
}

//----------------------------------------------------------------------------------------------------
// 디자인 가져오기
//----------------------------------------------------------------------------------------------------
function Ubi_AjaxReq(options) {
	options={type: options.type || "POST", url: options.url || "", onComplete: options.onComplete || function(){}, onSuccess: options.onSuccess || function(){}};
	if(typeof XMLHttpRequest == "undefined"){XMLHttpRequest = function() {return new ActiveXObject(navigator.userAgent.indexOf("MSIE 5") >= 0 ? "Microsoft.XMLHTTP" : "Msxml2.XMLHTTP");};}
	var xml = new XMLHttpRequest();
	xml.open(options.type, options.url, true);
	var requestDone = false;
	setTimeout(function() {requestDone = true;}, 20000);
	xml.onreadystatechange = function() {if( xml.readyState == 4 && !requestDone) {if(httpSuccess(xml) ) {options.onSuccess(xml.responseText);}options.onComplete();xml = null;}};
	xml.send();
	function httpSuccess(r) {
		try{return (!r.status && location.protocol == "file:") ||(r.status >= 200 && r.status < 300) || r.status == 304 || navigator.userAgent.indexOf("Safari") >= 0 && typeof r.status == "undefined;";}catch(e){}
		return false;
	}
}

//----------------------------------------------------------------------------------------------------
// 브라우저별 설치 가이드 얻기
//----------------------------------------------------------------------------------------------------
function Ubi_getInstallGuide(Ubi_isupgrade)
{
		if(Ubi_isSafari){return Ubi_HelpSafari;}
		if(Ubi_isFirefox){return Ubi_HelpFireFox;}
		if(Ubi_isChrome){return Ubi_HelpChrome;}
		if(Ubi_isOpera){return Ubi_HelpOpera;}
		if(Ubi_isIE){return Ubi_HelpIE;}
		return "";
}

//----------------------------------------------------------------------------------------------------
// 설치 디자인을 가져와서 보여주기 / 설치 프로그램 다운로드
//----------------------------------------------------------------------------------------------------
function Ubi_ShowInstallPage(isupgrade)
{
	Ubi_isupgrade = isupgrade;
	
	document.write("<div id='installDesign' style='position:absolute;left:0px;top:0px;width:100%;height:100%;z-index:99999999;'></div>");
	
	if(navigator.userAgent.indexOf('x64')>-1 && navigator.userAgent.indexOf('Win64')>-1)
	{
			document.getElementById('installDesign').innerHTML = Ubi_Help64bit;
	}
	else
	{
		document.write("<iframe id='frameDownload' src='"+Ubi_InstallPath+"' style='position:absolute;left:-100px;top:1px;width:10px;height:10px;'></iframe>");
		
		Ubi_AjaxReq({
			url: Ubi_InstallPagePath,
			onSuccess: function(val) {
				var sysInfo = navigator.userAgent;
				var InstallGuide = Ubi_getInstallGuide(Ubi_isupgrade); //업그레이드 설치
				var UpgradeTitle = (isupgrade)?"Re-Install":"Install";
				document.getElementById('installDesign').innerHTML = val.replace(/{DOWNLOAD_URL}/g,Ubi_InstallPath).replace(/{BROWSER_INFO}/g,sysInfo).replace(/{INSTALL_GUIDE}/g,InstallGuide).replace(/{UPGRADE_TITLE}/g,UpgradeTitle);
			}
		});
	}
	
}

//====================================================================================================
// 브라우저별로 메세지를 안전하게 표시합니다.
//====================================================================================================
function Alert(msg, title){
	if(Ubi_isChrome || Ubi_isFirefox || Ubi_isSafari || Ubi_isOpera){
		if(!title){
			title='UbiReport';
		}
		var obj = document.createElement("div");
		var objtag = "<object id='UbiViewerPluginVersion' type='"+Ubi_PluginType()+"' width='1' height='1' style='display:hidden'></object>";
		obj.innerHTML = objtag;
		document.documentElement.appendChild(obj);
		if(Ubi_isSafari || Ubi_isOpera){
			Ubi_currentInstalledVersion = document.getElementById('UbiViewerPluginVersion').Alert(msg,title); //브라우저 특성상 내부 메세지 창 이용
		}
		if(Ubi_isChrome || Ubi_isFirefox){
			Ubi_currentInstalledVersion = document.getElementById('UbiViewerPluginVersion').alert(msg,title); //브라우저 특성상 javascript alert 함수를 간접적으로 이용
		}
		document.documentElement.removeChild(obj);
	}else{
		alert(msg); // IE 는 alert 함수 그대로 이용.
	}
}

