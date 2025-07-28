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
                this.set_name("Guide_02");
                this.set_classname("Guide_01");
                this.set_titletext("Combo/ListBox/Spin/Calendar");
                this._setFormPosition(0,0,820,730);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_cmb", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"lv\" type=\"STRING\" size=\"256\"/><Column id=\"data\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"lv\">0</Col><Col id=\"data\">넥센타이어</Col></Row><Row><Col id=\"lv\">1</Col><Col id=\"data\">넥센타이어</Col></Row><Row><Col id=\"lv\">2</Col><Col id=\"data\">넥센타이어</Col></Row><Row><Col id=\"lv\">3</Col><Col id=\"data\">넥센타이어</Col></Row><Row><Col id=\"lv\">4</Col><Col id=\"data\">넥센타이어</Col></Row><Row><Col id=\"lv\">5</Col><Col id=\"data\">넥센타이어</Col></Row></Rows>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static00", "absolute", "17", "16", "273", "16", null, null, this);
            obj.set_taborder("20");
            obj.set_text("Combo / ListBox");
            obj.set_cssclass("Guide_title");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "10", "261", null, "8", "10", null, this);
            obj.set_taborder("21");
            obj.set_cssclass("Guide_line");
            this.addChild(obj.name, obj);

            obj = new Static("Static07", "absolute", "69", "48", "123", "22", null, null, this);
            obj.set_taborder("22");
            obj.set_text("Normal");
            obj.set_cssclass("pseudo");
            this.addChild(obj.name, obj);

            obj = new Static("Static08", "absolute", "239", "48", "123", "22", null, null, this);
            obj.set_taborder("23");
            obj.set_text("Disabled");
            obj.set_cssclass("pseudo");
            this.addChild(obj.name, obj);

            obj = new Static("Static09", "absolute", "409", "48", "123", "22", null, null, this);
            obj.set_taborder("24");
            obj.set_text("Readonly");
            obj.set_cssclass("pseudo");
            this.addChild(obj.name, obj);

            obj = new Combo("Combo00", "absolute", "70", "98", "160", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("0");
            obj.set_innerdataset("@ds_cmb");
            obj.set_codecolumn("lv");
            obj.set_datacolumn("data");
            obj.set_displayrowcount("5");
            obj.set_text("넥센타이어");
            obj.set_value("0");
            obj.set_index("0");

            obj = new Combo("Combo02", "absolute", "410", "98", "160", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("2");
            obj.set_readonly("true");
            obj.set_innerdataset("@ds_cmb");
            obj.set_codecolumn("lv");
            obj.set_datacolumn("data");
            obj.set_displayrowcount("5");
            obj.set_cssclass("readonly");
            obj.set_text("넥센타이어");
            obj.set_value("0");
            obj.set_index("0");

            obj = new ListBox("ListBox00", "absolute", "240", "149", "160", "97", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("5");
            obj.set_innerdataset("@ds_cmb");
            obj.set_codecolumn("lv");
            obj.set_datacolumn("data");
            obj.set_enable("false");

            obj = new ListBox("ListBox01", "absolute", "410", "149", "160", "97", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("6");
            obj.set_innerdataset("@ds_cmb");
            obj.set_codecolumn("lv");
            obj.set_datacolumn("data");
            obj.set_readonly("true");
            obj.set_value("2");
            obj.set_index("2");

            obj = new ListBox("ListBox02", "absolute", "70", "149", "160", "97", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("4");
            obj.set_innerdataset("@ds_cmb");
            obj.set_codecolumn("lv");
            obj.set_datacolumn("data");
            obj.set_value("2");
            obj.set_index("2");

            obj = new Static("Static01", "absolute", "17", "287", "273", "16", null, null, this);
            obj.set_taborder("25");
            obj.set_text("Spin");
            obj.set_cssclass("Guide_title");
            this.addChild(obj.name, obj);

            obj = new Spin("Spin00", "absolute", "70", "349", "160", "21", null, null, this);
            obj.set_taborder("7");
            obj.set_value("100");
            this.addChild(obj.name, obj);

            obj = new Spin("Spin02", "absolute", "410", "349", "160", "21", null, null, this);
            obj.set_taborder("9");
            obj.set_value("100");
            obj.set_readonly("true");
            obj.set_cssclass("readonly");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "70", "322", "123", "22", null, null, this);
            obj.set_taborder("26");
            obj.set_text("Normal");
            obj.set_cssclass("pseudo");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "410", "322", "123", "22", null, null, this);
            obj.set_taborder("28");
            obj.set_text("Readonly");
            obj.set_cssclass("pseudo");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "10", "405", null, "8", "10", null, this);
            obj.set_taborder("29");
            obj.set_cssclass("Guide_line");
            this.addChild(obj.name, obj);

            obj = new Static("Static10", "absolute", "17", "431", "273", "16", null, null, this);
            obj.set_taborder("30");
            obj.set_text("Calendar");
            obj.set_cssclass("Guide_title");
            this.addChild(obj.name, obj);

            obj = new Static("Static11", "absolute", "70", "466", "123", "22", null, null, this);
            obj.set_taborder("31");
            obj.set_text("Normal");
            obj.set_cssclass("pseudo");
            this.addChild(obj.name, obj);

            obj = new Static("Static12", "absolute", "218", "466", "123", "22", null, null, this);
            obj.set_taborder("32");
            obj.set_text("Disabled");
            obj.set_cssclass("pseudo");
            this.addChild(obj.name, obj);

            obj = new Static("Static13", "absolute", "368", "466", "123", "22", null, null, this);
            obj.set_taborder("33");
            obj.set_text("Readonly");
            obj.set_cssclass("pseudo");
            this.addChild(obj.name, obj);

            obj = new Calendar("Calendar00", "absolute", "70", "489", "120", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("11");
            obj.set_value("20150715");
            obj.set_dateformat("yyyy-MM-dd");

            obj = new Calendar("Calendar01", "absolute", "218", "489", "120", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("12");
            obj.set_value("20150715");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_enable("false");

            obj = new Calendar("Calendar02", "absolute", "368", "489", "120", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("13");
            obj.set_value("20150715");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_readonly("true");
            obj.set_cssclass("readonly");

            obj = new Calendar("Calendar03", "absolute", "218", "534", "120", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("15");
            obj.set_value("20150715");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_enable("false");
            obj.set_type("spin");

            obj = new Calendar("Calendar04", "absolute", "368", "534", "120", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("16");
            obj.set_value("20150715");
            obj.set_readonly("true");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_type("spin");

            obj = new Calendar("Calendar05", "absolute", "70", "534", "120", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("14");
            obj.set_value("20150715");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_type("spin");

            obj = new Calendar("Calendar06", "absolute", "569", "489", "156", "180", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("19");
            obj.set_value("20150715");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_type("monthonly");
            obj.style.set_usetrailingday("true");
            obj.style.set_padding("0 0 0 0");

            obj = new Static("Static17", "absolute", "539", "463", "123", "22", null, null, this);
            obj.set_taborder("43");
            obj.set_text("Monthonly");
            obj.set_cssclass("pseudo");
            this.addChild(obj.name, obj);

            obj = new Static("Static31", "absolute", "410", "123", "120", "21", null, null, this);
            obj.set_taborder("49");
            obj.set_text("Class : readonly");
            obj.set_cssclass("Guide_class");
            this.addChild(obj.name, obj);

            obj = new Static("Static19", "absolute", "410", "376", "120", "21", null, null, this);
            obj.set_taborder("51");
            obj.set_text("Class : readonly");
            obj.set_cssclass("Guide_class");
            this.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "368", "559", "120", "21", null, null, this);
            obj.set_taborder("53");
            obj.set_text("Class : readonly");
            obj.set_cssclass("Guide_class");
            this.addChild(obj.name, obj);

            obj = new Static("Static34", "absolute", "82", "512", "100", "3", null, null, this);
            obj.set_taborder("62");
            obj.set_cssclass("Guide_Hsize");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static40", "absolute", "569", "670", "177", "5", null, null, this);
            obj.set_taborder("68");
            obj.set_cssclass("Guide_Hsize");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "240", "322", "123", "22", null, null, this);
            obj.set_taborder("74");
            obj.set_text("Disabled");
            obj.set_cssclass("pseudo");
            this.addChild(obj.name, obj);

            obj = new Combo("Combo01", "absolute", "240", "98", "160", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("75");
            obj.set_innerdataset("@ds_cmb");
            obj.set_codecolumn("lv");
            obj.set_datacolumn("data");
            obj.set_displayrowcount("5");
            obj.set_enable("false");
            obj.set_text("넥센타이어");
            obj.set_value("0");
            obj.set_index("0");

            obj = new Spin("Spin01", "absolute", "240", "349", "160", "21", null, null, this);
            obj.set_taborder("76");
            obj.set_value("100");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static24", "absolute", "570", "98", "45", "21", null, null, this);
            obj.set_taborder("77");
            obj.set_text("FIX h21");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static14", "absolute", "562", "349", "45", "21", null, null, this);
            obj.set_taborder("78");
            obj.set_text("FIX h21");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static15", "absolute", "210", "323", "20", "23", null, null, this);
            obj.set_taborder("79");
            obj.set_text("20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static16", "absolute", "170", "477", "20", "23", null, null, this);
            obj.set_taborder("80");
            obj.set_text("20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static18", "absolute", "480", "489", "45", "21", null, null, this);
            obj.set_taborder("81");
            obj.set_text("FIX h21");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static20", "absolute", "720", "489", "25", "21", null, null, this);
            obj.set_taborder("82");
            obj.set_text("h21");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static22", "absolute", "720", "510", "25", "21", null, null, this);
            obj.set_taborder("83");
            obj.set_text("h21");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static23", "absolute", "545", "489", "35", "180", null, null, this);
            obj.set_taborder("84");
            obj.set_text("h180");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static25", "absolute", "569", "657", "156", "21", null, null, this);
            obj.set_taborder("85");
            obj.set_text("w156");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 820, 730, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("Guide_01");
            		p.set_titletext("Combo/ListBox/Spin/Calendar");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script

        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.ListBox01.addEventHandler("onitemclick", this.ListBox01_onitemclick, this);

        };

        this.loadIncludeScript("Guide_02.xfdl");

       
    };
}
)();
