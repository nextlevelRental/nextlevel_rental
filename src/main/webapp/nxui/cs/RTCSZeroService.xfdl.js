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
                this.set_name("RTCSZeroRepService");
                this.set_classname("RTCSEngineOilRepService");
                this.set_titletext("걱정제로 서비스 신청");
                this._setFormPosition(0,0,1147,602);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_S089", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_list", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"periodCd\" type=\"STRING\" size=\"256\"/><Column id=\"makerCd\" type=\"STRING\" size=\"256\"/><Column id=\"makerNm\" type=\"STRING\" size=\"256\"/><Column id=\"modelCd\" type=\"STRING\" size=\"256\"/><Column id=\"modelNm\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"carOwner\" type=\"STRING\" size=\"256\"/><Column id=\"servCnt0\" type=\"STRING\" size=\"256\"/><Column id=\"ordDay\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"dlvrYn\" type=\"STRING\" size=\"256\"/><Column id=\"dlvrDay\" type=\"STRING\" size=\"256\"/><Column id=\"dlvrSeq\" type=\"STRING\" size=\"256\"/><Column id=\"agencyCd\" type=\"STRING\" size=\"256\"/><Column id=\"agencyNm\" type=\"STRING\" size=\"256\"/><Column id=\"servrqDay\" type=\"STRING\" size=\"256\"/><Column id=\"dlvposCd\" type=\"STRING\" size=\"256\"/><Column id=\"dlvAddr1\" type=\"STRING\" size=\"256\"/><Column id=\"dlvTel\" type=\"STRING\" size=\"256\"/><Column id=\"dlvDesc\" type=\"STRING\" size=\"256\"/><Column id=\"dlvStat\" type=\"STRING\" size=\"256\"/><Column id=\"dlvstatNm\" type=\"STRING\" size=\"256\"/><Column id=\"apprAmt\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd1\" type=\"STRING\" size=\"256\"/><Column id=\"cntNm\" type=\"STRING\" size=\"256\"/><Column id=\"servCnt00\" type=\"STRING\" size=\"256\"/><Column id=\"reqNo\" type=\"STRING\" size=\"256\"/><Column id=\"o2oYn\" type=\"STRING\" size=\"256\"/><Column id=\"instCd\" type=\"STRING\" size=\"256\"/><Column id=\"tmsOrderId\" type=\"STRING\" size=\"256\"/><Column id=\"instTm\" type=\"STRING\" size=\"256\"/><Column id=\"omsOrderNo\" type=\"STRING\" size=\"256\"/><Column id=\"dlvGb\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_save", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"dlvrDay\" type=\"STRING\" size=\"256\"/><Column id=\"dlvrSeq\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"agencyCd\" type=\"STRING\" size=\"256\"/><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd1\" type=\"STRING\" size=\"256\"/><Column id=\"servrqDay\" type=\"STRING\" size=\"256\"/><Column id=\"servSeq\" type=\"STRING\" size=\"256\"/><Column id=\"addr1\" type=\"STRING\" size=\"256\"/><Column id=\"dlvTel\" type=\"STRING\" size=\"256\"/><Column id=\"dlvDesc\" type=\"STRING\" size=\"256\"/><Column id=\"dlvStat\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"smsMsg\" type=\"STRING\" size=\"256\"/><Column id=\"instCd\" type=\"STRING\" size=\"256\"/><Column id=\"tmsOrderId\" type=\"STRING\" size=\"256\"/><Column id=\"instTm\" type=\"STRING\" size=\"256\"/><Column id=\"dlvGb\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_C024", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_Holiday", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"HLDYDATE\" type=\"STRING\" size=\"256\"/><Column id=\"TEXTCOLOR\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"HLDYDATE\">20190912</Col><Col id=\"TEXTCOLOR\">red</Col></Row><Row><Col id=\"HLDYDATE\">20190913</Col><Col id=\"TEXTCOLOR\">red</Col></Row><Row><Col id=\"HLDYDATE\">20190914</Col><Col id=\"TEXTCOLOR\">red</Col></Row><Row><Col id=\"HLDYDATE\">20190915</Col><Col id=\"TEXTCOLOR\">red</Col></Row><Row><Col id=\"HLDYDATE\">20190916</Col><Col id=\"TEXTCOLOR\">red</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_rtsd0213", this);
            obj._setContents("<ColumnInfo><Column id=\"rentIfCntrNo\" type=\"STRING\" size=\"256\"/><Column id=\"ordDe\" type=\"STRING\" size=\"256\"/><Column id=\"saleTyCd\" type=\"STRING\" size=\"256\"/><Column id=\"rentIfReqSn\" type=\"STRING\" size=\"256\"/><Column id=\"rentIfBfistSeCd\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"iplMobNo\" type=\"STRING\" size=\"256\"/><Column id=\"iplTelNo\" type=\"STRING\" size=\"256\"/><Column id=\"istBpCd\" type=\"STRING\" size=\"256\"/><Column id=\"itemCd\" type=\"STRING\" size=\"256\"/><Column id=\"ordQy\" type=\"STRING\" size=\"256\"/><Column id=\"dlvTyDtlCd\" type=\"STRING\" size=\"256\"/><Column id=\"istReqDe\" type=\"STRING\" size=\"256\"/><Column id=\"pickupZip\" type=\"STRING\" size=\"256\"/><Column id=\"pickupBassAddr\" type=\"STRING\" size=\"256\"/><Column id=\"pickupDtlAddr\" type=\"STRING\" size=\"256\"/><Column id=\"iplZip\" type=\"STRING\" size=\"256\"/><Column id=\"iplAddr\" type=\"STRING\" size=\"256\"/><Column id=\"iplDtlAddr\" type=\"STRING\" size=\"256\"/><Column id=\"regUsrId\" type=\"STRING\" size=\"256\"/><Column id=\"ordRsn\" type=\"STRING\" size=\"256\"/><Column id=\"sendURL\" type=\"STRING\" size=\"256\"/><Column id=\"o2oYn\" type=\"STRING\" size=\"256\"/><Column id=\"opertSts\" type=\"STRING\" size=\"256\"/><Column id=\"opertDe\" type=\"STRING\" size=\"256\"/><Column id=\"drgMil\" type=\"STRING\" size=\"256\"/><Column id=\"resultData\" type=\"STRING\" size=\"256\"/><Column id=\"city\" type=\"STRING\" size=\"256\"/><Column id=\"county\" type=\"STRING\" size=\"256\"/><Column id=\"dong\" type=\"STRING\" size=\"256\"/><Column id=\"period\" type=\"STRING\" size=\"256\"/><Column id=\"basementPsbYn\" type=\"STRING\" size=\"256\"/><Column id=\"wheelAlignment\" type=\"STRING\" size=\"256\"/><Column id=\"tmplCd\" type=\"STRING\" size=\"256\"/><Column id=\"omsOrderNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_procType", this);
            obj._setContents("<ColumnInfo><Column id=\"procType\" type=\"STRING\" size=\"256\"/><Column id=\"procTypeNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"procType\">1010</Col><Col id=\"procTypeNm\">방문</Col></Row><Row><Col id=\"procType\">1030</Col><Col id=\"procTypeNm\">전문점</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_baseType", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cd\">N</Col><Col id=\"cdNm\">지상</Col></Row><Row><Col id=\"cd\">Y</Col><Col id=\"cdNm\">지하</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_time", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_timeType", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cd\">AM</Col><Col id=\"cdNm\">오전</Col></Row><Row><Col id=\"cd\">PM</Col><Col id=\"cdNm\">오후</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_tms", this);
            obj._setContents("<ColumnInfo><Column id=\"sendURL\" type=\"STRING\" size=\"256\"/><Column id=\"reqDt\" type=\"STRING\" size=\"256\"/><Column id=\"city\" type=\"STRING\" size=\"256\"/><Column id=\"county\" type=\"STRING\" size=\"256\"/><Column id=\"dong\" type=\"STRING\" size=\"256\"/><Column id=\"bhfType\" type=\"STRING\" size=\"256\"/><Column id=\"period\" type=\"STRING\" size=\"256\"/><Column id=\"address\" type=\"STRING\" size=\"256\"/><Column id=\"basementPsbYn\" type=\"STRING\" size=\"256\"/><Column id=\"wheelAlignment\" type=\"STRING\" size=\"256\"/><Column id=\"orderType\" type=\"STRING\" size=\"256\"/><Column id=\"totQty\" type=\"STRING\" size=\"256\"/><Column id=\"itemList\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_tmsItem", this);
            obj._setContents("<ColumnInfo><Column id=\"itemCd\" type=\"STRING\" size=\"256\"/><Column id=\"reqQy\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_orderId", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_schedule", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_agency", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_o2oAgencyInfo", this);
            obj._setContents("<ColumnInfo><Column id=\"bhfCd\" type=\"STRING\" size=\"256\"/><Column id=\"wrhCd\" type=\"STRING\" size=\"256\"/><Column id=\"bpCd\" type=\"STRING\" size=\"256\"/><Column id=\"orgzNm\" type=\"STRING\" size=\"256\"/><Column id=\"zip\" type=\"STRING\" size=\"256\"/><Column id=\"bassAddr\" type=\"STRING\" size=\"256\"/><Column id=\"dtlAddr\" type=\"STRING\" size=\"256\"/><Column id=\"saleGrpCd\" type=\"STRING\" size=\"256\"/><Column id=\"saleOffice\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_C039", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cd\">01</Col><Col id=\"cdNm\">장착</Col></Row><Row><Col id=\"cd\">02</Col><Col id=\"cdNm\">수령</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_controlAuth", this);
            obj._setContents("<ColumnInfo><Column id=\"mdlCd\" type=\"STRING\" size=\"256\"/><Column id=\"prgmCd\" type=\"STRING\" size=\"256\"/><Column id=\"controlId\" type=\"STRING\" size=\"256\"/><Column id=\"userGrp\" type=\"STRING\" size=\"256\"/><Column id=\"userId\" type=\"STRING\" size=\"256\"/><Column id=\"typeCd\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static06", "absolute", "0", "439", "561", "31", null, null, this);
            obj.set_taborder("12");
            obj.set_cssclass("sta_WF_detailLabel2");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Div("div_detail", "absolute", "0", "289", "1134", "253", null, null, this);
            obj.set_taborder("9");
            obj.set_scrollbars("none");
            this.addChild(obj.name, obj);
            obj = new Static("Static34", "absolute", "0", "60", "1122", "31", null, null, this.div_detail);
            obj.set_taborder("62");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("Static26", "absolute", "0", "30", "1122", "31", null, null, this.div_detail);
            obj.set_taborder("74");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("st_agency", "absolute", "840", "60", "130", "31", null, null, this.div_detail);
            obj.set_taborder("65");
            obj.set_text("교체점코드");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_detail.addChild(obj.name, obj);
            obj = new Edit("ed_agencyCd", "absolute", "974", "65", "71", "21", null, null, this.div_detail);
            obj.set_taborder("66");
            obj.set_enable("false");
            this.div_detail.addChild(obj.name, obj);
            obj = new Edit("ed_agencyNm", "absolute", "1045", "65", "71", "21", null, null, this.div_detail);
            obj.set_taborder("88");
            obj.set_enable("false");
            this.div_detail.addChild(obj.name, obj);
            obj = new Button("bt_agency", "absolute", "1025", "65", "20", "21", null, null, this.div_detail);
            obj.set_taborder("89");
            obj.set_cssclass("btn_WF_edtSch");
            obj.set_enable("false");
            obj.getSetter("domainId").set("nexa.save");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("st_modelNm", "absolute", "0", "60", "130", "31", null, null, this.div_detail);
            obj.set_taborder("63");
            obj.set_text("차종");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_detail.addChild(obj.name, obj);
            obj = new Edit("ed_modelNm", "absolute", "134", "65", "142", "21", null, null, this.div_detail);
            obj.set_taborder("64");
            obj.set_enable("false");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "0", "90", "561", "31", null, null, this.div_detail);
            obj.set_taborder("67");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("st_carNo", "absolute", "0", "90", "130", "31", null, null, this.div_detail);
            obj.set_taborder("68");
            obj.set_text("차량 No");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_detail.addChild(obj.name, obj);
            obj = new Edit("ed_carNo", "absolute", "134", "95", "142", "21", null, null, this.div_detail);
            obj.set_taborder("69");
            obj.set_enable("false");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("Static24", "absolute", "0", "0", "561", "31", null, null, this.div_detail);
            obj.set_taborder("70");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("Static25", "absolute", "560", "0", "562", "31", null, null, this.div_detail);
            obj.set_taborder("71");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("Static20", "absolute", "12", "5", "200", "21", null, null, this.div_detail);
            obj.set_taborder("72");
            obj.set_text("차량 정보");
            obj.set_cssclass("Guide_title");
            obj.style.set_font("bold 10 dotum");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("Static23", "absolute", "572", "5", "200", "21", null, null, this.div_detail);
            obj.set_taborder("73");
            obj.set_text("배송지정보");
            obj.set_cssclass("Guide_title");
            obj.style.set_font("bold 10 dotum");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("st_makerNm", "absolute", "0", "30", "130", "31", null, null, this.div_detail);
            obj.set_taborder("75");
            obj.set_text("제조사");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_detail.addChild(obj.name, obj);
            obj = new Edit("ed_makerNm", "absolute", "134", "35", "142", "21", null, null, this.div_detail);
            obj.set_taborder("76");
            obj.set_enable("false");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("Static10", "absolute", "0", "120", "561", "31", null, null, this.div_detail);
            obj.set_taborder("78");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("st_carOwner", "absolute", "0", "120", "130", "31", null, null, this.div_detail);
            obj.set_taborder("79");
            obj.set_text("차량 소유자");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_detail.addChild(obj.name, obj);
            obj = new Edit("ed_carOwner", "absolute", "134", "125", "142", "21", null, null, this.div_detail);
            obj.set_taborder("80");
            obj.set_enable("false");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("Static11", "absolute", "560", "120", "562", "31", null, null, this.div_detail);
            obj.set_taborder("81");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("st_addr", "absolute", "560", "120", "130", "31", null, null, this.div_detail);
            obj.set_taborder("82");
            obj.set_text("주소");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.div_detail.addChild(obj.name, obj);
            obj = new Edit("ed_dlvAddr1", "absolute", "694", "125", "423", "21", null, null, this.div_detail);
            obj.set_taborder("83");
            obj.set_maxlength("6");
            obj.set_enable("false");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("Static13", "absolute", "560", "180", "562", "50", null, null, this.div_detail);
            obj.set_taborder("84");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("st_dlvDesc", "absolute", "560", "180", "130", "51", null, null, this.div_detail);
            obj.set_taborder("85");
            obj.set_text("배송시 요청사항");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_detail.addChild(obj.name, obj);
            obj = new TextArea("ed_dlvDesc", "absolute", "694", "184", "424", "42", null, null, this.div_detail);
            obj.set_taborder("86");
            obj.set_wordwrap("char");
            obj.set_maxlength("300");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("st_yrmlCd", "absolute", "280", "60", "130", "31", null, null, this.div_detail);
            obj.set_taborder("90");
            obj.set_text("신청타이어본수");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.div_detail.addChild(obj.name, obj);
            obj = new Combo("cb_cntNm", "absolute", "414", "65", "142", "21", null, null, this.div_detail);
            this.div_detail.addChild(obj.name, obj);
            obj.set_taborder("91");
            obj.set_innerdataset("@ds_S089");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj.set_enable("false");
            obj = new Static("st_makerNm00", "absolute", "280", "30", "130", "31", null, null, this.div_detail);
            obj.set_taborder("92");
            obj.set_text("상품명");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_detail.addChild(obj.name, obj);
            obj = new Edit("ed_makerNm00", "absolute", "414", "35", "142", "21", null, null, this.div_detail);
            obj.set_taborder("93");
            obj.set_enable("false");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("st_makerNm01", "absolute", "280", "90", "130", "31", null, null, this.div_detail);
            obj.set_taborder("96");
            obj.set_text("신청회차");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_detail.addChild(obj.name, obj);
            obj = new Edit("ed_reqNo", "absolute", "414", "95", "142", "21", null, null, this.div_detail);
            obj.set_taborder("97");
            obj.set_enable("false");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("st_procType", "absolute", "560", "30", "130", "31", null, null, this.div_detail);
            obj.set_taborder("99");
            obj.set_text("장착유형");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.div_detail.addChild(obj.name, obj);
            obj = new Radio("rd_procType", "absolute", "61.59%", "31", null, "30", "25.93%", null, this.div_detail);
            this.div_detail.addChild(obj.name, obj);
            obj.set_taborder("100");
            obj.set_innerdataset("@ds_procType");
            obj.set_codecolumn("procType");
            obj.set_datacolumn("procTypeNm");
            obj.set_value("1030");
            obj.set_direction("vertical");
            obj.set_enable("false");
            obj.set_index("1");
            obj = new Button("btn_postSearch", "absolute", "670", "124", "20", "21", null, null, this.div_detail);
            obj.set_taborder("102");
            obj.set_cssclass("btn_WF_edtSch");
            obj.set_enable("false");
            obj.getSetter("domainId").set("nexa.save");
            this.div_detail.addChild(obj.name, obj);
            obj = new Edit("ed_o2oYn", "absolute", "489", "150", "71", "21", null, null, this.div_detail);
            obj.set_taborder("98");
            obj.set_displaynulltext("거점여부");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("st_dlvGb", "absolute", "840", "30", "130", "31", null, null, this.div_detail);
            obj.set_taborder("77");
            obj.set_text("교체예정일");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.div_detail.addChild(obj.name, obj);
            obj = new Calendar("ca_dlvrDay", "absolute", "974", "35", "143", "21", null, null, this.div_detail);
            this.div_detail.addChild(obj.name, obj);
            obj.set_taborder("87");
            obj.set_innerdataset("@ds_Holiday");
            obj.set_datecolumn("HLDYDATE");
            obj.set_textcolorcolumn("TEXTCOLOR");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_enable("true");
            obj = new Static("st_timeType", "absolute", "560", "60", "130", "31", null, null, this.div_detail);
            obj.set_taborder("103");
            obj.set_text("오전/오후");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.div_detail.addChild(obj.name, obj);
            obj = new Radio("rd_timeType", "absolute", "61.59%", "61", null, "30", "25.93%", null, this.div_detail);
            this.div_detail.addChild(obj.name, obj);
            obj.set_taborder("104");
            obj.set_innerdataset("@ds_timeType");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_value("AM");
            obj.set_direction("vertical");
            obj.set_enable("false");
            obj.set_index("0");
            obj = new Static("Static00", "absolute", "560", "90", "562", "31", null, null, this.div_detail);
            obj.set_taborder("105");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("st_time", "absolute", "560", "90", "130", "31", null, null, this.div_detail);
            obj.set_taborder("106");
            obj.set_text("장착시간");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_detail.addChild(obj.name, obj);
            obj = new Combo("cb_time", "absolute", "694", "95", "142", "21", null, null, this.div_detail);
            this.div_detail.addChild(obj.name, obj);
            obj.set_taborder("107");
            obj.set_innerdataset("@ds_time");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj.set_enable("true");
            obj = new Static("Static01", "absolute", "559", "150", "562", "31", null, null, this.div_detail);
            obj.set_taborder("109");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("st_baseType", "absolute", "560", "150", "130", "31", null, null, this.div_detail);
            obj.set_taborder("108");
            obj.set_text("지하여부");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_detail.addChild(obj.name, obj);
            obj = new Radio("rd_baseType", "absolute", "61.55%", "151", null, "30", "25.93%", null, this.div_detail);
            this.div_detail.addChild(obj.name, obj);
            obj.set_taborder("110");
            obj.set_innerdataset("@ds_baseType");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_value("N");
            obj.set_direction("vertical");
            obj.set_enable("false");
            obj.set_index("0");
            obj = new Static("st_dlvTel", "absolute", "840", "150", "130", "31", null, null, this.div_detail);
            obj.set_taborder("95");
            obj.set_text("연락처");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_detail.addChild(obj.name, obj);
            obj = new Edit("ed_dlvTel", "absolute", "974", "155", "143", "21", null, null, this.div_detail);
            obj.set_taborder("94");
            obj.set_enable("true");
            this.div_detail.addChild(obj.name, obj);
            obj = new Button("btn_timeSearch", "absolute", "670", "65", "20", "21", null, null, this.div_detail);
            obj.set_taborder("111");
            obj.set_cssclass("btn_WF_edtSch");
            obj.set_enable("false");
            obj.getSetter("domainId").set("nexa.save");
            this.div_detail.addChild(obj.name, obj);
            obj = new Edit("ed_siNm00", "absolute", "927", "125", "59", "21", null, null, this.div_detail);
            obj.set_taborder("112");
            obj.set_enable("false");
            obj.set_displaynulltext("시도명");
            obj.set_visible("false");
            this.div_detail.addChild(obj.name, obj);
            obj = new Edit("ed_sggNm00", "absolute", "991", "125", "59", "21", null, null, this.div_detail);
            obj.set_taborder("113");
            obj.set_displaynulltext("군구명");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_detail.addChild(obj.name, obj);
            obj = new Edit("ed_emdNm00", "absolute", "1058", "125", "59", "21", null, null, this.div_detail);
            obj.set_taborder("114");
            obj.set_displaynulltext("동명");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_detail.addChild(obj.name, obj);
            obj = new WebBrowser("kakao_interface", "absolute", "394", "186", "162", "46", null, null, this.div_detail);
            obj.set_taborder("115");
            obj.set_visible("false");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("st_selfGet", "absolute", "840", "90", "130", "31", null, null, this.div_detail);
            obj.set_taborder("116");
            obj.set_text("수령여부");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_detail.addChild(obj.name, obj);
            obj = new Combo("cb_dlvGb", "absolute", "974", "95", "142", "21", null, null, this.div_detail);
            this.div_detail.addChild(obj.name, obj);
            obj.set_taborder("117");
            obj.set_innerdataset("@ds_C039");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj.set_enable("false");

            obj = new Div("div_search", "absolute", "0", "0", "1122", "82", null, null, this);
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
            obj = new Static("st_searchCondition01", "absolute", "20", "12", "64", "20", null, null, this.div_search);
            obj.set_taborder("15");
            obj.set_text("고객번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_custNo", "absolute", "88", "12", "140", "21", null, null, this.div_search);
            obj.set_taborder("0");
            obj.set_inputfilter("space");
            obj.set_lengthunit("ascii");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_custNm", "absolute", "228", "12", "140", "21", null, null, this.div_search);
            obj.set_taborder("3");
            obj.set_inputfilter("space");
            obj.set_lengthunit("ascii");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_custPopUp", "absolute", "208", "11", "20", "21", null, null, this.div_search);
            obj.set_taborder("2");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition00", "absolute", "20", "45", "64", "20", null, null, this.div_search);
            obj.set_taborder("16");
            obj.set_text("계약번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_ordNo", "absolute", "88", "45", "140", "21", null, null, this.div_search);
            obj.set_taborder("6");
            obj.set_inputfilter("space");
            obj.set_lengthunit("ascii");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_custPopUp00", "absolute", "208", "44", "20", "21", null, null, this.div_search);
            obj.set_taborder("7");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition02", "absolute", "398", "12", "64", "20", null, null, this.div_search);
            obj.set_taborder("17");
            obj.set_text("고객명");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_custNm2", "absolute", "466", "12", "140", "21", null, null, this.div_search);
            obj.set_taborder("4");
            obj.set_inputfilter("space");
            obj.set_lengthunit("ascii");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition03", "absolute", "398", "45", "64", "20", null, null, this.div_search);
            obj.set_taborder("18");
            obj.set_text("차량번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_carNo", "absolute", "466", "45", "140", "21", null, null, this.div_search);
            obj.set_taborder("8");
            obj.set_inputfilter("space");
            obj.set_lengthunit("ascii");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "605", "0", "30", "78", null, null, this.div_search);
            obj.set_taborder("19");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition04", "absolute", "635", "12", "80", "20", null, null, this.div_search);
            obj.set_taborder("20");
            obj.set_text("전화번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
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
            obj = new Edit("ed_telNo", "absolute", "719", "12", "140", "21", null, null, this.div_search);
            obj.set_taborder("5");
            obj.set_inputfilter("space");
            obj.set_lengthunit("ascii");
            this.div_search.addChild(obj.name, obj);

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

            obj = new Static("Static03", "absolute", "0", "253", "1147", "10", null, null, this);
            obj.set_taborder("5");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "0", "267", "81", "20", null, null, this);
            obj.set_taborder("6");
            obj.set_text("서비스 신청 내용");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "0", "275", "1147", "10", null, null, this);
            obj.set_taborder("8");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("st_deliveryStat", "absolute", "0", "439", "130", "31", null, null, this);
            obj.set_taborder("11");
            obj.set_text("배송상태");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Combo("cb_deliveryStat", "absolute", "134", "444", "142", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("13");
            obj.set_innerdataset("@ds_C024");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj.set_visible("false");

            obj = new Grid("gr_list", "absolute", "0", "102", "1122", "163", null, null, this);
            obj.set_taborder("7");
            obj.set_binddataset("ds_list");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"100\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"73\"/><Column size=\"140\"/><Column size=\"60\"/><Column size=\"60\"/><Column size=\"87\"/><Column size=\"90\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"121\"/><Column size=\"120\"/><Column size=\"100\"/><Column size=\"167\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"100\"/><Column size=\"40\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"계약번호\"/><Cell col=\"1\" text=\"고객번호\"/><Cell col=\"2\" text=\"고객명\"/><Cell col=\"3\" text=\"상품코드\"/><Cell col=\"4\" text=\"상품명\"/><Cell col=\"5\" text=\"계약본수\"/><Cell col=\"6\" text=\"계약기간\"/><Cell col=\"7\" text=\"계약일자\"/><Cell col=\"8\" text=\"장착일자\"/><Cell col=\"9\" text=\"차종\"/><Cell col=\"10\" text=\"차량번호\"/><Cell col=\"11\" text=\"걱정제로 최초횟수\"/><Cell col=\"12\" text=\"걱정제로 잔여횟수\"/><Cell col=\"13\" text=\"교체신청여부\"/><Cell col=\"14\" text=\"걱정제로 신청타이어본수\"/><Cell col=\"15\" text=\"교체신청일자\"/><Cell col=\"16\" text=\"상태\"/><Cell col=\"17\" text=\"연체금액\"/><Cell col=\"18\" text=\"수령여부\"/></Band><Band id=\"body\"><Cell displaytype=\"text\" edittype=\"readonly\" text=\"bind:ordNo\" tooltiptext=\"bind:ordNo\"/><Cell col=\"1\" text=\"bind:custNo\" tooltiptext=\"bind:custNo\"/><Cell col=\"2\" edittype=\"normal\" text=\"bind:custNm\" tooltiptext=\"bind:custNm\"/><Cell col=\"3\" edittype=\"normal\" text=\"bind:matCd\"/><Cell col=\"4\" text=\"bind:matNm\" tooltiptext=\"bind:matNm\"/><Cell col=\"5\" text=\"bind:cntCd\" tooltiptext=\"bind:cntCd\"/><Cell col=\"6\" text=\"bind:periodCd\" tooltiptext=\"bind:periodCd\"/><Cell col=\"7\" displaytype=\"date\" text=\"bind:ordDay\"/><Cell col=\"8\" displaytype=\"date\" text=\"bind:procDay\"/><Cell col=\"9\" text=\"bind:modelNm\" tooltiptext=\"bind:modelNm\"/><Cell col=\"10\" text=\"bind:carNo\" tooltiptext=\"bind:carNo\"/><Cell col=\"11\" text=\"bind:servCnt00\"/><Cell col=\"12\" text=\"bind:servCnt0\" tooltiptext=\"bind:servCnt0\"/><Cell col=\"13\" text=\"bind:dlvrYn\" tooltiptext=\"bind:dlvrYn\"/><Cell col=\"14\" text=\"bind:cntNm\"/><Cell col=\"15\" displaytype=\"date\" text=\"bind:dlvrDay\" calendardisplaynulltype=\"none\" tooltiptext=\"bind:dlvrDay\"/><Cell col=\"16\" text=\"bind:dlvstatNm\" tooltiptext=\"bind:dlvstatNm\"/><Cell col=\"17\" displaytype=\"number\" style=\"align:right;\" text=\"bind:apprAmt\" mask=\"###,###,###,##0\"/><Cell col=\"18\" displaytype=\"combo\" text=\"bind:dlvGb\" combodataset=\"ds_C039\" combocodecol=\"cd\" combodatacol=\"cdNm\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1134, 253, this.div_detail,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("9");
            		p.set_scrollbars("none");

            	}
            );
            this.div_detail.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1122, 82, this.div_search,
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
            		p.set_titletext("걱정제로 서비스 신청");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item7","cb_deliveryStat","value","ds_list","dlvStat");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item11","div_detail.ed_dlvTel","value","ds_list","dlvTel");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item5","div_detail.cb_cnt","value","ds_list","cntNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item1","div_detail.ed_modelNm","value","ds_list","modelNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item8","div_detail.ed_agencyCd","value","ds_list","agencyCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item2","div_detail.ed_carNo","value","ds_list","carNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item0","div_detail.ed_makerNm","value","ds_list","makerNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item3","div_detail.ed_carOwner","value","ds_list","carOwner");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item14","div_detail.ed_dlvAddr1","value","ds_list","dlvAddr1");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item16","div_detail.ed_dlvDesc","value","ds_list","dlvDesc");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item9","div_detail.ed_agencyNm","value","ds_list","agencyNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item12","div_detail.ca_dlvrDay","value","ds_list","servrqDay");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item4","div_detail.ed_makerNm00","value","ds_list","matNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item6","div_detail.cb_cntNm","value","ds_list","cntCd1");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item10","div_detail.ed_reqNo","value","ds_list","reqNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item13","div_detail.ed_o2oYn","value","ds_list","o2oYn");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item15","div_detail.rd_procType","value","ds_list","instCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item17","div_detail.cb_time","value","ds_list","instTm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item18","div_detail.cb_dlvGb","value","ds_list","dlvGb");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCSZeroService.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCSZeroService.xfdl", function() {
        /***************************************************************************************************
         * 파 일 명 : RTCSZeroService.xfdl
         * 설    명 : 걱정제로 서비스 신청
         * 작 성 자 : 
         * 변경이력 :
         * 변경일자		변경자		변경내용
         * ----------	------		--------
         * ...			...			..
         * 2019-04-26	wjim		[20190426_01] 걱정제로 최초횟수, 신청회차 추가
         ***************************************************************************************************/

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //include "lib::comLib.xjs";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.userGrp 	 = application.gds_userInfo.getColumn(0,"userGrp");//사용자 그룹 		--> *01:영업관리자     *02:콜센터     *03:지사     *04:지점     *05:대리점
        this.userId 	 = application.gds_userInfo.getColumn(0,"userId");
        this.p_arg 				= "RTCSZeroRepService";
        this.toDay 				= "";
        this.selectServrqDay	= ""; //D+3일
        this.selectServrqDay_2	= ""; //D+2일

        this.o2oAgencyStockTot = 0; //20200406 kstka 거점재고수량
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg){

        	if( nErrorCode < 0 ){
        		alert(strErrorMsg);
        		return;
        	}
        		
        	if( strSvcId == "intiRTCSZeroService" ){
        		this.fn_C024();		
        	}
        	
        	if( strSvcId == "selectC024" ){

        		//영업관리자, 콜센터만 장착유형 선택가능
        		if(this.userGrp == "01" || this.userGrp == "02"){
        			this.div_detail.rd_procType.set_enable(false);			
        			this.div_detail.ca_dlvrDay.set_value(this.selectServrqDay);		
        			
        			
        			// KCP 연동 웹페이지 URL을 접속 호스트에 따라 동적 변경 
        			if (application.gv_host == "http://localhost/") {						//LOCAL
        				this.div_detail.kakao_interface.set_url("http://localhost/interface/map/searchMap.jsp");
        			} else if (application.gv_host == "http://1.254.67.135:9080/") {		//개발기
        				this.div_detail.kakao_interface.set_url("http://1.254.67.135:9080/interface/map/searchMap.jsp");
        			} else if (application.gv_host == "https://portal.tirerental.co.kr/") {	//운영기
        				this.div_detail.kakao_interface.set_url("https://portal.tirerental.co.kr/interface/map/searchMap.jsp");
        			} else {																//기타=개발기 적용
        				this.alert("호스트 정보가 유효하지 않습니다 : " + application.gv_host);
        				this.div_detail.kakao_interface.set_url("http://172.17.0.135:9080/interface/map/searchMap.jsp");
        			}
        			
        			this.div_detail.kakao_interface.show();
        		}
        		
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
        			sArgs += Ex.util.setParam("term", "3");
        			Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        		}
        	}
        	
        	if( strSvcId == "selectServrqDay" ){
        	}
        	
        	if( strSvcId == "selectRTCSZeroService" ){
        		var rowCt = this.ds_list.getRowCount();
        		if( rowCt == 0 ){
        			alert("조회된 데이터가 없습니다.");
        			this.gr_list.set_nodatatext("조회된 데이터가 없습니다.");
        		}else{
        			this.ds_list_canrowposchange();
        			this.ds_list_onrowposchanged();		
        		}
        	}
        	if( strSvcId == "saveRTCSZeroRepSer" ){
        		alert(strErrorMsg);
        		if( nErrorCode < 0 ){
        		
        		}else{
        			this.fn_search();
        		}
        	}
        	
        	if(strSvcId == "tmsSchedules"){
        		if(nErrorCode != "200"){
        			this.alert(strErrorMsg);
        		}

        		if(this.ds_time.rowcount == 0){
        			this.alert("해당 거점의 사용가능한 스케쥴이 존재하지 않습니다.");
        		}else{
        			this.div_detail.cb_time.set_enable(true);
        			this.div_detail.rd_baseType.set_enable(true);
        		}
        	
        	}
        	
        	if(strSvcId == "o2oAgencyInfo"){
        	
        		//초기화
        		this.div_detail.ed_agencyCd.set_value("");
        		this.div_detail.ed_agencyNm.set_value("");
        		this.div_detail.ed_o2oYn.set_value("");	
        		
        		if(this.ds_o2oAgencyInfo.rowcount == 0){
        			this.alert("해당 대리점 정보를 찾을 수 없습니다.");
        		}else{
        			this.div_detail.ed_agencyCd.set_value(this.ds_o2oAgencyInfo.getColumn(0, "bpCd")); //대리점코드
        			
        			//대리점명
        			this.div_detail.ed_agencyNm.set_value(this.ds_o2oAgencyInfo.getColumn(0, "orgzNm"));
        			this.div_detail.ed_o2oYn.set_value("Y"); //o2o여부
        		}
        	}
        	
        	if(strSvcId == "o2oAgencyStockTot"){
        		if(this.o2oAgencyStockTot <= 0){
        			this.alert("해당 제품의 거점의 재고가 존재하지 않습니다.");
        			return;
        		}
        		
        		this.div_detail.ca_dlvrDay.set_value(this.toDay);
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.RTCSEngineOilRepSer_onload = function(obj,e){
        	Ex.core.init(obj);
        	this.fn_setButton();
        	this.fn_init();
        	this.fn_getToday();
        	this.FN_changeInfo();
        	
        	this.listControlAuth("CS", "RTCSZeroRepService");
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_setButton = function(){
        	this.parent.setButton("DL|C|S", this);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_init = function(){
        	var sSvcID      	= "intiRTCSZeroService";  
        	var sController   	= "rtms/cs/intiRTCSZeroSerivce.do";
        	var sInDatasets   	= "";
        	var sOutDatasets	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	sOutDatasets += " ds_S089=mapDsS089 ";

        
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
        	var telNo 	= FN_numberHyphenOut(nvl(this.div_search.ed_telNo.value));
        	var mobNo  	= FN_numberHyphenOut(nvl(this.div_search.ed_mobNo.value));
        	
        	if ( (custNo == "" || custNo == null )&& (ordNo == "" || ordNo == null)&&( custNm == "" || custNm == null )&&
        	 (carNo == "" || carNo == null ) && ( telNo == "" || telNo == null ) && ( mobNo == "" || mobNo== null) ) {
        		alert("조회조건을 입력해주세요"); 			return;
        	}
        	
        	if( (custNm  != "" && mobNo == "") || (custNm  != "" && mobNo == "")){
        		alert("휴대폰번호 혹은 차량번호를 입력해주세요"); 			return;
        	}
        	
        	
        		var sSvcID        	= "selectRTCSZeroService";
        		var sController   	= "rtms/cs/selectRTCSZeroService.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_list=mapDsList";
        		var sArgs 			= "";
        		var fn_callBack		= "fn_callBack";
        		
        		sArgs += Ex.util.setParam("custNo", custNo);
        		sArgs += Ex.util.setParam("ordNo", 	ordNo);
        		sArgs += Ex.util.setParam("custNm", custNm);
        		sArgs += Ex.util.setParam("carNo", 	carNo);
        		sArgs += Ex.util.setParam("custNo", custNo);
        		sArgs += Ex.util.setParam("telNo", 	telNo);
        		sArgs += Ex.util.setParam("mobNo", 	mobNo);
        		this.ds_list.clearData();
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 

        }
        /*||||||||||||||||||||||||||||||*/

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_save = function(){
        	//var nCnt 	= this.ds_list.getRowCount();
        	//var saveCnt_1 = -1;
        	var saveRow = this.ds_list.rowposition;

        	if( saveRow == -1 ){
        		alert("저장할 정보를 선택하세요.");
        		return false;
        	}
        	
        	var msg			= " 값이 없습니다.";
        	var saveType	= this.ds_list.getRowType(saveRow);
        	var ordNo 		= nvl(this.ds_list.getColumn(saveRow, "ordNo"));						//계약번호
        	var custNo 		= nvl(this.ds_list.getColumn(saveRow, "custNo"));						//고객번호
        	var custNm 		= nvl(this.ds_list.getColumn(saveRow, "custNm"));						//고객명
        	var matCd		= nvl(this.ds_list.getColumn(saveRow, "matCd"));						//모델
        	var agencyCd 	= nvl(this.ds_list.getColumn(saveRow, "agencyCd"));						//교체점코드
        	var addr1 		= nvl(this.ds_list.getColumn(saveRow, "dlvAddr1"));						//주소
        	var dlvTel 		= FN_numberHyphenOut(nvl(this.ds_list.getColumn(saveRow, "dlvTel")));	//연락처
        	var dlvDesc 	= nvl(this.ds_list.getColumn(saveRow, "dlvDesc"));						//배송시요구사항
        	var servrqDay	= nvl(this.ds_list.getColumn(saveRow, "servrqDay"));					//교체예정일
        	var dlvStat		= nvl(this.ds_list.getColumn(saveRow, "dlvStat"));						//상태
        	var dlvrSeq		= nvl(this.ds_list.getColumn(saveRow, "dlvrSeq"));						//순번
        	//trace("dlvrSeq:"+dlvrSeq);
        	var servSeq		= nvl(this.ds_list.getColumn(saveRow, "servSeq")); 						//서비스 순번
        	var dlvrDay		= nvl(this.ds_list.getColumn(saveRow, "dlvrDay"));						//교체신청일자
        	var apprAmt		= nvl(this.ds_list.getColumn(saveRow, "apprAmt"));						//교체신청일자
        	var dlvrYn		= nvl(this.ds_list.getColumn(saveRow, "dlvrYn"));						//저장 OR 업데이트
        	var cntCd1      = nvl(this.ds_list.getColumn(saveRow, "cntCd1"));						//신청 타이어 본수
        		
        	var dlvGb       = nvl(this.ds_list.getColumn(saveRow, "dlvGb"));						//수령여부
        	//20190418 계약종료고객 서비스 신청 불가
        	//--------------------------------------------------------------------------------------------------------------------------------
        	var procDay     = nvl(this.ds_list.getColumn(saveRow, "procDay"));						//장착일자
        	var period      = nvl(this.ds_list.getColumn(saveRow, "periodCd"));						//계약기간

        	var procYear    = procDay.substr(0, 4);
        	var procMonth   = procDay.substr(4, 2);
        	var procDate    = procDay.substr(6, 2);

        	var osDay       = new Date(procYear, Number(procMonth) + Number(period), Number(procDate) - 1);

        	var osYear      = osDay.getFullYear();
        	var osMonth   = osDay.getMonth(); osMonth = (osMonth < 10) ? '0' + osMonth : osMonth;
        	var osDate      = osDay.getDate(); osDate = (osDate < 10) ? '0' + osDate : osDate;

        	var userId 	 = application.gds_userInfo.getColumn(0, "userId");

        	//20200220 kstka 장착유형 추가
        	var procType = this.div_detail.rd_procType.value;
        	var instTm = this.div_detail.cb_time.value;
        	
        	if(osYear + "" + osMonth + ""  + osDate < this.toDay){
        		var authYn = this.getControlAuthCheck("btn_saveOs", "", this.userId);
        		if(authYn != "Y"){
        			alert("렌탈계약이 종료된 고객은 서비스를 신청 할 수 없습니다.\n 서비스신청문의는 관리자에게 문의해주세요.");
        			return;
        		}
        	}
        	//----------------------------------------------------------------------------------------------------------------------------------
        	
        	if( saveType != 4 ) {												alert("저장할 정보가 없습니다");	return false;
        	}else if( ordNo == "" ){ 											alert("계약번호"+msg);				return false;
        	}else if( custNo == "" ){ 											alert("고객번호"+msg);				return false;
        	}else if( agencyCd == ""){ 											alert("교체점코드"+msg);			return false;
        	}else if( addr1 == "" ){ 											alert("주소"+msg);					return false;
        	}else if( servrqDay == "" ){										alert("교체예정일"+msg);			return false;
        	}else if( (dlvStat != "01") && (dlvStat != "") ){					alert("요청접수상태가 아니므로 저장할 수가 없습니다."); return false;
        	}else if( this.FN_stringByteLength(dlvDesc) > 300){					alert("배송시 요청사항 크기가 300byte를 초과했습니다.\n한글일경우 150자, 영문일경우 300자 입니다."); return false;
        	}else if( apprAmt > 0 ){											alert("연체금액 "+this.FN_comma(apprAmt)+"(원)이 있으므로 저장할 수 없습니다."); return false;
        	}else if( matCd == ""){ 										    alert("상품명"+msg);					return false;
        	}else{

        		this.ds_save.clearData();
        		var nRowSave = this.ds_save.insertRow(0);
        		if( dlvrDay != "" ){
        			this.ds_save.setColumn(nRowSave, "dlvrDay", 	dlvrDay);
        		}else{
        			this.ds_save.setColumn(nRowSave, "dlvrDay", 	this.toDay);
        		}
        		this.ds_save.setColumn(nRowSave, "dlvrSeq", 	dlvrSeq);
        		this.ds_save.setColumn(nRowSave, "ordNo",		ordNo);
        		this.ds_save.setColumn(nRowSave, "custNo", 		custNo);
        		this.ds_save.setColumn(nRowSave, "custNm", 		custNm);
        		this.ds_save.setColumn(nRowSave, "agencyCd", 	agencyCd);
        		this.ds_save.setColumn(nRowSave, "matCd", 	matCd);		

        		this.ds_save.setColumn(nRowSave, "cntCd1", 	cntCd1);	
        		this.ds_save.setColumn(nRowSave, "servrqDay", 	servrqDay);			//장착일자		
        		this.ds_save.setColumn(nRowSave, "servSeq", 	servSeq);           //I면 null
        		this.ds_save.setColumn(nRowSave, "addr1", 		addr1);
        		this.ds_save.setColumn(nRowSave, "dlvTel", 		dlvTel);
        		this.ds_save.setColumn(nRowSave, "dlvDesc", 	dlvDesc);
        		
        		this.ds_save.setColumn(nRowSave, "dlvGb",       dlvGb);				//수령여부
        		
        		//20200220 kstka 장착유형 추가 - 거점인경우만 저장
        		var o2oYn = this.div_detail.ed_o2oYn.value;
        		if(nvl(o2oYn) == "Y"){
        			this.ds_save.setColumn(nRowSave, "instCd", 	procType);
        			this.ds_save.setColumn(nRowSave, "instTm", 	instTm);
        			
        			//장착시간 선택 필수
        			if(nvl(procType) == "1010" || nvl(procType) == "1030"){
        				if(nvl(instTm) == ""){
        					this.alert("장착시간을 선택해 주세요.");
        					return;
        				}
        			}
        		}

        		// 2016-07-25 이영근, 전화번호 문자메시지 추가
        		this.ds_save.setColumn(nRowSave, "mobNo", 	    this.ds_list.getColumn(saveRow, "mobNo")); 
        		var smsMsg = "";
        		if(dlvrSeq == "")
        			smsMsg = this.ds_list.getColumn(saveRow, "custNm") + " 고객님께서 신청하신 걱정제로 서비스가 접수되었습니다.";
        		else
        			smsMsg = this.ds_list.getColumn(saveRow, "custNm") + " 고객님께서 신청하신 걱정제로 서비스가 변경되었습니다.";
        		var consignee = this.div_detail.ed_agencyNm.text;
        		smsMsg += " 대리점: " + consignee + ", 연락처:" + dlvTel + ", 교체 예정일: " + servrqDay;
        		this.ds_save.setColumn(nRowSave, "smsMsg",      smsMsg);
        	
        		this.ds_save.set_updatecontrol(false);
        		if( dlvrYn == "N"){
        			this.ds_save.setRowType(nRowSave, 2);
        			this.ds_save.setColumn(nRowSave, "dlvStat", 	"01");
        		}else{
        			this.ds_save.setRowType(nRowSave, 4);
        			this.ds_save.setColumn(nRowSave, "dlvStat", 	dlvStat);
        		}
        		this.ds_save.set_updatecontrol(true);

        		//20191205 kstka 거점장착정보
        		//===========================================================================================
        		var nRowOms = this.ds_rtsd0213.rowposition;

        		this.ds_rtsd0213.setColumn(nRowOms, "rentIfCntrNo", nvl(ordNo));
        		this.ds_rtsd0213.setColumn(nRowOms, "ordDe", nvl(this.toDay));
        		this.ds_rtsd0213.setColumn(nRowOms, "saleTyCd", "1104");
        		this.ds_rtsd0213.setColumn(nRowOms, "rentIfReqSn", dlvrSeq);
        		this.ds_rtsd0213.setColumn(nRowOms, "rentIfBfistSeCd", "01");
        		this.ds_rtsd0213.setColumn(nRowOms, "custNm", encodeURI(nvl(custNm)));
        		this.ds_rtsd0213.setColumn(nRowOms, "carNo", encodeURI(nvl(this.div_detail.ed_carNo.value)));
        		this.ds_rtsd0213.setColumn(nRowOms, "iplMobNo", nvl(this.div_detail.ed_dlvTel.value));
        		this.ds_rtsd0213.setColumn(nRowOms, "iplTelNo", "");
        		
        		var _agencyCd = "";
        		var str = "";
        		for(var i=0; i<10-agencyCd.length; i++){
        			str += "0";
        		}
        		_agencyCd = str + agencyCd;
        		
         		//var posCdExp = /^[0-9]{4,5,6}[\)]$/;
         		var posCdExp = /[0-9]{5}[)]/g;
         		var posCd = "";
         		var _addr1 = "";
         		
         		if(posCdExp.test(addr1) == true){
         			posCd = addr1.substring(0, 5);
         			_addr1 = addr1.substring(7);
         		}else{
        			//우편번호 필수값 해제
         			//this.alert("주소정보에 우편번호가 존재하지 않습니다.");
         			//return;
         		}

        		trace("posCd:" + posCd);
        		trace("addr1:" + _addr1);

        		this.ds_rtsd0213.setColumn(nRowOms, "sendURL", "/rentalapi/sd/rentalOpertRegTMS.do");
        		this.ds_rtsd0213.setColumn(nRowOms, "istBpCd", _agencyCd);
        		this.ds_rtsd0213.setColumn(nRowOms, "itemCd", nvl(matCd));
        		this.ds_rtsd0213.setColumn(nRowOms, "ordQy", nvl(cntCd1));
        		this.ds_rtsd0213.setColumn(nRowOms, "dlvTyDtlCd", procType);
        		this.ds_rtsd0213.setColumn(nRowOms, "istReqDe", nvl(servrqDay));
        		this.ds_rtsd0213.setColumn(nRowOms, "pickupZip", "");
        		this.ds_rtsd0213.setColumn(nRowOms, "pickupBassAddr", "");
        		this.ds_rtsd0213.setColumn(nRowOms, "pickupDtlAddr", "");
        		this.ds_rtsd0213.setColumn(nRowOms, "iplZip", nvl(posCd));
        		this.ds_rtsd0213.setColumn(nRowOms, "iplAddr", encodeURI(nvl(_addr1)));
        		this.ds_rtsd0213.setColumn(nRowOms, "iplDtlAddr", " ");
        		this.ds_rtsd0213.setColumn(nRowOms, "regUsrId", "rentalusr");
        		this.ds_rtsd0213.setColumn(nRowOms, "ordRsn", "R41");
        		
        		var siNm00 = this.div_detail.ed_siNm00.value;
        		var sggNm00 = this.div_detail.ed_sggNm00.value;
        		var emdNm00 = this.div_detail.ed_emdNm00.value;
        		
        		this.ds_rtsd0213.setColumn(nRowOms, "city", encodeURI(siNm00));
        		this.ds_rtsd0213.setColumn(nRowOms, "county", encodeURI(sggNm00));
        		this.ds_rtsd0213.setColumn(nRowOms, "dong", encodeURI(emdNm00));
        		
        		this.ds_rtsd0213.setColumn(nRowOms, "period", encodeURI(this.div_detail.rd_timeType.value));
        		this.ds_rtsd0213.setColumn(nRowOms, "basementPsbYn", encodeURI(this.div_detail.rd_baseType.value));
        		this.ds_rtsd0213.setColumn(nRowOms, "wheelAlignment", "N");
        		
        		//20200619 kstka 추가컬럼
        		this.ds_rtsd0213.setColumn(nRowOms, "omsOrderNo", this.ds_list.getColumn(this.ds_list.rowposition, "omsOrderNo"));
        		this.ds_rtsd0213.setColumn(nRowOms, "tmplCd", "NXO2O000000000000020");
        	
        		var o2oYn = "N";
        		if(nvl(this.div_detail.ed_o2oYn.value) == "Y"){
        			o2oYn = "Y";
        		}else{
        			o2oYn = "N";
        		}
        		this.ds_rtsd0213.setColumn(nRowOms, "o2oYn", nvl(o2oYn));
        		
        		this.ds_orderId.set_filterstr("cd==" + this.div_detail.cb_time.value);
        		//tmsOrderId
        		this.ds_save.setColumn(0, "tmsOrderId", this.ds_orderId.getColumn(0, "cdNm"));
        		
        		//전문점 장착(거점)인 경우 resultData의 json구조를 임의 생성하여 전송처리
        		var timeToJson = "";
        		if(nvl(procType) == "1010"){
        			this.ds_schedule.set_filterstr("cd==" + this.div_detail.cb_time.value);
        			timeToJson = this.ds_schedule.getColumn(0, "cdNm");
        		}else{
        			timeToJson = "{\"time\":\"" + this.div_detail.cb_time.value + "\"}";
        			
        			//20200309 kstka item목록 생성
        			this.ds_tmsItem.clearData();
        			this.ds_tmsItem.addRow();
        			this.ds_tmsItem.setColumn(0, "itemCd", encodeURI(matCd));
        			this.ds_tmsItem.setColumn(0, "reqQy", encodeURI(Number(cntCd1)));
        		}
        		
        		this.ds_rtsd0213.setColumn(nRowOms, "resultData", encodeURI(timeToJson));
        	
        		//[20220217_01] kstka 고객번호 추가
        		this.ds_rtsd0213.setColumn(nRowOms, "custNo", nvl(custNo));
        	
        		trace("o2oYn:" + nvl(this.ds_rtsd0213.getColumn(0, "o2oYn")));
        		//===========================================================================================
        		
        		if( confirm( "저장하시겠습니까?" ) ){
        			var sSvcID        	= "saveRTCSZeroRepSer"; 
        			var sController   	= "rtms/cs/saveRTCSZeroRepSer.do";
        			var sInDatasets   	= "";
        			var sOutDatasets  	= "";
        			var sArgs 			= "";
        			sInDatasets   		+= " input=ds_save:U ";
        			sInDatasets   		+= " input1=ds_rtsd0213:A ";
        			sInDatasets   		+= " ds_tmsItem=ds_tmsItem:A ";
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
        	
        	var saveType	= this.ds_list.getRowType(saveRow)
        	var ordNo 		= nvl(this.ds_list.getColumn(saveRow, "ordNo"));						//계약번호
        	var custNo 		= nvl(this.ds_list.getColumn(saveRow, "custNo"));						//고객번호
        		var custNm 		= nvl(this.ds_list.getColumn(saveRow, "custNm"));						//고객번호
        	var matCd		= nvl(this.ds_list.getColumn(saveRow, "matCd"));						//모델
        	var agencyCd 	= nvl(this.ds_list.getColumn(saveRow, "agencyCd"));						//교체점코드
        	var addr1 		= nvl(this.ds_list.getColumn(saveRow, "dlvAddr1"));						//주소
        	var dlvTel 		= FN_numberHyphenOut(nvl(this.ds_list.getColumn(saveRow, "dlvTel")));	//연락처
        	var dlvDesc 	= nvl(this.ds_list.getColumn(saveRow, "dlvDesc"));						//배송시요구사항
        	var servrqDay	= nvl(this.ds_list.getColumn(saveRow, "servrqDay"));					//교체예정일
        	var dlvStat		= nvl(this.ds_list.getColumn(saveRow, "dlvStat"));						//상태
        	var dlvrSeq		= nvl(this.ds_list.getColumn(saveRow, "dlvrSeq"));						//순번
        	var servSeq		= nvl(this.ds_list.getColumn(saveRow, "servSeq")); 						//서비스 순번
        	var dlvrDay		= nvl(this.ds_list.getColumn(saveRow, "dlvrDay"));						//교체신청일자
        	var apprAmt		= nvl(this.ds_list.getColumn(saveRow, "apprAmt"));						//교체신청일자
        	var dlvrYn		= nvl(this.ds_list.getColumn(saveRow, "dlvrYn"));						//저장 OR 업데이트
        	var cntCd1      = nvl(this.ds_list.getColumn(saveRow, "cntCd1"));						//신청 타이어 본수
        	
        	//20190507 요청접수상태가 아닐경우 영업관리자만 삭제 가능
        	//[2019-00370923] kstka 서비스완료상태가 아닌경우 렌탈팀 김영작, 김소영 만 삭제 가능
        	if(dlvStat == "07" || dlvStat == "08" || dlvStat == "09"){
        		this.alert("선처리 신청건은 삭제가 되지 않습니다. 관리자에게 문의하세요.");
        		return;
        	}
        	
        	if( (dlvStat == "02" || dlvStat == "03") ){
        		var authYn = this.getControlAuthCheck("btn_delete", "", this.userId);
        		if( authYn != "Y"){
        			this.alert("삭제 기능은 시스템관리자에게 문의하세요.");
        			return;
        		}
        	}
        	
        	
        	this.ds_save.clearData();
        	
        	var nRowSave = this.ds_save.insertRow(0);
        	if( dlvrDay != "" ){
        		this.ds_save.setColumn(nRowSave, "dlvrDay", 	dlvrDay);
        	}else{
        		this.ds_save.setColumn(nRowSave, "dlvrDay", 	this.toDay);
        	}
        	
        	this.ds_save.setColumn(nRowSave, "dlvrSeq", 	dlvrSeq);
        	this.ds_save.setColumn(nRowSave, "ordNo",		ordNo);
        	this.ds_save.setColumn(nRowSave, "custNo", 		custNo);
        	this.ds_save.setColumn(nRowSave, "custNm", 		custNm);
        	this.ds_save.setColumn(nRowSave, "agencyCd", 	agencyCd);
        	this.ds_save.setColumn(nRowSave, "matCd", 	matCd);		
        	this.ds_save.setColumn(nRowSave, "cntCd1", 	cntCd1);	
        	this.ds_save.setColumn(nRowSave, "servrqDay", 	servrqDay);			//장착일자		
        	this.ds_save.setColumn(nRowSave, "servSeq", 	servSeq);           //I면 null
        	this.ds_save.setColumn(nRowSave, "addr1", 		addr1);
        	this.ds_save.setColumn(nRowSave, "dlvTel", 		dlvTel);
        	this.ds_save.setColumn(nRowSave, "dlvDesc", 	dlvDesc);	
        	
        	this.ds_save.set_updatecontrol(false);
        	if( dlvrYn == "N"){
        		this.ds_save.setRowType(nRowSave, 2);
        		this.ds_save.setColumn(nRowSave, "dlvStat", 	"01");
        	}else{
        		this.ds_save.setRowType(nRowSave, 4);
        		this.ds_save.setColumn(nRowSave, "dlvStat", 	dlvStat);
        	}	
        	
        	this.ds_save.set_updatecontrol(false);
        	this.ds_save.setRowType(nRowSave, 8);
        	this.ds_save.set_updatecontrol(true);	
        		
        	/*this.ds_save.clearData();
        	var nRowSave = this.ds_save.insertRow(0);
        	if( dlvrDay != "" ){
        		this.ds_save.setColumn(nRowSave, "dlvrDay", 	dlvrDay);
        	}else{
        		this.ds_save.setColumn(nRowSave, "dlvrDay", 	this.toDay);
        	}
        	this.ds_save.setColumn(nRowSave, "dlvrSeq", 	dlvrSeq);
        	this.ds_save.setColumn(nRowSave, "ordNo",		ordNo);
        	this.ds_save.setColumn(nRowSave, "custNo", 		custNo);
        	this.ds_save.setColumn(nRowSave, "servSeq", 	servSeq);
        	this.ds_save.setColumn(nRowSave, "fuelCd", 		fuelCd);
        	this.ds_save.setColumn(nRowSave, "yrmlCd", 		yrmlCd);
        	this.ds_save.setColumn(nRowSave, "dsplmtCd", 	dsplmtCd);
        	this.ds_save.setColumn(nRowSave, "dlvGb", 		dlvGb);
        	this.ds_save.setColumn(nRowSave, "agencyCd", 	agencyCd);
        	this.ds_save.setColumn(nRowSave, "consignee", 	consignee);
        	this.ds_save.setColumn(nRowSave, "posCd", 		posCd);
        	this.ds_save.setColumn(nRowSave, "addr1", 		addr1);
        	this.ds_save.setColumn(nRowSave, "addr2",		addr2);
        	this.ds_save.setColumn(nRowSave, "dlvTel", 		dlvTel);
        	this.ds_save.setColumn(nRowSave, "dlvDesc", 	dlvDesc);
        	this.ds_save.setColumn(nRowSave, "servrqDay", 	servrqDay);
        	this.ds_save.setColumn(nRowSave, "downDay", 	downDay);
        	this.ds_save.setColumn(nRowSave, "dlvsDay", 	dlvsDay);
        	this.ds_save.setColumn(nRowSave, "dlvEnt", 		dlvEnt);
        	this.ds_save.setColumn(nRowSave, "trspDoc", 	trspDoc);
        	
        	this.ds_save.set_updatecontrol(false);
        	this.ds_save.setRowType(nRowSave, 8);
        	this.ds_save.set_updatecontrol(true);*/
        	
        	//20191205 kstka 거점장착정보
        	//===========================================================================================
        	var nRowOms = this.ds_rtsd0213.rowposition;
        	
        	this.ds_rtsd0213.setColumn(nRowOms, "rentIfCntrNo", nvl(ordNo));
        	this.ds_rtsd0213.setColumn(nRowOms, "saleTyCd", "1104");
        	this.ds_rtsd0213.setColumn(nRowOms, "rentIfReqSn", dlvrSeq);
        	this.ds_rtsd0213.setColumn(nRowOms, "rentIfBfistSeCd", "04");

        	this.ds_rtsd0213.setColumn(nRowOms, "sendURL", "/rentalapi/sd/rentalOpertResultTMS.do");
        	this.ds_rtsd0213.setColumn(nRowOms, "opertSts", "70");
        	this.ds_rtsd0213.setColumn(nRowOms, "opertDe", this.toDay);
        	this.ds_rtsd0213.setColumn(nRowOms, "drgMil", "");
        	this.ds_rtsd0213.setColumn(nRowOms, "regUsrId", "rentalusr");
        	this.ds_rtsd0213.setColumn(nRowOms, "o2oYn", nvl(this.ds_list.getColumn(this.ds_list.rowposition, "o2oYn")));

        
        	this.ds_rtsd0213.setColumn(nRowOms, "ordDe", nvl(dlvrDay));
        	this.ds_rtsd0213.setColumn(nRowOms, "custNm", encodeURI(nvl(custNm)));
        	this.ds_rtsd0213.setColumn(nRowOms, "carNo", encodeURI(nvl(this.div_detail.ed_carNo.value)));
        	this.ds_rtsd0213.setColumn(nRowOms, "iplMobNo", nvl(dlvTel));
        	this.ds_rtsd0213.setColumn(nRowOms, "iplTelNo", "");
        	
        	//[20220217_01] kstka 고객번호 추가
        	this.ds_rtsd0213.setColumn(nRowOms, "custNo", nvl(custNo));
        	
        	var _agencyCd = "";
        	var str = "";
        	for(var i=0; i<10-agencyCd.length; i++){
        		str += "0";
        	}
        	_agencyCd = str + agencyCd;
        	
        	var posCdExp = /[0-9]{5}[)]/g;
        	var posCd = "";
        	var _addr1 = "";
        	
        	if(posCdExp.test(addr1) == true){
        		posCd = addr1.substring(0, 5);
        		_addr1 = addr1.substring(7);
        	}else{
        		this.alert("대리점정보에 우편번호가 존재하지 않습니다.");
        		return;
        	}
        	
        	this.ds_rtsd0213.setColumn(nRowOms, "istBpCd", nvl(_agencyCd));
        	this.ds_rtsd0213.setColumn(nRowOms, "itemCd", nvl(matCd));
        	this.ds_rtsd0213.setColumn(nRowOms, "ordQy", nvl(cntCd1));
        	this.ds_rtsd0213.setColumn(nRowOms, "dlvTyDtlCd", "");
        	this.ds_rtsd0213.setColumn(nRowOms, "istReqDe", nvl(servrqDay));
        	this.ds_rtsd0213.setColumn(nRowOms, "pickupZip", "");
        	this.ds_rtsd0213.setColumn(nRowOms, "pickupBassAddr", "");
        	this.ds_rtsd0213.setColumn(nRowOms, "pickupDtlAddr", "");
        	this.ds_rtsd0213.setColumn(nRowOms, "iplZip", nvl(posCd));
        	this.ds_rtsd0213.setColumn(nRowOms, "iplAddr", encodeURI(nvl(_addr1)));
        	this.ds_rtsd0213.setColumn(nRowOms, "iplDtlAddr", " ");
        	this.ds_rtsd0213.setColumn(nRowOms, "regUsrId", "rentalusr");
        	this.ds_rtsd0213.setColumn(nRowOms, "ordRsn", "R41");
        	this.ds_rtsd0213.setColumn(nRowOms, "o2oYn", nvl(this.div_detail.ed_o2oYn.value));
        	
        	//20200311 kstka 추가컬럼
        	this.ds_rtsd0213.setColumn(nRowOms, "orderId", nvl(this.ds_list.getColumn(this.ds_list.rowposition, "tmsOrderId")));
        	
        	//20200619 kstka 추가컬럼
        	this.ds_rtsd0213.setColumn(nRowOms, "omsOrderNo", this.ds_list.getColumn(this.ds_list.rowposition, "omsOrderNo"));
        	this.ds_rtsd0213.setColumn(nRowOms, "tmplCd", "NXO2O000000000000022");
        	//===========================================================================================
        		
        	if( confirm( "삭제하시겠습니까?" ) ){
        		var sSvcID        	= "saveRTCSZeroRepSer"; 
        		var sController   	= "rtms/cs/saveRTCSZeroRepSer.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";
        		sInDatasets   		+= " input=ds_save:U ";
        		sInDatasets   		+= " input1=ds_rtsd0213:A ";
        		sInDatasets         += " ds_tmsItem=ds_tmsItem:A "; // 20210113 스케쥴산정추가정보
        		sOutDatasets  		= "";
        		var fn_callBack		= "fn_callBack";		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_cust_btn_postSearch1_onclick = function(obj,e){
        	var sOpYn = "";
        	var args  = "";
        	
        	if(this.userGrp == "05") {//대리점의 경우 온라인 장착점 여부와 상관 없이 조회
        		sOpYn = "";
        	} else {
        		sOpYn = "Y";
        	}
        	
        	args = {  p_arg		: this.p_arg
        			, p_opYn	: sOpYn
        			, p_vkgrpNm	: this.div_detail.ed_agencyNm.value
        		   };
        	
        	Ex.core.popup(this, "대리점 조회", "comm::RTCOMMAgency_pop.xfdl", args, "modaless=false");
        }

        this.returnAgencyCd = function(res) {
        	this.div_detail.ed_agencyCd.set_value( res[0] );
        	this.div_detail.ed_agencyNm.set_value( res[1] );
        	this.div_detail.ed_dlvTel.set_value( FN_numberHyphenInReturn(res[2]) );
        	this.div_detail.ed_dlvAddr1.set_value( res[3] + ") " + res[4] + res[5] );
        	//거점여부
        	this.div_detail.ed_o2oYn.set_value(res[6]);

        	this.ds_time.clearData();
        	
        	//20200220 kstka 사용자 권한이 (영업관리자, 콜센터, 방문판매)인 경우에만 장착유형 선택
        	this.div_detail.rd_procType.set_enable(false);
        	if(this.userGrp == "01" || this.userGrp == "02" || this.userGrp == "05" || this.userGrp == "09"){
        		if(nvl(res[6]) == "Y"){
        			//this.div_detail.rd_procType.set_enable(true);
        			
        			//장착시간 초기화
        			this.initTmsInfo();
        			
        			//20200317 kstka 거점 스케쥴 정보 조회
        			this.o2oAgencyTime(res[0]);
        		}else{
        			this.ds_list.set_updatecontrol(false);
        			this.ds_list.setRowType(this.ds_list.rowposition, Dataset.ROWTYPE_NORMAL);
        			this.div_detail.rd_procType.set_index(1);	
        			this.ds_list.set_updatecontrol(true);
        			//this.div_detail.rd_procType.set_enable(false);
        		}
        	}
        }

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_detail_bt_addr_onclick = function(obj,e) {
        	var args = {p_arg : this.p_arg};
        	
        	Ex.core.popup(this, "우편번호 조회", "comm::RTCOMMPostCode_pop.xfdl", args, "modaless=false");
        }
        this.FN_postCd = function(res ){
        	this.div_detail.ed_dlvposCd.set_value( res[0] );
        	this.div_detail.ed_dlvAddr1.set_value( res[1] );
        	this.div_detail.ed_dlvAddr2.set_value( res[2] );
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
        this.div_detail_ed_dlvTel_onkeyup = function(obj,e){
        	FN_numberHyphenIn(obj, e);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_detail_ca_dlvrDay_onchanged = function(obj,e){
        	var procType = nvl(this.div_detail.rd_procType.value);
        	
        	
        // 	if(procType == "1010" & this.o2oAgencyStockTot <= 0){ //방문장착 + 거점재고 미존재
        // 		
        // 		if( this.div_detail.ca_dlvrDay.value < this.selectServrqDay ){
        // 			var yyyy = Eco.date.addDate( this.toDay, 3).substr(0,4);
        // 			var mm = Eco.date.addDate( this.toDay, 3).substr(4,2);
        // 			var dd = Eco.date.addDate( this.toDay, 3).substr(6,2);
        // 			alert( yyyy+"-"+mm+"-"+dd + " 이후 예정일만 선택가능합니다." );
        // 			this.div_detail.ca_dlvrDay.set_value( Eco.date.addDate( this.toDay, 3) );
        // 			//alert( this.selectServrqDay  + " 이후 예정일만 선택가능합니다." );
        // 			this.ds_list.setColumn( this.ds_list.rowposition, "servrqDay", yyyy+mm+dd );
        // 		}
        // 	}else if(procType == "1010" & this.o2oAgencyStockTot > 0){ //방문장착 + 거점재고 존재
        // 	
        // 		if( this.div_detail.ca_dlvrDay.value < this.toDay ){
        // 			var yyyy = this.toDay.substr(0,4);
        // 			var mm = this.toDay.substr(4,2);
        // 			var dd = this.toDay.substr(6,2);
        // 			alert( yyyy+"-"+mm+"-"+dd + " 이후 예정일만 선택가능합니다." );
        // 			this.div_detail.ca_dlvrDay.set_value( this.toDay );
        // 			this.ds_list.setColumn( this.ds_list.rowposition, "servrqDay", yyyy+mm+dd );
        // 		}
        // 	}else{ //전문점장착
        // 		
        // 		if( this.div_detail.ca_dlvrDay.value < this.selectServrqDay ){
        // 			var yyyy = Eco.date.addDate( this.toDay, 3).substr(0,4);
        // 			var mm = Eco.date.addDate( this.toDay, 3).substr(4,2);
        // 			var dd = Eco.date.addDate( this.toDay, 3).substr(6,2);
        // 			alert( yyyy+"-"+mm+"-"+dd + " 이후 예정일만 선택가능합니다." );
        // 			this.div_detail.ca_dlvrDay.set_value( Eco.date.addDate( this.toDay, 3) );
        // 			this.ds_list.setColumn( this.ds_list.rowposition, "servrqDay", yyyy+mm+dd );
        // 		}
        // 	}
        	
        	//장착 시간 초기화
        	this.initTmsInfo();

        	if( this.div_detail.ca_dlvrDay.value < this.selectServrqDay ){
        		var yyyy = this.selectServrqDay.substr(0,4);
        		var mm = this.selectServrqDay.substr(4,2);
        		var dd = this.selectServrqDay.substr(6,2);
        		alert( yyyy+"-"+mm+"-"+dd + " 이후 예정일만 선택가능합니다." );
        		this.div_detail.ca_dlvrDay.set_value( this.selectServrqDay );
        		this.ds_list.setColumn( this.ds_list.rowposition, "servrqDay", yyyy+mm+dd );
        	}
        	
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
        	var o2oYn    = nvl(this.div_detail.ed_o2oYn.value);
        	
        	//거점 연계 정보 초기화
        	this.div_detail.rd_procType.set_enable(false);
        	this.div_detail.btn_postSearch.set_enable(false);
        	this.div_detail.ca_dlvrDay.set_enable(false);
        	this.div_detail.cb_time.set_enable(false);
        	
        	this.div_detail.cb_dlvGb.set_enable(false);
        	this.div_detail.cb_cntNm.set_enable(false);
        	
        	trace("dlvStat::" + dlvStat);
        	if( dlvStat == "" ){
        		this.div_detail.set_enable(true);
        		this.div_detail.bt_agency.set_enable(true);
        		this.ds_list.set_updatecontrol(false);
        		this.ds_list.setRowType(nRow, Dataset.ROWTYPE_NORMAL);
        		this.div_detail.rd_procType.set_index(1);
        		this.div_detail.cb_dlvGb.set_index(0);	
        		this.ds_list.set_updatecontrol(true);
        		//this.cb_deliveryStat.set_enable(false);
        		
        		this.div_detail.rd_procType.set_enable(false);
        		this.div_detail.ca_dlvrDay.set_enable(true);
        		this.div_detail.cb_time.set_enable(true);
        		
        		this.div_detail.cb_dlvGb.set_enable(true);
        		this.div_detail.cb_cntNm.set_enable(true);
        		
        	}else if(dlvStat == "01"){
        		this.div_detail.set_enable(true);
        		this.div_detail.bt_agency.set_enable(false);
        		this.div_detail.rd_timeType.set_enable(false);			
        	}else{
        		this.div_detail.set_enable(false);		
        	}
        	
        	if(this.userGrp != "01"){
        		this.cb_deliveryStat.set_enable(false);
        	}else{
        		this.cb_deliveryStat.set_enable(true);
        	}
        	
        	this.ds_rtsd0213.clearData();
        	this.ds_rtsd0213.addRow();
        	
        	//this.FN_changeInfo();
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.FN_changeInfo = function(){
        	var nRow	= this.ds_list.rowposition;
        //	var dlvGb 	= nvl(this.ds_list.getColumn(nRow, "dlvGb"));			
        	this.div_detail.bt_agency.set_visible(true);
        	this.div_detail.ed_agencyCd.set_visible(true);
        	//this.div_detail.bt_agency.set_visible(true);
        	this.div_detail.ed_agencyNm.set_visible(true);
        	//this.div_detail.st_dlvrDay.set_visible(true);
        	this.div_detail.ca_dlvrDay.set_visible(true);	
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

        this.fn_C024 = function(){
        	
        	var sSvcID      	= "selectC024";  
        	var sController   	= "ntrms/cs/geteZeroServiceCommCode.do";
        	var sInDatasets   	= "";
        	var sOutDatasets	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	sOutDatasets += " ds_C024=outputC024 ";
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        this.div_search_btn_custPopUp_onclick = function(obj,e)
        {
        	var args ={p_arg : this.p_arg};
        	Ex.core.popup(this,"고객찾기","comm::RTCOMMCust_pop.xfdl",args, "modaless=false");
        }
        this.returnCustInfo = function(res){
        	this.div_search.ed_custNo.set_value( res[0] );
        	this.div_search.ed_custNm.set_value( res[1] );
        }

        
        this.div_search_btn_custPopUp00_onclick = function(obj,e)
        {
        	var args ={ p_arg : this.p_arg };
        	Ex.core.popup(this,"계약번호 조회","comm::RTCOMMOrderNo_pop.xfdl",args, "modaless=false");
        }
        this.returnOrderNo = function(ordNo){
        	this.div_search.ed_ordNo.set_value(ordNo);
        }

        this.div_detail_ca_dlvrDay_canchange = function(obj,e)
        {
        	if(e.postvalue > "20190911" && e.postvalue < "20190917") {
        		return false;
        	}
        }

        this.div_detail_rd_procType_onitemchanged = function(obj,e)
        {
        	var procType = nvl(obj.value);
        	
        	//주소 초기화
        	this.div_detail.ed_dlvAddr1.set_value("");
        	
        	//방문장착인경우에만 고객주소 입력가능
        	this.div_detail.btn_postSearch.set_enable(false);	
        	this.div_detail.rd_baseType.set_enable(false);
        	this.div_detail.rd_timeType.set_enable(false);
        	this.div_detail.btn_timeSearch.set_enable(false);
        	this.div_detail.bt_agency.set_enable(true);
        	
        	this.initTmsInfo();
        		
        	if(procType == "1010"){		
        		
        		this.div_detail.cb_dlvGb.set_value("01");	//default: 01 장착
        	
        		this.div_detail.btn_postSearch.set_enable(true);
        		this.div_detail.rd_baseType.set_enable(true);
        		this.div_detail.rd_timeType.set_enable(true);
        		this.div_detail.btn_timeSearch.set_enable(true);
        		this.div_detail.bt_agency.set_enable(false);
        		
        		//20200406 kstka 초기 설정은 3일 이후
        		this.div_detail.ca_dlvrDay.set_value(this.selectServrqDay);
        	}else{
        		this.div_detail.ca_dlvrDay.set_value(this.selectServrqDay);
        	}
        }

        this.div_installInfo_btn_postSearch00_onclick = function(obj,e)
        {
        	var args ={p_arg : "RTSDCustRegister_1"};
        	Ex.core.popup(this,"우편번호 조회","comm::RTCOMMPostCode_pop.xfdl",args, "modaless=false");
        }

        this.FN_postCd = function(res,division ){
        	
        	var posCd = (nvl(res[0]) == ""?"":nvl(res[0]) + ") ");
        	var addr1 = res[1];
        	var addr2 = res[2];
        	
        	var siNm = res[4];
        	var sggNm = res[5];
        	var emdNm = res[6];
        	
        	this.div_detail.ed_dlvAddr1.set_value(posCd + addr1 + addr2);
        	this.div_detail.ed_siNm00.set_value(siNm);
        	this.div_detail.ed_sggNm00.set_value(sggNm);
        	this.div_detail.ed_emdNm00.set_value(emdNm);
        	
        	var cntCd = nvl(this.div_detail.cb_cntNm.value);
        	
        	if(cntCd == ""){
        		this.alert("[거점재고]신청 수량이 입력되지 않았습니다.");
        		this.div_detail.ed_dlvAddr1.set_value("");
        		return false;
        	}
        	
        	//장착시간 초기화
        	this.initTmsInfo();
        	
        	//20200406 kstka 영업관리자, 콜센터만 거점재고체크
        	if(this.userGrp == "01" || this.userGrp == "02"){
        		this.div_detail.kakao_interface.document.getElementById("address").value = addr1 + addr2;
        		this.div_detail.kakao_interface.document.getElementById("fn_map").click();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_detail_kakao_interface_onusernotify = function(obj,e)
        {
        	var doc = this.div_detail.kakao_interface.document;
        	var xcoords = doc.getElementById("xcoords").value;
        	var ycoords = doc.getElementById("ycoords").value;

        	var siNm = this.div_detail.ed_siNm00.value;
        	var sggNm = this.div_detail.ed_sggNm00.value;
        	var emdNm = this.div_detail.ed_emdNm00.value;
        	
        	//거점재고 조회
        	//this.o2oAgencyStockTot(siNm, sggNm, emdNm, xcoords, ycoords);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_detail_btn_timeSearch_onclick = function(obj,e)
        {
        	var procType = this.div_detail.rd_procType.value;
        	var dlvrDay = this.div_detail.ca_dlvrDay.value;
        	var timeType = this.div_detail.rd_timeType.value;
        	var agencyCd = this.div_detail.ed_agencyCd.value;
        	var baseType = this.div_detail.rd_baseType.value;
        	var period = this.div_detail.rd_timeType.value;
        	var cntCd = this.div_detail.cb_cntNm.value;
        	//var cntCd = this.ds_list.getColumn(this.ds_list.rowposition,"cntCd");
        	var matCd = this.ds_list.getColumn(this.ds_list.rowposition,"matCd");
        	
        	
        	if(nvl(procType) == ""){
        		this.alert("장착유형을 선택해주세요.");
        		return;
        	}
        	if(nvl(dlvrDay) == ""){
        		this.alert("교체일자를 선택해주세요.");
        		return;
        	}
        	if(nvl(period) == ""){
        		this.alert("오전/오후 구분을 선택해주세요.");
        		return;
        	}
        	if(nvl(baseType) == ""){
        		this.alert("지하여부 구분을 선택해주세요.");
        		return;
        	}
        	
        	//방문장착, 전문점장착
        	var dlvAddr1 = this.div_detail.ed_dlvAddr1.value;
        	
        	var siNm00 = this.div_detail.ed_siNm00.value;
        	var sggNm00 = this.div_detail.ed_sggNm00.value;
        	var emdNm00 = this.div_detail.ed_emdNm00.value;
        	
        	//방문장착 및 전문점장착	
        	if(nvl(siNm00) == "" || nvl(sggNm00) == "" || nvl(emdNm00) == ""){
        		this.alert("주소를 입력해 주세요.");
        		return;
        	}
        	
        	//yyyy-mm-dd 날짜타입 변경
        	var dlvrDay = nvl(this.div_detail.ca_dlvrDay.value);
        	var dlvrDayFormat = dlvrDay.substring(0, 4) + "-" + dlvrDay.substring(4, 6) + "-" + dlvrDay.substring(6, 8);
        	
        	var posCdExp = /[0-9]{5}[)]/g;
        	var posCd = "";
        	var _addr1 = "";
        	
        	if(posCdExp.test(dlvAddr1) == true){
        		posCd = dlvAddr1.substring(0, 5);
        		_addr1 = dlvAddr1.substring(7);
        	}else{
        		this.alert("대리점정보에 우편번호가 존재하지 않습니다.");
        		return;
        	}
        	
        	var bhfType = "";
        		
        	//D+3일 이후 - 재고체크 안함
        	if(dlvrDay >= this.selectServrqDay){
        		bhfType = "RDC";
        	}else{
        		bhfType = "BHF";
        	}
        	
        	this.ds_tms.clearData();
        	this.ds_tmsItem.clearData();
        	this.ds_tms.addRow();
        	this.ds_tmsItem.addRow();
        	
        	this.ds_tms.setColumn(0, "sendURL", "/rentalapi/tms/allocation.do");
        	this.ds_tms.setColumn(0, "reqDt", encodeURI(dlvrDayFormat));
        	this.ds_tms.setColumn(0, "city", encodeURI(siNm00));
        	this.ds_tms.setColumn(0, "county", encodeURI(sggNm00));
        	this.ds_tms.setColumn(0, "dong", encodeURI(emdNm00));
        	this.ds_tms.setColumn(0, "bhfType", encodeURI(bhfType));
        	this.ds_tms.setColumn(0, "period", encodeURI(period));
        	this.ds_tms.setColumn(0, "address", encodeURI(_addr1));
        	this.ds_tms.setColumn(0, "basementPsbYn", encodeURI(baseType));
        	this.ds_tms.setColumn(0, "wheelAlignment", encodeURI("N"));
        	this.ds_tms.setColumn(0, "orderType", encodeURI("visit")); //방문장착
        	this.ds_tms.setColumn(0, "totQty", encodeURI(Number(cntCd)));
        	
        	//pickup&delivery
        	this.ds_tms.setColumn(0, "dCity", "");
        	this.ds_tms.setColumn(0, "dCounty", "");
        	this.ds_tms.setColumn(0, "dDong", "");
        	this.ds_tms.setColumn(0, "dAddress", "");
        		
        	//20200309 kstka item목록 생성
        	this.ds_tmsItem.setColumn(0, "itemCd", encodeURI(matCd));
        	this.ds_tmsItem.setColumn(0, "reqQy", encodeURI(Number(cntCd)));
        	

        	var sSvcID        	= "tmsSchedules";                    
        	var sController   	= "/rtms/sd/tmsSchedules.do";
        	var sInDatasets   	= " ds_tms=ds_tms ";
        	    sInDatasets    += " ds_tmsItem=ds_tmsItem ";
        	var sOutDatasets  	= " ds_time=timeTables ";
        		sOutDatasets   += " ds_orderId=orderIds ";
        		sOutDatasets   += " ds_schedule=schedules ";
        		sOutDatasets   += " ds_agency=agencys ";
        	var sArgs 			= "";		
        	var fn_callBack		= "fn_callBack";

        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_detail_cb_time_onitemchanged = function(obj,e)
        {
        	var time = obj.value;
        	var agencyCd_oms = "";
        	
        	var procType = this.div_detail.rd_procType.value;
        	
        	if(procType == "1010"){
        		this.ds_agency.set_filterstr("cd==" + time);
        		agencyCd_oms = this.ds_agency.getColumn(0, "cdNm");
        		
        		//대리점코드, 대리점명,  sales office, sales group
        		this.o2oAgencyInfo(agencyCd_oms);
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.o2oAgencyInfo = function(agencyCd){

        	var sSvcID        	= "o2oAgencyInfo";                    
        	var sController   	= "/rtms/sd/o2oAgencyInfo.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= " ds_o2oAgencyInfo=o2oAgencyInfo ";
        	var sArgs 			= Ex.util.setParam("agencyCd", agencyCd);		
        	var fn_callBack		= "fn_callBack";

        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.o2oAgencyTime = function(agencyCd){

        	var sSvcID        	= "o2oAgencyTime";                    
        	var sController   	= "/rtms/sd/o2oAgencyTime.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= " ds_time=o2oAgencyTime ";
        	var sArgs 			= Ex.util.setParam("agencyCd", agencyCd);		
        	var fn_callBack		= "fn_callBack";

        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.o2oAgencyStockTot = function(siNm,sggNm,emdNm,xcoords,ycoords){

        	var cntCd = nvl(this.div_detail.cb_cntNm.value);
        	var matCd = nvl(this.ds_list.getColumn(this.ds_list.rowposition,"matCd"));
        	
        	var sSvcID        	= "o2oAgencyStockTot";                    
        	var sController   	= "/rtms/sd/o2oAgencyStockTot.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= Ex.util.setParam("cntCd", Number(cntCd));
        	    sArgs 			+= Ex.util.setParam("matCd", matCd);
        	    sArgs 			+= Ex.util.setParam("siNm", siNm);
        	    sArgs 			+= Ex.util.setParam("sggNm", sggNm);
        	    sArgs 			+= Ex.util.setParam("emdNm", emdNm);
        	    sArgs 			+= Ex.util.setParam("xcoord", xcoords);
        	    sArgs 			+= Ex.util.setParam("ycoord", ycoords);
        	var fn_callBack		= "fn_callBack";

        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.initTmsInfo = function(){
        	
        	var procTm = this.div_detail.cb_time.value;
        	
        	//장착시간이 있을경우 초기화
        	if(nvl(procTm) != ""){
        		this.ds_time.clearData();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_detail_rd_baseType_onitemchanged = function(obj,e)
        {
        	this.initTmsInfo();
        }

        this.div_detail_cb_dlvGb_onitemchanged = function(obj,e)
        {
        	var dlvGb = nvl(obj.value);
        	var procType = this.div_detail.rd_procType.value;
        	if(dlvGb == "02"){ //수령이면
        		if(procType == "1010"){
        			this.div_detail.cb_dlvGb.set_value("01");
        			this.alert("방문장착은 수령 신청을 선택하실 수 없습니다.");
        		}
        	}
        }

        //[20230607_1] kstka
        //==================================================================================
        this.listControlAuth = function(mdlCd,prgmCd){
        	
        	var sSvcID        	= "listControlAuth";                    
        	var sController   	= "/rtms/cm/listControlAuth.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_controlAuth=output";
        	var sArgs 			= Ex.util.setParam("mdlCd", mdlCd);
        		sArgs 			+= Ex.util.setParam("prgmCd", prgmCd);
        	    
        	var fn_callBack		= "fn_callBack";

        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        this.getControlAuthCheck = function(controlId,userGrp,userId){
        	var expr = "controlId == '" + controlId + "'";
        	if(nvl(userGrp) != "") expr += " && userGrp == '" + userGrp + "'";
        	if(nvl(userId) != "") expr += " && userId == '" + userId + "'";
        	expr += " && useYn == 'Y'";
        	
        	var nRow = this.ds_controlAuth.findRowExpr(expr);
        	if(nRow < 0) return "N";
        	if(nRow >= 0) return "Y";
        }
        //==================================================================================
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.ds_list.addEventHandler("canrowposchange", this.ds_list_canrowposchange, this);
            this.ds_list.addEventHandler("onrowposchanged", this.ds_list_onrowposchanged, this);
            this.addEventHandler("onload", this.RTCSEngineOilRepSer_onload, this);
            this.div_detail.bt_agency.addEventHandler("onclick", this.div_cust_btn_postSearch1_onclick, this);
            this.div_detail.ed_dlvDesc.addEventHandler("oneditclick", this.div_detail_ed_dlvDesc_oneditclick, this);
            this.div_detail.rd_procType.addEventHandler("onitemchanged", this.div_detail_rd_procType_onitemchanged, this);
            this.div_detail.btn_postSearch.addEventHandler("onclick", this.div_installInfo_btn_postSearch00_onclick, this);
            this.div_detail.ca_dlvrDay.addEventHandler("onchanged", this.div_detail_ca_dlvrDay_onchanged, this);
            this.div_detail.ca_dlvrDay.addEventHandler("canchange", this.div_detail_ca_dlvrDay_canchange, this);
            this.div_detail.cb_time.addEventHandler("onitemchanged", this.div_detail_cb_time_onitemchanged, this);
            this.div_detail.rd_baseType.addEventHandler("onitemchanged", this.div_detail_rd_baseType_onitemchanged, this);
            this.div_detail.ed_dlvTel.addEventHandler("onkeyup", this.div_detail_ed_dlvTel_onkeyup, this);
            this.div_detail.btn_timeSearch.addEventHandler("onclick", this.div_detail_btn_timeSearch_onclick, this);
            this.div_detail.ed_siNm00.addEventHandler("onkeyup", this.div_detail_ed_dlvTel_onkeyup, this);
            this.div_detail.ed_sggNm00.addEventHandler("onkeyup", this.div_detail_ed_dlvTel_onkeyup, this);
            this.div_detail.ed_emdNm00.addEventHandler("onkeyup", this.div_detail_ed_dlvTel_onkeyup, this);
            this.div_detail.kakao_interface.addEventHandler("onusernotify", this.div_detail_kakao_interface_onusernotify, this);
            this.div_detail.cb_dlvGb.addEventHandler("onitemchanged", this.div_detail_cb_dlvGb_onitemchanged, this);
            this.div_search.btn_custPopUp.addEventHandler("onclick", this.div_search_btn_custPopUp_onclick, this);
            this.div_search.ed_ordNo.addEventHandler("onkeydown", this.div_search_ed_ordNo_onkeydown, this);
            this.div_search.btn_custPopUp00.addEventHandler("onclick", this.div_search_btn_custPopUp00_onclick, this);
            this.div_search.ed_mobNo.addEventHandler("onkeyup", this.div_search_ed_mobNo_onkeyup, this);
            this.div_search.ed_telNo.addEventHandler("onkeyup", this.div_search_ed_telNo_onkeyup, this);

        };

        this.loadIncludeScript("RTCSZeroService.xfdl");

       
    };
}
)();
