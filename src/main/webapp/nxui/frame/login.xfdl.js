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
                this._setFormPosition(0,0,1260,671);
            }
            this.style.set_background("transparent");

            
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
            obj = new Div("div_login", "absolute", "0", "0", "340", "352", null, null, this);
            obj.set_taborder("6");
            obj.style.set_background("transparent");
            obj.set_scrollbars("none");
            this.addChild(obj.name, obj);
            obj = new Static("stc_bg", "absolute", "0", "0", "340", "352", null, null, this.div_login);
            obj.set_taborder("5");
            obj.set_cssclass("sta_BG_login");
            obj.style.set_background("transparent URL('image::sta_BG_login.png')");
            this.div_login.addChild(obj.name, obj);
            obj = new Edit("txt_userId", "absolute", "19.12%", "156", "210", "29", null, null, this.div_login);
            obj.set_taborder("6");
            obj.set_value("ivanezz");
            this.div_login.addChild(obj.name, obj);
            obj = new Edit("txt_userPwd", "absolute", "19.12%", "190", null, "29", "19.12%", null, this.div_login);
            obj.set_taborder("7");
            obj.set_value("test123");
            obj.set_password("true");
            this.div_login.addChild(obj.name, obj);
            obj = new Button("btn_login", "absolute", "19.12%", "264", null, "33", "19.12%", null, this.div_login);
            obj.set_taborder("8");
            obj.set_text("로그인");
            obj.set_cssclass("btn_LG_login");
            this.div_login.addChild(obj.name, obj);
            obj = new CheckBox("CheckBox00", "absolute", "19.12%", "227", null, "20", "36.76%", null, this.div_login);
            obj.set_taborder("9");
            obj.set_text("아이디 저장");
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
            obj = new Layout("default", "", 1260, 671, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("Login");
            		p.set_titletext("New Form");
            		p.style.set_background("transparent");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("login.xfdl", "lib::comLib.xjs");
        this.registerScript("login.xfdl", function() {
        /***********************************************************************************
        * SYSTEM      : nexacro Platform HTML5
        * BUSINESS    : Login
        * FILE NAME   : login.xfdl
        * PROGRAMMER  : 
        * DATE        : 
        * DESCRIPTION : Login
        *------------------------------------------------------------------
        * MODIFY DATE   PROGRAMMER			DESCRIPTION
        *------------------------------------------------------------------

        *------------------------------------------------------------------
        ***********************************************************************************/

         
        /***********************************************************************************
        * Common Library
        ***********************************************************************************/
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
        	    this.fn_loginTr();
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
             
               Ex.core.trLogin(this,"login", objLoginId.value, objLoginPw.value);
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
        	this.fn_loginTr();
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

        };

        this.loadIncludeScript("login.xfdl");

       
    };
}
)();
