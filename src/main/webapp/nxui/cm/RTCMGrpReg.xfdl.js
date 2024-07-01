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
                this.set_name("RTCMGrpReg");
                this.set_classname("RTCMGrpReg");
                this.set_titletext("권한그룹-사용자/조직등록");
                this._setFormPosition(0,0,1147,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_grCb", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsList", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"authGrpCd\" type=\"STRING\" size=\"256\"/><Column id=\"authGrpNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsAuth", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"check\" type=\"STRING\" size=\"256\"/><Column id=\"userId\" type=\"STRING\" size=\"256\"/><Column id=\"userNm\" type=\"STRING\" size=\"256\"/><Column id=\"userGrp\" type=\"STRING\" size=\"256\"/><Column id=\"userGrpNm\" type=\"STRING\" size=\"256\"/><Column id=\"vkgrp\" type=\"STRING\" size=\"256\"/><Column id=\"vkgrpNm\" type=\"STRING\" size=\"256\"/><Column id=\"vkbur\" type=\"STRING\" size=\"256\"/><Column id=\"vkburNm\" type=\"STRING\" size=\"256\"/><Column id=\"agentId\" type=\"STRING\" size=\"256\"/><Column id=\"agentNm\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroup\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOffice\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroupNm\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOfficeNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsUser", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"check\" type=\"STRING\" size=\"256\"/><Column id=\"userId\" type=\"STRING\" size=\"256\"/><Column id=\"userNm\" type=\"STRING\" size=\"256\"/><Column id=\"userGrp\" type=\"STRING\" size=\"256\"/><Column id=\"userGrpNm\" type=\"STRING\" size=\"256\"/><Column id=\"vkgrp\" type=\"STRING\" size=\"256\"/><Column id=\"vkgrpNm\" type=\"STRING\" size=\"256\"/><Column id=\"vkbur\" type=\"STRING\" size=\"256\"/><Column id=\"vkburNm\" type=\"STRING\" size=\"256\"/><Column id=\"agentId\" type=\"STRING\" size=\"256\"/><Column id=\"agentNm\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroup\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOffice\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroupNm\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOfficeNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_grCb2", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cd\">0</Col><Col id=\"cdNm\">선택</Col></Row><Row><Col id=\"cd\">1</Col><Col id=\"cdNm\">사용자ID</Col></Row><Row><Col id=\"cd\">2</Col><Col id=\"cdNm\">사용자명</Col></Row></Rows>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Grid("Grid01", "absolute", "319", "86", null, "180", "25", null, this);
            obj.set_taborder("29");
            obj.set_binddataset("dsAuth");
            obj.set_autofittype("none");
            obj.set_scrollbars("autoboth");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"30\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"80\"/><Column size=\"100\"/><Column size=\"80\"/><Column size=\"100\"/><Column size=\"80\"/><Column size=\"100\"/><Column size=\"80\"/><Column size=\"100\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\"/><Cell col=\"1\" text=\"사용자ID\"/><Cell col=\"2\" text=\"사용자명\"/><Cell col=\"3\" text=\"사용자그룹\"/><Cell col=\"4\" text=\"사용자그룹명\"/><Cell col=\"5\" text=\"지사코드\"/><Cell col=\"6\" text=\"지사명\"/><Cell col=\"7\" text=\"지점코드\"/><Cell col=\"8\" text=\"지점명\"/><Cell col=\"9\" text=\"대리점코드\"/><Cell col=\"10\" text=\"대리점명\"/></Band><Band id=\"body\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\" text=\"bind:check\"/><Cell col=\"1\" text=\"bind:userId\"/><Cell col=\"2\" text=\"bind:userNm\"/><Cell col=\"3\" text=\"bind:userGrp\"/><Cell col=\"4\" text=\"bind:userGrpNm\"/><Cell col=\"5\" text=\"bind:vkgrp\"/><Cell col=\"6\" text=\"bind:vkgrpNm\"/><Cell col=\"7\" text=\"bind:vkbur\"/><Cell col=\"8\" text=\"bind:vkburNm\"/><Cell col=\"9\" text=\"bind:agentId\"/><Cell col=\"10\" text=\"bind:agentNm\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "318", "56", "300", "31", null, null, this);
            obj.set_taborder("4");
            obj.set_text("권한그룹별 사용자");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "318", "277", "69", "31", null, null, this);
            obj.set_taborder("8");
            obj.set_text("검색");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Grid("Grid00", "absolute", "-1", "65", "300", "431", null, null, this);
            obj.set_taborder("14");
            obj.set_binddataset("dsList");
            obj.set_autofittype("none");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"140\"/><Column size=\"160\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"권한그룹코드\"/><Cell col=\"1\" text=\"권한그룹명\"/></Band><Band id=\"body\"><Cell text=\"bind:authGrpCd\"/><Cell col=\"1\" text=\"bind:authGrpNm\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "1122", "0", "25", "496", null, null, this);
            obj.set_taborder("15");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "45", "1122", "20", null, null, this);
            obj.set_taborder("16");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "319", "76", "802", "10", null, null, this);
            obj.set_taborder("18");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "0", "0", null, "45", "25", null, this);
            obj.set_taborder("19");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_searchCondition", "absolute", "20", "0", "90", "41", null, null, this.div_search);
            obj.set_taborder("21");
            obj.set_text("권한 그룹");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cmb_searchCondition", "absolute", "93", "10", "140", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            var cmb_searchCondition_innerdataset = new Dataset("cmb_searchCondition_innerdataset", this.div_search.cmb_searchCondition);
            cmb_searchCondition_innerdataset._setContents("<ColumnInfo><Column id=\"codecolumn\" size=\"256\"/><Column id=\"datacolumn\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"codecolumn\">0</Col><Col id=\"datacolumn\">아이디</Col></Row><Row><Col id=\"codecolumn\">1</Col><Col id=\"datacolumn\">이름</Col></Row></Rows>");
            obj.set_innerdataset(cmb_searchCondition_innerdataset);
            obj.set_taborder("22");
            obj.set_codecolumn("codecolumn");
            obj.set_datacolumn("datacolumn");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new Edit("edt_searchKeyword", "absolute", "238", "10", "260", "21", null, null, this.div_search);
            obj.set_taborder("23");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static22", "absolute", "1", "0", null, "12", "430", null, this);
            obj.set_taborder("20");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static23", "absolute", "1", "33", null, "12", "430", null, this);
            obj.set_taborder("21");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "0", "0", "20", "45", null, null, this);
            obj.set_taborder("22");
            obj.set_text("FIX \r\nw20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static45", "absolute", "90", "14", "1", "30", null, null, this);
            obj.set_taborder("23");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_background("red");
            this.addChild(obj.name, obj);

            obj = new Static("Static46", "absolute", "95", "14", "1", "30", null, null, this);
            obj.set_taborder("24");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_background("red");
            this.addChild(obj.name, obj);

            obj = new Static("Static49", "absolute", "235", "14", null, "30", "911", null, this);
            obj.set_taborder("25");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_background("red");
            this.addChild(obj.name, obj);

            obj = new Static("Static48", "absolute", "240", "14", null, "30", "906", null, this);
            obj.set_taborder("26");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_background("red");
            this.addChild(obj.name, obj);

            obj = new Static("Static47", "absolute", "226", "40", null, "21", "874", null, this);
            obj.set_taborder("27");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_color("red");
            this.addChild(obj.name, obj);

            obj = new Static("Static44", "absolute", "81", "40", "47", "21", null, null, this);
            obj.set_taborder("28");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_color("red");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "299", "65", "20", "431", null, null, this);
            obj.set_taborder("30");
            obj.set_text("FIX\r\nw20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Grid("Grid02", "absolute", "319", "307", null, "189", "25", null, this);
            obj.set_taborder("31");
            obj.set_binddataset("dsUser");
            obj.set_autofittype("none");
            obj.set_scrollbars("autoboth");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"30\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"80\"/><Column size=\"100\"/><Column size=\"80\"/><Column size=\"100\"/><Column size=\"80\"/><Column size=\"100\"/><Column size=\"80\"/><Column size=\"100\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\"/><Cell col=\"1\" text=\"사용자ID\"/><Cell col=\"2\" text=\"사용자명\"/><Cell col=\"3\" text=\"사용자그룹\"/><Cell col=\"4\" text=\"사용자그룹명\"/><Cell col=\"5\" text=\"지사코드\"/><Cell col=\"6\" text=\"지사명\"/><Cell col=\"7\" text=\"지점코드\"/><Cell col=\"8\" text=\"지점명\"/><Cell col=\"9\" text=\"대리점코드\"/><Cell col=\"10\" text=\"대리점명\"/></Band><Band id=\"body\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\" text=\"bind:check\"/><Cell col=\"1\" displaytype=\"text\" edittype=\"text\" text=\"bind:userId\"/><Cell col=\"2\" text=\"bind:userNm\"/><Cell col=\"3\" text=\"bind:userGrp\"/><Cell col=\"4\" text=\"bind:userGrpNm\"/><Cell col=\"5\" text=\"bind:vkgrp\"/><Cell col=\"6\" text=\"bind:vkgrpNm\"/><Cell col=\"7\" text=\"bind:vkbur\"/><Cell col=\"8\" text=\"bind:vkburNm\"/><Cell col=\"9\" text=\"bind:agentId\"/><Cell col=\"10\" text=\"bind:agentNm\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static07", "absolute", "319", "266", "803", "20", null, null, this);
            obj.set_taborder("32");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static08", "absolute", "319", "297", "803", "10", null, null, this);
            obj.set_taborder("33");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_searchKeyword2", "absolute", "510", "280", "149", "21", null, null, this);
            obj.set_taborder("6");
            this.addChild(obj.name, obj);

            obj = new Combo("cmb_searchCondition2", "absolute", "391", "280", "113", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("7");
            obj.set_value("0");
            obj.set_text("선택");
            obj.set_innerdataset("@ds_grCb2");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj.set_index("0");

            obj = new Button("Button37", "absolute", "669", "280", "45", "22", null, null, this);
            obj.set_taborder("34");
            obj.set_text("조회");
            obj.set_cssclass("btn_WF_module");
            this.addChild(obj.name, obj);

            obj = new Button("Button09", "absolute", null, "279", "23", "23", "28", null, this);
            obj.set_taborder("35");
            obj.set_cssclass("btn_WF_suttleB");
            this.addChild(obj.name, obj);

            obj = new Button("Button06", "absolute", null, "279", "23", "23", "54", null, this);
            obj.set_taborder("36");
            obj.set_cssclass("btn_WF_suttleT");
            this.addChild(obj.name, obj);

            obj = new Static("Static32", "absolute", "271", "67", "30", "1", null, null, this);
            obj.set_taborder("37");
            obj.set_visible("false");
            obj.style.set_background("red");
            this.addChild(obj.name, obj);

            obj = new Static("Static33", "absolute", "271", "96", null, "1", "846", null, this);
            obj.set_taborder("38");
            obj.set_visible("false");
            obj.style.set_background("red");
            this.addChild(obj.name, obj);

            obj = new Static("Static34", "absolute", "292", "73", "50", "21", null, null, this);
            obj.set_taborder("39");
            obj.set_text("H:30px");
            obj.set_visible("false");
            obj.style.set_color("red");
            this.addChild(obj.name, obj);

            obj = new Static("Static35", "absolute", "294", "50", "59", "21", null, null, this);
            obj.set_taborder("40");
            obj.set_text("Line H:2px");
            obj.set_visible("false");
            obj.style.set_color("red");
            this.addChild(obj.name, obj);

            obj = new Static("Static09", "absolute", "1097", "88", "30", "1", null, null, this);
            obj.set_taborder("41");
            obj.set_visible("false");
            obj.style.set_background("red");
            this.addChild(obj.name, obj);

            obj = new Static("Static10", "absolute", "1097", "117", null, "1", "20", null, this);
            obj.set_taborder("42");
            obj.set_visible("false");
            obj.style.set_background("red");
            this.addChild(obj.name, obj);

            obj = new Static("Static11", "absolute", "1118", "94", "50", "21", null, null, this);
            obj.set_taborder("43");
            obj.set_text("H:30px");
            obj.set_visible("false");
            obj.style.set_color("red");
            this.addChild(obj.name, obj);

            obj = new Static("Static12", "absolute", "1120", "71", "59", "21", null, null, this);
            obj.set_taborder("44");
            obj.set_text("Line H:2px");
            obj.set_visible("false");
            obj.style.set_color("red");
            this.addChild(obj.name, obj);

            obj = new Static("Static13", "absolute", "1081", "261", "47", "21", null, null, this);
            obj.set_taborder("45");
            obj.set_text("3 px");
            obj.set_visible("false");
            obj.style.set_color("red");
            this.addChild(obj.name, obj);

            obj = new Static("Static14", "absolute", "1093", "277", "1", "30", null, null, this);
            obj.set_taborder("46");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_background("red");
            this.addChild(obj.name, obj);

            obj = new Static("Static15", "absolute", "1095", "277", "1", "30", null, null, this);
            obj.set_taborder("47");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_background("red");
            this.addChild(obj.name, obj);

            obj = new Static("Static16", "absolute", "499", "260", "47", "21", null, null, this);
            obj.set_taborder("48");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_color("red");
            this.addChild(obj.name, obj);

            obj = new Static("Static17", "absolute", "504", "277", "1", "30", null, null, this);
            obj.set_taborder("49");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_background("red");
            this.addChild(obj.name, obj);

            obj = new Static("Static18", "absolute", "510", "277", "1", "30", null, null, this);
            obj.set_taborder("50");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_background("red");
            this.addChild(obj.name, obj);

            obj = new Static("Static19", "absolute", "668", "277", "1", "30", null, null, this);
            obj.set_taborder("51");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_background("red");
            this.addChild(obj.name, obj);

            obj = new Static("Static20", "absolute", "659", "277", "1", "30", null, null, this);
            obj.set_taborder("52");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_background("red");
            this.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "654", "260", "47", "21", null, null, this);
            obj.set_taborder("53");
            obj.set_text("10 px");
            obj.set_visible("false");
            obj.style.set_color("red");
            this.addChild(obj.name, obj);

            obj = new Static("Static24", "absolute", "500", "0", null, "44", "617", null, this);
            obj.set_taborder("54");
            obj.set_text("FIX \r\nw30");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 0, 45, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("19");
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
            		p.set_classname("RTCMGrpReg");
            		p.set_titletext("권한그룹-사용자/조직등록");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCMGrpReg.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCMGrpReg.xfdl", function() {

        
        /***********************************************************************
         * Script Include 
         ************************************************************************/
        //include "lib::comLib.xjs";

        var num;
        var cd;
        var rnum;
        var checkAuthMenuCd;

        this.form_onload = function(obj,e) //온로드시 처리작업
        	{

        		Ex.core.init(obj);
        		//this.div_search.cmb_searchCondition.set_index(0);
        		this.fn_search();
        		this.parent.setButton("E|C|S", this);
        	} 

        
        //권한그룹 사용자 좌측 Grid 조회
        this.fn_search = function(obj,e)
        {
        	var sSvcID        	= "grpRegService";                    
        	var sController   	= "/ntrms/cm/grpRegController.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "dsList=output ds_grCb=output2";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        		
        	this.dsList.clearData();
        	if(this.div_search.cmb_searchCondition.value == "AUTHGRPCD"){ 
        		sArgs = "authGrpCd=" + nvl(this.div_search.edt_searchKeyword.value);
        	} else if(this.div_search.cmb_searchCondition.value == "AUTHGRPNM") {
        		if(this.div_search.edt_searchKeyword.getLength() < 2) {
        			alert("2자이상 입력해주세요")
        			return false;
        		} else {
        			sArgs = "authGrpNm=" + nvl(this.div_search.edt_searchKeyword.value);
        		}
        		
        	} else if(this.div_search.cmb_searchCondition.value == 0) {
        	
        		//alert("검색조건을 선택해주세요.");
        		//return false;
        	} else {
        		var params = "";
        	}
        	this.dsAuth.clearData(); //해당 그리드 초기화
        	this.dsUser.clearData(); //해당 그리드 초기화
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }

        //권한그룹 사용자 우측 하단 Grid 조회
        this.btn_search2_onclick = function(obj,e)
        {
        	rnum = this.dsList.rowposition;
        	checkAuthMenuCd  = this.dsList.getColumn(rnum, "authGrpCd");
        	var sSvcID        	= "grpRegService2";                    
        	var sController   	= "/ntrms/cm/grpRegController3.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "dsUser=output";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	if(this.cmb_searchCondition2.value == 1){
        		if(this.edt_searchKeyword2.getLength() == 0) {
        			alert("사용자ID를 입력해주세요");
        		} else {
        			sArgs = "userId=" + nvl(this.edt_searchKeyword2.value)+" cd=" + checkAuthMenuCd;;;
        		}
        		
        	} else if(this.cmb_searchCondition2.value == 2) {
        		if(this.edt_searchKeyword2.getLength() < 2) {
        			alert("2자이상 입력해주세요")
        			return false;
        		} else {
        			sArgs = "userNm=" + nvl(this.edt_searchKeyword2.value)+" cd=" + checkAuthMenuCd;;;
        		}
        		
        	} else if(this.cmb_searchCondition2.value == 0) {
        		alert("검색조건을 선택해주세요.");
        		return false;
        	}
        	this.dsUser.clearData();
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        	/***********************************************************************************
        	* CallBack Event (strSvcId - Sevice ID, nErrorCode - ErrorCode, strErrorMsg - Error Message)
        	***********************************************************************************/

        	/* callBack함수 */
        	this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg)
        	{
        		if (nErrorCode < 0) 
        		{
        			alert(strErrorMsg);		
        			return;
        		}
        		
        		if (strSvcId == "searchList") 
        		{
        			//var nTotalCnt = this.dsList.rowcount;
        			//this.sta_total_cnt.set_text(nTotalCnt);
        			//this.grd_Group.hscrollbar ;
        			
        			if(this.dsUser.rowcount == 0) {
        				this.Div02.Grid00.set_nodatatext("조회된 데이터가 없습니다.");
        			}	
        			
        		}
        		
        		if (strSvcId == "saveData") 
        		{
        			alert(strErrorMsg);
        			this.fn_search();
        		}
        		
        		if(strSvcId == "grpRegService")
        		{
        			var cd = this.dsList.getColumn( num, "authGrpCd"); //순번에 있는 authGrpCd값 세팅
        			this.dsList.set_rowposition(num); //로우 선택
        			this.searchList(cd);
        			
        			if(this.dsUser.rowcount == 0) {
        				this.Div02.Grid00.set_nodatatext("조회된 데이터가 없습니다.");
        			}	
        		}
        	}
        //저장
         this.fn_save = function(obj,e)
        	{
        		var idx = this.dsList.rowposition;
        		var checkAuthGrpCd  = this.dsList.getColumn(idx, "authGrpCd");
        		var sSvcID        	= "saveData";                    
        		var sController   	= "/ntrms/cm/grpRegSaveDaset.do";
        		var sInDatasets   	= "input=dsAuth:U";
        		var sOutDatasets  	= "";
        		var sArgs 			= "authGrpCd=" + checkAuthGrpCd;	
        		var fn_callBack		= "fn_callBack";
        		
        		/*
        		for(var i=0; i < this.dsAuth.getRowCount(); i++) {
        			alert(this.dsAuth.getRowType(i));
        		}
        		
        		if() {
        			sInDatasets   		= "input=dsAuth:U";
        		} else {
        			sInDatasets   		= "input=dsUser:U";
        		}
        		*/
        		sOutDatasets  		= "";
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}

        
        //상단검색시 Enter키 이벤트 처리
        this.div_search_edt_searchKeyword_onkeyup = function(obj,e)
        {
        	if ( e.keycode == 13 )
        	{
        		this.fn_search();
        	}
        }
        //하단검색시 Enter키 이벤트 처리
        this.div_search_edt_searchKeyword2_onkeyup = function(obj,e)
        {
        	if ( e.keycode == 13 )
        	{
        		this.btn_search2_onclick();
        	}
        }

        //상단 조회
        this.Div00_Grid00_oncellclick = function(obj,e)
        {
        	num = this.dsList.rowposition; //row 순번가져오기
        	cd = this.dsList.getColumn( num, "authGrpCd"); //순번에 있는 authGrpCd값 세팅
        	this.searchList(cd);
        }

        //권한그룹 사용자 우측 상단 하단 Grid 정보 가져오기
        this.searchList = function(cd)
        	{
        		var sSvcID        	= "searchList";                    
        		var sController   	= "/ntrms/cm/grpRegController2.do";
        		var sInDatasets   	= "";
        		
        		var sOutDatasets  	= "dsAuth=listAuth dsUser=listUser";
        		var sArgs 			= "cd="+cd;

        		var fn_callBack		= "fn_callBack";
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}

        //위 버튼
        this.Button00_onclick = function(obj,e)
        {
        	var cnt = this.dsUser.rowcount;
        	var checkCnt = 0;
        	
        	for(var i = cnt; i >=0; i--) {
        		if(this.dsUser.getColumn(i, "check")  == "1") {
        			var userId = this.dsUser.getColumn(i, "userId");
        			var userNm = this.dsUser.getColumn(i, "userNm");
        			var userGrp = this.dsUser.getColumn(i, "userGrp");
        			var userGrpNm = this.dsUser.getColumn(i, "userGrpNm");
        			var vkgrp = this.dsUser.getColumn(i, "vkgrp");
        			var vkgrpNm = this.dsUser.getColumn(i, "vkgrpNm");
        			var vkbur = this.dsUser.getColumn(i, "vkbur");
        			var vkburNm = this.dsUser.getColumn(i, "vkburNm");
        			var agentId = this.dsUser.getColumn(i, "agentId");
        			var agentNm = this.dsUser.getColumn(i, "agentNm");
        			
        			//로우 생성및 순번값
        			var idx = this.dsAuth.addRow();
        			
        			// 로우값 컬럼별로 세팅
        			this.dsAuth.setColumn(idx, "userId" , userId);
        			this.dsAuth.setColumn(idx, "userNm" , userNm);
        			this.dsAuth.setColumn(idx, "userGrp" , userGrp);
        			this.dsAuth.setColumn(idx, "userGrpNm" , userGrpNm);
        			this.dsAuth.setColumn(idx, "vkgrp" , vkgrp);
        			this.dsAuth.setColumn(idx, "vkgrpNm" , vkgrpNm);
        			this.dsAuth.setColumn(idx, "vkbur" , vkbur);
        			this.dsAuth.setColumn(idx, "vkburNm" , vkburNm);
        			this.dsAuth.setColumn(idx, "agentId" , agentId);
        			this.dsAuth.setColumn(idx, "agentNm" , agentNm);
        			this.dsUser.deleteRow(i);
        			
        			checkCnt++;
        		}
        	}
        	if(checkCnt == 0) {
        		alert("등록하실 사용자를 선택해주세요.");
        	}
        }

        // 아래버튼

        this.Button01_onclick = function(obj,e)
        {
        	var cnt = this.dsAuth.rowcount;
        	var checkCnt = 0;
        	
        	for(var i = cnt; i >=0; i--) {
        		if(this.dsAuth.getColumn(i, "check")  == "1") {
        			var userId = this.dsAuth.getColumn(i, "userId");
        			var userNm = this.dsAuth.getColumn(i, "userNm");
        			var userGrp = this.dsAuth.getColumn(i, "userGrp");
        			var userGrpNm = this.dsAuth.getColumn(i, "userGrpNm");
        			var vkgrp = this.dsAuth.getColumn(i, "vkgrp");
        			var vkgrpNm = this.dsAuth.getColumn(i, "vkgrpNm");
        			var vkbur = this.dsAuth.getColumn(i, "vkbur");
        			var vkburNm = this.dsAuth.getColumn(i, "vkburNm");
        			var agentId = this.dsAuth.getColumn(i, "agentId");
        			var agentNm = this.dsAuth.getColumn(i, "agentNm");
        			
        			//로우 생성및 순번값
        			var idx = this.dsUser.addRow();
        			
        			// 로우값 컬럼별로 세팅
        			this.dsUser.setColumn(idx, "userId" , userId);
        			this.dsUser.setColumn(idx, "userNm" , userNm);
        			this.dsUser.setColumn(idx, "userGrp" , userGrp);
        			this.dsUser.setColumn(idx, "userGrpNm" , userGrpNm);
        			this.dsUser.setColumn(idx, "vkgrp" , vkgrp);
        			this.dsUser.setColumn(idx, "vkgrpNm" , vkgrpNm);
        			this.dsUser.setColumn(idx, "vkbur" , vkbur);
        			this.dsUser.setColumn(idx, "vkburNm" , vkburNm);
        			this.dsUser.setColumn(idx, "agentId" , agentId);
        			this.dsUser.setColumn(idx, "agentNm" , agentNm);
        			this.dsAuth.deleteRow(i);
        			
        			checkCnt++;
        		}
        	}
        	if(checkCnt == 0) {
        		alert("삭제하실 사용자를 선택해주세요.");
        	}
        }

        //엑셀
        this.fn_excel= function() {
        	var grdArry = new Array();
        	grdArry[0] = this.Grid00;
        	grdArry[1] = this.Grid01;
        	grdArry[2] = this.Grid02;
        	Ex.core.exportExcel(this, grdArry);
        	//Ex.core.exportExcel(this, this.Grid01);
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.Static00.addEventHandler("onclick", this.Static00_onclick, this);
            this.Static01.addEventHandler("onclick", this.Static00_onclick, this);
            this.Grid00.addEventHandler("oncellclick", this.Div00_Grid00_oncellclick, this);
            this.div_search.edt_searchKeyword.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.edt_searchKeyword2.addEventHandler("onkeyup", this.div_search_edt_searchKeyword2_onkeyup, this);
            this.Button37.addEventHandler("onclick", this.btn_search2_onclick, this);
            this.Button09.addEventHandler("onclick", this.Button01_onclick, this);
            this.Button06.addEventHandler("onclick", this.Button00_onclick, this);

        };

        this.loadIncludeScript("RTCMGrpReg.xfdl");

       
    };
}
)();
