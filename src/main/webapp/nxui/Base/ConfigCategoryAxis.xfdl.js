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
                this.set_name("configCategoryAxis");
                this.set_classname("config_xaxis");
                this.set_titletext("차트 기본 설정");
                this._setFormPosition(0,0,320,1148);
            }
            this.style.set_background("#d4d9dfff");

            
            // Object(Dataset, ExcelExportObject) Initialize

            
            // UI Components Initialize
            obj = new Static("Static01", "absolute", "20", "11", "268", "25", null, null, this);
            obj.set_taborder("22");
            obj.set_text("CategoryAxis");
            obj.style.set_font("antialias 15 Verdana, malgun gothic");
            this.addChild(obj.name, obj);

            obj = new Static("Static26", "absolute", "20", "40", null, "13", "20", null, this);
            obj.set_taborder("23");
            obj.style.set_border("2 solid #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff");
            this.addChild(obj.name, obj);

            obj = new Combo("cmb_lineStyle", "absolute", "52.81%", "216", null, "24", "5.94%", null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("25");
            obj.set_innerdataset("ds_style");
            obj.set_codecolumn("code");
            obj.set_datacolumn("data");
            obj.set_index("-1");

            obj = new Static("Static13", "absolute", "6.25%", "631", null, "20", "46.88%", null, this);
            obj.set_taborder("30");
            obj.set_text("labelFontType");
            this.addChild(obj.name, obj);

            obj = new Static("Static12", "absolute", "6.25%", "596", null, "20", "46.88%", null, this);
            obj.set_taborder("32");
            obj.set_text("labelFontSize");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_labelFontFace", "absolute", "52.81%", "555", null, "24", "6.25%", null, this);
            obj.set_taborder("33");
            this.addChild(obj.name, obj);

            obj = new Static("Static11", "absolute", "6.25%", "557", null, "20", "46.88%", null, this);
            obj.set_taborder("34");
            obj.set_text("labelFontFace");
            this.addChild(obj.name, obj);

            obj = new Static("Static09", "absolute", "6.25%", "289", null, "20", "46.88%", null, this);
            obj.set_taborder("36");
            obj.set_text("lineOpacity");
            this.addChild(obj.name, obj);

            obj = new Static("Static08", "absolute", "6.25%", "253", null, "20", "46.88%", null, this);
            obj.set_taborder("37");
            obj.set_text("lineColor");
            this.addChild(obj.name, obj);

            obj = new Static("Static07", "absolute", "6.25%", "218", null, "20", "46.88%", null, this);
            obj.set_taborder("38");
            obj.set_text("lineStyle");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "6.25%", "185", null, "20", "46.88%", null, this);
            obj.set_taborder("39");
            obj.set_text("lineWidth");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "6.25%", "92", null, "20", "46.88%", null, this);
            obj.set_taborder("43");
            obj.set_text("position");
            this.addChild(obj.name, obj);

            obj = new Static("Static14", "absolute", "6.25%", "664", null, "20", "46.88%", null, this);
            obj.set_taborder("48");
            obj.set_text("labelColor");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "6.25%", "697", null, "20", "46.88%", null, this);
            obj.set_taborder("51");
            obj.set_text("labelRotate");
            this.addChild(obj.name, obj);

            obj = new Static("Static27", "absolute", "6.25%", "733", null, "20", "46.88%", null, this);
            obj.set_taborder("52");
            obj.set_text("labelMargin");
            this.addChild(obj.name, obj);

            obj = new Static("Static17", "absolute", "6.25%", "58", null, "20", "46.88%", null, this);
            obj.set_taborder("77");
            obj.set_text("id");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_id", "absolute", "52.81%", "56", null, "24", "6.25%", null, this);
            obj.set_taborder("78");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("Static24", "absolute", "6.25%", "164", null, "13", "6.25%", null, this);
            obj.set_taborder("95");
            obj.style.set_border("2 solid #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static25", "absolute", "6.25%", "532", null, "13", "6.25%", null, this);
            obj.set_taborder("97");
            obj.style.set_border("2 solid #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static39", "absolute", "6.25%", "408", null, "20", "46.88%", null, this);
            obj.set_taborder("99");
            obj.set_text("tickStyle");
            this.addChild(obj.name, obj);

            obj = new Combo("cmb_tickStyle", "absolute", "52.81%", "406", null, "24", "5.94%", null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("100");
            obj.set_innerdataset("@ds_style");
            obj.set_codecolumn("code");
            obj.set_datacolumn("data");

            obj = new Static("Static40", "absolute", "6.25%", "368", null, "20", "46.88%", null, this);
            obj.set_taborder("101");
            obj.set_text("tickWidth");
            this.addChild(obj.name, obj);

            obj = new Static("Static41", "absolute", "6.25%", "488", null, "20", "46.88%", null, this);
            obj.set_taborder("103");
            obj.set_text("tickOpacity");
            this.addChild(obj.name, obj);

            obj = new Static("Static42", "absolute", "6.25%", "448", null, "20", "46.88%", null, this);
            obj.set_taborder("105");
            obj.set_text("tickColor");
            this.addChild(obj.name, obj);

            obj = new Static("Static20", "absolute", "6.25%", "780", null, "13", "6.25%", null, this);
            obj.set_taborder("111");
            obj.style.set_border("2 solid #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "6.25%", "837", null, "20", "46.88%", null, this);
            obj.set_taborder("112");
            obj.set_text("titleFontFace");
            this.addChild(obj.name, obj);

            obj = new Static("Static22", "absolute", "6.25%", "873", null, "20", "46.88%", null, this);
            obj.set_taborder("113");
            obj.set_text("titleFontSize");
            this.addChild(obj.name, obj);

            obj = new Static("Static45", "absolute", "6.25%", "911", null, "20", "46.88%", null, this);
            obj.set_taborder("116");
            obj.set_text("titleFontType");
            this.addChild(obj.name, obj);

            obj = new Static("Static46", "absolute", "6.25%", "952", null, "20", "46.88%", null, this);
            obj.set_taborder("118");
            obj.set_text("titleFontColor");
            this.addChild(obj.name, obj);

            obj = new Static("Static47", "absolute", "6.25%", "991", null, "20", "46.88%", null, this);
            obj.set_taborder("120");
            obj.set_text("titleMargin");
            this.addChild(obj.name, obj);

            obj = new Static("Static48", "absolute", "6.25%", "1031", null, "20", "46.88%", null, this);
            obj.set_taborder("122");
            obj.set_text("titleHalign");
            this.addChild(obj.name, obj);

            obj = new Static("Static49", "absolute", "6.25%", "328", null, "20", "46.88%", null, this);
            obj.set_taborder("126");
            obj.set_text("tickLength");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "6.25%", "1071", null, "20", "46.88%", null, this);
            obj.set_taborder("128");
            obj.set_text("titleValign");
            this.addChild(obj.name, obj);

            obj = new Static("Static23", "absolute", "6.25%", "1111", null, "20", "46.88%", null, this);
            obj.set_taborder("130");
            obj.set_text("titleRotate");
            this.addChild(obj.name, obj);

            obj = new Static("Static43", "absolute", "6.25%", "801", null, "20", "46.88%", null, this);
            obj.set_taborder("132");
            obj.set_text("title");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_title", "absolute", "52.19%", "799", null, "24", "6.88%", null, this);
            obj.set_taborder("133");
            this.addChild(obj.name, obj);

            obj = new Combo("cmb_position", "absolute", "52.81%", "90", null, "24", "5.94%", null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("134");
            obj.set_innerdataset("ds_position");
            obj.set_codecolumn("code");
            obj.set_datacolumn("data");

            obj = new Edit("edt_lineColor", "absolute", "52.81%", "251", null, "24", "6.25%", null, this);
            obj.set_taborder("135");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_tickColor", "absolute", "52.81%", "446", null, "24", "6.25%", null, this);
            obj.set_taborder("136");
            this.addChild(obj.name, obj);

            obj = new Combo("cmb_labelFontType", "absolute", "52.81%", "629", null, "24", "5.94%", null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("137");
            obj.set_innerdataset("@ds_fontType");
            obj.set_codecolumn("code");
            obj.set_datacolumn("data");

            obj = new Edit("edt_labelColor", "absolute", "52.81%", "662", null, "24", "6.25%", null, this);
            obj.set_taborder("139");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_titleFontFace", "absolute", "52.19%", "835", null, "24", "6.88%", null, this);
            obj.set_taborder("141");
            this.addChild(obj.name, obj);

            obj = new Combo("cmb_titleFontType", "absolute", "52.19%", "909", null, "24", "6.56%", null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("143");
            obj.set_innerdataset("@ds_fontType");
            obj.set_codecolumn("code");
            obj.set_datacolumn("data");

            obj = new Edit("edt_titleFontColor", "absolute", "52.19%", "950", null, "24", "6.88%", null, this);
            obj.set_taborder("144");
            this.addChild(obj.name, obj);

            obj = new Combo("cmb_titleHalign", "absolute", "52.19%", "1027", null, "24", "6.56%", null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("145");
            obj.set_innerdataset("@ds_halign");
            obj.set_codecolumn("code");
            obj.set_datacolumn("data");

            obj = new Combo("cmb_titleValign", "absolute", "52.19%", "1069", null, "24", "6.56%", null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("146");
            obj.set_innerdataset("@ds_valign");
            obj.set_codecolumn("code");
            obj.set_datacolumn("data");

            obj = new CheckBox("chk_titleRotate", "absolute", "52.19%", "1109", null, "24", "27.5%", null, this);
            obj.set_taborder("162");
            obj.set_cssclass("WF_chk_Switch");
            this.addChild(obj.name, obj);

            obj = new Static("Static16", "absolute", "6.25%", "126", null, "20", "46.88%", null, this);
            obj.set_taborder("166");
            obj.set_text("autoscaleMargin");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_autoscaleMargin", "absolute", "52.81%", "124", null, "24", "6.56%", null, this);
            obj.set_taborder("167");
            obj.set_mask("0.00");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_lineWidth", "absolute", "52.81%", "183", null, "24", "6.56%", null, this);
            obj.set_taborder("168");
            obj.set_mask("0.0");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_lineOpacity", "absolute", "52.81%", "287", null, "24", "6.56%", null, this);
            obj.set_taborder("169");
            obj.set_mask("0.0");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_tickWidth", "absolute", "52.81%", "364", null, "24", "6.56%", null, this);
            obj.set_taborder("170");
            obj.set_mask("0.0");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_tickLength", "absolute", "52.81%", "326", null, "24", "6.56%", null, this);
            obj.set_taborder("171");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_tickOpacity", "absolute", "52.81%", "486", null, "24", "6.56%", null, this);
            obj.set_taborder("172");
            obj.set_mask("0.0");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_labelFontSize", "absolute", "52.81%", "594", null, "24", "6.56%", null, this);
            obj.set_taborder("173");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_labelRotate", "absolute", "52.81%", "695", null, "24", "6.56%", null, this);
            obj.set_taborder("174");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_labelMargin", "absolute", "52.81%", "731", null, "24", "6.56%", null, this);
            obj.set_taborder("175");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_titleFontSize", "absolute", "52.19%", "871", null, "24", "7.19%", null, this);
            obj.set_taborder("176");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_titleMargin", "absolute", "52.19%", "989", null, "24", "7.19%", null, this);
            obj.set_taborder("177");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 320, 1148, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("config_xaxis");
            		p.set_titletext("차트 기본 설정");
            		p.style.set_background("#d4d9dfff");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item24","cmb_lineStyle","value","ds_categoryAxis","lineStyle");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item10","edt_labelFontFace","value","ds_categoryAxis","labelFontFace");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item0","edt_id","value","ds_categoryAxis","id");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item18","cmb_tickStyle","value","ds_categoryAxis","tickStyle");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item23","edt_title","value","ds_categoryAxis","title");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item8","edt_lineColor","value","ds_categoryAxis","lineColor");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item14","edt_tickColor","value","ds_categoryAxis","tickColor");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item11","cmb_labelFontType","value","ds_categoryAxis","labelFontType");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item20","edt_labelColor","value","ds_categoryAxis","labelColor");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item4","edt_titleFontFace","value","ds_categoryAxis","titleFontFace");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item21","cmb_titleFontType","value","ds_categoryAxis","titleFontType");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item22","edt_titleFontColor","value","ds_categoryAxis","titleFontColor");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item5","cmb_titleHalign","value","ds_categoryAxis","titleHalign");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item25","cmb_titleValign","value","ds_categoryAxis","titleValign");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item15","chk_titleRotate","value","ds_categoryAxis","titleRotate");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item1","cmb_position","value","ds_categoryAxis","position");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item2","mae_autoscaleMargin","value","ds_categoryAxis","autoscaleMargin");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item3","mae_lineWidth","value","ds_categoryAxis","lineWidth");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item6","mae_lineOpacity","value","ds_categoryAxis","lineOpacity");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item9","mae_tickWidth","value","ds_categoryAxis","tickWidth");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item16","mae_tickLength","value","ds_categoryAxis","tickLength");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item17","mae_tickOpacity","value","ds_categoryAxis","tickOpacity");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item12","mae_labelFontSize","value","ds_categoryAxis","labelFontSize");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item13","mae_labelRotate","value","ds_categoryAxis","labelRotate");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item19","mae_labelMargin","value","ds_categoryAxis","labelMargin");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item7","mae_titleFontSize","value","ds_categoryAxis","titleFontSize");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item26","mae_titleMargin","value","ds_categoryAxis","titleMargin");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.registerScript("ConfigCategoryAxis.xfdl", function() {

        var	parent = this.parent;
        	
        this.common_onsetfocus = function(obj,e)
        {
        	parent.setPropertyDesc(obj,e);
        }

        this.configCategoryAxis_onload = function(obj,e)
        {	
        	var innerDs = parent.ds_position;
        	var nrow;
        	
        	var categoryAxis = parent.eChart.getCategoryAxis();
        	if (innerDs.rowcount > 0)
        	{
        		innerDs.clearData();
        	}
        	
        	if (categoryAxis)
        	{
        		var cAxisPosition = categoryAxis.getPosition();
        		if (cAxisPosition == "left" || cAxisPosition == "right")
        		{
        			if (cAxisPosition == "left")
        			{
        				this.cmb_position.set_value("left");
        			}
        			else
        			{
        				this.cmb_position.set_value("right");
        			}
        			innerDs.set_enableevent(false);
        			nrow = innerDs.addRow();
        			innerDs.setColumn(nrow, "code", "left");
        			innerDs.setColumn(nrow, "data", "left");
        			
        			nrow = innerDs.addRow();
        			innerDs.setColumn(nrow, "code", "right");
        			innerDs.setColumn(nrow, "data", "right");
        			innerDs.set_enableevent(true);
        		}
        		else if (cAxisPosition == "bottom" || cAxisPosition == "top")
        		{
        			if (cAxisPosition == "bottom")
        			{
        				this.cmb_position.set_value("bottom");
        			}
        			else
        			{
        				this.cmb_position.set_value("top");
        			}
        			innerDs.set_enableevent(false);
        			nrow = innerDs.addRow();
        			innerDs.setColumn(nrow, "code", "bottom");
        			innerDs.setColumn(nrow, "data", "bottom");
        			
        			nrow = innerDs.addRow();
        			innerDs.setColumn(nrow, "code", "top");
        			innerDs.setColumn(nrow, "data", "top");
        			innerDs.set_enableevent(true);
        		}
        	}
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

        this.common_canchage_angle = function(obj,e)
        {
        	var input = nexacro.toNumber(obj.value);	
        	var re = parent.validateInputData3(input);
        			
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
            this.addEventHandler("onload", this.configCategoryAxis_onload, this);
            this.cmb_lineStyle.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.edt_labelFontFace.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.edt_id.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.cmb_tickStyle.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.edt_title.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.cmb_position.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.edt_lineColor.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.edt_tickColor.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.cmb_labelFontType.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.edt_labelColor.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.edt_titleFontFace.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.cmb_titleFontType.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.edt_titleFontColor.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.cmb_titleHalign.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.cmb_titleValign.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.chk_titleRotate.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_autoscaleMargin.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_autoscaleMargin.addEventHandler("canchange", this.common_canchage_decimal, this);
            this.mae_lineWidth.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_lineWidth.addEventHandler("canchange", this.common_canchage_integer, this);
            this.mae_lineOpacity.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_lineOpacity.addEventHandler("canchange", this.common_canchage_decimal, this);
            this.mae_tickWidth.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_tickWidth.addEventHandler("canchange", this.common_canchage_integer, this);
            this.mae_tickLength.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_tickLength.addEventHandler("canchange", this.common_canchage_integer, this);
            this.mae_tickOpacity.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_tickOpacity.addEventHandler("canchange", this.common_canchage_decimal, this);
            this.mae_labelFontSize.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_labelFontSize.addEventHandler("canchange", this.common_canchage_integer, this);
            this.mae_labelRotate.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_labelRotate.addEventHandler("canchange", this.common_canchage_angle, this);
            this.mae_labelMargin.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_labelMargin.addEventHandler("canchange", this.common_canchage_integer, this);
            this.mae_titleFontSize.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_titleFontSize.addEventHandler("canchange", this.common_canchage_integer, this);
            this.mae_titleMargin.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_titleMargin.addEventHandler("canchange", this.common_canchage_integer, this);

        };

        this.loadIncludeScript("ConfigCategoryAxis.xfdl");

       
    };
}
)();
