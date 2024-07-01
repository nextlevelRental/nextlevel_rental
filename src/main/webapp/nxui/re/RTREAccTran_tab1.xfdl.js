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
                this.set_name("RTREAccTran_tab1");
                this.set_classname("re00050_cms");
                this.set_titletext("계약번호별 내역조회(출금이체)");
                this._setFormPosition(0,0,1122,470);
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
            obj._setContents("<ColumnInfo><Column id=\"rcmsDay\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"rcmsAmt\" type=\"STRING\" size=\"256\"/><Column id=\"recpAmt\" type=\"STRING\" size=\"256\"/><Column id=\"rcercd\" type=\"STRING\" size=\"256\"/><Column id=\"rcernm\" type=\"STRING\" size=\"256\"/><Column id=\"bankCd\" type=\"STRING\" size=\"256\"/><Column id=\"bankNm\" type=\"STRING\" size=\"256\"/><Column id=\"acctNo\" type=\"STRING\" size=\"256\"/><Column id=\"rqstStat\" type=\"STRING\" size=\"256\"/><Column id=\"rqstStatNm\" type=\"STRING\" size=\"256\"/><Column id=\"rcmsSeq\" type=\"STRING\" size=\"256\"/><Column id=\"recvSeq\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_R022", this);
            obj.set_firefirstcount("0");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cdNm\">전체</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_cust", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custTp\" type=\"STRING\" size=\"256\"/><Column id=\"custTp2\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"birthDay\" type=\"STRING\" size=\"256\"/><Column id=\"genderCd\" type=\"STRING\" size=\"256\"/><Column id=\"lfCd\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"mobFirm\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"faxNo\" type=\"STRING\" size=\"256\"/><Column id=\"bldMngNo\" type=\"STRING\" size=\"256\"/><Column id=\"posCd\" type=\"STRING\" size=\"256\"/><Column id=\"addr1\" type=\"STRING\" size=\"256\"/><Column id=\"addr2\" type=\"STRING\" size=\"256\"/><Column id=\"telNo2\" type=\"STRING\" size=\"256\"/><Column id=\"bldMngNo2\" type=\"STRING\" size=\"256\"/><Column id=\"posCd2\" type=\"STRING\" size=\"256\"/><Column id=\"addr12\" type=\"STRING\" size=\"256\"/><Column id=\"addr22\" type=\"STRING\" size=\"256\"/><Column id=\"safekey\" type=\"STRING\" size=\"256\"/><Column id=\"buslNo\" type=\"STRING\" size=\"256\"/><Column id=\"corpNo\" type=\"STRING\" size=\"256\"/><Column id=\"repNm\" type=\"STRING\" size=\"256\"/><Column id=\"oCustnm\" type=\"STRING\" size=\"256\"/><Column id=\"oBirthday\" type=\"STRING\" size=\"256\"/><Column id=\"oGendercd\" type=\"STRING\" size=\"256\"/><Column id=\"oLfcd\" type=\"STRING\" size=\"256\"/><Column id=\"oMobno\" type=\"STRING\" size=\"256\"/><Column id=\"oSafekey\" type=\"STRING\" size=\"256\"/><Column id=\"cCustnm\" type=\"STRING\" size=\"256\"/><Column id=\"cTelno\" type=\"STRING\" size=\"256\"/><Column id=\"emailAddr\" type=\"STRING\" size=\"256\"/><Column id=\"emailAddr1\" type=\"STRING\" size=\"256\"/><Column id=\"emailAddr2\" type=\"STRING\" size=\"256\"/><Column id=\"busiType\" type=\"STRING\" size=\"256\"/><Column id=\"busiCond\" type=\"STRING\" size=\"256\"/><Column id=\"taxYn\" type=\"STRING\" size=\"256\"/><Column id=\"kunnr\" type=\"STRING\" size=\"256\"/><Column id=\"ciCd\" type=\"STRING\" size=\"256\"/><Column id=\"diCd\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static00", "absolute", "0", "10", "10", "460", null, null, this);
            obj.set_taborder("2");
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

            obj = new Static("Static21", "absolute", "10", "109", "86", "20", null, null, this);
            obj.set_taborder("7");
            obj.set_text("조회결과");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "10", "124", null, "10", "9", null, this);
            obj.set_taborder("8");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_list", "absolute", "10", "134", "1092", "330", null, null, this);
            obj.set_taborder("15");
            obj.set_binddataset("ds_list");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"120\"/><Column size=\"100\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"98\"/><Column size=\"80\"/><Column size=\"100\"/><Column size=\"80\"/><Column size=\"100\"/><Column size=\"120\"/><Column size=\"80\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"30\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"출금일자\"/><Cell col=\"1\" text=\"계약번호\"/><Cell col=\"2\" text=\"고객코드\"/><Cell col=\"3\" text=\"고객명\"/><Cell col=\"4\" text=\"청구금액\"/><Cell col=\"5\" text=\"수납금액\"/><Cell col=\"6\" text=\"오류코드\"/><Cell col=\"7\" text=\"오류명\"/><Cell col=\"8\" text=\"은행코드\"/><Cell col=\"9\" text=\"은행명\"/><Cell col=\"10\" text=\"계좌번호\"/><Cell col=\"11\" text=\"출금상태\"/></Band><Band id=\"body\"><Cell displaytype=\"date\" text=\"bind:rcmsDay\" calendardisplay=\"edit\" calendardisplaynulltype=\"none\"/><Cell col=\"1\" displaytype=\"text\" edittype=\"readonly\" text=\"bind:ordNo\" calendardisplay=\"display\"/><Cell col=\"2\" text=\"bind:custNo\" calendardisplay=\"display\"/><Cell col=\"3\" displaytype=\"normal\" edittype=\"none\" text=\"bind:custNm\"/><Cell col=\"4\" displaytype=\"number\" style=\"align:right middle;cursor:hand;selectline: ;\" text=\"bind:rcmsAmt\" mask=\"###,###,###,##0\"/><Cell col=\"5\" displaytype=\"number\" style=\"align:right middle;cursor:hand;\" text=\"bind:recpAmt\" mask=\"###,###,###,##0\"/><Cell col=\"6\" text=\"bind:rcercd\"/><Cell col=\"7\" text=\"bind:rcernm\"/><Cell col=\"8\" text=\"bind:bankCd\"/><Cell col=\"9\" text=\"bind:bankNm\"/><Cell col=\"10\" text=\"bind:acctNo\"/><Cell col=\"11\" text=\"bind:rqstStatNm\"/></Band><Band id=\"summary\"><Cell colspan=\"2\" text=\"총계\"/><Cell col=\"2\" style=\"align:right middle;\" expr=\"expr:dataset.getRowCount()+&quot;(건)&quot;\"/><Cell col=\"3\" style=\"align:right middle;\"/><Cell col=\"4\" displaytype=\"number\" style=\"align:right middle;\" text=\"expr:comp.parent.ds_list.getSum(&quot;rcmsAmt&quot;)\" mask=\"###,###,###,##0\"/><Cell col=\"5\" displaytype=\"number\" style=\"align:right middle;\" text=\"expr:comp.parent.ds_list.getSum(&quot;recpAmt&quot;)\" mask=\"###,###,###,##0\"/><Cell col=\"6\"/><Cell col=\"7\"/><Cell col=\"8\"/><Cell col=\"9\"/><Cell col=\"10\"/><Cell col=\"11\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "10", "10", "1092", "82", null, null, this);
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
            obj = new Static("Static44", "absolute", "81", "77", "47", "21", null, null, this.div_search);
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
            obj = new Static("Static45", "absolute", "125", "47", "1", "30", null, null, this.div_search);
            obj.set_taborder("80");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_background("red");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static46", "absolute", "130", "47", "1", "30", null, null, this.div_search);
            obj.set_taborder("81");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_background("red");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "0", "66", null, "12", "431", null, this.div_search);
            obj.set_taborder("82");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "-1", "33", "20", "45", null, null, this.div_search);
            obj.set_taborder("83");
            obj.set_text("FIX \r\nw20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition00", "absolute", "19", "41", "114", "30", null, null, this.div_search);
            obj.set_taborder("84");
            obj.set_text("출금상태");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
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
            obj = new Static("Static00", "absolute", "346", "32", "30", "44", null, null, this.div_search);
            obj.set_taborder("89");
            obj.set_text("FIX w30");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cbo_RqstStat", "absolute", "131", "45", "160", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("90");
            obj.set_innerdataset("@ds_R022");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj.set_text("전체");
            obj.set_index("0");
            obj = new Static("st_searchCondition01", "absolute", "376", "12", "64", "20", null, null, this.div_search);
            obj.set_taborder("91");
            obj.set_text("계약번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("edt_ordNo", "absolute", "444", "12", "140", "21", null, null, this.div_search);
            obj.set_taborder("92");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_odrPopUp", "absolute", "563", "11", "20", "21", null, null, this.div_search);
            obj.set_taborder("93");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition02", "absolute", "376", "45", "64", "20", null, null, this.div_search);
            obj.set_taborder("94");
            obj.set_text("고객번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("edt_custNo", "absolute", "444", "45", "140", "21", null, null, this.div_search);
            obj.set_taborder("95");
            obj.set_inputfilter("space");
            obj.set_lengthunit("ascii");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_custPopUp", "absolute", "563", "44", "20", "21", null, null, this.div_search);
            obj.set_taborder("96");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("edt_custNoKeyword", "absolute", "584", "45", "160", "21", null, null, this.div_search);
            obj.set_taborder("97");
            obj.set_inputfilter("space");
            obj.set_lengthunit("ascii");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "93", "1122", "20", null, null, this);
            obj.set_taborder("19");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "0", "0", "1122", "10", null, null, this);
            obj.set_taborder("20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1112", "10", "10", "460", null, null, this);
            obj.set_taborder("21");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static47", "absolute", "127", "53", null, "21", "966", null, this);
            obj.set_taborder("22");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_color("red");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1092, 82, this.div_search,
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
            obj = new Layout("default", "", 1122, 470, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("re00050_cms");
            		p.set_titletext("계약번호별 내역조회(출금이체)");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item0","div_search.edt_ordNo","value","ds_Search","SEARCH_KEYWORD");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item2","div_search.edt_custNo","value","ds_Search","SEARCH_KEYWORD");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item1","div_search.edt_custNoKeyword","value","ds_Search","SEARCH_KEYWORD");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTREAccTran_tab1.xfdl", "lib::comLib.xjs");
        this.registerScript("RTREAccTran_tab1.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분 : 수금관리 > CMS관리 > 출금이체조회 > 계약번호별 내역조회
         * 02. 그룹명   : RTREAccTran_tab1.xfdl
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
        		//공통코드조회
        		this.fn_getCommCode();			
        		//버튼초기화		
        		this.fn_initBtn();	
        	}		 
        	/***********************************************************************************
        	* Transaction Function
        	***********************************************************************************/
         	//---------------------------------------------------------------------------------
        	// 공통코드 조회
        	//---------------------------------------------------------------------------------
        	this.fn_getCommCode  = function() {
        		var sSvcID      	= "getCommCode";  
        		var sController   	= "ntrms/re/getAccTranCommCode.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_R022=outputR022";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 		
        	}	
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
        			var sSvcID      	= "getAccTranOrdNoList";  
        			var sController   	= "ntrms/re/getAccTranOrdNoList.do";
        			var sInDatasets   	= "";
        			var sOutDatasets  	= "ds_list=output";
        			var sArgs 			= "";	
        			var fn_callBack		= "fn_callBack";
        					
        			sArgs += Ex.util.setParam("rcmsDayF", nvl(this.div_search.cal_fromDt.value));		
        			sArgs += Ex.util.setParam("rcmsDayT", nvl(this.div_search.cal_toDt.value));		
        			sArgs += Ex.util.setParam("ordNo"	, nvl(this.div_search.edt_ordNo.value));		
        			sArgs += Ex.util.setParam("custNo"	, nvl(this.div_search.edt_custNo.value));	
        			sArgs += Ex.util.setParam("rqstStat", nvl(this.div_search.cbo_RqstStat.value));						
        			
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
        			case "getCommCode":
        				break;				
        			case "getAccTranOrdNoList":		
        				if(this.ds_list.rowcount == 0) {
        					this.grd_list.set_nodatatext("조회된 결과가 없습니다.");
        				}
        				break;	
        			case "listCustInfo":
        				if(this.ds_cust.rowcount > 0 ) {
        					this.div_search.edt_custNoKeyword.set_value(this.ds_cust.getColumn(0, "custNm"));
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
            //-------------------------------------------------------------------------------  	
        	//고객번호  Enter키 이벤트 처리
            //-------------------------------------------------------------------------------  	
        	this.custNo_onkeyup = function(obj,e)
        	{
        		this.div_search.edt_custNoKeyword.set_value("");	
        		if ( e.keycode == 13 )
        		{
        			if(nvl(this.div_search.edt_custNo.value) == "") {
        				this.alert("고객번호를 입력하세요");
        				this.div_search.edt_custNo.setFocus();
        				return;
        			}
        			//고객명 조회
        			this.fn_getCustNm();
        		}		
        	}	
        	//------------------------------------------------------------------------------
        	//grd_list_oncelldblclick
        	//------------------------------------------------------------------------------
        	this.grd_list_oncelldblclick = function(obj,e)
        	{
        		var nIndex = this.grd_list.getCellPos();
        		var colText = this.grd_list.getCellProperty( "Head", nIndex, "text" );	
        		if(colText=="청구금액") {
        		  //출금이체일자
        		  var sRcmsDay = this.ds_list.getColumn(this.ds_list.rowposition,"rcmsDay");
        		  //출금이체일련번호
        		  var sRcmsSeq = this.ds_list.getColumn(this.ds_list.rowposition,"rcmsSeq");	
        		  var args ={p_rcmsDay:sRcmsDay, p_rcmsSeq:sRcmsSeq};
        		  Ex.core.popup(this,"청구세부조회","comm::RTCOMMTranChargeDtl_pop.xfdl",args,"modaless=false");	
        		}
        		if(colText=="수납금액") {
        		  //수납거래번호
        		  var sRecvSeq = this.ds_list.getColumn(this.ds_list.rowposition,"recvSeq");
        		  var args ={p_recvSeq:sRecvSeq, p_gubun:"cms"};
        		  Ex.core.popup(this,"수납세부조회","comm::RTCOMMTranReceiptDtl_pop.xfdl",args,"modaless=false");	
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
            //-------------------------------------------------------------------------------  	
        	//고객명 조회
            //-------------------------------------------------------------------------------  	
        	this.fn_getCustNm = function() {
        		var sSvcID        	= "listCustInfo";                    
        		var sController   	= "rtms/comm/listCustInfo.do";
        		var sInDatasets   	= "user_=ds_user";
        		var sOutDatasets  	= "ds_cust=mapCustInfo";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		sArgs += Ex.util.setParam("custNo", this.div_search.edt_custNo.value);			
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 	
        	}		
            //-------------------------------------------------------------------------------  
        	//계약번호 팝업창
            //-------------------------------------------------------------------------------  	
        	this.fn_odrPopUp = function(obj,e)
        	{
        	  var args ={p_arg:""};
        	  Ex.core.popup(this,"계약번호찾기","comm::RTCOMMOrderNo_pop.xfdl",args,"modaless=false");			
        	}
        	
            //-------------------------------------------------------------------------------  	
        	//고객번호 팝업창
            //-------------------------------------------------------------------------------  	
        	this.fn_custPopUp = function(obj,e)
        	{
        		var args ={p_formId:this.id, p_custNo:nvl(this.div_search.edt_custNo.value), p_custNm:nvl(this.div_search.edt_custNoKeyword.value)};
        		Ex.core.popup(this,"고객찾기","comm::RTCOMMCust_pop.xfdl",args, "modaless=false");
        	}	
            //-------------------------------------------------------------------------------  
        	// 계약번호조회팝업창 파라미터 반환
            //-------------------------------------------------------------------------------  		
        	this.returnOrderNoInfo = function(arr) {
        		if(arr[0].rowcount > 0) 
        		{	
        			this.div_search.edt_ordNo.set_value(arr[0].getColumn(0,"ordNo"));
        		}
        	}	
            //-------------------------------------------------------------------------------  
        	// 고객조회팝업창 파라미터 반환
            //-------------------------------------------------------------------------------  		
        	this.returnCustInfo = function(arr) {
        		if(arr[0].rowcount > 0) 
        		{	
        			if(nvl(arr[0].getColumn(0,"userId")) != "") { 
        				this.div_search.edt_custRegNo.set_value(arr[0].getColumn(0,"userId"));
        			}
        			if(nvl(arr[0].getColumn(0,"userNm")) != "") { 			
        				this.div_search.edt_custRegNoKeyword.set_value(arr[0].getColumn(0,"userNm"));
        			}
        			if(nvl(arr[0].getColumn(0,"custNo")) != "") { 
        				this.div_search.edt_custNo.set_value(arr[0].getColumn(0,"custNo"));			
        			}
        			if(nvl(arr[0].getColumn(0,"custNm")) != "") { 	
        				this.div_search.edt_custNoKeyword.set_value(arr[0].getColumn(0,"custNm"));								
        			}
        		}
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
            this.grd_list.addEventHandler("oncelldblclick", this.grd_list_oncelldblclick, this);
            this.div_search.cal_fromDt.addEventHandler("onchanged", this.cal_fromDt_onchanged, this);
            this.div_search.cal_toDt.addEventHandler("onchanged", this.cal_toDt_onchanged, this);
            this.div_search.btn_odrPopUp.addEventHandler("onclick", this.fn_odrPopUp, this);
            this.div_search.edt_custNo.addEventHandler("onkeyup", this.custNo_onkeyup, this);
            this.div_search.btn_custPopUp.addEventHandler("onclick", this.fn_custPopUp, this);

        };

        this.loadIncludeScript("RTREAccTran_tab1.xfdl");

       
    };
}
)();
