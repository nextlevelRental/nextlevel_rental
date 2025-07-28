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
                this.set_name("frm_RTRECmsManger");
                this.set_classname("test_form");
                this.set_titletext("무통장 입금 수납처리");
                this._setFormPosition(0,0,1147,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_withdrawList", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"gubun\" type=\"STRING\" size=\"256\"/><Column id=\"rDay\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"rAmt\" type=\"STRING\" size=\"256\"/><Column id=\"rqstStat\" type=\"STRING\" size=\"256\"/><Column id=\"recpAmt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_pamentList", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"schdSeq\" type=\"STRING\" size=\"256\"/><Column id=\"recpTp\" type=\"STRING\" size=\"256\"/><Column id=\"recpTpNm\" type=\"STRING\" size=\"256\"/><Column id=\"recpNu\" type=\"STRING\" size=\"256\"/><Column id=\"scdStat\" type=\"STRING\" size=\"256\"/><Column id=\"scdStatNm\" type=\"STRING\" size=\"256\"/><Column id=\"saleAmt\" type=\"STRING\" size=\"256\"/><Column id=\"saleNamt\" type=\"STRING\" size=\"256\"/><Column id=\"saleVamt\" type=\"STRING\" size=\"256\"/><Column id=\"recpAmt\" type=\"STRING\" size=\"256\"/><Column id=\"arreAmt\" type=\"STRING\" size=\"256\"/><Column id=\"demdDt\" type=\"STRING\" size=\"256\"/><Column id=\"rcDay\" type=\"STRING\" size=\"256\"/><Column id=\"rcYn\" type=\"STRING\" size=\"256\"/><Column id=\"rcNm\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"chk\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_result", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_re0030", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"recvSeq\" type=\"STRING\" size=\"256\"/><Column id=\"ritmSeq\" type=\"STRING\" size=\"256\"/><Column id=\"recvDay\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"recpId\" type=\"STRING\" size=\"256\"/><Column id=\"recpAmt\" type=\"STRING\" size=\"256\"/><Column id=\"recpTp\" type=\"STRING\" size=\"256\"/><Column id=\"recpPay\" type=\"STRING\" size=\"256\"/><Column id=\"recpFg\" type=\"STRING\" size=\"256\"/><Column id=\"schdSeq\" type=\"STRING\" size=\"256\"/><Column id=\"cashYn\" type=\"STRING\" size=\"256\"/><Column id=\"cncStat\" type=\"STRING\" size=\"256\"/><Column id=\"cncRseq\" type=\"STRING\" size=\"256\"/><Column id=\"cncIseq\" type=\"STRING\" size=\"256\"/><Column id=\"cncIoseq\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_re0031", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"ritmSeq\" type=\"STRING\" size=\"256\"/><Column id=\"recvDay\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"schdSeq\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"recpTp\" type=\"STRING\" size=\"256\"/><Column id=\"saleAmt\" type=\"STRING\" size=\"256\"/><Column id=\"arreAmt\" type=\"STRING\" size=\"256\"/><Column id=\"zfbdt\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_pamentTmpList", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"schdSeq\" type=\"STRING\" size=\"256\"/><Column id=\"recpTp\" type=\"STRING\" size=\"256\"/><Column id=\"recpTpNm\" type=\"STRING\" size=\"256\"/><Column id=\"recpNu\" type=\"STRING\" size=\"256\"/><Column id=\"scdStat\" type=\"STRING\" size=\"256\"/><Column id=\"scdStatNm\" type=\"STRING\" size=\"256\"/><Column id=\"saleAmt\" type=\"STRING\" size=\"256\"/><Column id=\"saleNamt\" type=\"STRING\" size=\"256\"/><Column id=\"saleVamt\" type=\"STRING\" size=\"256\"/><Column id=\"recpAmt\" type=\"STRING\" size=\"256\"/><Column id=\"arreAmt\" type=\"STRING\" size=\"256\"/><Column id=\"demdDt\" type=\"STRING\" size=\"256\"/><Column id=\"rcDay\" type=\"STRING\" size=\"256\"/><Column id=\"rcYn\" type=\"STRING\" size=\"256\"/><Column id=\"rcNm\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"chk\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_re0040", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"recvSeq\" type=\"STRING\" size=\"256\"/><Column id=\"recvDay\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"recpId\" type=\"STRING\" size=\"256\"/><Column id=\"recpAmt\" type=\"STRING\" size=\"256\"/><Column id=\"recpPay\" type=\"STRING\" size=\"256\"/><Column id=\"recpFg\" type=\"STRING\" size=\"256\"/><Column id=\"cncStat\" type=\"STRING\" size=\"256\"/><Column id=\"cncRseq\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/><Column id=\"bankRecpDay\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_accWithdrawList", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"gubun\" type=\"STRING\" size=\"256\"/><Column id=\"rcmsDay\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"rcmsAmt\" type=\"STRING\" size=\"256\"/><Column id=\"rqstStat\" type=\"STRING\" size=\"256\"/><Column id=\"recpAmt\" type=\"STRING\" size=\"256\"/><Column id=\"rqstStatNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_crdWithdrawList", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"gubun\" type=\"STRING\" size=\"256\"/><Column id=\"rcrdDay\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"rcrdAmt\" type=\"STRING\" size=\"256\"/><Column id=\"rqstStat\" type=\"STRING\" size=\"256\"/><Column id=\"recpAmt\" type=\"STRING\" size=\"256\"/><Column id=\"rqstStatNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_reRental", this);
            obj._setContents("<ColumnInfo><Column id=\"COL1\" type=\"STRING\" size=\"256\"/><Column id=\"COL2\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Grid("grd_paymentList01", "absolute", "909", "290", "211", "70", null, null, this);
            obj.set_taborder("21");
            obj.set_binddataset("ds_re0031");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"99\"/><Column size=\"99\"/><Column size=\"99\"/><Column size=\"99\"/><Column size=\"99\"/><Column size=\"99\"/><Column size=\"99\"/><Column size=\"99\"/><Column size=\"99\"/><Column size=\"99\"/><Column size=\"99\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"매출금액\"/><Cell col=\"1\" text=\"수납금액\"/><Cell col=\"2\" text=\"RITMSEQ\"/><Cell col=\"3\" text=\"RECVDAY\"/><Cell col=\"4\" text=\"ORDNO\"/><Cell col=\"5\" text=\"SCHDSEQ\"/><Cell col=\"6\" text=\"CUSTNO\"/><Cell col=\"7\" text=\"RECPTP\"/><Cell col=\"8\" text=\"ZFBDT\"/><Cell col=\"9\" text=\"REGID\"/><Cell col=\"10\" text=\"CHGID\"/></Band><Band id=\"body\"><Cell text=\"bind:saleAmt\"/><Cell col=\"1\" displaytype=\"normal\" edittype=\"none\" text=\"bind:arreAmt\"/><Cell col=\"2\"/><Cell col=\"3\"/><Cell col=\"4\"/><Cell col=\"5\"/><Cell col=\"6\"/><Cell col=\"7\"/><Cell col=\"8\"/><Cell col=\"9\"/><Cell col=\"10\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_paymentList00", "absolute", "909", "201", "211", "70", null, null, this);
            obj.set_taborder("20");
            obj.set_binddataset("ds_re0030");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"198\"/><Column size=\"99\"/><Column size=\"99\"/><Column size=\"99\"/><Column size=\"99\"/><Column size=\"99\"/><Column size=\"99\"/><Column size=\"99\"/><Column size=\"99\"/><Column size=\"99\"/><Column size=\"99\"/><Column size=\"99\"/><Column size=\"99\"/><Column size=\"99\"/><Column size=\"99\"/><Column size=\"99\"/><Column size=\"99\"/><Column size=\"99\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"수납금액\"/><Cell col=\"1\" text=\"RITMSEQ\"/><Cell col=\"2\" text=\"RECVDAY\"/><Cell col=\"3\" text=\"ORDNO\"/><Cell col=\"4\" text=\"CUSTNO\"/><Cell col=\"5\" text=\"RECPID\"/><Cell col=\"6\" text=\"RECPAMT\"/><Cell col=\"7\" text=\"RECPTP\"/><Cell col=\"8\" text=\"RECPPAY\"/><Cell col=\"9\" text=\"RECPFG\"/><Cell col=\"10\" text=\"SCHDSEQ\"/><Cell col=\"11\" text=\"CASHYN\"/><Cell col=\"12\" text=\"CNCSTAT\"/><Cell col=\"13\" text=\"CNCRSEQ\"/><Cell col=\"14\" text=\"CNCISEQ\"/><Cell col=\"15\" text=\"CNCIOSEQ\"/><Cell col=\"16\" text=\"REGID\"/><Cell col=\"17\" text=\"CHGID\"/></Band><Band id=\"body\"><Cell displaytype=\"normal\" edittype=\"none\" text=\"bind:recpAmt\"/><Cell col=\"1\"/><Cell col=\"2\"/><Cell col=\"3\"/><Cell col=\"4\"/><Cell col=\"5\"/><Cell col=\"6\"/><Cell col=\"7\"/><Cell col=\"8\"/><Cell col=\"9\"/><Cell col=\"10\"/><Cell col=\"11\"/><Cell col=\"12\"/><Cell col=\"13\"/><Cell col=\"14\"/><Cell col=\"15\"/><Cell col=\"16\"/><Cell col=\"17\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_accWithdrawList", "absolute", "0", "73", "556", "98", null, null, this);
            obj.set_taborder("6");
            obj.set_binddataset("ds_accWithdrawList");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"99\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"수납일자\"/><Cell col=\"1\" text=\"주문번호\"/><Cell col=\"2\" text=\"월렌탈료\"/><Cell col=\"3\" text=\"출금상태\"/><Cell col=\"4\" text=\"수납금액\"/></Band><Band id=\"body\"><Cell displaytype=\"normal\" edittype=\"none\" text=\"bind:rcmsDay\"/><Cell col=\"1\" text=\"bind:ordNo\"/><Cell col=\"2\" text=\"bind:rcmsAmt\"/><Cell col=\"3\" displaytype=\"normal\" text=\"bind:rqstStatNm\" calendardisplaynulltype=\"none\"/><Cell col=\"4\" displaytype=\"normal\" text=\"bind:recpAmt\" combodataset=\"ds_R001\" combocodecol=\"cd\" combodatacol=\"cdNm\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "0", "0", null, "42", "25", null, this);
            obj.set_taborder("12");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_searchCondition00", "absolute", "20", "10", "90", "20", null, null, this.div_search);
            obj.set_taborder("31");
            obj.set_text("주문번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("edt_ordNo", "absolute", "110", "9", "110", "21", null, null, this.div_search);
            obj.set_taborder("45");
            obj.set_lengthunit("ascii");
            obj.set_inputfilter("space");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "91", "-1", "20", "45", null, null, this.div_search);
            obj.set_taborder("47");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "220", "-1", "20", "45", null, null, this.div_search);
            obj.set_taborder("49");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_calc", "absolute", "91.77%", "7", null, "24", "0.54%", null, this.div_search);
            obj.set_taborder("50");
            obj.set_text("계산");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition01", "absolute", "241", "10", "90", "20", null, null, this.div_search);
            obj.set_taborder("51");
            obj.set_text("수납금액");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "331", "-1", "20", "45", null, null, this.div_search);
            obj.set_taborder("53");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "441", "-1", "20", "45", null, null, this.div_search);
            obj.set_taborder("54");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition02", "absolute", "465", "10", "90", "20", null, null, this.div_search);
            obj.set_taborder("55");
            obj.set_text("수납일자");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "537", "-1", "20", "45", null, null, this.div_search);
            obj.set_taborder("56");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_payDay", "absolute", "49.73%", "9", null, "20", "36.85%", null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("57");
            obj = new MaskEdit("edt_payAmt", "absolute", "29.61%", "9", null, "20", "58.77%", null, this.div_search);
            obj.set_taborder("58");
            obj.set_mask("#,###");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1122", "0", "25", "496", null, null, this);
            obj.set_taborder("13");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "0", "48", "156", "20", null, null, this);
            obj.set_taborder("15");
            obj.set_text("CMS 출금내역");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "176", "156", "20", null, null, this);
            obj.set_taborder("16");
            obj.set_text("수납내역");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_paymentList", "absolute", "0", "201", "903", "159", null, null, this);
            obj.set_taborder("17");
            obj.set_binddataset("ds_pamentList");
            obj.set_selecttype("multirow");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"99\"/><Column size=\"99\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"99\"/><Column size=\"99\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"고객번호\"/><Cell col=\"1\" text=\"계약번호\"/><Cell col=\"2\" text=\"청구구분\"/><Cell col=\"3\" text=\"청구회차\"/><Cell col=\"4\" text=\"청구일자\"/><Cell col=\"5\" text=\"원금\"/><Cell col=\"6\" text=\"기존수납금액\"/><Cell col=\"7\" text=\"기존연체금액\"/><Cell col=\"8\" text=\"수납여부\"/></Band><Band id=\"body\"><Cell text=\"bind:custNo\"/><Cell col=\"1\" displaytype=\"normal\" edittype=\"none\" text=\"bind:ordNo\"/><Cell col=\"2\" text=\"bind:recpTpNm\"/><Cell col=\"3\" text=\"bind:recpNu\"/><Cell col=\"4\" text=\"bind:demdDt\"/><Cell col=\"5\" displaytype=\"normal\" text=\"bind:saleAmt\" calendardisplaynulltype=\"none\"/><Cell col=\"6\" displaytype=\"normal\" text=\"bind:recpAmt\"/><Cell col=\"7\" text=\"bind:arreAmt\"/><Cell col=\"8\" text=\"bind:rcYn\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0", "364", "156", "20", null, null, this);
            obj.set_taborder("18");
            obj.set_text("처리내역");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_result", "absolute", "0", "389", "1122", "107", null, null, this);
            obj.set_taborder("19");
            obj.set_binddataset("ds_pamentTmpList");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"99\"/><Column size=\"99\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"99\"/><Column size=\"99\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"고객번호\"/><Cell col=\"1\" text=\"계약번호\"/><Cell col=\"2\" text=\"청구구분\"/><Cell col=\"3\" text=\"청구회차\"/><Cell col=\"4\" text=\"청구일자\"/><Cell col=\"5\" text=\"원금\"/><Cell col=\"6\" text=\"기존수납금액\"/><Cell col=\"7\" text=\"기존연체금액\"/><Cell col=\"8\" text=\"수납여부\"/></Band><Band id=\"body\"><Cell text=\"bind:custNo\"/><Cell col=\"1\" displaytype=\"normal\" edittype=\"none\" text=\"bind:ordNo\"/><Cell col=\"2\" text=\"bind:recpTpNm\"/><Cell col=\"3\" text=\"bind:schdSeq\"/><Cell col=\"4\" text=\"bind:demdDt\"/><Cell col=\"5\" displaytype=\"normal\" text=\"bind:saleAmt\" calendardisplaynulltype=\"none\"/><Cell col=\"6\" displaytype=\"normal\" text=\"bind:recpAmt\" combodataset=\"ds_R001\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"7\" text=\"bind:arreAmt\"/><Cell col=\"8\" text=\"bind:rcYn\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_crdWithdrawList", "absolute", "562", "73", "558", "98", null, null, this);
            obj.set_taborder("22");
            obj.set_binddataset("ds_crdWithdrawList");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"99\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"수납일자\"/><Cell col=\"1\" text=\"주문번호\"/><Cell col=\"2\" text=\"월렌탈료\"/><Cell col=\"3\" text=\"출금상태\"/><Cell col=\"4\" text=\"수납금액\"/></Band><Band id=\"body\"><Cell displaytype=\"normal\" edittype=\"none\" text=\"bind:rcrdDay\"/><Cell col=\"1\" text=\"bind:ordNo\"/><Cell col=\"2\" text=\"bind:rcrdAmt\"/><Cell col=\"3\" displaytype=\"normal\" text=\"bind:rqstStatNm\" calendardisplaynulltype=\"none\"/><Cell col=\"4\" displaytype=\"normal\" text=\"bind:recpAmt\" combodataset=\"ds_R001\" combocodecol=\"cd\" combodatacol=\"cdNm\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "562", "48", "156", "20", null, null, this);
            obj.set_taborder("23");
            obj.set_text("신용카드 출금내역");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 0, 42, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("12");
            		p.set_text("Div00");
            		p.set_scrollbars("none");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1147, 496, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("test_form");
            		p.set_titletext("무통장 입금 수납처리");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item0","div_search.edt_ordNo","value","ds_Search","SEARCH_KEYWORD");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTRECmsManager.xfdl", "lib::comLib.xjs");
        this.registerScript("RTRECmsManager.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분 : 수금관리 > CMS관리 > 무통장입금 수납처리
         * 02. 그룹명   : RTRECmsManager.xfdl
         * 03. 그룹설명 : 
         * 04. 작성일   :
         * 05. 작성자   :
         * 06. 수정이력 :
         ***********************************************************************
         *     수정일     작성자   내용
         ***********************************************************************
         *
         ***********************************************************************
         */

        /***********************************************************************
         * Script Include 
         ************************************************************************/
        //include "lib::comLib.xjs";
        /***********************************************************************
         * FORM 변수 선언 영역
        ************************************************************************/

        	/***********************************************************************
        	 * 그룹 변수 선언부
        	 ************************************************************************/
        	this.toDay  = "";
        	this.userId = "";
        	this.userGrp = "";
        	
        	this.reRental = false;
            //-------------------------------------------------------------------------------   
        	//폼로드시 공통함수      
        	//-------------------------------------------------------------------------------  	 
        	this.form_onload = function(obj,e)
        	{
        		Ex.core.init(obj); 	
        		//this.fn_getCodeInfo();
        		
        		this.userId = application.gds_userInfo.getColumn(0, "userId" );
        		this.userGrp = application.gds_userInfo.getColumn(0, "userGrp");
        		
        		//오늘날짜
        		this.get_date();
        		this.parent.setButton("C|S",this);	
        	} 
        		 
        	/***********************************************************************************
        	* Transaction Function
        	***********************************************************************************/
            //-------------------------------------------------------------------------------  	
        	//공통코드 조회
            //-------------------------------------------------------------------------------  	
        	this.fn_getCodeInfo = function() 
        	{
        		var sSvcID      	= "getCodeInfo";  
        		var sController   	= "ntrms/re/getAccReqCode.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_R015=outputR015 ds_R011=outputR011 ds_R001=outputR001 ds_R003=outputR003 ds_R009=outputR009 ds_R010=outputR010 ds_R005=outputR005";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 	
        	}
        	
            //-------------------------------------------------------------------------------  	
        	//오늘날짜 조회
            //-------------------------------------------------------------------------------  	
        	this.get_date = function() 
        	{
        		var sSvcID        	= "getDate";                    
        		var sController   	= "/rtms/comm/getToday.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        	}
        		
            //-------------------------------------------------------------------------------  	
        	//조회
            //-------------------------------------------------------------------------------  	
        	this.fn_search = function() 
        	{
        		if(this.div_search.edt_ordNo.text == ""){
        			this.alert("주문번호를 입력해주세요.");
        			return;
        		}
        		
        		this.ds_withdrawList.clearData();
        		this.ds_pamentList.clearData();
        		this.ds_pamentTmpList.clearData();

        		this.fn_getAccWithdrawList();
        		this.fn_getCrdWithdrawList();
        		this.fn_getPaymentList();
        	}
        	
        	/***********************************************************************************
        	* CallBack Event (strSvcId - Sevice ID, nErrorCode - ErrorCode, strErrorMsg - Error Message)
        	***********************************************************************************/
            //-------------------------------------------------------------------------------  	
        	// callBack함수 
            //-------------------------------------------------------------------------------  	
        	this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg)
        	{ 
        		if (nErrorCode < 0) 
        		{
        			return Ex.core.comMsg("alert",strErrorMsg);		
        		}
        		
        		switch (strSvcId) 
        		{
        			case "getDate":
        				//this.div_search.cal_payDay.set_value(this.toDay);					
        				break;				
        			case "getCodeInfo":
        				break;
        			case "listAccWithdraw":
        				if(this.ds_accWithdrawList.rowcount == 0) 
        				{
        					this.grd_accWithdrawList.set_nodatatext("조회된 데이터가 없습니다.");
        				}else{
        					this.ds_accWithdrawList.set_keystring("S:-rcmsDay");
        					this.grd_accWithdrawList.selectRow(0);
        				}
        				
        				break;
        			
        			case "listCrdWithdraw":			
        				if(this.ds_crdWithdrawList.rowcount == 0) 
        				{
        					this.grd_crdWithdrawList.set_nodatatext("조회된 데이터가 없습니다.");
        				}else{
        					this.ds_crdWithdrawList.set_keystring("S:-rcrdDay");
        					this.grd_crdWithdrawList.selectRow(0);
        				}
        				
        				break;
        			case "listPayment":
        				if(this.ds_pamentList.rowcount == 0) 
        				{
        					this.grd_withdrawList.set_nodatatext("조회된 데이터가 없습니다.");
        				}else{
        					this.checkReRental(this.ds_pamentList.getColumn(0, "custNo"));
        				}
        				break;	
        			case "listCustInfo":
        				if(this.ds_cust.rowcount > 0 ) {
        				}
        				break;
        			case "checkReRenatal":
        				if(this.ds_reRental.rowcount > 0){
        					this.reRental = true;
        				}else{
        					this.reRental = false;
        				}
        				break;
        			case "saveCmsMng":
        				alert("저장완료 되었습니다.");
        				break;
        			default:
        				break;
        		}
        	}

        	/***********************************************************************************
        	* Component Event
        	***********************************************************************************/	
            //-------------------------------------------------------------------------------  	
        	//계약번호  Enter키 이벤트 처리
            //-------------------------------------------------------------------------------  	
        	this.edt_ordNo_onkeyup = function(obj,e)
        	{
        		if ( e.keycode == 13 )
        		{
        			if(nvl(this.div_search.edt_ordNo.value) == "") {
        				this.alert("계약번호를 입력하세요");				
        				this.div_search.edt_ordNo.setFocus();
        				return;
        			}
        			
        			this.div_search.edt_payAmt.set_value("");
        			this.div_search.cal_payDay.set_value("");
        			
        			this.fn_search();
        		}		
        	}
        	
        	/***********************************************************************************
        	* User Function
        	***********************************************************************************/
            //-------------------------------------------------------------------------------  
        	//엑셀저장
            //-------------------------------------------------------------------------------  	
        	this.fn_excel = function(obj,e)
        	{
        		Ex.core.exportExcel(this, this.grd_result, "계산처리내역");
        	}
        	
        	//-------------------------------------------------------------------------------  
        	//계좌 출금상태 조회
            //-------------------------------------------------------------------------------  	
        	this.fn_getAccWithdrawList = function(){
        	
        		var sSvcID        	= "listAccWithdraw";                    
        		var sController   	= "/ntrms/re/getAccTranOrdNoList.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_accWithdrawList=output";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";

        		var srchOrdNo		= this.div_search.edt_ordNo.text;
        		var sFirstDay = Eco.date.getFirstDate(this.toDay);	//해당일자의 1일 가져오기
        		
        		sFirstDay = "19000101";
        		sEndDay = this.toDay;
        		
        		sArgs += Ex.util.setParam("ordNo"	, nvl(srchOrdNo));
        		sArgs += Ex.util.setParam("rcmsDayF"	, nvl(sFirstDay));
        		sArgs += Ex.util.setParam("rcmsDayT"	, nvl(sEndDay));
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 	
        	}
        	
        	//-------------------------------------------------------------------------------  
        	//카드 출금상태 조회
            //-------------------------------------------------------------------------------  	
        	this.fn_getCrdWithdrawList = function(){
        	
        		var sSvcID        	= "listCrdWithdraw";                    
        		var sController   	= "/ntrms/re/getCrdTranOrdNoList.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_crdWithdrawList=output";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";

        		var srchOrdNo		= this.div_search.edt_ordNo.text;
        		var sFirstDay = Eco.date.getFirstDate(this.toDay);	//해당일자의 1일 가져오기
        		
        		sFirstDay = "19000101";
        		sEndDay = this.toDay;
        		
        		sArgs += Ex.util.setParam("ordNo"	, nvl(srchOrdNo));
        		sArgs += Ex.util.setParam("rcrdDayF"	, nvl(sFirstDay));
        		sArgs += Ex.util.setParam("rcrdDayT"	, nvl(sEndDay));
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 	
        	}
        	
        	//-------------------------------------------------------------------------------  
        	//수납내역 조회
            //-------------------------------------------------------------------------------  	
        	this.fn_getPaymentList = function(){
        	
        		var sSvcID        	= "listPayment";                    
        		var sController   	= "/ntrms/re/listRtsd0109.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_pamentList=mapDsRtsd0109";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";

        		var srchOrdNo		= this.div_search.edt_ordNo.text;

        		sArgs += Ex.util.setParam("ordNo"	, nvl(srchOrdNo));

        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 	
        	}
        	
        	//-------------------------------------------------------------------------------  
        	//수납내역 추가
            //-------------------------------------------------------------------------------  	
        	this.fn_insertPaymentList = function(){
        		
        		var sSvcID        	= "insertRe0030";                    
        		var sController   	= "ntrms/re/listPayment.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_paymentList=output";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";

        		var srchOrdNo		= this.div_search.edt_odrNo.text;
        		
        		sArgs += Ex.util.setParam("ordNo"	, nvl(srchOrdNo));
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 	
        	}
            
            //-------------------------------------------------------------------------------  
        	//재렌탈 여부 확인
            //-------------------------------------------------------------------------------
            this.checkReRental = function(custNo){
        	
        		var sSvcID      	= "checkReRenatal";  
        		var sController   	= "/rtms/sd/getReRentalInfo.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_reRental=mapDSReRental";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		sArgs += Ex.util.setParam("custNo",custNo);
        		//alert(custNo);
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 	
        		
        	}

            //-------------------------------------------------------------------------------  
        	//수납내역 계산
            //-------------------------------------------------------------------------------
            this.fn_calculationAmt = function(){
            
        		if(nvl(this.div_search.edt_payAmt.text) == ""){
        			this.alert("수납액이 입력되지 않았습니다.");
        			return;
        		}
        		
        		if(nvl(this.div_search.cal_payDay.value) == ""){
        			this.alert("수납기준일자가 입력되지 않았습니다.");
        			return;
        		}
        		
        		if(this.grd_paymentList.rowcount == 0){
        			this.alert("수납내역이 조회되지 않았습니다. 조회버튼을 클릭해주세요.");
        			return;
        		}
        		
        		this.rcDay = nvl(this.div_search.cal_payDay.value);
        		
        		this.ds_re0030.clearData();
        		this.ds_re0031.clearData();
        		this.ds_re0040.clearData();
        		
        		var payAmt = parseInt(this.div_search.edt_payAmt.value); //수납액
        		var registrationRecpAmt = 0; //등록비
        		var rentalRecpAmt = 0;
        		
        		//수납내역 중 등록비만 filtering
        		this.ds_pamentTmpList.copyData(this.ds_pamentList);
        		this.ds_pamentTmpList.filter("recpTp == '01'");

        		if(this.ds_pamentTmpList.rowcount > 1){
        			this.alert("등록비내역이 1개 이상입니다.");
        			return;
        		}
        		
        		//미납된 등록비 계산
        		var registrationArreAmt = parseInt(nvl(this.ds_pamentTmpList.getColumn(0, "arreAmt")));		
        		var registrationSaleAmt = parseInt(nvl(this.ds_pamentTmpList.getColumn(0, "saleAmt")));
        		
        		//재렌탈은 등록비가 존재하지 않으므로 예외처리한다.
        		if(this.reRental == true){
        			registrationArreAmt = 0;
        			registrationSaleAmt = 0;
        		}
        		
        		if(parseInt(nvl(payAmt)) < registrationArreAmt){
        			if(confirm("수납된 금액이 등록비보다 작습니다. 진행하시겠습니까?")){
        				registrationRecpAmt = payAmt;
        				rentalRecpAmt = 0;
        			}else{
        				return;
        			}
        		}else{
        			registrationRecpAmt = registrationArreAmt;
        			rentalRecpAmt = payAmt - registrationRecpAmt;
        		}
        		
        //   		alert("등록비:" + registrationRecpAmt);
        //   		alert("렌탈료:" + rentalRecpAmt);
        		
        		//수납내역 - RTSD0030
        		//등록비만 존재
        		//등록비+렌탈료 존재
        		//렌탈료만 존재		
        		if(registrationArreAmt >= payAmt){

        			this.ds_re0030.addRow();
        			this.ds_re0030.setColumn(0, "ritmSeq", 1);
        			this.ds_re0030.setColumn(0, "recvDay", nvl(this.div_search.cal_payDay.value));
        			this.ds_re0030.setColumn(0, "ordNo", nvl(this.div_search.edt_ordNo.text));
        			this.ds_re0030.setColumn(0, "custNo", nvl(this.ds_pamentList.getColumn(0, "custNo")));
        			this.ds_re0030.setColumn(0, "recpId", this.userId);
        			this.ds_re0030.setColumn(0, "recpAmt", parseInt(nvl(registrationRecpAmt)));
        			this.ds_re0030.setColumn(0, "recpTp", "01");
        			this.ds_re0030.setColumn(0, "recpPay", "A1");
        			this.ds_re0030.setColumn(0, "recpFg", "01");
        			this.ds_re0030.setColumn(0, "schdSeq", "0");
        			this.ds_re0030.setColumn(0, "cashYn", "N");
        			this.ds_re0030.setColumn(0, "cncStat", "N");
        			this.ds_re0030.setColumn(0, "cncRseq", "");
        			this.ds_re0030.setColumn(0, "cncIseq", "");
        			this.ds_re0030.setColumn(0, "cncIoseq", "");
        			this.ds_re0030.setColumn(0, "regId", this.userId);
        			this.ds_re0030.setColumn(0, "chgId", this.userId);			
        			
        		}else if(registrationArreAmt > 0 && registrationArreAmt < payAmt){

        			this.ds_re0030.addRow();
        			this.ds_re0030.setColumn(0, "ritmSeq", 1);
        			this.ds_re0030.setColumn(0, "recvDay", nvl(this.div_search.cal_payDay.value));
        			this.ds_re0030.setColumn(0, "ordNo", nvl(this.div_search.edt_ordNo.text));
        			this.ds_re0030.setColumn(0, "custNo", nvl(this.ds_pamentList.getColumn(0, "custNo")));
        			this.ds_re0030.setColumn(0, "recpId", this.userId);
        			this.ds_re0030.setColumn(0, "recpAmt", parseInt(nvl(registrationRecpAmt)));
        			this.ds_re0030.setColumn(0, "recpTp", "01");
        			this.ds_re0030.setColumn(0, "recpPay", "A1");
        			this.ds_re0030.setColumn(0, "recpFg", "01");
        			this.ds_re0030.setColumn(0, "schdSeq", "0");
        			this.ds_re0030.setColumn(0, "cashYn", "N");
        			this.ds_re0030.setColumn(0, "cncStat", "N");
        			this.ds_re0030.setColumn(0, "cncRseq", "");
        			this.ds_re0030.setColumn(0, "cncIseq", "");
        			this.ds_re0030.setColumn(0, "cncIoseq", "");
        			this.ds_re0030.setColumn(0, "regId", this.userId);
        			this.ds_re0030.setColumn(0, "chgId", this.userId);			
        			
        			this.ds_re0030.addRow();
        			this.ds_re0030.setColumn(1, "ritmSeq", 2);
        			this.ds_re0030.setColumn(1, "recvDay", nvl(this.div_search.cal_payDay.value));
        			this.ds_re0030.setColumn(1, "ordNo", nvl(this.div_search.edt_ordNo.text));
        			this.ds_re0030.setColumn(1, "custNo", nvl(this.ds_pamentList.getColumn(0, "custNo")));
        			this.ds_re0030.setColumn(1, "recpId", this.userId);
        			this.ds_re0030.setColumn(1, "recpAmt", parseInt(nvl(rentalRecpAmt)));
        			this.ds_re0030.setColumn(1, "recpTp", "11");
        			this.ds_re0030.setColumn(1, "recpPay", "A1");
        			this.ds_re0030.setColumn(1, "recpFg", "01");
        			this.ds_re0030.setColumn(1, "schdSeq", "0");
        			this.ds_re0030.setColumn(1, "cashYn", "N");
        			this.ds_re0030.setColumn(1, "cncStat", "N");
        			this.ds_re0030.setColumn(1, "cncRseq", "");
        			this.ds_re0030.setColumn(1, "cncIseq", "");
        			this.ds_re0030.setColumn(1, "cncIoseq", "");
        			this.ds_re0030.setColumn(1, "regId", this.userId);
        			this.ds_re0030.setColumn(1, "chgId", this.userId);
        			
        		}else{

        			this.ds_re0030.addRow();
        			this.ds_re0030.setColumn(0, "ritmSeq", 1);
        			this.ds_re0030.setColumn(0, "recvDay", nvl(this.div_search.cal_payDay.value));
        			this.ds_re0030.setColumn(0, "ordNo", nvl(this.div_search.edt_ordNo.text));
        			this.ds_re0030.setColumn(0, "custNo", nvl(this.ds_pamentList.getColumn(0, "custNo")));
        			this.ds_re0030.setColumn(0, "recpId", this.userId);			
        			this.ds_re0030.setColumn(0, "recpAmt", parseInt(nvl(rentalRecpAmt)));
        			this.ds_re0030.setColumn(0, "recpTp", "11");
        			this.ds_re0030.setColumn(0, "recpPay", "A1");
        			this.ds_re0030.setColumn(0, "recpFg", "01");
        			this.ds_re0030.setColumn(0, "schdSeq", "0");
        			this.ds_re0030.setColumn(0, "cashYn", "N");
        			this.ds_re0030.setColumn(0, "cncStat", "N");
        			this.ds_re0030.setColumn(0, "cncRseq", "");
        			this.ds_re0030.setColumn(0, "cncIseq", "");
        			this.ds_re0030.setColumn(0, "cncIoseq", "");
        			this.ds_re0030.setColumn(0, "regId", this.userId);
        			this.ds_re0030.setColumn(0, "chgId", this.userId);
        		}
        		
        		//무통장 입금내역
        		this.ds_re0040.addRow();
        		this.ds_re0040.setColumn(0, "recvDay", nvl(this.div_search.cal_payDay.value));
        		this.ds_re0040.setColumn(0, "ordNo", nvl(this.div_search.edt_ordNo.text));
        		this.ds_re0040.setColumn(0, "custNo", nvl(this.ds_pamentList.getColumn(0, "custNo")));
        		this.ds_re0040.setColumn(0, "recpId", this.userId);			
        		this.ds_re0040.setColumn(0, "recpAmt", this.div_search.edt_payAmt.value);
        		this.ds_re0040.setColumn(0, "bankRecpDay", nvl(this.div_search.cal_payDay.value));
        		this.ds_re0040.setColumn(0, "recpPay", "A1");
        		this.ds_re0040.setColumn(0, "recpFg", "01");
        		this.ds_re0040.setColumn(0, "cncStat", "N");
        		this.ds_re0040.setColumn(0, "cncRseq", "");
        		this.ds_re0040.setColumn(0, "regId", this.userId);
        		this.ds_re0040.setColumn(0, "chgId", this.userId);
        			
        		this.ds_pamentTmpList.filter("");
        		this.ds_pamentTmpList.filter("recpTp == '11'");
        		
        		var rentalSaleAmt = this.ds_pamentTmpList.getColumn(0, "saleAmt");
        		
        		//렌탈수납금액을 월별 렌탈금액으로 나눠 몇개월 분인지 파악
        		var rentalRecpMonth = Math.ceil(rentalRecpAmt / rentalSaleAmt);
        		
        		//실제 매출액
        		var totRentalSaleAmt = rentalSaleAmt * rentalRecpMonth;
        		
        // 		alert("몇개월:" + rentalRecpMonth);
        // 		alert("실제매출액:" + totRentalSaleAmt);
        // 		alert("실제수납액:" + rentalRecpAmt);
        //		alert("등록비매출액:" + registrationSaleAmt);
        		
        		//수납대상내역 - RTSD0031
        		//등록비만 존재
        		//등록비+렌탈료 존재
        		//렌탈료만 존재		
        		if(registrationArreAmt >= payAmt){
        			this.ds_re0031.addRow();
        			this.ds_re0031.setColumn(0, "ritmSeq", 1);
        			this.ds_re0031.setColumn(0, "recvSeq", this.ds_re0030.getColumn(0, "recvSeq"));
        			this.ds_re0031.setColumn(0, "recvDay", nvl(this.div_search.cal_payDay.value));
        			this.ds_re0031.setColumn(0, "ordNo", nvl(this.div_search.edt_ordNo.text));
        			this.ds_re0031.setColumn(0, "custNo", nvl(this.ds_pamentList.getColumn(0, "custNo")));
        			this.ds_re0031.setColumn(0, "saleAmt", parseInt(nvl(registrationSaleAmt)));
        			this.ds_re0031.setColumn(0, "arreAmt", parseInt(nvl(registrationRecpAmt)));

        			this.ds_re0031.setColumn(0, "recvSeq", "");
        			this.ds_re0031.setColumn(0, "schdSeq", "0");
        			this.ds_re0031.setColumn(0, "recpTp", "01");
        			this.ds_re0031.setColumn(0, "zfbdt", nvl(this.div_search.cal_payDay.value));
        			this.ds_re0031.setColumn(0, "regId", this.userId);
        			this.ds_re0031.setColumn(0, "chgId", this.userId);
        		}else if(registrationArreAmt > 0 && registrationArreAmt < payAmt){
        		
        			this.ds_re0031.addRow();
        			this.ds_re0031.setColumn(0, "ritmSeq", 1);
        			this.ds_re0031.setColumn(0, "recvSeq", this.ds_re0030.getColumn(0, "recvSeq"));
        			this.ds_re0031.setColumn(0, "recvDay", nvl(this.div_search.cal_payDay.value));
        			this.ds_re0031.setColumn(0, "ordNo", nvl(this.div_search.edt_ordNo.text));
        			this.ds_re0031.setColumn(0, "custNo", nvl(this.ds_pamentList.getColumn(0, "custNo")));
        			this.ds_re0031.setColumn(0, "saleAmt", parseInt(nvl(registrationSaleAmt)));
        			this.ds_re0031.setColumn(0, "arreAmt", parseInt(nvl(registrationRecpAmt)));
        			
        			this.ds_re0031.setColumn(0, "recvSeq", "");
        			this.ds_re0031.setColumn(0, "schdSeq", "0");
        			this.ds_re0031.setColumn(0, "recpTp", "01");
        			this.ds_re0031.setColumn(0, "zfbdt", nvl(this.div_search.cal_payDay.value));
        			this.ds_re0031.setColumn(0, "regId", this.userId);
        			this.ds_re0031.setColumn(0, "chgId", this.userId);
        			
        			this.ds_re0031.addRow();
        			this.ds_re0031.setColumn(1, "ritmSeq", 2);
        			this.ds_re0031.setColumn(1, "recvSeq", this.ds_re0030.getColumn(0, "recvSeq"));
        			this.ds_re0031.setColumn(1, "recvDay", nvl(this.div_search.cal_payDay.value));
        			this.ds_re0031.setColumn(1, "ordNo", nvl(this.div_search.edt_ordNo.text));
        			this.ds_re0031.setColumn(1, "custNo", nvl(this.ds_pamentList.getColumn(0, "custNo")));
        			this.ds_re0031.setColumn(1, "saleAmt", parseInt(nvl(totRentalSaleAmt)));
        			this.ds_re0031.setColumn(1, "arreAmt", parseInt(nvl(rentalRecpAmt)));
        			
        			this.ds_re0031.setColumn(1, "recvSeq", "");
        			this.ds_re0031.setColumn(1, "schdSeq", "0");
        			this.ds_re0031.setColumn(1, "recpTp", "11");
        			this.ds_re0031.setColumn(1, "zfbdt", nvl(this.div_search.cal_payDay.value));
        			this.ds_re0031.setColumn(1, "regId", this.userId);
        			this.ds_re0031.setColumn(1, "chgId", this.userId);
        		}else{
        		
        			this.ds_re0031.addRow();
        			this.ds_re0031.setColumn(0, "ritmSeq", 2);
        			this.ds_re0031.setColumn(0, "recvSeq", this.ds_re0030.getColumn(0, "recvSeq"));
        			this.ds_re0031.setColumn(0, "recvDay", nvl(this.div_search.cal_payDay.value));
        			this.ds_re0031.setColumn(0, "ordNo", nvl(this.div_search.edt_ordNo.text));
        			this.ds_re0031.setColumn(0, "custNo", nvl(this.ds_pamentList.getColumn(0, "custNo")));
        			this.ds_re0031.setColumn(0, "saleAmt", parseInt(nvl(totRentalSaleAmt)));
        			this.ds_re0031.setColumn(0, "arreAmt", parseInt(nvl(rentalRecpAmt)));
        			
        			this.ds_re0031.setColumn(0, "recvSeq", "");
        			this.ds_re0031.setColumn(0, "schdSeq", "0");
        			this.ds_re0031.setColumn(0, "recpTp", "11");
        			this.ds_re0031.setColumn(0, "zfbdt", nvl(this.div_search.cal_payDay.value));
        			this.ds_re0031.setColumn(0, "regId", this.userId);
        			this.ds_re0031.setColumn(0, "chgId", this.userId);
        		}
        		
        		this.ds_pamentTmpList.filter("");
        		this.ds_pamentTmpList.set_keystring("S:+recpTp");
        		
        		var arrArreAmt = new Array();
        		var updatedSaleAmt = 0;
        		var updatedRegistrationAmt = 0;
        		
        		for(var i=0; i<this.ds_pamentTmpList.rowcount; i++){
        			var saleAmt = this.ds_pamentList.getColumn(i, "saleAmt"); //원가
        			var arreAmt = this.ds_pamentList.getColumn(i, "arreAmt"); //연체금액
        			var rcYn = this.ds_pamentList.getColumn(i, "rcYn"); //P:부분수납, S:수납완료
        			var recpTp = this.ds_pamentList.getColumn(i, "recpTp"); //01:등록비, 11:렌탈료
        			var recpAmt = this.ds_pamentList.getColumn(i, "recpAmt");
        			
        			//연체금액이 입금액보다 클경우 - 부분수납			
        			if(payAmt > 0){
        				if(arreAmt > 0){ //연체금액이 없는 경우만 처리
        					if(arreAmt > payAmt){
        						recpAmt += payAmt;						
        						arreAmt = arreAmt - payAmt;
        						payAmt = 0;
        						rcYn = 'P'
        						
        //  	 	 				alert("부분수납-수납액:" + recpAmt);
        //  	 	 				alert("부분수납-연체액:" + arreAmt);
        					}else{ //연체금액이 입금액보다 작을경우
        					
        						payAmt -= arreAmt;
        						recpAmt = saleAmt;
        						arreAmt = 0;
        						rcYn = "Y";
        						
        //  	 	 				alert("완전수납-수납액:" + recpAmt);
        //  	 	 				alert("완전수납-연체액:" + arreAmt);
        					}
        					
        					this.ds_pamentTmpList.setColumn(i, "recpAmt", recpAmt); //수납금액
        					this.ds_pamentTmpList.setColumn(i, "arreAmt", arreAmt); //연체금액
        					this.ds_pamentTmpList.setColumn(i, "rcYn", rcYn); //수납구분
        					this.ds_pamentTmpList.setColumn(i, "rcDay", nvl(this.div_search.cal_payDay.value)); //수납기준일
        					this.ds_pamentTmpList.setColumn(i, "regId", this.userId); //수납구분
        					
        					if(nvl(this.ds_pamentTmpList.getColumn(i, "schdSeq")) == 0){
        						//등록비 매출액
        						updatedRegistrationAmt = this.ds_pamentTmpList.getColumn(i, "saleAmt");
        					}else{
        						//렌탈료 매출액
        						updatedSaleAmt += this.ds_pamentTmpList.getColumn(i, "saleAmt");
        					}
        				}				
        			}	
        		}
        		
        		//매출액 계산
        		if(this.ds_re0031.rowcount == 2){ //등록비+렌탈료 있는경우
        			this.ds_re0031.setColumn(0, "saleAmt", updatedRegistrationAmt);
        			this.ds_re0031.setColumn(1, "saleAmt", updatedSaleAmt);
        		}else{
        			if(updatedSaleAmt == 0){ //등록비만 있는경우
        				this.ds_re0031.setColumn(0, "saleAmt", updatedRegistrationAmt);
        			}else{ //렌탈료만 있는경우
        				this.ds_re0031.setColumn(0, "saleAmt", updatedSaleAmt);
        			}
        		}
            }
            
            //-------------------------------------------------------------------------------  	
        	//저장 - RTSD0030, RTSD0031, RTSD0109
            //------------------------------------------------------------------------------- 
            this.fn_save = function(){

        		//무통장입금처리권한 - CRM팀 임욱재 과장, 김선태대리, 영업관리팀 박정석대리, 위은지사원, 김혜련사원, 수납관리자
        		switch(this.userId){
        			case "kstka":				
        				break;
        			case "wjim":				
        				break;
        			case "10083012":				
        				break;
        			case "10150029":				
        				break;
        			case "10160046":				
        				break;
        			case "10154002":				
        				break;
        			case "10152001":				
        				break;
        			case "sysmngr001":
        				break;
        			default:
        				alert("무통장입금처리 권한이 없습니다. 관리자에게 문의해주세요.");
        				return;
        		}
        		
        		if(this.grd_result.rowcount == 0){
        			alert("금액계산이 되지 않았습니다. 계산버튼을 클릭해주세요.");
        			return;
        		}

        		//당월보다 이전월 데이터는 수정 금지.
        // 		if(this.toDay.substring(0, 6) > nvl(this.div_search.cal_payDay.value).substring(0, 6)){
        // 			alert("이미 마감이 지난 일자입니다. 당월 이후 날짜로 설정해 주세요");
        // 			return;
        // 		}
        		
        		//수납금액 0원인지 체크
        		if(!this.fn_checkZeroAmt()){
        			return;
        		}
        		
        		var msg = "수납일자:" + this.div_search.cal_payDay.text + "\n";
        		msg += "수납금액:" + this.div_search.edt_payAmt.text + "원" + "\n";
        		msg += "조건으로 저장하시겠습니까?";
        		
        		if(!confirm(msg)){
        			return;
        		}
        		
        		var sSvcID        	= "saveCmsMng";                    
        		var sController   	= "/ntrms/re/saveCmsMng.do";
        		var sInDatasets   	= "ds_rtre0030=ds_re0030:U ds_rtre0031=ds_re0031:U ds_rtsd0109=ds_pamentTmpList:U ds_rtre0040=ds_re0040:U";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
            }
            
            //-------------------------------------------------------------------------------  	
        	//저장 - RTSD0030
            //------------------------------------------------------------------------------- 
            this.fn_insertRtre0030 = function(){
        		
        		var sSvcID        	= "insertRtre0030";                    
        		var sController   	= "/ntrms/re/insertRtre0030.do";
        		var sInDatasets   	= "ds_rtre0030=ds_re0030";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
            }
            
            //-------------------------------------------------------------------------------  	
        	//저장 - RTSD0031
            //------------------------------------------------------------------------------- 
            this.fn_insertRtre0031 = function(){
        		
        		var sSvcID        	= "insertRtre0031";                    
        		var sController   	= "/ntrms/re/insertRtre0031.do";
        		var sInDatasets   	= "ds_rtre0031=ds_re0031";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
            }
            
            //-------------------------------------------------------------------------------  	
        	//저장 - RTSD0109
            //------------------------------------------------------------------------------- 
            this.fn_insertRtsd0109 = function(){
        		
        		var sSvcID        	= "insertRtsd0109";                    
        		var sController   	= "/ntrms/re/insertRtsd0109.do";
        		var sInDatasets   	= "ds_rtsd0109=ds_pamentTmpList";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
            }
            
            //-------------------------------------------------------------------------------  	
        	//고객명 조회
            //-------------------------------------------------------------------------------  	
        	this.fn_getCustNm = function() {
        	
        		var sSvcID        	= "listCustInfo";                    
        		var sController   	= "rtms/comm/listCustInfo.do";
        		var sInDatasets   	= "user_=ds_user";
        		var sOutDatasets  	= "ds_cust=mapCustInfo";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		sArgs += Ex.util.setParam("custNo", this.div_search.edt_custNo.value);			
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 	
        	}	

        	//-------------------------------------------------------------------------------  	
        	//수납내역 데이터셋 로드시
            //-------------------------------------------------------------------------------
        	this.ds_pamentList_onload = function(obj,e)
        	{
        		this.ds_pamentList.addColumn("chk", "string");
        	}
        	
        	//-------------------------------------------------------------------------------  	
        	//계산 버튼 클릭시
            //-------------------------------------------------------------------------------
        	this.div_search_btn_calc_onclick = function(obj,e)
        	{		
        		this.fn_calculationAmt();
        	}
        	
        	//-------------------------------------------------------------------------------  	
        	//수납액이 0원인지 체크
            //-------------------------------------------------------------------------------
        	this.fn_checkZeroAmt = function(){

        		for(var i = 0; i < this.ds_re0030.rowcount; i++){
        			if(this.ds_re0030.getColumn(i, "recpAmt") == 0){
        				alert("RTRE0030 수납액이 0원으로 세팅되었습니다.");
        				return false;
        			}
        		}

        		for(var i = 0; i < this.ds_re0031.rowcount; i++){
        			if(this.ds_re0031.getColumn(i, "saleAmt") == 0){
        				alert("RTRE0031 매출액이 0원으로 세팅되었습니다.");
        				return false;
        			}
        			
        			if(this.ds_re0031.getColumn(i, "arreAmt") == 0){
        				alert("RTRE0031 수납액이 0원으로 세팅되었습니다.");
        				return false;
        			}
        		}

        		for(var i = 0; i < this.ds_re0040.rowcount; i++){
        			if(this.ds_re0040.getColumn(i, "recpAmt") == 0){
        				alert("RTRE0040 수납액이 0원으로 세팅되었습니다.");
        				return false;
        			}
        		}

        		for(var i = 0; i < this.ds_pamentTmpList.rowcount; i++){
        			if(this.ds_pamentTmpList.getRowType(i) == Dataset.ROWTYPE_INSERT ||
        				this.ds_pamentTmpList.getRowType(i) == Dataset.ROWTYPE_UPDATE){
        				if(this.ds_pamentTmpList.getColumn(i, "recpAmt") == 0){
        					alert("RTSD0109 수납액이 0원으로 세팅되었습니다.");
        					return false;
        				}
        			}
        		}
        		
        		return true;
        	}
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.ds_pamentList.addEventHandler("onload", this.ds_pamentList_onload, this);
            this.addEventHandler("onload", this.form_onload, this);
            this.grd_paymentList01.addEventHandler("oncellclick", this.grd_paymentList_oncellclick, this);
            this.grd_paymentList00.addEventHandler("oncellclick", this.grd_paymentList_oncellclick, this);
            this.div_search.edt_ordNo.addEventHandler("onkeyup", this.edt_ordNo_onkeyup, this);
            this.div_search.btn_calc.addEventHandler("onclick", this.div_search_btn_calc_onclick, this);
            this.grd_paymentList.addEventHandler("oncellclick", this.grd_paymentList_oncellclick, this);

        };

        this.loadIncludeScript("RTRECmsManager.xfdl");

       
    };
}
)();
