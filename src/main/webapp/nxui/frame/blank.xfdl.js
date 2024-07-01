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
                this.set_name("blank");
                this.set_classname("blank");
                this.set_titletext("New Form");
                this._setFormPosition(0,0,1260,640);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize

            
            // UI Components Initialize

            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1260, 640, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("blank");
            		p.set_titletext("New Form");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("blank.xfdl", "lib::comLib.xjs");
        this.registerScript("blank.xfdl", function() {
        /***********************************************************************************
        * Common Library
        ***********************************************************************************/
        //include "lib::comLib.xjs";
        this.form_onload = function(obj,e)
        {
        		    ExtNx.core.onload(obj);
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);

        };

        this.loadIncludeScript("blank.xfdl");

       
    };
}
)();
