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
                this.set_name("RTCMSmsReg");
                this.set_classname("RTCMCdGrp");
                this.set_titletext("SMS포맷등록");
                this._setFormPosition(0,0,1147,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_searchCondition", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_cdGrp", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"lrgGrpCd\" type=\"STRING\" size=\"256\"/><Column id=\"midGrpCd\" type=\"STRING\" size=\"256\"/><Column id=\"midGrpNm\" type=\"STRING\" size=\"256\"/><Column id=\"midGrpDesc\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_cdList", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"midGrpCd\" type=\"STRING\" size=\"256\"/><Column id=\"midGrpNm\" type=\"STRING\" size=\"256\"/><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/><Column id=\"msgContents\" type=\"STRING\" size=\"256\"/><Column id=\"kakaoMsgCd\" type=\"STRING\" size=\"256\"/><Column id=\"msgType\" type=\"STRING\" size=\"256\"/><Column id=\"reservedType\" type=\"STRING\" size=\"256\"/><Column id=\"orderPt\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"useYnNm\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_mdl", this);
            obj.set_firefirstcount("0");
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
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_useYnChild", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_searchConditionChild", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_paramList", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"midGrpCd\" type=\"STRING\" size=\"256\"/><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"paramCd\" type=\"STRING\" size=\"256\"/><Column id=\"paramCdNm\" type=\"STRING\" size=\"256\"/><Column id=\"paramCdDesc\" type=\"STRING\" size=\"256\"/><Column id=\"orderPt\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"useYnNm\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_posList", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"sendPos\" type=\"STRING\" size=\"256\"/><Column id=\"midGrpCd\" type=\"STRING\" size=\"256\"/><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"useYnNm\" type=\"STRING\" size=\"256\"/><Column id=\"remark\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_lockList", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"sendPos\" type=\"STRING\" size=\"256\"/><Column id=\"midGrpCd\" type=\"STRING\" size=\"256\"/><Column id=\"midGrpNm\" type=\"STRING\" size=\"256\"/><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"seq\" type=\"STRING\" size=\"256\"/><Column id=\"strDay\" type=\"STRING\" size=\"256\"/><Column id=\"endDay\" type=\"STRING\" size=\"256\"/><Column id=\"lockYn\" type=\"STRING\" size=\"256\"/><Column id=\"lockType\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Grid("grid_cdGrp", "absolute", "0", "65", "300", "421", null, null, this);
            obj.set_taborder("17");
            obj.set_binddataset("ds_cdGrp");
            obj.set_cellsizingtype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"100\"/><Column size=\"184\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"문자코드\"/><Cell col=\"1\" text=\"문자코드명\"/></Band><Band id=\"body\"><Cell text=\"bind:midGrpCd\"/><Cell col=\"1\" text=\"bind:midGrpNm\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "0", "0", null, "45", "25", null, this);
            obj.set_taborder("7");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_searchCondition", "absolute", "20", "10", "71", "20", null, null, this.div_search);
            obj.set_taborder("36");
            obj.set_text("검색");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_searchCondition", "absolute", "61", "10", "140", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("37");
            obj.set_innerdataset("@ds_searchConditionChild");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj.set_visible("true");
            obj.set_readonly("false");
            obj.set_displaynulltext("선택");
            obj.set_index("-1");
            obj = new Edit("ed_searchKeyword", "absolute", "206", "10", "260", "21", null, null, this.div_search);
            obj.set_taborder("38");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "1122", "0", "25", "496", null, null, this);
            obj.set_taborder("9");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "45", "1122", "20", null, null, this);
            obj.set_taborder("10");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "318", "61", "100", "20", null, null, this);
            obj.set_taborder("11");
            obj.set_text("코드그룹");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "319", "76", "802", "10", null, null, this);
            obj.set_taborder("12");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static07", "absolute", "319", "177", "803", "20", null, null, this);
            obj.set_taborder("13");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "720", "225", "100", "20", null, null, this);
            obj.set_taborder("14");
            obj.set_text("검색");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static08", "absolute", "319", "208", "803", "10", null, null, this);
            obj.set_taborder("15");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "299", "65", "20", "431", null, null, this);
            obj.set_taborder("16");
            obj.set_text("FIX\r\nw20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static11", "absolute", "319", "86", null, "31", "25", null, this);
            obj.set_taborder("20");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static12", "absolute", "319", "116", null, "31", "25", null, this);
            obj.set_taborder("21");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_midGrpCd", "absolute", "319", "86", "130", "31", null, null, this);
            obj.set_taborder("18");
            obj.set_text("문자코드");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.addChild(obj.name, obj);

            obj = new Static("st_midGrpNm", "absolute", "319", "116", "130", "31", null, null, this);
            obj.set_taborder("19");
            obj.set_text("문자코드명");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.addChild(obj.name, obj);

            obj = new Static("Static10", "absolute", "719", "86", "130", "31", null, null, this);
            obj.set_taborder("24");
            obj.set_text("모듈");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.addChild(obj.name, obj);

            obj = new Static("st_useYn", "absolute", "719", "116", "130", "31", null, null, this);
            obj.set_taborder("25");
            obj.set_text("사용여부");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.addChild(obj.name, obj);

            obj = new Static("Static14", "absolute", "319", "146", null, "31", "25", null, this);
            obj.set_taborder("26");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static15", "absolute", "319", "146", "130", "31", null, null, this);
            obj.set_taborder("27");
            obj.set_text("설명");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_cdGrpCd", "absolute", "453", "91", "193", "21", null, null, this);
            obj.set_taborder("28");
            obj.set_inputmode("upper");
            obj.set_inputtype("number,english");
            obj.set_maxlength("4");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_cdGrpNm", "absolute", "453", "121", "262", "21", null, null, this);
            obj.set_taborder("29");
            obj.set_maxlength("100");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_cdGrpDesc", "absolute", "453", "151", "650", "21", null, null, this);
            obj.set_taborder("30");
            obj.set_maxlength("100");
            this.addChild(obj.name, obj);

            obj = new Button("btn_overlapConfirm", "absolute", "650", "91", "65", "21", null, null, this);
            obj.set_taborder("31");
            obj.set_text("중복확인");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Combo("cb_mdlCd", "absolute", "853", "91", "120", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("32");
            obj.set_displaynulltext("선택");
            obj.set_innerdataset("@ds_mdl");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");

            obj = new Combo("cd_useYn", "absolute", "853", "121", "120", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("33");
            obj.set_displaynulltext("선택");
            obj.set_innerdataset("@ds_useYn");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");

            obj = new Edit("ed_overlapConfirmFlag", "absolute", "977", "91", "140", "21", null, null, this);
            obj.set_taborder("34");
            obj.set_value("false");
            obj.set_maxlength("20");
            obj.set_enable("false");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Combo("cb_searchConditionChild", "absolute", "793", "223", "113", "20", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("38");
            obj.set_displaynulltext("선택");
            obj.set_innerdataset("@ds_searchConditionChild");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");

            obj = new Edit("ed_searchKeywordChild", "absolute", "911", "223", "149", "21", null, null, this);
            obj.set_taborder("39");
            this.addChild(obj.name, obj);

            obj = new Button("btn_searchChild", "absolute", "1070", "223", "45", "22", null, null, this);
            obj.set_taborder("40");
            obj.set_text("조회");
            obj.set_cssclass("btn_WF_module");
            obj.getSetter("domainId").set("nexa.search");
            this.addChild(obj.name, obj);

            obj = new Tab("Tab00", "absolute", "27.81%", "221", null, "270", "2.27%", null, this);
            obj.set_taborder("50");
            obj.set_tabindex("0");
            obj.set_scrollbars("autoboth");
            this.addChild(obj.name, obj);
            obj = new Tabpage("tabpage1", this.Tab00);
            obj.set_text("문자분류");
            this.Tab00.addChild(obj.name, obj);
            obj = new Grid("grid_cdList", "absolute", "0", "31", "449", "203", null, null, this.Tab00.tabpage1);
            obj.set_taborder("0");
            obj.set_binddataset("ds_cdList");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"60\"/><Column size=\"120\"/><Column size=\"269\"/><Column size=\"80\"/><Column size=\"60\"/><Column size=\"60\"/><Column size=\"60\"/><Column size=\"60\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"코드\"/><Cell col=\"1\" text=\"코드명\"/><Cell col=\"2\" text=\"메세지\"/><Cell col=\"3\" text=\"알림톡코드\"/><Cell col=\"4\" text=\"발송방식\"/><Cell col=\"5\" text=\"발송유형\"/><Cell col=\"6\" text=\"정렬순서\"/><Cell col=\"7\" text=\"사용여부\"/></Band><Band id=\"body\"><Cell edittype=\"expr:(dataset.getRowType(currow) == 2) ? 'normal' : 'none'\" text=\"bind:cd\"/><Cell col=\"1\" edittype=\"normal\" text=\"bind:cdNm\"/><Cell col=\"2\" edittype=\"normal\" text=\"bind:msgContents\"/><Cell col=\"3\" text=\"bind:kakaoMsgCd\"/><Cell col=\"4\" text=\"bind:msgType\"/><Cell col=\"5\" text=\"bind:reservedType\"/><Cell col=\"6\" edittype=\"normal\" text=\"bind:orderPt\"/><Cell col=\"7\" displaytype=\"combo\" edittype=\"combo\" text=\"bind:useYn\" combodataset=\"ds_useYnChild\" combocodecol=\"cd\" combodatacol=\"cdNm\" combodisplay=\"display\"/></Band></Format></Formats>");
            this.Tab00.tabpage1.addChild(obj.name, obj);
            obj = new Button("btnDelCd", "absolute", "704", "4", "45", "22", null, null, this.Tab00.tabpage1);
            obj.set_taborder("1");
            obj.set_text("삭제");
            obj.set_cssclass("btn_WF_module");
            this.Tab00.tabpage1.addChild(obj.name, obj);
            obj = new Button("btnAddCd", "absolute", "752", "5", "45", "22", null, null, this.Tab00.tabpage1);
            obj.set_taborder("2");
            obj.set_text("추가");
            obj.set_cssclass("btn_WF_module");
            this.Tab00.tabpage1.addChild(obj.name, obj);
            obj = new TextArea("txt_contents", "absolute", "57.11%", "31", null, "203", "0.37%", null, this.Tab00.tabpage1);
            obj.set_taborder("3");
            obj.style.set_background("antiquewhite");
            obj.style.set_color("transparent");
            this.Tab00.tabpage1.addChild(obj.name, obj);
            obj = new Tabpage("tabpage2", this.Tab00);
            obj.set_text("파라미터");
            this.Tab00.addChild(obj.name, obj);
            obj = new Grid("grid_paramList", "absolute", "0", "31", "795", "203", null, null, this.Tab00.tabpage2);
            obj.set_taborder("0");
            obj.set_binddataset("ds_paramList");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"100\"/><Column size=\"200\"/><Column size=\"60\"/><Column size=\"60\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"코드\"/><Cell col=\"1\" text=\"코드명\"/><Cell col=\"2\" text=\"설명\"/><Cell col=\"3\" text=\"정렬순서\"/><Cell col=\"4\" text=\"사용여부\"/></Band><Band id=\"body\"><Cell edittype=\"expr:(dataset.getRowType(currow) == 2) ? 'normal' : 'none'\" text=\"bind:paramCd\"/><Cell col=\"1\" edittype=\"normal\" text=\"bind:paramCdNm\"/><Cell col=\"2\" edittype=\"normal\" text=\"bind:paramCdDesc\"/><Cell col=\"3\" edittype=\"normal\" text=\"bind:orderPt\"/><Cell col=\"4\" displaytype=\"combo\" edittype=\"combo\" text=\"bind:useYn\" combodataset=\"ds_useYnChild\" combocodecol=\"cd\" combodatacol=\"cdNm\" combodisplay=\"display\"/></Band></Format></Formats>");
            this.Tab00.tabpage2.addChild(obj.name, obj);
            obj = new Button("btnDelParam", "absolute", null, "4", "45", "22", "51", null, this.Tab00.tabpage2);
            obj.set_taborder("1");
            obj.set_text("삭제");
            obj.set_cssclass("btn_WF_module");
            this.Tab00.tabpage2.addChild(obj.name, obj);
            obj = new Button("btnAddParam", "absolute", null, "4", "45", "22", "3", null, this.Tab00.tabpage2);
            obj.set_taborder("2");
            obj.set_text("추가");
            obj.set_cssclass("btn_WF_module");
            this.Tab00.tabpage2.addChild(obj.name, obj);
            obj = new Tabpage("tabpage3", this.Tab00);
            obj.set_text("발송위치매핑");
            this.Tab00.addChild(obj.name, obj);
            obj = new Grid("grid_posList", "absolute", "0", "31", "797", "203", null, null, this.Tab00.tabpage3);
            obj.set_taborder("0");
            obj.set_binddataset("ds_posList");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"150\"/><Column size=\"100\"/><Column size=\"120\"/><Column size=\"200\"/><Column size=\"60\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"발송위치코드\"/><Cell col=\"1\" text=\"중분류\"/><Cell col=\"2\" text=\"코드\"/><Cell col=\"3\" text=\"적요\"/><Cell col=\"4\" text=\"사용여부\"/></Band><Band id=\"body\"><Cell edittype=\"none\" text=\"bind:sendPos\"/><Cell col=\"1\" edittype=\"text\" text=\"bind:midGrpCd\"/><Cell col=\"2\" edittype=\"text\" text=\"bind:cd\"/><Cell col=\"3\" edittype=\"text\" text=\"bind:remark\"/><Cell col=\"4\" displaytype=\"combo\" edittype=\"combo\" text=\"bind:useYn\" combodataset=\"ds_useYnChild\" combocodecol=\"cd\" combodatacol=\"cdNm\" combodisplay=\"display\"/></Band></Format></Formats>");
            this.Tab00.tabpage3.addChild(obj.name, obj);
            obj = new Button("btnAddCd", "absolute", "752", "5", "45", "22", null, null, this.Tab00.tabpage3);
            obj.set_taborder("1");
            obj.set_text("추가");
            obj.set_cssclass("btn_WF_module");
            this.Tab00.tabpage3.addChild(obj.name, obj);
            obj = new Button("btnDelCd", "absolute", "704", "4", "45", "22", null, null, this.Tab00.tabpage3);
            obj.set_taborder("2");
            obj.set_text("삭제");
            obj.set_cssclass("btn_WF_module");
            this.Tab00.tabpage3.addChild(obj.name, obj);
            obj = new Tabpage("tabpage4", this.Tab00);
            obj.set_text("발송제한설정");
            this.Tab00.addChild(obj.name, obj);
            obj = new Grid("grid_lockList", "absolute", "0", "31", "802", "203", null, null, this.Tab00.tabpage4);
            obj.set_taborder("0");
            obj.set_binddataset("ds_lockList");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"60\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"40\"/><Column size=\"60\"/><Column size=\"60\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"발송위치\"/><Cell col=\"1\" text=\"중분류\"/><Cell col=\"2\" text=\"코드명\"/><Cell col=\"3\" text=\"고객번호\"/><Cell col=\"4\" text=\"주문번호\"/><Cell col=\"5\" text=\"시작일\"/><Cell col=\"6\" text=\"종료일\"/><Cell col=\"7\" text=\"순번\"/><Cell col=\"8\" text=\"제한여부\"/><Cell col=\"9\" text=\"제한유형\"/></Band><Band id=\"body\"><Cell/><Cell col=\"1\"/><Cell col=\"2\" edittype=\"normal\" text=\"bind:cdNm\"/><Cell col=\"3\"/><Cell col=\"4\"/><Cell col=\"5\" displaytype=\"date\"/><Cell col=\"6\" displaytype=\"date\"/><Cell col=\"7\"/><Cell col=\"8\" displaytype=\"combo\" edittype=\"combo\" text=\"bind:useYn\" combodataset=\"ds_useYnChild\" combocodecol=\"cd\" combodatacol=\"cdNm\" combodisplay=\"display\"/><Cell col=\"9\" displaytype=\"combo\" edittype=\"combo\" combodisplay=\"display\"/></Band></Format></Formats>");
            this.Tab00.tabpage4.addChild(obj.name, obj);
            obj = new Button("btnDelCd", "absolute", "704", "4", "45", "22", null, null, this.Tab00.tabpage4);
            obj.set_taborder("1");
            obj.set_text("삭제");
            obj.set_cssclass("btn_WF_module");
            this.Tab00.tabpage4.addChild(obj.name, obj);
            obj = new Button("btnAddCd", "absolute", "752", "5", "45", "22", null, null, this.Tab00.tabpage4);
            obj.set_taborder("2");
            obj.set_text("추가");
            obj.set_cssclass("btn_WF_module");
            this.Tab00.tabpage4.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 0, 45, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("7");
            		p.set_text("Div00");
            		p.set_scrollbars("none");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 0, 0, this.Tab00.tabpage1,
            	//-- Layout function
            	function(p) {
            		p.set_text("문자분류");

            	}
            );
            this.Tab00.tabpage1.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 0, 0, this.Tab00.tabpage2,
            	//-- Layout function
            	function(p) {
            		p.set_text("파라미터");

            	}
            );
            this.Tab00.tabpage2.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 0, 0, this.Tab00.tabpage3,
            	//-- Layout function
            	function(p) {
            		p.set_text("발송위치매핑");

            	}
            );
            this.Tab00.tabpage3.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 0, 0, this.Tab00.tabpage4,
            	//-- Layout function
            	function(p) {
            		p.set_text("발송제한설정");

            	}
            );
            this.Tab00.tabpage4.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1147, 496, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCMCdGrp");
            		p.set_titletext("SMS포맷등록");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item5","ed_cdGrpCd","value","ds_cdGrp","midGrpCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item6","ed_cdGrpNm","value","ds_cdGrp","midGrpNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item7","ed_cdGrpDesc","value","ds_cdGrp","midGrpDesc");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item8","cb_mdlCd","value","ds_cdGrp","lrgGrpCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item9","cd_useYn","value","ds_cdGrp","useYn");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item0","Tab00.tabpage1.txt_contents","value","ds_cdList","msgContents");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCMSmsReg.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCMSmsReg.xfdl", function() {
        	//include "lib::comLib.xjs";
        	
        	this.resultCnt = 0;//중복코드카운트
        	this.checkCd = "";	//중복코드코드
        	var checkCdRow; 	//중복체크ROW
        	this.seqNo = 0;
        	
            
            FN_stringByteLength = function(p_val){
        		var objString = new String(p_val);
        		var stringByteLength = 0;
        		for(var i=0; i<objString.length; i++)
        		{
        			if( escape(objString.charAt(i)).length >= 4)  stringByteLength += 3;
        			else if(escape(objString.charAt(i)) == "%A7") stringByteLength += 3;
        			else if(escape(objString.charAt(i)) != "%0D") stringByteLength++;
        		}
        		return stringByteLength;
        	}
            
        	
        	
        	/***********************************************************************************
        	* Events
        	***********************************************************************************/
        	this.RTCMCdGrp_onload = function(obj,e)
        	{
        		Ex.core.init(obj); 	
        		this.fn_init();
        		this.parent.setButton("E|C|N|S", this);
        	}

            this.div_cdGrp_grid_codeGrp_onselectchanged = function(obj,e)
        	{
        		if(this.ds_cdGrp.getRowType( this.ds_cdGrp.rowposition ) != 2){
        			this.ed_cdGrpCd.set_value	(this.ds_cdGrp.getColumn(this.grid_cdGrp.currentrow, "midGrpCd"));
        			this.cb_mdlCd.set_value		(this.ds_cdGrp.getColumn(this.grid_cdGrp.currentrow, "lrgGrpCd"));
        			this.ed_cdGrpNm.set_value	(this.ds_cdGrp.getColumn(this.grid_cdGrp.currentrow, "midGrpNm"));
        			this.cd_useYn.set_value		(this.ds_cdGrp.getColumn(this.grid_cdGrp.currentrow, "useYn"));
        			this.ed_cdGrpDesc.set_value	(this.ds_cdGrp.getColumn(this.grid_cdGrp.currentrow, "midGrpDesc"));
        			
        			this.ed_cdGrpCd.set_enable(false);
        			this.btn_overlapConfirm.set_visible(false);
        			
        			this.ed_overlapConfirmFlag.set_value("true");
        			this.fn_cdList("parent");
        		}
        		
        		if(this.ds_cdGrp.getRowType( this.ds_cdGrp.rowposition ) == 2){
        			this.ed_cdGrpCd.set_enable(true);
        			this.btn_overlapConfirm.set_visible(true);
        			this.ed_overlapConfirmFlag.set_value("false");
        			this.ds_cdList.clearData();
        		}
        	}
            
            this.div_cdGrpDetails_btn_overlapConfirm_onclick = function(obj,e)
        	{
        		var edCdGrpCdVal = nvl(this.ed_cdGrpCd.value);
        		
        		if( nvl(edCdGrpCdVal) != "" ){
        			var sSvcID        	= "cdGrpCdOverlapConfirm";                    
        			var sController   	= "rtms/cm/cdGrpCdOverlapConfirm.do";
        			var sInDatasets   	= "";
        			var sOutDatasets  	= "";
        			var sArgs 			= "";
        			sInDatasets   		= "";
        			sOutDatasets  		= "";
        			var fn_callBack		= "fn_callBack";
        			
        			sArgs += Ex.util.setParam("cdGrpCd",edCdGrpCdVal);
        			
        			Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        		}else{
        			alert("공통코드 값이 없습니다.");
        			this.ed_cdGrpCd.setFocus();
        		}
        	}	
        	
        	this.div_cdGrpChild_btn_searchChild_onclick = function(obj,e)
        	{
        		this.fn_cdList("child");
        	}
        	
        	this.ds_cdGrpChild_oncolumnchanged = function(obj,e)
        	{
        		if(e.columnid == "cd") {
        			checkCdRow = e.row;
        			this.FN_cdGrpCdCheck( nvl(obj.getColumn(e.row, "midGrpCd")), nvl(obj.getColumn(e.row, "cd")) );
        		}
        	}
        	
        	// 2016-05-03 이영근, 엔터키 입력시 조회
        	this.div_search_ed_searchKeyword_onkeyup = function(obj,e)
        	{
        		if( e.keycode == "13" ){
        			this.fn_search();
        		}	
        	}

        	this.Tab00_onchanged = function(obj,e)
        	{
        		if(obj.tabindex == 0){		
        			this.fn_cdList("parent");		
        		} else if(obj.tabindex == 1) {
        			this.fn_paramList();
        		} else {			
        			this.fn_posList();
        		}
        	}

        	this.Tab00_tabpage1_btnAddCd_onclick = function(obj,e)
        	{
        		var midGrpCd     	    = nvl(this.ed_cdGrpCd.value);
        		var cdUseYn  			= nvl(this.cd_useYn.value);
        		var overlapConfirmVal 	= nvl(this.ed_overlapConfirmFlag.value);
        		
        		var cdGrpCdTxt = nvl(this.st_cdGrpCd.text);
        		var cdGrpNmTxt = nvl(this.st_cdGrpNm.text);
        		var cdUseYnTxt = nvl(this.st_useYn.text);
        		var overlapConfirmTxt = nvl(this.btn_overlapConfirm.text);
        		
        		if( cdGrpCd == "" ){
        			alert(cdGrpCdTxt + " 값이 없습니다.");
        			this.ed_cdGrpCd.setFocus();
        		}else if( cdUseYn == "" ){
        			alert(cdUseYnTxt + " 값이 없습니다.");
        			this.cd_useYn.setFocus();
        		}else if( overlapConfirmVal == "false"){
        			alert(overlapConfirmTxt + "을 하십시오.");
        			this.btn_overlapConfirm.setFocus();
        		}else{
        			var nRow = this.ds_cdList.addRow();
        			this.grid_cdList.selectRow(nRow);
        			this.grid_cdList.setCellPos(0);
        			this.grid_cdList.showEditor(true);
        			this.ds_cdList.setColumn(nRow,"useYn","Y");
        			this.ds_cdList.setColumn(nRow,"midGrpCd",midGrpCd);
        		}
        	}

        	this.Tab00_tabpage1_btnDelCd_onclick = function(obj,e)
        	{
        		var gridCdListSlected = this.grid_cdList.currentrow;
        			
        		if( gridCdListSlected == -9 ){
        			alert("삭제할 행을 선택하여 주십시오.");
        		}else{
        			this.ds_cdList.deleteRow(gridCdListSlected);
        		}
        	}

        	this.Tab00_tabpage2_btnAddParam_onclick = function(obj,e)
        	{
        		var cdRow = this.ds_cdList.rowposition;
        		var midGrpCd = this.ds_paramList.getColumn(cdRow, "midGrpCd");
        		var cd = this.ds_paramList.getColumn(cdRow, "cd");
        		
        		var nRow = this.ds_paramList.addRow();
        		this.grid_paramList.selectRow(nRow);
        		this.grid_paramList.setCellPos(0);
        		this.grid_paramList.showEditor(true);
        		this.ds_paramList.setColumn(nRow,"useYn","Y");
        		this.ds_paramList.setColumn(nRow,"midGrpCd",midGrpCd);
        		this.ds_paramList.setColumn(nRow,"cd",cd);
        	}
        	
        	this.Tab00_tabpage2_btnDelParam_onclick = function(obj,e)
        	{
        		var gridParamListSlected = this.grid_paramList.currentrow;
        			
        		if( gridParamListSlected == -9 ){
        			alert("삭제할 행을 선택하여 주십시오.");
        		}else{
        			this.ds_paramList.deleteRow(gridParamListSlected);
        		}
        	}

        	this.Tab00_tabpage3_btnAddCd_onclick = function(obj,e)
        	{
        		var nRow = this.ds_posList.addRow();
        		this.ds_posList.setColumn(nRow, "sendPos", "RENTAL_" + this.seqNo);
        	}

        	this.Tab00_tabpage3_btnDelCd_onclick = function(obj,e)
        	{
        		this.ds_posList.deleteRow(this.ds_posList.rowposition);
        	}
        	
        	this.Tab00_tabpage4_btnAddCd_onclick = function(obj,e)
        	{
        		var nRow = this.ds_lockList.addRow();
        	}
        	
        	this.Tab00_tabpage4_btnDelCd_onclick = function(obj,e)
        	{
        		this.ds_lockList.deleteRow(this.ds_posList.rowposition);
        	}
            /***********************************************************************************
        	* CallBack Event (strSvcId - Sevice ID, nErrorCode - ErrorCode, strErrorMsg - Error Message)
        	***********************************************************************************/
            this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg,resultCnt,checkCd)
        	{
        		if( strSvcId == "listCdGrp" ){
        			if( this.ds_cdGrp.getRowCount() == 0 ){
        				this.grid_cdGrp.set_nodatatext("조회된 데이터가 없습니다.");
        				this.div_search.ed_searchKeyword.setFocus();
        			}
        		}
        		
        		if (strSvcId == "checkCd") 
        		{
        			if(this.resultCnt != '0') {
        				alert( "입력하신 " + nvl( this.grid_cdList.getCellText(-1, 0) ) + " \'" + this.checkCd + "\' 는 존재하고 있습니다." );
        				this.ds_cdList.setColumn(checkCdRow,"cd", "");
        				this.grid_cdList.selectRow(checkCdRow);
        				this.grid_cdList.setCellPos(0);
        			}
        		}
        		
        		if( strSvcId == "cdGrpCdOverlapConfirm" ){
        			var msg = "";
        			if(this.resultCnt != "0") {
        				msg = "입력하신 코드 \'" + this.ed_cdGrpCd.value + "\'는 존재하고 있습니다.";
        				this.ed_cdGrpCd.set_value("");
        				this.ed_cdGrpCd.setFocus();
        			} else {
        				msg = "사용가능한 코드 입니다.";
        				this.ed_cdGrpCd.set_enable(false);
        				this.btn_overlapConfirm.set_visible(false)
        				this.ed_overlapConfirmFlag.set_value("true");
        				this.ed_cdGrpNm.setFocus(true);
        			}
        			resultCnt = 0;
        			alert(msg);
        		}
        		
        		if( strSvcId == "saveCdGrp" ){
        			if( nErrorCode == "0" ){
        				alert(strErrorMsg);
        				this.reload();
        			}else{
        				alert(strErrorMsg);
        			}
        		}
        		
        		if( strSvcId == "listSmsDetailCd" ){
        			if( this.ds_cdList.getRowCount() == 0 ){
        				this.grid_cdList.set_nodatatext("조회된 데이터가 없습니다.");
        			}
        		}
        		
        		if( strSvcId == "listSmsParamCd" ) {
        			if( this.ds_paramList.getRowCount() == 0 ){
        				this.grid_paramList.set_nodatatext("조회된 데이터가 없습니다.");
        			}
        		}
        		
        		if( strSvcId == "listSmsSendPos" ) {
        			if( this.ds_posList.getRowCount() == 0 ){
        				this.grid_posList.set_nodatatext("조회된 데이터가 없습니다.");
        			}
        						
        		    this.fn_smsSendSeq();
        		}
        		
        		//최초로드시 공통코드선택
        		if(strSvcId == "listcdGrpCombo") {
        			this.div_search.cb_searchCondition.set_value("CD_GRP_CD");
        		}
        	}	
        	
        	/***********************************************************************************
        	* Custom function
        	***********************************************************************************/
        	this.fn_init = function(){
        		var sSvcID      	= "listcdGrpCombo";  
        		var sController   	= "rtms/cm/listcdGrpCombo.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_searchCondition=output1 ds_searchConditionChild=output2 ds_mdl=output3 ds_useYn=output4 ds_useYnChild=output5";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        	
        	this.fn_add = function(obj,e)
        	{
        		var nRow = this.ds_cdGrp.addRow();
        		this.ds_cdGrp.setColumn(nRow,"useYn", "Y");
        		this.ed_cdGrpCd.setFocus(true);
        		this.ds_cdList.clearData();
        		this.ds_paramList.clearData();
        	}

        	this.fn_search = function(obj,e)
        	{
        		var cbSearchConditionVal 	= nvl(this.div_search.cb_searchCondition.value);
        		var cbSearchConditionTxt 	= nvl(this.div_search.cb_searchCondition.text);
        		var edSearchKeywordVal 		= nvl(this.div_search.ed_searchKeyword.value);
        		
        		var sSvcID        	= "listSmsHeaderCd";                    
        		var sController   	= "rtms/cm/listSmsHeaderCd.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_cdGrp=output";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		if( cbSearchConditionVal == 'CD_GRP_CD' ){
        			sArgs += Ex.util.setParam("midGrpCd", edSearchKeywordVal);
        		}else{
        			alert("검색조건을 선택하세요.");
        			return this.div_search.cb_searchCondition.setFocus();
        		}
        		
        		this.ds_cdGrp.clearData();
        		this.ds_cdList.clearData();
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        		

        	this.fn_save = function(obj,e)
        	{
        		var dsCdListRowCt = this.ds_cdList.getRowCount();
        		var exitFlag = false;
        		var overlapConfirmVal 	= nvl(this.ed_overlapConfirmFlag.value);
        		var overlapConfirmTxt 	= nvl(this.btn_overlapConfirm.text);
        		
        		if( overlapConfirmVal == "true" ){
        			var edCdGrpCdVal 	= nvl(this.ed_cdGrpCd.value);
        			var cbMdlCdVal 		= nvl(this.cb_mdlCd.value);
        			var edCdGrpNmVal 	= nvl(this.ed_cdGrpNm.value);
        			var cdUseYnVal 		= nvl(this.cd_useYn.value);
        			var edCdGrpDescVal 	= nvl(this.ed_cdGrpDesc.value);
        			
        			var cdGrpCdTxt 		= nvl(this.st_cdGrpCd.text);
        			var cdGrpNmTxt 		= nvl(this.st_cdGrpNm.text);
        			var cdUseYnTxt 		= nvl(this.st_useYn.text);
        			
        			if( edCdGrpCdVal == "" ){
        				alert(cdGrpCdTxt + " 값이 없습니다.");
        				this.ed_cdGrpCd.setFocus();
        			}else if( FN_stringByteLength(edCdGrpCdVal)  > 4 ){
        				alert(cdGrpCdTxt + " 크기가 4Byte를 초과하였습니다.");
        				this.ed_cdGrpCd.setFocus();
        			}else if( edCdGrpNmVal == "" ){
        				alert("저장되었습니다.");
        				this.ed_cdGrpNm.setFocus();
        			}else if( cdUseYnVal == "" ){
        				alert(cdUseYnTxt + " 값이 없습니다.");
        				this.cd_useYn.setFocus();
        			}else{
        				
        				if( dsCdListRowCt > 0){
        					for( var row_i = 1 , row_ii = 0 ; row_i <= dsCdGrpChildRowCt ; row_i++, row_ii++){
        						for( var cell_i = 0 ; cell_i <= 3 ; cell_i++){
        						
        							var cellVal = nvl(this.grid_cdGrpChild.getCellValue(row_ii, cell_i));
        							
        							if( (cell_i == 0 || cell_i == 1) && cellVal == "" ){
        								alert(nvl(this.grid_cdList.getCellText(-1, cell_i)) + " 값이 없습니다.");
        								this.grid_cdList.selectRow(row_ii);
        								this.grid_cdList.setCellPos(cell_i);
        								this.grid_cdList.showEditor(true);
        								exitFlag = true;
        							}
        							/*
        							else if( cell_i == 0 && FN_stringByteLength(cellVal) > 16 ){
        								alert(nvl(this.grid_cdGrpChild.getCellText(-1, cell_i)) + " 크기가 16Byte를 초과하였습니다.");
        								this.grid_cdGrpChild.selectRow(row_ii);
        								this.grid_cdGrpChild.setCellPos(cell_i);
        								this.grid_cdGrpChild.showEditor(true);
        								exitFlag = true;
        							}
        							*/
        							if(exitFlag){break;}
        						}
        						for( var find_i = 1 ; find_i <= dsCdListRowCt ; find_i++ ){
        							if( row_i != find_i && nvl(this.ds_cdList.getColumn( row_i, "cd" )) ==  nvl(this.ds_cdList.getColumn( find_i, "cd" )) ){
        								alert( "\'" + nvl(this.ds_cdList.getColumn(  find_i, "cd" )) + "\'" + " 중복된 코드값입니다." );
        								this.grid_cdList.selectRow(find_i);
        								this.grid_cdList.setCellPos(0);
        								this.grid_cdList.showEditor(true);
        								exitFlag = true;
        							}
        							if(exitFlag){break;}
        						}
        					}
        				}else{
        					exitFlag = false;
        				}
        				
        				if( !exitFlag  ){
        					var saveFlag_1 = true;
        					var saveFlag_2 = true;
        					if( this.ds_cdGrp.getRowType( this.ds_cdGrp.rowposition ) == 1 ){
        						saveFlag_1 = false;
        					}else{
        						saveFlag_1 = true;
        					}
        					
        					for(var i  = 0 ; i < this.ds_cdList.getRowCount() ; i++){
        						if( this.ds_cdList.getRowType( i ) == 1){
        							saveFlag_2 = false;
        						}else{
        							saveFlag_2 = true;break;
        						}
        					}
        					
        					if( saveFlag_1 == true || saveFlag_2 == true){
        						var sSvcID        	= "saveCdGrp";                    
        						var sController   	= "rtms/cm/saveCdGrp.do";
        						var sInDatasets   	= "";
        						var sOutDatasets  	= "";
        						var sArgs 			= "";
        						var fn_callBack		= "fn_callBack";
        						sInDatasets += "input1=ds_cdGrp:U input2=ds_cdList:U";
        						Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        					}else{
        						alert("수정된 사항이 없습니다.");
        					}
        				}				
        			}
        		}else{
        			alert(overlapConfirmTxt + "을 하십시오.");
        			this.btn_overlapConfirm.setFocus();
        		}
        	}
        	
        	this.fn_cdList = function(division){
        	
        		var midGrpCd = this.ds_cdGrp.getColumn(grid_cdGrp_selectNb, "midGrpCd");
        		if(nvl(midGrpCd) == "") {
        			return;
        		}
        		
        		var grid_cdGrp_selectNb = this.grid_cdGrp.currentrow;
        	
        		var cbSearchConditionChildVal = nvl(this.cb_searchConditionChild.value);
        		var cbSearchConditionTxt 	  = this.cb_searchConditionChild.text;
        		var edSearchKeywordChildVal   = nvl(this.ed_searchKeywordChild.value);
        		
        		var sSvcID        	= "listSmsDetailCd";
        		var sController   	= "rtms/cm/listSmsDetailCd.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_cdList=output";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		
        		sArgs += Ex.util.setParam( "midGrpCd", midGrpCd );
        		sArgs += Ex.util.setParam( "cd", "" );
        		
        		if( division == "child"){
        			if( cbSearchConditionChildVal == 'CD_GRP_CD' ){
        				sArgs += Ex.util.setParam("cd", edSearchKeywordChildVal);
        			}else{
        				alert("검색조건을 선택하세요.");
        				return this.cb_searchConditionChild.setFocus();
        			}
        		}
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        	
        	this.fn_paramList = function() {
        	
        		var midGrpCd = this.ds_cdList.getColumn(grid_cdList_selectNb, "midGrpCd");
        		var cd = this.ds_cdList.getColumn(grid_cdList_selectNb, "cd");
        		if(nvl(midGrpCd) == "" || nvl(cd) == "") {
        			return;
        		}
        		
        		var grid_cdList_selectNb = this.Tab00.tabpage1.grid_cdList.currentrow;
        		
        		var sSvcID        	= "listSmsParamCd";
        		var sController   	= "rtms/cm/listSmsParamCd.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_paramList=output";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        				
        		sArgs += Ex.util.setParam( "midGrpCd", this.ds_cdList.getColumn(grid_cdList_selectNb, "midGrpCd") );
        		sArgs += Ex.util.setParam( "cd", this.ds_cdList.getColumn(grid_cdList_selectNb, "cd") );
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        	
        	this.fn_posList = function() {
        		
        		var sSvcID        	= "listSmsSendPos";
        		var sController   	= "rtms/cm/listSmsSendPos.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_posList=output";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        	
        	this.fn_smsSendSeq = function() {

        		var sSvcID        	= "selectSeqSmsPosNo";
        		var sController   	= "rtms/cm/selectSeqSmsPosNo.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}

        	this.FN_cdGrpCdCheck = function(objVal1,objVal2)
        	{
        		var sSvcID        	= "checkCd";
        		var sController   	= "rtms/cm/checkSmsCd.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";
        		sInDatasets   		= "";
        		sOutDatasets  		= "";
        		var fn_callBack		= "fn_callBack";
        		
        		sArgs += Ex.util.setParam("midGrpCd",objVal1);
        		sArgs += Ex.util.setParam("cd"	    ,objVal2);
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}	
        	
        	this.fn_excel= function() {
        		var objArray1 = new Array();
        		objArray1.push(this.grid_cdGrp);
        		objArray1.push(this.grid_cdList);
        		objArray1.push(this.grid_paramList);
        		Ex.core.exportExcel(this, objArray1);
        	}
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.ds_cdList.addEventHandler("oncolumnchanged", this.ds_cdGrpChild_oncolumnchanged, this);
            this.ds_paramList.addEventHandler("oncolumnchanged", this.ds_cdGrpChild_oncolumnchanged, this);
            this.ds_lockList.addEventHandler("oncolumnchanged", this.ds_cdGrpChild_oncolumnchanged, this);
            this.addEventHandler("onload", this.RTCMCdGrp_onload, this);
            this.grid_cdGrp.addEventHandler("onselectchanged", this.div_cdGrp_grid_codeGrp_onselectchanged, this);
            this.div_search.ed_searchKeyword.addEventHandler("onkeyup", this.div_search_ed_searchKeyword_onkeyup, this);
            this.Static00.addEventHandler("onclick", this.Static00_onclick, this);
            this.Static01.addEventHandler("onclick", this.Static00_onclick, this);
            this.btn_overlapConfirm.addEventHandler("onclick", this.div_cdGrpDetails_btn_overlapConfirm_onclick, this);
            this.btn_searchChild.addEventHandler("onclick", this.div_cdGrpChild_btn_searchChild_onclick, this);
            this.Tab00.addEventHandler("onchanged", this.Tab00_onchanged, this);
            this.Tab00.tabpage1.btnDelCd.addEventHandler("onclick", this.Tab00_tabpage1_btnDelCd_onclick, this);
            this.Tab00.tabpage1.btnAddCd.addEventHandler("onclick", this.Tab00_tabpage1_btnAddCd_onclick, this);
            this.Tab00.tabpage2.btnDelParam.addEventHandler("onclick", this.Tab00_tabpage2_btnDelParam_onclick, this);
            this.Tab00.tabpage2.btnAddParam.addEventHandler("onclick", this.Tab00_tabpage2_btnAddParam_onclick, this);
            this.Tab00.tabpage3.btnAddCd.addEventHandler("onclick", this.Tab00_tabpage3_btnAddCd_onclick, this);
            this.Tab00.tabpage3.btnDelCd.addEventHandler("onclick", this.Tab00_tabpage3_btnDelCd_onclick, this);
            this.Tab00.tabpage4.btnDelCd.addEventHandler("onclick", this.Tab00_tabpage4_btnDelCd_onclick, this);
            this.Tab00.tabpage4.btnAddCd.addEventHandler("onclick", this.Tab00_tabpage4_btnAddCd_onclick, this);

        };

        this.loadIncludeScript("RTCMSmsReg.xfdl");

       
    };
}
)();
