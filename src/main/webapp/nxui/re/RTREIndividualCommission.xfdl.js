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
                this.set_name("RTREIndividualCommission");
                this.set_classname("RTCMClaim");
                this.set_titletext("개별 수수료 내역 조회");
                this._setFormPosition(0,0,1147,480);
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
            obj._setContents("<ColumnInfo><Column id=\"salesGroup\" type=\"STRING\" size=\"256\"/><Column id=\"salesGroupNM\" type=\"STRING\" size=\"256\"/><Column id=\"salesOffice\" type=\"STRING\" size=\"256\"/><Column id=\"salesOfficeNm\" type=\"STRING\" size=\"256\"/><Column id=\"agencyCd\" type=\"STRING\" size=\"256\"/><Column id=\"agencyNm\" type=\"STRING\" size=\"256\"/><Column id=\"lifnr\" type=\"STRING\" size=\"256\"/><Column id=\"chanCd\" type=\"STRING\" size=\"256\"/><Column id=\"chanNm\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"commTp\" type=\"STRING\" size=\"256\"/><Column id=\"commNm\" type=\"STRING\" size=\"256\"/><Column id=\"commAmt\" type=\"STRING\" size=\"256\"/><Column id=\"commDay\" type=\"STRING\" size=\"256\"/><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"taxRqcdNm\" type=\"STRING\" size=\"256\"/><Column id=\"chanLclsCd\" type=\"STRING\" size=\"256\"/><Column id=\"chanMclsCd\" type=\"STRING\" size=\"256\"/><Column id=\"chanLclsNm\" type=\"STRING\" size=\"256\"/><Column id=\"chanMclsNm\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroup\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOffice\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroupNm\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOfficeNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_chanCd", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_commTp", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsRentalInfo", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"userId\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroup\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOffice\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroupNm\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOfficeNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Grid("grd_list", "absolute", "0", "114", "1122", "366", null, null, this);
            obj.set_taborder("4");
            obj.set_autofittype("none");
            obj.set_binddataset("ds_list");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"81\"/><Column size=\"80\"/><Column size=\"150\"/><Column size=\"80\"/><Column size=\"120\"/><Column size=\"60\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"100\"/><Column size=\"80\"/><Column size=\"120\"/><Column size=\"100\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"180\"/><Column size=\"80\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"24\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"렌탈지사\"/><Cell col=\"1\" text=\"렌탈지점\"/><Cell col=\"2\" text=\"판매처코드\"/><Cell col=\"3\" text=\"판매처명\"/><Cell col=\"4\" text=\"벤더코드\"/><Cell col=\"5\" text=\"세금계산서발행법\"/><Cell col=\"6\" text=\"채널\"/><Cell col=\"7\" text=\"채널대분류\"/><Cell col=\"8\" text=\"채널중분류\"/><Cell col=\"9\" text=\"계약번호\"/><Cell col=\"10\" text=\"고객명\"/><Cell col=\"11\" text=\"수수료항목\"/><Cell col=\"12\" text=\"수수료금액\"/><Cell col=\"13\" text=\"기준일자\"/><Cell col=\"14\" text=\"상품코드\"/><Cell col=\"15\" text=\"상품명\"/><Cell col=\"16\" text=\"수량\"/></Band><Band id=\"body\"><Cell text=\"bind:rentalGroupNm\" tooltiptext=\"bind:salesGroupNM\"/><Cell col=\"1\" text=\"bind:rentalOfficeNm\" tooltiptext=\"bind:salesOfficeNm\"/><Cell col=\"2\" text=\"bind:agencyCd\" tooltiptext=\"bind:agencyCd\"/><Cell col=\"3\" text=\"bind:agencyNm\" tooltiptext=\"bind:agencyNm\"/><Cell col=\"4\" text=\"bind:lifnr\" tooltiptext=\"bind:lifnr\"/><Cell col=\"5\" text=\"bind:taxRqcdNm\"/><Cell col=\"6\" text=\"bind:chanNm\" tooltiptext=\"bind:chanNm\"/><Cell col=\"7\" text=\"bind:chanLclsNm\"/><Cell col=\"8\" text=\"bind:chanMclsNm\"/><Cell col=\"9\" displaytype=\"text\" edittype=\"readonly\" text=\"bind:ordNo\" tooltiptext=\"bind:ordNo\"/><Cell col=\"10\" text=\"bind:custNm\" tooltiptext=\"bind:custNm\"/><Cell col=\"11\" text=\"bind:commNm\" tooltiptext=\"bind:commNm\"/><Cell col=\"12\" style=\"align:right;\" text=\"bind:commAmt\" tooltiptext=\"bind:commAmt\"/><Cell col=\"13\" displaytype=\"date\" text=\"bind:commDay\" calendardisplaynulltype=\"none\" tooltiptext=\"bind:commDay\"/><Cell col=\"14\" text=\"bind:matCd\" tooltiptext=\"bind:matCd\"/><Cell col=\"15\" text=\"bind:matNm\" tooltiptext=\"bind:matNm\"/><Cell col=\"16\" text=\"bind:cntCd\" tooltiptext=\"bind:cntCd\"/></Band><Band id=\"summary\"><Cell text=\"총계\"/><Cell col=\"1\" style=\"align:right;\" expr=\"dataset.getRowCount()+&quot;(건)&quot;\"/><Cell col=\"2\"/><Cell col=\"3\"/><Cell col=\"4\"/><Cell col=\"5\"/><Cell col=\"6\"/><Cell col=\"7\"/><Cell col=\"8\"/><Cell col=\"9\"/><Cell col=\"10\"/><Cell col=\"11\"/><Cell col=\"12\" displaytype=\"number\" style=\"align:right;\" expr=\"dataset.getSum(&quot;commAmt&quot;)\" mask=\"###,###,###,##0\"/><Cell col=\"13\"/><Cell col=\"14\"/><Cell col=\"15\"/><Cell col=\"16\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Button("btn_search", "absolute", "945", null, null, "25", "16", "735", this);
            obj.set_taborder("7");
            obj.set_text("조회");
            obj.set_cssclass("btn_WF_schArea");
            obj.getSetter("domainId").set("nexa.search");
            this.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "0", "89", "169", "20", null, null, this);
            obj.set_taborder("9");
            obj.set_text("검색결과");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "0", "104", "1147", "10", null, null, this);
            obj.set_taborder("10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "1122", "0", "25", "479", null, null, this);
            obj.set_taborder("12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "0", "0", "1121", "71", null, null, this);
            obj.set_taborder("16");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "369", "10", "80", "21", null, null, this.div_search);
            obj.set_taborder("97");
            obj.set_text("렌탈지사");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_salesGroupNm", "absolute", "569", "10", "118", "21", null, null, this.div_search);
            obj.set_taborder("98");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("150");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_salesGroupCd", "absolute", "449", "10", "120", "21", null, null, this.div_search);
            obj.set_taborder("99");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("3");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("bt_salesGroupCd", "absolute", "547", "10", "21", "21", null, null, this.div_search);
            obj.set_taborder("100");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_salesOfficeCd", "absolute", "449", "36", "120", "21", null, null, this.div_search);
            obj.set_taborder("101");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("4");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("bt_salesOfficeCd", "absolute", "547", "36", "21", "21", null, null, this.div_search);
            obj.set_taborder("102");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_salesOfficeNm", "absolute", "569", "36", "118", "21", null, null, this.div_search);
            obj.set_taborder("103");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("150");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "25", "36", "80", "21", null, null, this.div_search);
            obj.set_taborder("104");
            obj.set_text("판매처");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_agencyCd", "absolute", "105", "36", "80", "21", null, null, this.div_search);
            obj.set_taborder("105");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("10");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_agencyNm", "absolute", "185", "36", "159", "21", null, null, this.div_search);
            obj.set_taborder("107");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("120");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "369", "36", "80", "21", null, null, this.div_search);
            obj.set_taborder("108");
            obj.set_text("렌탈지점");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "25", "10", "80", "21", null, null, this.div_search);
            obj.set_taborder("118");
            obj.set_text("기간");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_procDayF", "absolute", "105", "10", "110", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("119");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_value("null");
            obj.set_editformat("yyyy-MM-dd");
            obj = new Calendar("cal_procDayT", "absolute", "234", "10", "110", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("120");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_editformat("yyyy-MM-dd");
            obj.set_value("null");
            obj = new Static("Static07", "absolute", "218", "10", "10", "21", null, null, this.div_search);
            obj.set_taborder("121");
            obj.set_text("~");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static09", "absolute", "1122", "0", "25", "496", null, null, this.div_search);
            obj.set_taborder("124");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static22", "absolute", "0", "0", "1118", "10", null, null, this.div_search);
            obj.set_taborder("125");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static10", "absolute", "0", "31", "1118", "5", null, null, this.div_search);
            obj.set_taborder("126");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static11", "absolute", "0", "57", "1117", "10", null, null, this.div_search);
            obj.set_taborder("127");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static12", "absolute", "0", "72", "1118", "38", null, null, this.div_search);
            obj.set_taborder("128");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static13", "absolute", "687", "0", "25", "67", null, null, this.div_search);
            obj.set_taborder("129");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static14", "absolute", "344", "0", "25", "67", null, null, this.div_search);
            obj.set_taborder("130");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static15", "absolute", "0", "0", "25", "67", null, null, this.div_search);
            obj.set_taborder("131");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("bt_agencyCd", "absolute", "164", "36", "21", "21", null, null, this.div_search);
            obj.set_taborder("132");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "712", "10", "80", "21", null, null, this.div_search);
            obj.set_taborder("134");
            obj.set_text("채널");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "712", "36", "80", "21", null, null, this.div_search);
            obj.set_taborder("136");
            obj.set_text("수수료항목");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_chanCd", "absolute", "792", "10", "140", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("138");
            obj.set_autoselect("false");
            obj.set_innerdataset("ds_chanCd");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj.set_autoskip("false");
            obj.set_index("-1");
            obj = new Combo("cb_commTp", "absolute", "792", "36", "140", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("139");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj.set_innerdataset("@ds_commTp");
            obj.set_index("-1");

            obj = new Static("Static03", "absolute", "0", "71", "1147", "20", null, null, this);
            obj.set_taborder("17");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1121, 71, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("16");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1147, 480, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCMClaim");
            		p.set_titletext("개별 수수료 내역 조회");

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
        this.addIncludeScript("RTREIndividualCommission.xfdl", "lib::comLib.xjs");
        this.registerScript("RTREIndividualCommission.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분 : 수금관리 > 수수료 > 개별 수수료 내역 조회
         * 02. 그룹명   : RTREIndividualCommission.xfdl
         * 03. 그룹설명 :
         * 04. 작성일   : 2015.12.11
         * 05. 작성자   : 윤용택
         * 06. 수정이력 :
         ***********************************************************************
         *     수정일     작성자   내용
         *********************************************************************** 
         * 2016-10-05	임욱재		방판사용자의 경우 자신의 판매처만 조회가능하도록 제한
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
        	
        	this.fn_userRentalGroupInfo();
        } 

        //----------------------------------------------------------------------------------
        // Search: 사용자 렌탈그룹 조회
        //----------------------------------------------------------------------------------
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
        //초기화
        //-------------------------------------------------------------------------------
        this.fn_init = function() {
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
        //-------------------------------------------------------------------------------
        //당월 조회
        //-------------------------------------------------------------------------------
        this.fn_getToday  = function() {
        	var sSvcID      	= "getToday";  
        	var sController   	= "rtms/comm/getToday.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        //-------------------------------------------------------------------------------  	
        //공통코드(채널)
        //-------------------------------------------------------------------------------  	
        this.fn_getChanCdCode  = function(){
        var sSvcID      	= "getChanCdCode";  
        var sController   	= "ntrms/re/getindividualCommissionCommCode.do";
        var sInDatasets   	= "";
        var sOutDatasets  	= "ds_chanCd=outputS030";
        var sArgs 			= "";	
        var fn_callBack		= "fn_callBack";

        Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 		
        }

        //-------------------------------------------------------------------------------  	
        //공통코드(수수료항목)
        //-------------------------------------------------------------------------------  	
        this.fn_getCommTpCode  = function(){
        var sSvcID      	= "getCommTpCode";  
        var sController   	= "ntrms/re/getindividualCommissionCommCode.do";
        var sInDatasets   	= "";
        var sOutDatasets  	= "ds_commTp=outputR042";
        var sArgs 			= "";	
        var fn_callBack		= "fn_callBack";

        Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 		
        }
        	
        //---------------------------------------------------------------------------------
        // 판매처별 수수료 현황 조회
        //---------------------------------------------------------------------------------	
        this.fn_search = function(obj,e)
        {
        	var procDayF  		= nvl(this.div_search.cal_procDayF.value); //당월1일
        	var procDayT 		= nvl(this.div_search.cal_procDayT.value); //현재일
        	var salesGroup 		= ""; //지사
        	var salesOffice 	= ""; //지점
        	var agencyCd 		= nvl(this.div_search.ed_agencyCd.value); //판매점
        	var chanCd 		    = nvl(this.div_search.cb_chanCd.value);  //채널
        	var commTp      = nvl(this.div_search.cb_commTp.value);  //수수료항목
        	
        	var rentalGroup   = nvl(this.div_search.ed_salesGroupCd.value); //렌탈지사
        	var rentalOffice  = nvl(this.div_search.ed_salesOfficeCd.value); //렌탈지점
        	var userId        = application.gds_userInfo.getColumn(0, "userId"); //사용자ID
        	
        	var userGrp 	= application.gds_userInfo.getColumn(0, "userGrp"); //그룹

        	var bfVkgrp 	= application.gds_userInfo.getColumn(0, "vkgrp"); //지사코드
        	var bfVkgrpNm 	= application.gds_userInfo.getColumn(0, "vkgrpNm"); //지사Nm
        	var bfVkbur 	= application.gds_userInfo.getColumn(0, "vkbur"); //지점코드
        	var bfVkburNm 	= application.gds_userInfo.getColumn(0, "vkburNm"); //지점NM

        	
        	var afVkgrpNm 	= this.div_search.ed_salesGroupNm.value; //팝업 지사Nm
        	var afVkburNm 	= this.div_search.ed_salesOfficeNm.value; //팝업 지점Nm
        	
        	/* 렌탈지사지점 Check 해제 */
        // 	if (rentalGroup == "" || rentalGroup == null)
        // 	{
        // 		alert("렌탈지사를 선택하세요.");
        // 		return false;
        // 	}
        // 	if (rentalOffice == "" || rentalOffice == null)
        // 	{
        // 		alert("렌탈지점을 선택하세요.");
        // 		return false;
        // 	}
        	
        	if(userGrp == '04') { //지점
        		if(bfVkgrpNm != afVkgrpNm) {
        			alert("타 조직내역 조회 불가합니다.");
        			return;
        		}
        		if(bfVkburNm != afVkburNm) {
        			alert("타 조직내역 조회 불가합니다.");
        			return;
        		}
        	}
        	
        	if(userGrp == '03' || userGrp == '07') { //지사
        		if(bfVkgrpNm != afVkgrpNm) {
        			alert("타 조직내역 조회 불가합니다.");
        			return;
        		}
        	}
        	
        	var sArgs = "";	
        	sArgs += Ex.util.setParam("procDayF", procDayF);
        	sArgs += Ex.util.setParam("procDayT", procDayT);
        	sArgs += Ex.util.setParam("salesGroup", salesGroup);
        	sArgs += Ex.util.setParam("salesOffice", salesOffice);
        	sArgs += Ex.util.setParam("agencyCd", agencyCd);
        	sArgs += Ex.util.setParam("chanCd", chanCd);
        	sArgs += Ex.util.setParam("commTp", commTp);
        	sArgs += Ex.util.setParam("rentalGroup", rentalGroup);
        	sArgs += Ex.util.setParam("rentalOffice", rentalOffice);
        	sArgs += Ex.util.setParam("userId", userId);
        	
        	// timeout 시간(초) 조정
        	application.set_httptimeout(300);
        	
        	if( this.fn_getValid()) 
        	{	 		
        		if( ( this.toDay.substr(0,6) == procDayF.substr(0,6) ) && ( procDayF.substr(0,6) == procDayT.substr(0,6) ) ){
        			var sSvcID        	= "individualCommissionList";                    
        			var sController   	= "rtms/re/individualCommissionList.do";
        			var sInDatasets   	= "";
        			var sOutDatasets  	= "ds_list=output";
        			var fn_callBack		= "fn_callBack";
        			
        			Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        		}else{
        			var sSvcID        	= "getindividualCommissionList";                    
        			var sController   	= "rtms/re/getindividualCommissionList.do";
        			var sInDatasets   	= "";
        			var sOutDatasets  	= "ds_list=output";
        			var fn_callBack		= "fn_callBack";
        			
        			Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        		}
        	}
         }
        /***********************************************************************************
        * CallBack Event(strSvcId - Sevice ID, nErrorCode - ErrorCode, strErrorMsg - Error Message)
        ***********************************************************************************/
        this.fn_callBack = function(strSvcId,nErrorCode,strErrorMsg) {
        	if(nErrorCode < 0) {
        		return Ex.core.comMsg("alert", strErrorMsg);
        	}
        	
        	switch(strSvcId) {
        		//기간 
        		case "getToday":
        			 var sFirstDay = Eco.date.getFirstDate(this.toDay);
        			 this.div_search.cal_procDayF.set_value(sFirstDay);
        			 this.div_search.cal_procDayT.set_value(this.toDay);
        			break;
        		
        		case "userRentalGroupInfo":
        			//당월 조회
        			this.fn_getToday();
        			//버튼초기화
        			this.fn_initBtn();
        			//공통코드(채널)
        			this.fn_getChanCdCode();
        			//공통코드(수수료항목)
        			this.fn_getCommTpCode();
        			
        			this.fn_init();
        			break;
        		
        		case "getChanCdCode":
        			this.div_search.cb_chanCd.set_value(" ");
        			break;
        		
        		case "getCommTpCode":
        			this.div_search.cb_commTp.set_value(" ");
        			break;
        		
        		 //검색결과				
        		case "individualCommissionList":
        			if(this.ds_list.rowcount == 0) {
        			   this.div_search.grd_list.set_nodatatext("조회된 데이터가 없습니다.");
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

        //체크여부
        this.fn_getValid = function(){
        	if(nvl(this.div_search.cal_procDayF.value) == "" || nvl(this.div_search.cal_procDayT.value) == ""){
        		alert('기간을 다시 입력하세요');
        		this.div_search.cal_procDayF.setFocus();
        		return false;
        	}
        	
        	if(parseInt(nvl(this.div_search.cal_procDayF.value)) > parseInt(nvl(this.div_search.cal_procDayT.value))){
        		alert('기간을 다시 입력하세요');
        		this.div_search.cal_fromRecvDay.setFocus();
        		return false;
        	}

        	if(nvl(this.div_search.cal_procDayF.value).substr(0,6) != nvl(this.div_search.cal_procDayT.value).substr(0,6)){
        		alert('시작일자와 종료일자의 월이 같아야만 조회가 가능합니다.');
        		this.div_search.cal_procDayF.setFocus();
        		return false;
        	}else{
        		return true;
        	}		
        }

        
        //지사
        this.div_search_bt_salesGroupNm_onclick = function(obj,e)
        {
        	 var args ={p_arg:"RTRESaleCommission"};
        	 Ex.core.popup(this,"지사정보 조회","comm::RTCOMMVkgrp_pop.xfdl",args,"modaless=false");
        }

        this.div_search_bt_salesOfficeCd_onclick = function(obj,e)
        {
        	 var args ={p_arg:"RTRESaleCommission", p_rentalGroup:this.div_search.ed_salesGroupCd.value};
        		Ex.core.popup(this,"지점정보 조회","comm::RTCOMMVkbur_pop.xfdl",args,"modaless=false");
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
        		
        		Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
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
        			
        			Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
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
        					
        		Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
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
        	this.parent.setButton("E|S",this);		
        }

        //---------------------------------------------------------------------------------
        // 엑셀
        //---------------------------------------------------------------------------------
        this.fn_excel= function() {
        	Ex.core.exportExcel(this, this.grd_list);
        }
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.btn_search.addEventHandler("onclick", this.fn_search, this);
            this.div_search.ed_salesGroupCd.addEventHandler("onkeyup", this.div_search_ed_salesGroupCd_onkeyup, this);
            this.div_search.bt_salesGroupCd.addEventHandler("onclick", this.div_search_bt_salesGroupNm_onclick, this);
            this.div_search.ed_salesOfficeCd.addEventHandler("onkeyup", this.div_search_ed_salesOfficeCd_onkeyup, this);
            this.div_search.bt_salesOfficeCd.addEventHandler("onclick", this.div_search_bt_salesOfficeCd_onclick, this);
            this.div_search.ed_agencyCd.addEventHandler("onkeyup", this.div_search_ed_agencyCd_onkeyup, this);
            this.div_search.cal_procDayF.addEventHandler("oneditclick", this.div_search_cal_slcmFr_oneditclick, this);
            this.div_search.bt_agencyCd.addEventHandler("onclick", this.div_search_bt_agencyCd_onclick, this);

        };

        this.loadIncludeScript("RTREIndividualCommission.xfdl");

       
    };
}
)();
