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
                this.set_name("RTREBondAggregate_tab1");
                this.set_classname("re00050_cms");
                this.set_titletext("연체대상 집계");
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
            obj.set_text("연체집계일자");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_accReqDate", "absolute", "131", "12", "120", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("7");
            obj.set_dateformat("yyyy-MM-dd");
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
            		p.set_titletext("연체대상 집계");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTREBondAggregate_tab1.xfdl", "lib::comLib.xjs");
        this.registerScript("RTREBondAggregate_tab1.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분 : 채권관리 > 채권대상집계 > [STEP 1] 연체대상 집계
         * 02. 그룹명   : RTREBondAggregate_tab1.xfdl
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
        	this.toDay		= ""; 	//당일
        	this.yesterDay	= ""; 	//전일
        	this.curMonth 	= "";	//당월	
        	this.prevMonth	= ""; 	//전월
        	this.nextMonth	= ""; 	//익월
        	this.procYn		= ""; 	//집계처리가능여부
        	this.currCunt	= "";	//연체대상 집계내역 count
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
        		//월일 조회
        		this.fn_getDayMongth();	
        		//버튼초기화		
        		this.fn_initBtn();		
        	}	
        		 
        	/***********************************************************************************
        	* Transaction Function
        	***********************************************************************************/
            //-------------------------------------------------------------------------------  	
        	//월일 조회
            //-------------------------------------------------------------------------------  	
        	this.fn_getDayMongth = function() 
        	{
        		var sSvcID      	= "getDayMongth";  
        		var sController   	= "ntrms/re/getDayMongth.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";

        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 	
        	}		
        	//---------------------------------------------------------------------------------
        	// 연체대상 집계 내역 Count
        	//---------------------------------------------------------------------------------	
        	this.fn_aggregateCnt  = function() {
        		var accReqDate = nvl(this.div_search.cal_accReqDate.value);

        		if(accReqDate != "") {
        			if(parseInt(accReqDate,10) > parseInt(this.toDay,10)) 
        			{
        				alert('연체집계일자는 당일 또는 이전날짜만 선택가능합니다.');
        				this.div_search.cal_accReqDate.setFocus();
        				return;
        			}	
        		}
        		else {
        			alert('연체집계일자를 입력하세요.');
        			this.div_search.cal_accReqDate.setFocus();			
        		}
        			
        		this.procYn = "";						
        		var sSvcID      	= "delyAggregateCnt";  
        		var sController   	= "ntrms/re/delyAggregateCnt.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        				
            	sArgs += Ex.util.setParam("delyDay"	, nvl(this.div_search.cal_accReqDate.value)); //연체집계기준일자	

        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 		

        	}		
         	//---------------------------------------------------------------------------------
        	// 연체대상 집계
        	//---------------------------------------------------------------------------------	
        	this.fn_aggregate  = function() {
        	
        		this.edt_procStatus.set_value("");
        			
        		var accReqDate = nvl(this.div_search.cal_accReqDate.value);

        		if(accReqDate != "") {
        			if(parseInt(accReqDate,10) > parseInt(this.toDay,10)) 
        			{
        				alert('연체집계일자는 당일 또는 이전날짜만 선택가능합니다.');
        				//this.div_search.cal_accReqDate.set_value(this.yesterDay);			
        				//this.div_search.cal_accReqDate.set_value("");			
        				this.div_search.cal_accReqDate.setFocus();
        				return;
        			}	
        		}
        		else {
        			alert('연체집계일자를 입력하세요.');
        			this.div_search.cal_accReqDate.setFocus();			
        		}
        		var returnDate = accReqDate.substr(0,4) + "/" + accReqDate.substr(4,2) + "/" + accReqDate.substr(6,2);
        		if(parseInt(this.currCunt,10) > 0) {
        			if(Ex.core.comMsg("confirm","연체집계일자 ("+ returnDate + ")의 집계내역이 존재합니다. \n집계하시겠습니까? (집계시 기존집계내역은 삭제됩니다.)"))
        			{	
        				this.procYn = "Y";
        			}
        			else {
        				return;
        			}
        		}
        		else {
        			this.procYn = "Y";
        		}
        		
        		var sSvcID      	= "delyAggregate";  
        		var sController   	= "ntrms/re/delyAggregate.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        				
        		sArgs += Ex.util.setParam("delyDay"	, nvl(this.div_search.cal_accReqDate.value)); //연체집계기준일자	
        		sArgs += Ex.util.setParam("procYn"	, nvl(this.procYn)); //처리가능여부   	
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
        			if(strSvcId == "delyAggregate") {
        				this.edt_procStatus.set_value(strErrorMsg);
        				return;
        			}
        			//연체대상 집계 내역 Count
        			this.fn_aggregateCnt();				
        			return Ex.core.comMsg("alert",strErrorMsg);		
        		}
        		
        		switch (strSvcId) 
        		{
        			//월일조회
        			case "getDayMongth":
        				this.div_search.cal_accReqDate.set_value(this.yesterDay);
        				//연체대상 집계 내역 Count
        				this.fn_aggregateCnt();
        				break;	
        			//연체대상 집계 내역 Count
        			case "delyAggregateCnt":
        				if(parseInt(this.currCunt,10) > 0) {
        					this.procYn = "Y";
        				}
        			
        				break;					
        			//연체대상 집계
        			case "delyAggregate":
        				this.edt_procStatus.set_value(strErrorMsg);		
        				//연체대상 집계 내역 Count
        				this.fn_aggregateCnt();					
        				break;
        			default:
        				break;
        		}
        	}

        	/***********************************************************************************
        	* Component Event
        	***********************************************************************************/
            //-------------------------------------------------------------------------------  	
        	// 연체집계일자 변경 이벤트
            //-------------------------------------------------------------------------------  	
        	this.cal_accReqDate_onchanged = function(obj,e)
        	{
        		var accReqDate = nvl(this.div_search.cal_accReqDate.value);

        		if(accReqDate != "") {
        			if(parseInt(accReqDate,10) > parseInt(this.toDay,10)) 
        			{
        				alert('연체집계일자는 당일 또는 이전날짜만 선택가능합니다.');
        				//this.div_search.cal_accReqDate.set_value(this.yesterDay);			
        				//this.div_search.cal_accReqDate.set_value("");			
        				this.div_search.cal_accReqDate.setFocus();
        				return;
        			}
        			else {
        				if(accReqDate.length == 8) {
        					//연체대상 집계 내역 Count
        					this.fn_aggregateCnt();
        				}
        			}
        		}
        		if(accReqDate == "") {
        			alert('연체집계일자를 입력하세요.');
        			this.div_search.cal_accReqDate.setFocus();			
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
        		this.edt_procStatus.set_value("");
        	}
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.div_search.cal_accReqDate.addEventHandler("onchanged", this.cal_accReqDate_onchanged, this);

        };

        this.loadIncludeScript("RTREBondAggregate_tab1.xfdl");

       
    };
}
)();
