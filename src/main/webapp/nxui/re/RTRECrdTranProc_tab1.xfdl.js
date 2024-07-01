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
                this.set_name("RTRECrdTranProc_tab1");
                this.set_classname("re00050_cms");
                this.set_titletext("[STEP1] 카드이체대상집계");
                this._setFormPosition(0,0,1147,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_R006", this);
            obj.set_firefirstcount("0");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_list", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"payDd\" type=\"STRING\" size=\"2\"/><Column id=\"curCharge\" type=\"STRING\" size=\"1\"/><Column id=\"delayCharge\" type=\"STRING\" size=\"1\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static17", "absolute", "10", "262", "1102", "31", null, null, this);
            obj.set_taborder("15");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static19", "absolute", "10", "262", "130", "31", null, null, this);
            obj.set_taborder("0");
            obj.set_text("작업상태");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "10", "235", "84", "20", null, null, this);
            obj.set_taborder("1");
            obj.set_text("작업상태");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_procStatus", "absolute", "144", "267", "963", "21", null, null, this);
            obj.set_taborder("2");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_list", "absolute", "10", "96", "1102", "123", null, null, this);
            obj.set_taborder("3");
            obj.set_binddataset("ds_list");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"120\"/><Column size=\"120\"/><Column size=\"120\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"결제일\"/><Cell col=\"1\" text=\"당월청구\"/><Cell col=\"2\" text=\"연체청구\"/></Band><Band id=\"body\"><Cell displaytype=\"combo\" text=\"bind:payDd\" combodataset=\"ds_R006\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"1\" displaytype=\"checkbox\" edittype=\"checkbox\" text=\"bind:curCharge\"/><Cell col=\"2\" displaytype=\"checkbox\" edittype=\"checkbox\" text=\"bind:delayCharge\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static08", "absolute", "10", "252", "1103", "10", null, null, this);
            obj.set_taborder("4");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static07", "absolute", "10", "219", "1102", "20", null, null, this);
            obj.set_taborder("5");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "0", "56", "1122", "20", null, null, this);
            obj.set_taborder("6");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "10", "87", null, "10", "9", null, this);
            obj.set_taborder("7");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "10", "72", "120", "20", null, null, this);
            obj.set_taborder("8");
            obj.set_text("결제일 청구 기준");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static47", "absolute", "127", "53", null, "21", "966", null, this);
            obj.set_taborder("9");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_color("red");
            this.addChild(obj.name, obj);

            obj = new Static("Static46", "absolute", "142", "27", "1", "30", null, null, this);
            obj.set_taborder("10");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_background("red");
            this.addChild(obj.name, obj);

            obj = new Static("Static45", "absolute", "137", "27", "1", "30", null, null, this);
            obj.set_taborder("11");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_background("red");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "1112", "10", "10", "459", null, null, this);
            obj.set_taborder("12");
            obj.set_text("FIX \r\nh10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "10", "10", "459", null, null, this);
            obj.set_taborder("13");
            obj.set_text("FIX \r\nh10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "10", "10", "1102", "45", null, null, this);
            obj.set_taborder("14");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_searchCondition", "absolute", "20", "8", "114", "30", null, null, this.div_search);
            obj.set_taborder("51");
            obj.set_text("카드이체 청구일");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_accReqDate", "absolute", "131", "12", "120", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("52");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_value("null");
            obj = new Static("Static22", "absolute", "1", "0", null, "12", "430", null, this.div_search);
            obj.set_taborder("53");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "0", "0", "20", "45", null, null, this.div_search);
            obj.set_taborder("54");
            obj.set_text("FIX \r\nw20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static44", "absolute", "81", "40", "47", "21", null, null, this.div_search);
            obj.set_taborder("55");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_color("red");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static23", "absolute", "1", "33", null, "12", "430", null, this.div_search);
            obj.set_taborder("56");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1102, 45, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("14");
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
            		p.set_classname("re00050_cms");
            		p.set_titletext("[STEP1] 카드이체대상집계");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTRECrdTranProc_tab1.xfdl", "lib::comLib.xjs");
        this.registerScript("RTRECrdTranProc_tab1.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분 : 수금관리 > 카드이체관리 > 카드이체처리 > [STEP1] 카드이체대상집계
         * 02. 그룹명   : RTRECrdTranProc_tab1.xfdl
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
        	this.toDay 		= ""; 	//현재날짜
        	this.toHour 	= "";	//현재시간
        	this.validDate 	= "";	
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
        		//오늘날짜조회
        		this.fn_getToday();
        		//공통코드조회
        		this.fn_getCommCode();
        		//버튼초기화
        		this.fn_initBtn();			
        	} 		 
        	/***********************************************************************************
        	* Transaction Function
        	***********************************************************************************/
            //-------------------------------------------------------------------------------  	
        	//오늘날짜 조회
            //-------------------------------------------------------------------------------  	
        	this.fn_getToday = function() 
        	{
        		var sSvcID      	= "getToday";  
        		var sController   	= "/rtms/comm/getToday.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";

        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 	
        	}		
            //-------------------------------------------------------------------------------  	
        	//공통코드 조회
            //-------------------------------------------------------------------------------  	
        	this.fn_getCommCode = function() 
        	{
        		var sSvcID      	= "getCommCode";  
        		var sController   	= "ntrms/re/getCrdTranCommCode.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_R006=outputR006";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 	
        	}	
         	//---------------------------------------------------------------------------------
        	// 집계
        	//---------------------------------------------------------------------------------
        	this.fn_aggregate  = function() {
        		
        		if(nvl(this.div_search.cal_accReqDate.value) == "") {
        			alert('카드이체청구일을 입력하세요');
        			this.div_search.cal_accReqDate.setFocus();
        			return;
        		}
        		
        		var rqstDay = nvl(this.div_search.cal_accReqDate.value);
        		var stdexDd 	= "";
        		var curCharge 	= "";
        		var delayCharge = "";
        				
        		for(var i=0; i<this.ds_list.rowcount; i++) {
        			curCharge   = this.ds_list.getColumn(i,"curCharge") == "0" ? "N" : "Y";
        			delayCharge = this.ds_list.getColumn(i,"delayCharge") == "0" ? "N" : "Y";
        			stdexDd += this.ds_list.getColumn(i,"payDd") + "" + curCharge + "" + delayCharge;
        		}
        		
        		this.edt_procStatus.set_value("");
        		
        		var sSvcID      	= "crdTranAggregate";  
        		var sController   	= "ntrms/re/crdTranAggregate.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";

        		sArgs += Ex.util.setParam("rqstDay"	, rqstDay);		//카드이체일자
        		sArgs += Ex.util.setParam("stdexDd"	, stdexDd);		//결제일청구기준데이터
        		sArgs += Ex.util.setParam("pydmaYn"	, 'N');			//제외건존재여부
        				
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
        			if(strSvcId == "crdTranAggregate") {
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
        				//17시이후에는 출금이체청구일 세팅 안함
        				if(parseInt(nvl(this.toHour,10)) >= 17) {
        					this.div_search.cal_accReqDate.set_value("");					
        				}
        				else {
        					//카드이체청구일은 당일로 세팅
        					this.div_search.cal_accReqDate.set_value(this.toDay);
        				}				
        				break;
        			case "getCommCode":
        				this.ds_list.clearData();
        				this.ds_list.set_enableevent(false);
        				for(var i=0; i<this.ds_R006.rowcount; i++) {
        					this.ds_list.addRow();
        					this.ds_list.setColumn(i,"payDd"		, this.ds_R006.getColumn(i,"cd"));
        					this.ds_list.setColumn(i,"curCharge"	, 1);
        					this.ds_list.setColumn(i,"delayCharge"	, 1);
        				}
        				this.ds_list.set_enableevent(true);	
        				this.ds_list.set_rowposition(0);
        				break;	
        			case "crdTranAggregate":	
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
        		var accReqDate = nvl(this.div_search.cal_accReqDate.value);

        		if(accReqDate != "") {
        			if(parseInt(accReqDate,10) != this.toDay) 
        			{
        				alert('카드이체청구일은 당일만 선택가능합니다.');
        				this.div_search.cal_accReqDate.set_value("");			
        				this.div_search.cal_accReqDate.setFocus();
        				return;
         			}	
        		}
        		else {
        			alert('카드이체청구일을 입력하세요.');
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
        	}
        	
        	//---------------------------------------------------------------------------------
        	// VAILD 체크
        	//---------------------------------------------------------------------------------	
        	this.fn_valid = function () {
        	
        		this.fn_getToday();

        		var accReqDate = nvl(this.div_search.cal_accReqDate.value);

        		if(accReqDate != "") {
        			if(parseInt(accReqDate,10) != this.toDay) 
        			{
        				alert('카드이체청구일은 당일만 선택가능합니다.');
        				this.div_search.cal_accReqDate.set_value("");			
        				this.div_search.cal_accReqDate.setFocus();
        				return;
        			}	
        		}
        		else {
        			alert('카드이체청구일을 입력하세요.');
        			this.div_search.cal_accReqDate.setFocus();			
        		}
        	}
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.grd_list.addEventHandler("oncellclick", this.grd_list_oncellclick, this);
            this.div_search.cal_accReqDate.addEventHandler("onchanged", this.cal_accReqDate_onchanged, this);

        };

        this.loadIncludeScript("RTRECrdTranProc_tab1.xfdl");

       
    };
}
)();
