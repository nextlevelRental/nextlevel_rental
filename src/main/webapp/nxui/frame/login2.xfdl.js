(function()
{
    return function()
    {
        if (!this._is_form)
            return;
        
        this.on_create = function()
        {
            // Declare Reference
            var obj = null;
            
            if (Form == this.constructor) {
                this.set_name("Login");
                this.set_classname("Login");
                this.set_titletext("New Form");
                this._setFormPosition(0,0,1260,871);
            }
            this.style.set_background("transparent");
            this.getSetter("layoutautofittype").set("width");

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("dsLogin", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"USER_ID\" type=\"STRING\" size=\"256\"/><Column id=\"PASSWORD\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"USER_ID\">test</Col><Col id=\"PASSWORD\">test123</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsService", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"SVC_ID\" type=\"STRING\" size=\"100\"/><Column id=\"QUERY_LIST\" type=\"STRING\" size=\"256\"/><Column id=\"SERVICE\" type=\"STRING\" size=\"100\"/><Column id=\"IN_DATASET_LIST\" type=\"STRING\" size=\"256\"/><Column id=\"OUT_DATASET_LIST\" type=\"STRING\" size=\"256\"/><Column id=\"CONTROLLER\" type=\"STRING\" size=\"512\"/><Column id=\"CALLBACK\" type=\"STRING\" size=\"100\"/><Column id=\"SYNC_YN\" type=\"STRING\" size=\"1\"/></ColumnInfo><Rows><Row><Col id=\"SVC_ID\">login</Col><Col id=\"IN_DATASET_LIST\">inDataset=dsLogin</Col><Col id=\"OUT_DATASET_LIST\">gdsUser=gdsUser</Col><Col id=\"CONTROLLER\">xpQueryLogin.do</Col><Col id=\"CALLBACK\">fn_callBack</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_user", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"GROUP_ID\" type=\"STRING\" size=\"256\"/><Column id=\"USER_ID\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Div("div_login", "absolute", "0", "0", "911", "871", null, null, this);
            obj.set_taborder("6");
            obj.style.set_background("transparent");
            obj.set_scrollbars("none");
            this.addChild(obj.name, obj);
            obj = new Static("stc_bg", "absolute", "0", "0", "911", "640", null, null, this.div_login);
            obj.set_taborder("5");
            obj.set_cssclass("sta_BG_login");
            obj.style.set_background("transparent URL('image::login3.jpg')");
            obj.style.set_border("10 solid #808080ff");
            this.div_login.addChild(obj.name, obj);
            obj = new Edit("txt_userId", "absolute", "26.67%", "168", "153", "29", null, null, this.div_login);
            obj.set_taborder("6");
            obj.style.set_background("#320a3dff");
            obj.style.set_color("#aaaaaaff");
            this.div_login.addChild(obj.name, obj);
            obj = new Edit("txt_userPwd", "absolute", "26.56%", "208", null, "29", "56.75%", null, this.div_login);
            obj.set_taborder("7");
            obj.set_password("true");
            obj.style.set_background("#320a3dff");
            obj.style.set_color("#aaaaaaff");
            this.div_login.addChild(obj.name, obj);
            obj = new Button("btn_login", "absolute", "57.85%", "167", null, "66", "23.27%", null, this.div_login);
            obj.set_taborder("8");
            obj.set_cssclass("btn_LG_login");
            obj.style.set_image("URL('image::btn_MDI_login.png')");
            obj.style.set_background("#320a3dff");
            obj.style.set_border("0 double #777777ff #f8f8f8ff");
            obj.style.set_color("#ddddddff");
            obj.style.set_bordertype("round 1 1");
            obj.style.set_font("bold 12 돋움");
            obj.style.set_gradation("linear 0,0 #78228aff 0,100 #370b40ff");
            this.div_login.addChild(obj.name, obj);
            obj = new Button("Button00", "absolute", "403", "209", "85", "25", null, null, this.div_login);
            obj.set_taborder("9");
            obj.style.set_image("URL('image::pw.png')");
            obj.style.set_background("#605565ff");
            obj.style.set_border("0 solid #999999ff");
            this.div_login.addChild(obj.name, obj);
            obj = new CheckBox("idcheck", "absolute", "403", "171", "22", "20", null, null, this.div_login);
            obj.set_taborder("10");
            obj.set_value("false");
            obj.set_truevalue("1");
            obj.set_falsevalue("0");
            this.div_login.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 553, 321, this.div_login,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("6");
            		p.style.set_background("transparent");
            		p.set_scrollbars("none");

            	}
            );
            this.div_login.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "Screen0", 1260, 871, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("Login");
            		p.set_titletext("New Form");
            		p.style.set_background("transparent");
            		p.getSetter("layoutautofittype").set("width");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("login2.xfdl", "lib::comLib.xjs");
        this.registerScript("login2.xfdl", function() {
        /***********************************************************************************
        * SYSTEM      : nexacro Platform HTML5
        * BUSINESS    : Login
        * FILE NAME   : login.xfdl
        * PROGRAMMER  : 
        * DATE        : 
        * DESCRIPTION : Login
        *------------------------------------------------------------------
        * MODIFY DATE   PROGRAMMER			DESCRIPTION
        * 2017-01-17	wjim				업무용앱 런칭 공지팝업 ON
        * 2017-05-22	wjim				[20170522_02] 업무용앱 런칭 공지팝업 OFF
        * 2025.07.21 	길형철				2Fact인증 추가
        *------------------------------------------------------------------

        *------------------------------------------------------------------
        ***********************************************************************************/

         
        /***********************************************************************************
        * Common Library
        ********************************************************* **************************/
        //include "lib::comLib.xjs";
        /***********************************************************************************
        * Global/Local Variable
        ***********************************************************************************/
        var nFormHorizental = 0;
        var nFormVertical = 0;
        var nFormWidth = 0
        var nFormHeight = 0;

        /***********************************************************************************
        * Form Event
        ***********************************************************************************/
        this.form_onload = function (obj,e)
        {
        	Ex.core.onload(obj);
        	this.form_onsize(e.cx, e.cy);
        	this.getCookie("userid");
        	
        	if( this.getCookieHttps() ){
        		this.httpsFormFN();
        	}
        	
        	// 업무용앱 런칭 공지팝업 게시 (2017-01-17 ~ 2017-05-22)
        	//this.set_alert("알림","대리점용 어플리케이션 변경 예정!!\n자세한 사항은 공지사항을 참조하세요.");	
        }

         
        /***********************************************************************************
        * User Function
        ***********************************************************************************/
         /**
         * 로그인 onkey down 화면 공통 event
         * @example	
         * @memberOf this
         */
        this.fn_loginOnkeyUp = function(obj,e)
        {
        	
        	if(e.keycode == 13)
        	{   
        	    this.fn_isUserExistsTr();
        	}
        }

         /**
         * 로그인 transaction
         * @example	
         * @memberOf this
         */
        this.fn_loginTr = function()
        {
            var objLoginId = this.div_login.txt_userId;
            var objLoginPw = this.div_login.txt_userPwd;
            if(Eco.isEmpty(objLoginId.value))    
            {
               
                this.set_alert("login_id","Please enter Login ID");
                return; 
            }
            if(Eco.isEmpty(objLoginPw.value))    
            {
                 this.set_alert("login_pw","Please enter Login Password");
                return; 
            }
        	
            if(application.gv_prjType == "false")
        	{
            

              this.fn_menuOpen();	
        	}
        	else
        	{
        		//로그인전 입력받은 아이디를 쿠키에 저장처리한다.
        		this.setCookie(objLoginId.value);
        		Ex.core.trLogin(this,"login", objLoginId.value, objLoginPw.value);
        	}

        }

         /**
         * 사용자인증 transaction
         * @example	
         * @memberOf this
         */
        this.fn_isUserExistsTr = function()
        {
            var objLoginId = this.div_login.txt_userId;
            var objLoginPw = this.div_login.txt_userPwd;
            if(Eco.isEmpty(objLoginId.value))    
            {
               
                this.set_alert("login_id","Please enter Login ID");
                return; 
            }
            if(Eco.isEmpty(objLoginPw.value))    
            {
                 this.set_alert("login_pw","Please enter Login Password");
                return; 
            }
        	
            if(application.gv_prjType == "false")
        	{
            

              this.fn_menuOpen();	
        	}
        	else
        	{
        		//로그인전 입력받은 아이디를 쿠키에 저장처리한다.
        		this.setCookie(objLoginId.value);
        		Ex.core.trIsUserExists(this,"isUserExists", objLoginId.value, objLoginPw.value);
        	}

        }

        /**
        * 메인프레임 open
        * @return 
        * @example
        * @memberOf public
        */ 

        this.fn_menuOpen = function()
        {
            this.parent.setIndexUrl("frame::main.xfdl");
            
        }

         /**
         * 사용자 인증팝업
         * @example	
         * @memberOf this
         */
        this.fnOpenSmsPopup = function() {

        	var userId = this.div_login.txt_userId.value;
        	var args ={p_userId:userId};
        	Ex.core.popup(this, "RTCMAuthSmsPopup", "cm::RTCMAuthSmsPopup.xfdl", args, "modaless=false, titletext=사용자인증팝업", "fn_popup_callBack");
        }

        
        /** 
        * 로그인 공통 메세지창 함수
        * @param {string} callbackId
        * @param {string} OK  OR CANCEL
        * @return 
        * @example
        * @memberOf public
        */ 
        this.set_alert = function(msgId,msgCode,msgArr,strMsgType ,sSizeType)
        {
           Ex.core.showMsg(this,"alert",msgId,msgCode, msgArr,strMsgType ,sSizeType);
        }

        //메세지 콜벡 메세지 처리 화면단에 필수로 있어야함
        /**
        * 공통 팝업 open 함수
        * @param {string} callbackId
        * @param {string} OK  OR CANCEL
        * @return 
        * @example
        * @memberOf public
        */ 
        this.fn_callBackMsg = function(strCallBackId,strResult)
        {
            var objLoginId = this.div_login.txt_userId;
            var objLoginPw = this.div_login.txt_userPwd;
             	if(strResult == "OK")
        		{
        		   switch(strCallBackId)
        		   {
        			case "login_id":
        			case "login_strErrorMsg":
        				objLoginId.setFocus();
        			 	 break;	
        			case "login_pw":
        			case "login_unknown":
        				objLoginPw.setFocus();
        				break;		
        		   }
        		}
        }

        /*---------------------------------
        * 팝업 콜백 함수
        * @param {var} sPopupId 팝업 ID
        * @param {var} sRtn 반환 값
        *----------------------------------*/
        this.fn_popup_callBack = function(sPopupId,sRtn){
        	if(!Eco.isNull(sRtn)){	
        		if(sPopupId == "RTCMAuthSmsPopup"){ //추가인증 팝업			
        			if(sRtn =='1'){
        				this.fn_loginTr();
        			}
        		}	
        	}
        }

        /**
        * form onsize
        * @return 
        * @example
        * @memberOf public
        */ 
        this.form_onsize = function(nWidth,nHeight)
        {

        
          	var nLeft = (application.mainframe.width / 2) - Math.round((this.div_login.getOffsetWidth()) / 2);

        	if(nLeft <= 0)
        	{
        		this.div_login.setOffsetLeft(0);
        	}
        	else
        	{
        		this.div_login.setOffsetLeft(nLeft);
        	}
        // 		nFormHorizental = Math.round((nWidth - nFormWidth)/2);
        //         nFormVertical = Math.round((nHeight - nFormHeight)/2);
        //         
        // 		this.div_login.move(nFormHorizental,nFormVertical);
        }

        this.fn_userAuth = function()
        {
        	var sSvcID        	= "user";                    
            var sController   	= "authController.do";
            
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_user=output1";
        	
        	var sArgs = "";		
        	sArgs += Ex.util.setParam("method","getList");
            sArgs += Ex.util.setParam("sqlId","selectGroupUser");// Map형태
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs); 
        	
        }

        /***********************************************************************************
        * Component Event
        ***********************************************************************************/
        this.btn_login_onclick = function(obj,e)
        {
        	this.fn_isUserExistsTr();
        }

        
        this.Login_onsize = function(obj,e)
        {
           //trace(" e.cx >>>>>>>>>>>>>>>> "  + e.cx);
           //trace(" e.cy >>>>>>>>>>>>>>>>>> " + e.cy);
           //this.form_onsize(e.cx, e.cy);
             this.form_onsize(e.cx, e.cy);
        }

        this.fn_close = function(obj,e)
        {
        	application.exit();
        }

        
        this.div_login_Button00_onclick = function(obj,e)
        {
        	//등록팝업생성
        	var userId = this.div_login.txt_userId.value;
        	var args ={p_arg:userId};
        	Ex.core.popup(this,"비밀번호변경", "comm::RTCOMMUserPwdChg_pop.xfdl", args, "modaless=false");
        }

        	//=========================================================
        	// 체크박스 클릭시 아이디저장여부
        	//=========================================================
        	this.confirmSave = function(obj,e) {
        		var str = "로그인정보를 저장하시겠습니까?\n\n공공장소에서는 개인정보가 유출될수 있으니 주의해 주십시오.";
        		if(!confirm(str)) {
        			this.div_login.idcheck.set_value(0);
        		} 
        	}

        	//=========================================================
        	// 체크박스 클릭시쿠키 생성
        	//=========================================================
            this.setCookie = function(cValue){
        		/*
        		var cName = "userid";
        		var cDay  = 7;
                var expire = new Date();
                expire.setDate(expire.getDate() + cDay);
                alert(expire);
                var cookies = cName + '=' + escape(cValue) + '; path=/ '; // 한글 깨짐을 막기위해 escape(cValue)를 합니다.
                cookies += ';expires=' + expire.toGMTString() + ';';
                alert(cookies);
                document.cookie = cookies;
                */
                
                var bSucc;
                var checkVal = nvl(this.div_login.idcheck.value);
                if(checkVal == 1) {
        			bSucc = application.setPrivateProfile("user_id", cValue);
        		} else {
        			bSucc = application.setPrivateProfile("user_id", "");
        		}
            }
         
        	//=========================================================
        	// 페이지로드시 쿠키가져오기
        	//=========================================================
            this.getCookie = function(cName) {
            /*
                cName = cName + '=';
                var cookieData = document.cookie;
                var start = cookieData.indexOf(cName);
                var cValue = '';
                if(start != -1){
                    start += cName.length;
                    var end = cookieData.indexOf(';', start);
                    if(end == -1)end = cookieData.length;
                    cValue = cookieData.substring(start, end);
                }
                alert(unescape(cValue));
                return unescape(cValue);
                */
                var strValue;
        		//strValue = getPrivateProfile("aa");
        		strValue = nvl(application.getPrivateProfile("user_id"));
        		if(strValue != "") {
        			this.div_login.txt_userId.set_value(strValue);
        			this.div_login.idcheck.set_value(1);
        		}
            }

        	this.getCookieHttps = function() {
        		var b = true;
                var strValue;
        		strValue = nvl(application.getPrivateProfile("httpsCh"));
        		if(strValue != "") {
        			if(FN_today() == strValue) {
        				b = false;
        			}
        		}
        		return b;
            }
            
        	this.httpsFormFN = function() {
        		var  args = "";
        		//Ex.core.popup(this, "안내", "comm::httpsForm.xfdl", args, "modaless=false");
        	}
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.addEventHandler("onsize", this.Login_onsize, this);
            this.div_login.txt_userId.addEventHandler("onkeyup", this.fn_loginOnkeyUp, this);
            this.div_login.txt_userPwd.addEventHandler("onkeyup", this.fn_loginOnkeyUp, this);
            this.div_login.btn_login.addEventHandler("onclick", this.btn_login_onclick, this);
            this.div_login.btn_login.addEventHandler("onkeyup", this.fn_loginOnkeyUp, this);
            this.div_login.Button00.addEventHandler("onclick", this.div_login_Button00_onclick, this);
            this.div_login.idcheck.addEventHandler("onclick", this.confirmSave, this);

        };

        this.loadIncludeScript("login2.xfdl");

       
    };
}
)();
