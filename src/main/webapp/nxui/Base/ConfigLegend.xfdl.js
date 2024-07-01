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
                this.set_name("configLegend");
                this.set_classname("config_xaxis");
                this.set_titletext("차트 범례 설정");
                this._setFormPosition(0,0,320,1601);
            }
            this.style.set_background("#d4d9dfff");

            
            // Object(Dataset, ExcelExportObject) Initialize

            
            // UI Components Initialize
            obj = new Static("Static01", "absolute", "20", "11", "268", "25", null, null, this);
            obj.set_taborder("22");
            obj.set_text("Legend");
            obj.style.set_font("antialias 15 Verdana, malgun gothic");
            this.addChild(obj.name, obj);

            obj = new Static("Static26", "absolute", "20", "40", null, "13", "20", null, this);
            obj.set_taborder("23");
            obj.style.set_border("2 solid #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static09", "absolute", "6.25%", "843", null, "20", "46.88%", null, this);
            obj.set_taborder("36");
            obj.set_text("borderColor");
            this.addChild(obj.name, obj);

            obj = new Static("Static08", "absolute", "6.25%", "804", null, "20", "46.88%", null, this);
            obj.set_taborder("37");
            obj.set_text("backgroundOpacity");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "6.25%", "224", null, "20", "46.88%", null, this);
            obj.set_taborder("39");
            obj.set_text("width");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "6.25%", "190", null, "20", "46.88%", null, this);
            obj.set_taborder("43");
            obj.set_text("valign");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "6.25%", "158", null, "20", "46.88%", null, this);
            obj.set_taborder("45");
            obj.set_text("align");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "6.25%", "88", null, "20", "46.88%", null, this);
            obj.set_taborder("47");
            obj.set_text("show");
            this.addChild(obj.name, obj);

            obj = new Static("Static17", "absolute", "6.25%", "56", null, "20", "46.88%", null, this);
            obj.set_taborder("77");
            obj.set_text("id");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_id", "absolute", "52.5%", "54", null, "24", "6.56%", null, this);
            obj.set_taborder("78");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new CheckBox("chk_show", "absolute", "52.81%", "86", null, "24", "6.25%", null, this);
            obj.set_taborder("94");
            obj.set_cssclass("WF_chk_Switch");
            this.addChild(obj.name, obj);

            obj = new Static("Static25", "absolute", "6.25%", "743", null, "13", "6.25%", null, this);
            obj.set_taborder("97");
            obj.style.set_border("2 solid #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static40", "absolute", "6.25%", "990", null, "20", "46.88%", null, this);
            obj.set_taborder("101");
            obj.set_text("markerType");
            this.addChild(obj.name, obj);

            obj = new Static("Static49", "absolute", "6.25%", "954", null, "20", "46.88%", null, this);
            obj.set_taborder("126");
            obj.set_text("markerLabelGap");
            this.addChild(obj.name, obj);

            obj = new Combo("cmb_valign", "absolute", "52.81%", "188", "131", "24", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("134");
            obj.set_innerdataset("ds_valign");
            obj.set_codecolumn("code");
            obj.set_datacolumn("data");
            obj.set_index("-1");

            obj = new Static("Static07", "absolute", "6.25%", "765", null, "20", "46.88%", null, this);
            obj.set_taborder("157");
            obj.set_text("backgroundColor");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_borderColor", "absolute", "52.5%", "841", null, "24", "6.56%", null, this);
            obj.set_taborder("159");
            this.addChild(obj.name, obj);

            obj = new Static("Static15", "absolute", "6.25%", "1251", null, "13", "6.25%", null, this);
            obj.set_taborder("160");
            obj.style.set_border("2 solid #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "6.25%", "1045", null, "20", "46.88%", null, this);
            obj.set_taborder("165");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "6.25%", "1062", null, "20", "46.88%", null, this);
            obj.set_taborder("167");
            obj.set_text("markerColor");
            this.addChild(obj.name, obj);

            obj = new Static("Static11", "absolute", "6.25%", "121", null, "20", "46.88%", null, this);
            obj.set_taborder("171");
            obj.set_text("position");
            this.addChild(obj.name, obj);

            obj = new Static("Static12", "absolute", "6.25%", "1026", null, "20", "46.88%", null, this);
            obj.set_taborder("174");
            obj.set_text("markerSize");
            this.addChild(obj.name, obj);

            obj = new Static("Static13", "absolute", "6.25%", "261", null, "20", "46.88%", null, this);
            obj.set_taborder("177");
            obj.set_text("left");
            this.addChild(obj.name, obj);

            obj = new Static("Static14", "absolute", "6.25%", "296", null, "20", "46.88%", null, this);
            obj.set_taborder("179");
            obj.set_text("top");
            this.addChild(obj.name, obj);

            obj = new Combo("cmb_align", "absolute", "52.81%", "154", null, "24", "5.94%", null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("180");
            obj.set_innerdataset("ds_halign");
            obj.set_codecolumn("code");
            obj.set_datacolumn("data");

            obj = new Combo("cmb_position", "absolute", "52.81%", "118", null, "24", "5.94%", null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("181");
            obj.set_innerdataset("ds_lposition");
            obj.set_codecolumn("code");
            obj.set_datacolumn("data");
            obj.set_index("-1");

            obj = new Edit("edt_backgroundColor", "absolute", "52.5%", "763", null, "24", "6.56%", null, this);
            obj.set_taborder("183");
            this.addChild(obj.name, obj);

            obj = new Static("Static18", "absolute", "6.25%", "882", null, "20", "46.88%", null, this);
            obj.set_taborder("184");
            obj.set_text("borderWidth");
            this.addChild(obj.name, obj);

            obj = new Static("Static10", "absolute", "6.25%", "338", null, "20", "46.88%", null, this);
            obj.set_taborder("186");
            obj.set_text("marginLeft");
            this.addChild(obj.name, obj);

            obj = new Static("Static16", "absolute", "5.94%", "377", null, "20", "47.19%", null, this);
            obj.set_taborder("188");
            obj.set_text("marginRight");
            this.addChild(obj.name, obj);

            obj = new Static("Static19", "absolute", "5.94%", "415", null, "20", "47.19%", null, this);
            obj.set_taborder("190");
            obj.set_text("marginTop");
            this.addChild(obj.name, obj);

            obj = new Static("Static20", "absolute", "5.94%", "456", null, "20", "47.19%", null, this);
            obj.set_taborder("192");
            obj.set_text("marginBottom");
            this.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "5.94%", "495", null, "20", "47.19%", null, this);
            obj.set_taborder("194");
            obj.set_text("equalItemWidths");
            this.addChild(obj.name, obj);

            obj = new CheckBox("chk_equalItemWidths", "absolute", "52.81%", "498", null, "24", "6.25%", null, this);
            obj.set_taborder("195");
            obj.set_cssclass("WF_chk_Switch");
            this.addChild(obj.name, obj);

            obj = new Static("Static22", "absolute", "5.94%", "538", null, "20", "47.19%", null, this);
            obj.set_taborder("196");
            obj.set_text("spacing");
            this.addChild(obj.name, obj);

            obj = new Static("Static23", "absolute", "5.94%", "660", null, "20", "47.19%", null, this);
            obj.set_taborder("198");
            obj.set_text("horizontalGap");
            this.addChild(obj.name, obj);

            obj = new Static("Static24", "absolute", "5.63%", "702", null, "20", "47.5%", null, this);
            obj.set_taborder("200");
            obj.set_text("verticalGap");
            this.addChild(obj.name, obj);

            obj = new Combo("cmb_markerType", "absolute", "52.19%", "988", null, "24", "6.56%", null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("202");
            obj.set_innerdataset("ds_markerType");
            obj.set_codecolumn("code");
            obj.set_datacolumn("data");

            obj = new Edit("edt_markerColor", "absolute", "52.19%", "1060", null, "24", "6.88%", null, this);
            obj.set_taborder("203");
            obj.set_enable("true");
            this.addChild(obj.name, obj);

            obj = new Static("Static27", "absolute", "6.25%", "1098", null, "20", "46.88%", null, this);
            obj.set_taborder("204");
            obj.set_text("markerBorderColor");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_markerBorderColor", "absolute", "52.19%", "1096", null, "24", "6.88%", null, this);
            obj.set_taborder("205");
            this.addChild(obj.name, obj);

            obj = new Static("Static28", "absolute", "6.25%", "1137", null, "20", "46.88%", null, this);
            obj.set_taborder("206");
            obj.set_text("markerBorderWidth");
            this.addChild(obj.name, obj);

            obj = new Static("Static29", "absolute", "6.25%", "1173", null, "20", "46.88%", null, this);
            obj.set_taborder("208");
            obj.set_text("markerBorderStyle");
            this.addChild(obj.name, obj);

            obj = new Combo("cmb_markerBorderStyle", "absolute", "52.19%", "1171", null, "24", "6.56%", null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("209");
            obj.set_innerdataset("ds_style");
            obj.set_codecolumn("code");
            obj.set_datacolumn("data");

            obj = new Static("Static30", "absolute", "6.25%", "1209", null, "20", "46.88%", null, this);
            obj.set_taborder("210");
            obj.set_text("markerBorderOpacity");
            this.addChild(obj.name, obj);

            obj = new Static("Static31", "absolute", "6.25%", "927", null, "13", "6.25%", null, this);
            obj.set_taborder("212");
            obj.style.set_border("2 solid #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static32", "absolute", "6.25%", "1310", null, "20", "46.88%", null, this);
            obj.set_taborder("213");
            obj.set_text("labelFontFace");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_labelFontFace", "absolute", "52.19%", "1308", null, "24", "6.88%", null, this);
            obj.set_taborder("214");
            this.addChild(obj.name, obj);

            obj = new Static("Static33", "absolute", "6.25%", "1346", null, "20", "46.88%", null, this);
            obj.set_taborder("215");
            obj.set_text("labelFontSize");
            this.addChild(obj.name, obj);

            obj = new Static("Static34", "absolute", "6.25%", "1382", null, "20", "46.88%", null, this);
            obj.set_taborder("217");
            obj.set_text("labelFontType");
            this.addChild(obj.name, obj);

            obj = new Combo("cmb_labelFontType", "absolute", "52.19%", "1380", null, "24", "6.56%", null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("218");
            obj.set_innerdataset("@ds_fontType");
            obj.set_codecolumn("code");
            obj.set_datacolumn("data");

            obj = new Static("Static35", "absolute", "6.25%", "1418", null, "20", "46.88%", null, this);
            obj.set_taborder("219");
            obj.set_text("labelColor");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_labelColor", "absolute", "52.19%", "1416", null, "24", "6.88%", null, this);
            obj.set_taborder("220");
            this.addChild(obj.name, obj);

            obj = new Static("Static36", "absolute", "6.25%", "1454", null, "20", "46.88%", null, this);
            obj.set_taborder("221");
            obj.set_text("labelWidth");
            this.addChild(obj.name, obj);

            obj = new Static("Static37", "absolute", "6.25%", "1490", null, "20", "46.88%", null, this);
            obj.set_taborder("223");
            obj.set_text("switchable");
            this.addChild(obj.name, obj);

            obj = new CheckBox("chk_switchable", "absolute", "52.19%", "1488", null, "24", "6.88%", null, this);
            obj.set_taborder("224");
            obj.set_cssclass("WF_chk_Switch");
            this.addChild(obj.name, obj);

            obj = new Static("Static38", "absolute", "6.25%", "1526", null, "20", "46.88%", null, this);
            obj.set_taborder("225");
            obj.set_text("disabledColor");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_disabledColor", "absolute", "52.19%", "1524", null, "24", "6.88%", null, this);
            obj.set_taborder("226");
            this.addChild(obj.name, obj);

            obj = new Static("Static39", "absolute", "6.25%", "1562", null, "20", "46.88%", null, this);
            obj.set_taborder("227");
            obj.set_text("useMarkerColorForLabels");
            obj.style.set_font("antialias 8 Meiryo UI, malgun gothic");
            this.addChild(obj.name, obj);

            obj = new Static("Static41", "absolute", "6.25%", "1273", null, "20", "46.88%", null, this);
            obj.set_taborder("229");
            obj.set_text("labelText");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_labelText", "absolute", "52.19%", "1271", null, "24", "6.88%", null, this);
            obj.set_taborder("230");
            this.addChild(obj.name, obj);

            obj = new Static("Static42", "absolute", "5.94%", "579", null, "20", "47.19%", null, this);
            obj.set_taborder("231");
            obj.set_text("columns");
            this.addChild(obj.name, obj);

            obj = new Static("Static43", "absolute", "5.94%", "618", null, "20", "47.19%", null, this);
            obj.set_taborder("234");
            obj.set_text("autoMargins");
            this.addChild(obj.name, obj);

            obj = new CheckBox("chk_autoMargins", "absolute", "52.81%", "616", null, "24", "6.25%", null, this);
            obj.set_taborder("236");
            obj.set_cssclass("WF_chk_Switch");
            this.addChild(obj.name, obj);

            obj = new CheckBox("chk_useMarkerColorForLabels", "absolute", "52.19%", "1560", null, "24", "6.88%", null, this);
            obj.set_taborder("237");
            obj.set_cssclass("WF_chk_Switch");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_width", "absolute", "52.81%", "222", null, "24", "6.25%", null, this);
            obj.set_taborder("238");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_left", "absolute", "52.81%", "259", null, "24", "6.25%", null, this);
            obj.set_taborder("239");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_marginLeft", "absolute", "52.81%", "336", null, "24", "6.25%", null, this);
            obj.set_taborder("240");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_top", "absolute", "52.81%", "294", null, "24", "6.25%", null, this);
            obj.set_taborder("241");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_marginRight", "absolute", "52.81%", "375", null, "24", "6.25%", null, this);
            obj.set_taborder("242");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_marginTop", "absolute", "52.81%", "413", null, "24", "6.25%", null, this);
            obj.set_taborder("243");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_marginBottom", "absolute", "52.81%", "454", null, "24", "6.25%", null, this);
            obj.set_taborder("244");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_spacing", "absolute", "52.81%", "536", null, "24", "6.25%", null, this);
            obj.set_taborder("245");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_columns", "absolute", "52.81%", "577", null, "24", "6.25%", null, this);
            obj.set_taborder("246");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_horizontalGap", "absolute", "52.81%", "658", null, "24", "6.25%", null, this);
            obj.set_taborder("247");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_verticalGap", "absolute", "52.81%", "700", null, "24", "6.25%", null, this);
            obj.set_taborder("248");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_backgroundOpacity", "absolute", "52.5%", "802", null, "24", "6.88%", null, this);
            obj.set_taborder("249");
            obj.set_mask("0.0");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_borderWidth", "absolute", "52.5%", "880", null, "24", "6.56%", null, this);
            obj.set_taborder("250");
            obj.set_mask("0.0");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_markerLabelGap", "absolute", "52.5%", "952", null, "24", "6.56%", null, this);
            obj.set_taborder("251");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_markerSize", "absolute", "52.19%", "1024", null, "24", "6.88%", null, this);
            obj.set_taborder("252");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_markerBorderOpacity", "absolute", "52.19%", "1207", null, "24", "7.5%", null, this);
            obj.set_taborder("253");
            obj.set_mask("0.0");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_markerBorderWidth", "absolute", "52.19%", "1135", null, "24", "6.88%", null, this);
            obj.set_taborder("254");
            obj.set_mask("0.0");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_labelFontSize", "absolute", "52.19%", "1344", null, "24", "6.88%", null, this);
            obj.set_taborder("255");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_labelWidth", "absolute", "52.19%", "1452", null, "24", "6.88%", null, this);
            obj.set_taborder("256");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 320, 1601, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("config_xaxis");
            		p.set_titletext("차트 범례 설정");
            		p.style.set_background("#d4d9dfff");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item0","edt_id","value","","id");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item1","chk_show","value","","show");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item3","cmb_valign","value","","valign");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item5","edt_borderColor","value","","borderColor");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item2","cmb_align","value","","align");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item11","cmb_position","value","","position");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item14","edt_backgroundColor","value","","backgroundColor");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item18","chk_equalItemWidths","value","","equalItemWidths");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item19","cmb_markerType","value","","markerType");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item10","edt_markerColor","value","","markerColor");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item23","edt_markerBorderColor","value","","markerBorderColor");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item25","cmb_markerBorderStyle","value","","markerBorderStyle");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item28","edt_labelFontFace","value","","labelFontFace");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item30","cmb_labelFontType","value","","labelFontType");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item31","edt_labelColor","value","","labelColor");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item33","chk_switchable","value","","switchable");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item34","edt_disabledColor","value","","disabledColor");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item36","edt_labelText","value","","labelText");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item38","chk_autoMargins","value","","autoMargins");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item35","chk_useMarkerColorForLabels","value","","useMarkerColorForLabels");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item6","mae_left","value","","left");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item7","mae_width","value","","width");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item12","mae_top","value","","top");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item8","mae_marginRight","value","","marginRight");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item13","mae_marginTop","value","","marginTop");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item16","mae_marginBottom","value","","marginBottom");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item17","mae_marginLeft","value","","marginLeft");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item20","mae_spacing","value","","spacing");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item21","mae_columns","value","","columns");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item22","mae_horizontalGap","value","","horizontalGap");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item37","mae_verticalGap","value","","marginBottom");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item15","mae_borderWidth","value","","borderWidth");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item4","mae_backgroundOpacity","value","","backgroundOpacity");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item9","mae_markerLabelGap","value","","markerLabelGap");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item24","mae_markerSize","value","","markerSize");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item26","mae_markerBorderOpacity","value","","markerBorderOpacity");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item27","mae_markerBorderWidth","value","","markerBorderWidth");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item29","mae_labelFontSize","value","","labelFontSize");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item32","mae_labelWidth","value","","labelWidth");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.registerScript("ConfigLegend.xfdl", function() {

        var parent = this.parent;
        	
        this.configLegend_onload = function(obj,e)
        {
        	var bindDs,
        		dsNm = "ds_legend";
        	
        	bindDs = parent.grd_leftMenu.getBindDataset();
        	if (bindDs)
        	{
        		if (bindDs.name == "ds_pieMenu")
        		{
        			dsNm = "ds_plegend";
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
            this.addEventHandler("onload", this.configLegend_onload, this);
            this.edt_id.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.chk_show.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.cmb_valign.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.edt_borderColor.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.Static15.addEventHandler("onclick", this.Static05_onclick, this);
            this.cmb_align.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.cmb_position.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.edt_backgroundColor.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.chk_equalItemWidths.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.cmb_markerType.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.edt_markerColor.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.edt_markerBorderColor.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.cmb_markerBorderStyle.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.Static31.addEventHandler("onclick", this.Static05_onclick, this);
            this.edt_labelFontFace.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.cmb_labelFontType.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.edt_labelColor.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.chk_switchable.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.edt_disabledColor.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.edt_labelText.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.chk_autoMargins.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.chk_useMarkerColorForLabels.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_width.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_width.addEventHandler("canchange", this.common_canchage_integer, this);
            this.mae_left.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_left.addEventHandler("canchange", this.common_canchage_integer, this);
            this.mae_marginLeft.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_marginLeft.addEventHandler("canchange", this.common_canchage_integer, this);
            this.mae_top.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_top.addEventHandler("canchange", this.common_canchage_integer, this);
            this.mae_marginRight.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_marginRight.addEventHandler("canchange", this.common_canchage_integer, this);
            this.mae_marginTop.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_marginTop.addEventHandler("canchange", this.common_canchage_integer, this);
            this.mae_marginBottom.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_marginBottom.addEventHandler("canchange", this.common_canchage_integer, this);
            this.mae_spacing.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_spacing.addEventHandler("canchange", this.common_canchage_integer, this);
            this.mae_columns.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_columns.addEventHandler("canchange", this.common_canchage_integer, this);
            this.mae_horizontalGap.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_horizontalGap.addEventHandler("canchange", this.common_canchage_integer, this);
            this.mae_verticalGap.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_verticalGap.addEventHandler("canchange", this.common_canchage_integer, this);
            this.mae_backgroundOpacity.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_backgroundOpacity.addEventHandler("canchange", this.common_canchage_decimal, this);
            this.mae_borderWidth.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_borderWidth.addEventHandler("canchange", this.common_canchage_integer, this);
            this.mae_markerLabelGap.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_markerLabelGap.addEventHandler("canchange", this.common_canchage_integer, this);
            this.mae_markerSize.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_markerSize.addEventHandler("canchange", this.common_canchage_integer, this);
            this.mae_markerBorderOpacity.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_markerBorderOpacity.addEventHandler("canchange", this.common_canchage_decimal, this);
            this.mae_markerBorderWidth.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_markerBorderWidth.addEventHandler("canchange", this.common_canchage_integer, this);
            this.mae_labelFontSize.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_labelFontSize.addEventHandler("canchange", this.common_canchage_integer, this);
            this.mae_labelWidth.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_labelWidth.addEventHandler("canchange", this.common_canchage_integer, this);

        };

        this.loadIncludeScript("ConfigLegend.xfdl");

       
    };
}
)();
