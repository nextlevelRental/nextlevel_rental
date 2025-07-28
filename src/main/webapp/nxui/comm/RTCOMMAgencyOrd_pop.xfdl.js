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
                this.set_name("RTCOMMAgencyOrd_pop");
                this.set_classname("RTCMAgency_pop");
                this.set_titletext("주문등록 대리점조회");
                this._setFormPosition(0,0,1024,520);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_agencyOrdPop", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"agencyCd\" type=\"STRING\" size=\"256\"/><Column id=\"agencyNm\" type=\"STRING\" size=\"256\"/><Column id=\"salesGroup\" type=\"STRING\" size=\"256\"/><Column id=\"salesGroupNm\" type=\"STRING\" size=\"256\"/><Column id=\"salesOffice\" type=\"STRING\" size=\"256\"/><Column id=\"salesOfficeNm\" type=\"STRING\" size=\"256\"/><Column id=\"posCd\" type=\"STRING\" size=\"256\"/><Column id=\"city\" type=\"STRING\" size=\"256\"/><Column id=\"street\" type=\"STRING\" size=\"256\"/><Column id=\"sidoCd\" type=\"STRING\" size=\"256\"/><Column id=\"sigunCd\" type=\"STRING\" size=\"256\"/><Column id=\"serNo\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"faxNo\" type=\"STRING\" size=\"256\"/><Column id=\"taxNo\" type=\"STRING\" size=\"256\"/><Column id=\"repNm\" type=\"STRING\" size=\"256\"/><Column id=\"busiType\" type=\"STRING\" size=\"256\"/><Column id=\"busiCond\" type=\"STRING\" size=\"256\"/><Column id=\"rentalYn\" type=\"STRING\" size=\"256\"/><Column id=\"strDay\" type=\"STRING\" size=\"256\"/><Column id=\"endDay\" type=\"STRING\" size=\"256\"/><Column id=\"posX\" type=\"STRING\" size=\"256\"/><Column id=\"posY\" type=\"STRING\" size=\"256\"/><Column id=\"lmYn\" type=\"STRING\" size=\"256\"/><Column id=\"fmYn\" type=\"STRING\" size=\"256\"/><Column id=\"lifnr\" type=\"STRING\" size=\"256\"/><Column id=\"taxRqcd\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regNm\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgNm\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/><Column id=\"chanLclsNm\" type=\"STRING\" size=\"256\"/><Column id=\"chanMclsNm\" type=\"STRING\" size=\"256\"/><Column id=\"chanLclsCd\" type=\"STRING\" size=\"256\"/><Column id=\"chanMclsCd\" type=\"STRING\" size=\"256\"/><Column id=\"taxRqcdNm\" type=\"STRING\" size=\"256\"/><Column id=\"cwYn\" type=\"STRING\" size=\"256\"/><Column id=\"chYn\" type=\"STRING\" size=\"256\"/><Column id=\"opYn\" type=\"STRING\" size=\"256\"/><Column id=\"memo\" type=\"STRING\" size=\"256\"/><Column id=\"desorptCd\" type=\"STRING\" size=\"256\"/><Column id=\"desorptNm\" type=\"STRING\" size=\"256\"/><Column id=\"alignCd\" type=\"STRING\" size=\"256\"/><Column id=\"alignNm\" type=\"STRING\" size=\"256\"/><Column id=\"balanceCd\" type=\"STRING\" size=\"256\"/><Column id=\"balanceNm\" type=\"STRING\" size=\"256\"/><Column id=\"visitYn\" type=\"STRING\" size=\"256\"/><Column id=\"o2oYn\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_S016", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_S017", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Div("div_search", "absolute", "10", "8", null, "76", "10", null, this);
            obj.set_taborder("0");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_searchSalesGroup", "absolute", "62", "10", "68", "20", null, null, this.div_search);
            obj.set_taborder("53");
            obj.set_text("지사");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_searchSalesGroupNm", "absolute", "130", "10", "112", "21", null, null, this.div_search);
            obj.set_taborder("54");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_searchSalesOfficeNm", "absolute", "413", "10", "142", "21", null, null, this.div_search);
            obj.set_taborder("57");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchAgency", "absolute", "625", "10", "60", "20", null, null, this.div_search);
            obj.set_taborder("58");
            obj.set_text("대리점");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_searchAgency", "absolute", "685", "10", "140", "21", null, null, this.div_search);
            obj.set_taborder("59");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchSalesOffice", "absolute", "345", "10", "68", "20", null, null, this.div_search);
            obj.set_taborder("60");
            obj.set_text("지점");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            obj.set_enableevent("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_searchSalesGroup", "absolute", "159", "10", "94", "21", null, null, this.div_search);
            obj.set_taborder("63");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_searchSalesOffice", "absolute", "466", "10", "69", "21", null, null, this.div_search);
            obj.set_taborder("64");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("bt_searchSalesGroup", "absolute", "252", "9", "20", "21", null, null, this.div_search);
            obj.set_taborder("65");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("bt_searchSalesOffice", "absolute", "535", "10", "20", "21", null, null, this.div_search);
            obj.set_taborder("66");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_excel", "absolute", null, "10", "45", "22", "55", null, this.div_search);
            obj.set_taborder("67");
            obj.set_text("엑셀");
            obj.set_cssclass("btn_WF_CRUD");
            obj.getSetter("domainId").set("nexa.search");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "24", "0", "20", "41", null, null, this.div_search);
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
            obj = new Button("btn_search", "absolute", null, "10", "45", "22", "5", null, this.div_search);
            obj.set_taborder("75");
            obj.set_text("조회");
            obj.set_cssclass("btn_WF_CRUD");
            obj.getSetter("domainId").set("nexa.search");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_Sido", "absolute", "130", "41", "92", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("78");
            obj.set_autoselect("true");
            obj.set_innerdataset("ds_S016");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("10");
            obj.set_index("0");
            obj = new Combo("cb_Sigun", "absolute", "414", "41", "116", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("79");
            obj.set_autoselect("true");
            obj.set_innerdataset("ds_S017");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("10");
            obj.set_enable("false");
            obj.set_index("0");
            obj = new Static("st_salesOffice", "absolute", "346", "41", "80", "21", null, null, this.div_search);
            obj.set_taborder("80");
            obj.set_text("시군구");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_salesGroupNm", "absolute", "62", "41", "80", "21", null, null, this.div_search);
            obj.set_taborder("81");
            obj.set_text("광역시도");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static05", "absolute", "0", "62", "1000", "10", null, null, this.div_search);
            obj.set_taborder("82");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "825", "0", "76", "41", null, null, this.div_search);
            obj.set_taborder("83");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "270", "0", "76", "41", null, null, this.div_search);
            obj.set_taborder("84");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "555", "0", "76", "41", null, null, this.div_search);
            obj.set_taborder("85");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);

            obj = new Grid("grid_agency", "absolute", "0.98%", "93", null, "385", "0.98%", null, this);
            obj.set_taborder("1");
            obj.set_binddataset("ds_agencyOrdPop");
            obj.set_cellsizingtype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"250\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"60\"/><Column size=\"200\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"80\"/><Column size=\"140\"/><Column size=\"111\"/><Column size=\"65\"/><Column size=\"200\"/><Column size=\"40\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"대리점코드\"/><Cell col=\"1\" text=\"대리점명\"/><Cell col=\"2\" text=\"지사\"/><Cell col=\"3\" text=\"지사명\"/><Cell col=\"4\" text=\"지점\"/><Cell col=\"5\" text=\"지점명\"/><Cell col=\"6\" text=\"우편번호\"/><Cell col=\"7\" text=\"주소\"/><Cell col=\"8\" text=\"상세주소\"/><Cell col=\"9\" text=\"전화번호\"/><Cell col=\"10\" text=\"대표명\"/><Cell col=\"11\" text=\"벤더코드\"/><Cell col=\"12\" text=\"세금계산서 발행방법\"/><Cell col=\"13\" text=\"렌탈대리점 여부 \"/><Cell col=\"14\" text=\"온라인장착\"/><Cell col=\"15\" text=\"비고\"/><Cell col=\"16\" text=\"거점여부\"/></Band><Band id=\"body\"><Cell edittype=\"readonly\" text=\"bind:agencyCd\"/><Cell col=\"1\" edittype=\"readonly\" style=\"align:left;\" text=\"bind:agencyNm\"/><Cell col=\"2\" text=\"bind:salesGroup\"/><Cell col=\"3\" text=\"bind:salesGroupNm\"/><Cell col=\"4\" text=\"bind:salesOffice\"/><Cell col=\"5\" text=\"bind:salesOfficeNm\"/><Cell col=\"6\" edittype=\"readonly\" text=\"bind:posCd\"/><Cell col=\"7\" edittype=\"readonly\" style=\"align:left;\" text=\"bind:city\"/><Cell col=\"8\" edittype=\"readonly\" style=\"align:left;\" text=\"bind:street\"/><Cell col=\"9\" edittype=\"readonly\" text=\"bind:telNo\"/><Cell col=\"10\" text=\"bind:repNm\"/><Cell col=\"11\" text=\"bind:lifnr\"/><Cell col=\"12\" text=\"bind:taxRqcd\"/><Cell col=\"13\" text=\"bind:rentalYn\"/><Cell col=\"14\" text=\"bind:opYn\"/><Cell col=\"15\" style=\"align:left;\" text=\"bind:memo\" expandsize=\"13\"/><Cell col=\"16\" text=\"bind:o2oYn\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Button("btn_choice", "absolute", null, "488", "41", "21", "56", null, this);
            obj.set_taborder("2");
            obj.set_text("선택");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);

            obj = new Button("btn_close", "absolute", null, "488", "41", "21", "9", null, this);
            obj.set_taborder("3");
            obj.set_text("닫기");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "29", "10", "491", null, null, this);
            obj.set_taborder("4");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static22", "absolute", "0", "-2", "1024", "10", null, null, this);
            obj.set_taborder("5");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1014", "29", "10", "491", null, null, this);
            obj.set_taborder("6");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "8", "478", null, "10", "0", null, this);
            obj.set_taborder("7");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "0", "509", "1024", "10", null, null, this);
            obj.set_taborder("8");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0", "84", "1024", "10", null, null, this);
            obj.set_taborder("9");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 0, 76, this.div_search,
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
            obj = new Layout("default", "", 1024, 520, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCMAgency_pop");
            		p.set_titletext("주문등록 대리점조회");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCOMMAgencyOrd_pop.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCOMMAgencyOrd_pop.xfdl", function() {
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

        //include "lib::comLib.xjs";
         
        this.fv_opYn = "";	// 온라인장착 가능여부

        /**
         * 폼의 모든 컴포넌트가 생성되고, 모든 오브젝트가 로딩되었을 때 이벤트 처리
         */
        this.form_onload = function(obj,e)	{

        	Ex.core.init(obj);
        	
        	// 모화면에서 온라인장착 가능여부 파라미터를 받았는지 확인하여 전역변수로 세팅
        	// - 받지않은 경우 null로 처리하여 가능여부와 관계없이 모두 조회되도록 함
        // 	if (this.parent.p_opYn == "Y" || this.parent.p_opYn == "N") {
        // 		this.fv_opYn = this.parent.p_opYn;
        // 	}
        	
        	this.fn_getCommCode();	
        }
        /**
         * 키입력 이벤트 처리
         * - ESC 키 입력 시 닫기
         */
        this.RTCOMMAgencyOrd_pop_onkeyup = function(obj,e)	{
        	if(e.keycode == 27){
        		this.close();
        	}
        }
        /**
         * 공통코드 조회
         */ 
        this.fn_getCommCode  = function() {
        	var sSvcID      	= "getCommCode";  
        	var sController   	= "/rtms/sd/initRTSDAgency.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_S016=mapSidoCd ds_S017=mapSigunCd";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 		
        }
        /**
         * CallBack 처리
         */
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg,resultCnt){
        	if (nErrorCode < 0) {
        		alert(strErrorMsg);		
        		return;
        	}
        	
        	if( strSvcId == "listAgencyOrdPop" ){
        		var ct = this.ds_agencyOrdPop.rowcount;
        		if( ct != 0 ){
        		
        		}else{
        			alert("조회된 데이터가 없습니다.");
        			this.grid_agency.set_nodatatext("조회된 데이터가 없습니다.");
        			this.div_search.ed_searchAgency.setFocus();
        		}
        	}
        	
        	if( strSvcId == "getCommCode" ){
        		// 조회조건-광역시도 초기화
        		var insert = this.ds_S016.insertRow(0);
        		this.ds_S016.setColumn(insert,"cd","");
        		this.ds_S016.setColumn(insert,"cdNm","전체");
        		this.div_search.cb_Sido.set_value("");
        	}
        }

        /**
         * 조회조건>지사(돋보기) 버튼의 클릭 이벤트 처리
         */
        this.div_search_bt_searchSalesGroup_onclick = function(obj,e){
        	var ownerFrame = this.getOwnerFrame();
        	var popup = new ChildFrame();
        	
        	popup.init("RTCOMMVkgrpOrd_pop", "absolute", 0, 0, 400,460, null, null, "comm::RTCOMMVkgrpOrd_pop.xfdl");
        	popup.set_openalign("center middle");		
        	popup.set_showtitlebar(true);
        	popup.set_resizable(false);
        	popup.showModal(ownerFrame, {}, this, this.FN_CallBack_RTCMVkgrp_pop);
        }

        /**
         * 조회조건>지점(돋보기) 버튼의 클릭 이벤트 처리
         */
        this.div_search_bt_searchSalesOffice_onclick = function(obj,e){
        	var ownerFrame = this.getOwnerFrame();
        	var popup = new ChildFrame();
        	var args = {p_rentalGroup: this.div_search.ed_searchSalesGroup.value};
        	
        	popup.init("RTCOMMVkburOrd_pop", "absolute", 0, 0, 400,460, null, null, "comm::RTCOMMVkburOrd_pop.xfdl");
        	popup.set_openalign("center middle");		
        	popup.set_showtitlebar(true);
        	popup.set_resizable(false);
        	popup.showModal(ownerFrame, args, this, this.FN_CallBack_RTCMVkgrp_pop);
        }

        /**
         * 지사, 지점선택 팝업
         */
        this.FN_CallBack_RTCMVkgrp_pop = function(strId,res){
        	res = showmodalRetVal;
        	if( strId == "RTCOMMVkgrpOrd_pop" ){
        		this.div_search.ed_searchSalesGroupNm.set_value(res.nm);
        		this.div_search.ed_searchSalesGroup.set_value(res.cd);
        	}
        	if( strId == "RTCOMMVkburOrd_pop" ){
        		this.div_search.ed_searchSalesOfficeNm.set_value(res.nm);
        		this.div_search.ed_searchSalesOffice.set_value(res.cd);
        	}
        }

        /**
         * 대리점 조회조건의 키입력 이벤트 처리
         * - 엔터키 입력 시 조회
         */
        this.div_search_edt_searchKeyword_onkeyup = function(obj,e){
        	if( e.keycode == "13" ){
        		this.FN_search();
        	}
        }

        /**
         * 엑셀 버튼의 클릭 이벤트 처리
         */
        this.div_search_btn_excel_onclick = function(obj,e){
        	Ex.core.exportExcel(this, this.grid_agency, "대리점정보");
        }

        /**
         * 조회 버튼의 클릭 이벤트 처리
         */
        this.btn_search_onclick = function(obj,e){
        	this.FN_search();
        }

        /**
         * 조회
         */
        this.FN_search = function(){

        	var salesGroup  = nvl(this.div_search.ed_searchSalesGroup.value);   //렌탈지사
        	var salesOffice = nvl(this.div_search.ed_searchSalesOffice.value);  //렌탈지점
        	var agencyNm 	= nvl(this.div_search.ed_searchAgency.value);
        	var sidoCd 	= nvl(this.div_search.cb_Sido.value);
        	var sigunCd 	= nvl(this.div_search.cb_Sigun.value);
        	/*var userId       = application.gds_userInfo.getColumn(0, "userId");*/ //사용자ID
        	
        	
        	var sSvcID        	= "listAgencyOrdPop";
        	var sController   	= "rtms/comm/listAgencyOrdPop.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_agencyOrdPop=mapAgencyOrdPop";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	this.ds_agencyOrdPop.deleteAll();
        	sArgs += Ex.util.setParam("salesGroup" , salesGroup);
        	sArgs += Ex.util.setParam("salesOffice", salesOffice);
        	sArgs += Ex.util.setParam("agencyNm"   , agencyNm);
        	sArgs += Ex.util.setParam("sidoCd"     , sidoCd);
         	sArgs += Ex.util.setParam("sigunCd"    , sigunCd);
        	sArgs += Ex.util.setParam("opYn"       , this.fv_opYn);	// 온라인장착 가능여부(null인 경우 가능여부 관계없이 모두 조회)
        /*	sArgs += Ex.util.setParam("userId", userId);*/
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 조회결과 더블클릭 이벤트 처리
         */
        this.grid_agency_oncelldblclick = function(obj,e){
        	this.FN_choice();
        }

        /**
         * 조회결과 행이 선택되었을 때 처리
         * - 모화면에 따라 조회결과를 커스터마이징하여 반환
         */
        this.FN_choice = function(){
        	var idx = this.ds_agencyOrdPop.rowposition;
        	
        	if( idx != -1 ){
        		var agencyCd  		= this.ds_agencyOrdPop.getColumn(idx, "agencyCd");
        		var agencyNm  		= this.ds_agencyOrdPop.getColumn(idx, "agencyNm");
        		var salesGroup		= this.ds_agencyOrdPop.getColumn(idx, "salesGroup");
        		var salesOffice 	= this.ds_agencyOrdPop.getColumn(idx, "salesOffice");
        		var salesGroupNm 	= this.ds_agencyOrdPop.getColumn(idx, "salesGroupNm");
        		var salesOfficeNm 	= this.ds_agencyOrdPop.getColumn(idx, "salesOfficeNm");
        		var telNo  			= this.ds_agencyOrdPop.getColumn(idx, "telNo");
        		var posCd  			= this.ds_agencyOrdPop.getColumn(idx, "posCd");
        		var city  			= this.ds_agencyOrdPop.getColumn(idx, "city");
        		var street  		= this.ds_agencyOrdPop.getColumn(idx, "street");
        		var visitYn  		= this.ds_agencyOrdPop.getColumn(idx, "visitYn");
        		
        		//20191205 kstka 거점여부판단
        		var o2oYn           = this.ds_agencyOrdPop.getColumn(idx, "o2oYn");

        		if( this.parent.p_arg == "RTSDContractRegister" || this.parent.p_arg == "RTSDDirectOrder" ){
        			var arr = [agencyCd , agencyNm, salesGroup, salesOffice, posCd, city, street, telNo, visitYn, o2oYn]; // 2016-07-28 이영근, 주소 항목추가 [20181122_01] 방문장착여부 추가] [20191205_01] O2O거점여부 추가;
        			this.close(this.opener.FN_returnAgency(arr));
        		} 
        		else if( this.parent.p_arg  == "RTSDContractStatus_tab_info1_install"){ 			
        			var arr = [salesGroupNm, salesGroup, salesOfficeNm, salesOffice, agencyNm, agencyCd];
        			this.close(this.opener.return_agency(arr));
        		}
        		else if( this.parent.p_arg  == "RTSDVisitInstallList"){ 			
        			var arr = [agencyCd , agencyNm];
        			this.close(this.opener.FN_returnAgency(arr));
        		}
        	}else{
        		alert("선택된 데이터가 없습니다.");
        	}		
        }

        /**
         * 선택 버튼의 클릭 이벤트 처리
         */
        this.btn_choice_onclick = function(obj,e){
        	this.FN_choice();
        }

        /**
         * 닫기 버튼의 클릭 이벤트 처리
         */
        this.btn_close_onclick = function(obj,e){
        	this.close();
        }

        
        var showmodalRetVal = "";

        this.setRetVal = function(res ){
        	showmodalRetVal = res;
        }
        /**
         * 광역시도 콤보에서 변경된 값이 적용된 후 이벤트 처리
         * - 시군구 콤보 필터링
         */
        this.div_search_cb_Sido_onitemchanged = function(obj,e) {
        	this.div_search.cb_Sigun.set_enable(true);
        	this.ds_S017.filter("cd.substr(0,2)=='" + e.posttext + "' || cd==''");
        	this.div_search.cb_Sigun.set_index(0);
        }

        

        this.div_search_Static04_onclick = function(obj,e)
        {
        	
        }

        this.div_search_ed_searchAgency_onchanged = function(obj,e)
        {
        	this.FN_search();
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.addEventHandler("onkeyup", this.RTCOMMAgencyOrd_pop_onkeyup, this);
            this.div_search.ed_searchSalesGroupNm.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.div_search.ed_searchSalesOfficeNm.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.div_search.ed_searchAgency.addEventHandler("onchanged", this.div_search_ed_searchAgency_onchanged, this);
            this.div_search.ed_searchSalesGroup.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.div_search.ed_searchSalesOffice.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.div_search.bt_searchSalesGroup.addEventHandler("onclick", this.div_search_bt_searchSalesGroup_onclick, this);
            this.div_search.bt_searchSalesOffice.addEventHandler("onclick", this.div_search_bt_searchSalesOffice_onclick, this);
            this.div_search.btn_excel.addEventHandler("onclick", this.div_search_btn_excel_onclick, this);
            this.div_search.Static04.addEventHandler("onclick", this.div_search_Static04_onclick, this);
            this.div_search.btn_search.addEventHandler("onclick", this.btn_search_onclick, this);
            this.div_search.cb_Sido.addEventHandler("onitemchanged", this.div_search_cb_Sido_onitemchanged, this);
            this.div_search.st_salesOffice.addEventHandler("onclick", this.div_search_st_salesOffice_onclick, this);
            this.grid_agency.addEventHandler("oncelldblclick", this.grid_agency_oncelldblclick, this);
            this.btn_choice.addEventHandler("onclick", this.btn_choice_onclick, this);
            this.btn_close.addEventHandler("onclick", this.btn_close_onclick, this);

        };

        this.loadIncludeScript("RTCOMMAgencyOrd_pop.xfdl");

       
    };
}
)();
