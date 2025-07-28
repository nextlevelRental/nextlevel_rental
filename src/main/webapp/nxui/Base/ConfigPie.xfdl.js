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
                this.set_name("configPie");
                this.set_classname("config_xaxis");
                this.set_titletext("Pie 차트 설정");
                this._setFormPosition(0,0,320,1594);
            }
            this.style.set_background("#d4d9dfff");
            this.getSetter("layoutautofittype").set("default");

            
            // Object(Dataset, ExcelExportObject) Initialize

            
            // UI Components Initialize
            obj = new Static("Static01", "absolute", "20", "11", "114", "25", null, null, this);
            obj.set_taborder("2");
            obj.set_text("Pie");
            obj.style.set_background("transparent");
            obj.style.set_font("antialias 15 Verdana, malgun gothic");
            this.addChild(obj.name, obj);

            obj = new Static("Static261", "absolute", "20", "40", "280", "13", null, null, this);
            obj.set_taborder("95");
            obj.style.set_border("2 solid #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static13", "absolute", "6.25%", "1038", null, "20", "46.88%", null, this);
            obj.set_taborder("101");
            obj.set_text("plotBackgroundOpacity");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_plotBackgroundGradation", "absolute", "52.81%", "1004", null, "24", "6.25%", null, this);
            obj.set_taborder("102");
            this.addChild(obj.name, obj);

            obj = new Static("Static12", "absolute", "6.25%", "1006", null, "20", "46.88%", null, this);
            obj.set_taborder("103");
            obj.set_text("plotBackgroundGradation");
            obj.style.set_font("antialias 8 Meiryo UI, malgun gothic");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_plotBackgroundColor", "absolute", "52.81%", "972", null, "24", "6.25%", null, this);
            obj.set_taborder("104");
            this.addChild(obj.name, obj);

            obj = new Static("Static11", "absolute", "6.25%", "974", null, "20", "46.88%", null, this);
            obj.set_taborder("105");
            obj.set_text("plotBackgroundColor");
            this.addChild(obj.name, obj);

            obj = new Static("Static09", "absolute", "6.25%", "183", null, "20", "46.88%", null, this);
            obj.set_taborder("107");
            obj.set_text("margin");
            this.addChild(obj.name, obj);

            obj = new Static("Static14", "absolute", "6.25%", "1072", null, "20", "46.88%", null, this);
            obj.set_taborder("119");
            obj.set_text("plotLeftBorderWidth");
            this.addChild(obj.name, obj);

            obj = new Static("Static15", "absolute", "6.25%", "1328", null, "20", "46.88%", null, this);
            obj.set_taborder("120");
            obj.set_text("plotLeftBorderColor");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_plotLeftBorderColor", "absolute", "52.81%", "1328", null, "24", "6.25%", null, this);
            obj.set_taborder("121");
            this.addChild(obj.name, obj);

            obj = new Static("Static26", "absolute", "6.25%", "1104", null, "20", "46.88%", null, this);
            obj.set_taborder("122");
            obj.set_text("plotRightBorderWidth");
            this.addChild(obj.name, obj);

            obj = new Static("Static27", "absolute", "6.25%", "1136", null, "20", "46.88%", null, this);
            obj.set_taborder("123");
            obj.set_text("plotTopBorderWidth");
            this.addChild(obj.name, obj);

            obj = new Static("Static28", "absolute", "6.25%", "1168", null, "20", "46.88%", null, this);
            obj.set_taborder("124");
            obj.set_text("plotBottomBorderWidth");
            this.addChild(obj.name, obj);

            obj = new Static("Static29", "absolute", "6.25%", "1200", null, "20", "46.88%", null, this);
            obj.set_taborder("125");
            obj.set_text("plotLeftBorderStyle");
            this.addChild(obj.name, obj);

            obj = new Static("Static30", "absolute", "6.25%", "1232", null, "20", "46.88%", null, this);
            obj.set_taborder("126");
            obj.set_text("plotRightBorderStyle");
            this.addChild(obj.name, obj);

            obj = new Static("Static31", "absolute", "6.25%", "1264", null, "20", "46.88%", null, this);
            obj.set_taborder("127");
            obj.set_text("plotTopBorderStyle");
            this.addChild(obj.name, obj);

            obj = new Static("Static32", "absolute", "6.25%", "1296", null, "20", "46.88%", null, this);
            obj.set_taborder("128");
            obj.set_text("plotBottomBorderStyle");
            this.addChild(obj.name, obj);

            obj = new Static("Static33", "absolute", "6.25%", "1360", null, "20", "46.88%", null, this);
            obj.set_taborder("129");
            obj.set_text("plotRightBorderColor");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_plotRightBorderColor", "absolute", "52.81%", "1360", null, "24", "6.25%", null, this);
            obj.set_taborder("130");
            this.addChild(obj.name, obj);

            obj = new Static("Static34", "absolute", "6.25%", "1392", null, "20", "46.88%", null, this);
            obj.set_taborder("131");
            obj.set_text("plotTopBorderColor");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_plotTopBorderColor", "absolute", "52.81%", "1392", null, "24", "6.25%", null, this);
            obj.set_taborder("132");
            this.addChild(obj.name, obj);

            obj = new Static("Static35", "absolute", "6.25%", "1424", null, "20", "46.88%", null, this);
            obj.set_taborder("133");
            obj.set_text("plotBottomBorderColor");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_plotBottomBorderColor", "absolute", "52.81%", "1424", null, "24", "6.25%", null, this);
            obj.set_taborder("134");
            this.addChild(obj.name, obj);

            obj = new Combo("cmb_plotLeftBorderStyle", "absolute", "52.81%", "1200", null, "24", "6.25%", null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("139");
            obj.set_innerdataset("ds_style");
            obj.set_codecolumn("code");
            obj.set_datacolumn("data");

            obj = new Combo("cmb_plotRightBorderStyle", "absolute", "52.81%", "1232", null, "24", "6.25%", null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("140");
            obj.set_innerdataset("ds_style");
            obj.set_codecolumn("code");
            obj.set_datacolumn("data");

            obj = new Combo("cmb_plotTopBorderStyle", "absolute", "52.81%", "1264", null, "24", "6.25%", null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("141");
            obj.set_innerdataset("ds_style");
            obj.set_codecolumn("code");
            obj.set_datacolumn("data");

            obj = new Combo("cmb_plotBottomBorderStyle", "absolute", "52.81%", "1296", null, "24", "6.25%", null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("142");
            obj.set_innerdataset("ds_style");
            obj.set_codecolumn("code");
            obj.set_datacolumn("data");

            obj = new Static("Static16", "absolute", "6.25%", "1456", null, "20", "46.88%", null, this);
            obj.set_taborder("143");
            obj.set_text("plotLeftBorderOpacity");
            this.addChild(obj.name, obj);

            obj = new Static("Static36", "absolute", "6.25%", "1488", null, "20", "46.88%", null, this);
            obj.set_taborder("145");
            obj.set_text("plotRightBorderOpacity");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "6.25%", "56", null, "20", "46.88%", null, this);
            obj.set_taborder("148");
            obj.set_text("id");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_id", "absolute", "52.5%", "54", null, "24", "6.56%", null, this);
            obj.set_taborder("149");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("Static37", "absolute", "6.25%", "1520", null, "20", "46.88%", null, this);
            obj.set_taborder("150");
            obj.set_text("plotTopBorderOpacity");
            this.addChild(obj.name, obj);

            obj = new Static("Static38", "absolute", "6.25%", "1552", null, "20", "46.88%", null, this);
            obj.set_taborder("152");
            obj.set_text("plotBottomBorderOpacity");
            obj.style.set_font("antialias 8 Meiryo UI, malgun gothic");
            this.addChild(obj.name, obj);

            obj = new Static("Static19", "absolute", "20", "222", "280", "13", null, null, this);
            obj.set_taborder("158");
            obj.style.set_border("2 solid #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static23", "absolute", "6.25%", "492", null, "20", "46.88%", null, this);
            obj.set_taborder("162");
            obj.set_text("labelShow");
            this.addChild(obj.name, obj);

            obj = new Static("Static24", "absolute", "6.25%", "563", null, "20", "46.88%", null, this);
            obj.set_taborder("163");
            obj.set_text("labelFontFace");
            this.addChild(obj.name, obj);

            obj = new Static("Static25", "absolute", "6.25%", "527", null, "20", "46.88%", null, this);
            obj.set_taborder("164");
            obj.set_text("labelRadius");
            this.addChild(obj.name, obj);

            obj = new Static("Static39", "absolute", "6.25%", "599", null, "20", "46.88%", null, this);
            obj.set_taborder("165");
            obj.set_text("labelFontSize");
            this.addChild(obj.name, obj);

            obj = new Static("Static40", "absolute", "6.25%", "635", null, "20", "46.88%", null, this);
            obj.set_taborder("166");
            obj.set_text("labelFontType");
            this.addChild(obj.name, obj);

            obj = new Static("Static41", "absolute", "6.25%", "671", null, "20", "46.88%", null, this);
            obj.set_taborder("167");
            obj.set_text("labelColor");
            this.addChild(obj.name, obj);

            obj = new Static("Static20", "absolute", "6.25%", "239", null, "20", "46.88%", null, this);
            obj.set_taborder("168");
            obj.set_text("radius");
            this.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "6.25%", "275", null, "20", "46.88%", null, this);
            obj.set_taborder("169");
            obj.set_text("innerRadius");
            this.addChild(obj.name, obj);

            obj = new Static("Static42", "absolute", "6.25%", "313", null, "20", "47.5%", null, this);
            obj.set_taborder("170");
            obj.set_text("borderWidth");
            this.addChild(obj.name, obj);

            obj = new Static("Static43", "absolute", "6.25%", "349", null, "20", "47.5%", null, this);
            obj.set_taborder("171");
            obj.set_text("borderColor");
            this.addChild(obj.name, obj);

            obj = new Static("Static44", "absolute", "6.25%", "382", null, "20", "47.5%", null, this);
            obj.set_taborder("172");
            obj.set_text("opacity");
            this.addChild(obj.name, obj);

            obj = new Static("Static45", "absolute", "6.25%", "838", null, "20", "46.88%", null, this);
            obj.set_taborder("173");
            obj.set_text("highLightFillColor");
            this.addChild(obj.name, obj);

            obj = new Static("Static47", "absolute", "6.25%", "802", null, "20", "46.88%", null, this);
            obj.set_taborder("175");
            obj.set_text("showHighLight");
            this.addChild(obj.name, obj);

            obj = new Static("Static48", "absolute", "6.25%", "910", null, "20", "46.88%", null, this);
            obj.set_taborder("176");
            obj.set_text("highLightRadius");
            this.addChild(obj.name, obj);

            obj = new Static("Static49", "absolute", "6.25%", "874", null, "20", "46.88%", null, this);
            obj.set_taborder("177");
            obj.set_text("highLightOpacity");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_labelFontFace", "absolute", "52.19%", "563", null, "24", "6.88%", null, this);
            obj.set_taborder("183");
            this.addChild(obj.name, obj);

            obj = new Combo("cmb_labelFontType", "absolute", "52.19%", "635", null, "24", "6.88%", null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("185");
            obj.set_innerdataset("@ds_fontType");
            obj.set_codecolumn("code");
            obj.set_datacolumn("data");

            obj = new Edit("edt_labelColor", "absolute", "52.19%", "671", null, "24", "6.88%", null, this);
            obj.set_taborder("189");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_borderColor", "absolute", "52.19%", "349", null, "24", "7.5%", null, this);
            obj.set_taborder("190");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_highLightFillColor", "absolute", "52.19%", "835", null, "24", "6.88%", null, this);
            obj.set_taborder("193");
            this.addChild(obj.name, obj);

            obj = new Static("Static46", "absolute", "6.25%", "703", null, "20", "46.88%", null, this);
            obj.set_taborder("196");
            obj.set_text("labelWordwrap");
            this.addChild(obj.name, obj);

            obj = new Static("Static50", "absolute", "6.25%", "739", null, "20", "46.88%", null, this);
            obj.set_taborder("197");
            obj.set_text("labelMaxWidth");
            this.addChild(obj.name, obj);

            obj = new Static("Static51", "absolute", "6.25%", "776", null, "13", "6.25%", null, this);
            obj.set_taborder("202");
            obj.style.set_border("2 solid #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static53", "absolute", "6.25%", "464", null, "13", "6.25%", null, this);
            obj.set_taborder("204");
            obj.style.set_border("2 solid #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static54", "absolute", "6.25%", "423", null, "20", "47.5%", null, this);
            obj.set_taborder("207");
            obj.set_text("tilt");
            this.addChild(obj.name, obj);

            obj = new CheckBox("chk_showFullPlot01", "absolute", "52.5%", "488", null, "24", "27.19%", null, this);
            obj.set_taborder("210");
            obj.set_cssclass("WF_chk_Switch");
            this.addChild(obj.name, obj);

            obj = new CheckBox("chk_showFullPlot03", "absolute", "52.81%", "796", null, "24", "26.88%", null, this);
            obj.set_taborder("213");
            obj.set_cssclass("WF_chk_Switch");
            this.addChild(obj.name, obj);

            obj = new CheckBox("chk_showFullPlot04", "absolute", "52.81%", "704", null, "24", "26.88%", null, this);
            obj.set_taborder("214");
            obj.set_cssclass("WF_chk_Switch");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "6.25%", "88", null, "20", "46.88%", null, this);
            obj.set_taborder("215");
            obj.set_text("bindCategory");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "6.25%", "119", null, "20", "46.88%", null, this);
            obj.set_taborder("216");
            obj.set_text("bindValue");
            this.addChild(obj.name, obj);

            obj = new Combo("cmb_bindCategory", "absolute", "52.5%", "86", null, "24", "6.56%", null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("217");
            obj.set_codecolumn("code");
            obj.set_datacolumn("data");

            obj = new Combo("cmb_bindValue", "absolute", "52.5%", "117", null, "24", "6.56%", null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("218");
            obj.set_innerdataset("ds_pieCols");
            obj.set_codecolumn("code");
            obj.set_datacolumn("data");

            obj = new Static("Static04", "absolute", "6.25%", "151", null, "20", "46.88%", null, this);
            obj.set_taborder("219");
            obj.set_text("colors");
            this.addChild(obj.name, obj);

            obj = new Combo("cmb_colors", "absolute", "52.5%", "149", null, "24", "6.25%", null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("220");
            obj.set_codecolumn("code");
            obj.set_datacolumn("data");

            obj = new Static("Static05", "absolute", "6.25%", "951", null, "13", "6.25%", null, this);
            obj.set_taborder("221");
            obj.style.set_border("2 solid #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_margin", "absolute", "52.5%", "181", null, "24", "6.56%", null, this);
            obj.set_taborder("222");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_radius", "absolute", "52.5%", "237", null, "24", "7.19%", null, this);
            obj.set_taborder("223");
            obj.set_mask("0.0");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_innerRadius", "absolute", "52.5%", "273", null, "24", "7.19%", null, this);
            obj.set_taborder("224");
            obj.set_mask("0.0");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_borderWidth", "absolute", "52.5%", "311", null, "24", "6.56%", null, this);
            obj.set_taborder("225");
            obj.set_mask("0.0");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_opacity", "absolute", "52.19%", "383", null, "24", "7.5%", null, this);
            obj.set_taborder("226");
            obj.set_mask("0.0");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_tilt", "absolute", "52.19%", "421", null, "24", "7.5%", null, this);
            obj.set_taborder("227");
            obj.set_mask("0.0");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_labelRadius", "absolute", "52.5%", "523", null, "24", "7.19%", null, this);
            obj.set_taborder("228");
            obj.set_mask("0.0");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_labelFontSize", "absolute", "52.19%", "597", null, "24", "6.88%", null, this);
            obj.set_taborder("229");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_labelMaxWidth", "absolute", "52.81%", "737", null, "24", "6.25%", null, this);
            obj.set_taborder("230");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_highLightOpacity", "absolute", "52.19%", "866", null, "24", "7.5%", null, this);
            obj.set_taborder("231");
            obj.set_mask("0.0");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_highLightRadius", "absolute", "52.19%", "902", null, "24", "7.5%", null, this);
            obj.set_taborder("232");
            obj.set_mask("0.0");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_plotBackgroundOpacity", "absolute", "52.81%", "1036", null, "24", "6.88%", null, this);
            obj.set_taborder("233");
            obj.set_mask("0.0");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_plotLeftBorderWidth", "absolute", "52.81%", "1070", null, "24", "6.25%", null, this);
            obj.set_taborder("234");
            obj.set_mask("0.0");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_plotRightBorderWidth", "absolute", "52.81%", "1102", null, "24", "6.25%", null, this);
            obj.set_taborder("235");
            obj.set_mask("0.0");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("plotBottomBorderWidth", "absolute", "52.81%", "1166", null, "24", "6.25%", null, this);
            obj.set_taborder("236");
            obj.set_mask("0.0");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_plotTopBorderWidth", "absolute", "52.81%", "1134", null, "24", "6.25%", null, this);
            obj.set_taborder("237");
            obj.set_mask("0.0");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_plotLeftBorderOpacity", "absolute", "52.81%", "1454", null, "24", "6.88%", null, this);
            obj.set_taborder("238");
            obj.set_mask("0.0");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_plotRightBorderOpacity", "absolute", "52.81%", "1486", null, "24", "6.88%", null, this);
            obj.set_taborder("239");
            obj.set_mask("0.0");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_plotTopBorderOpacity", "absolute", "52.81%", "1518", null, "24", "6.88%", null, this);
            obj.set_taborder("240");
            obj.set_mask("0.0");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_plotBottomBorderOpacity", "absolute", "52.81%", "1550", null, "24", "6.88%", null, this);
            obj.set_taborder("241");
            obj.set_mask("0.0");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 320, 1594, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("config_xaxis");
            		p.set_titletext("Pie 차트 설정");
            		p.style.set_background("#d4d9dfff");
            		p.getSetter("layoutautofittype").set("default");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item11","edt_plotBackgroundGradation","value","ds_pchart","plotBackgroundGradation");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item10","edt_plotBackgroundColor","value","ds_pchart","plotBackgroundColor");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item14","edt_plotLeftBorderColor","value","ds_pchart","plotLeftBorderColor");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item32","edt_plotRightBorderColor","value","ds_pchart","plotRightBorderColor");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item33","edt_plotTopBorderColor","value","ds_pchart","plotTopBorderColor");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item34","edt_plotBottomBorderColor","value","ds_pchart","plotBottomBorderColor");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item22","cmb_plotLeftBorderStyle","value","ds_pchart","plotLeftBorderStyle");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item26","cmb_plotRightBorderStyle","value","ds_pchart","plotRightBorderStyle");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item27","cmb_plotTopBorderStyle","value","ds_pchart","plotTopBorderStyle");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item41","cmb_plotBottomBorderStyle","value","ds_pchart","plotBottomBorderStyle");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item0","edt_id","value","ds_pchart","id");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item19","edt_labelFontFace","value","ds_pchart","labelFontFace");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item21","cmb_labelFontType","value","ds_pchart","labelFontType");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item23","edt_labelColor","value","ds_pchart","labelColor");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item31","edt_borderColor","value","ds_pchart","borderColor");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item44","edt_highLightFillColor","value","ds_pchart","highLightFillColor");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item29","chk_showFullPlot01","value","ds_pchart","labelShow");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item28","chk_showFullPlot03","value","ds_pchart","showHighLight");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item48","chk_showFullPlot04","value","ds_pchart","labelWordwrap");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item2","cmb_bindCategory","value","ds_pchart","bindCategory");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item1","cmb_bindValue","value","ds_pchart","bindValue");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item3","cmb_colors","value","ds_pchart","colors");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item9","mae_margin","value","ds_pchart","margin");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item4","mae_radius","value","ds_pchart","radius");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item5","mae_borderWidth","value","ds_pchart","borderWidth");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item6","mae_innerRadius","value","ds_pchart","innerRadius");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item7","mae_opacity","value","ds_pchart","innerRadius");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item8","mae_tilt","value","ds_pchart","tilt");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item15","mae_labelRadius","value","ds_pchart","labelRadius");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item16","mae_labelFontSize","value","ds_pchart","labelFontSize");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item17","mae_labelMaxWidth","value","ds_pchart","labelMaxWidth");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item18","mae_highLightOpacity","value","ds_pchart","highLightOpacity");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item20","mae_highLightRadius","value","ds_pchart","highLightRadius");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item12","mae_plotBackgroundOpacity","value","ds_pchart","plotBackgroundOpacity");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item13","mae_plotLeftBorderWidth","value","ds_pchart","plotLeftBorderWidth");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item24","mae_plotRightBorderWidth","value","ds_pchart","plotRightBorderWidth");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item30","plotBottomBorderWidth","value","ds_pchart","plotBottomBorderWidth");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item38","mae_plotTopBorderWidth","value","ds_pchart","plotTopBorderWidth");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item25","mae_plotLeftBorderOpacity","value","ds_pchart","plotLeftBorderOpacity");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item35","mae_plotRightBorderOpacity","value","ds_pchart","plotRightBorderOpacity");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item36","mae_plotTopBorderOpacity","value","ds_pchart","plotTopBorderOpacity");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item37","mae_plotBottomBorderOpacity","value","ds_pchart","plotBottomBorderOpacity");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.registerScript("ConfigPie.xfdl", function() {

        var eChart,
        	parent;

        this.configPie_onload = function(obj,e)
        {
        	parent = this.parent;
        	eChart = parent.eChart;
        	
        	this.setDsCols();
        	this.setDsColor();
        	this.setGrid();
        }

        this.setDsCols = function()
        {	
        	var bindDsId,
        		bindDs,
        		dsPieCols,
        		dsColCnt = -1,
        		nrow = -1,
        		colInfo,
        		colName;
        	
        	dsPieCols = parent.ds_pieCols;
        	this.cmb_bindCategory.set_innerdataset(dsPieCols);
        	
        	if (dsPieCols && dsPieCols.getRowCount() > 0)
        	{
        		return;
        	}
        	
        	bindDsId = parent.pieBindDs;
        	bindDs = Eco.XComp.lookup(parent, bindDsId);
        	
        	dsColCnt = bindDs.getColCount();
        	for (var i = 0; i < dsColCnt; i++)
        	{
        		colInfo = bindDs.getColumnInfo(i);
        		colName = colInfo.name;
        		nrow = dsPieCols.addRow();
        		dsPieCols.setColumn(nrow, "code", colName);
        		dsPieCols.setColumn(nrow, "data", colName);
        	}
        }

        this.setDsColor = function()
        {	
        	var colors,
        		dsColors,
        		nrow = -1;
        	
        	dsColors = parent.ds_colors;
        	this.cmb_colors.set_innerdataset(dsColors);
        	
        	if (dsColors && dsColors.getRowCount() > 0)
        	{
        		return;
        	}
        	
        	colors = eChart.getColorsCategory();
        	//trace("colors", colors);
        	
        	Eco.array.forEach(colors, function(obj, index) {
        		Eco.object.Each(obj, function(prop, val, object) {
        			if (prop == "id")
        			{
        				nrow = dsColors.addRow();
        				dsColors.setColumn(nrow, "code", val);
        				dsColors.setColumn(nrow, "data", val);
        				return false;
        			}
        		}, this);
        	}, this);
        }

        this.setGrid = function()
        {
        	var grid,
        		gridBasic,
        		formats = "",
        		formatCols = "",
        		formatHeads = "",
        		formatBodys = "",
        		dsColCnt = -1,
        		bindDsId,
        		bindDs,
        		colInfo,
        		colName,
        		colCnt = 0;
        	
        	grid = parent.tab_info.tpg_data.grd_pie;
        	gridBasic = parent.tab_info.tpg_data.grd_basic;
        	gridBasic.set_visible(false);
        	grid.set_visible(true);
        	
        	colCnt = grid.getFormatColCount();
        	if (colCnt < 1)
        	{
        		grid.set_enableevent(false);
        		
        		bindDsId = parent.pieBindDs;
        		bindDs = Eco.XComp.lookup(parent, bindDsId);
        		
        		dsColCnt = bindDs.getColCount();
        		for (var i = 0; i < dsColCnt; i++)
        		{
        			formatCols += "<Column size=\"100\"/>";
        			
        			colInfo = bindDs.getColumnInfo(i);
        			colName = colInfo.name;
        			
        			formatHeads += "<Cell col=\"";
        			formatHeads += i;
        			formatHeads += "\" row=\"0\" displaytype=\"normal\" edittype=\"expand\" text=\"";
        			formatHeads += colName;
        			formatHeads += "\" expandimage=\"";
        			formatHeads += parent.imgDelCol;
        			formatHeads += "\" expandshow=\"show\" expandsize=\"";
        			formatHeads += parent.imgDelColSize;
        			formatHeads += "\"/>";
        			
        			formatBodys += "<Cell col=\"";
        			formatBodys += i;
        			formatBodys += "\" row=\"0\" displaytype=\"normal\" edittype=\"normal\" text=\"bind:";
        			formatBodys += colName;
        			formatBodys += "\"/>";
        		}
        		
        		formats = "<Format id=\"pie\">";
        		formats += "<Columns>";
        		formats += formatCols
        		formats += "</Columns>";
        		formats += "<Rows>";
        		formats += "<Row band=\"head\" size=\"26\"/>";
        		formats += "<Row band=\"body\" size=\"26\"/>";
        		formats += "</Rows>";
        		formats += "<Band id=\"head\">";
        		formats += formatHeads;
        		formats += "</Band>";
        		formats += "<Band id=\"body\">";
        		formats += formatBodys;
        		formats += "</Band>";
        		formats += "</Format>";
        		
        		grid.set_formats(formats);
        		grid.setBindDataset(bindDs);
        		grid.set_enableevent(true);
        		
        		//trace(grid.getFormatString());
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
            this.addEventHandler("onload", this.configPie_onload, this);
            this.edt_plotBackgroundGradation.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.edt_plotBackgroundColor.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.edt_plotLeftBorderColor.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.edt_plotRightBorderColor.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.edt_plotTopBorderColor.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.edt_plotBottomBorderColor.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.cmb_plotLeftBorderStyle.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.cmb_plotRightBorderStyle.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.cmb_plotTopBorderStyle.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.cmb_plotBottomBorderStyle.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.edt_id.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.edt_labelFontFace.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.cmb_labelFontType.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.edt_labelColor.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.edt_borderColor.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.edt_highLightFillColor.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.chk_showFullPlot01.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.chk_showFullPlot03.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.chk_showFullPlot04.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.cmb_bindCategory.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.cmb_bindValue.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.cmb_colors.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_margin.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_margin.addEventHandler("canchange", this.common_canchage_integer, this);
            this.mae_margin.addEventHandler("ontextchange", this.mae_margin_ontextchange, this);
            this.mae_margin.addEventHandler("ontextchanged", this.mae_margin_ontextchanged, this);
            this.mae_radius.addEventHandler("canchange", this.common_canchage_decimal, this);
            this.mae_innerRadius.addEventHandler("canchange", this.common_canchage_decimal, this);
            this.mae_borderWidth.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_borderWidth.addEventHandler("canchange", this.common_canchage_integer, this);
            this.mae_borderWidth.addEventHandler("ontextchange", this.mae_margin_ontextchange, this);
            this.mae_borderWidth.addEventHandler("ontextchanged", this.mae_margin_ontextchanged, this);
            this.mae_opacity.addEventHandler("canchange", this.common_canchage_decimal, this);
            this.mae_tilt.addEventHandler("canchange", this.common_canchage_decimal, this);
            this.mae_labelRadius.addEventHandler("canchange", this.common_canchage_decimal, this);
            this.mae_labelFontSize.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_labelFontSize.addEventHandler("canchange", this.common_canchage_integer, this);
            this.mae_labelFontSize.addEventHandler("ontextchange", this.mae_margin_ontextchange, this);
            this.mae_labelFontSize.addEventHandler("ontextchanged", this.mae_margin_ontextchanged, this);
            this.mae_labelMaxWidth.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_labelMaxWidth.addEventHandler("canchange", this.common_canchage_integer, this);
            this.mae_labelMaxWidth.addEventHandler("ontextchange", this.mae_margin_ontextchange, this);
            this.mae_labelMaxWidth.addEventHandler("ontextchanged", this.mae_margin_ontextchanged, this);
            this.mae_highLightOpacity.addEventHandler("canchange", this.common_canchage_decimal, this);
            this.mae_highLightRadius.addEventHandler("canchange", this.common_canchage_decimal, this);
            this.mae_plotBackgroundOpacity.addEventHandler("canchange", this.common_canchage_decimal, this);
            this.mae_plotLeftBorderWidth.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_plotLeftBorderWidth.addEventHandler("canchange", this.common_canchage_integer, this);
            this.mae_plotLeftBorderWidth.addEventHandler("ontextchange", this.mae_margin_ontextchange, this);
            this.mae_plotLeftBorderWidth.addEventHandler("ontextchanged", this.mae_margin_ontextchanged, this);
            this.mae_plotRightBorderWidth.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_plotRightBorderWidth.addEventHandler("canchange", this.common_canchage_integer, this);
            this.mae_plotRightBorderWidth.addEventHandler("ontextchange", this.mae_margin_ontextchange, this);
            this.mae_plotRightBorderWidth.addEventHandler("ontextchanged", this.mae_margin_ontextchanged, this);
            this.plotBottomBorderWidth.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.plotBottomBorderWidth.addEventHandler("canchange", this.common_canchage_integer, this);
            this.plotBottomBorderWidth.addEventHandler("ontextchange", this.mae_margin_ontextchange, this);
            this.plotBottomBorderWidth.addEventHandler("ontextchanged", this.mae_margin_ontextchanged, this);
            this.mae_plotTopBorderWidth.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_plotTopBorderWidth.addEventHandler("canchange", this.common_canchage_integer, this);
            this.mae_plotTopBorderWidth.addEventHandler("ontextchange", this.mae_margin_ontextchange, this);
            this.mae_plotTopBorderWidth.addEventHandler("ontextchanged", this.mae_margin_ontextchanged, this);
            this.mae_plotLeftBorderOpacity.addEventHandler("canchange", this.common_canchage_decimal, this);
            this.mae_plotRightBorderOpacity.addEventHandler("canchange", this.common_canchage_decimal, this);
            this.mae_plotTopBorderOpacity.addEventHandler("canchange", this.common_canchage_decimal, this);
            this.mae_plotBottomBorderOpacity.addEventHandler("canchange", this.common_canchage_decimal, this);

        };

        this.loadIncludeScript("ConfigPie.xfdl");

       
    };
}
)();
