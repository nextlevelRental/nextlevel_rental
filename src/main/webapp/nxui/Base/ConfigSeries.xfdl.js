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
                this.set_name("configSeries");
                this.set_classname("config_xaxis");
                this.set_titletext("Series 설정");
                this._setFormPosition(0,0,320,1780);
            }
            this.style.set_background("#d4d9dfff");

            
            // Object(Dataset, ExcelExportObject) Initialize

            
            // UI Components Initialize
            obj = new Static("Static00", "absolute", "20", "56", "150", "20", null, null, this);
            obj.set_taborder("0");
            obj.set_text("id");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_id", "absolute", "169", "54", "131", "24", null, null, this);
            obj.set_taborder("1");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "20", "152", null, "20", "150", null, this);
            obj.set_taborder("3");
            obj.set_text("bindX");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "20", "184", null, "20", "150", null, this);
            obj.set_taborder("5");
            obj.set_text("bindY");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "20", "216", null, "20", "150", null, this);
            obj.set_taborder("7");
            obj.set_text("bindValue");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "20", "250", null, "20", "150", null, this);
            obj.set_taborder("11");
            obj.set_text("title");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_title", "absolute", "169", "248", "131", "24", null, null, this);
            obj.set_taborder("12");
            this.addChild(obj.name, obj);

            obj = new Static("Static07", "absolute", "20", "312", null, "20", "150", null, this);
            obj.set_taborder("13");
            obj.set_text("tooltipText");
            this.addChild(obj.name, obj);

            obj = new Edit("dt_tooltipText", "absolute", "169", "310", "131", "24", null, null, this);
            obj.set_taborder("14");
            this.addChild(obj.name, obj);

            obj = new Static("st_name", "absolute", "20", "11", "280", "25", null, null, this);
            obj.set_taborder("22");
            obj.set_text("Series");
            obj.style.set_font("antialias 15 Verdana, malgun gothic");
            this.addChild(obj.name, obj);

            obj = new Static("Static26", "absolute", "20", "40", null, "13", "20", null, this);
            obj.set_taborder("23");
            obj.style.set_border("2 solid #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "6.25%", "344", null, "20", "46.88%", null, this);
            obj.set_taborder("26");
            obj.set_text("showLine");
            this.addChild(obj.name, obj);

            obj = new CheckBox("chk_showLine", "absolute", "169", "342", "131", "24", null, null, this);
            obj.set_taborder("27");
            obj.set_cssclass("WF_chk_Switch");
            this.addChild(obj.name, obj);

            obj = new Static("Static22", "absolute", "6.25%", "373", null, "20", "46.88%", null, this);
            obj.set_taborder("28");
            obj.set_text("lineWidth");
            this.addChild(obj.name, obj);

            obj = new Static("Static11", "absolute", "6.25%", "408", null, "20", "46.88%", null, this);
            obj.set_taborder("30");
            obj.set_text("lineColor");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_lineColor", "absolute", "169", "406", "131", "24", null, null, this);
            obj.set_taborder("31");
            this.addChild(obj.name, obj);

            obj = new Static("Static16", "absolute", "6.25%", "437", null, "20", "46.88%", null, this);
            obj.set_taborder("32");
            obj.set_text("lineOpacity");
            this.addChild(obj.name, obj);

            obj = new Static("Static08", "absolute", "6.25%", "472", null, "20", "46.88%", null, this);
            obj.set_taborder("34");
            obj.set_text("lineFill");
            this.addChild(obj.name, obj);

            obj = new CheckBox("chk_lineFill", "absolute", "169", "470", "131", "24", null, null, this);
            obj.set_taborder("35");
            obj.set_cssclass("WF_chk_Switch");
            this.addChild(obj.name, obj);

            obj = new Static("Static09", "absolute", "6.25%", "504", null, "20", "46.88%", null, this);
            obj.set_taborder("36");
            obj.set_text("lineFillGradation");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_lineFillGradation", "absolute", "169", "502", "131", "24", null, null, this);
            obj.set_taborder("37");
            this.addChild(obj.name, obj);

            obj = new Static("Static12", "absolute", "6.25%", "533", null, "20", "46.88%", null, this);
            obj.set_taborder("38");
            obj.set_text("lineFillOpacity");
            this.addChild(obj.name, obj);

            obj = new Static("Static13", "absolute", "6.25%", "568", null, "20", "46.88%", null, this);
            obj.set_taborder("40");
            obj.set_text("lineSteps");
            this.addChild(obj.name, obj);

            obj = new CheckBox("chk_lineSteps", "absolute", "169", "566", "131", "24", null, null, this);
            obj.set_taborder("41");
            obj.set_cssclass("WF_chk_Switch");
            this.addChild(obj.name, obj);

            obj = new CheckBox("chk_showBar", "absolute", "169", "627", "131", "24", null, null, this);
            obj.set_taborder("43");
            obj.set_cssclass("WF_chk_Switch");
            this.addChild(obj.name, obj);

            obj = new Static("Static17", "absolute", "20", "702", "150", "20", null, null, this);
            obj.set_taborder("46");
            obj.set_text("barLineWidth");
            this.addChild(obj.name, obj);

            obj = new Static("Static18", "absolute", "20", "735", "150", "20", null, null, this);
            obj.set_taborder("48");
            obj.set_text("barLineColor");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_barLineColor", "absolute", "169", "733", "131", "24", null, null, this);
            obj.set_taborder("49");
            this.addChild(obj.name, obj);

            obj = new Static("Static19", "absolute", "20", "767", "150", "20", null, null, this);
            obj.set_taborder("50");
            obj.set_text("barFill");
            this.addChild(obj.name, obj);

            obj = new CheckBox("chk_barFill", "absolute", "169", "765", "131", "24", null, null, this);
            obj.set_taborder("51");
            obj.set_cssclass("WF_chk_Switch");
            this.addChild(obj.name, obj);

            obj = new Static("Static20", "absolute", "20", "798", "150", "20", null, null, this);
            obj.set_taborder("52");
            obj.set_text("barWidth");
            this.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "20", "831", "150", "20", null, null, this);
            obj.set_taborder("54");
            obj.set_text("barColor");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_barColor", "absolute", "169", "829", "131", "24", null, null, this);
            obj.set_taborder("55");
            this.addChild(obj.name, obj);

            obj = new Static("Static23", "absolute", "20", "863", "150", "20", null, null, this);
            obj.set_taborder("56");
            obj.set_text("barGradation");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_barGradation", "absolute", "169", "861", "131", "24", null, null, this);
            obj.set_taborder("57");
            this.addChild(obj.name, obj);

            obj = new Static("Static24", "absolute", "20", "895", "150", "20", null, null, this);
            obj.set_taborder("58");
            obj.set_text("barAlign");
            this.addChild(obj.name, obj);

            obj = new Combo("cmb_barAlign", "absolute", "169", "893", "132", "24", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("59");
            obj.set_innerdataset("ds_halign");
            obj.set_codecolumn("code");
            obj.set_datacolumn("data");
            obj.set_value("null");

            obj = new Static("Static25", "absolute", "20", "926", "150", "20", null, null, this);
            obj.set_taborder("60");
            obj.set_text("barOpacity");
            this.addChild(obj.name, obj);

            obj = new Static("Static27", "absolute", "20", "995", "150", "20", null, null, this);
            obj.set_taborder("62");
            obj.set_text("showPoint");
            this.addChild(obj.name, obj);

            obj = new CheckBox("chk_showPoint", "absolute", "168", "993", "131", "24", null, null, this);
            obj.set_taborder("63");
            obj.set_cssclass("WF_chk_Switch");
            this.addChild(obj.name, obj);

            obj = new Static("Static28", "absolute", "20", "1024", "150", "20", null, null, this);
            obj.set_taborder("64");
            obj.set_text("pointOpacity");
            this.addChild(obj.name, obj);

            obj = new Static("Static29", "absolute", "20", "1056", "150", "20", null, null, this);
            obj.set_taborder("66");
            obj.set_text("pointLineWidth");
            this.addChild(obj.name, obj);

            obj = new Static("Static30", "absolute", "20", "1091", "150", "20", null, null, this);
            obj.set_taborder("68");
            obj.set_text("pointColor");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_pointColor", "absolute", "168", "1089", "131", "24", null, null, this);
            obj.set_taborder("69");
            this.addChild(obj.name, obj);

            obj = new Static("Static31", "absolute", "20", "1121", "150", "20", null, null, this);
            obj.set_taborder("70");
            obj.set_text("pointSymbol");
            this.addChild(obj.name, obj);

            obj = new Combo("cmb_pointSymbol", "absolute", "168", "1121", "132", "24", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("71");
            obj.set_innerdataset("ds_symbols");
            obj.set_codecolumn("code");
            obj.set_datacolumn("data");
            obj.set_value("null");

            obj = new Static("Static32", "absolute", "20", "1155", "150", "20", null, null, this);
            obj.set_taborder("72");
            obj.set_text("pointFill");
            this.addChild(obj.name, obj);

            obj = new CheckBox("chk_pointFill", "absolute", "168", "1153", "131", "24", null, null, this);
            obj.set_taborder("73");
            obj.set_cssclass("WF_chk_Switch");
            this.addChild(obj.name, obj);

            obj = new Static("Static33", "absolute", "20", "1184", "150", "20", null, null, this);
            obj.set_taborder("74");
            obj.set_text("pointRadius");
            this.addChild(obj.name, obj);

            obj = new Static("Static34", "absolute", "20", "1219", "150", "20", null, null, this);
            obj.set_taborder("76");
            obj.set_text("pointFillColor");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_pointFillColor", "absolute", "168", "1217", "131", "24", null, null, this);
            obj.set_taborder("77");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_pointFillGradation", "absolute", "168", "1249", "131", "24", null, null, this);
            obj.set_taborder("78");
            this.addChild(obj.name, obj);

            obj = new Static("Static35", "absolute", "20", "1251", "150", "20", null, null, this);
            obj.set_taborder("79");
            obj.set_text("pointFillGradation");
            this.addChild(obj.name, obj);

            obj = new Static("Static36", "absolute", "19", "1307", "150", "20", null, null, this);
            obj.set_taborder("80");
            obj.set_text("showBubble");
            this.addChild(obj.name, obj);

            obj = new CheckBox("chk_showBubble", "absolute", "168", "1305", "131", "24", null, null, this);
            obj.set_taborder("81");
            obj.set_cssclass("WF_chk_Switch");
            this.addChild(obj.name, obj);

            obj = new Static("Static37", "absolute", "20", "1336", "150", "20", null, null, this);
            obj.set_taborder("82");
            obj.set_text("bubbleLineWidth");
            this.addChild(obj.name, obj);

            obj = new Static("Static38", "absolute", "19", "1371", "150", "20", null, null, this);
            obj.set_taborder("84");
            obj.set_text("bubbleColor");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_bubbleColor", "absolute", "168", "1369", "131", "24", null, null, this);
            obj.set_taborder("85");
            this.addChild(obj.name, obj);

            obj = new Static("Static39", "absolute", "19", "1403", "150", "20", null, null, this);
            obj.set_taborder("86");
            obj.set_text("bubbleFill");
            this.addChild(obj.name, obj);

            obj = new CheckBox("chk_bubbleFill", "absolute", "168", "1401", "131", "24", null, null, this);
            obj.set_taborder("87");
            obj.set_cssclass("WF_chk_Switch");
            this.addChild(obj.name, obj);

            obj = new Static("Static40", "absolute", "19", "1435", "150", "20", null, null, this);
            obj.set_taborder("88");
            obj.set_text("bubbleFillColor");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_bubbleFillColor", "absolute", "168", "1433", "131", "24", null, null, this);
            obj.set_taborder("89");
            this.addChild(obj.name, obj);

            obj = new Static("Static41", "absolute", "20", "1464", "150", "20", null, null, this);
            obj.set_taborder("90");
            obj.set_text("bubbleOpacity");
            this.addChild(obj.name, obj);

            obj = new Static("Static42", "absolute", "19", "1499", "150", "20", null, null, this);
            obj.set_taborder("92");
            obj.set_text("bubbleFillGradation");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_bubbleFillGradation", "absolute", "168", "1497", "131", "24", null, null, this);
            obj.set_taborder("93");
            this.addChild(obj.name, obj);

            obj = new Static("Static45", "absolute", "19", "1560", "150", "20", null, null, this);
            obj.set_taborder("98");
            obj.set_text("showHighLight");
            this.addChild(obj.name, obj);

            obj = new CheckBox("chk_showHighLight", "absolute", "167", "1558", "131", "24", null, null, this);
            obj.set_taborder("99");
            obj.set_cssclass("WF_chk_Switch");
            this.addChild(obj.name, obj);

            obj = new Static("Static46", "absolute", "19", "1592", "150", "20", null, null, this);
            obj.set_taborder("100");
            obj.set_text("highLightFillColor");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_highLightFillColor", "absolute", "167", "1590", "131", "24", null, null, this);
            obj.set_taborder("101");
            this.addChild(obj.name, obj);

            obj = new Static("Static47", "absolute", "18", "1624", "150", "20", null, null, this);
            obj.set_taborder("102");
            obj.set_text("highLightColor");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_highLightColor", "absolute", "167", "1622", "131", "24", null, null, this);
            obj.set_taborder("103");
            this.addChild(obj.name, obj);

            obj = new Static("Static48", "absolute", "20", "1653", "150", "20", null, null, this);
            obj.set_taborder("105");
            obj.set_text("highLightWidth");
            this.addChild(obj.name, obj);

            obj = new Static("Static49", "absolute", "20", "1685", "150", "20", null, null, this);
            obj.set_taborder("106");
            obj.set_text("highLightOpacity");
            this.addChild(obj.name, obj);

            obj = new Static("Static50", "absolute", "20", "1717", "150", "20", null, null, this);
            obj.set_taborder("108");
            obj.set_text("highLightRadius");
            this.addChild(obj.name, obj);

            obj = new Static("Static51", "absolute", "6.25%", "88", null, "20", "46.88%", null, this);
            obj.set_taborder("110");
            obj.set_text("xaxis");
            this.addChild(obj.name, obj);

            obj = new Static("Static52", "absolute", "6.25%", "120", null, "20", "46.88%", null, this);
            obj.set_taborder("112");
            obj.set_text("yaxis");
            this.addChild(obj.name, obj);

            obj = new Combo("cmb_bindX", "absolute", "169", "150", "131", "24", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("118");
            obj.set_innerdataset("ds_basicCols");
            obj.set_codecolumn("code");
            obj.set_datacolumn("data");

            obj = new Combo("cmb_bindY", "absolute", "169", "182", "131", "24", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("119");
            obj.set_innerdataset("ds_basicCols");
            obj.set_codecolumn("code");
            obj.set_datacolumn("data");

            obj = new Combo("cmb_bindValue", "absolute", "169", "214", "131", "24", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("120");
            obj.set_innerdataset("ds_basicCols");
            obj.set_codecolumn("code");
            obj.set_datacolumn("data");

            obj = new Static("Static53", "absolute", "6.25%", "291", null, "19", "6.56%", null, this);
            obj.set_taborder("121");
            obj.style.set_border("2 solid #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static57", "absolute", "6.25%", "607", null, "13", "6.56%", null, this);
            obj.set_taborder("122");
            obj.style.set_border("2 solid #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static56", "absolute", "6.25%", "974", null, "13", "6.56%", null, this);
            obj.set_taborder("123");
            obj.style.set_border("2 solid #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static54", "absolute", "6.25%", "1289", null, "13", "6.56%", null, this);
            obj.set_taborder("124");
            obj.style.set_border("2 solid #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static55", "absolute", "6.25%", "1537", null, "13", "6.56%", null, this);
            obj.set_taborder("125");
            obj.style.set_border("2 solid #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff");
            this.addChild(obj.name, obj);

            obj = new Combo("cmb_xaxis", "absolute", "169", "86", "131", "24", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("126");
            obj.set_innerdataset("ds_innerAxis");
            obj.set_codecolumn("code");
            obj.set_datacolumn("data");

            obj = new Combo("cmb_yaxis", "absolute", "169", "118", "131", "24", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("127");
            obj.set_innerdataset("ds_innerAxis");
            obj.set_codecolumn("code");
            obj.set_datacolumn("data");

            obj = new Static("Static14", "absolute", "6.25%", "629", null, "20", "46.88%", null, this);
            obj.set_taborder("128");
            obj.set_text("showBar");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "6.25%", "664", null, "20", "46.88%", null, this);
            obj.set_taborder("129");
            obj.set_text("barHorizontal");
            this.addChild(obj.name, obj);

            obj = new CheckBox("chk_barHorizontal", "absolute", "169", "662", "131", "24", null, null, this);
            obj.set_taborder("130");
            obj.set_cssclass("WF_chk_Switch");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_lineWidth", "absolute", "169", "371", "131", "24", null, null, this);
            obj.set_taborder("131");
            obj.set_mask("0.0");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_lineOpacity", "absolute", "169", "435", "131", "24", null, null, this);
            obj.set_taborder("132");
            obj.set_mask("0.0");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_lineFillOpacity", "absolute", "169", "531", "131", "24", null, null, this);
            obj.set_taborder("133");
            obj.set_mask("0.0");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_barLineWidth", "absolute", "169", "700", "131", "24", null, null, this);
            obj.set_taborder("134");
            obj.set_mask("0.0");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_barWidth", "absolute", "169", "796", "131", "24", null, null, this);
            obj.set_taborder("135");
            obj.set_mask("0.0");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_barOpacity", "absolute", "169", "924", "131", "24", null, null, this);
            obj.set_taborder("136");
            obj.set_mask("0.0");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_pointOpacity", "absolute", "168", "1022", "131", "24", null, null, this);
            obj.set_taborder("137");
            obj.set_mask("0.0");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_pointLineWidth", "absolute", "168", "1054", "131", "24", null, null, this);
            obj.set_taborder("138");
            obj.set_mask("0.0");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_pointRadius", "absolute", "168", "1182", "131", "24", null, null, this);
            obj.set_taborder("139");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_bubbleLineWidth", "absolute", "168", "1334", "131", "24", null, null, this);
            obj.set_taborder("140");
            obj.set_mask("0.0");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_bubbleOpacity", "absolute", "168", "1462", "131", "24", null, null, this);
            obj.set_taborder("141");
            obj.set_mask("0.0");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_highLightWidth", "absolute", "167", "1651", "131", "24", null, null, this);
            obj.set_taborder("142");
            obj.set_mask("0.0");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_highLightRadius", "absolute", "167", "1715", "131", "24", null, null, this);
            obj.set_taborder("143");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_highLightOpacity", "absolute", "167", "1683", "131", "24", null, null, this);
            obj.set_taborder("144");
            obj.set_mask("0.0");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 320, 1780, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("config_xaxis");
            		p.set_titletext("Series 설정");
            		p.style.set_background("#d4d9dfff");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item1","edt_id","value","","id");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item35","edt_title","value","","title");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item36","dt_tooltipText","value","","tooltipText");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item3","chk_showLine","value","","showLine");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item15","edt_lineColor","value","","lineColor");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item4","edt_lineFillGradation","value","","lineFillGradation");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item5","edt_barLineColor","value","","barLineColor");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item6","edt_barColor","value","","barColor");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item9","chk_lineFill","value","","lineFill");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item11","chk_lineSteps","value","","lineSteps");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item25","chk_showBar","value","","showBar");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item39","chk_barFill","value","","barFill");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item41","edt_barGradation","value","","barGradation");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item24","cmb_barAlign","value","","barAlign");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item13","chk_showPoint","value","","showPoint");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item42","edt_pointColor","value","","pointColor");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item17","cmb_pointSymbol","value","","pointSymbol");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item18","chk_pointFill","value","","pointFill");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item43","edt_pointFillColor","value","","pointFillColor");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item44","edt_pointFillGradation","value","","pointFillGradation");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item20","chk_showBubble","value","","showBubble");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item45","edt_bubbleColor","value","","bubbleColor");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item22","chk_bubbleFill","value","","bubbleFill");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item46","edt_bubbleFillColor","value","","bubbleFillColor");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item47","edt_bubbleFillGradation","value","","bubbleFillGradation");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item29","chk_showHighLight","value","","showHighLight");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item48","edt_highLightFillColor","value","","highLightFillColor");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item49","edt_highLightColor","value","","highLightColor");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item50","cmb_bindX","value","","bindX");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item52","cmb_bindY","value","","bindY");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item54","cmb_bindValue","value","","bindValue");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item0","cmb_xaxis","value","","xaxis");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item2","cmb_yaxis","value","","yaxis");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item26","chk_barHorizontal","value","","barHorizontal");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item7","mae_lineFillOpacity","displaynulltext","","lineFillOpacity");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item8","mae_lineOpacity","value","","lineOpacity");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item10","mae_lineWidth","value","","lineWidth");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item12","mae_barLineWidth","value","","barLineWidth");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item27","mae_barWidth","value","","barWidth");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item33","mae_barOpacity","value","","barOpacity");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item14","mae_pointOpacity","value","","pointOpacity");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item16","mae_pointLineWidth","value","","pointLineWidth");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item19","mae_pointRadius","value","","pointRadius");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item21","mae_bubbleLineWidth","value","","bubbleLineWidth");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item23","mae_bubbleOpacity","value","","bubbleOpacity");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item28","mae_highLightWidth","value","","highLightWidth");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item30","mae_highLightRadius","value","","highLightRadius");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item31","mae_highLightOpacity","value","","highLightOpacity");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.registerScript("ConfigSeries.xfdl", function() {

        var parent = this.parent,
        	eChart;
        	
        this.configSeries_onload = function(obj,e)
        {
        	eChart = parent.eChart;
        	//trace("configSeries_onload >> ", e, eChart);
        	if (eChart.isStack)
        	{
        		this.chk_showHighLight.set_enable(false);
        		this.edt_highLightFillColor.set_enable(false);
        		this.edt_highLightColor.set_enable(false);
        		this.mae_highLightRadius.set_enable(false);
        		this.mae_highLightOpacity.set_enable(false);
        		this.mae_highLightWidth.set_enable(false);
        	}
        	
        	var bindDs,
        		seq = -1,
        		dsNm;
        	
        	bindDs = parent.grd_leftMenu.getBindDataset();
        	if (bindDs)
        	{
        		var row = -1,
        			name,
        			seq = -1;
        		
        		row = parent.leftMenuIndex;
        		name = bindDs.getColumn(row, "name");
        		seq = bindDs.getColumn(row, "seq");
        		
        		this.st_name.set_text(Eco.string.capitalize(name));
        		dsNm = "ds_series" + seq;
        		
        		var binds = this.binds;
        		for (var i = 0, len = binds.length; i < len ; i++)
        		{
        			binds[i].datasetid = dsNm;
        			binds[i].bind();
        		}
        	}
        	
        	// stack 인 경우 barHorizontal checkbox value 변경
        	var isStack = eChart.getIsStack();
        	var horizontalFlag = false;
        	
        	if (isStack)
        	{
        		var series = eChart.getAllSeries();
        		var length = series.length;
        		
        		for(var i = 0; i < length; i++)
        		{
        			var barHorizontal = series[i].barHorizontal;
        			if (barHorizontal)
        			{
        				horizontalFlag = true;
        				break;
        			}
        		}
        		
        		if (horizontalFlag)
        		{
        			this.chk_barHorizontal.set_value(true);
        		}
        		else 
        		{
        			this.chk_barHorizontal.set_value(false);
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
            this.addEventHandler("onload", this.configSeries_onload, this);
            this.edt_id.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.edt_title.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.dt_tooltipText.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.chk_showLine.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.edt_lineColor.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.chk_lineFill.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.edt_lineFillGradation.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.chk_lineSteps.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.chk_showBar.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.edt_barLineColor.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.chk_barFill.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.edt_barColor.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.edt_barGradation.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.cmb_barAlign.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.chk_showPoint.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.edt_pointColor.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.cmb_pointSymbol.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.chk_pointFill.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.edt_pointFillColor.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.edt_pointFillGradation.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.chk_showBubble.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.edt_bubbleColor.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.chk_bubbleFill.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.edt_bubbleFillColor.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.edt_bubbleFillGradation.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.chk_showHighLight.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.edt_highLightFillColor.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.edt_highLightColor.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.cmb_bindX.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.cmb_bindY.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.cmb_bindValue.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.cmb_xaxis.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.cmb_yaxis.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.chk_barHorizontal.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_lineWidth.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_lineWidth.addEventHandler("canchange", this.common_canchage_integer, this);
            this.mae_lineOpacity.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_lineOpacity.addEventHandler("canchange", this.common_canchage_decimal, this);
            this.mae_lineFillOpacity.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_lineFillOpacity.addEventHandler("canchange", this.common_canchage_decimal, this);
            this.mae_barLineWidth.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_barLineWidth.addEventHandler("canchange", this.common_canchage_integer, this);
            this.mae_barWidth.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_barWidth.addEventHandler("canchange", this.common_canchage_decimal, this);
            this.mae_barOpacity.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_barOpacity.addEventHandler("canchange", this.common_canchage_decimal, this);
            this.mae_pointOpacity.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_pointOpacity.addEventHandler("canchange", this.common_canchage_decimal, this);
            this.mae_pointLineWidth.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_pointLineWidth.addEventHandler("canchange", this.common_canchage_integer, this);
            this.mae_pointRadius.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_pointRadius.addEventHandler("canchange", this.common_canchage_integer, this);
            this.mae_bubbleLineWidth.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_bubbleLineWidth.addEventHandler("canchange", this.common_canchage_integer, this);
            this.mae_bubbleOpacity.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_bubbleOpacity.addEventHandler("canchange", this.common_canchage_decimal, this);
            this.mae_highLightWidth.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_highLightWidth.addEventHandler("canchange", this.common_canchage_integer, this);
            this.mae_highLightRadius.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_highLightRadius.addEventHandler("canchange", this.common_canchage_integer, this);
            this.mae_highLightOpacity.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_highLightOpacity.addEventHandler("canchange", this.common_canchage_decimal, this);

        };

        this.loadIncludeScript("ConfigSeries.xfdl");

       
    };
}
)();
