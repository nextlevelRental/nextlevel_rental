﻿(function()
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
                this.set_name("RTSDOrderNo_pop");
                this.set_classname("RTCOMMOrderNo_pop");
                this.set_titletext("계약조회 팝업");
                this._setFormPosition(0,0,1145,356);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_custTpCd", this);
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

            obj = new Dataset("ds_chanCd", this);
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

            obj = new Dataset("ds_statCd", this);
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

            obj = new Dataset("ds_lfCd", this);
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

            obj = new Dataset("ds_genderCd", this);
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

            obj = new Dataset("ds_ordNoList", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"chk\" type=\"STRING\" size=\"256\"/><Column id=\"ordDay\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"birthDay\" type=\"STRING\" size=\"256\"/><Column id=\"buslNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"genderCd\" type=\"STRING\" size=\"256\"/><Column id=\"genderNm\" type=\"STRING\" size=\"256\"/><Column id=\"lfCd\" type=\"STRING\" size=\"256\"/><Column id=\"lfNm\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"telNo2\" type=\"STRING\" size=\"256\"/><Column id=\"addr\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"makerCd\" type=\"STRING\" size=\"256\"/><Column id=\"modelCd\" type=\"STRING\" size=\"256\"/><Column id=\"contentsCd\" type=\"STRING\" size=\"256\"/><Column id=\"frCd\" type=\"STRING\" size=\"256\"/><Column id=\"carKind\" type=\"STRING\" size=\"256\"/><Column id=\"statCd\" type=\"STRING\" size=\"256\"/><Column id=\"statNm\" type=\"STRING\" size=\"256\"/><Column id=\"seasonCd\" type=\"STRING\" size=\"256\"/><Column id=\"seasonNm\" type=\"STRING\" size=\"256\"/><Column id=\"saleNm\" type=\"STRING\" size=\"256\"/><Column id=\"chanNm\" type=\"STRING\" size=\"256\"/><Column id=\"hshopGbNm\" type=\"STRING\" size=\"256\"/><Column id=\"monAmt\" type=\"STRING\" size=\"256\"/><Column id=\"grpNo\" type=\"STRING\" size=\"256\"/><Column id=\"checkCnt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_ordNoListCp", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"ordDay\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"birthDay\" type=\"STRING\" size=\"256\"/><Column id=\"buslNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"genderCd\" type=\"STRING\" size=\"256\"/><Column id=\"genderNm\" type=\"STRING\" size=\"256\"/><Column id=\"lfCd\" type=\"STRING\" size=\"256\"/><Column id=\"lfNm\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"telNo2\" type=\"STRING\" size=\"256\"/><Column id=\"addr\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"makerCd\" type=\"STRING\" size=\"256\"/><Column id=\"modelCd\" type=\"STRING\" size=\"256\"/><Column id=\"contentsCd\" type=\"STRING\" size=\"256\"/><Column id=\"frCd\" type=\"STRING\" size=\"256\"/><Column id=\"carKind\" type=\"STRING\" size=\"256\"/><Column id=\"statCd\" type=\"STRING\" size=\"256\"/><Column id=\"statNm\" type=\"STRING\" size=\"256\"/><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"planDay\" type=\"STRING\" size=\"256\"/><Column id=\"instDay\" type=\"STRING\" size=\"256\"/><Column id=\"seasonCd\" type=\"STRING\" size=\"256\"/><Column id=\"seasonNm\" type=\"STRING\" size=\"256\"/><Column id=\"saleNm\" type=\"STRING\" size=\"256\"/><Column id=\"chanNm\" type=\"STRING\" size=\"256\"/><Column id=\"hshopGbNm\" type=\"STRING\" size=\"256\"/><Column id=\"monAmt\" type=\"STRING\" size=\"256\"/><Column id=\"grpNo\" type=\"STRING\" size=\"256\"/><Column id=\"checkCnt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Grid("grid_ordNoList", "absolute", "10", "120", "1125", "199", null, null, this);
            obj.set_taborder("1");
            obj.set_binddataset("ds_ordNoList");
            obj.set_cellsizingtype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"40\"/><Column size=\"84\"/><Column size=\"40\"/><Column size=\"80\"/><Column size=\"120\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"40\"/><Column size=\"60\"/><Column size=\"100\"/><Column size=\"0\"/><Column size=\"100\"/><Column size=\"0\"/><Column size=\"100\"/><Column size=\"0\"/><Column size=\"0\"/><Column size=\"80\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"86\"/><Column size=\"65\"/><Column size=\"55\"/><Column size=\"60\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"선택\"/><Cell col=\"1\" text=\"단체번호\"/><Cell col=\"2\" text=\"선납할인중복\"/><Cell col=\"3\" text=\"계약일자\"/><Cell col=\"4\" text=\"계약번호\"/><Cell col=\"5\" text=\"고객코드\"/><Cell col=\"6\" text=\"법정생년월일\"/><Cell col=\"7\" text=\"사업자번호\"/><Cell col=\"8\" text=\"고객명\"/><Cell col=\"9\" text=\"성별\"/><Cell col=\"10\" text=\"내외국인\"/><Cell col=\"11\" text=\"핸드폰\"/><Cell col=\"12\" text=\"핸드폰\"/><Cell col=\"13\" text=\"전화번호\"/><Cell col=\"14\" text=\"전화번호\"/><Cell col=\"15\" text=\"전화번호2\"/><Cell col=\"16\" text=\"전화번호2\"/><Cell col=\"17\" text=\"주소\"/><Cell col=\"18\" text=\"차량번호\"/><Cell col=\"19\" text=\"차종\"/><Cell col=\"20\" text=\"계약상태\"/><Cell col=\"21\" text=\"판매상품명\"/><Cell col=\"22\" text=\"채널\"/><Cell col=\"23\" text=\"홈쇼핑\"/><Cell col=\"24\" text=\"월렌탈료\"/></Band><Band id=\"body\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\" text=\"bind:chk\"/><Cell col=\"1\" text=\"bind:grpNo\"/><Cell col=\"2\" text=\"bind:checkCnt\"/><Cell col=\"3\" displaytype=\"date\" text=\"bind:ordDay\" calendardisplaynulltype=\"none\"/><Cell col=\"4\" displaytype=\"text\" edittype=\"readonly\" text=\"bind:ordNo\"/><Cell col=\"5\" text=\"bind:custNo\"/><Cell col=\"6\" displaytype=\"normal\" text=\"bind:birthDay\" mask=\"####-**-**\"/><Cell col=\"7\" displaytype=\"normal\" text=\"bind:buslNo\" mask=\"###-##-#####\"/><Cell col=\"8\" text=\"bind:custNm\"/><Cell col=\"9\" text=\"bind:genderNm\"/><Cell col=\"10\" text=\"bind:lfNm\"/><Cell col=\"11\" text=\"bind:mobNo\" expr=\"expr:FN_numberMaskReturn(mobNo)\"/><Cell col=\"12\" text=\"bind:mobNo\"/><Cell col=\"13\" text=\"bind:telNo\" expr=\"expr:FN_numberMaskReturn(telNo)\"/><Cell col=\"14\" text=\"bind:telNo\" expr=\"expr:FN_numberHyphenInReturn(telNo)\"/><Cell col=\"15\" text=\"bind:telNo2\" expr=\"expr:FN_numberMaskReturn(telNo2)\"/><Cell col=\"16\" text=\"bind:telNo2\" expr=\"expr:FN_numberHyphenInReturn(telNo2)\"/><Cell col=\"17\" text=\"bind:addr\"/><Cell col=\"18\" text=\"bind:carNo\"/><Cell col=\"19\" text=\"bind:carKind\"/><Cell col=\"20\" text=\"bind:statNm\"/><Cell col=\"21\" text=\"bind:saleNm\"/><Cell col=\"22\" text=\"bind:chanNm\"/><Cell col=\"23\" text=\"bind:hshopGbNm\"/><Cell col=\"24\" displaytype=\"number\" text=\"bind:monAmt\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Div("div_ordNoSearch", "absolute", "10", "10", "1125", "101", null, null, this);
            obj.set_taborder("0");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_A_custTp", "absolute", "20", "13", "100", "21", null, null, this.div_ordNoSearch);
            obj.set_taborder("5");
            obj.set_text("고객유형");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_ordNoSearch.addChild(obj.name, obj);
            obj = new Radio("ra_A_custTp", "absolute", "140", "10", "120", "21", null, null, this.div_ordNoSearch);
            this.div_ordNoSearch.addChild(obj.name, obj);
            obj.set_taborder("0");
            obj.set_innerdataset("@ds_custTpCd");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_direction("vertical");
            obj = new Div("div_ordNo01", "absolute", "0", "38", "1125", "78", null, null, this.div_ordNoSearch);
            obj.set_taborder("4");
            obj.set_scrollbars("none");
            this.div_ordNoSearch.addChild(obj.name, obj);
            obj = new Static("st_A_birthDay", "absolute", "280", "0", "100", "21", null, null, this.div_ordNoSearch.div_ordNo01);
            obj.set_taborder("8");
            obj.set_text("법정생년월일");
            obj.set_cssclass("sta_WF_schTitle");
            obj.set_visible("true");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_ordNoSearch.div_ordNo01.addChild(obj.name, obj);
            obj = new Static("st_A_mobNo", "absolute", "280", "26", "100", "21", null, null, this.div_ordNoSearch.div_ordNo01);
            obj.set_taborder("9");
            obj.set_text("핸드폰");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_ordNoSearch.div_ordNo01.addChild(obj.name, obj);
            obj = new Edit("ed_B_carNo", "absolute", "140", "26", "120", "21", null, null, this.div_ordNoSearch.div_ordNo01);
            obj.set_taborder("4");
            this.div_ordNoSearch.div_ordNo01.addChild(obj.name, obj);
            obj = new Static("st_genderCd", "absolute", "541", "0", "100", "21", null, null, this.div_ordNoSearch.div_ordNo01);
            obj.set_taborder("10");
            obj.set_text("성별");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_ordNoSearch.div_ordNo01.addChild(obj.name, obj);
            obj = new Combo("cb_genderCd", "absolute", "660", "0", "120", "21", null, null, this.div_ordNoSearch.div_ordNo01);
            this.div_ordNoSearch.div_ordNo01.addChild(obj.name, obj);
            obj.set_taborder("2");
            obj.set_displaynulltext("선택");
            obj.set_innerdataset("@ds_genderCd");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new Static("st_lfCd", "absolute", "800", "0", "100", "21", null, null, this.div_ordNoSearch.div_ordNo01);
            obj.set_taborder("11");
            obj.set_text("내/외국인");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_ordNoSearch.div_ordNo01.addChild(obj.name, obj);
            obj = new Combo("cb_lfCd", "absolute", "920", "0", "120", "21", null, null, this.div_ordNoSearch.div_ordNo01);
            this.div_ordNoSearch.div_ordNo01.addChild(obj.name, obj);
            obj.set_taborder("3");
            obj.set_displaynulltext("선택");
            obj.set_innerdataset("@ds_lfCd");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj.set_index("-1");
            obj = new Static("st_B_carNo", "absolute", "20", "26", "100", "21", null, null, this.div_ordNoSearch.div_ordNo01);
            obj.set_taborder("12");
            obj.set_text("차량번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_ordNoSearch.div_ordNo01.addChild(obj.name, obj);
            obj = new MaskEdit("ed_A_mobNo", "absolute", "400", "26", "120", "21", null, null, this.div_ordNoSearch.div_ordNo01);
            obj.set_taborder("5");
            obj.set_type("string");
            obj.set_mask("###-####-####");
            this.div_ordNoSearch.div_ordNo01.addChild(obj.name, obj);
            obj = new MaskEdit("ed_A_birthDay", "absolute", "400", "0", "120", "21", null, null, this.div_ordNoSearch.div_ordNo01);
            obj.set_taborder("1");
            obj.set_type("string");
            obj.set_mask("####-##-##");
            this.div_ordNoSearch.div_ordNo01.addChild(obj.name, obj);
            obj = new Static("st_A_custNm", "absolute", "20", "0", "100", "21", null, null, this.div_ordNoSearch.div_ordNo01);
            obj.set_taborder("13");
            obj.set_text("고객명");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_ordNoSearch.div_ordNo01.addChild(obj.name, obj);
            obj = new Edit("ed_A_custNm", "absolute", "140", "0", "120", "21", null, null, this.div_ordNoSearch.div_ordNo01);
            obj.set_taborder("0");
            this.div_ordNoSearch.div_ordNo01.addChild(obj.name, obj);
            obj = new Static("st_A_telNo", "absolute", "541", "26", "100", "21", null, null, this.div_ordNoSearch.div_ordNo01);
            obj.set_taborder("14");
            obj.set_text("전화번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_ordNoSearch.div_ordNo01.addChild(obj.name, obj);
            obj = new Edit("ed_A_telNo", "absolute", "660", "26", "120", "21", null, null, this.div_ordNoSearch.div_ordNo01);
            obj.set_taborder("6");
            obj.set_inputtype("number");
            this.div_ordNoSearch.div_ordNo01.addChild(obj.name, obj);
            obj = new Static("st_telNo02", "absolute", "800", "26", "100", "21", null, null, this.div_ordNoSearch.div_ordNo01);
            obj.set_taborder("15");
            obj.set_text("전화번호2");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_ordNoSearch.div_ordNo01.addChild(obj.name, obj);
            obj = new Edit("ed_A_telNo2", "absolute", "920", "26", "120", "21", null, null, this.div_ordNoSearch.div_ordNo01);
            obj.set_taborder("7");
            obj.set_inputtype("number");
            this.div_ordNoSearch.div_ordNo01.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "0", "0", "20", "47", null, null, this.div_ordNoSearch.div_ordNo01);
            obj.set_taborder("16");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_ordNoSearch.div_ordNo01.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "120", "0", "20", "47", null, null, this.div_ordNoSearch.div_ordNo01);
            obj.set_taborder("17");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_ordNoSearch.div_ordNo01.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "260", "0", "20", "47", null, null, this.div_ordNoSearch.div_ordNo01);
            obj.set_taborder("18");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_ordNoSearch.div_ordNo01.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "380", "0", "20", "47", null, null, this.div_ordNoSearch.div_ordNo01);
            obj.set_taborder("19");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_ordNoSearch.div_ordNo01.addChild(obj.name, obj);
            obj = new Static("Static05", "absolute", "520", "0", "20", "47", null, null, this.div_ordNoSearch.div_ordNo01);
            obj.set_taborder("20");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_ordNoSearch.div_ordNo01.addChild(obj.name, obj);
            obj = new Static("Static07", "absolute", "640", "0", "20", "47", null, null, this.div_ordNoSearch.div_ordNo01);
            obj.set_taborder("21");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_ordNoSearch.div_ordNo01.addChild(obj.name, obj);
            obj = new Static("Static08", "absolute", "780", "0", "20", "47", null, null, this.div_ordNoSearch.div_ordNo01);
            obj.set_taborder("22");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_ordNoSearch.div_ordNo01.addChild(obj.name, obj);
            obj = new Static("Static09", "absolute", "900", "0", "20", "47", null, null, this.div_ordNoSearch.div_ordNo01);
            obj.set_taborder("23");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_ordNoSearch.div_ordNo01.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "0", "20", "1111", "6", null, null, this.div_ordNoSearch.div_ordNo01);
            obj.set_taborder("24");
            obj.set_text("FIX h6");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_ordNoSearch.div_ordNo01.addChild(obj.name, obj);
            obj = new Static("Static10", "absolute", "1040", "0", "20", "47", null, null, this.div_ordNoSearch.div_ordNo01);
            obj.set_taborder("25");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_ordNoSearch.div_ordNo01.addChild(obj.name, obj);
            obj = new Static("Static11", "absolute", "1105", "0", "20", "47", null, null, this.div_ordNoSearch.div_ordNo01);
            obj.set_taborder("26");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_ordNoSearch.div_ordNo01.addChild(obj.name, obj);
            obj = new Div("div_ordNo02", "absolute", "0", "38", "1125", "60", null, null, this.div_ordNoSearch);
            obj.set_taborder("3");
            obj.set_scrollbars("none");
            obj.set_visible("false");
            this.div_ordNoSearch.addChild(obj.name, obj);
            obj = new Static("st_A_buslNo", "absolute", "280", "0", "100", "21", null, null, this.div_ordNoSearch.div_ordNo02);
            obj.set_taborder("6");
            obj.set_text("사업자번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.set_visible("true");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_ordNoSearch.div_ordNo02.addChild(obj.name, obj);
            obj = new Static("st_A_mobNo", "absolute", "800", "0", "100", "21", null, null, this.div_ordNoSearch.div_ordNo02);
            obj.set_taborder("9");
            obj.set_text("핸드폰");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_ordNoSearch.div_ordNo02.addChild(obj.name, obj);
            obj = new MaskEdit("ed_A_mobNo", "absolute", "920", "0", "120", "21", null, null, this.div_ordNoSearch.div_ordNo02);
            obj.set_taborder("3");
            obj.set_type("string");
            obj.set_mask("###-####-####");
            this.div_ordNoSearch.div_ordNo02.addChild(obj.name, obj);
            obj = new MaskEdit("ed_A_buslNo", "absolute", "400", "0", "120", "21", null, null, this.div_ordNoSearch.div_ordNo02);
            obj.set_taborder("1");
            obj.set_type("string");
            obj.set_mask("###-##-#####");
            this.div_ordNoSearch.div_ordNo02.addChild(obj.name, obj);
            obj = new Static("st_A_custNm", "absolute", "20", "0", "100", "21", null, null, this.div_ordNoSearch.div_ordNo02);
            obj.set_taborder("7");
            obj.set_text("법인명");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_ordNoSearch.div_ordNo02.addChild(obj.name, obj);
            obj = new Edit("ed_A_custNm", "absolute", "140", "0", "120", "21", null, null, this.div_ordNoSearch.div_ordNo02);
            obj.set_taborder("0");
            this.div_ordNoSearch.div_ordNo02.addChild(obj.name, obj);
            obj = new Static("st_A_telNo", "absolute", "20", "26", "100", "20", null, null, this.div_ordNoSearch.div_ordNo02);
            obj.set_taborder("10");
            obj.set_text("전화번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_ordNoSearch.div_ordNo02.addChild(obj.name, obj);
            obj = new Edit("ed_A_telNo", "absolute", "140", "26", "120", "21", null, null, this.div_ordNoSearch.div_ordNo02);
            obj.set_taborder("4");
            obj.set_inputtype("number");
            this.div_ordNoSearch.div_ordNo02.addChild(obj.name, obj);
            obj = new Static("st_B_carNo", "absolute", "540", "0", "100", "21", null, null, this.div_ordNoSearch.div_ordNo02);
            obj.set_taborder("8");
            obj.set_text("차량번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_ordNoSearch.div_ordNo02.addChild(obj.name, obj);
            obj = new Edit("ed_B_carNo", "absolute", "660", "0", "120", "21", null, null, this.div_ordNoSearch.div_ordNo02);
            obj.set_taborder("2");
            this.div_ordNoSearch.div_ordNo02.addChild(obj.name, obj);
            obj = new Static("st_telNo02", "absolute", "280", "27", "100", "20", null, null, this.div_ordNoSearch.div_ordNo02);
            obj.set_taborder("11");
            obj.set_text("회사전화");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_ordNoSearch.div_ordNo02.addChild(obj.name, obj);
            obj = new Edit("ed_A_telNo2", "absolute", "400", "26", "120", "21", null, null, this.div_ordNoSearch.div_ordNo02);
            obj.set_taborder("5");
            obj.set_inputtype("number");
            this.div_ordNoSearch.div_ordNo02.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "0", "20", "1125", "6", null, null, this.div_ordNoSearch.div_ordNo02);
            obj.set_taborder("12");
            obj.set_text("FIX h6");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_ordNoSearch.div_ordNo02.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "0", "0", "20", "47", null, null, this.div_ordNoSearch.div_ordNo02);
            obj.set_taborder("13");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_ordNoSearch.div_ordNo02.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "120", "0", "20", "47", null, null, this.div_ordNoSearch.div_ordNo02);
            obj.set_taborder("14");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_ordNoSearch.div_ordNo02.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "380", "0", "20", "47", null, null, this.div_ordNoSearch.div_ordNo02);
            obj.set_taborder("15");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_ordNoSearch.div_ordNo02.addChild(obj.name, obj);
            obj = new Static("Static05", "absolute", "520", "0", "20", "47", null, null, this.div_ordNoSearch.div_ordNo02);
            obj.set_taborder("16");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_ordNoSearch.div_ordNo02.addChild(obj.name, obj);
            obj = new Static("Static07", "absolute", "640", "0", "20", "47", null, null, this.div_ordNoSearch.div_ordNo02);
            obj.set_taborder("17");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_ordNoSearch.div_ordNo02.addChild(obj.name, obj);
            obj = new Static("Static08", "absolute", "780", "0", "20", "47", null, null, this.div_ordNoSearch.div_ordNo02);
            obj.set_taborder("18");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_ordNoSearch.div_ordNo02.addChild(obj.name, obj);
            obj = new Static("Static09", "absolute", "900", "0", "20", "47", null, null, this.div_ordNoSearch.div_ordNo02);
            obj.set_taborder("19");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_ordNoSearch.div_ordNo02.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "260", "-37", "20", "84", null, null, this.div_ordNoSearch.div_ordNo02);
            obj.set_taborder("20");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_ordNoSearch.div_ordNo02.addChild(obj.name, obj);
            obj = new Static("st_statCd", "absolute", "800", "13", "100", "21", null, null, this.div_ordNoSearch);
            obj.set_taborder("6");
            obj.set_text("계약상태");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_ordNoSearch.addChild(obj.name, obj);
            obj = new Combo("cb_statCd", "absolute", "920", "11", "120", "21", null, null, this.div_ordNoSearch);
            this.div_ordNoSearch.addChild(obj.name, obj);
            obj.set_taborder("2");
            obj.set_innerdataset("@ds_statCd");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj.set_displaynulltext("전체");
            obj.set_index("-1");
            obj = new Button("btn_search", "absolute", "1060", "64", "45", "22", null, null, this.div_ordNoSearch);
            obj.set_taborder("7");
            obj.set_text("검색");
            obj.set_cssclass("btn_WF_CRUD");
            obj.getSetter("domainId").set("nexa.add");
            this.div_ordNoSearch.addChild(obj.name, obj);
            obj = new Static("Static07", "absolute", "0", "0", "1121", "12", null, null, this.div_ordNoSearch);
            obj.set_taborder("8");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_ordNoSearch.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "0", "32", "1121", "6", null, null, this.div_ordNoSearch);
            obj.set_taborder("9");
            obj.set_text("FIX h6");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_ordNoSearch.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "0", "0", "20", "38", null, null, this.div_ordNoSearch);
            obj.set_taborder("10");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_ordNoSearch.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "120", "0", "20", "38", null, null, this.div_ordNoSearch);
            obj.set_taborder("11");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_ordNoSearch.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "0", "85", null, "12", "0", null, this.div_ordNoSearch);
            obj.set_taborder("12");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_ordNoSearch.addChild(obj.name, obj);
            obj = new Static("Static09", "absolute", "900", "5", "20", "27", null, null, this.div_ordNoSearch);
            obj.set_taborder("13");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_ordNoSearch.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "260", "0", "20", "38", null, null, this.div_ordNoSearch);
            obj.set_taborder("14");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_ordNoSearch.addChild(obj.name, obj);
            obj = new Static("st_chanCd", "absolute", "280", "13", "100", "21", null, null, this.div_ordNoSearch);
            obj.set_taborder("15");
            obj.set_text("채널구분");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_ordNoSearch.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "380", "0", "20", "38", null, null, this.div_ordNoSearch);
            obj.set_taborder("16");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_ordNoSearch.addChild(obj.name, obj);
            obj = new Combo("cb_chanCd", "absolute", "400", "12", "120", "21", null, null, this.div_ordNoSearch);
            this.div_ordNoSearch.addChild(obj.name, obj);
            obj.set_taborder("17");
            obj.set_innerdataset("@ds_chanCd");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");

            obj = new Button("btn_choice", "absolute", "1049", "327", "41", "21", null, null, this);
            obj.set_taborder("2");
            obj.set_text("선택");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);

            obj = new Button("btn_close", "absolute", "1094", "327", "41", "21", null, null, this);
            obj.set_taborder("4");
            obj.set_text("닫기");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1125, 78, this.div_ordNoSearch.div_ordNo01,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("4");
            		p.set_scrollbars("none");

            	}
            );
            this.div_ordNoSearch.div_ordNo01.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1125, 60, this.div_ordNoSearch.div_ordNo02,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("3");
            		p.set_scrollbars("none");
            		p.set_visible("false");

            	}
            );
            this.div_ordNoSearch.div_ordNo02.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1125, 248, this.div_ordNoSearch,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("0");
            		p.set_scrollbars("none");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_ordNoSearch.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1145, 356, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCOMMOrderNo_pop");
            		p.set_titletext("계약조회 팝업");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTSDOrderNo_pop.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDOrderNo_pop.xfdl", function() {
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //include "lib::comLib.xjs";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg,resultCnt,checkAuthGrpuCd){
        	if( strSvcId == "initRTCOMMOrderNo" ){
        		var rowCtCustTp = this.ds_custTpCd.rowcount;
        		if( rowCtCustTp != 0 ){
        			this.ds_ordNoList.addColumn("chk", "string", 256);
        			this.div_ordNoSearch.ra_A_custTp.set_value( this.ds_custTpCd.getColumn(0,"cd") );
        		}
        		
        		var rowcChanCd = this.ds_chanCd.rowcount;
        		if( rowcChanCd != 0 ){
        			var insert = this.ds_chanCd.insertRow( 0 );
        			this.ds_chanCd.setColumn(insert,"cd"," ");
        			this.ds_chanCd.setColumn(insert,"cdNm","전체");
        			this.div_ordNoSearch.cb_chanCd.set_value( " " );
        		}
        		
        		var rowCtStatCd = this.ds_statCd.rowcount;
        		if( rowCtStatCd != 0 ){
        			var insert = this.ds_statCd.insertRow( 0 );
        			this.ds_statCd.setColumn(insert,"cd"," ");
        			this.ds_statCd.setColumn(insert,"cdNm","전체");
        			this.div_ordNoSearch.cb_statCd.set_value(" ");
        		}
        	}
        	
        	if( strSvcId == "ordNoList" ){
        		var ct = this.ds_ordNoList.rowcount;
        		if( ct == 0 ){
        			alert("조회된 데이터가 없습니다.");
        			this.grid_ordNoList.set_nodatatext( "조회된 데이터가 없습니다." );
        		}else{
        			this.ds_ordNoList.filter("checkCnt == 'N'");			//checkCnt가 N인것들만 조회(20190221)
        		}
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.RTCOMMOrderNo_pop_onload = function(obj,e){
        	Ex.core.init(obj);
        	this.fn_init();
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_init = function(){
        	var sSvcID      	= "initRTCOMMOrderNo";  
        	var sController   	= "rtms/comm/initRTCOMMOrderNo.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	sOutDatasets += " ds_custTpCd=mapDsCustTpCd ";
        	sOutDatasets += " ds_chanCd=mapDsChanCd ";
        	sOutDatasets += " ds_statCd=mapDsStatCd ";
        	sOutDatasets += " ds_genderCd=mapDsGenderCd ";
        	sOutDatasets += " ds_lfCd=mapDsLfCd ";
        	
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_ordNoSearch_btn_search_onclick = function(obj,e){
        	var custTpVal = nvl(this.div_ordNoSearch.ra_A_custTp.value);
        	if( custTpVal == "01" ){
        		var sArgs 			= "";
        		var custTp 		= nvl(this.div_ordNoSearch.ra_A_custTp.value);
        		var statCd 		= nvl(this.div_ordNoSearch.cb_statCd.value);
        		var chanCd 		= nvl(this.div_ordNoSearch.cb_chanCd.value);
        		
        		var custNm 		= nvl(this.div_ordNoSearch.div_ordNo01.ed_A_custNm.value);
        		var birthDay 	= nvl(this.div_ordNoSearch.div_ordNo01.ed_A_birthDay.value);
        		var gender 		= nvl(this.div_ordNoSearch.div_ordNo01.cb_genderCd.value);
        		var lf 			= nvl(this.div_ordNoSearch.div_ordNo01.cb_lfCd.value);
        		var carNo 		= nvl(this.div_ordNoSearch.div_ordNo01.ed_B_carNo.value);
        		var mobNo 		= nvl(this.div_ordNoSearch.div_ordNo01.ed_A_mobNo.value);
        		var telNo 		= nvl(this.div_ordNoSearch.div_ordNo01.ed_A_telNo.value);
        		var telNo2 		= nvl(this.div_ordNoSearch.div_ordNo01.ed_A_telNo2.value);
        				
        		if( custNm != "" ){
        			if( birthDay == "" ){
        				alert("생년월일 값이 없습니다.");
        				return false;
        			}
        		}
        		if( birthDay != "" ){
        			if( custNm == "" ){
        				alert("고객명 값이 없습니다.");
        				return false;
        			}
        		}
        		if( custNm == "" && birthDay == "" && carNo == "" && mobNo == "" && telNo == "" && telNo2 == "" ){
        			alert("고객명, 법정생년월일, 차량번호, 핸드폰, 전화번호, 전화번호2 중 하나이상 검색조건 값이 있어야합니다.");
        			return false;
        		}
        		sArgs += Ex.util.setParam("custTp", custTp);
        		sArgs += Ex.util.setParam("statCd", statCd);
        		sArgs += Ex.util.setParam("chanCd", chanCd);
        		sArgs += Ex.util.setParam("birthDay", birthDay);
        		sArgs += Ex.util.setParam("mobNo", mobNo);
        		sArgs += Ex.util.setParam("carNo", carNo);
        		sArgs += Ex.util.setParam("custNm", custNm);
        		sArgs += Ex.util.setParam("telNo", telNo);
        		sArgs += Ex.util.setParam("telNo2", telNo2);
        		sArgs += Ex.util.setParam("gender", gender);
        		sArgs += Ex.util.setParam("lf", lf);
        		this.FN_search(sArgs);
        	}else if( custTpVal == "02" ){
        		var sArgs  = "";
        		var custTp = nvl(this.div_ordNoSearch.ra_A_custTp.value);
        		var statCd = nvl(this.div_ordNoSearch.cb_statCd.value);
        		var chanCd = nvl(this.div_ordNoSearch.cb_chanCd.value);

        		var custNm = nvl(this.div_ordNoSearch.div_ordNo02.ed_A_custNm.value);
        		var buslNo = nvl(this.div_ordNoSearch.div_ordNo02.ed_A_buslNo.value);
        		var carNo = nvl(this.div_ordNoSearch.div_ordNo02.ed_B_carNo.value);
        		var mobNo = nvl(this.div_ordNoSearch.div_ordNo02.ed_A_mobNo.value);
        		var telNo = nvl(this.div_ordNoSearch.div_ordNo02.ed_A_telNo.value);
        		var telNo2 = nvl(this.div_ordNoSearch.div_ordNo02.ed_A_telNo2.value);

        		if( custNm != "" ){
        			if( buslNo == "" ){
        				alert("사업자번호 값이 없습니다.");
        				return false;
        			}
        		}
        		if( buslNo != "" ){
        			if( custNm == "" ){
        				alert("법인명 값이 없습니다.");
        				return false;
        			}
        		}
        		if( custNm == "" && buslNo == "" && carNo == "" && mobNo == "" && telNo == "" && telNo2 == "" ){
        			alert("법인명, 사업자번호, 차량번호, 핸드폰, 전화번호, 회사전화 중 하나이상 검색조건 값이 있어야합니다.");
        			return false;
        		}
        		
        		sArgs += Ex.util.setParam("custTp",custTp);
        		sArgs += Ex.util.setParam("statCd",statCd);
        		sArgs += Ex.util.setParam("chanCd",chanCd);
        		sArgs += Ex.util.setParam("buslNo",buslNo);
        		sArgs += Ex.util.setParam("custNm",custNm);
        		sArgs += Ex.util.setParam("carNo",carNo);
        		sArgs += Ex.util.setParam("mobNo",mobNo);
        		sArgs += Ex.util.setParam("telNo",telNo);
        		sArgs += Ex.util.setParam("telNo2",telNo2);
        		this.FN_search(sArgs);
        	}else{
        		return false;
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.FN_search = function(sArgs){
        	var sSvcID        	= "ordNoList";                    
        	var sController   	= "rtms/comm/ordNoListPackage.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_ordNoList=ordNoMap";
        	var sArgs 			= sArgs;	
        	var fn_callBack		= "fn_callBack";
        	this.ds_ordNoList.deleteAll();
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.grid_ordNoList_oncelldblclick = function(obj,e){
        	this.FN_choice();
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.btn_choice_onclick = function(obj,e){
        	this.FN_choice();
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.FN_choice = function(){
        	var pos = this.ds_ordNoList.rowposition;
        	if( pos == -1 ){
        		alert("선택된 행이 없습니다.");
        	}else{
        		if(this.parent.p_arg == "RTSDPlan"){ //장착등록 RTSDPlan.xfdl
        			var ordNo = this.ds_ordNoList.getColumn(pos, "ordNo");
        			this.close(this.opener.returnOrderNoInfo(ordNo));
        		}else{
        		var nCnt = this.ds_ordNoList.getRowCount();
        			this.ds_ordNoListCp.clearData();
        			for( var i = 0 ; i < nCnt ; i++){
        			if(this.ds_ordNoList.getColumn(i,"chk",1)==1){
        				if(this.ds_ordNoList.getColumn(i,"grpNo")==null){
        /*					if(this.ds_ordNoList.getColumn(i,"checkCnt")=='Y'){*/
        						var idx = this.ds_ordNoListCp.addRow();
        						this.ds_ordNoListCp.copyRow(idx,this.ds_ordNoList,i);
        // 					}else{
        //  					this.alert("이미 선납할인이 되어있습니다. 중복할인이 불가합니다.");
        //  					return false;
        //  					}
        				}
        			}
        		}			
        			var arr = [this.ds_ordNoListCp];			
        			this.close(this.opener.returnOrderNoInfo(arr));
        		}
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.btn_close_onclick = function(obj,e){
        	this.close();
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_ordNoSearch_ra_A_custTp_onitemchanged = function(obj,e){
        	var custTpVal = nvl(this.div_ordNoSearch.ra_A_custTp.value);
        	this.ds_ordNoList.clearData();
        	if( custTpVal == "01" ){
        		this.div_ordNoSearch.div_ordNo01.set_visible(true);
        		this.div_ordNoSearch.div_ordNo02.set_visible(false);
        		
        		this.div_ordNoDetail.st_buslNo.set_visible(false);
        		this.div_ordNoDetail.ed_buslNo.set_visible(false);
        		
        		this.div_ordNoDetail.st_birthDay.set_visible(true);
        		this.div_ordNoDetail.ed_birthDay.set_visible(true);
        		
        		this.div_ordNoDetail.st_genderNm.set_visible(true);
        		this.div_ordNoDetail.ed_genderNm.set_visible(true);
        		
        		this.div_ordNoDetail.st_lfNm.set_visible(true);
        		this.div_ordNoDetail.ed_lfNm.set_visible(true);
        		
        		this.div_ordNoDetail.st_telNo2.set_text("전화번호2");
        		
        		this.grid_ordNoList.setRealColSize( 3, 100 );//법정생년월일
        		this.grid_ordNoList.setRealColSize( 4, 0 );//사업자번호
        		this.grid_ordNoList.setRealColSize( 6, 100 );//성별
        		this.grid_ordNoList.setRealColSize( 7, 100 );//내외국인
        		
        		this.grid_ordNoList.setCellProperty( "head", 10, "text", "전화번호2");
        	}else if( custTpVal == "02" ){
        		this.div_ordNoSearch.div_ordNo01.set_visible(false);
        		this.div_ordNoSearch.div_ordNo02.set_visible(true);
        		
        		this.div_ordNoDetail.st_buslNo.set_visible(true);
        		this.div_ordNoDetail.ed_buslNo.set_visible(true);
        		
        		this.div_ordNoDetail.st_birthDay.set_visible(false);
        		this.div_ordNoDetail.ed_birthDay.set_visible(false);
        		
        		this.div_ordNoDetail.st_genderNm.set_visible(false);
        		this.div_ordNoDetail.ed_genderNm.set_visible(false);
        		
        		this.div_ordNoDetail.st_lfNm.set_visible(false);
        		this.div_ordNoDetail.ed_lfNm.set_visible(false);
        		
        		this.div_ordNoDetail.st_telNo2.set_text("회사전화");
        		
        		this.grid_ordNoList.setRealColSize( 3, 0 );//법정생년월일
        		this.grid_ordNoList.setRealColSize( 4, 100 );//사업자번호
        		this.grid_ordNoList.setRealColSize( 6, 0 );//성별
        		this.grid_ordNoList.setRealColSize( 7, 0 );//내외국인
        		this.grid_ordNoList.setCellProperty( "head", 10, "text", "회사전화");
        	}else{
        		return false;
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.RTCOMMOrderNo_pop_onkeyup = function(obj,e){
        	if(e.keycode == 27){
        		this.close();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_ordNoSearch_div_ordNo02_ed_A_custNm_onkeyup = function(obj,e){
        	if( e.keycode == "13" ){
        		this.div_ordNoSearch_btn_search_onclick();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_ordNoSearch_div_ordNo02_ed_A_buslNo_onkeyup = function(obj,e){
        	if( e.keycode == "13" ){
        		this.div_ordNoSearch_btn_search_onclick();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_ordNoSearch_div_ordNo02_ed_B_carNo_onkeyup = function(obj,e){
        	if( e.keycode == "13" ){
        		this.div_ordNoSearch_btn_search_onclick();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_ordNoSearch_div_ordNo02_ed_A_mobNo_onkeyup = function(obj,e){
        	if( e.keycode == "13" ){
        		this.div_ordNoSearch_btn_search_onclick();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_ordNoSearch_div_ordNo02_ed_A_telNo_onkeyup = function(obj,e){
        	if( e.keycode == "13" ){
        		this.div_ordNoSearch_btn_search_onclick();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_ordNoSearch_div_ordNo02_ed_A_telNo2_onkeyup = function(obj,e){
        	if( e.keycode == "13" ){
        		this.div_ordNoSearch_btn_search_onclick();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_ordNoSearch_div_ordNo01_ed_A_custNm_onkeyup = function(obj,e)
        {
        	if( e.keycode == "13" ){
        		this.div_ordNoSearch_btn_search_onclick();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_ordNoSearch_div_ordNo01_ed_A_birthDay_onkeyup = function(obj,e){
        	if( e.keycode == "13" ){
        		this.div_ordNoSearch_btn_search_onclick();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_ordNoSearch_div_ordNo01_ed_B_carNo_onkeyup = function(obj,e){
        	if( e.keycode == "13" ){
        		this.div_ordNoSearch_btn_search_onclick();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_ordNoSearch_div_ordNo01_ed_A_mobNo_onkeyup = function(obj,e){
        	if( e.keycode == "13" ){
        		this.div_ordNoSearch_btn_search_onclick();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_ordNoSearch_div_ordNo01_ed_A_telNo_onkeyup = function(obj,e){
        	if( e.keycode == "13" ){
        		this.div_ordNoSearch_btn_search_onclick();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_ordNoSearch_div_ordNo01_ed_A_telNo2_onkeyup = function(obj,e){
        	if( e.keycode == "13" ){
        		this.div_ordNoSearch_btn_search_onclick();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_ordNoSearch_div_ordNo02_ed_A_buslNo_onsetfocus = function(obj,e){
        	this.FN_setSelect(obj);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_ordNoSearch_div_ordNo01_ed_A_birthDay_onsetfocus = function(obj,e){
        	this.FN_setSelect(obj);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_ordNoSearch_div_ordNo01_ed_A_mobNo_onsetfocus = function(obj,e){
        	this.FN_setSelect(obj);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_ordNoSearch_div_ordNo02_ed_A_mobNo_onsetfocus = function(obj,e){
        	this.FN_setSelect(obj);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.FN_setSelect = function(obj){
        	obj.setSelect(0);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

        
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTCOMMOrderNo_pop_onload, this);
            this.addEventHandler("onkeyup", this.RTCOMMOrderNo_pop_onkeyup, this);
            this.grid_ordNoList.addEventHandler("oncellclick", this.grid_ordNoList_oncellclick, this);
            this.div_ordNoSearch.ra_A_custTp.addEventHandler("onitemchanged", this.div_ordNoSearch_ra_A_custTp_onitemchanged, this);
            this.div_ordNoSearch.div_ordNo01.ed_B_carNo.addEventHandler("onkeyup", this.div_ordNoSearch_div_ordNo01_ed_B_carNo_onkeyup, this);
            this.div_ordNoSearch.div_ordNo01.ed_A_mobNo.addEventHandler("onkeyup", this.div_ordNoSearch_div_ordNo01_ed_A_mobNo_onkeyup, this);
            this.div_ordNoSearch.div_ordNo01.ed_A_mobNo.addEventHandler("onsetfocus", this.div_ordNoSearch_div_ordNo01_ed_A_mobNo_onsetfocus, this);
            this.div_ordNoSearch.div_ordNo01.ed_A_birthDay.addEventHandler("onkeyup", this.div_ordNoSearch_div_ordNo01_ed_A_birthDay_onkeyup, this);
            this.div_ordNoSearch.div_ordNo01.ed_A_birthDay.addEventHandler("onsetfocus", this.div_ordNoSearch_div_ordNo01_ed_A_birthDay_onsetfocus, this);
            this.div_ordNoSearch.div_ordNo01.ed_A_custNm.addEventHandler("onkeyup", this.div_ordNoSearch_div_ordNo01_ed_A_custNm_onkeyup, this);
            this.div_ordNoSearch.div_ordNo01.ed_A_telNo.addEventHandler("onkeyup", this.div_ordNoSearch_div_ordNo01_ed_A_telNo_onkeyup, this);
            this.div_ordNoSearch.div_ordNo01.ed_A_telNo2.addEventHandler("onkeyup", this.div_ordNoSearch_div_ordNo01_ed_A_telNo2_onkeyup, this);
            this.div_ordNoSearch.div_ordNo02.ed_A_mobNo.addEventHandler("onkeyup", this.div_ordNoSearch_div_ordNo02_ed_A_mobNo_onkeyup, this);
            this.div_ordNoSearch.div_ordNo02.ed_A_mobNo.addEventHandler("onsetfocus", this.div_ordNoSearch_div_ordNo02_ed_A_mobNo_onsetfocus, this);
            this.div_ordNoSearch.div_ordNo02.ed_A_buslNo.addEventHandler("onkeyup", this.div_ordNoSearch_div_ordNo02_ed_A_buslNo_onkeyup, this);
            this.div_ordNoSearch.div_ordNo02.ed_A_buslNo.addEventHandler("onsetfocus", this.div_ordNoSearch_div_ordNo02_ed_A_buslNo_onsetfocus, this);
            this.div_ordNoSearch.div_ordNo02.ed_A_custNm.addEventHandler("onkeyup", this.div_ordNoSearch_div_ordNo02_ed_A_custNm_onkeyup, this);
            this.div_ordNoSearch.div_ordNo02.ed_A_telNo.addEventHandler("onkeyup", this.div_ordNoSearch_div_ordNo02_ed_A_telNo_onkeyup, this);
            this.div_ordNoSearch.div_ordNo02.ed_B_carNo.addEventHandler("onkeyup", this.div_ordNoSearch_div_ordNo02_ed_B_carNo_onkeyup, this);
            this.div_ordNoSearch.div_ordNo02.ed_A_telNo2.addEventHandler("onkeyup", this.div_ordNoSearch_div_ordNo02_ed_A_telNo2_onkeyup, this);
            this.div_ordNoSearch.btn_search.addEventHandler("onclick", this.div_ordNoSearch_btn_search_onclick, this);
            this.btn_choice.addEventHandler("onclick", this.btn_choice_onclick, this);
            this.btn_close.addEventHandler("onclick", this.btn_close_onclick, this);

        };

        this.loadIncludeScript("RTSDOrderNo_pop.xfdl");

       
    };
}
)();
