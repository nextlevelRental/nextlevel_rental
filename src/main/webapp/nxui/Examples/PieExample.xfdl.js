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
                this.set_name("pie");
                this.set_classname("EcoChartSample");
                this.set_titletext("pie");
                this._setFormPosition(0,0,1024,723);
            }
            this.style.set_background("#ffffffff");

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_pie", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"category\" type=\"STRING\" size=\"256\"/><Column id=\"value\" type=\"FLOAT\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"category\">IE</Col><Col id=\"value\">26.8</Col></Row><Row><Col id=\"category\">Chrome</Col><Col id=\"value\">12.8</Col></Row><Row><Col id=\"category\">Firefox</Col><Col id=\"value\">45.0</Col></Row><Row><Col id=\"category\">Safari</Col><Col id=\"value\">8.5</Col></Row><Row><Col id=\"value\">6.2</Col><Col id=\"category\">Opera</Col></Row><Row><Col id=\"category\">Etc</Col><Col id=\"value\">0.7</Col></Row></Rows>");
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
            obj.set_binddataset("ds_pie");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"149\"/><Column size=\"226\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell text=\"category\"/><Cell col=\"1\" text=\"value\"/></Band><Band id=\"body\"><Cell edittype=\"normal\" text=\"bind:category\"/><Cell col=\"1\" edittype=\"normal\" text=\"bind:value\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1.95%", "10", null, "47", "4.69%", null, this);
            obj.set_taborder("22");
            obj.set_text("Pie & Legend");
            obj.set_cssclass("WF_sta_Title");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1024, 723, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("EcoChartSample");
            		p.set_titletext("pie");
            		p.style.set_background("#ffffffff");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.registerScript("PieExample.xfdl", function() {

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
        				"id": "pie chart",
        				"bindDataset": "ds_pie",
        				"bindCategory": "category",
        				"bindValue": "value",
        				"colors": "color20",
        				"plotHoverable": true,
        				"radius": 0.9,
        				"borderWidth": 2,
        				"labelRadius": 0.7,
        				"labelFontSize": 10,
        				"labelColor": "black",
        				"labelFontType": "bold",
        				"labelWordwrap": true,
        				"labelMaxWidth": 70
        			},
        			"legend": {
        				"align": "center",
        				"labelFontSize": 10,
        				"switchable": false
        			},
        			"tooltip": {
        				"text": "[%x] browser shares : [%y]% website ",
        				"fontType": "normal",
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

        this.loadIncludeScript("PieExample.xfdl");

       
    };
}
)();
