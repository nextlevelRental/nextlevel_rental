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
                this.set_name("RTREPaymentComm_tab1");
                this.set_classname("test_form");
                this.set_titletext("연체금수납");
                this._setFormPosition(0,0,1166,454);
            }
            this.style.set_color("#333333ff");

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_collectionMoneyList", this);
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custTp\" type=\"STRING\" size=\"256\"/><Column id=\"custTp2\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"ordDay\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"statCd\" type=\"STRING\" size=\"256\"/><Column id=\"statNm\" type=\"STRING\" size=\"256\"/><Column id=\"birthDay\" type=\"STRING\" size=\"256\"/><Column id=\"buslNo\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"payMthd\" type=\"STRING\" size=\"256\"/><Column id=\"payNm\" type=\"STRING\" size=\"256\"/><Column id=\"payDD\" type=\"STRING\" size=\"256\"/><Column id=\"prePaid\" type=\"STRING\" size=\"256\"/><Column id=\"arreAmt\" type=\"STRING\" size=\"256\"/><Column id=\"arreMon\" type=\"STRING\" size=\"256\"/><Column id=\"mfpYn\" type=\"STRING\" size=\"256\"/><Column id=\"preAmt\" type=\"STRING\" size=\"256\"/><Column id=\"vacsYn\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_unpaidList", this);
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"chk\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"schdSeq\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"recpNu\" type=\"STRING\" size=\"256\"/><Column id=\"recpTp\" type=\"STRING\" size=\"256\"/><Column id=\"recpNm\" type=\"STRING\" size=\"256\"/><Column id=\"demdDt\" type=\"STRING\" size=\"256\"/><Column id=\"zfbDay\" type=\"STRING\" size=\"256\"/><Column id=\"saleAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"recpAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"arreAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"vaccIssue\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
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

            obj = new Grid("grd_unpaidList", "absolute", "25", "221", "560", "208", null, null, this);
            obj.set_taborder("2");
            obj.set_binddataset("ds_unpaidList");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj.set_autofittype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"40\"/><Column size=\"120\"/><Column size=\"55\"/><Column size=\"60\"/><Column size=\"70\"/><Column size=\"75\"/><Column size=\"75\"/><Column size=\"70\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/><Row size=\"24\" band=\"summ\"/></Rows><Band id=\"head\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\"/><Cell col=\"1\" text=\"계약번호\"/><Cell col=\"2\" text=\"회차\"/><Cell col=\"3\" text=\"청구구분\"/><Cell col=\"4\" text=\"청구일자\"/><Cell col=\"5\" text=\"청구금액\"/><Cell col=\"6\" text=\"수납금액\"/><Cell col=\"7\" text=\"미납금액\"/></Band><Band id=\"body\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\" text=\"bind:chk\"/><Cell col=\"1\" text=\"bind:ordNo\"/><Cell col=\"2\" text=\"bind:recpNu\"/><Cell col=\"3\" text=\"bind:recpNm\"/><Cell col=\"4\" text=\"bind:zfbDay\"/><Cell col=\"5\" displaytype=\"number\" style=\"align:right middle;\" text=\"bind:saleAmt\" mask=\"###,###,###,##0\"/><Cell col=\"6\" displaytype=\"number\" style=\"align:right middle;\" text=\"bind:recpAmt\" mask=\"###,###,###,##0\"/><Cell col=\"7\" displaytype=\"number\" style=\"align:right middle;\" text=\"bind:arreAmt\" mask=\"###,###,###,##0\"/></Band><Band id=\"summary\"><Cell/><Cell col=\"1\" text=\"총계\"/><Cell col=\"2\" style=\"align:right middle;\" text=\"expr:dataset.getRowCount() + &quot;(건)&quot;\"/><Cell col=\"3\" style=\"align:right;\"/><Cell col=\"4\"/><Cell col=\"5\" displaytype=\"number\" style=\"align:right;\" expr=\"expr:dataset.getSum(&quot;saleAmt&quot;)\"/><Cell col=\"6\" displaytype=\"number\" style=\"align:right;\" expr=\"expr:dataset.getSum(&quot;recpAmt&quot;)\"/><Cell col=\"7\" displaytype=\"number\" style=\"align:right;\" expr=\"expr:dataset.getSum(&quot;arreAmt&quot;)\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("st_unpaidList", "absolute", "25", "196", "100", "20", null, null, this);
            obj.set_taborder("19");
            obj.set_text("미납내역 상세");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("st_recpFg", "absolute", "609", "196", "120", "20", null, null, this);
            obj.set_taborder("21");
            obj.set_text("수납유형");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Button("btn_payment", "absolute", "1096", "194", "45", "22", null, null, this);
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
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"100\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"250\"/><Column size=\"80\"/><Column size=\"45\"/><Column size=\"75\"/><Column size=\"75\"/><Column size=\"75\"/><Column size=\"80\"/><Column size=\"70\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"60\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/><Row size=\"24\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"계약번호\"/><Cell col=\"1\" text=\"고객코드\"/><Cell col=\"2\" text=\"고객명\"/><Cell col=\"3\" text=\"상품명\"/><Cell col=\"4\" text=\"차량번호\"/><Cell col=\"5\" text=\"수량\"/><Cell col=\"6\" text=\"계약일자\"/><Cell col=\"7\" text=\"장착일자\"/><Cell col=\"8\" text=\"계약상태\"/><Cell col=\"9\" text=\"법정생년월일\"/><Cell col=\"10\" text=\"사업자번호\"/><Cell col=\"11\" text=\"핸드폰\"/><Cell col=\"12\" text=\"전화번호\"/><Cell col=\"13\" text=\"결제방법\"/><Cell col=\"14\" text=\"결제일\"/><Cell col=\"15\" text=\"선수금액\"/><Cell col=\"16\" text=\"연체금액\"/><Cell col=\"17\" text=\"연체개월\"/></Band><Band id=\"body\"><Cell text=\"bind:ordNo\"/><Cell col=\"1\" text=\"bind:custNo\"/><Cell col=\"2\" text=\"bind:custNm\"/><Cell col=\"3\" text=\"bind:matNm\" autosizerow=\"limitmin\"/><Cell col=\"4\" text=\"bind:carNo\"/><Cell col=\"5\" text=\"bind:cntCd\"/><Cell col=\"6\" text=\"bind:ordDay\"/><Cell col=\"7\" text=\"bind:procDay\"/><Cell col=\"8\" text=\"bind:statNm\"/><Cell col=\"9\" text=\"bind:birthDay\"/><Cell col=\"10\" text=\"bind:buslNo\"/><Cell col=\"11\" text=\"bind:mobNo\"/><Cell col=\"12\" text=\"bind:telNo\"/><Cell col=\"13\" text=\"bind:payNm\"/><Cell col=\"14\" text=\"bind:payDD\"/><Cell col=\"15\" style=\"align:right;\" text=\"bind:prePaid\"/><Cell col=\"16\" style=\"align:right;\" text=\"bind:arreAmt\"/><Cell col=\"17\" text=\"bind:arreMon\"/></Band><Band id=\"summary\"><Cell text=\"총계\"/><Cell col=\"1\" style=\"align:right;\" expr=\"dataset.getRowCount()+&quot;(건)&quot;\"/><Cell col=\"2\"/><Cell col=\"3\"/><Cell col=\"4\"/><Cell col=\"5\"/><Cell col=\"6\"/><Cell col=\"7\"/><Cell col=\"8\"/><Cell col=\"9\"/><Cell col=\"10\"/><Cell col=\"11\"/><Cell col=\"12\"/><Cell col=\"13\"/><Cell col=\"14\"/><Cell col=\"15\"/><Cell col=\"16\"/><Cell col=\"17\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Button("btn_refresh", "absolute", null, "10", "57", "22", "25", null, this);
            obj.set_taborder("42");
            obj.set_text("재조회");
            obj.set_cssclass("btn_WF_CRUD");
            obj.set_visible("true");
            this.addChild(obj.name, obj);

            obj = new Radio("rdo_recpFg", "absolute", "605", "221", "300", "22", null, null, this);
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

            obj = new Div("div_payment", "absolute", "605", "248", "536", "181", null, null, this);
            obj.set_taborder("58");
            obj.set_url("re::RTREPaymentComm_div.xfdl");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "0", "25", null, null, "0", this);
            obj.set_taborder("59");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Button("btn_SaveAcc", "absolute", "85.08%", "262", null, "18", "2.83%", null, this);
            obj.set_taborder("60");
            obj.set_text("Button00");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_tordNo", "absolute", "85.08%", "290", null, "20", "2.83%", null, this);
            obj.set_taborder("61");
            obj.set_visible("false");
            obj.set_tooltiptext("tordNo");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_PTrNo", "absolute", "85.08%", "320", null, "20", "2.83%", null, this);
            obj.set_taborder("62");
            obj.set_visible("false");
            obj.set_tooltiptext("PTrNo");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1166, 454, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("test_form");
            		p.set_titletext("연체금수납");
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
        this.addIncludeScript("RTREPaymentComm_tab1.xfdl", "lib::comLib.xjs");
        this.registerScript("RTREPaymentComm_tab1.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분	: 수금관리 > 수납공통화면 > 연체금수납
         * 02. 그룹명		: RTREPaymentComm_tab1.xfdl
         * 03. 그룹설명	: 
         * 04. 작성일		: 2018-11-09
         * 05. 작성자		: 노창호
         * 06. 수정이력	: 
         ***********************************************************************
         *		수정일			작성자		내용
         ***********************************************************************
         *		2018-11-09		노창호		최초작성
         ***********************************************************************/

        /***********************************************************************
         * Script Include
         ***********************************************************************/
        //include "lib::comLib.xjs";

        /***********************************************************************
         * FORM 변수 선언 영역
         ***********************************************************************/
        this.popupId = this.parent.popupId;
        this.popupYn = "Y";	/* Popup 여부	*/
        this.viewId	 = "";	/* 업무구분	*/
        this.workCd = "";
        this.etcPop = "N";

        /***********************************************************************
         * 그룹 변수 선언부
         ***********************************************************************/
        this.toDay	  = "";
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
        	var sController	 = "/ntrms/re/getDayMongth.do";
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
        	this.ds_unpaidList.clearData();
        	
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
         * 미납내역상세 조회
         */
        this.fn_retrieveUnpaidList = function(ordNo) {
        	this.ds_unpaidList.clearData();
        	this.grd_unpaidList.setCellProperty("head", 0, "text", 0);
        	
        	var sSvcID		 = "retrieveUnpaidList";
        	var sController	 = "ntrms/re/retrieveUnpaidList.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "ds_unpaidList=output";
        	var sArgs		 = "";
        		sArgs		+= Ex.util.setParam("ordNo",  nvl(ordNo));	/* 계약번호 */
        		sArgs		+= Ex.util.setParam("custNo", this.custNo);	/* 고객번호 */
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
        			this.curMonth = this.toDay.substr(0, 4) + this.toDay.substr(4, 2) + Eco.date.getLastDayOfMonth(this.toDay);
        			
        			var expiryDate = Eco.date.addDate(this.toDay, 3);
        			
        			if(expiryDate.substr(4, 2) != this.toDay.substr(4, 2)) {
        				div.div_vacc.cal_expiryAcc.set_value(this.curMonth);	/* 당월 말일	*/
        			} else {
        				div.div_vacc.cal_expiryAcc.set_value(expiryDate);		/* 3일후		*/
        			}
        			break;
        		
        		
        		/* 수금내역 조회 */
        		case "retrieveCollectionMoneyList":
        			var ds = this.ds_collectionMoneyList;
        			
        			//[20200512_01] kstka 중도완납, 계약종료되고 연체금이 없는 계약은 제외처리
        			ds.filter("mfpYn == 'N' && arreAmt > 0");
        			
        			ds.set_rowposition(-1);
        			ds.set_enableevent(true);
        			
        			if(ds.getRowCount() > 0) {
        				this.tordNo	= ds.getColumn(0, "ordNo");
        				this.custNo	= ds.getColumn(0, "custNo");
        				this.custNm	= ds.getColumn(0, "custNm");
        				this.matNm	= ds.getColumn(0, "matNm");
        				this.telNo	= ds.getColumn(0, "telNo");
        				this.mobNo	= ds.getColumn(0, "mobNo");
        			} else {
        				div.div_cardImmWthdr.st_paymentAmt.set_text("0원");
        				div.div_accImmWthdr.st_paymentAmt.set_text(	"0원");
        				div.div_vacc.st_paymentAmt.set_text(		"0원");
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
        			
        			div.div_accImmWthdr.ed_ownerNm.set_value(this.custNm);
        			div.div_vacc.ed_dpsNm.set_value(this.custNm);
        			div.div_vacc.ed_smsSendTrgtNo.set_value(this.mobNo);
        			break;
        		
        		/* 미납내역상세 조회 */
        		case "retrieveUnpaidList":
        			//가상계좌 발급된건은 제외처리
        			this.ds_unpaidList.filter('vaccIssue == 0');
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
        	
        	//[20200511_01] 이중클릭 방지
        	this.btn_payment.set_enable(false);
        	
        	var rdo		= this.rdo_recpFg;
        	var div		= this.div_payment;
        	var dsMst	= this.ds_collectionMoneyList;
        	var nMstRow	= dsMst.rowposition;
        	var dsDtl	= this.ds_unpaidList;
        	
        	div.tordNo = dsMst.getColumn(nMstRow, "ordNo");
        	div.custNo = dsMst.getColumn(nMstRow, "custNo");
        	div.custNm = dsMst.getColumn(nMstRow, "custNm");
        	
        	div.ds_unpaidList.clearData();
        	
        	var copySeq = 0;
        	
        	for(var i = 0; i < dsDtl.rowcount; i++) {
        		if(dsDtl.getColumn(i, "chk") == "1") {
        			div.ds_unpaidList.addRow();
        			div.ds_unpaidList.copyRow(copySeq, dsDtl, i);
        			copySeq++;
        		}
        	}
        	
        	if(rdo.index == 0) {
        		/* 카드즉시출금결제 */
        		var dsCrdParam	= div.ds_crdPymntParam;
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
        		dsCrdParam.setColumn(0, "workCd",		 this.viewId);								/* 업무구분		*/
        		
        		/* 카드즉시출금 결제/환불 */
        		div.fn_processPayment();
        	} else if(rdo.index == 1) {
        		/* 계좌즉시출금결제 */
        		var divAcc = div.div_accImmWthdr;
        		this.workCd = this.viewId;
        		
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
        		//20200430 kstka 가상계좌 발급시 상세내역이 선택되지 않은 경우 발생
        		if(div.ds_unpaidList.rowcount == 0){
        			this.alert("발급 상세 내역이 선택되지 않았습니다.");
        			return;
        		}
        	
        		//20200430 kstka 가상계좌 발급여부 확인
        		var vacsYn = nvl(this.ds_collectionMoneyList.getColumn(this.ds_collectionMoneyList.rowposition, "vacsYn"));
        		if(vacsYn == "Y"){
        			this.alert("가상계좌가 이미 발급되어 있습니다.");
        			return;
        		}
        		
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
        		
        		div.fn_vaccIssued();
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
         * grd_unpaidList Oncellclick Event
         */
        this.grd_unpaidList_oncellclick = function(obj,e) {
        	var ds		= this.ds_unpaidList;
        	var idxFrom	= "";
        	var ordNo	= ds.getColumn(e.row, "ordNo");
        	
        	/* 체크박스 선택 */
        	if(e.col == obj.getBindCellIndex("body", "chk")) {
        		if(obj.getCellValue(e.row, e.col) == "1") {
        			/* 선택되지 않은 이전회차를 모두 선택 처리 */
        			idxFrom = ds.findRowExpr("arreAmt > 0");
        			
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
         * grd_unpaidList Onheadclick Event
         */
        this.grd_unpaidList_onheadclick = function(obj,e) {
        	var div		 = this.div_payment;
        	var totalAmt = 0;
        	
        	if(obj.getCellProperty("head", 0, "text") == 0) {
        		for(var i = 0; i < this.ds_unpaidList.rowcount; i++) {
        			totalAmt += this.ds_unpaidList.getColumn(i, "arreAmt");
        		}
        	} else {
        		totalAmt = 0;
        	}
        	
        	/* 할부 불가 */
        	if(totalAmt < 50000) {
        		div.div_cardImmWthdr.cbo_quotaopt.set_index(0);
        		div.div_cardImmWthdr.cbo_quotaopt.set_readonly(true);
        	} else {
        		div.div_cardImmWthdr.cbo_quotaopt.set_readonly(false);
        	}
        	
        	totalAmt = nvl(div.fn_numberWithComma(totalAmt));
        	totalAmt = totalAmt == "" || totalAmt.toString() == "NaN" ? "0" : totalAmt;
        	
        	div.div_cardImmWthdr.st_paymentAmt.set_text(totalAmt + "원");
        	div.div_accImmWthdr.st_paymentAmt.set_text(	totalAmt + "원");
        	div.div_vacc.st_paymentAmt.set_text(		totalAmt + "원");
        }

        /**
         * ds_collectionMoneyList Onrowposchanged Event
         */
        this.ds_collectionMoneyList_onrowposchanged = function(obj,e) {
        	this.tordNo	= obj.getColumn(e.newrow, "ordNo");
        	this.matNm	= obj.getColumn(e.newrow, "matNm");
        	
        	//[20200511_01] 이중클릭 방지
        	this.btn_payment.set_enable(true);
        	
        	//20200430 kstka 가상계좌 금액 초기화
        	this.div_payment.div_vacc.st_paymentAmt.set_text(		"0원");
        	
        	this.fn_retrieveUnpaidList(obj.getColumn(e.newrow, "ordNo"));
        }

        /**
         * ds_unpaidList Oncolumnchanged Event
         */
        this.ds_unpaidList_oncolumnchanged = function(obj,e) {
        	var div = this.div_payment;
        	
        	if(e.columnid == "chk") {
        		var totalAmt = 0;
        		
        		for(var i = 0; i < this.ds_unpaidList.rowcount; i++) {
        			if(obj.getColumn(i, "chk") == "1") {
        				totalAmt += this.ds_unpaidList.getColumn(i, "arreAmt");
        			}
        		}
        	}
        	
        	/* 할부 불가 */
        	if(totalAmt < 50000) {
        		div.div_cardImmWthdr.cbo_quotaopt.set_index(0);
        		div.div_cardImmWthdr.cbo_quotaopt.set_readonly(true);
        	} else {
        		div.div_cardImmWthdr.cbo_quotaopt.set_readonly(false);
        	}
        	
        	totalAmt = nvl(div.fn_numberWithComma(totalAmt));
        	totalAmt = totalAmt == "" || totalAmt.toString() == "NaN" ? "0" : totalAmt;
        	
        	div.div_cardImmWthdr.st_paymentAmt.set_text(totalAmt + "원");
        	div.div_accImmWthdr.st_paymentAmt.set_text(	totalAmt + "원");
        	div.div_vacc.st_paymentAmt.set_text(		totalAmt + "원");
        }

        this.div_accImmWthdr_btn_SaveAcc_onclick = function(obj,e)
        {		
        	this.tordNo = this.ed_tordNo.text;
        	this.div_payment.custNo = this.custNo;
        	this.div_payment.tordNo = this.ed_tordNo.text;
        	this.div_payment.PTrNo = this.ed_PTrNo.text;

        	this.div_payment.ds_unpaidList = this.ds_unpaidList;

        	if(this.rdo_recpFg.index == 1) {
        		/* 계좌즉시출금결제 저장 */
        		this.div_payment.fn_saveAccImmWthdrPayment();
        	}
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.ds_collectionMoneyList.addEventHandler("onrowposchanged", this.ds_collectionMoneyList_onrowposchanged, this);
            this.ds_unpaidList.addEventHandler("oncolumnchanged", this.ds_unpaidList_oncolumnchanged, this);
            this.addEventHandler("onload", this.form_onload, this);
            this.grd_unpaidList.addEventHandler("oncellclick", this.grd_unpaidList_oncellclick, this);
            this.grd_unpaidList.addEventHandler("onheadclick", this.grd_unpaidList_onheadclick, this);
            this.btn_payment.addEventHandler("onclick", this.btn_payment_onclick, this);
            this.btn_refresh.addEventHandler("onclick", this.btn_refresh_onclick, this);
            this.rdo_recpFg.addEventHandler("onitemchanged", this.rdo_recpFg_onitemchanged, this);
            this.btn_SaveAcc.addEventHandler("onclick", this.div_accImmWthdr_btn_SaveAcc_onclick, this);

        };

        this.loadIncludeScript("RTREPaymentComm_tab1.xfdl");
        this.loadPreloadList();
       
    };
}
)();
