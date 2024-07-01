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
                this.set_name("RTSDClaimMgmt_pop");
                this.set_classname("test_form");
                this.set_titletext("클레임 관리 팝업");
                this.set_scrollbars("none");
                this._setFormPosition(0,0,1145,585);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_cgb", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_ctpV", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_pstate", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_claimtList", this);
            obj._setContents("<ColumnInfo><Column id=\"clmDay\" type=\"STRING\" size=\"256\"/><Column id=\"clmSeq\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"prgrsState\" type=\"STRING\" size=\"256\"/><Column id=\"prgrsStateNm\" type=\"STRING\" size=\"256\"/><Column id=\"clmGb\" type=\"STRING\" size=\"256\"/><Column id=\"clmGbNm\" type=\"STRING\" size=\"256\"/><Column id=\"clmTp\" type=\"STRING\" size=\"256\"/><Column id=\"clmTpNm\" type=\"STRING\" size=\"256\"/><Column id=\"counsId\" type=\"STRING\" size=\"256\"/><Column id=\"counsNm\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"addMobNo\" type=\"STRING\" size=\"256\"/><Column id=\"petternCd\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"cntNm\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"agencyCd\" type=\"STRING\" size=\"256\"/><Column id=\"agencyNm\" type=\"STRING\" size=\"256\"/><Column id=\"modelCd\" type=\"STRING\" size=\"256\"/><Column id=\"modelNm\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"posCd\" type=\"STRING\" size=\"256\"/><Column id=\"addr1\" type=\"STRING\" size=\"256\"/><Column id=\"addr2\" type=\"STRING\" size=\"256\"/><Column id=\"chcRqsMnt\" type=\"STRING\" size=\"256\"/><Column id=\"trnRsl\" type=\"STRING\" size=\"256\"/><Column id=\"chargRodi\" type=\"STRING\" size=\"256\"/><Column id=\"rerentYn\" type=\"STRING\" size=\"256\"/><Column id=\"rgstDtl\" type=\"STRING\" size=\"256\"/><Column id=\"prcsnRslts\" type=\"STRING\" size=\"256\"/><Column id=\"conHist\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_modelNm", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_cgb_detail", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_pstateDe", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_ctpP", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Div("div_search", "absolute", "13", "37", "1122", "45", null, null, this);
            obj.set_taborder("0");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_ractDay", "absolute", "25", "10", "70", "21", null, null, this.div_search);
            obj.set_taborder("23");
            obj.set_text("요청일자");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_clmFDay", "absolute", "115", "9", "100", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("0");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_value("null");
            obj = new Static("Static07", "absolute", "222", "9", "10", "21", null, null, this.div_search);
            obj.set_taborder("28");
            obj.set_text("~");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_cgbCd", "absolute", "358", "10", "75", "21", null, null, this.div_search);
            obj.set_taborder("29");
            obj.set_text("클레임구분");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_pstateCd", "absolute", "541", "10", "70", "21", null, null, this.div_search);
            obj.set_taborder("30");
            obj.set_text("처리상태");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_clmTDay", "absolute", "235", "9", "100", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("37");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Combo("cb_cgbCd", "absolute", "39.27%", "10", "80", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("39");
            obj.set_innerdataset("@ds_cgb");
            obj.set_datacolumn("cdNm");
            obj.set_codecolumn("cd");
            obj = new Combo("cb_pstateCd", "absolute", "54.47%", "10", "80", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("40");
            obj.set_innerdataset("@ds_pstate");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj = new Static("Static00", "absolute", "1091", "0", "31", "45", null, null, this.div_search);
            obj.set_taborder("41");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_ordNo", "absolute", "792", "10", "100", "21", null, null, this.div_search);
            obj.set_taborder("42");
            obj.set_inputfilter("space");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("12");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_ordNo", "absolute", "714", "10", "70", "21", null, null, this.div_search);
            obj.set_taborder("43");
            obj.set_text("계약번호");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_custPopUp", "absolute", "871", "9", "21", "21", null, null, this.div_search);
            obj.set_taborder("44");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_custNo", "absolute", "992", "10", "100", "21", null, null, this.div_search);
            obj.set_taborder("45");
            obj.set_inputfilter("space");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("10");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_custPopUp00", "absolute", "1073", "9", "21", "21", null, null, this.div_search);
            obj.set_taborder("46");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_custNo", "absolute", "914", "10", "70", "21", null, null, this.div_search);
            obj.set_taborder("47");
            obj.set_text("고객번호");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static22", "absolute", "15", "69", "1118", "12", null, null, this);
            obj.set_taborder("16");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "16", "37", "1118", "12", null, null, this);
            obj.set_taborder("17");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "907", "37", "22", "45", null, null, this);
            obj.set_taborder("25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "705", "37", "22", "45", null, null, this);
            obj.set_taborder("26");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "534", "38", "22", "45", null, null, this);
            obj.set_taborder("27");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "108", "37", "22", "45", null, null, this);
            obj.set_taborder("29");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static08", "absolute", "14", "37", "25", "45", null, null, this);
            obj.set_taborder("31");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Grid("gd_claimList", "absolute", "1.13%", "113", null, "152", "1.05%", null, this);
            obj.set_taborder("32");
            obj.set_binddataset("ds_claimtList");
            obj.set_cellsizingtype("col");
            obj.set_cellmovingtype("col");
            obj.set_readonly("true");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"100\"/><Column size=\"96\"/><Column size=\"84\"/><Column size=\"130\"/><Column size=\"130\"/><Column size=\"100\"/><Column size=\"73\"/><Column size=\"79\"/><Column size=\"74\"/><Column size=\"90\"/><Column size=\"92\"/><Column size=\"72\"/><Column size=\"103\"/><Column size=\"61\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/><Row size=\"24\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"접수일자\"/><Cell col=\"1\" text=\"방문점검\"/><Cell col=\"2\" text=\"클레임유형\"/><Cell col=\"3\" text=\"고객번호\"/><Cell col=\"4\" text=\"계약번호\"/><Cell col=\"5\" text=\"차종\"/><Cell col=\"6\" text=\"차량번호\"/><Cell col=\"7\" text=\"고객명\"/><Cell col=\"8\" text=\"진행상태\"/><Cell col=\"9\" text=\"연락처\"/><Cell col=\"10\" text=\"컨텍연락처\"/><Cell col=\"11\" text=\"접수내용\"/><Cell col=\"12\" text=\"처리결과\"/><Cell col=\"13\" text=\"상담사\"/></Band><Band id=\"body\"><Cell displaytype=\"text\" edittype=\"readonly\" text=\"bind:clmDay\"/><Cell col=\"1\" displaytype=\"text\" edittype=\"readonly\" text=\"bind:clmGbNm\"/><Cell col=\"2\" displaytype=\"text\" edittype=\"readonly\" text=\"bind:clmTpNm\"/><Cell col=\"3\" displaytype=\"text\" edittype=\"readonly\" text=\"bind:custNo\"/><Cell col=\"4\" displaytype=\"text\" edittype=\"readonly\" text=\"bind:ordNo\"/><Cell col=\"5\" displaytype=\"text\" edittype=\"readonly\" text=\"bind:modelNm\"/><Cell col=\"6\" displaytype=\"text\" edittype=\"readonly\" text=\"bind:carNo\"/><Cell col=\"7\" displaytype=\"text\" edittype=\"readonly\" text=\"bind:custNm\"/><Cell col=\"8\" displaytype=\"text\" edittype=\"readonly\" text=\"bind:prgrsStateNm\"/><Cell col=\"9\" displaytype=\"text\" edittype=\"readonly\" text=\"bind:mobNo\"/><Cell col=\"10\" displaytype=\"text\" edittype=\"readonly\" text=\"bind:addMobNo\"/><Cell col=\"11\" displaytype=\"text\" edittype=\"readonly\" text=\"bind:rgstDtl\"/><Cell col=\"12\" displaytype=\"text\" edittype=\"readonly\" text=\"bind:prcsnRslts\"/><Cell col=\"13\" displaytype=\"text\" edittype=\"readonly\" text=\"bind:counsNm\"/></Band><Band id=\"summary\"><Cell text=\"총계\"/><Cell col=\"1\" expr=\"expr:dataset.getRowCount()+&quot;(건)&quot;\"/><Cell col=\"2\"/><Cell col=\"3\"/><Cell col=\"4\"/><Cell col=\"5\"/><Cell col=\"6\"/><Cell col=\"7\"/><Cell col=\"8\"/><Cell col=\"9\"/><Cell col=\"10\"/><Cell col=\"11\"/><Cell col=\"12\"/><Cell col=\"13\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "13", "89", "169", "20", null, null, this);
            obj.set_taborder("33");
            obj.set_text("클레임 목록");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static09", "absolute", "-1", "103", "1147", "10", null, null, this);
            obj.set_taborder("34");
            obj.set_text("Static02");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static10", "absolute", "-1", "82", "1147", "10", null, null, this);
            obj.set_taborder("35");
            obj.set_text("Static02");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static16", "absolute", "13", "268", "169", "20", null, null, this);
            obj.set_taborder("71");
            obj.set_text("상세내용");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Div("div_claimDetail", "absolute", "12", "287", null, "331", "0.08%", null, this);
            obj.set_taborder("156");
            this.addChild(obj.name, obj);
            obj = new Static("Static34", "absolute", "0", "9", "1122", "31", null, null, this.div_claimDetail);
            obj.set_taborder("0");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_claimDetail.addChild(obj.name, obj);
            obj = new Static("st_clmDay", "absolute", "280", "9", "130", "31", null, null, this.div_claimDetail);
            obj.set_taborder("1");
            obj.set_text("접수일자");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_claimDetail.addChild(obj.name, obj);
            obj = new Static("Static11", "absolute", "0", "39", "1122", "31", null, null, this.div_claimDetail);
            obj.set_taborder("2");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_claimDetail.addChild(obj.name, obj);
            obj = new Static("st_counsNm", "absolute", "840", "39", "130", "31", null, null, this.div_claimDetail);
            obj.set_taborder("4");
            obj.set_text("접수 상담사");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_claimDetail.addChild(obj.name, obj);
            obj = new Static("st_pstateCd", "absolute", "560", "39", "130", "31", null, null, this.div_claimDetail);
            obj.set_taborder("5");
            obj.set_text("처리상태");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_claimDetail.addChild(obj.name, obj);
            obj = new Edit("ed_ordNo", "absolute", "414", "44", "142", "21", null, null, this.div_claimDetail);
            obj.set_taborder("6");
            obj.set_maxlength("12");
            this.div_claimDetail.addChild(obj.name, obj);
            obj = new Static("st_ordNo", "absolute", "280", "39", "130", "31", null, null, this.div_claimDetail);
            obj.set_taborder("7");
            obj.set_text("계약번호");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_claimDetail.addChild(obj.name, obj);
            obj = new Static("st_ctpCd", "absolute", "0", "39", "130", "31", null, null, this.div_claimDetail);
            obj.set_taborder("8");
            obj.set_text("클레임 유형");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.set_visible("true");
            this.div_claimDetail.addChild(obj.name, obj);
            obj = new Static("Static12", "absolute", "0", "69", "1122", "31", null, null, this.div_claimDetail);
            obj.set_taborder("9");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_claimDetail.addChild(obj.name, obj);
            obj = new Static("st_add_mobNO", "absolute", "280", "69", "130", "31", null, null, this.div_claimDetail);
            obj.set_taborder("10");
            obj.set_text("컨택연락처");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_claimDetail.addChild(obj.name, obj);
            obj = new Static("st_mobNo", "absolute", "0", "69", "130", "31", null, null, this.div_claimDetail);
            obj.set_taborder("11");
            obj.set_text("연락처");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_claimDetail.addChild(obj.name, obj);
            obj = new Static("st_custNo", "absolute", "560", "9", "130", "31", null, null, this.div_claimDetail);
            obj.set_taborder("20");
            obj.set_text("고객번호");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_claimDetail.addChild(obj.name, obj);
            obj = new Static("st_custNm", "absolute", "840", "9", "130", "31", null, null, this.div_claimDetail);
            obj.set_taborder("21");
            obj.set_text("고객명");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_claimDetail.addChild(obj.name, obj);
            obj = new Edit("ed_custNo", "absolute", "694", "14", "142", "21", null, null, this.div_claimDetail);
            obj.set_taborder("22");
            obj.set_maxlength("10");
            this.div_claimDetail.addChild(obj.name, obj);
            obj = new Edit("ed_custNm", "absolute", "974", "14", "142", "21", null, null, this.div_claimDetail);
            obj.set_taborder("23");
            obj.set_maxlength("120");
            this.div_claimDetail.addChild(obj.name, obj);
            obj = new Static("st_charg_Rodi", "absolute", "560", "69", "130", "31", null, null, this.div_claimDetail);
            obj.set_taborder("25");
            obj.set_text("담당로디안");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_claimDetail.addChild(obj.name, obj);
            obj = new Static("st_re_rentYn", "absolute", "840", "69", "130", "31", null, null, this.div_claimDetail);
            obj.set_taborder("26");
            obj.set_text("재렌탈가능성고객");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_claimDetail.addChild(obj.name, obj);
            obj = new Edit("ed_charg_Rodi", "absolute", "694", "74", "142", "21", null, null, this.div_claimDetail);
            obj.set_taborder("27");
            obj.set_maxlength("50");
            this.div_claimDetail.addChild(obj.name, obj);
            obj = new Edit("ed_re_rentYn", "absolute", "974", "73", "142", "21", null, null, this.div_claimDetail);
            obj.set_taborder("28");
            obj.set_maxlength("1");
            obj.set_inputtype("english");
            this.div_claimDetail.addChild(obj.name, obj);
            obj = new Calendar("cal_clmDay", "absolute", "414", "14", "142", "21", null, null, this.div_claimDetail);
            this.div_claimDetail.addChild(obj.name, obj);
            obj.set_taborder("32");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_enable("false");
            obj = new Combo("cb_cgbCd", "absolute", "134", "14", "122", "21", null, null, this.div_claimDetail);
            this.div_claimDetail.addChild(obj.name, obj);
            obj.set_taborder("33");
            obj.set_innerdataset("@ds_cgb_detail");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displaynulltext("선택");
            obj.set_enable("false");
            obj = new Combo("cb_ctpCd", "absolute", "134", "44", "141", "21", null, null, this.div_claimDetail);
            this.div_claimDetail.addChild(obj.name, obj);
            obj.set_taborder("34");
            obj.set_displaynulltext("선택");
            obj = new Combo("cb_pstateCd", "absolute", "694", "44", "122", "21", null, null, this.div_claimDetail);
            this.div_claimDetail.addChild(obj.name, obj);
            obj.set_taborder("35");
            obj.set_innerdataset("@ds_pstateDe");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj = new Edit("ed_add_mobNO", "absolute", "414", "74", "142", "21", null, null, this.div_claimDetail);
            obj.set_taborder("36");
            obj.set_maxlength("12");
            obj.set_inputtype("digit");
            this.div_claimDetail.addChild(obj.name, obj);
            obj = new Edit("ed_mobNo", "absolute", "134", "74", "142", "21", null, null, this.div_claimDetail);
            obj.set_taborder("41");
            obj.set_inputtype("digit");
            obj.set_maxlength("12");
            this.div_claimDetail.addChild(obj.name, obj);
            obj = new Static("st_cgbCd", "absolute", "0", "9", "130", "31", null, null, this.div_claimDetail);
            obj.set_taborder("51");
            obj.set_text("클레임 구분");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_claimDetail.addChild(obj.name, obj);
            obj = new Edit("ed_counsNm", "absolute", "974", "44", "142", "21", null, null, this.div_claimDetail);
            obj.set_taborder("60");
            obj.set_maxlength("50");
            this.div_claimDetail.addChild(obj.name, obj);
            obj = new Edit("ed_cntCd", "absolute", "974", "73", "142", "21", null, null, this.div_claimDetail);
            obj.set_taborder("69");
            obj.set_inputtype("digit");
            obj.set_maxlength("2");
            obj.set_visible("false");
            this.div_claimDetail.addChild(obj.name, obj);
            obj = new Static("st_cntCd", "absolute", "840", "69", "130", "31", null, null, this.div_claimDetail);
            obj.set_taborder("70");
            obj.set_text("본수");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.set_visible("false");
            this.div_claimDetail.addChild(obj.name, obj);
            obj = new Edit("ed_petternCD", "absolute", "694", "74", "142", "21", null, null, this.div_claimDetail);
            obj.set_taborder("71");
            obj.set_maxlength("300");
            obj.set_visible("false");
            this.div_claimDetail.addChild(obj.name, obj);
            obj = new Static("st_petternCD", "absolute", "560", "69", "130", "31", null, null, this.div_claimDetail);
            obj.set_taborder("72");
            obj.set_text("패턴");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.set_visible("false");
            this.div_claimDetail.addChild(obj.name, obj);

            obj = new Static("Static17", "absolute", "0", "282", "1147", "15", null, null, this);
            obj.set_taborder("158");
            obj.set_text("Static02");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "351", "37", "22", "45", null, null, this);
            obj.set_taborder("160");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static07", "absolute", "1084", "8", "6", "22", null, null, this);
            obj.set_taborder("165");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static11", "absolute", "1033", "8", "6", "22", null, null, this);
            obj.set_taborder("166");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static12", "absolute", "982", "8", "6", "22", null, null, this);
            obj.set_taborder("167");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Button("fn_search", "absolute", "81.69%", "9", null, "21", "14.39%", null, this);
            obj.set_taborder("172");
            obj.set_text("조회");
            obj.set_cssclass("btn_WF_CRUD");
            this.addChild(obj.name, obj);

            obj = new Button("fn_add", "absolute", "86.14%", "9", null, "21", "9.94%", null, this);
            obj.set_taborder("173");
            obj.set_text("추가");
            obj.set_cssclass("btn_WF_CRUD");
            this.addChild(obj.name, obj);

            obj = new Button("fn_save", "absolute", "90.58%", "9", null, "21", "5.49%", null, this);
            obj.set_taborder("174");
            obj.set_text("저장");
            obj.set_cssclass("btn_WF_CRUD");
            this.addChild(obj.name, obj);

            obj = new Button("fn_excel", "absolute", "94.94%", "9", null, "21", "1.13%", null, this);
            obj.set_taborder("175");
            obj.set_text("엑셀");
            obj.set_cssclass("btn_WF_CRUD");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "-1", "262", "1147", "10", null, null, this);
            obj.set_taborder("176");
            obj.set_text("Static02");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Div("div_vAddDetail", "absolute", "8", "380", "1130", "37", null, null, this);
            obj.set_taborder("187");
            obj.set_text("div_vAddDetail");
            this.addChild(obj.name, obj);
            obj = new Static("Static19", "absolute", "4", "6", "1122", "31", null, null, this.div_vAddDetail);
            obj.set_taborder("0");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_vAddDetail.addChild(obj.name, obj);
            obj = new Static("st_modelNm", "absolute", "4", "6", "57", "31", null, null, this.div_vAddDetail);
            obj.set_taborder("1");
            obj.set_text("차종");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_vAddDetail.addChild(obj.name, obj);
            obj = new Combo("cb_modelNm", "absolute", "5.75%", "10", "64", "23", null, null, this.div_vAddDetail);
            this.div_vAddDetail.addChild(obj.name, obj);
            obj.set_taborder("2");
            obj.set_displaynulltext("선택");
            obj.set_innerdataset("@ds_modelNm");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj = new Static("st_carNo", "absolute", "133", "6", "152", "31", null, null, this.div_vAddDetail);
            obj.set_taborder("3");
            obj.set_text("차량번호");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_vAddDetail.addChild(obj.name, obj);
            obj = new Edit("ed_carNo", "absolute", "290", "11", "118", "21", null, null, this.div_vAddDetail);
            obj.set_taborder("4");
            obj.set_maxlength("20");
            this.div_vAddDetail.addChild(obj.name, obj);
            obj = new Static("st_posCd", "absolute", "413", "6", "78", "31", null, null, this.div_vAddDetail);
            obj.set_taborder("5");
            obj.set_text("주소");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_vAddDetail.addChild(obj.name, obj);
            obj = new Edit("ed_posCd", "absolute", "492", "11", "54", "21", null, null, this.div_vAddDetail);
            obj.set_taborder("6");
            obj.set_readonly("true");
            this.div_vAddDetail.addChild(obj.name, obj);
            obj = new Button("btn_posPopUp", "absolute", "544", "11", "21", "21", null, null, this.div_vAddDetail);
            obj.set_taborder("7");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_vAddDetail.addChild(obj.name, obj);
            obj = new Edit("ed_addr1", "absolute", "566", "11", "273", "21", null, null, this.div_vAddDetail);
            obj.set_taborder("8");
            obj.set_maxlength("150");
            this.div_vAddDetail.addChild(obj.name, obj);
            obj = new Edit("ed_addr2", "absolute", "846", "11", "273", "21", null, null, this.div_vAddDetail);
            obj.set_taborder("9");
            obj.set_maxlength("250");
            this.div_vAddDetail.addChild(obj.name, obj);

            obj = new Div("div_detailForm", "absolute", "7", "415", "1139", "161", null, null, this);
            obj.set_taborder("188");
            obj.set_text("div_detailForm");
            this.addChild(obj.name, obj);
            obj = new Static("Static14", "absolute", "5", "1", "560", "31", null, null, this.div_detailForm);
            obj.set_taborder("4");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_detailForm.addChild(obj.name, obj);
            obj = new Static("st_rqsMnt", "absolute", "5", "1", "130", "31", null, null, this.div_detailForm);
            obj.set_taborder("5");
            obj.set_text("점검요청월");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_detailForm.addChild(obj.name, obj);
            obj = new Edit("ed_rqsMnt", "absolute", "139", "6", "142", "21", null, null, this.div_detailForm);
            obj.set_taborder("6");
            obj.set_inputtype("digit");
            obj.set_maxlength("8");
            this.div_detailForm.addChild(obj.name, obj);
            obj = new Static("st_trnRsl", "absolute", "285", "1", "130", "31", null, null, this.div_detailForm);
            obj.set_taborder("7");
            obj.set_text("이관결과");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_detailForm.addChild(obj.name, obj);
            obj = new Edit("ed_trnRsl", "absolute", "418", "6", "142", "21", null, null, this.div_detailForm);
            obj.set_taborder("8");
            obj.set_maxlength("50");
            this.div_detailForm.addChild(obj.name, obj);
            obj = new Static("Static23", "absolute", "5", "91", "560", "61", null, null, this.div_detailForm);
            obj.set_taborder("9");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_detailForm.addChild(obj.name, obj);
            obj = new Static("Static15", "absolute", "565", "1", "562", "151", null, null, this.div_detailForm);
            obj.set_taborder("10");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_detailForm.addChild(obj.name, obj);
            obj = new Static("Static20", "absolute", "5", "31", "560", "61", null, null, this.div_detailForm);
            obj.set_taborder("11");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_detailForm.addChild(obj.name, obj);
            obj = new Static("st_rgstDtl", "absolute", "5", "31", "130", "61", null, null, this.div_detailForm);
            obj.set_taborder("16");
            obj.set_text("접수내용");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_detailForm.addChild(obj.name, obj);
            obj = new Edit("ed_rgstDtl", "absolute", "139", "38", "422", "47", null, null, this.div_detailForm);
            obj.set_taborder("17");
            obj.set_maxlength("1500");
            this.div_detailForm.addChild(obj.name, obj);
            obj = new Static("st_prcsnRslts", "absolute", "5", "91", "130", "61", null, null, this.div_detailForm);
            obj.set_taborder("18");
            obj.set_text("처리결과");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_detailForm.addChild(obj.name, obj);
            obj = new Edit("ed_prcsnRslts", "absolute", "139", "97", "422", "49", null, null, this.div_detailForm);
            obj.set_taborder("19");
            obj.set_maxlength("1500");
            this.div_detailForm.addChild(obj.name, obj);
            obj = new Static("st_conHist", "absolute", "564", "1", "130", "151", null, null, this.div_detailForm);
            obj.set_taborder("20");
            obj.set_text("컨택이력");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_detailForm.addChild(obj.name, obj);
            obj = new Edit("ed_conHist", "absolute", "698", "7", "422", "138", null, null, this.div_detailForm);
            obj.set_taborder("21");
            obj.set_maxlength("4000");
            this.div_detailForm.addChild(obj.name, obj);
            obj = new Edit("ed_agencyNm", "absolute", "418", "6", "142", "21", null, null, this.div_detailForm);
            obj.set_taborder("22");
            obj.set_maxlength("120");
            obj.set_visible("false");
            this.div_detailForm.addChild(obj.name, obj);
            obj = new Static("st_agencyNm", "absolute", "285", "1", "130", "31", null, null, this.div_detailForm);
            obj.set_taborder("23");
            obj.set_text("장착점");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.set_visible("false");
            this.div_detailForm.addChild(obj.name, obj);
            obj = new Edit("ed_procDay", "absolute", "139", "6", "142", "21", null, null, this.div_detailForm);
            obj.set_taborder("24");
            obj.set_inputtype("digit");
            obj.set_maxlength("8");
            obj.set_visible("false");
            this.div_detailForm.addChild(obj.name, obj);
            obj = new Static("st_procDay", "absolute", "5", "1", "130", "31", null, null, this.div_detailForm);
            obj.set_taborder("25");
            obj.set_text("장착일자");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.set_visible("false");
            this.div_detailForm.addChild(obj.name, obj);
            obj = new Static("st_nexenPrcsnRslts", "absolute", "5", "91", "130", "61", null, null, this.div_detailForm);
            obj.set_taborder("26");
            obj.set_text("넥센보고");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_detailForm.addChild(obj.name, obj);

            obj = new Button("btn_orderNoSearch", "absolute", "99", "268", "77", "21", null, null, this);
            obj.set_taborder("189");
            obj.set_text("계약번호찾기");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1122, 45, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("0");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 0, 331, this.div_claimDetail,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("156");

            	}
            );
            this.div_claimDetail.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1130, 37, this.div_vAddDetail,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("187");
            		p.set_text("div_vAddDetail");

            	}
            );
            this.div_vAddDetail.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1139, 161, this.div_detailForm,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("188");
            		p.set_text("div_detailForm");

            	}
            );
            this.div_detailForm.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1145, 585, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("test_form");
            		p.set_titletext("클레임 관리 팝업");
            		p.set_scrollbars("none");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item17","div_detailForm.ed_procDay","value","ds_claimtList","procDay");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item18","div_detailForm.ed_agencyNm","value","ds_claimtList","agencyNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item19","div_claimDetail.ed_petternCD","value","ds_claimtList","petternCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item20","div_claimDetail.ed_cntCd","value","ds_claimtList","cntCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item3","div_claimDetail.ed_ordNo","value","ds_claimtList","ordNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item23","div_claimDetail.ed_custNo","value","ds_claimtList","custNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item24","div_claimDetail.ed_custNm","value","ds_claimtList","custNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item7","div_claimDetail.ed_charg_Rodi","value","ds_claimtList","chargRodi");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item8","div_claimDetail.ed_re_rentYn","value","ds_claimtList","rerentYn");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item0","div_claimDetail.cal_clmDay","value","ds_claimtList","clmDay");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item1","div_claimDetail.ed_add_mobNO","value","ds_claimtList","addMobNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item13","div_claimDetail.ed_mobNo","value","ds_claimtList","mobNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item21","div_claimDetail.cb_cgbCd","value","ds_claimtList","clmGb");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item22","div_claimDetail.cb_pstateCd","value","ds_claimtList","prgrsState");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item5","div_claimDetail.ed_counsNm","value","ds_claimtList","counsNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item26","div_vAddDetail.cb_modelNm","value","ds_claimtList","modelCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item15","div_vAddDetail.ed_carNo","value","ds_claimtList","carNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item16","div_vAddDetail.ed_posCd","value","ds_claimtList","posCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item10","div_vAddDetail.ed_addr1","value","ds_claimtList","addr1");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item11","div_vAddDetail.ed_addr2","value","ds_claimtList","addr2");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item4","div_detailForm.ed_rqsMnt","value","ds_claimtList","chcRqsMnt");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item6","div_detailForm.ed_trnRsl","value","ds_claimtList","trnRsl");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item2","div_detailForm.ed_rgstDtl","value","ds_claimtList","rgstDtl");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item9","div_detailForm.ed_prcsnRslts","value","ds_claimtList","prcsnRslts");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item12","div_detailForm.ed_conHist","value","ds_claimtList","conHist");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTSDClaimMgmt_pop.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDClaimMgmt_pop.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분	: 클레임 관리
         * 02. 그룹명		: RTSDClaimMgmt_pop.xfdl
         * 03. 그룹설명	: 
         * 04. 작성일		: 2018-12-19
         * 05. 작성자		: 김해현
         * 06. 수정이력	:
         ***********************************************************************
         *		수정일			작성자		내용
         ***********************************************************************
         *		2018-12-19		김해현		최초작성
         ***********************************************************************/

        /***********************************************************************
         * Script Include
         ***********************************************************************/
        //include "lib::comLib.xjs";

        /***********************************************************************
         * FORM 변수 선언 영역
         ***********************************************************************/

        /***********************************************************************
         * 그룹 변수 선언부
         ************************************************************************/
        this.p_arg	= "RTSDClaimMgmt_pop";
        this.toDay	= "";
        this.custNo	= this.parent.custNo;

        /***********************************************************************************
        * Form Load Common Function
        ***********************************************************************************/
        this.form_onload = function(obj,e) {
        	Ex.core.init(obj);
        	
        	/* 현재일자 */
        	this.div_search.ed_custNo.set_value(this.custNo);
        	
        	if(this.parent.p_arg = "RTCSAdviceStatus") {
        		this.div_search.ed_custNo.set_value(nvl(this.parent.p_custNo));
        	}
        	
        	this.fn_init();
        	this.fn_getDate();
        	this.btn_orderNoSearch.set_visible(false);
        }

        /***********************************************************************************
        * Transaction Function
        ***********************************************************************************/
        /**
         * 현재일자 조회
         */
        this.fn_getDate = function() {
        	var sSvcID		 = "getDate";
        	var sController	 = "/rtms/comm/getToday.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "";
        	var sArgs		 = "";
        	var fn_callBack	 = "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 공통코드성 조회조건용 콤보 조회
         */
        this.fn_comboBox = function() {
        	var sSvcID		  = "claimMgmtCombo";
        	var sController	  = "/rtms/sd/claimMgmtCombo.do";
        	var sInDatasets	  = "";
        	var sOutDatasets  = "";
        		sOutDatasets += " ds_cgb=mapDsCgb ";
        		sOutDatasets += " ds_cgb_detail=mapDsCgbDeteail ";
        		sOutDatasets += " ds_ctpV=maptDsCtpV ";
        		sOutDatasets += " ds_ctpP=maptDsCtpP ";
        		sOutDatasets += " ds_pstate=mapDsPstate ";
        		sOutDatasets += " ds_pstateDe=mapDsPstateDe ";
        		sOutDatasets += " ds_modelNm=mapDsModelNm ";
        	var sArgs		  = "";
        	var fn_callBack	  = "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 클레임 관리 조회
         */
        this.fn_claimMgmtList = function() {
        	this.btn_orderNoSearch.set_visible(false);
        	this.div_claimDetail.set_enable(true);
        	this.div_vAddDetail.set_enable(true);
        	this.div_detailForm.set_enable(true);
        	
        	this.ds_claimtList.clearData();
        	
        	var clmFDay	   = nvl(this.div_search.cal_clmFDay.value);	/* 요청일자 시작일	*/
        	var clmTDay	   = nvl(this.div_search.cal_clmTDay.value);	/* 요청일자 마지막일	*/
        	var clmGb	   = nvl(this.div_search.cb_cgbCd.value);		/* 클레임구분			*/
        	var prgrsState = nvl(this.div_search.cb_pstateCd.value);	/* 처리상태			*/
        	var ordNo	   = nvl(this.div_search.ed_ordNo.value);		/* 주문번호			*/
        	var custNo	   = nvl(this.div_search.ed_custNo.value);		/* 고객번호			*/
        	
        	var sSvcID		 = "claimMgmtList";
        	var sController	 = "/ntrms/sd/claimMgmtList.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "ds_claimtList=output";
        	var sArgs		 = "";
        		sArgs		+= Ex.util.setParam("clmFDay",	  clmFDay);
        		sArgs		+= Ex.util.setParam("clmTDay",	  clmTDay);
        		sArgs		+= Ex.util.setParam("clmGb",	  clmGb);
        		sArgs		+= Ex.util.setParam("prgrsState", prgrsState);
        		sArgs		+= Ex.util.setParam("ordNo",	  ordNo);
        		sArgs		+= Ex.util.setParam("custNo",	  custNo);
        	var fn_callBack	 = "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 클레임 관리 고객 조회
         */
        this.fn_claimMgmtAddList = function() {
        	this.ds_claimtList.clearData();
        	
        	var custNo = nvl(this.div_search.ed_custNo.value); /* 고객번호 */
        	
        	var sSvcID		 = "claimMgmtAddList";
        	var sController	 = "/ntrms/sd/claimMgmtAddList.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "ds_claimtList=output";
        	var sArgs		 = "";
        		sArgs		+= Ex.util.setParam("custNo", custNo);
        	var fn_callBack	 = "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 클레임 관리 정보 입력, 변경
         */
        this.fn_claimMgmtIud = function() {
        	if(confirm("저장하시겠습니까?")) {
        		var ds	= this.ds_claimtList;
        		var cnt = 0;
        		
        		for(var i = 0; i < ds.rowcount; i++) {
        			var iRowType = ds.getRowType(i);
        			
        			if(iRowType == 2 || iRowType == 4 || iRowType == 8) { /* 2 : Insert 4 : Update 8 : Delete */
        				cnt++;
        			}
        		}
        		
        		if(cnt == 0) {
        			this.alert("변경된 데이터가 없습니다!");
        			
        			return false;
        		}
        		
        		var modelNm	  = this.div_vAddDetail.cb_modelNm.text;
        		var custTpVal = nvl(this.div_claimDetail.cb_cgbCd.value);
        		
        		if(custTpVal == "P") {
        			this.div_vAddDetail.ed_carNo.set_value("");
        			this.div_vAddDetail.cb_modelNm.set_index(-1);
        			this.div_vAddDetail.ed_posCd.set_value("");
        			this.div_vAddDetail.ed_addr1.set_value("");
        			this.div_vAddDetail.ed_addr2.set_value("");
        			
        			this.div_claimDetail.ed_charg_Rodi.set_value("");
        			this.div_claimDetail.ed_re_rentYn.set_value("");
        			
        			this.div_detailForm.ed_rqsMnt.set_value("");
        			this.div_detailForm.ed_trnRsl.set_value("");
        		} else if(custTpVal == "V") {
        			this.div_claimDetail.ed_petternCD.set_value("");
        			this.div_claimDetail.ed_cntCd.set_value("");
        			
        			this.div_detailForm.ed_procDay.set_value("");
        			this.div_detailForm.ed_agencyNm.set_value("");
        			
        			ds.setColumn(0, "modelNm",	modelNm);
        			ds.setColumn(0, "agencyCd",	"");
        		}
        		var sSvcID		 = "claimMgmtSave";
        		var sController	 = "/ntrms/sd/claimMgmtSave.do";
        		var sInDatasets	 = "ds_claimtList=ds_claimtList:U";
        		var sOutDatasets = "";
        		var sArgs		 = "";
        		var fn_callBack	 = "fn_callBack";
        		
        		Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        }

        /***********************************************************************************
         * CallBack Event(strSvcId - Sevice ID, nErrorCode - ErrorCode, strErrorMsg - Error Message)
         ***********************************************************************************/
        this.fn_callBack = function(strSvcId,nErrorCode,strErrorMsg,resultCnt,checkAuthGrpuCd) {
        	if(nErrorCode < 0) {
        		return Ex.core.comMsg("alert", strErrorMsg);
        	}
        	
        	switch(strSvcId) {
        		/* 현재일자 조회 */
        		case "getDate":
        			var fDay = this.div_search.cal_clmFDay;
        			var tDay = this.div_search.cal_clmTDay;
        			
        			fDay.set_value(FN_beforeMonths());
        			tDay.set_value(this.toDay);
        			
        			this.div_claimDetail.cal_clmDay.set_value(this.toDay);
        			
        			if(this.parent.p_arg = "RTCSAdviceStatus") {
        				if(this.parent.p_custNo != null) {
        					fDay.set_value("");
        					tDay.set_value("");
        				}
        			}
        			
        			this.fn_claimMgmtList();
        			break;
        		
        		/* 콤보박스 */
        		case "claimMgmtCombo":
        			var insert = this.ds_cgb.insertRow(0);
        			this.ds_cgb.setColumn(insert, "cd", " ");
        			this.ds_cgb.setColumn(insert, "cdNm", "전체");
        			this.div_search.cb_cgbCd.set_value(" ");
        			
        			var insert = this.ds_pstate.insertRow(0);
        			this.ds_pstate.setColumn(insert, "cd", " ");
        			this.ds_pstate.setColumn(insert, "cdNm", "전체");
        			this.div_search.cb_pstateCd.set_value(" ");
        			
        			var custTpVal = nvl(this.div_claimDetail.cb_cgbCd.value);
        			this.div_claimDetail.cb_pstateCd.set_value("01");
        			
        			this.fn_positionChange(custTpVal);
        			break;
        		
        		/* 클레임 관리 조회 */
        		case "claimMgmtList":
        			this.div_claimDetail.cal_clmDay.set_enable(false);
        			this.div_claimDetail.cb_cgbCd.set_enable(false);
        			
        			var ds = this.ds_claimtList;
        			
        			if(ds.getRowCount() == 0) {
        				this.div_claimDetail.set_enable(false);
        				this.div_vAddDetail.set_enable(false);
        				this.div_detailForm.set_enable(false);
        				
        				this.alert("조회된 데이터가 없습니다.");
        				
        				/* 클레임 관리 고객 조회 */
        				this.fn_claimMgmtAddList();
        				
        				return false;
        			}
        			var cgbCd = ds.getColumn(ds.rowposition, "clmGb");
        			
        			this.fn_positionChange(cgbCd);
        			break;
        		
        		/* 클레임 관리 고객 조회 */
        		case "claimMgmtAddList":
        			/* To-Do */
        			break;
        		
        		/* 클레임 관리 정보 입력, 변경 */
        		case "claimMgmtSave":
        			/* 클레임 관리 고객 조회 */
        			this.div_claimDetail.cal_clmDay.set_enable(false);
        			this.div_claimDetail.cb_cgbCd.set_enable(false);
        			this.alert(strErrorMsg);
        			this.fn_claimMgmtAddList();
        			break;
        		
        		default:
        			break;
        	}
        }

        /**
         * 계약번호 Popup Callback
         */
        this.returnOrderNo = function(val) {
        	this.div_search.ed_ordNo.set_value(val);
        }

        /**
         * 고객번호 Popup Callback
         */
        this.returnCustInfo = function(val) {
        	this.div_search.ed_custNo.set_value(val);
        }

        /**
         * 주소번호 Popup Callback
         */
        this.FN_postCd = function(res) {
        	this.div_vAddDetail.ed_posCd.set_value(res[0]);
        	this.div_vAddDetail.ed_addr1.set_value(res[1]);
        	this.div_vAddDetail.ed_addr2.set_value(res[2]);
        }

        /**
         * 다른쪽에서 값들어올때 Popup Callback
         */
        this.FN_pop_up = function(val) {
        	this.div_search.ed_custNo.set_value(val);
        }

        /**
         * 계약정보 Popup Callback
         */
        this.returnOrderNoInfo = function(arr) {
        	this.div_claimDetail.ed_ordNo.set_value(	arr[0]);
        	this.div_claimDetail.ed_custNo.set_value(	arr[1]);
        	this.div_claimDetail.ed_custNm.set_value(	arr[2]);
        	this.div_claimDetail.ed_mobNo.set_value(	arr[3]);
        	this.div_claimDetail.ed_petternCD.set_value(arr[4]);
        	this.div_claimDetail.ed_cntCd.set_value(	arr[5]);
        	this.div_detailForm.ed_procDay.set_value(	arr[6]);
        	this.ds_claimtList.setColumn(0, "agencyCd",	arr[7]);
        	this.div_detailForm.ed_agencyNm.set_value(	arr[8]);
        	this.div_vAddDetail.ed_posCd.set_value(		arr[9]);
        	this.div_vAddDetail.ed_addr1.set_value(		arr[10]);
        	this.div_vAddDetail.ed_addr2.set_value(		arr[11]);
        	this.div_vAddDetail.cb_modelNm.set_value(	arr[12]);
        	this.div_vAddDetail.ed_carNo.set_value(		arr[13]);
        }

        /***********************************************************************************
         * User Function
         ***********************************************************************************/
        this.fn_positionChange = function(cgbCd) {
        	var ds	   = this.ds_claimtList;
        	var nRow   = ds.rowposition;
        	
        	var divClm = this.div_claimDetail;
        	var divDtl = this.div_detailForm;
        	var divAdd = this.div_vAddDetail;
        	
        	if(cgbCd == "P") {
        		/* 일반 */
        		divClm.cb_ctpCd.set_innerdataset("ds_ctpP");
        		divClm.cb_ctpCd.set_codecolumn("cd");
        		divClm.cb_ctpCd.set_datacolumn("cdNm");
        		divClm.cb_ctpCd.set_value(ds.getColumn(nRow, "clmTp"));
        		divClm.st_petternCD.set_visible(true);
        		divClm.ed_petternCD.set_visible(true);
        		divClm.st_cntCd.set_visible(true);
        		divClm.ed_cntCd.set_visible(true);
        		
        		divAdd.set_visible(false);
        		
        		divDtl.set_top(385);
        		divDtl.st_nexenPrcsnRslts.set_visible(true);
        		divDtl.st_procDay.set_visible(true);
        		divDtl.ed_procDay.set_visible(true);
        		divDtl.st_agencyNm.set_visible(true);
        		divDtl.ed_agencyNm.set_visible(true);
        	} else if(cgbCd == "V") {
        		/* 방문 */
        		divClm.cb_ctpCd.set_innerdataset("ds_ctpV");
        		divClm.cb_ctpCd.set_codecolumn("cd");
        		divClm.cb_ctpCd.set_datacolumn("cdNm");
        		divClm.cb_ctpCd.set_value(ds.getColumn(nRow, "clmTp"));
        		divClm.st_petternCD.set_visible(false);
        		divClm.ed_petternCD.set_visible(false);
        		divClm.st_cntCd.set_visible(false);
        		divClm.ed_cntCd.set_visible(false);
        		
        		divAdd.set_visible(true);
        		
        		divDtl.set_top(415);
        		divDtl.st_nexenPrcsnRslts.set_visible(false);
        		divDtl.st_procDay.set_visible(false);
        		divDtl.ed_procDay.set_visible(false);
        		divDtl.st_agencyNm.set_visible(false);
        		divDtl.ed_agencyNm.set_visible(false);
        	}
        }

        /***********************************************************************************
        * Component Event & Function
        ***********************************************************************************/
        /**
         * 콤보박스
         */
        this.fn_init = function() {
        	this.fn_comboBox();
        }

        /**
         * 검색
         */
        this.fn_search_onclick = function(obj,e) {
        	this.fn_claimMgmtList();
        }

        /**
         * 추가
         */
        this.fn_add_onclick = function(obj,e) {
        	this.fn_claimAdd();
        }

        /**
         * 저장
         */
        this.fn_save_onclick = function(obj,e) {
        	this.fn_claimMgmtIud();
        }

        /**
         * 엑셀
         */
        this.fn_excel_onclick = function(obj,e) {
        	Ex.core.exportExcel(this, this.gd_claimList);
        }

        /**
         * 계약번호팝업
         */
        this.div_search_btn_custPopUp_onclick = function(obj,e) {
        	var args ={p_arg : this.p_arg};
        	Ex.core.popup(this, "계약번호 조회", "comm::RTCOMMOrderNo_pop.xfdl", args, "modaless=false");
        }
        /**
         * 고객번호팝업
         */
        this.div_search_btn_custPopUp00_onclick = function(obj,e) {
        	var args ={p_arg : this.p_arg};
        	
        	Ex.core.popup(this, "고객찾기", "comm::RTCOMMCust_pop.xfdl", args, "modaless=false");
        }

        /**
         * 주소팝업
         */
        this.div_vAddDetail_btn_posPopUp_onclick = function(obj,e) {
        	var args ={p_arg : this.p_arg};
        	
        	Ex.core.popup(this, "우편번호 조회", "comm::RTCOMMPostCode_pop.xfdl", args, "modaless=false");
        }

        /**
         * 클레임 관리 정보 추가
         */
        this.fn_claimAdd = function(obj,e) {
        	if(confirm("추가 클릭시 기존 입력내용은 사라집니다.")) {
        		this.ds_claimtList.clearData();
        		this.ds_claimtList.addRow();
        		this.div_claimDetail.cal_clmDay.set_value(this.toDay);
        		this.div_claimDetail.ed_counsNm.set_value(application.gds_userInfo.getColumn(0, "chgNm"));
        		this.ds_claimtList.setColumn(0, "counsId", application.gds_userInfo.getColumn(0, "userId"));
        		this.div_claimDetail.cal_clmDay.set_enable(true);
        		this.div_claimDetail.cb_cgbCd.set_enable(true);
        		this.div_claimDetail.set_enable(true);
        		this.div_vAddDetail.set_enable(true);
        		this.div_detailForm.set_enable(true);
        		this.fn_comboBox();
        		this.btn_orderNoSearch.set_visible(true);
        		this.div_search.ed_custNo.set_value("");
        		this.div_claimDetail.cb_cgbCd.set_value("P");
        	}
        }

        /**
         * 입력폼  체인지
         */
        this.div_claimDetail_cb_cgbCd_onitemchanged = function(obj,e) {
        	this.fn_positionChange(e.postvalue);
        }

        /**
         * 클레임유형
         */
        this.div_claimDetail_cb_ctpCd_onitemchanged = function(obj,e) {
        	var ds	 = this.ds_claimtList;
        	var nRow = ds.rowposition;
        	
        	ds.setColumn(nRow, "clmTp", obj.value);
        }

        /**
         * 차종
         */
        this.div_vAddDetail_cb_modelNm_onitemchanged = function(obj,e) {
        	var ds	 = this.ds_claimtList;
        	var nRow = ds.rowposition;
        	
        	ds.setColumn(nRow, "modelNm", obj.text);
        }

        /**
         * 키보드 이벤트
         */
        this.RTSDClaimMgmt_pop_onkeyup = function(obj,e) {
        	if(e.keycode == 27) {
        		this.close();
        	}
        }

        this.div_search_ed_ordNo_onkeyup = function(obj,e) {
        	if(e.keycode == "13") {
        		this.fn_claimMgmtList();
        	}
        }

        this.div_search_ed_custNo_onkeyup = function(obj,e) {
        	if(e.keycode == "13") {
        		this.fn_claimMgmtList();
        	}
        }

        this.btn_orderNoSearch_onclick = function(obj,e) {
        	var args = {p_arg : this.p_arg};
        	
        	Ex.core.popup(this, "계약정보 조회", "comm::RTCOMMOrderNoClaimMgmt_pop.xfdl", args, "modaless=false");
        }

        /**
         * ds_claimtList Onrowposchanged Event
         */
        this.ds_claimtList_onrowposchanged = function(obj,e) {
        	this.div_claimDetail.cb_ctpCd.set_value("");
        	
        	var cgbCd = obj.getColumn(e.newrow, "clmGb");
        	
        	this.fn_positionChange(cgbCd);
        }
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.ds_claimtList.addEventHandler("onrowposchanged", this.ds_claimtList_onrowposchanged, this);
            this.addEventHandler("onload", this.form_onload, this);
            this.addEventHandler("onkeyup", this.RTSDClaimMgmt_pop_onkeyup, this);
            this.div_search.cal_clmFDay.addEventHandler("onchanged", this.cal_referDate_onchanged, this);
            this.div_search.cal_clmTDay.addEventHandler("onchanged", this.cal_referDate_onchanged, this);
            this.div_search.cb_cgbCd.addEventHandler("onitemchanged", this.div_search_cb_cgbCd_onitemchanged, this);
            this.div_search.ed_ordNo.addEventHandler("onkeyup", this.div_search_ed_ordNo_onkeyup, this);
            this.div_search.btn_custPopUp.addEventHandler("onclick", this.div_search_btn_custPopUp_onclick, this);
            this.div_search.ed_custNo.addEventHandler("onkeyup", this.div_search_ed_custNo_onkeyup, this);
            this.div_search.btn_custPopUp00.addEventHandler("onclick", this.div_search_btn_custPopUp00_onclick, this);
            this.div_claimDetail.cb_cgbCd.addEventHandler("onitemchanged", this.div_claimDetail_cb_cgbCd_onitemchanged, this);
            this.div_claimDetail.cb_ctpCd.addEventHandler("onitemchanged", this.div_claimDetail_cb_ctpCd_onitemchanged, this);
            this.fn_search.addEventHandler("onclick", this.fn_search_onclick, this);
            this.fn_add.addEventHandler("onclick", this.fn_add_onclick, this);
            this.fn_save.addEventHandler("onclick", this.fn_save_onclick, this);
            this.fn_excel.addEventHandler("onclick", this.fn_excel_onclick, this);
            this.div_vAddDetail.cb_modelNm.addEventHandler("onitemchanged", this.div_vAddDetail_cb_modelNm_onitemchanged, this);
            this.div_vAddDetail.btn_posPopUp.addEventHandler("onclick", this.div_vAddDetail_btn_posPopUp_onclick, this);
            this.btn_orderNoSearch.addEventHandler("onclick", this.btn_orderNoSearch_onclick, this);

        };

        this.loadIncludeScript("RTSDClaimMgmt_pop.xfdl");

       
    };
}
)();
