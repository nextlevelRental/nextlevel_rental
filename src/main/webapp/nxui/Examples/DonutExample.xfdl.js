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
                this.set_name("donut");
                this.set_classname("EcoChartSample");
                this.set_titletext("donut");
                this._setFormPosition(0,0,1024,723);
            }
            this.style.set_background("#ffffffff");

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_donut", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"country\" type=\"STRING\" size=\"256\"/><Column id=\"litres\" type=\"FLOAT\" size=\"256\"/><Column id=\"aaa\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"country\">Lithuania</Col><Col id=\"litres\">501.9</Col><Col id=\"aaa\">1</Col></Row><Row><Col id=\"country\">Czech Republic</Col><Col id=\"litres\">301.9</Col><Col id=\"aaa\">1</Col></Row><Row><Col id=\"country\">Ireland</Col><Col id=\"litres\">201.1</Col><Col id=\"aaa\">1</Col></Row><Row><Col id=\"country\">Germany</Col><Col id=\"litres\">165.8</Col><Col id=\"aaa\">1</Col></Row><Row><Col id=\"litres\">139.9</Col><Col id=\"country\">Australia</Col><Col id=\"aaa\">1</Col></Row><Row><Col id=\"country\">Austria</Col><Col id=\"litres\">128.3</Col><Col id=\"aaa\">1</Col></Row><Row><Col id=\"country\">UK</Col><Col id=\"litres\">99</Col><Col id=\"aaa\">2</Col></Row><Row><Col id=\"country\">Belgium</Col><Col id=\"litres\">60</Col><Col id=\"aaa\">4</Col></Row><Row><Col id=\"country\">Netherlands</Col><Col id=\"litres\">50</Col><Col id=\"aaa\">3</Col></Row></Rows>");
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
            obj.set_text("Donut & Highlight");
            obj.set_cssclass("WF_sta_Title");
            this.addChild(obj.name, obj);

            obj = new EcoChart("ecochart", "absolute", "1.95%", "64", null, "444", "4.69%", null, this);
            obj.style.set_background("#ffffffff");
            obj.style.set_border("0 solid #808080ff");
            obj.style.set_bordertype("round 15 15");
            this.addChild(obj.name, obj);

            obj = new Grid("Grid00", "absolute", "1.95%", "518", null, "168", "4.69%", null, this);
            obj.set_taborder("26");
            obj.set_binddataset("ds_donut");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"188\"/><Column size=\"156\"/><Column size=\"40\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell text=\"country\"/><Cell col=\"1\" text=\"litres\"/><Cell col=\"2\" text=\"aaa\"/></Band><Band id=\"body\"><Cell edittype=\"normal\" text=\"bind:country\"/><Cell col=\"1\" edittype=\"normal\" text=\"bind:litres\"/><Cell col=\"2\" text=\"bind:aaa\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1024, 723, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("EcoChartSample");
            		p.set_titletext("donut");
            		p.style.set_background("#ffffffff");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.registerScript("DonutExample.xfdl", function() {

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
        			"type": "Pie",
        			"chart": {
        				"id": "donut chart",
        				"bindDataset": "ds_donut",
        				"bindCategory": "country",
        				"bindValue": "litres",
        				"colors": "color12",
        				"plotBackgroundColor": "#9467bd",
        				"plotBackgroundOpacity": 0.2,
        				"radius": 0.7,
        				"innerRadius": 0.3,
        				"tilt": 0.7,
        				"labelFontSize": 8,
        				"labelRadius": 0.8,
        				"labelColor": "gray",
        				"labelFontType": "bold",
        				"showHighLight": true,
        				"highLightOpacity": 0.6,
        				"highLightRadius": 0.8
        			},
        			"legend": {
        				"position": "left",
        				"valign": "top",
        				"autoMargins": false,
        				"marginTop": 100,
        				"marginLeft": 90,
        				"marginRight": 20,
        				"markerType": "circle",
        				"markerSize": 15,
        				"switchable": false,
        				"useMarkerColorForLabels": true,
        				"equalItemWidths": true,
        				"columns": 2
        			},
        			"tooltip": {
        				"text": "[%y]% ",
        				"fontSize": 10
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

        this.loadIncludeScript("DonutExample.xfdl");

       
    };
}
)();
