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
                this.set_name("sample017");
                this.set_classname("hrSample19_goPage");
                this.set_titletext("페이지이동샘플");
                this._setFormPosition(0,0,1024,768);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize

            
            // UI Components Initialize
            obj = new Button("btn_goPage", "absolute", "72", "92", "194", "40", null, null, this);
            obj.set_taborder("0");
            obj.set_text("페이지이동실행");
            obj.getSetter("titletext").set("페이지이동(메인)");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1024, 768, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("hrSample19_goPage");
            		p.set_titletext("페이지이동샘플");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("sample017.xfdl", "lib::comLib.xjs");
        this.registerScript("sample017.xfdl", function() {
        /***********************************************************************************
        * SYSTEM      : HGR Industrial Surplus
        * BUSINESS    : gopage main
        * FILE NAME   : hrSample19_goPage.xfdl
        * PROGRAMMER  : 
        * DATE        : 
        * DESCRIPTION : 2014.09.19
        *------------------------------------------------------------------
        * MODIFY DATE   PROGRAMMER			DESCRIPTION
        *------------------------------------------------------------------
        * 
        *------------------------------------------------------------------
        ***********************************************************************************/

        
        /***********************************************************************************
        * Common Library
        ***********************************************************************************/
        //include "lib::comLib.xjs";

        this.form_onload = function(obj,e)
        {
        	  //폼로드시 공통함수 
        	Ex.core.init(obj);
        	
        	
        }

        this.btn_goPage_onclick = function(obj,e)
        {    
           var oArg = {
                 arg1 : "test1",
                 arg2 : "test2"
           };

             Ex.core.goPage("sample::sample017_sub.xfdl",oArg);
        }

        this.btn_getparam_onclick = function(obj,e)
        {
        	
        	//getParam
        	var sUrl = Ex.core.getParam["pageUrl"]
            var oAparamObject = Ex.core.getParam["paramObject"]
            
            
        }

        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.btn_goPage.addEventHandler("onclick", this.btn_goPage_onclick, this);

        };

        this.loadIncludeScript("sample017.xfdl");

       
    };
}
)();
