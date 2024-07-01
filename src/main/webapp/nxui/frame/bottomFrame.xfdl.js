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
                this.set_name("BottomFrame");
                this.set_classname("BottomFrame");
                this.set_titletext("Bottom Frame");
                this._setFormPosition(0,0,1362,34);
            }
            this.style.set_background("#ffffffff");

            
            // Object(Dataset, ExcelExportObject) Initialize

            
            // UI Components Initialize
            obj = new Static("Static00", "absolute", "322", "12", "694", "12", null, null, this);
            obj.set_taborder("0");
            obj.set_cssclass("sta_BF_logo");
            obj.set_text("경상남도 양산시 충렬로 355 넥센타이어주식회사     Copyright ⓒ 2015 NEXENTIRE. All Rights Reserved.");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1362, 34, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("BottomFrame");
            		p.set_titletext("Bottom Frame");
            		p.style.set_background("#ffffffff");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script

        
        // Regist UI Components Event
        this.on_initEvent = function()
        {

        };

        this.loadIncludeScript("bottomFrame.xfdl");

       
    };
}
)();
