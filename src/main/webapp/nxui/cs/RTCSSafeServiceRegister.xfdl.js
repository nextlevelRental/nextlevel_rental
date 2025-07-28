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
                this.set_titletext("마모파손 서비스 신청");
                this._setFormPosition(0,0,1147,564);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_list", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"servCd\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"periodCd\" type=\"STRING\" size=\"256\"/><Column id=\"makerCd\" type=\"STRING\" size=\"256\"/><Column id=\"makerNm\" type=\"STRING\" size=\"256\"/><Column id=\"modelCd\" type=\"STRING\" size=\"256\"/><Column id=\"modelNm\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"carOwner\" type=\"STRING\" size=\"256\"/><Column id=\"b00011RCnt\" type=\"STRING\" size=\"256\"/><Column id=\"b00012RCnt\" type=\"STRING\" size=\"256\"/><Column id=\"b00007UCnt\" type=\"STRING\" size=\"256\"/><Column id=\"b00011UCnt\" type=\"STRING\" size=\"256\"/><Column id=\"b00012UCnt\" type=\"STRING\" size=\"256\"/><Column id=\"ordDay\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"dlvrYn\" type=\"STRING\" size=\"256\"/><Column id=\"dlvrDay\" type=\"STRING\" size=\"256\"/><Column id=\"dlvrSeq\" type=\"STRING\" size=\"256\"/><Column id=\"agencyCd\" type=\"STRING\" size=\"256\"/><Column id=\"agencyNm\" type=\"STRING\" size=\"256\"/><Column id=\"servRqDay\" type=\"STRING\" size=\"256\"/><Column id=\"dlvPosCd\" type=\"STRING\" size=\"256\"/><Column id=\"dlvAddr1\" type=\"STRING\" size=\"256\"/><Column id=\"dlvAddr2\" type=\"STRING\" size=\"256\"/><Column id=\"dlvTel\" type=\"STRING\" size=\"256\"/><Column id=\"dlvDesc\" type=\"STRING\" size=\"256\"/><Column id=\"dlvStat\" type=\"STRING\" size=\"256\"/><Column id=\"dlvstatNm\" type=\"STRING\" size=\"256\"/><Column id=\"apprAmt\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd1\" type=\"STRING\" size=\"256\"/><Column id=\"cntNm\" type=\"STRING\" size=\"256\"/><Column id=\"reqNo\" type=\"STRING\" size=\"256\"/><Column id=\"b00007ICnt\" type=\"STRING\" size=\"256\"/><Column id=\"cMileage\" type=\"STRING\" size=\"256\"/><Column id=\"dlvrType\" type=\"STRING\" size=\"256\"/><Column id=\"servAdSeq\" type=\"STRING\" size=\"256\"/><Column id=\"basicServCntr\" type=\"STRING\" size=\"256\"/><Column id=\"applyReason\" type=\"STRING\" size=\"256\"/><Column id=\"mfpYn\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_save", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"dlvrDay\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"dlvrType\" type=\"STRING\" size=\"256\"/><Column id=\"dlvrSeq\" type=\"STRING\" size=\"256\"/><Column id=\"servSeq\" type=\"STRING\" size=\"256\"/><Column id=\"servOrgCd\" type=\"STRING\" size=\"256\"/><Column id=\"servCd\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"agencyCd\" type=\"STRING\" size=\"256\"/><Column id=\"matnr\" type=\"STRING\" size=\"256\"/><Column id=\"kwmeng\" type=\"STRING\" size=\"256\"/><Column id=\"servRqDay\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"servAdSeq\" type=\"STRING\" size=\"256\"/><Column id=\"dlvStat\" type=\"STRING\" size=\"256\"/><Column id=\"dlvDesc\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"dlvTel\" type=\"STRING\" size=\"256\"/><Column id=\"cMileage\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"dlvPosCd\" type=\"STRING\" size=\"256\"/><Column id=\"dlvAddr1\" type=\"STRING\" size=\"256\"/><Column id=\"dlvAddr2\" type=\"STRING\" size=\"256\"/><Column id=\"applyReason\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_S044", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_imgList", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"num\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"dlvrType\" type=\"STRING\" size=\"256\"/><Column id=\"servCd\" type=\"STRING\" size=\"256\"/><Column id=\"servSeq\" type=\"STRING\" size=\"256\"/><Column id=\"seq\" type=\"STRING\" size=\"256\"/><Column id=\"filePath\" type=\"STRING\" size=\"256\"/><Column id=\"fileName\" type=\"STRING\" size=\"256\"/><Column id=\"confYn\" type=\"STRING\" size=\"256\"/><Column id=\"picSet\" type=\"STRING\" size=\"256\"/><Column id=\"picSetNm\" type=\"STRING\" size=\"256\"/><Column id=\"dlvrDay\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_S305", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_Holiday", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"HLDYDATE\" type=\"STRING\" size=\"256\"/><Column id=\"TEXTCOLOR\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_S089", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_S306", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cd\">00</Col><Col id=\"cdNm\">접수대기</Col></Row><Row><Col id=\"cd\">01</Col><Col id=\"cdNm\">요청접수</Col></Row><Row><Col id=\"cd\">02</Col><Col id=\"cdNm\">배송요청</Col></Row><Row><Col id=\"cd\">03</Col><Col id=\"cdNm\">배송중</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_S030", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_C035", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_C036", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Div("div_detail", "absolute", "0", "266", "1134", "278", null, null, this);
            obj.set_taborder("13");
            obj.set_scrollbars("none");
            this.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "0", "30", "561", "151", null, null, this.div_detail);
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
            obj = new Static("Static13", "absolute", "560", "180", "562", "61", null, null, this.div_detail);
            obj.set_taborder("152");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("st_dlvDesc", "absolute", "560", "179", "130", "62", null, null, this.div_detail);
            obj.set_taborder("153");
            obj.set_text("요청사항");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_detail.addChild(obj.name, obj);
            obj = new TextArea("ed_dlvDesc", "absolute", "694", "184", "424", "49", null, null, this.div_detail);
            obj.set_taborder("154");
            obj.set_wordwrap("char");
            obj.set_maxlength("300");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("st_servType", "absolute", "560", "30", "130", "31", null, null, this.div_detail);
            obj.set_taborder("161");
            obj.set_text("서비스유형");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.div_detail.addChild(obj.name, obj);
            obj = new Combo("cb_servType", "absolute", "694", "35", "142", "21", null, null, this.div_detail);
            this.div_detail.addChild(obj.name, obj);
            obj.set_taborder("169");
            obj.set_displayrowcount("5");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_innerdataset("@ds_S044");
            obj.set_enable("true");
            obj = new Button("btn_url", "absolute", "86.33%", "6", null, "20", "8.02%", null, this.div_detail);
            obj.set_taborder("170");
            obj.set_text("URL발송");
            obj.set_cssclass("btn_WF_CRUD");
            this.div_detail.addChild(obj.name, obj);
            obj = new Button("btn_img", "absolute", "92.68%", "6", null, "20", "1.68%", null, this.div_detail);
            obj.set_taborder("174");
            obj.set_text("다운로드");
            obj.set_cssclass("btn_WF_CRUD");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("st_confirm00", "absolute", "560", "60", "130", "31", null, null, this.div_detail);
            obj.set_taborder("175");
            obj.set_text("교체예정일");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("st_dlvAgency", "absolute", "840", "60", "130", "31", null, null, this.div_detail);
            obj.set_taborder("177");
            obj.set_text("교체점코드");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "560", "237", "562", "31", null, null, this.div_detail);
            obj.set_taborder("186");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("st_sms", "absolute", "560", "237", "130", "31", null, null, this.div_detail);
            obj.set_taborder("187");
            obj.set_text("SMS");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "0", "178", "561", "31", null, null, this.div_detail);
            obj.set_taborder("190");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("st_mileage", "absolute", "0", "178", "130", "31", null, null, this.div_detail);
            obj.set_taborder("191");
            obj.set_text("주행거리(km)");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.div_detail.addChild(obj.name, obj);
            obj = new Edit("ed_mileage", "absolute", "134", "184", "142", "21", null, null, this.div_detail);
            obj.set_taborder("192");
            obj.set_enable("true");
            obj.set_displaynulltext("0");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("st_makerNm01", "absolute", "280", "178", "130", "31", null, null, this.div_detail);
            obj.set_taborder("194");
            obj.set_text("신청회차");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_detail.addChild(obj.name, obj);
            obj = new Edit("ed_reqNo", "absolute", "414", "183", "142", "21", null, null, this.div_detail);
            obj.set_taborder("195");
            obj.set_enable("false");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("st_confirm02", "absolute", "0", "30", "130", "151", null, null, this.div_detail);
            obj.set_taborder("196");
            obj.set_text("첨부이미지");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.div_detail.addChild(obj.name, obj);
            obj = new Calendar("ca_dlvrDay", "absolute", "694", "65", "143", "21", null, null, this.div_detail);
            this.div_detail.addChild(obj.name, obj);
            obj.set_taborder("197");
            obj.set_innerdataset("ds_Holiday");
            obj.set_datecolumn("HLDYDATE");
            obj.set_textcolorcolumn("TEXTCOLOR");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Static("Static02", "absolute", "560", "90", "562", "31", null, null, this.div_detail);
            obj.set_taborder("198");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("st_dlvAddr", "absolute", "560", "90", "130", "31", null, null, this.div_detail);
            obj.set_taborder("199");
            obj.set_text("주소");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.div_detail.addChild(obj.name, obj);
            obj = new Edit("ed_dlvAddr2", "absolute", "974", "95", "142", "21", null, null, this.div_detail);
            obj.set_taborder("200");
            obj.set_enable("false");
            this.div_detail.addChild(obj.name, obj);
            obj = new Edit("ed_agencyCd", "absolute", "974", "65", "71", "21", null, null, this.div_detail);
            obj.set_taborder("201");
            obj.set_enable("false");
            this.div_detail.addChild(obj.name, obj);
            obj = new Button("bt_agency", "absolute", "1025", "65", "20", "21", null, null, this.div_detail);
            obj.set_taborder("202");
            obj.set_cssclass("btn_WF_edtSch");
            obj.set_enable("true");
            obj.getSetter("domainId").set("nexa.save");
            this.div_detail.addChild(obj.name, obj);
            obj = new Edit("ed_agencyNm", "absolute", "1045", "65", "71", "21", null, null, this.div_detail);
            obj.set_taborder("203");
            obj.set_enable("false");
            this.div_detail.addChild(obj.name, obj);
            obj = new Edit("ed_dlvPosCd", "absolute", "694", "95", "62", "21", null, null, this.div_detail);
            obj.set_taborder("204");
            obj.set_enable("false");
            this.div_detail.addChild(obj.name, obj);
            obj = new Edit("ed_dlvAddr1", "absolute", "760", "95", "210", "21", null, null, this.div_detail);
            obj.set_taborder("205");
            obj.set_enable("false");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "560", "120", "562", "31", null, null, this.div_detail);
            obj.set_taborder("206");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("st_dlvTel", "absolute", "560", "120", "130", "31", null, null, this.div_detail);
            obj.set_taborder("207");
            obj.set_text("연락처");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("st_yrmlCd", "absolute", "840", "120", "130", "31", null, null, this.div_detail);
            obj.set_taborder("208");
            obj.set_text("신청타이어본수");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.div_detail.addChild(obj.name, obj);
            obj = new Combo("cb_cntNm", "absolute", "974", "125", "142", "21", null, null, this.div_detail);
            this.div_detail.addChild(obj.name, obj);
            obj.set_taborder("209");
            obj.set_innerdataset("ds_S089");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj = new Edit("ed_dlvTel", "absolute", "694", "125", "142", "21", null, null, this.div_detail);
            obj.set_taborder("210");
            this.div_detail.addChild(obj.name, obj);
            obj = new Edit("ed_mileage00", "absolute", "134", "184", "142", "21", null, null, this.div_detail);
            obj.set_taborder("211");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "0", "208", "561", "31", null, null, this.div_detail);
            obj.set_taborder("212");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("st_b0011RCnt", "absolute", "0", "208", "130", "31", null, null, this.div_detail);
            obj.set_taborder("213");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.set_text("조기마모보증잔여");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("st_b0011UCnt", "absolute", "280", "208", "130", "31", null, null, this.div_detail);
            obj.set_taborder("214");
            obj.set_text("조기마모보증사용");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_detail.addChild(obj.name, obj);
            obj = new Edit("ed_b0011UCnt", "absolute", "414", "213", "142", "21", null, null, this.div_detail);
            obj.set_taborder("215");
            obj.set_enable("false");
            this.div_detail.addChild(obj.name, obj);
            obj = new Edit("ed_mileage01", "absolute", "134", "212", "142", "21", null, null, this.div_detail);
            obj.set_taborder("216");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("Static05", "absolute", "0", "238", "561", "31", null, null, this.div_detail);
            obj.set_taborder("217");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("st_b0012RCnt", "absolute", "0", "238", "130", "31", null, null, this.div_detail);
            obj.set_taborder("218");
            obj.set_text("파손보증잔여");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("st_b0012UCnt", "absolute", "280", "238", "130", "31", null, null, this.div_detail);
            obj.set_taborder("219");
            obj.set_text("파손보증사용");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_detail.addChild(obj.name, obj);
            obj = new Edit("ed_b0012UCnt", "absolute", "414", "243", "142", "21", null, null, this.div_detail);
            obj.set_taborder("220");
            obj.set_enable("false");
            this.div_detail.addChild(obj.name, obj);
            obj = new Edit("ed_b0011RCnt", "absolute", "134", "212", "142", "21", null, null, this.div_detail);
            obj.set_taborder("221");
            obj.set_enable("false");
            this.div_detail.addChild(obj.name, obj);
            obj = new Edit("ed_b0012RCnt", "absolute", "134", "243", "142", "21", null, null, this.div_detail);
            obj.set_taborder("222");
            obj.set_enable("false");
            this.div_detail.addChild(obj.name, obj);
            obj = new Grid("gr_imgList", "absolute", "134", "33", "423", "143", null, null, this.div_detail);
            obj.set_taborder("223");
            obj.set_binddataset("ds_imgList");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"40\"/><Column size=\"122\"/><Column size=\"37\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell/><Cell col=\"1\" text=\"위치\"/><Cell col=\"2\" text=\"확인\"/></Band><Band id=\"body\"><Cell text=\"bind:num\"/><Cell col=\"1\" displaytype=\"combo\" edittype=\"none\" text=\"bind:picSet\" combodataset=\"ds_S305\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"2\" displaytype=\"checkbox\" edittype=\"none\" text=\"bind:confYn\" combodataset=\"ds_S044\" combocodecol=\"cd\" combodatacol=\"cdNm\"/></Band></Format></Formats>");
            this.div_detail.addChild(obj.name, obj);
            obj = new Button("btn_upload", "absolute", "55.91%", "6", null, "20", "38.45%", null, this.div_detail);
            obj.set_taborder("224");
            obj.set_text("업로드");
            obj.set_visible("false");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("st_dlvTel01", "absolute", "840", "30", "130", "31", null, null, this.div_detail);
            obj.set_taborder("225");
            obj.set_text("상태");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.div_detail.addChild(obj.name, obj);
            obj = new Combo("cb_stat", "absolute", "974", "35", "142", "21", null, null, this.div_detail);
            this.div_detail.addChild(obj.name, obj);
            obj.set_taborder("226");
            obj.set_innerdataset("ds_S306");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj.set_enable("true");
            obj = new Edit("ed_SmsText", "absolute", "694", "242", "424", "21", null, null, this.div_detail);
            obj.set_taborder("227");
            obj.set_enable("false");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("Static07", "absolute", "560", "150", "562", "31", null, null, this.div_detail);
            obj.set_taborder("228");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("st_applyReason", "absolute", "560", "150", "130", "31", null, null, this.div_detail);
            obj.set_taborder("229");
            obj.set_text("신청사유");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_detail.addChild(obj.name, obj);
            obj = new Combo("cb_applyReason", "absolute", "694", "155", "142", "21", null, null, this.div_detail);
            this.div_detail.addChild(obj.name, obj);
            obj.set_taborder("230");
            obj.set_displayrowcount("5");
            obj.set_innerdataset("@ds_C036");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_index("-1");

            obj = new Div("div_search", "absolute", "0", "0", "1122", "81", null, null, this);
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
            obj = new Static("Static06", "absolute", "0", "0", "20", "78", null, null, this.div_search);
            obj.set_taborder("10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static44", "absolute", "81", "77", "47", "21", null, null, this.div_search);
            obj.set_taborder("11");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_color("red");
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
            obj = new Static("Static00", "absolute", "368", "0", "30", "78", null, null, this.div_search);
            obj.set_taborder("14");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition01", "absolute", "257", "44", "64", "20", null, null, this.div_search);
            obj.set_taborder("15");
            obj.set_text("고객번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_custNo", "absolute", "340", "44", "140", "21", null, null, this.div_search);
            obj.set_taborder("0");
            obj.set_inputfilter("space");
            obj.set_lengthunit("ascii");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_custNm", "absolute", "480", "44", "125", "21", null, null, this.div_search);
            obj.set_taborder("3");
            obj.set_inputfilter("space");
            obj.set_lengthunit("ascii");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_custPopUp", "absolute", "460", "43", "20", "21", null, null, this.div_search);
            obj.set_taborder("2");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition00", "absolute", "21", "45", "64", "20", null, null, this.div_search);
            obj.set_taborder("16");
            obj.set_text("계약번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_ordNo", "absolute", "103", "45", "140", "21", null, null, this.div_search);
            obj.set_taborder("6");
            obj.set_inputfilter("space");
            obj.set_lengthunit("ascii");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_custPopUp00", "absolute", "223", "44", "20", "21", null, null, this.div_search);
            obj.set_taborder("7");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition02", "absolute", "398", "12", "64", "20", null, null, this.div_search);
            obj.set_taborder("17");
            obj.set_text("고객명");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_custNm2", "absolute", "465", "12", "140", "21", null, null, this.div_search);
            obj.set_taborder("4");
            obj.set_inputfilter("space");
            obj.set_lengthunit("ascii");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition03", "absolute", "635", "13", "64", "20", null, null, this.div_search);
            obj.set_taborder("18");
            obj.set_text("차량번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_carNo", "absolute", "719", "13", "140", "21", null, null, this.div_search);
            obj.set_taborder("8");
            obj.set_inputfilter("space");
            obj.set_lengthunit("ascii");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "605", "0", "30", "78", null, null, this.div_search);
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
            obj = new Static("st_searchCondition04", "absolute", "19", "12", "80", "20", null, null, this.div_search);
            obj.set_taborder("23");
            obj.set_text("신청일자");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_AplStart", "absolute", "9.21%", "12", null, "20", "79.61%", null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("24");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_value("null");
            obj = new Static("Static03", "absolute", "859", "8", "30", "78", null, null, this.div_search);
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
            obj = new Combo("cb_dlvStat", "absolute", "976", "13", "136", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("27");
            obj.set_displayrowcount("5");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_innerdataset("ds_C035");
            obj.set_enable("true");
            obj.set_visible("true");
            obj = new Static("st_searchCondition07", "absolute", "890", "46", "80", "20", null, null, this.div_search);
            obj.set_taborder("30");
            obj.set_text("채널");
            obj.set_cssclass("sta_WF_schTitle");
            obj.set_visible("true");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_AplEnd", "absolute", "21.74%", "12", null, "20", "67.08%", null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("33");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Static("Static05", "absolute", "20.48%", "15", null, "18", "78.18%", null, this.div_search);
            obj.set_taborder("34");
            obj.set_text("~");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_ChanCd", "absolute", "976", "45", "136", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("35");
            obj.set_innerdataset("@ds_S030");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj.set_visible("false");

            obj = new Static("Static01", "absolute", "1122", "0", "25", "539", null, null, this);
            obj.set_taborder("1");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "0", "85", "81", "20", null, null, this);
            obj.set_taborder("2");
            obj.set_text("검색결과");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "82", "1147", "10", null, null, this);
            obj.set_taborder("3");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0", "104", "1147", "10", null, null, this);
            obj.set_taborder("4");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "237", "1147", "10", null, null, this);
            obj.set_taborder("5");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "0", "244", "81", "20", null, null, this);
            obj.set_taborder("6");
            obj.set_text("서비스 신청 내용");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "0", "252", "1147", "10", null, null, this);
            obj.set_taborder("8");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Grid("gr_list", "absolute", "0", "114", "1122", "126", null, null, this);
            obj.set_taborder("7");
            obj.set_binddataset("ds_list");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"100\"/><Column size=\"94\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"73\"/><Column size=\"140\"/><Column size=\"60\"/><Column size=\"60\"/><Column size=\"87\"/><Column size=\"90\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"계약번호\"/><Cell col=\"1\" text=\"서비스명\"/><Cell col=\"2\" text=\"고객번호\"/><Cell col=\"3\" text=\"고객명\"/><Cell col=\"4\" text=\"상품코드\"/><Cell col=\"5\" text=\"상품명\"/><Cell col=\"6\" text=\"계약본수\"/><Cell col=\"7\" text=\"계약기간\"/><Cell col=\"8\" text=\"계약일자\"/><Cell col=\"9\" text=\"장착일자\"/><Cell col=\"10\" text=\"차종\"/><Cell col=\"11\" text=\"차량번호\"/><Cell col=\"12\" text=\"상태\"/><Cell col=\"13\" text=\"파손사용횟수\"/><Cell col=\"14\" text=\"조기마모사용횟수\"/><Cell col=\"15\" text=\"걱정제로최초횟수\"/><Cell col=\"16\" text=\"걱정제로사용횟수\"/></Band><Band id=\"body\"><Cell displaytype=\"text\" edittype=\"readonly\" text=\"bind:ordNo\" tooltiptext=\"bind:ordNo\"/><Cell col=\"1\" displaytype=\"combo\" edittype=\"none\" text=\"bind:servCd\" combodataset=\"ds_S044\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"2\" text=\"bind:custNo\" tooltiptext=\"bind:custNo\"/><Cell col=\"3\" edittype=\"normal\" text=\"bind:custNm\" tooltiptext=\"bind:custNm\"/><Cell col=\"4\" edittype=\"normal\" text=\"bind:matCd\"/><Cell col=\"5\" text=\"bind:matNm\" tooltiptext=\"bind:matNm\"/><Cell col=\"6\" text=\"bind:cntCd\" tooltiptext=\"bind:cntCd\"/><Cell col=\"7\" text=\"bind:periodCd\" tooltiptext=\"bind:periodCd\"/><Cell col=\"8\" displaytype=\"date\" text=\"bind:ordDay\"/><Cell col=\"9\" displaytype=\"date\" text=\"bind:procDay\"/><Cell col=\"10\" text=\"bind:modelNm\" tooltiptext=\"bind:modelNm\"/><Cell col=\"11\" text=\"bind:carNo\" tooltiptext=\"bind:carNo\"/><Cell col=\"12\" text=\"bind:dlvstatNm\" tooltiptext=\"bind:dlvstatNm\"/><Cell col=\"13\" text=\"bind:b00012UCnt\"/><Cell col=\"14\" text=\"bind:b00011UCnt\"/><Cell col=\"15\" text=\"bind:b00007ICnt\"/><Cell col=\"16\" text=\"bind:b00007UCnt\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new FileDownload("FileDownload", "absolute", "706", "271", "93", "21", null, null, this);
            obj.set_taborder("15");
            obj.getSetter("retry").set("0");
            obj.set_text("파일다운로드");
            obj.set_visible("false");
            obj.set_enableevent("false");
            this.addChild(obj.name, obj);

            obj = new Button("btn_imgPop", "absolute", "42.55%", "271", null, "20", "51.44%", null, this);
            obj.set_taborder("16");
            obj.set_text("이미지뷰어");
            obj.set_cssclass("btn_WF_CRUD");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1134, 278, this.div_detail,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("13");
            		p.set_scrollbars("none");

            	}
            );
            this.div_detail.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1122, 81, this.div_search,
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
            obj = new Layout("default", "", 1147, 564, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCSEngineOilRepService");
            		p.set_titletext("마모파손 서비스 신청");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item5","div_detail.cb_cnt","value","ds_list","cntNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item16","div_detail.ed_dlvDesc","value","ds_list","dlvDesc");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item7","div_detail.cb_servType","value","ds_list","servCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item3","div_detail.ed_mileage","value","ds_list","cMileage");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item10","div_detail.ed_reqNo","value","ds_list","reqNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item9","div_detail.ed_dlvAddr2","value","ds_list","dlvAddr2");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item8","div_detail.ed_agencyCd","value","ds_list","agencyCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item0","div_detail.ed_agencyNm","value","ds_list","agencyNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item1","div_detail.ed_dlvPosCd","value","ds_list","dlvPosCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item2","div_detail.ed_dlvAddr1","value","ds_list","dlvAddr1");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item4","div_detail.ed_dlvTel","value","ds_list","mobNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item13","div_detail.ed_mileage00","value","ds_list","cMileage");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item14","div_detail.ed_b0011UCnt","value","ds_list","b00011UCnt");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item15","div_detail.ed_mileage01","value","ds_list","cMileage");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item17","div_detail.ed_b0012UCnt","value","ds_list","b00012UCnt");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item18","div_detail.ed_b0011RCnt","value","ds_list","b00011RCnt");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item19","div_detail.ed_b0012RCnt","value","ds_list","b00012RCnt");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item12","div_detail.cb_stat","value","ds_list","dlvStat");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item6","div_detail.cb_cntNm","value","ds_list","cntCd1");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item21","div_detail.ca_dlvrDay","value","ds_list","servRqDay");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item11","div_detail.cb_applyReason","value","ds_list","applyReason");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCSSafeServiceRegister.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCSSafeServiceRegister.xfdl", function() {
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
        this.selectServrqDay	= "";	//D+3일
        this.selectServrqDay_2	= "";   //D+2일

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg){
        	
        	if( nErrorCode < 0 ){
        		alert(strErrorMsg);
        		return;
        	}
        		
        	if( strSvcId == "intiRTCSSafeService" ){	
        		
        		var insert1 = this.ds_C035.insertRow(0);
        		this.ds_C035.setColumn(insert1, "cd", "");
        		this.ds_C035.setColumn(insert1, "cdNm", "전체");
        		
        		var insert2 = this.ds_S030.insertRow(0);		
        		this.ds_S030.setColumn(insert2, "cd", "");
        		this.ds_S030.setColumn(insert2, "cdNm", "전체");
        		
        		this.ds_S044.filter("cd == 'B00011' || cd == 'B00012'");
        		
        		//this.div_search.cal_AplStart.set_value(this.toDay);
        		//this.div_search.cal_AplEnd.set_value(this.toDay);

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
        			sArgs += Ex.util.setParam("term", "2");
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
        			//본수세팅
        //			this.ds_S089.clearData();
        			
        // 			var kwmeng = this.ds_list.getColumn(this.ds_list.rowposition, "basicServCntr");
        // 			var idx = 0;
        // 			for(var i=0; i<kwmeng; i++){
        // 				idx = this.ds_S089.addRow();
        // 				this.ds_S089.setColumn(idx, "cd", i+1);
        // 				this.ds_S089.setColumn(idx, "cdNm", (i+1) + "본");
        // 			}
        			
         			this.ds_list_canrowposchange();
         			this.ds_list_onrowposchanged();			
        			
        			//image 리스트 조회
        			this.fn_getImgList();							
        		}
        	}
        	
        	if( strSvcId == "selectRTCSSafeImgList" ){	
        		this.fn_makeSms();
        	}
        	
        	if( strSvcId == "saveRTCSSafeSer" ){		
        		if( nErrorCode < 0 ){
        			this.alert(strErrorMsg);
        		}else{
        			this.alert("저장되었습니다.");
        			this.fn_search();
        		}
        	}
        	
        	if( strSvdId == "sendURLInfo"){
        		this.alert("URL전송이 완료되었습니다.");
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
        	sOutDatasets += " ds_S044=mapDsS044 ";
        	sOutDatasets += " ds_S305=mapDsS305 ";
        	sOutDatasets += " ds_S030=mapDsS030 ";
        	sOutDatasets += " ds_S089=mapDsS089 ";
        	sOutDatasets += " ds_C035=mapDsC035 ";
        	sOutDatasets += " ds_C036=mapDsC036 ";

        
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
        	var custNo 	= nvl(this.div_search.ed_custNo.value);
        	var ordNo  	= nvl(this.div_search.ed_ordNo.value);
        	var custNm 	= nvl(this.div_search.ed_custNm2.value);
        	var carNo  	= nvl(this.div_search.ed_carNo.value);
        	var mobNo  	= FN_numberHyphenOut(nvl(this.div_search.ed_mobNo.value));
        	var aplStrDay = nvl(this.div_search.cal_AplStart.value);
        	var aplEndDay = nvl(this.div_search.cal_AplEnd.value);
        	var chanCd = nvl(this.div_search.cb_ChanCd.value);
        	var dlvStat = nvl(this.div_search.cb_dlvStat.value);
        	
        	if ( (custNo == "" || custNo == null )&& (ordNo == "" || ordNo == null)&&( custNm == "" || custNm == null )&&
        	 (carNo == "" || carNo == null ) && ( mobNo == "" || mobNo== null) && ( aplStrDay == "" || aplStrDay== null) && 
        	 (aplEndDay == "" || aplEndDay== null) && ( chanCd == "" || chanCd== null)) {
        		alert("조회조건을 입력해주세요"); 			return;
        	}
        	
        	if( (custNm  != "" && mobNo == "") || (custNm  != "" && mobNo == "")){
        		alert("휴대폰번호 혹은 차량번호를 입력해주세요"); 			return;
        	}
        	
        	
        		var sSvcID        	= "selectRTCSSafeService";
        		var sController   	= "rtms/cs/selectRTCSSafeServiceRegister.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_list=mapDsList";
        		var sArgs 			= "";
        		var fn_callBack		= "fn_callBack";
        		
        		sArgs += Ex.util.setParam("custNo", custNo);
        		sArgs += Ex.util.setParam("ordNo", 	ordNo);
        		sArgs += Ex.util.setParam("custNm", custNm);
        		sArgs += Ex.util.setParam("carNo", 	carNo);
        		sArgs += Ex.util.setParam("mobNo", 	mobNo);
        		sArgs += Ex.util.setParam("dlvrDayF",aplStrDay);
        		sArgs += Ex.util.setParam("dlvrDayT",aplEndDay);
        		sArgs += Ex.util.setParam("chanCd",chanCd);
        		sArgs += Ex.util.setParam("dlvStat",dlvStat);
        		
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
        	var dlvrDay 	= nvl(this.ds_list.getColumn(saveRow, "dlvrDay"));						//신청일자
        	var dlvrType 	= nvl(this.ds_list.getColumn(saveRow, "dlvrType"));						//서비스유형
        	var dlvrSeq		= nvl(this.ds_list.getColumn(saveRow, "dlvrSeq"));						//신청순번
        	var servOrgCd   = nvl(this.ds_list.getOrgColumn(saveRow, "servCd"));				    //서비스코드
        	var servCd 		= nvl(this.ds_list.getColumn(saveRow, "servCd"));						//서비스코드
        	var custNo 		= nvl(this.ds_list.getColumn(saveRow, "custNo"));						//고객번호
        	var custNm		= nvl(this.ds_list.getColumn(saveRow, "custNm"));						//고객명
        	var dlvTel 		= FN_numberHyphenOut(nvl(this.ds_list.getColumn(saveRow, "dlvTel")));	//연락처
        	var agencyCd 	= nvl(this.ds_list.getColumn(saveRow, "agencyCd"));						//대리점코드
        	var matCd		= nvl(this.ds_list.getColumn(saveRow, "matCd"));						//제품코드
        	var dlvStat		= nvl(this.ds_list.getOrgColumn(saveRow, "dlvStat")); 						//신청상태
        	var dlvDesc		= nvl(this.ds_list.getColumn(saveRow, "dlvDesc"));						//요청사항
        	var carNo		= nvl(this.ds_list.getColumn(saveRow, "carNo"));						//차량번호
        	var cMileage    = nvl(this.ds_list.getColumn(saveRow, "cMileage"));						//주행거리
        	var cntCd      	= nvl(this.div_detail.cb_cntNm.value);									//본수코드
        	var cntCd1      = nvl(this.ds_list.getColumn(saveRow, "cntCd1"));						//신청가능한 본수
        	var dlvPosCd    = nvl(this.ds_list.getColumn(saveRow, "dlvPosCd"));						//우편번호
        	var dlvAddr1    = nvl(this.ds_list.getColumn(saveRow, "dlvAddr1"));						//주소
        	var dlvAddr2    = nvl(this.ds_list.getColumn(saveRow, "dlvAddr2"));						//상세주소
        	var servRqDay   = nvl(this.div_detail.ca_dlvrDay.value);								//신청요청일자
        	var dlvrYn		= nvl(this.ds_list.getColumn(saveRow, "dlvrYn"));						//저장 or 업데이트
        	var servAdSeq	= nvl(this.ds_list.getColumn(saveRow, "servAdSeq"));					//부여순번
        	var dlvStatNew  = nvl(this.ds_list.getColumn(saveRow, "dlvStat")); 						//신청상태
        	var applyReason	= nvl(this.ds_list.getColumn(saveRow, "applyReason")); 					//신청사유
        	var mfpYn		= nvl(this.ds_list.getColumn(saveRow, "mfpYn")); 						//중도완납여부
        		
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
        		if(userId != "10135008" && userId != "10244015"){
        			alert("렌탈계약이 종료된 고객은 서비스를 신청 할 수 없습니다.\n 서비스신청문의는 관리자에게 문의해주세요.");
        			return;
        		}
        	}
        	
        	if(mfpYn == "Y"){
        		if(userId != "10135008" && userId != "10244015"){
        			alert("중도완납/해지된 고객은 서비스를 신청 할 수 없습니다.\n 서비스신청문의는 관리자에게 문의해주세요.");
        			return;
        		}
        	}
        	//----------------------------------------------------------------------------------------------------------------------------------
        	
        	if( ordNo == "" ){ 													alert("계약번호"+msg);				return false;
        	}else if( (servAdSeq == "0") && (dlvStat == "") ){					alert("접수내역이 존재하지 않습니다.."); return false;
        	}else if( (dlvStat != "01") && (dlvStat != "") & (dlvStat != "00") ){ alert("요청접수상태가 아니므로 저장할 수가 없습니다."); return false;
        	}else if( cntCd1 == "0" ){ 											alert("신청가능한 서비스횟수가 존재하지 않습니다."); return false;
        	}else if( this.FN_stringByteLength(dlvDesc) > 300){					alert("배송시 요청사항 크기가 300byte를 초과했습니다.\n한글일경우 150자, 영문일경우 300자 입니다."); return false;
        	/*}else if( this.ds_imgList.rowcount == 0){							alert("첨부이미지가 존재하지 않습니다."); return false;*/
        	}else{

        		this.ds_save.clearData();
        		var nRowSave = this.ds_save.insertRow(0);
        		this.ds_save.setColumn(nRowSave, "dlvrDay", 	dlvrDay);
        		this.ds_save.setColumn(nRowSave, "dlvrSeq", 	dlvrSeq);
        		this.ds_save.setColumn(nRowSave, "dlvrType", 	dlvrType);
        		this.ds_save.setColumn(nRowSave, "ordNo",		ordNo);
        		this.ds_save.setColumn(nRowSave, "servOrgCd",	servOrgCd);
        		this.ds_save.setColumn(nRowSave, "servCd",		servCd);
        		this.ds_save.setColumn(nRowSave, "custNo", 		custNo);
        		this.ds_save.setColumn(nRowSave, "custNm", 		custNm);
        		this.ds_save.setColumn(nRowSave, "agencyCd", 	agencyCd);
        		this.ds_save.setColumn(nRowSave, "matnr", 		matCd);		
        		this.ds_save.setColumn(nRowSave, "kwmeng", 		cntCd);	
        		this.ds_save.setColumn(nRowSave, "servRqDay", 	servRqDay);					
        		//this.ds_save.setColumn(nRowSave, "procDay", 	procDay);	
        		//[20221013_1] kstka 장착일자 데이터를 화면 인입 데이터로 변경
        		this.ds_save.setColumn(nRowSave, "procDay", 	servRqDay);					
        		this.ds_save.setColumn(nRowSave, "servAdSeq", 	servAdSeq);					
        		this.ds_save.setColumn(nRowSave, "dlvStat", 	dlvStat);           
        		this.ds_save.setColumn(nRowSave, "dlvDesc", 	dlvDesc);
        		this.ds_save.setColumn(nRowSave, "carNo", 		carNo);
        		this.ds_save.setColumn(nRowSave, "dlvTel", 		dlvTel);
        		this.ds_save.setColumn(nRowSave, "cMileage", 	cMileage);
        		this.ds_save.setColumn(nRowSave, "dlvPosCd", 	dlvPosCd);
        		this.ds_save.setColumn(nRowSave, "dlvAddr1", 	dlvAddr1);
        		this.ds_save.setColumn(nRowSave, "dlvAddr2", 	dlvAddr2);
        		this.ds_save.setColumn(nRowSave, "cntCd1", 		cntCd);
        		this.ds_save.setColumn(nRowSave, "servRqDay", 	servRqDay);
        		this.ds_save.setColumn(nRowSave, "applyReason", applyReason);
        		
        		this.ds_save.set_updatecontrol(false);
        		if( dlvrYn == "N"){
        			this.ds_save.setRowType(nRowSave, 2);
        			this.ds_save.setColumn(nRowSave, "dlvStat", 	"00");
        		}else{
        			this.ds_save.setRowType(nRowSave, 4);
        			this.ds_save.setColumn(nRowSave, "dlvStat", 	dlvStatNew);
        		}
        		this.ds_save.set_updatecontrol(true);
        		//===========================================================================================
        		
        		if( confirm( "저장하시겠습니까?" ) ){
        			var sSvcID        	= "saveRTCSSafeSer"; 
        			var sController   	= "rtms/cs/saveRTCSSafeRegister.do";
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
        	var cMileage    = nvl(this.ds_list.getColumn(saveRow, "cMileage"));						//신청 타이어 본수
        	var kmweng      = nvl(this.ds_list.getColumn(saveRow, "kmweng"));						//신청 타이어 본수
        	var dlvPosCd    = nvl(this.ds_list.getColumn(saveRow, "dlvPosCd"));						//신청 타이어 본수
        	var dlvAddr1    = nvl(this.ds_list.getColumn(saveRow, "dlvAddr1"));						//신청 타이어 본수
        	var dlvAddr2    = nvl(this.ds_list.getColumn(saveRow, "dlvAddr2"));						//신청 타이어 본수
        	var servRqDay   = nvl(this.ds_list.getColumn(saveRow, "servRqDay"));					//신청 타이어 본수
        	var dlvrDay     = nvl(this.ds_list.getColumn(saveRow, "dlvrDay"));
        	var applyReason  = nvl(this.ds_list.getColumn(saveRow, "applyReason")); 				//신청사유
        	
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
        	this.ds_save.setColumn(nRowSave, "dlvPosCd", 	dlvPosCd);
        	this.ds_save.setColumn(nRowSave, "dlvAddr1", 	dlvAddr1);
        	this.ds_save.setColumn(nRowSave, "dlvAddr2", 	dlvAddr2);
        	this.ds_save.setColumn(nRowSave, "cntCd1", 		kwmeng);
        	this.ds_save.setColumn(nRowSave, "servRqDay", 	servRqDay);
        	this.ds_save.setColumn(nRowSave, "applyReason", applyReason);
        	
        	this.ds_save.set_updatecontrol(false);
        	this.ds_save.setRowType(nRowSave, 8);
        	this.ds_save.set_updatecontrol(true);	
        	//===========================================================================================
        		
        	if( confirm( "삭제하시겠습니까?" ) ){
        		var sSvcID        	= "saveRTCSSafeSer"; 
        		var sController   	= "rtms/cs/saveRTCSSafeRegister.do";
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
        		this.div_detail.cb_stat.set_enable(true);
        		this.div_detail.cb_cntNm.set_enable(true);
        		this.div_detail.ca_dlvrDay.set_enable(true);
        		this.div_detail.cb_servType.set_enable(true);
        		
        		this.div_detail.ca_dlvrDay.set_value(this.selectServrqDay_2);
        		
        		this.ds_list.set_updatecontrol(false);
        		this.ds_list.setRowType(nRow, Dataset.ROWTYPE_NORMAL);
        		this.ds_list.set_updatecontrol(true);
        	}else if(dlvStat == "00"){
        		this.div_detail.cb_stat.set_enable(true);
        		this.div_detail.cb_cntNm.set_enable(true);
        		this.div_detail.ca_dlvrDay.set_enable(true);
        		this.div_detail.cb_servType.set_enable(false);
        		this.div_detail.set_enable(true);		
        	}else if(dlvStat == "01"){
        		this.div_detail.cb_stat.set_enable(false);
        		this.div_detail.cb_cntNm.set_enable(false);
        		this.div_detail.ca_dlvrDay.set_enable(false);
        		this.div_detail.cb_servType.set_enable(false);
        		this.div_detail.set_enable(true);
        	}else{
        		this.div_detail.ca_dlvrDay.set_enable(false);
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

        this.div_search_btn_custPopUp_onclick = function(obj,e)
        {
        	var args ={p_arg : this.p_arg};
        	Ex.core.popup(this,"고객찾기","comm::RTCOMMCust_pop.xfdl",args, "modaless=false");
        }
        this.returnCustInfo = function(res){
        	this.div_search.ed_custNo.set_value( res[0].getColumn(0, "custNo") );
        	this.div_search.ed_custNm.set_value( res[0].getColumn(0, "custNm") );
        }
        this.div_search_btn_custPopUp00_onclick = function(obj,e)
        {
        	var args ={ p_arg : this.p_arg };
        	Ex.core.popup(this,"계약번호 조회","comm::RTCOMMOrderNo_pop.xfdl",args, "modaless=false");
        }
        this.returnOrderNoInfo = function(res){
        	this.div_search.ed_ordNo.set_value( res[0].getColumn(0, "ordNo") );
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

        this.div_cust_btn_postSearch1_onclick = function(obj,e){
        	var sOpYn = "";
        	var args  = "";
        	
        	if(this.userGrp == "05") {//대리점의 경우 온라인 장착점 여부와 상관 없이 조회
        		sOpYn = "";
        	} else {
        		sOpYn = "Y";
        	}
        	
        	args = {  p_arg		: "RTCSZeroRepService"
        			, p_opYn	: sOpYn
        			, p_vkgrpNm	: this.div_detail.ed_agencyNm.value
        		   };
        	
        	Ex.core.popup(this, "대리점 조회", "comm::RTCOMMAgency_pop.xfdl", args, "modaless=false");
        }

        this.returnAgencyCd = function(res) {

        	this.div_detail.ed_agencyCd.set_value( res[0] );
        	this.div_detail.ed_agencyNm.set_value( res[1] );
        	this.div_detail.ed_dlvPosCd.set_value(res[3]);
        	this.div_detail.ed_dlvAddr1.set_value(res[4]);
        	this.div_detail.ed_dlvAddr2.set_value(res[5]);	
        }

        this.div_detail_ca_dlvrDay_onchanged = function(obj,e)
        {
        	if( this.div_detail.ca_dlvrDay.value < this.selectServrqDay_2 ){
        		var yyyy = Eco.date.addDate( this.toDay, 2).substr(0,4);
        		var mm = Eco.date.addDate( this.toDay, 2).substr(4,2);
        		var dd = Eco.date.addDate( this.toDay, 2).substr(6,2);
        		alert( yyyy+"-"+mm+"-"+dd + " 이후 예정일만 선택가능합니다." );
        		this.div_detail.ca_dlvrDay.set_value( Eco.date.addDate( this.toDay, 2) );
        		this.ds_list.setColumn( this.ds_list.rowposition, "servrqDay", yyyy+mm+dd );
        	}
        }

        this.div_detail_btn_url_onclick = function(obj,e)
        {
        	var curDate = new Date();
        	var hour = "00";
        	var min = "00";
        	var sec = "00";
        	
        	var servCd = this.ds_list.getColumn(this.ds_list.rowposition, "servCd");
        	var ordNo = this.ds_list.getColumn(this.ds_list.rowposition, "ordNo");
        	
        	//SMS문구
        	var smsText = this.div_detail.ed_SmsText.value;
        	
        	var sndMsgText = "고객님, 넥스트레벨 타이어렌탈 서비스를 이용해 주시어 진심으로 감사드립니다.";
        		sndMsgText += "\n보증서비스 신청을 위하여 아래 URL을 눌러 사진을 첨부해주세요.";
        		
        // 		if(servCd == "B00011"){ //조기마모파손보증
        // 			sndMsgText += "\n(URL주소: https://m.nexen-nextlevel.com/mypage/earlyAbrasionSrvCreUpload?ordNo" + escape("=") + ordNo + ")";
        // 		}else{
        			sndMsgText += "\n(URL주소: https://m.nexen-nextlevel.com/mypage/newFreeDamageSrvCreUpload?ordNo" + escape("=") + ordNo + ")";
        //		}
        		
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

        this.div_detail_btn_upload_onclick = function(obj,e)
        {
        	var ordNo 		= nvl(this.ds_list.getColumn(this.ds_list.rowposition, "ordNo"));
        	var dlvrType  	= nvl(this.ds_list.getColumn(this.ds_list.rowposition, "dlvrType"));
        	var servCd 		= nvl(this.ds_list.getColumn(this.ds_list.rowposition, "servCd"));
        	var dlvrSeq  	= nvl(this.ds_list.getColumn(this.ds_list.rowposition, "dlvrSeq"));
        	
        	var args ={ p_arg 		: this.p_arg
        			  , p_ordNo		: ordNo
        			  , p_dlvrType	: dlvrType
        			  , p_servCd	: servCd
        			  , p_dlvrSeq	: dlvrSeq
        			  };
        	Ex.core.popup(this,"파일업로드","comm::RTCOMMUploadImg_pop.xfdl",args, "modaless=false");
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
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.ds_list.addEventHandler("canrowposchange", this.ds_list_canrowposchange, this);
            this.ds_list.addEventHandler("onrowposchanged", this.ds_list_onrowposchanged, this);
            this.ds_S044.addEventHandler("canrowposchange", this.ds_list_canrowposchange, this);
            this.ds_S044.addEventHandler("onrowposchanged", this.ds_list_onrowposchanged, this);
            this.ds_imgList.addEventHandler("canrowposchange", this.ds_list_canrowposchange, this);
            this.ds_imgList.addEventHandler("onrowposchanged", this.ds_list_onrowposchanged, this);
            this.ds_S305.addEventHandler("canrowposchange", this.ds_list_canrowposchange, this);
            this.ds_S305.addEventHandler("onrowposchanged", this.ds_list_onrowposchanged, this);
            this.ds_S306.addEventHandler("canrowposchange", this.ds_list_canrowposchange, this);
            this.ds_S306.addEventHandler("onrowposchanged", this.ds_list_onrowposchanged, this);
            this.ds_S030.addEventHandler("canrowposchange", this.ds_list_canrowposchange, this);
            this.ds_S030.addEventHandler("onrowposchanged", this.ds_list_onrowposchanged, this);
            this.ds_C035.addEventHandler("canrowposchange", this.ds_list_canrowposchange, this);
            this.ds_C035.addEventHandler("onrowposchanged", this.ds_list_onrowposchanged, this);
            this.ds_C036.addEventHandler("canrowposchange", this.ds_list_canrowposchange, this);
            this.ds_C036.addEventHandler("onrowposchanged", this.ds_list_onrowposchanged, this);
            this.addEventHandler("onload", this.RTCSSafeServiceApply_onload, this);
            this.div_detail.ed_dlvDesc.addEventHandler("oneditclick", this.div_detail_ed_dlvDesc_oneditclick, this);
            this.div_detail.btn_url.addEventHandler("onclick", this.div_detail_btn_url_onclick, this);
            this.div_detail.btn_img.addEventHandler("onclick", this.div_detail_btn_img_onclick, this);
            this.div_detail.ca_dlvrDay.addEventHandler("onchanged", this.div_detail_ca_dlvrDay_onchanged, this);
            this.div_detail.ed_dlvAddr2.addEventHandler("onkeyup", this.div_detail_ed_dlvTel_onkeyup, this);
            this.div_detail.bt_agency.addEventHandler("onclick", this.div_cust_btn_postSearch1_onclick, this);
            this.div_detail.ed_dlvPosCd.addEventHandler("onkeyup", this.div_detail_ed_dlvTel_onkeyup, this);
            this.div_detail.ed_dlvAddr1.addEventHandler("onkeyup", this.div_detail_ed_dlvTel_onkeyup, this);
            this.div_detail.ed_dlvTel.addEventHandler("onkeyup", this.div_detail_ed_dlvTel_onkeyup, this);
            this.div_detail.gr_imgList.addEventHandler("oncellclick", this.gr_imgList_oncellclick, this);
            this.div_detail.btn_upload.addEventHandler("onclick", this.div_detail_btn_upload_onclick, this);
            this.div_search.btn_custPopUp.addEventHandler("onclick", this.div_search_btn_custPopUp_onclick, this);
            this.div_search.ed_ordNo.addEventHandler("onkeydown", this.div_search_ed_ordNo_onkeydown, this);
            this.div_search.btn_custPopUp00.addEventHandler("onclick", this.div_search_btn_custPopUp00_onclick, this);
            this.div_search.ed_mobNo.addEventHandler("onkeyup", this.div_search_ed_mobNo_onkeyup, this);
            this.div_search.cal_AplStart.addEventHandler("oneditclick", this.div_search_cal_AplStart_oneditclick, this);
            this.div_search.cal_AplEnd.addEventHandler("oneditclick", this.div_search_cal_AplStart_oneditclick, this);
            this.gr_list.addEventHandler("oncellclick", this.gr_list_oncellclick, this);
            this.btn_imgPop.addEventHandler("onclick", this.btn_imgPop_onclick, this);

        };

        this.loadIncludeScript("RTCSSafeServiceRegister.xfdl");

       
    };
}
)();
