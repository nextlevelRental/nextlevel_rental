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
                this.set_name("RTCDMClaim");
                this.set_classname("RTCMClaim");
                this.set_titletext("청구스케줄조회 - 청구현황");
                this._setFormPosition(0,0,1147,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("dsSdList", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"schdSeq\" type=\"INT\" size=\"256\"/><Column id=\"recpTp\" type=\"STRING\" size=\"256\"/><Column id=\"recpTpNm\" type=\"STRING\" size=\"256\"/><Column id=\"recpNu\" type=\"INT\" size=\"256\"/><Column id=\"scdStat\" type=\"STRING\" size=\"256\"/><Column id=\"saleAmt\" type=\"INT\" size=\"256\"/><Column id=\"saleNamt\" type=\"INT\" size=\"256\"/><Column id=\"saleVamt\" type=\"INT\" size=\"256\"/><Column id=\"recpAmt\" type=\"INT\" size=\"256\"/><Column id=\"arreAmt\" type=\"INT\" size=\"256\"/><Column id=\"demdDt\" type=\"STRING\" size=\"256\"/><Column id=\"zlspr\" type=\"STRING\" size=\"256\"/><Column id=\"rcDay\" type=\"STRING\" size=\"256\"/><Column id=\"taxDt\" type=\"STRING\" size=\"256\"/><Column id=\"taxNo\" type=\"STRING\" size=\"256\"/><Column id=\"canclDay\" type=\"STRING\" size=\"256\"/><Column id=\"begDay\" type=\"STRING\" size=\"256\"/><Column id=\"endDay\" type=\"STRING\" size=\"256\"/><Column id=\"notamt\" type=\"INT\" size=\"256\"/><Column id=\"zfbDay\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroup\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOffice\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroupNm\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOfficeNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsSdStaus", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cdNm\">전체</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsSdSort", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cdNm\">전체</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsRentalInfo", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"userId\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroup\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOffice\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroupNm\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOfficeNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Grid("Grid01", "absolute", "0", "143", "1122", "353", null, null, this);
            obj.set_taborder("4");
            obj.set_autofittype("none");
            obj.set_binddataset("dsSdList");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"100\"/><Column size=\"70\"/><Column size=\"70\"/><Column size=\"70\"/><Column size=\"70\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"85\"/><Column size=\"70\"/><Column size=\"85\"/><Column size=\"159\"/><Column size=\"120\"/><Column size=\"85\"/><Column size=\"85\"/><Column size=\"85\"/><Column size=\"85\"/><Column size=\"95\"/><Column size=\"95\"/><Column size=\"95\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"30\" band=\"summ\"/></Rows><Band id=\"head\"><Cell displaytype=\"normal\" edittype=\"none\" text=\"계약번호\"/><Cell col=\"1\" text=\"청구순번\"/><Cell col=\"2\" text=\"청구구분\"/><Cell col=\"3\" text=\"청구회차\"/><Cell col=\"4\" text=\"스케줄상태\"/><Cell col=\"5\" text=\"매출금액\"/><Cell col=\"6\" text=\"공급가\"/><Cell col=\"7\" text=\"부가세\"/><Cell col=\"8\" text=\"수납금액\"/><Cell col=\"9\" text=\"미납금액\"/><Cell col=\"10\" text=\"청구일자\"/><Cell col=\"11\" text=\"청구보류\"/><Cell col=\"12\" text=\"수납일자\"/><Cell col=\"13\" text=\"세금계산서발행일자(예정)\"/><Cell col=\"14\" text=\"세금계산서번호\"/><Cell col=\"15\" text=\"중도완납일\"/><Cell col=\"16\" text=\"시작일\"/><Cell col=\"17\" text=\"종료일\"/><Cell col=\"18\" text=\"기산일\"/><Cell col=\"19\" text=\"미도래원금\"/><Cell col=\"20\" text=\"렌탈지사명\"/><Cell col=\"21\" text=\"렌탈지점명\"/></Band><Band id=\"body\"><Cell displaytype=\"text\" edittype=\"readonly\" text=\"bind:ordNo\"/><Cell col=\"1\" text=\"bind:schdSeq\"/><Cell col=\"2\" text=\"bind:recpTpNm\"/><Cell col=\"3\" text=\"bind:recpNu\"/><Cell col=\"4\" text=\"bind:scdStat\"/><Cell col=\"5\" style=\"align:right;\" text=\"bind:saleAmt\"/><Cell col=\"6\" style=\"align:right;\" text=\"bind:saleNamt\"/><Cell col=\"7\" style=\"align:right;\" text=\"bind:saleVamt\"/><Cell col=\"8\" style=\"align:right;\" text=\"bind:recpAmt\"/><Cell col=\"9\" style=\"align:right;\" text=\"bind:arreAmt\"/><Cell col=\"10\" displaytype=\"date\" text=\"bind:demdDt\" calendardisplaynulltype=\"none\"/><Cell col=\"11\" text=\"bind:zlspr\"/><Cell col=\"12\" displaytype=\"date\" text=\"bind:rcDay\" calendardisplaynulltype=\"none\"/><Cell col=\"13\" displaytype=\"date\" text=\"bind:taxDt\" calendardisplaynulltype=\"none\"/><Cell col=\"14\" text=\"bind:taxNo\"/><Cell col=\"15\" displaytype=\"date\" text=\"bind:canclDay\" calendardisplaynulltype=\"none\"/><Cell col=\"16\" displaytype=\"date\" text=\"bind:begDay\" calendardisplaynulltype=\"none\"/><Cell col=\"17\" displaytype=\"date\" text=\"bind:endDay\" calendardisplaynulltype=\"none\"/><Cell col=\"18\" displaytype=\"date\" text=\"bind:zfbDay\" calendardisplaynulltype=\"none\"/><Cell col=\"19\" style=\"align:right;\" text=\"bind:notamt\"/><Cell col=\"20\" style=\"align:center;\" text=\"bind:rentalGroupNm\"/><Cell col=\"21\" style=\"align:center;\" text=\"bind:rentalOfficeNm\"/></Band><Band id=\"summary\"><Cell text=\"총합계\"/><Cell col=\"1\" style=\"align:right;\" expr=\"expr:dataset.getRowCount()+&quot;(건)&quot;\"/><Cell col=\"2\" style=\"align:right;\"/><Cell col=\"3\" style=\"align:right;\"/><Cell col=\"4\" style=\"align:right;\"/><Cell col=\"5\" displaytype=\"number\" style=\"align:right;\" expr=\"expr:dataset.getSum(&quot;saleAmt&quot;)\"/><Cell col=\"6\" displaytype=\"number\" style=\"align:right;\" expr=\"expr:dataset.getSum(&quot;saleNamt&quot;)\"/><Cell col=\"7\" displaytype=\"number\" style=\"align:right;\" expr=\"expr:dataset.getSum(&quot;saleVamt&quot;)\"/><Cell col=\"8\" displaytype=\"number\" style=\"align:right;\" text=\"expr:dataset.getSum(&quot;recpAmt&quot;)\"/><Cell col=\"9\" displaytype=\"number\" style=\"align:right;\" expr=\"expr:dataset.getSum(&quot;arreAmt&quot;)\"/><Cell col=\"10\" style=\"align:right;\"/><Cell col=\"11\" style=\"align:right;\"/><Cell col=\"12\" style=\"align:right;\"/><Cell col=\"13\" style=\"align:right;\"/><Cell col=\"14\" style=\"align:right;\"/><Cell col=\"15\" style=\"align:right;\"/><Cell col=\"16\" style=\"align:right;\"/><Cell col=\"17\" style=\"align:right;\"/><Cell col=\"18\" style=\"align:right;\"/><Cell col=\"19\" displaytype=\"number\" style=\"align:right;\" expr=\"expr:dataset.getSum(&quot;notamt&quot;)\"/><Cell col=\"20\" displaytype=\"number\" style=\"align:right;\" expr=\"expr:dataset.getSum(&quot;notamt&quot;)\"/><Cell col=\"21\" displaytype=\"number\" style=\"align:right;\" expr=\"expr:dataset.getSum(&quot;notamt&quot;)\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Button("btn_search", "absolute", "945", null, null, "25", "16", "735", this);
            obj.set_taborder("7");
            obj.set_text("조회");
            obj.set_cssclass("btn_WF_schArea");
            obj.getSetter("domainId").set("nexa.search");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0", "100", "1147", "20", null, null, this);
            obj.set_taborder("8");
            obj.set_text("Static02");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "0", "118", "169", "20", null, null, this);
            obj.set_taborder("9");
            obj.set_text("청구스케줄 LIST");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "0", "133", "1147", "10", null, null, this);
            obj.set_taborder("10");
            obj.set_text("Static02");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "1122", "0", "25", "496", null, null, this);
            obj.set_taborder("12");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "0", "0", "1122", "100", null, null, this);
            obj.set_taborder("16");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "25", "10", "80", "20", null, null, this.div_search);
            obj.set_taborder("97");
            obj.set_text("렌탈지사");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("vkgrpNm", "absolute", "225", "10", "118", "21", null, null, this.div_search);
            obj.set_taborder("98");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("150");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("vkgrpCd", "absolute", "105", "10", "120", "21", null, null, this.div_search);
            obj.set_taborder("99");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("3");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_save00", "absolute", "205", "9", "21", "21", null, null, this.div_search);
            obj.set_taborder("100");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("vkburCd", "absolute", "454", "10", "120", "21", null, null, this.div_search);
            obj.set_taborder("101");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("4");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_save01", "absolute", "553", "9", "21", "21", null, null, this.div_search);
            obj.set_taborder("102");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("vkburNm", "absolute", "574", "10", "118", "21", null, null, this.div_search);
            obj.set_taborder("103");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("150");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "723", "10", "80", "20", null, null, this.div_search);
            obj.set_taborder("104");
            obj.set_text("장착대리점");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("vkazcCd", "absolute", "803", "10", "120", "21", null, null, this.div_search);
            obj.set_taborder("105");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("10");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_save02", "absolute", "902", "9", "21", "21", null, null, this.div_search);
            obj.set_taborder("106");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("vkazcNm", "absolute", "923", "10", "118", "21", null, null, this.div_search);
            obj.set_taborder("107");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("120");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "374", "10", "80", "20", null, null, this.div_search);
            obj.set_taborder("108");
            obj.set_text("렌탈지점");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "25", "37", "80", "20", null, null, this.div_search);
            obj.set_taborder("109");
            obj.set_text("계약번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("orderCd", "absolute", "105", "37", "120", "21", null, null, this.div_search);
            obj.set_taborder("110");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_save04", "absolute", "205", "37", "21", "21", null, null, this.div_search);
            obj.set_taborder("111");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "374", "37", "80", "20", null, null, this.div_search);
            obj.set_taborder("112");
            obj.set_text("고객번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("custCd", "absolute", "454", "37", "120", "21", null, null, this.div_search);
            obj.set_taborder("113");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_save03", "absolute", "553", "37", "21", "21", null, null, this.div_search);
            obj.set_taborder("114");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("custNm", "absolute", "574", "37", "118", "21", null, null, this.div_search);
            obj.set_taborder("115");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("scdStat", "absolute", "803", "37", "120", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("116");
            obj.set_text("전체");
            obj.set_innerdataset("@dsSdStaus");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj.set_index("0");
            obj = new Static("Static05", "absolute", "723", "37", "80", "20", null, null, this.div_search);
            obj.set_taborder("117");
            obj.set_text("스케줄상태");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "25", "61", "80", "20", null, null, this.div_search);
            obj.set_taborder("118");
            obj.set_text("청구일자");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("dt", "absolute", "105", "64", "110", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("119");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Calendar("dt2", "absolute", "233", "64", "110", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("120");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Static("Static07", "absolute", "220", "66", "10", "21", null, null, this.div_search);
            obj.set_taborder("121");
            obj.set_text("~");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("recpTp", "absolute", "803", "63", "120", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("122");
            obj.set_text("전체");
            obj.set_innerdataset("@dsSdSort");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj.set_index("0");
            obj = new Static("Static08", "absolute", "723", "63", "80", "20", null, null, this.div_search);
            obj.set_taborder("123");
            obj.set_text("청구구분");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static09", "absolute", "1122", "0", "25", "496", null, null, this.div_search);
            obj.set_taborder("124");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static22", "absolute", "0", "0", "1118", "12", null, null, this.div_search);
            obj.set_taborder("125");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static10", "absolute", "0", "31", "1118", "6", null, null, this.div_search);
            obj.set_taborder("126");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static11", "absolute", "0", "58", "1118", "6", null, null, this.div_search);
            obj.set_taborder("127");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static12", "absolute", "0", "85", "1118", "12", null, null, this.div_search);
            obj.set_taborder("128");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static13", "absolute", "691", "0", "31", "96", null, null, this.div_search);
            obj.set_taborder("129");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static14", "absolute", "342", "0", "31", "96", null, null, this.div_search);
            obj.set_taborder("130");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static15", "absolute", "0", "0", "25", "96", null, null, this.div_search);
            obj.set_taborder("131");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1122, 100, this.div_search,
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
            		p.set_titletext("청구스케줄조회 - 청구현황");

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
        this.addIncludeScript("RTSDClaim.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDClaim.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분 : 청구스케줄조회(청구현황)
         * 02. 그룹명   : RTSDCleim.xfdl
         * 03. 그룹설명 :
         * 04. 작성일   : 2015.07.14
         * 05. 작성자   : 신정수
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
        this.codeName = "";
        this.agencyName = "";
             
        this.form_onload = function(obj,e)
        {

        	//폼로드시 공통함수 
        	Ex.core.init(obj);
        	
        	this.DateDemo(); //오늘날짜, 첫날 세팅
        	this.btn_search_onclick();
        	//this.fn_search();
        	this.fn_userRentalGroupInfo();
        	this.parent.setButton("E|S",this);
        	
        }

        //----------------------------------------------------------------------------------
        // Search: 사용자 렌탈그룹 조회
        //----------------------------------------------------------------------------------
        this.fn_userRentalGroupInfo = function()
        {
        	this.dsRentalInfo.clearData();
        	
        	var sSvcID        	= "userRentalGroupInfo";                    
        	var sController   	= "/rtms/sd/userRentalGroupInfo.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "dsRentalInfo=ds_output";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        		sArgs 			+= Ex.util.setParam("userId", application.gds_userInfo.getColumn(0, "userId"));
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }
        	

        this.fn_init = function(){

        	var userId = application.gds_userInfo.getColumn(0, "userId"); 	//id
        	var userNm = application.gds_userInfo.getColumn(0, "userNm"); 	//이름
        	var userGrp = application.gds_userInfo.getColumn(0, "userGrp"); //그룹
        	
        	var vkgrp = this.dsRentalInfo.getColumn(0, "rentalGroup"); 	//지사코드
        	var vkgrpNm = this.dsRentalInfo.getColumn(0, "rentalGroupNm"); //지사Nm
        	var vkbur = this.dsRentalInfo.getColumn(0, "rentalOffice"); 	//지점코드
        	var vkburNm = this.dsRentalInfo.getColumn(0, "rentalOfficeNm"); //지점NM
        	
        	var vkazc = application.gds_userInfo.getColumn(0, "vkazc");	 	//대리점
        	var vkazcNm = application.gds_userInfo.getColumn(0, "vkazcNm"); //대리점NM
        	
        	if(userGrp != '01' && userGrp != 'RM'){ 
        	
        		this.div_search.vkgrpCd.set_enable(false); 		//지사code 비활성
        		this.div_search.vkgrpNm.set_enable(false); 		//지사name 비활성
        		this.div_search.btn_save00.set_visible(false); 	//지사button visible
        		this.div_search.vkburCd.set_enable(false); 		//지점code 비활성 
        		this.div_search.vkburNm.set_enable(false); 		//지점name 비활성
        		this.div_search.btn_save01.set_visible(false); 	//지점button visible
        		this.div_search.vkazcCd.set_enable(false); 		//장착대리점code 비활성
        		this.div_search.vkazcNm.set_enable(false); 		//장착대리점name 비활성
        		this.div_search.btn_save02.set_visible(false); 	//장착대리점button visible
        		
        		this.div_search.vkgrpCd.set_value(vkgrp);
        		this.div_search.vkgrpNm.set_value(vkgrpNm);
        		this.div_search.vkburCd.set_value(vkbur);
        		this.div_search.vkburNm.set_value(vkburNm);
        		this.div_search.vkazcCd.set_value(userId);	
        		this.div_search.vkazcNm.set_value(userNm);
        	}
        }
        		
        //combobox DATA값 세팅
        this.btn_search_onclick = function(obj,e)
        {
        	var sSvcID        	= "claimService";
        	var sController   	= "/rtms/sd/claimController.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "dsSdStaus=output dsSdSort=output2";
        	var sArgs 			= "";	
        	var fn_callBack		= "";
        		
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }

        //조회버튼
        this.fn_search = function(obj,e) {
        	var demdFdt 		= nvl(this.div_search.dt.value); //청구시작일
        	var demdTdt 		= nvl(this.div_search.dt2.value); //청구마지막일
        	var salesGroup 		= ""; //지사
        	var salesOffice 	= ""; //지점
        	var agencyCd 		= nvl(this.div_search.vkazcCd.value); //장착대리점
        	var ordNo 			= nvl(this.div_search.orderCd.value); //주문번호
        	var custNo 			= nvl(this.div_search.custCd.value); //고객번호
        	var scdStat 		= nvl(this.div_search.scdStat.value); //스케쥴 상태코드
        	var recpTp 			= nvl(this.div_search.recpTp.value); //청구구분
        	var rentalGroup 	= nvl(this.div_search.vkgrpCd.value); //렌탈지사
        	var rentalOffice 	= nvl(this.div_search.vkburCd.value); //렌탈지점
        	var userId      	= application.gds_userInfo.getColumn(0, "userId"); //사용자ID
        	
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
        	
        	var sSvcID        	= "claimList";                    
        	var sController   	= "/rtms/sd/claimList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "dsSdList=output";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("demdFdt", demdFdt);
        	sArgs += Ex.util.setParam("demdTdt", demdTdt);
        	sArgs += Ex.util.setParam("salesGroup", salesGroup);
        	sArgs += Ex.util.setParam("salesOffice", salesOffice);
        	sArgs += Ex.util.setParam("agencyCd", agencyCd);
        	sArgs += Ex.util.setParam("ordNo", ordNo);
        	sArgs += Ex.util.setParam("custNo", custNo);
        	sArgs += Ex.util.setParam("scdStat", scdStat);
        	sArgs += Ex.util.setParam("recpTp", recpTp);
        	sArgs += Ex.util.setParam("rentalGroup", rentalGroup);
        	sArgs += Ex.util.setParam("rentalOffice", rentalOffice);
        	sArgs += Ex.util.setParam("userId", userId);
        		
        		
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        
        /* callBack함수 */
        this.fn_callBack = function(strSvcId,nErrorCode,strErrorMsg) {
        	if(nErrorCode < 0) {
        		return Ex.core.comMsg("alert", strErrorMsg);
        	}
        		
        	if (strSvcId == "userRentalGroupInfo") {
        		if (this.dsRentalInfo.getColumn(0, "rentalGroup") == "" || this.dsRentalInfo.getColumn(0, "rentalGroup") == null) return;
        		
        		this.fn_init();
        	}
        	
        	if (strSvcId == "claimList") 
        	{
        		if(nTotalCnt == 0) {
        			this.Div02.Grid00.set_nodatatext("조회된 데이터가 없습니다.");
        		}
        		
        	}
        	
        	if (strSvcId == "saveData") 
        	{
        		alert(strErrorMsg);
        		this.btn_search_onclick();
        	}
        	
        	if(strSvcId == "proRegService")
        	{
        		var cd = this.dsList.getColumn( num, "authGrpCd"); //순번에 있는 authGrpCd값 세팅
        		this.dsList.set_rowposition(num); //로우 선택
        		this.searchList(cd);
        		
        		if(this.dsUser.rowcount == 0) {
        			this.Div02.Grid00.set_nodatatext("조회된 데이터가 없습니다.");
        		}	
        	}
        	if(strSvcId == "getCodeS018") {
        		this.div_search.vkgrpNm.set_value(this.codeName);
        	}
        	if(strSvcId == "getCodeS019") {
        		this.div_search.vkburNm.set_value(this.codeName);
        	}
        	if(strSvcId == "getAgencyName") {
        		this.div_search.vkazcNm.set_value(nexacro._replaceAll(this.agencyName, "&#32;", " "));
        	}
        }
        	
        //오늘날짜와 오늘날짜 달의 첫날

        this.DateDemo = function(){

        	var obj, y, m, d, s = "";
        	obj = new Date();
        	s += obj.getFullYear();
        	m = obj.getMonth() + 1;
        	if(String(m).length == 1) {
        		m = "0" + m;
        	} 
        	s += m;
        	this.div_search.dt.set_value(s + "01"); //첫날
        	d = obj.getDate();
        	s += d;
        	
        	this.div_search.dt2.set_value(s); //오늘날짜
        }

        
        //지사
        this.showVkgrp = function(obj,e)
        {
        	  var args ={p_arg:"RTCMClaim"};
        	  Ex.core.popup(this,"렌탈지사 조회","comm::RTCOMMVkgrp_pop.xfdl",args,"modaless=false");
        }

        //지점
        this.showVkbur = function(obj,e)
        {
        	var args ={p_arg:"RTCMClaim", p_rentalGroup:this.div_search.vkgrpCd.value};
        	Ex.core.popup(this,"렌탈지점 조회","comm::RTCOMMVkbur_pop.xfdl",args,"modaless=false");
        }

        this._setReturn = function(val) {
        	var cd = val[0];
        	var nm = val[1];
        	var gb = val[2];
        	if(gb == "vkgrp") {
        		this.div_search.vkgrpCd.set_value(cd);
        		this.div_search.vkgrpNm.set_value(nm);
        	} else if(gb == "vkbur" ) {
        		this.div_search.vkburCd.set_value(cd);
        		this.div_search.vkburNm.set_value(nm);
        	} else if(gb == "vkazc" ) {
        		this.div_search.vkazcCd.set_value(cd);
        		this.div_search.vkazcNm.set_value(nm);
        	}
        }

        //장착대리점
        this.showVkazc = function(obj,e)
        {
        	var args = {p_vkgrpCd:this.div_search.vkgrpCd.value, p_vkgrpNm:this.div_search.vkgrpNm.value, 
        				p_vkburCd:this.div_search.vkburCd.value, p_vkburNm:this.div_search.vkburNm.value, 
        				p_formId : "RTSDClaim"};
        	Ex.core.popup(this,"대리점정보 검색","comm::RTCOMMAgency_pop.xfdl",args,"modaless=false");
        }
        this.return_agency = function(arr) {
        	this.div_search.vkgrpNm.set_value(arr[0]);
        	this.div_search.vkgrpCd.set_value(arr[1]);
        	this.div_search.vkburNm.set_value(arr[2]);
        	this.div_search.vkburCd.set_value(arr[3]);
        	this.div_search.vkazcNm.set_value(arr[4]);
        	this.div_search.vkazcCd.set_value(arr[5]);
        }

        //계약번호
        this.showVkorder = function(obj,e)
        {
        	var args ={p_arg:"RTSDClaim"};
        	Ex.core.popup(this,"계약번호 조회","comm::RTCOMMOrderNo_pop.xfdl", args ,"modaless=false");
        }

        //계약번호 파라미터 반환
        this.returnOrderNoInfo = function(val) {
        	this.div_search.orderCd.set_value(val);
        }

        //고객번호
        this.showVkcus = function(obj,e)
        {
        	var args ={p_arg:"RTSDClaim"};
        	Ex.core.popup(this,"고객찾기","comm::RTCOMMCust_pop.xfdl",args, "modaless=false");
        }
        //고객번호 파라미터 반환
        this.returnCustInfo = function(arr) {
        //alert(arr[0].saveXML());
        	var	custNo = arr[0].getColumn(0, "custNo");
        	var custNm = arr[0].getColumn(0, "custNm");
        	
        	this.div_search.custCd.set_value(custNo);
        	this.div_search.custNm.set_value(custNm);
        	
        }

        //지사 enter키 이벤트
        this.div_search_vkgrpCd_onkeyup = function(obj,e)
        {
        	if ( e.keycode == 13 ) {
        		var sSvcID        	= "getCodeS018";                    
        		var sController   	= "rtms/comm/getCodeName.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		sArgs += Ex.util.setParam("cd", this.div_search.vkgrpCd.value);
        		sArgs += Ex.util.setParam("cdGrpCd", "S018");
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
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
        		
        		sArgs += Ex.util.setParam("cd", this.div_search.vkburCd.value);
        		sArgs += Ex.util.setParam("cdGrpCd", "S019");
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        }

        //대리점 enter키 이벤트
        this.div_search_vkazcCd_onkeyup = function(obj,e)
        {
        	if ( e.keycode == 13 ) {
        		var sSvcID        	= "getAgencyName";                    
        		var sController   	= "rtms/comm/getAgencyName.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		sArgs += Ex.util.setParam("agencyCd", this.div_search.vkazcCd.value);
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        }

        //엑셀
        this.fn_excel= function() {
        	Ex.core.exportExcel(this, this.Grid01);
        }
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.btn_search.addEventHandler("onclick", this.fn_search, this);
            this.div_search.vkgrpCd.addEventHandler("onkeyup", this.div_search_vkgrpCd_onkeyup, this);
            this.div_search.btn_save00.addEventHandler("onclick", this.showVkgrp, this);
            this.div_search.vkburCd.addEventHandler("onkeyup", this.div_search_vkburCd_onkeyup, this);
            this.div_search.btn_save01.addEventHandler("onclick", this.showVkbur, this);
            this.div_search.vkazcCd.addEventHandler("onkeyup", this.div_search_vkazcCd_onkeyup, this);
            this.div_search.btn_save02.addEventHandler("onclick", this.showVkazc, this);
            this.div_search.btn_save04.addEventHandler("onclick", this.showVkorder, this);
            this.div_search.btn_save03.addEventHandler("onclick", this.showVkcus, this);

        };

        this.loadIncludeScript("RTSDClaim.xfdl");

       
    };
}
)();
