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
                this.set_name("Guide_01");
                this.set_classname("Guide_01");
                this.set_titletext("Static/Edit/MaskEdit/TextArea");
                this._setFormPosition(0,0,779,730);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize

            
            // UI Components Initialize
            obj = new Static("Static00", "absolute", "17", "16", "112", "16", null, null, this);
            obj.set_taborder("0");
            obj.set_text("Static");
            obj.set_cssclass("Guide_title");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "58", "51", "123", "22", null, null, this);
            obj.set_taborder("1");
            obj.set_text("Normal / Mouseover");
            obj.set_cssclass("pseudo");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "58", "73", "164", "21", null, null, this);
            obj.set_taborder("2");
            obj.set_text("넥센타이어");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "242", "73", "164", "21", null, null, this);
            obj.set_taborder("3");
            obj.set_text("넥센타이어");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "242", "51", "51", "22", null, null, this);
            obj.set_taborder("4");
            obj.set_text("Disabled");
            obj.set_cssclass("pseudo");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "10", "109", null, "8", "10", null, this);
            obj.set_taborder("5");
            obj.set_cssclass("Guide_line");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "17", "135", "112", "16", null, null, this);
            obj.set_taborder("6");
            obj.set_text("Edit");
            obj.set_cssclass("Guide_title");
            this.addChild(obj.name, obj);

            obj = new Edit("Edit00", "absolute", "59", "197", "140", "21", null, null, this);
            obj.set_taborder("7");
            obj.set_tooltiptext("edit");
            obj.set_value("넥센타이어");
            this.addChild(obj.name, obj);

            obj = new Static("Static07", "absolute", "58", "165", "123", "22", null, null, this);
            obj.set_taborder("8");
            obj.set_text("Normal");
            obj.set_cssclass("pseudo");
            this.addChild(obj.name, obj);

            obj = new Static("Static08", "absolute", "218", "165", "123", "22", null, null, this);
            obj.set_taborder("9");
            obj.set_text("Disabled");
            obj.set_cssclass("pseudo");
            this.addChild(obj.name, obj);

            obj = new Edit("Edit01", "absolute", "219", "197", "140", "21", null, null, this);
            obj.set_taborder("10");
            obj.set_value("넥센타이어");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static09", "absolute", "378", "165", "123", "22", null, null, this);
            obj.set_taborder("11");
            obj.set_text("Readonly");
            obj.set_cssclass("pseudo");
            this.addChild(obj.name, obj);

            obj = new Edit("Edit02", "absolute", "379", "197", "140", "21", null, null, this);
            obj.set_taborder("12");
            obj.set_value("넥센타이어");
            obj.set_cssclass("readonly");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("Static10", "absolute", "17", "279", "112", "16", null, null, this);
            obj.set_taborder("13");
            obj.set_text("MaskEdit");
            obj.set_cssclass("Guide_title");
            this.addChild(obj.name, obj);

            obj = new Static("Static11", "absolute", "58", "309", "123", "22", null, null, this);
            obj.set_taborder("14");
            obj.set_text("Normal");
            obj.set_cssclass("pseudo");
            this.addChild(obj.name, obj);

            obj = new Static("Static12", "absolute", "218", "309", "123", "22", null, null, this);
            obj.set_taborder("15");
            obj.set_text("Disabled");
            obj.set_cssclass("pseudo");
            this.addChild(obj.name, obj);

            obj = new Static("Static13", "absolute", "378", "309", "123", "22", null, null, this);
            obj.set_taborder("17");
            obj.set_text("Readonly");
            obj.set_cssclass("pseudo");
            this.addChild(obj.name, obj);

            obj = new Static("Static14", "absolute", "10", "253", null, "8", "10", null, this);
            obj.set_taborder("19");
            obj.set_cssclass("Guide_line");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("MaskEdit00", "absolute", "59", "341", "140", "21", null, null, this);
            obj.set_taborder("20");
            obj.set_value("100000");
            obj.set_mask("###,###");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("MaskEdit01", "absolute", "379", "341", "140", "21", null, null, this);
            obj.set_taborder("21");
            obj.set_value("100000");
            obj.set_readonly("true");
            obj.set_mask("###,###");
            obj.set_cssclass("readonly");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("MaskEdit02", "absolute", "219", "341", "140", "21", null, null, this);
            obj.set_taborder("22");
            obj.set_value("100000");
            obj.set_enable("false");
            obj.set_mask("###,###");
            this.addChild(obj.name, obj);

            obj = new Static("Static15", "absolute", "58", "458", "123", "22", null, null, this);
            obj.set_taborder("23");
            obj.set_text("Normal");
            obj.set_cssclass("pseudo");
            this.addChild(obj.name, obj);

            obj = new Static("Static16", "absolute", "238", "458", "123", "22", null, null, this);
            obj.set_taborder("24");
            obj.set_text("Disabled");
            obj.set_cssclass("pseudo");
            this.addChild(obj.name, obj);

            obj = new Static("Static17", "absolute", "418", "458", "123", "22", null, null, this);
            obj.set_taborder("25");
            obj.set_text("Readonly");
            obj.set_cssclass("pseudo");
            this.addChild(obj.name, obj);

            obj = new Static("Static18", "absolute", "10", "397", null, "8", "10", null, this);
            obj.set_taborder("26");
            obj.set_cssclass("Guide_line");
            this.addChild(obj.name, obj);

            obj = new TextArea("TextArea00", "absolute", "59", "485", "160", "120", null, null, this);
            obj.set_taborder("27");
            obj.set_value("넥센타이어\r\n넥센타이어\r\n넥센타이어\r\n넥센타이어\r\n넥센타이어\r\n넥센타이어\r\n넥센타이어\r\n넥센타이어");
            obj.getSetter("mask").set("###,###");
            this.addChild(obj.name, obj);

            obj = new TextArea("TextArea01", "absolute", "419", "485", "160", "120", null, null, this);
            obj.set_taborder("28");
            obj.set_value("넥센타이어\r\n넥센타이어\r\n넥센타이어\r\n넥센타이어\r\n넥센타이어\r\n넥센타이어\r\n넥센타이어\r\n넥센타이어");
            obj.set_readonly("true");
            obj.getSetter("mask").set("###,###");
            obj.set_cssclass("readonly");
            this.addChild(obj.name, obj);

            obj = new TextArea("TextArea02", "absolute", "239", "485", "160", "120", null, null, this);
            obj.set_taborder("29");
            obj.set_value("넥센타이어\r\n넥센타이어\r\n넥센타이어\r\n넥센타이어\r\n넥센타이어\r\n넥센타이어\r\n넥센타이어\r\n넥센타이어");
            obj.getSetter("mask").set("###,###");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static19", "absolute", "17", "423", "112", "16", null, null, this);
            obj.set_taborder("30");
            obj.set_text("TextArea");
            obj.set_cssclass("Guide_title");
            this.addChild(obj.name, obj);

            obj = new Static("Static31", "absolute", "379", "223", "120", "21", null, null, this);
            obj.set_taborder("47");
            obj.set_text("Class : readonly");
            obj.set_cssclass("Guide_class");
            this.addChild(obj.name, obj);

            obj = new Static("Static34", "absolute", "379", "365", "120", "21", null, null, this);
            obj.set_taborder("50");
            obj.set_text("Class : readonly");
            obj.set_cssclass("Guide_class");
            this.addChild(obj.name, obj);

            obj = new Static("Static36", "absolute", "419", "608", "120", "21", null, null, this);
            obj.set_taborder("52");
            obj.set_text("Class : readonly");
            obj.set_cssclass("Guide_class");
            this.addChild(obj.name, obj);

            obj = new Static("Static20", "absolute", "352", "68", "135", "30", null, null, this);
            obj.set_taborder("53");
            obj.set_text("메인타이틀");
            obj.set_cssclass("sta_WF_title");
            this.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "518", "73", "83", "20", null, null, this);
            obj.set_taborder("54");
            obj.set_text("서브타이틀");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static22", "absolute", "636", "73", "83", "20", null, null, this);
            obj.set_taborder("55");
            obj.set_text("조회타이틀");
            obj.set_cssclass("sta_WF_schTitle");
            this.addChild(obj.name, obj);

            obj = new TextArea("TextArea03", "absolute", "801", "35", "499", "127", null, null, this);
            obj.set_taborder("56");
            obj.set_value("fs 글자의 크기(fontsize)를 지정합니다.  ex)<fs v='12'></fs>\r\nfc 글자의 색상(fontcolor)를 지정합니다.  ex)<fc v='red'></fc><fc v='#FF00FF'></fc>\r\nff 글자의 종류(fontface)를 지정합니다.  ex)<ff v='굴림'></ff>\r\nb 굵은글씨를(bold)를 지정합니다. ex)<b v='true'></b>\r\ni 이텔릭체를 (italic)를 지정합니다.  ex)<i v='true'></i>\r\nu 언더라인을(underline)를 지정합니다.  ex)<u v='true'></u>\r\ns 취소선(strike)를 지정합니다.  ex)<s v='true'></s>");
            obj.set_wordwrap("true");
            obj.set_readonly("true");
            obj.set_linespace("3");
            obj.style.set_linespace("3");
            obj.style.set_background("#ffffffff");
            obj.style.set_color("#9a080aff");
            obj.style.set_shadow("outer 0,0 0 gray");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static62", "absolute", "802", "13", "255", "15", null, null, this);
            obj.set_taborder("57");
            obj.set_text("※ usedecorate =\"<b v='true'>true</b>\"");
            obj.set_usedecorate("true");
            obj.getSetter("class").set("sta_WF_Info_Orange");
            obj.set_tooltiptype("default");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static23", "absolute", "462", "68", "45", "30", null, null, this);
            obj.set_taborder("58");
            obj.set_text("FIX h30");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static26", "absolute", "582", "73", "45", "20", null, null, this);
            obj.set_taborder("59");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static27", "absolute", "701", "73", "45", "20", null, null, this);
            obj.set_taborder("60");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static32", "absolute", "511", "197", "45", "21", null, null, this);
            obj.set_taborder("61");
            obj.set_text("FIX h21");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static24", "absolute", "511", "341", "45", "21", null, null, this);
            obj.set_taborder("62");
            obj.set_text("FIX h21");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 779, 730, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("Guide_01");
            		p.set_titletext("Static/Edit/MaskEdit/TextArea");

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
            this.TextArea03.addEventHandler("oneditclick", this.TextArea03_oneditclick, this);

        };

        this.loadIncludeScript("Guide_01.xfdl");

       
    };
}
)();
