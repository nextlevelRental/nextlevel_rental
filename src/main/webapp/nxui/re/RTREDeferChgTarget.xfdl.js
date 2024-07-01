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
                this.set_name("RTREDeferChgTarget");
                this.set_classname("test_form");
                this.set_titletext("이연처리 변경대상 적용");
                this._setFormPosition(0,0,1147,496);
            }
            this.style.set_color("#333333ff");

            
            // Object(Dataset, ExcelExportObject) Initialize

            
            // UI Components Initialize
            obj = new Static("Static01", "absolute", "1122", "0", "25", "496", null, null, this);
            obj.set_taborder("13");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "0", "0", "1122", "50", null, null, this);
            obj.set_taborder("0");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("Static22", "absolute", "1", "0", null, "12", "430", null, this.div_search);
            obj.set_taborder("9");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "0", "0", "20", "45", null, null, this.div_search);
            obj.set_taborder("10");
            obj.set_text("FIX \r\nw20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static23", "absolute", "1", "33", null, "12", "430", null, this.div_search);
            obj.set_taborder("12");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static24", "absolute", "346", "0", "30", "44", null, null, this.div_search);
            obj.set_taborder("18");
            obj.set_text("FIX w30");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition", "absolute", "20", "8", "114", "30", null, null, this.div_search);
            obj.set_taborder("27");
            obj.set_text("마감월");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("edtYear", "absolute", "131", "12", "60", "21", null, null, this.div_search);
            obj.set_taborder("0");
            obj.set_inputtype("digit");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("4");
            obj.set_autoskip("true");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition06", "absolute", "195", "12", "20", "20", null, null, this.div_search);
            obj.set_taborder("29");
            obj.set_text("년");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("edtMonth", "absolute", "221", "12", "40", "21", null, null, this.div_search);
            obj.set_taborder("1");
            obj.set_inputtype("digit");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("2");
            obj.set_autoskip("true");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition07", "absolute", "265", "12", "20", "20", null, null, this.div_search);
            obj.set_taborder("31");
            obj.set_text("월");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "0", "130", "1112", "20", null, null, this);
            obj.set_taborder("14");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static07", "absolute", "0", "89", "1112", "12", null, null, this);
            obj.set_taborder("15");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static17", "absolute", "0", "99", "1122", "31", null, null, this);
            obj.set_taborder("16");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_procStatus", "absolute", "134", "104", "983", "21", null, null, this);
            obj.set_taborder("17");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static19", "absolute", "0", "99", "130", "31", null, null, this);
            obj.set_taborder("18");
            obj.set_text("작업상태");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "0", "72", null, "20", "1036", null, this);
            obj.set_taborder("19");
            obj.set_text("작업상태");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1122, 50, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("0");
            		p.set_text("Div00");
            		p.set_scrollbars("none");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1147, 496, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("test_form");
            		p.set_titletext("이연처리 변경대상 적용");
            		p.style.set_color("#333333ff");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item16","div_search.edtYear","value","ds_chgInfo","expireY");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item17","div_search.edtMonth","value","ds_chgInfo","expireM");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTREDeferChgTarget.xfdl", "lib::comLib.xjs");
        this.registerScript("RTREDeferChgTarget.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분 : 수금관리 > 마감관리 > 이연처리 변경대상 적용
         * 02. 그룹명   : RTREDeferChgTarget.xfdl
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
        	// 집계
        	//---------------------------------------------------------------------------------		
        	this.fn_aggregate  = function() {
        		this.edt_procStatus.set_value("");
        		this.closingYm = nvl(this.div_search.edtYear.value) + "" + nvl(this.div_search.edtMonth.value);
        		
        		if(nvl(this.div_search.edtYear.value) == "") {
        			alert('마감월을 입력하세요.');
        			this.div_search.edtYear.setFocus();
        			return;
        		}
        		if(nvl(this.div_search.edtMonth.value) == "") {
        			alert('마감월을 입력하세요.');
        			this.div_search.edtMonth.setFocus();
        			return;
        		}	
        			
        		if(!this.fn_chkYm(this.div_search.edtYear.value, this.div_search.edtMonth.value))
        		{
        			return;
        		}	
        			
        		var sSvcID      	= "deferChgTargetAggregate";  
        		var sController   	= "ntrms/re/deferChgTargetAggregate.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        								
        		sArgs += Ex.util.setParam("period"		, this.closingYm); //마감월

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
        			if(strSvcId == "deferChgTargetAggregate") {
        				this.edt_procStatus.set_value(strErrorMsg);
        				return;
        			}		
        			return Ex.core.comMsg("alert",strErrorMsg);		
        		}
        		
        		switch (strSvcId) 
        		{
        			//월일 조회
        			case "getDayMongth":
        				this.div_search.edtYear.set_value(this.prevMonth.substr(0,4));
        				this.div_search.edtMonth.set_value(this.prevMonth.substr(4,2));	
        				break;	
        			//집계		
        			case "deferChgTargetAggregate":		
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
        	// 대상년월 변경 이벤트
            //-------------------------------------------------------------------------------  	
        	this.cal_accReqDate_onchanged = function(obj,e)
        	{
        		if(nvl(this.div_search.edtMonth.value) != "" && obj.getLength() == 1) {
        			if(parseInt(this.div_search.edtMonth.value,10) < 10) {
        				this.div_search.edtMonth.set_value("0" + obj.value);
        			}
        		}	
        		
        		this.closingYm = nvl(this.div_search.edtYear.value) + "" + nvl(this.div_search.edtMonth.value);

        		if(this.closingYm != "") {
        			if(this.closingYm.length == 6) {
        				if(!this.fn_chkYm(this.div_search.edtYear.value, this.div_search.edtMonth.value))
        				{
        					return;
        				}
        				else {
        				}
        			}
        			else {
        				var nYear = nvl(this.div_search.edtYear.value);
        				var nMonth = nvl(this.div_search.edtMonth.value);
        				if(nYear.length < 4) {
        					alert('마감월을 입력하세요.');
        					this.div_search.edtYear.setFocus();
        					return false;
        				}
        				if(nMonth.length < 2) {
        					alert('마감월을 입력하세요.');
        					this.div_search.edtMonth.setFocus();
        					return false;
        				}				
        			}
        		}
        	}		
        		
        	/***********************************************************************************
        	* User Function
        	***********************************************************************************/
            //-------------------------------------------------------------------------------   
            // 존재하는 날자(유효한 날자) 인지 체크   
            //-------------------------------------------------------------------------------   
            this.fn_chkYm = function(nYear,nMonth) 
            {
        		if(nYear.length < 4) {
        			alert('마감월을 입력하세요.');
        			this.div_search.edtYear.setFocus();
        			return false;
        		}
        		if(nMonth.length < 2) {
        			alert('마감월을 입력하세요.');
        			this.div_search.edtMonth.setFocus();
        			return false;
        		}	
        		    
        		if (nYear < 1900 || nYear > 3000)   
        		{ 
        			this.alert("사용할수 없는 마감월이 입력되었습니다.");
        			this.div_search.edtYear.setFocus();			
        			return false;
        		}   
        	  
        		if (nMonth < 1 || nMonth > 12)   
        		{  
        			this.alert("사용할수 없는 마감월이 입력되었습니다.");
        			this.div_search.edtMonth.setFocus();			
        			return false;		
        		}  
        		
        		var yyyymm = nYear + "" + nMonth;
        		
        		if(parseInt(yyyymm,10) > parseInt(this.curMonth,10)) {
        			alert("현재이후년월로 집계할수 없습니다.");
        			return false;
        		}
        		return true;
            }	

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
            this.div_search.edtYear.addEventHandler("onchanged", this.cal_accReqDate_onchanged, this);
            this.div_search.edtMonth.addEventHandler("onchanged", this.cal_accReqDate_onchanged, this);

        };

        this.loadIncludeScript("RTREDeferChgTarget.xfdl");

       
    };
}
)();
