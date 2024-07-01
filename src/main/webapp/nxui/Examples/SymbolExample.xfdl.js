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
                this.set_name("symbol");
                this.set_classname("EcoChartSample");
                this.set_titletext("symbol");
                this._setFormPosition(0,0,1024,723);
            }
            this.style.set_background("#ffffffff");

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_symbol", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"country\" type=\"STRING\" size=\"256\"/><Column id=\"Tokyo\" type=\"FLOAT\" size=\"256\"/><Column id=\"NewYork\" type=\"FLOAT\" size=\"256\"/><Column id=\"Berlin\" type=\"FLOAT\" size=\"256\"/><Column id=\"London\" type=\"FLOAT\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"country\">Jan</Col><Col id=\"Tokyo\">4.0</Col><Col id=\"Berlin\">-0.2</Col><Col id=\"NewYork\">-0.9</Col><Col id=\"London\">3.9</Col></Row><Row><Col id=\"country\">Feb</Col><Col id=\"Tokyo\">6.9</Col><Col id=\"Berlin\">0.8</Col><Col id=\"NewYork\">0.6</Col><Col id=\"London\">4.2</Col></Row><Row><Col id=\"country\">Mar</Col><Col id=\"Tokyo\">12.8</Col><Col id=\"Berlin\">5.7</Col><Col id=\"NewYork\">3.5</Col><Col id=\"London\">5.7</Col></Row><Row><Col id=\"country\">Apr</Col><Col id=\"Tokyo\">14.5</Col><Col id=\"Berlin\">11.3</Col><Col id=\"NewYork\">8.4</Col><Col id=\"London\">8.5</Col></Row><Row><Col id=\"country\">May</Col><Col id=\"Tokyo\">18.2</Col><Col id=\"Berlin\">17.0</Col><Col id=\"NewYork\">13.5</Col><Col id=\"London\">11.9</Col></Row><Row><Col id=\"country\">Jun</Col><Col id=\"Tokyo\">21.5</Col><Col id=\"Berlin\">22.0</Col><Col id=\"NewYork\">17.0</Col><Col id=\"London\">15.2</Col></Row><Row><Col id=\"country\">Jul</Col><Col id=\"Tokyo\">25.2</Col><Col id=\"Berlin\">24.8</Col><Col id=\"NewYork\">18.6</Col><Col id=\"London\">17.0</Col></Row><Row><Col id=\"country\">Aug</Col><Col id=\"Tokyo\">26.5</Col><Col id=\"Berlin\">24.1</Col><Col id=\"NewYork\">17.9</Col><Col id=\"London\">16.6</Col></Row><Row><Col id=\"country\">Sep</Col><Col id=\"Tokyo\">23.3</Col><Col id=\"Berlin\">20.1</Col><Col id=\"NewYork\">14.3</Col><Col id=\"London\">14.2</Col></Row><Row><Col id=\"country\">Oct</Col><Col id=\"Tokyo\">18.3</Col><Col id=\"Berlin\">14.1</Col><Col id=\"NewYork\">9.0</Col><Col id=\"London\">10.3</Col></Row><Row><Col id=\"country\">Nov</Col><Col id=\"Tokyo\">13.9</Col><Col id=\"Berlin\">8.6</Col><Col id=\"NewYork\">3.9</Col><Col id=\"London\">6.6</Col></Row><Row><Col id=\"country\">Dec</Col><Col id=\"Tokyo\">9.6</Col><Col id=\"Berlin\">2.5</Col><Col id=\"NewYork\">1.0</Col><Col id=\"London\">4.8</Col></Row></Rows>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new EcoChart("ecochart", "absolute", "20", "64", null, "444", "48", null, this);
            obj.style.set_background("#ffffffff");
            obj.style.set_border("0 solid #808080ff");
            obj.style.set_bordertype("round 15 15");
            this.addChild(obj.name, obj);

            obj = new Static("st_male", "absolute", null, "37", "111", "20", "198", null, this);
            obj.set_taborder("18");
            obj.style.set_align("right middle");
            this.addChild(obj.name, obj);

            obj = new Static("st_female", "absolute", null, "37", "94", "20", "29", null, this);
            obj.set_taborder("19");
            obj.style.set_align("right middle");
            this.addChild(obj.name, obj);

            obj = new Grid("Grid00", "absolute", "1.95%", "518", null, "168", "4.69%", null, this);
            obj.set_taborder("20");
            obj.set_binddataset("ds_symbol");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"251\"/><Column size=\"140\"/><Column size=\"140\"/><Column size=\"140\"/><Column size=\"140\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell text=\"country\"/><Cell col=\"1\" text=\"Tokyo\"/><Cell col=\"2\" text=\"NewYork\"/><Cell col=\"3\" text=\"Berlin\"/><Cell col=\"4\" text=\"London\"/></Band><Band id=\"body\"><Cell edittype=\"normal\" text=\"bind:country\"/><Cell col=\"1\" edittype=\"normal\" text=\"bind:Tokyo\"/><Cell col=\"2\" edittype=\"normal\" text=\"bind:NewYork\"/><Cell col=\"3\" edittype=\"normal\" text=\"bind:Berlin\"/><Cell col=\"4\" edittype=\"normal\" text=\"bind:London\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1.95%", "10", null, "47", "4.69%", null, this);
            obj.set_taborder("22");
            obj.set_text("Line Symbol & Series Turn Off");
            obj.set_cssclass("WF_sta_Title");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1024, 723, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("EcoChartSample");
            		p.set_titletext("symbol");
            		p.style.set_background("#ffffffff");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.registerScript("SymbolExample.xfdl", function() {

        var chart;
        	
        this.StackBarSample_onload = function(obj,e)
        {
        	this.drawChart();
        }

        
        this.drawChart = function()
        {
        	if (!chart)
        	{
        		var config = {
        			"type": "Basic",
        			"chart": {
        				"id": "symbol test",
        				"bindDataset": "ds_symbol",
        				"bindCategory": "country",
        				"plotRightBorderWidth": 1
        			},
        			"categoryAxis": {
        				"id": "categoryAxis X",
        				"autoscaleMargin": 0.09,
        				"lineColor": "#545454",
        				"tickColor": "#717a8380",
        				"tickLength": 10,
        				"labelFontSize": 9,
        				"titleFontSize": 11,
        				"titleFontType": "bold",
        				"titleMargin": 30
        			},
        			"valueAxis": [
        				{
        					"id": "ValueAxis Y",
        					"title": "Temperature (°C)",
        					"autoscaleMargin": 0.09,
        					"position": "right",
        					"tickDecimals": 1,
        					"ticks": [
        						0,
        						10,
        						18,
        						20
        					],
        					"lineColor": "#545454",
        					"tickColor": "#717a8380",
        					"tickWidth": 2,
        					"tickLength": 10,
        					"labelFontSize": 8,
        					"titleFontSize": 11,
        					"titleFontType": "bold",
        					"titleMargin": 30
        				}
        			],
        			"series": [
        				{
        					"id": "Series 1",
        					"title": "Tokyo",
        					"bindValue": "Tokyo",
        					"xaxis": "categoryAxis X",
        					"yaxis": "ValueAxis Y",
        					"showLine": true,
        					"showPoint": true,
        					"pointRadius": 7,
        					"pointOpacity": 0.8,
        					"showHighLight": true,
        					"highLightOpacity": 0.3,
        					"highLightRadius": 18
        				},
        				{
        					"id": "Series 2",
        					"title": "NewYork",
        					"bindValue": "NewYork",
        					"xaxis": "categoryAxis X",
        					"yaxis": "ValueAxis Y",
        					"showLine": true,
        					"showPoint": true,
        					"pointSymbol": "square",
        					"pointRadius": 7,
        					"pointOpacity": 0.8,
        					"showHighLight": true,
        					"highLightOpacity": 0.3,
        					"highLightRadius": 18
        				},
        				{
        					"id": "Series 3",
        					"title": "London",
        					"bindValue": "London",
        					"xaxis": "categoryAxis X",
        					"yaxis": "ValueAxis Y",
        					"showLine": true,
        					"showPoint": true,
        					"pointSymbol": "diamond",
        					"pointRadius": 7,
        					"pointOpacity": 0.8,
        					"showHighLight": true,
        					"highLightOpacity": 0.3,
        					"highLightRadius": 18
        				},
        				{
        					"id": "Series 4",
        					"title": "Berlin",
        					"bindValue": "Berlin",
        					"xaxis": "categoryAxis X",
        					"yaxis": "ValueAxis Y",
        					"showLine": true,
        					"showPoint": true,
        					"pointSymbol": "triangle",
        					"pointRadius": 7,
        					"pointOpacity": 0.8,
        					"showHighLight": true,
        					"highLightOpacity": 0.3,
        					"highLightRadius": 18
        				}
        			],
        			"legend": {
        				"position": "top",
        				"valign": "center",
        				"autoMargins": false,
        				"marginTop": 20,
        				"marginRight": 20,
        				"marginLeft": 20,
        				"labelFontSize": 10,
        				"labelFontType": "bold",
        				"markerSize": 12,
        				"columns": 4,
        				"spacing": 60,
        				"switchable": true
        			},
        			"tooltip": {
        				"text": "[%value] : [%y] °C",
        				"fontFace": "Meiryo UI",
        				"fontSize": 11,
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
        			}
        		};
        	
        		this.ecochart.set_config(config);
        	}
        	
        	chart = this.ecochart.getChart();
        	
        	this.ecochart.draw();
        }

        
        this.reset_onclick = function(obj,e)
        {

        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.StackBarSample_onload, this);

        };

        this.loadIncludeScript("SymbolExample.xfdl");

       
    };
}
)();
