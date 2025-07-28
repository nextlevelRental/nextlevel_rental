/**
 * @namespace
 * @name login javascript
 * @author Tobesoft w.s.jeong
 * @memberof!  <global>
 */

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
   var objId = document.getElementById("id");
   var objPw = document.getElementById("pw");
   var remeber = document.getElementById("remember_me");

   if(host.indexOf("localhost") != -1)
   {
	   window.document.title = "[" + host + "]" + window.document.title;
   }
   
   var objId = document.getElementById("id");
    //     objId.focus();
   document.getElementById('nexacro_main').focus();
    //document.all.delay.style.display = "";  //프로그레스바 이미지 처리
   
     if(isBrowser() == "Ie" && ieVer < 10 )
     {
      //다른패이지 이동
        alert("In the current browser you are using is not properly use the nexacroplatform system.The optimal environment is working properly in Internet Explorer 10 or higher.");
         window.location.href="http://windows.microsoft.com/ko-kr/internet-explorer/download-ie";
        return;
     }

    // userid 쿠키에서 id 값을 가져온다.
    var cook = document.cookie + ";";
    var idx = cook.indexOf("userid", 0);
    var val = "";

    if(idx != -1)
    {
        cook = cook.substring(idx, cook.length);
        begin = cook.indexOf("=", 0) + 1;
        end = cook.indexOf(";", begin);
        val =  cook.substring(begin, end);

    }

    if(!window.localStorage) 
    {
    	 // 가져온 쿠키값이 있으면
        if(val != "")
        {
           objId.value = val;
            remeber.checked = true;
            objPw.focus();
        }
        else
        {
        	objId.focus();
        }
    
    }else{
    	
    	

    	if(localStorage.getItem("userid") == '' || localStorage.getItem("userid") == null)
    	{
    		remeber.checked = false;
    		objId.focus();
    	}	
    	else
    	{
    	 	objId.value = localStorage.getItem("userid");
    		remeber.checked = true;
    		 objPw.focus();
    	}	
    	
      
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
 *로그인 버튼 클릭시 발생되는 event
 * @return
 * @example
 * @memberOf public
 */
function login_onclick(){

    var objId = document.getElementById("id");
    var objPw = document.getElementById("pw");
    var remeber = document.getElementById("remember_me").checked;
    var strId = objId.value.toString();
    var strPw = objPw.value.toString();

    if(remeber)
    {
        saveLogin(strId);  //쿠키저장
    }
    else
    {
        saveLogin("");  //쿠키저장
    }

    if(strId == null || strId == ""){
        alert("Please enter Login ID");
        objId.focus();
        return;
    }

    if(strPw == null || strPw == ""){

        alert("Please enter Login Password");
        objPw.focus();
        return;
    }
    sessionStorage.setItem("id" ,strId);  //id 저장
    sessionStorage.setItem("pw" ,strPw); //pw 저장
    sessionStorage.setItem("prj" ,"login"); //prjcode 저장

    ifrContentsTimer = setInterval('mainLoad()',100);

    //progressBarSim(amountLoaded);
   // loading();
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
    	//  document.getElementById("login").style.display = "none";  
    //	  document.getElementById("bglogo").style.display = "none";//로그인 폼 비활성화
    	  document.getElementById("login").style.display = "none"; 
    	  document.getElementById("delay").style.display = "none";  //프레그레스바 이미지 비활성화
    	  //document.getElementById("divLogin").style.display = "none";  
    	 // document.getElementById("bottom").style.display = "none";  
    	  
    	  document.body.style.background = " url('');";   //background color 변경
    	//  document.body.style.background = "#FFFFFF";   //background color 변경
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

/**
 *로그인 onkeycown
 * @return
 * @example
 * @memberOf public
 */
function login_onkeydown(){

	// 엔터키의 코드는 13입니다.
    if(event.keyCode == 13){
   	 var objPw = document.getElementById("pw");
     objPw.focus();
    	
        return;
    }

}

function psw_onkeydown()
{
	 // 엔터키의 코드는 13입니다.
    if(event.keyCode == 13){
    	login_onclick();
        return;
    }
}

/**
 *체크박스 event
 * @return
 * @example
 * @memberOf public
 */
function calc(checkbox)
{
}

/**
 *쿠키저장
 * @return
 * @example
 * @memberOf public
 */
function setsave(name, value, expiredays)
{
	if(!window.localStorage) {
		var today = new Date();
		    today.setDate( today.getDate() + expiredays );
		    document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + today.toGMTString() + ";"  
		
		// document.write('이 Browser 는 Local Storage 를 지원하지 않습니다.');
		} else {
			
			if(expiredays == -1)
			{
				
				localStorage.setItem("userid", "");
			}
			else
			{
				
				localStorage.setItem("userid", value);
			}	
			
		}
	//var today = new Date();
   // today.setDate( today.getDate() + expiredays );
   // document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + today.toGMTString() + ";"
}

/**
 *쿠키ID저장
 * @return
 * @example
 * @memberOf public
 */
function saveLogin(id)
{
    if(id != "")
    {
        // userid local storage save
    	//쿠키에 id 값을 7일간 저장
        setsave("userid", id, 7);
    }else{
        // userid 쿠키 삭제
        setsave("userid", id, -1);
    }
}

