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
                this.set_name("MDI");
                this.set_classname("MDI");
                this.set_titletext("MDI");
                this._setFormPosition(0,0,1167,31);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize

            
            // UI Components Initialize
            obj = new Static("Static00", "absolute", "0", "0", null, "31", "16", null, this);
            obj.set_taborder("2");
            obj.set_cssclass("sta_MDI_bg");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", null, "4", "34", "22", "38", null, this);
            obj.set_taborder("6");
            obj.set_cssclass("sta_MDI_btnbg");
            this.addChild(obj.name, obj);

            obj = new Button("Button00", "absolute", "0", "0", "34", "31", null, null, this);
            obj.set_taborder("0");
            obj.set_cssclass("btn_MDI_home");
            this.addChild(obj.name, obj);

            obj = new Button("Button01", "absolute", null, "7", "16", "16", "55", null, this);
            obj.set_taborder("1");
            obj.set_cssclass("btn_MDI_pre");
            obj.set_enable("true");
            this.addChild(obj.name, obj);

            obj = new Tab("Tab00", "absolute", "34", "0", "969", "30", null, null, this);
            obj.set_taborder("3");
            obj.set_tabindex("0");
            obj.set_scrollbars("autoboth");
            obj.set_cssclass("tab_MDI");
            this.addChild(obj.name, obj);
            obj = new Tabpage("tabpage1", this.Tab00);
            obj.set_text("MDI menu01");
            this.Tab00.addChild(obj.name, obj);
            obj = new Tabpage("tabpage2", this.Tab00);
            obj.set_text("MDI menu02");
            this.Tab00.addChild(obj.name, obj);
            obj = new Tabpage("tabpage3", this.Tab00);
            obj.set_text("MDI menu03");
            this.Tab00.addChild(obj.name, obj);
            obj = new Tabpage("tabpage4", this.Tab00);
            obj.set_text("MDI menu04");
            this.Tab00.addChild(obj.name, obj);
            obj = new Tabpage("tabpage5", this.Tab00);
            obj.set_text("MDI menu05");
            this.Tab00.addChild(obj.name, obj);

            obj = new Button("Button02", "absolute", null, "7", "16", "16", "38", null, this);
            obj.set_taborder("4");
            obj.set_cssclass("btn_MDI_nxt");
            this.addChild(obj.name, obj);

            obj = new Static("Static31", "absolute", "1151", "0", "16", "31", null, null, this);
            obj.set_taborder("5");
            obj.set_text("FIX \r\nw16");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1167, 31, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("MDI");
            		p.set_titletext("MDI");

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

        this.loadIncludeScript("mdi.xfdl");

       
    };
}
)();
