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
                this.set_name("RTSDArrivalAlarmList");
                this.set_classname("RTSDProvisionalContractRegister");
                this.set_titletext("도착 알림 문자 발송 관리");
                this._setFormPosition(0,0,1159,534);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_list", this);
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"rdcNm\" type=\"STRING\" size=\"256\"/><Column id=\"invoiceNo\" type=\"STRING\" size=\"256\"/><Column id=\"giDay\" type=\"STRING\" size=\"256\"/><Column id=\"giYn\" type=\"STRING\" size=\"256\"/><Column id=\"sendCnt\" type=\"STRING\" size=\"256\"/><Column id=\"smsType\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_user", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"tmpPwYn\" type=\"string\" size=\"32\"/><Column id=\"lastPwDt\" type=\"datetime\" size=\"17\"/><Column id=\"agentNm\" type=\"string\" size=\"32\"/><Column id=\"failCnt\" type=\"bigdecimal\" size=\"16\"/><Column id=\"userGrpNm\" type=\"string\" size=\"32\"/><Column id=\"agentId\" type=\"string\" size=\"32\"/><Column id=\"oldPassword\" type=\"string\" size=\"32\"/><Column id=\"chgId\" type=\"string\" size=\"32\"/><Column id=\"password\" type=\"string\" size=\"32\"/><Column id=\"userGrp\" type=\"string\" size=\"32\"/><Column id=\"userNm\" type=\"string\" size=\"32\"/><Column id=\"vkgrpNm\" type=\"string\" size=\"32\"/><Column id=\"lastLogonDt\" type=\"datetime\" size=\"17\"/><Column id=\"userId\" type=\"string\" size=\"32\"/><Column id=\"chgDt\" type=\"datetime\" size=\"17\"/><Column id=\"vkbur\" type=\"string\" size=\"32\"/><Column id=\"regDt\" type=\"datetime\" size=\"17\"/><Column id=\"regId\" type=\"string\" size=\"32\"/><Column id=\"lockYn\" type=\"string\" size=\"32\"/><Column id=\"vkburNm\" type=\"string\" size=\"32\"/><Column id=\"vkgrp\" type=\"string\" size=\"32\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_excelUp", this);
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"statNm\" type=\"STRING\" size=\"256\"/><Column id=\"chanNm\" type=\"STRING\" size=\"256\"/><Column id=\"chanMclsNm\" type=\"STRING\" size=\"256\"/><Column id=\"ordAgentNm\" type=\"STRING\" size=\"256\"/><Column id=\"ordDay\" type=\"STRING\" size=\"256\"/><Column id=\"orderNo\" type=\"STRING\" size=\"256\"/><Column id=\"orderDate\" type=\"STRING\" size=\"256\"/><Column id=\"deliveryNo\" type=\"STRING\" size=\"256\"/><Column id=\"deliveryDate\" type=\"STRING\" size=\"256\"/><Column id=\"arrivalDate\" type=\"STRING\" size=\"256\"/><Column id=\"deliveryGbn\" type=\"STRING\" size=\"256\"/><Column id=\"rdcNm\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"o2oYn\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"agencyCd\" type=\"STRING\" size=\"256\"/><Column id=\"agencyNm\" type=\"STRING\" size=\"256\"/><Column id=\"vkburNm\" type=\"STRING\" size=\"256\"/><Column id=\"vkgrpNm\" type=\"STRING\" size=\"256\"/><Column id=\"carNm\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static00", "absolute", "0", "10", "7", "500", null, null, this);
            obj.set_taborder("19");
            obj.set_text("FIX \r\nh10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "0", "0", "1122", "10", null, null, this);
            obj.set_taborder("46");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Tab("Tab00", "absolute", "0.69%", "8", null, "481", "2.24%", null, this);
            obj.set_taborder("47");
            obj.set_tabindex("0");
            obj.set_scrollbars("autoboth");
            this.addChild(obj.name, obj);
            obj = new Tabpage("tabpage1", this.Tab00);
            obj.set_text("[STEP 1] 집계");
            obj.set_url("sd::RTSDArrivalAlarmList_tab1.xfdl");
            this.Tab00.addChild(obj.name, obj);
            obj = new Tabpage("tabpage2", this.Tab00);
            obj.set_text("[STEP 2] 발송");
            obj.set_url("sd::RTSDArrivalAlarmList_tab2.xfdl");
            this.Tab00.addChild(obj.name, obj);
            obj = new Tabpage("tabpage3", this.Tab00);
            obj.set_text("[STEP 3] 이력조회");
            obj.set_url("sd::RTSDArrivalAlarmList_tab3.xfdl");
            this.Tab00.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1159, 534, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTSDProvisionalContractRegister");
            		p.set_titletext("도착 알림 문자 발송 관리");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        
        this.loadPreloadList = function()
        {
            this._addPreloadList("fdl", "sd::RTSDArrivalAlarmList_tab1.xfdl");
            this._addPreloadList("fdl", "sd::RTSDArrivalAlarmList_tab2.xfdl");
            this._addPreloadList("fdl", "sd::RTSDArrivalAlarmList_tab3.xfdl");
        };
        
        // User Script
        this.addIncludeScript("RTSDArrivalAlarmList.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDArrivalAlarmList.xfdl", function() {
        //include "lib::comLib.xjs"; 

        this.RTSDArrivalAlarmList_onload = function(obj,e)
        {
        	Ex.core.init(obj);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.Tab00_onchanged = function(obj,e){
        	switch(obj.tabindex){
        		case 0	: this.Tab00.tabpage1.fn_init(); this.Tab00.tabpage2.ds_list.clearData(); break;
        		case 1	: this.Tab00.tabpage2.fn_init(); this.Tab00.tabpage3.ds_list.clearData(); break;
        		case 2	: this.Tab00.tabpage3.fn_init();
        		default	: break;
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.ds_user.addEventHandler("onrowposchanged", this.checkSaveMode, this);
            this.addEventHandler("onload", this.RTSDArrivalAlarmList_onload, this);
            this.Tab00.addEventHandler("onchanged", this.Tab00_onchanged, this);

        };

        this.loadIncludeScript("RTSDArrivalAlarmList.xfdl");
        this.loadPreloadList();
       
    };
}
)();
