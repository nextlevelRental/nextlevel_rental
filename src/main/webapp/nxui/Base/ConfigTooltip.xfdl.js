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
                this.set_name("configTooltip");
                this.set_classname("config_xaxis");
                this.set_titletext("차트 툴팁 설정");
                this._setFormPosition(0,0,320,719);
            }
            this.style.set_background("#d4d9dfff");

            
            // Object(Dataset, ExcelExportObject) Initialize

            
            // UI Components Initialize
            obj = new Static("Static01", "absolute", "20", "11", "268", "25", null, null, this);
            obj.set_taborder("22");
            obj.set_text("Tooltip");
            obj.style.set_font("antialias 15 Verdana, malgun gothic");
            this.addChild(obj.name, obj);

            obj = new Static("Static26", "absolute", "20", "40", null, "13", "20", null, this);
            obj.set_taborder("23");
            obj.style.set_border("2 solid #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static09", "absolute", "6.25%", "406", null, "20", "46.88%", null, this);
            obj.set_taborder("36");
            obj.set_text("borderColor");
            this.addChild(obj.name, obj);

            obj = new Static("Static08", "absolute", "6.25%", "367", null, "20", "46.88%", null, this);
            obj.set_taborder("37");
            obj.set_text("borderStyle");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "6.25%", "226", null, "20", "46.88%", null, this);
            obj.set_taborder("39");
            obj.set_text("fontColor");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "6.25%", "190", null, "20", "46.88%", null, this);
            obj.set_taborder("43");
            obj.set_text("fontType");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "6.25%", "158", null, "20", "46.88%", null, this);
            obj.set_taborder("45");
            obj.set_text("fontFace");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "6.25%", "88", null, "20", "46.88%", null, this);
            obj.set_taborder("47");
            obj.set_text("show");
            this.addChild(obj.name, obj);

            obj = new Static("Static17", "absolute", "6.25%", "56", null, "20", "46.88%", null, this);
            obj.set_taborder("77");
            obj.set_text("id");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_id", "absolute", "52.81%", "54", null, "24", "6.25%", null, this);
            obj.set_taborder("78");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new CheckBox("chk_show", "absolute", "52.81%", "86", null, "24", "6.25%", null, this);
            obj.set_taborder("94");
            obj.set_cssclass("WF_chk_Switch");
            this.addChild(obj.name, obj);

            obj = new Static("Static25", "absolute", "6.25%", "303", null, "13", "6.25%", null, this);
            obj.set_taborder("97");
            obj.style.set_border("2 solid #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static40", "absolute", "6.25%", "598", null, "20", "46.88%", null, this);
            obj.set_taborder("101");
            obj.set_text("hookHeight");
            this.addChild(obj.name, obj);

            obj = new Static("Static49", "absolute", "6.25%", "560", null, "20", "46.88%", null, this);
            obj.set_taborder("126");
            obj.set_text("hookWidth");
            this.addChild(obj.name, obj);

            obj = new Combo("cmb_fontType", "absolute", "52.81%", "188", null, "24", "5.94%", null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("134");
            obj.set_innerdataset("@ds_fontType");
            obj.set_codecolumn("code");
            obj.set_datacolumn("data");

            obj = new Combo("cmb_borderStyle", "absolute", "52.81%", "365", null, "24", "5.94%", null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("156");
            obj.set_innerdataset("@ds_style");
            obj.set_codecolumn("code");
            obj.set_datacolumn("data");

            obj = new Static("Static07", "absolute", "6.25%", "327", null, "20", "46.88%", null, this);
            obj.set_taborder("157");
            obj.set_text("borderWidth");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_borderColor", "absolute", "52.81%", "404", null, "24", "6.25%", null, this);
            obj.set_taborder("159");
            this.addChild(obj.name, obj);

            obj = new Static("Static15", "absolute", "6.25%", "534", null, "13", "6.25%", null, this);
            obj.set_taborder("160");
            obj.style.set_border("2 solid #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static10", "absolute", "6.25%", "446", null, "20", "46.88%", null, this);
            obj.set_taborder("161");
            obj.set_text("color");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_color", "absolute", "52.81%", "444", null, "24", "6.25%", null, this);
            obj.set_taborder("162");
            this.addChild(obj.name, obj);

            obj = new Static("Static16", "absolute", "6.25%", "487", null, "20", "46.88%", null, this);
            obj.set_taborder("163");
            obj.set_text("opacity");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "6.25%", "645", null, "20", "46.88%", null, this);
            obj.set_taborder("165");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "6.25%", "678", null, "20", "46.88%", null, this);
            obj.set_taborder("167");
            obj.set_text("offsetY");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_fontFace", "absolute", "52.81%", "156", null, "24", "6.25%", null, this);
            obj.set_taborder("169");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_fontColor", "absolute", "52.81%", "222", null, "24", "6.25%", null, this);
            obj.set_taborder("170");
            this.addChild(obj.name, obj);

            obj = new Static("Static11", "absolute", "6.25%", "121", null, "20", "46.88%", null, this);
            obj.set_taborder("171");
            obj.set_text("text");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_text", "absolute", "52.81%", "119", null, "24", "6.25%", null, this);
            obj.set_taborder("172");
            this.addChild(obj.name, obj);

            obj = new Static("Static12", "absolute", "6.25%", "638", null, "20", "46.88%", null, this);
            obj.set_taborder("174");
            obj.set_text("offsetX");
            this.addChild(obj.name, obj);

            obj = new Static("Static13", "absolute", "6.25%", "265", null, "20", "46.88%", null, this);
            obj.set_taborder("175");
            obj.set_text("fontSize");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_fontSize", "absolute", "52.81%", "263", null, "24", "6.25%", null, this);
            obj.set_taborder("176");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_borderWidth", "absolute", "52.81%", "325", null, "24", "6.25%", null, this);
            obj.set_taborder("177");
            obj.set_mask("0.0");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_opacity", "absolute", "52.81%", "484", null, "24", "6.88%", null, this);
            obj.set_taborder("178");
            obj.set_mask("0.0");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_hookWidth", "absolute", "52.81%", "558", null, "24", "6.25%", null, this);
            obj.set_taborder("179");
            obj.set_limitbymask("integer");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_hookHeight", "absolute", "52.81%", "596", null, "24", "6.25%", null, this);
            obj.set_taborder("180");
            obj.set_limitbymask("integer");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_offsetX", "absolute", "52.81%", "636", null, "24", "6.25%", null, this);
            obj.set_taborder("181");
            obj.set_limitbymask("decimal");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_offsetY", "absolute", "52.81%", "676", null, "24", "6.25%", null, this);
            obj.set_taborder("182");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 320, 719, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("config_xaxis");
            		p.set_titletext("차트 툴팁 설정");
            		p.style.set_background("#d4d9dfff");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item24","cmb_borderStyle","value","","borderStyle");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item1","chk_show","value","","show");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item3","cmb_fontType","value","","fontType");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item5","edt_borderColor","value","","borderColor");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item7","edt_color","value","","color");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item2","edt_fontFace","value","","fontFace");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item6","edt_fontColor","value","","fontColor");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item11","edt_text","value","","text");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item0","edt_id","value","","id");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item29","mae_fontSize","value","","fontSize");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item4","mae_borderWidth","value","","borderWidth");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item8","mae_opacity","value","","opacity");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item9","mae_hookWidth","value","","hookWidth");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item10","mae_hookHeight","value","","hookHeight");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item12","mae_offsetX","value","","offsetX");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item13","mae_offsetY","value","","offsetY");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.registerScript("ConfigTooltip.xfdl", function() {

        var parent = this.parent;
        	
        this.configTooltip_onload = function(obj,e)
        {
        	var bindDs,
        		dsNm = "ds_tooltip";
        	
        	bindDs = parent.grd_leftMenu.getBindDataset();
        	if (bindDs)
        	{
        		if (bindDs.name == "ds_pieMenu")
        		{
        			dsNm = "ds_ptooltip";
        		}
        		
        		var binds = this.binds;
        		for (var i = 0, len = binds.length; i < len ; i++)
        		{
        			binds[i].datasetid = dsNm;
        			binds[i].bind();
        		}
        	}
        }

        this.common_onsetfocus = function(obj,e)
        {
        	this.parent.setPropertyDesc(obj,e);
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
            this.chk_show.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.cmb_fontType.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.cmb_borderStyle.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.edt_borderColor.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.Static15.addEventHandler("onclick", this.Static05_onclick, this);
            this.edt_color.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.edt_fontFace.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.edt_fontColor.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.edt_text.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_fontSize.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_fontSize.addEventHandler("canchange", this.common_canchage_integer, this);
            this.mae_borderWidth.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_borderWidth.addEventHandler("canchange", this.common_canchage_integer, this);
            this.mae_opacity.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_opacity.addEventHandler("canchange", this.common_canchage_decimal, this);
            this.mae_hookWidth.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_hookWidth.addEventHandler("canchange", this.common_canchage_integer, this);
            this.mae_hookHeight.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_hookHeight.addEventHandler("canchange", this.common_canchage_integer, this);
            this.mae_offsetX.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_offsetX.addEventHandler("canchange", this.common_canchage_integer, this);
            this.mae_offsetY.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_offsetY.addEventHandler("canchange", this.common_canchage_integer, this);

        };

        this.loadIncludeScript("ConfigTooltip.xfdl");

       
    };
}
)();
