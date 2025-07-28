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
                this.set_name("extCombo");
                this.set_classname("extCombo");
                this.set_titletext("New Form");
                this._setFormPosition(0,0,1024,768);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_inner", this);
            obj._setContents("<ColumnInfo><Column id=\"code\" type=\"STRING\" size=\"256\"/><Column id=\"name\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"code\">1</Col><Col id=\"name\">A타입</Col></Row><Row><Col id=\"code\">2</Col><Col id=\"name\">B타입</Col></Row><Row><Col id=\"code\">3</Col><Col id=\"name\">C타입</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_temp", this);
            obj._setContents("<ColumnInfo><Column id=\"code\" type=\"STRING\" size=\"256\"/><Column id=\"name\" type=\"STRING\" size=\"256\"/><Column id=\"CHECKED\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"code\">1</Col><Col id=\"name\">A타입</Col></Row><Row><Col id=\"code\">2</Col><Col id=\"name\">B타입</Col></Row><Row><Col id=\"code\">3</Col><Col id=\"name\">C타입</Col></Row></Rows>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Button("Button00", "absolute", "19.34%", "25", null, "21", "65.63%", null, this);
            obj.set_taborder("1");
            obj.set_text("innerdataset 설정");
            this.addChild(obj.name, obj);

            obj = new Grid("Grid00", "absolute", "36.72%", "24", null, "157", "48.34%", null, this);
            obj.set_taborder("2");
            obj.set_binddataset("ds_inner");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"80\"/></Columns><Rows><Row band=\"head\" size=\"24\"/><Row band=\"body\" size=\"24\"/></Rows><Band id=\"head\"><Cell col=\"0\" disptype=\"normal\" text=\"code\"/><Cell col=\"1\" disptype=\"normal\" text=\"name\"/></Band><Band id=\"body\"><Cell col=\"0\" disptype=\"normal\" text=\"bind:code\"/><Cell col=\"1\" disptype=\"normal\" text=\"bind:name\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new ExtCombo("ExtCombo00", "absolute", "3.32%", "24", null, "23", "81.15%", null, this);
            obj.set_taborder("4");
            obj.set_text("ExtCombo00");
            obj.set__select_type("select");
            obj.set__enable("true");
            this.addChild(obj.name, obj);

            obj = new Button("Button01", "absolute", "19.82%", "58", null, "21", "70.31%", null, this);
            obj.set_taborder("5");
            obj.set_text("code 얻어오기");
            this.addChild(obj.name, obj);

            obj = new Button("Button02", "absolute", "19.82%", "122", null, "21", "70.31%", null, this);
            obj.set_taborder("6");
            obj.set_text("초기값 넣기");
            this.addChild(obj.name, obj);

            obj = new Button("Button03", "absolute", "19.73%", "82", null, "21", "70.41%", null, this);
            obj.set_taborder("7");
            obj.set_text("value얻어오기");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1024, 768, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("extCombo");
            		p.set_titletext("New Form");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.registerScript("extCombo.xfdl", function() {

        this.Button00_onclick = function(obj,e)
        {
        	this.ExtCombo00.setInnerDataset(this.ds_inner,"code","name")
        }

        this.Button01_onclick = function(obj,e)
        {
            alert(this.ExtCombo00.getValue());
        }

        this.Button03_onclick = function(obj,e)
        {
        	alert(this.ExtCombo00.getText());
        }

        this.Button02_onclick = function(obj,e)
        {
        	var aCode = new Array("1","2");
            trace("aCode>>>>>>>>>>>>>"+aCode);
        	this.ExtCombo00.setValue(aCode);
        }

        
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.Button00.addEventHandler("onclick", this.Button00_onclick, this);
            this.Button01.addEventHandler("onclick", this.Button01_onclick, this);
            this.Button02.addEventHandler("onclick", this.Button02_onclick, this);
            this.Button03.addEventHandler("onclick", this.Button03_onclick, this);

        };

        this.loadIncludeScript("extCombo.xfdl");

       
    };
}
)();
