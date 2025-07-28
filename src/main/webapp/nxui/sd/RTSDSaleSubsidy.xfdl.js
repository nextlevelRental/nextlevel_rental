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
                this.set_name("RTSDSaleSubsidy");
                this.set_classname("Authority");
                this.set_titletext("판매보조금정책 항목 관리");
                this._setFormPosition(0,0,1147,496);
            }
            this.getSetter("inheritanceid").set("");

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_saleSubsidy", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"plcCd\" type=\"STRING\" size=\"0\"/><Column id=\"plcCdNm\" type=\"STRING\" size=\"256\"/><Column id=\"slsCd\" type=\"STRING\" size=\"256\"/><Column id=\"bnsCd\" type=\"STRING\" size=\"256\"/><Column id=\"pymCd\" type=\"STRING\" size=\"256\"/><Column id=\"acnCd\" type=\"STRING\" size=\"256\"/><Column id=\"saleMin\" type=\"STRING\" size=\"256\"/><Column id=\"saleMax\" type=\"STRING\" size=\"256\"/><Column id=\"aplAmt\" type=\"STRING\" size=\"256\"/><Column id=\"prfMin\" type=\"STRING\" size=\"256\"/><Column id=\"prfMax\" type=\"STRING\" size=\"256\"/><Column id=\"orderPt\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsR060", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"string\" size=\"32\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsR061", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"string\" size=\"32\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsR062", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"string\" size=\"32\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsR063", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"string\" size=\"32\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsUseYn", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"string\" size=\"32\"/></ColumnInfo><Rows><Row><Col id=\"cd\">Y</Col><Col id=\"cdNm\">사용</Col></Row><Row><Col id=\"cd\">N</Col><Col id=\"cdNm\">미사용</Col></Row></Rows>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("st_BG", "absolute", "10", "0", null, "40", "-10", null, this);
            obj.set_cssclass("sta_WF_SearchBox");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "0", "0", "1122", "45", null, null, this);
            obj.set_taborder("19");
            obj.set_text("Div00");
            obj.set_cssclass("div_WF_searchBg");
            obj.set_scrollbars("none");
            this.addChild(obj.name, obj);
            obj = new Static("st_searchCondition", "absolute", "25", "12", "88", "20", null, null, this.div_search);
            obj.set_taborder("15");
            obj.set_text("정책코드/명");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static22", "absolute", "0", "0", "1118", "12", null, null, this.div_search);
            obj.set_taborder("23");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static23", "absolute", "0", "33", "1118", "12", null, null, this.div_search);
            obj.set_taborder("24");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("edt_plcCdNm", "absolute", "119", "10", "124", "21", null, null, this.div_search);
            obj.set_taborder("0");
            obj.set_enable("true");
            obj.set_maxlength("100");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition00", "absolute", "273", "12", "80", "20", null, null, this.div_search);
            obj.set_taborder("25");
            obj.set_text("판매처구분");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cmb_slsCd", "absolute", "359", "10", "96", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("29");
            obj.set_autoselect("true");
            obj.set_innerdataset("@dsR060");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj.set_displaynulltext("전체");
            obj.set_index("-1");
            obj = new Static("st_searchCondition01", "absolute", "481", "12", "80", "20", null, null, this.div_search);
            obj.set_taborder("30");
            obj.set_text("보너스구분");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cmb_bnsCd", "absolute", "575", "10", "96", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("31");
            obj.set_autoselect("true");
            obj.set_innerdataset("@dsR061");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj.set_displaynulltext("전체");
            obj.set_index("-1");
            obj = new Static("st_searchCondition02", "absolute", "705", "12", "64", "20", null, null, this.div_search);
            obj.set_taborder("32");
            obj.set_text("지급구분");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cmb_pymCd", "absolute", "775", "10", "96", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("33");
            obj.set_autoselect("true");
            obj.set_innerdataset("@dsR062");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj.set_displaynulltext("전체");
            obj.set_index("-1");
            obj = new Static("st_searchCondition03", "absolute", "897", "12", "64", "20", null, null, this.div_search);
            obj.set_taborder("34");
            obj.set_text("결산구분");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cmb_acnCd", "absolute", "975", "10", "96", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("35");
            obj.set_autoselect("true");
            obj.set_innerdataset("@dsR063");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj.set_displaynulltext("전체");
            obj.set_index("-1");

            obj = new Static("Static21", "absolute", "0", "61", "161", "20", null, null, this);
            obj.set_taborder("24");
            obj.set_text("판매보조금정책 항목 관리");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "0", "0", "25", "45", null, null, this);
            obj.set_taborder("27");
            obj.set_text("FIX \r\nw20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static24", "absolute", "245", "0", "25", "44", null, null, this);
            obj.set_taborder("28");
            obj.set_text("FIX \r\nw30");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_saleSubsidy", "absolute", "0", "85", "1122", "394", null, null, this);
            obj.set_taborder("127");
            obj.set_binddataset("ds_saleSubsidy");
            obj.set_autofittype("col");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"147\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell text=\"정책코드\"/><Cell col=\"1\" text=\"정책코드명\"/><Cell col=\"2\" text=\"판매처구분\"/><Cell col=\"3\" text=\"보너스구분\"/><Cell col=\"4\" text=\"지급구분\"/><Cell col=\"5\" text=\"결산구분\"/><Cell col=\"6\" text=\"최소수량\"/><Cell col=\"7\" text=\"최대수량\"/><Cell col=\"8\" text=\"적용금액\"/><Cell col=\"9\" text=\"우선순위\"/><Cell col=\"10\" text=\"사용유무\"/></Band><Band id=\"body\"><Cell text=\"bind:plcCd\"/><Cell col=\"1\" edittype=\"text\" style=\"align:left;\" text=\"bind:plcCdNm\"/><Cell col=\"2\" displaytype=\"combo\" text=\"bind:slsCd\" combodataset=\"dsR060\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"3\" displaytype=\"combo\" text=\"bind:bnsCd\" combodataset=\"dsR061\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"4\" displaytype=\"combo\" text=\"bind:pymCd\" combodataset=\"dsR062\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"5\" displaytype=\"combo\" text=\"bind:acnCd\" combodataset=\"dsR063\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"6\" displaytype=\"number\" edittype=\"masknumber\" style=\"align:right;\" text=\"bind:saleMin\" mask=\"#,###\"/><Cell col=\"7\" displaytype=\"number\" edittype=\"masknumber\" style=\"align:right;\" text=\"bind:saleMax\" mask=\"#,###\"/><Cell col=\"8\" displaytype=\"number\" edittype=\"masknumber\" style=\"align:right;\" text=\"bind:aplAmt\" mask=\"#,###\"/><Cell col=\"9\" edittype=\"masknumber\" text=\"bind:orderPt\"/><Cell col=\"10\" displaytype=\"combo\" edittype=\"combo\" text=\"bind:useYn\" combodataset=\"dsUseYn\" combocodecol=\"cd\" combodatacol=\"cdNm\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "45", "1147", "20", null, null, this);
            obj.set_taborder("128");
            obj.set_text("Static02");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "0", "75", "1147", "10", null, null, this);
            obj.set_taborder("129");
            obj.set_text("Static02");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1122", "0", "25", "690", null, null, this);
            obj.set_taborder("130");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "479", "1147", "10", null, null, this);
            obj.set_taborder("132");
            obj.set_text("Static02");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "457", "0", "25", "44", null, null, this);
            obj.set_taborder("133");
            obj.set_text("FIX \r\nw30");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "673", "0", "25", "44", null, null, this);
            obj.set_taborder("134");
            obj.set_text("FIX \r\nw30");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static07", "absolute", "873", "0", "25", "44", null, null, this);
            obj.set_taborder("135");
            obj.set_text("FIX \r\nw30");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1122, 45, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("19");
            		p.set_text("Div00");
            		p.set_cssclass("div_WF_searchBg");
            		p.set_scrollbars("none");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1147, 496, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("Authority");
            		p.getSetter("inheritanceid").set("");
            		p.set_titletext("판매보조금정책 항목 관리");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTSDSaleSubsidy.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDSaleSubsidy.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분	: 주문관리 > 기준정보관리 > 판매보조금정책 항목 관리
         * 02. 그룹명		: RTSDSaleSubsidy.xfdl
         * 03. 그룹설명	: 
         * 04. 작성일		: 2018-12-18
         * 05. 작성자		: 지영식
         * 06. 수정이력	: 
         ***********************************************************************
         *		수정일			작성자		내용
         ***********************************************************************
         *		2018-12-18		지영식		최초작성
         ***********************************************************************/

        /***********************************************************************
         * Script Include 
         ***********************************************************************/
        //include "lib::comLib.xjs";

        /***********************************************************************
         * FORM 변수 선언 영역
         ***********************************************************************/
        /* 팝업에서 전달받은 변수 저장 */
        this.arr;

        /***********************************************************************************
         * Form Load Common Function
         ***********************************************************************************/
        this.form_onload = function(obj,e) {
        	/* 1. N : 신규추가
        	 * 2. S : 조회
        	 * 3. C : 데이타생성
        	 * 4. E : 엑셀데이타생성
        	 */
        	Ex.core.init(obj);
        	
        	this.parent.setButton("C|S", this);
        	
        	this.init();
        }

        this.init = function() {
        	/* 공통코드 조회 */
        	this.fn_listSaleSubsidyComm();
        }

        /***********************************************************************************
         * Transaction Function
         ***********************************************************************************/
        /**
         * 공통코드 조회
         */
        this.fn_listSaleSubsidyComm = function() {
        	var sSvcID		 = "listSaleSubsidyComm";
        	var sController	 = "/rtms/sd/listSaleSubsidyComm.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "dsR060=dsR060 dsR061=dsR061 dsR062=dsR062 dsR063=dsR063";
        	var sArgs		 = "";
        	var fn_callBack	 = "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 판매보조금정책 목록조회
         */
        this.fn_listSaleSubsidyInfo = function() {
        	this.ds_saleSubsidy.clearData();
        	
        	var sSvcID		 = "listSaleSubsidyInfo";
        	var sController	 = "/rtms/sd/listSaleSubsidyInfo.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "ds_saleSubsidy=ds_output";
        	var sArgs		 = "";
        		sArgs		+= Ex.util.setParam("plcCdNm", nvl(this.div_search.edt_plcCdNm.value));
        		sArgs		+= Ex.util.setParam("slsCd",   nvl(this.div_search.cmb_slsCd.value));
        		sArgs		+= Ex.util.setParam("bnsCd",   nvl(this.div_search.cmb_bnsCd.value));
        		sArgs		+= Ex.util.setParam("pymCd",   nvl(this.div_search.cmb_pymCd.value));
        		sArgs		+= Ex.util.setParam("acnCd",   nvl(this.div_search.cmb_acnCd.value));
        	var fn_callBack	 = "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 판매보조금정책 저장
         */
        this.fn_saveSaleSubsidy = function() {
        	if(!Ex.util.isUpdated(this.ds_saleSubsidy)) {
        		this.alert('변경된 데이터가 없습니다.');
        		
        		return false;
        	}
        	
        	if(confirm( "저장하시겠습니까?")) {
        		var sSvcID		 = "saveSaleSubsidy";
        		var sController	 = "/rtms/sd/saveSaleSubsidy.do";
        		var sInDatasets	 = "input1=ds_saleSubsidy:U";
        		var sOutDatasets = "";
        		var sArgs		 = "";
        		var fn_callBack	 = "fn_callBack";
        		
        		Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
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
        		/* 공통코드 조회 */
        		case "listSaleSubsidyComm":
        			this.dsR060.insertRow(0);
        			this.dsR060.setColumn(0, "cd", "");
        			this.dsR060.setColumn(0, "cdNm", "전체");
        			
        			this.dsR061.insertRow(0);
        			this.dsR061.setColumn(0, "cd", "");
        			this.dsR061.setColumn(0, "cdNm", "전체");
        			
        			this.dsR062.insertRow(0);
        			this.dsR062.setColumn(0, "cd", "");
        			this.dsR062.setColumn(0, "cdNm", "전체");
        			
        			this.dsR063.insertRow(0);
        			this.dsR063.setColumn(0, "cd", "");
        			this.dsR063.setColumn(0, "cdNm", "전체");
        			
        			this.fn_search();
        			break;
        		
        		/* 조회 */
        		case "listSaleSubsidyInfo":
        			break;
        		
        		/* 저장 */
        		case "saveSaleSubsidy":
        			this.alert(strErrorMsg);
        			
        			this.fn_search();
        			break;
        		default:
        			break;
        	}
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
        	this.fn_listSaleSubsidyInfo();
        }

        /**
         * 저장
         */
        this.fn_save = function() {
        	this.fn_saveSaleSubsidy();
        }

        /**
         * 정책코드 / 명 Onkeyup Event
         */
        this.div_search_edt_plcCdNm_onkeyup = function(obj,e) {
        	if(e.keycode == 13) {
        		this.fn_search();
        	}
        }

        this.grd_saleSubsidy_onkeyup = function(obj,e) {
        	if (e.keycode == 13) {
        		obj.moveToNextCell();
        	}
        }

        /**
         * 판매처구분 Onitemchanged Event
         */
        this.div_search_cmb_slsCd_onitemchanged = function(obj,e) {
        	this.fn_search();
        }

        /**
         * 보너스구분 Onitemchanged Event
         */
        this.div_search_cmb_bnsCd_onitemchanged = function(obj,e) {
        	this.fn_search();
        }

        /**
         * 지급구분 Onitemchanged Event
         */
        this.div_search_cmb_pymCd_onitemchanged = function(obj,e) {
        	this.fn_search();
        }

        /**
         * 결산구분 Onitemchanged Event
         */
        this.div_search_cmb_acnCd_onitemchanged = function(obj,e) {
        	this.fn_search();
        }
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.div_search.addEventHandler("onkeyup", this.div_search_onkeyup, this);
            this.div_search.edt_plcCdNm.addEventHandler("onkeyup", this.div_search_edt_plcCdNm_onkeyup, this);
            this.div_search.cmb_slsCd.addEventHandler("onitemchanged", this.div_search_cmb_slsCd_onitemchanged, this);
            this.div_search.cmb_bnsCd.addEventHandler("onitemchanged", this.div_search_cmb_bnsCd_onitemchanged, this);
            this.div_search.cmb_pymCd.addEventHandler("onitemchanged", this.div_search_cmb_pymCd_onitemchanged, this);
            this.div_search.cmb_acnCd.addEventHandler("onitemchanged", this.div_search_cmb_acnCd_onitemchanged, this);
            this.grd_saleSubsidy.addEventHandler("onkeyup", this.grd_saleSubsidy_onkeyup, this);

        };

        this.loadIncludeScript("RTSDSaleSubsidy.xfdl");

       
    };
}
)();
