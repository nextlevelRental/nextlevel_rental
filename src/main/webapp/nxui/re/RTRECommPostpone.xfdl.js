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
                this.set_name("RTRECommPostpone");
                this.set_classname("test");
                this.set_titletext("수수료 이연처리");
                this._setFormPosition(0,0,1147,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize

            
            // UI Components Initialize
            obj = new Static("Static17", "absolute", "0", "81", "1122", "31", null, null, this);
            obj.set_taborder("0");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_procStatus", "absolute", "134", "86", "983", "21", null, null, this);
            obj.set_taborder("8");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "0", "56", "100", "20", null, null, this);
            obj.set_taborder("9");
            obj.set_text("작업상태");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static19", "absolute", "0", "81", "130", "31", null, null, this);
            obj.set_taborder("10");
            obj.set_text("작업상태");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "0", "0", "1122", "45", null, null, this);
            obj.set_taborder("13");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_searchCondition", "absolute", "20", "10", "100", "21", null, null, this.div_search);
            obj.set_taborder("81");
            obj.set_text("기준일자");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_referDate", "absolute", "120", "10", "120", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("82");
            obj.set_dateformat("yyyy-MM");
            obj.set_editformat("yyyy-MM");
            obj = new Static("Static22", "absolute", "1", "0", "1117", "10", null, null, this.div_search);
            obj.set_taborder("83");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "0", "0", "20", "45", null, null, this.div_search);
            obj.set_taborder("84");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static23", "absolute", "1", "31", "1117", "10", null, null, this.div_search);
            obj.set_taborder("92");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);

            obj = new Radio("Radio00", "absolute", "1174", "170", "280", "50", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("14");

            obj = new Radio("Radio01", "absolute", "1208", "337", "280", "50", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("15");

            obj = new Static("Static01", "absolute", "1122", "0", "25", "496", null, null, this);
            obj.set_taborder("16");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static10", "absolute", "0", "45", "1147", "15", null, null, this);
            obj.set_taborder("17");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_border("0 none #808080,1 solid #d2020bff");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "71", "1147", "10", null, null, this);
            obj.set_taborder("18");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_border("0 none #808080,1 solid #d2020bff");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1102, 135, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("13");
            		p.set_scrollbars("none");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1147, 496, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("test");
            		p.set_titletext("수수료 이연처리");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTRECommPostpone.xfdl", "lib::comLib.xjs");
        this.registerScript("RTRECommPostpone.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분 : 수금관리 > 수수료 > 수수료 이연처리
         * 02. 그룹명   : RTRECommPostpone.xfdl
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
        		//기준일자 조회
        		this.fn_getInitDate();
        		//버튼초기화
        		this.fn_initBtn();		
        	}
        		 		 
        	/***********************************************************************************
        	* Transaction Function
        	***********************************************************************************/
         	//---------------------------------------------------------------------------------
        	// 기준일자 조회
        	//---------------------------------------------------------------------------------
        	this.fn_getInitDate  = function() {
        		var sSvcID      	= "getToday";  
        	    var sController   	= "/rtms/comm/getToday.do";
        	    var sInDatasets   	= "";
        	    var sOutDatasets  	= "";
        	    var sArgs 			= "";	
        	    var fn_callBack		= "fn_callBack";
        				
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 		
        	
        	}
         	//---------------------------------------------------------------------------------
        	// 수수료 이연처리
        	//---------------------------------------------------------------------------------
        	this.fn_aggregate  = function() {
        	
        		if(nvl(this.div_search.cal_referDate.value) == "") {
        			alert('기준일자를 입력하세요');
        			this.div_search.cal_referDate.setFocus();
        			return;
        		}
        		
        		if(this.fn_valid()) {
        			this.edt_procStatus.set_value("");
        			
        			var sSvcID      	= "commPostpone";  
        			var sController   	= "/ntrms/re/commPostPone.do";
        			var sInDatasets   	= "";
        			var sOutDatasets  	= "";
        			var sArgs 			= "";	
        			var fn_callBack		= "fn_callBack";
        					
        			sArgs += Ex.util.setParam("period"		, nvl(this.div_search.cal_referDate.value).substr(0,6));	//기준일자(마감월)
        					
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
        			if(strSvcId == "commPostpone") {
        				this.edt_procStatus.set_value(strErrorMsg);		
        				return;		
        			}
        			else {
        				return Ex.core.comMsg("alert",strErrorMsg);	
        			}	

        		}
        		switch (strSvcId) 
        		{  
        		    case "getToday":
        		        prevLastDate = this.toDay.substr(0,4)+(this.toDay.substr(4,2)-1);
        		        this.div_search.cal_referDate.set_value(prevLastDate);  //전월				
        		        break;
        			case "commPostpone":
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
        	// 기준일자 변경 이벤트
            //-------------------------------------------------------------------------------  		
        	this.cal_referDate_onchanged = function(obj,e)
        	{
        		var serviceChargeDay = String(this.div_search.cal_referDate.value);
        		
        		var nDiffDay = Eco.date.getDiffDay(serviceChargeDay, this.toDay);
        		
        		if(parseInt(nDiffDay,10) < 0) {
        		
        			alert("기준일자는 현재일 이후 날짜는 입력하실수 없습니다.");
        			this.div_search.cal_referDate.set_value("");
        			this.div_search.cal_referDate.setFocus();
        			return;
        		}	
        	}	
        	//---------------------------------------------------------------------------------
        	// VAILD 체크
        	//---------------------------------------------------------------------------------	
        	this.fn_valid = function () {
        	
        	 var serviceChargeDay = String(this.div_search.cal_referDate.value);
        		
        		var nDiffDay = Eco.date.getDiffDay(serviceChargeDay, this.toDay);
        		
        		if(parseInt(nDiffDay,10) < 0) {
        		
        			alert("기준일자는 현재일 이후 날짜는 입력하실수 없습니다.");
        			this.div_search.cal_referDate.set_value("");
        			this.div_search.cal_referDate.setFocus();
        			return false;
        		}		
        		
        		return true;
        		
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
        		this.parent.setButton("AG",this);			
        	}

        

        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.div_search.cal_referDate.addEventHandler("onchanged", this.cal_referDate_onchanged, this);

        };

        this.loadIncludeScript("RTRECommPostpone.xfdl");

       
    };
}
)();
