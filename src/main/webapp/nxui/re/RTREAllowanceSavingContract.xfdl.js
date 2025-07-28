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
                this.set_name("RTREAllowanceSavingContract");
                this.set_classname("RTCMClaim");
                this.set_titletext("충당금 적립 계약 조회");
                this._setFormPosition(0,0,1147,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_list", this);
            obj.getSetter("firenextcount").set("0");
            obj._setContents("<ColumnInfo><Column id=\"slcmYm\" type=\"STRING\" size=\"256\"/><Column id=\"salesGroup\" type=\"STRING\" size=\"256\"/><Column id=\"salesGroupNm\" type=\"STRING\" size=\"256\"/><Column id=\"salesOffice\" type=\"STRING\" size=\"256\"/><Column id=\"salesOfficeNm\" type=\"STRING\" size=\"256\"/><Column id=\"agencyCd\" type=\"STRING\" size=\"256\"/><Column id=\"agencyNm\" type=\"STRING\" size=\"256\"/><Column id=\"lifnr\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"petternCd\" type=\"STRING\" size=\"256\"/><Column id=\"tireSize\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"apfdAmt\" type=\"STRING\" size=\"256\"/><Column id=\"apfdsAmt\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroup\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOffice\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroupNm\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOfficeNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsRentalInfo", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"userId\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroup\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOffice\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroupNm\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOfficeNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Button("btn_search", "absolute", "945", null, null, "25", "16", "735", this);
            obj.set_taborder("7");
            obj.set_text("조회");
            obj.set_cssclass("btn_WF_schArea");
            obj.getSetter("domainId").set("nexa.search");
            this.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "0", "86", "100", "21", null, null, this);
            obj.set_taborder("9");
            obj.set_text("검색결과");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "0", "102", "1147", "10", null, null, this);
            obj.set_taborder("10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "1122", "0", "25", "496", null, null, this);
            obj.set_taborder("12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "0", "0", "1121", "71", null, null, this);
            obj.set_taborder("16");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("Static09", "absolute", "1122", "0", "25", "496", null, null, this.div_search);
            obj.set_taborder("124");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static10", "absolute", "0", "31", "1118", "5", null, null, this.div_search);
            obj.set_taborder("126");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static11", "absolute", "0", "57", "1118", "10", null, null, this.div_search);
            obj.set_taborder("127");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static12", "absolute", "0", "72", "1118", "38", null, null, this.div_search);
            obj.set_taborder("128");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static15", "absolute", "0", "0", "25", "96", null, null, this.div_search);
            obj.set_taborder("131");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_agencyNm", "absolute", "190", "36", "164", "21", null, null, this.div_search);
            obj.set_taborder("132");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("120");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_agencyCd", "absolute", "110", "36", "80", "21", null, null, this.div_search);
            obj.set_taborder("133");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("10");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "25", "36", "80", "20", null, null, this.div_search);
            obj.set_taborder("134");
            obj.set_text("판매처");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "25", "10", "80", "21", null, null, this.div_search);
            obj.set_taborder("135");
            obj.set_text("기간");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "379", "10", "80", "21", null, null, this.div_search);
            obj.set_taborder("138");
            obj.set_text("렌탈지사");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "379", "36", "80", "20", null, null, this.div_search);
            obj.set_taborder("139");
            obj.set_text("렌탈지점");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_salesOfficeCd", "absolute", "459", "36", "120", "21", null, null, this.div_search);
            obj.set_taborder("140");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("4");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_salesGroupCd", "absolute", "459", "10", "120", "21", null, null, this.div_search);
            obj.set_taborder("141");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("3");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_salesOfficeNm", "absolute", "578", "36", "118", "21", null, null, this.div_search);
            obj.set_taborder("142");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("150");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_salesGroupNm", "absolute", "578", "10", "118", "21", null, null, this.div_search);
            obj.set_taborder("143");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("150");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static14", "absolute", "354", "0", "25", "96", null, null, this.div_search);
            obj.set_taborder("144");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static07", "absolute", "228", "10", "10", "21", null, null, this.div_search);
            obj.set_taborder("145");
            obj.set_text("~");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_slcmYmTo", "absolute", "244", "10", "110", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("147");
            obj.set_dateformat("yyyy-MM");
            obj.set_editformat("yyyy-MM");
            obj = new Button("bt_agencyCd", "absolute", "169", "36", "21", "21", null, null, this.div_search);
            obj.set_taborder("149");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("bt_salesOfficeCd", "absolute", "558", "36", "21", "21", null, null, this.div_search);
            obj.set_taborder("150");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("bt_salesGroupCd", "absolute", "558", "10", "21", "21", null, null, this.div_search);
            obj.set_taborder("151");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_slcmYmFr", "absolute", "110", "10", "110", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("152");
            obj.set_dateformat("yyyy-MM");
            obj.set_editformat("yyyy-MM");
            obj = new Static("Static03", "absolute", "0", "0", "1118", "10", null, null, this.div_search);
            obj.set_taborder("153");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "71", "1147", "20", null, null, this);
            obj.set_taborder("17");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_list", "absolute", "0", "112", null, "384", "25", null, this);
            obj.set_taborder("20");
            obj.set_binddataset("ds_list");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"100\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"150\"/><Column size=\"80\"/><Column size=\"100\"/><Column size=\"80\"/><Column size=\"100\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"30\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"수수료 마감월\"/><Cell col=\"1\" text=\"렌탈지사\"/><Cell col=\"2\" text=\"렌탈지점\"/><Cell col=\"3\" text=\"판매처코드\"/><Cell col=\"4\" text=\"판매처명\"/><Cell col=\"5\" text=\"벤더코드\"/><Cell col=\"6\" text=\"계약번호\"/><Cell col=\"7\" text=\"장착일자\"/><Cell col=\"8\" text=\"장착규격코드\"/><Cell col=\"9\" text=\"패턴\"/><Cell col=\"10\" text=\"규격\"/><Cell col=\"11\" text=\"수량\"/><Cell col=\"12\" text=\"개당 충당금\"/><Cell col=\"13\" text=\"총 충당금\"/></Band><Band id=\"body\"><Cell displaytype=\"normal\" text=\"bind:slcmYm\" calendardisplaynulltype=\"none\"/><Cell col=\"1\" text=\"bind:rentalGroupNm\"/><Cell col=\"2\" text=\"bind:rentalOfficeNm\"/><Cell col=\"3\" text=\"bind:agencyCd\"/><Cell col=\"4\" text=\"bind:agencyNm\"/><Cell col=\"5\" text=\"bind:lifnr\"/><Cell col=\"6\" displaytype=\"text\" edittype=\"readonly\" text=\"bind:ordNo\"/><Cell col=\"7\" displaytype=\"date\" text=\"bind:procDay\" calendardisplaynulltype=\"none\"/><Cell col=\"8\" text=\"bind:matCd\"/><Cell col=\"9\" text=\"bind:petternCd\"/><Cell col=\"10\" text=\"bind:tireSize\"/><Cell col=\"11\" text=\"bind:cntCd\"/><Cell col=\"12\" style=\"align:right;\" text=\"bind:apfdAmt\"/><Cell col=\"13\" style=\"align:right;\" text=\"bind:apfdsAmt\"/></Band><Band id=\"summary\"><Cell text=\"총계\"/><Cell col=\"1\" style=\"align:right;\" expr=\"dataset.getRowCount()+&quot;(건)&quot;\"/><Cell col=\"2\"/><Cell col=\"3\"/><Cell col=\"4\"/><Cell col=\"5\"/><Cell col=\"6\"/><Cell col=\"7\"/><Cell col=\"8\"/><Cell col=\"9\"/><Cell col=\"10\"/><Cell col=\"11\"/><Cell col=\"12\"/><Cell col=\"13\" displaytype=\"number\" style=\"align:right;\" expr=\"dataset.getSum(&quot;apfdsAmt&quot;)\" mask=\"###,###,###,##0\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1121, 73, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("16");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1147, 496, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCMClaim");
            		p.set_titletext("충당금 적립 계약 조회");

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
        this.addIncludeScript("RTREAllowanceSavingContract.xfdl", "lib::comLib.xjs");
        this.registerScript("RTREAllowanceSavingContract.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분 : 수금관리 > 수수료 > 충당금 적립 계약 조회
         * 02. 그룹명   : RTREAllowanceSavingContract.xfdl
         * 03. 그룹설명 :
         * 04. 작성일   : 2015.12.09
         * 05. 작성자   : 윤용택
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
        this.codeName	= "";
        this.agencyName	= "";
        this.curMonth	= "";	/* 당월			*/
        this.toDay		= "";	/* 현재날짜	*/

        /***********************************************************************************
         * Form Load Common Function
         ***********************************************************************************/
        this.form_onload = function(obj,e) {
        	Ex.core.init(obj);
        	
        	this.fn_userRentalGroupInfo();
        }

        /**
         * 버튼생성
         */
        this.fn_initBtn  = function() {
        	/* 1. N	 : 신규추가
        	 * 2. S	 : 조회
        	 * 3. C	 : 데이타생성
        	 * 4. E	 : 엑셀데이타생성
        	 * 5. AG : 집계
        	 * 6. DN : 다운
        	 */	
        	this.parent.setButton("E|S", this);
        }

        /**
         * 초기화
         */
        this.fn_init = function() {
        	var div		 = this.div_search;
        	var gdsUser	 = application.gds_userInfo;
        	var dsRental = this.dsRentalInfo;
        	
        	var userId	= gdsUser.getColumn(0,	"userId");			/* ID				*/
        	var userNm	= gdsUser.getColumn(0,	"userNm");			/* 이름				*/
        	var userGrp	= gdsUser.getColumn(0,	"userGrp");			/* 그룹				*/
        	var vkgrp	= dsRental.getColumn(0,	"rentalGroup"); 	/* 렌탈지사코드	*/
        	var vkgrpNm = dsRental.getColumn(0,	"rentalGroupNm");	/* 렌탈지사명		*/
        	var vkbur	= dsRental.getColumn(0,	"rentalOffice");	/* 렌탈지점코드	*/
        	var vkburNm	= dsRental.getColumn(0,	"rentalOfficeNm");	/* 렌탈지점명		*/
        	var vkazc	= gdsUser.getColumn(0,	"vkazc");			/* 대리점			*/
        	var vkazcNm	= gdsUser.getColumn(0,	"vkazcNm");			/* 대리점명		*/
        	
        	if(userGrp != "01" && userGrp != "02" && userGrp != "RM") {
        		div.ed_salesGroupCd.set_enable(false);		/* 렌탈지사	Code Disabled		*/
        		div.ed_salesGroupNm.set_enable(false);		/* 렌탈지사	Name Disabled		*/
        		div.bt_salesGroupCd.set_visible(false);		/* 렌탈지사	Button Invisible	*/
        		div.ed_salesOfficeCd.set_enable(false);		/* 렌탈지점	Code Disabled 		*/
        		div.ed_salesOfficeNm.set_enable(false);		/* 렌탈지점	Name Disabled		*/
        		div.bt_salesOfficeCd.set_visible(false);	/* 렌탈지점	Button visible		*/
        		div.ed_agencyCd.set_enable(false);			/* 장착대리점	Code Disabled		*/
        		div.ed_agencyNm.set_enable(false);			/* 장착대리점	Name Disabled		*/
        		div.bt_agencyCd.set_visible(false);			/* 장착대리점	Button Invisible	*/
        		
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
         * 당월 조회
         */
        this.fn_getToday  = function() {
        	var sSvcID		 = "getToday";  
        	var sController	 = "/rtms/comm/getToday.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "";
        	var sArgs		 = "";	
        	var fn_callBack	 = "fn_callBack";
        			
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

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
        	
        /**
         * 충당금 적립 계약 조회
         */
        this.fn_allowanceSavingContractList = function() {
        	var div		 = this.div_search;
        	var userInfo = application.gds_userInfo;
        	
        	var slcmFr		 = nvl(div.cal_slcmYmFr.value).substr(0, 6);	/* 당월			*/
        	var slcmTo		 = nvl(div.cal_slcmYmTo.value).substr(0, 6);	/* 당월			*/
        	var salesGroup	 = "";											/* 지사			*/
        	var salesOffice	 = "";											/* 지점			*/
        	var agencyCd	 = nvl(div.ed_agencyCd.value);					/* 판매점		*/
        	var rentalGroup	 = nvl(div.ed_salesGroupCd.value); 				/* 렌탈지사	*/
        	var rentalOffice = nvl(div.ed_salesOfficeCd.value);				/* 렌탈지점	*/
        	var userId		 = userInfo.getColumn(0, "userId");				/* 사용자ID	*/
        	var userGrp		 = userInfo.getColumn(0, "userGrp");			/* 그룹			*/
        	var bfVkgrp		 = userInfo.getColumn(0, "vkgrp");				/* 지사코드	*/
        	var bfVkgrpNm	 = userInfo.getColumn(0, "vkgrpNm");			/* 지사명		*/
        	var bfVkbur		 = userInfo.getColumn(0, "vkbur");				/* 지점코드	*/
        	var bfVkburNm	 = userInfo.getColumn(0, "vkburNm");			/* 지점명		*/
        	var afVkgrpNm	 = div.ed_salesGroupNm.value;					/* 팝업 지사명	*/
        	var afVkburNm	 = div.ed_salesOfficeNm.value;					/* 팝업 지점명	*/
        	
        	/* 렌탈지사지점 Check 해제 */
        // 	if(Eco.isEmpty(rentalGroup)) {
        // 		this.alert("렌탈지사를 선택하세요.");
        // 		
        // 		return false;
        // 	}
        // 	
        // 	if(Eco.isEmpty(rentalOffice)) {
        // 		this.alert("렌탈지점을 선택하세요.");
        // 		
        // 		return false;
        // 	}
        	
        	/* 지점 */
        	if(userGrp == "04") {
        		if(bfVkgrpNm != afVkgrpNm) {
        			this.alert("타 조직내역 조회 불가합니다.");
        			return;
        		}
        		
        		if(bfVkburNm != afVkburNm) {
        			this.alert("타 조직내역 조회 불가합니다.");
        			
        			return;
        		}
        	}
        	
        	/* 렌탈지사 */
        	if(userGrp == "03" || userGrp == "07") {
        		if(bfVkgrpNm != afVkgrpNm) {
        			this.alert("타 조직내역 조회 불가합니다.");
        			
        			return;
        		}
        	}
        	
        	var sSvcID		 = "allowanceSavingContractList";
        	var sController	 = "/rtms/re/allowanceSavingContractList.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "ds_list=output";
        	var sArgs		 = "";
        		sArgs		+= Ex.util.setParam("slcmYmF",		slcmFr);
        		sArgs		+= Ex.util.setParam("slcmYmT",		slcmTo);
        		sArgs		+= Ex.util.setParam("salesGroup",	salesGroup);
        		sArgs		+= Ex.util.setParam("salesOffice",	salesOffice);
        		sArgs		+= Ex.util.setParam("agencyCd",		agencyCd);
        		sArgs		+= Ex.util.setParam("rentalGroup",	rentalGroup);
        		sArgs		+= Ex.util.setParam("rentalOffice",	rentalOffice);
        		sArgs		+= Ex.util.setParam("userId",		userId);
        	var fn_callBack	 = "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /***********************************************************************************
        * CallBack Event(strSvcId - Sevice ID, nErrorCode - ErrorCode, strErrorMsg - Error Message)
        ***********************************************************************************/
        this.fn_callBack = function(strSvcId,nErrorCode,strErrorMsg) {
        	if(nErrorCode < 0) {
        		return Ex.core.comMsg("alert", strErrorMsg);
        	}
        	
        	switch(strSvcId) {
        		/* 전월 조회 */
        		case "getToday":
        			this.curMonth = this.toDay.substr(0, 4) + (this.toDay.substr(4, 2) - 1);
        			 
        			this.div_search.cal_slcmYmFr.set_value(this.curMonth);
        			this.div_search.cal_slcmYmTo.set_value(this.curMonth);
        			break;
        		
        		/* 사용자 렌탈그룹 조회 */
        		case "userRentalGroupInfo":
        			/* 당월 조회 */
        			this.fn_getToday();
        			
        			/* 버튼초기화 */
        			this.fn_initBtn();
        			
        			/* 초기화 */
        			this.fn_init();
        			break;
        		
        		/* 충당금 적립 계약 조회 */
        		case "allowanceSavingContractList":
        			if(this.ds_list.getRowCount() == 0) {
        			   this.grd_list.set_nodatatext("조회된 결과가 없습니다.");
        			}
        			break;
        		//지사
        		case "getCodeS018":
        			this.div_search.ed_salesGroupNm.set_value(this.codeName);
        			break;
        		//지점	
        		case "getCodeS019":
        			this.div_search.ed_salesOfficeNm.set_value(this.codeName);
        			break;
        		//판매처
        		case "getAgencyName":
        			this.div_search.ed_agencyNm.set_value(nexacro._replaceAll(this.agencyName, "&#32;", " "));
        			break;																
        		default:
        			break;
        	}
        }

        /**
         * Popup Callback
         */
        this._setReturn = function(val) {
        	var cd = val[0];
        	var nm = val[1];
        	var gb = val[2];
        	
        	if(gb == "vkgrp") {
        		this.div_search.ed_salesGroupCd.set_value(cd);
        		this.div_search.ed_salesGroupNm.set_value(nm);
        	} else if(gb == "vkbur") {
        		this.div_search.ed_salesOfficeCd.set_value(cd);
        		this.div_search.ed_salesOfficeNm.set_value(nm);
        	} else if(gb == "vkazc") {
        		this.div_search.ed_agencyCd.set_value(cd);
        		this.div_search.ed_agencyNm.set_value(nm);
        	}
        }

        this.FN_sellers = function(res) {
           this.div_search.ed_agencyCd.set_value(res[0]);
           this.div_search.ed_agencyNm.set_value(res[1]);
        }

        /***********************************************************************************
         * User Function
         ***********************************************************************************/

        /***********************************************************************************
         * Component Event & Function
         ***********************************************************************************/
        /**
         * 조회
         */
        this.fn_search = function() {
        	/* 충당금 적립 계약 조회 */
        	this.fn_allowanceSavingContractList();
        }

        /**
         * 엑셀
         */
        this.fn_excel = function() {
        	Ex.core.exportExcel(this, this.grd_list);
        }

        /**
         * 렌탈지사 Button Onclick Event
         */
        this.div_search_bt_salesGroupNm_onclick = function(obj,e) {
        	var args = {p_arg : "RTRESaleCommission"};
        	
        	Ex.core.popup(this, "지사정보 조회", "comm::RTCOMMVkgrp_pop.xfdl", args, "modaless=false");
        }

        /**
         * 렌탈지점 Button Onclick Event
         */
        this.div_search_bt_salesOfficeCd_onclick = function(obj,e) {
        	var args = {p_arg : "RTRESaleCommission", p_rentalGroup : this.div_search.ed_salesGroupCd.value};
        	
        	Ex.core.popup(this, "지점정보 조회", "comm::RTCOMMVkbur_pop.xfdl", args, "modaless=false");
        }

        /**
         * 판매처 Button Onclick Event
         */
        this.div_search_bt_agencyCd_onclick = function(obj,e) {
        	var div	 = this.div_search;
        	var args = {  p_vkgrpCd	: div.ed_salesGroupCd.value
        				, p_vkgrpNm	: div.ed_salesGroupNm.value
        				, p_vkburCd	: div.ed_salesOfficeCd.value
        				, p_vkburNm	: div.ed_salesOfficeNm.value
        				, p_arg		: "RTRESaleCommission"
        			   };
        	
        	Ex.core.popup(this, "판매처 조회", "comm::RTCOMMSaleAgentList_pop.xfdl", args, "modaless=false");
        }

        /**
         * 렌탈지사 Onkeyup Event
         */
        this.div_search_vkgrpCd_onkeyup = function(obj,e) {
        	if ( e.keycode == 13 ) {
        		var sSvcID        	= "getCodeS018";                    
        		var sController   	= "rtms/comm/getCodeName.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		sArgs += Ex.util.setParam("cd", this.div_search.ed_salesGroupCd.value);
        		sArgs += Ex.util.setParam("cdGrpCd", "S018");
        		
        		Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        }

        //지점 enter키 이벤트
        this.div_search_vkburCd_onkeyup = function(obj,e)
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
        		
        		Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        }

        
        //판매처 enter키 이벤트
        this.div_search_ed_agencyCd_onkeyup = function(obj,e) {
        	if(e.keycode == 13) {
        		var sSvcID        	= "getAgencyName";
        		var sController   	= "rtms/comm/getAgencyName.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";

        		sArgs += Ex.util.setParam("agencyCd", this.div_search.ed_agencyCd.value);
        				
        		Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        }
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.btn_search.addEventHandler("onclick", this.fn_search, this);
            this.div_search.Static10.addEventHandler("onclick", this.div_search_Static10_onclick, this);
            this.div_search.ed_agencyCd.addEventHandler("onkeyup", this.div_search_ed_agencyCd_onkeyup, this);
            this.div_search.ed_salesOfficeCd.addEventHandler("onkeyup", this.div_search_ed_salesOfficeCd_onkeyup, this);
            this.div_search.ed_salesGroupCd.addEventHandler("onkeyup", this.div_search_ed_salesGroupCd_onkeyup, this);
            this.div_search.bt_agencyCd.addEventHandler("onclick", this.div_search_bt_agencyCd_onclick, this);
            this.div_search.bt_salesOfficeCd.addEventHandler("onclick", this.div_search_bt_salesOfficeCd_onclick, this);
            this.div_search.bt_salesGroupCd.addEventHandler("onclick", this.div_search_bt_salesGroupNm_onclick, this);
            this.div_search.cal_slcmYmFr.addEventHandler("oneditclick", this.div_search_cal_slcmFr_oneditclick, this);
            this.div_search.Static03.addEventHandler("onclick", this.div_search_Static10_onclick, this);

        };

        this.loadIncludeScript("RTREAllowanceSavingContract.xfdl");

       
    };
}
)();
