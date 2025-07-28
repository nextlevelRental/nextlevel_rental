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
                this.set_name("sample014");
                this.set_classname("testWebBrowser");
                this.set_titletext("웹브라우저태그생성샘플");
                this._setFormPosition(0,0,1024,768);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize

            
            // UI Components Initialize
            obj = new WebBrowser("WebBrowser00", "absolute", "46", "323", "538", "245", null, null, this);
            obj.set_taborder("0");
            this.addChild(obj.name, obj);

            obj = new Button("Button00", "absolute", "46", "272", "112", "41", null, null, this);
            obj.set_taborder("1");
            obj.set_text("html태그삽입샘플");
            this.addChild(obj.name, obj);

            obj = new GroupBox("GroupBox00", "absolute", "44", "50", null, "218", "0", null, this);
            obj.set_text("Example");
            obj.set_taborder("2");
            obj.style.set_font("bold 9 Verdana");
            this.addChild(obj.name, obj);

            obj = new Static("Static15", "absolute", "56", "69", null, "192", "1", null, this);
            obj.set_taborder("3");
            obj.set_text("\tvar str_html = \"\";\r\n\t\tstr_html += \"<html>\\n\";\r\n\t\tstr_html += \"<head>\\n\";\r\n\t\tstr_html += \"<title>타이틀</title>\\n\";\r\n\t\tstr_html += \"<meta content='text/html; charset=euc-kr' http-equiv=Content-Type>\\n\";\r\n\t\tstr_html += \"<style type='text/css'> p, td, li {font-family:굴림체, arial; font-size:10pt; margin-top:5px;margin-bottom:5px;} body{margin:10px 10px 10px 10px; line-height:1.2; font-family:굴림체, arial; font-size:10pt;}</style>\\n\";\r\n\t\tstr_html += \"<meta name=GENERATOR content=ActiveSquare>\\n\";\r\n\t\tstr_html += \"</head>\\n\";\r\n\t\tstr_html += \"<body>\\n\";\r\n\t\tstr_html += \"<p>P TAG TEST</p>\\n\";\r\n\t\tstr_html += \"<p>P TAG TEST</p>\\n\";\r\n\t\tstr_html += \"<p>P TAG TEST</p>\\n\";\r\n\t\tstr_html += \"</body>\\n\";\r\n\t\tstr_html += \"</html>\\n\"; \r\nthis.WebBrowser00.document.body.innerHTML = str_html\r\n}");
            obj.set_cssclass("sample_example");
            obj.style.set_background("#ffd70055");
            obj.style.set_padding("5 5 5 5");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "41", "8", "332", "36", null, null, this);
            obj.set_taborder("4");
            obj.set_text("1.웹브라우저태그생성샘플");
            obj.set_cssclass("sample_Title");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1024, 768, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("testWebBrowser");
            		p.set_titletext("웹브라우저태그생성샘플");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("sample014.xfdl", "lib::comLib.xjs");
        this.registerScript("sample014.xfdl", function() {
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
             Ex.core.init(obj);
        }

        this.testWebBrowser_onload = function(obj,e)
        {
        	this.WebBrowser00.set_url("about:blank");
        }

        this.Button00_onclick = function(obj,e)
        {
        	
        	var str_html = "";
        		str_html += "<html>\n";
        		str_html += "<head>\n";
        		str_html += "<title>타이틀</title>\n";
        		str_html += "<meta content='text/html; charset=euc-kr' http-equiv=Content-Type>\n";
        		str_html += "<style type='text/css'> p, td, li {font-family:굴림체, arial; font-size:10pt; margin-top:5px;margin-bottom:5px;} body{margin:10px 10px 10px 10px; line-height:1.2; font-family:굴림체, arial; font-size:10pt;}</style>\n";
        		str_html += "<meta name=GENERATOR content=ActiveSquare>\n";
        		str_html += "</head>\n";
        		str_html += "<body>\n";
        		str_html += "<p>P TAG TEST</p>\n";
        		str_html += "<p>P TAG TEST</p>\n";
        		str_html += "<p>P TAG TEST</p>\n";
        		str_html += "</body>\n";
        		str_html += "</html>\n"; 

        		this.WebBrowser00.document.body.innerHTML = str_html
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.Button00.addEventHandler("onclick", this.Button00_onclick, this);

        };

        this.loadIncludeScript("sample014.xfdl");

       
    };
}
)();
