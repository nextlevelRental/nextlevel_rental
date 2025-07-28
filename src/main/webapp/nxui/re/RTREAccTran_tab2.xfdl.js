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
                this.set_name("RTREAccTran_tab2");
                this.set_classname("re00050_cms");
                this.set_titletext("은행별 내역조회");
                this._setFormPosition(0,0,1122,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_list", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"rcmsDay\" type=\"STRING\" size=\"256\"/><Column id=\"bankCd\" type=\"STRING\" size=\"256\"/><Column id=\"bankNm\" type=\"STRING\" size=\"256\"/><Column id=\"reqstCnt\" type=\"STRING\" size=\"256\"/><Column id=\"reqstAmt\" type=\"STRING\" size=\"256\"/><Column id=\"srecpCnt\" type=\"STRING\" size=\"256\"/><Column id=\"srecpAmt\" type=\"STRING\" size=\"256\"/><Column id=\"hsrcpCnt\" type=\"STRING\" size=\"256\"/><Column id=\"hsrcpAmt\" type=\"STRING\" size=\"256\"/><Column id=\"trecpAmt\" type=\"STRING\" size=\"256\"/><Column id=\"erecpCnt\" type=\"STRING\" size=\"256\"/><Column id=\"feeAmt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
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

            obj = new Static("Static45", "absolute", "137", "27", "1", "30", null, null, this);
            obj.set_taborder("4");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_background("red");
            this.addChild(obj.name, obj);

            obj = new Static("Static46", "absolute", "142", "27", "1", "30", null, null, this);
            obj.set_taborder("5");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_background("red");
            this.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "10", "76", "86", "20", null, null, this);
            obj.set_taborder("7");
            obj.set_text("조회결과");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "10", "91", null, "10", "9", null, this);
            obj.set_taborder("8");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "10", "341", "1110", "20", null, null, this);
            obj.set_taborder("10");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_list", "absolute", "10", "101", "1092", "350", null, null, this);
            obj.set_taborder("15");
            obj.set_binddataset("ds_list");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"80\"/><Column size=\"100\"/><Column size=\"90\"/><Column size=\"100\"/><Column size=\"90\"/><Column size=\"100\"/><Column size=\"90\"/><Column size=\"100\"/><Column size=\"120\"/><Column size=\"100\"/><Column size=\"100\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"30\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"출금일자\"/><Cell col=\"1\" text=\"은행코드\"/><Cell col=\"2\" text=\"은행명\"/><Cell col=\"3\" text=\"청구건수\"/><Cell col=\"4\" text=\"청구금액\"/><Cell col=\"5\" text=\"정상출금건수\"/><Cell col=\"6\" text=\"정상출금금액\"/><Cell col=\"7\" text=\"부분출금건수\"/><Cell col=\"8\" text=\"부분출금금액\"/><Cell col=\"9\" text=\"출금금액합계\"/><Cell col=\"10\" text=\"오류건수\"/><Cell col=\"11\" text=\"수수료\"/></Band><Band id=\"body\"><Cell displaytype=\"date\" text=\"bind:rcmsDay\" calendardisplay=\"edit\" calendardisplaynulltype=\"none\"/><Cell col=\"1\" edittype=\"none\" text=\"bind:bankCd\" calendardisplay=\"display\"/><Cell col=\"2\" text=\"bind:bankNm\" calendardisplay=\"display\"/><Cell col=\"3\" displaytype=\"number\" edittype=\"none\" style=\"align:right middle;\" text=\"bind:reqstCnt\" mask=\"###,###,###,##0\"/><Cell col=\"4\" displaytype=\"number\" style=\"align:right middle;cursor: ;\" text=\"bind:reqstAmt\" mask=\"###,###,###,##0\"/><Cell col=\"5\" displaytype=\"number\" style=\"align:right middle;cursor: ;\" text=\"bind:srecpCnt\" mask=\"###,###,###,##0\"/><Cell col=\"6\" displaytype=\"number\" style=\"align:right middle;\" text=\"bind:srecpAmt\" mask=\"###,###,###,##0\"/><Cell col=\"7\" displaytype=\"number\" style=\"align:right middle;\" text=\"bind:hsrcpCnt\" mask=\"###,###,###,##0\"/><Cell col=\"8\" displaytype=\"number\" style=\"align:right middle;\" text=\"bind:hsrcpAmt\" mask=\"###,###,###,##0\"/><Cell col=\"9\" displaytype=\"number\" style=\"align:right middle;\" text=\"bind:trecpAmt\" mask=\"###,###,###,##0\"/><Cell col=\"10\" displaytype=\"number\" style=\"align:right middle;\" text=\"bind:erecpCnt\" mask=\"###,###,###,##0\"/><Cell col=\"11\" displaytype=\"number\" style=\"align:right middle;\" text=\"bind:feeAmt\" mask=\"###,###,###,##0\"/></Band><Band id=\"summary\"><Cell colspan=\"2\" text=\"총계\"/><Cell col=\"2\" style=\"align:right middle;\"/><Cell col=\"3\" displaytype=\"number\" style=\"align:right middle;\" text=\"expr:comp.parent.ds_list.getSum(&quot;reqstCnt&quot;)\" mask=\"###,###,###,##0\"/><Cell col=\"4\" displaytype=\"number\" style=\"align:right middle;\" text=\"expr:comp.parent.ds_list.getSum(&quot;reqstAmt&quot;)\" mask=\"###,###,###,##0\"/><Cell col=\"5\" displaytype=\"number\" style=\"align:right middle;\" text=\"expr:comp.parent.ds_list.getSum(&quot;srecpCnt&quot;)\" mask=\"###,###,###,##0\"/><Cell col=\"6\" displaytype=\"number\" style=\"align:right middle;\" text=\"expr:comp.parent.ds_list.getSum(&quot;srecpAmt&quot;)\" mask=\"###,###,###,##0\"/><Cell col=\"7\" displaytype=\"number\" style=\"align:right middle;\" text=\"expr:comp.parent.ds_list.getSum(&quot;hsrcpCnt&quot;)\" mask=\"###,###,###,##0\"/><Cell col=\"8\" displaytype=\"number\" style=\"align:right middle;\" text=\"expr:comp.parent.ds_list.getSum(&quot;hsrcpAmt&quot;)\" mask=\"###,###,###,##0\"/><Cell col=\"9\" displaytype=\"number\" style=\"align:right middle;\" text=\"expr:comp.parent.ds_list.getSum(&quot;trecpAmt&quot;)\" mask=\"###,###,###,##0\"/><Cell col=\"10\" displaytype=\"number\" style=\"align:right middle;\" text=\"expr:comp.parent.ds_list.getSum(&quot;erecpCnt&quot;)\" mask=\"###,###,###,##0\"/><Cell col=\"11\" displaytype=\"number\" style=\"align:right middle;\" text=\"expr:comp.parent.ds_list.getSum(&quot;feeAmt&quot;)\" mask=\"###,###,###,##0\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "10", "10", "1092", "49", null, null, this);
            obj.set_taborder("18");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_searchCondition", "absolute", "20", "8", "114", "30", null, null, this.div_search);
            obj.set_taborder("67");
            obj.set_text("출금일자");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static22", "absolute", "1", "0", null, "12", "430", null, this.div_search);
            obj.set_taborder("69");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "0", "0", "20", "45", null, null, this.div_search);
            obj.set_taborder("70");
            obj.set_text("FIX \r\nw20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static44", "absolute", "81", "44", "47", "21", null, null, this.div_search);
            obj.set_taborder("71");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_color("red");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static23", "absolute", "1", "33", null, "12", "430", null, this.div_search);
            obj.set_taborder("79");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static24", "absolute", "346", "0", "30", "44", null, null, this.div_search);
            obj.set_taborder("85");
            obj.set_text("FIX w30");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_fromDt", "absolute", "131", "12", "100", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("86");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_value("null");
            obj = new Calendar("cal_toDt", "absolute", "246", "12", "100", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("87");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_value("null");
            obj = new Static("Static03", "absolute", "234", "12", "9", "21", null, null, this.div_search);
            obj.set_taborder("88");
            obj.set_text("~");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "60", "1122", "20", null, null, this);
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


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1092, 49, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("18");
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
            		p.set_titletext("은행별 내역조회");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTREAccTran_tab2.xfdl", "lib::comLib.xjs");
        this.registerScript("RTREAccTran_tab2.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분 : 수금관리 > CMS관리 > 출금이체조회 > 은행별 내역조회
         * 02. 그룹명   : RTREAccTran_tab2.xfdl
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
        	this.bfAfDay 	= "";	//계좌신청일 
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
        		//오늘날짜
        		this.get_date();	
        		//버튼초기화		
        		this.fn_initBtn();	
        	}		 
        	/***********************************************************************************
        	* Transaction Function
        	***********************************************************************************/
            //-------------------------------------------------------------------------------  	
        	//오늘날짜 조회
            //-------------------------------------------------------------------------------  	
        	this.get_date = function() 
        	{
        		var sSvcID        	= "getDate";                    
        		var sController   	= "/rtms/comm/getToday.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        	}		
         	//---------------------------------------------------------------------------------
        	// 계약번호별 내역조회
        	//---------------------------------------------------------------------------------		
        	this.fn_search = function()
        	{
        		if(this.fn_getValidRcmsDay()) {	
        			var sSvcID      	= "getAccTranBankList";  
        			var sController   	= "ntrms/re/getAccTranBankList.do";
        			var sInDatasets   	= "";
        			var sOutDatasets  	= "ds_list=output";
        			var sArgs 			= "";	
        			var fn_callBack		= "fn_callBack";
        					
        			sArgs += Ex.util.setParam("rcmsDayF", nvl(this.div_search.cal_fromDt.value));		
        			sArgs += Ex.util.setParam("rcmsDayT", nvl(this.div_search.cal_toDt.value));		
        			
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
        			return Ex.core.comMsg("alert",strErrorMsg);		
        		}
        		
        		switch (strSvcId) 
        		{
        			case "getDate":
        				var sFirstDay = Eco.date.getFirstDate(this.toDay);	//해당일짜의 1일 가져오기
        				this.div_search.cal_fromDt.set_value(sFirstDay);
        				this.div_search.cal_toDt.set_value(this.toDay);						
        				break;				
        			case "getAccTranOrdNoList":		
        				if(this.ds_list.rowcount == 0) {
        					this.grd_list.set_nodatatext("조회된 결과가 없습니다.");
        				}
        				break;	
        			default:
        				break;
        		}
        	}

        	/***********************************************************************************
        	* Component Event
        	***********************************************************************************/
            //-------------------------------------------------------------------------------  	
        	//검색 시 Enter키 이벤트 처리
            //-------------------------------------------------------------------------------  	
        	this.div_search_edt_searchKeyword_onkeyup = function(obj,e)
        	{
        		if ( e.keycode == 13 )
        		{
        			this.fn_search();
        		}
        	}	
        	//------------------------------------------------------------------------------
        	//cal_fromDt_onchanged
        	//------------------------------------------------------------------------------	
        	this.cal_fromDt_onchanged = function(obj,e)
        	{
        		//입력된 날짜에 OffSet 으로 지정된만큼의 월을 증감한다 
        		// @param {string | date} value 'yyyyMMdd' 형태로 표현된 String 또는 Date.
        		// @param {number} offset 월 증감값 ( 예 : 1 또는 -1 ) 
        		var fromDt = nvl(this.div_search.cal_fromDt.value);
        		if(fromDt != "") {
        			var maxToDate =   Eco.date.addMonth(fromDt, 1);
        			//alert('maxToDate > ' + maxToDate);
        			if(parseInt(nvl(this.div_search.cal_toDt.value)) > parseInt(maxToDate)) {
        				alert('시작일자와 종료일자는 1개월 이내만 선택가능합니다.');
        				this.div_search.cal_fromDt.set_value("");
        				this.div_search.cal_fromDt.setFocus();
        				return;
        			}	
        		}
        	}	
        	//------------------------------------------------------------------------------
        	//cal_toDt_onchanged
        	//------------------------------------------------------------------------------		
        	this.cal_toDt_onchanged = function(obj,e)
        	{
        		//입력된 날짜에 OffSet 으로 지정된만큼의 월을 증감한다 
        		// @param {string | date} value 'yyyyMMdd' 형태로 표현된 String 또는 Date.
        		// @param {number} offset 월 증감값 ( 예 : 1 또는 -1 ) 
        		var toDt = nvl(this.div_search.cal_toDt.value);	
        		if(toDt	!= "") {
        			var minFromDate =   Eco.date.addMonth(toDt, -1);
        			//alert('minFromDate > ' + minFromDate);
        			if(parseInt(nvl(this.div_search.cal_fromDt.value)) < parseInt(minFromDate)) {
        				alert('시작일자와 종료일자는 1개월 이내만 선택가능합니다.');
        				this.div_search.cal_toDt.set_value("");
        				this.div_search.cal_toDt.setFocus();
        				return;
        			}	
        		}
        	}				
        	/***********************************************************************************
        	* User Function
        	***********************************************************************************/
        	//---------------------------------------------------------------------------------
        	//---------------------------------------------------------------------------------
        	// 출금일자 유효성 체크
        	this.fn_getValidRcmsDay = function() {
        		if(nvl(this.div_search.cal_fromDt.value) == "") {
        			alert('출금일자를 입력하세요');
        			this.div_search.cal_fromDt.setFocus();
        			return false;
        		}
        		if(nvl(this.div_search.cal_toDt.value) == "") {
        			alert('출금일자를 입력하세요');
        			this.div_search.cal_toDt.setFocus();
        			return false;
        		}		
        		if(parseInt(nvl(this.div_search.cal_fromDt.value)) > parseInt(nvl(this.div_search.cal_toDt.value)))
        		{
        			alert('출금일자를 확인하세요.');
        			this.div_search.cal_fromDt.setFocus();
        			return false;
        		}	
        			
        		var fromDt = nvl(this.div_search.cal_fromDt.value);
        		if(fromDt != "") {
        			var maxToDate =   Eco.date.addMonth(fromDt, 1);
        			if(parseInt(nvl(this.div_search.cal_toDt.value)) > parseInt(maxToDate)) {
        				alert('시작일자와 종료일자는 1개월 이내만 선택가능합니다.');
        				this.div_search.cal_fromDt.setFocus();
        				return false;
        			}	
        		}
        			
        		var toDt = nvl(this.div_search.cal_toDt.value);	
        		if(toDt	!= "") {
        			var minFromDate =   Eco.date.addMonth(toDt, -1);
        			if(parseInt(nvl(this.div_search.cal_fromDt.value)) < parseInt(minFromDate)) {
        				alert('시작일자와 종료일자는 1개월 이내만 선택가능합니다.');
        				this.div_search.cal_fromDt.setFocus();
        				return false;
        			}	
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
        		this.parent.parent.parent.setButton("E|S",this);		
        	}
            //-------------------------------------------------------------------------------  
        	//엑셀저장
            //-------------------------------------------------------------------------------  	
        	this.fn_excel = function(obj,e)
        	{
        		Ex.core.exportExcel(this, this.grd_list, "리스트");
        	}
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.div_search.cal_fromDt.addEventHandler("onchanged", this.cal_fromDt_onchanged, this);
            this.div_search.cal_toDt.addEventHandler("onchanged", this.cal_toDt_onchanged, this);

        };

        this.loadIncludeScript("RTREAccTran_tab2.xfdl");

       
    };
}
)();
