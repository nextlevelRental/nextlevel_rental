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
                this.set_name("Guide_07");
                this.set_classname("Guide_01");
                this.set_titletext("PopupMenu/GroupBox/ProgressBar/Confirm/Alert");
                this._setFormPosition(0,0,710,1114);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_menu", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"idx\" type=\"STRING\" size=\"256\"/><Column id=\"lev\" type=\"STRING\" size=\"256\"/><Column id=\"UserData\" type=\"STRING\" size=\"256\"/><Column id=\"Caption\" type=\"STRING\" size=\"256\"/><Column id=\"enable\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"lev\">0</Col><Col id=\"UserData\">PopupMenu01</Col><Col id=\"Caption\">PopupMenu01</Col><Col id=\"idx\">1000</Col><Col id=\"enable\">1</Col></Row><Row><Col id=\"UserData\">PopupMenu02</Col><Col id=\"Caption\">PopupMenu02</Col><Col id=\"lev\">0</Col><Col id=\"idx\">1001</Col><Col id=\"enable\">1</Col></Row><Row><Col id=\"UserData\">PopupMenu01</Col><Col id=\"Caption\">PopupMenu01</Col><Col id=\"lev\">1</Col><Col id=\"idx\">1002</Col><Col id=\"enable\">1</Col></Row><Row><Col id=\"UserData\">PopupMenu02</Col><Col id=\"Caption\">PopupMenu02</Col><Col id=\"lev\">1</Col><Col id=\"idx\">1003</Col><Col id=\"enable\">0</Col></Row><Row><Col id=\"UserData\">PopupMenu03</Col><Col id=\"Caption\">PopupMenu03</Col><Col id=\"lev\">1</Col><Col id=\"idx\">1004</Col><Col id=\"enable\">1</Col></Row><Row><Col id=\"UserData\">PopupMenu04</Col><Col id=\"Caption\">PopupMenu04</Col><Col id=\"lev\">1</Col><Col id=\"idx\">1005</Col><Col id=\"enable\">0</Col></Row><Row><Col id=\"UserData\">PopupMenu05</Col><Col id=\"Caption\">PopupMenu05</Col><Col id=\"lev\">1</Col><Col id=\"idx\">1006</Col><Col id=\"enable\">1</Col></Row><Row><Col id=\"UserData\">PopupMenu03</Col><Col id=\"Caption\">PopupMenu03</Col><Col id=\"lev\">0</Col><Col id=\"idx\">1007</Col><Col id=\"enable\">1</Col></Row><Row><Col id=\"UserData\">PopupMenu04</Col><Col id=\"Caption\">PopupMenu04</Col><Col id=\"lev\">0</Col><Col id=\"idx\">1008</Col><Col id=\"enable\">1</Col></Row><Row><Col id=\"UserData\">PopupMenu01</Col><Col id=\"Caption\">PopupMenu01</Col><Col id=\"lev\">1</Col><Col id=\"idx\">1009</Col><Col id=\"enable\">1</Col></Row><Row><Col id=\"UserData\">PopupMenu02</Col><Col id=\"Caption\">PopupMenu02</Col><Col id=\"lev\">1</Col><Col id=\"idx\">1010</Col><Col id=\"enable\">1</Col></Row><Row><Col id=\"UserData\">PopupMenu03</Col><Col id=\"Caption\">PopupMenu03</Col><Col id=\"lev\">1</Col><Col id=\"idx\">1011</Col><Col id=\"enable\">1</Col></Row><Row><Col id=\"UserData\">PopupMenu04</Col><Col id=\"Caption\">PopupMenu04</Col><Col id=\"lev\">1</Col><Col id=\"idx\">1012</Col><Col id=\"enable\">1</Col></Row><Row><Col id=\"UserData\">PopupMenu05</Col><Col id=\"Caption\">PopupMenu05</Col><Col id=\"lev\">0</Col><Col id=\"idx\">1013</Col><Col id=\"enable\">1</Col></Row></Rows>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static00", "absolute", "17", "16", "273", "16", null, null, this);
            obj.set_taborder("0");
            obj.set_text("PopupMenu");
            obj.set_cssclass("Guide_title");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "10", "184", null, "11", "10", null, this);
            obj.set_taborder("34");
            obj.set_cssclass("Guide_line");
            this.addChild(obj.name, obj);

            obj = new Button("Button00", "absolute", "49", "51", "100", "21", null, null, this);
            obj.set_taborder("35");
            obj.set_text("PopupMenu");
            this.addChild(obj.name, obj);

            obj = new PopupMenu("PopupMenu00", "absolute", "49", "72", "124", "106", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_innerdataset("@ds_menu");
            obj.set_idcolumn("idx");
            obj.set_captioncolumn("Caption");
            obj.set_levelcolumn("lev");
            obj.set_userdatacolumn("UserData");
            obj.set_enablecolumn("enable");

            obj = new Static("Static01", "absolute", "17", "210", "273", "16", null, null, this);
            obj.set_taborder("36");
            obj.set_text("GroupBox");
            obj.set_cssclass("Guide_title");
            this.addChild(obj.name, obj);

            obj = new GroupBox("GroupBox00", "absolute", "49", "272", "205", "138", null, null, this);
            obj.set_text("GroupBox");
            obj.set_taborder("37");
            this.addChild(obj.name, obj);

            obj = new GroupBox("GroupBox01", "absolute", "354", "272", "205", "138", null, null, this);
            obj.set_text("GroupBox");
            obj.set_taborder("38");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "17", "461", "273", "16", null, null, this);
            obj.set_taborder("39");
            obj.set_text("ProgressBar");
            obj.set_cssclass("Guide_title");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "10", "430", null, "11", "10", null, this);
            obj.set_taborder("40");
            obj.set_cssclass("Guide_line");
            this.addChild(obj.name, obj);

            obj = new ProgressBar("ProgressBar00", "absolute", "49", "538", "235", "9", null, null, this);
            obj.set_taborder("41");
            obj.set_max("100");
            obj.set_min("0");
            obj.set_pos("65");
            this.addChild(obj.name, obj);

            obj = new ProgressBar("ProgressBar01", "absolute", "49", "567", "235", "9", null, null, this);
            obj.set_taborder("42");
            obj.set_max("100");
            obj.set_min("0");
            obj.set_pos("100");
            this.addChild(obj.name, obj);

            obj = new ProgressBar("ProgressBar02", "absolute", "49", "626", "300", "9", null, null, this);
            obj.set_taborder("43");
            obj.set_max("100");
            obj.set_min("0");
            this.addChild(obj.name, obj);

            obj = new Button("Button01", "absolute", "369", "620", "120", "21", null, null, this);
            obj.set_taborder("44");
            obj.set_text("Progress Test");
            this.addChild(obj.name, obj);

            obj = new ProgressBar("ProgressBar03", "absolute", "354", "567", "235", "9", null, null, this);
            obj.set_taborder("45");
            obj.set_max("100");
            obj.set_min("0");
            obj.set_pos("100");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new ProgressBar("ProgressBar04", "absolute", "354", "538", "235", "9", null, null, this);
            obj.set_taborder("46");
            obj.set_max("100");
            obj.set_min("0");
            obj.set_pos("65");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static07", "absolute", "49", "245", "123", "22", null, null, this);
            obj.set_taborder("47");
            obj.set_text("Normal");
            obj.set_cssclass("pseudo");
            this.addChild(obj.name, obj);

            obj = new Static("Static08", "absolute", "354", "245", "123", "22", null, null, this);
            obj.set_taborder("48");
            obj.set_text("Disabled");
            obj.set_cssclass("pseudo");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "354", "496", "93", "22", null, null, this);
            obj.set_taborder("49");
            obj.set_text("Disabled");
            obj.set_cssclass("pseudo");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "49", "496", "93", "22", null, null, this);
            obj.set_taborder("50");
            obj.set_text("Normal");
            obj.set_cssclass("pseudo");
            this.addChild(obj.name, obj);

            obj = new FileUpload("FileUpload00", "absolute", "367", "82", "266", "23", null, null, this);
            obj.set_taborder("51");
            obj.getSetter("retry").set("0");
            obj.set_index("0");
            this.addChild(obj.name, obj);

            obj = new FileDownload("FileDownload00", "absolute", "367", "51", "100", "23", null, null, this);
            obj.set_taborder("52");
            obj.getSetter("retry").set("0");
            obj.set_text("FileDownload");
            this.addChild(obj.name, obj);

            obj = new Static("Static09", "absolute", "344", "16", "273", "16", null, null, this);
            obj.set_taborder("53");
            obj.set_text("FileUpload / FileDownload");
            obj.set_cssclass("Guide_title");
            this.addChild(obj.name, obj);

            obj = new Static("Static14", "absolute", "555", "104", "78", "5", null, null, this);
            obj.set_taborder("60");
            obj.set_cssclass("Guide_Hsize");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static33", "absolute", "348", "51", "25", "23", null, null, this);
            obj.set_taborder("61");
            obj.set_text("h23");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static10", "absolute", "348", "82", "25", "23", null, null, this);
            obj.set_taborder("62");
            obj.set_text("h23");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static11", "absolute", "2.39%", "757", null, "16", "59.15%", null, this);
            obj.set_taborder("63");
            obj.set_text("Confirm / Alert");
            obj.set_cssclass("Guide_title");
            this.addChild(obj.name, obj);

            obj = new Static("Static12", "absolute", "1.41%", "726", null, "11", "1.41%", null, this);
            obj.set_taborder("64");
            obj.set_cssclass("Guide_line");
            this.addChild(obj.name, obj);

            obj = new Div("Div00", "absolute", "23", "792", "285", "140", null, null, this);
            obj.set_taborder("65");
            obj.set_text("Div00");
            obj.set_cssclass("div_WF_conpop");
            this.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "0", "0", "281", "25", null, null, this.Div00);
            obj.set_taborder("0");
            obj.set_text("Confirm");
            obj.set_cssclass("sta_WF_conpopTitle");
            this.Div00.addChild(obj.name, obj);
            obj = new Button("Button01", "absolute", "258", "4", "13", "13", null, null, this.Div00);
            obj.set_taborder("2");
            obj.set_cssclass("btn_WF_popClose");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "98", "67", "144", "22", null, null, this.Div00);
            obj.set_taborder("3");
            obj.set_text("승인하시겠습니까?");
            this.Div00.addChild(obj.name, obj);
            obj = new ImageViewer("ImageViewer00", "absolute", null, "49", "52", "52", "208", null, this.Div00);
            obj.set_taborder("4");
            obj.style.set_background("URL('image::alert_confirm.png')");
            obj.style.set_border("0 none #808080ff");
            this.Div00.addChild(obj.name, obj);
            obj = new Button("Button00", "absolute", "51.96%", "104", null, "21", "29.18%", null, this.Div00);
            obj.set_taborder("5");
            obj.set_text("아니오");
            this.Div00.addChild(obj.name, obj);
            obj = new Button("Button02", "absolute", "88", "104", null, "21", "140", null, this.Div00);
            obj.set_taborder("6");
            obj.set_text("예");
            this.Div00.addChild(obj.name, obj);

            obj = new ImageViewer("ImageViewer01", "absolute", "56", "960", "52", "52", null, null, this);
            obj.set_taborder("67");
            obj.style.set_background("URL('image::alert_question.png')");
            obj.style.set_border("0 none #808080ff");
            this.addChild(obj.name, obj);

            obj = new ImageViewer("ImageViewer02", "absolute", "136", "960", "52", "52", null, null, this);
            obj.set_taborder("68");
            obj.style.set_background("URL('image::alert_error.png')");
            obj.style.set_border("0 none #808080ff");
            this.addChild(obj.name, obj);

            obj = new ImageViewer("ImageViewer03", "absolute", "216", "960", "52", "52", null, null, this);
            obj.set_taborder("69");
            obj.style.set_background("URL('image::alert_information.png')");
            obj.style.set_border("0 none #808080ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static15", "absolute", "56", "1020", "54", "22", null, null, this);
            obj.set_taborder("71");
            obj.set_text("question");
            obj.set_cssclass("pseudo");
            this.addChild(obj.name, obj);

            obj = new Static("Static16", "absolute", "145", "1020", "41", "22", null, null, this);
            obj.set_taborder("72");
            obj.set_text("error");
            obj.set_cssclass("pseudo");
            this.addChild(obj.name, obj);

            obj = new Static("Static17", "absolute", "211", "1020", "64", "22", null, null, this);
            obj.set_taborder("73");
            obj.set_text("information");
            obj.set_cssclass("pseudo");
            this.addChild(obj.name, obj);

            obj = new Div("Div01", "absolute", "351", "792", "285", "140", null, null, this);
            obj.set_taborder("74");
            obj.set_text("Div00");
            obj.set_cssclass("div_WF_alrpop");
            this.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "0%", "0", null, "25", "0%", null, this.Div01);
            obj.set_taborder("7");
            obj.set_text("Confirm");
            obj.set_cssclass("sta_WF_alrpopTitle");
            this.Div01.addChild(obj.name, obj);
            obj = new Button("Button01", "absolute", "91.81%", "4", null, "13", "3.56%", null, this.Div01);
            obj.set_taborder("8");
            obj.set_cssclass("btn_WF_popClose");
            this.Div01.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "34.88%", "67", null, "22", "13.88%", null, this.Div01);
            obj.set_taborder("9");
            obj.set_text("오류가 발생했습니다.");
            this.Div01.addChild(obj.name, obj);
            obj = new ImageViewer("ImageViewer00", "absolute", "21", "49", "52", "52", null, null, this.Div01);
            obj.set_taborder("10");
            obj.style.set_background("URL('image::con_default.png')");
            obj.style.set_border("0 none #808080ff");
            this.Div01.addChild(obj.name, obj);
            obj = new Button("Button02", "absolute", "39.86%", "104", null, "21", "41.28%", null, this.Div01);
            obj.set_taborder("12");
            obj.set_text("예");
            this.Div01.addChild(obj.name, obj);

            obj = new ImageViewer("ImageViewer00", "absolute", "384", "960", "52", "52", null, null, this);
            obj.set_taborder("75");
            obj.style.set_background("URL('image::con_question.png')");
            obj.style.set_border("0 none #808080ff");
            this.addChild(obj.name, obj);

            obj = new ImageViewer("ImageViewer04", "absolute", "464", "960", "52", "52", null, null, this);
            obj.set_taborder("76");
            obj.style.set_background("URL('image::con_error.png')");
            obj.style.set_border("0 none #808080ff");
            this.addChild(obj.name, obj);

            obj = new ImageViewer("ImageViewer05", "absolute", "544", "960", "52", "52", null, null, this);
            obj.set_taborder("77");
            obj.style.set_background("URL('image::con_information.png')");
            obj.style.set_border("0 none #808080ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static13", "absolute", "384", "1020", "54", "22", null, null, this);
            obj.set_taborder("78");
            obj.set_text("question");
            obj.set_cssclass("pseudo");
            this.addChild(obj.name, obj);

            obj = new Static("Static18", "absolute", "473", "1020", "41", "22", null, null, this);
            obj.set_taborder("79");
            obj.set_text("error");
            obj.set_cssclass("pseudo");
            this.addChild(obj.name, obj);

            obj = new Static("Static19", "absolute", "539", "1020", "64", "22", null, null, this);
            obj.set_taborder("80");
            obj.set_text("information");
            obj.set_cssclass("pseudo");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 285, 140, this.Div00,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("65");
            		p.set_text("Div00");
            		p.set_cssclass("div_WF_conpop");

            	}
            );
            this.Div00.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 285, 140, this.Div01,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("74");
            		p.set_text("Div00");
            		p.set_cssclass("div_WF_alrpop");

            	}
            );
            this.Div01.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 710, 1114, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("Guide_01");
            		p.set_titletext("PopupMenu/GroupBox/ProgressBar/Confirm/Alert");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.registerScript("Guide_07.xfdl", function() {
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
            this.Button00.addEventHandler("onclick", this.Button00_onclick, this);
            this.PopupMenu00.addEventHandler("onmenuclick", this.PopupMenu00_onmenuclick, this);
            this.Button01.addEventHandler("onclick", this.Button01_onclick, this);

        };

        this.loadIncludeScript("Guide_07.xfdl");

       
    };
}
)();
