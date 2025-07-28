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
                this.set_name("RTREAccResult");
                this.set_classname("re00050_cms");
                this.set_titletext("계좌신청결과처리");
                this._setFormPosition(0,0,1147,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize

            
            // UI Components Initialize
            obj = new Tab("Tab02", "absolute", "0", "0", "1122", "496", null, null, this);
            obj.set_taborder("0");
            obj.set_tabindex("0");
            obj.set_scrollbars("autoboth");
            obj.style.set_showextrabutton("false");
            this.addChild(obj.name, obj);
            obj = new Tabpage("tabpage1", this.Tab02);
            obj.set_text("[STEP 1] 결과파일반영");
            obj.set_url("re::RTREAccResult_tab1.xfdl");
            this.Tab02.addChild(obj.name, obj);
            obj = new Tabpage("tabpage2", this.Tab02);
            obj.set_text("[STEP 2] 결과파일 반영조회");
            obj.set_url("re::RTREAccResult_tab2.xfdl");
            this.Tab02.addChild(obj.name, obj);
            obj = new Tabpage("tabpage3", this.Tab02);
            obj.set_text("[STEP 3] 계좌신청 결과반영");
            obj.set_url("re::RTREAccResult_tab3.xfdl");
            this.Tab02.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1122", "0", "25", "496", null, null, this);
            obj.set_taborder("1");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1147, 496, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("re00050_cms");
            		p.set_titletext("계좌신청결과처리");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        
        this.loadPreloadList = function()
        {
            this._addPreloadList("fdl", "re::RTREAccResult_tab1.xfdl");
            this._addPreloadList("fdl", "re::RTREAccResult_tab2.xfdl");
            this._addPreloadList("fdl", "re::RTREAccResult_tab3.xfdl");
        };
        
        // User Script
        this.addIncludeScript("RTREAccResult.xfdl", "lib::comLib.xjs");
        this.registerScript("RTREAccResult.xfdl", function() {
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //include "lib::comLib.xjs";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.form_onload = function(obj,e){ 
        	Ex.core.init(obj); 	
        } 
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg){ 
        	if(nErrorCode < 0){
        		return Ex.core.comMsg("alert",strErrorMsg);		
        	}
        	switch (strSvcId){
        		case "": break;			
        		default: break;
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.Tab02_onchanged = function(obj,e){
        	this.fn_getButton(obj.tabindex);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_getButton = function(idx) {
        	switch (idx){
        		case 0: this.Tab02.tabpage1.fn_init(); break;		
        		case 1: this.Tab02.tabpage2.fn_init(); break;		
        		case 2: this.Tab02.tabpage3.fn_init(); break;									
        		default: break;
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.Tab02.addEventHandler("onchanged", this.Tab02_onchanged, this);

        };

        this.loadIncludeScript("RTREAccResult.xfdl");
        this.loadPreloadList();
       
    };
}
)();
