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
                this.set_name("RTCOMMLumpSum_pop");
                this.set_classname("RTCOMMLumpSum_pop");
                this.set_titletext("일시불 멤버쉽 계약조회");
                this._setFormPosition(0,0,1145,580);
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

            obj = new Dataset("ds_orderCd", this);
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

            obj = new Dataset("ds_ordNoList3", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"ordDay\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"birthDay\" type=\"STRING\" size=\"256\"/><Column id=\"buslNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"genderCd\" type=\"STRING\" size=\"256\"/><Column id=\"genderNm\" type=\"STRING\" size=\"256\"/><Column id=\"lfCd\" type=\"STRING\" size=\"256\"/><Column id=\"lfNm\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"telNo2\" type=\"STRING\" size=\"256\"/><Column id=\"addr\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"makerCd\" type=\"STRING\" size=\"256\"/><Column id=\"modelCd\" type=\"STRING\" size=\"256\"/><Column id=\"contentsCd\" type=\"STRING\" size=\"256\"/><Column id=\"frCd\" type=\"STRING\" size=\"256\"/><Column id=\"carKind\" type=\"STRING\" size=\"256\"/><Column id=\"statCd\" type=\"STRING\" size=\"256\"/><Column id=\"statNm\" type=\"STRING\" size=\"256\"/><Column id=\"seasonCd\" type=\"STRING\" size=\"256\"/><Column id=\"seasonNm\" type=\"STRING\" size=\"256\"/><Column id=\"orderNm\" type=\"STRING\" size=\"256\"/><Column id=\"monAmt\" type=\"STRING\" size=\"256\"/><Column id=\"grpNo\" type=\"STRING\" size=\"256\"/><Column id=\"custTp\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
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
            obj._setContents("<ColumnInfo><Column id=\"ordDay\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"birthDay\" type=\"STRING\" size=\"256\"/><Column id=\"buslNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"genderCd\" type=\"STRING\" size=\"256\"/><Column id=\"genderNm\" type=\"STRING\" size=\"256\"/><Column id=\"lfCd\" type=\"STRING\" size=\"256\"/><Column id=\"lfNm\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"telNo2\" type=\"STRING\" size=\"256\"/><Column id=\"addr\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"makerCd\" type=\"STRING\" size=\"256\"/><Column id=\"modelCd\" type=\"STRING\" size=\"256\"/><Column id=\"contentsCd\" type=\"STRING\" size=\"256\"/><Column id=\"frCd\" type=\"STRING\" size=\"256\"/><Column id=\"carKind\" type=\"STRING\" size=\"256\"/><Column id=\"statCd\" type=\"STRING\" size=\"256\"/><Column id=\"statNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Grid("grid_ordNoList", "absolute", "10", "88", "1125", "199", null, null, this);
            obj.set_taborder("1");
            obj.set_binddataset("ds_ordNoList3");
            obj.set_cellsizingtype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"120\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"40\"/><Column size=\"60\"/><Column size=\"100\"/><Column size=\"0\"/><Column size=\"100\"/><Column size=\"0\"/><Column size=\"100\"/><Column size=\"0\"/><Column size=\"0\"/><Column size=\"89\"/><Column size=\"80\"/><Column size=\"120\"/><Column size=\"120\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"계약일자\"/><Cell col=\"1\" text=\"계약번호\"/><Cell col=\"2\" text=\"고객코드\"/><Cell col=\"3\" text=\"법정생년월일\"/><Cell col=\"4\" text=\"사업자번호\"/><Cell col=\"5\" text=\"고객명\"/><Cell col=\"6\" text=\"성별\"/><Cell col=\"7\" text=\"내외국인\"/><Cell col=\"8\" text=\"핸드폰\"/><Cell col=\"9\" text=\"핸드폰\"/><Cell col=\"10\" text=\"전화번호\"/><Cell col=\"11\" text=\"전화번호\"/><Cell col=\"12\" text=\"전화번호2\"/><Cell col=\"13\" text=\"전화번호2\"/><Cell col=\"14\" text=\"주소\"/><Cell col=\"15\" text=\"주소\"/><Cell col=\"16\" text=\"차량번호\"/><Cell col=\"17\" text=\"차종\"/><Cell col=\"18\" text=\"계약상태\"/></Band><Band id=\"body\"><Cell displaytype=\"date\" text=\"bind:ordDay\" calendardisplaynulltype=\"none\"/><Cell col=\"1\" displaytype=\"text\" edittype=\"readonly\" text=\"bind:ordNo\"/><Cell col=\"2\" text=\"bind:custNo\"/><Cell col=\"3\" displaytype=\"normal\" text=\"bind:birthDay\" mask=\"####-**-**\"/><Cell col=\"4\" displaytype=\"normal\" text=\"bind:buslNo\" mask=\"###-##-#####\"/><Cell col=\"5\" text=\"bind:custNm\"/><Cell col=\"6\" text=\"bind:genderNm\"/><Cell col=\"7\" text=\"bind:lfNm\"/><Cell col=\"8\" text=\"bind:mobNo\" expr=\"expr:FN_numberMaskReturn(mobNo)\"/><Cell col=\"9\" text=\"bind:mobNo\"/><Cell col=\"10\" text=\"bind:telNo\" expr=\"expr:FN_numberMaskReturn(telNo)\"/><Cell col=\"11\" text=\"bind:telNo\" expr=\"expr:FN_numberHyphenInReturn(telNo)\"/><Cell col=\"12\" text=\"bind:telNo2\" expr=\"expr:FN_numberMaskReturn(telNo2)\"/><Cell col=\"13\" text=\"bind:telNo2\" expr=\"expr:FN_numberHyphenInReturn(telNo2)\"/><Cell col=\"14\" text=\"bind:addr\"/><Cell col=\"15\" text=\"bind:addr\"/><Cell col=\"16\" text=\"bind:carNo\"/><Cell col=\"17\" text=\"bind:carKind\"/><Cell col=\"18\" text=\"bind:statNm\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Div("div_ordNoSearch", "absolute", "10", "10", "1125", "70", null, null, this);
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
            obj = new Static("st_A_mobNo", "absolute", "540", "37", "100", "21", null, null, this.div_ordNoSearch);
            obj.set_taborder("9");
            obj.set_text("핸드폰");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_ordNoSearch.addChild(obj.name, obj);
            obj = new MaskEdit("ed_A_mobNo", "absolute", "660", "37", "120", "21", null, null, this.div_ordNoSearch);
            obj.set_taborder("5");
            obj.set_type("string");
            obj.set_mask("###-####-####");
            this.div_ordNoSearch.addChild(obj.name, obj);
            obj = new Static("st_A_custNm", "absolute", "20", "38", "100", "21", null, null, this.div_ordNoSearch);
            obj.set_taborder("13");
            obj.set_text("고객명");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_ordNoSearch.addChild(obj.name, obj);
            obj = new Edit("ed_A_custNm", "absolute", "140", "38", "120", "21", null, null, this.div_ordNoSearch);
            obj.set_taborder("0");
            this.div_ordNoSearch.addChild(obj.name, obj);
            obj = new Div("div_ordNo01", "absolute", "263", "38", "277", "30", null, null, this.div_ordNoSearch);
            obj.set_taborder("4");
            obj.set_scrollbars("none");
            this.div_ordNoSearch.addChild(obj.name, obj);
            obj = new Static("st_A_birthDay", "absolute", "17", "0", "100", "21", null, null, this.div_ordNoSearch.div_ordNo01);
            obj.set_taborder("8");
            obj.set_text("법정생년월일");
            obj.set_cssclass("sta_WF_schTitle");
            obj.set_visible("true");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_ordNoSearch.div_ordNo01.addChild(obj.name, obj);
            obj = new MaskEdit("ed_A_birthDay", "absolute", "138", "0", "120", "21", null, null, this.div_ordNoSearch.div_ordNo01);
            obj.set_taborder("1");
            obj.set_type("string");
            obj.set_mask("####-##-##");
            this.div_ordNoSearch.div_ordNo01.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "-4", "0", "20", "47", null, null, this.div_ordNoSearch.div_ordNo01);
            obj.set_taborder("16");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_ordNoSearch.div_ordNo01.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "118", "0", "20", "26", null, null, this.div_ordNoSearch.div_ordNo01);
            obj.set_taborder("17");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_ordNoSearch.div_ordNo01.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "258", "0", "20", "26", null, null, this.div_ordNoSearch.div_ordNo01);
            obj.set_taborder("18");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_ordNoSearch.div_ordNo01.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "380", "0", "20", "26", null, null, this.div_ordNoSearch.div_ordNo01);
            obj.set_taborder("19");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_ordNoSearch.div_ordNo01.addChild(obj.name, obj);
            obj = new Static("Static05", "absolute", "520", "0", "20", "26", null, null, this.div_ordNoSearch.div_ordNo01);
            obj.set_taborder("20");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_ordNoSearch.div_ordNo01.addChild(obj.name, obj);
            obj = new Static("Static07", "absolute", "640", "0", "20", "26", null, null, this.div_ordNoSearch.div_ordNo01);
            obj.set_taborder("21");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_ordNoSearch.div_ordNo01.addChild(obj.name, obj);
            obj = new Static("Static08", "absolute", "780", "0", "20", "26", null, null, this.div_ordNoSearch.div_ordNo01);
            obj.set_taborder("22");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_ordNoSearch.div_ordNo01.addChild(obj.name, obj);
            obj = new Static("Static09", "absolute", "900", "0", "20", "26", null, null, this.div_ordNoSearch.div_ordNo01);
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
            obj = new Button("btn_search", "absolute", "1060", "36", "45", "22", null, null, this.div_ordNoSearch);
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
            obj = new Static("Static00", "absolute", "0", "60", null, "12", "0", null, this.div_ordNoSearch);
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
            obj = new Static("st_orderCd", "absolute", "280", "13", "100", "21", null, null, this.div_ordNoSearch);
            obj.set_taborder("15");
            obj.set_text("주문유형");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_ordNoSearch.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "380", "0", "20", "38", null, null, this.div_ordNoSearch);
            obj.set_taborder("16");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_ordNoSearch.addChild(obj.name, obj);
            obj = new Combo("cb_orderCd", "absolute", "400", "12", "120", "21", null, null, this.div_ordNoSearch);
            this.div_ordNoSearch.addChild(obj.name, obj);
            obj.set_taborder("17");
            obj.set_innerdataset("ds_orderCd");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_index("-1");
            obj = new Static("Static05", "absolute", "0", "25", "20", "38", null, null, this.div_ordNoSearch);
            obj.set_taborder("18");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_ordNoSearch.addChild(obj.name, obj);
            obj = new Static("Static08", "absolute", "521", "10", "600", "28", null, null, this.div_ordNoSearch);
            obj.set_taborder("19");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_ordNoSearch.addChild(obj.name, obj);
            obj = new Static("Static10", "absolute", "643", "32", "17", "31", null, null, this.div_ordNoSearch);
            obj.set_taborder("20");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_ordNoSearch.addChild(obj.name, obj);
            obj = new Static("Static11", "absolute", "120", "31", "20", "38", null, null, this.div_ordNoSearch);
            obj.set_taborder("21");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_ordNoSearch.addChild(obj.name, obj);
            obj = new Div("div_ordNo02", "absolute", "268", "36", "252", "26", null, null, this.div_ordNoSearch);
            obj.set_taborder("22");
            obj.set_scrollbars("none");
            obj.set_visible("false");
            this.div_ordNoSearch.addChild(obj.name, obj);
            obj = new Static("st_A_buslNo", "absolute", "12", "2", "100", "21", null, null, this.div_ordNoSearch.div_ordNo02);
            obj.set_taborder("144");
            obj.set_text("사업자번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_ordNoSearch.div_ordNo02.addChild(obj.name, obj);
            obj = new MaskEdit("ed_A_buslNo", "absolute", "132", "3", "120", "21", null, null, this.div_ordNoSearch.div_ordNo02);
            obj.set_taborder("145");
            obj.set_type("string");
            obj.set_mask("###-##-#####");
            this.div_ordNoSearch.div_ordNo02.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "380", "0", "20", "47", null, null, this.div_ordNoSearch.div_ordNo02);
            obj.set_taborder("146");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_ordNoSearch.div_ordNo02.addChild(obj.name, obj);
            obj = new Static("Static05", "absolute", "520", "0", "20", "47", null, null, this.div_ordNoSearch.div_ordNo02);
            obj.set_taborder("147");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_ordNoSearch.div_ordNo02.addChild(obj.name, obj);
            obj = new Static("Static07", "absolute", "640", "0", "20", "47", null, null, this.div_ordNoSearch.div_ordNo02);
            obj.set_taborder("148");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_ordNoSearch.div_ordNo02.addChild(obj.name, obj);
            obj = new Static("Static08", "absolute", "780", "0", "20", "47", null, null, this.div_ordNoSearch.div_ordNo02);
            obj.set_taborder("149");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_ordNoSearch.div_ordNo02.addChild(obj.name, obj);
            obj = new Static("Static09", "absolute", "900", "0", "20", "47", null, null, this.div_ordNoSearch.div_ordNo02);
            obj.set_taborder("150");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_ordNoSearch.div_ordNo02.addChild(obj.name, obj);

            obj = new Button("btn_choice", "absolute", "1049", "471", "41", "21", null, null, this);
            obj.set_taborder("2");
            obj.set_text("선택");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);

            obj = new Button("btn_close", "absolute", "1094", "471", "41", "21", null, null, this);
            obj.set_taborder("4");
            obj.set_text("닫기");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);

            obj = new Div("div_ordNoDetail", "absolute", "10", "296", null, "163", "10", null, this);
            obj.set_taborder("3");
            obj.set_scrollbars("none");
            obj.set_visible("true");
            this.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "0", "30", "1125", "31", null, null, this.div_ordNoDetail);
            obj.set_taborder("40");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_ordNoDetail.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "0", "90", "1125", "31", null, null, this.div_ordNoDetail);
            obj.set_taborder("41");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_ordNoDetail.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "0", "60", "1125", "31", null, null, this.div_ordNoDetail);
            obj.set_taborder("42");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_ordNoDetail.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "0", "120", "1125", "31", null, null, this.div_ordNoDetail);
            obj.set_taborder("44");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_ordNoDetail.addChild(obj.name, obj);
            obj = new Static("Static10", "absolute", "0", "0", "1125", "31", null, null, this.div_ordNoDetail);
            obj.set_taborder("39");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_ordNoDetail.addChild(obj.name, obj);
            obj = new MaskEdit("ed_birthDay", "absolute", "155", "35", "200", "21", null, null, this.div_ordNoDetail);
            obj.set_taborder("0");
            obj.set_type("string");
            obj.set_mask("####-##-##");
            obj.set_enable("false");
            this.div_ordNoDetail.addChild(obj.name, obj);
            obj = new Static("st_birthDay", "absolute", "0", "30", "150", "31", null, null, this.div_ordNoDetail);
            obj.set_taborder("1");
            obj.set_text("법정생년월일");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_ordNoDetail.addChild(obj.name, obj);
            obj = new Static("Static34", "absolute", "10", "433", "281", "31", null, null, this.div_ordNoDetail);
            obj.set_taborder("2");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_ordNoDetail.addChild(obj.name, obj);
            obj = new Edit("ed_custNo", "absolute", "876", "5", "240", "20", null, null, this.div_ordNoDetail);
            obj.set_taborder("9");
            obj.set_enable("false");
            this.div_ordNoDetail.addChild(obj.name, obj);
            obj = new Static("st_custNo", "absolute", "721", "0", "150", "31", null, null, this.div_ordNoDetail);
            obj.set_taborder("10");
            obj.set_text("고객코드");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_ordNoDetail.addChild(obj.name, obj);
            obj = new Edit("ed_genderNm", "absolute", "876", "35", "240", "20", null, null, this.div_ordNoDetail);
            obj.set_taborder("11");
            obj.set_enable("false");
            this.div_ordNoDetail.addChild(obj.name, obj);
            obj = new Static("st_genderNm", "absolute", "721", "30", "150", "31", null, null, this.div_ordNoDetail);
            obj.set_taborder("12");
            obj.set_text("성별");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_ordNoDetail.addChild(obj.name, obj);
            obj = new Edit("ed_lfNm", "absolute", "876", "65", "240", "20", null, null, this.div_ordNoDetail);
            obj.set_taborder("13");
            obj.set_enable("false");
            this.div_ordNoDetail.addChild(obj.name, obj);
            obj = new Static("st_lfNm", "absolute", "721", "60", "150", "31", null, null, this.div_ordNoDetail);
            obj.set_taborder("14");
            obj.set_text("내외국인");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_ordNoDetail.addChild(obj.name, obj);
            obj = new Edit("ed_telNo2", "absolute", "876", "95", "240", "20", null, null, this.div_ordNoDetail);
            obj.set_taborder("15");
            obj.set_enable("false");
            this.div_ordNoDetail.addChild(obj.name, obj);
            obj = new Static("st_telNo2", "absolute", "721", "90", "150", "31", null, null, this.div_ordNoDetail);
            obj.set_taborder("16");
            obj.set_text("전화번호2");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_ordNoDetail.addChild(obj.name, obj);
            obj = new Edit("ed_addr", "absolute", "516", "125", "600", "21", null, null, this.div_ordNoDetail);
            obj.set_taborder("17");
            obj.set_enable("false");
            this.div_ordNoDetail.addChild(obj.name, obj);
            obj = new Edit("ed_telNo", "absolute", "516", "95", "200", "20", null, null, this.div_ordNoDetail);
            obj.set_taborder("18");
            obj.set_enable("false");
            this.div_ordNoDetail.addChild(obj.name, obj);
            obj = new Static("st_telNo", "absolute", "360", "90", "150", "31", null, null, this.div_ordNoDetail);
            obj.set_taborder("19");
            obj.set_text("전화번호");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_ordNoDetail.addChild(obj.name, obj);
            obj = new Static("st_addr", "absolute", "360", "120", "150", "31", null, null, this.div_ordNoDetail);
            obj.set_taborder("20");
            obj.set_text("주소");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_ordNoDetail.addChild(obj.name, obj);
            obj = new Static("st_ordNo", "absolute", "360", "0", "150", "31", null, null, this.div_ordNoDetail);
            obj.set_taborder("21");
            obj.set_text("계약번호");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_ordNoDetail.addChild(obj.name, obj);
            obj = new Edit("ed_ordNo", "absolute", "516", "5", "200", "20", null, null, this.div_ordNoDetail);
            obj.set_taborder("22");
            obj.set_enable("true");
            obj.set_readonly("true");
            this.div_ordNoDetail.addChild(obj.name, obj);
            obj = new Edit("ed_custNm", "absolute", "516", "35", "200", "20", null, null, this.div_ordNoDetail);
            obj.set_taborder("23");
            obj.set_enable("false");
            this.div_ordNoDetail.addChild(obj.name, obj);
            obj = new Edit("ed_carKind", "absolute", "516", "65", "200", "20", null, null, this.div_ordNoDetail);
            obj.set_taborder("24");
            obj.set_enable("false");
            this.div_ordNoDetail.addChild(obj.name, obj);
            obj = new Static("st_carKind", "absolute", "360", "60", "150", "31", null, null, this.div_ordNoDetail);
            obj.set_taborder("25");
            obj.set_text("차종");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_ordNoDetail.addChild(obj.name, obj);
            obj = new Static("st_custNm", "absolute", "360", "30", "150", "31", null, null, this.div_ordNoDetail);
            obj.set_taborder("26");
            obj.set_text("고객명");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_ordNoDetail.addChild(obj.name, obj);
            obj = new Edit("ed_statNm", "absolute", "155", "125", "200", "21", null, null, this.div_ordNoDetail);
            obj.set_taborder("29");
            obj.set_enable("false");
            this.div_ordNoDetail.addChild(obj.name, obj);
            obj = new Edit("ed_mobNo", "absolute", "155", "95", "200", "21", null, null, this.div_ordNoDetail);
            obj.set_taborder("30");
            obj.set_enable("false");
            this.div_ordNoDetail.addChild(obj.name, obj);
            obj = new Edit("ed_carNo", "absolute", "155", "65", "200", "21", null, null, this.div_ordNoDetail);
            obj.set_taborder("31");
            obj.set_enable("false");
            this.div_ordNoDetail.addChild(obj.name, obj);
            obj = new Static("st_carNo", "absolute", "0", "60", "150", "31", null, null, this.div_ordNoDetail);
            obj.set_taborder("33");
            obj.set_text("차량번호");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_ordNoDetail.addChild(obj.name, obj);
            obj = new Static("st_mobNo", "absolute", "0", "90", "150", "31", null, null, this.div_ordNoDetail);
            obj.set_taborder("34");
            obj.set_text("핸드폰");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_ordNoDetail.addChild(obj.name, obj);
            obj = new Static("st_statNm", "absolute", "0", "120", "150", "31", null, null, this.div_ordNoDetail);
            obj.set_taborder("35");
            obj.set_text("계약상태");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_ordNoDetail.addChild(obj.name, obj);
            obj = new Calendar("cal__ordDay", "absolute", "155", "5", "200", "21", null, null, this.div_ordNoDetail);
            this.div_ordNoDetail.addChild(obj.name, obj);
            obj.set_taborder("37");
            obj.set_value("20150715");
            obj.set_readonly("true");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_cssclass("readonly");
            obj.set_enable("false");
            obj = new Static("st_ordDay", "absolute", "0", "0", "150", "31", null, null, this.div_ordNoDetail);
            obj.set_taborder("38");
            obj.set_text("계약일자");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_ordNoDetail.addChild(obj.name, obj);
            obj = new MaskEdit("ed_buslNo", "absolute", "155", "35", "200", "21", null, null, this.div_ordNoDetail);
            obj.set_taborder("32");
            obj.set_type("string");
            obj.set_mask("###-##-#####");
            obj.set_visible("false");
            obj.set_enable("false");
            this.div_ordNoDetail.addChild(obj.name, obj);
            obj = new Static("st_buslNo", "absolute", "0", "30", "150", "31", null, null, this.div_ordNoDetail);
            obj.set_taborder("45");
            obj.set_text("사업자번호");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.set_visible("false");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_ordNoDetail.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 277, 30, this.div_ordNoSearch.div_ordNo01,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("4");
            		p.set_scrollbars("none");

            	}
            );
            this.div_ordNoSearch.div_ordNo01.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 252, 26, this.div_ordNoSearch.div_ordNo02,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("22");
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
            obj = new Layout("default", "", 0, 163, this.div_ordNoDetail,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("3");
            		p.set_scrollbars("none");
            		p.set_visible("true");

            	}
            );
            this.div_ordNoDetail.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1145, 580, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCOMMLumpSum_pop");
            		p.set_titletext("일시불 멤버쉽 계약조회");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item4","div_ordNoDetail.ed_buslNo","value","ds_ordNoList3","buslNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item7","div_ordNoDetail.ed_carNo","value","ds_ordNoList3","carNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item6","div_ordNoDetail.ed_mobNo","value","ds_ordNoList3","mobNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item17","div_ordNoDetail.ed_statNm","value","ds_ordNoList3","statNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item8","div_ordNoDetail.ed_carKind","value","ds_ordNoList3","carKind");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item5","div_ordNoDetail.ed_custNm","value","ds_ordNoList3","custNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item1","div_ordNoDetail.ed_ordNo","value","ds_ordNoList3","ordNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item11","div_ordNoDetail.ed_telNo","value","ds_ordNoList3","telNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item13","div_ordNoDetail.ed_addr","value","ds_ordNoList3","addr");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item12","div_ordNoDetail.ed_telNo2","value","ds_ordNoList3","telNo2");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item9","div_ordNoDetail.ed_lfNm","value","ds_ordNoList3","lfNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item10","div_ordNoDetail.ed_genderNm","value","ds_ordNoList3","genderNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item2","div_ordNoDetail.ed_custNo","value","ds_ordNoList3","custNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item3","div_ordNoDetail.ed_birthDay","value","ds_ordNoList3","birthDay");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item0","div_ordNoDetail.cal__ordDay","value","ds_ordNoList3","ordDay");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCOMMLumpSum_pop.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCOMMLumpSum_pop.xfdl", function() {
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //include "lib::comLib.xjs";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        ///callBack///
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg,resultCnt,checkAuthGrpuCd){
        	if( strSvcId == "initRTCOMMOrderNo" ){
        	
        		var rowCtCustTp = this.ds_custTpCd.rowcount;
        		if( rowCtCustTp != 0 ){
        			this.div_ordNoSearch.ra_A_custTp.set_value( this.ds_custTpCd.getColumn(0,"cd") );
        		}
        		
        		var rowcOrderCd = this.ds_orderCd.rowcount;
        		if( rowcOrderCd != 0 ){
        			
        			var insert = this.ds_orderCd.insertRow( 0 );
        			this.ds_orderCd.setColumn(insert,"cd"," ");
        			this.ds_orderCd.setColumn(insert,"cdNm","전체");
        			if(this.parent.p_arg=="RTSDDirectOrder"){
        				this.div_ordNoSearch.cb_orderCd.set_value("03");
        				this.div_ordNoSearch.cb_orderCd.set_enable(false);
        			}
        			else{
        			this.div_ordNoSearch.cb_orderCd.set_value( " " );
        			}
        				
        			
        			this.ds_orderCd.filter("cd != '02'");
        			
        		}
        	}
        	
        	if( strSvcId == "ordNoList3" ){
        		var ct = this.ds_ordNoList3.rowcount;
        		if( ct == 0 ){
        			alert("조회된 데이터가 없습니다.");
        			this.grid_ordNoList.set_nodatatext( "조회된 데이터가 없습니다." );
        		}
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.RTCOMMLumpSum_pop_onload = function(obj,e)
        {	
        	Ex.core.init(obj);	
        	this.fn_init();	
        }

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        ///콤보박스 데이터셋///
        this.fn_init = function(){
        	var sSvcID      	= "initRTCOMMOrderNo";  
        	var sController   	= "rtms/comm/initRTCOMMOrderNo.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	sOutDatasets += " ds_custTpCd=mapDsCustTpCd ";
        	sOutDatasets += " ds_orderCd=mapDsOrderCd ";
        	
        	
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        /*|||고객유형 radio_button_event|||*/
        this.div_ordNoSearch_ra_A_custTp_onitemchanged = function(obj,e){
        	var custTpVal = nvl(this.div_ordNoSearch.ra_A_custTp.value);
        	this.ds_ordNoList3.clearData();
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
        /*|||검색|||*/
        this.div_ordNoSearch_btn_search_onclick = function(obj,e){
        	var custTpVal = nvl(this.div_ordNoSearch.ra_A_custTp.value);
        	if( custTpVal == "01" ){
        		var sArgs 			= "";
        		var custTp		= nvl(this.div_ordNoSearch.ra_A_custTp.value);
        		var orderCd 		= nvl(this.div_ordNoSearch.cb_orderCd.value);
        		
        		var custNm 		= nvl(this.div_ordNoSearch.ed_A_custNm.value);
        		var birthDay 	= nvl(this.div_ordNoSearch.div_ordNo01.ed_A_birthDay.value);
        		var mobNo 		= nvl(this.div_ordNoSearch.ed_A_mobNo.value);
        				
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
        		if( custNm == "" && birthDay == ""  && mobNo == "" ){
        			alert("고객명, 법정생년월일, 핸드폰 중 하나이상 검색조건 값이 있어야합니다.");
        			return false;
        		}
        		sArgs += Ex.util.setParam("custTp", custTp);
        		sArgs += Ex.util.setParam("orderCd", orderCd);
        		sArgs += Ex.util.setParam("birthDay", birthDay);
        		sArgs += Ex.util.setParam("mobNo", mobNo);
        		sArgs += Ex.util.setParam("custNm", custNm);
        		
        		this.FN_search(sArgs);
        	}else if( custTpVal == "02" ){
        		var sArgs 			= "";
        		var custTp		= nvl(this.div_ordNoSearch.ra_A_custTp.value);
        		var orderCd 	= nvl(this.div_ordNoSearch.cb_orderCd.value);
        		var custNm 		= nvl(this.div_ordNoSearch.ed_A_custNm.value);
        		var buslNo 		= nvl(this.div_ordNoSearch.div_ordNo02.ed_A_buslNo.value);
        		var mobNo 		= nvl(this.div_ordNoSearch.ed_A_mobNo.value);
        		
        		
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
        		if( custNm == "" && buslNo == "" && mobNo == "" ){
        			alert("법인명, 사업자번호, 핸드폰 중 하나이상 검색조건 값이 있어야합니다.");
        			return false;
        		}
        		
        		sArgs += Ex.util.setParam("custTp",custTp);
        		sArgs += Ex.util.setParam("orderCd",orderCd);
        		sArgs += Ex.util.setParam("buslNo",buslNo);
        		sArgs += Ex.util.setParam("custNm",custNm);
        		sArgs += Ex.util.setParam("mobNo",mobNo);
        		
        		this.FN_search(sArgs);
        	}else{
        		return false;
        	}
        }
        /*|||검색|||*/
        this.FN_search = function(sArgs){
        	var sSvcID        	= "ordNoList3";                 
        	var sController   	= "rtms/comm/ordNoList3.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_ordNoList3=ordNoMap3";
        	var sArgs 			= sArgs;	
        	var fn_callBack		= "fn_callBack";
        	this.ds_ordNoList3.deleteAll();
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        /////on_key_up////////////////////////////////////////////////////////////////////
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_ordNoSearch_ed_A_custNm_onkeyup = function(obj,e){
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
        this.div_ordNoSearch_ed_A_mobNo_onkeyup = function(obj,e){
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
        this.RTCOMMLumpSum_pop_onkeyup = function(obj,e){
        	if(e.keycode == 27){
        		this.close();
        	}
        }
        ///선택버튼///
        this.btn_choice_onclick = function(obj,e){
        	this.FN_choice();
        }

        this.grid_ordNoList_oncelldblclick = function(obj,e)
        {
        	this.FN_choice();
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.FN_choice = function(){
        	var pos = this.ds_ordNoList3.rowposition;
        	if( pos == -1 ){
        		alert("선택된 행이 없습니다.");
        	}else{	
        		if(this.parent.p_arg == "popupTestForm") {
        			var ordNo 	 = this.ds_ordNoList3.getColumn(pos, "ordNo");
        			var birthDay = this.ds_ordNoList3.getColumn(pos, "birthDay");
        			var telNo  	 = this.ds_ordNoList3.getColumn(pos, "telNo");
        			this.close(this.opener.returnOrderNoInfo(ordNo, birthDay, telNo));		
        		}else if (this.parent.p_arg=="RTSDDirectOrder" || this.parent.p_arg=="RTSDMemberOrder"){
        		
        			var ordNo 	 = this.ds_ordNoList3.getColumn(pos, "ordNo");
        			this.close(this.opener.returnOrderNoInfo(ordNo));		
        			
        		}else{
        			this.ds_ordNoListCp.clearData();
        			var idx = this.ds_ordNoListCp.addRow();
        			this.ds_ordNoListCp.copyRow(idx, this.ds_ordNoList3, pos);
        			var arr = [this.ds_ordNoListCp];
        			this.close(this.opener.returnOrderNoInfo(arr));
        		}
        	}
        }
        ///취소버튼///
        this.btn_close_onclick = function(obj,e){
        	this.close();
        }
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onkeyup", this.RTCOMMLumpSum_pop_onkeyup, this);
            this.addEventHandler("onload", this.RTCOMMLumpSum_pop_onload, this);
            this.grid_ordNoList.addEventHandler("oncelldblclick", this.grid_ordNoList_oncelldblclick, this);
            this.div_ordNoSearch.ra_A_custTp.addEventHandler("onitemchanged", this.div_ordNoSearch_ra_A_custTp_onitemchanged, this);
            this.div_ordNoSearch.ed_A_mobNo.addEventHandler("onkeyup", this.div_ordNoSearch_ed_A_mobNo_onkeyup, this);
            this.div_ordNoSearch.ed_A_custNm.addEventHandler("onkeyup", this.div_ordNoSearch_ed_A_custNm_onkeyup, this);
            this.div_ordNoSearch.div_ordNo01.ed_A_birthDay.addEventHandler("onkeyup", this.div_ordNoSearch_div_ordNo01_ed_A_birthDay_onkeyup, this);
            this.div_ordNoSearch.div_ordNo01.ed_A_birthDay.addEventHandler("onsetfocus", this.div_ordNoSearch_div_ordNo01_ed_A_birthDay_onsetfocus, this);
            this.div_ordNoSearch.div_ordNo01.Static01.addEventHandler("onclick", this.div_ordNoSearch_div_ordNo01_Static01_onclick, this);
            this.div_ordNoSearch.btn_search.addEventHandler("onclick", this.div_ordNoSearch_btn_search_onclick, this);
            this.div_ordNoSearch.cb_orderCd.addEventHandler("oncloseup", this.div_ordNoSearch_cb_orderCd_oncloseup, this);
            this.div_ordNoSearch.div_ordNo02.ed_A_buslNo.addEventHandler("onsetfocus", this.div_ordNoSearch_div_ordNo02_ed_A_buslNo_onsetfocus, this);
            this.div_ordNoSearch.div_ordNo02.ed_A_buslNo.addEventHandler("onkeyup", this.div_ordNoSearch_div_ordNo02_ed_A_buslNo_onkeyup, this);
            this.btn_choice.addEventHandler("onclick", this.btn_choice_onclick, this);
            this.btn_close.addEventHandler("onclick", this.btn_close_onclick, this);
            this.div_ordNoDetail.ed_custNo.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.div_ordNoDetail.ed_genderNm.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.div_ordNoDetail.ed_lfNm.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.div_ordNoDetail.ed_telNo2.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.div_ordNoDetail.ed_addr.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.div_ordNoDetail.ed_telNo.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.div_ordNoDetail.ed_ordNo.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.div_ordNoDetail.ed_custNm.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.div_ordNoDetail.ed_carKind.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.div_ordNoDetail.ed_statNm.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.div_ordNoDetail.ed_mobNo.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.div_ordNoDetail.ed_carNo.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);

        };

        this.loadIncludeScript("RTCOMMLumpSum_pop.xfdl");

       
    };
}
)();
