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
                this.set_name("frm_RTREPrePaymentDtl");
                this.set_classname("test_form");
                this.set_titletext("선납내역조회");
                this._setFormPosition(0,0,1147,487);
            }
            this.style.set_color("#333333ff");

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_prePaymentMstList", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"prptDay\" type=\"STRING\" size=\"256\"/><Column id=\"prptSeq\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"recpPay\" type=\"STRING\" size=\"256\"/><Column id=\"recpPayNm\" type=\"STRING\" size=\"256\"/><Column id=\"recvSeq\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"recpTrno\" type=\"STRING\" size=\"256\"/><Column id=\"prptMnct\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"prptDscnRt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"totPrptDcamt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"totPrptAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"prptsttgTmbt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"prptFnshTmbt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"recvDay\" type=\"STRING\" size=\"256\"/><Column id=\"prptCncStat\" type=\"STRING\" size=\"256\"/><Column id=\"prptCncDay\" type=\"STRING\" size=\"256\"/><Column id=\"pOidSeq\" type=\"BIGDECIMAL\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_prePaymentDtlList", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"schdSeq\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"recpFg\" type=\"STRING\" size=\"256\"/><Column id=\"recpFgNm\" type=\"STRING\" size=\"256\"/><Column id=\"totSaleAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"saleAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"prptSeqDcamt\" type=\"BIGDECIMAL\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_prePymntAmtCalc", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"totPrptAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"prptBlncAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"totPrptDcamt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"totRecvAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"totDcAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"prptRemainAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"refundAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"rentAmt\" type=\"BIGDECIMAL\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_nonOineCnclRecpList", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"recvSeq\" type=\"STRING\" size=\"256\"/><Column id=\"ritmSeq\" type=\"STRING\" size=\"256\"/><Column id=\"recvDay\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"schdSeq\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"recpTp\" type=\"STRING\" size=\"256\"/><Column id=\"saleAmt\" type=\"STRING\" size=\"256\"/><Column id=\"arreAmt\" type=\"STRING\" size=\"256\"/><Column id=\"zfbdt\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static01", "absolute", "1122", "0", "25", null, null, "0", this);
            obj.set_taborder("13");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "72", null, "20", "25", null, this);
            obj.set_taborder("14");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("st_collectionMoney", "absolute", "0", "88", "81", "20", null, null, this);
            obj.set_taborder("15");
            obj.set_text("검색결과");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0", "103", null, "10", "25", null, this);
            obj.set_taborder("16");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_prePaymentDtlList", "absolute", "0", "293", "560", "194", null, null, this);
            obj.set_taborder("2");
            obj.set_binddataset("ds_prePaymentDtlList");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj.set_autofittype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"50\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/></Columns><Rows><Row size=\"48\" band=\"head\"/><Row size=\"24\"/><Row size=\"24\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"청구&#13;&#10;회차\"/><Cell col=\"1\" text=\"청구구분\"/><Cell col=\"2\" text=\"할인전&#13;&#10;정기금액\"/><Cell col=\"3\" text=\"할인금액\"/><Cell col=\"4\" text=\"월정기금액\"/></Band><Band id=\"body\"><Cell style=\"align:center middle;\" text=\"bind:schdSeq\"/><Cell col=\"1\" style=\"align:center middle;\" text=\"bind:recpFgNm\"/><Cell col=\"2\" displaytype=\"number\" style=\"align:right middle;\" text=\"bind:totSaleAmt\" mask=\"###,###,###,##0\"/><Cell col=\"3\" displaytype=\"number\" style=\"align:right middle;\" text=\"bind:prptSeqDcamt\" mask=\"###,###,###,##0\"/><Cell col=\"4\" displaytype=\"number\" style=\"align:right middle;\" text=\"bind:saleAmt\" mask=\"###,###,###,##0\"/></Band><Band id=\"summary\"><Cell style=\"align:right middle;padding:0 5 0 0;\" text=\"expr:dataset.getRowCount() + &quot;(건)&quot;\"/><Cell col=\"1\" style=\"align:right;\"/><Cell col=\"2\" displaytype=\"number\" style=\"align:right middle;padding:0 5 0 0;\" expr=\"expr:dataset.getSum(&quot;saleAmt&quot;)\"/><Cell col=\"3\" displaytype=\"number\" style=\"align:right middle;padding:0 5 0 0;\" expr=\"expr:dataset.getSum(&quot;recpAmt&quot;)\"/><Cell col=\"4\" displaytype=\"number\" style=\"align:right middle;padding:0 5 0 0;\" expr=\"expr:dataset.getSum(&quot;arreAmt&quot;)\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("st_prePaymentDtlList", "absolute", "0", "268", "100", "20", null, null, this);
            obj.set_taborder("19");
            obj.set_text("선납내역 상세");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("st_prePymntDscntCncl", "absolute", "586", "268", "120", "20", null, null, this);
            obj.set_taborder("21");
            obj.set_text("선납할인 취소");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Button("btn_cancel", "absolute", "1073", "266", "45", "22", null, null, this);
            obj.set_taborder("23");
            obj.set_text("취소");
            obj.set_cssclass("btn_WF_module");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_prePaymentMstList", "absolute", "0", "109", "1122", "150", null, null, this);
            obj.set_taborder("25");
            obj.set_binddataset("ds_prePaymentMstList");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/></Columns><Rows><Row size=\"48\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell text=\"요청일자\"/><Cell col=\"1\" text=\"계약번호\"/><Cell col=\"2\" text=\"고객번호\"/><Cell col=\"3\" text=\"고객명\"/><Cell col=\"4\" text=\"선납개월\"/><Cell col=\"5\" text=\"납부유형\"/><Cell col=\"6\" text=\"수납일자\"/><Cell col=\"7\" text=\"총선납금액\"/><Cell col=\"8\" text=\"할인율(%)\"/><Cell col=\"9\" text=\"총할인액\"/><Cell col=\"10\" text=\"시작회차\"/><Cell col=\"11\" text=\"종료회차\"/><Cell col=\"12\" text=\"취소여부\"/><Cell col=\"13\" text=\"선납취소일자\"/></Band><Band id=\"body\"><Cell displaytype=\"date\" text=\"bind:prptDay\" calendardisplaynulltype=\"none\"/><Cell col=\"1\" text=\"bind:ordNo\"/><Cell col=\"2\" text=\"bind:custNo\"/><Cell col=\"3\" text=\"bind:custNm\"/><Cell col=\"4\" style=\"align:right middle;\" text=\"bind:prptMnct\"/><Cell col=\"5\" text=\"bind:recpPayNm\"/><Cell col=\"6\" displaytype=\"date\" text=\"bind:recvDay\" calendardisplaynulltype=\"none\"/><Cell col=\"7\" style=\"align:right middle;\" text=\"bind:totPrptAmt\"/><Cell col=\"8\" style=\"align:right middle;\" text=\"bind:prptDscnRt\"/><Cell col=\"9\" style=\"align:right middle;\" text=\"bind:totPrptDcamt\"/><Cell col=\"10\" text=\"bind:prptsttgTmbt\"/><Cell col=\"11\" text=\"bind:prptFnshTmbt\"/><Cell col=\"12\" text=\"bind:prptCncStat\"/><Cell col=\"13\" displaytype=\"date\" text=\"bind:prptCncDay\" calendardisplaynulltype=\"none\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Button("btn_calculate", "absolute", "1025", "266", "45", "22", null, null, this);
            obj.set_taborder("57");
            obj.set_text("계산");
            obj.set_cssclass("btn_WF_module");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "0", "0", "1122", "72", null, null, this);
            obj.set_taborder("59");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Calendar("cal_prptFromDay", "absolute", "98", "10", "100", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("49");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_value("null");
            obj = new Calendar("cal_prptToDay", "absolute", "218", "10", "100", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("50");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_value("null");
            obj = new Static("st_searchCondition00", "absolute", "20", "10", "78", "21", null, null, this.div_search);
            obj.set_taborder("51");
            obj.set_text("요청일자");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition02", "absolute", "676", "10", "78", "21", null, null, this.div_search);
            obj.set_taborder("54");
            obj.set_text("계약번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_ordNo", "absolute", "754", "10", "140", "21", null, null, this.div_search);
            obj.set_taborder("55");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_popUp", "absolute", "874", "9", "20", "21", null, null, this.div_search);
            obj.set_taborder("56");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition04", "absolute", "20", "41", "78", "21", null, null, this.div_search);
            obj.set_taborder("59");
            obj.set_text("고객번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_custNo", "absolute", "98", "41", "110", "21", null, null, this.div_search);
            obj.set_taborder("60");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_custPopUp", "absolute", "189", "41", "20", "21", null, null, this.div_search);
            obj.set_taborder("61");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_custNoKeyword", "absolute", "208", "41", "140", "21", null, null, this.div_search);
            obj.set_taborder("62");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "203", "10", "10", "21", null, null, this.div_search);
            obj.set_taborder("67");
            obj.set_text("~");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition01", "absolute", "348", "10", "78", "21", null, null, this.div_search);
            obj.set_taborder("68");
            obj.set_text("수납일자");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_recvFromDay", "absolute", "426", "10", "100", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("69");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Static("Static00", "absolute", "531", "10", "10", "21", null, null, this.div_search);
            obj.set_taborder("70");
            obj.set_text("~");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_recvToDay", "absolute", "546", "10", "100", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("71");
            obj.set_dateformat("yyyy-MM-dd");

            obj = new Div("div_prePymntDscntCncl", "absolute", "582", "293", "540", "151", null, null, this);
            obj.set_taborder("60");
            this.addChild(obj.name, obj);
            obj = new Static("Static17", "absolute", "0", "0", null, "31", "0", null, this.div_prePymntDscntCncl);
            obj.set_taborder("27");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_prePymntDscntCncl.addChild(obj.name, obj);
            obj = new Static("st_zfbDayTh", "absolute", "0", "0", "135", "31", null, null, this.div_prePymntDscntCncl);
            obj.set_taborder("28");
            obj.set_text("취소일자");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_prePymntDscntCncl.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "0", "30", null, "31", "0", null, this.div_prePymntDscntCncl);
            obj.set_taborder("29");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_prePymntDscntCncl.addChild(obj.name, obj);
            obj = new Static("st_totPrptAmtTh", "absolute", "0", "30", "135", "31", null, null, this.div_prePymntDscntCncl);
            obj.set_taborder("30");
            obj.set_text("선납할인 수납액");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_prePymntDscntCncl.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "0", "60", null, "31", "0", null, this.div_prePymntDscntCncl);
            obj.set_taborder("31");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_prePymntDscntCncl.addChild(obj.name, obj);
            obj = new Static("st_prptBlncAmtTh", "absolute", "0", "60", "135", "31", null, null, this.div_prePymntDscntCncl);
            obj.set_taborder("32");
            obj.set_text("연체료");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.style.set_color("red");
            this.div_prePymntDscntCncl.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "0", "90", null, "31", "0", null, this.div_prePymntDscntCncl);
            obj.set_taborder("33");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_prePymntDscntCncl.addChild(obj.name, obj);
            obj = new Static("st_totPrptDcamtTh", "absolute", "0", "90", "135", "31", null, null, this.div_prePymntDscntCncl);
            obj.set_taborder("34");
            obj.set_text("총 할인액");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_prePymntDscntCncl.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "0", "120", null, "31", "0", null, this.div_prePymntDscntCncl);
            obj.set_taborder("36");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_prePymntDscntCncl.addChild(obj.name, obj);
            obj = new Static("st_totRecvAmtTh", "absolute", "0", "120", "135", "31", null, null, this.div_prePymntDscntCncl);
            obj.set_taborder("37");
            obj.set_text("총 수납액");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_prePymntDscntCncl.addChild(obj.name, obj);
            obj = new Static("st_prptRemainAmtTh", "absolute", "270", "30", "135", "31", null, null, this.div_prePymntDscntCncl);
            obj.set_taborder("42");
            obj.set_text("선납할인잔액");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_prePymntDscntCncl.addChild(obj.name, obj);
            obj = new Static("st_rentAmtTh", "absolute", "270", "60", "135", "31", null, null, this.div_prePymntDscntCncl);
            obj.set_taborder("43");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.set_text("렌탈료 잔액");
            this.div_prePymntDscntCncl.addChild(obj.name, obj);
            obj = new Static("st_totDcAmtTh", "absolute", "270", "90", "135", "31", null, null, this.div_prePymntDscntCncl);
            obj.set_taborder("44");
            obj.set_text("위약금");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_prePymntDscntCncl.addChild(obj.name, obj);
            obj = new Static("st_refundAmtTh", "absolute", "270", "120", "135", "31", null, null, this.div_prePymntDscntCncl);
            obj.set_taborder("45");
            obj.set_text("환불금액");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_prePymntDscntCncl.addChild(obj.name, obj);
            obj = new Static("st_totRecvAmt", "absolute", "135", "120", "135", "31", null, null, this.div_prePymntDscntCncl);
            obj.set_taborder("47");
            obj.style.set_padding("0 5 0 0");
            obj.style.set_align("right middle");
            this.div_prePymntDscntCncl.addChild(obj.name, obj);
            obj = new Static("st_totPrptDcamt", "absolute", "135", "90", "135", "31", null, null, this.div_prePymntDscntCncl);
            obj.set_taborder("48");
            obj.style.set_padding("0 5 0 0");
            obj.style.set_align("right middle");
            this.div_prePymntDscntCncl.addChild(obj.name, obj);
            obj = new Static("st_prptBlncAmt", "absolute", "135", "60", "135", "31", null, null, this.div_prePymntDscntCncl);
            obj.set_taborder("49");
            obj.style.set_padding("0 5 0 0");
            obj.style.set_align("right middle");
            this.div_prePymntDscntCncl.addChild(obj.name, obj);
            obj = new Static("st_totPrptAmt", "absolute", "135", "30", "135", "31", null, null, this.div_prePymntDscntCncl);
            obj.set_taborder("50");
            obj.style.set_padding("0 5 0 0");
            obj.style.set_align("right middle");
            this.div_prePymntDscntCncl.addChild(obj.name, obj);
            obj = new Static("st_zfbDay", "absolute", "135", "0", "135", "31", null, null, this.div_prePymntDscntCncl);
            obj.set_taborder("51");
            obj.style.set_padding("0 0 0 10");
            obj.style.set_align("left middle");
            this.div_prePymntDscntCncl.addChild(obj.name, obj);
            obj = new Static("st_prptRemainAmt", "absolute", "405", "30", "135", "31", null, null, this.div_prePymntDscntCncl);
            obj.set_taborder("53");
            obj.style.set_padding("0 5 0 0");
            obj.style.set_align("right middle");
            this.div_prePymntDscntCncl.addChild(obj.name, obj);
            obj = new Static("st_rentAmt", "absolute", "405", "60", "135", "31", null, null, this.div_prePymntDscntCncl);
            obj.set_taborder("54");
            obj.style.set_padding("0 5 0 0");
            obj.style.set_align("right middle");
            this.div_prePymntDscntCncl.addChild(obj.name, obj);
            obj = new Static("st_totDcAmt", "absolute", "405", "90", "135", "31", null, null, this.div_prePymntDscntCncl);
            obj.set_taborder("55");
            obj.style.set_padding("0 5 0 0");
            obj.style.set_align("right middle");
            this.div_prePymntDscntCncl.addChild(obj.name, obj);
            obj = new Static("st_refundAmt", "absolute", "405", "120", "135", "31", null, null, this.div_prePymntDscntCncl);
            obj.set_taborder("56");
            obj.style.set_padding("0 5 0 0");
            obj.style.set_align("right middle");
            this.div_prePymntDscntCncl.addChild(obj.name, obj);

            obj = new Div("div_payment", "absolute", "0", "509", "536", "181", null, null, this);
            obj.set_taborder("61");
            obj.set_url("re::RTREPaymentComm_div.xfdl");
            obj.set_visible("false");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1122, 72, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("59");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 540, 151, this.div_prePymntDscntCncl,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("60");

            	}
            );
            this.div_prePymntDscntCncl.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1147, 487, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("test_form");
            		p.set_titletext("선납내역조회");
            		p.style.set_color("#333333ff");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item2","div_search.ed_custNo","value","ds_Search","SEARCH_KEYWORD");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        
        this.loadPreloadList = function()
        {
            this._addPreloadList("fdl", "re::RTREPaymentComm_div.xfdl");
        };
        
        // User Script
        this.addIncludeScript("RTREPrePaymentDtl.xfdl", "lib::comLib.xjs");
        this.registerScript("RTREPrePaymentDtl.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분	: 수금관리 > 선납관리 > 선납내역조회
         * 02. 그룹명		: RTREPrePaymentDtl.xfdl
         * 03. 그룹설명	: 
         * 04. 작성일		: 2018-12-17
         * 05. 작성자		: 노창호
         * 06. 수정이력	: 
         ***********************************************************************
         *		수정일			작성자		내용
         ***********************************************************************
         *		2018-12-17		노창호		최초작성
         ***********************************************************************/

        /***********************************************************************
         * Script Include
         ***********************************************************************/
        //include "lib::comLib.xjs";

        /***********************************************************************
         * FORM 변수 선언 영역
         ***********************************************************************/
        this.viewId	= "PRPT";

        /***********************************************************************
         * 그룹 변수 선언부
         ***********************************************************************/
        this.toDay	  = "";	/* 당일 */
        this.cncRseq  = 0;

        /***********************************************************************************
         * Form Load Common Function
         ***********************************************************************************/
        this.form_onload = function(obj,e) {
        	Ex.core.init(obj);
        	
        	this.fn_init();
        }

        /**
         * 화면 초기화
         */
        this.fn_init = function() {
        	/* 월일 조회 */
        	this.fn_getDayMongth();
        	
        	/* 공통버튼
        	 * 1. N : 신규추가
        	 * 2. S : 조회
        	 * 3. C : 데이타생성
        	 * 4. E : 엑셀데이타생성
        	 * 5. AG: 집계
        	 * 6. DN: 다운
        	 */	
        	this.parent.setButton("E|S", this);
        }

        /***********************************************************************************
         * Transaction Function
         ***********************************************************************************/
        /**
         * 월일 조회
         */
        this.fn_getDayMongth = function() {
        	var sSvcID		 = "getDayMongth";
        	var sController	 = "/ntrms/re/getDayMongth.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "";
        	var sArgs		 = "";
        	var fn_callBack	 = "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /** 
         * 고객명 조회
         */
        this.fn_listCustInfo = function() {
        	var sSvcID		 = "listCustInfo";
        	var sController	 = "rtms/comm/listCustInfo.do";
        	var sInDatasets	 = "user_=ds_user";
        	var sOutDatasets = "ds_cust=mapCustInfo";
        	var sArgs		 = "";
        		sArgs		+= Ex.util.setParam("custNo", this.div_search.ed_custNo.value);
        	var fn_callBack	 = "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 선납내역조회
         */
        this.fn_retrievePrePaymentMstList = function() {
        	this.ds_prePaymentMstList.set_enableevent(false);
        	this.ds_prePaymentMstList.clearData();
        	this.ds_prePaymentMstList.set_enableevent(true);
        	this.ds_prePaymentDtlList.clearData();
        	this.ds_prePymntAmtCalc.clearData();
        	
        	var divCalc = this.div_prePymntDscntCncl;
        	
        	divCalc.st_totPrptAmt.set_text(	  "0원");
        	divCalc.st_prptBlncAmt.set_text(  "0원");
        	divCalc.st_totPrptDcamt.set_text( "0원");
        	divCalc.st_totRecvAmt.set_text(	  "0원");
        	divCalc.st_totDcAmt.set_text(	  "0원");
        	divCalc.st_prptRemainAmt.set_text("0원");
        	divCalc.st_refundAmt.set_text(	  "0원");
        	divCalc.st_rentAmt.set_text(	  "0원");
        	
        	var div = this.div_search;
        	
        	var prptFromDay	= nvl(div.cal_prptFromDay.value);
        	var prptToDay	= nvl(div.cal_prptToDay.value);
        	var recvFromDay = nvl(div.cal_recvFromDay.value);
        	var recvToDay	= nvl(div.cal_recvToDay.value);
        	var ordNo		= nvl(div.ed_ordNo.value);
        	var custNo		= nvl(div.ed_custNo.value);
        	
        	var sSvcID		 = "retrievePrePaymentMstList";
        	var sController	 = "ntrms/re/retrievePrePaymentMstList.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "ds_prePaymentMstList=output";
        	var sArgs		 = "";
        		sArgs		+= Ex.util.setParam("prptFromDay", prptFromDay);
        		sArgs		+= Ex.util.setParam("prptToDay",   prptToDay);
        		sArgs		+= Ex.util.setParam("recvFromDay", recvFromDay);
        		sArgs		+= Ex.util.setParam("recvToDay",   recvToDay);
        		sArgs		+= Ex.util.setParam("ordNo",	   ordNo);
        		sArgs		+= Ex.util.setParam("custNo",	   custNo);
        	var fn_callBack	 = "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 선납내역상세조회
         */
        this.fn_retrievePrePaymentDtlList = function() {
        	this.ds_prePaymentDtlList.clearData();
        	
        	var ds = this.ds_prePaymentMstList;
        	
        	var ordNo	= ds.getColumn(ds.rowposition, "ordNo");
        	var prptSeq	= ds.getColumn(ds.rowposition, "prptSeq");
        	
        	var sSvcID		 = "retrievePrePaymentDtlList";
        	var sController	 = "ntrms/re/retrievePrePaymentDtlList.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "ds_prePaymentDtlList=output";
        	var sArgs		 = "";
        		sArgs		+= Ex.util.setParam("ordNo",   nvl(ordNo));
        		sArgs		+= Ex.util.setParam("prptSeq", nvl(prptSeq));
        	var fn_callBack	 = "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 선납할인금액계산
         */
        this.fn_prePymntDscntAmtCalc = function() {
        	this.ds_prePymntAmtCalc.clearData();
        	
        	var ordNo = this.ds_prePaymentMstList.getColumn(this.ds_prePaymentMstList.rowposition, "ordNo");
        	
        	var sSvcID		 = "prePymntDscntAmtCalc";
        	var sController	 = "ntrms/re/prePymntDscntAmtCalc.do";
        	var sInDatasets	 = "ds_search=ds_search";
        	var sOutDatasets = "ds_prePymntAmtCalc=output";
        	var sArgs		 = "";
        		sArgs		+= Ex.util.setParam("ordNo",  nvl(ordNo));
        		sArgs		+= Ex.util.setParam("zfbDay", nvl(this.toDay));
        	var fn_callBack	 = "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 비온라인계약 수납취소내역 조회
         */
        this.fn_getCancelExOContractList = function() {
        	var blncAmt = parseInt(this.ds_prePymntAmtCalc.getColumn(0, "prptBlncAmt"));
        	
        	if(blncAmt > 0) {
        		this.ds_nonOineCnclRecpList.clearData();
        	
        		var ds	 = this.ds_prePaymentMstList;
        		var nRow = ds.rowposition;
        		
        		var ordNo	= ds.getColumn(nRow, "ordNo");
        		var recvSeq	= ds.getColumn(nRow, "recvSeq");
        		
        		var sSvcID		 = "getCancelExOContractList";
        		var sController	 = "ntrms/re/getCancelExOContractList.do";
        		var sInDatasets	 = "";
        		var sOutDatasets = "ds_nonOineCnclRecpList=output";
        		var sArgs		 = "";
        			sArgs		+= Ex.util.setParam("ordNo",   nvl(ordNo));		/* 계약번호 */
        			sArgs		+= Ex.util.setParam("recvSeq", nvl(recvSeq));	/* 청구번호 */
        		var fn_callBack	 = "fn_callBack";
        		
        		Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	} else {
        		/* 비온라인계약 수납취소 SEQ */
        		this.fn_getCncRseq();
        	}
        }

        /**
         * 비온라인계약 수납취소 SEQ
         */
        this.fn_getCncRseq = function() {
        	var sSvcID		 = "getCncRseq";
        	var sController	 = "/ntrms/re/getCncRseq.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "";
        	var sArgs		 = "";
        	var fn_callBack	 = "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /***********************************************************************************
         * CallBack Event(strSvcId - Sevice ID, nErrorCode - ErrorCode, strErrorMsg - Error Message)
         ***********************************************************************************/
        this.fn_callBack = function(strSvcId,nErrorCode,strErrorMsg) {
        	if(nErrorCode < 0) {
        		return Ex.core.comMsg("alert", strErrorMsg);
        	}
        	
        	var div = this.div_payment;
        	
        	switch(strSvcId) {
        		/* 월일 조회 */
        		case "getDayMongth":
        			var today	 = this.toDay.substr(0, 4) + "-" +	this.toDay.substr(4, 2) + "-" +	this.toDay.substr(6, 2);
        			var firstDay = this.toDay.substr(0, 6) + "01";
        			
        			this.div_search.cal_prptFromDay.set_value(firstDay);
        			this.div_search.cal_prptToDay.set_value(this.toDay);
        			this.div_search.cal_recvFromDay.set_value(firstDay);
        			this.div_search.cal_recvToDay.set_value(this.toDay);
        			
        			this.div_prePymntDscntCncl.st_zfbDay.set_text(today);
        			break;
        		
        		/* 선납내역조회 */
        		case "retrievePrePaymentMstList":
        			break;
        		
        		/* 선납내역상세조회 */
        		case "retrievePrePaymentDtlList":
        			break;
        		
        		/* 선납할인금액계산 */
        		case "prePymntDscntAmtCalc":
        			var dsCalc	= this.ds_prePymntAmtCalc;
        			var divCalc	= this.div_prePymntDscntCncl;
        			
        			var totPrptAmt	  = this.fn_numberWithComma(nvl(dsCalc.getColumn(0, "totPrptAmt")));
        			var prptBlncAmt	  = this.fn_numberWithComma(nvl(dsCalc.getColumn(0, "prptBlncAmt")));
        			var totPrptDcamt  = this.fn_numberWithComma(nvl(dsCalc.getColumn(0, "totPrptDcamt")));
        			var totRecvAmt	  = this.fn_numberWithComma(nvl(dsCalc.getColumn(0, "totRecvAmt")));
        			var totDcAmt	  = this.fn_numberWithComma(nvl(dsCalc.getColumn(0, "totDcAmt")));
        			var prptRemainAmt = this.fn_numberWithComma(nvl(dsCalc.getColumn(0, "prptRemainAmt")));
        			var refundAmt	  = this.fn_numberWithComma(nvl(dsCalc.getColumn(0, "refundAmt")));
        			var rentAmt		  = this.fn_numberWithComma(nvl(dsCalc.getColumn(0, "rentAmt")));
        			
        			divCalc.st_totPrptAmt.set_text(	  (totPrptAmt	 == "" || totPrptAmt.toString()	   == "NaN" ? "0" : totPrptAmt)	   + "원");
        			divCalc.st_prptBlncAmt.set_text(  (prptBlncAmt	 == "" || prptBlncAmt.toString()   == "NaN" ? "0" : prptBlncAmt)   + "원");
        			divCalc.st_totPrptDcamt.set_text( (totPrptDcamt	 == "" || totPrptDcamt.toString()  == "NaN" ? "0" : totPrptDcamt)  + "원");
        			divCalc.st_totRecvAmt.set_text(	  (totRecvAmt	 == "" || totRecvAmt.toString()	   == "NaN" ? "0" : totRecvAmt)	   + "원");
        			divCalc.st_totDcAmt.set_text(	  (totDcAmt		 == "" || totDcAmt.toString()	   == "NaN" ? "0" : totDcAmt)	   + "원");
        			divCalc.st_prptRemainAmt.set_text((prptRemainAmt == "" || prptRemainAmt.toString() == "NaN" ? "0" : prptRemainAmt) + "원");
        			divCalc.st_refundAmt.set_text(	  (refundAmt	 == "" || refundAmt.toString()	   == "NaN" ? "0" : refundAmt)	   + "원");
        			divCalc.st_rentAmt.set_text(	  (rentAmt		 == "" || refundAmt.toString()	   == "NaN" ? "0" : rentAmt)	   + "원");
        			
        			this.btn_cancel.set_enable(true);
        			break;
        		
        		/* 비온라인계약 수납취소내역 조회 */
        		case "getCancelExOContractList":
        			var ds = this.ds_nonOineCnclRecpList;
        			
        			if(ds.getRowCount() == 0) {
        				this.alert("수납취소내역이 존재하지 않습니다.");
        				
        				return false;
        			} else {
        				if(ds.getRowCount() > 1) {
        					ds.deleteRow(1);
        				}
        				
        				/* 비온라인계약 수납취소 SEQ */
        				this.fn_getCncRseq();
        			}
        			break;
        		
        		/* 비온라인계약 수납취소 SEQ */
        		case "getCncRseq":
        			var dsNon = this.ds_nonOineCnclRecpList;
        			
        			if(this.cncRseq == 0) {
        				this.alert("취소시퀀스를 가져오지 못했습니다.");
        				
        				return false;
        			} else {
        				dsNon.addColumn("cncRseq", "string");
        				dsNon.setColumn(0, "cncRseq", this.cncRseq);
        				
        				dsNon.set_updatecontrol(false);
        				dsNon.setRowType(0, Dataset.ROWTYPE_INSERT);
        				dsNon.set_updatecontrol(true);
        			}
        			
        			var dsMst	 = this.ds_prePaymentMstList;
        			var nMstRow	 = dsMst.rowposition;
        			
        			if(dsMst.getColumn(nMstRow, "recpPay") == "P6") {
        				/* 계좌즉시출금결제 */
        				div.tordNo = nvl(dsMst.getColumn(nMstRow, "ordNo"));
        				div.custNo = nvl(dsMst.getColumn(nMstRow, "custNo"));
        				div.PTrNo  = nvl(dsMst.getColumn(nMstRow, "recpTrno"));
        				
        				div.fn_accPaymentCancel();
        			}
        			break;
        		
        		default:
        			break;
        	}
        }

        /**
         * 계약조회팝업창 파라미터 반환
         */
        this.returnOrderNoInfo = function(data) {
        	var ordNo = data[0].getColumn(0, "ordNo");
        	
        	this.div_search.ed_ordNo.set_value(ordNo);
        }

        /**
         * 고객조회팝업창 파라미터 반환
         */
        this.returnCustInfo = function(arr) {
        	if(arr[0].rowcount > 0) {
        		if(nvl(arr[0].getColumn(0, "custNo")) != "") {
        			this.div_search.ed_custNo.set_value(arr[0].getColumn(0, "custNo"));
        		}
        		
        		if(nvl(arr[0].getColumn(0, "custNm")) != "") {
        			this.div_search.ed_custNoKeyword.set_value(arr[0].getColumn(0, "custNm"));
        		}
        	}
        }

        /**
         * 수납/취소 popup callback
         */
        this.fn_callCrdResultPop = function(args) {
        	Ex.core.popup(this, "KCP 카드즉시출금 환불 결과", "re::RTREPaymentCommCrdResult_pop.xfdl", args, "modaless=false");
        }

        /***********************************************************************************
         * User Function
         ***********************************************************************************/
        /**
         * 숫자 3자리마다 콤마추가
         */
        this.fn_numberWithComma = function(num) {
        	var len, point, str, bNegInt;
        	
        	var nNum	= parseInt(num);
        	var sNum	= "";
        	
        	if(nNum < 0) {
        		sNum = nNum.toString().substring(1);
        		bNegInt = "Y";
        	} else {
        		sNum = nNum.toString();
        		bNegInt = "N";
        	}
        	
        	point = sNum.length % 3;
        	len = sNum.length;
        	
        	str = sNum.substring(0, point);
        	while (point < len) {
        		if (str != "") str += ",";
        		str += sNum.substring(point, point + 3);
        		point += 3;
        	}
        	
        	if(bNegInt == "Y") {
        		str = "-" + str;
        	}
        	
        	return str;
        }

        /***********************************************************************************
         * Component Event & Function
         ***********************************************************************************/
        /**
         * 조회
         */
        this.fn_search = function() {
        	this.fn_retrievePrePaymentMstList();
        }

        /**
         * 엑셀 다운로드
         */
        this.fn_excel = function(obj,e) {
        	if(this.ds_prePaymentMstList.getRowCount() > 0) {
        		Ex.core.exportExcel(this, this.grd_prePaymentMstList, "Master Grid Excel Download");
        	} else {
        		this.alert("다운로드할 조회결과가 없습니다");
        	}
        }

        /**
         * 선납할인금액계산
         */
        this.btn_calculate_onclick = function(obj,e) {
        	var ds	 = this.ds_prePaymentMstList;
        	var nRow = ds.rowposition;
        	
        	if(Eco.isEmpty(ds.getColumn(nRow, "recvSeq"))) {
        		this.alert("수납이 되지 않은건은 계산 할 수 없습니다.");
        	} else {
        		this.fn_prePymntDscntAmtCalc();
        	}
        }

        /**
         * 선납할인취소(환불)
         */
        this.btn_cancel_onclick = function(obj,e) {
        	var div		   = this.div_payment;
        	var dsCrdParam = div.ds_crdPymntParam;
        	
        	var dsMst	 = this.ds_prePaymentMstList;
        	var dsCalc	 = this.ds_prePymntAmtCalc;
        	var nMstRow	 = dsMst.rowposition;
        	var nCalcRow = dsCalc.rowposition;
        	
        	if(dsMst.getColumn(nMstRow, "recpPay") == "P7") {
        		/* 카드즉시출금결제 */
        		var custNo	 = nvl(dsMst.getColumn(nMstRow,	  "custNo"));
        		var ordNo	 = nvl(dsMst.getColumn(nMstRow,	  "ordNo"));
        		var modType	 = "";
        		var recvSeq	 = nvl(dsMst.getColumn(nMstRow,	  "recvSeq"));
        		var modMny	 = nvl(dsCalc.getColumn(nCalcRow, "refundAmt"));
        		var remMny	 = nvl(dsCalc.getColumn(nCalcRow, "totRecvAmt"));
        		var refundYn = "";
        		var prptSeq	 = nvl(dsMst.getColumn(nMstRow,	  "prptSeq"));
        		var tno		 = nvl(dsMst.getColumn(nMstRow,	  "recpTrno"));
        		var modDesc	 = "선납취소";
        		
        		if(modMny == remMny) {
        			/* 전체취소 */
        			modType	 = "STSC";
        			refundYn = "Y";
        		} else {
        			/* 부분취소 */
        			modType	 = "STPC";
        			refundYn = "P";
        		}
        		
        		dsCrdParam.clearData();
        		dsCrdParam.addRow();
        		
        		dsCrdParam.setColumn(0, "reqTx",	"mod");			/* 결제/취소구분	*/
        		dsCrdParam.setColumn(0, "custNo",	custNo);		/* 고객번호		*/
        		dsCrdParam.setColumn(0, "ordNo",	ordNo);			/* 주문번호		*/
        		dsCrdParam.setColumn(0, "modType",	modType);		/* 요청구분		*/
        		dsCrdParam.setColumn(0, "recvSeq",	recvSeq);		/* 수납거래번호	*/
        		dsCrdParam.setColumn(0, "modMny",	modMny);		/* 취소요청금액	*/
        		dsCrdParam.setColumn(0, "remMny",	remMny);		/* 취소가능잔액	*/
        		dsCrdParam.setColumn(0, "refundYn",	refundYn);		/* 환불여부		*/
        		dsCrdParam.setColumn(0, "prptSeq",	prptSeq);		/* 요청일련번호	*/
        		dsCrdParam.setColumn(0, "tno",		tno);			/* KCP거래번호		*/
        		dsCrdParam.setColumn(0, "modDesc",	modDesc);		/* 요청사유		*/
        		dsCrdParam.setColumn(0, "workCd",	this.viewId);	/* 요청구분		*/
        		
        		/* 카드즉시출금 결제/환불 */
        		div.fn_processPayment();
        	} else {
        		/* 비온라인계약 수납취소내역 조회 */
        		this.fn_getCancelExOContractList();
        	}
        }

        /**
         * 계약번호 팝업
         */
        this.fn_odrPopUp = function(obj,e) {
        	var args ={p_arg:"RTRECollectionMoney"};
        	
        	Ex.core.popup(this, "계약번호 조회", "comm::RTCOMMOrderNo_pop.xfdl", args, "modaless=false");
        }

        /**
         * 고객번호 팝업
         */
        this.fn_custPopUp = function(obj,e) {
        	var args ={	 p_formId : this.id
        			   , p_custNo : nvl(this.div_search.ed_custNo.value)
        			   , p_custNm : nvl(this.div_search.ed_custNoKeyword.value)
        			  };
        	
        	Ex.core.popup(this, "고객찾기", "comm::RTCOMMCust_pop.xfdl", args, "modaless=false");
        }

        /**
         * 고객번호 Onkeyup Event
         */
        this.custNo_onkeyup = function(obj,e) {
        	this.div_search.ed_custNoKeyword.set_value("");
        	
        	/* Enter Key 입력 */
        	if(e.keycode == 13) {
        		if(nvl(this.div_search.ed_custNo.value) == "") {
        			this.alert("고객번호를 입력하세요");
        			
        			this.div_search.ed_custNo.setFocus();
        			return false;
        		}
        		
        		/* 고객명 조회 */
        		this.fn_listCustInfo();
        	}
        }

        /**
         * ds_prePaymentMstList Onrowposchanged Event
         */
        this.ds_prePaymentMstList_onrowposchanged = function(obj,e) {
        	this.btn_cancel.set_enable(false);
        	
        	if(obj.getColumn(e.newrow, "prptCncStat") == "N") {
        		this.btn_calculate.set_enable(true);
        	} else {
        		this.btn_calculate.set_enable(false);
        	}
        	
        	this.fn_retrievePrePaymentDtlList();
        }
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.ds_prePaymentMstList.addEventHandler("onrowposchanged", this.ds_prePaymentMstList_onrowposchanged, this);
            this.addEventHandler("onload", this.form_onload, this);
            this.btn_cancel.addEventHandler("onclick", this.btn_cancel_onclick, this);
            this.btn_calculate.addEventHandler("onclick", this.btn_calculate_onclick, this);
            this.div_search.btn_popUp.addEventHandler("onclick", this.fn_odrPopUp, this);
            this.div_search.ed_custNo.addEventHandler("onkeyup", this.custNo_onkeyup, this);
            this.div_search.btn_custPopUp.addEventHandler("onclick", this.fn_custPopUp, this);

        };

        this.loadIncludeScript("RTREPrePaymentDtl.xfdl");
        this.loadPreloadList();
       
    };
}
)();
