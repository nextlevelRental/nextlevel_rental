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
                this.set_name("RTSDContractStatus_tab_info6_seller");
                this.set_classname("RTSDContractStatus_tab_info6_seller");
                this.set_titletext("[STEP6]판매인정보");
                this._setFormPosition(0,0,1147,150);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_seller", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"ordAgent\" type=\"STRING\" size=\"256\"/><Column id=\"orgAgnm\" type=\"STRING\" size=\"256\"/><Column id=\"orgAgtel\" type=\"STRING\" size=\"256\"/><Column id=\"orgCd\" type=\"STRING\" size=\"256\"/><Column id=\"orgNm\" type=\"STRING\" size=\"256\"/><Column id=\"orgTel\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static03", "absolute", "0", "5", "1107", "31", null, null, this);
            obj.set_taborder("0");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_orgAgtel", "absolute", "685", "10", "142", "21", null, null, this);
            obj.set_taborder("3");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_orgAgtel", "absolute", "555", "5", "125", "31", null, null, this);
            obj.set_taborder("4");
            obj.set_text("판매인연락처");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_orgAgnm", "absolute", "408", "10", "142", "21", null, null, this);
            obj.set_taborder("5");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_orgAgnm", "absolute", "278", "5", "125", "31", null, null, this);
            obj.set_taborder("6");
            obj.set_text("판매인성명");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_ordAgent", "absolute", "131", "10", "142", "21", null, null, this);
            obj.set_taborder("7");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_ordAgent", "absolute", "0", "5", "125", "31", null, null, this);
            obj.set_taborder("8");
            obj.set_text("판매인번호");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "35", "1107", "31", null, null, this);
            obj.set_taborder("9");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Edit("Edit01", "absolute", "685", "40", "142", "21", null, null, this);
            obj.set_taborder("12");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "555", "35", "125", "31", null, null, this);
            obj.set_taborder("13");
            obj.set_text("연락처");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("Edit02", "absolute", "408", "40", "142", "21", null, null, this);
            obj.set_taborder("14");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("Static08", "absolute", "278", "35", "125", "31", null, null, this);
            obj.set_taborder("15");
            obj.set_text("판매인조직명");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("Edit07", "absolute", "131", "40", "142", "21", null, null, this);
            obj.set_taborder("16");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("Static09", "absolute", "0", "35", "125", "31", null, null, this);
            obj.set_taborder("17");
            obj.set_text("판매인조직");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "0", "0", null, "5", "0", null, this);
            obj.set_taborder("18");
            obj.set_text("w5");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static83", "absolute", "1107", "0", "40", null, null, "0", this);
            obj.set_taborder("19");
            obj.set_text("w40");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1147, 150, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTSDContractStatus_tab_info6_seller");
            		p.set_titletext("[STEP6]판매인정보");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item0","ed_ordAgent","value","ds_seller","ordAgent");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item1","ed_orgAgnm","value","ds_seller","orgAgnm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item2","ed_orgAgtel","value","ds_seller","orgAgtel");
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

        this.loadIncludeScript("RTSDContractStatus_tab_info6_seller.xfdl");

       
    };
}
)();
