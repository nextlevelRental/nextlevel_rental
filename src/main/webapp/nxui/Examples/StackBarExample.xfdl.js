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
                this.set_name("stackbar");
                this.set_classname("EcoChartSample");
                this.set_titletext("stackbar");
                this._setFormPosition(0,0,1024,723);
            }
            this.style.set_background("#ffffffff");

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_stackbar", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"Fruits\" type=\"STRING\" size=\"256\"/><Column id=\"Tom\" type=\"INT\" size=\"256\"/><Column id=\"Julia\" type=\"INT\" size=\"256\"/><Column id=\"Joe\" type=\"INT\" size=\"256\"/><Column id=\"Cavin\" type=\"INT\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"Fruits\">Apples</Col><Col id=\"Tom\">13</Col><Col id=\"Julia\">5</Col><Col id=\"Joe\">7</Col><Col id=\"Cavin\">12</Col></Row><Row><Col id=\"Fruits\">Oranges</Col><Col id=\"Tom\">5</Col><Col id=\"Julia\">12</Col><Col id=\"Joe\">3</Col><Col id=\"Cavin\">5</Col></Row><Row><Col id=\"Fruits\">Pears</Col><Col id=\"Tom\">1</Col><Col id=\"Julia\">11</Col><Col id=\"Joe\">4</Col><Col id=\"Cavin\">8</Col></Row><Row><Col id=\"Fruits\">Grapes</Col><Col id=\"Tom\">2</Col><Col id=\"Julia\">3</Col><Col id=\"Joe\">9</Col><Col id=\"Cavin\">3</Col></Row><Row><Col id=\"Fruits\">Bananas</Col><Col id=\"Tom\">4</Col><Col id=\"Julia\">15</Col><Col id=\"Joe\">7</Col><Col id=\"Cavin\">6</Col></Row><Row><Col id=\"Fruits\">Pineapple</Col><Col id=\"Tom\">2</Col><Col id=\"Julia\">9</Col><Col id=\"Joe\">13</Col><Col id=\"Cavin\">17</Col></Row><Row><Col id=\"Fruits\">Melon</Col><Col id=\"Tom\">5</Col><Col id=\"Julia\">4</Col><Col id=\"Joe\">10</Col><Col id=\"Cavin\">10</Col></Row><Row><Col id=\"Fruits\">Strawberry</Col><Col id=\"Tom\">8</Col><Col id=\"Julia\">3</Col><Col id=\"Joe\">15</Col><Col id=\"Cavin\">12</Col></Row></Rows>");
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

            obj = new Grid("Grid00", "absolute", "1.95%", "527", null, "168", "4.69%", null, this);
            obj.set_taborder("20");
            obj.set_binddataset("ds_stackbar");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"201\"/><Column size=\"150\"/><Column size=\"150\"/><Column size=\"150\"/><Column size=\"150\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell text=\"Fruits\"/><Cell col=\"1\" text=\"Tom\"/><Cell col=\"2\" text=\"Julia\"/><Cell col=\"3\" text=\"Joe\"/><Cell col=\"4\" text=\"Cavin\"/></Band><Band id=\"body\"><Cell text=\"bind:Fruits\"/><Cell col=\"1\" edittype=\"normal\" text=\"bind:Tom\"/><Cell col=\"2\" edittype=\"normal\" text=\"bind:Julia\"/><Cell col=\"3\" edittype=\"normal\" text=\"bind:Joe\"/><Cell col=\"4\" edittype=\"normal\" text=\"bind:Cavin\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1.95%", "10", null, "47", "4.69%", null, this);
            obj.set_taborder("22");
            obj.set_text("Stack Bar ");
            obj.set_cssclass("WF_sta_Title");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1024, 723, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("EcoChartSample");
            		p.set_titletext("stackbar");
            		p.style.set_background("#ffffffff");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.registerScript("StackBarExample.xfdl", function() {

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
        				"id": "stackbar chart",
        				"bindDataset": "ds_stackbar",
        				"bindCategory": "Fruits",
        				"isStack": true,
        				"colors": "colorMix5"
        			},
        			"categoryAxis": {
        				"id": "categoryAxis X",
        				"title": "Fruits",
        				"autoscaleMargin": 0.03,
        				"showGridLine": false,
        				"lineColor": "#717a8380",
        				"tickColor": "#717a8380",
        				"tickWidth": 3,
        				"tickLength": 15,
        				"labelMargin": 20,
        				"labelFontSize": 10,
        				"titleFontSize": 13,
        				"titleFontType": "bold",
        				"titleFontColor": "blue",
        				"titleMargin": 25
        			},
        			"valueAxis": [
        				{
        					"id": "ValueAxis Y",
        					"title": "Fruits Consumption",
        					"max": 40,
        					"position": "left",
        					"lineColor": "#717a8380",
        					"tickColor": "#717a8380",
        					"tickWidth": 2,
        					"tickLength": 10,
        					"labelFontSize": 9,
        					"titleFontSize": 12,
        					"titleFontType": "bold",
        					"titleFontColor": "blue",
        					"titleMargin": 25
        				}
        			],
        			"series": [
        				{
        					"id": "Series 1",
        					"title": "Tom",
        					"bindValue": "Tom",
        					"xaxis": "categoryAxis X",
        					"yaxis": "ValueAxis Y",
        					"showBar": true,
        					"barWidth": 0.8
        				},
        				{
        					"id": "Series 2",
        					"title": "Julia",
        					"bindValue": "Julia",
        					"xaxis": "categoryAxis X",
        					"yaxis": "ValueAxis Y",
        					"showBar": true,
        					"barWidth": 0.8
        				},
        				{
        					"id": "Series 3",
        					"title": "Cavin",
        					"bindValue": "Cavin",
        					"xaxis": "categoryAxis X",
        					"yaxis": "ValueAxis Y",
        					"showBar": true,
        					"barWidth": 0.8
        				},
        				{
        					"id": "Series 4",
        					"title": "Joe",
        					"bindValue": "Joe",
        					"xaxis": "categoryAxis X",
        					"yaxis": "ValueAxis Y",
        					"showBar": true,
        					"barWidth": 0.8
        				}
        			],
        			"legend": {
        				"position": "right",
        				"valign": "top",
        				"columns": 2,
        				"autoMargins": false,
        				"marginTop": 100,
        				"marginRight": 20,
        				"labelFontSize": 13,
        				"labelFontType": "bold",
        				"markerSize": 13,
        				"verticalGap": 30,
        				"switchable": false
        			},
        			"tooltip": {
        				"text": "[%value] : [%y]",
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
        			}
        		};
        	
        		chart = this.ecochart.getChart();
        		
        		this.ecochart.set_config(config);
        	}
        	
        	this.ecochart.draw();
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.StackBarSample_onload, this);

        };

        this.loadIncludeScript("StackBarExample.xfdl");

       
    };
}
)();
