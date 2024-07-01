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
                this.set_name("loding");
                this.set_classname("Login");
                this.set_titletext("loading");
                this.set_scrollbars("none");
                this._setFormPosition(0,0,1260,671);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_login", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"USER_NO\" type=\"STRING\" size=\"256\"/><Column id=\"PASSWORD\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"USER_NO\"/><Col id=\"PASSWORD\"/></Row></Rows>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Div("div_wrap", "absolute", "448", "46", "590", "471", null, null, this);
            obj.set_taborder("0");
            obj.set_scrollbars("none");
            this.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", null, "91", "125", "64", "293", null, this.div_wrap);
            obj.set_taborder("0");
            obj.set_cssclass("sta_LOGIN_Logo");
            this.div_wrap.addChild(obj.name, obj);
            obj = new Div("divMain", "absolute", "11", "160", "560", "311", null, null, this.div_wrap);
            obj.set_taborder("1");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            this.div_wrap.addChild(obj.name, obj);
            obj = new ProgressBar("pgBar", "absolute", "120", "89", null, "10", "120", null, this.div_wrap.divMain);
            obj.set_taborder("7");
            obj.set_max("100");
            obj.set_min("0");
            obj.set_blockgap("5");
            obj.set_cssclass("loading");
            obj.style.set_bartype("image");
            this.div_wrap.divMain.addChild(obj.name, obj);
            obj = new Static("Pleas", "absolute", "88", "107", null, "19", "88", null, this.div_wrap.divMain);
            obj.set_taborder("8");
            obj.set_text("Please wait...");
            obj.style.set_color("#666666ff");
            obj.style.set_align("center middle");
            obj.style.set_font("bold 9 Verdana");
            this.div_wrap.divMain.addChild(obj.name, obj);
            obj = new Static("Pleas00", "absolute", "94", null, null, "51", "59", "14", this.div_wrap.divMain);
            obj.set_taborder("9");
            obj.set_text("COPYRIGHT(C) BY 2015 TOBESOFT.CO.LTD. ALL RIGHTS RESERVED");
            obj.style.set_color("#888888ff");
            obj.style.set_align("center middle");
            obj.style.set_font("8 Verdana");
            this.div_wrap.divMain.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "0", "0", null, "2", "0", null, this.div_wrap.divMain);
            obj.set_taborder("10");
            obj.set_cssclass("sta_LOGIN_Bg1");
            obj.style.set_background("#232438ff");
            this.div_wrap.divMain.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "0", null, null, "1", "0", "64", this.div_wrap.divMain);
            obj.set_taborder("11");
            obj.set_cssclass("sta_LOGIN_Bg2");
            this.div_wrap.divMain.addChild(obj.name, obj);
            obj = new Static("Pleas01", "absolute", "48", "140", null, "80", "48", null, this.div_wrap.divMain);
            obj.set_taborder("12");
            obj.set_text("Enter your information to deliver");
            obj.set_visible("false");
            obj.style.set_align("center middle");
            obj.style.set_font("9 Verdana");
            this.div_wrap.divMain.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 560, 311, this.div_wrap.divMain,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("1");
            		p.set_text("Div00");
            		p.set_scrollbars("none");

            	}
            );
            this.div_wrap.divMain.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 590, 471, this.div_wrap,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("0");
            		p.set_scrollbars("none");

            	}
            );
            this.div_wrap.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1260, 671, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("Login");
            		p.set_titletext("loading");
            		p.set_scrollbars("none");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item0","Div00.edt_loginId","value","ds_login","USER_NO");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item1","Div00.edt_loginPw","value","ds_login","PASSWORD");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item2","Tab00.tabpage1","text","Notice","");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("loading.xfdl", "lib::comLib.xjs");
        this.registerScript("loading.xfdl", function() {
        /***********************************************************************************
        * SYSTEM      : HGR system
        * BUSINESS    : 로딩페이지
        * FILE NAME   : login.xfdl
        * PROGRAMMER  : 
        * DATE        : 
        * DESCRIPTION : loading
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
        this.nPos = 0;
        /***********************************************************************************
        * Form Event
        ***********************************************************************************/
        this.form_onload = function (obj,e)
        {

        	    Ex.core.onload(obj);
        		
        		this.form_onsize();
        		this.fn_loginTr();
        		this.setTimer(1001,50);
        }

        

        /**
         * 로그인 transaction
         * @example	
         * @memberOf this
         */
        this.fn_loginTr = function()
        {
            
            var objLoginId = sessionStorage.getItem("id");  //session에 저장된 id;
            var objLoginPw =  sessionStorage.getItem("pw"); //pw 저장;
            var sProgress = false;
           
        //     if(application.gv_prjType == "false")
        // 	{
        // 
        //       this.fn_menuOpen();	
        // 	}
        // 	else
        // 	{
                Ex.core.trLogin(this,"root",objLoginId,objLoginPw,sProgress);
        	//}
        	

        }

        /**
        * 메인프레임 open
        * @return 
        * @example
        * @memberOf public
        */ 

        this.fn_menuOpen = function()
        {
             this.killTimer(1001);
            // gv_topframe.fn_setTopMenu();

            //this.parent.setIndexUrl("frame::mainframe.xfdl");
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

        
        this.loding_ontimer = function(obj,e)
        {
        	if(e.timerid == 1001){
        	   	this.nPos +=1;
        		switch(this.nPos)
        		{
        			case 100 :  
        				
        				// this.div_wrap.divMain.pgBar.set_pos(this.nPos);
        				 this.killTimer(1001);
        			  
        			break;       
        			default : 
        			
        				 this.div_wrap.divMain.pgBar.set_pos(this.nPos); 
        				 
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
        this.form_onsize = function()
        {
        	
        	var nLeft = (application.mainframe.width / 2) - Math.round((this.div_wrap.getOffsetWidth()) / 2);

        	if(nLeft <= 0)
        	{
        		this.div_wrap.setOffsetLeft(0);
        	}
        	else
        	{
        		this.div_wrap.setOffsetLeft(nLeft);
        	}
        	
        }

        this.loding_onsize = function(obj,e)
        {

        	if(!Eco.isFunction(this.form_onsize)) return; 
        	this.form_onsize();
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.addEventHandler("ontimer", this.loding_ontimer, this);
            this.addEventHandler("onsize", this.loding_onsize, this);
            this.div_wrap.divMain.Static02.addEventHandler("onclick", this.Static01_onclick, this);

        };

        this.loadIncludeScript("loading.xfdl");

       
    };
}
)();
