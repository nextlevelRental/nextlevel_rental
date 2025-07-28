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
                this.set_name("RTREPaymentCommCrdResult_pop");
                this.set_classname("test_form");
                this.set_titletext("카드즉시출금 결과");
                this._setFormPosition(0,0,578,626);
            }
            this.style.set_color("#333333ff");

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_result", this);
            obj._setContents("");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static01", "absolute", null, "0", "10", null, "0", "0", this);
            obj.set_taborder("13");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "10", "0", null, "20", "10", null, this);
            obj.set_taborder("14");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("st_unRlsSelerList", "absolute", "10", "16", "81", "20", null, null, this);
            obj.set_taborder("15");
            obj.set_text("처리결과");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "10", "31", null, "10", "10", null, this);
            obj.set_taborder("16");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "0", "10", null, null, "0", this);
            obj.set_taborder("59");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Button("btn_close", "absolute", null, null, "41", "21", "10", "15", this);
            obj.set_taborder("61");
            obj.set_text("닫기");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);

            obj = new Div("div_paymentResult", "absolute", "10", "40", null, "541", "10", null, this);
            obj.set_taborder("137");
            this.addChild(obj.name, obj);
            obj = new Static("st_resCdTh", "absolute", "0", "0", "140", "31", null, null, this.div_paymentResult);
            obj.set_taborder("0");
            obj.set_text("결과 코드");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.div_paymentResult.addChild(obj.name, obj);
            obj = new Static("st_resCd", "absolute", "139", "0", null, "31", "0", null, this.div_paymentResult);
            obj.set_taborder("1");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_paymentResult.addChild(obj.name, obj);
            obj = new Static("st_resMsg", "absolute", "139", "30", null, "31", "0", null, this.div_paymentResult);
            obj.set_taborder("2");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_paymentResult.addChild(obj.name, obj);
            obj = new Static("st_resMsgTh", "absolute", "0", "30", "140", "31", null, null, this.div_paymentResult);
            obj.set_taborder("3");
            obj.set_text("결과 메세지");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.div_paymentResult.addChild(obj.name, obj);
            obj = new Static("st_tordNoTh", "absolute", "0", "60", "140", "31", null, null, this.div_paymentResult);
            obj.set_taborder("4");
            obj.set_text("주문번호");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.div_paymentResult.addChild(obj.name, obj);
            obj = new Static("st_tordNo", "absolute", "139", "60", null, "31", "0", null, this.div_paymentResult);
            obj.set_taborder("5");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_paymentResult.addChild(obj.name, obj);
            obj = new Static("st_tno", "absolute", "139", "90", null, "31", "0", null, this.div_paymentResult);
            obj.set_taborder("6");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_paymentResult.addChild(obj.name, obj);
            obj = new Static("st_recpAmtTh", "absolute", "0", "120", "140", "31", null, null, this.div_paymentResult);
            obj.set_taborder("7");
            obj.set_text("결제 금액");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.div_paymentResult.addChild(obj.name, obj);
            obj = new Static("st_tnoTh", "absolute", "0", "90", "140", "31", null, null, this.div_paymentResult);
            obj.set_taborder("8");
            obj.set_text("KCP 거래번호");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.div_paymentResult.addChild(obj.name, obj);
            obj = new Static("st_recpAmt", "absolute", "139", "120", null, "31", "0", null, this.div_paymentResult);
            obj.set_taborder("9");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_paymentResult.addChild(obj.name, obj);
            obj = new Static("st_matNm", "absolute", "139", "150", null, "31", "0", null, this.div_paymentResult);
            obj.set_taborder("10");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_paymentResult.addChild(obj.name, obj);
            obj = new Static("st_matNmTh", "absolute", "0", "150", "140", "31", null, null, this.div_paymentResult);
            obj.set_taborder("11");
            obj.set_text("상 품 명");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.div_paymentResult.addChild(obj.name, obj);
            obj = new Static("st_custNmTh", "absolute", "0", "180", "140", "31", null, null, this.div_paymentResult);
            obj.set_taborder("12");
            obj.set_text("주문자명");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.div_paymentResult.addChild(obj.name, obj);
            obj = new Static("st_custNm", "absolute", "139", "180", null, "31", "0", null, this.div_paymentResult);
            obj.set_taborder("13");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_paymentResult.addChild(obj.name, obj);
            obj = new Static("st_telNo", "absolute", "139", "210", null, "31", "0", null, this.div_paymentResult);
            obj.set_taborder("14");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_paymentResult.addChild(obj.name, obj);
            obj = new Static("st_telNoTh", "absolute", "0", "210", "140", "31", null, null, this.div_paymentResult);
            obj.set_taborder("15");
            obj.set_text("주문자 전화번호");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.div_paymentResult.addChild(obj.name, obj);
            obj = new Static("st_mobNoTh", "absolute", "0", "240", "140", "31", null, null, this.div_paymentResult);
            obj.set_taborder("16");
            obj.set_text("주문자 휴대폰번호");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.div_paymentResult.addChild(obj.name, obj);
            obj = new Static("st_mobNo", "absolute", "139", "240", null, "31", "0", null, this.div_paymentResult);
            obj.set_taborder("17");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_paymentResult.addChild(obj.name, obj);
            obj = new Static("st_email", "absolute", "139", "270", null, "31", "0", null, this.div_paymentResult);
            obj.set_taborder("18");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_paymentResult.addChild(obj.name, obj);
            obj = new Static("st_emailTh", "absolute", "0", "270", "140", "31", null, null, this.div_paymentResult);
            obj.set_taborder("19");
            obj.set_text("주문자 E-mail");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.div_paymentResult.addChild(obj.name, obj);
            obj = new Static("st_usePayMethodTh", "absolute", "0", "300", "140", "31", null, null, this.div_paymentResult);
            obj.set_taborder("20");
            obj.set_text("결제 수단");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.div_paymentResult.addChild(obj.name, obj);
            obj = new Static("st_usePayMethod", "absolute", "139", "300", null, "31", "0", null, this.div_paymentResult);
            obj.set_taborder("21");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_paymentResult.addChild(obj.name, obj);
            obj = new Static("st_crdCdNm", "absolute", "139", "330", null, "31", "0", null, this.div_paymentResult);
            obj.set_taborder("22");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_paymentResult.addChild(obj.name, obj);
            obj = new Static("st_crdCdNmTh", "absolute", "0", "330", "140", "31", null, null, this.div_paymentResult);
            obj.set_taborder("23");
            obj.set_text("결제 카드");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.div_paymentResult.addChild(obj.name, obj);
            obj = new Static("st_appTimeTh", "absolute", "0", "360", "140", "31", null, null, this.div_paymentResult);
            obj.set_taborder("24");
            obj.set_text("승인 시간");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.div_paymentResult.addChild(obj.name, obj);
            obj = new Static("st_appTime", "absolute", "139", "360", null, "31", "0", null, this.div_paymentResult);
            obj.set_taborder("25");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_paymentResult.addChild(obj.name, obj);
            obj = new Static("st_appNo", "absolute", "139", "390", null, "31", "0", null, this.div_paymentResult);
            obj.set_taborder("26");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_paymentResult.addChild(obj.name, obj);
            obj = new Static("st_appNoTh", "absolute", "0", "390", "140", "31", null, null, this.div_paymentResult);
            obj.set_taborder("27");
            obj.set_text("승인 번호");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.div_paymentResult.addChild(obj.name, obj);
            obj = new Static("st_quotaTh", "absolute", "0", "420", "140", "31", null, null, this.div_paymentResult);
            obj.set_taborder("28");
            obj.set_text("할부 개월");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.div_paymentResult.addChild(obj.name, obj);
            obj = new Static("st_quota", "absolute", "139", "420", null, "31", "0", null, this.div_paymentResult);
            obj.set_taborder("29");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_paymentResult.addChild(obj.name, obj);
            obj = new Static("st_noinf", "absolute", "139", "450", null, "31", "0", null, this.div_paymentResult);
            obj.set_taborder("30");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_paymentResult.addChild(obj.name, obj);
            obj = new Static("st_noinfTh", "absolute", "0", "450", "140", "31", null, null, this.div_paymentResult);
            obj.set_taborder("31");
            obj.set_text("무이자 여부");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.div_paymentResult.addChild(obj.name, obj);
            obj = new Static("st_noinfTypeTh", "absolute", "0", "480", "140", "31", null, null, this.div_paymentResult);
            obj.set_taborder("32");
            obj.set_text("무이자 이벤트 구분");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.div_paymentResult.addChild(obj.name, obj);
            obj = new Static("st_noinfType", "absolute", "139", "480", null, "31", "0", null, this.div_paymentResult);
            obj.set_taborder("33");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_paymentResult.addChild(obj.name, obj);
            obj = new Static("st_receiptTh", "absolute", "0", "510", "140", "31", null, null, this.div_paymentResult);
            obj.set_taborder("35");
            obj.set_text("영수증 확인");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.div_paymentResult.addChild(obj.name, obj);
            obj = new Static("st_noinfType00", "absolute", "139", "510", null, "31", "0", null, this.div_paymentResult);
            obj.set_taborder("37");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_paymentResult.addChild(obj.name, obj);
            obj = new Button("btn_receipt", "absolute", "143", "515", "57", "22", null, null, this.div_paymentResult);
            obj.set_taborder("36");
            obj.set_text("영수증");
            obj.set_cssclass("btn_WF_CRUD");
            this.div_paymentResult.addChild(obj.name, obj);

            obj = new Div("div_partCancelResult", "absolute", "10", "40", null, "151", "10", null, this);
            obj.set_taborder("135");
            this.addChild(obj.name, obj);
            obj = new Static("st_resCdTh", "absolute", "0", "0", "140", "31", null, null, this.div_partCancelResult);
            obj.set_taborder("1");
            obj.set_text("결과 코드");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.div_partCancelResult.addChild(obj.name, obj);
            obj = new Static("st_resMsgTh", "absolute", "0", "30", "140", "31", null, null, this.div_partCancelResult);
            obj.set_taborder("3");
            obj.set_text("결과 메세지");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.div_partCancelResult.addChild(obj.name, obj);
            obj = new Static("st_modMnyTh", "absolute", "0", "90", "140", "31", null, null, this.div_partCancelResult);
            obj.set_taborder("5");
            obj.set_text("취소요청금액");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.div_partCancelResult.addChild(obj.name, obj);
            obj = new Static("st_remMnyTh", "absolute", "0", "120", "140", "31", null, null, this.div_partCancelResult);
            obj.set_taborder("7");
            obj.set_text("취소가능잔액");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.div_partCancelResult.addChild(obj.name, obj);
            obj = new Static("st_resCd", "absolute", "139", "0", null, "31", "0", null, this.div_partCancelResult);
            obj.set_taborder("37");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_partCancelResult.addChild(obj.name, obj);
            obj = new Static("st_resMsg", "absolute", "139", "30", null, "31", "0", null, this.div_partCancelResult);
            obj.set_taborder("38");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_partCancelResult.addChild(obj.name, obj);
            obj = new Static("st_modMny", "absolute", "139", "90", null, "31", "0", null, this.div_partCancelResult);
            obj.set_taborder("39");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_partCancelResult.addChild(obj.name, obj);
            obj = new Static("st_remMny", "absolute", "139", "120", null, "31", "0", null, this.div_partCancelResult);
            obj.set_taborder("40");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_partCancelResult.addChild(obj.name, obj);
            obj = new Static("st_amount", "absolute", "139", "60", null, "31", "0", null, this.div_partCancelResult);
            obj.set_taborder("41");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_partCancelResult.addChild(obj.name, obj);
            obj = new Static("st_amountTh", "absolute", "0", "60", "140", "31", null, null, this.div_partCancelResult);
            obj.set_taborder("42");
            obj.set_text("총금액");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.div_partCancelResult.addChild(obj.name, obj);

            obj = new Div("div_cnclNErrResult", "absolute", "10", "40", null, "61", "10", null, this);
            obj.set_taborder("136");
            this.addChild(obj.name, obj);
            obj = new Static("st_resCdTh", "absolute", "0", "0", "140", "31", null, null, this.div_cnclNErrResult);
            obj.set_taborder("41");
            obj.set_text("결과 코드");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.div_cnclNErrResult.addChild(obj.name, obj);
            obj = new Static("st_resMsgTh", "absolute", "0", "30", "140", "31", null, null, this.div_cnclNErrResult);
            obj.set_taborder("42");
            obj.set_text("결과 메세지");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.div_cnclNErrResult.addChild(obj.name, obj);
            obj = new Static("st_resCd", "absolute", "139", "0", null, "31", "0", null, this.div_cnclNErrResult);
            obj.set_taborder("45");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_cnclNErrResult.addChild(obj.name, obj);
            obj = new Static("st_resMsg", "absolute", "139", "30", null, "31", "0", null, this.div_cnclNErrResult);
            obj.set_taborder("46");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_cnclNErrResult.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 0, 541, this.div_paymentResult,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("137");

            	}
            );
            this.div_paymentResult.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 0, 151, this.div_partCancelResult,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("135");

            	}
            );
            this.div_partCancelResult.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 0, 61, this.div_cnclNErrResult,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("136");

            	}
            );
            this.div_cnclNErrResult.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 578, 626, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("test_form");
            		p.set_titletext("카드즉시출금 결과");
            		p.style.set_color("#333333ff");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTREPaymentCommCrdResult_pop.xfdl", "lib::comLib.xjs");
        this.registerScript("RTREPaymentCommCrdResult_pop.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분	: result.jsp 임시대체팝업
         * 02. 그룹명		: RTREPaymentCommCrdResult_pop.xfdl
         * 03. 그룹설명	: 
         * 04. 작성일		: 2019-02-26
         * 05. 작성자		: 노창호
         * 06. 수정이력	: 
         ***********************************************************************
         *		수정일			작성자		내용
         ***********************************************************************
         *		2019-02-26		노창호		최초작성
         ***********************************************************************/

        /***********************************************************************
         * Script Include
         ***********************************************************************/
        //include "lib::comLib.xjs";

        /***********************************************************************
         * FORM 변수 선언 영역
         ***********************************************************************/

        /***********************************************************************
         * 그룹 변수 선언부
         ***********************************************************************/
        this.reqTx		= this.parent.reqTx;

        this.resCd		= this.parent.resCd;
        this.resMsg		= this.parent.resMsg;
        this.tordNo		= this.parent.tordNo;
        this.tno		= this.parent.tno;
        this.recpAmt	= this.parent.recpAmt;
        this.recpAmtTxt	= this.parent.recpAmtTxt;
        this.matNm		= this.parent.matNm;
        this.custNm		= this.parent.custNm;
        this.telNo		= this.parent.telNo;
        this.mobNo		= this.parent.mobNo;
        this.email		= this.parent.email;

        this.crdCd		= this.parent.crdCd;
        this.crdNm		= this.parent.crdNm;
        this.appTime	= this.parent.appTime;
        this.appNo		= this.parent.appNo;
        this.quota		= this.parent.quota;
        this.noinf		= this.parent.noinf;
        this.noinfType	= this.parent.noinfType;

        this.modType	= this.parent.modType;
        this.amount		= this.parent.amount;
        this.modMny		= this.parent.modMny;
        this.remMny		= this.parent.remMny;

        
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
        	var divPay	 = this.div_paymentResult;
        	var divPCncl = this.div_partCancelResult;
        	var divECncl = this.div_cnclNErrResult;
        	
        	if(this.resCd == "0000" && this.modType != "STSC") {
        		if(this.reqTx == "pay") {
        			divPCncl.set_visible(false);
        			divECncl.set_visible(false);
        			
        			var crdCdNm	 = this.crdCd + " / " + this.crdNm;
        			
        			divPay.st_resCd.set_text(this.resCd);			/* 결과 코드				*/
        			divPay.st_resMsg.set_text(this.resMsg);			/* 결과 메세지				*/
        			divPay.st_tordNo.set_text(this.tordNo);			/* 주문 번호				*/
        			divPay.st_tno.set_text(this.tno);				/* KCP 거래번호			*/
        			divPay.st_recpAmt.set_text(this.recpAmtTxt);	/* 결제금액				*/
        			divPay.st_matNm.set_text(this.matNm);			/* 상품명					*/
        			divPay.st_custNm.set_text(this.custNm);			/* 주문자명				*/
        			divPay.st_telNo.set_text(this.telNo);			/* 주문자 전화번호		*/
        			divPay.st_mobNo.set_text(this.mobNo);			/* 주문자 휴대폰번호		*/
        			divPay.st_email.set_text(this.email);			/* 주문자 E-mail			*/
        			divPay.st_usePayMethod.set_text("신용카드");	/* 결제수단				*/
        			divPay.st_crdCdNm.set_text(crdCdNm);			/* 결제카드사 코드 / 명	*/
        			divPay.st_appTime.set_text(this.appTime);		/* 승인시간				*/
        			divPay.st_appNo.set_text(this.appNo);			/* 승인번호				*/
        			divPay.st_quota.set_text(this.quota);			/* 할부개월				*/
        			divPay.st_noinf.set_text(this.noinf);			/* 무이자 여부				*/
        			divPay.st_noinfType.set_text(this.noinfType);	/* 무이자 이벤트 구분		*/
        		} else if(this.reqTx == "mod") {
        			divPay.set_visible(false);
        			divECncl.set_visible(false);
        			
        			this.set_height(236);
        			this.parent.set_height(264);
        			
        			divPCncl.st_resCd.set_text(this.resCd);			/* 결과 코드				*/
        			divPCncl.st_resMsg.set_text(this.resMsg);		/* 결과 메세지				*/
        			divPCncl.st_amount.set_text(this.amount);		/* 총금액					*/
        			divPCncl.st_modMny.set_text(this.modMny);		/* 취소요청금액			*/
        			divPCncl.st_remMny.set_text(this.remMny);		/* 취소가능잔액			*/
        		}
        	} else {
        		divPay.set_visible(false);
        		divPCncl.set_visible(false);
        		
        		this.set_height(146);
        		this.parent.set_height(174);
        		
        		divECncl.st_resCd.set_text(this.resCd);				/* 결과 코드				*/
        		divECncl.st_resMsg.set_text(this.resMsg);			/* 결과 메세지				*/
        	}
        }

        /***********************************************************************************
         * Transaction Function
         ***********************************************************************************/

        /***********************************************************************************
         * CallBack Event(strSvcId - Sevice ID, nErrorCode - ErrorCode, strErrorMsg - Error Message)
         ***********************************************************************************/

        /***********************************************************************************
         * User Function
         ***********************************************************************************/

        /***********************************************************************************
         * Component Event & Function
         ***********************************************************************************/
        /**
         * 닫기
         */
        this.btn_close_onclick = function(obj,e) {
        	this.close();
        }

        /**
         * 영수증 확인
         */
        this.btn_receipt_onclick = function(obj,e) {
        	//var sUrl		 = "https://admin8.kcp.co.kr";
        	var sUrl		 = "https://testadmin8.kcp.co.kr";
        	var sReceiptWin	 = "";
        		sReceiptWin += sUrl + "/assist/bill.BillActionNew.do?cmd=card_bill";
        		sReceiptWin += "&tno=" + this.tno;
        		sReceiptWin += "&order_no=" + this.tordNo;
        		sReceiptWin += "&trade_mony=" + this.recpAmt;
        	
        	window.open(sReceiptWin, "", "width=455, height=815");
        }
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.btn_close.addEventHandler("onclick", this.btn_close_onclick, this);
            this.div_paymentResult.btn_receipt.addEventHandler("onclick", this.btn_receipt_onclick, this);

        };

        this.loadIncludeScript("RTREPaymentCommCrdResult_pop.xfdl");

       
    };
}
)();
