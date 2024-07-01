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
                this.set_name("RTSDContractStatus_tab_info3_discount");
                this.set_classname("RTSDContractStatus_tab_info3_discount");
                this.set_titletext("[STEP3]할인정보");
                this._setFormPosition(0,0,1140,150);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_discount", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"regiAmt\" type=\"STRING\" size=\"256\"/><Column id=\"monAmt\" type=\"STRING\" size=\"256\"/><Column id=\"rentAmt\" type=\"STRING\" size=\"256\"/><Column id=\"monDcamt\" type=\"STRING\" size=\"256\"/><Column id=\"cDcamt\" type=\"STRING\" size=\"256\"/><Column id=\"grpYn\" type=\"STRING\" size=\"256\"/><Column id=\"grpNo\" type=\"STRING\" size=\"256\"/><Column id=\"gDcrate\" type=\"STRING\" size=\"256\"/><Column id=\"gDcamt\" type=\"STRING\" size=\"256\"/><Column id=\"lDcrate\" type=\"STRING\" size=\"256\"/><Column id=\"lDcamt\" type=\"STRING\" size=\"256\"/><Column id=\"fDcamt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static03", "absolute", "0", "5", "1107", "31", null, null, this);
            obj.set_taborder("0");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_rentAmt", "absolute", "554", "5", "125", "31", null, null, this);
            obj.set_taborder("4");
            obj.set_text("월렌탈료(조견표)");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("st_monAmt", "absolute", "277", "5", "125", "31", null, null, this);
            obj.set_taborder("6");
            obj.set_text("월렌탈료");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("st_regiAmt", "absolute", "0", "5", "125", "31", null, null, this);
            obj.set_taborder("8");
            obj.set_text("렌탈등록비");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "35", "1107", "31", null, null, this);
            obj.set_taborder("9");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_cDcamt", "absolute", "277", "35", "125", "31", null, null, this);
            obj.set_taborder("15");
            obj.set_text("캠페인할인금액");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("st_monDcamt", "absolute", "0", "35", "125", "31", null, null, this);
            obj.set_taborder("17");
            obj.set_text("월렌탈료 할인");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static10", "absolute", "0", "95", "1107", "31", null, null, this);
            obj.set_taborder("18");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_fDcamt", "absolute", "554", "95", "125", "31", null, null, this);
            obj.set_taborder("22");
            obj.set_text("최종할인액");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("st_lDcamt", "absolute", "277", "95", "125", "31", null, null, this);
            obj.set_taborder("24");
            obj.set_text("제한할인액");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("st_lDcrate", "absolute", "0", "95", "125", "31", null, null, this);
            obj.set_taborder("26");
            obj.set_text("제한할인율");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static15", "absolute", "0", "65", "1107", "31", null, null, this);
            obj.set_taborder("27");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_gDcamt", "absolute", "831", "65", "125", "31", null, null, this);
            obj.set_taborder("29");
            obj.set_text("결합할인액");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("st_gDcrate", "absolute", "554", "65", "125", "31", null, null, this);
            obj.set_taborder("31");
            obj.set_text("결합할인율");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_grpNo", "absolute", "407", "70", "142", "21", null, null, this);
            obj.set_taborder("32");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_grpNo", "absolute", "277", "65", "125", "31", null, null, this);
            obj.set_taborder("33");
            obj.set_text("고객결합번호");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_grpYn", "absolute", "130", "70", "142", "21", null, null, this);
            obj.set_taborder("34");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_grpYn", "absolute", "0", "65", "125", "31", null, null, this);
            obj.set_taborder("35");
            obj.set_text("고객결합여부");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "0", "0", null, "5", "0", null, this);
            obj.set_taborder("36");
            obj.set_text("w5");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static83", "absolute", "1107", "0", "40", null, null, "0", this);
            obj.set_taborder("37");
            obj.set_text("w40");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("ed_gDcamt", "absolute", "961", "70", "142", "21", null, null, this);
            obj.set_taborder("38");
            obj.set_readonly("true");
            obj.set_mask("###,###,###,##0");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("ed_fDcamt", "absolute", "684", "100", "142", "21", null, null, this);
            obj.set_taborder("39");
            obj.set_readonly("true");
            obj.set_mask("###,###,###,##0");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("ed_rentAmt", "absolute", "684", "10", "142", "21", null, null, this);
            obj.set_taborder("40");
            obj.set_readonly("true");
            obj.set_mask("###,###,###,##0");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("ed_lDcamt", "absolute", "408", "100", "142", "21", null, null, this);
            obj.set_taborder("41");
            obj.set_readonly("true");
            obj.set_mask("###,###,###,##0");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("ed_cDcamt", "absolute", "407", "40", "142", "21", null, null, this);
            obj.set_taborder("42");
            obj.set_readonly("true");
            obj.set_mask("###,###,###,##0");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("ed_monAmt", "absolute", "407", "10", "142", "21", null, null, this);
            obj.set_taborder("43");
            obj.set_readonly("true");
            obj.set_mask("###,###,###,##0");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("ed_monDcamt", "absolute", "131", "40", "142", "21", null, null, this);
            obj.set_taborder("44");
            obj.set_readonly("true");
            obj.set_mask("###,###,###,##0");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("ed_regiAmt", "absolute", "131", "10", "142", "21", null, null, this);
            obj.set_taborder("45");
            obj.set_mask("###,###,###,##0");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("ed_gDcrate", "absolute", "684", "70", "142", "21", null, null, this);
            obj.set_taborder("46");
            obj.set_readonly("true");
            obj.set_mask("###,###,###,##0");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("ed_lDcrate", "absolute", "130", "100", "142", "21", null, null, this);
            obj.set_taborder("47");
            obj.set_readonly("true");
            obj.set_mask("###,###,###,##0");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1140, 150, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTSDContractStatus_tab_info3_discount");
            		p.set_titletext("[STEP3]할인정보");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item0","ed_regiAmt","value","ds_discount","regiAmt");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item1","ed_monAmt","value","ds_discount","monAmt");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item2","ed_rentAmt","value","ds_discount","rentAmt");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item3","ed_monDcamt","value","ds_discount","monDcamt");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item4","ed_cDcamt","value","ds_discount","cDcamt");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item5","ed_grpYn","value","ds_discount","grpYn");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item6","ed_grpNo","value","ds_discount","grpNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item7","ed_gDcrate","value","ds_discount","gDcrate");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item8","ed_gDcamt","value","ds_discount","gDcamt");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item9","ed_lDcrate","value","ds_discount","lDcrate");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item10","ed_lDcamt","value","ds_discount","lDcamt");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item11","ed_fDcamt","value","ds_discount","fDcamt");
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

        this.loadIncludeScript("RTSDContractStatus_tab_info3_discount.xfdl");

       
    };
}
)();
