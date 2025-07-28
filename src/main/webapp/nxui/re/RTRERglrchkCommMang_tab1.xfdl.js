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
                this.set_name("RTRERglrchkCommMang_tab1");
                this.set_classname("RTRERglrchkCommMang_tab1");
                this.set_titletext("지급대상 집계");
                this._setFormPosition(0,0,1122,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize

            
            // UI Components Initialize
            obj = new Static("Static17", "absolute", "10", "97", "1102", "31", null, null, this);
            obj.set_taborder("0");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "10", "10", "1102", "45", null, null, this);
            obj.set_taborder("1");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_referYM", "absolute", "20", "8", "114", "30", null, null, this.div_search);
            obj.set_taborder("67");
            obj.set_text("기준월");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_referYM", "absolute", "131", "12", "120", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("68");
            obj.set_dateformat("yyyy-MM");
            obj.set_value("null");
            obj.set_editformat("yyyy-MM");
            obj = new Static("Static22", "absolute", "1", "0", null, "12", "0", null, this.div_search);
            obj.set_taborder("69");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "0", "0", "20", "45", null, null, this.div_search);
            obj.set_taborder("70");
            obj.set_text("FIX \r\nw20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static23", "absolute", "1", "33", null, "12", "0", null, this.div_search);
            obj.set_taborder("78");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "0", "0", "1122", "10", null, null, this);
            obj.set_taborder("2");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "10", "10", null, null, "0", this);
            obj.set_taborder("3");
            obj.set_text("FIX \r\nh10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "1112", "10", "10", null, null, "0", this);
            obj.set_taborder("4");
            obj.set_text("FIX \r\nh10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "0", "56", "1122", "20", null, null, this);
            obj.set_taborder("7");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_procStatus", "absolute", "144", "102", "963", "21", null, null, this);
            obj.set_taborder("8");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "10", "72", "84", "20", null, null, this);
            obj.set_taborder("9");
            obj.set_text("작업상태");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static19", "absolute", "10", "97", "130", "31", null, null, this);
            obj.set_taborder("10");
            obj.set_text("작업상태");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "10", "87", null, "10", "9", null, this);
            obj.set_taborder("12");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1102, 45, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("1");
            		p.set_text("Div00");
            		p.set_scrollbars("none");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1122, 496, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTRERglrchkCommMang_tab1");
            		p.set_titletext("지급대상 집계");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTRERglrchkCommMang_tab1.xfdl", "lib::comLib.xjs");
        this.registerScript("RTRERglrchkCommMang_tab1.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분	: 수금관리 > 수수료 > 정기점검수수료 관리 > [STEP 1] 지급대상 집계
         * 02. 그룹명		: RTRERglrchkCommMang_tab1.xfdl
         * 03. 그룹설명	: 
         * 04. 작성일		: 2017-05-25
         * 05. 작성자		: wjim
         * 06. 수정이력	: 
         ***********************************************************************
         *		수정일			작성자		내용
         ***********************************************************************
         *		2017-05-25		wjim		최초작성
         ***********************************************************************/

        /***********************************************************************
         * Script Include
         ***********************************************************************/
        //include "lib::comLib.xjs";

        /***********************************************************************
         * FORM 변수 선언 영역
         ***********************************************************************/
        this.toDay  = "";	/* 서버기준 오늘날자	*/
        this.prevYm = "";	/* 전월					*/

        /***********************************************************************
         * 그룹 변수 선언부
         ***********************************************************************/

        /***********************************************************************************
         * Form Load Common Function
         ***********************************************************************************/
        this.RTRERglrchkCommMang_tab1_onload = function(obj,e) {
        	/* 폼 로드 공통함수 */
        	Ex.core.init(obj);
        	
        	/* 화면 초기화 */
        	this.fn_init();
        }

        this.fn_init = function() {
        	/* 메인 공통버튼 초기화(집계) */
        	this.parent.parent.parent.setButton("AG", this);
        	
        	/* 기준월 세팅 */
        	this.fn_setReferYm();
        }

        /***********************************************************************************
         * Transaction Function
         ***********************************************************************************/
        /**
         * 기준월 세팅
         */
        this.fn_setReferYm  = function() {
        	var sSvcID		 = "setReferYm";
        	var sController	 = "/rtms/comm/getToday.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "";
        	var sArgs		 = "";
        	var fn_callBack	 = "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 집계 버튼 클릭 이벤트 처리
         */
        /*
        this.fn_aggregate = function() {
        	// 작업상태 초기화
        	this.edt_procStatus.set_value("");
        	
        	// 필수값 검증 - 기준월
        	if(nvl(this.div_search.cal_referYM.value) == "") {
        		this.alert("기준월을 입력하세요");
        		
        		this.div_search.cal_referYM.setFocus();
        		return;
        	}
        	
        	var sSvcID		 = "aggregate";
        	var sController	 = "/ntrms/re/regularchkCommAggregate.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "";
        	var sArgs		 = "";
        		sArgs		+= Ex.util.setParam("slcmYm", nvl(this.div_search.cal_referYM.value).substr(0, 6));	//기준월
        	var fn_callBack	 = "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        */

        this.fn_aggregate = function() {
        	/* 작업상태 초기화 */
        	this.edt_procStatus.set_value("");
        	
        	/* 필수값 검증 - 기준월 */
        	if(nvl(this.div_search.cal_referYM.value) == "") {
        		this.alert("기준월을 입력하세요");
        		
        		this.div_search.cal_referYM.setFocus();
        		return;
        	}
        	
        	var sSvcID		 = "aggregateVisitFee";
        	var sController	 = "aggregateVisitFee.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "";
        	var sArgs		 = "";
        		sArgs		+= Ex.util.setParam("slcmYm", nvl(this.div_search.cal_referYM.value).substr(0, 6));	/* 기준월 */
        	var fn_callBack	 = "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /***********************************************************************************
         * CallBack Event (strSvcId - Sevice ID, nErrorCode - ErrorCode, strErrorMsg - Error Message)
         ***********************************************************************************/
        this.fn_callBack = function(strSvcId,nErrorCode,strErrorMsg) {
        	if(nErrorCode < 0) {
        		//if(strSvcId == "aggregate") {
        		if(strSvcId == "aggregateVisitFee") {
        			this.edt_procStatus.set_value(strErrorMsg);
        			return;
        		} else {
        			return Ex.core.comMsg("alert", strErrorMsg);
        		}
        	}
        	
        	switch(strSvcId) {
        		/* 기준월 세팅 */
        		case "setReferYm":
        			/* 서버시간 기준 전월(1월의 경우 12월로 정상표현되는지 확인 필요) */
        			prevYm = this.toDay.substr(0, 4) + (this.toDay.substr(4, 2) - 1);
        			
        			this.div_search.cal_referYM.set_value(prevYm);
        			break;
        		
        		/* 집계 */
        		//case "aggregate":
        		case "aggregateVisitFee":
        			this.edt_procStatus.set_value(strErrorMsg);
        			break;
        		
        		default:
        			break;
        	}
        }
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTRERglrchkCommMang_tab1_onload, this);
            this.div_search.cal_referYM.addEventHandler("onchanged", this.cal_accReqDate_onchanged, this);

        };

        this.loadIncludeScript("RTRERglrchkCommMang_tab1.xfdl");

       
    };
}
)();
