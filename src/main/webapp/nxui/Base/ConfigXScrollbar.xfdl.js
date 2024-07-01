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
                this.set_name("configXScrollbar");
                this.set_classname("config_xaxis");
                this.set_titletext("차트 X스크롤바 설정");
                this._setFormPosition(0,0,320,804);
            }
            this.style.set_background("#d4d9dfff");

            
            // Object(Dataset, ExcelExportObject) Initialize

            
            // UI Components Initialize
            obj = new Static("Static01", "absolute", "20", "11", "268", "25", null, null, this);
            obj.set_taborder("22");
            obj.set_text("XScrollbar");
            obj.style.set_font("antialias 15 Verdana, malgun gothic");
            this.addChild(obj.name, obj);

            obj = new Static("Static26", "absolute", "20", "40", null, "13", "20", null, this);
            obj.set_taborder("23");
            obj.style.set_border("2 solid #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static09", "absolute", "6.25%", "456", null, "20", "46.88%", null, this);
            obj.set_taborder("36");
            obj.set_text("borderColor");
            this.addChild(obj.name, obj);

            obj = new Static("Static08", "absolute", "6.25%", "419", null, "20", "46.88%", null, this);
            obj.set_taborder("37");
            obj.set_text("borderStyle");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "6.25%", "266", null, "20", "46.88%", null, this);
            obj.set_taborder("39");
            obj.set_text("scrollWidth");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "6.25%", "229", null, "20", "46.88%", null, this);
            obj.set_taborder("43");
            obj.set_text("scrollHeight");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "6.25%", "130", null, "20", "46.88%", null, this);
            obj.set_taborder("45");
            obj.set_text("rangeEnd");
            this.addChild(obj.name, obj);

            obj = new Static("Static17", "absolute", "6.25%", "56", null, "20", "46.88%", null, this);
            obj.set_taborder("77");
            obj.set_text("id");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_id", "absolute", "52.81%", "54", null, "24", "6.25%", null, this);
            obj.set_taborder("78");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("Static40", "absolute", "6.25%", "639", null, "20", "46.88%", null, this);
            obj.set_taborder("101");
            obj.set_text("rangeBorderStyle");
            this.addChild(obj.name, obj);

            obj = new Static("Static49", "absolute", "6.25%", "598", null, "20", "46.88%", null, this);
            obj.set_taborder("126");
            obj.set_text("rangeBorderColor");
            this.addChild(obj.name, obj);

            obj = new Combo("cmb_rangeBorderStyle", "absolute", "52.81%", "637", null, "24", "5.94%", null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("134");
            obj.set_innerdataset("ds_style");
            obj.set_codecolumn("code");
            obj.set_datacolumn("data");

            obj = new Combo("cmb_borderStyle", "absolute", "52.81%", "417", null, "24", "5.94%", null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("156");
            obj.set_innerdataset("@ds_style");
            obj.set_codecolumn("code");
            obj.set_datacolumn("data");

            obj = new Static("Static07", "absolute", "6.25%", "382", null, "20", "46.88%", null, this);
            obj.set_taborder("157");
            obj.set_text("borderWidth");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_borderColor", "absolute", "52.81%", "454", null, "24", "6.25%", null, this);
            obj.set_taborder("159");
            this.addChild(obj.name, obj);

            obj = new Static("Static15", "absolute", "6.56%", "498", null, "13", "5.94%", null, this);
            obj.set_taborder("160");
            obj.style.set_border("2 solid #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static10", "absolute", "6.25%", "517", null, "20", "46.88%", null, this);
            obj.set_taborder("161");
            obj.set_text("rangeColor");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_rangeColor", "absolute", "52.81%", "515", null, "24", "6.25%", null, this);
            obj.set_taborder("162");
            this.addChild(obj.name, obj);

            obj = new Static("Static16", "absolute", "6.25%", "559", null, "20", "46.88%", null, this);
            obj.set_taborder("163");
            obj.set_text("rangeOpacity");
            this.addChild(obj.name, obj);

            obj = new Static("Static11", "absolute", "6.25%", "93", null, "20", "46.88%", null, this);
            obj.set_taborder("171");
            obj.set_text("rangeStart");
            this.addChild(obj.name, obj);

            obj = new Static("Static13", "absolute", "6.56%", "167", null, "20", "46.56%", null, this);
            obj.set_taborder("175");
            obj.set_text("scrollOffset");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "6.25%", "308", null, "20", "46.88%", null, this);
            obj.set_taborder("177");
            obj.set_text("scrollColor");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "6.25%", "345", null, "20", "46.88%", null, this);
            obj.set_taborder("179");
            obj.set_text("scrollOpacity");
            this.addChild(obj.name, obj);

            obj = new Static("Static12", "absolute", "6.25%", "679", null, "20", "46.88%", null, this);
            obj.set_taborder("181");
            obj.set_text("rangeBorderWidth");
            this.addChild(obj.name, obj);

            obj = new Static("Static14", "absolute", "6.25%", "717", null, "20", "46.88%", null, this);
            obj.set_taborder("183");
            obj.set_text("rangeMinSize");
            this.addChild(obj.name, obj);

            obj = new Static("Static18", "absolute", "6.25%", "760", null, "20", "46.88%", null, this);
            obj.set_taborder("185");
            obj.set_text("resizeSize");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_scrollColor", "absolute", "52.81%", "306", null, "24", "6.25%", null, this);
            obj.set_taborder("188");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_rangeBorderColor", "absolute", "52.81%", "596", null, "24", "6.25%", null, this);
            obj.set_taborder("190");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_rangeEnd", "absolute", "52.81%", "128", null, "24", "6.25%", null, this);
            obj.set_taborder("195");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_rangeStart", "absolute", "52.81%", "91", null, "24", "6.25%", null, this);
            obj.set_taborder("196");
            this.addChild(obj.name, obj);

            obj = new Static("Static19", "absolute", "6.56%", "207", null, "13", "5.94%", null, this);
            obj.set_taborder("197");
            obj.style.set_border("2 solid #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_scrollOffset", "absolute", "52.81%", "165", null, "24", "6.56%", null, this);
            obj.set_taborder("198");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_scrollHeight", "absolute", "52.81%", "227", null, "24", "6.56%", null, this);
            obj.set_taborder("199");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_scrollWidth", "absolute", "52.81%", "264", null, "24", "6.56%", null, this);
            obj.set_taborder("200");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_borderWidth", "absolute", "52.81%", "380", null, "24", "6.56%", null, this);
            obj.set_taborder("201");
            obj.set_mask("0.0");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_plotTopBorderOpacity", "absolute", "52.81%", "1518", null, "24", "6.88%", null, this);
            obj.set_taborder("202");
            obj.set_mask("0.0");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_plotTopBorderOpacity00", "absolute", "55.31%", "1526", null, "24", "4.38%", null, this);
            obj.set_taborder("203");
            obj.set_mask("0.0");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_scrollOpacity", "absolute", "52.81%", "343", null, "24", "6.88%", null, this);
            obj.set_taborder("204");
            obj.set_mask("0.0");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_rangeOpacity", "absolute", "52.81%", "559", null, "24", "6.88%", null, this);
            obj.set_taborder("205");
            obj.set_mask("0.0");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_rangeBorderWidth", "absolute", "52.81%", "677", null, "24", "6.56%", null, this);
            obj.set_taborder("206");
            obj.set_mask("0.0");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_rangeMinSize", "absolute", "52.81%", "715", null, "24", "6.56%", null, this);
            obj.set_taborder("207");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_resizeSize", "absolute", "52.81%", "758", null, "24", "6.56%", null, this);
            obj.set_taborder("208");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 320, 804, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("config_xaxis");
            		p.set_titletext("차트 X스크롤바 설정");
            		p.style.set_background("#d4d9dfff");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item24","cmb_borderStyle","value","ds_xScrollbar","borderStyle");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item0","edt_id","value","ds_xScrollbar","id");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item3","cmb_rangeBorderStyle","value","ds_xScrollbar","rangeBorderStyle");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item5","edt_borderColor","value","ds_xScrollbar","borderColor");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item7","edt_rangeColor","value","ds_xScrollbar","rangeColor");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item9","edt_scrollColor","value","ds_xScrollbar","scrollColor");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item16","edt_rangeBorderColor","value","ds_xScrollbar","rangeBorderColor");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item2","edt_rangeEnd","value","ds_xScrollbar","rangeEnd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item11","edt_rangeStart","value","ds_xScrollbar","rangeStart");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item4","mae_scrollHeight","value","ds_xScrollbar","scrollHeight");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item6","mae_scrollWidth","value","ds_xScrollbar","scrollWidth");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item12","mae_borderWidth","value","ds_xScrollbar","borderWidth");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item1","mae_scrollOffset","value","ds_xScrollbar","scrollOffset");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item36","mae_plotTopBorderOpacity","value","ds_pchart","plotTopBorderOpacity");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item10","mae_plotTopBorderOpacity00","value","ds_pchart","plotTopBorderOpacity");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item17","mae_scrollOpacity","value","ds_xScrollbar","scrollOpacity");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item8","mae_rangeOpacity","value","ds_xScrollbar","rangeOpacity");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item13","mae_rangeBorderWidth","value","ds_xScrollbar","rangeBorderWidth");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item14","mae_rangeMinSize","value","ds_xScrollbar","rangeMinSize");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item15","mae_resizeSize","value","ds_xScrollbar","resizeSize");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.registerScript("ConfigXScrollbar.xfdl", function() {

        var parent = this.parent;

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
            this.cmb_rangeBorderStyle.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.cmb_borderStyle.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.edt_borderColor.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.Static15.addEventHandler("onclick", this.Static05_onclick, this);
            this.edt_rangeColor.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.edt_scrollColor.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.edt_rangeBorderColor.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.edt_rangeEnd.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.edt_rangeStart.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_scrollOffset.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_scrollOffset.addEventHandler("canchange", this.common_canchage_integer, this);
            this.mae_scrollHeight.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_scrollHeight.addEventHandler("canchange", this.common_canchage_integer, this);
            this.mae_scrollWidth.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_scrollWidth.addEventHandler("canchange", this.common_canchage_integer, this);
            this.mae_borderWidth.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_borderWidth.addEventHandler("canchange", this.common_canchage_integer, this);
            this.mae_plotTopBorderOpacity.addEventHandler("canchange", this.common_canchage_02, this);
            this.mae_plotTopBorderOpacity00.addEventHandler("canchange", this.common_canchage_02, this);
            this.mae_scrollOpacity.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_scrollOpacity.addEventHandler("canchange", this.common_canchage_decimal, this);
            this.mae_rangeOpacity.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_rangeOpacity.addEventHandler("canchange", this.common_canchage_decimal, this);
            this.mae_rangeBorderWidth.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_rangeBorderWidth.addEventHandler("canchange", this.common_canchage_integer, this);
            this.mae_rangeMinSize.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_rangeMinSize.addEventHandler("canchange", this.common_canchage_integer, this);
            this.mae_resizeSize.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_resizeSize.addEventHandler("canchange", this.common_canchage_integer, this);

        };

        this.loadIncludeScript("ConfigXScrollbar.xfdl");

       
    };
}
)();
