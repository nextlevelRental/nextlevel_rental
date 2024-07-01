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
                this.set_name("RTREPaymentComm_tab2");
                this.set_classname("test_form");
                this.set_titletext("선납할인수납");
                this._setFormPosition(0,0,1166,509);
            }
            this.style.set_color("#333333ff");

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_collectionMoneyList", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custTp\" type=\"STRING\" size=\"256\"/><Column id=\"custTp2\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"ordDay\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"statCd\" type=\"STRING\" size=\"256\"/><Column id=\"statNm\" type=\"STRING\" size=\"256\"/><Column id=\"birthDay\" type=\"STRING\" size=\"256\"/><Column id=\"buslNo\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"payMthd\" type=\"STRING\" size=\"256\"/><Column id=\"payNm\" type=\"STRING\" size=\"256\"/><Column id=\"payDD\" type=\"STRING\" size=\"256\"/><Column id=\"prePaid\" type=\"STRING\" size=\"256\"/><Column id=\"arreAmt\" type=\"STRING\" size=\"256\"/><Column id=\"arreMon\" type=\"STRING\" size=\"256\"/><Column id=\"mfpYn\" type=\"STRING\" size=\"256\"/><Column id=\"preAmt\" type=\"STRING\" size=\"256\"/><Column id=\"vacsYn\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_pymntSchdlDtlList", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"schdSeqU\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"schdSeqI\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"recpTp\" type=\"STRING\" size=\"256\"/><Column id=\"recpTpNm\" type=\"STRING\" size=\"256\"/><Column id=\"recpNu\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"saleAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"dcAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"recpAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"arreAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"zfbDay\" type=\"STRING\" size=\"256\"/><Column id=\"demdDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_prptAmtCalc", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"totPrptAmt\" type=\"STRING\" size=\"256\"/><Column id=\"monTotPrptAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"realMonPrptAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"realPrptAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"totDcAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"arreAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"totRecpAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"startSeq\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"endSeq\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"dcRate\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"dcAmt\" type=\"BIGDECIMAL\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_prptMonList", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/><Column id=\"cdVal\" type=\"BIGDECIMAL\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_pymntSchdlMstList", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"recpFg\" type=\"STRING\" size=\"256\"/><Column id=\"recpPay\" type=\"STRING\" size=\"256\"/><Column id=\"recpTrno\" type=\"STRING\" size=\"256\"/><Column id=\"prptMnct\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"prptDscnRt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"totRntAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"totPrptDcamt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"totPrptAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"prptBlncAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"prptSttgTmbt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"prptFnshTmbt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"recvDay\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static01", "absolute", null, "0", "25", null, "0", "0", this);
            obj.set_taborder("13");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "25", "0", null, "20", "25", null, this);
            obj.set_taborder("14");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("st_collectionMoney", "absolute", "25", "16", "81", "20", null, null, this);
            obj.set_taborder("15");
            obj.set_text("검색결과");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "25", "31", null, "10", "25", null, this);
            obj.set_taborder("16");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_pymntSchdlDtlList", "absolute", "25", "363", "560", "121", null, null, this);
            obj.set_taborder("2");
            obj.set_binddataset("ds_pymntSchdlDtlList");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj.set_autofittype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"55\"/><Column size=\"60\"/><Column size=\"70\"/><Column size=\"75\"/><Column size=\"75\"/><Column size=\"70\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/><Row size=\"24\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"회차\"/><Cell col=\"1\" text=\"청구구분\"/><Cell col=\"2\" text=\"청구일자\"/><Cell col=\"3\" text=\"청구금액\"/><Cell col=\"4\" text=\"수납금액\"/><Cell col=\"5\" text=\"미납금액\"/></Band><Band id=\"body\"><Cell text=\"bind:recpNu\"/><Cell col=\"1\" text=\"bind:recpTpNm\"/><Cell col=\"2\" text=\"bind:zfbDay\"/><Cell col=\"3\" displaytype=\"number\" style=\"align:right middle;\" text=\"bind:saleAmt\" mask=\"###,###,###,##0\"/><Cell col=\"4\" displaytype=\"number\" style=\"align:right middle;\" text=\"bind:recpAmt\" mask=\"###,###,###,##0\"/><Cell col=\"5\" displaytype=\"number\" style=\"align:right middle;\" text=\"bind:arreAmt\" mask=\"###,###,###,##0\"/></Band><Band id=\"summary\"><Cell style=\"align:right middle;\" text=\"expr:dataset.getRowCount() + &quot;(건)&quot;\"/><Cell col=\"1\" style=\"align:right;\"/><Cell col=\"2\"/><Cell col=\"3\" displaytype=\"number\" style=\"align:right;\" expr=\"expr:dataset.getSum(&quot;saleAmt&quot;)\"/><Cell col=\"4\" displaytype=\"number\" style=\"align:right;\" expr=\"expr:dataset.getSum(&quot;recpAmt&quot;)\"/><Cell col=\"5\" displaytype=\"number\" style=\"align:right;\" expr=\"expr:dataset.getSum(&quot;arreAmt&quot;)\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("st_pymntSchdlDtl", "absolute", "25", "338", "100", "20", null, null, this);
            obj.set_taborder("19");
            obj.set_text("납부예정 상세");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("st_recpFg", "absolute", "610", "202", "120", "20", null, null, this);
            obj.set_taborder("21");
            obj.set_text("수납유형");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Button("btn_payment", "absolute", null, "202", "45", "22", "25", null, this);
            obj.set_taborder("23");
            obj.set_text("수납");
            obj.set_cssclass("btn_WF_module");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_collectionMoneyList", "absolute", "25", "37", "1116", "150", null, null, this);
            obj.set_taborder("25");
            obj.set_binddataset("ds_collectionMoneyList");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj.set_autosizingtype("row");
            obj.set_extendsizetype("row");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"100\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"250\"/><Column size=\"80\"/><Column size=\"45\"/><Column size=\"75\"/><Column size=\"75\"/><Column size=\"75\"/><Column size=\"80\"/><Column size=\"70\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"60\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/><Row size=\"24\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"계약번호\"/><Cell col=\"1\" text=\"고객코드\"/><Cell col=\"2\" text=\"고객명\"/><Cell col=\"3\" text=\"상품명\"/><Cell col=\"4\" text=\"차량번호\"/><Cell col=\"5\" text=\"수량\"/><Cell col=\"6\" text=\"계약일자\"/><Cell col=\"7\" text=\"장착일자\"/><Cell col=\"8\" text=\"계약상태\"/><Cell col=\"9\" text=\"법정생년월일\"/><Cell col=\"10\" text=\"사업자번호\"/><Cell col=\"11\" text=\"핸드폰\"/><Cell col=\"12\" text=\"전화번호\"/><Cell col=\"13\" text=\"결제방법\"/><Cell col=\"14\" text=\"결제일\"/><Cell col=\"15\" text=\"선수금액\"/><Cell col=\"16\" text=\"연체금액\"/><Cell col=\"17\" text=\"연체개월\"/></Band><Band id=\"body\"><Cell text=\"bind:ordNo\"/><Cell col=\"1\" text=\"bind:custNo\"/><Cell col=\"2\" text=\"bind:custNm\"/><Cell col=\"3\" text=\"bind:matNm\"/><Cell col=\"4\" text=\"bind:carNo\"/><Cell col=\"5\" text=\"bind:cntCd\"/><Cell col=\"6\" text=\"bind:ordDay\"/><Cell col=\"7\" text=\"bind:procDay\"/><Cell col=\"8\" text=\"bind:statNm\"/><Cell col=\"9\" text=\"bind:birthDay\"/><Cell col=\"10\" text=\"bind:buslNo\"/><Cell col=\"11\" text=\"bind:mobNo\"/><Cell col=\"12\" text=\"bind:telNo\"/><Cell col=\"13\" text=\"bind:payNm\"/><Cell col=\"14\" text=\"bind:payDD\"/><Cell col=\"15\" style=\"align:right;\" text=\"bind:prePaid\"/><Cell col=\"16\" style=\"align:right;\" text=\"bind:arreAmt\"/><Cell col=\"17\" text=\"bind:arreMon\"/></Band><Band id=\"summary\"><Cell text=\"총계\"/><Cell col=\"1\" style=\"align:right;\" expr=\"dataset.getRowCount()+&quot;(건)&quot;\"/><Cell col=\"2\"/><Cell col=\"3\"/><Cell col=\"4\"/><Cell col=\"5\"/><Cell col=\"6\"/><Cell col=\"7\"/><Cell col=\"8\"/><Cell col=\"9\"/><Cell col=\"10\"/><Cell col=\"11\"/><Cell col=\"12\"/><Cell col=\"13\"/><Cell col=\"14\"/><Cell col=\"15\"/><Cell col=\"16\"/><Cell col=\"17\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Button("btn_refresh", "absolute", null, "10", "58", "22", "25", null, this);
            obj.set_taborder("42");
            obj.set_text("재조회");
            obj.set_cssclass("btn_WF_CRUD");
            obj.set_visible("true");
            this.addChild(obj.name, obj);

            obj = new Radio("rdo_recpFg", "absolute", "606", "227", "300", "22", null, null, this);
            this.addChild(obj.name, obj);
            var rdo_recpFg_innerdataset = new Dataset("rdo_recpFg_innerdataset", this.rdo_recpFg);
            rdo_recpFg_innerdataset._setContents("<ColumnInfo><Column id=\"codecolumn\" size=\"256\"/><Column id=\"datacolumn\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"codecolumn\">100000000000</Col><Col id=\"datacolumn\">카드즉시출금</Col></Row><Row><Col id=\"codecolumn\">010000000000</Col><Col id=\"datacolumn\">계좌즉시출금</Col></Row><Row><Col id=\"codecolumn\">001000000000</Col><Col id=\"datacolumn\">가상계좌</Col></Row></Rows>");
            obj.set_innerdataset(rdo_recpFg_innerdataset);
            obj.set_taborder("44");
            obj.set_codecolumn("codecolumn");
            obj.set_datacolumn("datacolumn");
            obj.set_direction("vertical");
            obj.set_value("100000000000");
            obj.set_index("0");

            obj = new Div("div_prptAmtCalc", "absolute", "25", "202", "560", "121", null, null, this);
            obj.set_taborder("59");
            this.addChild(obj.name, obj);
            obj = new Static("Static17", "absolute", "0", "0", null, "31", "0", null, this.div_prptAmtCalc);
            obj.set_taborder("0");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_prptAmtCalc.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "0", "30", null, "31", "0", null, this.div_prptAmtCalc);
            obj.set_taborder("1");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_prptAmtCalc.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "0", "60", null, "31", "0", null, this.div_prptAmtCalc);
            obj.set_taborder("2");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_prptAmtCalc.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "0", "90", null, "31", "0", null, this.div_prptAmtCalc);
            obj.set_taborder("3");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_prptAmtCalc.addChild(obj.name, obj);
            obj = new Static("st_rqstDtTh", "absolute", "0", "0", "140", "31", null, null, this.div_prptAmtCalc);
            obj.set_taborder("4");
            obj.set_text("의뢰일");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_prptAmtCalc.addChild(obj.name, obj);
            obj = new Static("st_startSeqTh", "absolute", "0", "30", "140", "31", null, null, this.div_prptAmtCalc);
            obj.set_taborder("5");
            obj.set_text("선납시작회차");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_prptAmtCalc.addChild(obj.name, obj);
            obj = new Static("st_totPrptAmtTh", "absolute", "0", "60", "140", "31", null, null, this.div_prptAmtCalc);
            obj.set_taborder("6");
            obj.set_text("총 선납대상금액");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_prptAmtCalc.addChild(obj.name, obj);
            obj = new Static("st_totDcAmtTh", "absolute", "0", "90", "140", "31", null, null, this.div_prptAmtCalc);
            obj.set_taborder("7");
            obj.set_text("총 할인금액");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_prptAmtCalc.addChild(obj.name, obj);
            obj = new Static("st_paymentAmtTh03", "absolute", "280", "0", "140", "31", null, null, this.div_prptAmtCalc);
            obj.set_taborder("8");
            obj.set_text("선납개월");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.div_prptAmtCalc.addChild(obj.name, obj);
            obj = new Static("st_arreAmtTh", "absolute", "280", "30", "140", "31", null, null, this.div_prptAmtCalc);
            obj.set_taborder("9");
            obj.set_text("미납금액");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_prptAmtCalc.addChild(obj.name, obj);
            obj = new Static("st_realPrptAmtTh", "absolute", "280", "60", "140", "31", null, null, this.div_prptAmtCalc);
            obj.set_taborder("10");
            obj.set_text("선납금액");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_prptAmtCalc.addChild(obj.name, obj);
            obj = new Static("st_totRecpAmtTh", "absolute", "280", "90", "140", "31", null, null, this.div_prptAmtCalc);
            obj.set_taborder("11");
            obj.set_text("총 납부금액");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_prptAmtCalc.addChild(obj.name, obj);
            obj = new Static("st_rqstDt", "absolute", "140", "0", "140", "31", null, null, this.div_prptAmtCalc);
            obj.set_taborder("12");
            obj.style.set_align("center middle");
            this.div_prptAmtCalc.addChild(obj.name, obj);
            obj = new Static("st_startSeq", "absolute", "140", "30", "140", "31", null, null, this.div_prptAmtCalc);
            obj.set_taborder("13");
            obj.style.set_align("right middle");
            this.div_prptAmtCalc.addChild(obj.name, obj);
            obj = new Static("st_totPrptAmt", "absolute", "140", "60", "140", "31", null, null, this.div_prptAmtCalc);
            obj.set_taborder("14");
            obj.style.set_align("right middle");
            this.div_prptAmtCalc.addChild(obj.name, obj);
            obj = new Static("st_totDcAmt", "absolute", "140", "90", "140", "31", null, null, this.div_prptAmtCalc);
            obj.set_taborder("15");
            obj.style.set_align("right middle");
            this.div_prptAmtCalc.addChild(obj.name, obj);
            obj = new Static("st_arreAmt", "absolute", "420", "30", "140", "31", null, null, this.div_prptAmtCalc);
            obj.set_taborder("17");
            obj.style.set_align("right middle");
            this.div_prptAmtCalc.addChild(obj.name, obj);
            obj = new Static("st_realPrptAmt", "absolute", "420", "60", "140", "31", null, null, this.div_prptAmtCalc);
            obj.set_taborder("18");
            obj.style.set_align("right middle");
            this.div_prptAmtCalc.addChild(obj.name, obj);
            obj = new Static("st_totRecpAmt", "absolute", "420", "90", "140", "31", null, null, this.div_prptAmtCalc);
            obj.set_taborder("19");
            obj.style.set_align("right middle");
            this.div_prptAmtCalc.addChild(obj.name, obj);
            obj = new Combo("cbo_prptMon", "absolute", "424", "5", "100", "21", null, null, this.div_prptAmtCalc);
            this.div_prptAmtCalc.addChild(obj.name, obj);
            obj.set_taborder("20");
            obj.set_innerdataset("@ds_prptMonList");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");

            obj = new Static("Static03", "absolute", "0", "0", "25", null, null, "0", this);
            obj.set_taborder("60");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Div("div_payment", "absolute", "606", "254", "536", "181", null, null, this);
            obj.set_taborder("61");
            obj.set_url("re::RTREPaymentComm_div.xfdl");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 560, 121, this.div_prptAmtCalc,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("59");

            	}
            );
            this.div_prptAmtCalc.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1166, 509, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("test_form");
            		p.set_titletext("선납할인수납");
            		p.style.set_color("#333333ff");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item0","div_prptAmtCalc.st_startSeq","text","ds_prptAmtCalc","startSeq");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item1","div_prptAmtCalc.st_totPrptAmt","text","ds_prptAmtCalc","totPrptAmt");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item2","div_prptAmtCalc.st_totDcAmt","text","ds_prptAmtCalc","totDcAmt");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item3","div_prptAmtCalc.st_arreAmt","text","ds_prptAmtCalc","arreAmt");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item4","div_prptAmtCalc.st_realPrptAmt","text","ds_prptAmtCalc","realPrptAmt");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item5","div_prptAmtCalc.st_totRecpAmt","text","ds_prptAmtCalc","totRecpAmt");
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
        this.addIncludeScript("RTREPaymentComm_tab2.xfdl", "lib::comLib.xjs");
        this.registerScript("RTREPaymentComm_tab2.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분	: 수금관리 > 수납공통화면 > 선납할인수납
         * 02. 그룹명		: RTREPaymentComm_tab2.xfdl
         * 03. 그룹설명	: 
         * 04. 작성일		: 2018-12-10
         * 05. 작성자		: 노창호
         * 06. 수정이력	: 
         ***********************************************************************
         *		수정일			작성자		내용
         ***********************************************************************
         *		2018-12-10		노창호		최초작성
         ***********************************************************************/

        /***********************************************************************
         * Script Include 
         ***********************************************************************/
        //include "lib::comLib.xjs";

        /***********************************************************************
         * FORM 변수 선언 영역
         ***********************************************************************/
        this.popupYn = "Y";		/* Popup 여부	*/
        this.viewId	= "prePayment";	/* 업무구분	*/
        this.prptYn	= "";
        this.dcCd	= "";
        this.workCd = "PRPT";

        /***********************************************************************
         * 그룹 변수 선언부
         ***********************************************************************/
        this.toDay	  = "";	/* 당일			*/
        this.tordNo	  = "";
        this.custNo	  = this.parent.custNo;
        this.custNm	  = "";
        this.matNm	  = "";
        this.telNo	  = "";
        this.mobNo	  = "";

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
        	
        	/* 선납개월 선택항목 조회 */
        	this.fn_retrievePrptMonList();
        	
        	/* 수금내역 조회 */
        	
        	this.fn_retrieveCollectionMoneyList();
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
         * 선납개월 선택항목 조회
         */
        this.fn_retrievePrptMonList = function() {
        	var sSvcID		 = "retrievePrptMonList";
        	var sController	 = "ntrms/re/retrievePrptMonList.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "ds_prptMonList=output";
        	var sArgs		 = "";
        	var fn_callBack	 = "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 수금내역 조회
         */
        this.fn_retrieveCollectionMoneyList = function() {
        	this.ds_collectionMoneyList.clearData();
        	
        	var sSvcID		 = "retrieveCollectionMoneyList";
        	var sController	 = "ntrms/re/getCollectionMoneyList.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "ds_collectionMoneyList=output";
        	var sArgs		 = "";
        		sArgs		+= Ex.util.setParam("custNo", this.custNo);
        	
        	if(this.parent.p_arg="RTCSAdviceStatus") {
        		sArgs		+= Ex.util.setParam("ordNo", this.parent.p_ordNo);
        	}
        	
        	var fn_callBack	 = "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 선납금액계산
         */
        this.fn_retrievePrePymntAmtCalc = function() {
        	this.ds_prptAmtCalc.clearData();
        	
        	var dsClct	= this.ds_collectionMoneyList;
        	var dsPMon	= this.ds_prptMonList;
        	var nRow	= dsPMon.findRow("cdNm", this.div_prptAmtCalc.cbo_prptMon.text);
        	
        	var ordNo	= dsClct.getColumn(dsClct.rowposition, "ordNo");	/* 계약번호 */
        	var dcCd	= this.div_prptAmtCalc.cbo_prptMon.value;			/* 할인코드 */
        	var prptMon	= dsPMon.getColumn(nRow, "cdVal");					/* 선납개월 */
        	
        	var sSvcID		 = "retrievePrePymntAmtCalc";
        	var sController	 = "ntrms/re/retrievePrePymntAmtCalc.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "ds_prptAmtCalc=output";
        	var sArgs		 = "";
        		sArgs		+= Ex.util.setParam("ordNo",   nvl(ordNo));
        		sArgs		+= Ex.util.setParam("dcCd",	   nvl(dcCd));
        		sArgs		+= Ex.util.setParam("prptMon", nvl(prptMon));
        	var fn_callBack	 = "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 납부예정상세 조회
         */
        this.fn_retrievePymntSchdlDtlList = function() {
        	this.ds_pymntSchdlDtlList.clearData();
        	
        	var dsClct	= this.ds_collectionMoneyList;
        	var dsPMon	= this.ds_prptMonList;
        	var nRow	= dsPMon.findRow("cdNm", this.div_prptAmtCalc.cbo_prptMon.text);
        	
        	var ordNo	= dsClct.getColumn(dsClct.rowposition, "ordNo");	/* 계약번호 */
        	var dcCd	= this.div_prptAmtCalc.cbo_prptMon.value;			/* 할인코드 */
        	var prptMon	= dsPMon.getColumn(nRow, "cdVal");					/* 선납개월 */
        	
        	var sSvcID		 = "retrievePymntSchdlDtlList";
        	var sController	 = "ntrms/re/retrievePymntSchdlDtlList.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "ds_pymntSchdlDtlList=output";
        	var sArgs		 = "";
        		sArgs		+= Ex.util.setParam("ordNo",   nvl(ordNo));
        		sArgs		+= Ex.util.setParam("dcCd",	   nvl(dcCd));
        		sArgs		+= Ex.util.setParam("prptMon", nvl(prptMon));
        	var fn_callBack	 = "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /* 선납할인가능여부체크 */
        this.fn_checkPrePaymentAbleYn = function() {
        	var dsClct	= this.ds_collectionMoneyList;
        	
        	var ordNo = dsClct.getColumn(dsClct.rowposition, "ordNo");	/* 계약번호 */
        	var dcCd  = this.div_prptAmtCalc.cbo_prptMon.value;			/* 할인코드 */
        	
        	var sSvcID		 = "checkPrePaymentAbleYn";
        	var sController	 = "ntrms/re/checkPrePaymentAbleYn.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "";
        	var sArgs		 = "";
        		sArgs		+= Ex.util.setParam("ordNo", nvl(ordNo));
        		sArgs		+= Ex.util.setParam("dcCd",	 nvl(dcCd));
        	var fn_callBack	 = "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 선납할인 저장
         */
        this.fn_savePrePayment = function() {
        	var div		 = this.div_payment;
        	var dsMst	 = this.ds_pymntSchdlMstList;
        	var dsDtl	 = this.ds_pymntSchdlDtlList;
        	var dsPMon	 = this.ds_prptMonList;
        	var dsCalc	 = this.ds_prptAmtCalc;
        	var dsCopy	 = this.ds_copyList;
        	
        	var copySeq	 = 0;
        	var recpPay	 = "";
        	var recpTrno = "";
        	var pMonRow	 = dsPMon.findRow("cdNm", this.div_prptAmtCalc.cbo_prptMon.text);
        	var prptMon	 = dsPMon.getColumn(pMonRow, "cdVal");
        	var recvDay	 = "";
        	
        	if(this.rdo_recpFg.index == 1) {
        		/* 세틀뱅크 계좌즉시이체 */
        		recpPay	 = "P6";
        		recpTrno = div.PTrNo;	/* 세틀뱅크 거래번호 */
        		recvDay	 = this.toDay;
        	} else if(this.rdo_recpFg.index == 2) {
        		/* 세틀뱅크 고정형 가상계좌 */
        		recpPay	 = "P5";
        		recpTrno = "";
        	}
        	
        	dsMst.clearData();
        	dsMst.addRow();
        	
        	dsMst.setColumn(0, "ordNo",		   this.tordNo);						/* 계약번호			*/
        	dsMst.setColumn(0, "custNo",	   this.custNo);						/* 고객번호			*/
        	dsMst.setColumn(0, "recpFg",	   "51");								/* 수납유형			*/
        	dsMst.setColumn(0, "recpPay",	   recpPay);							/* 수납방법			*/
        	dsMst.setColumn(0, "recpTrno",	   recpTrno);							/* 납부별수납고유번호	*/
        	dsMst.setColumn(0, "prptMnct",	   prptMon);							/* 선납개월			*/
        	dsMst.setColumn(0, "prptDscnRt",   dsCalc.getColumn(0, "dcRate"));		/* 선납할인율			*/
        	dsMst.setColumn(0, "totRntAmt",	   dsCalc.getColumn(0, "totPrptAmt"));	/* 총렌탈금액			*/
        	dsMst.setColumn(0, "totPrptDcamt", dsCalc.getColumn(0, "totDcAmt"));	/* 총할인금액			*/
        	dsMst.setColumn(0, "totPrptAmt",   dsCalc.getColumn(0, "realPrptAmt"));	/* 납입예정금액		*/
        	dsMst.setColumn(0, "prptBlncAmt",  dsCalc.getColumn(0, "arreAmt"));		/* 미납금액			*/
        	dsMst.setColumn(0, "prptSttgTmbt", dsCalc.getColumn(0, "startSeq"));	/* 선납시작회차		*/
        	dsMst.setColumn(0, "prptFnshTmbt", dsCalc.getColumn(0, "endSeq"));		/* 선납종료회차		*/
        	dsMst.setColumn(0, "recvDay",	   recvDay);							/* 선납수납일자		*/
        	
        	div.ds_pymntSchdlMstList.clearData();
        	div.ds_pymntSchdlMstList.addRow();
        	div.ds_pymntSchdlMstList.copyRow(0, dsMst, 0);
        	
        	div.ds_pymntSchdlDtlList.clearData();
        	
        	for(var i = 0; i < dsDtl.rowcount; i++) {
        		if(dsDtl.getColumn(i, "recpTp") == "51") {
        			div.ds_pymntSchdlDtlList.addRow();
        			div.ds_pymntSchdlDtlList.copyRow(copySeq, dsDtl, i);
        			copySeq++;
        		}
        	}
        	
        	if(this.rdo_recpFg.index == 1) {
        		/* 계좌즉시출금결제 저장 */
        		div.fn_saveAccImmWthdrPayment();
        	} else if(this.rdo_recpFg.index == 2) {
        		//20200430 kstka 가상계좌 발급시 상세내역이 선택되지 않은 경우 발생
        		if(div.ds_pymntSchdlMstList.rowcount == 0){
        			this.alert("발급 상세 내역이 선택되지 않았습니다.");
        			return;
        		}
        	
        		//20200430 kstka 가상계좌 발급여부 확인
        		var vacsYn = nvl(this.ds_collectionMoneyList.getColumn(this.ds_collectionMoneyList.rowposition, "vacsYn"));
        		if(vacsYn == "Y"){
        			this.alert("가상계좌가 이미 발급되어 있습니다.");
        			return;
        		}
        		
        		/* 가상계좌발급 */
        		div.fn_vaccIssued();
        	}
        }

        /***********************************************************************************
         * CallBack Event (strSvcId - Sevice ID, nErrorCode - ErrorCode, strErrorMsg - Error Message)
         ***********************************************************************************/
        this.fn_callBack = function(strSvcId,nErrorCode,strErrorMsg) {
        	if(nErrorCode < 0) {
        		return Ex.core.comMsg("alert", strErrorMsg);
        	}
        	
        	var div = this.div_payment;
        	
        	switch(strSvcId) {
        		/* 월일 조회 */
        		case "getDayMongth":
        			this.curMonth = this.toDay.substr(0, 4) + this.toDay.substr(4, 2) + Eco.date.getLastDayOfMonth(this.toDay);
        			
        			var expiryDate = Eco.date.addDate(this.toDay, 3);
        			
        			if(expiryDate.substr(4, 2) != this.toDay.substr(4, 2)) {
        				div.div_vacc.cal_expiryAcc.set_value(this.curMonth);	/* 당월 말일	*/
        			} else {
        				div.div_vacc.cal_expiryAcc.set_value(expiryDate);		/* 3일후		*/
        			}
        			
        			break;
        		
        		/* 선납개월 선택항목 조회 */
        		case "retrievePrptMonList":
        			this.div_prptAmtCalc.cbo_prptMon.set_index(0);
        			break;
        		
        		/* 수금내역 조회 */
        		case "retrieveCollectionMoneyList":
        			var ds = this.ds_collectionMoneyList;
        			
        			//[20200512_01] kstka 중도완납, 계약종료되고 연체금이 없는 계약은 제외처리
        			ds.filter("mfpYn == 'N' && (arreAmt > 0 || preAmt > 0)");
        			
        			if(ds.getRowCount() > 0) {
        				this.tordNo	= ds.getColumn(ds.rowposition, "ordNo");
        				this.custNo	= ds.getColumn(ds.rowposition, "custNo");
        				this.custNm	= ds.getColumn(ds.rowposition, "custNm");
        				this.matNm	= ds.getColumn(ds.rowposition, "matNm");
        				this.telNo	= ds.getColumn(ds.rowposition, "telNo");
        				this.mobNo	= ds.getColumn(ds.rowposition, "mobNo");
        				
        				div.div_accImmWthdr.ed_ownerNm.set_value(this.custNm);
        				div.div_vacc.ed_dpsNm.set_value(this.custNm);
        				div.div_vacc.ed_smsSendTrgtNo.set_value(this.mobNo);
        				
        				/* 납부예정상세 조회 */
        				this.fn_retrievePymntSchdlDtlList();
        			} else {
        				div.div_cardImmWthdr.st_paymentAmt.set_text("0원");
        				div.div_accImmWthdr.st_paymentAmt.set_text(	"0원");
        				div.div_vacc.st_paymentAmt.set_text(		"0원");
        				
        				this.alert("조회된 데이터가 없습니다.");
        			}
        			
        			if(ds.getColumn(0, "custTp") == "01") {
        				/* 개인 */
        				div.div_cardImmWthdr.ed_cardauth.set_value(ds.getColumn(0, "birthDay").substring(2, 8));
        				div.div_accImmWthdr.ed_bizNo.set_value(ds.getColumn(0, "birthDay").substring(2, 8));
        			} else if(ds.getColumn(0, "custTp") == "02") {
        				/* 사업자 */
        				div.div_cardImmWthdr.ed_cardauth.set_value(ds.getColumn(0, "buslNo"));
        				div.div_accImmWthdr.ed_bizNo.set_value(ds.getColumn(0, "buslNo"));
        			}
        			break;
        		
        		/* 선납금액계산 */
        		case "retrievePrePymntAmtCalc":
        			var toDay = this.toDay.substr(0, 4) + "-" + this.toDay.substr(4, 2) + "-" + this.toDay.substr(6, 2);
        			var div	  = this.div_prptAmtCalc;
        			var ds	  = this.ds_prptAmtCalc;
        			
        			div.st_rqstDt.set_text(toDay);
        			
        			var totPrptAmt	= this.div_payment.fn_numberWithComma(nvl(ds.getColumn(0, "totPrptAmt")));
        			var totDcAmt	= this.div_payment.fn_numberWithComma(nvl(ds.getColumn(0, "totDcAmt")));
        			var arreAmt		= this.div_payment.fn_numberWithComma(nvl(ds.getColumn(0, "arreAmt")));
        			var realPrptAmt	= this.div_payment.fn_numberWithComma(nvl(ds.getColumn(0, "realPrptAmt;")));
        			var totRecpAmt	= this.div_payment.fn_numberWithComma(nvl(ds.getColumn(0, "totRecpAmt")));
        			
        			div.st_startSeq.set_text(	ds.getColumn(0, "startSeq"));
        			div.st_totPrptAmt.set_text(	(totPrptAmt	 == "" || totPrptAmt.toString()	 == "NaN" ? "0" : totPrptAmt)	+ "원");
        			div.st_totDcAmt.set_text(	(totDcAmt	 == "" || totDcAmt.toString()	 == "NaN" ? "0" : totDcAmt)		+ "원");
        			div.st_arreAmt.set_text(	(arreAmt	 == "" || arreAmt.toString()	 == "NaN" ? "0" : arreAmt)		+ "원");
        			div.st_realPrptAmt.set_text((realPrptAmt == "" || realPrptAmt.toString() == "NaN" ? "0" : realPrptAmt)	+ "원");
        			div.st_totRecpAmt.set_text(	(totRecpAmt	 == "" || totRecpAmt.toString()	 == "NaN" ? "0" : totRecpAmt)	+ "원");
        			
        			if(ds.getRowCount() > 0) {
        				/* 납부예정상세 조회 */
        				this.fn_retrievePymntSchdlDtlList();
        			}
        			break;
        		
        		/* 납부예정상세 조회 */
        		case "retrievePymntSchdlDtlList":
        			var div = this.div_payment;
        			var totalAmt = 0;
        			
        			for(var i = 0; i < this.ds_pymntSchdlDtlList.rowcount; i++) {
        				totalAmt += this.ds_pymntSchdlDtlList.getColumn(i, "arreAmt");
        			}
        			
        			/* 할부 불가 */
        			if(totalAmt < 50000) {
        				div.div_cardImmWthdr.cbo_quotaopt.set_index(0);
        				div.div_cardImmWthdr.cbo_quotaopt.set_readonly(true);
        			} else {
        				div.div_cardImmWthdr.cbo_quotaopt.set_readonly(false);
        			}
        			
        			totalAmt = div.fn_numberWithComma(nvl(totalAmt));
        			totalAmt = totalAmt == "" || totalAmt.toString() == "NaN" ? "0" : totalAmt;
        			
        			div.div_cardImmWthdr.st_paymentAmt.set_text(totalAmt + "원");
        			div.div_accImmWthdr.st_paymentAmt.set_text(	totalAmt + "원");
        			div.div_vacc.st_paymentAmt.set_text(		totalAmt + "원");
        			break;
        		/* 선납할인가능여부체크 */
        		case "checkPrePaymentAbleYn":
        			if(this.prptYn == "N") {
        				this.div_prptAmtCalc.cbo_prptMon.set_value(this.dcCd);
        				
        				this.alert("선납할인이 가능하지 않습니다.");
        				
        				return false;
        			} else {
        				/* 선납금액계산 */
        				this.fn_retrievePrePymntAmtCalc();
        			}
        			break;
        		
        		default:
        			break;
        	}
        }

        /***********************************************************************************
         * User Function
         ***********************************************************************************/

        /***********************************************************************************
         * Component Event & Function
         ***********************************************************************************/
        /**
         * 재조회
         */
        this.btn_refresh_onclick = function(obj,e) {
        	this.fn_retrieveCollectionMoneyList();
        }

        
        /**
         * 수납
         */
        this.btn_payment_onclick = function(obj,e) {
        	
        	//[20200511_01]중도완납 이중클릭 방지
        	this.btn_payment.set_enable(false);
        	
        	var rdo		= this.rdo_recpFg;
        	var div		= this.div_payment;
        	var dsMst	= this.ds_collectionMoneyList;
        	var nMstRow	= dsMst.rowposition;
        	var dsDtl	= this.ds_pymntSchdlDtlList;
        	
        	div.tordNo = dsMst.getColumn(nMstRow, "ordNo");
        	div.custNo = dsMst.getColumn(nMstRow, "custNo");
        	div.custNm = dsMst.getColumn(nMstRow, "custNm");
        	
        	div.ds_unpaidList.clearData();
        	
        	var copySeq = 0;
        	
        	for(var i = 0; i < dsDtl.rowcount; i++) {
        		dsDtl.setColumn(i, "demdDt", dsDtl.getColumn(i, "zfbDay"));
        		
        		div.ds_unpaidList.addRow();
        		div.ds_unpaidList.copyRow(copySeq, dsDtl, i);
        		div.ds_unpaidList.setColumn(copySeq, "schdSeq", dsDtl.getColumn(i, "schdSeqI"));
        		copySeq++;
        	}
        	
        	if(rdo.index == 0) {
        		/* 카드즉시출금결제 */
        		var dsCrdParam	= div.ds_crdPymntParam;
        		var dcCd		= this.div_prptAmtCalc.cbo_prptMon.value;
        		var dsPMon		= this.ds_prptMonList;
        		var nPMonRow	= dsPMon.findRow("cd", dcCd);
        		var prptMon		= dsPMon.getColumn(nPMonRow, "cdVal");
        		
        		var divCrd		= div.div_cardImmWthdr;
        		var nPaymentAmt = divCrd.st_paymentAmt.text.replace(",", "");
        			nPaymentAmt = nPaymentAmt.replace("원", "");
        		
        		if(parseInt(nPaymentAmt) == 0) {
        			this.alert("결제금액이 0원입니다.");
        			
        			return false;
        		}
        		
        		dsCrdParam.clearData();
        		dsCrdParam.addRow();
        		
        		dsCrdParam.setColumn(0, "reqTx",		 "pay");									/* 결제/취소구분	*/
        		dsCrdParam.setColumn(0, "custNo",		 nvl(dsMst.getColumn(nMstRow, "custNo")));	/* 고객번호		*/
        		dsCrdParam.setColumn(0, "ordNo",		 nvl(dsMst.getColumn(nMstRow, "ordNo")));	/* 주문번호		*/
        		dsCrdParam.setColumn(0, "payMethodCd",	 rdo.value);								/* 지불방법코드	*/
        		dsCrdParam.setColumn(0, "payMethodName", rdo.text);									/* 지불방법명		*/
        		dsCrdParam.setColumn(0, "recpAmt",		 nPaymentAmt.toString());					/* 결제금액		*/
        		dsCrdParam.setColumn(0, "crdNo",		 nvl(divCrd.me_cardNo.value));				/* 카드번호		*/
        		dsCrdParam.setColumn(0, "quotaopt",		 nvl(divCrd.cbo_quotaopt.value));			/* 할부개월		*/
        		dsCrdParam.setColumn(0, "expiryYy",		 nvl(divCrd.cbo_expiryYy.value));			/* 유효기간(년)	*/
        		dsCrdParam.setColumn(0, "expiryMm",		 nvl(divCrd.cbo_expiryMm.value));			/* 유효기간(월)	*/
        		dsCrdParam.setColumn(0, "cardauth",		 nvl(divCrd.ed_cardauth.value));			/* 인증정보		*/
        		dsCrdParam.setColumn(0, "cardpwd",		 nvl(divCrd.me_cardpwd.value));				/* 비밀번호		*/
        		dsCrdParam.setColumn(0, "dcCd",			 dcCd);										/* 할인코드		*/
        		dsCrdParam.setColumn(0, "prptMon",		 prptMon.toString());						/* 선납개월		*/
        		dsCrdParam.setColumn(0, "workCd",		 this.workCd);								/* 업무구분		*/
        		
        		/* 카드즉시출금 결제/환불 */
        		div.fn_processPayment();
        	} else if(rdo.index == 1) {
        		/* 계좌즉시출금결제 */
        		var divAcc = div.div_accImmWthdr;
        		
        		if(Eco.isEmpty(divAcc.cbo_bank.value)) {
        			this.alert("은행이 선택되지 않았습니다.");
        			
        			return false;
        		}
        		
        		var nPaymentAmt	= divAcc.st_paymentAmt.text.replace(",", "");
        			nPaymentAmt	= nPaymentAmt.replace("원", "");
        		
        		if(parseInt(nPaymentAmt) == 0) {
        			this.alert("결제금액이 0원입니다.");
        			
        			return false;
        		}
        		
        		if(div.agreeYn == "Y") {
        			div.fn_paymentCertified();
        		} else {
        			this.alert("출금이체동의 완료 후 수납가능합니다.");
        			
        			return false;
        		}
        	} else if(rdo.index == 2) {
        		/* 가상계좌 */
        		var divVac = div.div_vacc;
        		
        		if(Eco.isEmpty(divVac.cbo_bank.value)) {
        			this.alert("은행이 선택되지 않았습니다.");
        			
        			return false;
        		}
        		
        		var nPaymentAmt	= divVac.st_paymentAmt.text.replace(",", "");
        			nPaymentAmt	= nPaymentAmt.replace("원", "");
        		
        		if(parseInt(nPaymentAmt) == 0) {
        			this.alert("결제금액이 0원입니다.");
        			
        			return false;
        		}
        		
        		div.ds_vaccMst.addRow();
        		
        		if(nMstRow > -1) {
        			div.ds_vaccMst.copyRow(0, dsMst, nMstRow);
        		} else {
        			div.ds_vaccMst.copyRow(0, dsMst, 0);
        		}
        		
        		this.fn_savePrePayment();
        	}
        }

        /**
         * 수납유형 Onitemchanged Event
         */
        this.rdo_recpFg_onitemchanged = function(obj,e) {
        	var div = this.div_payment;
        	
        	if(obj.index == 0) {
        		div.div_cardImmWthdr.set_visible(true);
        		div.div_accImmWthdr.set_visible(false);
        		div.div_vacc.set_visible(false);
        	} else if(obj.index == 1) {
        		div.div_cardImmWthdr.set_visible(false);
        		div.div_accImmWthdr.set_visible(true);
        		div.div_vacc.set_visible(false);
        	} else if(obj.index == 2) {
        		div.div_cardImmWthdr.set_visible(false);
        		div.div_accImmWthdr.set_visible(false);
        		div.div_vacc.set_visible(true);
        	}
        }

        /**
         * 선납개월 Onitemchanged Event
         */
        this.div_prptAmtCalc_cbo_prptMon_onitemchanged = function(obj,e) {
        	this.dcCd = e.prevalue;
        	
        	/* 선납할인가능여부체크 */
        	this.fn_checkPrePaymentAbleYn();
        }

        /**
         * ds_collectionMoneyList Onrowposchanged Event
         */
        this.ds_collectionMoneyList_onrowposchanged = function(obj,e) {

        	//[20200511_01] 이중클릭 방지
        	this.btn_payment.set_enable(true);
        	
        	//20200430 kstka 가상계좌 금액 초기화
        	this.div_payment.div_vacc.st_paymentAmt.set_text(		"0원");
        	
        	this.fn_retrievePrePymntAmtCalc();
        }
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.ds_collectionMoneyList.addEventHandler("onrowposchanged", this.ds_collectionMoneyList_onrowposchanged, this);
            this.addEventHandler("onload", this.form_onload, this);
            this.btn_payment.addEventHandler("onclick", this.btn_payment_onclick, this);
            this.btn_refresh.addEventHandler("onclick", this.btn_refresh_onclick, this);
            this.rdo_recpFg.addEventHandler("onitemchanged", this.rdo_recpFg_onitemchanged, this);
            this.div_prptAmtCalc.cbo_prptMon.addEventHandler("onitemchanged", this.div_prptAmtCalc_cbo_prptMon_onitemchanged, this);

        };

        this.loadIncludeScript("RTREPaymentComm_tab2.xfdl");
        this.loadPreloadList();
       
    };
}
)();
