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
                this.set_name("RTCSSafeServiceApply");
                this.set_classname("RTCSEngineOilRepService");
                this.set_titletext("마모파손 서비스 부여");
                this._setFormPosition(0,0,1147,602);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_list", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"servCd\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"periodCd\" type=\"STRING\" size=\"256\"/><Column id=\"makerCd\" type=\"STRING\" size=\"256\"/><Column id=\"makerNm\" type=\"STRING\" size=\"256\"/><Column id=\"modelCd\" type=\"STRING\" size=\"256\"/><Column id=\"modelNm\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"carOwner\" type=\"STRING\" size=\"256\"/><Column id=\"b00007UseCnt\" type=\"STRING\" size=\"256\"/><Column id=\"b00011UseCnt\" type=\"STRING\" size=\"256\"/><Column id=\"b00012UseCnt\" type=\"STRING\" size=\"256\"/><Column id=\"ordDay\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"dlvrYn\" type=\"STRING\" size=\"256\"/><Column id=\"dlvrDay\" type=\"STRING\" size=\"256\"/><Column id=\"dlvrSeq\" type=\"STRING\" size=\"256\"/><Column id=\"agencyCd\" type=\"STRING\" size=\"256\"/><Column id=\"agencyNm\" type=\"STRING\" size=\"256\"/><Column id=\"servrqDay\" type=\"STRING\" size=\"256\"/><Column id=\"dlvposCd\" type=\"STRING\" size=\"256\"/><Column id=\"dlvAddr1\" type=\"STRING\" size=\"256\"/><Column id=\"dlvTel\" type=\"STRING\" size=\"256\"/><Column id=\"dlvDesc\" type=\"STRING\" size=\"256\"/><Column id=\"dlvStat\" type=\"STRING\" size=\"256\"/><Column id=\"dlvstatNm\" type=\"STRING\" size=\"256\"/><Column id=\"apprAmt\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd1\" type=\"STRING\" size=\"256\"/><Column id=\"cntNm\" type=\"STRING\" size=\"256\"/><Column id=\"reqNo\" type=\"STRING\" size=\"256\"/><Column id=\"b00007InitCnt\" type=\"STRING\" size=\"256\"/><Column id=\"cMileage\" type=\"STRING\" size=\"256\"/><Column id=\"dlvrType\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_save", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"dlvrDay\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"dlvrType\" type=\"STRING\" size=\"256\"/><Column id=\"dlvrSeq\" type=\"STRING\" size=\"256\"/><Column id=\"servSeq\" type=\"STRING\" size=\"256\"/><Column id=\"servCd\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"agencyCd\" type=\"STRING\" size=\"256\"/><Column id=\"matnr\" type=\"STRING\" size=\"256\"/><Column id=\"kwmeng\" type=\"STRING\" size=\"256\"/><Column id=\"reqDay\" type=\"STRING\" size=\"256\"/><Column id=\"dlvStat\" type=\"STRING\" size=\"256\"/><Column id=\"dlvDesc\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"dlvTel\" type=\"STRING\" size=\"256\"/><Column id=\"cMileage\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_imgList", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"num\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"dlvrType\" type=\"STRING\" size=\"256\"/><Column id=\"servCd\" type=\"STRING\" size=\"256\"/><Column id=\"servSeq\" type=\"STRING\" size=\"256\"/><Column id=\"seq\" type=\"STRING\" size=\"256\"/><Column id=\"filePath\" type=\"STRING\" size=\"256\"/><Column id=\"fileName\" type=\"STRING\" size=\"256\"/><Column id=\"confYn\" type=\"STRING\" size=\"256\"/><Column id=\"picSet\" type=\"STRING\" size=\"256\"/><Column id=\"picSetNm\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_S305", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_C034", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cd\">01</Col><Col id=\"cdNm\">요청접수</Col></Row><Row><Col id=\"cd\">04</Col><Col id=\"cdNm\">확정</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_S030", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_S044", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Div("div_detail", "absolute", "0", "306", "1134", "187", null, null, this);
            obj.set_taborder("13");
            obj.set_scrollbars("none");
            this.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "0", "30", "561", "118", null, null, this.div_detail);
            obj.set_taborder("139");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("Static34", "absolute", "560", "60", "562", "31", null, null, this.div_detail);
            obj.set_taborder("131");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("Static26", "absolute", "560", "30", "562", "31", null, null, this.div_detail);
            obj.set_taborder("132");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("Static24", "absolute", "0", "0", "561", "31", null, null, this.div_detail);
            obj.set_taborder("142");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("Static25", "absolute", "560", "0", "562", "31", null, null, this.div_detail);
            obj.set_taborder("143");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("Static20", "absolute", "12", "5", "200", "21", null, null, this.div_detail);
            obj.set_taborder("144");
            obj.set_text("첨부파일");
            obj.set_cssclass("Guide_title");
            obj.style.set_font("bold 10 dotum");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("Static23", "absolute", "572", "5", "200", "21", null, null, this.div_detail);
            obj.set_taborder("145");
            obj.set_text("신청정보");
            obj.set_cssclass("Guide_title");
            obj.style.set_font("bold 10 dotum");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("Static13", "absolute", "560", "90", "562", "61", null, null, this.div_detail);
            obj.set_taborder("152");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("st_dlvDesc", "absolute", "560", "89", "130", "62", null, null, this.div_detail);
            obj.set_taborder("153");
            obj.set_text("요청사항");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_detail.addChild(obj.name, obj);
            obj = new TextArea("ed_dlvDesc", "absolute", "694", "94", "424", "49", null, null, this.div_detail);
            obj.set_taborder("154");
            obj.set_wordwrap("char");
            obj.set_maxlength("300");
            obj.set_enable("true");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("st_servType", "absolute", "560", "30", "130", "31", null, null, this.div_detail);
            obj.set_taborder("161");
            obj.set_text("서비스유형");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.div_detail.addChild(obj.name, obj);
            obj = new Button("btn_url", "absolute", "86.33%", "6", null, "20", "8.02%", null, this.div_detail);
            obj.set_taborder("170");
            obj.set_text("URL발송");
            obj.set_cssclass("btn_WF_CRUD");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("st_dlvTel00", "absolute", "840", "60", "130", "31", null, null, this.div_detail);
            obj.set_taborder("177");
            obj.set_text("연락처");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.div_detail.addChild(obj.name, obj);
            obj = new Edit("ed_dlvTel", "absolute", "974", "65", "143", "21", null, null, this.div_detail);
            obj.set_taborder("178");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "560", "147", "562", "31", null, null, this.div_detail);
            obj.set_taborder("186");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("st_sms", "absolute", "560", "147", "130", "31", null, null, this.div_detail);
            obj.set_taborder("187");
            obj.set_text("SMS");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "0", "147", "561", "31", null, null, this.div_detail);
            obj.set_taborder("190");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("st_mileage", "absolute", "0", "147", "130", "31", null, null, this.div_detail);
            obj.set_taborder("191");
            obj.set_text("주행거리");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.div_detail.addChild(obj.name, obj);
            obj = new Edit("ed_mileage", "absolute", "134", "152", "142", "21", null, null, this.div_detail);
            obj.set_taborder("192");
            obj.set_enable("true");
            obj.set_displaynulltext("0");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("st_makerNm01", "absolute", "280", "147", "130", "31", null, null, this.div_detail);
            obj.set_taborder("194");
            obj.set_text("신청회차");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_detail.addChild(obj.name, obj);
            obj = new Edit("ed_reqNo", "absolute", "414", "152", "142", "21", null, null, this.div_detail);
            obj.set_taborder("195");
            obj.set_enable("false");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("st_confirm02", "absolute", "0", "30", "130", "118", null, null, this.div_detail);
            obj.set_taborder("196");
            obj.set_text("첨부이미지");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.div_detail.addChild(obj.name, obj);
            obj = new Combo("cb_stat", "absolute", "974", "35", "142", "21", null, null, this.div_detail);
            this.div_detail.addChild(obj.name, obj);
            obj.set_taborder("197");
            obj.set_innerdataset("@ds_C034");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj.set_enable("true");
            obj = new Static("st_dlvTel01", "absolute", "840", "30", "130", "31", null, null, this.div_detail);
            obj.set_taborder("198");
            obj.set_text("상태");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("st_dlvCnt", "absolute", "560", "60", "130", "31", null, null, this.div_detail);
            obj.set_taborder("199");
            obj.set_text("신청본수");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_detail.addChild(obj.name, obj);
            obj = new Edit("ed_dlvCnt", "absolute", "694", "65", "143", "21", null, null, this.div_detail);
            obj.set_taborder("200");
            obj.set_enable("false");
            this.div_detail.addChild(obj.name, obj);
            obj = new Edit("ed_SmsText", "absolute", "694", "152", "424", "21", null, null, this.div_detail);
            obj.set_taborder("201");
            obj.set_enable("false");
            this.div_detail.addChild(obj.name, obj);
            obj = new Combo("cb_servType", "absolute", "694", "35", "142", "21", null, null, this.div_detail);
            this.div_detail.addChild(obj.name, obj);
            obj.set_taborder("169");
            obj.set_displayrowcount("5");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_innerdataset("@ds_S044");

            obj = new Div("div_search", "absolute", "0", "0", "1122", "113", null, null, this);
            obj.set_taborder("0");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("Static22", "absolute", "1", "0", "1117", "12", null, null, this.div_search);
            obj.set_taborder("1");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "0", "0", "20", "111", null, null, this.div_search);
            obj.set_taborder("10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static23", "absolute", "1", "33", "1117", "12", null, null, this.div_search);
            obj.set_taborder("12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "0", "66", "1118", "12", null, null, this.div_search);
            obj.set_taborder("13");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "368", "0", "30", "111", null, null, this.div_search);
            obj.set_taborder("14");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition00", "absolute", "20", "77", "64", "20", null, null, this.div_search);
            obj.set_taborder("16");
            obj.set_text("계약번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_ordNo", "absolute", "104", "77", "140", "21", null, null, this.div_search);
            obj.set_taborder("6");
            obj.set_inputfilter("space");
            obj.set_lengthunit("ascii");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_custPopUp00", "absolute", "224", "76", "20", "21", null, null, this.div_search);
            obj.set_taborder("7");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition03", "absolute", "636", "13", "64", "20", null, null, this.div_search);
            obj.set_taborder("18");
            obj.set_text("차량번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_carNo", "absolute", "718", "13", "140", "21", null, null, this.div_search);
            obj.set_taborder("8");
            obj.set_inputfilter("space");
            obj.set_lengthunit("ascii");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "605", "0", "30", "110", null, null, this.div_search);
            obj.set_taborder("19");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition05", "absolute", "635", "45", "80", "20", null, null, this.div_search);
            obj.set_taborder("21");
            obj.set_text("휴대폰번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_mobNo", "absolute", "719", "45", "140", "21", null, null, this.div_search);
            obj.set_taborder("9");
            obj.set_inputfilter("space");
            obj.set_lengthunit("ascii");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition04", "absolute", "21", "12", "80", "20", null, null, this.div_search);
            obj.set_taborder("23");
            obj.set_text("신청일자");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_DlvrDayF", "absolute", "9.39%", "12", null, "20", "80.14%", null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("24");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_value("null");
            obj = new Static("Static03", "absolute", "859", "8", "30", "102", null, null, this.div_search);
            obj.set_taborder("25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition06", "absolute", "890", "14", "80", "20", null, null, this.div_search);
            obj.set_taborder("26");
            obj.set_text("상태");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            obj.set_visible("true");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_ServType", "absolute", "976", "13", "136", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("27");
            obj.set_displayrowcount("5");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_innerdataset("@ds_C034");
            obj.set_enable("true");
            obj.set_visible("true");
            obj.set_index("-1");
            obj = new Static("st_searchCondition07", "absolute", "890", "46", "80", "20", null, null, this.div_search);
            obj.set_taborder("30");
            obj.set_text("채널");
            obj.set_cssclass("sta_WF_schTitle");
            obj.set_visible("false");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_ChanCd", "absolute", "976", "45", "136", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("31");
            obj.set_innerdataset("@ds_S030");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj.set_visible("false");
            obj = new Static("st_searchCondition01", "absolute", "398", "12", "64", "20", null, null, this.div_search);
            obj.set_taborder("32");
            obj.set_text("고객번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_custNo", "absolute", "464", "12", "140", "21", null, null, this.div_search);
            obj.set_taborder("33");
            obj.set_inputfilter("space");
            obj.set_lengthunit("ascii");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition02", "absolute", "396", "45", "64", "20", null, null, this.div_search);
            obj.set_taborder("34");
            obj.set_text("고객명");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_custNm", "absolute", "464", "45", "140", "21", null, null, this.div_search);
            obj.set_taborder("35");
            obj.set_inputfilter("space");
            obj.set_lengthunit("ascii");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_DlvrDayT", "absolute", "22.45%", "12", null, "20", "67.08%", null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("36");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Static("Static04", "absolute", "8", "98", "1118", "12", null, null, this.div_search);
            obj.set_taborder("37");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition08", "absolute", "21", "45", "80", "20", null, null, this.div_search);
            obj.set_taborder("38");
            obj.set_text("장착일자");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_ProcDayF", "absolute", "9.39%", "45", null, "20", "80.14%", null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("39");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Calendar("cal_ProcDayT", "absolute", "22.45%", "45", null, "20", "67.08%", null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("40");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Static("Static05", "absolute", "20.84%", "14", null, "20", "78%", null, this.div_search);
            obj.set_taborder("41");
            obj.set_text("~");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static07", "absolute", "20.84%", "46", null, "20", "78%", null, this.div_search);
            obj.set_taborder("42");
            obj.set_text("~");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition09", "absolute", "396", "77", "64", "20", null, null, this.div_search);
            obj.set_taborder("43");
            obj.set_text("가입률");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_joinRate", "absolute", "464", "77", "114", "21", null, null, this.div_search);
            obj.set_taborder("44");
            obj.set_inputfilter("space");
            obj.set_lengthunit("ascii");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_join", "absolute", "56.8%", "78", null, "20", "37.57%", null, this.div_search);
            obj.set_taborder("45");
            obj.set_text("조회");
            obj.set_cssclass("btn_WF_CRUD");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition10", "absolute", "588", "79", "22", "20", null, null, this.div_search);
            obj.set_taborder("46");
            obj.set_text("%");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1122", "0", "25", "539", null, null, this);
            obj.set_taborder("1");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "0", "116", "81", "20", null, null, this);
            obj.set_taborder("2");
            obj.set_text("검색결과");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "113", "1147", "10", null, null, this);
            obj.set_taborder("3");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0", "135", "1147", "10", null, null, this);
            obj.set_taborder("4");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "253", "1147", "10", null, null, this);
            obj.set_taborder("5");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "0", "284", "81", "20", null, null, this);
            obj.set_taborder("6");
            obj.set_text("서비스 신청 내용");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Grid("gr_list", "absolute", "0", "136", "1122", "144", null, null, this);
            obj.set_taborder("7");
            obj.set_binddataset("ds_list");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"100\"/><Column size=\"94\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"73\"/><Column size=\"140\"/><Column size=\"60\"/><Column size=\"60\"/><Column size=\"87\"/><Column size=\"90\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"계약번호\"/><Cell col=\"1\" text=\"서비스명\"/><Cell col=\"2\" text=\"고객번호\"/><Cell col=\"3\" text=\"고객명\"/><Cell col=\"4\" text=\"연락처\"/><Cell col=\"5\" text=\"상품코드\"/><Cell col=\"6\" text=\"상품명\"/><Cell col=\"7\" text=\"계약본수\"/><Cell col=\"8\" text=\"계약기간\"/><Cell col=\"9\" text=\"계약일자\"/><Cell col=\"10\" text=\"장착일자\"/><Cell col=\"11\" text=\"차종\"/><Cell col=\"12\" text=\"차량번호\"/><Cell col=\"13\" text=\"상태\"/><Cell col=\"14\" text=\"파손사용횟수\"/><Cell col=\"15\" text=\"조기마모사용횟수\"/><Cell col=\"16\" text=\"걱정제로최초횟수\"/><Cell col=\"17\" text=\"걱정제로사용횟수\"/></Band><Band id=\"body\"><Cell displaytype=\"text\" edittype=\"readonly\" text=\"bind:ordNo\" tooltiptext=\"bind:ordNo\"/><Cell col=\"1\" displaytype=\"combo\" edittype=\"none\" text=\"bind:servCd\" combodataset=\"ds_S044\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"2\" text=\"bind:custNo\" tooltiptext=\"bind:custNo\"/><Cell col=\"3\" edittype=\"normal\" text=\"bind:custNm\" tooltiptext=\"bind:custNm\"/><Cell col=\"4\" text=\"bind:dlvTel\"/><Cell col=\"5\" edittype=\"normal\" text=\"bind:matCd\"/><Cell col=\"6\" text=\"bind:matNm\" tooltiptext=\"bind:matNm\"/><Cell col=\"7\" text=\"bind:cntCd\" tooltiptext=\"bind:cntCd\"/><Cell col=\"8\" text=\"bind:periodCd\" tooltiptext=\"bind:periodCd\"/><Cell col=\"9\" displaytype=\"date\" text=\"bind:ordDay\"/><Cell col=\"10\" displaytype=\"date\" text=\"bind:procDay\"/><Cell col=\"11\" text=\"bind:modelNm\" tooltiptext=\"bind:modelNm\"/><Cell col=\"12\" text=\"bind:carNo\" tooltiptext=\"bind:carNo\"/><Cell col=\"13\" text=\"bind:dlvstatNm\" tooltiptext=\"bind:dlvstatNm\"/><Cell col=\"14\" text=\"bind:b00012UseCnt\"/><Cell col=\"15\" text=\"bind:b00011UseCnt\"/><Cell col=\"16\" text=\"bind:b00007InitCnt\"/><Cell col=\"17\" text=\"bind:b00007UseCnt\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Grid("gr_imgList", "absolute", "133", "338", "423", "113", null, null, this);
            obj.set_taborder("14");
            obj.set_binddataset("ds_imgList");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"40\"/><Column size=\"122\"/><Column size=\"37\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell/><Cell col=\"1\" text=\"위치\"/><Cell col=\"2\" text=\"확인\"/></Band><Band id=\"body\"><Cell text=\"bind:num\"/><Cell col=\"1\" displaytype=\"combo\" edittype=\"none\" text=\"bind:picSet\" combodataset=\"ds_S305\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"2\" displaytype=\"checkbox\" edittype=\"none\" text=\"bind:confYn\" combodataset=\"ds_S044\" combocodecol=\"cd\" combodatacol=\"cdNm\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new FileDownload("FileDownload", "absolute", "880", "313", "93", "21", null, null, this);
            obj.set_taborder("15");
            obj.getSetter("retry").set("0");
            obj.set_text("파일다운로드");
            obj.set_visible("false");
            obj.set_enableevent("false");
            this.addChild(obj.name, obj);

            obj = new Button("btn_img", "absolute", "91.72%", "311", null, "20", "2.62%", null, this);
            obj.set_taborder("16");
            obj.set_text("다운로드");
            obj.set_cssclass("btn_WF_CRUD");
            this.addChild(obj.name, obj);

            obj = new Button("btn_imgPop", "absolute", "42.55%", "311", null, "20", "51.44%", null, this);
            obj.set_taborder("17");
            obj.set_text("이미지뷰어");
            obj.set_cssclass("btn_WF_CRUD");
            this.addChild(obj.name, obj);

            obj = new Button("btn_resetJoin", "absolute", "85.35%", "284", null, "20", "2.62%", null, this);
            obj.set_taborder("18");
            obj.set_text("가입초기화");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1134, 187, this.div_detail,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("13");
            		p.set_scrollbars("none");

            	}
            );
            this.div_detail.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1122, 113, this.div_search,
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
            obj = new Layout("default", "", 1147, 602, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCSEngineOilRepService");
            		p.set_titletext("마모파손 서비스 부여");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item0","div_detail.cb_stat","value","ds_list","dlvStat");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item5","div_detail.cb_cnt","value","ds_list","cntNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item16","div_detail.ed_dlvDesc","value","ds_list","dlvDesc");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item7","div_detail.cb_servType","value","ds_list","servCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item9","div_detail.ed_dlvTel","value","ds_list","dlvTel");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item11","div_search.cb_dlvStat","value","ds_list","cntCd1");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item3","div_detail.ed_mileage","value","ds_list","cMileage");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item10","div_detail.ed_reqNo","value","ds_list","reqNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item1","div_detail.ed_dlvCnt","value","ds_list","cntCd1");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCSSafeServiceApply.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCSSafeServiceApply.xfdl", function() {
        /***************************************************************************************************
         * 파 일 명 : RTCSSafeServiceApply.xfdl
         * 설    명 : 마모보증서비스 부여 신청
         * 작 성 자 : 
         * 변경이력 :
         * 변경일자		변경자		변경내용
         * ----------	------		--------
         * ...			...			..
         * 2020-10-15	kstka		[20201015_01] 초기개발
         ***************************************************************************************************/

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //include "lib::comLib.xjs";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.userGrp 	 = application.gds_userInfo.getColumn(0,"userGrp");//사용자 그룹 		--> *01:영업관리자     *02:콜센터     *03:지사     *04:지점     *05:대리점
        this.userId 	 = application.gds_userInfo.getColumn(0,"userId");
        this.p_arg 				= "RTCSSafeServiceRegister";
        this.toDay 				= "";
        this.selectServrqDay	= "";
        this.joinRate           = "";

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg){
        	
        	if( nErrorCode < 0 ){
        		alert(strErrorMsg);
        		return;
        	}
        		
        	if( strSvcId == "intiRTCSSafeService" ){
        	
        		var insert1 = this.ds_C034.insertRow(0);
        		this.ds_C034.setColumn(insert1, "cd", "");
        		this.ds_C034.setColumn(insert1, "cdNm", "전체");
        		
        		var insert2 = this.ds_S030.insertRow(0);		
        		this.ds_S030.setColumn(insert2, "cd", "");
        		this.ds_S030.setColumn(insert2, "cdNm", "전체");
        		
        		this.ds_S044.filter("cd == 'B00011' || cd == 'B00012'");
        		
        		//this.div_search.cal_DlvrDayF.set_value(this.toDay);
        		//this.div_search.cal_DlvrDayT.set_value(this.toDay);
        		
        		//this.div_search.cal_ProcDayF.set_value(this.toDay);
        		//this.div_search.cal_ProcDayT.set_value(this.toDay);

        	}
        	
        	if( strSvcId == "getToday" ){
        		if( this.toDay != "" ){
        			var sSvcID      	= "selectServrqDay";  
        			var sController   	= "/rtms/cs/selectServrqDay.do";
        			var sInDatasets   	= "";
        			var sOutDatasets  	= "";
        			var sArgs 			= "";	
        			var fn_callBack		= "fn_callBack";
        			sArgs += Ex.util.setParam("toDay", this.toDay);
        			Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        		}
        	}
        	
        	if( strSvcId == "selectServrqDay" ){
        		this.fn_init();
        	}
        	
        	if( strSvcId == "selectRTCSSafeService" ){
        		this.ds_imgList.clearData();
        		
        		var rowCt = this.ds_list.getRowCount();
        		if( rowCt == 0 ){
        			alert("조회된 데이터가 없습니다.");
        			this.gr_list.set_nodatatext("조회된 데이터가 없습니다.");
        		}else{
        			this.ds_list_canrowposchange();
        			this.ds_list_onrowposchanged();	
        			
        			//image 리스트 조회
        			this.fn_getImgList();				
        		}
        	}
        	
        	if( strSvcId == "selectRTCSSafeImgList" ){
        		//이미지뷰어가 popup되어 있으면 데이터만 갱신해준다.
        		var obj = this.lookup("이미지뷰어");
        		if(obj != undefined) {
        			obj.form.fn_refreshData(this.ds_imgList);
        		}
        		
        		this.fn_makeSms();
        	}
        	
        	if( strSvcId == "saveRTCSSafeSer" ){
        		if( nErrorCode < 0 ){
        		
        		}else{
        			this.fn_search();
        		}
        	}
        	
        	if( strSvcId == "sendURLInfo"){
        		this.alert("URL전송이 완료되었습니다.");
        	}
        	
        	if( strSvcId == "getJoinRate"){
        		this.div_search.ed_joinRate.set_value(this.joinRate);
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.RTCSSafeServiceApply_onload = function(obj,e){
        	Ex.core.init(obj);
        	this.fn_setButton();
        	this.fn_getToday();	
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_setButton = function(){
        	this.parent.setButton("E|DL|C|S", this);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_init = function(){
        	var sSvcID      	= "intiRTCSSafeService";  
        	var sController   	= "rtms/cs/intiRTCSSafeSerivce.do";
        	var sInDatasets   	= "";
        	var sOutDatasets	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	sOutDatasets += " ds_C034=mapDsC034 ";
        	sOutDatasets += " ds_S305=mapDsS305 ";
        	sOutDatasets += " ds_S030=mapDsS030 ";
        	sOutDatasets += " ds_S044=mapDsS044 ";
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_getToday = function(){
        	var sSvcID      	= "getToday";  
        	var sController   	= "/rtms/comm/getToday.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 	
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_search = function(){

        	var ordNo  	= nvl(this.div_search.ed_ordNo.value);
        	var carNo  	= nvl(this.div_search.ed_carNo.value);
        	var mobNo  	= FN_numberHyphenOut(nvl(this.div_search.ed_mobNo.value));
        	var custNo  = nvl(this.div_search.ed_custNo.value);
        	var custNm  = nvl(this.div_search.ed_custNm.value);
        	
        	var dlvrDayF = nvl(this.div_search.cal_DlvrDayF.value);
        	var dlvrDayT = nvl(this.div_search.cal_DlvrDayT.value);
        	
        	var procDayF = nvl(this.div_search.cal_ProcDayF.value);
        	var procDayT = nvl(this.div_search.cal_ProcDayT.value);
        	
        	var chanCd = nvl(this.div_search.cb_ChanCd.value);
        	var dlvStat = nvl(this.div_search.cb_ServType.value);
        	
        	if ( (ordNo == "" || ordNo == null)&&
        	 (carNo == "" || carNo == null ) && ( mobNo == "" || mobNo== null) && ( dlvrDayF == "" || dlvrDayF== null) && 
        	 ( dlvrDayT == "" || dlvrDayT== null) && ( procDayF == "" || procDayF== null) && ( procDayT == "" || procDayT== null) &&
        	 ( chanCd == "" || chanCd== null) && ( custNo == "" || custNo== null)  && ( custNm == "" || custNm== null) &&
        	 ( dlvStat == "" || dlvStat== null)) {
        		alert("조회조건을 입력해주세요"); 			return;
        	}
        	
        		var sSvcID        	= "selectRTCSSafeService";
        		var sController   	= "rtms/cs/selectRTCSSafeServiceApply.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_list=mapDsList";
        		var sArgs 			= "";
        		var fn_callBack		= "fn_callBack";
        		
        		sArgs += Ex.util.setParam("ordNo", 	    ordNo);
        		sArgs += Ex.util.setParam("custNo", 	custNo);
        		sArgs += Ex.util.setParam("custNm", 	custNm);
        		sArgs += Ex.util.setParam("mobNo", 	    mobNo);
        		sArgs += Ex.util.setParam("dlvrDayF", 	dlvrDayF);
        		sArgs += Ex.util.setParam("dlvrDayT", 	dlvrDayT);
        		sArgs += Ex.util.setParam("procDayF", 	procDayF);
        		sArgs += Ex.util.setParam("procDayT", 	procDayT);
        		sArgs += Ex.util.setParam("chanCd", 	chanCd);
        		sArgs += Ex.util.setParam("dlvStat", 	dlvStat);
        		sArgs += Ex.util.setParam("carNo", 	    carNo);
        		
        		this.ds_list.clearData();
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 

        }
        /*||||||||||||||||||||||||||||||*/

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_save = function(){

        	var saveRow = this.ds_list.rowposition;

        	if( saveRow == -1 ){
        		alert("저장할 정보를 선택하세요.");
        		return false;
        	}
        	
        	var msg			= " 값이 없습니다.";
        	var saveType	= this.ds_list.getRowType(saveRow);
        	var ordNo 		= nvl(this.ds_list.getColumn(saveRow, "ordNo"));						//계약번호
        	var dlvrDay 	= nvl(this.ds_list.getColumn(saveRow, "dlvrDay"));						//가입일자
        	var dlvrType 	= nvl(this.ds_list.getColumn(saveRow, "dlvrType"));						//서비스유형
        	var dlvrSeq		= nvl(this.ds_list.getColumn(saveRow, "dlvrSeq"));						//가입순번
        	var servCd 		= nvl(this.ds_list.getColumn(saveRow, "servCd"));						//서비스코드
        	var custNo 		= nvl(this.ds_list.getColumn(saveRow, "custNo"));						//고객번호
        	var custNm		= nvl(this.ds_list.getColumn(saveRow, "custNm"));						//고객명
        	var dlvTel 		= FN_numberHyphenOut(nvl(this.ds_list.getColumn(saveRow, "dlvTel")));	//연락처
        	var agencyCd 	= nvl(this.ds_list.getColumn(saveRow, "agencyCd"));						//대리점코드
        	var matCd		= nvl(this.ds_list.getColumn(saveRow, "matCd"));						//제품코드
        	var kwmeng		= nvl(this.ds_list.getColumn(saveRow, "cntCd1"));						//수량
        	var reqDay		= nvl(this.ds_list.getColumn(saveRow, "reqDay"));						//가입요청일자
        	var dlvStat		= nvl(this.ds_list.getOrgColumn(saveRow, "dlvStat")); 						//가입상태
        	var dlvDesc		= nvl(this.ds_list.getColumn(saveRow, "dlvDesc"));						//요청사항
        	var carNo		= nvl(this.ds_list.getColumn(saveRow, "carNo"));						//차량번호
        	var cMileage      = nvl(this.ds_list.getColumn(saveRow, "cMileage"));					//주행거리
        	var dlvrYn      = nvl(this.ds_list.getColumn(saveRow, "dlvrYn"));						//저장 or 업데이트
        	var dlvStatNew  = nvl(this.ds_list.getColumn(saveRow, "dlvStat"));
        	
        	//20190418 계약종료고객 서비스 신청 불가
        	//--------------------------------------------------------------------------------------------------------------------------------
        	var procDay     = nvl(this.ds_list.getColumn(saveRow, "procDay"));						//장착일자
        	var period      = nvl(this.ds_list.getColumn(saveRow, "periodCd"));						//계약기간

        	var procYear    = procDay.substr(0, 4);
        	var procMonth   = procDay.substr(4, 2);
        	var procDate    = procDay.substr(6, 2);

        	var osDay       = new Date(procYear, Number(procMonth) + Number(period), Number(procDate) - 1);

        	var osYear      = osDay.getFullYear();
        	var osMonth     = osDay.getMonth(); osMonth = (osMonth < 10) ? '0' + osMonth : osMonth;
        	var osDate      = osDay.getDate(); osDate = (osDate < 10) ? '0' + osDate : osDate;

        	var userId 	 = application.gds_userInfo.getColumn(0, "userId");
        	
        	if(osYear + "" + osMonth + ""  + osDate < this.toDay){
        		if(userId != "10164030" && userId != "10083012"){
        			alert("렌탈계약이 종료된 고객은 서비스를 신청 할 수 없습니다.\n 서비스신청문의는 관리자에게 문의해주세요.");
        			return;
        		}
        	}
        	//----------------------------------------------------------------------------------------------------------------------------------
        	
        	if( ordNo == "" ){ 											alert("계약번호"+msg);				return false;
        	}else if( (dlvStat != "01") && (dlvStat != "") ){					alert("요청접수상태가 아니므로 저장할 수가 없습니다."); return false;
        	}else if( this.FN_stringByteLength(dlvDesc) > 300){					alert("배송시 요청사항 크기가 300byte를 초과했습니다.\n한글일경우 150자, 영문일경우 300자 입니다."); return false;
        	/*}else if( this.ds_imgList.rowcount == 0){							alert("첨부이미지가 존재하지 않습니다."); return false;*/
        	}else{

        		this.ds_save.clearData();
        		var nRowSave = this.ds_save.insertRow(0);
        		this.ds_save.setColumn(nRowSave, "dlvrDay", 	dlvrDay);
        		this.ds_save.setColumn(nRowSave, "dlvrSeq", 	dlvrSeq);
        		this.ds_save.setColumn(nRowSave, "dlvrType", 	dlvrType);
        		this.ds_save.setColumn(nRowSave, "ordNo",		ordNo);
        		this.ds_save.setColumn(nRowSave, "servCd",		servCd);
        		this.ds_save.setColumn(nRowSave, "custNo", 		custNo);
        		this.ds_save.setColumn(nRowSave, "custNm", 		custNm);
        		this.ds_save.setColumn(nRowSave, "agencyCd", 	agencyCd);
        		this.ds_save.setColumn(nRowSave, "matnr", 		matCd);		
        		this.ds_save.setColumn(nRowSave, "kwmeng", 		kwmeng);	
        		this.ds_save.setColumn(nRowSave, "reqDay", 		this.toDay);					
        		this.ds_save.setColumn(nRowSave, "dlvStat", 	dlvStat);           
        		this.ds_save.setColumn(nRowSave, "dlvDesc", 	dlvDesc);
        		this.ds_save.setColumn(nRowSave, "carNo", 		carNo);
        		this.ds_save.setColumn(nRowSave, "dlvTel", 		dlvTel);
        		this.ds_save.setColumn(nRowSave, "cMileage", 	cMileage);
        		
        		this.ds_save.set_updatecontrol(false);
        		if( dlvrYn == "N"){
        			this.ds_save.setRowType(nRowSave, 2);
        			this.ds_save.setColumn(nRowSave, "dlvStat", 	"01");
        		}else{
        			this.ds_save.setRowType(nRowSave, 4);
        			this.ds_save.setColumn(nRowSave, "dlvStat", 	dlvStatNew);
        		}
        		this.ds_save.set_updatecontrol(true);
        		//===========================================================================================
        		
        		if( confirm( "저장하시겠습니까?" ) ){
        			var sSvcID        	= "saveRTCSSafeSer"; 
        			var sController   	= "rtms/cs/saveRTCSSafeApply.do";
        			var sInDatasets   	= "";
        			var sOutDatasets  	= "";
        			var sArgs 			= "";
        			sInDatasets   		+= " input=ds_save:U ";
        			sInDatasets   		+= " input1=ds_imgList:U ";
        			sOutDatasets  		= "";
        			var fn_callBack		= "fn_callBack";		
        			Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        		}
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_delete = function(){
        	var saveRow = this.ds_list.rowposition;
        	
        	if( saveRow == -1 ){
        		alert("삭제할 정보를 선택하세요.");
        		return false;
        	}
        	
        	var ordNo 		= nvl(this.ds_list.getColumn(saveRow, "ordNo"));						//계약번호
        	var dlvrType 	= nvl(this.ds_list.getColumn(saveRow, "dlvrType"));						//고객명
        	var dlvrSeq		= nvl(this.ds_list.getColumn(saveRow, "dlvrSeq"));						//모델
        	var servCd 		= nvl(this.ds_list.getColumn(saveRow, "servCd"));						//교체점코드
        	var custNo 		= nvl(this.ds_list.getColumn(saveRow, "custNo"));						//주소
        	var custNm		= nvl(this.ds_list.getColumn(saveRow, "custNm"));						//저장 OR 업데이트
        	var dlvTel 		= FN_numberHyphenOut(nvl(this.ds_list.getColumn(saveRow, "dlvTel")));	//연락처
        	var agencyCd 	= nvl(this.ds_list.getColumn(saveRow, "agencyCd"));						//배송시요구사항
        	var matnr		= nvl(this.ds_list.getColumn(saveRow, "matnr"));						//교체예정일
        	var kwmeng		= nvl(this.ds_list.getColumn(saveRow, "kwmeng"));						//상태
        	var reqDay		= nvl(this.ds_list.getColumn(saveRow, "reqDay"));						//순번
        	var dlvStat		= nvl(this.ds_list.getColumn(saveRow, "dlvStat")); 						//서비스 순번
        	var dlvDesc		= nvl(this.ds_list.getColumn(saveRow, "dlvDesc"));						//교체신청일자
        	var carNo		= nvl(this.ds_list.getColumn(saveRow, "carNo"));						//교체신청일자
        	var cMileage      = nvl(this.ds_list.getColumn(saveRow, "cMileage"));					//신청 타이어 본수
        	var dlvrDay      = nvl(this.ds_list.getColumn(saveRow, "dlvrDay"));					//신청 타이어 본수
        	
        	if(nvl(dlvStat) == "04"){
        		this.alert("승인완료된 내역은 취소가 불가합니다.");
        		return;
        	}
        	
        	this.ds_save.clearData();
        	
        	var nRowSave = this.ds_save.insertRow(0);
        	
        	this.ds_save.setColumn(nRowSave, "dlvrDay", 	dlvrDay);
        	this.ds_save.setColumn(nRowSave, "dlvrSeq", 	dlvrSeq);
        	this.ds_save.setColumn(nRowSave, "dlvrType", 	dlvrType);
        	this.ds_save.setColumn(nRowSave, "ordNo",		ordNo);
        	this.ds_save.setColumn(nRowSave, "servCd",		servCd);
        	this.ds_save.setColumn(nRowSave, "custNo", 		custNo);
        	this.ds_save.setColumn(nRowSave, "custNm", 		custNm);
        	this.ds_save.setColumn(nRowSave, "agencyCd", 	agencyCd);
        	this.ds_save.setColumn(nRowSave, "matnr", 		matnr);	
        	this.ds_save.setColumn(nRowSave, "kwmeng", 		kwmeng);	
        	this.ds_save.setColumn(nRowSave, "reqDay", 		reqDay);				
        	this.ds_save.setColumn(nRowSave, "dlvStat", 	dlvStat);           
        	this.ds_save.setColumn(nRowSave, "dlvDesc", 	dlvDesc);
        	this.ds_save.setColumn(nRowSave, "carNo", 		carNo);
        	this.ds_save.setColumn(nRowSave, "dlvTel", 		dlvTel);
        	this.ds_save.setColumn(nRowSave, "cMileage", 	cMileage);	
        	
        	this.ds_save.set_updatecontrol(false);
        	this.ds_save.setRowType(nRowSave, 8);
        	this.ds_save.set_updatecontrol(true);	
        	//===========================================================================================
        		
        	if( confirm( "삭제하시겠습니까?" ) ){
        		var sSvcID        	= "saveRTCSSafeSer"; 
        		var sController   	= "rtms/cs/saveRTCSSafeApply.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";
        		sInDatasets   		+= " input=ds_save:U ";
        		sInDatasets   		+= " input1=ds_imgList:U ";
        		sOutDatasets  		= "";
        		var fn_callBack		= "fn_callBack";		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_excel = function(){
        	Ex.core.exportExcel(this, this.gr_list);  
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_getImgList = function(){
        	var ordNo 		= nvl(this.ds_list.getColumn(this.ds_list.rowposition, "ordNo"));
        	var dlvrType  	= nvl(this.ds_list.getColumn(this.ds_list.rowposition, "dlvrType"));
        	var servCd 		= nvl(this.ds_list.getColumn(this.ds_list.rowposition, "servCd"));
        	var servSeq  	= nvl(this.ds_list.getColumn(this.ds_list.rowposition, "dlvrSeq"));
        	
        	
        	var sSvcID        	= "selectRTCSSafeImgList";
        	var sController   	= "rtms/cs/selectRTCSSafeImgList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_imgList=mapDsList";
        	var sArgs 			= "";
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("ordNo", 		ordNo);
        	sArgs += Ex.util.setParam("dlvrType", 	dlvrType);
        	sArgs += Ex.util.setParam("servCd", 	servCd);
        	sArgs += Ex.util.setParam("servSeq", 	servSeq);

        	this.ds_imgList.clearData();
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 

        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_ed_telNo_onkeyup = function(obj,e){
        	FN_numberHyphenIn(obj, e);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_ed_mobNo_onkeyup = function(obj,e){
        	FN_numberHyphenIn(obj, e);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.ds_list_canrowposchange = function(obj,e){
        	var nCnt = this.ds_list.getRowCount();
        	var flag = false;
        	for( var i = 0 ; i < nCnt ; i++ ){
        		var stat = this.ds_list.getRowType(i);
        		if( stat == 4 ){
        			alert("수정된 정보가 있습니다.\n저장 후 진행하세요.");
        			flag = false;
        			break;
        		}else{
        			flag = true;
        		}
        	}
        	return flag;
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        /*그리드선택시*/
        this.ds_list_onrowposchanged = function(obj,e){
        	var nRow	 = this.ds_list.rowposition;
        	var dlvStat  = nvl(this.ds_list.getColumn(nRow, "dlvStat"));
        	
        	trace("dlvStat::" + dlvStat);
        	if( dlvStat == "" ){
        		this.div_detail.set_enable(true);
        		this.ds_list.set_updatecontrol(false);
        		this.ds_list.setRowType(nRow, Dataset.ROWTYPE_NORMAL);
        		this.ds_list.set_updatecontrol(true);
        	}else if(dlvStat == "01"){
        		this.div_detail.set_enable(true);		
        	}else{			
        		this.div_detail.set_enable(false);	
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.FN_stringByteLength = function(p_val){
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
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.FN_comma = function(num ){
        	var len, point, str;
        	num = num + "";
        	point = num.length % 3 ;
        	len = num.length;

        	str = num.substring(0, point);
        	while (point < len) {
        	if (str != "") str += ",";
        	str += num.substring(point, point + 3);
        	point += 3;
        	}
        	return str;
        }

        
        this.div_search_ed_ordNo_onkeydown = function(obj,e)
        {
        	if( e.keycode == "13" ){
        		this.fn_search();
        	}	
        }

        this.div_search_btn_custPopUp00_onclick = function(obj,e)
        {
        	var args ={ p_arg : this.p_arg };
        	Ex.core.popup(this,"계약번호 조회","comm::RTCOMMOrderNo_pop.xfdl",args, "modaless=false");
        }
        this.returnOrderNo = function(ordNo){
        	this.div_search.ed_ordNo.set_value(ordNo);
        }

        this.gr_imgList_oncellclick = function(obj,e)
        {
        	if ((obj.getCellPos() == 2) && (obj.getCellValue(obj.currentrow, obj.getCellPos()) == 0)) {
        		this.ds_imgList.setColumn(this.ds_imgList.rowposition, "confYn", 1);
        	}else if ((obj.getCellPos() == 2) && (obj.getCellValue(obj.currentrow, obj.getCellPos()) == 1)) {
        		this.ds_imgList.setColumn(this.ds_imgList.rowposition, "confYn", 0);
        	}

        	//SMS문구생성
        	this.fn_makeSms();
        }

        this.div_detail_btn_img_onclick = function(obj,e)
        {
        	var ordNo 		= nvl(this.ds_list.getColumn(this.ds_list.rowposition, "ordNo"));
        	var dlvrType  	= nvl(this.ds_list.getColumn(this.ds_list.rowposition, "dlvrType"));
        	var servCd 		= nvl(this.ds_list.getColumn(this.ds_list.rowposition, "servCd"));
        	var servSeq  	= nvl(this.ds_list.getColumn(this.ds_list.rowposition, "dlvrSeq"));
        	
        	if(this.ds_imgList.rowcount == 0){
        		this.alert("첨부이미지가 존재하지 않습니다.");
        		return;
        	}
        	
        	var sFileUrl = "/ntrms/cs/safeServiceFileDown.do?ordNo="+ordNo+"&dlvrType="+dlvrType+"&servCd="+servCd+"&servSeq="+servSeq;
        	this.FileDownload.set_downloadurl(sFileUrl);
        	var bSucc = this.FileDownload.download();
        }

        this.gr_list_oncellclick = function(obj,e)
        {
        	this.fn_getImgList();
        }

        this.div_detail_btn_url_onclick = function(obj,e)
        {
        	var procDay = this.ds_list.getColumn(this.ds_list.rowposition, "procDay");
        	
        	var curDate = new Date();
        	var year = "0000";
        	var month = "00";
        	var date = "00";
        	
        	//[20210118_01] kstka 장착당일 URL발송 제한처리
        	if(curDate.getFullYear().toString().length < 2) year = "0" + curDate.getFullYear();
        	else year = curDate.getFullYear();
        	if(curDate.getMonth().toString().length < 2) month = "0" + (curDate.getMonth() + 1);
        	else month = curDate.getMonth() + 1;
        	if(curDate.getDate().toString().length < 2) date = "0" + curDate.getDate();
        	var date = curDate.getDate();

        
        // 	if(procDay == year.toString() + month.toString() + date.toString()){
        // 		this.alert("장착당일에는 URL발송이 제한됩니다.");
        // 		return;
        // 	}
        	
        	var hour = "00";
        	var min = "00";
        	var sec = "00";
        	
        	var servCd = this.ds_list.getColumn(this.ds_list.rowposition, "servCd");
        	var ordNo = this.ds_list.getColumn(this.ds_list.rowposition, "ordNo");
        		
        	//SMS문구
        	var smsText = this.div_detail.ed_SmsText.value;
        	
        	var sndMsgText = "고객님, 넥스트레벨 타이어렌탈 서비스를 이용해 주시어 진심으로 감사드립니다.";
        		sndMsgText += "\n보증서비스 접수를 위하여 아래 URL을 눌러 사진을 첨부해주세요.";
        		
        		if(servCd == "B00011"){ //조기마모파손보증
        			sndMsgText += "\n(URL주소: https://m.nexen-nextlevel.com/mypage/newEarlyAbrasionSrvJoin?ordNo" + escape("=") + ordNo + ")";
        		}else{
        			sndMsgText += "\n(URL주소: https://m.nexen-nextlevel.com/mypage/newFreeDamageSrvJoin?ordNo" + escape("=") + ordNo + ")";
        		}
        		
        		sndMsgText += "\n" + smsText;
        	
        	if(curDate.getHours().length < 2) hour = "0" + curDate.getHours();
        	else hour = curDate.getHours();
        	if(curDate.getMinutes().length < 2) min = "0" + curDate.getMinutes();
        	else min = curDate.getMinutes();
        	if(curDate.getSeconds().length < 2) sec = "0" + curDate.getSeconds();
        	var sec = curDate.getSeconds();
        		
        	
        	var sSvcID        	= "sendURLInfo";
        	var sController   	= "rtms/cm/sendSms.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("reservedFg", 		"I");
        	sArgs += Ex.util.setParam("reservedDttm", 		this.toDay + hour + min + sec);
        	sArgs += Ex.util.setParam("rcvPhnId", 			this.div_detail.ed_dlvTel.value);
        	sArgs += Ex.util.setParam("sndPhnId", 			"18550100");
        	sArgs += Ex.util.setParam("sndMsg", 			nvl(sndMsgText));
        	sArgs += Ex.util.setParam("etcChar1", 			"S050");
        	sArgs += Ex.util.setParam("etcChar2", 			this.ds_list.getColumn(this.ds_list.rowposition, "ordNo"));
        	sArgs += Ex.util.setParam("etcChar3", 			"7");
        	sArgs += Ex.util.setParam("etcChar4", 			"");

        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }

        this.fn_makeSms = function(){

        	var smsSet = "이미지 업로드가 필요합니다.";
        	var pic = "";
        	var picSet = "";

        	var confYn = "";
        	var picSetNm = "";
        	for(var i=0; i<this.ds_S305.rowcount; i++){
        		
        		this.ds_imgList.set_filterstr("picSet=='" + this.ds_S305.getColumn(i, "cd") + "'");
        		confYn = this.ds_imgList.getColumn(0, "confYn");
        		picSetNm = this.ds_S305.getColumn(i, "cdNm");
        		
        		if(nvl(confYn) == "" || nvl(confYn) == "0"){
        			pic = nvl(picSetNm);
        			
        			picSet += pic + ",";
        		}
        		
        		this.ds_imgList.set_filterstr("");
        	}
        	
        // 	for(var i=0; i<this.ds_imgList.rowcount; i++){		
        // 
        // 		if(nvl(this.ds_imgList.getColumn(i, "confYn")) == "0"){
        // 			pic = nvl(this.ds_imgList.getColumn(i, "picSetNm"));
        // 			
        // 			picSet += pic + ",";
        // 		}
        // 	}

        	smsSet = picSet + smsSet;
        	this.div_detail.ed_SmsText.set_value(smsSet);
        }

        this.div_search_btn_join_onclick = function(obj,e)
        {
        	var sSvcID        	= "getJoinRate";
        	var sController   	= "/ntrms/cs/getJoinRate.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";
        	var fn_callBack		= "fn_callBack";
        			
        	sArgs += Ex.util.setParam("dayF", 		"20201201");
        	sArgs += Ex.util.setParam("dayT", 		this.toDay);

        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }

        //이미지뷰어 팝업 [20220914_1]
        this.btn_imgPop_onclick = function(obj,e)
        {	
        	var dlvrDay = this.ds_list.getColumn(this.ds_list.rowposition, "dlvrDay");
        	if(nvl(dlvrDay) < "20220929"){
        		alert("2022년 9월 29일 이전 데이터는 조회가 불가합니다.");
        		return;
        	}
        	
        	var obj = this.lookup("이미지뷰어"); //child frame lookup
        	if(obj != undefined) {
        		obj.form.fn_refreshData(this.ds_imgList); //form in child frame
        	}else{
        		var args = {p_arg : this.ds_imgList};
        		Ex.core.popup(this,"이미지뷰어","comm::RTCOMMFileView_pop.xfdl", args, "modaless=true");
        	}
        }

        this.btn_resetJoin_onclick = function() {
        	var selectRow = this.ds_list.rowposition;

        	if( selectRow == -1 ){
        		alert("초기화 할 정보를 선택하세요.");
        		return false;
        	}
        	
        	var dlvrDay		= nvl(this.ds_list.getColumn(selectRow, "dlvrDay"));					//배송신청일자
        	var ordNo 		= nvl(this.ds_list.getColumn(selectRow, "ordNo"));						//계약번호
        	var dlvrType 	= nvl(this.ds_list.getColumn(selectRow, "dlvrType"));					//배송타입
        	var dlvrSeq		= nvl(this.ds_list.getColumn(selectRow, "dlvrSeq"));					//배송순번
        	var servCd 		= nvl(this.ds_list.getColumn(selectRow, "servCd"));						//서비스코드
        	var custNo 		= nvl(this.ds_list.getColumn(selectRow, "custNo"));						//고객코드
        	var custNm		= nvl(this.ds_list.getColumn(selectRow, "custNm"));						//고객명
        	var agencyCd 	= nvl(this.ds_list.getColumn(selectRow, "agencyCd"));					//대리점
        	var matnr		= nvl(this.ds_list.getColumn(selectRow, "matnr"));						//제품코드
        	var kwmeng		= nvl(this.ds_list.getColumn(selectRow, "kwmeng"));						//타이어본수
        	var reqDay		= nvl(this.ds_list.getColumn(selectRow, "reqDay"));						//신청일자
        	var dlvDesc		= nvl(this.ds_list.getColumn(selectRow, "dlvDesc"));					//배송요청사항
        	var carNo		= nvl(this.ds_list.getColumn(selectRow, "carNo"));						//차량번호
        	var cMileage	= nvl(this.ds_list.getColumn(selectRow, "cMileage"));					//신청 타이어 본수

        	
        	this.ds_save.clearData();
        	var nRowSave = this.ds_save.insertRow(0);
        	
        	this.ds_save.setColumn(nRowSave, "dlvrDay", 	dlvrDay);
        	this.ds_save.setColumn(nRowSave, "ordNo",		ordNo);
        	this.ds_save.setColumn(nRowSave, "dlvrType", 	dlvrType);
        	this.ds_save.setColumn(nRowSave, "dlvrSeq", 	dlvrSeq);
        	this.ds_save.setColumn(nRowSave, "servCd",		servCd);
        	this.ds_save.setColumn(nRowSave, "custNo", 		custNo);
        	this.ds_save.setColumn(nRowSave, "custNm", 		custNm);
        	this.ds_save.setColumn(nRowSave, "agencyCd", 	agencyCd);
        	this.ds_save.setColumn(nRowSave, "matnr", 		matnr);	
        	this.ds_save.setColumn(nRowSave, "kwmeng", 		kwmeng);	
        	this.ds_save.setColumn(nRowSave, "reqDay", 		reqDay);				
        	this.ds_save.setColumn(nRowSave, "dlvStat", 	"01");		// 상태값을 01로 초기화
        	this.ds_save.setColumn(nRowSave, "dlvDesc", 	dlvDesc);
        	this.ds_save.setColumn(nRowSave, "carNo", 		carNo);
        	this.ds_save.setColumn(nRowSave, "cMileage", 	cMileage);
        	this.ds_save.set_updatecontrol(false);
        	this.ds_save.setRowType(nRowSave, 8);
        	this.ds_save.set_updatecontrol(true);
        	
        	if( confirm( "선택하신 보증서비스를 초기화하시겠습니까?" ) ){
        		var sSvcID        	= "resetRTCSSafeOne"; 
        		var sController   	= "rtms/cs/resetRTCSSafeOne.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";
        		sInDatasets   		+= " input=ds_save:U ";
        		sOutDatasets  		= "";
        		var fn_callBack		= "fn_callBack";		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.ds_list.addEventHandler("canrowposchange", this.ds_list_canrowposchange, this);
            this.ds_list.addEventHandler("onrowposchanged", this.ds_list_onrowposchanged, this);
            this.ds_imgList.addEventHandler("canrowposchange", this.ds_list_canrowposchange, this);
            this.ds_imgList.addEventHandler("onrowposchanged", this.ds_list_onrowposchanged, this);
            this.ds_S305.addEventHandler("canrowposchange", this.ds_list_canrowposchange, this);
            this.ds_S305.addEventHandler("onrowposchanged", this.ds_list_onrowposchanged, this);
            this.ds_C034.addEventHandler("canrowposchange", this.ds_list_canrowposchange, this);
            this.ds_C034.addEventHandler("onrowposchanged", this.ds_list_onrowposchanged, this);
            this.ds_S030.addEventHandler("canrowposchange", this.ds_list_canrowposchange, this);
            this.ds_S030.addEventHandler("onrowposchanged", this.ds_list_onrowposchanged, this);
            this.ds_S044.addEventHandler("canrowposchange", this.ds_list_canrowposchange, this);
            this.ds_S044.addEventHandler("onrowposchanged", this.ds_list_onrowposchanged, this);
            this.addEventHandler("onload", this.RTCSSafeServiceApply_onload, this);
            this.div_detail.ed_dlvDesc.addEventHandler("oneditclick", this.div_detail_ed_dlvDesc_oneditclick, this);
            this.div_detail.btn_url.addEventHandler("onclick", this.div_detail_btn_url_onclick, this);
            this.div_detail.ed_dlvTel.addEventHandler("onkeyup", this.div_detail_ed_dlvTel_onkeyup, this);
            this.div_detail.ed_dlvCnt.addEventHandler("onkeyup", this.div_detail_ed_dlvTel_onkeyup, this);
            this.div_search.ed_ordNo.addEventHandler("onkeydown", this.div_search_ed_ordNo_onkeydown, this);
            this.div_search.btn_custPopUp00.addEventHandler("onclick", this.div_search_btn_custPopUp00_onclick, this);
            this.div_search.ed_mobNo.addEventHandler("onkeyup", this.div_search_ed_mobNo_onkeyup, this);
            this.div_search.st_searchCondition06.addEventHandler("onclick", this.div_search_st_searchCondition06_onclick, this);
            this.div_search.cb_ServType.addEventHandler("onitemchanged", this.div_search_cb_ServType_onitemchanged, this);
            this.div_search.st_searchCondition07.addEventHandler("onclick", this.div_search_st_searchCondition06_onclick, this);
            this.div_search.btn_join.addEventHandler("onclick", this.div_search_btn_join_onclick, this);
            this.gr_list.addEventHandler("oncellclick", this.gr_list_oncellclick, this);
            this.gr_imgList.addEventHandler("oncellclick", this.gr_imgList_oncellclick, this);
            this.btn_img.addEventHandler("onclick", this.div_detail_btn_img_onclick, this);
            this.btn_imgPop.addEventHandler("onclick", this.btn_imgPop_onclick, this);
            this.btn_resetJoin.addEventHandler("onclick", this.btn_resetJoin_onclick, this);

        };

        this.loadIncludeScript("RTCSSafeServiceApply.xfdl");

       
    };
}
)();
