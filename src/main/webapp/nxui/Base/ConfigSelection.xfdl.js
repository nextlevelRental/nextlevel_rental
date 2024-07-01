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
                this.set_name("configSelection");
                this.set_classname("config_xaxis");
                this.set_titletext("차트 selection 설정");
                this._setFormPosition(0,0,320,382);
            }
            this.style.set_background("#d4d9dfff");

            
            // Object(Dataset, ExcelExportObject) Initialize

            
            // UI Components Initialize
            obj = new Static("Static01", "absolute", "20", "11", "268", "25", null, null, this);
            obj.set_taborder("22");
            obj.set_text("Selection");
            obj.style.set_font("antialias 15 Verdana, malgun gothic");
            this.addChild(obj.name, obj);

            obj = new Static("Static26", "absolute", "20", "40", null, "13", "20", null, this);
            obj.set_taborder("23");
            obj.style.set_border("2 solid #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static09", "absolute", "6.25%", "230", null, "20", "46.88%", null, this);
            obj.set_taborder("36");
            obj.set_text("borderColor");
            this.addChild(obj.name, obj);

            obj = new Static("Static08", "absolute", "6.25%", "156", null, "20", "46.88%", null, this);
            obj.set_taborder("37");
            obj.set_text("borderStyle");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "6.25%", "97", null, "20", "46.88%", null, this);
            obj.set_taborder("47");
            obj.set_text("mode");
            this.addChild(obj.name, obj);

            obj = new Static("Static17", "absolute", "6.25%", "56", null, "20", "46.88%", null, this);
            obj.set_taborder("77");
            obj.set_text("id");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_id", "absolute", "52.81%", "54", null, "24", "6.25%", null, this);
            obj.set_taborder("78");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("Static25", "absolute", "6.25%", "136", null, "13", "6.25%", null, this);
            obj.set_taborder("97");
            obj.style.set_border("2 solid #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff");
            this.addChild(obj.name, obj);

            obj = new Combo("cmb_borderStyle", "absolute", "52.81%", "154", null, "24", "5.94%", null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("156");
            obj.set_innerdataset("@ds_style");
            obj.set_codecolumn("code");
            obj.set_datacolumn("data");

            obj = new Static("Static07", "absolute", "6.25%", "193", null, "20", "46.88%", null, this);
            obj.set_taborder("157");
            obj.set_text("borderWidth");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_borderColor", "absolute", "52.81%", "228", null, "24", "6.56%", null, this);
            obj.set_taborder("159");
            this.addChild(obj.name, obj);

            obj = new Static("Static10", "absolute", "6.25%", "267", null, "20", "46.88%", null, this);
            obj.set_taborder("161");
            obj.set_text("backgroundColor");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_backgroundColor", "absolute", "52.81%", "265", null, "24", "6.25%", null, this);
            obj.set_taborder("162");
            this.addChild(obj.name, obj);

            obj = new Static("Static16", "absolute", "6.25%", "304", null, "20", "46.88%", null, this);
            obj.set_taborder("163");
            obj.set_text("backgroundOpacity");
            this.addChild(obj.name, obj);

            obj = new Combo("cmb_mode", "absolute", "52.81%", "91", null, "24", "5.94%", null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("177");
            obj.set_innerdataset("ds_smode");
            obj.set_codecolumn("code");
            obj.set_datacolumn("data");

            obj = new CheckBox("chk_zoom", "absolute", "52.81%", "340", null, "24", "6.25%", null, this);
            obj.set_taborder("178");
            obj.set_cssclass("WF_chk_Switch");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "6.25%", "342", null, "20", "46.88%", null, this);
            obj.set_taborder("179");
            obj.set_text("zoom");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_scrollOffset", "absolute", "52.81%", "191", null, "24", "6.56%", null, this);
            obj.set_taborder("180");
            obj.set_mask("0.0");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_backgroundOpacity", "absolute", "52.81%", "302", null, "24", "6.88%", null, this);
            obj.set_taborder("181");
            obj.set_mask("0.0");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 320, 382, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("config_xaxis");
            		p.set_titletext("차트 selection 설정");
            		p.style.set_background("#d4d9dfff");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item24","cmb_borderStyle","value","ds_selection","borderStyle");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item0","edt_id","value","ds_selection","id");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item5","edt_borderColor","value","ds_selection","borderColor");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item7","edt_backgroundColor","value","ds_selection","backgroundColor");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item1","cmb_mode","value","ds_selection","mode");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item2","chk_zoom","value","ds_selection","zoom");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item3","mae_scrollOffset","value","ds_selection","borderWidth");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item17","mae_backgroundOpacity","value","ds_selection","backgroundOpacity");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.registerScript("ConfigSelection.xfdl", function() {

        var	parent = this.parent;

        this.common_onsetfocus = function(obj,e)
        {
        	parent.setPropertyDesc(obj,e);
        }

        this.common_canchage_integer = function(obj,e)
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
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.configTooltip_onload, this);
            this.edt_id.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.edt_id.addEventHandler("onkillfocus", this.common_onkillfocus, this);
            this.cmb_borderStyle.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.cmb_borderStyle.addEventHandler("onkillfocus", this.common_onkillfocus, this);
            this.edt_borderColor.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.edt_borderColor.addEventHandler("onkillfocus", this.common_onkillfocus, this);
            this.edt_backgroundColor.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.edt_backgroundColor.addEventHandler("onkillfocus", this.common_onkillfocus, this);
            this.cmb_mode.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.cmb_mode.addEventHandler("onkillfocus", this.common_onkillfocus, this);
            this.chk_zoom.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.chk_zoom.addEventHandler("onkillfocus", this.common_onkillfocus, this);
            this.mae_scrollOffset.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_scrollOffset.addEventHandler("canchange", this.common_canchage_integer, this);
            this.mae_backgroundOpacity.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_backgroundOpacity.addEventHandler("canchange", this.common_canchage_decimal, this);

        };

        this.loadIncludeScript("ConfigSelection.xfdl");

       
    };
}
)();
