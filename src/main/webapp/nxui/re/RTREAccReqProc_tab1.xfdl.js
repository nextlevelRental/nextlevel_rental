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
                this.set_name("RTREAccReqProc_tab1");
                this.set_classname("re00050_cms");
                this.set_titletext("[STEP1] 계좌신청대상집계");
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
            obj.set_text("계좌신청일");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_accReqDate", "absolute", "131", "12", "120", "21", null, null, this.div_search);
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
            obj.set_text("결제정보변경일");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_fromGyeoljeil", "absolute", "130", "45", "120", "21", null, null, this.div_search);
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
            obj = new Calendar("cal_toGyeoljeil", "absolute", "284", "45", "120", "21", null, null, this.div_search);
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
            		p.set_titletext("[STEP1] 계좌신청대상집계");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTREAccReqProc_tab1.xfdl", "lib::comLib.xjs");
        this.registerScript("RTREAccReqProc_tab1.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분 : 수금관리 > CMS관리 > 계좌신청처리 > [STEP1] 계좌신청대상집계
         * 02. 그룹명   : RTREAccReqProc_tab1.xfdl
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
        	this.toDay = ""; 	//현재날짜
        	this.toHour = "";	//현재시간
        	this.bfAfDay = "";	//계좌신청일 
        	this.checkDay = "";	//영업일-5
        	this.prevDay = "";  //현재일자-1
        	this.rpcDay = "";  	//결제정보변경일
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
        		//전일(영업일) 조회
        		this.fn_getAccReqDate();
        		//조회조건 체크에 사용할 영업일-5일조회
        		this.fn_getCheckDate();		
        		//결제정보 변경일 조회
        		this.fn_getPayChgDate();			
        		//버튼초기화
        		this.fn_initBtn();		
        	}
        		 		 
        	/***********************************************************************************
        	* Transaction Function
        	***********************************************************************************/
         	//---------------------------------------------------------------------------------
        	// 전일(영업일) 조회
        	//---------------------------------------------------------------------------------
        	this.fn_getAccReqDate  = function() {
        		var sSvcID      	= "getAccReqDate";  
        		var sController   	= "ntrms/re/getAccReqDate.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		sArgs += Ex.util.setParam("serchGb", '-');	
        		sArgs += Ex.util.setParam("days", 1);	
        				
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 		
        	
        	}
         	//---------------------------------------------------------------------------------
        	// 전일(영업일) 조회 -5일
        	//---------------------------------------------------------------------------------
        	this.fn_getCheckDate  = function() {
        		var sSvcID      	= "getCheckDate";  
        		var sController   	= "ntrms/re/getCheckDate.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		sArgs += Ex.util.setParam("serchGb", '-');	
        		sArgs += Ex.util.setParam("days", 5);	
        				
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 		
        	
        	}	
         	//---------------------------------------------------------------------------------
        	// 결제정보 변경일 조회
        	//---------------------------------------------------------------------------------
        	this.fn_getPayChgDate  = function() {
        		var sSvcID      	= "getPayChgDate";  
        		var sController   	= "ntrms/re/getPayChgDate.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 		
        	}	
        	
         	//---------------------------------------------------------------------------------
        	// 집계
        	//---------------------------------------------------------------------------------
        	this.fn_aggregate  = function() {
        	
        		if(nvl(this.div_search.cal_accReqDate.value) == "") {
        			alert('계좌신청일을 입력하세요');
        			this.div_search.cal_accReqDate.setFocus();
        			return;
        		}
        		if(nvl(this.div_search.cal_toGyeoljeil.value) == "") {
        			alert('결제정보변경일을 입력하세요');
        			this.div_search.cal_toGyeoljeil.setFocus();
        			return;
        		}
        					
        		this.edt_procStatus.set_value("");
        		
        		var sSvcID      	= "setAggregate";  
        		var sController   	= "ntrms/re/setAggregate.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		sArgs += Ex.util.setParam("acrqDay"	, nvl(this.div_search.cal_accReqDate.value));		//계좌신청일
        		sArgs += Ex.util.setParam("frRpcDay", nvl(this.div_search.cal_fromGyeoljeil.value));	//결제정보 변경시작일자
        		sArgs += Ex.util.setParam("toRpcDay", nvl(this.div_search.cal_toGyeoljeil.value));		//결제정보 변경종료일자
        				
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
        			if(strSvcId == "setAggregate") {
        				this.edt_procStatus.set_value(strErrorMsg);		
        				return;		
        			}
        			else {
        				return Ex.core.comMsg("alert",strErrorMsg);	
        			}	

        		}
        		
        		switch (strSvcId) 
        		{
        			case "getAccReqDate":
        				//12시이후에는 계좌신청일 세팅 안함
        				if(parseInt(nvl(this.toHour,10)) >= 12) {
        					this.div_search.cal_accReqDate.set_value("");					
        				}
        				else {
        		
        					this.div_search.cal_accReqDate.set_value(this.bfAfDay);
        				}
        				break;
        			case "getCheckDate":
        				break;					
        			case "getPayChgDate":
        				this.div_search.cal_fromGyeoljeil.set_value(this.rpcDay);			
        				//TO일자가 FROM일자보다 작은경우 FROM일자로 세팅
        				if(parseInt(nvl(this.rpcDay) ,10) >= parseInt(nvl(this.prevDay),10)) {
        					this.div_search.cal_toGyeoljeil.set_value(this.rpcDay);				
        				}
        				else {
        					this.div_search.cal_toGyeoljeil.set_value(this.prevDay);
        				}	
        	
        			case "setAggregate":
        				//Ex.core.comMsg("alert",strErrorMsg);			
        				this.edt_procStatus.set_value(strErrorMsg);	
        				break;
        			default:
        				break;
        		}
        	}

        	/***********************************************************************************
        	* Component Event
        	***********************************************************************************/
        	this.cal_accReqDate_onchanged = function(obj,e)
        	{
        		//(영업일 이전5일 ~ 오늘)
        		if(parseInt(this.div_search.cal_accReqDate.value,10) < parseInt(this.checkDay,10) || parseInt(this.div_search.cal_accReqDate.value,10) > parseInt(this.toDay,10)) 
        		{
        			alert('처리할수 없는 계좌신청일입니다.');
        			this.div_search.cal_accReqDate.set_value("");			
        			this.div_search.cal_accReqDate.setFocus();
        			return;			
        		}
        	}	
        	
        	this.cal_toGyeoljeil_onchanged = function(obj,e)
        	{
        		if(parseInt(this.div_search.cal_fromGyeoljeil.value,10) > parseInt(this.div_search.cal_toGyeoljeil.value,10)) 
        		{
        			alert('결제정보변경일 종료일자는 시작일자보다 이전날짜로 입력하실수 없습니다.');
        			this.div_search.cal_toGyeoljeil.set_value("");	
        			this.div_search.cal_toGyeoljeil.setFocus();
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
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.div_search.cal_accReqDate.addEventHandler("onchanged", this.cal_accReqDate_onchanged, this);
            this.div_search.cal_toGyeoljeil.addEventHandler("onchanged", this.cal_toGyeoljeil_onchanged, this);

        };

        this.loadIncludeScript("RTREAccReqProc_tab1.xfdl");

       
    };
}
)();
