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
                this.set_name("scatter");
                this.set_classname("EcoChartSample");
                this.set_titletext("scatter");
                this._setFormPosition(0,0,1024,723);
            }
            this.style.set_background("#ffffffff");

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_scatter2", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"x\" type=\"FLOAT\" size=\"256\"/><Column id=\"y\" type=\"FLOAT\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_scatter1", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"x\" type=\"FLOAT\" size=\"256\"/><Column id=\"y\" type=\"FLOAT\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_scatter", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"index\" type=\"STRING\" size=\"256\"/><Column id=\"series1_x\" type=\"FLOAT\" size=\"256\"/><Column id=\"series1_y\" type=\"FLOAT\" size=\"256\"/><Column id=\"series2_x\" type=\"FLOAT\" size=\"256\"/><Column id=\"series2_y\" type=\"FLOAT\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static01", "absolute", "86.62%", "92", null, "20", "4.2%", null, this);
            obj.set_taborder("24");
            obj.set_text("Female");
            obj.style.set_font("normal 10 Meiryo UI, malgun gothic");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "70.12%", "92", null, "20", "20.7%", null, this);
            obj.set_taborder("25");
            obj.set_text("Male");
            obj.style.set_font("normal 10 Meiryo UI, malgun gothic");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_series2", "absolute", "83.11%", "119", null, "586", "1.27%", null, this);
            obj.set_taborder("26");
            obj.set_binddataset("ds_scatter2");
            obj.set_scrollbars("autovert");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"80\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell text=\"Income\"/><Cell col=\"1\" text=\"Expense\"/></Band><Band id=\"body\"><Cell text=\"bind:x\"/><Cell col=\"1\" text=\"bind:y\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_series1", "absolute", "65.63%", "120", null, "586", "18.75%", null, this);
            obj.set_taborder("27");
            obj.set_binddataset("ds_scatter1");
            obj.set_scrollbars("autovert");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"80\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell text=\"Income\"/><Cell col=\"1\" text=\"Expense\"/></Band><Band id=\"body\"><Cell text=\"bind:x\"/><Cell col=\"1\" text=\"bind:y\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "1.95%", "10", null, "47", "4.69%", null, this);
            obj.set_taborder("28");
            obj.set_text("ScatterPlot & Selection");
            obj.set_cssclass("WF_sta_Title");
            this.addChild(obj.name, obj);

            obj = new EcoChart("ecochart", "absolute", "3.52%", "118", null, "586", "36.33%", null, this);
            obj.style.set_background("#ffffffff");
            obj.style.set_border("0 solid #808080ff");
            obj.style.set_bordertype("round 15 15");
            this.addChild(obj.name, obj);

            obj = new Static("st_male", "absolute", "74.02%", "92", null, "20", "19.82%", null, this);
            obj.set_taborder("30");
            obj.style.set_border("1 solid #808080ff");
            obj.style.set_color("red");
            obj.style.set_align("center middle");
            obj.style.set_font("bold 10 Meiryo UI, malgun gothic");
            this.addChild(obj.name, obj);

            obj = new Static("st_female", "absolute", "91.8%", "92", null, "20", "2.05%", null, this);
            obj.set_taborder("31");
            obj.style.set_border("1 solid #808080ff");
            obj.style.set_color("red");
            obj.style.set_align("center middle");
            obj.style.set_font("bold 10 Meiryo UI, malgun gothic");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "3.61%", "84", null, "25", "87.5%", null, this);
            obj.set_taborder("32");
            obj.set_text("Fixed Income");
            this.addChild(obj.name, obj);

            obj = new Edit("Edit00", "absolute", "12.01%", "84", null, "23", "77.25%", null, this);
            obj.set_taborder("33");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "24.02%", "84", null, "25", "70.21%", null, this);
            obj.set_taborder("34");
            obj.set_text("Expense");
            this.addChild(obj.name, obj);

            obj = new Edit("Edit01", "absolute", "29.49%", "84", null, "23", "59.77%", null, this);
            obj.set_taborder("35");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1024, 723, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("EcoChartSample");
            		p.set_titletext("scatter");
            		p.style.set_background("#ffffffff");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.registerScript("ScatterplotExample.xfdl", function() {

        var chart,
        	xaxis,
        	yaxis,
        	selection,
        	maleSeries;
        	

        this.scatter_onload = function(obj,e)
        {
        	this.setSeriesData();
        	this.drawChart();
        }

        this.setSeriesData = function()
        {
        	var series1_x,
        		series1_y,
        		series2_x,
        		series2_y,
        		row = -1,
        		maxrow = 200,
        		dsSeries = this.ds_scatter,
        		dsSeries1 = this.ds_scatter1,
        		dsSeries2 = this.ds_scatter2;

        	dsSeries.deleteAll();
        	dsSeries1.deleteAll();
        	dsSeries2.deleteAll();
        	
        	for (var i = 0; i < maxrow; i++)
        	{
        		series1_x = nexacro.round(Math.random() * 1050) + 550;
        		series1_y = nexacro.round(Math.random() * 850) + 650;
        		series2_x = nexacro.round(Math.random() * 750) + 350;
        		series2_y = nexacro.round(Math.random() * 650) + 550;
        		
        		row = dsSeries.addRow();
        		dsSeries.setColumn(row, "index", row);
        		dsSeries.setColumn(row, "series1_x", series1_x);
        		dsSeries.setColumn(row, "series1_y", series1_y);
        		dsSeries.setColumn(row, "series2_x", series2_x);
        		dsSeries.setColumn(row, "series2_y", series2_y);
        				
        		row = dsSeries1.addRow();
        		dsSeries1.setColumn(row, "x", series1_x);
        		dsSeries1.setColumn(row, "y", series1_y);

        		row = dsSeries2.addRow();
        		dsSeries2.setColumn(row, "x", series2_x);
        		dsSeries2.setColumn(row, "y", series2_y);
        	}
        }

        this.drawChart = function()
        {
        	if (!this.chart)
        	{
        		var config = {
        			"type": "Basic",
        			"chart": {
        				"id": "scatterplot chart",
        				"bindDataset": "ds_scatter",
        				"bindCategory": "index"
        			},
        			"valueAxis": [
        				{
        					"id": "ValueAxis X",
        					"title": "Fixed Income",
        					"position": "bottom",
        					"autoscaleMargin": 0.05,
        					"setLineWidth": 1,
        					"lineColor": "#717a8380",
        					"tickColor": "#717a8380",
        					"tickWidth": 1,
        					"labelFontSize": 10,
        					"labelFontType": "bold",
        					"titleFontSize": 11,
        					"titleFontType": "bold",
        					"titleMargin": 30
        				},
        				{
        					"id": "ValueAxis Y",
        					"title": "Expense",
        					"position": "left",
        					"autoscaleMargin": 0.05,
        					"setLineWidth": 1,
        					"lineColor": "#717a8380",
        					"tickColor": "#717a8380",
        					"tickWidth": 1,
        					"labelFontSize": 10,
        					"labelFontType": "bold",
        					"titleFontSize": 11,
        					"titleFontType": "bold",
        					"titleMargin": 30
        				}
        			],
        			"series": [
        				{
        					"id": "Series 1",
        					"title": "Male",
        					"bindX": "series1_x",
        					"bindY": "series1_y",
        					"xaxis": "ValueAxis X",
        					"yaxis": "ValueAxis Y",
        					"showPoint": true,
        					"pointLineWidth": 0.1,
        					"pointRadius": 5,
        					"pointColor": "#1bc366",
        					"pointFillColor": "#bcd200",
        					"pointOpacity": 1,
        					"showHighLight": true,
        					"highLightWidth": 2,
        					"highLightFillColor": "#bcd2004c",
        					"highLightColor": "#1bc366",
        					"highLightOpacity": 1,
        					"highLightRadius": 9,
        					"events": {
        						"onmousedblclick": this.onmousedbclickseries,
        						"onmouseenter": this.onmouseenterseries,
        						"onmouseleave": this.onmouseleaveseries
        					}
        				},
        				{
        					"id": "Series 2",
        					"title": "Female",
        					"bindX": "series2_x",
        					"bindY": "series2_y",
        					"xaxis": "ValueAxis X",
        					"yaxis": "ValueAxis Y",
        					"showPoint": true,
        					"pointSymbol": "diamond",
        					"pointLineWidth": 0.1,
        					"pointRadius": 5,
        					"pointColor": "#1a59bf",
        					"pointFillColor": "#1abd9c",
        					"pointOpacity": 1,
        					"showHighLight": true,
        					"highLightWidth": 2,
        					"highLightFillColor": "#1abd9c4c",
        					"highLightColor": "#1a59bf",
        					"highLightOpacity": 1,
        					"highLightRadius": 9,
        					"events": {
        						"onmousedblclick": this.onmousedbclickseries,
        						"onmouseenter": this.onmouseenterseries,
        						"onmouseleave": this.onmouseleaveseries
        					}
        				}
        			],
        			"legend": {
        				"position": "bottom",
        				"autoMargins": false,
        				"marginTop": 0,
        				"marginLeft": 100,
        				"labelFontSize": 10,
        				"labelFontType": "bold",
        				"markerSize": 16,
        				"columns": 2,
        				"spacing": 40
        			},
        			"tooltip": {
        				"text": "Fixed Income: [%x]\nExpense: [%y]",
        				"fontFace": "Meiryo UI",
        				"fontSize": 10,
        				"fontType": "bold",
        				"fontColor": "#ffffff",
        				"borderWidth": 1,
        				"borderStyle": "solid",
        				"borderColor": "#717a83",
        				"color": "#717a83cc",
        				"opacity": 1,
        				"hookWidth": 10,
        				"hookHeight": 10,
        				"offsetX": 0,
        				"offsetY": 20
        			},
        			"selection": {
        				"mode": "xy",
        				//"zoom": true,
        				"events": {
        					//"onselecting": this.onselectingselection,
        					"onselected": this.onselectedselection,
        					//"onunselected": this.onunselectedselection
        				}
        			}
        		};
        	
        		this.ecochart.set_config(config);
        	}
        	
        	this.ecochart.draw();
        	
        	this.chart = this.ecochart.getChart();
        	selection = this.ecochart.getSelection();
        }

        

        this.onmouseenterseries = function(obj,e)
        {
        	//trace("onmouseenterseries", obj, e, this);
        	this.Edit00.set_value(e.data.x);
        	this.Edit01.set_value(e.data.y);
        }

        this.onmouseleaveseries = function(obj,e)
        {
        	//trace("onmouseleaveseries", obj, e, this);
        	this.Edit00.set_value("");
        	this.Edit01.set_value("");
        }

        this.onmousedbclickseries = function(obj,e)
        {
        // 	trace("onmousedbclickseries", obj, e, this);
         	alert("Fixed Income: " + e.data.x + "\nExpense: " + e.data.y);
        }

        this.onselectingselection = function(obj,e)
        {
        //	trace("onselectingselection", obj, e, this);
        }

        this.onselectedselection = function(obj,e)
        {
        // 	trace("onselectedselection", obj, e,this);
        // 	trace("ranges", e.ranges);
        	
        	var ranges = e.ranges,
        		xaxis = ranges.xaxis,
        		yaxis = ranges.yaxis,
        		xFrom, xTo,
        		yFrom, yTo,
        		filters = "";
        	
        	if (xaxis && yaxis)
        	{
        		this.grd_series1.set_enableevent(false);
        		this.grd_series2.set_enableevent(false);
        		
        		xFrom = xaxis.from;
        		xTo = xaxis.to;
        		yFrom = yaxis.from;
        		yTo = yaxis.to;
        		
        		filters = "x >= " + xFrom;
        		filters += " && x <= " + xTo;
        		filters += " && y >= " + yFrom;
        		filters += " && y <= " + yTo;
        		
        		//trace("filters", filters);
        		this.ds_scatter1.filter(filters);
        		
        		xFrom = xaxis.from;
        		xTo = xaxis.to;
        		yFrom = yaxis.from;
        		yTo = yaxis.to;
        		
        		filters = "x >= " + xFrom;
        		filters += " && x <= " + xTo;
        		filters += " && y >= " + yFrom;
        		filters += " && y <= " + yTo;
        		
        		//trace("filters", filters);
        		this.ds_scatter2.filter(filters);
        		
        		this.grd_series1.set_enableevent(true);
        		this.grd_series2.set_enableevent(true);
        		
        		this.st_male.set_text(this.ds_scatter1.getRowCount());
        		this.st_female.set_text(this.ds_scatter2.getRowCount());
        	}
        }

        this.onunselectedselection = function(obj,e)
        {
        	//trace("onunselectedselection", obj, e, this);
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.scatter_onload, this);
            this.Static04.addEventHandler("onclick", this.Static04_onclick, this);

        };

        this.loadIncludeScript("ScatterplotExample.xfdl");

       
    };
}
)();
