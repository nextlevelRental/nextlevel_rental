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
                this.set_name("sample016");
                this.set_classname("testHtml");
                this.set_titletext("webbrowser아규먼트전달");
                this._setFormPosition(0,0,1260,641);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize

            
            // UI Components Initialize
            obj = new GroupBox("GroupBox00", "absolute", "44", "42", null, "224", "0", null, this);
            obj.set_text("Example");
            obj.set_taborder("5");
            obj.style.set_font("bold 9 Verdana");
            this.addChild(obj.name, obj);

            obj = new WebBrowser("web", "absolute", "40", "332", "398", "164", null, null, this);
            obj.set_taborder("0");
            this.addChild(obj.name, obj);

            obj = new Button("btn_run", "absolute", "145", "283", "115", "40", null, null, this);
            obj.set_taborder("1");
            obj.set_text("(실행)아규먼트전달");
            this.addChild(obj.name, obj);

            obj = new Edit("edit_input", "absolute", "43", "285", "92", "37", null, null, this);
            obj.set_taborder("2");
            obj.set_value("arg1234");
            obj.style.set_border("1 none #6b6b6bff");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "41", "8", "332", "36", null, null, this);
            obj.set_taborder("3");
            obj.set_text("1.webbrowser아규먼트전달");
            obj.set_cssclass("sample_Title");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "56", "60", null, "188", "10", null, this);
            obj.set_taborder("4");
            obj.set_text("webbrowser에 해당 uirl link sample::test.html 참조\r\n\r\n\tvar doc = this.web.document;\t\t\t\t\t\t        \r\n\tvar objTxt = doc.getElementById(\"resultText\");  \r\n\tvar objBtn = doc.getElementById(\"btnTest1\");    \r\n\t                                                \r\n\tif(objTxt){                                     \r\n\t                                                \r\n\t\tobjTxt.value = this.edit_input.value;         \r\n\t\t                                              \r\n\t//\tthis.sleep(100);                            \r\n\t\tobjBtn.click();                               ");
            obj.set_cssclass("sample_example");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1260, 641, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("testHtml");
            		p.set_titletext("webbrowser아규먼트전달");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("sample016.xfdl", "lib::comLib.xjs");
        this.registerScript("sample016.xfdl", function() {
        /***********************************************************************************
        * SYSTEM      : 
        * BUSINESS    : 
        * FILE NAME   : 
        * PROGRAMMER  : 
        * DATE        : 
        * DESCRIPTION : 
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

        
        /***********************************************************************************
        * Global/Local Variable
        ***********************************************************************************/

        /***********************************************************************************
        * Form Event
        ***********************************************************************************/
        this.form_onload = function (obj,e)
        {
           //폼로드시 공통함수 
           Ex.core.init(obj);
        }

        
        this.Button00_onclick = function(obj,e)
        {

        		var doc = this.web.document;						
        	var objTxt = doc.getElementById("resultText");  
        	var objBtn = doc.getElementById("btnTest1");
        	
        	if(objTxt){
        	
        		objTxt.value = this.edit_input.value;
        		objBtn.click();
        	}
        	//this.WebBrowser00.document.onload.fn_test('aaaaaaaaaaa');
        }

        this.WebBrowser00_onloadcompleted = function(obj,e)
        {

        }

        this.Button01_onclick = function(obj,e)
        {
        	//this.WebBrowser00.("fn_test()","aa");
        	//this.WebBrowser00.document.fn_test("aaaa");
        		
        }

        this.Button02_onclick = function(obj,e)
        {
        	//this.Plugin00.call
        }

        this.testHtml_onload = function(obj,e)
        {
        		//this.Plugin00.Navigate2("http://localhost/test.html");
        }

        
        this.fn_callBack = function(param)
        {
        	this.Edit00.set_value(param);
        }

        this.web_onusernotify = function(obj,e)
        {
        	alert("TOBE:" + e.userdata);
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.testHtml_onload, this);
            this.web.addEventHandler("onusernotify", this.web_onusernotify, this);
            this.btn_run.addEventHandler("onclick", this.Button00_onclick, this);

        };

        this.loadIncludeScript("sample016.xfdl");

       
    };
}
)();
