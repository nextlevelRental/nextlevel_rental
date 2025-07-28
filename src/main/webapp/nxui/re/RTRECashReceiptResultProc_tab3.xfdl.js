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
                this.set_name("RTRECashReceiptResultProc_tab3");
                this.set_classname("re00050_cms");
                this.set_titletext("[STEP3] 현금영수증 반영");
                this._setFormPosition(0,0,1122,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize

            
            // UI Components Initialize
            obj = new Static("Static04", "absolute", "0", "0", "1122", "10", null, null, this);
            obj.set_taborder("1");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "10", "10", "459", null, null, this);
            obj.set_taborder("2");
            obj.set_text("FIX \r\nh10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1112", "10", "10", "459", null, null, this);
            obj.set_taborder("3");
            obj.set_text("FIX \r\nh10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "10", "130", "1112", "20", null, null, this);
            obj.set_taborder("10");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static07", "absolute", "10", "89", "1112", "12", null, null, this);
            obj.set_taborder("11");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static17", "absolute", "10", "99", "1103", "31", null, null, this);
            obj.set_taborder("12");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_procStatus", "absolute", "144", "104", "964", "21", null, null, this);
            obj.set_taborder("13");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static19", "absolute", "10", "99", "130", "31", null, null, this);
            obj.set_taborder("14");
            obj.set_text("작업상태");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "10", "72", null, "20", "1028", null, this);
            obj.set_taborder("15");
            obj.set_text("작업상태");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "56", "1122", "20", null, null, this);
            obj.set_taborder("19");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "10", "10", "1102", "45", null, null, this);
            obj.set_taborder("32");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_searchCondition", "absolute", "20", "8", "114", "30", null, null, this.div_search);
            obj.set_taborder("6");
            obj.set_text("발행일");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static22", "absolute", "1", "0", null, "12", "430", null, this.div_search);
            obj.set_taborder("8");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "0", "0", "20", "45", null, null, this.div_search);
            obj.set_taborder("9");
            obj.set_text("FIX \r\nw20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static44", "absolute", "81", "40", "47", "21", null, null, this.div_search);
            obj.set_taborder("10");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_color("red");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static23", "absolute", "1", "33", null, "12", "430", null, this.div_search);
            obj.set_taborder("11");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_cashReceiptDate", "absolute", "131", "12", "120", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("12");
            obj.set_dateformat("yyyy-MM-dd");

            obj = new Static("Static45", "absolute", "137", "27", "1", "30", null, null, this);
            obj.set_taborder("33");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_background("red");
            this.addChild(obj.name, obj);

            obj = new Static("Static46", "absolute", "142", "27", "1", "30", null, null, this);
            obj.set_taborder("34");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_background("red");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1102, 45, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("32");
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
            		p.set_titletext("[STEP3] 현금영수증 반영");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTRECashReceiptResultProc_tab3.xfdl", "lib::comLib.xjs");
        this.registerScript("RTRECashReceiptResultProc_tab3.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분 : 수금관리 > 현금영수증관리 > 현금영수증 결과처리 > [STEP3] 현금영수증반영
         * 02. 그룹명   : RTRECashReceiptResultProc_tab3.xfdl
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
        	// 현금영수증 반영
        	//---------------------------------------------------------------------------------	
        	this.fn_process = function() {
        	
        		if(nvl(this.div_search.cal_cashReceiptDate.value) == "") {
        			alert('발행일을 입력하세요');
        			this.div_search.cal_cashReceiptDate.setFocus();
        			return;
        		}
        			
        		this.edt_procStatus.set_value("");				
        		var sSvcID      	= "cashReceiptProc";  
        		var sController   	= "ntrms/re/cashReceiptProc.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		sArgs += Ex.util.setParam("cashDay"	, nvl(this.div_search.cal_cashReceiptDate.value));	//발행일	
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 		
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
        			if(strSvcId == "cashReceiptProc") {
        				this.edt_procStatus.set_value(strErrorMsg);
        				return;
        			}
        			return Ex.core.comMsg("alert",strErrorMsg);		
        		}
        		
        		switch (strSvcId) 
        		{
        			case "getCashReceiptDate":
        				var nDay = parseInt(this.toDay.substring(6,8),10);
        				//매월1일~5일이면 전월말일로 세팅		
        				if(nDay >= 1 && nDay <= 5) {
        					this.div_search.cal_cashReceiptDate.set_value(this.prevLastDate);	//전월 말일
        				}
        				else {
        					this.div_search.cal_cashReceiptDate.set_value("");	
        				}
        				break;
        			case "cashReceiptProc":
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
        		this.parent.parent.parent.setButton("P",this);		
        		this.edt_procStatus.set_value("");
        	}
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.div_search.cal_cashReceiptDate.addEventHandler("onchanged", this.cal_cashReceiptDate_onchanged, this);

        };

        this.loadIncludeScript("RTRECashReceiptResultProc_tab3.xfdl");

       
    };
}
)();
