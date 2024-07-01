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
                this.set_name("RTCSEngineOilRepSer");
                this.set_classname("RTCSEngineOilRepService");
                this.set_titletext("엔진오일 교체서비스 신청");
                this._setFormPosition(0,0,1147,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_C020", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_C021", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_C022", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_C023", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_list", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"periodCd\" type=\"STRING\" size=\"256\"/><Column id=\"makerCd\" type=\"STRING\" size=\"256\"/><Column id=\"makerNm\" type=\"STRING\" size=\"256\"/><Column id=\"modelCd\" type=\"STRING\" size=\"256\"/><Column id=\"modelNm\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"carOwner\" type=\"STRING\" size=\"256\"/><Column id=\"servCnt0\" type=\"STRING\" size=\"256\"/><Column id=\"ordDay\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"posCd\" type=\"STRING\" size=\"256\"/><Column id=\"addr1\" type=\"STRING\" size=\"256\"/><Column id=\"addr2\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"dlvrYn\" type=\"STRING\" size=\"256\"/><Column id=\"dlvrDay\" type=\"STRING\" size=\"256\"/><Column id=\"dlvrSeq\" type=\"STRING\" size=\"256\"/><Column id=\"fuelCd\" type=\"STRING\" size=\"256\"/><Column id=\"fuelNm\" type=\"STRING\" size=\"256\"/><Column id=\"yrmlCd\" type=\"STRING\" size=\"256\"/><Column id=\"yrmlNm\" type=\"STRING\" size=\"256\"/><Column id=\"dsplmtCd\" type=\"STRING\" size=\"256\"/><Column id=\"dsplmtNm\" type=\"STRING\" size=\"256\"/><Column id=\"dlvGb\" type=\"STRING\" size=\"256\"/><Column id=\"dlvgbNm\" type=\"STRING\" size=\"256\"/><Column id=\"agencyCd\" type=\"STRING\" size=\"256\"/><Column id=\"agencyNm\" type=\"STRING\" size=\"256\"/><Column id=\"servrqDay\" type=\"STRING\" size=\"256\"/><Column id=\"consignee\" type=\"STRING\" size=\"256\"/><Column id=\"dlvposCd\" type=\"STRING\" size=\"256\"/><Column id=\"dlvAddr1\" type=\"STRING\" size=\"256\"/><Column id=\"dlvAddr2\" type=\"STRING\" size=\"256\"/><Column id=\"dlvTel\" type=\"STRING\" size=\"256\"/><Column id=\"dlvDesc\" type=\"STRING\" size=\"256\"/><Column id=\"dlvStat\" type=\"STRING\" size=\"256\"/><Column id=\"dlvstatNm\" type=\"STRING\" size=\"256\"/><Column id=\"apprAmt\" type=\"STRING\" size=\"256\"/><Column id=\"carId\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_save", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"dlvrDay\" type=\"STRING\" size=\"256\"/><Column id=\"dlvrSeq\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"servSeq\" type=\"STRING\" size=\"256\"/><Column id=\"dlvStat\" type=\"STRING\" size=\"256\"/><Column id=\"fuelCd\" type=\"STRING\" size=\"256\"/><Column id=\"yrmlCd\" type=\"STRING\" size=\"256\"/><Column id=\"dsplmtCd\" type=\"STRING\" size=\"256\"/><Column id=\"dlvGb\" type=\"STRING\" size=\"256\"/><Column id=\"agencyCd\" type=\"STRING\" size=\"256\"/><Column id=\"consignee\" type=\"STRING\" size=\"256\"/><Column id=\"posCd\" type=\"STRING\" size=\"256\"/><Column id=\"addr1\" type=\"STRING\" size=\"256\"/><Column id=\"addr2\" type=\"STRING\" size=\"256\"/><Column id=\"dlvTel\" type=\"STRING\" size=\"256\"/><Column id=\"dlvDesc\" type=\"STRING\" size=\"256\"/><Column id=\"servrqDay\" type=\"STRING\" size=\"256\"/><Column id=\"downDay\" type=\"STRING\" size=\"256\"/><Column id=\"dlvsDay\" type=\"STRING\" size=\"256\"/><Column id=\"dlvEnt\" type=\"STRING\" size=\"256\"/><Column id=\"trspDoc\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"smsMsg\" type=\"STRING\" size=\"256\"/><Column id=\"carId\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_C019", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_cust", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"bldMngNo\" type=\"STRING\" size=\"256\"/><Column id=\"posCd\" type=\"STRING\" size=\"256\"/><Column id=\"addr1\" type=\"STRING\" size=\"256\"/><Column id=\"addr2\" type=\"STRING\" size=\"256\"/><Column id=\"emailAddr\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_Holiday", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"HLDYDATE\" type=\"STRING\" size=\"256\"/><Column id=\"TEXTCOLOR\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"HLDYDATE\">20190906</Col><Col id=\"TEXTCOLOR\">red</Col></Row><Row><Col id=\"HLDYDATE\">20190907</Col><Col id=\"TEXTCOLOR\">red</Col></Row><Row><Col id=\"HLDYDATE\">20190908</Col><Col id=\"TEXTCOLOR\">red</Col></Row><Row><Col id=\"HLDYDATE\">20190909</Col><Col id=\"TEXTCOLOR\">red</Col></Row><Row><Col id=\"HLDYDATE\">20190910</Col><Col id=\"TEXTCOLOR\">red</Col></Row><Row><Col id=\"HLDYDATE\">20190911</Col><Col id=\"TEXTCOLOR\">red</Col></Row><Row><Col id=\"HLDYDATE\">20190912</Col><Col id=\"TEXTCOLOR\">red</Col></Row><Row><Col id=\"HLDYDATE\">20190913</Col><Col id=\"TEXTCOLOR\">red</Col></Row><Row><Col id=\"HLDYDATE\">20190914</Col><Col id=\"TEXTCOLOR\">red</Col></Row><Row><Col id=\"HLDYDATE\">20190915</Col><Col id=\"TEXTCOLOR\">red</Col></Row><Row><Col id=\"HLDYDATE\">20190916</Col><Col id=\"TEXTCOLOR\">red</Col></Row></Rows>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
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

            obj = new Static("Static01", "absolute", "1122", "0", "25", "496", null, null, this);
            obj.set_taborder("1");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "0", "89", "81", "20", null, null, this);
            obj.set_taborder("2");
            obj.set_text("검색결과");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Grid("gr_list", "absolute", "0", "114", "1122", "139", null, null, this);
            obj.set_taborder("7");
            obj.set_binddataset("ds_list");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"100\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"140\"/><Column size=\"60\"/><Column size=\"60\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"120\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"100\"/><Column size=\"80\"/><Column size=\"100\"/><Column size=\"80\"/><Column size=\"100\"/><Column size=\"79\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"계약번호\"/><Cell col=\"1\" text=\"고객번호\"/><Cell col=\"2\" text=\"고객명\"/><Cell col=\"3\" text=\"상품명\"/><Cell col=\"4\" text=\"계약본수\"/><Cell col=\"5\" text=\"계약기간\"/><Cell col=\"6\" text=\"차종\"/><Cell col=\"7\" text=\"차량번호\"/><Cell col=\"8\" text=\"엔진오일 잔여횟수\"/><Cell col=\"9\" text=\"계약일자\"/><Cell col=\"10\" text=\"장착일자\"/><Cell col=\"11\" text=\"교체신청여부\"/><Cell col=\"12\" text=\"교체신청일자\"/><Cell col=\"13\" text=\"배송지구분\"/><Cell col=\"14\" text=\"상태\"/><Cell col=\"15\" text=\"연체금액\"/><Cell col=\"16\" text=\"차대번호\"/></Band><Band id=\"body\"><Cell displaytype=\"text\" edittype=\"readonly\" text=\"bind:ordNo\" tooltiptext=\"bind:ordNo\"/><Cell col=\"1\" text=\"bind:custNo\" tooltiptext=\"bind:custNo\"/><Cell col=\"2\" text=\"bind:custNm\" tooltiptext=\"bind:custNm\"/><Cell col=\"3\" text=\"bind:matNm\" tooltiptext=\"bind:matNm\"/><Cell col=\"4\" text=\"bind:cntCd\" tooltiptext=\"bind:cntCd\"/><Cell col=\"5\" text=\"bind:periodCd\" tooltiptext=\"bind:periodCd\"/><Cell col=\"6\" text=\"bind:modelNm\" tooltiptext=\"bind:modelNm\"/><Cell col=\"7\" text=\"bind:carNo\" tooltiptext=\"bind:carNo\"/><Cell col=\"8\" text=\"bind:servCnt0\" tooltiptext=\"bind:servCnt0\"/><Cell col=\"9\" displaytype=\"date\" text=\"bind:ordDay\" calendardisplaynulltype=\"none\"/><Cell col=\"10\" displaytype=\"date\" text=\"bind:procDay\" calendardisplaynulltype=\"none\" tooltiptext=\"bind:procDay\"/><Cell col=\"11\" text=\"bind:dlvrYn\" tooltiptext=\"bind:dlvrYn\"/><Cell col=\"12\" displaytype=\"date\" text=\"bind:dlvrDay\" calendardisplaynulltype=\"none\" tooltiptext=\"bind:dlvrDay\"/><Cell col=\"13\" style=\"background2: ;\" text=\"bind:dlvgbNm\" tooltiptext=\"bind:dlvgbNm\"/><Cell col=\"14\" text=\"bind:dlvstatNm\" tooltiptext=\"bind:dlvstatNm\"/><Cell col=\"15\" displaytype=\"number\" style=\"align:right;\" text=\"bind:apprAmt\" mask=\"###,###,###,##0\"/><Cell col=\"16\" text=\"bind:carId\"/></Band></Format></Formats>");
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

            obj = new Static("Static04", "absolute", "0", "260", "81", "20", null, null, this);
            obj.set_taborder("6");
            obj.set_text("서비스 신청 내용");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "0", "275", "1147", "10", null, null, this);
            obj.set_taborder("8");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Div("div_detail", "absolute", "0", "282", "1122", "214", null, null, this);
            obj.set_taborder("9");
            obj.set_scrollbars("none");
            obj.set_enable("true");
            this.addChild(obj.name, obj);
            obj = new Static("Static34", "absolute", "0", "60", "1122", "31", null, null, this.div_detail);
            obj.set_taborder("1");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("st_modelNm", "absolute", "0", "60", "130", "31", null, null, this.div_detail);
            obj.set_taborder("2");
            obj.set_text("차종");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_detail.addChild(obj.name, obj);
            obj = new Edit("ed_modelNm", "absolute", "134", "65", "142", "21", null, null, this.div_detail);
            obj.set_taborder("9");
            obj.set_enable("false");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("st_yrmlCd", "absolute", "280", "60", "130", "31", null, null, this.div_detail);
            obj.set_taborder("3");
            obj.set_text("연식");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("st_agency", "absolute", "560", "60", "130", "31", null, null, this.div_detail);
            obj.set_taborder("4");
            obj.set_text("교체점코드");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_detail.addChild(obj.name, obj);
            obj = new Edit("ed_agencyCd", "absolute", "694", "65", "71", "21", null, null, this.div_detail);
            obj.set_taborder("5");
            obj.set_enable("false");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("st_dlvTel", "absolute", "840", "60", "130", "31", null, null, this.div_detail);
            obj.set_taborder("6");
            obj.set_text("연락처");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_detail.addChild(obj.name, obj);
            obj = new Edit("ed_dlvTel", "absolute", "974", "65", "143", "21", null, null, this.div_detail);
            obj.set_taborder("20");
            obj.set_enable("false");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "0", "90", "561", "31", null, null, this.div_detail);
            obj.set_taborder("7");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("st_carNo", "absolute", "0", "90", "130", "31", null, null, this.div_detail);
            obj.set_taborder("8");
            obj.set_text("차량 No");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_detail.addChild(obj.name, obj);
            obj = new Edit("ed_carNo", "absolute", "134", "95", "142", "21", null, null, this.div_detail);
            obj.set_taborder("10");
            obj.set_enable("false");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("st_dsplmtCd", "absolute", "280", "90", "130", "31", null, null, this.div_detail);
            obj.set_taborder("11");
            obj.set_text("배기량");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("Static24", "absolute", "0", "0", "561", "31", null, null, this.div_detail);
            obj.set_taborder("14");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("Static25", "absolute", "560", "0", "562", "31", null, null, this.div_detail);
            obj.set_taborder("21");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("Static20", "absolute", "12", "5", "200", "21", null, null, this.div_detail);
            obj.set_taborder("27");
            obj.set_text("차량 정보");
            obj.set_cssclass("Guide_title");
            obj.style.set_font("bold 10 dotum");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("Static23", "absolute", "572", "5", "200", "21", null, null, this.div_detail);
            obj.set_taborder("28");
            obj.set_text("배송지정보");
            obj.set_cssclass("Guide_title");
            obj.style.set_font("bold 10 dotum");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("Static26", "absolute", "0", "30", "1122", "31", null, null, this.div_detail);
            obj.set_taborder("29");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("st_makerNm", "absolute", "0", "30", "130", "31", null, null, this.div_detail);
            obj.set_taborder("30");
            obj.set_text("제조사");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_detail.addChild(obj.name, obj);
            obj = new Edit("ed_makerNm", "absolute", "134", "35", "142", "21", null, null, this.div_detail);
            obj.set_taborder("0");
            obj.set_enable("false");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("st_fuelCd", "absolute", "280", "30", "130", "31", null, null, this.div_detail);
            obj.set_taborder("31");
            obj.set_text("유종");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("st_dlvGb", "absolute", "560", "30", "130", "31", null, null, this.div_detail);
            obj.set_taborder("32");
            obj.set_text("배송지");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("st_dlvrDay", "absolute", "840", "30", "130", "31", null, null, this.div_detail);
            obj.set_taborder("33");
            obj.set_text("교체예정일");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("Static10", "absolute", "0", "120", "561", "31", null, null, this.div_detail);
            obj.set_taborder("34");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("st_carOwner", "absolute", "0", "120", "130", "31", null, null, this.div_detail);
            obj.set_taborder("35");
            obj.set_text("차량 소유자");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_detail.addChild(obj.name, obj);
            obj = new Edit("ed_carOwner", "absolute", "134", "125", "142", "21", null, null, this.div_detail);
            obj.set_taborder("12");
            obj.set_enable("false");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("Static11", "absolute", "560", "90", "562", "61", null, null, this.div_detail);
            obj.set_taborder("36");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("st_addr", "absolute", "560", "90", "130", "61", null, null, this.div_detail);
            obj.set_taborder("37");
            obj.set_text("주소");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_detail.addChild(obj.name, obj);
            obj = new Edit("ed_dlvposCd", "absolute", "694", "95", "71", "21", null, null, this.div_detail);
            obj.set_taborder("22");
            obj.set_maxlength("6");
            obj.set_enable("false");
            this.div_detail.addChild(obj.name, obj);
            obj = new Edit("ed_dlvAddr1", "absolute", "765", "95", "352", "21", null, null, this.div_detail);
            obj.set_taborder("24");
            obj.set_maxlength("6");
            obj.set_enable("false");
            this.div_detail.addChild(obj.name, obj);
            obj = new Edit("ed_dlvAddr2", "absolute", "694", "125", "424", "21", null, null, this.div_detail);
            obj.set_taborder("25");
            obj.set_maxlength("6");
            obj.set_enable("false");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("Static13", "absolute", "560", "150", "562", "61", null, null, this.div_detail);
            obj.set_taborder("38");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("st_dlvDesc", "absolute", "560", "150", "130", "61", null, null, this.div_detail);
            obj.set_taborder("39");
            obj.set_text("배송시 요청사항");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_detail.addChild(obj.name, obj);
            obj = new TextArea("ed_dlvDesc", "absolute", "694", "156", "424", "49", null, null, this.div_detail);
            obj.set_taborder("26");
            obj.set_maxlength("300");
            obj.set_wordwrap("char");
            this.div_detail.addChild(obj.name, obj);
            obj = new Combo("cb_fuelCd", "absolute", "414", "35", "142", "21", null, null, this.div_detail);
            this.div_detail.addChild(obj.name, obj);
            obj.set_taborder("13");
            obj.set_innerdataset("@ds_C020");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj = new Combo("cb_yrmlCd", "absolute", "414", "65", "142", "21", null, null, this.div_detail);
            this.div_detail.addChild(obj.name, obj);
            obj.set_taborder("15");
            obj.set_innerdataset("@ds_C021");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj = new Combo("cb_dsplmtCd", "absolute", "414", "95", "142", "21", null, null, this.div_detail);
            this.div_detail.addChild(obj.name, obj);
            obj.set_taborder("16");
            obj.set_innerdataset("@ds_C022");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj = new Combo("cb_dlvGb", "absolute", "694", "35", "142", "21", null, null, this.div_detail);
            this.div_detail.addChild(obj.name, obj);
            obj.set_taborder("17");
            obj.set_innerdataset("@ds_C023");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj = new Calendar("ca_dlvrDay", "absolute", "974", "35", "143", "21", null, null, this.div_detail);
            this.div_detail.addChild(obj.name, obj);
            obj.set_taborder("18");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_innerdataset("@ds_Holiday");
            obj.set_value("null");
            obj.set_textcolorcolumn("TEXTCOLOR");
            obj.set_datecolumn("HLDYDATE");
            obj = new Edit("ed_agencyNm", "absolute", "765", "65", "71", "21", null, null, this.div_detail);
            obj.set_taborder("40");
            obj.set_enable("false");
            this.div_detail.addChild(obj.name, obj);
            obj = new Button("bt_agency", "absolute", "745", "64", "20", "21", null, null, this.div_detail);
            obj.set_taborder("41");
            obj.set_cssclass("btn_WF_edtSch");
            obj.set_enable("false");
            obj.getSetter("domainId").set("nexa.save");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("st_consignee", "absolute", "560", "60", "130", "31", null, null, this.div_detail);
            obj.set_taborder("42");
            obj.set_text("수취인");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.set_visible("false");
            this.div_detail.addChild(obj.name, obj);
            obj = new Edit("ed_consignee", "absolute", "694", "65", "143", "21", null, null, this.div_detail);
            obj.set_taborder("19");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_detail.addChild(obj.name, obj);
            obj = new Button("bt_addr", "absolute", "745", "94", "20", "21", null, null, this.div_detail);
            obj.set_taborder("23");
            obj.set_cssclass("btn_WF_edtSch");
            obj.set_enable("false");
            obj.getSetter("domainId").set("nexa.save");
            this.div_detail.addChild(obj.name, obj);
            obj = new Edit("ed_mobNo", "absolute", "280", "125", "143", "21", null, null, this.div_detail);
            obj.set_taborder("43");
            obj.set_enable("false");
            this.div_detail.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "0", "432", "561", "31", null, null, this);
            obj.set_taborder("10");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_carOwner00", "absolute", "0", "432", "130", "31", null, null, this);
            obj.set_taborder("11");
            obj.set_text("상태");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Combo("cb_dlvStatCd00", "absolute", "134", "437", "142", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("12");
            obj.set_innerdataset("@ds_C019");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj.set_enable("false");

            obj = new Static("st_carId", "absolute", "280", "432", "130", "31", null, null, this);
            obj.set_taborder("13");
            obj.set_text("차대번호");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_carId", "absolute", "414", "437", "142", "21", null, null, this);
            obj.set_taborder("14");
            obj.set_enable("true");
            this.addChild(obj.name, obj);


            
            // Layout Functions
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
            obj = new Layout("default", "", 1122, 214, this.div_detail,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("9");
            		p.set_scrollbars("none");
            		p.set_enable("true");

            	}
            );
            this.div_detail.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1147, 496, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCSEngineOilRepService");
            		p.set_titletext("엔진오일 교체서비스 신청");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item1","div_detail.ed_modelNm","value","ds_list","modelNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item8","div_detail.ed_agencyCd","value","ds_list","agencyCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item11","div_detail.ed_dlvTel","value","ds_list","dlvTel");
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
            obj = new BindItem("item13","div_detail.ed_dlvposCd","value","ds_list","dlvposCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item14","div_detail.ed_dlvAddr1","value","ds_list","dlvAddr1");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item15","div_detail.ed_dlvAddr2","value","ds_list","dlvAddr2");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item16","div_detail.ed_dlvDesc","value","ds_list","dlvDesc");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item4","div_detail.cb_fuelCd","value","ds_list","fuelCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item5","div_detail.cb_yrmlCd","value","ds_list","yrmlCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item6","div_detail.cb_dsplmtCd","value","ds_list","dsplmtCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item7","div_detail.cb_dlvGb","value","ds_list","dlvGb");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item9","div_detail.ed_agencyNm","value","ds_list","agencyNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item10","div_detail.ed_consignee","value","ds_list","consignee");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item12","div_detail.ca_dlvrDay","value","ds_list","servrqDay");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item17","div_detail.ed_mobNo","value","ds_list","mobNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item18","cb_dlvStatCd00","value","ds_list","dlvStat");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item19","ed_carId","value","ds_list","carId");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCSEngineOilRepSer.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCSEngineOilRepSer.xfdl", function() {
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //include "lib::comLib.xjs";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.p_arg 				= "RTCSEngineOilRepSer";
        this.toDay 				= "";
        this.selectServrqDay	= "";

        this.userGrp = "";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg){
        	if( strSvcId == "intiRTCSEngineOilRepSer" ){
        		
        	}
        	
        	if( strSvcId == "getToday" ){
        		if( this.toDay != "" ){
        			var sSvcID      	= "selectServrqDay";  
        			var sController   	= "/rtms/cs/selectEngineOilServrqDay.do";
        			var sInDatasets   	= "";
        			var sOutDatasets  	= "";
        			var sArgs 			= "";	
        			var fn_callBack		= "fn_callBack";
        			sArgs += Ex.util.setParam("period", 8);	//엔진오일신청일자는 7일후부터 20160329 한승훈, 2016-05-30 이영근 7->8로 변경
        			sArgs += Ex.util.setParam("toDay", this.toDay);
        			Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        		}
        	}
        	
        	if( strSvcId == "selectServrqDay" ){
        		
        	}
        	
        	if( strSvcId == "selectRTCSEngineOilRepSer" ){
        		var rowCt = this.ds_list.getRowCount();
        		if( rowCt == 0 ){
        			alert("조회된 데이터가 없습니다.");
        			this.gr_list.set_nodatatext("조회된 데이터가 없습니다.");
        		}else{
        			this.div_detail.bt_addr.set_enable(true);
        			this.div_detail.bt_agency.set_enable(true);
        			
        			//영업관리자만 활성화
        			if(this.userGrp == "01"){
        				this.cb_dlvStatCd00.set_enable(true);
        			}
        			
        			this.ds_list.set_updatecontrol(false);
        			this.ds_list_canrowposchange();
        			this.ds_list_onrowposchanged();
        			this.ds_list.set_updatecontrol(true);
        		}
        	}
        	
        	if( strSvcId == "saveRTCSEngineOilRepSer" ){
        		alert(strErrorMsg);
        		if( nErrorCode < 0 ){
        		
        		}else{
        			this.fn_search();
        		}
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.RTCSEngineOilRepSer_onload = function(obj,e){
        	Ex.core.init(obj);
        	this.fn_setButton();
        	this.fn_init();
        	this.fn_getToday();
        	
        	this.userGrp = application.gds_userInfo.getColumn(0, "userGrp");
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_setButton = function(){
        	this.parent.setButton("DL|C|S", this);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_init = function(){
        	var sSvcID      	= "intiRTCSEngineOilRepSer";  
        	var sController   	= "rtms/cs/intiRTCSEngineOilRepSer.do";
        	var sInDatasets   	= "";
        	var sOutDatasets	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	sOutDatasets += " ds_C019=mapDsC019 ";
        	sOutDatasets += " ds_C020=mapDsC020 ";
        	sOutDatasets += " ds_C021=mapDsC021 ";
        	sOutDatasets += " ds_C022=mapDsC022 ";
        	sOutDatasets += " ds_C023=mapDsC023 ";
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
        		alert("조회조건을 입력해주세요");
        	return;
        	}
        	
        	var sSvcID        	= "selectRTCSEngineOilRepSer";
        	var sController   	= "rtms/cs/selectRTCSEngineOilRepSer.do";
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
        	var fuelCd 		= nvl(this.ds_list.getColumn(saveRow, "fuelCd"));						//유종
        	var yrmlCd 		= nvl(this.ds_list.getColumn(saveRow, "yrmlCd"));						//연식
        	var dsplmtCd 	= nvl(this.ds_list.getColumn(saveRow, "dsplmtCd"));						//배기량
        	var dlvGb 		= nvl(this.ds_list.getColumn(saveRow, "dlvGb"));						//배송구분
        	var agencyCd 	= nvl(this.ds_list.getColumn(saveRow, "agencyCd"));						//교체점코드
        	var consignee	= "";
        	if( dlvGb == "01" ){
        		consignee 	= nvl(this.ds_list.getColumn(saveRow, "agencyNm"));						//수취인
        	}else{
        		consignee 	= nvl(this.ds_list.getColumn(saveRow, "consignee"));					//수취인
        	}
        	//var posCd 		= nvl(this.ds_list.getColumn(saveRow, "posCd"));						//주소
        	//var addr1 		= nvl(this.ds_list.getColumn(saveRow, "addr1"));						//주소
        	//var addr2 		= nvl(this.ds_list.getColumn(saveRow, "addr2"));						//주소
        	
        	var posCd 		= nvl(this.ds_list.getColumn(saveRow, "dlvposCd"));						//주소
        	var addr1 		= nvl(this.ds_list.getColumn(saveRow, "dlvAddr1"));						//주소
        	var addr2 		= nvl(this.ds_list.getColumn(saveRow, "dlvAddr2"));						//주소
        	
        	var dlvTel 		= FN_numberHyphenOut(nvl(this.ds_list.getColumn(saveRow, "dlvTel")));	//연락처
        	var dlvDesc 	= nvl(this.ds_list.getColumn(saveRow, "dlvDesc"));						//배송시요구사항
        	var servrqDay	= nvl(this.ds_list.getColumn(saveRow, "servrqDay"));					//교체예정일
        	var dlvStat		= nvl(this.ds_list.getColumn(saveRow, "dlvStat"));						//상태
        	var dlvrSeq		= nvl(this.ds_list.getColumn(saveRow, "dlvrSeq"));						//순번
        	var servSeq		= nvl(this.ds_list.getColumn(saveRow, "servSeq")); 						//서비스 순번
        	var downDay		= nvl(this.ds_list.getColumn(saveRow, "downDay"));						//다운처리일시
        	var dlvsDay		= nvl(this.ds_list.getColumn(saveRow, "dlvsDay"));						//송장적용일시
        	var dlvEnt		= nvl(this.ds_list.getColumn(saveRow, "dlvEnt"));						//배송업체
        	var trspDoc		= nvl(this.ds_list.getColumn(saveRow, "trspDoc"));						//송장번호
        	var dlvrDay		= nvl(this.ds_list.getColumn(saveRow, "dlvrDay"));						//교체신청일자
        	var apprAmt		= nvl(this.ds_list.getColumn(saveRow, "apprAmt"));						//교체신청일자
        	
        	var dlvrYn		= nvl(this.ds_list.getColumn(saveRow, "dlvrYn"));						//저장 OR 업데이트
        	
        	var carId       = nvl(this.ds_list.getColumn(saveRow, "carId"));						//차대번호 추가 2018.08.09 kstka
        	
        	//20190418 계약종료고객 서비스 신청 불가
        	//--------------------------------------------------------------------------------------------------------------------------------
        	var procDay     = nvl(this.ds_list.getColumn(saveRow, "procDay"));						//장착일자
        	var period      = nvl(this.ds_list.getColumn(saveRow, "periodCd"));						//계약기간

        	var procYear    = procDay.substr(0, 4);
        	var procMonth   = procDay.substr(4, 2);
        	var procDate    = procDay.substr(6, 2);

        	var osDay       = new Date(procYear, Number(procMonth) + Number(period), Number(procDate) - 1);

        	var osYear      = osDay.getFullYear() + 1;
        	var osMonth   = osDay.getMonth(); osMonth = (osMonth < 10) ? '0' + osMonth : osMonth;
        	var osDate      = osDay.getDate(); osDate = (osDate < 10) ? '0' + osDate : osDate;

        	var userId 	 = application.gds_userInfo.getColumn(0, "userId");
        	
        	if(osYear + "" + osMonth + ""  + osDate < this.toDay){
        		if(userId != "10164030" && userId != "10083012"){
        			alert("렌탈계약이 종료된 고객은 서비스를 신청 할 수 없습니다.\n 서비스신청문의는 관리자에게 문의해주세요.");
        			return;
        		}
        	}
        	//----------------------------------------------------------------------------------------------------------------------------------
        	
        	if( saveType != 4 ) {												alert("저장할 정보가 없습니다");	return false;
        	}else if( ordNo == "" ){ 											alert("계약번호"+msg);				return false;
        	}else if( custNo == "" ){ 											alert("고객번호"+msg);				return false;
        	}else if( fuelCd == "" ){ 											alert("유종"+msg);					return false;
        	}else if( yrmlCd == "" ){ 											alert("연식"+msg);					return false;
        	}else if( dsplmtCd == "" ){ 										alert("배기량"+msg);				return false;
        	}else if( dlvGb == "" ){ 											alert("배송구분"+msg);				return false;
        	}else if( (dlvGb == "01") && (agencyCd == "") ){ 					alert("교체점코드"+msg);			return false;
        	}else if( ((dlvGb == "02" || dlvGb == "03")) && (consignee == "") ){alert("수취인"+msg);				return false;
        	}else if( posCd == "" ){ 											alert("주소"+msg);					return false;
        	}else if( addr1 == "" ){ 											alert("주소"+msg);					return false;
        	}else if( addr2 == "" ){											alert("주소"+msg);					return false;
        	}else if( dlvTel == "" ){ 											alert("연락처"+msg);				return false;
        	}else if( ( dlvGb == "01" ) && servrqDay == "" ){					alert("교체예정일"+msg);			return false;
        	}else if( carId == "" ){ 											alert("차대번호"+msg);				return false;
        	}else if( (dlvStat != "01") && (dlvStat != "") ){					alert("요청접수상태가 아니므로 저장할 수가 없습니다."); return false;
        	}else if( this.FN_stringByteLength(dlvDesc) > 300){					alert("배송시 요청사항 크기가 300byte를 초과했습니다.\n한글일경우 150자, 영문일경우 300자 입니다."); return false;
        	}else if( apprAmt > 0 ){											alert("연체금액 "+this.FN_comma(apprAmt)+"(원)이 있으므로 저장할 수 없습니다."); return false;
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
        		// 2015-07-25 이영근, 전화번호 문자메시지 추가
        		this.ds_save.setColumn(nRowSave, "mobNo", 	    this.ds_list.getColumn(saveRow, "mobNo")); 
        		
        		//차대번호 추가 2018.08.09 kstka
        		this.ds_save.setColumn(nRowSave, "carId", 	    carId); 
        				
        		var smsMsg = "";
        		if(dlvrSeq == "")
        			smsMsg = this.ds_list.getColumn(saveRow, "custNm") + " 고객님께서 신청하신 엔진오일 서비스가 접수되었습니다.";
        		else
        			smsMsg = this.ds_list.getColumn(saveRow, "custNm") + " 고객님께서 신청하신 엔진오일 서비스가 변경되었습니다.";
        		if(dlvGb == "01"){
        			//smsMsg += " 대리점: " + consignee + ", 연락처:" + dlvTel + ", 교체 예정일: " + servrqDay;
        			smsMsg += " 대리점: " + consignee + ", 연락처:" + dlvTel;
        			
        		}else{
        			smsMsg += " 수취인: " + consignee + ", 연락처:" + dlvTel;
        		}
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
        		
        		if( confirm( "저장하시겠습니까?" ) ){
        			var sSvcID        	= "saveRTCSEngineOilRepSer"; 
        			var sController   	= "rtms/cs/saveRTCSEngineOilRepSer.do";
        			var sInDatasets   	= "";
        			var sOutDatasets  	= "";
        			var sArgs 			= "";
        			sInDatasets   		= "input=ds_save:U";
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
        	var fuelCd 		= nvl(this.ds_list.getColumn(saveRow, "fuelCd"));						//유종
        	var yrmlCd 		= nvl(this.ds_list.getColumn(saveRow, "yrmlCd"));						//연식
        	var dsplmtCd 	= nvl(this.ds_list.getColumn(saveRow, "dsplmtCd"));						//배기량
        	var dlvGb 		= nvl(this.ds_list.getColumn(saveRow, "dlvGb"));						//배송구분
        	var agencyCd 	= nvl(this.ds_list.getColumn(saveRow, "agencyCd"));						//교체점코드
        	var consignee	= "";
        	if( dlvGb == "01" ){
        		consignee 	= nvl(this.ds_list.getColumn(saveRow, "agencyNm"));						//수취인
        	}else{
        		consignee 	= nvl(this.ds_list.getColumn(saveRow, "consignee"));					//수취인
        	}
        	var posCd 		= nvl(this.ds_list.getColumn(saveRow, "posCd"));						//주소
        	var addr1 		= nvl(this.ds_list.getColumn(saveRow, "addr1"));						//주소
        	var addr2 		= nvl(this.ds_list.getColumn(saveRow, "addr2"));						//주소
        	var dlvTel 		= FN_numberHyphenOut(nvl(this.ds_list.getColumn(saveRow, "dlvTel")));	//연락처
        	var dlvDesc 	= nvl(this.ds_list.getColumn(saveRow, "dlvDesc"));						//배송시요구사항
        	var servrqDay	= nvl(this.ds_list.getColumn(saveRow, "servrqDay"));					//교체예정일
        	var dlvStat		= nvl(this.ds_list.getColumn(saveRow, "dlvStat"));						//상태
        	var dlvrSeq		= nvl(this.ds_list.getColumn(saveRow, "dlvrSeq"));						//순번
        	var servSeq		= nvl(this.ds_list.getColumn(saveRow, "servSeq")); 						//서비스 순번
        	var downDay		= nvl(this.ds_list.getColumn(saveRow, "downDay"));						//다운처리일시
        	var dlvsDay		= nvl(this.ds_list.getColumn(saveRow, "dlvsDay"));						//송장적용일시
        	var dlvEnt		= nvl(this.ds_list.getColumn(saveRow, "dlvEnt"));						//배송업체
        	var trspDoc		= nvl(this.ds_list.getColumn(saveRow, "trspDoc"));						//송장번호
        	var dlvrDay		= nvl(this.ds_list.getColumn(saveRow, "dlvrDay"));						//교체신청일자
        	
        	//20190507 요청접수상태가 아닐경우 영업관리자만 삭제 가능
        	if(dlvStat != "01" && this.userGrp != "01"){
        		this.alert("삭제 기능은 시스템관리자에게 문의하세요.");
        		return;
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
        	this.ds_save.set_updatecontrol(true);
        	
        	if( confirm( "삭제하시겠습니까?" ) ){
        		var sSvcID        	= "saveRTCSEngineOilRepSer"; 
        		var sController   	= "rtms/cs/saveRTCSEngineOilRepSer.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";
        		sInDatasets   		= "input=ds_save:U";
        		sOutDatasets  		= "";
        		var fn_callBack		= "fn_callBack";		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_cust_btn_postSearch1_onclick = function(obj,e) {
        	var args = {vkazcNm : this.div_detail.ed_agencyNm.value};
        	
        	Ex.core.popup(this, "대리점 조회", "comm::RTCOMMAgencyEngineOil_pop.xfdl", args, "modaless=false");
        }

        this.returnAgencyCd = function(res) {
        	this.div_detail.ed_agencyCd.set_value(res[4]);
        	this.div_detail.ed_agencyNm.set_value(res[5]);
        	this.div_detail.ed_dlvTel.set_value(FN_numberHyphenInReturn(res[6]));
        	this.div_detail.ed_dlvposCd.set_value(res[7]);
        	this.div_detail.ed_dlvAddr1.set_value(res[8]);
        	this.div_detail.ed_dlvAddr2.set_value(res[9]);
        }

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_detail_bt_addr_onclick = function(obj,e){
        	var args ={p_arg : this.p_arg};
        	Ex.core.popup(this,"우편번호 조회","comm::RTCOMMPostCode_pop.xfdl",args, "modaless=false");
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
        	if( this.div_detail.ca_dlvrDay.value < this.selectServrqDay ){
        		var yyyy = this.selectServrqDay.substr(0,4);
        		var mm = this.selectServrqDay.substr(4,2);
        		var dd = this.selectServrqDay.substr(6,2);
        		//var yyyy = Eco.date.addDate( this.toDay, 7).substr(0,4);
        		//var mm = Eco.date.addDate( this.toDay, 7).substr(4,2);
        		//var dd = Eco.date.addDate( this.toDay, 7).substr(6,2);
        		alert( yyyy+"-"+mm+"-"+dd + " 이후 예정일만 선택가능합니다." );
        	    //alert( this.selectServrqDay  + " 이후 예정일만 선택가능합니다." );
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
        this.ds_list_onrowposchanged = function(obj,e){
        	var nRow	 = this.ds_list.rowposition;
        	var dlvStat  = nvl(this.ds_list.getColumn(nRow, "dlvStat"));
        	
        	if( (dlvStat == "01") || (dlvStat == "") ){
        		this.div_detail.set_enable(true);
        	}else{
        		this.div_detail.set_enable(false);
        	}
        	
        	if(this.userGrp != "01"){
        		this.cb_dlvStatCd00.set_enable(false);
        	}else{
        		this.cb_dlvStatCd00.set_enable(true);
        	}
        	
        	this.FN_changeInfo();
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_detail_cb_dlvGb_onitemchanged = function(obj,e){
        	var nRow		= this.ds_list.rowposition;
        	var dlvStat 	= nvl(this.ds_list.getColumn(nRow, "dlvStat"));
        	var agencyCd 	= nvl(this.ds_list.getColumn(nRow, "agencyCd"));
        	var agencyNm 	= nvl(this.ds_list.getColumn(nRow, "agencyNm"));
        	var custNm 		= nvl(this.ds_list.getColumn(nRow, "custNm"));
        	var mobNo 		= nvl(this.ds_list.getColumn(nRow, "mobNo"));
        	var posCd 		= nvl(this.ds_list.getColumn(nRow, "posCd"));
        	var addr1 		= nvl(this.ds_list.getColumn(nRow, "addr1"));
        	var addr2 		= nvl(this.ds_list.getColumn(nRow, "addr2"));
        	var dlvDesc 	= nvl(this.ds_list.getColumn(nRow, "dlvDesc"));
        	var dlvGb 		= nvl(this.ds_list.getColumn(nRow, "dlvGb"));
        	
        	if( (dlvStat == "01") || (dlvStat == "") ){
        		this.ds_list.setColumn(nRow, "dlvgbNm", this.div_detail.cb_dlvGb.text);
        		
        		if( dlvGb == "01" ){
        			this.ds_list.setColumn(nRow, "agencyCd", "");
        			this.ds_list.setColumn(nRow, "agencyNm"	, "");
        			this.ds_list.setColumn(nRow, "consignee", "");
        			this.ds_list.setColumn(nRow, "dlvTel"	, "");
        			this.ds_list.setColumn(nRow, "dlvposCd"	, "");
        			this.ds_list.setColumn(nRow, "dlvAddr1"	, "");
        			this.ds_list.setColumn(nRow, "dlvAddr2"	, "");
        			this.ds_list.setColumn(nRow, "dlvDesc"	, "");
        			this.ds_list.setColumn(nRow, "servrqDay", this.selectServrqDay);
        			
        		}else if( dlvGb == "02" ){
        			this.ds_list.setColumn(nRow, "agencyCd", "");
        			this.ds_list.setColumn(nRow, "agencyNm"	, "");
        			this.ds_list.setColumn(nRow, "consignee", "");
        			this.ds_list.setColumn(nRow, "dlvTel"	, "");
        			this.ds_list.setColumn(nRow, "dlvposCd"	, "");
        			this.ds_list.setColumn(nRow, "dlvAddr1"	, "");
        			this.ds_list.setColumn(nRow, "dlvAddr2"	, "");
        			this.ds_list.setColumn(nRow, "dlvDesc"	, "");
        			this.ds_list.setColumn(nRow, "servrqDay", "");
        			this.ds_list.setColumn(nRow, "consignee", custNm);
        			this.ds_list.setColumn(nRow, "dlvTel"	, FN_numberHyphenInReturn(mobNo));
        			this.ds_list.setColumn(nRow, "dlvposCd"	, posCd);
        			this.ds_list.setColumn(nRow, "dlvAddr1"	, addr1);
        			this.ds_list.setColumn(nRow, "dlvAddr2"	, addr2);
        			
        		}else if( dlvGb == "03" ){
        			this.ds_list.setColumn(nRow, "agencyCd" , "");
        			this.ds_list.setColumn(nRow, "agencyNm"	, "");
        			this.ds_list.setColumn(nRow, "consignee", "");
        			this.ds_list.setColumn(nRow, "dlvTel"	, "");
        			this.ds_list.setColumn(nRow, "dlvposCd"	, "");
        			this.ds_list.setColumn(nRow, "dlvAddr1"	, "");
        			this.ds_list.setColumn(nRow, "dlvAddr2"	, "");
        			this.ds_list.setColumn(nRow, "dlvDesc"	, "");
        			this.ds_list.setColumn(nRow, "servrqDay", "");
        			
        		}else{
        			//alert("배송지 코드값 오류입니다");
        		}
        		
        		this.FN_changeInfo();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.FN_changeInfo = function(){
        	var nRow	= this.ds_list.rowposition;
        	var dlvGb 	= nvl(this.ds_list.getColumn(nRow, "dlvGb"));

        	if( dlvGb == "01" ){
        		this.div_detail.ed_consignee.set_enable(false);
        		this.div_detail.ed_dlvTel.set_enable(false);
        		this.div_detail.bt_addr.set_visible(false);
        		
        	}else if( dlvGb == "02" ){
        		this.div_detail.ed_consignee.set_enable(false);
        		this.div_detail.ed_dlvTel.set_enable(false);
        		this.div_detail.bt_addr.set_visible(false);
        		
        	}else if( dlvGb == "03" ){
        		this.div_detail.ed_consignee.set_enable(true);
        		this.div_detail.ed_dlvTel.set_enable(true);
        		this.div_detail.bt_addr.set_visible(true);
        		
        	}else{
        		//alert("배송지 코드값 오류입니다");
        	}
        	
        	if( (dlvGb == "02") || (dlvGb == "03") ){
        		this.div_detail.st_agency.set_visible(false);
        		this.div_detail.ed_agencyCd.set_visible(false);
        		this.div_detail.bt_agency.set_visible(false);
        		this.div_detail.ed_agencyNm.set_visible(false);
        		this.div_detail.st_dlvrDay.set_visible(false);
        		this.div_detail.ca_dlvrDay.set_visible(false);
        		
        		this.div_detail.st_consignee.set_visible(true);
        		this.div_detail.ed_consignee.set_visible(true);
        	}else{
        		this.div_detail.st_agency.set_visible(true);
        		this.div_detail.ed_agencyCd.set_visible(true);
        		this.div_detail.bt_agency.set_visible(true);
        		this.div_detail.ed_agencyNm.set_visible(true);
        		this.div_detail.st_dlvrDay.set_visible(true);
        		this.div_detail.ca_dlvrDay.set_visible(true);
        		
        		this.div_detail.st_consignee.set_visible(false);
        		this.div_detail.ed_consignee.set_visible(false);
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

        // 2016-05-30 이영근, 엔터키 입력시 조회
        this.div_search_ed_ordNo_onkeyup = function(obj,e)
        {
        	if( e.keycode == "13" ){
        		this.fn_search();
        	}	
        }

        this.div_detail_ca_dlvrDay_canchange = function(obj,e)
        {
        	if(e.postvalue > "20190905" && e.postvalue < "20190917") {
        		return false;
        	}
        }

        this.div_search_btn_custPopUp_onclick = function(obj,e)
        {
        	var args ={p_arg : this.p_arg};
        	Ex.core.popup(this,"고객찾기","comm::RTCOMMCust_pop.xfdl",args, "modaless=false");
        }
        this.returnCustNo = function(res){
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

        this.ds_C019_canrowposchange = function(obj,e)
        {
        	if(this.userGrp != "01"){
        		this.alert("영업관리자만 배송상태 변경이 가능합니다.\n관리자에게 문의 바랍니다.");
        		return false;
        	}
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.ds_list.addEventHandler("canrowposchange", this.ds_list_canrowposchange, this);
            this.ds_list.addEventHandler("onrowposchanged", this.ds_list_onrowposchanged, this);
            this.ds_C019.addEventHandler("canrowposchange", this.ds_C019_canrowposchange, this);
            this.addEventHandler("onload", this.RTCSEngineOilRepSer_onload, this);
            this.div_search.btn_custPopUp.addEventHandler("onclick", this.div_search_btn_custPopUp_onclick, this);
            this.div_search.ed_ordNo.addEventHandler("onkeyup", this.div_search_ed_ordNo_onkeyup, this);
            this.div_search.btn_custPopUp00.addEventHandler("onclick", this.div_search_btn_custPopUp00_onclick, this);
            this.div_search.ed_mobNo.addEventHandler("onkeyup", this.div_search_ed_mobNo_onkeyup, this);
            this.div_search.ed_telNo.addEventHandler("onkeyup", this.div_search_ed_telNo_onkeyup, this);
            this.div_detail.ed_dlvTel.addEventHandler("onkeyup", this.div_detail_ed_dlvTel_onkeyup, this);
            this.div_detail.cb_dlvGb.addEventHandler("onitemchanged", this.div_detail_cb_dlvGb_onitemchanged, this);
            this.div_detail.ca_dlvrDay.addEventHandler("onchanged", this.div_detail_ca_dlvrDay_onchanged, this);
            this.div_detail.ca_dlvrDay.addEventHandler("canchange", this.div_detail_ca_dlvrDay_canchange, this);
            this.div_detail.bt_agency.addEventHandler("onclick", this.div_cust_btn_postSearch1_onclick, this);
            this.div_detail.bt_addr.addEventHandler("onclick", this.div_detail_bt_addr_onclick, this);
            this.cb_dlvStatCd00.addEventHandler("onitemchanged", this.div_detail_cb_dlvStatCd00_onitemchanged, this);

        };

        this.loadIncludeScript("RTCSEngineOilRepSer.xfdl");

       
    };
}
)();
