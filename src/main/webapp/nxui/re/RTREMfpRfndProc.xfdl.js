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
                this.set_name("frm_RTREMfpRfndProc");
                this.set_classname("test_form");
                this.set_titletext("중도완납환불처리");
                this._setFormPosition(0,0,1147,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_endTpList", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_mfpRfndTrgtList", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"mfpSeq\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"cncDay\" type=\"STRING\" size=\"256\"/><Column id=\"mfpCd\" type=\"STRING\" size=\"256\"/><Column id=\"mfpCdNm\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"dblWthAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"recpPay\" type=\"STRING\" size=\"256\"/><Column id=\"recpPayNm\" type=\"STRING\" size=\"256\"/><Column id=\"recvDay\" type=\"STRING\" size=\"256\"/><Column id=\"mfpRecpPay\" type=\"STRING\" size=\"256\"/><Column id=\"mfpRecpPayNm\" type=\"STRING\" size=\"256\"/><Column id=\"recvSeq\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"tno\" type=\"STRING\" size=\"256\"/><Column id=\"orgnTrAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"pOidSeq\" type=\"BIGDECIMAL\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_nonOineCnclRecpList", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"recvSeq\" type=\"STRING\" size=\"256\"/><Column id=\"ritmSeq\" type=\"STRING\" size=\"256\"/><Column id=\"recvDay\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"schdSeq\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"recpTp\" type=\"STRING\" size=\"256\"/><Column id=\"saleAmt\" type=\"STRING\" size=\"256\"/><Column id=\"arreAmt\" type=\"STRING\" size=\"256\"/><Column id=\"zfbdt\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Grid("grd_mfpRfndTrgtList", "absolute", "0", "86", "1122", "410", null, null, this);
            obj.set_taborder("1");
            obj.set_binddataset("ds_mfpRfndTrgtList");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"120\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"24\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"중도완납일자\"/><Cell col=\"1\" text=\"계약종료유형\"/><Cell col=\"2\" text=\"계약번호\"/><Cell col=\"3\" text=\"고객번호\"/><Cell col=\"4\" text=\"고객명\"/><Cell col=\"5\" text=\"이중출금금액\"/><Cell col=\"6\" text=\"납부유형\"/><Cell col=\"7\" text=\"납부일자\"/><Cell col=\"8\" text=\"중도완납 납부유형\"/></Band><Band id=\"body\"><Cell displaytype=\"date\" style=\"align:center middle;\" text=\"bind:cncDay\" calendardisplaynulltype=\"none\"/><Cell col=\"1\" style=\"align:center middle;\" text=\"bind:mfpCdNm\"/><Cell col=\"2\" edittype=\"readonly\" style=\"align:center middle;\" text=\"bind:ordNo\"/><Cell col=\"3\" style=\"align:center middle;\" text=\"bind:custNo\"/><Cell col=\"4\" style=\"align:center middle;\" text=\"bind:custNm\"/><Cell col=\"5\" displaytype=\"number\" style=\"align:right middle;\" text=\"bind:dblWthAmt\" mask=\"###,###,###,##0\"/><Cell col=\"6\" style=\"align:center middle;\" text=\"bind:recpPayNm\"/><Cell col=\"7\" displaytype=\"date\" style=\"align:center middle;\" text=\"bind:recvDay\" calendardisplaynulltype=\"none\"/><Cell col=\"8\" style=\"align:center middle;\" text=\"bind:mfpRecpPayNm\"/></Band><Band id=\"summary\"><Cell text=\"총계\"/><Cell col=\"1\" style=\"align:right middle;\" text=\"expr:dataset.getRowCount() + &quot;(건)&quot;\"/><Cell col=\"2\"/><Cell col=\"3\"/><Cell col=\"4\"/><Cell col=\"5\" displaytype=\"number\" style=\"align:right middle;\" text=\"expr:dataset.getSum(&quot;dblWthAmt&quot;)\" mask=\"###,###,###,##0\"/><Cell col=\"6\"/><Cell col=\"7\"/><Cell col=\"8\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1122", "0", "25", "496", null, null, this);
            obj.set_taborder("13");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "0", "61", "81", "20", null, null, this);
            obj.set_taborder("15");
            obj.set_text("검색결과");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "0", "0", "1122", "45", null, null, this);
            obj.set_taborder("0");
            obj.set_text("Div00");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_recvMon", "absolute", "20", "10", "78", "21", null, null, this.div_search);
            obj.set_taborder("22");
            obj.set_text("대상년월");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cbo_endTp", "absolute", "330", "10", "140", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("1");
            obj.set_innerdataset("@ds_endTpList");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new Calendar("cal_recvMon", "absolute", "98", "10", "100", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("23");
            obj.set_value("null");
            obj.set_editformat("yyyy-MM");
            obj.set_dateformat("yyyy-MM");
            obj = new Static("st_endTp", "absolute", "228", "10", "102", "21", null, null, this.div_search);
            obj.set_taborder("24");
            obj.set_text("계약종료유형");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);

            obj = new Button("btn_refund", "absolute", "1077", "60", "45", "22", null, null, this);
            obj.set_taborder("16");
            obj.set_text("환불");
            obj.set_cssclass("btn_WF_module");
            this.addChild(obj.name, obj);

            obj = new Div("div_payment", "absolute", "2", "507", "536", "181", null, null, this);
            obj.set_taborder("17");
            obj.set_visible("false");
            obj.set_url("re::RTREPaymentComm_div.xfdl");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1122, 45, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("0");
            		p.set_text("Div00");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1147, 496, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("test_form");
            		p.set_titletext("중도완납환불처리");

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
        this.addIncludeScript("RTREMfpRfndProc.xfdl", "lib::comLib.xjs");
        this.registerScript("RTREMfpRfndProc.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분	: 수금관리 > 중도완납관리 > 중도완납환불처리
         * 02. 그룹명		: RTREMidFullPymntRfndProc.xfdl
         * 03. 그룹설명	: 
         * 04. 작성일		: 2018-12-20
         * 05. 작성자		: 노창호
         * 06. 수정이력	: 
         ***********************************************************************
         *		수정일			작성자		내용
         ***********************************************************************
         *		2018-12-20		노창호		최초작성
         ***********************************************************************/

        /***********************************************************************
         * Script Include
         ***********************************************************************/
        //include "lib::comLib.xjs";

        /***********************************************************************
         * FORM 변수 선언 영역
         ***********************************************************************/
        this.viewId	= "middleFullPayment";
        this.workCd = "MFP";
        /***********************************************************************
         * 그룹 변수 선언부
         ***********************************************************************/
        this.toDay	 = ""; /* 당일 */
        this.cncRseq = 0;

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
        	/* 공통버튼
        	 * 1. N : 신규추가
        	 * 2. S : 조회
        	 * 3. C : 데이타생성
        	 * 4. E : 엑셀데이타생성
        	 * 5. AG: 집계
        	 * 6. DN: 다운
        	 */	
        	this.parent.setButton("E|S", this);
        	
        	/* 월일 조회 */
        	this.fn_getDayMongth();
        	
        	/* 계약종료유형 선택항목 조회 */
        	this.fn_getEndTpCode();
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
         * 계약종료유형 선택항목 조회
         */
        this.fn_getEndTpCode = function() {
        	var sSvcID		 = "getEndTpCode";
        	var sController	 = "/rtms/re/getEndTpCode.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "ds_endTpList=output";
        	var sArgs		 = "";
        	var fn_callBack	 = "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 중도완납환불대상내역조회
         */
        this.fn_retrieveMfpRfndTrgtList = function() {
        	this.ds_mfpRfndTrgtList.clearData();
        	
        	var div		= this.div_search;
        	var recvMon	= div.cal_recvMon.value.toString().substring(0, 6);
        	var endTp	= div.cbo_endTp.value;
        	
        	var sSvcID		 = "retrieveMfpRfndTrgtList";
        	var sController	 = "ntrms/re/retrieveMfpRfndTrgtList.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "ds_mfpRfndTrgtList=output";
        	var sArgs		 = "";
        		sArgs		+= Ex.util.setParam("recvMon", recvMon);
        		sArgs		+= Ex.util.setParam("endTp",   endTp);
        	var fn_callBack	 = "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 비온라인계약 수납취소내역 조회
         */
        this.fn_getCancelExOContractList = function() {
        	this.ds_nonOineCnclRecpList.clearData();
        	
        	var ds	 = this.ds_mfpRfndTrgtList;
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
        	
        	switch(strSvcId) {
        		/* 월일 조회 */
        		case "getDayMongth":
        			var month =	this.toDay.substr(0, 6);
        			
        			this.div_search.cal_recvMon.set_value(month);
        			break;
        		
        		/* 계약종료유형 */
        		case "getEndTpCode":
        			this.div_search.cbo_endTp.set_index(0);
        			break;
        		
        		/* 중도완납환불대상내역조회 */
        		case "retrieveMfpRfndTrgtList":
        			break;
        		
        		/* 비온라인계약 수납취소내역 조회 */
        		case "getCancelExOContractList":
        			if(this.ds_nonOineCnclRecpList.getRowCount() == 0) {
        				this.alert("수납취소내역이 존재하지 않습니다.");
        				
        				return false;
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
        				this.alert("취소시퀀스를 가져오지 못했습니다.");
        				
        				return false;
        			} else {
        				var ds = this.ds_nonOineCnclRecpList;
        				ds.addColumn("cncRseq", "string");
        				ds.setColumn(0, "cncRseq", this.cncRseq);
        				
        				ds.set_updatecontrol(false);
        				ds.setRowType(0, Dataset.ROWTYPE_INSERT);
        				ds.set_updatecontrol(true);
        			}
        			
        			var ds	 = this.ds_mfpRfndTrgtList;
        			var nRow = ds.rowposition;
        			var div	 = this.div_payment;
        			
        			if(ds.getColumn(nRow, "mfpRecpPay") == "P6") {
        				/* 계좌즉시출금결제 */
        				div.tordNo = nvl(ds.getColumn(nRow, "ordNo"));
        				div.custNo = nvl(ds.getColumn(nRow, "custNo"));
        				div.PTrNo  = nvl(ds.getColumn(nRow, "tno"));
        				
        				div.fn_accPaymentCancel();
        			}
        			break;
        		default:
        			break;
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
        	var len, point, str;
        	
        	num = num + "";
        	point = num.length % 3;
        	len = num.length;
        	
        	str = num.substring(0, point);
        	while (point < len) {
        		if (str != "") str += ",";
        		str += num.substring(point, point + 3);
        		point += 3;
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
        	this.fn_retrieveMfpRfndTrgtList();
        }

        /**
         * 엑셀 다운로드
         */
        this.fn_excel = function(obj,e) {
        	if(this.ds_mfpRfndTrgtList.getRowCount() > 0) {
        		Ex.core.exportExcel(this, this.grd_mfpRfndTrgtList, "중도완납환불대상내역");
        	} else {
        		this.alert("다운로드할 조회결과가 없습니다");
        	}
        }

        /**
         * 환불
         */
        this.btn_refund_onclick = function(obj,e) {
        	var div		   = this.div_payment;
        	var dsCrdParam = div.ds_crdPymntParam;
        	var ds		   = this.ds_mfpRfndTrgtList;
        	var nRow	   = ds.rowposition;
        	
        	if(ds.getColumn(nRow, "mfpRecpPay") == "P7") {
        		/* 카드즉시출금결제 */
        		var custNo	 = nvl(ds.getColumn(nRow, "custNo"));
        		var ordNo	 = nvl(ds.getColumn(nRow, "ordNo"));
        		var modType	 = "";
        		var recvSeq	 = nvl(ds.getColumn(nRow, "recvSeq"));
        		var modMny	 = nvl(ds.getColumn(nRow, "dblWthAmt"));
        		var remMny	 = nvl(ds.getColumn(nRow, "orgnTrAmt"));
        		var refundYn = "";
        		var tno		= nvl(ds.getColumn(nRow, "tno"));
        		var modDesc	 = "중도완납취소";
        		
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
        		dsCrdParam.setColumn(0, "tno",		tno);			/* KCP거래번호		*/
        		dsCrdParam.setColumn(0, "modDesc",	modDesc);		/* 요청사유		*/
        		dsCrdParam.setColumn(0, "workCd",	this.workCd);	/* 요청사유		*/

        		/* 카드즉시출금 결제/환불 */
        		div.fn_processPayment();
        	} else {
        		/* 비온라인계약 수납취소내역 조회 */
        		this.fn_getCancelExOContractList();
        	}
        }

        /**
         * ds_mfpRfndTrgtList Onrowposchanged Event
         */
        this.ds_mfpRfndTrgtList_onrowposchanged = function(obj,e) {
        	this.div_payment.div_accImmWthdr.st_paymentAmt.set_text(obj.getColumn(e.newrow, "dblWthAmt"));
        }
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.ds_mfpRfndTrgtList.addEventHandler("onrowposchanged", this.ds_mfpRfndTrgtList_onrowposchanged, this);
            this.addEventHandler("onload", this.form_onload, this);
            this.div_search.cal_recvMon.addEventHandler("onchanged", this.div_prptAmtCalc_cal_cancDay_onchanged, this);
            this.btn_refund.addEventHandler("onclick", this.btn_refund_onclick, this);

        };

        this.loadIncludeScript("RTREMfpRfndProc.xfdl");
        this.loadPreloadList();
       
    };
}
)();
