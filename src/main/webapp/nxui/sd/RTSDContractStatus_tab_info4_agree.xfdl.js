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
                this.set_name("RTSDContractStatus_tab_info4_agree");
                this.set_classname("RTSDContractStatus_tab_info4_agree");
                this.set_titletext("[STEP4]동의,인증");
                this._setFormPosition(0,0,1147,150);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_agree", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"certNm\" type=\"STRING\" size=\"256\"/><Column id=\"certYn\" type=\"STRING\" size=\"256\"/><Column id=\"crdtStat\" type=\"STRING\" size=\"256\"/><Column id=\"nagYn\" type=\"STRING\" size=\"256\"/><Column id=\"statCd1\" type=\"STRING\" size=\"256\"/><Column id=\"statCd2\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static03", "absolute", "0", "5", "1107", "31", null, null, this);
            obj.set_taborder("0");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_crdtStat", "absolute", "685", "10", "142", "21", null, null, this);
            obj.set_taborder("3");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_crdtStat", "absolute", "555", "5", "125", "31", null, null, this);
            obj.set_taborder("4");
            obj.set_text("신용조회상태");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_certYn", "absolute", "408", "10", "142", "21", null, null, this);
            obj.set_taborder("5");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_certYn", "absolute", "278", "5", "125", "31", null, null, this);
            obj.set_taborder("6");
            obj.set_text("본인인증상태");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_certNm", "absolute", "130", "10", "142", "21", null, null, this);
            obj.set_taborder("7");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_certNm", "absolute", "0", "5", "125", "31", null, null, this);
            obj.set_taborder("8");
            obj.set_text("본인인증방법");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "35", "1107", "31", null, null, this);
            obj.set_taborder("9");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_nagYn", "absolute", "130", "40", "142", "21", null, null, this);
            obj.set_taborder("16");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_nagYn", "absolute", "0", "35", "125", "31", null, null, this);
            obj.set_taborder("17");
            obj.set_text("정보제공동의");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "0", "0", null, "5", "0", null, this);
            obj.set_taborder("27");
            obj.set_text("w5");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static83", "absolute", "1107", "0", "40", null, null, "0", this);
            obj.set_taborder("28");
            obj.set_text("w40");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("st_statCd1", "absolute", "278", "35", "125", "31", null, null, this);
            obj.set_taborder("29");
            obj.set_text("계약서");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_statCd1", "absolute", "408", "40", "142", "21", null, null, this);
            obj.set_taborder("30");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_statCd2", "absolute", "556", "35", "125", "31", null, null, this);
            obj.set_taborder("31");
            obj.set_text("장착확인");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_statCd2", "absolute", "686", "40", "142", "21", null, null, this);
            obj.set_taborder("32");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1147, 150, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTSDContractStatus_tab_info4_agree");
            		p.set_titletext("[STEP4]동의,인증");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item0","ed_certNm","value","ds_agree","certNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item1","ed_certYn","value","ds_agree","certYn");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item2","ed_crdtStat","value","ds_agree","crdtStat");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item3","ed_nagYn","value","ds_agree","nagYn");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item4","ed_statCd1","value","ds_agree","statCd1");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item5","ed_statCd2","value","ds_agree","statCd2");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script

        
        // Regist UI Components Event
        this.on_initEvent = function()
        {

        };

        this.loadIncludeScript("RTSDContractStatus_tab_info4_agree.xfdl");

       
    };
}
)();
