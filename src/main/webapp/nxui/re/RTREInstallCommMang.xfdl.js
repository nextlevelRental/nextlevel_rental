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
                this.set_name("RTREInstallCommMang");
                this.set_classname("RTREInstallCommMang");
                this.set_titletext("장착수수료 관리");
                this._setFormPosition(0,0,1147,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize

            
            // UI Components Initialize
            obj = new Tab("RTREInstallCommMangTab", "absolute", "0", "0", null, "496", "25", null, this);
            obj.set_taborder("0");
            obj.set_tabindex("0");
            obj.set_scrollbars("autoboth");
            obj.style.set_showextrabutton("false");
            this.addChild(obj.name, obj);
            obj = new Tabpage("RTREInstallCommMang_tab1", this.RTREInstallCommMangTab);
            obj.set_text("장착수수료 등록");
            obj.set_url("re::RTREInstallCommMang_tab1.xfdl");
            this.RTREInstallCommMangTab.addChild(obj.name, obj);
            obj = new Tabpage("RTREInstallCommMang_tab2", this.RTREInstallCommMangTab);
            obj.set_text("엑셀 업로드");
            obj.set_url("re::RTREInstallCommMang_tab2.xfdl");
            this.RTREInstallCommMangTab.addChild(obj.name, obj);

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
            		p.set_classname("RTREInstallCommMang");
            		p.set_titletext("장착수수료 관리");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        
        this.loadPreloadList = function()
        {
            this._addPreloadList("fdl", "re::RTREInstallCommMang_tab1.xfdl");
            this._addPreloadList("fdl", "re::RTREInstallCommMang_tab2.xfdl");
        };
        
        // User Script
        this.addIncludeScript("RTREInstallCommMang.xfdl", "lib::comLib.xjs");
        this.registerScript("RTREInstallCommMang.xfdl", function() {
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //include "lib::comLib.xjs";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.p_arg = "RTRESalesCommMang";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg){
        	
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.RTREInstallCommMang_onload = function(obj,e){

        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.RTREInstallCommMangTab_onchanged = function(obj,e){
        	switch(obj.tabindex){
        		case 0	: this.RTREInstallCommMangTab.RTREInstallCommMang_tab1.fn_setButton(); this.RTREInstallCommMangTab.RTREInstallCommMang_tab2.Dataset00.clearData(); 	break;
        		case 1	: this.RTREInstallCommMangTab.RTREInstallCommMang_tab2.fn_setButton(); this.RTREInstallCommMangTab.RTREInstallCommMang_tab1.ds_list.clearData(); 	break;	
        		default	: break;
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTREInstallCommMang_onload, this);
            this.RTREInstallCommMangTab.addEventHandler("onchanged", this.RTREInstallCommMangTab_onchanged, this);

        };

        this.loadIncludeScript("RTREInstallCommMang.xfdl");
        this.loadPreloadList();
       
    };
}
)();
