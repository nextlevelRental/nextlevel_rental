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
                this.set_name("RTREPrcmAmtNOnePymntRecp_pop");
                this.set_classname("test_form");
                this.set_titletext("장착비 및 일시불상품 수납");
                this._setFormPosition(0,0,586,359);
            }
            this.style.set_color("#333333ff");

            
            // Object(Dataset, ExcelExportObject) Initialize

            
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

            obj = new Static("st_collectionMoney", "absolute", "25", "16", "150", "20", null, null, this);
            obj.set_taborder("15");
            obj.set_text("장착비 및 일시불 수납");
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

            obj = new Button("btn_payment", "absolute", null, "41", "45", "22", "25", null, this);
            obj.set_taborder("23");
            obj.set_text("수납");
            obj.set_cssclass("btn_WF_CRUD");
            this.addChild(obj.name, obj);

            obj = new Radio("rdo_recpFg", "absolute", "25", "41", "200", "22", null, null, this);
            this.addChild(obj.name, obj);
            var rdo_recpFg_innerdataset = new Dataset("rdo_recpFg_innerdataset", this.rdo_recpFg);
            rdo_recpFg_innerdataset._setContents("<ColumnInfo><Column id=\"codecolumn\" size=\"256\"/><Column id=\"datacolumn\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"codecolumn\">100000000000</Col><Col id=\"datacolumn\">카드즉시출금</Col></Row><Row><Col id=\"codecolumn\">010000000000</Col><Col id=\"datacolumn\">계좌즉시출금</Col></Row></Rows>");
            obj.set_innerdataset(rdo_recpFg_innerdataset);
            obj.set_taborder("44");
            obj.set_codecolumn("codecolumn");
            obj.set_datacolumn("datacolumn");
            obj.set_direction("vertical");
            obj.set_value("100000000000");
            obj.set_index("0");

            obj = new Div("div_headInfo", "absolute", "25", "68", null, "91", "25", null, this);
            obj.set_taborder("46");
            this.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "0", "60", null, "31", "0", null, this.div_headInfo);
            obj.set_taborder("27");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_headInfo.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "0", "30", null, "31", "0", null, this.div_headInfo);
            obj.set_taborder("28");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_headInfo.addChild(obj.name, obj);
            obj = new Static("Static05", "absolute", "0", "0", null, "31", "0", null, this.div_headInfo);
            obj.set_taborder("29");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_headInfo.addChild(obj.name, obj);
            obj = new Static("st_onePymntTh", "absolute", "0", "60", "140", "31", null, null, this.div_headInfo);
            obj.set_taborder("30");
            obj.set_text("일시불");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_headInfo.addChild(obj.name, obj);
            obj = new Static("st_regiAmtTh", "absolute", "0", "30", "140", "31", null, null, this.div_headInfo);
            obj.set_taborder("31");
            obj.set_text("등록비");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_headInfo.addChild(obj.name, obj);
            obj = new Static("st_ordNoTh", "absolute", "0", "0", "140", "31", null, null, this.div_headInfo);
            obj.set_taborder("32");
            obj.set_text("계약번호");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_headInfo.addChild(obj.name, obj);
            obj = new Static("st_onePymnt", "absolute", "144", "60", "100", "31", null, null, this.div_headInfo);
            obj.set_taborder("33");
            obj.set_text("0원");
            this.div_headInfo.addChild(obj.name, obj);
            obj = new Static("st_regiAmt", "absolute", "144", "30", "100", "31", null, null, this.div_headInfo);
            obj.set_taborder("34");
            obj.set_text("0원");
            this.div_headInfo.addChild(obj.name, obj);
            obj = new Static("st_ordNo", "absolute", "144", "0", "100", "31", null, null, this.div_headInfo);
            obj.set_taborder("35");
            this.div_headInfo.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "25", "339", null, "20", "25", null, this);
            obj.set_taborder("55");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "0", "0", "25", null, null, "0", this);
            obj.set_taborder("56");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Div("div_payment", "absolute", "25", "158", null, "181", "25", null, this);
            obj.set_taborder("57");
            obj.set_url("re::RTREPaymentComm_div.xfdl");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 0, 91, this.div_headInfo,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("46");

            	}
            );
            this.div_headInfo.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 586, 359, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("test_form");
            		p.set_titletext("장착비 및 일시불상품 수납");
            		p.style.set_color("#333333ff");

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
        this.addIncludeScript("RTREPrcmAmtNOnePymntRecp_pop.xfdl", "lib::comLib.xjs");
        this.registerScript("RTREPrcmAmtNOnePymntRecp_pop.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분	: 수금관리 > 수납공통화면 > 장착비 및 일시불상품 수납
         * 02. 그룹명		: RTREPrcmAmtNOnePymntRecp_pop.xfdl
         * 03. 그룹설명	: 
         * 04. 작성일		: 2018-12-05
         * 05. 작성자		: 노창호
         * 06. 수정이력	: 
         ***********************************************************************
         *		수정일			작성자		내용
         ***********************************************************************
         *		2018-12-05		노창호		최초작성
         ***********************************************************************/

        /***********************************************************************
         * Script Include 
         ***********************************************************************/
        //include "lib::comLib.xjs";

        /***********************************************************************
         * FORM 변수 선언 영역
         ***********************************************************************/
        this.popupYn = "Y";	/* Popup 여부	*/
        this.toDay	 = "";	/* 당일			*/
        this.viewId	 = "";	/* 업무구분	*/
        this.etcPop	 = "Y";

        /***********************************************************************
         * 그룹 변수 선언부
         ***********************************************************************/
        this.tordNo	   = this.parent.ordNo;		/* 통합청구계약번호							*/
        this.custNo	   = this.parent.custNo;	/* 고객번호									*/
        this.regiAmt   = "";					/* 등록비										*/
        this.onePymnt  = "";					/* 일시불										*/
        this.recpAmt   = "";					/* 수납금액									*/
        this.recpTp	   = this.parent.recpTp;	/* 청구구분									*/
        this.recpPay   = "";					/* 수납방법 - P6 : 계좌출금 P7 : 카드출금	*/
        this.tno	   = "";					/* 거래번호									*/
        this.appNo	   = "";					/* 승인번호									*/
        this.matNm	   = this.parent.matNm;		/* 상품명										*/
        this.custNm	   = this.parent.custNm;	/* 주문자명									*/
        this.bizNo	   = this.parent.bizNo;		/* 생년월일 / 사업자번호						*/
        this.custEmail = "";					/* 주문자 E-Mail								*/
        this.telNo	   = "";					/* 주문자 전화번호							*/
        this.mobNo	   = this.parent.mobNo;		/* 주문자 휴대폰번호							*/

        if(nvl(this.parent.regiAmt) == "") {
        	this.regiAmt = 0;
        } else {
        	this.regiAmt = parseInt(this.parent.regiAmt);
        }

        if(nvl(this.parent.onePymnt) == "") {
        	this.onePymnt = 0;
        } else {
        	this.onePymnt = parseInt(this.parent.onePymnt);
        }

        this.recpAmt = this.regiAmt + this.onePymnt;

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
        	var divHead	 = this.div_headInfo;
        	var divPymnt = this.div_payment;
        	var recpAmt	 = divPymnt.fn_numberWithComma(this.recpAmt) + "원";
        	
        	divHead.st_ordNo.set_text(this.tordNo);
        	divHead.st_regiAmt.set_text( divPymnt.fn_numberWithComma(this.regiAmt)  + "원");
        	divHead.st_onePymnt.set_text(divPymnt.fn_numberWithComma(this.onePymnt) + "원");
        	
        	/* 생년월일 / 사업자번호에 따른 인증번호 Set */
        	if(this.bizNo.toString().length == 8) {
        		divPymnt.div_cardImmWthdr.ed_cardauth.set_value(this.bizNo.substring(2, 8));
        	} else {
        		divPymnt.div_cardImmWthdr.ed_cardauth.set_value(this.bizNo);
        	}
        	
        	divPymnt.div_cardImmWthdr.st_paymentAmt.set_text(recpAmt);
        	
        	divPymnt.div_accImmWthdr.st_paymentAmt.set_text(recpAmt);
        	divPymnt.div_accImmWthdr.ed_ownerNm.set_value(this.custNm);
        	
        	/* 월일 조회 */
        	this.fn_getDayMongth();
        }

        /***********************************************************************************
         * Form Close Event
         ***********************************************************************************/
        this.form_onclose = function(obj,e) {
        	this.close();
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
         * 수납
         */
        this.btn_payment_onclick = function(obj,e) {
        	var rdo		   = this.rdo_recpFg;
        	var div		   = this.div_payment;
        	var dsCrdParam = div.ds_crdPymntParam;
        	
        	div.tordNo = this.tordNo;
        	div.custNo = this.custNo;
        	div.recpTp = this.recpTp;
        	
        	if(rdo.index == 0) {
        		/* 카드즉시출금결제 */
        		if(parseInt(this.recpAmt.toString()) == 0) {
        			this.alert("결제금액이 0원입니다.");
        			
        			return false;
        		}
        		
        		var divCrd = div.div_cardImmWthdr;
        		
        		if(this.recpTp == "42") {
        			this.viewId = "PNLT";
        		}else if(this.recpTp == "90") {
        			this.viewId = "TMPRR";
        		}
        		
        		dsCrdParam.clearData();
        		dsCrdParam.addRow();
        		
        		dsCrdParam.setColumn(0, "reqTx",		 "pay");							/* 결제/취소구분	*/
        		dsCrdParam.setColumn(0, "custNo",		 nvl(this.custNo));					/* 고객번호		*/
        		dsCrdParam.setColumn(0, "ordNo",		 nvl(this.tordNo));					/* 주문번호		*/
        		dsCrdParam.setColumn(0, "payMethodCd",	 rdo.value);						/* 지불방법코드	*/
        		dsCrdParam.setColumn(0, "payMethodName", rdo.text);							/* 지불방법명		*/
        		dsCrdParam.setColumn(0, "recpAmt",		 nvl(this.recpAmt.toString()));		/* 결제금액		*/
        		dsCrdParam.setColumn(0, "crdNo",		 nvl(divCrd.me_cardNo.value));		/* 카드번호		*/
        		dsCrdParam.setColumn(0, "quotaopt",		 nvl(divCrd.cbo_quotaopt.value));	/* 할부개월		*/
        		dsCrdParam.setColumn(0, "expiryYy",		 nvl(divCrd.cbo_expiryYy.value));	/* 유효기간(년)	*/
        		dsCrdParam.setColumn(0, "expiryMm",		 nvl(divCrd.cbo_expiryMm.value));	/* 유효기간(월)	*/
        		dsCrdParam.setColumn(0, "cardauth",		 nvl(divCrd.ed_cardauth.value));	/* 인증정보		*/
        		dsCrdParam.setColumn(0, "cardpwd",		 nvl(divCrd.me_cardpwd.value));		/* 비밀번호		*/
        		dsCrdParam.setColumn(0, "workCd",		 this.viewId);						/* 업무구분		*/
        		
        		/* 카드즉시출금 결제/환불 */
        		div.fn_processPayment();
        	} else if(rdo.index == 1) {
        		/* 계좌즉시출금결제 */
        		if(div.agreeYn == "Y") {
        			div.fn_paymentCertified();
        		} else {
        			this.alert("출금이체동의 완료 후 수납가능합니다.");
        			
        			return false;
        		}
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
        	} else if(obj.index == 1) {
        		div.div_cardImmWthdr.set_visible(false);
        		div.div_accImmWthdr.set_visible(true);
        	}
        }
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.addEventHandler("onclose", this.form_onclose, this);
            this.btn_payment.addEventHandler("onclick", this.btn_payment_onclick, this);
            this.rdo_recpFg.addEventHandler("onitemchanged", this.rdo_recpFg_onitemchanged, this);

        };

        this.loadIncludeScript("RTREPrcmAmtNOnePymntRecp_pop.xfdl");
        this.loadPreloadList();
       
    };
}
)();
