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
                this.set_name("RTCOMMAgency_pop");
                this.set_classname("RTCMAgency_pop");
                this.set_titletext("대리점조회");
                this._setFormPosition(0,0,1024,485);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_agencyPop", this);
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"agencyCd\" type=\"STRING\" size=\"256\"/><Column id=\"agencyNm\" type=\"STRING\" size=\"256\"/><Column id=\"salesGroup\" type=\"STRING\" size=\"256\"/><Column id=\"salesGroupNm\" type=\"STRING\" size=\"256\"/><Column id=\"salesOffice\" type=\"STRING\" size=\"256\"/><Column id=\"salesOfficeNm\" type=\"STRING\" size=\"256\"/><Column id=\"posCd\" type=\"STRING\" size=\"256\"/><Column id=\"city\" type=\"STRING\" size=\"256\"/><Column id=\"street\" type=\"STRING\" size=\"256\"/><Column id=\"sidoCd\" type=\"STRING\" size=\"256\"/><Column id=\"sigunCd\" type=\"STRING\" size=\"256\"/><Column id=\"serNo\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"faxNo\" type=\"STRING\" size=\"256\"/><Column id=\"taxNo\" type=\"STRING\" size=\"256\"/><Column id=\"repNm\" type=\"STRING\" size=\"256\"/><Column id=\"busiType\" type=\"STRING\" size=\"256\"/><Column id=\"busiCond\" type=\"STRING\" size=\"256\"/><Column id=\"rentalYn\" type=\"STRING\" size=\"256\"/><Column id=\"strDay\" type=\"STRING\" size=\"256\"/><Column id=\"endDay\" type=\"STRING\" size=\"256\"/><Column id=\"posX\" type=\"STRING\" size=\"256\"/><Column id=\"posY\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regNm\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgNm\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/><Column id=\"lmYn\" type=\"STRING\" size=\"256\"/><Column id=\"fmYn\" type=\"STRING\" size=\"256\"/><Column id=\"lifnr\" type=\"STRING\" size=\"256\"/><Column id=\"taxRqcd\" type=\"STRING\" size=\"256\"/><Column id=\"chanLclsNm\" type=\"STRING\" size=\"256\"/><Column id=\"chanMclsNm\" type=\"STRING\" size=\"256\"/><Column id=\"chanLclsCd\" type=\"STRING\" size=\"256\"/><Column id=\"chanMclsCd\" type=\"STRING\" size=\"256\"/><Column id=\"taxRqcdNm\" type=\"STRING\" size=\"256\"/><Column id=\"cwYn\" type=\"STRING\" size=\"256\"/><Column id=\"chYn\" type=\"STRING\" size=\"256\"/><Column id=\"opYn\" type=\"STRING\" size=\"256\"/><Column id=\"memo\" type=\"STRING\" size=\"256\"/><Column id=\"desorptCd\" type=\"STRING\" size=\"256\"/><Column id=\"desorptNm\" type=\"STRING\" size=\"256\"/><Column id=\"alignCd\" type=\"STRING\" size=\"256\"/><Column id=\"alignNm\" type=\"STRING\" size=\"256\"/><Column id=\"balanceCd\" type=\"STRING\" size=\"256\"/><Column id=\"balanceNm\" type=\"STRING\" size=\"256\"/><Column id=\"visitYn\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroup\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOffice\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroupNm\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOfficeNm\" type=\"STRING\" size=\"256\"/><Column id=\"o2oYn\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
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
            obj = new Div("div_search", "absolute", "10", "10", null, "73", "10", null, this);
            obj.set_taborder("0");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_rentalGroup", "absolute", "323", "10", "78", "20", null, null, this.div_search);
            obj.set_taborder("53");
            obj.set_text("렌탈지사");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_rentalGroupNm", "absolute", "401", "10", "142", "21", null, null, this.div_search);
            obj.set_taborder("54");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_rentalOfficeNm", "absolute", "651", "10", "142", "21", null, null, this.div_search);
            obj.set_taborder("57");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchAgency", "absolute", "20", "41", "66", "20", null, null, this.div_search);
            obj.set_taborder("58");
            obj.set_text("대리점");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_searchAgency", "absolute", "86", "41", "140", "21", null, null, this.div_search);
            obj.set_taborder("59");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_rentalOffice", "absolute", "573", "10", "78", "20", null, null, this.div_search);
            obj.set_taborder("60");
            obj.set_text("렌탈지점");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            obj.set_enableevent("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_OpYn", "absolute", "323", "41", "114", "20", null, null, this.div_search);
            obj.set_taborder("61");
            obj.set_text("온라인장착여부");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cbo_opYn", "absolute", "437", "41", "60", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            var cbo_opYn_innerdataset = new Dataset("cbo_opYn_innerdataset", this.div_search.cbo_opYn);
            cbo_opYn_innerdataset._setContents("<ColumnInfo><Column id=\"codecolumn\" size=\"256\"/><Column id=\"datacolumn\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"codecolumn\">Y</Col><Col id=\"datacolumn\">Y</Col></Row><Row><Col id=\"codecolumn\">N</Col><Col id=\"datacolumn\">N</Col></Row></Rows>");
            obj.set_innerdataset(cbo_opYn_innerdataset);
            obj.set_taborder("62");
            obj.set_displaynulltext("선택");
            obj.set_codecolumn("codecolumn");
            obj.set_datacolumn("datacolumn");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj.set_value("Y");
            obj.set_text("Y");
            obj.set_index("0");
            obj = new Edit("ed_rentalGroup", "absolute", "458", "10", "68", "21", null, null, this.div_search);
            obj.set_taborder("63");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_rentalOffice", "absolute", "704", "10", "69", "21", null, null, this.div_search);
            obj.set_taborder("64");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("bt_rentalGroup", "absolute", "523", "9", "20", "21", null, null, this.div_search);
            obj.set_taborder("65");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("bt_rentalOffice", "absolute", "773", "10", "20", "21", null, null, this.div_search);
            obj.set_taborder("66");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_excel", "absolute", null, "10", "45", "22", "55", null, this.div_search);
            obj.set_taborder("67");
            obj.set_text("엑셀");
            obj.set_cssclass("btn_WF_CRUD");
            obj.getSetter("domainId").set("nexa.search");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "0", "0", "20", null, null, "0", this.div_search);
            obj.set_taborder("68");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static22", "absolute", "0", "0", "1000", "10", null, null, this.div_search);
            obj.set_taborder("69");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "0", "31", "1000", "10", null, null, this.div_search);
            obj.set_taborder("70");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "293", "0", "30", null, null, "0", this.div_search);
            obj.set_taborder("71");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "543", "0", "30", null, null, "0", this.div_search);
            obj.set_taborder("72");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "793", "0", "30", null, null, "0", this.div_search);
            obj.set_taborder("73");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_search", "absolute", null, "10", "45", "22", "5", null, this.div_search);
            obj.set_taborder("75");
            obj.set_text("조회");
            obj.set_cssclass("btn_WF_CRUD");
            obj.getSetter("domainId").set("nexa.search");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static05", "absolute", "0", "62", "1000", "10", null, null, this.div_search);
            obj.set_taborder("76");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_region", "absolute", "20", "10", "56", "20", null, null, this.div_search);
            obj.set_taborder("77");
            obj.set_text("지역");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cbo_sido", "absolute", "86", "10", "92", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("78");
            obj.set_innerdataset("@ds_s016");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj = new Combo("cbo_sigun", "absolute", "177", "10", "116", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("79");
            obj.set_innerdataset("@ds_s017");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");

            obj = new Grid("grd_agency", "absolute", "10", "93", null, "357", "10", null, this);
            obj.set_taborder("1");
            obj.set_binddataset("ds_agencyPop");
            obj.set_cellsizingtype("col");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"250\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"60\"/><Column size=\"200\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"80\"/><Column size=\"140\"/><Column size=\"111\"/><Column size=\"65\"/><Column size=\"200\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"대리점코드\"/><Cell col=\"1\" text=\"대리점명\"/><Cell col=\"2\" text=\"렌탈지사\"/><Cell col=\"3\" text=\"렌탈지사명\"/><Cell col=\"4\" text=\"렌탈지점\"/><Cell col=\"5\" text=\"렌탈지점명\"/><Cell col=\"6\" text=\"우편번호\"/><Cell col=\"7\" text=\"주소\"/><Cell col=\"8\" text=\"상세주소\"/><Cell col=\"9\" text=\"전화번호\"/><Cell col=\"10\" text=\"대표명\"/><Cell col=\"11\" text=\"벤더코드\"/><Cell col=\"12\" text=\"세금계산서 발행방법\"/><Cell col=\"13\" text=\"렌탈대리점 여부 \"/><Cell col=\"14\" text=\"온라인장착\"/><Cell col=\"15\" text=\"비고\"/></Band><Band id=\"body\"><Cell text=\"bind:agencyCd\"/><Cell col=\"1\" style=\"align:left;\" text=\"bind:agencyNm\"/><Cell col=\"2\" text=\"bind:rentalGroup\"/><Cell col=\"3\" text=\"bind:rentalGroupNm\"/><Cell col=\"4\" text=\"bind:rentalOffice\"/><Cell col=\"5\" text=\"bind:rentalOfficeNm\"/><Cell col=\"6\" text=\"bind:posCd\"/><Cell col=\"7\" style=\"align:left;\" text=\"bind:city\"/><Cell col=\"8\" style=\"align:left;\" text=\"bind:street\"/><Cell col=\"9\" edittype=\"none\" text=\"bind:telNo\" expr=\"expr:FN_numberHyphenInReturnSilent(telNo)\"/><Cell col=\"10\" text=\"bind:repNm\"/><Cell col=\"11\" text=\"bind:lifnr\"/><Cell col=\"12\" text=\"bind:taxRqcd\"/><Cell col=\"13\" text=\"bind:rentalYn\"/><Cell col=\"14\" text=\"bind:opYn\"/><Cell col=\"15\" style=\"align:left;\" text=\"bind:memo\" expandsize=\"13\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Button("btn_choice", "absolute", null, "460", "41", "21", "56", null, this);
            obj.set_taborder("2");
            obj.set_text("선택");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);

            obj = new Button("btn_close", "absolute", null, "460", "41", "21", "9", null, this);
            obj.set_taborder("3");
            obj.set_text("닫기");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "0", "10", "491", null, null, this);
            obj.set_taborder("4");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static22", "absolute", "0", "0", "1024", "10", null, null, this);
            obj.set_taborder("5");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1014", "0", "10", "491", null, null, this);
            obj.set_taborder("6");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "8", "450", null, "10", "0", null, this);
            obj.set_taborder("7");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "0", "481", "1024", "10", null, null, this);
            obj.set_taborder("8");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0", "83", "1024", "10", null, null, this);
            obj.set_taborder("9");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 0, 73, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("0");
            		p.set_text("Div00");
            		p.set_scrollbars("none");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1024, 485, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCMAgency_pop");
            		p.set_titletext("대리점조회");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCOMMAgency_pop.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCOMMAgency_pop.xfdl", function() {
        /***************************************************************************************************
         * 파 일 명 : RTCOMMAgency_pop.xfdl
         * 설    명 : 대리점 조회 (팝업)
         * 작 성 자 :
         * 변경이력 :
         * 변경일자		변경자		변경내용
         * ----------	------		--------
         * 2016-04-15	이영근		대리점 채널 대분류,중분류 항목 추가
         * 2016-05-04	이영근		벤더코드 문자입력 방지
         * 2016-09-26	임욱재		온라인장착 가능여부 추가
         * 2018-01-02	wjim		[20171226_01] 비고 추가
         * 2018-11-22	wjim		[20181122_01] 방문장착 프로세스 개발
         ***************************************************************************************************/

        /***********************************************************************
         * Script Include
         ***********************************************************************/
        //include "lib::comLib.xjs";

        /***********************************************************************
         * FORM 변수 선언 영역
         ***********************************************************************/
        this.opYn	 = this.parent.p_opYn;	/* 온라인장착 가능여부 */
        this.formId	 = this.parent.p_formId;
        this.arg	 = this.parent.p_arg;
        this.vkGrpCd = this.parent.p_vkgrpCd;
        this.vkGrpNm = this.parent.p_vkgrpNm;
        this.vkBurCd = this.parent.p_vkburCd;
        this.vkBurNm = this.parent.p_vkburNm;
        this.showmodalRetVal = "";

        /***********************************************************************
         * 그룹 변수 선언부
         ***********************************************************************/

        /***********************************************************************************
         * Form Load Common Function
         ***********************************************************************************/
        this.form_onload = function(obj,e) {
        	Ex.core.init(obj);
        	
        	this.fn_init();
        }

        /**
         * ESC Key 입력 Onkeyup Event
         */
        this.RTCOMMAgency_pop_onkeyup = function(obj,e) {
        	if(e.keycode == 27) {
        		this.close();
        	}
        }

        /**
         * 화면 초기화
         */
        this.fn_init = function() {
        	var div = this.div_search;
        	
        	if(	  this.formId == "RTSDOrder"
        	   || this.formId == "RTSDClaim"
        	   || this.formId == "RTCMContract"
        	   || this.formId == "RTCSCarmasterMemReg"
        	   || this.formId == "RTSDAgencyResult") {
        		
        		if(!Eco.isEmpty(this.vkGrpNm)) {
        			div.ed_rentalGroupNm.set_value(this.vkGrpNm);
        			div.ed_rentalGroup.set_value(this.vkGrpCd);
        			
        		}
        		
        		if(!Eco.isEmpty(this.vkBurNm)) {
        			div.ed_rentalOfficeNm.set_value(this.vkBurNm);
        			div.ed_rentalOffice.set_value(this.vkBurCd);
        			
        		}
        		
        		if(!Eco.isEmpty(this.vkGrpNm) || !Eco.isEmpty(this.vkBurNm)) {
        			this.fn_listAgencyPop();
        		}
        	} else if(	 this.formId == "RTCMTest"
        			  || this.arg	 == "RTCSZeroRepService"
        			  || this.arg	 == "RTCSEngineOilRepSer") {
        		if(!Eco.isEmpty(this.vkGrpNm)) {
        			div.ed_searchAgency.set_value(this.vkGrpNm);
        		}
        	}
        	
        	if(!Eco.isEmpty(this.opYn)) {
        		this.div_search.cbo_opYn.set_value(this.opYn);
        	}
        	
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
        	
        	var sidoCd		 = nvl(div.cbo_sido.value);							/* 지역(시도)				*/
        	var sigunCd		 = nvl(div.cbo_sigun.value);						/* 지역(시군구)			*/
        	var agencyNm	 = nvl(div.ed_searchAgency.text);					/* 대리점명				*/
        	var rentalYn	 = "Y";												/* 렌탈대리점 여부		*/
        	if(this.formId == "RTSDAgency"){
        		rentalYn	 = "";	//대리점 정보관리 화면에서는 모든 대리점 조회 가능 20190226 kst
        	}
        	var opYn		 = nvl(div.cbo_opYn.value);							/* 온라인장착 가능여부	*/
        	var rentalGroup	 = nvl(div.ed_rentalGroup.value);					/* 렌탈지사				*/
        	var rentalOffice = nvl(div.ed_rentalOffice.value);					/* 렌탈지점				*/
        	var userId		 = application.gds_userInfo.getColumn(0, "userId");	/* 사용자ID				*/
        	
        	var sSvcID		 = "listAgencyPop";
        	var sController	 = "rtms/comm/listAgencyPop.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "ds_agencyPop=mapAgencyPop";
        	var sArgs		 = "";
        		sArgs		+= Ex.util.setParam("sidoCd",		sidoCd);
        		sArgs		+= Ex.util.setParam("sigunCd",		sigunCd);
        		sArgs		+= Ex.util.setParam("agencyNm",		agencyNm);
        		sArgs		+= Ex.util.setParam("rentalYn",		rentalYn);
        		sArgs		+= Ex.util.setParam("opYn",			opYn);
        		sArgs		+= Ex.util.setParam("rentalGroup",	rentalGroup);
        		sArgs		+= Ex.util.setParam("rentalOffice",	rentalOffice);
        		sArgs		+= Ex.util.setParam("userId",		userId);
        	var fn_callBack	 = "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /***********************************************************************************
         * CallBack Event(strSvcId - Sevice ID, nErrorCode - ErrorCode, strErrorMsg - Error Message)
         ***********************************************************************************/
        /**
         * CallBack
         */
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
        			if(this.ds_agencyPop.getRowCount == 0) {
        				this.alert("조회된 데이터가 없습니다.");
        			}
        			break;
        		
        		default:
        			break;
        	}
        }

        /***********************************************************************************
         * User Function
         ***********************************************************************************/
        /**
         * 조회결과 행이 선택되었을 때 처리
         * - 모화면에 따라 조회결과를 커스터마이징하여 반환
         */
        this.fn_choice = function() {
        	var idx = this.ds_agencyPop.rowposition;
        	
        	if(idx != -1) {
        		var arr = [];
        		
        		var agencyCd	   = this.ds_agencyPop.getColumn(idx, "agencyCd");
        		var agencyNm	   = this.ds_agencyPop.getColumn(idx, "agencyNm");
        		var rentalGroup	   = this.ds_agencyPop.getColumn(idx, "rentalGroup");
        		var rentalOffice   = this.ds_agencyPop.getColumn(idx, "rentalOffice");
        		var rentalGroupNm  = this.ds_agencyPop.getColumn(idx, "rentalGroupNm");
        		var rentalOfficeNm = this.ds_agencyPop.getColumn(idx, "rentalOfficeNm");
        		var telNo		   = this.ds_agencyPop.getColumn(idx, "telNo");
        		var posCd		   = this.ds_agencyPop.getColumn(idx, "posCd");
        		var city		   = this.ds_agencyPop.getColumn(idx, "city");
        		var street		   = this.ds_agencyPop.getColumn(idx, "street");
        		var visitYn		   = this.ds_agencyPop.getColumn(idx, "visitYn");
        		var o2oYn          = this.ds_agencyPop.getColumn(idx, "o2oYn");
        			
        		if(this.arg == "RTSDContractRegister" || this.arg == "RTSDDirectOrder") {
        			/* 2016-07-28 이영근, 주소 항목추가 [20181122_01] 방문장착여부 추가 */
        			arr = [agencyCd, agencyNm, rentalGroup, rentalOffice, posCd, city, street, telNo, visitYn];
        			
        			this.close(this.opener.FN_returnAgency(arr));
        		} else if(this.formId == "RTSDPlan" || this.formId == "RTCSCarmasterMemReg") {
        			arr = [agencyCd, agencyNm, "vkazc"];
        			
        			this.close(this.opener._setReturn(arr));
        		} else if(	 this.formId == "RTSDOrder"
        				  || this.formId == "RTSDClaim"
        				  || this.formId == "RTCMContract"
        				  || this.arg	 == "RTSDAgencyResult"
        				  || this.formId == "RTSDAgencyResult"
        				  || this.arg	 == "RTSDContractStatus_tab_info1_install"
        				  || this.arg	 == "RTSDContractStatus_tab_info1_install"
        				  || this.arg	 == "RTCSAdviceStatus_tab_info4_install") {
        			
        			arr = [rentalGroupNm, rentalGroup, rentalOfficeNm, rentalOffice, agencyNm, agencyCd];
        			
        			this.close(this.opener.return_agency(arr));
        		} else if(this.arg == "RTCSWarehAgencyRegister_select") {
        			arr = [agencyCd, agencyNm];
        			
        			this.close(this.opener.returnAgencyCdSelect(arr));
        		} else if(this.arg == "RTCSWarehAgencyRegister_insert") {
        			arr = [agencyCd, agencyNm];
        			
        			this.close(this.opener.returnAgencyCdInsert(arr));
        		} else if(this.arg == "RTCSWarehouseRegister_select") {
        			arr = [agencyCd, agencyNm];
        			
        			this.close(this.opener.returnAgencySelect(arr));
        		} else if(this.arg == "RTCSKeepHistory" || this.arg == "RTCOMMStrgRegister") {
        			arr = [agencyCd, agencyNm];
        			
        			this.close(this.opener.returnAgencyCd(arr));
        			
        		} else if(this.arg == "RTSDB2BContractRegister") {
        			/* 2016-07-28 이영근, 주소 항목추가 */
        			arr = [agencyCd, agencyNm, rentalGroup, rentalOffice, posCd, city, street, telNo];
        			
        			this.close(this.opener.FN_returnAgency(arr));
        		} else if(this.arg == "RTCSZeroRepService" || this.arg == "RTCSEngineOilRepSer") {
        			arr = [agencyCd, agencyNm, telNo, posCd, city, street, o2oYn];
        			
        			this.close(this.opener.returnAgencyCd(arr));
        		} else {
        			arr = [agencyCd, agencyNm, "vkazc"];
        			
        			this.close(this.opener._setReturn(arr));
        		}
        	} else {
        		this.alert("선택된 데이터가 없습니다.");
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
         * 엑셀
         */
        this.div_search_btn_excel_onclick = function(obj,e) {
        	Ex.core.exportExcel(this, this.grd_agency, "대리점정보");
        }

        /**
         * 선택
         */
        this.btn_choice_onclick = function(obj,e) {
        	this.fn_choice();
        }

        /**
         * 닫기
         */
        this.btn_close_onclick = function(obj,e) {
        	this.close();
        }

        /**
         * 대리점 Onkeyup Event
         */
        this.div_search_edt_searchKeyword_onkeyup = function(obj,e) {
        	if(e.keycode == "13") {
        		this.fn_listAgencyPop();
        	}
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
         * 렌탈지사 Onclick Event
         */
        this.div_search_bt_rentalGroup_onclick = function(obj,e) {
        	var ownerFrame = this.getOwnerFrame();
        	var popup	   = new ChildFrame();
        	
        	popup.init("RTCOMMVkgrp_pop", "absolute", 0, 0, 400, 460, null, null, "comm::RTCOMMVkgrp_pop.xfdl");
        	popup.set_openalign("center middle");
        	popup.set_showtitlebar(true);
        	popup.set_resizable(false);
        	popup.showModal(ownerFrame, {}, this, this.fn_callBack_RTCMVkgrp_pop);
        }

        /**
         * 렌탈지점 Onclick Event
         */
        this.div_search_bt_rentalOffice_onclick = function(obj,e){
        	var ownerFrame = this.getOwnerFrame();
        	var popup	   = new ChildFrame();
        	var args	   = {p_rentalGroup : this.div_search.ed_rentalGroup.value};
        	
        	popup.init("RTCOMMVkbur_pop", "absolute", 0, 0, 400, 460, null, null, "comm::RTCOMMVkbur_pop.xfdl");
        	popup.set_openalign("center middle");		
        	popup.set_showtitlebar(true);
        	popup.set_resizable(false);
        	popup.showModal(ownerFrame, args, this, this.fn_callBack_RTCMVkgrp_pop);
        }

        /**
         * 지사, 지점선택 팝업
         */
        this.fn_callBack_RTCMVkgrp_pop = function(strId,res) {
        	res = this.showmodalRetVal;
        	
        	if(strId == "RTCOMMVkgrp_pop") {
        		this.div_search.ed_rentalGroup.set_value(res.cd);
        		this.div_search.ed_rentalGroupNm.set_value(res.nm);
        	}
        	if(strId == "RTCOMMVkbur_pop") {
        		this.div_search.ed_rentalOffice.set_value(res.cd);
        		this.div_search.ed_rentalOfficeNm.set_value(res.nm);
        	}
        }

        /**
         * grd_agency Oncelldblclick Event
         */
        this.grd_agency_oncelldblclick = function(obj,e) {
        	this.fn_choice();
        }

        this.setRetVal = function(res) {
        	this.showmodalRetVal = res;
        }
        this.div_search_ed_searchAgency_onchanged = function(obj,e)
        {
        	this.fn_listAgencyPop();
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.addEventHandler("onkeyup", this.RTCOMMAgency_pop_onkeyup, this);
            this.div_search.ed_rentalGroupNm.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.div_search.ed_rentalOfficeNm.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.div_search.ed_searchAgency.addEventHandler("onchanged", this.div_search_ed_searchAgency_onchanged, this);
            this.div_search.ed_rentalGroup.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.div_search.ed_rentalOffice.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.div_search.bt_rentalGroup.addEventHandler("onclick", this.div_search_bt_rentalGroup_onclick, this);
            this.div_search.bt_rentalOffice.addEventHandler("onclick", this.div_search_bt_rentalOffice_onclick, this);
            this.div_search.btn_excel.addEventHandler("onclick", this.div_search_btn_excel_onclick, this);
            this.div_search.btn_search.addEventHandler("onclick", this.btn_search_onclick, this);
            this.div_search.cbo_sido.addEventHandler("onitemchanged", this.div_search_cbo_sido_onitemchanged, this);
            this.grd_agency.addEventHandler("oncelldblclick", this.grd_agency_oncelldblclick, this);
            this.btn_choice.addEventHandler("onclick", this.btn_choice_onclick, this);
            this.btn_close.addEventHandler("onclick", this.btn_close_onclick, this);

        };

        this.loadIncludeScript("RTCOMMAgency_pop.xfdl");

       
    };
}
)();
