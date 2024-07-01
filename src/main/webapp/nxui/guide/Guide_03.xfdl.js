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
                this.set_name("Guide_03");
                this.set_classname("Guide_01");
                this.set_titletext("CheckBoc/Radio/Tab");
                this._setFormPosition(0,0,1070,730);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_rdo", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"lv\" type=\"STRING\" size=\"256\"/><Column id=\"data\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"lv\">0</Col><Col id=\"data\">라디오 버튼</Col></Row><Row><Col id=\"lv\">1</Col><Col id=\"data\">라디오 버튼</Col></Row></Rows>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static00", "absolute", "17", "16", "273", "20", null, null, this);
            obj.set_taborder("0");
            obj.set_text("CheckBox");
            obj.set_cssclass("Guide_title");
            this.addChild(obj.name, obj);

            obj = new Static("Static07", "absolute", "58", "51", "123", "22", null, null, this);
            obj.set_taborder("6");
            obj.set_text("Normal");
            obj.set_cssclass("pseudo");
            this.addChild(obj.name, obj);

            obj = new Static("Static08", "absolute", "218", "51", "123", "22", null, null, this);
            obj.set_taborder("7");
            obj.set_text("Disabled");
            obj.set_cssclass("pseudo");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "10", "144", null, "8", "10", null, this);
            obj.set_taborder("34");
            obj.set_cssclass("Guide_line");
            this.addChild(obj.name, obj);

            obj = new CheckBox("CheckBox00", "absolute", "72", "80", "120", "21", null, null, this);
            obj.set_taborder("35");
            obj.set_text("체크박스");
            this.addChild(obj.name, obj);

            obj = new CheckBox("CheckBox01", "absolute", "222", "80", "120", "21", null, null, this);
            obj.set_taborder("36");
            obj.set_text("체크박스");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new CheckBox("CheckBox02", "absolute", "72", "108", "120", "21", null, null, this);
            obj.set_taborder("37");
            obj.set_text("체크박스");
            obj.set_value("true");
            this.addChild(obj.name, obj);

            obj = new CheckBox("CheckBox03", "absolute", "222", "108", "120", "21", null, null, this);
            obj.set_taborder("38");
            obj.set_text("체크박스");
            obj.set_value("true");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "58", "205", "123", "22", null, null, this);
            obj.set_taborder("39");
            obj.set_text("Normal");
            obj.set_cssclass("pseudo");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "207", "205", "123", "22", null, null, this);
            obj.set_taborder("40");
            obj.set_text("Disabled");
            obj.set_cssclass("pseudo");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "17", "170", "273", "16", null, null, this);
            obj.set_taborder("45");
            obj.set_text("Radio");
            obj.set_cssclass("Guide_title");
            this.addChild(obj.name, obj);

            obj = new Radio("Radio01", "absolute", "222", "232", "120", "51", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("47");
            obj.set_columncount("0");
            obj.set_innerdataset("@ds_rdo");
            obj.set_codecolumn("lv");
            obj.set_datacolumn("data");
            obj.set_enable("false");
            obj.set_value("1");
            obj.set_index("1");

            obj = new Static("Static04", "absolute", "10", "291", null, "8", "10", null, this);
            obj.set_taborder("48");
            obj.set_cssclass("Guide_line");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "17", "317", "273", "16", null, null, this);
            obj.set_taborder("49");
            obj.set_text("Tab");
            obj.set_cssclass("Guide_title");
            this.addChild(obj.name, obj);

            obj = new Tab("Tab00", "absolute", "45", "379", "457", "137", null, null, this);
            obj.set_taborder("50");
            obj.set_tabindex("0");
            obj.set_scrollbars("autoboth");
            this.addChild(obj.name, obj);
            obj = new Tabpage("tabpage1", this.Tab00);
            obj.set_text("tabpage1");
            this.Tab00.addChild(obj.name, obj);
            obj = new Tabpage("tabpage2", this.Tab00);
            obj.set_text("tabpage2");
            this.Tab00.addChild(obj.name, obj);
            obj = new Tabpage("tabpage3", this.Tab00);
            obj.set_text("tabpage3");
            this.Tab00.addChild(obj.name, obj);
            obj = new Tabpage("tabpage4", this.Tab00);
            obj.set_text("tabpage4");
            this.Tab00.addChild(obj.name, obj);
            obj = new Tabpage("tabpage5", this.Tab00);
            obj.set_text("tabpage5");
            this.Tab00.addChild(obj.name, obj);
            obj = new Tabpage("tabpage6", this.Tab00);
            obj.set_text("tabpage6");
            this.Tab00.addChild(obj.name, obj);

            obj = new Tab("Tab01", "absolute", "45", "563", "457", "137", null, null, this);
            obj.set_taborder("51");
            obj.set_tabindex("0");
            obj.set_scrollbars("autoboth");
            obj.style.set_showextrabutton("true");
            this.addChild(obj.name, obj);
            obj = new Tabpage("tabpage1", this.Tab01);
            obj.set_text("tabpage1");
            this.Tab01.addChild(obj.name, obj);
            obj = new Tabpage("tabpage2", this.Tab01);
            obj.set_text("tabpage2");
            this.Tab01.addChild(obj.name, obj);
            obj = new Tabpage("tabpage3", this.Tab01);
            obj.set_text("tabpage3");
            this.Tab01.addChild(obj.name, obj);
            obj = new Tabpage("tabpage4", this.Tab01);
            obj.set_text("tabpage4");
            this.Tab01.addChild(obj.name, obj);
            obj = new Tabpage("tabpage5", this.Tab01);
            obj.set_text("tabpage5");
            this.Tab01.addChild(obj.name, obj);
            obj = new Tabpage("tabpage6", this.Tab01);
            obj.set_text("tabpage6");
            this.Tab01.addChild(obj.name, obj);
            obj = new Tabpage("tabpage7", this.Tab01);
            obj.set_text("tabpage7");
            this.Tab01.addChild(obj.name, obj);

            obj = new Static("Static09", "absolute", "45", "352", "316", "22", null, null, this);
            obj.set_taborder("52");
            obj.set_text("showextrabutton = None");
            obj.set_cssclass("pseudo");
            obj.style.set_align("left middle");
            this.addChild(obj.name, obj);

            obj = new Static("Static10", "absolute", "45", "536", "330", "22", null, null, this);
            obj.set_taborder("53");
            obj.set_text("showextrabutton = true");
            obj.set_cssclass("pseudo");
            obj.style.set_align("left middle");
            this.addChild(obj.name, obj);

            obj = new Tab("Tab02", "absolute", "577", "379", "457", "137", null, null, this);
            obj.set_taborder("54");
            obj.set_tabindex("0");
            obj.set_scrollbars("autoboth");
            obj.set_tabposition("bottom");
            this.addChild(obj.name, obj);
            obj = new Tabpage("tabpage1", this.Tab02);
            obj.set_text("tabpage1");
            this.Tab02.addChild(obj.name, obj);
            obj = new Tabpage("tabpage2", this.Tab02);
            obj.set_text("tabpage2");
            this.Tab02.addChild(obj.name, obj);
            obj = new Tabpage("tabpage3", this.Tab02);
            obj.set_text("tabpage3");
            this.Tab02.addChild(obj.name, obj);
            obj = new Tabpage("tabpage4", this.Tab02);
            obj.set_text("tabpage4");
            this.Tab02.addChild(obj.name, obj);
            obj = new Tabpage("tabpage5", this.Tab02);
            obj.set_text("tabpage5");
            this.Tab02.addChild(obj.name, obj);

            obj = new Static("Static11", "absolute", "577", "352", "316", "22", null, null, this);
            obj.set_taborder("57");
            obj.set_text("tabposition = Bottom");
            obj.set_cssclass("pseudo");
            obj.style.set_align("left middle");
            this.addChild(obj.name, obj);

            obj = new Static("Static29", "absolute", "72", "77", "13", "5", null, null, this);
            obj.set_taborder("60");
            obj.set_cssclass("Guide_Hsize");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static15", "absolute", "235", "87", "8", "5", null, null, this);
            obj.set_taborder("65");
            obj.set_cssclass("Guide_Hsize");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static16", "absolute", "73", "232", "13", "5", null, null, this);
            obj.set_taborder("66");
            obj.set_cssclass("Guide_Hsize");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static20", "absolute", "236", "242", "8", "5", null, null, this);
            obj.set_taborder("70");
            obj.set_cssclass("Guide_Hsize");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static27", "absolute", "112", "390", "15", "6", null, null, this);
            obj.set_taborder("75");
            obj.set_cssclass("Guide_Hsize");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static28", "absolute", "81", "380", "5", "9", null, null, this);
            obj.set_taborder("76");
            obj.set_cssclass("Guide_Vsize");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static33", "absolute", "81", "402", "5", "8", null, null, this);
            obj.set_taborder("79");
            obj.set_cssclass("Guide_Vsize");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static34", "absolute", "128", "564", "29", "29", null, null, this);
            obj.set_taborder("80");
            obj.set_cssclass("Guide_area");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static35", "absolute", "113", "575", "15", "5", null, null, this);
            obj.set_taborder("82");
            obj.set_cssclass("Guide_Hsize");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static38", "absolute", "488", "393", "14", "14", null, null, this);
            obj.set_taborder("84");
            obj.set_cssclass("Guide_area");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static39", "absolute", "472", "393", "14", "14", null, null, this);
            obj.set_taborder("85");
            obj.set_cssclass("Guide_area");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static41", "absolute", "472", "386", "14", "6", null, null, this);
            obj.set_taborder("87");
            obj.set_cssclass("Guide_Hsize");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static42", "absolute", "466", "393", "5", "14", null, null, this);
            obj.set_taborder("88");
            obj.set_cssclass("Guide_Vsize");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Radio("Radio02", "absolute", "5.05%", "232", null, "51", "83.74%", null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("89");
            obj.set_innerdataset("@ds_rdo");
            obj.set_codecolumn("lv");
            obj.set_datacolumn("data");
            obj.set_value("1");
            obj.set_enable("true");
            obj.set_index("1");


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 457, 109, this.Tab00.tabpage1,
            	//-- Layout function
            	function(p) {
            		p.set_text("tabpage1");

            	}
            );
            this.Tab00.tabpage1.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 0, 0, this.Tab01.tabpage1,
            	//-- Layout function
            	function(p) {
            		p.set_text("tabpage1");

            	}
            );
            this.Tab01.tabpage1.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1070, 730, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("Guide_01");
            		p.set_titletext("CheckBoc/Radio/Tab");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.registerScript("Guide_03.xfdl", function() {

        this.Radio00_onitemclick = function(obj,e)
        {
        	
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {

        };

        this.loadIncludeScript("Guide_03.xfdl");

       
    };
}
)();
