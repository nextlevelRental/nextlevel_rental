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
                this.set_name("RTREServiceCommMang");
                this.set_classname("RTREServiceCommMang");
                this.set_titletext("서비스수수료 관리");
                this._setFormPosition(0,0,1147,459);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize

            
            // UI Components Initialize
            obj = new Tab("RTREServiceCommMangTab", "absolute", "0", "0", null, "456", "25", null, this);
            obj.set_taborder("0");
            obj.set_tabindex("0");
            obj.set_scrollbars("autoboth");
            obj.style.set_showextrabutton("false");
            this.addChild(obj.name, obj);
            obj = new Tabpage("RTREServiceCommMang_tab1", this.RTREServiceCommMangTab);
            obj.set_text("서비스수수료 등록");
            obj.set_url("RTREServiceCommMang_tab1.xfdl");
            this.RTREServiceCommMangTab.addChild(obj.name, obj);
            obj = new Tabpage("RTREServiceCommMang_tab2", this.RTREServiceCommMangTab);
            obj.set_text("엑셀 업로드");
            obj.set_url("RTREServiceCommMang_tab2.xfdl");
            this.RTREServiceCommMangTab.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1122", "0", "25", "496", null, null, this);
            obj.set_taborder("1");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1147, 459, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTREServiceCommMang");
            		p.set_titletext("서비스수수료 관리");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        
        this.loadPreloadList = function()
        {
            this._addPreloadList("fdl", "RTREServiceCommMang_tab1.xfdl");
            this._addPreloadList("fdl", "RTREServiceCommMang_tab2.xfdl");
        };
        
        // User Script
        this.addIncludeScript("RTREServiceCommMang.xfdl", "lib::comLib.xjs");
        this.registerScript("RTREServiceCommMang.xfdl", function() {
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //include "lib::comLib.xjs";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.p_arg = "RTREServiceCommMang";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg){
        	
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.RTREServiceCommMang_onload = function(obj,e){

        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.RTREServiceCommMangTab_onchanged = function(obj,e){
        	switch(obj.tabindex){
        		case 0	: this.RTREServiceCommMangTab.RTREServiceCommMang_tab1.fn_setButton(); this.RTREServiceCommMangTab.RTREServiceCommMang_tab2.Dataset00.clearData(); break;
        		case 1	: this.RTREServiceCommMangTab.RTREServiceCommMang_tab2.fn_setButton(); this.RTREServiceCommMangTab.RTREServiceCommMang_tab1.ds_list.clearData(); break;	
        		default	: break;
        	}
        }

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTREServiceCommMang_onload, this);
            this.RTREServiceCommMangTab.addEventHandler("onchanged", this.RTREServiceCommMangTab_onchanged, this);

        };

        this.loadIncludeScript("RTREServiceCommMang.xfdl");
        this.loadPreloadList();
       
    };
}
)();
