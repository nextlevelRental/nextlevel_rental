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
                this.set_name("RTCOMMUserPwdChg_pop");
                this.set_classname("RTCMPostCode_pop");
                this.set_titletext("사용자 비밀번호변경");
                this._setFormPosition(0,0,415,225);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("dsPwd", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"userId\" type=\"STRING\" size=\"256\"/><Column id=\"password\" type=\"STRING\" size=\"256\"/><Column id=\"oldPassword\" type=\"STRING\" size=\"256\"/><Column id=\"reason\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Div("div_search", "absolute", "10", "50", "393", "166", null, null, this);
            obj.set_taborder("0");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_searchModel", "absolute", "20", "11", "86", "20", null, null, this.div_search);
            obj.set_taborder("49");
            obj.set_text("아이디");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchAddr", "absolute", "20", "35", "110", "20", null, null, this.div_search);
            obj.set_taborder("52");
            obj.set_text("현재 비밀번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchMbNm", "absolute", "20", "87", "110", "20", null, null, this.div_search);
            obj.set_taborder("53");
            obj.set_text("비밀번호 확인");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchRdDngNm", "absolute", "20", "62", "110", "20", null, null, this.div_search);
            obj.set_taborder("54");
            obj.set_text("변경 비밀번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("chgPwd", "absolute", "136", "61", "228", "21", null, null, this.div_search);
            obj.set_taborder("2");
            obj.set_password("true");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("chgPwd2", "absolute", "136", "88", "228", "21", null, null, this.div_search);
            obj.set_taborder("3");
            obj.set_password("true");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("userId", "absolute", "136", "10", "228", "21", null, null, this.div_search);
            obj.set_taborder("0");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("currentPwd", "absolute", "136", "35", "228", "21", null, null, this.div_search);
            obj.set_taborder("1");
            obj.set_password("true");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_choice", "absolute", null, "125", "41", "21", "70", null, this.div_search);
            obj.set_taborder("4");
            obj.set_text("저장");
            obj.getSetter("domainId").set("nexa.add");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_close", "absolute", null, "125", "41", "21", "25", null, this.div_search);
            obj.set_taborder("5");
            obj.set_text("취소");
            obj.getSetter("domainId").set("nexa.add");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static20", "absolute", "9", "12", null, "30", "208", null, this);
            obj.set_taborder("1");
            obj.set_text("비밀번호 변경");
            obj.set_cssclass("sta_WF_title");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 393, 166, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("0");
            		p.set_scrollbars("none");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 415, 225, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCMPostCode_pop");
            		p.set_titletext("사용자 비밀번호변경");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCOMMUserPwdChg_pop.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCOMMUserPwdChg_pop.xfdl", function() {
        	//include "lib::comLib.xjs";
        	this.p_arg 	= "";

            this.RTCMPostCode_pop_onload = function(obj,e)
        	{
        		Ex.core.init(obj);
        		this.fn_init();
        	}
        	
        	this.fn_init = function(){
        		if(this.parent.p_arg != "") {
        			this.div_search.userId.set_value(this.parent.p_arg);
        			this.div_search.currentPwd.setFocus();
        		} else {
        			this.div_search.userId.setFocus();
        		}
        	}

        	/***********************************************************************************
        	* CallBack Event (strSvcId - Sevice ID, nErrorCode - ErrorCode, strErrorMsg - Error Message)
        	***********************************************************************************/
            this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg,resultCnt)
        	{
        		if(nErrorCode < 0) {
        			alert(strErrorMsg);
        		} else {
        			if(strSvcId == "chgUserPwd") {
        				alert(strErrorMsg);
        				this.close();
        			}
        		}
        	}
        	
        	this.btn_close_onclick = function(obj,e) {
        		this.close();
        	}
        	
        	this.check = function() {
        		if(nvl(this.div_search.userId.value) == '') {
        			alert('아이디를 입력해주십시오');
        			return false;
        		}

        		if(nvl(this.div_search.currentPwd.value) == '') {
        			alert('현재 비밀번호를 입력해주십시오');
        			return false;
        		}
        		
        		if(nvl(this.div_search.chgPwd.value) == '') {
        			alert('변경 비밀번호를 입력해주십시오');
        			return false;
        		}
        		
        		if(nvl(this.div_search.chgPwd2.value) == '') {
        			alert('변경 비밀번호를 입력해주십시오');
        			return false;
        		}
        		
        		if(nvl(this.div_search.chgPwd.value) != nvl(this.div_search.chgPwd2.value)) {
        			alert('입력하신 변경 비밀번호가 일치하지 않습니다.');
        			return false;
        		}
        		return true;
        	}
        	
        	this.btn_chg_pwd = function(obj,e) {
        		if(!this.check()) return;
        		
        		this.dsPwd.clearData();
        		var row = this.dsPwd.addRow();
        		this.dsPwd.setColumn(row, "userId", 		this.div_search.userId.value);
        		this.dsPwd.setColumn(row, "oldPassword", 		this.div_search.currentPwd.value);
        		this.dsPwd.setColumn(row, "password", 	this.div_search.chgPwd.value);
        		this.dsPwd.setColumn(row, "regId", 			this.div_search.userId.value);
        		
        		var sSvcID      	= "chgUserPwd";  
        		var sController   	= "rtms/comm/chgUserPwd.do";
        		var sInDatasets   	= "chg_pwd=dsPwd";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs); 
        	}

        this.RTCOMMUserPwdChg_pop_onkeyup = function(obj,e)
        {
        	if(e.keycode == 27){
        		this.close();
        	}
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTCMPostCode_pop_onload, this);
            this.addEventHandler("onkeyup", this.RTCOMMUserPwdChg_pop_onkeyup, this);
            this.div_search.chgPwd.addEventHandler("onkeyup", this.div_search_ed_searchRdDngNm_onkeyup, this);
            this.div_search.chgPwd2.addEventHandler("onkeyup", this.div_search_ed_searchMbNm_onkeyup, this);
            this.div_search.userId.addEventHandler("onkeyup", this.div_search_ed_searchRdDngNm_onkeyup, this);
            this.div_search.currentPwd.addEventHandler("onkeyup", this.div_search_ed_searchRdDngNm_onkeyup, this);
            this.div_search.btn_choice.addEventHandler("onclick", this.btn_chg_pwd, this);
            this.div_search.btn_close.addEventHandler("onclick", this.btn_close_onclick, this);

        };

        this.loadIncludeScript("RTCOMMUserPwdChg_pop.xfdl");

       
    };
}
)();
