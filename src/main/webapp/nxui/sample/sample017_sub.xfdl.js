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
                this.set_name("hrSample19_goPage_sub");
                this.set_classname("hrSample19_goPage_sub");
                this.set_titletext("페이지이동대상");
                this._setFormPosition(0,0,1024,768);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize

            
            // UI Components Initialize
            obj = new Button("btn_getparam", "absolute", "52", "110", "185", "36", null, null, this);
            obj.set_taborder("0");
            obj.set_text("전달받은아규먼트값");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "58", "23", "77", "34", null, null, this);
            obj.set_taborder("1");
            obj.set_text("Example");
            obj.style.set_font("bold 9 Verdana");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "56", "58", "466", "38", null, null, this);
            obj.set_taborder("2");
            obj.set_text("\tvar sUrl = Ex.core.getParam(\"pageUrl\");\r\nvar oAparamObject = Ex.core.getParam(\"paramObject\");");
            obj.set_wordwrap("char");
            obj.style.set_align("left top");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "51", "165", "77", "34", null, null, this);
            obj.set_taborder("3");
            obj.set_text("Result");
            obj.style.set_font("bold 9 Verdana");
            this.addChild(obj.name, obj);

            obj = new Static("stReult", "absolute", "51", "201", "466", "38", null, null, this);
            obj.set_taborder("4");
            obj.set_wordwrap("char");
            obj.style.set_border("1 solid #808080ff");
            obj.style.set_align("left top");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1024, 768, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("hrSample19_goPage_sub");
            		p.set_titletext("페이지이동대상");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("sample017_sub.xfdl", "lib::comLib.xjs");
        this.registerScript("sample017_sub.xfdl", function() {
        /***********************************************************************************
        * SYSTEM      : HGR Industrial Surplus
        * BUSINESS    : gopage main
        * FILE NAME   : hrSample19_goPage)sub.xfdl
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
        	this.gfn_formOnLoad(obj); 	
        }

        this.btn_goPage_onclick = function(obj,e)
        {

        }

        this.btn_getparam_onclick = function(obj,e)
        {
        	var sUrl = Ex.core.getParam("pageUrl");
            var oAparamObject = Ex.core.getParam("paramObject");
            
            
        }

        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.btn_getparam.addEventHandler("onclick", this.btn_getparam_onclick, this);

        };

        this.loadIncludeScript("sample017_sub.xfdl");

       
    };
}
)();
