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
                this.set_name("configCrosshair");
                this.set_classname("config_xaxis");
                this.set_titletext("차트 crosshair 설정");
                this._setFormPosition(0,0,320,320);
            }
            this.style.set_background("#d4d9dfff");

            
            // Object(Dataset, ExcelExportObject) Initialize

            
            // UI Components Initialize
            obj = new Static("Static01", "absolute", "20", "11", "268", "25", null, null, this);
            obj.set_taborder("22");
            obj.set_text("Crosshair");
            obj.style.set_font("antialias 15 Verdana, malgun gothic");
            this.addChild(obj.name, obj);

            obj = new Static("Static26", "absolute", "20", "40", null, "13", "20", null, this);
            obj.set_taborder("23");
            obj.style.set_border("2 solid #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static09", "absolute", "6.56%", "232", null, "20", "46.56%", null, this);
            obj.set_taborder("36");
            obj.set_text("lineColor");
            this.addChild(obj.name, obj);

            obj = new Static("Static08", "absolute", "6.56%", "195", null, "20", "46.56%", null, this);
            obj.set_taborder("37");
            obj.set_text("lineStyle");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "6.56%", "93", null, "20", "46.56%", null, this);
            obj.set_taborder("47");
            obj.set_text("mode");
            this.addChild(obj.name, obj);

            obj = new Static("Static17", "absolute", "6.56%", "56", null, "20", "46.56%", null, this);
            obj.set_taborder("77");
            obj.set_text("id");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_id", "absolute", "52.81%", "54", null, "24", "6.25%", null, this);
            obj.set_taborder("78");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("Static25", "absolute", "6.25%", "135", null, "13", "6.25%", null, this);
            obj.set_taborder("97");
            obj.style.set_border("2 solid #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff");
            this.addChild(obj.name, obj);

            obj = new Combo("cmb_lineStyle", "absolute", "52.81%", "193", null, "24", "5.94%", null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("156");
            obj.set_innerdataset("@ds_style");
            obj.set_codecolumn("code");
            obj.set_datacolumn("data");

            obj = new Static("Static07", "absolute", "6.56%", "158", null, "20", "46.56%", null, this);
            obj.set_taborder("157");
            obj.set_text("lineWidth");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_lineColor", "absolute", "52.81%", "230", null, "24", "6.25%", null, this);
            obj.set_taborder("159");
            this.addChild(obj.name, obj);

            obj = new Static("Static16", "absolute", "6.56%", "270", null, "20", "46.56%", null, this);
            obj.set_taborder("163");
            obj.set_text("lineOpacity");
            this.addChild(obj.name, obj);

            obj = new Combo("cmb_mode", "absolute", "52.81%", "91", null, "24", "5.94%", null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("177");
            obj.set_innerdataset("ds_smode");
            obj.set_codecolumn("code");
            obj.set_datacolumn("data");

            obj = new MaskEdit("mae_lineWidth", "absolute", "52.81%", "156", null, "24", "6.25%", null, this);
            obj.set_taborder("178");
            obj.set_mask("0.0");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_lineOpacity", "absolute", "52.81%", "268", null, "24", "6.88%", null, this);
            obj.set_taborder("179");
            obj.set_mask("0.0");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 320, 320, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("config_xaxis");
            		p.set_titletext("차트 crosshair 설정");
            		p.style.set_background("#d4d9dfff");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item24","cmb_lineStyle","value","ds_crosshair","lineStyle");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item0","edt_id","value","ds_crosshair","id");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item5","edt_lineColor","value","ds_crosshair","lineColor");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item1","cmb_mode","value","ds_crosshair","mode");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item2","mae_lineWidth","value","ds_crosshair","lineWidth");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item8","mae_lineOpacity","value","ds_crosshair","lineOpacity");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.registerScript("ConfigCrosshair.xfdl", function() {

        var	parent = this.parent;

        this.common_onsetfocus = function(obj,e)
        {
        	parent.setPropertyDesc(obj,e);
        }

        this.common_canchage_decimal = function(obj,e)
        {
        	var input = nexacro.toNumber(obj.value);	
        	var re = parent.validateInputData1(input);
        			
        	if (!re)
        	{
        		return false;		
        	}
        	else
        	{
        		return true;
        	}
        }

        this.common_canchange_integer = function(obj,e)
        {
        	var input = nexacro.toNumber(obj.value);	
        	var re = parent.validateInputData2(input);
        			
        	if (!re)
        	{
        		return false;		
        	}
        	else
        	{
        		return true;
        	}
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.edt_id.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.edt_id.addEventHandler("onkillfocus", this.common_onkillfocus, this);
            this.cmb_lineStyle.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.cmb_lineStyle.addEventHandler("onkillfocus", this.common_onkillfocus, this);
            this.edt_lineColor.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.edt_lineColor.addEventHandler("onkillfocus", this.common_onkillfocus, this);
            this.cmb_mode.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.cmb_mode.addEventHandler("onkillfocus", this.common_onkillfocus, this);
            this.mae_lineWidth.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_lineWidth.addEventHandler("canchange", this.common_canchange_integer, this);
            this.mae_lineOpacity.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_lineOpacity.addEventHandler("canchange", this.common_canchage_decimal, this);

        };

        this.loadIncludeScript("ConfigCrosshair.xfdl");

       
    };
}
)();
