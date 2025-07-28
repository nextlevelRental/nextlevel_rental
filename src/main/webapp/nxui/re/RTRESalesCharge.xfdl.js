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
                this.set_name("RTRESaleCharge");
                this.set_classname("test");
                this.set_titletext("판매수수료 기초집계");
                this._setFormPosition(0,0,1147,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize

            
            // UI Components Initialize
            obj = new Radio("Radio01", "absolute", "1208", "337", "280", "50", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("0");

            obj = new Radio("Radio00", "absolute", "1174", "170", "280", "50", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("1");

            obj = new Static("Static45", "absolute", "137", "27", "1", "30", null, null, this);
            obj.set_taborder("4");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_background("red");
            this.addChild(obj.name, obj);

            obj = new Static("Static46", "absolute", "142", "27", "1", "30", null, null, this);
            obj.set_taborder("9");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_background("red");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "0", "0", "1122", "107", null, null, this);
            obj.set_taborder("14");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_searchCondition", "absolute", "20", "10", "100", "30", null, null, this.div_search);
            obj.set_taborder("110");
            obj.set_text("기준일자");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_referDate", "absolute", "120", "10", "120", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("111");
            obj.set_dateformat("yyyy-MM");
            obj.set_editformat("yyyy-MM");
            obj = new Static("Static22", "absolute", "0", "0", "1118", "10", null, null, this.div_search);
            obj.set_taborder("112");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "0", "0", "20", "103", null, null, this.div_search);
            obj.set_taborder("113");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static23", "absolute", "0", "31", "1118", "10", null, null, this.div_search);
            obj.set_taborder("114");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "0", "62", "1118", "10", null, null, this.div_search);
            obj.set_taborder("115");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "0", "93", "1118", "10", null, null, this.div_search);
            obj.set_taborder("116");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static17", "absolute", "0", "142", "1122", "31", null, null, this);
            obj.set_taborder("15");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_procStatus", "absolute", "134", "147", "982", "21", null, null, this);
            obj.set_taborder("16");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static19", "absolute", "0", "142", "130", "31", null, null, this);
            obj.set_taborder("17");
            obj.set_text("작업상태");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "0", "118", "100", "20", null, null, this);
            obj.set_taborder("18");
            obj.set_text("작업상태");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Radio("rdo_svrPos", "absolute", "20", "72", "135", "21", null, null, this);
            this.addChild(obj.name, obj);
            var rdo_svrPos_innerdataset = new Dataset("rdo_svrPos_innerdataset", this.rdo_svrPos);
            rdo_svrPos_innerdataset._setContents("<ColumnInfo><Column id=\"codecolumn\" size=\"256\"/><Column id=\"datacolumn\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"codecolumn\">1</Col><Col id=\"datacolumn\">오픈몰</Col></Row></Rows>");
            obj.set_innerdataset(rdo_svrPos_innerdataset);
            obj.set_taborder("22");
            obj.set_codecolumn("codecolumn");
            obj.set_datacolumn("datacolumn");
            obj.set_value("0");

            obj = new Radio("rdo_locPos", "absolute", "20", "41", "198", "21", null, null, this);
            this.addChild(obj.name, obj);
            var rdo_locPos_innerdataset = new Dataset("rdo_locPos_innerdataset", this.rdo_locPos);
            rdo_locPos_innerdataset._setContents("<ColumnInfo><Column id=\"codecolumn\" size=\"256\"/><Column id=\"datacolumn\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"codecolumn\">1</Col><Col id=\"datacolumn\">대리점, 방판, 타이어뱅크</Col></Row></Rows>");
            obj.set_innerdataset(rdo_locPos_innerdataset);
            obj.set_taborder("23");
            obj.set_codecolumn("codecolumn");
            obj.set_datacolumn("datacolumn");
            obj.set_value("1");
            obj.set_index("0");

            obj = new Static("Static10", "absolute", "0", "107", "1147", "15", null, null, this);
            obj.set_taborder("24");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_border("0 none #808080,1 solid #d2020bff");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1122", "0", "25", "496", null, null, this);
            obj.set_taborder("25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "133", "1147", "10", null, null, this);
            obj.set_taborder("26");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_border("0 none #808080,1 solid #d2020bff");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1102, 135, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("14");
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
            		p.set_titletext("판매수수료 기초집계");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTRESalesCharge.xfdl", "lib::comLib.xjs");
        this.registerScript("RTRESalesCharge.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분 : 수금관리 > 수수료 > 판매수수료 기초집계
         * 02. 그룹명   : RTRESalesCharge.xfdl
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
        	this.form_onload  = function(obj,e)
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
        	// 판매수수료 기초집계
        	//---------------------------------------------------------------------------------
        	this.fn_aggregate  = function() {
        	    this.edt_procStatus.set_value("");
        	    
        		if(nvl(this.div_search.cal_referDate.value) == "") {
        			alert('기준일자를 입력하세요');
        			this.div_search.cal_referDate.setFocus();
        			return;
        		}
        		  
        		    if(this.rdo_locPos.value == "1") {
        				var sSvcID      	= "rtreAgencyComm";  
        				var sController   	= "/ntrms/re/rtreAgencyComm.do";
        				var sInDatasets   	= "";
        				var sOutDatasets  	= "";
        				var sArgs 			= "";	
        				var fn_callBack		= "fn_callBack";
        				
        				sArgs += Ex.util.setParam("period"		, nvl(this.div_search.cal_referDate.value).substr(0,6));	//기준일자(마감월)
        				
        			    Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        	        
        	        } else if(this.rdo_svrPos.value == "1") {
        				var sSvcID      	= "rtreMallComm";  
        				var sController   	= "/ntrms/re/rtreMallComm.do";
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
        			if(strSvcId == "rtreAgencyComm") {
        				this.edt_procStatus.set_value(strErrorMsg);		
        				return;		
        			}
        			else if(strSvcId == "rtreMallComm") {
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
        		        this.div_search.cal_referDate.set_value(prevLastDate);			//전월	
        		        break;
        			case "rtreAgencyComm":
        				this.edt_procStatus.set_value(strErrorMsg);	
        				break;
        			case "rtreMallComm":
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
        	
        	//-------------------------------------------------------------------------------  	
        	// 대리점, 방판, 타이어뱅크 이벤트
            //------------------------------------------------------------------------------- 	
        	this.rdo_locPos_onitemclick = function(obj,e)
        	{
        	    this.edt_procStatus.set_value("");  
        	    
        	    this.rdo_locPos.set_value("1");		
        		this.rdo_svrPos.set_value("0");
        	  }

        	//-------------------------------------------------------------------------------  	
        	// 오픈몰 이벤트
            //------------------------------------------------------------------------------- 	
        	this.rdo_svrPos_onitemclick = function(obj,e)
        	{ 
        	    this.edt_procStatus.set_value("");  
        	    
        	    this.rdo_locPos.set_value("0");		
        		this.rdo_svrPos.set_value("1");    
        		 
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
            this.rdo_svrPos.addEventHandler("onitemclick", this.rdo_svrPos_onitemclick, this);
            this.rdo_locPos.addEventHandler("onitemclick", this.rdo_locPos_onitemclick, this);

        };

        this.loadIncludeScript("RTRESalesCharge.xfdl");

       
    };
}
)();
