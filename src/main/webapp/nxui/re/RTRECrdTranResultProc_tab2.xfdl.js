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
                this.set_name("RTRECrdTranResultProc_tab2");
                this.set_classname("re00050_cms");
                this.set_titletext("[STEP2] 결과파일반영조회");
                this._setFormPosition(0,0,1122,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_list", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"rcrdDay\" type=\"STRING\" size=\"256\"/><Column id=\"cardcomCd\" type=\"STRING\" size=\"256\"/><Column id=\"cardcomNm\" type=\"STRING\" size=\"256\"/><Column id=\"rqstStat\" type=\"STRING\" size=\"256\"/><Column id=\"rqstStatNm\" type=\"STRING\" size=\"256\"/><Column id=\"rqcnt\" type=\"STRING\" size=\"256\"/><Column id=\"rqAmt\" type=\"STRING\" size=\"256\"/><Column id=\"feeAmt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static00", "absolute", "0", "10", "10", "437", null, null, this);
            obj.set_taborder("2");
            obj.set_text("FIX \r\nh10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "10", "72", "86", "20", null, null, this);
            obj.set_taborder("7");
            obj.set_text("조회결과");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "10", "87", null, "10", "9", null, this);
            obj.set_taborder("8");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "10", "337", "1110", "20", null, null, this);
            obj.set_taborder("10");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static07", "absolute", "10", "370", "1112", "14", null, null, this);
            obj.set_taborder("11");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static17", "absolute", "10", "380", "1092", "31", null, null, this);
            obj.set_taborder("12");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_procStatus", "absolute", "144", "385", "953", "21", null, null, this);
            obj.set_taborder("13");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static19", "absolute", "10", "380", "130", "31", null, null, this);
            obj.set_taborder("14");
            obj.set_text("작업상태");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "10", "353", null, "20", "1028", null, this);
            obj.set_taborder("16");
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

            obj = new Static("Static04", "absolute", "0", "0", "1122", "10", null, null, this);
            obj.set_taborder("20");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1112", "10", "10", "437", null, null, this);
            obj.set_taborder("21");
            obj.set_text("FIX \r\nh10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Button("btn_Confirm", "absolute", "1031", "70", "71", "22", null, null, this);
            obj.set_taborder("17");
            obj.set_text("확인완료");
            obj.set_enable("false");
            obj.set_cssclass("btn_WF_module");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "10", "10", "1102", "45", null, null, this);
            obj.set_taborder("26");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_searchCondition", "absolute", "20", "8", "114", "30", null, null, this.div_search);
            obj.set_taborder("0");
            obj.set_text("카드이체일");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_accReqDate", "absolute", "131", "12", "120", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("1");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Static("Static22", "absolute", "1", "0", null, "12", "430", null, this.div_search);
            obj.set_taborder("2");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "0", "0", "20", "45", null, null, this.div_search);
            obj.set_taborder("3");
            obj.set_text("FIX \r\nw20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static44", "absolute", "81", "40", "47", "21", null, null, this.div_search);
            obj.set_taborder("4");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_color("red");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static23", "absolute", "1", "33", null, "12", "430", null, this.div_search);
            obj.set_taborder("5");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static45", "absolute", "137", "27", "1", "30", null, null, this);
            obj.set_taborder("27");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_background("red");
            this.addChild(obj.name, obj);

            obj = new Static("Static46", "absolute", "142", "27", "1", "30", null, null, this);
            obj.set_taborder("28");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_background("red");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_list", "absolute", "10", "97", "1102", "272", null, null, this);
            obj.set_taborder("29");
            obj.set_binddataset("ds_list");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"120\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"100\"/><Column size=\"120\"/><Column size=\"100\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"30\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"카드이체일자\"/><Cell col=\"1\" text=\"카드사코드\"/><Cell col=\"2\" text=\"카드사명\"/><Cell col=\"3\" text=\"이체결과\"/><Cell col=\"4\" text=\"건수\"/><Cell col=\"5\" text=\"금액\"/><Cell col=\"6\" text=\"수수료\"/></Band><Band id=\"body\"><Cell displaytype=\"date\" text=\"bind:rcrdDay\" calendardisplay=\"edit\" calendardisplaynulltype=\"none\"/><Cell col=\"1\" edittype=\"none\" text=\"bind:cardcomCd\"/><Cell col=\"2\" text=\"bind:cardcomNm\"/><Cell col=\"3\" edittype=\"none\" text=\"bind:rqstStatNm\"/><Cell col=\"4\" displaytype=\"number\" style=\"align:right middle;\" text=\"bind:rqcnt\" mask=\"###,###,###,##0\"/><Cell col=\"5\" displaytype=\"number\" style=\"align:right middle;\" text=\"bind:rqAmt\" mask=\"###,###,###,##0\"/><Cell col=\"6\" displaytype=\"number\" style=\"align:right middle;\" text=\"bind:feeAmt\" mask=\"###,###,###,##0\"/></Band><Band id=\"summary\"><Cell colspan=\"2\" text=\"총계\"/><Cell col=\"2\" style=\"align:right middle;\"/><Cell col=\"3\" style=\"align:right middle;\"/><Cell col=\"4\" displaytype=\"number\" style=\"align:right middle;\" text=\"expr:comp.parent.ds_list.getSum(&quot;rqcnt&quot;)\" mask=\"###,###,###,##0\"/><Cell col=\"5\" displaytype=\"number\" style=\"align:right middle;\" text=\"expr:comp.parent.ds_list.getSum(&quot;rqAmt&quot;)\" mask=\"###,###,###,##0\"/><Cell col=\"6\" displaytype=\"number\" style=\"align:right middle;\" text=\"expr:comp.parent.ds_list.getSum(&quot;feeAmt&quot;)\" mask=\"###,###,###,##0\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1102, 45, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("26");
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
            		p.set_titletext("[STEP2] 결과파일반영조회");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTRECrdTranResultProc_tab2.xfdl", "lib::comLib.xjs");
        this.registerScript("RTRECrdTranResultProc_tab2.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분 : 수금관리 > 카드이체관리 > 카드이체 결과처리 > [STEP2] 결과파일반영조회
         * 02. 그룹명   : RTRECrdTranResultProc_tab2.xfdl
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
        	this.bfAfDay 	= "";	//카드이체일
        	this.returnMsg 	= ""; 	//계좌신청대상조회 리턴메세지
        	this.returnCode = "";	//계좌신청대상조회 리턴코드
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
        		this.ds_list.clearData();	
        		//전일(영업일) 조회
        		this.fn_getAccReqDate();		
        		//오늘날짜조회
        		this.fn_getToday();		
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
        	//---------------------------------------------------------------------------------
        	// 결과파일 반영조회
        	//---------------------------------------------------------------------------------		
        	this.fn_search = function()
        	{
        		if(nvl(this.div_search.cal_accReqDate.value) == "") {
        			alert('카드이체일을 입력하세요');
        			this.div_search.cal_accReqDate.setFocus();
        			return;
        		}
        	
        		this.edt_procStatus.set_value("");		
        		var sSvcID      	= "getCrdTranTargetList";  
        		var sController   	= "ntrms/re/getCrdTranTargetList.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_list=output";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		sArgs += Ex.util.setParam("rcrdDay"	, nvl(this.div_search.cal_accReqDate.value));		
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 	
        				
        	}
        	
        //지정된 날짜에 하루다음날
        this.RE_todayAddDate = function(day) {
        	var sToday = "";
        	var tmp = day.substring(0, 4) + "-" + day.substring(4, 6) + "-" + day.substring(6, 8);
        	var objDate = new Date(tmp);
        	objDate.addDate(1);
        	var sToday  = objDate.getFullYear() + "";
        	var sMonth = objDate.getMonth() + 1;
        	var sDate = objDate.getDate();
        	
        	if(sMonth.toString().length == 1){
        	  sMonth = "0" + sMonth;
        	}
        	if(sDate.toString().length == 1){
        	  sDate = "0" + sDate;
        	}
        	sToday = sToday+sMonth+sDate;   
        	return sToday;
        }
        	
        	//---------------------------------------------------------------------------------
        	// 확인완료(전송처리 업무상태 업데이트)
        	//---------------------------------------------------------------------------------	
        	this.fn_saveConfirm = function() {
        		this.edt_procStatus.set_value("");
        		var tmpDt = nvl(this.div_search.cal_accReqDate.value);
        		var sSvcID      	= "confirmProc";  
        		var sController   	= "ntrms/re/confirmProc.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		sArgs += Ex.util.setParam("fileTp"	, "BC02_OUT");		//송수신파일구분
        		//sArgs += Ex.util.setParam("rqstDay"	, nvl(this.ds_list.getColumn(this.ds_list.rowposition,"rcrdday")));		//카드이체일
        		sArgs += Ex.util.setParam("rqstDay"	, tmpDt);		//카드이체일
        		//sArgs += Ex.util.setParam("fileNm"	, "KCP_BATCH_FILE_BC02_INX_V5407_" + "" + nvl(this.ds_list.getColumn(this.ds_list.rowposition,"rcrdday")));		//파일명	
        		
        		var fileDt = this.RE_todayAddDate(tmpDt);
        		sArgs += Ex.util.setParam("fileNm"	, "KCP_BACH_FILE_BC02_OUT_V5407_" + "" + fileDt);		//파일명	
        		sArgs += Ex.util.setParam("cnfStep"	, "CONF");		//송신처리단계
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
        			if(strSvcId = "confirmProc") {
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
        				//17시이후에는 카드이체일 세팅 안함
        				if(parseInt(nvl(this.toHour,10)) >= 17) {
        					this.div_search.cal_accReqDate.set_value("");					
        				}
        				else {
        					this.div_search.cal_accReqDate.set_value(this.bfAfDay);
        				}
        				break;		
        			case "getCrdTranTargetList":	
        				this.edt_procStatus.set_value(nexacro._replaceAll(this.returnMsg, "&#32;", " "));

        				if(this.ds_list.rowcount > 0) {
        					if(this.returnCode == 0) {
        						this.btn_Confirm.set_enable(true);
        					} 
        					else {
        						this.btn_Confirm.set_enable(false);
        					}
        				}
        				else {
        					this.grd_list.set_nodatatext("조회된 결과가 없습니다.");				
        				}
        				break;			
        			case "confirmProc":
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
        	// 카드이체일 변경 이벤트
        	//-------------------------------------------------------------------------------  	
        	this.cal_accReqDate_onchanged = function(obj,e)
        	{
        		var accReqDate = nvl(this.div_search.cal_accReqDate.value);

        		if(accReqDate != "") {
        			if(parseInt(this.div_search.cal_accReqDate.value,10) >= this.toDay) 
        			{
        				alert('카드이체일은 당일이전 일자만 가능합니다.');
        				this.div_search.cal_accReqDate.set_value("");			
        				this.div_search.cal_accReqDate.setFocus();
        				return;
        			}	
        		}
        		else {
        			alert('카드이체일을 입력하세요.');
        			this.div_search.cal_accReqDate.setFocus();			
        		}
        	}	
        	//-------------------------------------------------------------------------------  	
        	// 확인완료 클릭 이벤트
        	//-------------------------------------------------------------------------------  	
        	this.btn_Confirm_onclick = function(obj,e)
        	{
        		this.fn_saveConfirm();
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
        		this.parent.parent.parent.setButton("E|S",this);
        	}
        	
        	this.fn_excel= function() {
        		Ex.core.exportExcel(this, this.grd_list);
        	}
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.btn_Confirm.addEventHandler("onclick", this.btn_Confirm_onclick, this);
            this.div_search.cal_accReqDate.addEventHandler("onchanged", this.cal_accReqDate_onchanged, this);

        };

        this.loadIncludeScript("RTRECrdTranResultProc_tab2.xfdl");

       
    };
}
)();
