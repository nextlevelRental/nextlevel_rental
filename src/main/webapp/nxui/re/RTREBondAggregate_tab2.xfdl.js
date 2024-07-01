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
                this.set_name("RTREBondAggregate_tab2");
                this.set_classname("re00050_cms");
                this.set_titletext("채권관리대상 집계");
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
            obj.set_text("집계년월");
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
            obj = new Edit("edtYear", "absolute", "131", "12", "60", "21", null, null, this.div_search);
            obj.set_taborder("12");
            obj.set_inputtype("digit");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("4");
            obj.set_autoskip("true");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition06", "absolute", "195", "12", "20", "20", null, null, this.div_search);
            obj.set_taborder("13");
            obj.set_text("년");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("edtMonth", "absolute", "221", "12", "40", "21", null, null, this.div_search);
            obj.set_taborder("14");
            obj.set_inputtype("digit");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("2");
            obj.set_autoskip("true");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition07", "absolute", "265", "12", "20", "20", null, null, this.div_search);
            obj.set_taborder("15");
            obj.set_text("월");
            obj.getSetter("domainId").set("nexa.s_condition");
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
            		p.set_titletext("채권관리대상 집계");

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
        this.addIncludeScript("RTREBondAggregate_tab2.xfdl", "lib::comLib.xjs");
        this.registerScript("RTREBondAggregate_tab2.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분 : 채권관리 > 채권대상집계 > [STEP 2] 채권관리대상 집계
         * 02. 그룹명   : RTREBondAggregate_tab2.xfdl
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
        	this.aggrDay	= "";	//집계일자
        	this.procYn		= ""; 	//집계처리가능여부	
        	this.currCunt	= "";	//채권 관리 내역 Count
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
        	// 채권 관리 내역 Count
        	//---------------------------------------------------------------------------------	
        	this.fn_aggregateCnt  = function() {
        		var accReqDate = nvl(this.div_search.edtYear.value) + "" + nvl(this.div_search.edtMonth.value);
        	
        		if(nvl(this.div_search.edtYear.value) == "") {
        			alert('집계년월을 입력하세요.');
        			this.div_search.edtYear.setFocus();
        			return;
        		}
        		if(nvl(this.div_search.edtMonth.value) == "") {
        			alert('집계년월을 입력하세요.');
        			this.div_search.edtMonth.setFocus();
        			return;
        		}	
        			
        		if(parseInt(accReqDate,10) > parseInt(this.nextMonth,10)) 
        		{
        			alert('집계년월은 익월까지만 선택가능합니다.');
        			this.div_search.edtMonth.setFocus();
        			return;
        		}
        					
        		this.procYn = "";			
        		var sSvcID      	= "bondTargetAggregateCnt";  
        		var sController   	= "ntrms/re/bondTargetAggregateCnt.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        				
            	sArgs += Ex.util.setParam("ramgYm"	, accReqDate); //채권관리년월(집계년월)

        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 		

        	}		
         	//---------------------------------------------------------------------------------
        	// 채권관리대상 집계
        	//---------------------------------------------------------------------------------	
        	this.fn_aggregate  = function() {
        	
        		this.edt_procStatus.set_value("");	
        			
        		var accReqDate = nvl(this.div_search.edtYear.value) + "" + nvl(this.div_search.edtMonth.value);
        		
        		if(nvl(this.div_search.edtYear.value) == "") {
        			alert('집계년월을 입력하세요.');
        			this.div_search.edtYear.setFocus();
        			return;
        		}
        		if(nvl(this.div_search.edtMonth.value) == "") {
        			alert('집계년월을 입력하세요.');
        			this.div_search.edtMonth.setFocus();
        			return;
        		}	
        			
        		if(!this.fn_chkYm(this.div_search.edtYear.value, this.div_search.edtMonth.value))
        		{
        			return;
        		}	
        					
        		if(parseInt(accReqDate,10) > parseInt(this.nextMonth,10)) 
        		{
        			alert('집계년월은 익월까지만 선택가능합니다.');
        			this.div_search.edtMonth.setFocus();
        			return;
        		}
        		
        		var returnDate = nvl(this.div_search.edtYear.value) + "/" + nvl(this.div_search.edtMonth.value);
        		if(parseInt(this.currCunt,10) > 0) {
        			if(Ex.core.comMsg("confirm","집계년월 ("+ returnDate + ")의 집계내역이 존재합니다. \n집계하시겠습니까? (집계시 기존집계내역은 삭제됩니다.)"))
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
        				
        		var sSvcID      	= "bondTargetAggregate";  
        		var sController   	= "ntrms/re/bondTargetAggregate.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
            	sArgs += Ex.util.setParam("ramgYm"	, accReqDate); //채권관리년월(집계년월)
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
        			if(strSvcId == "bondTargetAggregate") {
        				this.edt_procStatus.set_value(strErrorMsg);
        				return;
        			}
        			//채권 관리 내역 Count
        			this.fn_aggregateCnt();
        			return Ex.core.comMsg("alert",strErrorMsg);		
        		}
        		
        		switch (strSvcId) 
        		{
        			//월일 조회
        			case "getDayMongth":
        				this.div_search.edtYear.set_value(this.curMonth.substr(0,4));
        				this.div_search.edtMonth.set_value(this.curMonth.substr(4,2));				
        				//채권관리 내역 Count
        				this.fn_aggregateCnt();				
        				break;		
        			//채권 관리 내역 Count
        			case "bondTargetAggregateCnt":
        				if(parseInt(this.currCunt,10) > 0) {
        					this.procYn = "Y";
        				}
        				break;						
        			//채권관리대상 집계
        			case "bondTargetAggregate":
        				this.edt_procStatus.set_value(strErrorMsg);		
        				//채권 관리 내역 Count
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
        	// 집계년월 변경 이벤트
            //-------------------------------------------------------------------------------  	
        	this.cal_accReqDate_onchanged = function(obj,e)
        	{
        		if(nvl(this.div_search.edtMonth.value) != "" && obj.getLength() == 1) {
        			if(parseInt(this.div_search.edtMonth.value,10) < 10) {
        				this.div_search.edtMonth.set_value("0" + obj.value);
        			}
        		}	
        		
        		var accReqDate = nvl(this.div_search.edtYear.value) + "" + nvl(this.div_search.edtMonth.value);

        		if(accReqDate != "") {
        			if(accReqDate.length == 6) {
        				if(!this.fn_chkYm(this.div_search.edtYear.value, this.div_search.edtMonth.value))
        				{
        					return;
        				}
        					
        				if(parseInt(accReqDate,10) > parseInt(this.nextMonth,10)) 
        				{
        					alert('집계년월은 익월까지만 선택가능합니다.');
        					this.div_search.edtMonth.setFocus();	
        					return;
        				}	
        				else {
        					if(accReqDate.length == 6) {
        						//채권 관리 내역 Count
        						this.fn_aggregateCnt();	
        					}
        				}
        			}
        			else {
        				var nYear = nvl(this.div_search.edtYear.value)
        				var nMonth = nvl(this.div_search.edtMonth.value);
        				if(nYear.length < 4) {
        					alert('집계년월을 입력하세요.');
        					this.div_search.edtYear.setFocus();
        					return false;
        				}
        				if(nMonth.length < 2) {
        					alert('집계년월을 입력하세요.');
        					this.div_search.edtMonth.setFocus();
        					return false;
        				}				
        			}
        		}
        		else {
        			if(nvl(this.div_search.edtYear.value) == "") {
        				alert('집계년월을 입력하세요.');
        				this.div_search.edtYear.setFocus();
        				return;
        			}
        			if(nvl(this.div_search.edtMonth.value) == "") {
        				alert('집계년월을 입력하세요.');
        				this.div_search.edtMonth.setFocus();
        				return;
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
        			alert('집계년월을 입력하세요.');
        			this.div_search.edtYear.setFocus();
        			return false;
        		}
        		if(nMonth.length < 2) {
        			alert('집계년월을 입력하세요.');
        			this.div_search.edtMonth.setFocus();
        			return false;
        		}	
        		    
        		if (nYear < 1900 || nYear > 3000)   
        		{ 
        			this.alert("사용할수 없는 집계년월이 입력되었습니다.");
        			this.div_search.edtYear.setFocus();			
        			return false;
        		}   
        	  
        		if (nMonth < 1 || nMonth > 12)   
        		{  
        			this.alert("사용할수 없는 집계년월이 입력되었습니다.");
        			this.div_search.edtMonth.setFocus();			
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
        		this.parent.parent.parent.setButton("AG",this);		
        		this.edt_procStatus.set_value("");
        	}
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.div_search.edtYear.addEventHandler("onchanged", this.cal_accReqDate_onchanged, this);
            this.div_search.edtMonth.addEventHandler("onchanged", this.cal_accReqDate_onchanged, this);
            this.div_search.edtMonth.addEventHandler("canchange", this.edtMonth_canchange, this);

        };

        this.loadIncludeScript("RTREBondAggregate_tab2.xfdl");

       
    };
}
)();
