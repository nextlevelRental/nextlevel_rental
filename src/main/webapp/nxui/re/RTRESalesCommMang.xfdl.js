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
                this.set_name("RTRESalesCommMang");
                this.set_classname("salesCommMang");
                this.set_titletext("판매수수료 관리");
                this._setFormPosition(0,0,1147,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize

            
            // UI Components Initialize
            obj = new Tab("RTRESalesCommMangTab", "absolute", "0", "0", null, "496", "25", null, this);
            obj.set_taborder("0");
            obj.set_tabindex("0");
            obj.set_scrollbars("autoboth");
            obj.style.set_showextrabutton("false");
            this.addChild(obj.name, obj);
            obj = new Tabpage("RTRESalesCommMang_tab1", this.RTRESalesCommMangTab);
            obj.set_text("판매수수료 등록");
            obj.set_url("re::RTRESalesCommMang_tab1.xfdl");
            this.RTRESalesCommMangTab.addChild(obj.name, obj);
            obj = new Tabpage("RTRESalesCommMang_tab2", this.RTRESalesCommMangTab);
            obj.set_text("엑셀 업로드");
            obj.set_url("re::RTRESalesCommMang_tab2.xfdl");
            this.RTRESalesCommMangTab.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1122", "0", "25", "496", null, null, this);
            obj.set_taborder("1");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1147, 496, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("salesCommMang");
            		p.set_titletext("판매수수료 관리");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        
        this.loadPreloadList = function()
        {
            this._addPreloadList("fdl", "re::RTRESalesCommMang_tab1.xfdl");
            this._addPreloadList("fdl", "re::RTRESalesCommMang_tab2.xfdl");
        };
        
        // User Script
        this.addIncludeScript("RTRESalesCommMang.xfdl", "lib::comLib.xjs");
        this.registerScript("RTRESalesCommMang.xfdl", function() {
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //include "lib::comLib.xjs";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.p_arg = "RTRESalesCommMang";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg){
        	
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.RTRESalesCommMang_onload = function(obj,e){

        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.RTRESalesCommMangTab_onchanged = function(obj,e){
        	switch(obj.tabindex){
        		case 0	: this.RTRESalesCommMangTab.RTRESalesCommMang_tab1.fn_setButton(); this.RTRESalesCommMangTab.RTRESalesCommMang_tab2.Dataset00.clearData(); break;
        		case 1	: this.RTRESalesCommMangTab.RTRESalesCommMang_tab2.fn_setButton(); this.RTRESalesCommMangTab.RTRESalesCommMang_tab1.ds_list.clearData(); break;	
        		default	: break;
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTRESalesCommMang_onload, this);
            this.RTRESalesCommMangTab.addEventHandler("onchanged", this.RTRESalesCommMangTab_onchanged, this);

        };

        this.loadIncludeScript("RTRESalesCommMang.xfdl");
        this.loadPreloadList();
       
    };
}
)();
