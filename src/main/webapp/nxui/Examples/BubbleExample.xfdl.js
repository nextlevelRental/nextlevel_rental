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
                this.set_name("bubble");
                this.set_classname("EcoChartSample");
                this.set_titletext("bubble");
                this._setFormPosition(0,0,1024,723);
            }
            this.style.set_background("#ffffffff");

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_bubble", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"category\" type=\"STRING\" size=\"256\"/><Column id=\"pointX0\" type=\"FLOAT\" size=\"256\"/><Column id=\"pointY0\" type=\"FLOAT\" size=\"256\"/><Column id=\"value0\" type=\"FLOAT\" size=\"256\"/><Column id=\"pointX1\" type=\"FLOAT\" size=\"256\"/><Column id=\"pointY1\" type=\"FLOAT\" size=\"256\"/><Column id=\"value1\" type=\"FLOAT\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"category\">1</Col><Col id=\"pointX0\">9</Col><Col id=\"pointY0\">81</Col><Col id=\"value0\">63</Col><Col id=\"pointX1\">47</Col><Col id=\"pointY1\">60</Col><Col id=\"value1\">20</Col></Row><Row><Col id=\"category\">2</Col><Col id=\"pointX0\">98</Col><Col id=\"pointY0\">5</Col><Col id=\"value0\">10</Col><Col id=\"pointX1\">6</Col><Col id=\"pointY1\">18</Col><Col id=\"value1\">4</Col></Row><Row><Col id=\"category\">3</Col><Col id=\"pointX0\">51</Col><Col id=\"pointY0\">50</Col><Col id=\"value0\">73</Col><Col id=\"pointX1\">15</Col><Col id=\"pointY1\">93</Col><Col id=\"value1\">55</Col></Row><Row><Col id=\"category\">4</Col><Col id=\"pointX0\">22</Col><Col id=\"pointY0\">22</Col><Col id=\"value0\">14</Col><Col id=\"pointX1\">72</Col><Col id=\"pointY1\">44</Col><Col id=\"value1\">90</Col></Row><Row><Col id=\"category\">5</Col><Col id=\"pointX0\">58</Col><Col id=\"pointY0\">24</Col><Col id=\"value0\">20</Col><Col id=\"pointX1\">80</Col><Col id=\"pointY1\">76</Col><Col id=\"value1\">22</Col></Row><Row><Col id=\"category\">6</Col><Col id=\"pointX0\">78</Col><Col id=\"pointY0\">37</Col><Col id=\"value0\">34</Col><Col id=\"pointX1\">11</Col><Col id=\"pointY1\">74</Col><Col id=\"value1\">96</Col></Row><Row><Col id=\"pointX0\">55</Col><Col id=\"category\">7</Col><Col id=\"pointY0\">56</Col><Col id=\"value0\">53</Col><Col id=\"pointX1\">88</Col><Col id=\"pointY1\">13</Col><Col id=\"value1\">60</Col></Row><Row><Col id=\"category\">8</Col><Col id=\"pointX0\">18</Col><Col id=\"pointY0\">45</Col><Col id=\"value0\">70</Col><Col id=\"pointX1\">30</Col><Col id=\"pointY1\">47</Col><Col id=\"value1\">49</Col></Row><Row><Col id=\"category\">9</Col><Col id=\"pointX0\">42</Col><Col id=\"pointY0\">80</Col><Col id=\"pointX1\">57</Col><Col id=\"value0\">50</Col><Col id=\"pointY1\">62</Col><Col id=\"value1\">12</Col></Row><Row><Col id=\"category\">10</Col><Col id=\"pointX0\">3</Col><Col id=\"pointY0\">52</Col><Col id=\"value0\">59</Col><Col id=\"pointX1\">4</Col><Col id=\"pointY1\">16</Col><Col id=\"value1\">16</Col></Row><Row><Col id=\"category\">11</Col><Col id=\"pointX0\">31</Col><Col id=\"pointY0\">18</Col><Col id=\"value0\">97</Col><Col id=\"pointX1\">52</Col><Col id=\"pointY1\">10</Col><Col id=\"value1\">33</Col></Row><Row><Col id=\"category\">12</Col><Col id=\"pointX0\">79</Col><Col id=\"pointY0\">91</Col><Col id=\"value0\">63</Col><Col id=\"pointX1\">22</Col><Col id=\"pointY1\">87</Col><Col id=\"value1\">89</Col></Row><Row><Col id=\"category\">13</Col><Col id=\"pointX0\">93</Col><Col id=\"pointY0\">23</Col><Col id=\"value0\">50</Col><Col id=\"pointX1\">70</Col><Col id=\"pointY1\">91</Col><Col id=\"value1\">82</Col></Row><Row><Col id=\"category\">14</Col><Col id=\"pointX0\">50</Col><Col id=\"pointY0\">83</Col><Col id=\"value0\">77</Col><Col id=\"pointX1\">45</Col><Col id=\"pointY1\">15</Col><Col id=\"value1\">98</Col></Row></Rows>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
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
            obj.set_text("Bubble Chart");
            obj.set_cssclass("WF_sta_Title");
            this.addChild(obj.name, obj);

            obj = new Grid("Grid00", "absolute", "1.95%", "527", null, "168", "4.69%", null, this);
            obj.set_taborder("25");
            obj.set_binddataset("ds_bubble");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"175\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell text=\"category\"/><Cell col=\"1\" text=\"pointX0\"/><Cell col=\"2\" text=\"pointY0\"/><Cell col=\"3\" text=\"value0\"/><Cell col=\"4\" text=\"pointX1\"/><Cell col=\"5\" text=\"pointY1\"/><Cell col=\"6\" text=\"value1\"/></Band><Band id=\"body\"><Cell text=\"bind:category\"/><Cell col=\"1\" edittype=\"normal\" text=\"bind:pointX0\"/><Cell col=\"2\" edittype=\"normal\" text=\"bind:pointY0\"/><Cell col=\"3\" edittype=\"normal\" text=\"bind:value0\"/><Cell col=\"4\" edittype=\"normal\" text=\"bind:pointX1\"/><Cell col=\"5\" edittype=\"normal\" text=\"bind:pointY1\"/><Cell col=\"6\" edittype=\"normal\" text=\"bind:value1\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new EcoChart("ecochart", "absolute", "1.95%", "67", null, "444", "14.06%", null, this);
            obj.style.set_background("#ffffffff");
            obj.style.set_border("0 solid #808080ff");
            obj.style.set_bordertype("round 15 15");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1024, 723, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("EcoChartSample");
            		p.set_titletext("bubble");
            		p.style.set_background("#ffffffff");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.registerScript("BubbleExample.xfdl", function() {

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
        				"id": "bubble chart",
        				"bindDataset": "ds_bubble",
        				"bindCategory": "category"
        			},
        			"valueAxis": [
        				{
        					"id": "ValueAxis X1",
        					"position": "bottom",
        					"autoscaleMargin": 0.1
        				},
        				{
        					"id": "ValueAxis Y2",
        					"position": "left",
        					"tickLength": 10,
        					"autoscaleMargin": 0.15
        				}
        			],
        			"series": [
        				{
        					"id": "Series 1",
        					"bindX": "pointX0",
        					"bindY": "pointY0",
        					"bindValue": "value0",
        					"xaxis": "ValueAxis X1",
        					"yaxis": "ValueAxis Y2",
        					"showBubble": true,
        					"bubbleFillGradation": "radial 5,0 white 80,0 #1a7fbe",
        					"bubbleColor": "#1a7fbe",
        					"showHighLight": true
        				},
        				{
        					"id": "Series 2",
        					"bindX": "pointX1",
        					"bindY": "pointY1",
        					"bindValue": "value1",
        					"xaxis": "ValueAxis X1",
        					"yaxis": "ValueAxis Y2",
        					"showBubble": true,
        					"bubbleFillGradation": "radial 5,0 white 80,0 orange",
        					"bubbleColor": "orange",
        					"showHighLight": true
        				}
        			],
        			"legend": {
        				"position": "bottom",
        				"valign": "bottom",
        				"align": "center",
        				"autoMargins": false,
        				"marginBottom": 20,
        				"marginRight": 20,
        				"labelFontSize": 10,
        				"labelFontType": "bold",
        				"spacing": 50,
        				"markerSize": 16,
        				"markerType": "circle",
        				"switchable": false
        			},
        			"tooltip": {
        				"text": "value: [%value]",
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
        	
        		this.ecochart.set_config(config);
        	}
        	
        	chart = this.ecochart.getChart();

        	this.ecochart.draw();
        }

        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.StackBarSample_onload, this);

        };

        this.loadIncludeScript("BubbleExample.xfdl");

       
    };
}
)();
