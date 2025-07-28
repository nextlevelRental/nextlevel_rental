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
                this.set_name("RTCOMMAgencyEngineOil_pop");
                this.set_classname("RTCOMMAgencyEtc_pop");
                this.set_titletext("엔진오일서비스 대리점조회");
                this._setFormPosition(0,0,1024,491);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_agencyPop", this);
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"agencyCd\" type=\"STRING\" size=\"256\"/><Column id=\"agencyNm\" type=\"STRING\" size=\"256\"/><Column id=\"salesGroup\" type=\"STRING\" size=\"256\"/><Column id=\"salesGroupNm\" type=\"STRING\" size=\"256\"/><Column id=\"salesOffice\" type=\"STRING\" size=\"256\"/><Column id=\"salesOfficeNm\" type=\"STRING\" size=\"256\"/><Column id=\"posCd\" type=\"STRING\" size=\"256\"/><Column id=\"city\" type=\"STRING\" size=\"256\"/><Column id=\"street\" type=\"STRING\" size=\"256\"/><Column id=\"sidoCd\" type=\"STRING\" size=\"256\"/><Column id=\"sigunCd\" type=\"STRING\" size=\"256\"/><Column id=\"serNo\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"faxNo\" type=\"STRING\" size=\"256\"/><Column id=\"taxNo\" type=\"STRING\" size=\"256\"/><Column id=\"repNm\" type=\"STRING\" size=\"256\"/><Column id=\"busiType\" type=\"STRING\" size=\"256\"/><Column id=\"busiCond\" type=\"STRING\" size=\"256\"/><Column id=\"rentalYn\" type=\"STRING\" size=\"256\"/><Column id=\"strDay\" type=\"STRING\" size=\"256\"/><Column id=\"endDay\" type=\"STRING\" size=\"256\"/><Column id=\"posX\" type=\"STRING\" size=\"256\"/><Column id=\"posY\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/><Column id=\"lmYn\" type=\"STRING\" size=\"256\"/><Column id=\"fmYn\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroup\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroupNm\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOffice\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOfficeNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_s016", this);
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_s017", this);
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Button("btn_close", "absolute", "974", "460", "41", "21", null, null, this);
            obj.set_taborder("7");
            obj.set_text("닫기");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);

            obj = new Button("btn_choice", "absolute", "928", "460", "41", "21", null, null, this);
            obj.set_taborder("5");
            obj.set_text("선택");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);

            obj = new Grid("grid_agency", "absolute", "10", "93", "1004", "357", null, null, this);
            obj.set_taborder("3");
            obj.set_binddataset("ds_agencyPop");
            obj.set_cellsizingtype("col");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"250\"/><Column size=\"90\"/><Column size=\"90\"/><Column size=\"90\"/><Column size=\"90\"/><Column size=\"60\"/><Column size=\"200\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"대리점코드\"/><Cell col=\"1\" text=\"대리점명\"/><Cell col=\"2\" text=\"렌탈지사코드\"/><Cell col=\"3\" text=\"렌탈지사명\"/><Cell col=\"4\" text=\"렌탈지점코드\"/><Cell col=\"5\" text=\"렌탈지점명\"/><Cell col=\"6\" text=\"우편번호\"/><Cell col=\"7\" text=\"주소\"/><Cell col=\"8\" text=\"상세주소\"/><Cell col=\"9\" text=\"전화번호\"/><Cell col=\"10\" text=\"대표명\"/><Cell col=\"11\" text=\"렌탈대리점 여부 \"/><Cell col=\"12\" text=\"경정비\"/><Cell col=\"13\" text=\"수입차경정비\"/></Band><Band id=\"body\"><Cell text=\"bind:agencyCd\"/><Cell col=\"1\" style=\"align:left;\" text=\"bind:agencyNm\"/><Cell col=\"2\" text=\"bind:rentalGroup\"/><Cell col=\"3\" text=\"bind:rentalGroupNm\"/><Cell col=\"4\" text=\"bind:rentalOffice\"/><Cell col=\"5\" text=\"bind:rentalOfficeNm\"/><Cell col=\"6\" text=\"bind:posCd\"/><Cell col=\"7\" style=\"align:left;\" text=\"bind:city\"/><Cell col=\"8\" style=\"align:left;\" text=\"bind:street\"/><Cell col=\"9\" text=\"bind:telNo\" expr=\"expr:FN_numberHyphenInReturn(telNo)\"/><Cell col=\"10\" text=\"bind:repNm\"/><Cell col=\"11\" text=\"bind:rentalYn\"/><Cell col=\"12\" text=\"bind:lmYn\"/><Cell col=\"13\" text=\"bind:fmYn\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static22", "absolute", "0", "0", "1024", "10", null, null, this);
            obj.set_taborder("1");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "0", "10", "491", null, null, this);
            obj.set_taborder("2");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "0", "481", "1024", "10", null, null, this);
            obj.set_taborder("4");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1014", "0", "10", "491", null, null, this);
            obj.set_taborder("6");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "8", "450", null, "10", "0", null, this);
            obj.set_taborder("8");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0", "83", "1024", "10", null, null, this);
            obj.set_taborder("9");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "10", "10", null, "73", "10", null, this);
            obj.set_taborder("10");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_searchSalesGroup", "absolute", "323", "10", "78", "20", null, null, this.div_search);
            obj.set_taborder("76");
            obj.set_text("렌탈지사");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_rentalGroupNm", "absolute", "401", "10", "100", "21", null, null, this.div_search);
            obj.set_taborder("77");
            obj.set_readonly("true");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_rentalOfficeNm", "absolute", "709", "10", "100", "21", null, null, this.div_search);
            obj.set_taborder("78");
            obj.set_readonly("true");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchAgency", "absolute", "20", "41", "66", "20", null, null, this.div_search);
            obj.set_taborder("79");
            obj.set_text("대리점");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_agencyNm", "absolute", "86", "41", "140", "21", null, null, this.div_search);
            obj.set_taborder("80");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchSalesOffice", "absolute", "631", "10", "78", "20", null, null, this.div_search);
            obj.set_taborder("81");
            obj.set_text("렌탈지점");
            obj.set_cssclass("sta_WF_schTitle");
            obj.set_enableevent("false");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchRentalYn", "absolute", "323", "41", "78", "20", null, null, this.div_search);
            obj.set_taborder("82");
            obj.set_text("정비구분");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_rentalGroup", "absolute", "416", "10", "68", "21", null, null, this.div_search);
            obj.set_taborder("84");
            obj.set_visible("false");
            obj.set_readonly("true");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_rentalOffice", "absolute", "720", "10", "69", "21", null, null, this.div_search);
            obj.set_taborder("85");
            obj.set_visible("false");
            obj.set_readonly("true");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("bt_rentalGroup", "absolute", "481", "9", "20", "21", null, null, this.div_search);
            obj.set_taborder("86");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("bt_rentalOffice", "absolute", "789", "10", "20", "21", null, null, this.div_search);
            obj.set_taborder("87");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "0", "0", "20", null, null, "0", this.div_search);
            obj.set_taborder("89");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static22", "absolute", "0", "0", "1000", "10", null, null, this.div_search);
            obj.set_taborder("90");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "0", "31", "1000", "10", null, null, this.div_search);
            obj.set_taborder("91");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "293", "0", "30", null, null, "0", this.div_search);
            obj.set_taborder("92");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "601", "0", "30", null, null, "0", this.div_search);
            obj.set_taborder("93");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "809", "0", "30", null, null, "0", this.div_search);
            obj.set_taborder("94");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_search", "absolute", null, "10", "45", "22", "5", null, this.div_search);
            obj.set_taborder("95");
            obj.set_text("조회");
            obj.set_cssclass("btn_WF_CRUD");
            obj.getSetter("domainId").set("nexa.search");
            this.div_search.addChild(obj.name, obj);
            obj = new Radio("ra_lmFmYn", "absolute", "401", "41", "200", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            var ra_lmFmYn_innerdataset = new Dataset("ra_lmFmYn_innerdataset", this.div_search.ra_lmFmYn);
            ra_lmFmYn_innerdataset._setContents("<ColumnInfo><Column id=\"codecolumn\" size=\"256\"/><Column id=\"datacolumn\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"codecolumn\">01</Col><Col id=\"datacolumn\">경정비</Col></Row><Row><Col id=\"codecolumn\">02</Col><Col id=\"datacolumn\">수입차경정비</Col></Row></Rows>");
            obj.set_innerdataset(ra_lmFmYn_innerdataset);
            obj.set_taborder("96");
            obj.set_codecolumn("codecolumn");
            obj.set_datacolumn("datacolumn");
            obj.set_direction("vertical");
            obj.set_value("01");
            obj.set_index("0");
            obj = new Static("Static05", "absolute", "0", "62", "1000", "10", null, null, this.div_search);
            obj.set_taborder("97");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_region", "absolute", "20", "10", "56", "20", null, null, this.div_search);
            obj.set_taborder("98");
            obj.set_text("지역");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cbo_sido", "absolute", "86", "10", "92", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("99");
            obj.set_innerdataset("@ds_s016");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj = new Combo("cbo_sigun", "absolute", "177", "10", "116", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("100");
            obj.set_innerdataset("@ds_s017");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 0, 73, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("10");
            		p.set_text("Div00");
            		p.set_scrollbars("none");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1024, 491, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCOMMAgencyEtc_pop");
            		p.set_titletext("엔진오일서비스 대리점조회");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCOMMAgencyEngineOil_pop.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCOMMAgencyEngineOil_pop.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분	: 엔진오일서비스 대리점조회 팝업
         * 02. 그룹명		: RTCOMMAgencyEngineOil_pop.xfdl
         * 03. 그룹설명	: 
         * 04. 작성일		: 2019-02-11
         * 05. 작성자		: 노창호
         * 06. 수정이력	: 
         ***********************************************************************
         *		수정일			작성자		내용
         ***********************************************************************
         *		2019-02-11		노창호		최초작성
         ***********************************************************************/

        /***********************************************************************
         * Script Include
         ***********************************************************************/
        //include "lib::comLib.xjs";

        /***********************************************************************
         * FORM 변수 선언 영역
         ***********************************************************************/

        /***********************************************************************
         * 그룹 변수 선언부
         ***********************************************************************/
        this.vkgrpCd = this.parent.vkgrpCd;
        this.vkgrpNm = this.parent.vkgrpNm;
        this.vkburCd = this.parent.vkburCd;
        this.vkburNm = this.parent.vkburNm;
        this.vkazcNm = this.parent.vkazcNm;

        /***********************************************************************************
         * Form Load Common Function
         ***********************************************************************************/
        this.form_onload = function(obj,e) {
        	Ex.core.init(obj);
        	
        	this.fn_init();
        }

        this.RTCOMMAgencyEtc_pop_onkeyup = function(obj,e) {
        	if(e.keycode == 27) {
        		this.close();
        	}
        }

        this.fn_init = function() {
        	var div = this.div_search;
        	
        	div.ed_rentalGroup.set_value(this.vkgrpCd);
        	div.ed_rentalGroupNm.set_value(this.vkgrpNm);
        	div.ed_rentalOffice.set_value(this.vkburCd);
        	div.ed_rentalOfficeNm.set_value(this.vkburNm);
        	div.ed_agencyNm.set_value(this.vkazcNm);
        	
        	/* 공통코드 조회 */
        	this.fn_getCommCode();
        }

        /***********************************************************************************
         * Transaction Function
         ***********************************************************************************/
        /**
         * 공통코드 조회
         */ 
        this.fn_getCommCode = function() {
        	var sSvcID		 = "getCommCode";  
        	var sController	 = "/rtms/sd/initRTSDAgency.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "ds_s016=mapSidoCd ds_s017=mapSigunCd";
        	var sArgs		 = "";	
        	var fn_callBack	 = "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 		
        }

        /**
         * 대리점 정보 조회
         */
        this.fn_listAgencyPop = function() {
        	this.ds_agencyPop.clearData();
        	
        	var div = this.div_search;
        	
        	var sidoCd		 = nvl(div.cbo_sido.value);		/* 지역(시도)		*/
        	var sigunCd		 = nvl(div.cbo_sigun.value);	/* 지역(시군구)	*/
        	var agencyNm	 = nvl(div.ed_agencyNm.value);
        	var rentalGroup	 = nvl(div.ed_rentalGroup.value);
        	var rentalOffice = nvl(div.ed_rentalOffice.value);
        	
        	var lmFnYn		= nvl(div.ra_lmFmYn.value);
        	var lmYn		= "";
        	var fnYn		= "";
        	
        	if(lmFnYn == "01") {
        		lmYn = "Y";
        		fnYn = "";
        	} else if(lmFnYn == "02") {
        		lmYn = "";
        		fnYn = "Y";
        	}
        	
        	var sSvcID		 = "listAgencyPop";
        	var sController	 = "rtms/comm/listAgencyPop.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "ds_agencyPop=mapAgencyPop";
        	var sArgs		 = "";
        		sArgs		+= Ex.util.setParam("sidoCd",		sidoCd);
        		sArgs		+= Ex.util.setParam("sigunCd",		sigunCd);
        		sArgs		+= Ex.util.setParam("agencyNm",		agencyNm);
        		sArgs		+= Ex.util.setParam("rentalGroup",	rentalGroup);
        		sArgs		+= Ex.util.setParam("rentalOffice",	rentalOffice);
        		sArgs		+= Ex.util.setParam("rentalYn",		"Y");
        		sArgs		+= Ex.util.setParam("lmYn",			lmYn);
        		sArgs		+= Ex.util.setParam("fnYn",			fnYn);
        	var fn_callBack	 = "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /***********************************************************************************
         * CallBack Event(strSvcId - Sevice ID, nErrorCode - ErrorCode, strErrorMsg - Error Message)
         ***********************************************************************************/
        this.fn_callBack = function(strSvcId,nErrorCode,strErrorMsg,resultCnt) {
        	if(nErrorCode < 0) {
        		return Ex.core.comMsg("alert", strErrorMsg);
        	}
        	
        	switch(strSvcId) {
        		/* 공통코드 조회 */
        		case "getCommCode":
        			/* 광역시도 */
        			var addRow;
        			
        			addRow = this.ds_s016.insertRow(0);
        			
        			this.ds_s016.setColumn(addRow, "cd", "");
        			this.ds_s016.setColumn(addRow, "cdNm", "전체");
        			
        			this.div_search.cbo_sido.set_value("");
        			
        			/* 시군구 */
        			addRow = this.ds_s017.insertRow(0);
        			
        			this.ds_s017.setColumn(addRow, "cd", "");
        			this.ds_s017.setColumn(addRow, "cdNm", "전체");
        			
        			this.div_search.cbo_sigun.set_value("");
        			
        			/* 대리점 정보 조회 */
        			this.fn_listAgencyPop();
        			break;
        		
        		/* 대리점 정보 조회 */
        		case "listAgencyPop":
        			if(this.ds_agencyPop.getRowCount() == 0) {
        				this.alert("조회된 데이터가 없습니다.");
        			}
        			break;
        		
        		default:
        			break;
        	}
        }

        /**
         * 렌탈지사 / 지점 Popup Callback
         */
        this._setReturn = function(arr) {
        	var div = this.div_search;
        	
        	var cd	= arr[0];
        	var nm	= arr[1];
        	var sId	= arr[2];
        	
        	if(sId == "vkgrp") {
        		div.ed_rentalGroup.set_value(cd);
        		div.ed_rentalGroupNm.set_value(nm);
        	}
        	
        	if(sId == "vkbur") {
        		div.ed_rentalOffice.set_value(cd);
        		div.ed_rentalOfficeNm.set_value(nm);
        	}
        }

        /***********************************************************************************
         * User Function
         ***********************************************************************************/
        this.fn_choice = function() {
        	var ds	 = this.ds_agencyPop;
        	var nRow = ds.rowposition;
        	
        	if(nRow != -1) {
        		var rentalGroup	   = ds.getColumn(nRow, "rentalGroup");
        		var rentalGroupNm  = ds.getColumn(nRow, "rentalGroupNm");
        		var rentalOffice   = ds.getColumn(nRow, "rentalOffice");
        		var rentalOfficeNm = ds.getColumn(nRow, "rentalOfficeNm");
        		var agencyCd	   = ds.getColumn(nRow, "agencyCd");
        		var agencyNm	   = ds.getColumn(nRow, "agencyNm");
        		var telNo		   = ds.getColumn(nRow, "telNo");
        		var posCd		   = ds.getColumn(nRow, "posCd");
        		var city		   = ds.getColumn(nRow, "city");
        		var street		   = ds.getColumn(nRow, "street");
        		
        		var arr = [rentalGroup, rentalGroupNm, rentalOffice, rentalOfficeNm, agencyCd, agencyNm, telNo, posCd, city, street];
        		
        		this.close(this.opener.returnAgencyCd(arr));
        	}
        }

        /***********************************************************************************
         * Component Event & Function
         ***********************************************************************************/
        /**
         * 조회
         */
        this.btn_search_onclick = function(obj,e) {
        	this.fn_listAgencyPop();
        }

        /**
         * 지역 Onitemchanged Event
         */
        this.div_search_cbo_sido_onitemchanged = function(obj,e) {
        	this.ds_s017.filter("");
        	
        	if(e.postvalue != "") {
        		this.ds_s017.filter("cd.substr(0,2)=='" + e.posttext + "' || cd==''");
        	}
        	
        	this.div_search.cbo_sigun.set_index(0);
        }

        /**
         * 렌탈지사 Popup Onclick Event
         */
        this.div_search_bt_rentalGroup_onclick = function(obj,e) {
        	var ownerFrame = this.getOwnerFrame();
        	var popup	   = new ChildFrame();
        	
        	popup.init("RTCOMMVkgrp_pop", "absolute", 0, 0, 400, 460, null, null, "comm::RTCOMMVkgrp_pop.xfdl");
        	popup.set_openalign("center middle");
        	popup.set_showtitlebar(true);
        	popup.set_resizable(false);
        	popup.showModal(ownerFrame, {}, this, this.fn_callBackPopup);
        }

        /**
         * 렌탈지점 Popup Onclick Event
         */
        this.div_search_bt_rentalOffice_onclick = function(obj,e) {
        	var ownerFrame = this.getOwnerFrame();
        	var popup	   = new ChildFrame();
        	var args	   = {p_rentalGroup : this.div_search.ed_rentalGroup.value};
        	
        	popup.init("RTCOMMVkbur_pop", "absolute", 0, 0, 400, 460, null, null, "comm::RTCOMMVkbur_pop.xfdl");
        	popup.set_openalign("center middle");
        	popup.set_showtitlebar(true);
        	popup.set_resizable(false);
        	popup.showModal(ownerFrame, args, this, this.fn_callBackPopup);
        }

        /**
         * 대리점 Onkeyup Event
         */
        this.div_search_ed_agencyNm_onkeyup = function(obj,e) {
        	if(e.keycode == "13") {
        		this.fn_listAgencyPop();
        	}
        }

        /**
         * 선택
         */
        this.btn_choice_onclick = function(obj,e) {
        	this.fn_choice();
        }

        /**
         * Grid 선택 Oncelldblclick Event
         */
        this.grid_agency_oncelldblclick = function(obj,e) {
        	this.fn_choice();
        }

        /**
         * 닫기
         */
        this.btn_close_onclick = function(obj,e) {
        	this.close();
        }
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.addEventHandler("onkeyup", this.RTCOMMAgencyEtc_pop_onkeyup, this);
            this.btn_close.addEventHandler("onclick", this.btn_close_onclick, this);
            this.btn_choice.addEventHandler("onclick", this.btn_choice_onclick, this);
            this.grid_agency.addEventHandler("oncelldblclick", this.grid_agency_oncelldblclick, this);
            this.div_search.ed_agencyNm.addEventHandler("onkeyup", this.div_search_ed_agencyNm_onkeyup, this);
            this.div_search.bt_rentalGroup.addEventHandler("onclick", this.div_search_bt_rentalGroup_onclick, this);
            this.div_search.bt_rentalOffice.addEventHandler("onclick", this.div_search_bt_rentalOffice_onclick, this);
            this.div_search.btn_search.addEventHandler("onclick", this.btn_search_onclick, this);
            this.div_search.cbo_sido.addEventHandler("onitemchanged", this.div_search_cbo_sido_onitemchanged, this);

        };

        this.loadIncludeScript("RTCOMMAgencyEngineOil_pop.xfdl");

       
    };
}
)();
