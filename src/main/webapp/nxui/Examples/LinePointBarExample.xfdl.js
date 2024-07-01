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
                this.set_name("linepoint");
                this.set_classname("EcoChartSample");
                this.set_titletext("linepoint");
                this._setFormPosition(0,0,1024,723);
            }
            this.style.set_background("#ffffffff");

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_daily", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"date\" type=\"STRING\" size=\"256\"/><Column id=\"month\" type=\"STRING\" size=\"256\"/><Column id=\"pc\" type=\"INT\" size=\"256\"/><Column id=\"mobile\" type=\"INT\" size=\"256\"/><Column id=\"atm\" type=\"INT\" size=\"256\"/><Column id=\"phone\" type=\"INT\" size=\"256\"/><Column id=\"twoChannel\" type=\"INT\" size=\"256\"/><Column id=\"trading\" type=\"INT\" size=\"256\"/><Column id=\"calling\" type=\"INT\" size=\"256\"/><Column id=\"visitCounter\" type=\"INT\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"date\">01-10</Col><Col id=\"month\">2014-01</Col><Col id=\"pc\">36000</Col><Col id=\"mobile\">9</Col><Col id=\"atm\">47</Col><Col id=\"phone\">21</Col><Col id=\"twoChannel\">0</Col><Col id=\"trading\">0</Col><Col id=\"calling\">2</Col><Col id=\"visitCounter\">0</Col></Row><Row><Col id=\"date\">01-11</Col><Col id=\"month\">2014-01</Col><Col id=\"pc\">32000</Col><Col id=\"mobile\">10</Col><Col id=\"atm\">35</Col><Col id=\"phone\">28</Col><Col id=\"twoChannel\">0</Col><Col id=\"trading\">0</Col><Col id=\"calling\">2</Col><Col id=\"visitCounter\">1</Col></Row><Row><Col id=\"date\">01-12</Col><Col id=\"month\">2014-01</Col><Col id=\"pc\">63000</Col><Col id=\"mobile\">11</Col><Col id=\"atm\">49</Col><Col id=\"phone\">2</Col><Col id=\"twoChannel\">1</Col><Col id=\"trading\">0</Col><Col id=\"calling\">1</Col><Col id=\"visitCounter\">1</Col></Row><Row><Col id=\"date\">01-13</Col><Col id=\"month\">2014-01</Col><Col id=\"pc\">74000</Col><Col id=\"mobile\">14</Col><Col id=\"atm\">18</Col><Col id=\"phone\">31</Col><Col id=\"twoChannel\">0</Col><Col id=\"trading\">0</Col><Col id=\"calling\">3</Col><Col id=\"visitCounter\">0</Col></Row><Row><Col id=\"date\">01-14</Col><Col id=\"month\">2014-01</Col><Col id=\"pc\">5000</Col><Col id=\"mobile\">9</Col><Col id=\"atm\">13</Col><Col id=\"phone\">10</Col><Col id=\"twoChannel\">0</Col><Col id=\"trading\">0</Col><Col id=\"calling\">1</Col><Col id=\"visitCounter\">1</Col></Row><Row><Col id=\"date\">01-15</Col><Col id=\"month\">2014-01</Col><Col id=\"pc\">27000</Col><Col id=\"mobile\">5</Col><Col id=\"atm\">56</Col><Col id=\"phone\">36</Col><Col id=\"twoChannel\">1</Col><Col id=\"trading\">0</Col><Col id=\"calling\">2</Col><Col id=\"visitCounter\">0</Col></Row><Row><Col id=\"date\">01-16</Col><Col id=\"month\">2014-01</Col><Col id=\"pc\">71000</Col><Col id=\"mobile\">14</Col><Col id=\"atm\">50</Col><Col id=\"phone\">1</Col><Col id=\"twoChannel\">2</Col><Col id=\"trading\">0</Col><Col id=\"calling\">1</Col><Col id=\"visitCounter\">1</Col></Row><Row><Col id=\"date\">01-17</Col><Col id=\"month\">2014-01</Col><Col id=\"pc\">25000</Col><Col id=\"mobile\">2</Col><Col id=\"atm\">47</Col><Col id=\"phone\">32</Col><Col id=\"twoChannel\">1</Col><Col id=\"trading\">0</Col><Col id=\"calling\">1</Col><Col id=\"visitCounter\">1</Col></Row><Row><Col id=\"date\">01-18</Col><Col id=\"month\">2014-01</Col><Col id=\"pc\">41000</Col><Col id=\"mobile\">12</Col><Col id=\"atm\">28</Col><Col id=\"phone\">24</Col><Col id=\"twoChannel\">0</Col><Col id=\"trading\">0</Col><Col id=\"calling\">0</Col><Col id=\"visitCounter\">1</Col></Row><Row><Col id=\"date\">01-19</Col><Col id=\"month\">2014-01</Col><Col id=\"pc\">39000</Col><Col id=\"mobile\">13</Col><Col id=\"atm\">49</Col><Col id=\"phone\">26</Col><Col id=\"twoChannel\">0</Col><Col id=\"trading\">0</Col><Col id=\"calling\">1</Col><Col id=\"visitCounter\">1</Col></Row><Row><Col id=\"date\">01-20</Col><Col id=\"month\">2014-01</Col><Col id=\"pc\">43000</Col><Col id=\"mobile\">8</Col><Col id=\"atm\">23</Col><Col id=\"phone\">32</Col><Col id=\"twoChannel\">1</Col><Col id=\"trading\">0</Col><Col id=\"calling\">2</Col><Col id=\"visitCounter\">0</Col></Row><Row><Col id=\"date\">01-21</Col><Col id=\"month\">2014-01</Col><Col id=\"pc\">12000</Col><Col id=\"mobile\">2</Col><Col id=\"atm\">33</Col><Col id=\"phone\">11</Col><Col id=\"visitCounter\">1</Col><Col id=\"trading\">1</Col><Col id=\"twoChannel\">0</Col><Col id=\"calling\">4</Col></Row><Row><Col id=\"date\">01-22</Col><Col id=\"month\">2014-01</Col><Col id=\"pc\">21210</Col><Col id=\"mobile\">23</Col><Col id=\"atm\">14</Col><Col id=\"phone\">10</Col><Col id=\"visitCounter\">1</Col><Col id=\"trading\">1</Col><Col id=\"calling\">1</Col><Col id=\"twoChannel\">1</Col></Row><Row><Col id=\"date\">01-23</Col><Col id=\"month\">2014-01</Col><Col id=\"pc\">52100</Col><Col id=\"mobile\">12</Col><Col id=\"atm\">22</Col><Col id=\"phone\">28</Col><Col id=\"visitCounter\">1</Col><Col id=\"trading\">0</Col><Col id=\"calling\">5</Col><Col id=\"twoChannel\">0</Col></Row><Row><Col id=\"date\">01-24</Col><Col id=\"month\">2014-01</Col><Col id=\"pc\">44000</Col><Col id=\"mobile\">5</Col><Col id=\"atm\">20</Col><Col id=\"phone\">25</Col><Col id=\"visitCounter\">0</Col><Col id=\"trading\">0</Col><Col id=\"calling\">2</Col><Col id=\"twoChannel\">0</Col></Row><Row><Col id=\"date\">01-25</Col><Col id=\"month\">2014-01</Col><Col id=\"pc\">32033</Col><Col id=\"mobile\">3</Col><Col id=\"atm\">18</Col><Col id=\"phone\">23</Col><Col id=\"visitCounter\">0</Col><Col id=\"trading\">1</Col><Col id=\"calling\">2</Col><Col id=\"twoChannel\">0</Col></Row><Row><Col id=\"date\">01-26</Col><Col id=\"month\">2014-01</Col><Col id=\"pc\">12000</Col><Col id=\"mobile\">13</Col><Col id=\"atm\">40</Col><Col id=\"phone\">10</Col><Col id=\"visitCounter\">1</Col><Col id=\"trading\">1</Col><Col id=\"calling\">1</Col><Col id=\"twoChannel\">1</Col></Row><Row><Col id=\"date\">01-27</Col><Col id=\"month\">2014-01</Col><Col id=\"pc\">29999</Col><Col id=\"mobile\">17</Col><Col id=\"atm\">12</Col><Col id=\"phone\">8</Col><Col id=\"visitCounter\">1</Col><Col id=\"trading\">0</Col><Col id=\"calling\">0</Col><Col id=\"twoChannel\">0</Col></Row></Rows>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new EcoChart("ecochart", "absolute", "20", "67", null, "637", "48", null, this);
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

            obj = new Static("Static01", "absolute", "1.95%", "10", null, "47", "4.69%", null, this);
            obj.set_taborder("22");
            obj.set_text("Line Point & Bar Highight");
            obj.set_cssclass("WF_sta_Title");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1024, 723, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("EcoChartSample");
            		p.set_titletext("linepoint");
            		p.style.set_background("#ffffffff");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.registerScript("LinePointBarExample.xfdl", function() {

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
        				"id": "line-point-bar chart",
        				"bindDataset": "ds_daily",
        				"bindCategory": "date",
        				"colors": "color12",
        				"plotRightBorderWidth": 1
        			},
        			"categoryAxis": {
        				"id": "categoryAxis X",
        				"autoscaleMargin": 0.03,
        				"tickLength": 10,
        				"titleFontSize": 11,
        				"titleFontType": "bold",
        				"lineColor": "red",
        				"labelRotate": -40,
        				"labelMargin": 30
        			},
        			"valueAxis": [
        				{
        					"id": "ValueAxis Y1",
        					"title": "sales  count",
        					"position": "left",
        					"autoscaleMargin": 0.03,
        					"titleMargin": 50,
        					"showGridLine": "false",
        					"lineOpacity": 0.5,
        					"tickColor": "#1abd9c",
        					"tickWidth": 3,
        					"tickLength": 10,
        					"labelMargin": 15,
        					"titleFontSize": 11,
        					"titleFontType": "bold"
        				},
        				{
        					"id": "ValueAxis Y2",
        					"show": true,
        					"showGridLine": true,
        					"position": "right",
        					"tickLength": 12,
        					"tickWidth": 2,
        					"labelMargin": 13
        				}
        			],
        			"series": [
        				{
        					"id": "Series 1",
        					"title": "pc",
        					"bindValue": "pc",
        					"xaxis": "categoryAxis X",
        					"yaxis": "ValueAxis Y1",
        					"showBar": true,
        					"barOpacity": 0.5,
        					"showHighLight": true,
        					"highLightFillColor": "red"
        				},
        				{
        					"id": "Series 2",
        					"title": "mobile",
        					"bindValue": "mobile",
        					"xaxis": "categoryAxis X",
        					"yaxis": "ValueAxis Y2",
        					"showPoint": true,
        					"showLine": true,
        					"showHighLight": true,
        					"pointRadius": 6,
        					"highLightOpacity": 0.4,
        					"highLightRadius": 23
        				}
        			],
        			"legend": {
        				"position": "right",
        				"valign": "top",
        				"columns": 1,
        				"autoMargins": false,
        				"marginTop": 100,
        				"marginRight": 20,
        				"labelFontSize": 10,
        				"labelFontType": "bold",
        				"markerSize": 16,
        				"verticalGap": 35,
        				"switchable": false
        			},
        			"tooltip": {
        				"text": "[%value] sales: [%y]",
        				"fontFace": "Meiryo UI",
        				"fontSize": 9,
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
        	
        	this.ecochart.draw();
        	
        	chart = this.ecochart.getChart();
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.StackBarSample_onload, this);

        };

        this.loadIncludeScript("LinePointBarExample.xfdl");

       
    };
}
)();
