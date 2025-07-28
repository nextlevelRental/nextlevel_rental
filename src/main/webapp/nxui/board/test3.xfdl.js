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
                this.set_name("test");
                this.set_classname("test");
                this.set_titletext("New Form");
                this._setFormPosition(0,0,1024,768);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize

            
            // UI Components Initialize
            obj = new Static("Static00", "absolute", "24.22%", "117", null, "150", "34.96%", null, this);
            obj.set_taborder("0");
            obj.set_text("dasdad");
            obj.style.set_font("bold 14 arial");
            this.addChild(obj.name, obj);

            obj = new Button("Button00", "absolute", "15.23%", "8", null, "72", "29.39%", null, this);
            obj.set_taborder("1");
            obj.set_text("Button00");
            this.addChild(obj.name, obj);

            obj = new ImageViewer("ImageViewer00", "absolute", "5.76%", "107", null, "132", "81.25%", null, this);
            obj.set_taborder("2");
            obj.set_text("ImageViewer00");
            obj.set_image("URL('../../../../../../Users/Public/Pictures/Sample Pictures/Koala.jpg')");
            this.addChild(obj.name, obj);

            obj = new Grid("Grid00", "absolute", "15.04%", "273", null, "113", "32.81%", null, this);
            obj.set_taborder("3");
            obj._setContents("<Formats></Formats>");
            this.addChild(obj.name, obj);

            obj = new Calendar("Calendar00", "absolute", "9.47%", "465", null, "186", "37.89%", null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("4");
            obj.set_type("monthonly");
            obj.set_value("null");
            obj.set_dateformat("yyyy-MM-dd ddd");

            obj = new Button("Button01", "absolute", "40.53%", "135", null, "78", "29.79%", null, this);
            obj.set_taborder("5");
            obj.set_text("Close");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1024, 768, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("test");
            		p.set_titletext("New Form");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("test3.xfdl", "lib::comLib.xjs");
        this.registerScript("test3.xfdl", function() {
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
        this.Button01_onclick = function(obj,e)
        {
        	this.close();
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.Button01.addEventHandler("onclick", this.Button01_onclick, this);

        };

        this.loadIncludeScript("test3.xfdl");

       
    };
}
)();
