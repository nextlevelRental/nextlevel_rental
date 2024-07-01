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
                this.set_name("frm_RTREAccImmWthdrDtl");
                this.set_classname("test_form");
                this.set_titletext("계좌즉시출금 내역조회");
                this._setFormPosition(0,0,1147,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_accImmWthdrList", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"ractDay\" type=\"STRING\" size=\"256\"/><Column id=\"ractSeq\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"tordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"recpTp\" type=\"STRING\" size=\"256\"/><Column id=\"recpTpNm\" type=\"STRING\" size=\"256\"/><Column id=\"bnkCd\" type=\"STRING\" size=\"256\"/><Column id=\"bnkNm\" type=\"STRING\" size=\"256\"/><Column id=\"recpAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"cncRseq\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"cncStat\" type=\"STRING\" size=\"256\"/><Column id=\"prtCncRmnnAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"recvSeq\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"tno\" type=\"STRING\" size=\"256\"/><Column id=\"refundYn\" type=\"STRING\" size=\"256\"/><Column id=\"pOidSeq\" type=\"BIGDECIMAL\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_accImmWthdrDtlList", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"chk\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"schdSeq\" type=\"STRING\" size=\"256\"/><Column id=\"recpFg\" type=\"STRING\" size=\"256\"/><Column id=\"recpFgNm\" type=\"STRING\" size=\"256\"/><Column id=\"recpAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"cncStat\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Grid("grd_accImmWthdrList", "absolute", "0", "86", "1122", "185", null, null, this);
            obj.set_taborder("1");
            obj.set_binddataset("ds_accImmWthdrList");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"200\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"수납일자\"/><Cell col=\"1\" text=\"계약번호\"/><Cell col=\"2\" text=\"고객번호\"/><Cell col=\"3\" text=\"고객명\"/><Cell col=\"4\" text=\"청구구분\"/><Cell col=\"5\" text=\"은행명\"/><Cell col=\"6\" text=\"수납금액\"/><Cell col=\"7\" text=\"수납취소여부\"/><Cell col=\"8\" text=\"취소후잔액\"/><Cell col=\"9\" text=\"환불여부\"/></Band><Band id=\"body\"><Cell style=\"align:center middle;\" text=\"bind:ractDay\" mask=\"####-##-##\" calendardisplaynulltype=\"none\"/><Cell col=\"1\" style=\"align:center middle;\" text=\"bind:tordNo\"/><Cell col=\"2\" style=\"align:center middle;\" text=\"bind:custNo\"/><Cell col=\"3\" style=\"align:center middle;\" text=\"bind:custNm\"/><Cell col=\"4\" style=\"align:center middle;\" text=\"bind:recpTpNm\"/><Cell col=\"5\" style=\"align:center middle;\" text=\"bind:bnkNm\"/><Cell col=\"6\" displaytype=\"number\" style=\"align:right middle;\" text=\"bind:recpAmt\" mask=\"###,###,###,##0\"/><Cell col=\"7\" style=\"align:center middle;\" text=\"bind:cncStat\"/><Cell col=\"8\" displaytype=\"number\" style=\"align:right middle;\" text=\"bind:prtCncRmnnAmt\" mask=\"###,###,###,##0\"/><Cell col=\"9\" style=\"align:center middle;\" text=\"bind:refundYn\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1122", "0", "25", "496", null, null, this);
            obj.set_taborder("13");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("st_accImmWthdrList", "absolute", "0", "61", "120", "20", null, null, this);
            obj.set_taborder("15");
            obj.set_text("검색결과");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "0", "0", "1122", "45", null, null, this);
            obj.set_taborder("0");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_ractDay", "absolute", "20", "10", "78", "21", null, null, this.div_search);
            obj.set_taborder("23");
            obj.set_text("수납일자");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_ractFDay", "absolute", "98", "10", "100", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("0");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_value("null");
            obj = new Calendar("cal_ractTDay", "absolute", "218", "10", "100", "21", null, null, this.div_search);
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

            obj = new Static("st_accImmWthdrDtlList", "absolute", "0", "287", "120", "20", null, null, this);
            obj.set_taborder("16");
            obj.set_text("수납내역 상세");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_accImmWthdrDtlList", "absolute", "0", "312", "560", "184", null, null, this);
            obj.set_taborder("17");
            obj.set_binddataset("ds_accImmWthdrDtlList");
            obj.set_autofittype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"40\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"24\" band=\"summ\"/></Rows><Band id=\"head\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\"/><Cell col=\"1\" text=\"계약번호\"/><Cell col=\"2\" text=\"청구회차\"/><Cell col=\"3\" text=\"청구구분\"/><Cell col=\"4\" text=\"수납금액\"/><Cell col=\"5\" text=\"수납취소여부\"/></Band><Band id=\"body\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\" text=\"bind:chk\"/><Cell col=\"1\" style=\"align:center middle;\" text=\"bind:ordNo\"/><Cell col=\"2\" style=\"align:center middle;\" text=\"bind:schdSeq\"/><Cell col=\"3\" displaytype=\"combo\" style=\"align:center middle;\" text=\"bind:recpFgNm\" combodataset=\"ds_R007\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"4\" displaytype=\"number\" style=\"align:right middle;\" text=\"bind:recpAmt\" mask=\"###,###,###,##0\"/><Cell col=\"5\" style=\"align:center middle;\" text=\"bind:cncStat\"/></Band><Band id=\"summary\"><Cell/><Cell col=\"1\" colspan=\"2\" text=\"총계\"/><Cell col=\"3\" text=\"expr:dataset.getRowCount()+&quot;(건)&quot;\"/><Cell col=\"4\" displaytype=\"number\" style=\"align:right middle;\" text=\"expr:dataset.getSum(&quot;recpAmt&quot;)\" mask=\"###,###,###,##0\"/><Cell col=\"5\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Button("btn_refund", "absolute", "516", "284", "45", "22", null, null, this);
            obj.set_taborder("18");
            obj.set_text("환불");
            obj.set_cssclass("btn_WF_module");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Div("div_payment", "absolute", "2", "507", "536", "181", null, null, this);
            obj.set_taborder("19");
            obj.set_url("re::RTREPaymentComm_div.xfdl");
            obj.set_visible("false");
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
            		p.set_titletext("계좌즉시출금 내역조회");

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
        this.addIncludeScript("RTREAccImmWthdrDtl.xfdl", "lib::comLib.xjs");
        this.registerScript("RTREAccImmWthdrDtl.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분	: 수금관리 > 즉시출금 관리 > 계좌즉시출금 내역조회
         * 02. 그룹명		: RTREAccImmWthdrDtl.xfdl
         * 03. 그룹설명	: 
         * 04. 작성일		: 2018-11-05
         * 05. 작성자		: 노창호
         * 06. 수정이력	:
         * ---------------------------------
         * 변경일자		변경자		변경내용
         * ---------------------------------
         * 2018-11-05	노창호		최초작성
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
        this.viewId	= "accImmWthdrDtl";

        /***********************************************************************
         * 그룹 변수 선언부
         ************************************************************************/
        this.toDay	 = "";
        this.tordNo	 = "";
        this.custNo	 = "";
        this.userGrp = "";	//사용자그룹

        /***********************************************************************************
        * Form Load Common Function
        ***********************************************************************************/
        this.form_onload = function(obj,e) {
        	Ex.core.init(obj);

        	/* 현재일자 */
        	this.fn_getDate();

        	/* 공통버튼 */
        	this.parent.setButton("E|S", this);

        	// 특정 사용자그룹에게만 '환불' 버튼 보이기 [20190225_01]
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
         * 계좌즉시출금 내역조회
         */
        this.fn_retrieveAccImmWthdrList = function() {
        	this.ds_accImmWthdrList.set_enableevent(false);
        	this.ds_accImmWthdrList.clearData();
        	this.ds_accImmWthdrList.set_enableevent(true);
        	
        	var sRactFDay = this.div_search.cal_ractFDay.value;	/* 수납일자 StartDay	*/
        	var sRactTDay = this.div_search.cal_ractTDay.value;	/* 수납일자 EndDay		*/
        	var sOrdNo	  = this.div_search.ed_ordNo.text;		/* 계약번호			*/
        	var sCustNo	  = this.div_search.ed_custNo.text;		/* 고객번호			*/
        	
        	var sSvcID        	= "retrieveAccImmWthdrList";
        	var sController   	= "ntrms/re/retrieveAccImmWthdrList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_accImmWthdrList=output";
        	var sArgs 			= "";
        		sArgs		   += Ex.util.setParam("ractFDay", nvl(sRactFDay));
        		sArgs		   += Ex.util.setParam("ractTDay", nvl(sRactTDay));
        		sArgs		   += Ex.util.setParam("ordNo",	   nvl(sOrdNo));
        		sArgs		   += Ex.util.setParam("custNo",   nvl(sCustNo));
        	var fn_callBack		= "fn_callBack";
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 수납내역 상세조회
         */
        this.fn_retrieveAccImmWthdrDtlList = function() {
        	this.ds_accImmWthdrDtlList.clearData();
        	
        	var sRecvSeq = this.ds_accImmWthdrList.getColumn(this.ds_accImmWthdrList.rowposition, "recvSeq"); /* 수납거래번호 */
        	
        	var sSvcID        	= "retrieveAccImmWthdrDtlList";
        	var sController   	= "ntrms/re/retrieveAccImmWthdrDtlList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_accImmWthdrDtlList=output";
        	var sArgs 			= "";
        		sArgs		   += Ex.util.setParam("recvSeq", nvl(sRecvSeq));
        	var fn_callBack		= "fn_callBack";
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /***********************************************************************************
         * CallBack Event(strSvcId - Sevice ID, nErrorCode - ErrorCode, strErrorMsg - Error Message)
         ***********************************************************************************/
        this.fn_callBack = function(strSvcId,nErrorCode,strErrorMsg) {
        	if(nErrorCode < 0) {
        		return Ex.core.comMsg("alert", strErrorMsg);
        	}
        	
        	switch(strSvcId) {
        		case "getDate":
        			var sFirstDay = Eco.date.getFirstDate(this.toDay);
        			
        			this.div_search.cal_ractFDay.set_value(sFirstDay);
        			this.div_search.cal_ractTDay.set_value(this.toDay);
        			break;
        		case "retrieveAccImmWthdrList":
        			var div = this.div_payment;
        			
        			if(this.ds_accImmWthdrList.getRowCount() > 0) {
        				div.tordNo = this.ds_accImmWthdrList.getColumn(0, "tordNo");
        				div.custNo = this.ds_accImmWthdrList.getColumn(0, "custNo");
        				div.PTrNo  = this.ds_accImmWthdrList.getColumn(0, "tno");
        			}
        			break;
        		case "retrieveAccImmWthdrDtlList":
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
        	this.fn_retrieveAccImmWthdrList();
        }

        /**
         * 엑셀 버튼의 클릭 이벤트 처리
         */
        this.fn_excel = function(obj,e) {
        	if(this.ds_accImmWthdrList.getRowCount() > 0) {
        		Ex.core.exportExcel(this, this.grd_accImmWthdrList, "계좌즉시출금내역");
        	} else {
        		this.alert("다운로드할 조회결과가 없습니다");
        	}
        }

        /**
         * 환불
         */
        this.btn_refund_onclick = function(obj,e) {
        	if(this.ds_accImmWthdrDtlList.findRow("chk", "1") == -1) {
        		this.alert("환불대상이 선택되지 않았습니다.");
        		
        		return false;
        	}
        	
        	this.div_payment.fn_accPaymentCancel();
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
         * grd_accImmWthdrDtlList Oncellclick Event
         */
        this.grd_accImmWthdrDtlList_oncellclick = function(obj,e) {
        	var ds		= this.ds_accImmWthdrDtlList;
        	var idxFrom	= "";
        	var ordNo	= ds.getColumn(e.row, "ordNo");
        	
        	/* 체크박스 선택 */
        	if(e.col == obj.getBindCellIndex("body", "chk")) {
        		if(obj.getCellValue(e.row, e.col) == "1") {
        			/* 선택되지 않은 이전회차를 모두 선택 처리 */
        			idxFrom = ds.findRowExpr("recpAmt > 0");
        			
        			if(idxFrom != -1) {
        				for(var i = idxFrom; i < e.row; i++) {
        					if(ds.getColumn(i, "ordNo") == ordNo) {
        						ds.setColumn(i, "chk", "1");
        					}
        				}
        			}
        		} else if (obj.getCellValue(e.row, e.col) == "0") {
        			/* 해제 이후 선택회차를 모두 해제 처리 */
        			idxFrom = ds.findRow("chk", "1", e.row + 1);
        			
        			if(idxFrom != -1) {
        				for(var i = idxFrom; i <= ds.getRowCount() + 1; i++) {
        					if(ds.getColumn(i, "ordNo") == ordNo) {
        						ds.setColumn(i, "chk", "");
        					}
        				}
        			}
        		}
        	}
        }

        /**
         * grd_accImmWthdrDtlList Onheadclick Event
         */
        this.grd_accImmWthdrDtlList_onheadclick = function(obj,e) {
        	var ds		 = this.ds_accImmWthdrDtlList;
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
        	totalAmt = totalAmt == "" || totalAmt.toString() == "NaN" ? "0" : totalAmt;
        	
        	div.div_accImmWthdr.st_paymentAmt.set_text(totalAmt + "원");
        }

        /**
         * ds_accImmWthdrList Onrowposchanged Event
         */
        this.ds_accImmWthdrList_onrowposchanged = function(obj,e) {
        	if(obj.getColumn(e.newrow, "cncStat") == "N" || obj.getColumn(e.newrow, "refundYn") == "Y") {
        		this.btn_refund.set_enable(false);
        	} else {
        		this.btn_refund.set_enable(true);
        	}
        	
        	var div	   = this.div_payment;
        	div.tordNo = obj.getColumn(e.newrow, "tordNo");
        	div.custNo = obj.getColumn(e.newrow, "custNo");
        	div.PTrNo  = obj.getColumn(e.newrow, "tno");
        	
        	this.fn_retrieveAccImmWthdrDtlList();
        }

        /**
         * ds_accImmWthdrDtlList Oncolumnchanged Event
         */
        this.ds_accImmWthdrDtlList_oncolumnchanged = function(obj,e) {
        	var div	= this.div_payment;
        	var ds	= this.ds_accImmWthdrDtlList;
        	
        	if(e.columnid == "chk") {
        		var totalAmt = 0;
        		
        		for(var i = 0; i < ds.rowcount; i++) {
        			if(obj.getColumn(i, "chk") == "1") {
        				totalAmt += ds.getColumn(i, "recpAmt");
        			}
        		}
        	}
        	
        	totalAmt = nvl(div.fn_numberWithComma(totalAmt));
        	totalAmt = totalAmt == "" || totalAmt.toString() == "NaN" ? "0" : totalAmt;
        	
        	div.div_accImmWthdr.st_paymentAmt.set_text(totalAmt + "원");
        }
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.ds_accImmWthdrList.addEventHandler("onrowposchanged", this.ds_accImmWthdrList_onrowposchanged, this);
            this.ds_accImmWthdrDtlList.addEventHandler("oncolumnchanged", this.ds_accImmWthdrDtlList_oncolumnchanged, this);
            this.addEventHandler("onload", this.form_onload, this);
            this.div_search.ed_custNo.addEventHandler("onkeyup", this.div_search_ed_custNo_onkeyup, this);
            this.div_search.btn_custPopUp.addEventHandler("onclick", this.fn_custPopUp, this);
            this.div_search.ed_ordNo.addEventHandler("onkeyup", this.div_search_ed_ordNo_onkeyup, this);
            this.div_search.btn_ordPopUp.addEventHandler("onclick", this.fn_ordPopUp, this);
            this.grd_accImmWthdrDtlList.addEventHandler("oncellclick", this.grd_accImmWthdrDtlList_oncellclick, this);
            this.grd_accImmWthdrDtlList.addEventHandler("onheadclick", this.grd_accImmWthdrDtlList_onheadclick, this);
            this.btn_refund.addEventHandler("onclick", this.btn_refund_onclick, this);

        };

        this.loadIncludeScript("RTREAccImmWthdrDtl.xfdl");
        this.loadPreloadList();
       
    };
}
)();
