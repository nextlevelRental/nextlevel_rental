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
                this.set_name("frm_RTRECrdImmWthdrDtl");
                this.set_classname("test_form");
                this.set_titletext("카드즉시출금 내역조회");
                this._setFormPosition(0,0,1147,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_crdImmWthdrList", this);
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"rcrdDay\" type=\"STRING\" size=\"256\"/><Column id=\"rcrdSeq\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"tordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"recpTp\" type=\"STRING\" size=\"256\"/><Column id=\"recpTpNm\" type=\"STRING\" size=\"256\"/><Column id=\"tno\" type=\"STRING\" size=\"256\"/><Column id=\"crdCd\" type=\"STRING\" size=\"256\"/><Column id=\"crdNm\" type=\"STRING\" size=\"256\"/><Column id=\"recpAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"cncStat\" type=\"STRING\" size=\"256\"/><Column id=\"prtCncRmnnAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"recvSeq\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"cncRseq\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"refundYn\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_crdImmWthdrDtlList", this);
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"chk\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"schdSeq\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"recpFg\" type=\"STRING\" size=\"256\"/><Column id=\"recpFgNm\" type=\"STRING\" size=\"256\"/><Column id=\"recpAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"cncStat\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Grid("grd_crdImmWthdrList", "absolute", "0", "86", "1122", "185", null, null, this);
            obj.set_taborder("1");
            obj.set_binddataset("ds_crdImmWthdrList");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"200\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"수납일자\"/><Cell col=\"1\" text=\"계약번호\"/><Cell col=\"2\" text=\"고객번호\"/><Cell col=\"3\" text=\"고객명\"/><Cell col=\"4\" text=\"청구구분\"/><Cell col=\"5\" text=\"카드사명\"/><Cell col=\"6\" text=\"수납금액\"/><Cell col=\"7\" text=\"수납취소여부\"/><Cell col=\"8\" text=\"취소후잔액\"/><Cell col=\"9\" text=\"환불여부\"/></Band><Band id=\"body\"><Cell style=\"align:center middle;\" text=\"bind:rcrdDay\" mask=\"####-##-##\" calendardisplaynulltype=\"none\"/><Cell col=\"1\" style=\"align:center middle;\" text=\"bind:tordNo\"/><Cell col=\"2\" style=\"align:center middle;\" text=\"bind:custNo\"/><Cell col=\"3\" style=\"align:center middle;\" text=\"bind:custNm\"/><Cell col=\"4\" style=\"align:center middle;\" text=\"bind:recpTpNm\"/><Cell col=\"5\" style=\"align:center middle;\" text=\"bind:crdNm\"/><Cell col=\"6\" displaytype=\"number\" style=\"align:right middle;\" text=\"bind:recpAmt\" mask=\"###,###,###,##0\"/><Cell col=\"7\" style=\"align:center middle;\" text=\"bind:cncStat\"/><Cell col=\"8\" displaytype=\"number\" style=\"align:right middle;\" text=\"bind:prtCncRmnnAmt\" mask=\"###,###,###,##0\"/><Cell col=\"9\" style=\"align:center middle;\" text=\"bind:refundYn\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1122", "0", "25", "496", null, null, this);
            obj.set_taborder("13");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("st_crdImmWthdrList", "absolute", "0", "61", "120", "20", null, null, this);
            obj.set_taborder("15");
            obj.set_text("검색결과");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "0", "0", "1122", "45", null, null, this);
            obj.set_taborder("0");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_rcrdDay", "absolute", "20", "10", "78", "21", null, null, this.div_search);
            obj.set_taborder("23");
            obj.set_text("수납일자");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_rcrdFDay", "absolute", "98", "10", "100", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("0");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_value("null");
            obj = new Calendar("cal_rcrdTDay", "absolute", "218", "10", "100", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("1");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_value("null");
            obj = new Static("Static07", "absolute", "203", "10", "10", "21", null, null, this.div_search);
            obj.set_taborder("28");
            obj.set_text("~");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_ordNo", "absolute", "348", "10", "78", "21", null, null, this.div_search);
            obj.set_taborder("29");
            obj.set_text("계약번호");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_custNo", "absolute", "576", "10", "78", "21", null, null, this.div_search);
            obj.set_taborder("30");
            obj.set_text("고객번호");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_custNo", "absolute", "654", "10", "100", "21", null, null, this.div_search);
            obj.set_taborder("4");
            obj.set_inputfilter("space");
            obj.set_lengthunit("ascii");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_custPopUp", "absolute", "734", "9", "21", "21", null, null, this.div_search);
            obj.set_taborder("5");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_custNoKeyword", "absolute", "753", "10", "100", "21", null, null, this.div_search);
            obj.set_taborder("6");
            obj.set_inputfilter("space");
            obj.set_lengthunit("ascii");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_ordNo", "absolute", "426", "10", "120", "21", null, null, this.div_search);
            obj.set_taborder("2");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_ordPopUp", "absolute", "525", "9", "21", "21", null, null, this.div_search);
            obj.set_taborder("3");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("st_crdImmWthdrDtlList", "absolute", "0", "287", "120", "20", null, null, this);
            obj.set_taborder("16");
            obj.set_text("수납내역 상세");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_crdImmWthdrDtlList", "absolute", "0", "312", "560", "184", null, null, this);
            obj.set_taborder("17");
            obj.set_binddataset("ds_crdImmWthdrDtlList");
            obj.set_autofittype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"40\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"24\" band=\"summ\"/></Rows><Band id=\"head\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\"/><Cell col=\"1\" text=\"계약번호\"/><Cell col=\"2\" text=\"청구회차\"/><Cell col=\"3\" text=\"수납유형\"/><Cell col=\"4\" text=\"수납금액\"/><Cell col=\"5\" text=\"수납취소여부\"/></Band><Band id=\"body\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\" text=\"bind:chk\"/><Cell col=\"1\" style=\"align:center middle;\" text=\"bind:ordNo\"/><Cell col=\"2\" style=\"align:center middle;\" text=\"bind:schdSeq\"/><Cell col=\"3\" style=\"align:center middle;\" text=\"bind:recpFgNm\"/><Cell col=\"4\" displaytype=\"number\" style=\"align:right middle;\" text=\"bind:recpAmt\" mask=\"###,###,###,##0\"/><Cell col=\"5\" style=\"align:center middle;\" text=\"bind:cncStat\"/></Band><Band id=\"summary\"><Cell/><Cell col=\"1\" colspan=\"2\" text=\"총계\"/><Cell col=\"3\" style=\"align:right middle;padding:0 5 0 0;\" text=\"expr:dataset.getRowCount()+&quot;(건)&quot;\"/><Cell col=\"4\" displaytype=\"number\" style=\"align:right middle;padding:0 5 0 0;\" text=\"expr:dataset.getSum(&quot;recpAmt&quot;)\" mask=\"###,###,###,##0\"/><Cell col=\"5\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Button("btn_refund", "absolute", "516", "284", "45", "22", null, null, this);
            obj.set_taborder("18");
            obj.set_text("환불");
            obj.set_cssclass("btn_WF_module");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Div("div_payment", "absolute", "2", "507", "536", "181", null, null, this);
            obj.set_taborder("20");
            obj.set_visible("false");
            obj.set_url("re::RTREPaymentComm_div.xfdl");
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
            obj = new Layout("default", "", 1147, 496, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("test_form");
            		p.set_titletext("카드즉시출금 내역조회");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        
        this.loadPreloadList = function()
        {
            this._addPreloadList("fdl", "re::RTREPaymentComm_div.xfdl");
        };
        
        // User Script
        this.addIncludeScript("RTRECrdImmWthdrDtl.xfdl", "lib::comLib.xjs");
        this.registerScript("RTRECrdImmWthdrDtl.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분	: 수금관리 > 즉시출금 관리 > 카드즉시출금 내역조회
         * 02. 그룹명		: RTRECrdImmWthdrDtl.xfdl
         * 03. 그룹설명	: 
         * 04. 작성일		: 2018-11-06
         * 05. 작성자		: 노창호
         * 06. 수정이력	:
         * ---------------------------------
         * 변경일자		변경자		변경내용
         * ---------------------------------
         * 2018-11-06	노창호		최초작성
         * 2019-02-25	wjim		[20190225_01] 환불 기능 사용권한 제약
         *                          - '영업관리자' 사용자그룹 사용자만 사용 가능
         ***********************************************************************/

        /***********************************************************************
         * Script Include
         ***********************************************************************/
        //include "lib::comLib.xjs";

        /***********************************************************************
         * FORM 변수 선언 영역
         ***********************************************************************/
        this.viewId	= "";

        /***********************************************************************
         * 그룹 변수 선언부
         ************************************************************************/
        this.toDay	 = "";
        this.userGrp = "";	/* 사용자그룹 */

        /***********************************************************************************
        * Form Load Common Function
        ***********************************************************************************/
        this.form_onload = function(obj,e) {
        	Ex.core.init(obj);
        	
        	/* 현재일자 */
        	this.fn_getDate();
        	
        	/* 공통버튼 */
        	this.parent.setButton("E|S", this);
        	
        	this.div_payment.div_cardImmWthdr.st_paymentAmtTh.set_text("취소금액");
        	this.div_payment.div_cardImmWthdr.st_quotaoptTh.set_text("");
        	this.div_payment.div_cardImmWthdr.st_quotaoptTh.set_cssclass("sta_WF_detailLabel");
        	this.div_payment.div_cardImmWthdr.cbo_quotaopt.set_visible(false);
        	
        	/* 특정 사용자그룹에게만 "환불" 버튼 보이기 [20190225_01] */
        	this.userGrp = application.gds_userInfo.getColumn(0, "userGrp");
        	
        	if (this.userGrp == "01" ) {
         		this.btn_refund.set_visible(true);
         	} else {
         		this.btn_refund.set_visible(false);
         	}
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
         * 카드즉시출금 내역조회
         */
        this.fn_retrieveCrdImmWthdrList = function() {
        	var sRcrdFDay = this.div_search.cal_rcrdFDay.value;	/* 수납일자 StartDay	*/
        	var sRcrdTDay = this.div_search.cal_rcrdTDay.value;	/* 수납일자 EndDay		*/
        	var sOrdNo	  = this.div_search.ed_ordNo.text;		/* 계약번호			*/
        	var sCustNo	  = this.div_search.ed_custNo.text;		/* 고객번호			*/
        	
        	this.ds_crdImmWthdrList.set_enableevent(false);
        	this.ds_crdImmWthdrList.clearData();
        	this.ds_crdImmWthdrList.set_enableevent(true);
        	
        	var sSvcID        	= "retrieveCrdImmWthdrList";
        	var sController   	= "ntrms/re/retrieveCrdImmWthdrList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_crdImmWthdrList=output";
        	var sArgs 			= "";
        		sArgs		   += Ex.util.setParam("rcrdFDay", nvl(sRcrdFDay));
        		sArgs		   += Ex.util.setParam("rcrdTDay", nvl(sRcrdTDay));
        		sArgs		   += Ex.util.setParam("ordNo",	   nvl(sOrdNo));
        		sArgs		   += Ex.util.setParam("custNo",   nvl(sCustNo));
        	var fn_callBack		= "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 수납내역 상세조회
         */
        this.fn_retrieveCrdImmWthdrDtlList = function() {
        	var sRecvSeq = this.ds_crdImmWthdrList.getColumn(this.ds_crdImmWthdrList.rowposition, "recvSeq");	/* 수납거래번호 */
        	
        	this.ds_crdImmWthdrDtlList.clearData();
        	
        	var sSvcID        	= "retrieveCrdImmWthdrDtlList";
        	var sController   	= "ntrms/re/retrieveCrdImmWthdrDtlList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_crdImmWthdrDtlList=output";
        	var sArgs 			= "";
        		sArgs		   += Ex.util.setParam("recvSeq", nvl(sRecvSeq));
        	var fn_callBack		= "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /***********************************************************************************
         * CallBack Event(strSvcId - Sevice ID, nErrorCode - ErrorCode, strErrorMsg - Error Message)
         ***********************************************************************************/
        this.fn_callBack = function(strSvcId,nErrorCode,strErrorMsg) {
        	if(nErrorCode < 0) {
        		return Ex.core.comMsg("alert", strErrorMsg);
        	}
        	
        	switch(strSvcId) {
        		/* 현재일자 조회 */
        		case "getDate":
        			var sFirstDay = Eco.date.getFirstDate(this.toDay);
        			
        			this.div_search.cal_rcrdFDay.set_value(sFirstDay);
        			this.div_search.cal_rcrdTDay.set_value(this.toDay);
        			break;
        		
        		/* 카드즉시출금 내역조회 */
        		case "retrieveCrdImmWthdrList":
        			break;
        		
        		/* 수납내역 상세조회 */
        		case "retrieveCrdImmWthdrDtlList":
        			break;
        		
        		default:
        			break;
        	}
        }

        /**
         * 계약번호 Popup Callback
         */
        this.returnOrderNoInfo = function(val) {
        	this.div_search.ed_ordNo.set_value(val[0].getColumn(0, "ordNo"));
        }

        /**
         * 고객번호 Popup Callback
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

        /***********************************************************************************
         * Component Event & Function
         ***********************************************************************************/
        /**
         * 조회
         */
        this.fn_search = function() {
        	this.fn_retrieveCrdImmWthdrList();
        }

        /**
         * 엑셀 버튼의 클릭 이벤트 처리
         */
        this.fn_excel = function(obj,e) {
        	if(this.ds_crdImmWthdrList.getRowCount() > 0) {
        		Ex.core.exportExcel(this, this.grd_crdImmWthdrList, "카드즉시출금내역");
        	} else {
        		this.alert("다운로드할 조회결과가 없습니다");
        	}
        }

        /**
         * 환불
         */
        this.btn_refund_onclick = function(obj,e) {
        	if(this.ds_crdImmWthdrDtlList.findRow("chk", "1") == -1) {
        		this.alert("환불대상이 선택되지 않았습니다.");
        		
        		return false;
        	}
        	var div			= this.div_payment;
        	var ds			= this.ds_crdImmWthdrList;
        	var nRow		= ds.rowposition;
        	var divCrd		= div.div_cardImmWthdr;
        	var dsCrdParam	= div.ds_crdPymntParam;
        	var nPaymentAmt	= divCrd.st_paymentAmt.text.replace(",", "");
        		nPaymentAmt	= nPaymentAmt.replace("원", "");
        	
        	var custNo		= nvl(ds.getColumn(nRow, "custNo"));
        	var ordNo		= nvl(ds.getColumn(nRow, "tordNo"));
        	var modType		= "";
        	var recvSeq		= nvl(ds.getColumn(nRow, "recvSeq"));
        	var modMny		= nPaymentAmt;
        	var remMny		= nvl(ds.getColumn(nRow, "prtCncRmnnAmt"));
        	var refundYn	= "";
        	var tno			= nvl(ds.getColumn(nRow, "tno"));
        	var modDesc		= "환불처리";
        	
        	if(remMny == nPaymentAmt) {
        		/* 전체취소 */
        		modType = "STSC";
        		refundYn = "Y";
        	} else {
        		/* 부분취소 */
        		modType = "STPC";
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
        	dsCrdParam.setColumn(0, "tno",		tno);			/* KCP거래번호		*/
        	dsCrdParam.setColumn(0, "modDesc",	modDesc);		/* 요청사유		*/
        	dsCrdParam.setColumn(0, "workCd",	this.viewId);	/* 업무구분		*/
        	
        	/* 카드즉시출금 결제/환불 */
        	div.fn_processPayment();
        }

        /**
         * 계약번호 팝업
         */
        this.fn_ordPopUp = function(obj,e) {
        	var args = {p_arg : "RTREVacc"};
        	
        	Ex.core.popup(this, "계약번호 조회", "comm::RTCOMMOrderNo_pop.xfdl", args, "modaless=false");
        }

        /**
         * 고객번호 팝업
         */
        this.fn_custPopUp = function(obj,e) {
        	var args = {  p_formId : this.id
        				, p_custNo : nvl(this.div_search.ed_custNo.value)
        				, p_custNm : nvl(this.div_search.ed_custNoKeyword.value)
        			   };
        	
        	Ex.core.popup(this, "고객찾기", "comm::RTCOMMCust_pop.xfdl", args, "modaless=false");
        }

        /**
         * grd_crdImmWthdrDtlList Onheadclick Event
         */
        this.grd_crdImmWthdrDtlList_onheadclick = function(obj,e) {
        	var ds		 = this.ds_crdImmWthdrDtlList;
        	var div		 = this.div_payment;
        	var totalAmt = 0;
        	
        	if(obj.getCellProperty("head", 0, "text") == 0) {
        		for(var i = 0; i < ds.rowcount; i++) {
        			totalAmt += ds.getColumn(i, "recpAmt");
        		}
        	} else {
        		totalAmt = 0;
        	}
        	
        	totalAmt = nvl(div.fn_numberWithComma(totalAmt));
        	totalAmt = totalAmt == "" ? "0" : totalAmt;
        	
        	div.div_cardImmWthdr.st_paymentAmt.set_text(totalAmt + "원");
        }

        /**
         * ds_crdImmWthdrList Onrowposchanged Event
         */
        this.ds_crdImmWthdrList_onrowposchanged = function(obj,e) {
        	if(obj.getColumn(e.newrow, "cncStat") == "N" || obj.getColumn(e.newrow, "refundYn") == "Y") {
        		this.btn_refund.set_enable(false);
        	} else {
        		this.btn_refund.set_enable(true);
        	}
        	
        	this.fn_retrieveCrdImmWthdrDtlList();
        }

        /**
         * ds_crdImmWthdrDtlList Oncolumnchanged Event
         */
        this.ds_crdImmWthdrDtlList_oncolumnchanged = function(obj,e) {
        	var div	= this.div_payment;
        	var ds	= this.ds_crdImmWthdrDtlList;
        	
        	if(e.columnid == "chk") {
        		var totalAmt = 0;
        		
        		for(var i = 0; i < ds.rowcount; i++) {
        			if(obj.getColumn(i, "chk") == "1") {
        				totalAmt += ds.getColumn(i, "recpAmt");
        			}
        		}
        	}
        	
        	totalAmt = nvl(div.fn_numberWithComma(totalAmt));
        	totalAmt = totalAmt == "" ? "0" : totalAmt;
        	
        	div.div_cardImmWthdr.st_paymentAmt.set_text(totalAmt + "원");
        }
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.ds_crdImmWthdrList.addEventHandler("onrowposchanged", this.ds_crdImmWthdrList_onrowposchanged, this);
            this.ds_crdImmWthdrDtlList.addEventHandler("oncolumnchanged", this.ds_crdImmWthdrDtlList_oncolumnchanged, this);
            this.addEventHandler("onload", this.form_onload, this);
            this.div_search.cal_rcrdFDay.addEventHandler("onchanged", this.cal_referDate_onchanged, this);
            this.div_search.cal_rcrdTDay.addEventHandler("onchanged", this.cal_referDate_onchanged, this);
            this.div_search.ed_custNo.addEventHandler("onkeyup", this.div_search_ed_custNo_onkeyup, this);
            this.div_search.btn_custPopUp.addEventHandler("onclick", this.fn_custPopUp, this);
            this.div_search.ed_ordNo.addEventHandler("onkeyup", this.div_search_ed_ordNo_onkeyup, this);
            this.div_search.btn_ordPopUp.addEventHandler("onclick", this.fn_ordPopUp, this);
            this.grd_crdImmWthdrDtlList.addEventHandler("onheadclick", this.grd_crdImmWthdrDtlList_onheadclick, this);
            this.btn_refund.addEventHandler("onclick", this.btn_refund_onclick, this);

        };

        this.loadIncludeScript("RTRECrdImmWthdrDtl.xfdl");
        this.loadPreloadList();
       
    };
}
)();
