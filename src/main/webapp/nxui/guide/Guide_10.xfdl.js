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
                this.set_name("Guide_10");
                this.set_classname("Guide_01");
                this.set_titletext("Data Pattern");
                this._setFormPosition(0,0,870,730);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize

            
            // UI Components Initialize
            obj = new Static("Static00", "absolute", "17", "16", "273", "16", null, null, this);
            obj.set_taborder("0");
            obj.set_text("Data Pattern");
            obj.set_cssclass("Guide_title");
            this.addChild(obj.name, obj);

            obj = new Static("Static08", "absolute", "22", "52", "138", "22", null, null, this);
            obj.set_taborder("37");
            obj.set_text("전화번호");
            obj.set_cssclass("pseudo");
            obj.style.set_align("left middle");
            this.addChild(obj.name, obj);

            obj = new Combo("Combo00", "absolute", "22", "79", "65", "21", null, null, this);
            this.addChild(obj.name, obj);
            var Combo00_innerdataset = new Dataset("Combo00_innerdataset", this.Combo00);
            Combo00_innerdataset._setContents("<ColumnInfo><Column id=\"codecolumn\" size=\"256\"/><Column id=\"datacolumn\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"codecolumn\">0</Col><Col id=\"datacolumn\">010</Col></Row><Row><Col id=\"codecolumn\">1</Col><Col id=\"datacolumn\">02</Col></Row><Row><Col id=\"codecolumn\">2</Col><Col id=\"datacolumn\">051</Col></Row><Row><Col id=\"codecolumn\">3</Col><Col id=\"datacolumn\">052</Col></Row></Rows>");
            obj.set_innerdataset(Combo00_innerdataset);
            obj.set_taborder("38");
            obj.set_text("010");
            obj.set_codecolumn("codecolumn");
            obj.set_datacolumn("datacolumn");
            obj.set_value("0");
            obj.set_index("0");

            obj = new Edit("Edit00", "absolute", "90", "79", "39", "21", null, null, this);
            obj.set_taborder("39");
            obj.set_value("1234");
            this.addChild(obj.name, obj);

            obj = new Edit("Edit01", "absolute", "132", "79", "39", "21", null, null, this);
            obj.set_taborder("40");
            obj.set_value("1234");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "211", "52", "138", "22", null, null, this);
            obj.set_taborder("41");
            obj.set_text("달력");
            obj.set_cssclass("pseudo");
            obj.style.set_align("left middle");
            this.addChild(obj.name, obj);

            obj = new Calendar("Calendar00", "absolute", "211", "79", "100", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("42");
            obj.set_value("20140101");
            obj.set_dateformat("yyyy-MM-dd");

            obj = new Static("Static02", "absolute", "351", "52", "138", "22", null, null, this);
            obj.set_taborder("43");
            obj.set_text("기간");
            obj.set_cssclass("pseudo");
            obj.style.set_align("left middle");
            this.addChild(obj.name, obj);

            obj = new Calendar("Calendar01", "absolute", "351", "79", "100", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("44");
            obj.set_value("20140101");
            obj.set_dateformat("yyyy-MM-dd");

            obj = new Calendar("Calendar02", "absolute", "466", "79", "100", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("45");
            obj.set_value("20140101");
            obj.set_dateformat("yyyy-MM-dd");

            obj = new Static("Static03", "absolute", "454", "79", "9", "21", null, null, this);
            obj.set_taborder("46");
            obj.set_text("~");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "606", "52", "138", "22", null, null, this);
            obj.set_taborder("48");
            obj.set_text("검색");
            obj.set_cssclass("pseudo");
            obj.style.set_align("left middle");
            this.addChild(obj.name, obj);

            obj = new Edit("Edit02", "absolute", "606", "79", "120", "21", null, null, this);
            obj.set_taborder("49");
            obj.set_value("search");
            this.addChild(obj.name, obj);

            obj = new Button("Button00", "absolute", "705", "78", "21", "21", null, null, this);
            obj.set_taborder("50");
            obj.set_cssclass("btn_WF_edtSch");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "22", "130", "138", "22", null, null, this);
            obj.set_taborder("51");
            obj.set_text("주민등록번호1");
            obj.set_cssclass("pseudo");
            obj.style.set_align("left middle");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "80", "157", "9", "21", null, null, this);
            obj.set_taborder("54");
            obj.set_text("-");
            this.addChild(obj.name, obj);

            obj = new Edit("Edit03", "absolute", "92", "157", "60", "21", null, null, this);
            obj.set_taborder("55");
            obj.set_password("true");
            obj.set_maxlength("7");
            obj.set_inputtype("number");
            obj.set_value("1234567");
            this.addChild(obj.name, obj);

            obj = new Edit("Edit04", "absolute", "22", "157", "55", "21", null, null, this);
            obj.set_taborder("56");
            obj.set_inputtype("number");
            obj.set_maxlength("6");
            obj.set_value("800101");
            this.addChild(obj.name, obj);

            obj = new Static("Static07", "absolute", "211", "130", "138", "22", null, null, this);
            obj.set_taborder("58");
            obj.set_text("주민등록번호2");
            obj.set_cssclass("pseudo");
            obj.style.set_align("left middle");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("MaskEdit00", "absolute", "211", "157", "100", "21", null, null, this);
            obj.set_taborder("59");
            obj.set_value("8001011234567");
            obj.set_type("string");
            obj.set_mask("######-#######");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("MaskEdit01", "absolute", "351", "157", "112", "21", null, null, this);
            obj.set_taborder("60");
            obj.set_value("12345678901234");
            obj.set_type("string");
            obj.set_mask("###-###-########");
            this.addChild(obj.name, obj);

            obj = new Static("Static09", "absolute", "351", "130", "138", "22", null, null, this);
            obj.set_taborder("61");
            obj.set_text("계좌번호");
            obj.set_cssclass("pseudo");
            obj.style.set_align("left middle");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("MaskEdit02", "absolute", "766", "157", "59", "21", null, null, this);
            obj.set_taborder("62");
            obj.set_value("123456");
            obj.set_type("string");
            obj.set_mask("##:##:##");
            this.addChild(obj.name, obj);

            obj = new Static("Static10", "absolute", "766", "130", "58", "22", null, null, this);
            obj.set_taborder("63");
            obj.set_text("시간1");
            obj.set_cssclass("pseudo");
            obj.style.set_align("left middle");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("MaskEdit03", "absolute", "606", "157", "27", "21", null, null, this);
            obj.set_taborder("64");
            obj.set_value("12");
            obj.set_type("string");
            obj.set_mask("##");
            this.addChild(obj.name, obj);

            obj = new Static("Static11", "absolute", "606", "130", "58", "22", null, null, this);
            obj.set_taborder("65");
            obj.set_text("시간2");
            obj.set_cssclass("pseudo");
            obj.style.set_align("left middle");
            this.addChild(obj.name, obj);

            obj = new Static("Static12", "absolute", "636", "157", "7", "21", null, null, this);
            obj.set_taborder("66");
            obj.set_text(":");
            this.addChild(obj.name, obj);

            obj = new Static("Static13", "absolute", "676", "157", "7", "21", null, null, this);
            obj.set_taborder("67");
            obj.set_text(":");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("MaskEdit04", "absolute", "646", "157", "27", "21", null, null, this);
            obj.set_taborder("68");
            obj.set_value("34");
            obj.set_type("string");
            obj.set_mask("##");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("MaskEdit05", "absolute", "686", "157", "27", "21", null, null, this);
            obj.set_taborder("69");
            obj.set_value("56");
            obj.set_type("string");
            obj.set_mask("##");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 870, 730, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("Guide_01");
            		p.set_titletext("Data Pattern");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.registerScript("Guide_10.xfdl", function() {
        this.Button00_onclick = function(obj,e)
        {
        	var nX   = system.clientToScreenX(obj, 0);
            var nY   = system.clientToScreenY(obj, 21);
        	this.PopupMenu00.trackPopup(nX, nY);
        }

        this.Button01_onclick = function(obj,e)
        {
        	var i, j;
        	this.ProgressBar02.pos = 0;
        	for( i = 0 ; i < 200 ; i+=2 )
        	{
        		this.ProgressBar02.stepIt();
        		this.updateWindow();
        	}
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {

        };

        this.loadIncludeScript("Guide_10.xfdl");

       
    };
}
)();
