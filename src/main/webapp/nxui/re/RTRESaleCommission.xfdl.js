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
                this.set_name("RTRESaleCommission");
                this.set_classname("RTCMClaim");
                this.set_titletext("판매처별 수수료 현황");
                this._setFormPosition(0,0,1147,480);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_list", this);
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_reversesubsum("false");
            obj.set_loadkeymode("keep");
            obj.set_firefirstcount("0");
            obj.set_loadfiltermode("keep");
            obj.set_enableevent("true");
            obj._setContents("<ColumnInfo><Column id=\"slcmYm\" type=\"STRING\" size=\"256\"/><Column id=\"salesGroup\" type=\"STRING\" size=\"256\"/><Column id=\"salesGroupNm\" type=\"STRING\" size=\"256\"/><Column id=\"salesOffice\" type=\"STRING\" size=\"256\"/><Column id=\"salesOfficeNm\" type=\"STRING\" size=\"256\"/><Column id=\"agencyCd\" type=\"STRING\" size=\"256\"/><Column id=\"agencyNm\" type=\"STRING\" size=\"256\"/><Column id=\"lifnr\" type=\"STRING\" size=\"256\"/><Column id=\"salecAmt\" type=\"STRING\" size=\"256\"/><Column id=\"proccAmt\" type=\"STRING\" size=\"256\"/><Column id=\"svccAmt\" type=\"STRING\" size=\"256\"/><Column id=\"tcommAmt\" type=\"STRING\" size=\"256\"/><Column id=\"mfapfdAmt\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroup\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroupNm\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOffice\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOfficeNm\" type=\"STRING\" size=\"256\"/><Column id=\"rtslcBonus\" type=\"STRING\" size=\"256\"/><Column id=\"ntslcBonus\" type=\"STRING\" size=\"256\"/><Column id=\"qtNtslcBonus\" type=\"STRING\" size=\"256\"/><Column id=\"rodianBonus\" type=\"STRING\" size=\"256\"/><Column id=\"svslcAmt\" type=\"STRING\" size=\"256\"/><Column id=\"slcBonus\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsRentalInfo", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"userId\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroup\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOffice\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroupNm\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOfficeNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Grid("grd_list", "absolute", "0", "112", "1121", "368", null, null, this);
            obj.set_taborder("4");
            obj.set_binddataset("ds_list");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj.set_fillareatype("none");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"150\"/><Column size=\"80\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"24\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"마감년월\"/><Cell col=\"1\" text=\"렌탈지사\"/><Cell col=\"2\" text=\"렌탈지점\"/><Cell col=\"3\" text=\"판매처명\"/><Cell col=\"4\" text=\"벤더코드\"/><Cell col=\"5\" text=\"판매수수료\"/><Cell col=\"6\" text=\"서비스판매수수료\"/><Cell col=\"7\" text=\"판매장려수수료\"/><Cell col=\"8\" text=\"장착수수료\"/><Cell col=\"9\" text=\"서비스수수료\"/><Cell col=\"10\" text=\"총수수료\"/><Cell col=\"11\" text=\"충당금설정금액\"/></Band><Band id=\"body\"><Cell text=\"bind:slcmYm\" tooltiptext=\"bind:slcmYm\"/><Cell col=\"1\" text=\"bind:rentalGroupNm\" tooltiptext=\"bind:salesGroupNm\"/><Cell col=\"2\" text=\"bind:rentalOfficeNm\" tooltiptext=\"bind:salesOfficeNm\"/><Cell col=\"3\" text=\"bind:agencyNm\" tooltiptext=\"bind:agencyNm\"/><Cell col=\"4\" text=\"bind:lifnr\" tooltiptext=\"bind:lifnr\"/><Cell col=\"5\" style=\"align:right;\" text=\"bind:salecAmt\" tooltiptext=\"bind:salecAmt\"/><Cell col=\"6\" style=\"align:right;\" text=\"bind:svslcAmt\" tooltiptext=\"bind:svslcAmt\"/><Cell col=\"7\" style=\"align:right;\" text=\"bind:slcBonus\" tooltiptext=\"bind:slcBonus\"/><Cell col=\"8\" style=\"align:right;\" text=\"bind:proccAmt\" tooltiptext=\"bind:proccAmt\"/><Cell col=\"9\" style=\"align:right;\" text=\"bind:svccAmt\" tooltiptext=\"bind:svccAmt\"/><Cell col=\"10\" style=\"align:right;\" text=\"bind:tcommAmt\" tooltiptext=\"bind:tcommAmt\"/><Cell col=\"11\" style=\"align:right;\" text=\"bind:mfapfdAmt\" tooltiptext=\"bind:mfapfdAmt\"/></Band><Band id=\"summary\"><Cell text=\"총계\"/><Cell col=\"1\" style=\"align:right;\" expr=\"dataset.getRowCount()+&quot;(건)&quot;\"/><Cell col=\"2\"/><Cell col=\"3\"/><Cell col=\"4\"/><Cell col=\"5\" displaytype=\"number\" style=\"align:right;\" expr=\"dataset.getSum(&quot;salecAmt&quot;)\" mask=\"###,###,###,##0\"/><Cell col=\"6\" displaytype=\"number\" style=\"align:right;\" expr=\"expr:dataset.getSum(&quot;svslcAmt&quot;)\" mask=\"###,###,###,##0\"/><Cell col=\"7\" displaytype=\"number\" style=\"align:right;\" expr=\"expr:dataset.getSum(&quot;slcBonus&quot;)\" mask=\"###,###,###,##0\"/><Cell col=\"8\" displaytype=\"number\" style=\"align:right;\" expr=\"dataset.getSum(&quot;proccAmt&quot;)\" mask=\"###,###,###,##0\"/><Cell col=\"9\" displaytype=\"number\" style=\"align:right;\" expr=\"dataset.getSum(&quot;svccAmt&quot;)\" mask=\"###,###,###,##0\"/><Cell col=\"10\" displaytype=\"number\" edittype=\"none\" style=\"align:right;\" expr=\"dataset.getSum(&quot;tcommAmt&quot;)\" mask=\"###,###,###,##0\"/><Cell col=\"11\" displaytype=\"number\" edittype=\"none\" style=\"align:right;\" expr=\"dataset.getSum(&quot;mfapfdAmt&quot;)\" mask=\"###,###,###,##0\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Button("btn_search", "absolute", "945", null, null, "25", "16", "735", this);
            obj.set_taborder("7");
            obj.set_text("조회");
            obj.set_cssclass("btn_WF_schArea");
            obj.getSetter("domainId").set("nexa.search");
            this.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "0", "87", "100", "20", null, null, this);
            obj.set_taborder("9");
            obj.set_text("검색결과");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "0", "102", "1147", "10", null, null, this);
            obj.set_taborder("10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "1122", "0", "25", "480", null, null, this);
            obj.set_taborder("12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "0", "0", "1121", "71", null, null, this);
            obj.set_taborder("13");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "369", "10", "80", "20", null, null, this.div_search);
            obj.set_taborder("155");
            obj.set_text("렌탈지사");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "25", "40", "80", "20", null, null, this.div_search);
            obj.set_taborder("159");
            obj.set_text("판매처");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_agencyCd", "absolute", "100", "36", "80", "21", null, null, this.div_search);
            obj.set_taborder("160");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("10");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_agencyNm", "absolute", "180", "36", "160", "21", null, null, this.div_search);
            obj.set_taborder("161");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("120");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "25", "11", "80", "20", null, null, this.div_search);
            obj.set_taborder("162");
            obj.set_text("기간");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_slcmYmFr", "absolute", "100", "10", "110", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("163");
            obj.set_dateformat("yyyy-MM");
            obj.set_editformat("yyyy-MM");
            obj = new Calendar("cal_slcmYmTo", "absolute", "230", "10", "110", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("164");
            obj.set_dateformat("yyyy-MM");
            obj.set_editformat("yyyy-MM");
            obj = new Static("Static07", "absolute", "214", "12", "10", "21", null, null, this.div_search);
            obj.set_taborder("165");
            obj.set_text("~");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static09", "absolute", "1122", "0", "25", "496", null, null, this.div_search);
            obj.set_taborder("166");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static22", "absolute", "0", "0", "1118", "10", null, null, this.div_search);
            obj.set_taborder("167");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static10", "absolute", "0", "31", "1118", "5", null, null, this.div_search);
            obj.set_taborder("168");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static11", "absolute", "0", "57", "1118", "10", null, null, this.div_search);
            obj.set_taborder("169");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static12", "absolute", "0", "72", "1118", "38", null, null, this.div_search);
            obj.set_taborder("170");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static14", "absolute", "340", "0", "25", "96", null, null, this.div_search);
            obj.set_taborder("171");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static15", "absolute", "0", "0", "25", "96", null, null, this.div_search);
            obj.set_taborder("172");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("bt_agencyCd", "absolute", "159", "36", "21", "21", null, null, this.div_search);
            obj.set_taborder("173");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_salesGroupCd", "absolute", "449", "10", "120", "21", null, null, this.div_search);
            obj.set_taborder("174");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("3");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_salesGroupNm", "absolute", "569", "10", "118", "21", null, null, this.div_search);
            obj.set_taborder("175");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("150");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("bt_salesGroupCd", "absolute", "547", "10", "21", "21", null, null, this.div_search);
            obj.set_taborder("176");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_salesOfficeNm", "absolute", "569", "36", "118", "21", null, null, this.div_search);
            obj.set_taborder("177");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("150");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_salesOfficeCd", "absolute", "449", "36", "120", "21", null, null, this.div_search);
            obj.set_taborder("178");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("4");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("bt_salesOfficeCd", "absolute", "547", "36", "21", "21", null, null, this.div_search);
            obj.set_taborder("179");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "369", "36", "80", "21", null, null, this.div_search);
            obj.set_taborder("180");
            obj.set_text("렌탈지점");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "71", "1147", "20", null, null, this);
            obj.set_taborder("14");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1121, 71, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("13");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1147, 480, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCMClaim");
            		p.set_titletext("판매처별 수수료 현황");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item0","","","dsSdStaus","");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTRESaleCommission.xfdl", "lib::comLib.xjs");
        this.registerScript("RTRESaleCommission.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분 : 수금관리 > 수수료 > 판매처별 수수료 현황
         * 02. 그룹명   : RTRESaleCommission.xfdl
         * 03. 그룹설명 :
         * 04. 작성일   : 2015.12.08
         * 05. 작성자   : 윤용택
         * 변경이력 
         * ---------------------------------
         * 변경일자	변경자		변경내용
         * ---------------------------------
         * 2019-06-12	wjim		[20190611_01] 서비스 판매수수료, 판매장려수수료 추가
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
        this.codeName	= "";
        this.agencyName	= "";
        this.curMonth	= "";	//당월
        this.toDay		= "";	//현재날짜

        //-------------------------------------------------------------------------------
        //폼로드시 공통함수
        //-------------------------------------------------------------------------------
        this.form_onload = function(obj,e) {
        	Ex.core.init(obj);
        	
        	//당월 조회
        	this.fn_getToday();
        }

        //-------------------------------------------------------------------------------   
        //초기화
        //------------------------------------------------------------------------------- 	
        this.fn_init = function() {
        	/* 버튼초기화 */
        	this.fn_initBtn();
        	
        	var div		 = this.div_search;
        	var gdsUser  = application.gds_userInfo;
        	var dsRental = this.dsRentalInfo;
        	
        	var userId	= gdsUser.getColumn(0,	"userId");			/* ID			*/
        	var userNm	= gdsUser.getColumn(0,	"userNm");			/* 이름			*/
        	var userGrp	= gdsUser.getColumn(0,	"userGrp");			/* 그룹			*/
        	var vkgrp	= dsRental.getColumn(0,	"rentalGroup"); 	/* 지사코드	*/
        	var vkgrpNm = dsRental.getColumn(0,	"rentalGroupNm");	/* 지사Nm		*/
        	var vkbur	= dsRental.getColumn(0,	"rentalOffice");	/* 지점코드	*/
        	var vkburNm	= dsRental.getColumn(0,	"rentalOfficeNm");	/* 지점NM		*/
        	var vkazc	= gdsUser.getColumn(0,	"vkazc");			/* 대리점		*/
        	var vkazcNm	= gdsUser.getColumn(0,	"vkazcNm");			/* 대리점NM	*/
        	
        	if(userGrp != "01" && userGrp != "02" && userGrp != "RM") {
        		div.ed_salesGroupCd.set_enable(false);		/* 렌탈지사Code Disabled		*/
        		div.ed_salesGroupNm.set_enable(false);		/* 렌탈지사Name Disabled		*/
        		div.bt_salesGroupCd.set_visible(false);		/* 렌탈지사Button Invisible	*/
        		div.ed_salesOfficeCd.set_enable(false);		/* 렌탈지점Code Disabled 		*/
        		div.ed_salesOfficeNm.set_enable(false);		/* 렌탈지점Name Disabled		*/
        		div.bt_salesOfficeCd.set_visible(false);	/* 렌탈지점Button visible		*/
        		div.ed_agencyCd.set_enable(false);			/* 장착대리점Code Disabled		*/
        		div.ed_agencyNm.set_enable(false);			/* 장착대리점Name Disabled		*/
        		div.bt_agencyCd.set_visible(false);			/* 장착대리점Button Invisible	*/
        		
        		div.ed_salesGroupCd.set_value(vkgrp);
        		div.ed_salesGroupNm.set_value(vkgrpNm);
        		div.ed_salesOfficeCd.set_value(vkbur);
        		div.ed_salesOfficeNm.set_value(vkburNm);
        		div.ed_agencyCd.set_value(userId);
        		div.ed_agencyNm.set_value(userNm);
        	}
        }

        /***********************************************************************************
        * Transaction Function
        ***********************************************************************************/
        /**
         * 사용자 렌탈그룹 조회
         */
        this.fn_userRentalGroupInfo = function() {
        	this.dsRentalInfo.clearData();
        	
        	var sSvcID		 = "userRentalGroupInfo";
        	var sController	 = "/rtms/sd/userRentalGroupInfo.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "dsRentalInfo=ds_output";
        	var sArgs		 = "";
        		sArgs		+= Ex.util.setParam("userId", application.gds_userInfo.getColumn(0, "userId"));
        	var fn_callBack	 = "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        //-------------------------------------------------------------------------------
        //당월 조회
        //-------------------------------------------------------------------------------
        this.fn_getToday = function() {
        	var sSvcID		 = "getToday";
        	var sController	 = "/rtms/comm/getToday.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "";
        	var sArgs		 = "";
        	var fn_callBack	 = "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        	
        //---------------------------------------------------------------------------------
        // 판매처별 수수료 현황 조회
        //---------------------------------------------------------------------------------	
        this.fn_search = function(obj,e) {
        	var slcmFr  		= nvl(this.div_search.cal_slcmYmFr.value).substr(0,6); //당월
        	var slcmTo 		    = nvl(this.div_search.cal_slcmYmTo.value).substr(0,6); //당월
        	var agencyCd 		= nvl(this.div_search.ed_agencyCd.value); //판매점
        			
        	var rentalGroup   = nvl(this.div_search.ed_salesGroupCd.value); //렌탈지사
        	var rentalOffice  = nvl(this.div_search.ed_salesOfficeCd.value); //렌탈지점
        	var userId        = application.gds_userInfo.getColumn(0, "userId"); //사용자ID
        			
        	var userGrp 	= application.gds_userInfo.getColumn(0, "userGrp"); //그룹

        	var bfVkgrp 	= application.gds_userInfo.getColumn(0, "vkgrp"); //지사코드
        	var bfVkgrpNm 	= application.gds_userInfo.getColumn(0, "vkgrpNm"); //지사Nm
        	var bfVkbur 	= application.gds_userInfo.getColumn(0, "vkbur"); //지점코드
        	var bfVkburNm 	= application.gds_userInfo.getColumn(0, "vkburNm"); //지점NM

        	
        	var afVkgrpNm 	= this.div_search.ed_salesGroupCd.value; //팝업 지사Nm
        	var afVkburNm 	= this.div_search.ed_salesGroupNm.value; //팝업 지점Nm
        	
        	/* 렌탈지사지점 Check 해제 */
        // 	if (rentalGroup == "" || rentalGroup == null) {
        // 		this.alert("렌탈지사를 선택하세요.");
        // 		return false;
        // 	}
        // 	
        // 	if (rentalOffice == "" || rentalOffice == null) {
        // 		this.alert("렌탈지점을 선택하세요.");
        // 		return false;
        // 	}
        	
        	var sSvcID        	= "saleCommissionList";                    
        	var sController   	= "/rtms/re/saleCommissionList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_list=output";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("slcmFr", slcmFr);
        	sArgs += Ex.util.setParam("slcmTo", slcmTo);
        	sArgs += Ex.util.setParam("agencyCd", agencyCd);
        	sArgs += Ex.util.setParam("rentalGroup", rentalGroup);
        	sArgs += Ex.util.setParam("rentalOffice", rentalOffice);	
        	sArgs += Ex.util.setParam("userId", userId);	
        		
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /***********************************************************************************
        * CallBack Event(strSvcId - Sevice ID, nErrorCode - ErrorCode, strErrorMsg - Error Message)
        ***********************************************************************************/
        this.fn_callBack = function(strSvcId,nErrorCode,strErrorMsg) {
        	if(nErrorCode < 0) {
        		return Ex.core.comMsg("alert", strErrorMsg);
        	}
        	
        	switch(strSvcId) {
        		/* 월일 조회 */
        		case "getToday":
        			this.curMonth = this.toDay.substr(0, 4) + (this.toDay.substr(4, 2) - 1);
        			
        			this.div_search.cal_slcmYmFr.set_value(this.curMonth);
        			this.div_search.cal_slcmYmTo.set_value(this.curMonth);
        			
        			/* 사용자 렌탈그룹 조회 */
        			this.fn_userRentalGroupInfo();
        			break;
        		
        		/* 사용자 렌탈그룹 조회 */
        		case "userRentalGroupInfo":
        			this.fn_init();
        			break;
        		
        		case "saleCommissionList":
        			if(this.ds_list.getRowCount() == 0) {
        				this.div_search.grd_list.set_nodatatext("조회된 데이터가 없습니다.");
        			}
        			break;
        		
        		case "getCodeS018":
        			this.div_search.ed_salesGroupNm.set_value(this.codeName);
        			break;
        		
        		case "getCodeS019":
        			this.div_search.ed_salesOfficeNm.set_value(this.codeName);
        			break;
        		
        		case "getAgencyName":
        			this.div_search.ed_agencyNm.set_value(nexacro._replaceAll(this.agencyName, "&#32;", " "));
        			break;
        		default:
        			break;
        	}
        }
        	
        this._setReturn = function(val) {
        	var cd = val[0];
        	var nm = val[1];
        	var gb = val[2];
        	
        	if(gb == "vkgrp") {
        		this.div_search.ed_salesGroupCd.set_value(cd);
        		this.div_search.ed_salesGroupNm.set_value(nm);
        	} else if(gb == "vkbur" ) {
        		this.div_search.ed_salesOfficeCd.set_value(cd);
        		this.div_search.ed_salesOfficeNm.set_value(nm);
        	} else if(gb == "vkazc" ) {
        		this.div_search.ed_agencyCd.set_value(cd);
        		this.div_search.ed_agencyNm.set_value(nm);
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
        	this.parent.setButton("E|S", this);
        }

        /***********************************************************************************
         * Component Event & Function
         ***********************************************************************************/

        //---------------------------------------------------------------------------------
        // 엑셀
        //---------------------------------------------------------------------------------
        this.fn_excel = function() {
        	Ex.core.exportExcel(this, this.grd_list);
        }

        /**
         * 지사
         */
        this.div_search_bt_salesGroupNm_onclick = function(obj,e) {
        	 var args ={p_arg:"RTRESaleCommission"};
        	 Ex.core.popup(this,"지사정보 조회","comm::RTCOMMVkgrp_pop.xfdl",args,"modaless=false");
        }

        /**
         * 지점
         */
        this.div_search_bt_salesOfficeCd_onclick = function(obj,e) {
        	 var args ={p_arg:"RTRESaleCommission", p_rentalGroup:this.div_search.ed_salesGroupCd.value};
        		Ex.core.popup(this,"지점정보 조회","comm::RTCOMMVkbur_pop.xfdl",args,"modaless=false");
        }

        //판매처  
        this.div_search_bt_agencyCd_onclick = function(obj,e)
        {
        	//var args ={p_arg:"RTRESaleCommission"};		
        	
        	var args = {p_vkgrpCd:this.div_search.ed_salesGroupCd.value, p_vkgrpNm:this.div_search.ed_salesGroupNm.value, 
        				p_vkburCd:this.div_search.ed_salesOfficeCd.value, p_vkburNm:this.div_search.ed_salesOfficeNm.value, 
        				p_arg : "RTRESaleCommission"};
        				
        	Ex.core.popup(this,"판매처 조회","comm::RTCOMMSaleAgentList_pop.xfdl",args, "modaless=false");
        }
        this.FN_sellers = function(res)
        {
           this.div_search.ed_agencyCd.set_value(res[0]);
           this.div_search.ed_agencyNm.set_value(res[1]);
        }

        

        //지사 enter키 이벤트
        this.div_search_ed_salesGroupCd_onkeyup = function(obj,e)
        {
        	if ( e.keycode == 13 ) {
        		var sSvcID        	= "getCodeS018";                    
        		var sController   	= "rtms/comm/getCodeName.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		sArgs += Ex.util.setParam("cd", this.div_search.ed_salesGroupCd.value);
        		sArgs += Ex.util.setParam("cdGrpCd", "S018");
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        }

        //지점 enter키 이벤트
        this.div_search_ed_salesOfficeCd_onkeyup = function(obj,e)
        {
        	  if ( e.keycode == 13 ) {
        			var sSvcID        	= "getCodeS019";                    
        			var sController   	= "rtms/comm/getCodeName.do";
        			var sInDatasets   	= "";
        			var sOutDatasets  	= "";
        			var sArgs 			= "";	
        			var fn_callBack		= "fn_callBack";
        			
        			sArgs += Ex.util.setParam("cd", this.div_search.ed_salesOfficeCd.value);
        			sArgs += Ex.util.setParam("cdGrpCd", "S019");
        			
        			Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        		}	
        }

        //판매처 enter키 이벤트
        this.div_search_ed_agencyCd_onkeyup = function(obj,e)
        {
        	   if ( e.keycode == 13 ) {
        		var sSvcID        	= "getAgencyName";                    
        		var sController   	= "rtms/comm/getAgencyName.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		sArgs += Ex.util.setParam("agencyCd", this.div_search.ed_agencyCd.value);
        					
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	 }
        }
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.btn_search.addEventHandler("onclick", this.fn_search, this);
            this.div_search.ed_agencyCd.addEventHandler("onkeyup", this.div_search_ed_agencyCd_onkeyup, this);
            this.div_search.cal_slcmYmFr.addEventHandler("oneditclick", this.div_search_cal_slcmFr_oneditclick, this);
            this.div_search.Static22.addEventHandler("onclick", this.div_search_Static22_onclick, this);
            this.div_search.bt_agencyCd.addEventHandler("onclick", this.div_search_bt_agencyCd_onclick, this);
            this.div_search.ed_salesGroupCd.addEventHandler("onkeyup", this.div_search_ed_salesGroupCd_onkeyup, this);
            this.div_search.bt_salesGroupCd.addEventHandler("onclick", this.div_search_bt_salesGroupNm_onclick, this);
            this.div_search.ed_salesOfficeCd.addEventHandler("onkeyup", this.div_search_ed_salesOfficeCd_onkeyup, this);
            this.div_search.bt_salesOfficeCd.addEventHandler("onclick", this.div_search_bt_salesOfficeCd_onclick, this);

        };

        this.loadIncludeScript("RTRESaleCommission.xfdl");

       
    };
}
)();
