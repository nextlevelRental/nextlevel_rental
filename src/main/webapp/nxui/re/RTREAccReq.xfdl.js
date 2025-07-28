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
                this.set_name("frm_RTREAccReq");
                this.set_classname("test_form");
                this.set_titletext("계좌신청조회");
                this._setFormPosition(0,0,1147,496);
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
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"rpcDay\" type=\"STRING\" size=\"256\"/><Column id=\"bankCd\" type=\"STRING\" size=\"256\"/><Column id=\"acctNo\" type=\"STRING\" size=\"256\"/><Column id=\"depositor\" type=\"STRING\" size=\"256\"/><Column id=\"ebirDay\" type=\"STRING\" size=\"256\"/><Column id=\"buslNo\" type=\"STRING\" size=\"256\"/><Column id=\"acrqDay\" type=\"STRING\" size=\"256\"/><Column id=\"acrqSt\" type=\"STRING\" size=\"256\"/><Column id=\"acerCd\" type=\"STRING\" size=\"256\"/><Column id=\"acrqTp\" type=\"STRING\" size=\"256\"/><Column id=\"payDd\" type=\"STRING\" size=\"256\"/><Column id=\"acrqFg\" type=\"STRING\" size=\"256\"/><Column id=\"rpcUid\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_R011", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cdNm\">전체</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_R009", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cdNm\">전체</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_R003", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_R010", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_R001", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_user", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"agentNm\" type=\"string\" size=\"32\"/><Column id=\"userGrpNm\" type=\"string\" size=\"32\"/><Column id=\"agentId\" type=\"string\" size=\"32\"/><Column id=\"userGrp\" type=\"string\" size=\"32\"/><Column id=\"userNm\" type=\"string\" size=\"32\"/><Column id=\"vkgrpNm\" type=\"string\" size=\"32\"/><Column id=\"userId\" type=\"string\" size=\"32\"/><Column id=\"vkbur\" type=\"string\" size=\"32\"/><Column id=\"vkburNm\" type=\"string\" size=\"32\"/><Column id=\"vkgrp\" type=\"string\" size=\"32\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_R005", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_cust", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custTp\" type=\"STRING\" size=\"256\"/><Column id=\"custTp2\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"birthDay\" type=\"STRING\" size=\"256\"/><Column id=\"genderCd\" type=\"STRING\" size=\"256\"/><Column id=\"lfCd\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"mobFirm\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"faxNo\" type=\"STRING\" size=\"256\"/><Column id=\"bldMngNo\" type=\"STRING\" size=\"256\"/><Column id=\"posCd\" type=\"STRING\" size=\"256\"/><Column id=\"addr1\" type=\"STRING\" size=\"256\"/><Column id=\"addr2\" type=\"STRING\" size=\"256\"/><Column id=\"telNo2\" type=\"STRING\" size=\"256\"/><Column id=\"bldMngNo2\" type=\"STRING\" size=\"256\"/><Column id=\"posCd2\" type=\"STRING\" size=\"256\"/><Column id=\"addr12\" type=\"STRING\" size=\"256\"/><Column id=\"addr22\" type=\"STRING\" size=\"256\"/><Column id=\"safekey\" type=\"STRING\" size=\"256\"/><Column id=\"buslNo\" type=\"STRING\" size=\"256\"/><Column id=\"corpNo\" type=\"STRING\" size=\"256\"/><Column id=\"repNm\" type=\"STRING\" size=\"256\"/><Column id=\"oCustnm\" type=\"STRING\" size=\"256\"/><Column id=\"oBirthday\" type=\"STRING\" size=\"256\"/><Column id=\"oGendercd\" type=\"STRING\" size=\"256\"/><Column id=\"oLfcd\" type=\"STRING\" size=\"256\"/><Column id=\"oMobno\" type=\"STRING\" size=\"256\"/><Column id=\"oSafekey\" type=\"STRING\" size=\"256\"/><Column id=\"cCustnm\" type=\"STRING\" size=\"256\"/><Column id=\"cTelno\" type=\"STRING\" size=\"256\"/><Column id=\"emailAddr\" type=\"STRING\" size=\"256\"/><Column id=\"emailAddr1\" type=\"STRING\" size=\"256\"/><Column id=\"emailAddr2\" type=\"STRING\" size=\"256\"/><Column id=\"busiType\" type=\"STRING\" size=\"256\"/><Column id=\"busiCond\" type=\"STRING\" size=\"256\"/><Column id=\"taxYn\" type=\"STRING\" size=\"256\"/><Column id=\"kunnr\" type=\"STRING\" size=\"256\"/><Column id=\"ciCd\" type=\"STRING\" size=\"256\"/><Column id=\"diCd\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_R015", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cdNm\">전체</Col></Row></Rows>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Grid("grd_list", "absolute", "0", "113", "1122", "383", null, null, this);
            obj.set_taborder("6");
            obj.set_binddataset("ds_list");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"99\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"76\"/><Column size=\"121\"/><Column size=\"100\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"계약번호\"/><Cell col=\"1\" text=\"고객코드\"/><Cell col=\"2\" text=\"고객명\"/><Cell col=\"3\" text=\"차량번호\"/><Cell col=\"4\" text=\"변경등록일\"/><Cell col=\"5\" text=\"은행명\"/><Cell col=\"6\" text=\"계좌번호\"/><Cell col=\"7\" text=\"예금주\"/><Cell col=\"8\" text=\"법정생년월일\"/><Cell col=\"9\" text=\"사업자번호\"/><Cell col=\"10\" text=\"신청일\"/><Cell col=\"11\" text=\"신청상태\"/><Cell col=\"12\" text=\"오류내용\"/><Cell col=\"13\" text=\"신청구분\"/><Cell col=\"14\" text=\"결제일\"/><Cell col=\"15\" text=\"계좌신청발생구분\"/><Cell col=\"16\" text=\"결제변경요청자\"/></Band><Band id=\"body\"><Cell displaytype=\"text\" edittype=\"readonly\" text=\"bind:ordNo\"/><Cell col=\"1\" text=\"bind:custNo\"/><Cell col=\"2\" text=\"bind:custNm\"/><Cell col=\"3\" text=\"bind:carNo\"/><Cell col=\"4\" displaytype=\"date\" text=\"bind:rpcDay\" calendardisplaynulltype=\"none\"/><Cell col=\"5\" displaytype=\"combo\" text=\"bind:bankCd\" combodataset=\"ds_R001\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"6\" text=\"bind:acctNo\"/><Cell col=\"7\" text=\"bind:depositor\"/><Cell col=\"8\" text=\"bind:ebirDay\" mask=\"##-##-##\"/><Cell col=\"9\" text=\"bind:buslNo\" mask=\"###-##-#####\"/><Cell col=\"10\" displaytype=\"date\" text=\"bind:acrqDay\" calendardisplaynulltype=\"none\"/><Cell col=\"11\" displaytype=\"combo\" text=\"bind:acrqSt\" combodataset=\"ds_R009\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"12\" displaytype=\"combo\" text=\"bind:acerCd\" combodataset=\"ds_R003\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"13\" displaytype=\"combo\" text=\"bind:acrqTp\" combodataset=\"ds_R015\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"14\" displaytype=\"combo\" text=\"bind:payDd\" combodataset=\"ds_R005\" combocodecol=\"cd\" combodatacol=\"cdNm\" calendardisplaynulltype=\"none\"/><Cell col=\"15\" displaytype=\"combo\" text=\"bind:acrqFg\" combodataset=\"ds_R010\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"16\" text=\"bind:rpcUid\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "0", "0", null, "72", "25", null, this);
            obj.set_taborder("12");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Calendar("cal_fromDt", "absolute", "88", "10", "110", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("29");
            obj.set_readonly("false");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_value("null");
            obj = new Calendar("cal_toDt", "absolute", "213", "10", "110", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("30");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_value("null");
            obj = new Static("st_searchCondition00", "absolute", "20", "10", "90", "20", null, null, this.div_search);
            obj.set_taborder("31");
            obj.set_text("신청일자");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition01", "absolute", "20", "38", "90", "20", null, null, this.div_search);
            obj.set_taborder("32");
            obj.set_text("신청구분");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cbo_sinChungGubun", "absolute", "88", "37", "235", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("33");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj.set_innerdataset("@ds_R015");
            obj.set_displaynulltext("전체");
            obj.set_text("전체");
            obj.set_index("0");
            obj = new Static("st_searchCondition02", "absolute", "354", "11", "90", "20", null, null, this.div_search);
            obj.set_taborder("34");
            obj.set_text("계약번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("edt_ordNo", "absolute", "422", "10", "140", "21", null, null, this.div_search);
            obj.set_taborder("35");
            obj.set_enable("true");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_popUp", "absolute", "542", "9", "20", "21", null, null, this.div_search);
            obj.set_taborder("36");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition03", "absolute", "355", "38", "90", "20", null, null, this.div_search);
            obj.set_taborder("38");
            obj.set_text("신청상태");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cbo_sinChungSangTae", "absolute", "422", "37", "140", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("39");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj.set_innerdataset("@ds_R009");
            obj.set_displaynulltext("전체");
            obj.set_text("전체");
            obj.set_index("0");
            obj = new Static("st_searchCondition04", "absolute", "591", "11", "90", "20", null, null, this.div_search);
            obj.set_taborder("40");
            obj.set_text("고객번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("edt_custNo", "absolute", "674", "10", "110", "21", null, null, this.div_search);
            obj.set_taborder("41");
            obj.set_enable("true");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_custPopUp", "absolute", "765", "9", "20", "21", null, null, this.div_search);
            obj.set_taborder("42");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("edt_custNoKeyword", "absolute", "784", "10", "140", "21", null, null, this.div_search);
            obj.set_taborder("43");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition05", "absolute", "592", "38", "90", "20", null, null, this.div_search);
            obj.set_taborder("44");
            obj.set_text("변경등록자");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("edt_custRegNo", "absolute", "674", "37", "110", "21", null, null, this.div_search);
            obj.set_taborder("45");
            obj.set_lengthunit("ascii");
            obj.set_inputfilter("space");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_custPopUp00", "absolute", "765", "36", "20", "21", null, null, this.div_search);
            obj.set_taborder("46");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("edt_custRegNoKeyword", "absolute", "784", "37", "140", "21", null, null, this.div_search);
            obj.set_taborder("47");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "201", "10", "9", "21", null, null, this.div_search);
            obj.set_taborder("48");
            obj.set_text("~");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1122", "0", "25", "496", null, null, this);
            obj.set_taborder("13");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "0", "88", "81", "20", null, null, this);
            obj.set_taborder("15");
            obj.set_text("검색결과");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 0, 72, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("12");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1147, 496, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("test_form");
            		p.set_titletext("계좌신청조회");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item2","div_search.edt_custNo","value","ds_Search","SEARCH_KEYWORD");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item1","div_search.edt_custNoKeyword","value","ds_Search","SEARCH_KEYWORD");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item0","div_search.edt_custRegNo","value","ds_Search","SEARCH_KEYWORD");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item3","div_search.edt_custRegNoKeyword","value","ds_Search","SEARCH_KEYWORD");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTREAccReq.xfdl", "lib::comLib.xjs");
        this.registerScript("RTREAccReq.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분 : 수금관리 > CMS관리 > 계좌신청조회
         * 02. 그룹명   : RTREAccReq.xfdl
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
        	this.toDay  = "";
            //-------------------------------------------------------------------------------   
        	//폼로드시 공통함수      
        	//-------------------------------------------------------------------------------  	 
        	this.form_onload = function(obj,e)
        	{
        		Ex.core.init(obj); 	
        		this.fn_getCodeInfo();
        		//오늘날짜
        		this.get_date();
        		this.parent.setButton("E|S",this);
        	} 
        		 
        	/***********************************************************************************
        	* Transaction Function
        	***********************************************************************************/
            //-------------------------------------------------------------------------------  	
        	//공통코드 조회
            //-------------------------------------------------------------------------------  	
        	this.fn_getCodeInfo = function() 
        	{
        		var sSvcID      	= "getCodeInfo";  
        		var sController   	= "ntrms/re/getAccReqCode.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_R015=outputR015 ds_R011=outputR011 ds_R001=outputR001 ds_R003=outputR003 ds_R009=outputR009 ds_R010=outputR010 ds_R005=outputR005";
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
        		
            //-------------------------------------------------------------------------------  	
        	//조회
            //-------------------------------------------------------------------------------  	
        	this.fn_search = function() 
        	{
        		if(parseInt(nvl(this.div_search.cal_fromDt.value)) > parseInt(nvl(this.div_search.cal_toDt.value)))
        		{
        			alert('신청일자를 확인하세요.');
        			this.div_search.cal_fromDt.setFocus();
        			return;
        		}
        		this.ds_list.clearData();
        		/*	
        		if(nvl(this.div_search.edt_ordNoKeyword.value)=="" && nvl(this.div_search.edt_custNoKeyword.value)=="") 
        		{
        			this.alert("조회조건을 입력하세요.");
        			this.div_search.edt_ordNoKeyword.setFocus();
        			return;
        		}
        		else 
        		{
        		*/
        			var sSvcID        	= "listAccReq";                    
        			var sController   	= "ntrms/re/listAccReq.do";
        			var sInDatasets   	= "";
        			var sOutDatasets  	= "ds_list=output";
        			var sArgs 			= "";	
        			var fn_callBack		= "fn_callBack";
        	
        			var sFromDt		= this.div_search.cal_fromDt.value;
        			var sToDt		= this.div_search.cal_toDt.value;
        			var sAcrqTp		= this.div_search.cbo_sinChungGubun.value;
        			var sAcrqSt		= this.div_search.cbo_sinChungSangTae.value;
        			var sRpcUid		= this.div_search.edt_custRegNo.value;
        			var srchOrdNo  	= this.div_search.edt_ordNo.value;
        			var srchCustNo  = this.div_search.edt_custNo.value;
        			
        			sArgs += Ex.util.setParam("ordNo"	, nvl(srchOrdNo));
        			sArgs += Ex.util.setParam("custNo"	, nvl(srchCustNo));
        			sArgs += Ex.util.setParam("fromDt"	, nvl(sFromDt));
        			sArgs += Ex.util.setParam("toDt"	, nvl(sToDt));
        			sArgs += Ex.util.setParam("acrqTp"	, nvl(sAcrqTp));
        			sArgs += Ex.util.setParam("acrqSt"	, nvl(sAcrqSt));
        			sArgs += Ex.util.setParam("rpcUid"	, nvl(sRpcUid));
        			
        			Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 	
        		/*
        		}
        		*/
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
        			case "getCodeInfo":
        				break;
        			case "listAccReq":
        				if(this.ds_list.rowcount == 0) 
        				{
        					this.grd_list.set_nodatatext("조회된 데이터가 없습니다.");
        				}
        				break;
        			case "listUserInfo":
        				if(this.ds_user.rowcount > 0) 
        				{
        					this.div_search.edt_custRegNoKeyword.set_value(this.ds_user.getColumn(0,"userNm"));
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
        	//변경등록자 검색시 Enter키 이벤트 처리
            //-------------------------------------------------------------------------------  	
        	this.div_search_edt_custRegNo_onkeyup = function(obj,e)
        	{
        		if(obj.value == "") {
        			this.div_search.edt_custRegNoKeyword.set_value("");				
        		}
        		if ( e.keycode == 13 )
        		{
        			this.fn_getUserNm();
        		}		
        	}	
            //-------------------------------------------------------------------------------  	
        	//계약번호  Enter키 이벤트 처리
            //-------------------------------------------------------------------------------  	
        	this.edt_ordNo_onkeyup = function(obj,e)
        	{
        		if ( e.keycode == 13 )
        		{
        			if(nvl(this.div_search.edt_ordNo.value) == "") {
        				this.alert("계약번호를 입력하세요");
        				this.div_search.edt_ordNo.setFocus();
        				return;
        			}
        			//계약명 조회
        			this.fn_getOrdNm();
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
        	/***********************************************************************************
        	* User Function
        	***********************************************************************************/
            //-------------------------------------------------------------------------------  
        	//엑셀저장
            //-------------------------------------------------------------------------------  	
        	this.fn_excel = function(obj,e)
        	{
        		Ex.core.exportExcel(this, this.grd_list, "리스트");
        	}
        	
            //-------------------------------------------------------------------------------  
        	//VALID 체크
            //-------------------------------------------------------------------------------  	
        	
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
        	//변경등록자 팝업창
            //-------------------------------------------------------------------------------  	
        	this.fn_regIdPopUp = function(obj,e)
        	{
        		var args ={p_arg:""};
        		Ex.core.popup(this,"사용자찾기","comm::RTCOMMUser_pop.xfdl",args, "modaless=false");
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
            //-------------------------------------------------------------------------------  
        	// 변경등록자 파라미터 반환
            //-------------------------------------------------------------------------------  		
        	this.returnUserInfo = function(arr) {
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
            //-------------------------------------------------------------------------------  
        	// 파라미터 반환
            //-------------------------------------------------------------------------------  	
        	this._setReturn = function(ds) {

        
        	}
            //-------------------------------------------------------------------------------  
        	// 변경등록자 검색
            //-------------------------------------------------------------------------------  	
        	this.fn_getUserNm = function() 
        	{
        		var sSvcID        	= "listUserInfo";                    
        		var sController   	= "listUserInfo.do";
        		var sInDatasets   	= "user_=ds_user";
        		var sOutDatasets  	= "ds_user=listUser";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		sArgs += Ex.util.setParam("userId", this.div_search.edt_custRegNo.value);
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 	
        	}
            //-------------------------------------------------------------------------------  	
        	//계약명 조회
            //-------------------------------------------------------------------------------  	
        	this.fn_getOrdNm = function() {
        	
        	
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
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.ds_user.addEventHandler("onrowposchanged", this.checkSaveMode, this);
            this.addEventHandler("onload", this.form_onload, this);
            this.div_search.cal_fromDt.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.div_search.cal_toDt.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.div_search.btn_popUp.addEventHandler("onclick", this.fn_odrPopUp, this);
            this.div_search.edt_custNo.addEventHandler("onkeyup", this.custNo_onkeyup, this);
            this.div_search.btn_custPopUp.addEventHandler("onclick", this.fn_custPopUp, this);
            this.div_search.edt_custNoKeyword.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.div_search.edt_custRegNo.addEventHandler("onkeyup", this.div_search_edt_custRegNo_onkeyup, this);
            this.div_search.btn_custPopUp00.addEventHandler("onclick", this.fn_regIdPopUp, this);
            this.div_search.edt_custRegNoKeyword.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);

        };

        this.loadIncludeScript("RTREAccReq.xfdl");

       
    };
}
)();
