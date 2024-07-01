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
                this.set_name("configValueAxis");
                this.set_classname("config_xaxis");
                this.set_titletext("ValueAxis 설정");
                this._setFormPosition(0,0,320,1405);
            }
            this.style.set_background("#d4d9dfff");

            
            // Object(Dataset, ExcelExportObject) Initialize

            
            // UI Components Initialize
            obj = new Static("Static00", "absolute", "20", "58", "150", "20", null, null, this);
            obj.set_taborder("0");
            obj.set_text("id");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_id", "absolute", "169", "56", "131", "24", null, null, this);
            obj.set_taborder("1");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_name", "absolute", "20", "11", "281", "25", null, null, this);
            obj.set_taborder("22");
            obj.set_text("ValueAxis");
            obj.style.set_font("antialias 15 Verdana, malgun gothic");
            this.addChild(obj.name, obj);

            obj = new Static("Static26", "absolute", "20", "295", null, "13", "20", null, this);
            obj.set_taborder("23");
            obj.style.set_border("2 solid #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static22", "absolute", "6.25%", "121", null, "20", "46.88%", null, this);
            obj.set_taborder("28");
            obj.set_text("tickDecimals");
            this.addChild(obj.name, obj);

            obj = new Static("Static16", "absolute", "20", "983", "150", "20", null, null, this);
            obj.set_taborder("32");
            obj.set_text("lineOpacity");
            this.addChild(obj.name, obj);

            obj = new Static("Static24", "absolute", "20", "88", "150", "20", null, null, this);
            obj.set_taborder("58");
            obj.set_text("position");
            this.addChild(obj.name, obj);

            obj = new Combo("cmb_position", "absolute", "168", "88", "131", "24", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("59");
            obj.set_innerdataset("ds_position");
            obj.set_codecolumn("code");
            obj.set_datacolumn("data");
            obj.set_value("null");

            obj = new Static("Static01", "absolute", "6.25%", "217", null, "20", "60%", null, this);
            obj.set_taborder("60");
            obj.set_text("min");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "6.25%", "249", null, "20", "60%", null, this);
            obj.set_taborder("62");
            obj.set_text("max");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "6.25%", "153", null, "20", "46.88%", null, this);
            obj.set_taborder("64");
            obj.set_text("autoscaleMargin");
            this.addChild(obj.name, obj);

            obj = new Static("Static08", "absolute", "6.25%", "317", null, "20", "46.88%", null, this);
            obj.set_taborder("74");
            obj.set_text("labelFontFace");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_labelFontFace", "absolute", "168", "315", "131", "24", null, null, this);
            obj.set_taborder("75");
            this.addChild(obj.name, obj);

            obj = new Static("Static09", "absolute", "6.25%", "346", null, "20", "46.88%", null, this);
            obj.set_taborder("76");
            obj.set_text("labelFontSize");
            this.addChild(obj.name, obj);

            obj = new Static("Static11", "absolute", "6.25%", "379", null, "20", "46.88%", null, this);
            obj.set_taborder("78");
            obj.set_text("labelFontType");
            this.addChild(obj.name, obj);

            obj = new Combo("cmb_labelFontType", "absolute", "168", "379", "131", "24", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("79");
            obj.set_innerdataset("ds_fontType");
            obj.set_codecolumn("code");
            obj.set_datacolumn("data");
            obj.set_value("null");

            obj = new Static("Static12", "absolute", "6.25%", "413", null, "20", "46.88%", null, this);
            obj.set_taborder("80");
            obj.set_text("labelColor");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_labelColor", "absolute", "168", "411", "131", "24", null, null, this);
            obj.set_taborder("81");
            this.addChild(obj.name, obj);

            obj = new Static("Static13", "absolute", "6.25%", "442", null, "20", "46.88%", null, this);
            obj.set_taborder("82");
            obj.set_text("labelRotate");
            this.addChild(obj.name, obj);

            obj = new Static("Static14", "absolute", "6.25%", "543", null, "20", "46.88%", null, this);
            obj.set_taborder("84");
            obj.set_text("title");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_title", "absolute", "169", "541", "131", "24", null, null, this);
            obj.set_taborder("85");
            this.addChild(obj.name, obj);

            obj = new Static("Static15", "absolute", "20", "575", "150", "20", null, null, this);
            obj.set_taborder("86");
            obj.set_text("titleFontFace");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_titleFontFace", "absolute", "169", "573", "131", "24", null, null, this);
            obj.set_taborder("87");
            this.addChild(obj.name, obj);

            obj = new Static("Static17", "absolute", "20", "604", "150", "20", null, null, this);
            obj.set_taborder("88");
            obj.set_text("titleFontSize");
            this.addChild(obj.name, obj);

            obj = new Static("Static18", "absolute", "20", "637", "150", "20", null, null, this);
            obj.set_taborder("90");
            obj.set_text("titleFontType");
            this.addChild(obj.name, obj);

            obj = new Combo("cmb_titleFontType", "absolute", "169", "637", "132", "24", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("91");
            obj.set_innerdataset("ds_fontType");
            obj.set_codecolumn("code");
            obj.set_datacolumn("data");

            obj = new Static("Static19", "absolute", "20", "671", "150", "20", null, null, this);
            obj.set_taborder("92");
            obj.set_text("titleFontColor");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_titleFontColor", "absolute", "169", "669", "131", "24", null, null, this);
            obj.set_taborder("93");
            this.addChild(obj.name, obj);

            obj = new Static("Static20", "absolute", "20", "700", "150", "20", null, null, this);
            obj.set_taborder("94");
            obj.set_text("tickLength");
            this.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "20", "732", "150", "20", null, null, this);
            obj.set_taborder("96");
            obj.set_text("titleMargin");
            this.addChild(obj.name, obj);

            obj = new Static("Static23", "absolute", "20", "765", "150", "20", null, null, this);
            obj.set_taborder("98");
            obj.set_text("titleHalign");
            this.addChild(obj.name, obj);

            obj = new Combo("cmb_titleHalign", "absolute", "169", "765", "132", "24", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("99");
            obj.set_innerdataset("ds_halign");
            obj.set_codecolumn("code");
            obj.set_datacolumn("data");

            obj = new Static("Static25", "absolute", "20", "797", "150", "20", null, null, this);
            obj.set_taborder("100");
            obj.set_text("titleValign");
            this.addChild(obj.name, obj);

            obj = new Combo("cmb_titleValign", "absolute", "169", "797", "132", "24", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("101");
            obj.set_innerdataset("ds_valign");
            obj.set_codecolumn("code");
            obj.set_datacolumn("data");

            obj = new Static("Static27", "absolute", "20", "831", "150", "20", null, null, this);
            obj.set_taborder("102");
            obj.set_text("titleRotate");
            this.addChild(obj.name, obj);

            obj = new CheckBox("chk_titleRotate", "absolute", "169", "829", "131", "24", null, null, this);
            obj.set_taborder("103");
            obj.set_cssclass("WF_chk_Switch");
            this.addChild(obj.name, obj);

            obj = new Static("Static28", "absolute", "19", "185", "150", "20", null, null, this);
            obj.set_taborder("104");
            obj.set_text("axisMargin");
            this.addChild(obj.name, obj);

            obj = new Static("Static29", "absolute", "20", "478", "150", "20", null, null, this);
            obj.set_taborder("107");
            obj.set_text("labelMargin");
            this.addChild(obj.name, obj);

            obj = new Static("Static33", "absolute", "20", "887", "150", "20", null, null, this);
            obj.set_taborder("114");
            obj.set_text("lineWidth");
            this.addChild(obj.name, obj);

            obj = new Combo("cmb_lineStyle", "absolute", "169", "920", "132", "24", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("116");
            obj.set_innerdataset("ds_style");
            obj.set_codecolumn("code");
            obj.set_datacolumn("data");

            obj = new Static("Static34", "absolute", "20", "920", "150", "20", null, null, this);
            obj.set_taborder("117");
            obj.set_text("lineStyle");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_lineColor", "absolute", "169", "952", "131", "24", null, null, this);
            obj.set_taborder("118");
            this.addChild(obj.name, obj);

            obj = new Static("Static35", "absolute", "20", "954", "150", "20", null, null, this);
            obj.set_taborder("119");
            obj.set_text("lineColor");
            this.addChild(obj.name, obj);

            obj = new Static("Static36", "absolute", "20", "1047", "150", "20", null, null, this);
            obj.set_taborder("120");
            obj.set_text("tickWidth");
            this.addChild(obj.name, obj);

            obj = new Static("Static37", "absolute", "20", "1080", "150", "20", null, null, this);
            obj.set_taborder("122");
            obj.set_text("tickStyle");
            this.addChild(obj.name, obj);

            obj = new Combo("cmb_tickStyle", "absolute", "169", "1080", "132", "24", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("123");
            obj.set_innerdataset("ds_style");
            obj.set_codecolumn("code");
            obj.set_datacolumn("data");

            obj = new Static("Static38", "absolute", "6.25%", "1115", null, "20", "46.88%", null, this);
            obj.set_taborder("124");
            obj.set_text("tickColor");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_tickColor", "absolute", "169", "1113", "131", "24", null, null, this);
            obj.set_taborder("125");
            this.addChild(obj.name, obj);

            obj = new Static("Static39", "absolute", "6.25%", "1150", null, "20", "46.88%", null, this);
            obj.set_taborder("126");
            obj.set_text("tickOpacity");
            this.addChild(obj.name, obj);

            obj = new Static("Static42", "absolute", "6.25%", "1253", null, "20", "46.88%", null, this);
            obj.set_taborder("132");
            obj.set_text("timeFormat");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_timeFormat", "absolute", "168", "1251", "131", "24", null, null, this);
            obj.set_taborder("133");
            this.addChild(obj.name, obj);

            obj = new Static("Static43", "absolute", "6.25%", "1290", null, "20", "46.88%", null, this);
            obj.set_taborder("134");
            obj.set_text("twelveHourClock");
            this.addChild(obj.name, obj);

            obj = new CheckBox("chk_twelveHourClock", "absolute", "168", "1288", "131", "24", null, null, this);
            obj.set_taborder("135");
            obj.set_cssclass("WF_chk_Switch");
            this.addChild(obj.name, obj);

            obj = new Static("Static44", "absolute", "6.25%", "1326", null, "20", "46.88%", null, this);
            obj.set_taborder("136");
            obj.set_text("monthCategory");
            this.addChild(obj.name, obj);

            obj = new Static("Static45", "absolute", "6.25%", "1366", null, "20", "47.19%", null, this);
            obj.set_taborder("137");
            obj.set_text("tickUnit");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_monthCategory", "absolute", "168", "1324", "131", "24", null, null, this);
            obj.set_taborder("139");
            this.addChild(obj.name, obj);

            obj = new Static("Static46", "absolute", "6.25%", "1218", null, "20", "47.19%", null, this);
            obj.set_taborder("140");
            obj.set_text("tickUnitSize");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "6.25%", "40", null, "13", "6.25%", null, this);
            obj.set_taborder("146");
            obj.style.set_border("2 solid #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "6.25%", "520", null, "13", "6.25%", null, this);
            obj.set_taborder("147");
            obj.style.set_border("2 solid #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static07", "absolute", "6.25%", "871", null, "13", "6.25%", null, this);
            obj.set_taborder("148");
            obj.style.set_border("2 solid #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static30", "absolute", "6.25%", "1192", null, "13", "6.25%", null, this);
            obj.set_taborder("149");
            obj.style.set_border("2 solid #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static31", "absolute", "6.25%", "1025", null, "13", "6.25%", null, this);
            obj.set_taborder("150");
            obj.style.set_border("2 solid #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff");
            this.addChild(obj.name, obj);

            obj = new Combo("cmb_tickUnit", "absolute", "168", "1363", "131", "24", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("151");
            obj.set_innerdataset("ds_unitType");
            obj.set_codecolumn("code");
            obj.set_datacolumn("data");

            obj = new MaskEdit("mae_tickDecimals", "absolute", "168", "119", "131", "24", null, null, this);
            obj.set_taborder("152");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_autoscaleMargin", "absolute", "168", "151", "131", "24", null, null, this);
            obj.set_taborder("153");
            obj.set_mask("0.00");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_axisMargin", "absolute", "168", "183", "131", "24", null, null, this);
            obj.set_taborder("154");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_min", "absolute", "168", "215", "131", "24", null, null, this);
            obj.set_taborder("155");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_max", "absolute", "168", "247", "131", "24", null, null, this);
            obj.set_taborder("156");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_labelFontSize", "absolute", "168", "344", "131", "24", null, null, this);
            obj.set_taborder("157");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_labelRotate", "absolute", "168", "441", "131", "24", null, null, this);
            obj.set_taborder("158");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_labelMargin", "absolute", "168", "476", "131", "24", null, null, this);
            obj.set_taborder("159");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_titleFontSize", "absolute", "169", "602", "131", "24", null, null, this);
            obj.set_taborder("160");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_tickLength", "absolute", "169", "698", "131", "24", null, null, this);
            obj.set_taborder("161");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_titleMargin", "absolute", "168", "730", "131", "24", null, null, this);
            obj.set_taborder("162");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_lineWidth", "absolute", "168", "885", "131", "24", null, null, this);
            obj.set_taborder("163");
            obj.set_mask("0.0");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_lineOpacity", "absolute", "168", "981", "131", "24", null, null, this);
            obj.set_taborder("164");
            obj.set_mask("0.0");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_tickWidth", "absolute", "168", "1045", "131", "24", null, null, this);
            obj.set_taborder("165");
            obj.set_mask("0.0");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_tickOpacity", "absolute", "168", "1148", "131", "24", null, null, this);
            obj.set_taborder("166");
            obj.set_mask("0.0");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_tickUnitSize", "absolute", "168", "1216", "131", "24", null, null, this);
            obj.set_taborder("167");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 320, 1405, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("config_xaxis");
            		p.set_titletext("ValueAxis 설정");
            		p.style.set_background("#d4d9dfff");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item1","edt_id","value","","id");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item24","cmb_position","value","","position");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item10","edt_labelFontFace","value","","labelFontFace");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item12","cmb_labelFontType","value","","labelFontType");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item13","edt_labelColor","value","","labelColor");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item15","edt_title","value","","title");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item16","edt_titleFontFace","value","","titleFontFace");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item18","cmb_titleFontType","value","","titleFontType");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item19","edt_titleFontColor","value","","titleFontColor");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item22","cmb_titleHalign","value","","titleHalign");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item23","cmb_titleValign","value","","titleValign");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item25","chk_titleRotate","value","","titleRotate");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item33","cmb_lineStyle","value","","lineStyle");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item34","edt_lineColor","value","","lineColor");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item36","cmb_tickStyle","value","","tickStyle");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item37","edt_tickColor","value","","tickColor");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item41","edt_timeFormat","value","","timeFormat");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item42","chk_twelveHourClock","value","","twelveHourClock");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item44","edt_monthCategory","value","","monthCategory");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item5","cmb_tickUnit","value","","tickUnit");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item4","mae_tickDecimals","value","","tickDecimals");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item3","mae_autoscaleMargin","value","","autoscaleMargin");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item6","mae_axisMargin","value","","axisMargin");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item0","mae_min","value","","min");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item2","mae_max","value","","max");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item7","mae_labelFontSize","value","","labelFontSize");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item9","mae_titleFontSize","value","","labelFontSize");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item11","mae_tickLength","value","","tickLength");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item14","mae_titleMargin","value","","titleMargin");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item17","mae_lineWidth","value","","lineWidth");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item8","mae_tickWidth","value","","lineWidth");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item20","mae_tickUnitSize","value","","tickUnitSize");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item21","mae_tickOpacity","value","","tickOpacity");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item26","mae_labelRotate","value","","labelRotate");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item27","mae_labelMargin","value","","labelMargin");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.registerScript("ConfigValueAxis.xfdl", function() {

        var eChart,
        	parent = this.parent;
        	
        this.configValueAxis_onload = function(obj,e)
        {	
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
        		
        		this.st_name.set_text(name);
        		dsNm = "ds_valueAxis" + seq;
        		
        		var binds = this.binds;
        		for (var i = 0, len = binds.length; i < len ; i++)
        		{
        			binds[i].datasetid = dsNm;
        			binds[i].bind();
        		}
        	}
        		var innerDs = parent.ds_position;
        	var nrow;
        	
        	var categoryAxis = parent.eChart.getCategoryAxis();
        	
        	var valueAxis = parent.eChart.getValueAxisByIndex(seq);
        	var valueAxisPosition = valueAxis.getPosition();

        	if (innerDs.rowcount > 0)
        	{
        		innerDs.clearData();
        	}
        	
        	if (categoryAxis)
        	{
        		var cAxisPosition = categoryAxis.getPosition();
        		if (cAxisPosition == "left" || cAxisPosition == "right")
        		{
        			if (valueAxisPosition == "bottom")
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
        		else if (cAxisPosition == "bottom" || cAxisPosition == "top")
        		{
        			if (valueAxisPosition == "left")
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
        	}
        	else
        	{
        		innerDs.set_enableevent(false);
        		nrow = innerDs.addRow();
        		innerDs.setColumn(nrow, "code", "bottom");
        		innerDs.setColumn(nrow, "data", "bottom");
        		
        		nrow = innerDs.addRow();
        		innerDs.setColumn(nrow, "code", "top");
        		innerDs.setColumn(nrow, "data", "top");
        		
        		nrow = innerDs.addRow();
        		innerDs.setColumn(nrow, "code", "left");
        		innerDs.setColumn(nrow, "data", "left");
        		
        		nrow = innerDs.addRow();
        		innerDs.setColumn(nrow, "code", "right");
        		innerDs.setColumn(nrow, "data", "right");	
        		innerDs.set_enableevent(true);
        	}
        }

        this.common_onsetfocus = function(obj,e)
        {
        	parent.setPropertyDesc(obj,e);
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

        this.common_canchange_decimal = function(obj,e)
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
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.configValueAxis_onload, this);
            this.edt_id.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.cmb_position.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.edt_labelFontFace.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.cmb_labelFontType.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.edt_labelColor.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.edt_title.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.edt_titleFontFace.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.cmb_titleFontType.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.edt_titleFontColor.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.cmb_titleHalign.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.cmb_titleValign.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.chk_titleRotate.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.cmb_lineStyle.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.edt_lineColor.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.cmb_tickStyle.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.edt_tickColor.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.edt_timeFormat.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.chk_twelveHourClock.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.edt_monthCategory.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.cmb_tickUnit.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_tickDecimals.addEventHandler("canchange", this.common_canchange_integer, this);
            this.mae_autoscaleMargin.addEventHandler("canchange", this.common_canchange_decimal, this);
            this.mae_axisMargin.addEventHandler("canchange", this.common_canchange_integer, this);
            this.mae_min.addEventHandler("canchange", this.common_canchange_integer, this);
            this.mae_max.addEventHandler("canchange", this.common_canchange_integer, this);
            this.mae_labelFontSize.addEventHandler("canchange", this.common_canchange_integer, this);
            this.mae_labelRotate.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_labelRotate.addEventHandler("canchange", this.common_canchage_angle, this);
            this.mae_labelMargin.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_labelMargin.addEventHandler("canchange", this.common_canchange_integer, this);
            this.mae_titleFontSize.addEventHandler("canchange", this.common_canchange_integer, this);
            this.mae_tickLength.addEventHandler("canchange", this.common_canchange_integer, this);
            this.mae_titleMargin.addEventHandler("canchange", this.common_canchange_integer, this);
            this.mae_lineWidth.addEventHandler("canchange", this.common_canchange_integer, this);
            this.mae_lineOpacity.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_lineOpacity.addEventHandler("canchange", this.common_canchange_integer, this);
            this.mae_tickWidth.addEventHandler("canchange", this.common_canchange_integer, this);
            this.mae_tickOpacity.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_tickOpacity.addEventHandler("canchange", this.common_canchange_decimal, this);
            this.mae_tickUnitSize.addEventHandler("canchange", this.common_canchange_integer, this);
            this.mae_tickUnitSize.addEventHandler("onsetfocus", this.common_onsetfocus, this);

        };

        this.loadIncludeScript("ConfigValueAxis.xfdl");

       
    };
}
)();
