var amountLoaded = 0;
var ifrContentsTimer;
var isIframe= false;
/**
 * 브라우저 onload 수행
 * @return
 * @example
 * @memberOf public
 */
function onLoad() {

	  var host = window.location.host;
	   var ieVer = getBrowserType();
	   document.getElementById('nexacro_main').focus();

	//   var remeber = document.getElementById("remember_me");
	      if(isBrowser() == "Ie" && ieVer < 10 )
	      {
	     	 
	       //다른패이지 이동
	       alert("The optimal environment is working properly in Internet Explorer 10 or higher.");
	       window.location.href="http://windows.microsoft.com/en-us/internet-explorer/download-ie";
	         return;
	      }
 	    
	     if(isIframe==false)
	     {
	    	  ifrContentsTimer = setInterval('mainLoad()',20);  
	     } 
	     else
	    {
	    	 mainLoad();
	    }	  
	    	  
	     
}

if ( window.addEventListener ) {
    window.addEventListener( "load", onLoad, false );  //w3c dom 지원 브라우저
}
else if ( window.attachEvent ) {
    window.attachEvent( "onload", onLoad ); // w3c do m 지원 브라우저 외(ex:msdom 지원 브라우저 ie)
} else if ( window.onLoad ) {
    window.onload = onLoad;
}

/**
 * frame에 onload 처리시
 * @return
 * @example
 * @memberOf public
 */
function iframeOnload()
{
    isIframe= true;
}


/**
 * 브라우저 체크
 * @return msie8.0
 * @example
 * @memberOf public
 */
function isBrowser()
{
    var agt = navigator.userAgent.toLowerCase();

    if (agt.indexOf("chrome") != -1) return 'Chrome';
    if (agt.indexOf("opera") != -1) return 'Opera';
    if (agt.indexOf("staroffice") != -1) return 'Star Office';
    if (agt.indexOf("webtv") != -1) return 'WebTV';
    if (agt.indexOf("beonex") != -1) return 'Beonex';
    if (agt.indexOf("chimera") != -1) return 'Chimera';
    if (agt.indexOf("netpositive") != -1) return 'NetPositive';
    if (agt.indexOf("phoenix") != -1) return 'Phoenix';
    if (agt.indexOf("firefox") != -1) return 'Firefox';
    if (agt.indexOf("safari") != -1) return 'Safari';
    if (agt.indexOf("skipstone") != -1) return 'SkipStone';
    if (agt.indexOf("trident") != -1) return 'Ie';
    if (agt.indexOf("netscape") != -1) return 'Netscape';
    if (agt.indexOf("mozilla/5.0") != -1) return 'Mozilla';

}

/**
 * IE버젼체크
 * @return msie8.0
 * @example
 * @memberOf public
 */
function getBrowserType(){
    
    var _ua = navigator.userAgent;
    var rv = -1;
     
    //IE 11,10,9,8
    var trident = _ua.match(/Trident\/(\d.\d)/i);
    if( trident != null )
    {
        if( trident[1] == "7.0" ) return rv = 11;
        if( trident[1] == "6.0" ) return rv = 10;
        if( trident[1] == "5.0" ) return rv = 9;
        if( trident[1] == "4.0" ) return rv =8;
    }
     
    //IE 7...
    if( navigator.appName == 'Microsoft Internet Explorer' ) return rv = 7;
  
}

/**
 *nexacro frame load
 * @return
 * @example
 * @memberOf public
 */
function mainLoad()
{
    if(isIframe)
    {  
 
    	document.getElementById("delay").style.display = "none";  //프레그레스바 이미지 비활성화
        document.getElementById("nexacro_main").style.width = "100%";  //iframe size
        document.getElementById("nexacro_main").style.height = "100%";  //iframe size
        clearInterval(ifrContentsTimer);  //timer 종료
       
        document.getElementById('nexacro_main').focus();
        document.getElementById('nexacro_main').contentWindow.oninitframework();   //넥사크로 로드
    }
    else
    {
  	 document.getElementById("delay").style.display = "block";  //프레그레스바 이미지 활성화
       
    }
}
