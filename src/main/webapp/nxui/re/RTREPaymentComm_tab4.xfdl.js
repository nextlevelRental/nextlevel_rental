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
                this.set_name("RTREPaymentComm_tab4");
                this.set_classname("test_form");
                this.set_titletext("수납취소");
                this.set_enable("true");
                this._setFormPosition(0,0,1166,454);
            }
            this.style.set_color("#333333ff");

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_collectionMoneyList", this);
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custTp\" type=\"STRING\" size=\"256\"/><Column id=\"custTp2\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"ordDay\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"statCd\" type=\"STRING\" size=\"256\"/><Column id=\"statNm\" type=\"STRING\" size=\"256\"/><Column id=\"birthDay\" type=\"STRING\" size=\"256\"/><Column id=\"buslNo\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"payMthd\" type=\"STRING\" size=\"256\"/><Column id=\"payNm\" type=\"STRING\" size=\"256\"/><Column id=\"payDD\" type=\"STRING\" size=\"256\"/><Column id=\"prePaid\" type=\"STRING\" size=\"256\"/><Column id=\"arreAmt\" type=\"STRING\" size=\"256\"/><Column id=\"arreMon\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_cancel", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"recvSeq\" type=\"STRING\" size=\"256\"/><Column id=\"ritmSeq\" type=\"STRING\" size=\"256\"/><Column id=\"recvDay\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"recpTp\" type=\"STRING\" size=\"256\"/><Column id=\"recpTnm\" type=\"STRING\" size=\"256\"/><Column id=\"recpPay\" type=\"STRING\" size=\"256\"/><Column id=\"recpPnm\" type=\"STRING\" size=\"256\"/><Column id=\"recpFg\" type=\"STRING\" size=\"256\"/><Column id=\"recpFnm\" type=\"STRING\" size=\"256\"/><Column id=\"recpAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"schdSeq\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"recpNu\" type=\"STRING\" size=\"256\"/><Column id=\"cncStat\" type=\"STRING\" size=\"256\"/><Column id=\"tNo\" type=\"STRING\" size=\"256\"/><Column id=\"bankCd\" type=\"STRING\" size=\"256\"/><Column id=\"bankNm\" type=\"STRING\" size=\"256\"/><Column id=\"acctNo\" type=\"STRING\" size=\"256\"/><Column id=\"cardcomCd\" type=\"STRING\" size=\"256\"/><Column id=\"cardcomNm\" type=\"STRING\" size=\"256\"/><Column id=\"cardNo\" type=\"STRING\" size=\"256\"/><Column id=\"bankRecpDay\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_billingList", this);
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"schdSeq\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"recpTp\" type=\"STRING\" size=\"256\"/><Column id=\"recpNm\" type=\"STRING\" size=\"256\"/><Column id=\"recpNu\" type=\"STRING\" size=\"256\"/><Column id=\"demdDt\" type=\"STRING\" size=\"256\"/><Column id=\"zfbDay\" type=\"STRING\" size=\"256\"/><Column id=\"saleAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"recpAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"arreAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"rcDay\" type=\"STRING\" size=\"256\"/><Column id=\"payDD\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_nonOineCnclRecpList", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"recvSeq\" type=\"STRING\" size=\"256\"/><Column id=\"ritmSeq\" type=\"STRING\" size=\"256\"/><Column id=\"recvDay\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"schdSeq\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"recpTp\" type=\"STRING\" size=\"256\"/><Column id=\"saleAmt\" type=\"STRING\" size=\"256\"/><Column id=\"arreAmt\" type=\"STRING\" size=\"256\"/><Column id=\"zfbdt\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
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

            obj = new Static("st_unpaidList", "absolute", "25", "196", "100", "20", null, null, this);
            obj.set_taborder("19");
            obj.set_text("청구내역");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("st_recpFg", "absolute", "605", "196", "120", "20", null, null, this);
            obj.set_taborder("21");
            obj.set_text("수납내역");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_collectionMoneyList", "absolute", "25", "37", "1117", "150", null, null, this);
            obj.set_taborder("25");
            obj.set_binddataset("ds_collectionMoneyList");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj.set_autosizingtype("row");
            obj.set_extendsizetype("row");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"100\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"250\"/><Column size=\"80\"/><Column size=\"45\"/><Column size=\"75\"/><Column size=\"75\"/><Column size=\"75\"/><Column size=\"80\"/><Column size=\"70\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"60\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/><Row size=\"24\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"계약번호\"/><Cell col=\"1\" text=\"고객코드\"/><Cell col=\"2\" text=\"고객명\"/><Cell col=\"3\" text=\"상품명\"/><Cell col=\"4\" text=\"차량번호\"/><Cell col=\"5\" text=\"수량\"/><Cell col=\"6\" text=\"계약일자\"/><Cell col=\"7\" text=\"장착일자\"/><Cell col=\"8\" text=\"계약상태\"/><Cell col=\"9\" text=\"법정생년월일\"/><Cell col=\"10\" text=\"사업자번호\"/><Cell col=\"11\" text=\"핸드폰\"/><Cell col=\"12\" text=\"전화번호\"/><Cell col=\"13\" text=\"결제방법\"/><Cell col=\"14\" text=\"결제일\"/><Cell col=\"15\" text=\"선수금액\"/><Cell col=\"16\" text=\"연체금액\"/><Cell col=\"17\" text=\"연체개월\"/></Band><Band id=\"body\"><Cell text=\"bind:ordNo\"/><Cell col=\"1\" text=\"bind:custNo\"/><Cell col=\"2\" text=\"bind:custNm\"/><Cell col=\"3\" text=\"bind:matNm\" autosizerow=\"limitmin\"/><Cell col=\"4\" text=\"bind:carNo\"/><Cell col=\"5\" text=\"bind:cntCd\"/><Cell col=\"6\" text=\"bind:ordDay\"/><Cell col=\"7\" text=\"bind:procDay\"/><Cell col=\"8\" text=\"bind:statNm\"/><Cell col=\"9\" text=\"bind:birthDay\"/><Cell col=\"10\" text=\"bind:buslNo\"/><Cell col=\"11\" text=\"bind:mobNo\"/><Cell col=\"12\" text=\"bind:telNo\"/><Cell col=\"13\" text=\"bind:payNm\"/><Cell col=\"14\" text=\"bind:payDD\"/><Cell col=\"15\" style=\"align:right;\" text=\"bind:prePaid\"/><Cell col=\"16\" style=\"align:right;\" text=\"bind:arreAmt\"/><Cell col=\"17\" text=\"bind:arreMon\"/></Band><Band id=\"summary\"><Cell text=\"총계\"/><Cell col=\"1\" style=\"align:right;\" expr=\"dataset.getRowCount()+&quot;(건)&quot;\"/><Cell col=\"2\"/><Cell col=\"3\"/><Cell col=\"4\"/><Cell col=\"5\"/><Cell col=\"6\"/><Cell col=\"7\"/><Cell col=\"8\"/><Cell col=\"9\"/><Cell col=\"10\"/><Cell col=\"11\"/><Cell col=\"12\"/><Cell col=\"13\"/><Cell col=\"14\"/><Cell col=\"15\"/><Cell col=\"16\"/><Cell col=\"17\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Button("btn_refresh", "absolute", null, "10", "57", "22", "25", null, this);
            obj.set_taborder("42");
            obj.set_text("재조회");
            obj.set_cssclass("btn_WF_CRUD");
            obj.set_visible("true");
            this.addChild(obj.name, obj);

            obj = new Button("btn_cancel", "absolute", null, "194", "45", "22", "75", null, this);
            obj.set_taborder("51");
            obj.set_text("취소");
            obj.set_cssclass("btn_WF_module");
            obj.set_enable("true");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_cancel", "absolute", "605", "221", "536", "208", null, null, this);
            obj.set_taborder("55");
            obj.set_binddataset("ds_cancel");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"75\"/><Column size=\"70\"/><Column size=\"80\"/><Column size=\"70\"/><Column size=\"70\"/><Column size=\"85\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/><Row size=\"24\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"수납일자\"/><Cell col=\"1\" text=\"수납방법\"/><Cell col=\"2\" text=\"수납금액\"/><Cell col=\"3\" text=\"수납유형\"/><Cell col=\"4\" text=\"청구회차\"/><Cell col=\"5\" text=\"수납취소여부\"/></Band><Band id=\"body\"><Cell text=\"bind:recvDay\"/><Cell col=\"1\" text=\"bind:recpPnm\"/><Cell col=\"2\" style=\"align:right;\" text=\"bind:recpAmt\"/><Cell col=\"3\" text=\"bind:recpFnm\"/><Cell col=\"4\" text=\"bind:recpNu\"/><Cell col=\"5\" text=\"bind:cncStat\"/></Band><Band id=\"summary\"><Cell text=\"총계\"/><Cell col=\"1\" style=\"align:right;\" expr=\"dataset.getRowCount()+&quot;(건)&quot;\"/><Cell col=\"2\"/><Cell col=\"3\"/><Cell col=\"4\"/><Cell col=\"5\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_billingList", "absolute", "25", "221", "560", "208", null, null, this);
            obj.set_taborder("56");
            obj.set_binddataset("ds_billingList");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj.set_autofittype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"55\"/><Column size=\"60\"/><Column size=\"70\"/><Column size=\"75\"/><Column size=\"75\"/><Column size=\"70\"/><Column size=\"90\"/><Column size=\"65\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/><Row size=\"24\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"청구회차\"/><Cell col=\"1\" text=\"청구구분\"/><Cell col=\"2\" text=\"청구일자\"/><Cell col=\"3\" text=\"청구금액\"/><Cell col=\"4\" text=\"수납금액\"/><Cell col=\"5\" text=\"미납금액\"/><Cell col=\"6\" text=\"최종수납일자\"/><Cell col=\"7\" text=\"결제일\"/></Band><Band id=\"body\"><Cell text=\"bind:recpNu\"/><Cell col=\"1\" text=\"bind:recpNm\"/><Cell col=\"2\" text=\"bind:zfbDay\"/><Cell col=\"3\" style=\"align:right;\" text=\"bind:saleAmt\"/><Cell col=\"4\" style=\"align:right;\" text=\"bind:recpAmt\"/><Cell col=\"5\" style=\"align:right;\" text=\"bind:arreAmt\"/><Cell col=\"6\" text=\"bind:rcDay\"/><Cell col=\"7\" text=\"bind:payDD\"/></Band><Band id=\"summary\"><Cell text=\"총계\"/><Cell col=\"1\" style=\"align:right;\" expr=\"dataset.getRowCount()+&quot;(건)&quot;\"/><Cell col=\"2\"/><Cell col=\"3\" displaytype=\"number\" style=\"align:right;\" expr=\"expr:dataset.getSum(&quot;saleAmt&quot;)\"/><Cell col=\"4\" displaytype=\"number\" style=\"align:right;\" expr=\"expr:dataset.getSum(&quot;recpAmt&quot;)\"/><Cell col=\"5\" displaytype=\"number\" style=\"align:right;\" expr=\"expr:dataset.getSum(&quot;arreAmt&quot;)\"/><Cell col=\"6\"/><Cell col=\"7\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Button("btn_cancelExcel", "absolute", null, "194", "45", "22", "25", null, this);
            obj.set_taborder("57");
            obj.set_text("엑셀");
            obj.set_cssclass("btn_WF_CRUD");
            obj.set_enable("true");
            this.addChild(obj.name, obj);

            obj = new Button("btn_billingExcel", "absolute", "540", "195", "45", "22", null, null, this);
            obj.set_taborder("58");
            obj.set_text("엑셀");
            obj.set_cssclass("btn_WF_CRUD");
            this.addChild(obj.name, obj);

            obj = new Button("btn_billingSearch", "absolute", "491", "195", "45", "22", null, null, this);
            obj.set_taborder("59");
            obj.set_text("조회");
            obj.set_cssclass("btn_WF_CRUD");
            this.addChild(obj.name, obj);

            obj = new Calendar("cal_toZfbDay", "absolute", "361", "196", "100", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("60");
            obj.set_dateformat("yyyy-MM-dd");

            obj = new Static("Static06", "absolute", "346", "199", "10", "21", null, null, this);
            obj.set_taborder("61");
            obj.set_text("~");
            this.addChild(obj.name, obj);

            obj = new Calendar("cal_fromZfbDay", "absolute", "241", "196", "100", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("62");
            obj.set_dateformat("yyyy-MM-dd");

            obj = new Static("Static05", "absolute", "163", "196", "78", "20", null, null, this);
            obj.set_taborder("63");
            obj.set_text("청구일자");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "0", "25", null, null, "0", this);
            obj.set_taborder("64");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1166, 454, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("test_form");
            		p.set_titletext("수납취소");
            		p.style.set_color("#333333ff");
            		p.set_enable("true");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTREPaymentComm_tab4.xfdl", "lib::comLib.xjs");
        this.registerScript("RTREPaymentComm_tab4.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분	: 수금관리 > 수납공통화면 > 수금취소
         * 02. 그룹명		: RTREPaymentComm_tab4.xfdl
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
        this.popupId = this.parent.popupId;

        /***********************************************************************
         * 그룹 변수 선언부
         ***********************************************************************/
        this.toDay	  = "";	/* 당일			*/
        this.curMonth = "";	/* 당월말일	*/
        this.cncRseq  = 0; 	/* 취소시퀀스	*/
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
        	var sController	 = "ntrms/re/getDayMongth.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "";
        	var sArgs		 = "";
        	var fn_callBack	 = "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 수금내역 조회
         */
        this.fn_retrieveCollectionMoneyList = function() {
        	this.ds_collectionMoneyList.clearData();
        	this.ds_billingList.clearData();
        	this.grd_collectionMoneyList.set_nodatatext("");
        	this.grd_billingList.set_nodatatext("");
        	
        	var sSvcID		 = "retrieveCollectionMoneyList";
        	var sController	 = "ntrms/re/getCollectionMoneyList.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "ds_collectionMoneyList=output";
        	var sArgs		 = "";
        		sArgs		+= Ex.util.setParam("custNo", this.custNo);
        	var fn_callBack	 = "fn_callBack";
        	
        	this.ds_collectionMoneyList.set_enableevent(false);
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 청구내역 조회
         */
        this.fn_getBillingRecordList = function() {
        	this.grd_billingList.set_nodatatext("");
        	
        	this.ds_billingList.set_enableevent(false);
        	this.ds_billingList.clearData();
        	this.ds_billingList.set_enableevent(true);
        	
        	var dsCollect = this.ds_collectionMoneyList;
        	var nRow	  = dsCollect.rowposition;
        	
        	if(nRow == -1) {
        		nRow = 0;
        	}
        	
        	var ordNo	   = dsCollect.getColumn(nRow, "ordNo");	/* 계약번호		*/
        	var fromZfbDay = this.cal_fromZfbDay.value;	/* 시작청구일자	*/
        	var toZfbDay   = this.cal_toZfbDay.value;	/* 종료청구일자	*/
        	
        	var sSvcID		 = "getBillingRecordList";
        	var sController	 = "ntrms/re/getBillingRecordList.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "ds_billingList=output";
        	var sArgs		 = "";
        		sArgs		+= Ex.util.setParam("ordNo", nvl(ordNo));
        		sArgs		+= Ex.util.setParam("zfbFd", nvl(fromZfbDay));
        		sArgs		+= Ex.util.setParam("zfbTd", nvl(toZfbDay));
        	var fn_callBack	 = "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 수납내역 조회
         */
        this.fn_getReceiptList = function() {
        	this.grd_cancel.set_nodatatext("");
        	this.ds_cancel.clearData();
        	
        	var ordNo	= nvl(this.ds_collectionMoneyList.getColumn(this.ds_collectionMoneyList.rowposition, "ordNo"));	/* 계약번호 */
        	var schdSeq	= nvl(this.ds_billingList.getColumn(this.ds_billingList.rowposition, "schdSeq"));				/* 청구번호 */
        	
        	var sSvcID		 = "getReceiptList";
        	var sController	 = "ntrms/re/getReceiptList.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "ds_cancel=output";
        	var sArgs		 = "";
        		sArgs		+= Ex.util.setParam("ordNo",   ordNo);
        		sArgs		+= Ex.util.setParam("schdSeq", schdSeq);
        	var fn_callBack	 = "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 비온라인계약 수납취소내역 조회
         */
        this.fn_getCancelExOContractList = function() {
        	this.ds_nonOineCnclRecpList.clearData();
        	
        	var dsCollect = this.ds_collectionMoneyList;
        	var nRow	  = dsCollect.rowposition;
        	
        	if(nRow == -1) {
        		nRow = 0;
        	}
        	
        	var ordNo	= dsCollect.getColumn(nRow, "ordNo");
        	var recvSeq	= this.ds_cancel.getColumn(this.ds_cancel.rowposition, "recvSeq");
        	
        	var sSvcID		 = "getCancelExOContractList";
        	var sController	 = "ntrms/re/getCancelExOContractList.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "ds_nonOineCnclRecpList=output";
        	var sArgs		 = "";
        		sArgs		+= Ex.util.setParam("ordNo",   nvl(ordNo));		/* 계약번호 */
        		sArgs		+= Ex.util.setParam("recvSeq", nvl(recvSeq));	/* 청구번호 */
        	var fn_callBack	 = "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
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

        /**
         * 비온라인계약 수납취소
         */
        this.fn_cancelExOContract = function() {
        	var ds		= this.ds_nonOineCnclRecpList;
        	
        	var recvDay	= ds.getColumn(0, "recvDay");
        	var recvSeq	= ds.getColumn(0, "recvSeq");
        	var ordNo	= ds.getColumn(0, "ordNo");
        	var custNo	= ds.getColumn(0, "custNo");
        	var cncRseq	= this.cncRseq;
        	
        	var sSvcID		 = "cancelExOContract";
        	var sController	 = "ntrms/re/cancelExOContract.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "";
        	var sArgs		 = "";
        		sArgs		+= Ex.util.setParam("recvDay", nvl(recvDay));	/* 수납일자		*/
        		sArgs		+= Ex.util.setParam("recvSeq", nvl(recvSeq));	/* 수납거래번호	*/
        		sArgs		+= Ex.util.setParam("ordNo",   nvl(ordNo));		/* 계약번호		*/
        		sArgs		+= Ex.util.setParam("custNo",  nvl(custNo));	/* 고객번호		*/
        		sArgs		+= Ex.util.setParam("cncRseq", nvl(cncRseq));	/* 취소거래번호	*/
        	var fn_callBack	 = "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /***********************************************************************************
         * CallBack Event (strSvcId - Sevice ID, nErrorCode - ErrorCode, strErrorMsg - Error Message)
         ***********************************************************************************/
        this.fn_callBack = function(strSvcId,nErrorCode,strErrorMsg) {
        	if(nErrorCode < 0) {
        		return Ex.core.comMsg("alert", strErrorMsg);
        	}
        	
        	switch(strSvcId) {
        		/* 월일 조회 */
        		case "getDayMongth":
        			this.curMonth = this.toDay.substr(0, 4) + this.toDay.substr(4, 2) + Eco.date.getLastDayOfMonth(this.toDay);
        			
        			this.cal_toZfbDay.set_value(curMonth);
        			break;
        		
        		/* 수금내역 조회 */
        		case "retrieveCollectionMoneyList":
        			var ds = this.ds_collectionMoneyList;
        			
        			ds.set_rowposition(-1);
        			ds.set_enableevent(true);
        			
        			if(ds.getRowCount() > 0) {
        				this.fn_getBillingRecordList();
        				
        				this.tordNo	= ds.getColumn(0, "ordNo");
        				this.custNo	= ds.getColumn(0, "custNo");
        				this.custNm	= ds.getColumn(0, "custNm");
        				this.matNm	= ds.getColumn(0, "matNm");
        				this.telNo	= ds.getColumn(0, "telNo");
        				this.mobNo	= ds.getColumn(0, "mobNo");
        				
        				var ordDay	= ds.getColumn(0, "ordDay");
        				
        				this.cal_fromZfbDay.set_value(ordDay);
        			} else {
        				this.grd_collectionMoneyList.set_nodatatext("조회된 결과가 없습니다.");
        			}
        			break;
        		
        		/* 청구내역 조회 */
        		case "getBillingRecordList":
        			break;
        		
        		/* 수납내역 조회 */
        		case "getReceiptList":
        			this.ds_cancel.set_rowposition(-1);
        			
        			if(this.ds_cancel.getRowCount() == 0) {
        				this.grd_cancel.set_nodatatext("조회된 결과가 없습니다.");
        			}
        			break;
        		
        		/* 비온라인계약 수납취소내역 조회 */
        		case "getCancelExOContractList":
        			if(this.ds_nonOineCnclRecpList.getRowCount() == 0) {
        				//this.alert("수납취소내역이 존재하지 않습니다.");
        				
        				//return false;
        			} else {
        				if(this.ds_nonOineCnclRecpList.getRowCount() > 1) {
        					this.ds_nonOineCnclRecpList.deleteRow(1);
        				}
        				
        				/* 비온라인계약 수납취소 SEQ */
        				this.fn_getCncRseq();
        			}
        			break;
        		
        		/* 비온라인계약 수납취소 SEQ */
        		case "getCncRseq":
        			if(this.cncRseq == 0) {
        				alert("취소시퀀스를 가져오지 못했습니다.");
        				
        				return false;
        			} else {
        				this.ds_nonOineCnclRecpList.addColumn("cncRseq", "string");
        				this.ds_nonOineCnclRecpList.setColumn(0, "cncRseq", this.cncRseq);
        				
        				this.ds_nonOineCnclRecpList.set_updatecontrol(false);
        				this.ds_nonOineCnclRecpList.setRowType(0, Dataset.ROWTYPE_INSERT);
        				this.ds_nonOineCnclRecpList.set_updatecontrol(true);
        				
        				/* 비온라인계약 수납취소 */
        				this.fn_cancelExOContract();
        			}
        			break;
        		
        		/* 비온라인계약 수납취소 */
        		case "cancelExOContract":
        			this.alert("정상적으로 처리되었습니다.");
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
         * 청구내역 조회
         */
        this.btn_billingSearch_onclick = function(obj,e) {
        	this.fn_getBillingRecordList();
        }

        /**
         * 청구내역 엑셀다운로드
         */
        this.btn_billingExcel_onclick = function(obj,e) {
        	Ex.core.exportExcel(this, this.grd_billingList);
        }

        /**
         * 수납취소
         */
        this.btn_cancel_onclick = function(obj,e) {
        	var ds	  = this.ds_collectionMoneyList;
        	var nRow  = ds.rowposition;
        	var ordNo = "";
        	
        	if(nRow > -1) {
        		ordNo = nvl(ds.getColumn(0, "ordNo"));
        	} else {
        		ordNo = nvl(ds.getColumn(nRow, "ordNo"));
        	}
        	
        	var ordFlag	= ordNo.substr(0, 1);
        	
        	if(ordFlag != "O") {
        		/* 온라인계약 제외 */
        		this.fn_getCancelExOContractList();
        	} else {
        		this.alert("온라인계약은 취소 할 수 없습니다.");
        	}
        }

        /**
         * 수납내역 엑셀다운로드
         */
        this.btn_cancelExcel_onclick = function(obj,e) {
        	Ex.core.exportExcel(this, this.grd_cancel);
        }

        /**
         * ds_collectionMoneyList Onrowposchanged Event
         */
        this.ds_collectionMoneyList_onrowposchanged = function(obj,e) {
        	this.tordNo	= obj.getColumn(e.newrow, "ordNo");
        	this.matNm	= obj.getColumn(e.newrow, "matNm");
        	
        	var ordDay = obj.getColumn(e.newrow, "ordDay");
        	 
        	this.cal_fromZfbDay.set_value(ordDay);
        	
        	/*  청구내역 조회 */
        	this.fn_getBillingRecordList();
        }

        /**
         * ds_billingList Onrowposchanged Event
         */
        this.ds_billingList_onrowposchanged = function(obj,e) {
        	/* 수납내역조회 */
        	this.fn_getReceiptList();
        }
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.ds_collectionMoneyList.addEventHandler("onrowposchanged", this.ds_collectionMoneyList_onrowposchanged, this);
            this.ds_billingList.addEventHandler("onrowposchanged", this.ds_billingList_onrowposchanged, this);
            this.addEventHandler("onload", this.form_onload, this);
            this.btn_refresh.addEventHandler("onclick", this.btn_refresh_onclick, this);
            this.btn_cancel.addEventHandler("onclick", this.btn_cancel_onclick, this);
            this.grd_cancel.addEventHandler("oncellclick", this.grd_list03_oncellclick, this);
            this.grd_billingList.addEventHandler("onselectchanged", this.grd_list02_oncellclick, this);
            this.btn_cancelExcel.addEventHandler("onclick", this.btn_cancelExcel_onclick, this);
            this.btn_billingExcel.addEventHandler("onclick", this.btn_billingExcel_onclick, this);
            this.btn_billingSearch.addEventHandler("onclick", this.btn_billingSearch_onclick, this);
            this.cal_toZfbDay.addEventHandler("oneditclick", this.Div00_cal_fromZfbDay03_oneditclick, this);
            this.cal_fromZfbDay.addEventHandler("oneditclick", this.Div00_cal_fromZfbDay03_oneditclick, this);

        };

        this.loadIncludeScript("RTREPaymentComm_tab4.xfdl");

       
    };
}
)();
