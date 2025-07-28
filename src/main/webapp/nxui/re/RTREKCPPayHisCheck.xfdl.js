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
                this.set_name("RTREKCPPayHisCheck");
                this.set_classname("RTREKCPPayHisCheck");
                this.set_titletext("KCP결제내역체크");
                this._setFormPosition(0,0,1147,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_output", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"fileid\" type=\"STRING\" size=\"256\"/><Column id=\"filename\" type=\"STRING\" size=\"256\"/><Column id=\"filesize\" type=\"STRING\" size=\"256\"/><Column id=\"savepath\" type=\"STRING\" size=\"256\"/><Column id=\"ErrorMsg\" type=\"STRING\" size=\"256\"/><Column id=\"ErrorCode\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_File", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"FILE_PATH\" type=\"STRING\" size=\"256\"/><Column id=\"FILE_NAME\" type=\"STRING\" size=\"256\"/><Column id=\"FILE_SIZE\" type=\"STRING\" size=\"256\"/><Column id=\"FILE_SAVENM\" type=\"STRING\" size=\"256\"/><Column id=\"FILE_TYPE\" type=\"STRING\" size=\"256\"/><Column id=\"NUM\" type=\"STRING\" size=\"256\"/><Column id=\"CHK\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Tab("Tab00", "absolute", "0", "0", null, "496", "25", null, this);
            obj.set_taborder("0");
            obj.set_tabindex("0");
            obj.set_scrollbars("autoboth");
            this.addChild(obj.name, obj);
            obj = new Tabpage("tabpage1", this.Tab00);
            obj.set_text("[STEP 1] 엑셀업로드");
            obj.set_url("re::RTREKCPPayHisCheck_tab1.xfdl");
            this.Tab00.addChild(obj.name, obj);
            obj = new Tabpage("tabpage2", this.Tab00);
            obj.set_text("[STEP 2] 차이 내역 조회");
            obj.set_url("re::RTREKCPPayHisCheck_tab2.xfdl");
            this.Tab00.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "1122", "0", "25", "496", null, null, this);
            obj.set_taborder("1");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1147, 496, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTREKCPPayHisCheck");
            		p.set_titletext("KCP결제내역체크");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        
        this.loadPreloadList = function()
        {
            this._addPreloadList("fdl", "re::RTREKCPPayHisCheck_tab1.xfdl");
            this._addPreloadList("fdl", "re::RTREKCPPayHisCheck_tab2.xfdl");
        };
        
        // User Script
        this.addIncludeScript("RTREKCPPayHisCheck.xfdl", "lib::comLib.xjs");
        this.registerScript("RTREKCPPayHisCheck.xfdl", function() {
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //include "lib::comLib.xjs";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.p_arg = "RTREKCPPayHisCheck";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg){
        	
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.RTREKCPPayHisCheck_onload = function(obj,e){
        	Ex.core.init(obj);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.Tab00_onchanged = function(obj,e){
        	switch(obj.tabindex){
        		case 0	: this.Tab00.tabpage1.fn_init(); this.Tab00.tabpage2.ds_list.clearData(); break;
        		case 1	: this.Tab00.tabpage2.fn_init(); break;
        		default	: break;
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTREKCPPayHisCheck_onload, this);
            this.Tab00.addEventHandler("onchanged", this.Tab00_onchanged, this);

        };

        this.loadIncludeScript("RTREKCPPayHisCheck.xfdl");
        this.loadPreloadList();
       
    };
}
)();
