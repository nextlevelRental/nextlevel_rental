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
                this.set_name("configBasic");
                this.set_classname("config_xaxis");
                this.set_titletext("Basic 차트 설정");
                this._setFormPosition(0,0,320,917);
            }
            this.style.set_background("#d4d9dfff");

            
            // Object(Dataset, ExcelExportObject) Initialize

            
            // UI Components Initialize
            obj = new Static("Static01", "absolute", "20", "11", "114", "25", null, null, this);
            obj.set_taborder("2");
            obj.set_text("Basic");
            obj.style.set_font("antialias 15 Verdana, malgun gothic");
            this.addChild(obj.name, obj);

            obj = new Static("Static261", "absolute", "20", "40", "280", "13", null, null, this);
            obj.set_taborder("64");
            obj.style.set_border("2 solid #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff");
            this.addChild(obj.name, obj);

            obj = new Combo("cmb_colors", "absolute", "173", "118", "132", "24", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("69");
            obj.set_codecolumn("code");
            obj.set_datacolumn("data");

            obj = new Static("Static13", "absolute", "6.25%", "368", null, "20", "46.88%", null, this);
            obj.set_taborder("71");
            obj.set_text("plotBackgroundOpacity");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_plotBackgroundGradation", "absolute", "173", "334", "131", "24", null, null, this);
            obj.set_taborder("72");
            this.addChild(obj.name, obj);

            obj = new Static("Static12", "absolute", "6.25%", "336", null, "20", "46.88%", null, this);
            obj.set_taborder("73");
            obj.set_text("plotBackgroundGradation");
            obj.style.set_font("antialias 9 Meiryo UI, malgun gothic");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_plotBackgroundColor", "absolute", "173", "302", "131", "24", null, null, this);
            obj.set_taborder("74");
            this.addChild(obj.name, obj);

            obj = new Static("Static11", "absolute", "6.25%", "304", null, "20", "46.88%", null, this);
            obj.set_taborder("75");
            obj.set_text("plotBackgroundColor");
            this.addChild(obj.name, obj);

            obj = new Static("Static10", "absolute", "6.25%", "184", null, "20", "46.88%", null, this);
            obj.set_taborder("76");
            obj.set_text("showFullPlot");
            this.addChild(obj.name, obj);

            obj = new Static("Static09", "absolute", "6.25%", "152", null, "20", "46.88%", null, this);
            obj.set_taborder("77");
            obj.set_text("margin");
            this.addChild(obj.name, obj);

            obj = new Static("Static08", "absolute", "6.25%", "120", null, "20", "46.88%", null, this);
            obj.set_taborder("78");
            obj.set_text("colors");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "6.25%", "88", null, "20", "46.88%", null, this);
            obj.set_taborder("84");
            obj.set_text("bindCategory");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_id", "absolute", "173", "54", "131", "24", null, null, this);
            obj.set_taborder("89");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "6.25%", "56", null, "20", "46.88%", null, this);
            obj.set_taborder("90");
            obj.set_text("id");
            this.addChild(obj.name, obj);

            obj = new Static("Static14", "absolute", "6.25%", "397", null, "20", "46.88%", null, this);
            obj.set_taborder("91");
            obj.set_text("plotLeftBorderWidth");
            this.addChild(obj.name, obj);

            obj = new Static("Static15", "absolute", "6.25%", "653", null, "20", "46.88%", null, this);
            obj.set_taborder("92");
            obj.set_text("plotLeftBorderColor");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_plotLeftBorderColor", "absolute", "173", "653", "131", "24", null, null, this);
            obj.set_taborder("93");
            this.addChild(obj.name, obj);

            obj = new Static("Static26", "absolute", "6.25%", "429", null, "20", "46.88%", null, this);
            obj.set_taborder("94");
            obj.set_text("plotRightBorderWidth");
            this.addChild(obj.name, obj);

            obj = new Static("Static27", "absolute", "6.25%", "461", null, "20", "46.88%", null, this);
            obj.set_taborder("95");
            obj.set_text("plotTopBorderWidth");
            this.addChild(obj.name, obj);

            obj = new Static("Static28", "absolute", "6.25%", "493", null, "20", "46.88%", null, this);
            obj.set_taborder("96");
            obj.set_text("plotBottomBorderWidth");
            this.addChild(obj.name, obj);

            obj = new Static("Static29", "absolute", "6.25%", "525", null, "20", "46.88%", null, this);
            obj.set_taborder("97");
            obj.set_text("plotLeftBorderStyle");
            this.addChild(obj.name, obj);

            obj = new Static("Static30", "absolute", "6.25%", "557", null, "20", "46.88%", null, this);
            obj.set_taborder("98");
            obj.set_text("plotRightBorderStyle");
            this.addChild(obj.name, obj);

            obj = new Static("Static31", "absolute", "6.25%", "589", null, "20", "46.88%", null, this);
            obj.set_taborder("99");
            obj.set_text("plotTopBorderStyle");
            this.addChild(obj.name, obj);

            obj = new Static("Static32", "absolute", "6.25%", "621", null, "20", "46.88%", null, this);
            obj.set_taborder("100");
            obj.set_text("plotBottomBorderStyle");
            this.addChild(obj.name, obj);

            obj = new Static("Static33", "absolute", "6.25%", "685", null, "20", "46.88%", null, this);
            obj.set_taborder("101");
            obj.set_text("plotRightBorderColor");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_plotRightBorderColor", "absolute", "173", "685", "131", "24", null, null, this);
            obj.set_taborder("102");
            this.addChild(obj.name, obj);

            obj = new Static("Static34", "absolute", "6.25%", "717", null, "20", "46.88%", null, this);
            obj.set_taborder("103");
            obj.set_text("plotTopBorderColor");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_plotTopBorderColor", "absolute", "173", "717", "131", "24", null, null, this);
            obj.set_taborder("104");
            this.addChild(obj.name, obj);

            obj = new Static("Static35", "absolute", "6.25%", "749", null, "20", "46.88%", null, this);
            obj.set_taborder("105");
            obj.set_text("plotBottomBorderColor");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_plotBottomBorderColor", "absolute", "173", "749", "131", "24", null, null, this);
            obj.set_taborder("106");
            this.addChild(obj.name, obj);

            obj = new Combo("cmb_plotLeftBorderStyle", "absolute", "173", "525", "131", "24", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("111");
            obj.set_innerdataset("ds_style");
            obj.set_codecolumn("code");
            obj.set_datacolumn("data");

            obj = new Combo("cmb_plotRightBorderStyle", "absolute", "173", "557", "131", "24", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("112");
            obj.set_innerdataset("ds_style");
            obj.set_codecolumn("code");
            obj.set_datacolumn("data");

            obj = new Combo("cmb_plotTopBorderStyle", "absolute", "173", "589", "131", "24", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("113");
            obj.set_innerdataset("ds_style");
            obj.set_codecolumn("code");
            obj.set_datacolumn("data");

            obj = new Combo("cmb_plotBottomBorderStyle", "absolute", "173", "621", "131", "24", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("114");
            obj.set_innerdataset("ds_style");
            obj.set_codecolumn("code");
            obj.set_datacolumn("data");

            obj = new Static("Static16", "absolute", "6.25%", "781", null, "20", "46.88%", null, this);
            obj.set_taborder("115");
            obj.set_text("plotLeftBorderOpacity");
            this.addChild(obj.name, obj);

            obj = new Static("Static19", "absolute", "6.25%", "218", null, "20", "46.88%", null, this);
            obj.set_taborder("119");
            obj.set_text("isStack");
            this.addChild(obj.name, obj);

            obj = new Static("Static20", "absolute", "6.25%", "250", null, "20", "46.88%", null, this);
            obj.set_taborder("120");
            obj.set_text("isTimeData");
            this.addChild(obj.name, obj);

            obj = new Static("Static36", "absolute", "6.25%", "813", null, "20", "46.88%", null, this);
            obj.set_taborder("134");
            obj.set_text("plotRightBorderOpacity");
            this.addChild(obj.name, obj);

            obj = new Static("Static37", "absolute", "6.25%", "845", null, "20", "46.88%", null, this);
            obj.set_taborder("136");
            obj.set_text("plotTopBorderOpacity");
            this.addChild(obj.name, obj);

            obj = new Static("Static38", "absolute", "6.25%", "877", null, "20", "46.88%", null, this);
            obj.set_taborder("138");
            obj.set_text("plotBottomBorderOpacity");
            obj.style.set_font("antialias 9 Meiryo UI, malgun gothic");
            this.addChild(obj.name, obj);

            obj = new CheckBox("chk_showFullPlot", "absolute", "173", "182", "65", "24", null, null, this);
            obj.set_taborder("141");
            obj.set_cssclass("WF_chk_Switch");
            this.addChild(obj.name, obj);

            obj = new CheckBox("chk_isStack", "absolute", "173", "218", "131", "24", null, null, this);
            obj.set_taborder("143");
            obj.set_cssclass("WF_chk_Switch");
            this.addChild(obj.name, obj);

            obj = new CheckBox("chk_isTimeData", "absolute", "173", "250", "131", "24", null, null, this);
            obj.set_taborder("144");
            obj.set_cssclass("WF_chk_Switch");
            this.addChild(obj.name, obj);

            obj = new Combo("cmb_bindCategory", "absolute", "173", "86", "130", "24", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("147");
            obj.set_codecolumn("code");
            obj.set_datacolumn("data");
            obj.set_value("null");

            obj = new Static("Static02", "absolute", "6.25%", "287", null, "13", "6.25%", null, this);
            obj.set_taborder("148");
            obj.style.set_border("2 solid #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff,0 none #93a6c0ff");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_plotBackgroundOpacity", "absolute", "173", "366", "131", "24", null, null, this);
            obj.set_taborder("149");
            obj.set_mask("0.0");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_plotLeftBorderOpacity", "absolute", "173", "779", "131", "24", null, null, this);
            obj.set_taborder("150");
            obj.set_mask("0.0");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_plotRightBorderOpacity", "absolute", "173", "811", "131", "24", null, null, this);
            obj.set_taborder("155");
            obj.set_mask("0.0");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_plotTopBorderOpacity", "absolute", "173", "843", "131", "24", null, null, this);
            obj.set_taborder("156");
            obj.set_mask("0.0");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_plotBottomBorderOpacity", "absolute", "173", "875", "131", "24", null, null, this);
            obj.set_taborder("157");
            obj.set_mask("0.0");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_margin", "absolute", "173", "150", "131", "24", null, null, this);
            obj.set_taborder("158");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_plotLeftBorderWidth", "absolute", "172", "395", "131", "24", null, null, this);
            obj.set_taborder("159");
            obj.set_limitbymask("decimal");
            obj.set_mask("0.0");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_plotRightBorderWidth", "absolute", "172", "427", "131", "24", null, null, this);
            obj.set_taborder("160");
            obj.set_limitbymask("decimal");
            obj.set_mask("0.0");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_plotTopBorderWidth", "absolute", "172", "459", "131", "24", null, null, this);
            obj.set_taborder("161");
            obj.set_limitbymask("decimal");
            obj.set_mask("0.0");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("mae_plotBottomBorderWidth", "absolute", "172", "491", "131", "24", null, null, this);
            obj.set_taborder("162");
            obj.set_mask("0.0");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 320, 917, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("config_xaxis");
            		p.set_titletext("Basic 차트 설정");
            		p.style.set_background("#d4d9dfff");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item0","edt_id","value","ds_chart","id");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item10","edt_plotBackgroundColor","value","ds_chart","plotBackgroundColor");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item11","edt_plotBackgroundGradation","value","ds_chart","plotBackgroundGradation");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item8","cmb_colors","value","ds_chart","colors");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item14","edt_plotLeftBorderColor","value","ds_chart","plotLeftBorderColor");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item32","edt_plotRightBorderColor","value","ds_chart","plotRightBorderColor");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item33","edt_plotTopBorderColor","value","ds_chart","plotTopBorderColor");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item34","edt_plotBottomBorderColor","value","ds_chart","plotBottomBorderColor");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item22","cmb_plotLeftBorderStyle","value","ds_chart","plotLeftBorderStyle");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item26","cmb_plotRightBorderStyle","value","ds_chart","plotRightBorderStyle");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item27","cmb_plotTopBorderStyle","value","ds_chart","plotTopBorderStyle");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item41","cmb_plotBottomBorderStyle","value","ds_chart","plotBottomBorderStyle");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item28","chk_showFullPlot","value","ds_chart","showFullPlot");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item30","chk_isStack","value","ds_chart","isStack");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item31","chk_isTimeData","value","ds_chart","isTimeData");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item2","cmb_bindCategory","value","ds_chart","bindCategory");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item1","mae_plotBackgroundOpacity","value","ds_chart","plotBackgroundOpacity");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item3","mae_plotLeftBorderOpacity","value","ds_chart","plotLeftBorderOpacity");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item12","mae_plotRightBorderOpacity","value","ds_chart","plotRightBorderOpacity");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item13","mae_plotTopBorderOpacity","value","ds_chart","plotTopBorderOpacity");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item15","mae_plotBottomBorderOpacity","value","ds_chart","plotBottomBorderOpacity");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item9","mae_margin","value","ds_chart","margin");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item4","mae_plotLeftBorderWidth","value","ds_chart","plotLeftBorderWidth");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item5","mae_plotRightBorderWidth","value","ds_chart","plotRightBorderWidth");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item6","mae_plotTopBorderWidth","value","ds_chart","plotTopBorderWidth");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item7","mae_plotBottomBorderWidth","value","ds_chart","plotBottomBorderWidth");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.registerScript("ConfigBasic.xfdl", function() {

        var eChart,
        	parent;

        this.configBasic_onload = function(obj,e)
        {
        	parent = this.parent;
        	eChart = parent.eChart;
        	
        	this.setDsCols();
        	this.setDsAxis();
        	this.setDsColor();
        	this.setGrid();
        }

        this.setDsCols = function()
        {	
        	var bindDsId,
        		bindDs,
        		dsBasicCols,
        		dsColCnt = -1,
        		nrow = -1,
        		colInfo,
        		colName;
        	
        	dsBasicCols = parent.ds_basicCols;
        	this.cmb_bindCategory.set_innerdataset(dsBasicCols);
        	
        	if (dsBasicCols && dsBasicCols.getRowCount() > 0)
        	{
        		return;
        	}
        	
        	bindDsId = parent.basicBindDs;
        	bindDs = Eco.XComp.lookup(parent, bindDsId);
        	
        	dsColCnt = bindDs.getColCount();
        	for (var i = 0; i < dsColCnt; i++)
        	{
        		colInfo = bindDs.getColumnInfo(i);
        		colName = colInfo.name;
        		nrow = dsBasicCols.addRow();
        		dsBasicCols.setColumn(nrow, "code", colName);
        		dsBasicCols.setColumn(nrow, "data", colName);
        	}
        }

        this.setDsAxis = function()
        {
        	var dsInnerAxis,
        		axes,
        		id,
        		nrow = -1;
        	
        	dsInnerAxis = parent.ds_innerAxis;
        	if (dsInnerAxis && dsInnerAxis.getRowCount() > 0)
        	{
        		return;
        	}
        	
        	axes = eChart.getAllAxes();
        	Eco.array.forEach(axes, function(obj, index) {
        		if (obj["id"])
        		{
        			id = obj["id"];
        			nrow = dsInnerAxis.addRow();
        			dsInnerAxis.setColumn(nrow, "code", id);
        			dsInnerAxis.setColumn(nrow, "data", id);
        		}
        	}, this);
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
        		gridPie,
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
        		
        	grid = parent.tab_info.tpg_data.grd_basic;
        	gridPie = parent.tab_info.tpg_data.grd_pie;
        	gridPie.set_visible(false);
        	grid.set_visible(true);
        	
        	colCnt = grid.getFormatColCount();
        	if (colCnt < 1)
        	{
        		grid.set_enableevent(false);
        		
        		bindDsId = parent.basicBindDs;
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
        		
        		formats = "<Format id=\"basic\">";
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
            this.addEventHandler("onload", this.configBasic_onload, this);
            this.cmb_colors.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.edt_plotBackgroundGradation.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.edt_plotBackgroundColor.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.edt_id.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.edt_plotLeftBorderColor.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.edt_plotRightBorderColor.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.edt_plotTopBorderColor.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.edt_plotBottomBorderColor.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.cmb_plotLeftBorderStyle.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.cmb_plotRightBorderStyle.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.cmb_plotTopBorderStyle.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.cmb_plotBottomBorderStyle.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.chk_showFullPlot.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.chk_isStack.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.chk_isTimeData.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.cmb_bindCategory.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_plotBackgroundOpacity.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_plotBackgroundOpacity.addEventHandler("canchange", this.common_canchage_decimal, this);
            this.mae_plotLeftBorderOpacity.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_plotLeftBorderOpacity.addEventHandler("canchange", this.common_canchage_decimal, this);
            this.mae_plotRightBorderOpacity.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_plotRightBorderOpacity.addEventHandler("canchange", this.common_canchage_decimal, this);
            this.mae_plotTopBorderOpacity.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_plotTopBorderOpacity.addEventHandler("canchange", this.common_canchage_decimal, this);
            this.mae_plotBottomBorderOpacity.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_plotBottomBorderOpacity.addEventHandler("canchange", this.common_canchage_decimal, this);
            this.mae_margin.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_margin.addEventHandler("canchange", this.common_canchange_integer, this);
            this.mae_plotLeftBorderWidth.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_plotLeftBorderWidth.addEventHandler("canchange", this.common_canchange_integer, this);
            this.mae_plotRightBorderWidth.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_plotRightBorderWidth.addEventHandler("canchange", this.common_canchange_integer, this);
            this.mae_plotTopBorderWidth.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_plotTopBorderWidth.addEventHandler("canchange", this.common_canchange_integer, this);
            this.mae_plotBottomBorderWidth.addEventHandler("onsetfocus", this.common_onsetfocus, this);
            this.mae_plotBottomBorderWidth.addEventHandler("canchange", this.common_canchange_integer, this);

        };

        this.loadIncludeScript("ConfigBasic.xfdl");

       
    };
}
)();
