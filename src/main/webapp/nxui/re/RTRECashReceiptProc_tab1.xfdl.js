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
                this.set_name("RTRECashReceiptProc_tab1");
                this.set_classname("re00050_cms");
                this.set_titletext("[STEP1] 현금영수증대상집계");
                this._setFormPosition(0,0,1122,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize

            
            // UI Components Initialize
            obj = new Static("Static17", "absolute", "10", "134", "1102", "31", null, null, this);
            obj.set_taborder("0");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "10", "10", "1102", "82", null, null, this);
            obj.set_taborder("1");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_searchCondition", "absolute", "20", "8", "114", "30", null, null, this.div_search);
            obj.set_taborder("54");
            obj.set_text("발행일");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_cashReceiptDate", "absolute", "131", "12", "120", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("55");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_value("null");
            obj = new Static("Static22", "absolute", "1", "0", null, "12", "430", null, this.div_search);
            obj.set_taborder("56");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "0", "0", "20", "45", null, null, this.div_search);
            obj.set_taborder("57");
            obj.set_text("FIX \r\nw20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static44", "absolute", "81", "77", "47", "21", null, null, this.div_search);
            obj.set_taborder("58");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_color("red");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition00", "absolute", "19", "41", "114", "30", null, null, this.div_search);
            obj.set_taborder("59");
            obj.set_text("수납기간");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_fromReceipt", "absolute", "130", "45", "120", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("60");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_enable("false");
            obj.set_value("null");
            obj = new Static("Static01", "absolute", "-1", "33", "20", "45", null, null, this.div_search);
            obj.set_taborder("61");
            obj.set_text("FIX \r\nw20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "0", "66", null, "12", "431", null, this.div_search);
            obj.set_taborder("62");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static46", "absolute", "130", "47", "1", "30", null, null, this.div_search);
            obj.set_taborder("63");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_background("red");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static45", "absolute", "125", "47", "1", "30", null, null, this.div_search);
            obj.set_taborder("64");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_background("red");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static23", "absolute", "1", "33", null, "12", "430", null, this.div_search);
            obj.set_taborder("65");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_toReceipt", "absolute", "284", "45", "120", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("66");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_value("null");

            obj = new Static("Static04", "absolute", "0", "0", "1122", "10", null, null, this);
            obj.set_taborder("2");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "10", "10", "459", null, null, this);
            obj.set_taborder("3");
            obj.set_text("FIX \r\nh10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "1112", "10", "10", "459", null, null, this);
            obj.set_taborder("4");
            obj.set_text("FIX \r\nh10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static46", "absolute", "142", "27", "1", "30", null, null, this);
            obj.set_taborder("5");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_background("red");
            this.addChild(obj.name, obj);

            obj = new Static("Static47", "absolute", "127", "90", null, "21", "966", null, this);
            obj.set_taborder("6");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_color("red");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "0", "93", "1122", "20", null, null, this);
            obj.set_taborder("7");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_procStatus", "absolute", "144", "139", "963", "21", null, null, this);
            obj.set_taborder("8");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "10", "109", "84", "20", null, null, this);
            obj.set_taborder("9");
            obj.set_text("작업상태");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static19", "absolute", "10", "134", "130", "31", null, null, this);
            obj.set_taborder("10");
            obj.set_text("작업상태");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.addChild(obj.name, obj);

            obj = new Static("Static45", "absolute", "137", "27", "1", "30", null, null, this);
            obj.set_taborder("11");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_background("red");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "10", "124", null, "10", "9", null, this);
            obj.set_taborder("12");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "262", "57", "34", "21", null, null, this);
            obj.set_taborder("13");
            obj.set_text("-");
            obj.style.set_align("center middle");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1102, 82, this.div_search,
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
            		p.set_classname("re00050_cms");
            		p.set_titletext("[STEP1] 현금영수증대상집계");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTRECashReceiptProc_tab1.xfdl", "lib::comLib.xjs");
        this.registerScript("RTRECashReceiptProc_tab1.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분 : 수금관리 > 현금영수증관리 > 현금영수증처리 > [STEP1] 현금영수증대상집계
         * 02. 그룹명   : RTRECashReceiptProc_tab1.xfdl
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
        	this.toDay 			= ""; 	//현재날짜
        	this.toHour 		= "";	//현재시간
        	this.prevLastDate 	= "";	//전월 말일
        	this.prevFirstDate	= "";	//전월1일
            //-------------------------------------------------------------------------------   
        	//폼로드시 공통함수      
        	//-------------------------------------------------------------------------------  	 
        	this.form_onload = function(obj,e)
        	{
        		Ex.core.init(obj); 
        		this.fn_init();	
        		
        	} 
            //-------------------------------------------------------------------------------   
        	//초기화  
        	//------------------------------------------------------------------------------- 	
        	this.fn_init = function() {
        		//발행일 및 수납기간 조회
        		this.fn_getInitDate();
        		//버튼초기화
        		this.fn_initBtn();		
        	}
        		 		 
        	/***********************************************************************************
        	* Transaction Function
        	***********************************************************************************/
         	//---------------------------------------------------------------------------------
        	// 발행일 및 수납기간 조회
        	//---------------------------------------------------------------------------------
        	this.fn_getInitDate  = function() {
        		var sSvcID      	= "getCashReceiptDate";  
        		var sController   	= "ntrms/re/getCashReceiptDate.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        				
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 		
        	
        	}
         	//---------------------------------------------------------------------------------
        	// 현금영수증 대상집계
        	//---------------------------------------------------------------------------------
        	this.fn_aggregate  = function() {
        	
        		if(nvl(this.div_search.cal_cashReceiptDate.value) == "") {
        			alert('발행일을 입력하세요');
        			this.div_search.cal_cashReceiptDate.setFocus();
        			return;
        		}
        		if(nvl(this.div_search.cal_toReceipt.value) == "") {
        			alert('수납기간을 입력하세요');
        			this.div_search.cal_toReceipt.setFocus();
        			return;
        		}
        		
        		if(this.fn_valid()) {
        			this.edt_procStatus.set_value("");
        			
        			var sSvcID      	= "cashReceiptAggregate";  
        			var sController   	= "ntrms/re/cashReceiptAggregate.do";
        			var sInDatasets   	= "";
        			var sOutDatasets  	= "";
        			var sArgs 			= "";	
        			var fn_callBack		= "fn_callBack";
        					
        			sArgs += Ex.util.setParam("cashDay"		, nvl(this.div_search.cal_cashReceiptDate.value));	//발행일
        			sArgs += Ex.util.setParam("recvSDay"	, nvl(this.div_search.cal_fromReceipt.value));		//수납기간 시작일자
        			sArgs += Ex.util.setParam("recvEDay"	, nvl(this.div_search.cal_toReceipt.value));		//수납기간 종료일자
        					
        			Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        		}
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
        			if(strSvcId == "cashReceiptAggregate") {
        				this.edt_procStatus.set_value(strErrorMsg);		
        				return;		
        			}
        			else {
        				return Ex.core.comMsg("alert",strErrorMsg);	
        			}	

        		}
        		switch (strSvcId) 
        		{
        			case "getCashReceiptDate":
        				var nDay = parseInt(this.toDay.substring(6,8),10);
        				//매월1일~5일이면 전월말일로 세팅		
        				if(nDay >= 1 && nDay <= 5) {
        					this.div_search.cal_cashReceiptDate.set_value(this.prevLastDate);	//전월 말일
        					this.div_search.cal_fromReceipt.set_value(this.prevFirstDate);		//전월1일
        					this.div_search.cal_toReceipt.set_value(this.prevLastDate);			//전월 말일				
        				}
        				else {
        					this.div_search.cal_cashReceiptDate.set_value("");	
        					this.div_search.cal_fromReceipt.set_value(this.prevFirstDate);		//전월1일
        					this.div_search.cal_toReceipt.set_value("");						
        				}
        				break;
        			case "cashReceiptAggregate":
        				this.edt_procStatus.set_value(strErrorMsg);	
        				break;
        			default:
        				break;
        		}
        	}

        	/***********************************************************************************
        	* Component Event
        	***********************************************************************************/
            //-------------------------------------------------------------------------------  	
        	// 발행일 변경 이벤트
            //-------------------------------------------------------------------------------  		
        	this.cal_cashReceiptDate_onchanged = function(obj,e)
        	{
        		var cashReceiptDay = String(this.div_search.cal_cashReceiptDate.value);
        		//현재일기준 날짜차이 구하기
        		var nDiffDay = Eco.date.getDiffDay(cashReceiptDay, this.toDay);
        		//5일이전날짜~현재일까지만 입력가능
        		if(parseInt(nDiffDay,10) >= 6) {
        			alert("발행일은 현재일 기준으로 5일이전날짜까지만 입력가능합니다.");
        			this.div_search.cal_cashReceiptDate.set_value("");
        			this.div_search.cal_cashReceiptDate.setFocus();
        			return;
        		}
        		if(parseInt(nDiffDay,10) < 0) {
        			alert("발행일은 현재일 이후 날짜는 입력하실수 없습니다.");
        			this.div_search.cal_cashReceiptDate.set_value("");
        			this.div_search.cal_cashReceiptDate.setFocus();
        			return;
        		}		
        		
        		if(parseInt(this.div_search.cal_toReceipt.value,10) > parseInt(this.div_search.cal_cashReceiptDate.value,10)) 
        		{
        			alert('수납일자는 발행일자보다 이전 날짜로 입력하세요.');
        			this.div_search.cal_toReceipt.set_value("");	
        			this.div_search.cal_toReceipt.setFocus();
        			return;
        		}		
        	}	
        	
        	this.cal_toReceipt_onchanged = function(obj,e)
        	{
        		if(parseInt(this.div_search.cal_fromReceipt.value,10) > parseInt(this.div_search.cal_toReceipt.value,10)) 
        		{
        			alert('수납기간 종료일자는 시작일자보다 이전날짜로 입력하실수 없습니다.');
        			this.div_search.cal_toReceipt.set_value("");	
        			this.div_search.cal_toReceipt.setFocus();
        			return;
        		}		
        				
        		if(parseInt(this.div_search.cal_toReceipt.value,10) > parseInt(this.div_search.cal_cashReceiptDate.value,10)) 
        		{
        			alert('수납일자는 발행일자보다 이전 날짜로 입력하세요.');
        			this.div_search.cal_toReceipt.set_value("");	
        			this.div_search.cal_toReceipt.setFocus();
        			return;
        		}					
        	}	
        	/***********************************************************************************
        	* User Function
        	***********************************************************************************/
        	//---------------------------------------------------------------------------------
        	// 버튼생성
        	//---------------------------------------------------------------------------------
        	this.fn_initBtn  = function() {
        		/* 1. N : 신규추가
        		 * 2. S : 조회
        		 * 3. C : 데이타생성
        		 * 4. E : 엑셀데이타생성
        		 * 5. AG: 집계
        		 * 6. DN: 다운
        		 */	
        		this.parent.parent.parent.setButton("AG",this);			
        	}
        	
        	//---------------------------------------------------------------------------------
        	// VAILD 체크
        	//---------------------------------------------------------------------------------	
        	this.fn_valid = function () {
        		var cashReceiptDay = String(this.div_search.cal_cashReceiptDate.value);
        		//현재일기준 날짜차이 구하기
        		var nDiffDay = Eco.date.getDiffDay(cashReceiptDay, this.toDay);
        		//5일이전날짜~현재일까지만 입력가능
        		if(parseInt(nDiffDay,10) >= 6) {
        			alert("발행일은 현재일 기준으로 5일이전날짜까지만 입력가능합니다.");
        			this.div_search.cal_cashReceiptDate.set_value("");
        			this.div_search.cal_cashReceiptDate.setFocus();
        			return false;
        		}
        		if(parseInt(nDiffDay,10) < 0) {
        			alert("발행일은 현재일 이후 날짜는 입력하실수 없습니다.");
        			this.div_search.cal_cashReceiptDate.set_value("");
        			this.div_search.cal_cashReceiptDate.setFocus();
        			return false;
        		}	
        		
        		if(parseInt(this.div_search.cal_fromReceipt.value,10) > parseInt(this.div_search.cal_toReceipt.value,10)) 
        		{
        			alert('수납기간 종료일자는 시작일자보다 이전날짜로 입력하실수 없습니다.');
        			this.div_search.cal_toReceipt.set_value("");	
        			this.div_search.cal_toReceipt.setFocus();
        			return false;
        		}		
        				
        		if(parseInt(this.div_search.cal_toReceipt.value,10) > parseInt(this.div_search.cal_cashReceiptDate.value,10)) 
        		{
        			alert('수납일자는 발행일자보다 이전 날짜로 입력하세요.');
        			this.div_search.cal_toReceipt.set_value("");	
        			this.div_search.cal_toReceipt.setFocus();
        			return false;
        		}			
        		
        		return true;
        	}
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.div_search.cal_cashReceiptDate.addEventHandler("onchanged", this.cal_cashReceiptDate_onchanged, this);
            this.div_search.cal_toReceipt.addEventHandler("onchanged", this.cal_toReceipt_onchanged, this);

        };

        this.loadIncludeScript("RTRECashReceiptProc_tab1.xfdl");

       
    };
}
)();
