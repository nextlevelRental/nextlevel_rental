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
                this.set_name("RTSDCarMasterRegister");
                this.set_classname("RTSDCarMasterRegister");
                this.set_titletext("차종마스터등록");
                this._setFormPosition(0,0,1147,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_makerSearch", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_modelSearch", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_contentsSearch", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_useYnSearch", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_makerGrid", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_modelGrid", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_contentsGrid", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_frGrid", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_useYnGrid", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_maker", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_model", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_contents", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_fr", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_useYn", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_carMasterSelect", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"makerCd\" type=\"STRING\" size=\"256\"/><Column id=\"modelCd\" type=\"STRING\" size=\"256\"/><Column id=\"contentsCd\" type=\"STRING\" size=\"256\"/><Column id=\"frCd\" type=\"STRING\" size=\"256\"/><Column id=\"makerNm\" type=\"STRING\" size=\"256\"/><Column id=\"modelNm\" type=\"STRING\" size=\"256\"/><Column id=\"contentsNm\" type=\"STRING\" size=\"256\"/><Column id=\"frNm\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"mcNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_rtsd0001", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"modelCd\" type=\"STRING\" size=\"256\"/><Column id=\"contentsCd\" type=\"STRING\" size=\"256\"/><Column id=\"makerCd\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_rtsd0002", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"modelCd\" type=\"STRING\" size=\"256\"/><Column id=\"contentsCd\" type=\"STRING\" size=\"256\"/><Column id=\"frCd\" type=\"STRING\" size=\"256\"/><Column id=\"mcNm\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_rtsdUpdate", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"modelCd\" type=\"STRING\" size=\"256\"/><Column id=\"contentsCd\" type=\"STRING\" size=\"256\"/><Column id=\"frCd\" type=\"STRING\" size=\"256\"/><Column id=\"mcNm\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Div("div_search", "absolute", "0", "0", "1122", "48", null, null, this);
            obj.set_taborder("0");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "25", "12", "80", "21", null, null, this.div_search);
            obj.set_taborder("41");
            obj.set_text("카메이커");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_makerSearch", "absolute", "108", "12", "143", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("44");
            obj.set_autoselect("true");
            obj.set_innerdataset("@ds_makerSearch");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj.set_index("0");
            obj = new Static("Static01", "absolute", "276", "12", "80", "21", null, null, this.div_search);
            obj.set_taborder("45");
            obj.set_text("차종");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_modelSearch", "absolute", "356", "12", "143", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("46");
            obj.set_autoselect("true");
            obj.set_innerdataset("@ds_modelSearch");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj.set_index("0");
            obj = new Static("Static02", "absolute", "524", "12", "80", "21", null, null, this.div_search);
            obj.set_taborder("47");
            obj.set_text("사양");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_contentsSearch", "absolute", "604", "12", "180", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("48");
            obj.set_autoselect("true");
            obj.set_innerdataset("@ds_contentsSearch");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj.set_index("0");
            obj = new Static("Static24", "absolute", "251", "0", "25", "44", null, null, this.div_search);
            obj.set_taborder("49");
            obj.set_text("FIX w30");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "499", "0", "25", "44", null, null, this.div_search);
            obj.set_taborder("50");
            obj.set_text("FIX w30");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "784", "0", "25", "44", null, null, this.div_search);
            obj.set_taborder("51");
            obj.set_text("FIX w30");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static05", "absolute", "809", "12", "80", "21", null, null, this.div_search);
            obj.set_taborder("52");
            obj.set_text("사용여부");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_useYnSearch", "absolute", "889", "12", "143", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("53");
            obj.set_autoselect("true");
            obj.set_innerdataset("@ds_useYnSearch");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj.set_index("0");
            obj = new Static("Static22", "absolute", "0", "0", "1118", "12", null, null, this.div_search);
            obj.set_taborder("54");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static15", "absolute", "0", "0", "25", "113", null, null, this.div_search);
            obj.set_taborder("55");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "0", "32", "1118", "12", null, null, this.div_search);
            obj.set_taborder("56");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);

            obj = new Grid("grid_carMasterSelect", "absolute", "0", "90", "800", "406", null, null, this);
            obj.set_taborder("1");
            obj.set_binddataset("ds_carMasterSelect");
            obj.set_autofittype("col");
            obj.set_cellsizingtype("col");
            obj.set_autosizingtype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"150\"/><Column size=\"200\"/><Column size=\"150\"/><Column size=\"95\"/><Column size=\"95\"/><Column size=\"100\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"카메이커\"/><Cell col=\"1\" text=\"차종\"/><Cell col=\"2\" text=\"사양\"/><Cell col=\"3\" text=\"전후구분\"/><Cell col=\"4\" text=\"사용여부\"/><Cell col=\"5\" text=\"차종-사양명\"/></Band><Band id=\"body\"><Cell displaytype=\"combo\" edittype=\"none\" text=\"bind:makerCd\" combodataset=\"ds_makerGrid\" combocodecol=\"cd\" combodatacol=\"cdNm\" combodisplay=\"edit\"/><Cell col=\"1\" displaytype=\"combo\" edittype=\"none\" text=\"bind:modelCd\" combodataset=\"ds_modelGrid\" combocodecol=\"cd\" combodatacol=\"cdNm\" combodisplay=\"edit\"/><Cell col=\"2\" displaytype=\"combo\" edittype=\"none\" text=\"bind:contentsCd\" combodataset=\"ds_contentsGrid\" combocodecol=\"cd\" combodatacol=\"cdNm\" combodisplay=\"edit\"/><Cell col=\"3\" displaytype=\"combo\" edittype=\"none\" text=\"bind:frCd\" combodataset=\"ds_frGrid\" combocodecol=\"cd\" combodatacol=\"cdNm\" combodisplay=\"edit\"/><Cell col=\"4\" displaytype=\"combo\" edittype=\"none\" text=\"bind:useYn\" combodataset=\"ds_useYnGrid\" combocodecol=\"cd\" combodatacol=\"cdNm\" combodisplay=\"edit\"/><Cell col=\"5\" text=\"bind:mcNm\" tooltiptext=\"bind:mcNm\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "0", "80", "1147", "10", null, null, this);
            obj.set_taborder("2");
            obj.set_text("Static02");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "65", "169", "20", null, null, this);
            obj.set_taborder("3");
            obj.set_text("차종마스터 리스트");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "48", "1147", "20", null, null, this);
            obj.set_taborder("4");
            obj.set_text("Static02");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1122", "0", "25", "496", null, null, this);
            obj.set_taborder("5");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Button("btn_new", "absolute", "1027", "86", "45", "22", null, null, this);
            obj.set_taborder("15");
            obj.set_text("신규");
            obj.set_cssclass("btn_WF_module");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Button("btn_del", "absolute", "1077", "86", "45", "22", null, null, this);
            obj.set_taborder("16");
            obj.set_text("삭제");
            obj.set_cssclass("btn_WF_module");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Static("Static08", "absolute", "820", "118", "302", "31", null, null, this);
            obj.set_taborder("28");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "800", "45", "20", "451", null, null, this);
            obj.set_taborder("30");
            obj.set_text("FIX\r\nw20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "820", "148", "302", "31", null, null, this);
            obj.set_taborder("31");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static09", "absolute", "820", "178", "302", "31", null, null, this);
            obj.set_taborder("32");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static10", "absolute", "820", "208", "302", "31", null, null, this);
            obj.set_taborder("33");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static11", "absolute", "820", "238", "302", "31", null, null, this);
            obj.set_taborder("34");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_cdGrpCd00", "absolute", "820", "118", "120", "31", null, null, this);
            obj.set_taborder("35");
            obj.set_text("카메이커");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("st_cdGrpCd01", "absolute", "820", "148", "120", "31", null, null, this);
            obj.set_taborder("36");
            obj.set_text("차종");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("st_cdGrpCd04", "absolute", "820", "178", "120", "31", null, null, this);
            obj.set_taborder("37");
            obj.set_text("사양");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("st_cdGrpCd05", "absolute", "820", "208", "120", "31", null, null, this);
            obj.set_taborder("38");
            obj.set_text("전후구분");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("st_cdGrpCd06", "absolute", "820", "238", "120", "31", null, null, this);
            obj.set_taborder("39");
            obj.set_text("사용여부");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Combo("cb_maker", "absolute", "945", "123", "172", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("40");
            obj.set_displaynulltext("선택");
            obj.set_innerdataset("@ds_maker");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj.set_enable("false");
            obj.set_index("-1");

            obj = new Combo("cb_model", "absolute", "945", "152", "172", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("41");
            obj.set_displaynulltext("선택");
            obj.set_innerdataset("@ds_model");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj.set_enable("false");
            obj.set_index("-1");

            obj = new Combo("cb_contents", "absolute", "945", "184", "172", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("42");
            obj.set_innerdataset("@ds_contents");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj.set_enable("false");
            obj.set_index("-1");

            obj = new Combo("cb_fr", "absolute", "945", "213", "172", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("43");
            obj.set_innerdataset("@ds_fr");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj.set_enable("false");
            obj.set_index("-1");

            obj = new Combo("cb_useYn", "absolute", "945", "243", "172", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("44");
            obj.set_displaynulltext("선택");
            obj.set_innerdataset("@ds_useYn");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj.set_enable("false");

            obj = new Grid("Grid00", "absolute", "820", "270", "300", "80", null, null, this);
            obj.set_taborder("45");
            obj.set_binddataset("ds_rtsd0001");
            obj.set_visible("false");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/></Columns><Rows><Row band=\"head\" size=\"24\"/><Row band=\"body\" size=\"24\"/></Rows><Band id=\"head\"><Cell col=\"0\" disptype=\"normal\" text=\"modelCd\"/><Cell col=\"1\" disptype=\"normal\" text=\"contentsCd\"/><Cell col=\"2\" disptype=\"normal\" text=\"makerCd\"/><Cell col=\"3\" disptype=\"normal\" text=\"useYn\"/><Cell col=\"4\" disptype=\"normal\" text=\"regId\"/><Cell col=\"5\" disptype=\"normal\" text=\"regDt\"/><Cell col=\"6\" disptype=\"normal\" text=\"chgId\"/><Cell col=\"7\" disptype=\"normal\" text=\"chgDt\"/></Band><Band id=\"body\"><Cell col=\"0\" disptype=\"normal\" text=\"bind:modelCd\"/><Cell col=\"1\" disptype=\"normal\" text=\"bind:contentsCd\"/><Cell col=\"2\" disptype=\"normal\" text=\"bind:makerCd\"/><Cell col=\"3\" disptype=\"normal\" text=\"bind:useYn\"/><Cell col=\"4\" disptype=\"normal\" text=\"bind:regId\"/><Cell col=\"5\" disptype=\"normal\" text=\"bind:regDt\"/><Cell col=\"6\" disptype=\"normal\" text=\"bind:chgId\"/><Cell col=\"7\" disptype=\"normal\" text=\"bind:chgDt\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Grid("Grid01", "absolute", "820", "349", "300", "80", null, null, this);
            obj.set_taborder("46");
            obj.set_binddataset("ds_rtsd0002");
            obj.set_visible("false");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/></Columns><Rows><Row band=\"head\" size=\"24\"/><Row band=\"body\" size=\"24\"/></Rows><Band id=\"head\"><Cell col=\"0\" disptype=\"normal\" text=\"modelCd\"/><Cell col=\"1\" disptype=\"normal\" text=\"contentsCd\"/><Cell col=\"2\" disptype=\"normal\" text=\"frCd\"/><Cell col=\"3\" disptype=\"normal\" text=\"mcNm\"/><Cell col=\"4\" disptype=\"normal\" text=\"useYn\"/><Cell col=\"5\" disptype=\"normal\" text=\"regId\"/><Cell col=\"6\" disptype=\"normal\" text=\"regDt\"/><Cell col=\"7\" disptype=\"normal\" text=\"chgId\"/><Cell col=\"8\" disptype=\"normal\" text=\"chgDt\"/></Band><Band id=\"body\"><Cell col=\"0\" disptype=\"normal\" text=\"bind:modelCd\"/><Cell col=\"1\" disptype=\"normal\" text=\"bind:contentsCd\"/><Cell col=\"2\" disptype=\"normal\" text=\"bind:frCd\"/><Cell col=\"3\" disptype=\"normal\" text=\"bind:mcNm\"/><Cell col=\"4\" disptype=\"normal\" text=\"bind:useYn\"/><Cell col=\"5\" disptype=\"normal\" text=\"bind:regId\"/><Cell col=\"6\" disptype=\"normal\" text=\"bind:regDt\"/><Cell col=\"7\" disptype=\"normal\" text=\"bind:chgId\"/><Cell col=\"8\" disptype=\"normal\" text=\"bind:chgDt\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Grid("Grid02", "absolute", "820", "429", "300", "80", null, null, this);
            obj.set_taborder("47");
            obj.set_binddataset("ds_rtsdUpdate");
            obj.set_visible("false");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/></Columns><Rows><Row band=\"head\" size=\"24\"/><Row band=\"body\" size=\"24\"/></Rows><Band id=\"head\"><Cell col=\"0\" disptype=\"normal\" text=\"modelCd\"/><Cell col=\"1\" disptype=\"normal\" text=\"contentsCd\"/><Cell col=\"2\" disptype=\"normal\" text=\"frCd\"/><Cell col=\"3\" disptype=\"normal\" text=\"mcNm\"/><Cell col=\"4\" disptype=\"normal\" text=\"useYn\"/><Cell col=\"5\" disptype=\"normal\" text=\"regId\"/><Cell col=\"6\" disptype=\"normal\" text=\"regDt\"/><Cell col=\"7\" disptype=\"normal\" text=\"chgId\"/><Cell col=\"8\" disptype=\"normal\" text=\"chgDt\"/></Band><Band id=\"body\"><Cell col=\"0\" disptype=\"normal\" text=\"bind:modelCd\"/><Cell col=\"1\" disptype=\"normal\" text=\"bind:contentsCd\"/><Cell col=\"2\" disptype=\"normal\" text=\"bind:frCd\"/><Cell col=\"3\" disptype=\"normal\" text=\"bind:mcNm\"/><Cell col=\"4\" disptype=\"normal\" text=\"bind:useYn\"/><Cell col=\"5\" disptype=\"normal\" text=\"bind:regId\"/><Cell col=\"6\" disptype=\"normal\" text=\"bind:regDt\"/><Cell col=\"7\" disptype=\"normal\" text=\"bind:chgId\"/><Cell col=\"8\" disptype=\"normal\" text=\"bind:chgDt\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "800", "108", "347", "10", null, null, this);
            obj.set_taborder("48");
            obj.set_text("Static02");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1122, 48, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("0");
            		p.set_text("Div00");
            		p.set_scrollbars("none");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1147, 496, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTSDCarMasterRegister");
            		p.set_titletext("차종마스터등록");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item0","cb_maker","value","ds_carMasterSelect","makerCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item1","cb_model","value","ds_carMasterSelect","modelCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item2","cb_contents","value","ds_carMasterSelect","contentsCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item3","cb_fr","value","ds_carMasterSelect","frCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item4","cb_useYn","value","ds_carMasterSelect","useYn");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTSDCarMasterRegister.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDCarMasterRegister.xfdl", function() {
        	//include "lib::comLib.xjs"; 
        	
        	
        	
        	this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg){
        		if( strSvcId == "initRTSDCarMasterRegister" ){
        			var makerCt = this.ds_makerSearch.getRowCount();
        			var makerRp = this.ds_makerSearch.rowposition;
        			if( makerCt != 0 ){
        				this.div_search.cb_makerSearch.set_value(this.ds_makerSearch.getColumn(makerRp, "cd"));
        			}
        			
        			var useYnCt = this.ds_useYnSearch.getRowCount();
        			var useYnRp = this.ds_useYnSearch.rowposition;
        			if( useYnCt != 0 ){
        				var insert = this.ds_useYnSearch.insertRow( 0 );
        				this.ds_useYnSearch.setColumn(insert,"cd"," ");
        				this.ds_useYnSearch.setColumn(insert,"cdNm","전체");
        				this.div_search.cb_useYnSearch.set_value( " " );
        				this.div_search.cb_useYnSearch.set_value(this.ds_useYnSearch.getColumn(useYnRp, "cd"));
        			}
        			this.div_search_cb_makerSearch_onitemchanged();
        			this.div_search_cb_modelSearch_onitemchanged();
        			this.div_search_cb_modelSearch_onitemchanged();
        		}
        		
        		if( strSvcId == "sRtsd0001ModelSelect" ){
        			var modelCt = this.ds_modelSearch.getRowCount();
        			var modelRp = this.ds_modelSearch.rowposition;
        			if( modelCt != 0 ){
        				var insert = this.ds_modelSearch.insertRow( 0 );
        				this.ds_modelSearch.setColumn(insert,"cd"," ");
        				this.ds_modelSearch.setColumn(insert,"cdNm","전체");
        				this.div_search.cb_modelSearch.set_value( " " );
        				
        				for(var i = 0 ; i < modelCt ; i++){
        					var nRow = this.ds_modelSearch.findRow( "cd", "'"+this.ds_modelSearch.getColumn(i, "cd")+"'" );
        					if( nRow > -1){
        						this.ds_modelSearch.deleteRow( nRow );
        					}
        				}
        			}
        		}
        		
        		if( strSvcId == "sRtsd0001ContentsSelect" ){
        			var contentsCt = this.ds_contentsSearch.getRowCount();
        			var contentsRp = this.ds_contentsSearch.rowposition;
        			if( contentsCt != 0 ){
        				var insert = this.ds_contentsSearch.insertRow( 0 );
        				this.ds_contentsSearch.setColumn(insert,"cd"," ");
        				this.ds_contentsSearch.setColumn(insert,"cdNm","전체");
        				this.div_search.cb_contentsSearch.set_value( " " );
        			}
        		}
        		
        		if( strSvcId == "saveRTSDCarMasterRegister" ){
        			if( nErrorCode == "0" ){
        				alert(strErrorMsg);
        				this.reload();
        			}else{
        				alert(strErrorMsg);
        			}
        		}
        		
        		if( strSvcId == "carMasterSelect" ){
        			var rowCt = this.ds_carMasterSelect();
        			if( rowCt == 0 ){
        				alert("조회된 데이터가 없습니다.");
        				this.grid_carMasterSelect.set_nodatatext("조회된 데이터가 없습니다.");
        			}
        		}
        	}
        	
        	
        	
        	this.RTSDCarMasterRegister_onload = function(obj,e)
        	{
        		Ex.core.init(obj);
        		this.fn_init();
        		this.parent.setButton("E|C|S", this);
        	}

        

        	this.fn_init = function(){
        		var sSvcID      	= "initRTSDCarMasterRegister";  
        		var sController   	= "rtms/sd/initRTSDCarMasterRegister.do";
        		var sInDatasets   	= "";
        		var sOutDatasets	= "";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		     
        		sOutDatasets += " ds_makerSearch=mapDsMakerSearch";
        		sOutDatasets += " ds_useYnSearch=mapDsUseYnSearch";
        		
        		sOutDatasets += " ds_makerGrid=mapDsMakerGrid ";
        		sOutDatasets += " ds_modelGrid=mapDsModelGrid ";
        		sOutDatasets += " ds_contentsGrid=mapDsContentsGrid ";
        		sOutDatasets += " ds_frGrid=mapDsFrCdGrid ";
        		sOutDatasets += " ds_useYnGrid=mapDsUseYnGrid ";
        		
        		sOutDatasets += " ds_maker=mapDsMaker ";
        		sOutDatasets += " ds_model=mapDsModel ";
        		sOutDatasets += " ds_contents=mapDsContents ";
        		sOutDatasets += " ds_fr=mapDsFrCd ";
        		sOutDatasets += " ds_useYn=mapDsUseYn ";
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}

        
        	
        	this.fn_save = function(){
        		this.ds_rtsd0001.clearData();
        		this.ds_rtsd0002.clearData();
        		this.ds_rtsdUpdate.clearData();
        		
        		var rowCount = this.ds_carMasterSelect.getRowCount();
        		var msg	 = "은(는) 필수항목 입니다.";
        		var saveFlag = false;
        		var goSaveFlag = true;
        		//for( var i = 0 ; i < rowCount ; i++){
        		//	var rowType 	= this.ds_carMasterSelect.getRowType(i);
        		//	if(rowType == 2 || rowType == 4){
        		//		saveFlag= true;break;
        		//	}else{
        		//		saveFlag= false;
        		//	}
        		//}
        		
        		//if( saveFlag == false ){
        		//	alert("수정된 사항이 없습니다.");
        		//	return false;
        		//}else{
        			this.ds_rtsd0001.set_updatecontrol(false);
        			this.ds_rtsd0002.set_updatecontrol(false);
        			this.ds_rtsdUpdate.set_updatecontrol(false);
        			
        			for( var i = 0 ; i < rowCount ; i++){
        				var rowType 	= this.ds_carMasterSelect.getRowType(i);
        				
        				var makerCd 	= nvl(this.ds_carMasterSelect.getColumn(i, "makerCd"));
        				var modelCd 	= nvl(this.ds_carMasterSelect.getColumn(i, "modelCd"));
        				var contentsCd 	= nvl(this.ds_carMasterSelect.getColumn(i, "contentsCd"));
        				var frCd 		= nvl(this.ds_carMasterSelect.getColumn(i, "frCd"));
        				var useYn 		= nvl(this.ds_carMasterSelect.getColumn(i, "useYn"));
        				
        				var nIndex1	 	= this.grid_carMasterSelect.getBindCellIndex( "body", "modelCd");
        				var nIndex2 	= this.grid_carMasterSelect.getBindCellIndex( "body", "contentsCd");
        				
        				var modelNm 	= nvl(this.grid_carMasterSelect.getCellText(i, nIndex1));
        				var contentsNm 	= nvl(this.grid_carMasterSelect.getCellText(i, nIndex2));
        				var mcNm 		= modelNm;
        				if( contentsNm != "" ){
        					mcNm += " "+contentsNm;
        				}
        				
        				if( rowType == 1 || rowType == 2 || rowType == 4 ){
        					if( makerCd == "" ){			alert("카메이커" + msg);		this.ds_rtsd0001.clearData();this.ds_rtsd0002.clearData(); this.ds_carMasterSelect.set_rowposition(i); goSaveFlag = false; break; return false; }
        					else if( modelCd == "" ){		alert("차종" + msg); 			this.ds_rtsd0001.clearData();this.ds_rtsd0002.clearData(); this.ds_carMasterSelect.set_rowposition(i); goSaveFlag = false; break; return false; }
        					else if( contentsCd == "" ){	alert("사양" + msg);			this.ds_rtsd0001.clearData();this.ds_rtsd0002.clearData(); this.ds_carMasterSelect.set_rowposition(i); goSaveFlag = false; break; return false; }
        					else if( frCd == "" ){			alert("전후구분" + msg);		this.ds_rtsd0001.clearData();this.ds_rtsd0002.clearData(); this.ds_carMasterSelect.set_rowposition(i); goSaveFlag = false; break; return false; }
        					else if( mcNm == "" ){			alert("차종-사양명" + msg);		this.ds_rtsd0001.clearData();this.ds_rtsd0002.clearData(); this.ds_carMasterSelect.set_rowposition(i); goSaveFlag = false; break; return false; }
        					else if( useYn == "" ){			alert("사용여부" + msg);		this.ds_rtsd0001.clearData();this.ds_rtsd0002.clearData(); this.ds_carMasterSelect.set_rowposition(i); goSaveFlag = false; break; return false; }
        					else{
        						if( rowType == 2 ){
        							var addRow1 = this.ds_rtsd0001.addRow();
        							this.ds_rtsd0001.setRowType(addRow1, Dataset.ROWTYPE_INSERT);
        							this.ds_rtsd0001.setColumn(addRow1, "makerCd", makerCd);
        							this.ds_rtsd0001.setColumn(addRow1, "modelCd", modelCd);
        							this.ds_rtsd0001.setColumn(addRow1, "contentsCd", contentsCd);
        							this.ds_rtsd0001.setColumn(addRow1, "useYn", useYn);
        							
        							var addRow2 = this.ds_rtsd0002.addRow();
        							this.ds_rtsd0002.setRowType(addRow2, Dataset.ROWTYPE_INSERT);
        							this.ds_rtsd0002.setColumn(addRow2, "modelCd", modelCd);
        							this.ds_rtsd0002.setColumn(addRow2, "contentsCd", contentsCd);
        							this.ds_rtsd0002.setColumn(addRow2, "frCd", frCd);
        							this.ds_rtsd0002.setColumn(addRow2, "mcNm", mcNm);
        							this.ds_rtsd0002.setColumn(addRow2, "useYn", useYn);
        						}
        						if( rowType == 1 || rowType == 4 ){
        							var addRow1 = this.ds_rtsd0001.addRow();
        							this.ds_rtsd0001.setRowType(addRow1, Dataset.ROWTYPE_UPDATE);
        							this.ds_rtsd0001.setColumn(addRow1, "makerCd", makerCd);
        							this.ds_rtsd0001.setColumn(addRow1, "modelCd", modelCd);
        							this.ds_rtsd0001.setColumn(addRow1, "contentsCd", contentsCd);
        							this.ds_rtsd0001.setColumn(addRow1, "useYn", useYn);
        							
        							var addRow2 = this.ds_rtsd0002.addRow();
        							this.ds_rtsd0002.setRowType(addRow2, Dataset.ROWTYPE_UPDATE);
        							this.ds_rtsd0002.setColumn(addRow2, "modelCd", modelCd);
        							this.ds_rtsd0002.setColumn(addRow2, "contentsCd", contentsCd);
        							this.ds_rtsd0002.setColumn(addRow2, "frCd", frCd);
        							this.ds_rtsd0002.setColumn(addRow2, "mcNm", mcNm);
        							this.ds_rtsd0002.setColumn(addRow2, "useYn", useYn);
        							
        							if( useYn == "N" ){
        								var addRow = this.ds_rtsdUpdate.addRow();
        								this.ds_rtsdUpdate.setRowType(addRow, Dataset.ROWTYPE_UPDATE);
        								this.ds_rtsdUpdate.setColumn(addRow, "modelCd", modelCd);
        								this.ds_rtsdUpdate.setColumn(addRow, "contentsCd", contentsCd);
        								this.ds_rtsdUpdate.setColumn(addRow, "useYn", useYn);
        							}
        						}
        					}
        				}
        				
        				this.ds_rtsd0001.set_updatecontrol(true);
        				this.ds_rtsd0002.set_updatecontrol(true);
        				this.ds_rtsdUpdate.set_updatecontrol(true);
        			}
        			
        			//trace(this.ds_rtsd0001.saveXML());
        			//trace(this.ds_rtsd0002.saveXML());
        			//trace(this.ds_rtsdUpdate.saveXML());
        			
        			if( !Ex.util.isUpdated(this.ds_carMasterSelect)) {
        			alert('변경된 데이터가 없습니다.');
        			return false;
        			}
        			
        			if( goSaveFlag ){
        				if( confirm( "저장하시겠습니까?") ){
        					var sSvcID        	= "saveRTSDCarMasterRegister";                    
        					var sController   	= "rtms/sd/saveRTSDCarMasterRegister.do";
        					var sInDatasets   	= "";
        					var sOutDatasets  	= "";
        					var sArgs 			= "";
        					
        					sInDatasets			+= " dsRtre0001=ds_rtsd0001:U ";
        					sInDatasets			+= " dsRtre0002=ds_rtsd0002:U ";
        					sInDatasets			+= " dsRtreUpdate=ds_rtsdUpdate:U ";
        					
        					var fn_callBack		= "fn_callBack";
        					Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        				}
        			}
        		//}
        	}
        	
        	this.fn_search = function(){
        		var sSvcID        	= "carMasterSelect";                    
        		var sController   	= "rtms/sd/carMasterSelect.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_carMasterSelect=carMasterSelectMap";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";		
        		
        		sArgs += Ex.util.setParam("makerCd",  nvl(this.div_search.cb_makerSearch.value));
        		sArgs += Ex.util.setParam("modelCd",  nvl(this.div_search.cb_modelSearch.value));
        		sArgs += Ex.util.setParam("contents", nvl(this.div_search.cb_contentsSearch.value));
        		sArgs += Ex.util.setParam("useYn", 	  nvl(this.div_search.cb_useYnSearch.value));
        		
        		this.ds_carMasterSelect.clearData();
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        	
        	
        	
        	this.div_search_cb_makerSearch_onitemchanged = function(obj,e)
        	{
        		var sSvcID        	= "sRtsd0001ModelSelect";                    
        		var sController   	= "rtms/sd/sRtsd0001ModelSelect.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_modelSearch=modelSearchMap";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		sArgs += Ex.util.setParam("makerCd",  nvl(this.div_search.cb_makerSearch.value));
        		sArgs += Ex.util.setParam("modelCd",  nvl(this.div_search.cb_modelSearch.value));
        		
        		this.ds_modelSearch.clearData();
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}

        

        	this.div_search_cb_modelSearch_onitemchanged = function(obj,e)
        	{
        		var sSvcID        	= "sRtsd0001ContentsSelect";                    
        		var sController   	= "rtms/sd/sRtsd0001ContentsSelect.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_contentsSearch=contentsSearchMap";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		sArgs += Ex.util.setParam("makerCd",  nvl(this.div_search.cb_makerSearch.value));
        		sArgs += Ex.util.setParam("modelCd",  nvl(this.div_search.cb_modelSearch.value));
        		
        		this.ds_contentsSearch.clearData();
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}

        

        	this.div_search_btn_new_onclick = function(obj,e)
        	{
        		var addRow = this.ds_carMasterSelect.addRow();
        		this.ds_carMasterSelect.setColumn(addRow, "useYn", "Y");
        	}

        

        	this.div_search_btn_del_onclick = function(obj,e)
        	{
        		var rowposition = this.ds_carMasterSelect.rowposition;
        		if( this.ds_carMasterSelect.getRowType( rowposition ) == 2 ){
        			this.ds_carMasterSelect.deleteRow(rowposition);
        		}else{
        			alert("기존데이터는 삭제할 수 없습니다.");
        		}
        	}

        

        	this.grid_carMasterSelect_onselectchanged = function(obj,e)
        	{
        		var rowposition = this.ds_carMasterSelect.rowposition;
        		if( this.ds_carMasterSelect.getRowType(rowposition) ==  1 ){
        			this.FN_enableFalse();
        		}else{
        			this.FN_enableTrue();
        		}
        	}
        	
        	
        	
        	this.FN_enableTrue = function(){
        		this.cb_maker.set_enable(true);
        		this.cb_model.set_enable(true);
        		this.cb_contents.set_enable(true);
        		this.cb_fr.set_enable(true);
        		this.cb_useYn.set_enable(true);
        	}

        

        	this.FN_enableFalse = function(){
        		this.cb_maker.set_enable(false);
        		this.cb_model.set_enable(false);
        		this.cb_contents.set_enable(false);
        		this.cb_fr.set_enable(false);
        		this.cb_useYn.set_enable(true);
        	}

        	
        	
        	this.fn_excel= function() {
        		Ex.core.exportExcel(this, this.grid_carMasterSelect);
        	}
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTSDCarMasterRegister_onload, this);
            this.div_search.cb_makerSearch.addEventHandler("onitemchanged", this.div_search_cb_makerSearch_onitemchanged, this);
            this.div_search.cb_modelSearch.addEventHandler("onitemchanged", this.div_search_cb_modelSearch_onitemchanged, this);
            this.grid_carMasterSelect.addEventHandler("onselectchanged", this.grid_carMasterSelect_onselectchanged, this);
            this.btn_new.addEventHandler("onclick", this.div_search_btn_new_onclick, this);
            this.btn_del.addEventHandler("onclick", this.div_search_btn_del_onclick, this);
            this.cb_maker.addEventHandler("ontextchanged", this.div_search_cb_bankCd_ontextchanged, this);
            this.cb_maker.addEventHandler("ontextchange", this.div_search_cb_bankCd_ontextchange, this);
            this.cb_model.addEventHandler("ontextchanged", this.div_search_cb_bankCd_ontextchanged, this);
            this.cb_model.addEventHandler("ontextchange", this.div_search_cb_bankCd_ontextchange, this);
            this.cb_contents.addEventHandler("ontextchanged", this.div_search_cb_bankCd_ontextchanged, this);
            this.cb_contents.addEventHandler("ontextchange", this.div_search_cb_bankCd_ontextchange, this);
            this.cb_fr.addEventHandler("ontextchanged", this.div_search_cb_bankCd_ontextchanged, this);
            this.cb_fr.addEventHandler("ontextchange", this.div_search_cb_bankCd_ontextchange, this);
            this.cb_useYn.addEventHandler("ontextchanged", this.div_search_cb_bankCd_ontextchanged, this);
            this.cb_useYn.addEventHandler("ontextchange", this.div_search_cb_bankCd_ontextchange, this);

        };

        this.loadIncludeScript("RTSDCarMasterRegister.xfdl");

       
    };
}
)();
