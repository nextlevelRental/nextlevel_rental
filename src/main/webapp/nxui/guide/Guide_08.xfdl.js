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
                this.set_name("Guide_08");
                this.set_classname("Guide_01");
                this.set_titletext("Search Area");
                this._setFormPosition(0,0,1170,730);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize

            
            // UI Components Initialize
            obj = new Static("Static00", "absolute", "17", "16", "273", "16", null, null, this);
            obj.set_taborder("0");
            obj.set_text("Search Area");
            obj.set_cssclass("Guide_title");
            this.addChild(obj.name, obj);

            obj = new Static("Static08", "absolute", "28", "52", "138", "22", null, null, this);
            obj.set_taborder("37");
            obj.set_text("1줄 Search Area");
            obj.set_cssclass("pseudo");
            obj.style.set_align("left middle");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "28", "148", "138", "22", null, null, this);
            obj.set_taborder("38");
            obj.set_text("2줄 Search Area");
            obj.set_cssclass("pseudo");
            obj.style.set_align("left middle");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "28", "271", "138", "22", null, null, this);
            obj.set_taborder("39");
            obj.set_text("3줄 Search Area");
            obj.set_cssclass("pseudo");
            obj.style.set_align("left middle");
            this.addChild(obj.name, obj);

            obj = new Div("Div00", "absolute", "10", "74", "1122", "45", null, null, this);
            obj.set_taborder("43");
            obj.set_text("Div00");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "20", "10", "79", "21", null, null, this.Div00);
            obj.set_taborder("8");
            obj.set_text("가나다라마");
            obj.set_cssclass("sta_WF_schTitle");
            this.Div00.addChild(obj.name, obj);
            obj = new Edit("Edit00", "absolute", "102", "10", "140", "21", null, null, this.Div00);
            obj.set_taborder("14");
            obj.set_tooltiptext("edit");
            this.Div00.addChild(obj.name, obj);
            obj = new Edit("Edit01", "absolute", "353", "10", "140", "21", null, null, this.Div00);
            obj.set_taborder("15");
            obj.set_tooltiptext("edit");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "271", "10", "79", "21", null, null, this.Div00);
            obj.set_taborder("16");
            obj.set_text("가나다라마");
            obj.set_cssclass("sta_WF_schTitle");
            this.Div00.addChild(obj.name, obj);
            obj = new Edit("Edit02", "absolute", "605", "10", "140", "21", null, null, this.Div00);
            obj.set_taborder("17");
            obj.set_tooltiptext("edit");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "523", "10", "79", "21", null, null, this.Div00);
            obj.set_taborder("18");
            obj.set_text("가나다라마");
            obj.set_cssclass("sta_WF_schTitle");
            this.Div00.addChild(obj.name, obj);

            obj = new Div("Div01", "absolute", "10", "172", "1122", "72", null, null, this);
            obj.set_taborder("44");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Edit("Edit02", "absolute", "604", "10", "140", "21", null, null, this.Div01);
            obj.set_taborder("0");
            obj.set_tooltiptext("edit");
            this.Div01.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "46.69%", "10", null, "21", "46.24%", null, this.Div01);
            obj.set_taborder("1");
            obj.set_text("가나다라마");
            obj.set_cssclass("sta_WF_schTitle");
            this.Div01.addChild(obj.name, obj);
            obj = new Edit("Edit01", "absolute", "355", "10", "140", "21", null, null, this.Div01);
            obj.set_taborder("3");
            obj.set_tooltiptext("edit");
            this.Div01.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "24.15%", "10", null, "21", "68.78%", null, this.Div01);
            obj.set_taborder("4");
            obj.set_text("가나다라마");
            obj.set_cssclass("sta_WF_schTitle");
            this.Div01.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "1.79%", "10", null, "21", "91.32%", null, this.Div01);
            obj.set_taborder("6");
            obj.set_text("가나다라마");
            obj.set_cssclass("sta_WF_schTitle");
            this.Div01.addChild(obj.name, obj);
            obj = new Edit("Edit00", "absolute", "100", "10", "140", "21", null, null, this.Div01);
            obj.set_taborder("7");
            obj.set_tooltiptext("edit");
            this.Div01.addChild(obj.name, obj);
            obj = new Edit("Edit03", "absolute", "604", "37", "140", "21", null, null, this.Div01);
            obj.set_taborder("8");
            obj.set_tooltiptext("edit");
            this.Div01.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "46.69%", "37", null, "21", "46.24%", null, this.Div01);
            obj.set_taborder("9");
            obj.set_text("가나다라마");
            obj.set_cssclass("sta_WF_schTitle");
            this.Div01.addChild(obj.name, obj);
            obj = new Edit("Edit04", "absolute", "355", "37", "140", "21", null, null, this.Div01);
            obj.set_taborder("10");
            obj.set_tooltiptext("edit");
            this.Div01.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "24.15%", "37", null, "21", "68.78%", null, this.Div01);
            obj.set_taborder("11");
            obj.set_text("가나다라마");
            obj.set_cssclass("sta_WF_schTitle");
            this.Div01.addChild(obj.name, obj);
            obj = new Edit("Edit05", "absolute", "100", "37", "140", "21", null, null, this.Div01);
            obj.set_taborder("12");
            obj.set_tooltiptext("edit");
            this.Div01.addChild(obj.name, obj);
            obj = new Static("Static05", "absolute", "1.79%", "37", null, "21", "91.32%", null, this.Div01);
            obj.set_taborder("13");
            obj.set_text("가나다라마");
            obj.set_cssclass("sta_WF_schTitle");
            this.Div01.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "816", "47", "267", "27", null, null, this);
            obj.set_taborder("49");
            obj.set_text("┌  한 줄 늘어날 때마다 height가 27px씩 늘어난다.");
            obj.set_cssclass("Guide_number");
            obj.set_visible("false");
            obj.style.set_linespace("3");
            this.addChild(obj.name, obj);

            obj = new Static("Static83", "absolute", "816", "74", "25", "44", null, null, this);
            obj.set_taborder("50");
            obj.set_text("h45");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "816", "172", "25", "72", null, null, this);
            obj.set_taborder("51");
            obj.set_text("h72");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "10", "74", "20", "45", null, null, this);
            obj.set_taborder("53");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static22", "absolute", "30", "74", "718", "12", null, null, this);
            obj.set_taborder("68");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static23", "absolute", "30", "107", "718", "12", null, null, this);
            obj.set_taborder("69");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static24", "absolute", "254", "74", "30", "44", null, null, this);
            obj.set_taborder("70");
            obj.set_text("FIX w30");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static25", "absolute", "505", "74", "30", "44", null, null, this);
            obj.set_taborder("71");
            obj.set_text("FIX w30");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static29", "absolute", "11", "205", "737", "6", null, null, this);
            obj.set_taborder("75");
            obj.set_text("FIX h6");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static26", "absolute", null, "172", "737", "12", "423", null, this);
            obj.set_taborder("84");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static27", "absolute", "12", "232", "737", "12", null, null, this);
            obj.set_taborder("85");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Div("Div02", "absolute", "12", "304", "1122", "99", null, null, this);
            obj.set_taborder("86");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Edit("Edit02", "absolute", "605", "10", "140", "21", null, null, this.Div02);
            obj.set_taborder("14");
            obj.set_tooltiptext("edit");
            this.Div02.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "46.78%", "10", null, "21", "46.15%", null, this.Div02);
            obj.set_taborder("15");
            obj.set_text("가나다라마");
            obj.set_cssclass("sta_WF_schTitle");
            this.Div02.addChild(obj.name, obj);
            obj = new Edit("Edit01", "absolute", "356", "10", "140", "21", null, null, this.Div02);
            obj.set_taborder("16");
            obj.set_tooltiptext("edit");
            this.Div02.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "24.24%", "10", null, "21", "68.69%", null, this.Div02);
            obj.set_taborder("17");
            obj.set_text("가나다라마");
            obj.set_cssclass("sta_WF_schTitle");
            this.Div02.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "1.79%", "10", null, "21", "91.32%", null, this.Div02);
            obj.set_taborder("18");
            obj.set_text("가나다라마");
            obj.set_cssclass("sta_WF_schTitle");
            this.Div02.addChild(obj.name, obj);
            obj = new Edit("Edit00", "absolute", "101", "10", "140", "21", null, null, this.Div02);
            obj.set_taborder("19");
            obj.set_tooltiptext("edit");
            this.Div02.addChild(obj.name, obj);
            obj = new Edit("Edit03", "absolute", "605", "37", "140", "21", null, null, this.Div02);
            obj.set_taborder("20");
            obj.set_tooltiptext("edit");
            this.Div02.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "46.78%", "37", null, "21", "46.15%", null, this.Div02);
            obj.set_taborder("21");
            obj.set_text("가나다라마");
            obj.set_cssclass("sta_WF_schTitle");
            this.Div02.addChild(obj.name, obj);
            obj = new Edit("Edit04", "absolute", "356", "37", "140", "21", null, null, this.Div02);
            obj.set_taborder("22");
            obj.set_tooltiptext("edit");
            this.Div02.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "24.24%", "37", null, "21", "68.69%", null, this.Div02);
            obj.set_taborder("23");
            obj.set_text("가나다라마");
            obj.set_cssclass("sta_WF_schTitle");
            this.Div02.addChild(obj.name, obj);
            obj = new Edit("Edit05", "absolute", "101", "37", "140", "21", null, null, this.Div02);
            obj.set_taborder("24");
            obj.set_tooltiptext("edit");
            this.Div02.addChild(obj.name, obj);
            obj = new Static("Static05", "absolute", "1.79%", "37", null, "21", "91.32%", null, this.Div02);
            obj.set_taborder("25");
            obj.set_text("가나다라마");
            obj.set_cssclass("sta_WF_schTitle");
            this.Div02.addChild(obj.name, obj);
            obj = new Edit("Edit06", "absolute", "605", "64", "140", "21", null, null, this.Div02);
            obj.set_taborder("26");
            obj.set_tooltiptext("edit");
            this.Div02.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "46.78%", "64", null, "21", "46.15%", null, this.Div02);
            obj.set_taborder("27");
            obj.set_text("가나다라마");
            obj.set_cssclass("sta_WF_schTitle");
            this.Div02.addChild(obj.name, obj);
            obj = new Edit("Edit07", "absolute", "356", "64", "140", "21", null, null, this.Div02);
            obj.set_taborder("28");
            obj.set_tooltiptext("edit");
            this.Div02.addChild(obj.name, obj);
            obj = new Static("Static07", "absolute", "24.24%", "64", null, "21", "68.69%", null, this.Div02);
            obj.set_taborder("29");
            obj.set_text("가나다라마");
            obj.set_cssclass("sta_WF_schTitle");
            this.Div02.addChild(obj.name, obj);
            obj = new Edit("Edit08", "absolute", "101", "64", "140", "21", null, null, this.Div02);
            obj.set_taborder("30");
            obj.set_tooltiptext("edit");
            this.Div02.addChild(obj.name, obj);
            obj = new Static("Static08", "absolute", "1.79%", "64", null, "21", "91.32%", null, this.Div02);
            obj.set_taborder("31");
            obj.set_text("가나다라마");
            obj.set_cssclass("sta_WF_schTitle");
            this.Div02.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "816", "304", "25", "99", null, null, this);
            obj.set_taborder("87");
            obj.set_text("h99");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static07", "absolute", "1.03%", "304", null, "12", "35.49%", null, this);
            obj.set_taborder("88");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static09", "absolute", "1.03%", "391", null, "12", "35.49%", null, this);
            obj.set_taborder("89");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1122, 45, this.Div00,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("43");
            		p.set_text("Div00");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.Div00.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1122, 72, this.Div01,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("44");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.Div01.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1122, 99, this.Div02,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("86");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.Div02.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1170, 730, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("Guide_01");
            		p.set_titletext("Search Area");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.registerScript("Guide_08.xfdl", function() {
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

        this.loadIncludeScript("Guide_08.xfdl");

       
    };
}
)();
