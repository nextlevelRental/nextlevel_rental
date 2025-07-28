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
                this.set_name("RTSDVisitInstallList");
                this.set_classname("RTSDVisitInstallList");
                this.set_titletext("방문장착목록");
                this._setFormPosition(0,0,1147,544);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_S105", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_S106", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_S105_cond", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_S106_cond", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_visitList", this);
            obj._setContents("<ColumnInfo><Column id=\"agencyCd\" type=\"STRING\" size=\"256\"/><Column id=\"agencyNm\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"ordStatCd\" type=\"STRING\" size=\"256\"/><Column id=\"ordStatNm\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"makerCd\" type=\"STRING\" size=\"256\"/><Column id=\"makerNm\" type=\"STRING\" size=\"256\"/><Column id=\"modelCd\" type=\"STRING\" size=\"256\"/><Column id=\"modelNm\" type=\"STRING\" size=\"256\"/><Column id=\"contentsCd\" type=\"STRING\" size=\"256\"/><Column id=\"contentsNm\" type=\"STRING\" size=\"256\"/><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"frCd\" type=\"STRING\" size=\"256\"/><Column id=\"frNm\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"reqDay\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"procTm\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"bldMngNo\" type=\"STRING\" size=\"256\"/><Column id=\"poscd\" type=\"STRING\" size=\"256\"/><Column id=\"addr1\" type=\"STRING\" size=\"256\"/><Column id=\"addr2\" type=\"STRING\" size=\"256\"/><Column id=\"statCd\" type=\"STRING\" size=\"256\"/><Column id=\"statNm\" type=\"STRING\" size=\"256\"/><Column id=\"statDtlCd\" type=\"STRING\" size=\"256\"/><Column id=\"statDtlNm\" type=\"STRING\" size=\"256\"/><Column id=\"memo\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/><Column id=\"ordDay\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Div("div_search", "absolute", "0", "0", "1122", "78", null, null, this);
            obj.set_taborder("0");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("Static08", "absolute", "0", "0", "25", "64", null, null, this.div_search);
            obj.set_taborder("0");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static26", "absolute", "0", "0", "1122", "12", null, null, this.div_search);
            obj.set_taborder("2");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "0", "32", "1122", "12", null, null, this.div_search);
            obj.set_taborder("11");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_custNm02", "absolute", "27", "44", "52", "21", null, null, this.div_search);
            obj.set_taborder("12");
            obj.set_text("고객명");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_custNm", "absolute", "93", "44", "98", "21", null, null, this.div_search);
            obj.set_taborder("6");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "0", "64", "1122", "12", null, null, this.div_search);
            obj.set_taborder("13");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_custNm03", "absolute", "217", "44", "52", "21", null, null, this.div_search);
            obj.set_taborder("14");
            obj.set_text("연락처");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_mobNo", "absolute", "284", "44", "97", "21", null, null, this.div_search);
            obj.set_taborder("7");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cmb_statCd", "absolute", "861", "12", "81", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("4");
            obj.set_innerdataset("@ds_S105_cond");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("6");
            obj = new Combo("cmb_statDtlCd", "absolute", "948", "12", "144", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("5");
            obj.set_innerdataset("@ds_S106_cond");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj = new Static("st_custNm04", "absolute", "789", "12", "71", "21", null, null, this.div_search);
            obj.set_taborder("15");
            obj.set_text("상태");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_custNm05", "absolute", "790", "44", "68", "21", null, null, this.div_search);
            obj.set_taborder("16");
            obj.set_text("계약번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_ordNo", "absolute", "861", "44", "114", "21", null, null, this.div_search);
            obj.set_taborder("10");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition00", "absolute", "414", "12", "84", "21", null, null, this.div_search);
            obj.set_taborder("17");
            obj.set_text("방문예정일");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_visitFrom", "absolute", "500", "12", "100", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("1");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Static("Static07", "absolute", "605", "12", "10", "21", null, null, this.div_search);
            obj.set_taborder("18");
            obj.set_text("~");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_visitTo", "absolute", "620", "12", "100", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("3");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Static("st_searchCondition01", "absolute", "413", "43", "89", "21", null, null, this.div_search);
            obj.set_taborder("19");
            obj.set_text("계약접수일");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_ordFrom", "absolute", "500", "43", "100", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("8");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Static("Static01", "absolute", "605", "43", "10", "21", null, null, this.div_search);
            obj.set_taborder("20");
            obj.set_text("~");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_ordTo", "absolute", "620", "43", "100", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("9");
            obj.set_dateformat("yyyy-MM-dd");

            obj = new Static("Static05", "absolute", "0", "78", "1147", "10", null, null, this);
            obj.set_taborder("2");
            obj.set_text("h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_border("0 none #808080,1 solid #d2020bff");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "28", "13", "80", "20", null, null, this);
            obj.set_taborder("3");
            obj.set_text("대리점");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Edit("vkazcCd", "absolute", "95", "13", "72", "21", null, null, this);
            obj.set_taborder("4");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Button("btn_save02", "absolute", "146", "13", "21", "21", null, null, this);
            obj.set_taborder("1");
            obj.set_cssclass("btn_WF_edtSch");
            this.addChild(obj.name, obj);

            obj = new Edit("vkazcNm", "absolute", "166", "13", "217", "21", null, null, this);
            obj.set_taborder("5");
            obj.set_enable("false");
            obj.set_readonly("false");
            obj.set_visible("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_contractInfo", "absolute", "0", "83", "108", "21", null, null, this);
            obj.set_taborder("6");
            obj.set_text("방문장착 목록");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_visitList", "absolute", "0", "109", "1122", "239", null, null, this);
            obj.set_taborder("7");
            obj.set_binddataset("ds_visitList");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"53\"/><Column size=\"114\"/><Column size=\"87\"/><Column size=\"60\"/><Column size=\"75\"/><Column size=\"75\"/><Column size=\"44\"/><Column size=\"48\"/><Column size=\"80\"/><Column size=\"64\"/><Column size=\"85\"/><Column size=\"65\"/><Column size=\"91\"/><Column size=\"156\"/><Column size=\"35\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"대리점\"/><Cell col=\"1\" text=\"대리점명\"/><Cell col=\"2\" text=\"계약번호\"/><Cell col=\"3\" text=\"계약상태\"/><Cell col=\"4\" text=\"계약접수일\"/><Cell col=\"5\" text=\"방문예정일\"/><Cell col=\"6\" text=\"시간\"/><Cell col=\"7\" text=\"상태\"/><Cell col=\"8\" text=\"세부상태\"/><Cell col=\"9\" text=\"고객명\"/><Cell col=\"10\" text=\"연락처\"/><Cell col=\"11\" text=\"차량번호\"/><Cell col=\"12\" text=\"차종\"/><Cell col=\"13\" text=\"제품명\"/><Cell col=\"14\" text=\"본수\"/></Band><Band id=\"body\"><Cell displaytype=\"normal\" edittype=\"none\" text=\"bind:agencyCd\"/><Cell col=\"1\" displaytype=\"normal\" edittype=\"none\" text=\"bind:agencyNm\"/><Cell col=\"2\" displaytype=\"text\" edittype=\"readonly\" text=\"bind:ordNo\" maskchar=\"_\"/><Cell col=\"3\" text=\"bind:ordStatNm\"/><Cell col=\"4\" displaytype=\"date\" text=\"bind:ordDay\" maskchar=\" \"/><Cell col=\"5\" displaytype=\"date\" text=\"bind:procDay\" maskchar=\" \"/><Cell col=\"6\" displaytype=\"normal\" text=\"bind:procTm\" mask=\"##:##\" maskchar=\" \"/><Cell col=\"7\" text=\"bind:statNm\"/><Cell col=\"8\" text=\"bind:statDtlNm\"/><Cell col=\"9\" displaytype=\"text\" edittype=\"readonly\" text=\"bind:custNm\" maskchar=\" \"/><Cell col=\"10\" displaytype=\"text\" edittype=\"readonly\" text=\"bind:mobNo\"/><Cell col=\"11\" displaytype=\"text\" edittype=\"readonly\" text=\"bind:carNo\"/><Cell col=\"12\" text=\"bind:modelNm\"/><Cell col=\"13\" displaytype=\"text\" edittype=\"none\" text=\"bind:matNm\"/><Cell col=\"14\" displaytype=\"normal\" edittype=\"none\" text=\"bind:cntCd\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "99", "1147", "10", null, null, this);
            obj.set_taborder("8");
            obj.set_text("h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_border("0 none #808080,1 solid #d2020bff");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "0", "350", "1147", "40", null, null, this);
            obj.set_taborder("9");
            obj.style.set_background("#ffffffff");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "348", "1147", "10", null, null, this);
            obj.set_taborder("11");
            obj.set_text("h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_border("0 none #808080,1 solid #d2020bff");
            this.addChild(obj.name, obj);

            obj = new Static("stc_fixRow1", "absolute", "0", "358", "1121", "31", null, null, this);
            obj.set_taborder("12");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.style.set_background("#ffffffff");
            this.addChild(obj.name, obj);

            obj = new Static("Static25", "absolute", "0", "418", "1121", "31", null, null, this);
            obj.set_taborder("15");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_posCd", "absolute", "371", "423", "77", "21", null, null, this);
            obj.set_taborder("17");
            obj.set_inputtype("number");
            obj.set_readonly("true");
            obj.set_maxlength("6");
            obj.style.set_background("#f7f7f7ff");
            this.addChild(obj.name, obj);

            obj = new Static("st_addr", "absolute", "286", "418", "80", "31", null, null, this);
            obj.set_taborder("18");
            obj.set_text("주소");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_addr1", "absolute", "453", "423", "274", "21", null, null, this);
            obj.set_taborder("19");
            obj.set_readonly("true");
            obj.set_maxlength("100");
            obj.style.set_background("#f7f7f7ff");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_addr2", "absolute", "732", "423", "291", "21", null, null, this);
            obj.set_taborder("20");
            obj.set_readonly("true");
            obj.set_maxlength("160");
            obj.style.set_background("#f7f7f7ff");
            this.addChild(obj.name, obj);

            obj = new Button("btn_postSearch", "absolute", "427", "422", "20", "21", null, null, this);
            obj.set_taborder("21");
            obj.set_cssclass("btn_WF_edtSch");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "0", "448", "1121", "31", null, null, this);
            obj.set_taborder("22");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_statCd", "absolute", "286", "448", "80", "31", null, null, this);
            obj.set_taborder("23");
            obj.set_text("상태");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("st_procDay", "absolute", "0", "448", "80", "31", null, null, this);
            obj.set_taborder("24");
            obj.set_text("방문일시");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Calendar("cal_procDay", "absolute", "85", "453", "98", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("25");
            obj.set_dateformat("yyyy-MM-dd");

            obj = new MaskEdit("ed_procTm", "absolute", "188", "453", "45", "21", null, null, this);
            obj.set_taborder("26");
            obj.set_type("string");
            obj.set_mask("@@:@@");
            obj.set_maskchar(" ");
            obj.style.set_color("black");
            obj.style.set_align("left middle");
            this.addChild(obj.name, obj);

            obj = new Combo("cmb_statCd", "absolute", "371", "453", "79", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("27");
            obj.set_innerdataset("@ds_S105");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");

            obj = new Combo("cmb_statDtlCd", "absolute", "455", "453", "139", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("28");
            obj.set_innerdataset("@ds_S106");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");

            obj = new Static("st_procDay00", "absolute", "0", "418", "80", "31", null, null, this);
            obj.set_taborder("29");
            obj.set_text("연락처");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_mobNo", "absolute", "85", "423", "103", "21", null, null, this);
            obj.set_taborder("30");
            obj.set_inputtype("number");
            obj.set_maxlength("15");
            obj.style.set_background("#ffffffff");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_memo", "absolute", "686", "453", "428", "21", null, null, this);
            obj.set_taborder("31");
            obj.set_readonly("false");
            obj.set_maxlength("200");
            this.addChild(obj.name, obj);

            obj = new Static("st_memo", "absolute", "601", "448", "80", "31", null, null, this);
            obj.set_taborder("32");
            obj.set_text("메모");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.addChild(obj.name, obj);

            obj = new Static("Static83", "absolute", "1121", "0", "26", null, null, "-2", this);
            obj.set_taborder("33");
            obj.set_text("w40");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_custNm", "absolute", "85", "363", "103", "21", null, null, this);
            obj.set_taborder("34");
            obj.set_readonly("true");
            obj.set_maxlength("200");
            obj.style.set_background("#f7f7f7ff");
            this.addChild(obj.name, obj);

            obj = new Static("st_custNm", "absolute", "0", "358", "80", "31", null, null, this);
            obj.set_taborder("35");
            obj.set_text("고객명");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("st_carNo", "absolute", "286", "358", "80", "31", null, null, this);
            obj.set_taborder("37");
            obj.set_text("차량번호");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_carNo", "absolute", "371", "363", "79", "21", null, null, this);
            obj.set_taborder("38");
            obj.set_readonly("true");
            obj.set_maxlength("200");
            obj.style.set_background("#f7f7f7ff");
            this.addChild(obj.name, obj);

            obj = new Static("st_modelNm", "absolute", "476", "358", "80", "31", null, null, this);
            obj.set_taborder("39");
            obj.set_text("차종");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_modelNm", "absolute", "561", "363", "145", "21", null, null, this);
            obj.set_taborder("40");
            obj.set_readonly("true");
            obj.set_maxlength("200");
            obj.style.set_background("#f7f7f7ff");
            this.addChild(obj.name, obj);

            obj = new Static("stc_fixRow00", "absolute", "0", "388", "1121", "31", null, null, this);
            obj.set_taborder("47");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.style.set_background("#ffffffff");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_ordNo", "absolute", "85", "393", "103", "21", null, null, this);
            obj.set_taborder("48");
            obj.set_readonly("true");
            obj.set_maxlength("200");
            obj.style.set_background("#f7f7f7ff");
            this.addChild(obj.name, obj);

            obj = new Static("st_ordNo", "absolute", "0", "388", "80", "31", null, null, this);
            obj.set_taborder("51");
            obj.set_text("계약번호");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("st_matNm", "absolute", "476", "388", "80", "31", null, null, this);
            obj.set_taborder("56");
            obj.set_text("제품명");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_matNm", "absolute", "561", "393", "201", "21", null, null, this);
            obj.set_taborder("57");
            obj.set_readonly("true");
            obj.set_maxlength("200");
            obj.style.set_background("#f7f7f7ff");
            this.addChild(obj.name, obj);

            obj = new Static("st_cntCd", "absolute", "767", "388", "80", "31", null, null, this);
            obj.set_taborder("58");
            obj.set_text("본수");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_cntCd", "absolute", "852", "393", "38", "21", null, null, this);
            obj.set_taborder("59");
            obj.set_readonly("true");
            obj.set_maxlength("200");
            obj.style.set_background("#f7f7f7ff");
            this.addChild(obj.name, obj);

            obj = new Static("st_statNm", "absolute", "286", "388", "80", "31", null, null, this);
            obj.set_taborder("60");
            obj.set_text("계약상태");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_ordStatNm", "absolute", "371", "393", "79", "21", null, null, this);
            obj.set_taborder("61");
            obj.set_readonly("true");
            obj.set_maxlength("200");
            obj.style.set_background("#f7f7f7ff");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_contentsNm", "absolute", "711", "363", "145", "21", null, null, this);
            obj.set_taborder("62");
            obj.set_readonly("true");
            obj.set_maxlength("200");
            obj.style.set_background("#f7f7f7ff");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_bldMngNo", "absolute", "1029", "423", "85", "21", null, null, this);
            obj.set_taborder("63");
            obj.set_inputtype("number");
            obj.set_readonly("true");
            obj.set_maxlength("6");
            obj.style.set_background("#f7f7f7ff");
            obj.set_visible("false");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1122, 78, this.div_search,
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
            obj = new Layout("default", "", 1147, 544, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTSDVisitInstallList");
            		p.set_titletext("방문장착목록");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item0","ed_posCd","value","ds_visitList","poscd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item1","ed_addr1","value","ds_visitList","addr1");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item2","ed_addr2","value","ds_visitList","addr2");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item8","cal_procDay","value","ds_visitList","procDay");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item9","ed_procTm","value","ds_visitList","procTm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item17","cmb_statCd","value","ds_visitList","statCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item4","cmb_statDtlCd","value","ds_visitList","statDtlCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item23","ed_mobNo","value","ds_visitList","mobNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item14","ed_memo","value","ds_visitList","memo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item3","ed_custNm","value","ds_visitList","custNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item6","ed_carNo","value","ds_visitList","carNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item7","ed_modelNm","value","ds_visitList","modelNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item13","ed_ordNo","value","ds_visitList","ordNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item19","ed_matNm","value","ds_visitList","matNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item20","ed_cntCd","value","ds_visitList","cntCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item21","ed_ordStatNm","value","ds_visitList","ordStatNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item5","ed_contentsNm","value","ds_visitList","contentsNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item10","ed_bldMngNo","value","ds_visitList","bldMngNo");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTSDVisitInstallList.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDVisitInstallList.xfdl", function() {
        /***************************************************************************************************
         * 파 일 명 : RTSDVisitInstallList.xfdl
         * 설    명 : 방문점검관리
         * 작 성 자 : wjim
         * 변경이력 :
         * 변경일자		변경자		변경내용
         * ----------	------		--------
         * 2018-11-28	wjim		[20181102_01] 신규 개발
         * 2019-01-23	wjim		[20190123_01] 조회항목 추가
         *                          - 계약접수일
         * 2019-01-24	wjim		[20190124_01] 조회조건 추가
         *                          - 계약접수일(from~to)
         ***************************************************************************************************/

        //include "lib::comLib.xjs";

        /**
         * 전역변수 선언
         */
        this.toDay = "";	// 서버기준 오늘날자

        /**
         * 폼의 모든 컴포넌트가 생성되고, 모든 오브젝트가 로딩되었을 때 이벤트 처리
         */
        this.RTSDVisitInstallList_onload = function(obj,e) {
        	Ex.core.init(obj);
        	this.parent.setButton("E|C|S", this);	// 상단 공통버튼 세팅 (조회,저장,엑셀)
        	this.fn_initYmd();						// 서버기준 오늘날자 조회 후 세팅
        	this.fn_getCommCode();					// 공통코드 조회
        }

        /**
         * 서버기준 오늘 날자 조회 후 세팅
         */
        this.fn_initYmd = function() {
        	var sSvcID      	= "getToday";  
        	var sController   	= "ntrms/re/getDayMongth.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }

        /**
         * 공통코드 조회
         */ 
        this.fn_getCommCode  = function() {
        	var sSvcID      	= "getCommCode";  
        	var sController   	= "rtms/sd/commCodeVisitInstall.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_S105=ds_S105 ds_S106=ds_S106";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 		
        }

        /**
         * 조회 버튼의 클릭 이벤트 처리
         */
        this.fn_search = function() {
        	// 기존 조회결과 초기화
        	this.ds_visitList.deleteAll();
        	
        	var sSvcID        	= "listVisitInstall";                    
        	var sController   	= "rtms/sd/listVisitInstall.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_visitList=ds_visitList";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("agencyCd" , this.vkazcCd.value                 );
        	sArgs += Ex.util.setParam("procDayF" , this.div_search.cal_visitFrom.value);
        	sArgs += Ex.util.setParam("procDayT" , this.div_search.cal_visitTo.value  );
        	sArgs += Ex.util.setParam("statCd"   , this.div_search.cmb_statCd.value   );
        	sArgs += Ex.util.setParam("statDtlCd", this.div_search.cmb_statDtlCd.value);
        	sArgs += Ex.util.setParam("custNm"   , this.div_search.ed_custNm.value    );	
        	sArgs += Ex.util.setParam("mobNo"    , this.div_search.ed_mobNo.value     );
        	sArgs += Ex.util.setParam("ordNo"    , this.div_search.ed_ordNo.value     );
        	sArgs += Ex.util.setParam("ordDayF"  , this.div_search.cal_ordFrom.value  );	//계약접수일(from) [20190124_01]
        	sArgs += Ex.util.setParam("ordDayT"  , this.div_search.cal_ordTo.value    );	//계약접수일(to)   [20190124_01]

        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 저장 버튼의 클릭 이벤트 처리
         */
        this.fn_save = function() {
        	if (confirm( "저장하시겠습니까?")) {
        		var cnt = 0;
        		var visitListCnt = this.ds_visitList.getRowCount();
        		for( var i = 0 ; i < visitListCnt ; i++ ){
        		var iRowType = this.ds_visitList.getRowType(i);		
        		if( iRowType == 2 || iRowType == 4 || iRowType == 8 ){ //2:Insert, 4:Update, 8:Delete
        			cnt++;
        			}
        		}
        		if(cnt != 0) {
        		var sSvcID        	= "saveVisitInstall";                    
        		var sController   	= "rtms/sd/saveVisitInstall.do";
        		var sInDatasets   	= "ds_visitList=ds_visitList:U";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";
        		var fn_callBack		= "fn_callBack";
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        		}else{
        			alert("변경된 데이터가 없습니다!");
        			return false; 
        		}
        	}	
        }

        /**
         * 엑셀 출력
         */
        this.fn_excel = function() {
        	Ex.core.exportExcel(this, this.grd_visitList);
        }

        /**
         * 대리점 선택 버튼 클릭 이벤트 처리
         * - 대리점 선택 팝업
         */
        this.showVkazc = function(obj,e) {
        	var args ={p_arg : "RTSDContractRegister", p_opYn : "Y"};
        	
        	Ex.core.popup(this,"대리점조회","comm::RTCOMMAgency_pop.xfdl",args, "modaless=false");
        }

        /**
         * 대리점 선택 팝업에서 대리점 선택 후 후속처리
         * - 선택된 대리점 정보 세팅
         */
        this.FN_returnAgency = function(arr) {
        	this.vkazcCd.set_value(arr[0]);	// 대리점 코드
        	this.vkazcNm.set_value(arr[1]);	// 대리점명
        }

        /**
         * 상태 조회조건 콤보에서 변경된 값이 적용된 후 이벤트 처리
         */
        this.div_search_cmb_statCd_onitemchanged = function(obj,e) {
        	if (e.postvalue == "") {
        		this.ds_S106_cond.filter("cd == ''");
        	} else {
        		this.ds_S106_cond.filter("cd == '' || cd.substr(0,2) == '" + e.postvalue + "'");
        	}
        	
        	this.div_search.cmb_statDtlCd.set_value("");
        }

        /**
         * 방문장착목록 데이터셋의 행의 위치가 변경되기 전 이벤트 처리
         */
        this.ds_visitList_canrowposchange = function(obj,e) {
        	// 상태만 수정하고 세부상태를 선택하지 않은 상태로 다른 행으로 이동하려 할 때 오류 처리
        	if (e.newrow != -1) {
        		if (!this.fn_chkStDtl(e.oldrow)) {
        			this.alert("세부상태값이 정상적으로 선택되지 않았습니다.");
        			return false;
        		}
        		
        		this.fn_filtStDtl("ROW_IDX", e.newrow);				// 상세상태 콤보 필터링
        	}	
        }

        /**
         * 상태와 세부상태의 매핑이 정상인지 확인
         */
        this.fn_chkStDtl = function (pRowIdx) {
        	var chkResult = true;
        		
        	var strVisitSt    = this.ds_visitList.getColumn(pRowIdx, "statCd");
        	var strVisitStDtl = this.ds_visitList.getColumn(pRowIdx, "statDtlCd");
        	
        	if (strVisitSt != strVisitStDtl.substr(0,2)) {
        		chkResult = false;
        	}
        	
        	return chkResult;
        }

        /**
         * 상태에 따른 상세상태 콤보 필터링
         */
        this.fn_filtStDtl = function (pMod,pArg) {
        	var strStCd;
        	
        	if (pMod == "VALUE") {
        		strStCd = pArg;
        	} else if (pMod == "ROW_IDX") {
        		strStCd = this.ds_visitList.getColumn(pArg, "statCd");
        	}
        	
         	this.ds_S106.filter("cd.substr(0,2) == '" + strStCd + "'");
        }

        /**
         * 방문장착목록 그리드의 Body 영역 셀 더블 클릭 이벤트 처리
         */
        this.grd_visitList_oncelldblclick = function(obj,e) {
        	if (this.ds_visitList.getRowCount() < 1) {
        		this.alert("이력조회할 대상이 존재하지 않습니다.");
        		return false;
        	}
        	
        	var strOrdNo = this.ds_visitList.getColumn(this.grd_visitList.currentrow, "ordNo");

        	// 이력조회 팝업
        	var arr ={
        		  p_ordNo : strOrdNo
        	};
        			
        	Ex.core.popup(this, "방문장착 이력조회", "sd::RTSDVisitInstallLog_pop.xfdl", arr, "modaless=false");
        }

        /**
         * 우편번호 찾기 버튼 클릭 이벤트 처리
         * - 우편번호 찾기 선택 팝업
         */
        this.btn_postSearch_onclick = function(obj,e) {
        	var args ={p_arg : "RTSDCustRegister_1"};
        	Ex.core.popup(this,"방문장착","comm::RTCOMMPostCode_pop.xfdl",args, "modaless=false");
        }

        /**
         * 우편번호 찾기 결과 처리
         */	 
        this.FN_postCd = function(res,division) {
        	if (division == "addr1") {
        		this.ed_posCd.set_value(res[0]);
        		this.ed_addr1.set_value(res[1]);
        		this.ed_addr2.set_value(res[2]);
        		this.ed_bldMngNo.set_value(res[3]);
        	}
        }

        /**
         * 상태 콤보에서 변경된 값이 적용된 후 이벤트 처리
         * - 세부상태 콤보 필터링
         */
        this.cmb_statCd_onitemchanged = function(obj,e) {
         	this.fn_filtStDtl("VALUE", e.postvalue);
        }

        /**
         * CallBack 처리
         */
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg) {
        	if (nErrorCode < 0)
        		return Ex.core.comMsg("alert",strErrorMsg);	
        	
        	switch (strSvcId) {
        		// 서버기준 오늘 날자 조회
        		case "getToday":
        			this.div_search.cal_visitFrom.set_value(this.toDay);
        			this.div_search.cal_visitTo.set_value(this.toDay);
        			break;
        		// 공통코드 조회	
        		case "getCommCode":
        			// 조회조건-상태 초기화
        			this.ds_S105_cond.copyData(this.ds_S105);			
        			var insert = this.ds_S105_cond.insertRow(0);
        			this.ds_S105_cond.setColumn(insert,"cd","");
        			this.ds_S105_cond.setColumn(insert,"cdNm","전체");
        			this.div_search.cmb_statCd.set_value("");
        			
        			// 조회조건-(세부)상태 초기화
        			this.ds_S106_cond.copyData(this.ds_S106);			
        			insert = this.ds_S106_cond.insertRow(0);
        			this.ds_S106_cond.setColumn(insert,"cd","");
        			this.ds_S106_cond.setColumn(insert,"cdNm","전체");
        			this.div_search.cmb_statDtlCd.set_value("");
        		    break;
        		// 방문점검목록 조회   
        		case "listVisitInstall":
        			var rowCt = this.ds_visitList.getRowCount();
        		
        			if( rowCt == 0 ){
        				this.alert("조회된 데이터가 없습니다.");
        				this.grd_visitList.set_nodatatext("조회된 데이터가 없습니다.");
        			} else {
        				this.fn_filtStDtl("ROW_IDX", 0);	// 조회 첫번째 결과 기준 세부상태 필터링
        			}
        			break;
        		// 저장
        		case "saveVisitInstall":
        			this.alert(strErrorMsg);
        			break;
        		// 기타
        		default:
        			break;
        	}
        }
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.ds_visitList.addEventHandler("canrowposchange", this.ds_visitList_canrowposchange, this);
            this.addEventHandler("onload", this.RTSDVisitInstallList_onload, this);
            this.div_search.cmb_statCd.addEventHandler("onitemchanged", this.div_search_cmb_statCd_onitemchanged, this);
            this.btn_save02.addEventHandler("onclick", this.showVkazc, this);
            this.grd_visitList.addEventHandler("oncelldblclick", this.grd_visitList_oncelldblclick, this);
            this.btn_postSearch.addEventHandler("onclick", this.btn_postSearch_onclick, this);
            this.cmb_statCd.addEventHandler("onitemchanged", this.cmb_statCd_onitemchanged, this);

        };

        this.loadIncludeScript("RTSDVisitInstallList.xfdl");

       
    };
}
)();
