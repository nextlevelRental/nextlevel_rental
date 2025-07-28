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
                this.set_name("multiaxis");
                this.set_classname("EcoChartSample");
                this.set_titletext("multiaxis");
                this._setFormPosition(0,0,1024,723);
            }
            this.style.set_background("#ffffffff");

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_weather", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"month\" type=\"STRING\" size=\"256\"/><Column id=\"rainfall\" type=\"FLOAT\" size=\"256\"/><Column id=\"temperature\" type=\"FLOAT\" size=\"256\"/><Column id=\"pressure\" type=\"FLOAT\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"month\">12/Jan</Col><Col id=\"rainfall\">49.9</Col><Col id=\"temperature\">7.0</Col><Col id=\"pressure\">1016</Col></Row><Row><Col id=\"month\">12/Feb</Col><Col id=\"rainfall\">71.5</Col><Col id=\"temperature\">6.9</Col><Col id=\"pressure\">1016</Col></Row><Row><Col id=\"month\">12/Mar</Col><Col id=\"rainfall\">106.4</Col><Col id=\"temperature\">9.5</Col><Col id=\"pressure\">1015.9</Col></Row><Row><Col id=\"month\">12/Apr</Col><Col id=\"rainfall\">129.2</Col><Col id=\"temperature\">14.5</Col><Col id=\"pressure\">1015.5</Col></Row><Row><Col id=\"month\">12/May</Col><Col id=\"rainfall\">144.0</Col><Col id=\"temperature\">18.2</Col><Col id=\"pressure\">1012.3</Col></Row><Row><Col id=\"month\">12/Jun</Col><Col id=\"rainfall\">176.0</Col><Col id=\"temperature\">21.5</Col><Col id=\"pressure\">1009.5</Col></Row><Row><Col id=\"month\">12/Jul</Col><Col id=\"rainfall\">135.6</Col><Col id=\"temperature\">25.2</Col><Col id=\"pressure\">1009.6</Col></Row><Row><Col id=\"month\">12/Aug</Col><Col id=\"rainfall\">148.5</Col><Col id=\"temperature\">26.5</Col><Col id=\"pressure\">1010.2</Col></Row><Row><Col id=\"month\">12/Sep</Col><Col id=\"rainfall\">216.4</Col><Col id=\"temperature\">23.3</Col><Col id=\"pressure\">1013.1</Col></Row><Row><Col id=\"month\">12/Oct</Col><Col id=\"rainfall\">194.1</Col><Col id=\"temperature\">18.3</Col><Col id=\"pressure\">1016.9</Col></Row><Row><Col id=\"month\">12/Nov</Col><Col id=\"rainfall\">95.6</Col><Col id=\"temperature\">13.9</Col><Col id=\"pressure\">1018.2</Col></Row><Row><Col id=\"month\">12/Dec</Col><Col id=\"rainfall\">54.4</Col><Col id=\"temperature\">9.6</Col><Col id=\"pressure\">1016.7</Col></Row><Row><Col id=\"month\">13/Jan</Col><Col id=\"rainfall\">49.9</Col><Col id=\"temperature\">7.0</Col><Col id=\"pressure\">1016</Col></Row><Row><Col id=\"month\">13/Feb</Col><Col id=\"rainfall\">55.1</Col><Col id=\"temperature\">6.9</Col><Col id=\"pressure\">1012.1</Col></Row><Row><Col id=\"month\">13/Mar</Col><Col id=\"rainfall\">106.4</Col><Col id=\"temperature\">8.1</Col><Col id=\"pressure\">1015.9</Col></Row><Row><Col id=\"month\">13/Apr</Col><Col id=\"rainfall\">111.2</Col><Col id=\"temperature\">14.5</Col><Col id=\"pressure\">1015.5</Col></Row><Row><Col id=\"month\">13/May</Col><Col id=\"rainfall\">144.0</Col><Col id=\"temperature\">18.2</Col><Col id=\"pressure\">1012.3</Col></Row><Row><Col id=\"month\">13/Jun</Col><Col id=\"rainfall\">176.0</Col><Col id=\"temperature\">20.2</Col><Col id=\"pressure\">1009.5</Col></Row><Row><Col id=\"month\">13/Jul</Col><Col id=\"rainfall\">132.1</Col><Col id=\"temperature\">25.2</Col><Col id=\"pressure\">1009.6</Col></Row><Row><Col id=\"month\">13/Aug</Col><Col id=\"rainfall\">154.2</Col><Col id=\"temperature\">26.5</Col><Col id=\"pressure\">1010.2</Col></Row><Row><Col id=\"month\">13/Sep</Col><Col id=\"rainfall\">221.1</Col><Col id=\"temperature\">25</Col><Col id=\"pressure\">1010.4</Col></Row><Row><Col id=\"month\">13/Oct</Col><Col id=\"rainfall\">180.2</Col><Col id=\"temperature\">20</Col><Col id=\"pressure\">1010.5</Col></Row><Row><Col id=\"month\">13/Nov</Col><Col id=\"rainfall\">98.1</Col><Col id=\"temperature\">21.1</Col><Col id=\"pressure\">1010.8</Col></Row><Row><Col id=\"month\">13/Dec</Col><Col id=\"rainfall\">44.4</Col><Col id=\"temperature\">9.6</Col><Col id=\"pressure\">1002.1</Col></Row></Rows>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new EcoChart("ecochart", "absolute", "20", "67", null, "444", "48", null, this);
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

            obj = new Grid("Grid00", "absolute", "1.95%", "521", null, "168", "4.69%", null, this);
            obj.set_taborder("20");
            obj.set_binddataset("ds_weather");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"213\"/><Column size=\"150\"/><Column size=\"150\"/><Column size=\"150\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell text=\"month\"/><Cell col=\"1\" text=\"rainfall\"/><Cell col=\"2\" text=\"temperature\"/><Cell col=\"3\" text=\"pressure\"/></Band><Band id=\"body\"><Cell edittype=\"normal\" text=\"bind:month\"/><Cell col=\"1\" edittype=\"normal\" text=\"bind:rainfall\"/><Cell col=\"2\" edittype=\"normal\" text=\"bind:temperature\"/><Cell col=\"3\" edittype=\"normal\" text=\"bind:pressure\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1.95%", "10", null, "47", "4.69%", null, this);
            obj.set_taborder("22");
            obj.set_text("Multi Axis & Scrollbar");
            obj.set_cssclass("WF_sta_Title");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1024, 723, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("EcoChartSample");
            		p.set_titletext("multiaxis");
            		p.style.set_background("#ffffffff");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.registerScript("MultiAxisExample.xfdl", function() {

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
        				"id": "multi axis chart",
        				"bindDataset": "ds_weather",
        				"bindCategory": "month",
        				"colors": "colorMix5",
        				"plotLeftBorderColor": "#1abd9d",
        				"plotLeftBorderWidth": 3,
        				"plotLeftBorderOpacity": 1,
        				"plotRightBorderWidth": 3,
        				"plotRightBorderColor": "#1a71bd",
        				"plotRightBorderOpacity": 1
        			},
        			"categoryAxis": {
        				"id": "categoryAxis X",
        				"tickColor": "#717a8380",
        				"tickWidth": 2,
        				"tickLength": 11,
        				"labelFontSize": 7
        			},
        			"valueAxis": [
        				{
        					"id": "ValueAxis Y1",
        					"title": "Rainfall",
        					"autoscaleMargin": 0.5,
        					"position": "left",
        					"tickColor": "#1abd9d",
        					"tickWidth": 2,
        					"tickLength": 10,
        					"labelFontSize": 9,
        					"titleFontSize": 10,
        					"titleFontColor": "#1abd9d",
        					"titleMargin": 15,
        					"ticks": 3
        				},
        				{
        					"id": "ValueAxis Y2",
        					"title": "Temperature",
        					"max": 33,
        					"showGridLine": false,
        					"axisMargin": 30,
        					"position": "right",
        					"tickColor": "#1a71bd",
        					"tickWidth": 2,
        					"tickLength": 10,
        					"labelFontSize": 9,
        					"titleFontSize": 10,
        					"titleFontColor": "#1a71bd",
        					"titleMargin": 15
        				},
        				{
        					"id": "ValueAxis Y3",
        					"title": "Sea-Level Pressure",
        					"max": 1030,
        					"min": 1000,
        					"showGridLine": false,
        					"axisMargin": 30,
        					"position": "right",
        					"tickColor": "#c2251b",
        					"tickWidth": 2,
        					"tickLength": 10,
        					"labelFontSize": 9,
        					"titleFontSize": 10,
        					"titleMargin": 15,
        					"titleFontColor": "#c2251b",
        					"lineWidth": 3,
        					"lineStyle": "solid",
        					"lineColor": "#c2251b",
        					"lineOpacity": 1
        				}
        			],
        			"series": [
        				{
        					"id": "Series 1",
        					"title": "rainfall",
        					"bindValue": "rainfall",
        					"xaxis": "categoryAxis X",
        					"yaxis": "ValueAxis Y1",
        					"showBar": true,
        					"barWidth": 0.7,
        					"showHighLight": true
        				},
        				{
        					"id": "Series 2",
        					"title": "temperature",
        					"bindValue": "temperature",
        					"xaxis": "categoryAxis X",
        					"yaxis": "ValueAxis Y2",
        					"showPoint": true,
        					"showLine": true,
        					"pointRadius": 12,
        					"showHighLight": true,
        					"highLightOpacity": 0.4,
        					"highLightRadius": 23
        				},
        				{
        					"id": "Series 3",
        					"title": "pressure",
        					"bindValue": "pressure",
        					"xaxis": "categoryAxis X",
        					"yaxis": "ValueAxis Y3",
        					"showPoint": true,
        					"showLine": true
        				}
        			],
        			"legend": {
        				"position": "bottom",
        				"align": "center",
        				"autoMargins": false,
        				"marginTop": 0,
        				"marginRight": 20,
        				"labelFontSize": 10,
        				"markerSize": 10,
        				"switchable": true,
        				"columns": 3,
        				"spacing": 40,
        				"useMarkerColorForLabels": true
        			},
        			"tooltip": {
        				"text": "[%value] value: [%y]",
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
        			"xScrollbar": {
        				"show": true,
        				"scrollHeight": 20,
        				"rangeStart": "12/Jun",
        				"rangeEnd": "13/Jul"
        			}
        		};
        	
        		this.ecochart.set_config(config);
        	}
        	this.chart = this.ecochart.getChart();
        	
        	this.ecochart.draw();
        }

        
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.StackBarSample_onload, this);

        };

        this.loadIncludeScript("MultiAxisExample.xfdl");

       
    };
}
)();
