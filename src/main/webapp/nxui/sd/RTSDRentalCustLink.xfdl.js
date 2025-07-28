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
                this.set_name("form");
                this.set_classname("Authority");
                this.set_titletext("렌탈지점/판매자 연결");
                this._setFormPosition(0,0,1147,496);
            }
            this.getSetter("inheritanceid").set("");

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_custLinkMst", this);
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"grpCd\" type=\"STRING\" size=\"0\"/><Column id=\"grpNm\" type=\"STRING\" size=\"256\"/><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsGubun", this);
            obj.getSetter("firenextcount").set("0");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"string\" size=\"32\"/></ColumnInfo><Rows><Row><Col id=\"cd\">1</Col><Col id=\"cdNm\">대리점</Col></Row><Row><Col id=\"cd\">2</Col><Col id=\"cdNm\">판매인</Col></Row><Row><Col id=\"cd\">3</Col><Col id=\"cdNm\">카마스터</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_yn", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cd\">Y</Col><Col id=\"cdNm\">사용</Col></Row><Row><Col id=\"cd\">N</Col><Col id=\"cdNm\">미사용</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("comType", this);
            obj.getSetter("firenextcount").set("0");
            obj._setContents("<ColumnInfo><Column id=\"cdDesc\" type=\"string\" size=\"32\"/><Column id=\"cdNm\" type=\"string\" size=\"32\"/><Column id=\"cd\" type=\"string\" size=\"32\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_custLinkDtl", this);
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"chk\" type=\"STRING\" size=\"256\"/><Column id=\"agencyGbn\" type=\"STRING\" size=\"256\"/><Column id=\"agencyCd\" type=\"STRING\" size=\"0\"/><Column id=\"agencyNm\" type=\"STRING\" size=\"0\"/><Column id=\"rentalGroup\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOffice\" type=\"STRING\" size=\"256\"/><Column id=\"prplYn\" type=\"STRING\" size=\"256\"/><Column id=\"premprplYn\" type=\"STRING\" size=\"256\"/><Column id=\"groupNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_excelUp", this);
            obj._setContents("<ColumnInfo><Column id=\"COL_01\" type=\"STRING\" size=\"256\"/><Column id=\"COL_02\" type=\"STRING\" size=\"256\"/><Column id=\"COL_03\" type=\"STRING\" size=\"256\"/><Column id=\"COL_04\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
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
            obj = new Static("st_searchCondition", "absolute", "25", "10", "138", "21", null, null, this.div_search);
            obj.set_taborder("15");
            obj.set_text("렌탈 지사 / 지점명");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static22", "absolute", "0", "0", null, "10", "0", null, this.div_search);
            obj.set_taborder("23");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static23", "absolute", "0", "31", null, "10", "0", null, this.div_search);
            obj.set_taborder("24");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("edt_grpNm", "absolute", "163", "10", "130", "21", null, null, this.div_search);
            obj.set_taborder("0");
            obj.set_enable("true");
            obj.set_maxlength("100");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition00", "absolute", "591", "10", "66", "21", null, null, this.div_search);
            obj.set_taborder("25");
            obj.set_text("판매자");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("edt_agency", "absolute", "757", "10", "130", "21", null, null, this.div_search);
            obj.set_taborder("28");
            obj.set_maxlength("100");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cmb_agency", "absolute", "657", "10", "90", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("29");
            obj.set_autoselect("true");
            obj.set_value("1");
            obj.set_text("대리점");
            obj.set_innerdataset("@dsGubun");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj.set_index("0");
            obj = new Static("Static06", "absolute", "0", "0", "25", null, null, "0", this.div_search);
            obj.set_taborder("30");
            obj.set_text("FIX \r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "566", "0", "25", null, null, "0", this.div_search);
            obj.set_taborder("31");
            obj.set_text("FIX \r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "0", "61", "81", "20", null, null, this);
            obj.set_taborder("24");
            obj.set_text("렌탈지점");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_custLinkMst", "absolute", "0", "85", "556", "411", null, null, this);
            obj.set_taborder("127");
            obj.set_binddataset("ds_custLinkMst");
            obj.set_autofittype("col");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"0\"/><Column size=\"220\"/><Column size=\"262\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\"/><Cell col=\"1\" text=\"렌탈지사명\"/><Cell col=\"2\" text=\"렌탈지점명\"/></Band><Band id=\"body\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\" text=\"bind:chk\"/><Cell col=\"1\" displaytype=\"normal\" edittype=\"none\" style=\"align:center;\" text=\"bind:grpNm\" editlimit=\"3\"/><Cell col=\"2\" edittype=\"none\" style=\"align:center;\" text=\"bind:cdNm\" editlimit=\"100\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "45", null, "20", "0", null, this);
            obj.set_taborder("128");
            obj.set_text("Static02");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "0", "75", null, "10", "0", null, this);
            obj.set_taborder("129");
            obj.set_text("Static02");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1122", "0", "25", null, null, "0", this);
            obj.set_taborder("130");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "566", "61", "81", "20", null, null, this);
            obj.set_taborder("138");
            obj.set_text("판매점");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_custLinkDtl", "absolute", "566", "85", "556", "411", null, null, this);
            obj.set_taborder("139");
            obj.set_binddataset("ds_custLinkDtl");
            obj.set_autofittype("col");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"39\"/><Column size=\"84\"/><Column size=\"132\"/><Column size=\"215\"/><Column size=\"50\"/><Column size=\"50\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell rowspan=\"2\" displaytype=\"normal\" edittype=\"none\" text=\"선택\"/><Cell col=\"1\" rowspan=\"2\" text=\"그룹\"/><Cell col=\"2\" rowspan=\"2\" text=\"판매점코드\"/><Cell col=\"3\" rowspan=\"2\" text=\"판매점명\"/><Cell col=\"4\" text=\"퍼플점\"/><Cell col=\"5\" text=\"P.P점\"/><Cell row=\"1\" col=\"4\" displaytype=\"checkbox\" edittype=\"checkbox\"/><Cell row=\"1\" col=\"5\" displaytype=\"checkbox\" edittype=\"checkbox\"/></Band><Band id=\"body\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\" text=\"bind:chk\"/><Cell col=\"1\" displaytype=\"combo\" edittype=\"none\" text=\"bind:groupNm\" editlimit=\"4\" combodataset=\"dsGubun\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"2\" edittype=\"none\" text=\"bind:agencyCd\" editlimit=\"4\"/><Cell col=\"3\" edittype=\"none\" text=\"bind:agencyNm\" editlimit=\"100\"/><Cell col=\"4\" displaytype=\"checkbox\" edittype=\"checkbox\" text=\"bind:prplYn\"/><Cell col=\"5\" displaytype=\"checkbox\" edittype=\"checkbox\" text=\"bind:premprplYn\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Button("btn_unReleaseSeler", "absolute", null, "53", "93", "22", "25", null, this);
            obj.set_taborder("140");
            obj.set_text("미반영판매자");
            obj.set_cssclass("btn_WF_CRUD");
            this.addChild(obj.name, obj);

            obj = new Button("btn_formatDown", "absolute", null, "53", "93", "22", "209", null, this);
            obj.set_taborder("141");
            obj.set_text("양식다운로드");
            obj.set_cssclass("btn_WF_CRUD");
            obj.set_enable("true");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Button("btn_formatUpload", "absolute", null, "53", "85", "22", "121", null, this);
            obj.set_taborder("142");
            obj.set_text("업로드");
            obj.set_cssclass("btn_WF_CRUD");
            obj.set_enable("true");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_custLinkDtlExcel", "absolute", "536", "418", "587", "65", null, null, this);
            obj.set_taborder("143");
            obj.set_autofittype("col");
            obj.set_visible("false");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"105\"/><Column size=\"140\"/><Column size=\"135\"/><Column size=\"180\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"판매점코드\"/><Cell col=\"1\" text=\"판매점명\"/><Cell col=\"2\" text=\"퍼플점여부(Y/N)\"/><Cell col=\"3\" text=\"프리미엄퍼플점여부(Y/N)\"/></Band><Band id=\"body\"><Cell edittype=\"none\" text=\"bind:agencyCd\" editlimit=\"4\"/><Cell col=\"1\" edittype=\"none\" text=\"bind:agencyNm\" editlimit=\"100\"/><Cell col=\"2\" displaytype=\"normal\" edittype=\"none\" text=\"bind:prplYn\"/><Cell col=\"3\" displaytype=\"normal\" edittype=\"none\" text=\"bind:premprplYn\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Button("btn_formatDown00", "absolute", null, "450", "159", "22", "238", null, this);
            obj.set_taborder("144");
            obj.set_text("양식다운로드용 그리드");
            obj.set_cssclass("btn_WF_CRUD");
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
            		p.set_titletext("렌탈지점/판매자 연결");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTSDRentalCustLink.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDRentalCustLink.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분	: 주문관리 > 기준정보 > 렌탈지점/판매자 연결
         * 02. 그룹명		: RTSDRentalCustLink.xfdl
         * 03. 그룹설명	: 
         * 04. 작성일		: 2018-12-15
         * 05. 작성자		: 지영식
         * 06. 수정이력	: 
         ***********************************************************************
         *		수정일			작성자		내용
         ***********************************************************************
         *		2018-12-15		지영식		최초작성
         ***********************************************************************/

        /***********************************************************************
         * Script Include
         ***********************************************************************/
        //include "lib::comLib.xjs";

        /***********************************************************************
         * FORM 변수 선언 영역
         ***********************************************************************/
        /* 팝업에서 전달받은 변수 */
        this.arr;

        /***********************************************************************
         * 그룹 변수 선언부
         ***********************************************************************/

        /***********************************************************************************
         * Form Load Common Function
         ***********************************************************************************/
        this.form_onload = function(obj,e) {
        	Ex.core.init(obj);
        	
        	/* 1. N : 신규추가
        	 * 2. S : 조회
        	 * 3. C : 데이타생성
        	 * 4. E : 엑셀데이타생성
        	 */
        	this.parent.setButton("C|S", this);
        	
        	this.fn_init();
        }

        /**
         * 화면 초기화
         */
        this.fn_init = function() {
        	this.fn_search();
        }

        /***********************************************************************************
         * Transaction Function
         ***********************************************************************************/
        /**
         * Search : 렌탈지사(Master)
         */
        this.fn_listRentalCustLinkMstInfo = function() {
        	this.ds_custLinkMst.clearData();
        	this.ds_custLinkDtl.clearData();
        	
        	var sSvcID		 = "listRentalCustLinkMstInfo";
        	var sController	 = "/rtms/sd/listRentalCustLinkMstInfo.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "ds_custLinkMst=ds_output";
        	var sArgs		 = "";
        		sArgs		+= Ex.util.setParam("cdNm", nvl(this.div_search.edt_grpNm.value));
        	var fn_callBack	 = "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * Search : 렌탈지역(Detail)
         */
        this.fn_listRentalCustLinkDtlInfo = function() {
        	this.ds_custLinkDtl.clearData();
        	
        	var dsMst = this.ds_custLinkMst;
        	
        	if(dsMst.getRowCount() < 1) {
        		return false;
        	}
        	
        	var sSvcID		 = "listRentalCustLinkDtlInfo";
        	var sController	 = "/rtms/sd/listRentalCustLinkDtlInfo.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "ds_custLinkDtl=ds_output";
        	var sArgs		 = "";
        		sArgs		+= Ex.util.setParam("grpCd",	 nvl(dsMst.getColumn(dsMst.rowposition, "grpCd")));
        		sArgs		+= Ex.util.setParam("cd",		 nvl(dsMst.getColumn(dsMst.rowposition, "cd")));
        		sArgs		+= Ex.util.setParam("agencyGbn", nvl(this.div_search.cmb_agency.value));
        		sArgs		+= Ex.util.setParam("agencyNm",	 nvl(this.div_search.edt_agency.value));
        	var fn_callBack	 = "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }	

        /**
         * Save : 렌탈지사
         */
        this.fn_saveRentalCustLink = function() {
        	if(!Ex.util.isUpdated(this.ds_custLinkDtl)) {
        		this.alert("변경된 데이터가 없습니다.");
        		
        		return false;
        	}
        	
        	if(confirm("저장하시겠습니까?")) {
        		var sSvcID		 = "saveRentalCustLink";
        		var sController	 = "/rtms/sd/saveRentalCustLink.do";
        		var sInDatasets	 = "input1=ds_custLinkDtl:U";
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
        		/* 지사조회(M) */
        		case "listRentalCustLinkMstInfo":
        			break;
        		
        		/* 판매인조회(D) */
        		case "listRentalCustLinkDtlInfo":
        			break;
        		
        		/* 저장 */
        		case "saveRentalCustLink":
        			this.alert(strErrorMsg);
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
        	this.fn_listRentalCustLinkMstInfo();
        }

        /** 
         * 저장(판매인)
         */
        this.fn_save = function() {
        	this.fn_saveRentalCustLink();
        }

        /**
         * edt_grpNm Onkeydown Event
         */
        this.div_search_edt_grpNm_onkeydown = function(obj,e) {
        	if (e.keycode == 13) {
        		this.fn_search();
        	}
        }

        /**
         * 추가 : 렌탈지점
         */
        this.btn_add_onclick = function(obj,e) {
        	var dsMst	= this.ds_custLinkMst;
        	var dsDtl	= this.ds_custLinkDtl;
        	var nMstRow	= dsMst.rowposition;
        	var nDtlRow	= dsDtl.rowposition;
        	
        	if(dsMst.getRowCount() < 1) {
        		this.alert("선택된 렌탈지점이 없습니다");
        		
        		return false;
        	}
        	
        	dsDtl.setColumn(nDtlRow, "agencyGroup",	 dsMst.getColumn(nMstRow, "grpCd"));
        	dsDtl.setColumn(nDtlRow, "agencyOffice", dsMst.getColumn(nMstRow, "cd"));
        }

        /**
         * 판매자 Onitemchanged Event
         */
        this.div_search_cmb_agency_onitemchanged = function(obj,e) {
        	if(obj.value == 1) {
        		this.grd_custLinkDtl.setFormatColProperty(4, "size", 50);
        		this.grd_custLinkDtl.setFormatColProperty(5, "size", 50);
        		this.btn_formatDown.set_enable(true);
        		this.btn_formatUpload.set_enable(true);
        	} else {
        		this.grd_custLinkDtl.setFormatColProperty(4, "size", 0);
        		this.grd_custLinkDtl.setFormatColProperty(5, "size", 0);
        		this.btn_formatDown.set_enable(false);
        		this.btn_formatUpload.set_enable(false);
        	}
        	
        	/* 렌탈지점 조회 */
        	this.fn_listRentalCustLinkDtlInfo();
        }

        /**
         * 미반영 판매자
         */
        this.btn_unReleaseSeler_onclick = function(obj,e) {
        	var args = {  agencyGbn	: this.div_search.cmb_agency.value
        				, groupNm	: this.div_search.cmb_agency.text
        			   };
        	
        	Ex.core.popup(this, "미반영 판매자", "sd::RTSDUnReleaseSeler_pop.xfdl", args, "modaless=false");
        }

        /**
         * ds_custLinkMst Onrowposchanged Event
         */
        this.ds_custLinkMst_onrowposchanged = function(obj,e) {
        	/* 렌탈지점 조회 */
        	this.fn_listRentalCustLinkDtlInfo();
        }

        /**
         * 렌탈지점 사용여부 체크
         */
        this.ds_custLinkDtl_cancolumnchange = function(obj,e) {
        	var dsMst	 = this.ds_custLinkMst;
        	var nMstRow	 = dsMst.rowposition;
        	var agencyCd = this.div_search.cmb_agency.value;
        	
        	if(dsMst.getRowCount() < 1) {
        		this.alert("선택된 렌탈지점이 없습니다");
        		
        		return false;
        	}
        	
        	if(e.columnid == "chk") {
        		if((dsMst.getColumn(nMstRow, "cd") != obj.getColumn(e.row, "rentalOffice")) && !Eco.isEmpty(obj.getColumn(e.row, "rentalOffice"))) {
        			this.alert("다른 렌탈지점에 연결되어 있어 선택이 불가능합니다.");
        			// 다시 재조회 하지말고 체크박스 해제. 강신규 12.20
        			// this.fn_listRentalCustLinkDtlInfo(); //렌탈지점 조회
        			return false;
        		}
        		
        		if(e.oldvalue == 0) {
        			obj.setColumn(e.row, "agencyGbn",	 nvl(agencyCd));
        			obj.setColumn(e.row, "rentalGroup",	 dsMst.getColumn(nMstRow, "grpCd"));
        			obj.setColumn(e.row, "rentalOffice", dsMst.getColumn(nMstRow, "cd"));
        		} else {
        			obj.setColumn(e.row, "agencyGbn",	 nvl(agencyCd));
        			obj.setColumn(e.row, "rentalGroup",	 "");
        			obj.setColumn(e.row, "rentalOffice", "");
        		}
        	}
        	
        	if(e.columnid == "prplYn") {
        		obj.setColumn(e.row, "agencyGbn", nvl(agencyCd));
        	}
        	if(e.columnid == "premprplYn") {
        		obj.setColumn(e.row, "agencyGbn", nvl(agencyCd));
        	}
        }

        /**
         * 엑셀 양식 다운로드
         */
        this.btn_formatDown_onclick = function(obj,e)
        {
        	Ex.core.exportExcel(this, this.grd_custLinkDtlExcel); //grd_custLinkDtl 전체다운or양식만다운
        }

        /**
         * 엑셀 업로드
         */
        this.btn_formatUpload_onclick = function(obj,e)
        {//	alert("업");
        	this.ds_excelUp.clearData();
        	
        	if(this.importObj) 
        	{ 
        		this.importObj.destroy(); 
        		this.importObj = null; 
        	}
        	
        	this.importObj = new nexacro.ExcelImportObject("Import01",this);
        	this.importObj.parent.addChild("Import01",this.importObj);
        	this.importObj.set_importtype(nexacro.ImportTypes.EXCEL);
        	this.importObj.addEventHandler("onsuccess", this.Import01_onsuccess, this);
        	this.importObj.addEventHandler("onerror", this.Import01_onerror, this);
        	this.importObj.set_importurl(this.url);
        	this.importObj.importData("", "[command=getsheetdata;Output=ds_excelUp;body=!A2:D;]", "[ds_excelUp=ds_excelUp]","");
        	
        	//Ex.core.set_wait(true);
        }

        
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.ds_custLinkMst.addEventHandler("onrowposchanged", this.ds_custLinkMst_onrowposchanged, this);
            this.ds_custLinkMst.addEventHandler("oncolumnchanged", this.ds_custLinkMst_oncolumnchanged, this);
            this.ds_custLinkDtl.addEventHandler("cancolumnchange", this.ds_custLinkDtl_cancolumnchange, this);
            this.addEventHandler("onload", this.form_onload, this);
            this.div_search.addEventHandler("onkeyup", this.div_search_onkeyup, this);
            this.div_search.edt_grpNm.addEventHandler("onkeyup", this.div_search_edt_grpNm_onkeyup, this);
            this.div_search.edt_grpNm.addEventHandler("onkeydown", this.div_search_edt_grpNm_onkeydown, this);
            this.div_search.edt_agency.addEventHandler("onkeyup", this.div_search_edt_grpNm_onkeyup, this);
            this.div_search.cmb_agency.addEventHandler("onitemchanged", this.div_search_cmb_agency_onitemchanged, this);
            this.btn_unReleaseSeler.addEventHandler("onclick", this.btn_unReleaseSeler_onclick, this);
            this.btn_formatDown.addEventHandler("onclick", this.btn_formatDown_onclick, this);
            this.btn_formatUpload.addEventHandler("onclick", this.btn_formatUpload_onclick, this);
            this.btn_formatDown00.addEventHandler("onclick", this.btn_formatDown_onclick, this);

        };

        this.loadIncludeScript("RTSDRentalCustLink.xfdl");

       
    };
}
)();
