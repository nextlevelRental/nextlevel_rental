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
                this.set_name("RTREAccTranProc_tab2");
                this.set_classname("re00050_cms");
                this.set_titletext("[STEP2] 출금이체대상조회");
                this._setFormPosition(0,0,1147,496);
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
            obj._setContents("<ColumnInfo><Column id=\"rcmsday\" type=\"STRING\" size=\"256\"/><Column id=\"rqstStat\" type=\"STRING\" size=\"256\"/><Column id=\"rqstStatNm\" type=\"STRING\" size=\"256\"/><Column id=\"bankCd\" type=\"STRING\" size=\"256\"/><Column id=\"bankNm\" type=\"STRING\" size=\"256\"/><Column id=\"rqcnt\" type=\"STRING\" size=\"256\"/><Column id=\"rqamt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Div("div_search", "absolute", "10", "10", "1102", "45", null, null, this);
            obj.set_taborder("0");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_searchCondition", "absolute", "20", "8", "114", "30", null, null, this.div_search);
            obj.set_taborder("33");
            obj.set_text("출금이체 청구일");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_accReqDate", "absolute", "131", "12", "120", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("34");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_value("null");
            obj = new Static("Static22", "absolute", "1", "0", null, "12", "430", null, this.div_search);
            obj.set_taborder("35");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "0", "0", "20", "45", null, null, this.div_search);
            obj.set_taborder("36");
            obj.set_text("FIX \r\nw20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static44", "absolute", "81", "40", "47", "21", null, null, this.div_search);
            obj.set_taborder("37");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_color("red");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static23", "absolute", "1", "33", null, "12", "430", null, this.div_search);
            obj.set_taborder("38");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "10", "10", "459", null, null, this);
            obj.set_taborder("1");
            obj.set_text("FIX \r\nh10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1112", "10", "10", "459", null, null, this);
            obj.set_taborder("2");
            obj.set_text("FIX \r\nh10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static45", "absolute", "137", "27", "1", "30", null, null, this);
            obj.set_taborder("3");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_background("red");
            this.addChild(obj.name, obj);

            obj = new Static("Static46", "absolute", "142", "27", "1", "30", null, null, this);
            obj.set_taborder("4");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_background("red");
            this.addChild(obj.name, obj);

            obj = new Static("Static47", "absolute", "127", "53", null, "21", "966", null, this);
            obj.set_taborder("5");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_color("red");
            this.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "10", "72", "86", "20", null, null, this);
            obj.set_taborder("6");
            obj.set_text("조회결과");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "10", "87", null, "10", "9", null, this);
            obj.set_taborder("7");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "56", "1122", "20", null, null, this);
            obj.set_taborder("8");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "10", "369", "1127", "20", null, null, this);
            obj.set_taborder("9");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static07", "absolute", "10", "402", "1127", "10", null, null, this);
            obj.set_taborder("10");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static17", "absolute", "10", "412", "1103", "31", null, null, this);
            obj.set_taborder("11");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_procStatus", "absolute", "144", "417", "964", "21", null, null, this);
            obj.set_taborder("12");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static19", "absolute", "10", "412", "130", "31", null, null, this);
            obj.set_taborder("13");
            obj.set_text("작업상태");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_list", "absolute", "10", "97", "1102", "272", null, null, this);
            obj.set_taborder("14");
            obj.set_binddataset("ds_list");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"120\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"100\"/><Column size=\"120\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"30\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"출금이체일자\"/><Cell col=\"1\" text=\"은행코드\"/><Cell col=\"2\" text=\"은행명\"/><Cell col=\"3\" text=\"처리상태\"/><Cell col=\"4\" text=\"건수\"/><Cell col=\"5\" text=\"금액\"/></Band><Band id=\"body\"><Cell displaytype=\"date\" edittype=\"date\" text=\"bind:rcmsday\" calendardisplay=\"edit\" calendardisplaynulltype=\"none\"/><Cell col=\"1\" edittype=\"none\" text=\"bind:bankCd\"/><Cell col=\"2\" text=\"bind:bankNm\"/><Cell col=\"3\" edittype=\"none\" text=\"bind:rqstStatNm\"/><Cell col=\"4\" displaytype=\"number\" style=\"align:right middle;\" text=\"bind:rqcnt\" mask=\"###,###,###,##0\"/><Cell col=\"5\" displaytype=\"number\" style=\"align:right middle;\" text=\"bind:rqamt\" mask=\"###,###,###,##0\"/></Band><Band id=\"summary\"><Cell colspan=\"2\" text=\"총계\"/><Cell col=\"2\" style=\"align:right middle;\"/><Cell col=\"3\" style=\"align:right middle;\"/><Cell col=\"4\" displaytype=\"number\" style=\"align:right middle;\" text=\"expr:comp.parent.ds_list.getSum(&quot;rqcnt&quot;)\" mask=\"###,###,###,##0\"/><Cell col=\"5\" displaytype=\"number\" style=\"align:right middle;\" text=\"expr:comp.parent.ds_list.getSum(&quot;rqamt&quot;)\" mask=\"###,###,###,##0\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "10", "385", null, "20", "1028", null, this);
            obj.set_taborder("15");
            obj.set_text("작업상태");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Button("btn_Confirm", "absolute", "1041", "70", "71", "22", null, null, this);
            obj.set_taborder("16");
            obj.set_text("대상확인");
            obj.set_cssclass("btn_WF_module");
            obj.set_enable("false");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1102, 45, this.div_search,
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
            		p.set_classname("re00050_cms");
            		p.set_titletext("[STEP2] 출금이체대상조회");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTREAccTranProc_tab2.xfdl", "lib::comLib.xjs");
        this.registerScript("RTREAccTranProc_tab2.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분 : 수금관리 > CMS관리 > 출금이체처리 > [STEP2] 출금이체대상조회
         * 02. 그룹명   : RTREAccTranProc_tab1.xfdl
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
        	this.bfAfDay = "";	//출금이체청구일(익일영업일)
        	this.returnMsg 	= ""; 	//대상조회 리턴메세지
        	this.returnCode = "";	//대상조회 리턴코드	
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
        		//출금이체청구일조회(익일영업일)
        		this.fn_getAccReqDate();		
        		//버튼초기화
        		this.fn_initBtn();				
        	} 		
        		 
        	/***********************************************************************************
        	* Transaction Function
        	***********************************************************************************/
         	//---------------------------------------------------------------------------------
        	// 익일(영업일) 조회
        	//---------------------------------------------------------------------------------
        	this.fn_getAccReqDate  = function() {
        		var sSvcID      	= "getAccReqDate";  
        		var sController   	= "ntrms/re/getAccReqDate.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		sArgs += Ex.util.setParam("serchGb", '+');	
        		sArgs += Ex.util.setParam("days", 1);			
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 		
        	}
         	//---------------------------------------------------------------------------------
        	// 출금이체 대상조회
        	//---------------------------------------------------------------------------------		
        	this.fn_search = function()
        	{
        		if(nvl(this.div_search.cal_accReqDate.value) == "") {
        			alert('출금이체 청구일을 입력하세요');
        			this.div_search.cal_accReqDate.setFocus();
        			return;
        		}
        		this.edt_procStatus.set_value("");		
        		var sSvcID      	= "getAccTranTargetList";  
        		var sController   	= "ntrms/re/getAccTranTargetList.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_list=output";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		sArgs += Ex.util.setParam("rcmsDay"	, nvl(this.div_search.cal_accReqDate.value));		
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 	
        	}
        	//---------------------------------------------------------------------------------
        	// 대상확인(전송처리 업무상태 업데이트)
        	//---------------------------------------------------------------------------------	
        	this.fn_saveConfirm = function() {
        		this.edt_procStatus.set_value("");
        		var sSvcID      	= "confirmProc";  
        		var sController   	= "ntrms/re/confirmProc.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		sArgs += Ex.util.setParam("fileTp"	, "EB21");		//송수신파일구분
        		sArgs += Ex.util.setParam("rqstDay"	, nvl(this.ds_list.getColumn(this.ds_list.rowposition,"rcmsday")));		//계좌신청일자	
        		sArgs += Ex.util.setParam("fileNm"	, "EB21" + "" + nvl(this.ds_list.getColumn(this.ds_list.rowposition,"rcmsday")).substr(4,4));		//파일명	
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
        			return Ex.core.comMsg("alert",strErrorMsg);		
        		}
        		
        		switch (strSvcId) 
        		{
        			case "getAccReqDate":
        				//17시이후에는 출금이체청구일 세팅 안함
        				if(parseInt(nvl(this.toHour,10)) >= 17) {
        					this.div_search.cal_accReqDate.set_value("");					
        				}
        				else {
        					this.div_search.cal_accReqDate.set_value(this.bfAfDay);
        				}
        				break;
        			case "getAccTranTargetList":	
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
        	this.cal_accReqDate_onchanged = function(obj,e)
        	{
        		var accReqDate = nvl(this.div_search.cal_accReqDate.value);

        		if(accReqDate != "") {
        			var lastDay =   Eco.date.getLastDayOfMonth(this.bfAfDay);
        			this.validDate = this.bfAfDay.substr(0,6) + "" + lastDay;
        			if(parseInt(accReqDate,10) < this.bfAfDay || parseInt(accReqDate,10) > this.validDate) 
        			{
        				alert('출금이체청구일은 영업일기준 익일에서 말일까지만 선택가능합니다.');
        				this.div_search.cal_accReqDate.set_value("");			
        				this.div_search.cal_accReqDate.setFocus();
        				return;
        			}	
        		}
        		else {
        			alert('출금이체청구일을 입력하세요.');
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
        		this.parent.parent.parent.setButton("S|E",this);
        	}
        	
        	//---------------------------------------------------------------------------------
        	// VAILD 체크
        	//---------------------------------------------------------------------------------	
        	this.fn_valid = function () {
        		var accReqDate = nvl(this.div_search.cal_accReqDate.value);

        		if(accReqDate != "") {
        			var lastDay =   Eco.date.getLastDayOfMonth(this.bfAfDay);
        			this.validDate = this.bfAfDay.substr(0,6) + "" + lastDay;
        			if(parseInt(accReqDate,10) < this.bfAfDay || parseInt(accReqDate,10) > this.validDate) 
        			{
        				alert('출금이체청구일은 영업일기준 익일에서 말일까지만 선택가능합니다.');
        				this.div_search.cal_accReqDate.set_value("");			
        				this.div_search.cal_accReqDate.setFocus();
        				return false;
        			}	
        		}
        		else {
        			alert('출금이체청구일을 입력하세요.');
        			this.div_search.cal_accReqDate.setFocus();
        			return false;
        		}	
        	}
        	
        	this.fn_excel= function() {
        		Ex.core.exportExcel(this, this.grd_list);
        	}
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.div_search.cal_accReqDate.addEventHandler("onchanged", this.cal_accReqDate_onchanged, this);
            this.btn_Confirm.addEventHandler("onclick", this.btn_Confirm_onclick, this);

        };

        this.loadIncludeScript("RTREAccTranProc_tab2.xfdl");

       
    };
}
)();
