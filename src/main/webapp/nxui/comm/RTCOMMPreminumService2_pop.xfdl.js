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
                this.set_name("RTCOMMPreminumService2_pop");
                this.set_classname("RTCOMMPreminumService2_pop");
                this.set_titletext("New Form");
                this._setFormPosition(0,0,536,342);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_cnt", this);
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

            obj = new Dataset("ds_season", this);
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

            obj = new Dataset("ds_preminum", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"psCd\" type=\"STRING\" size=\"256\"/><Column id=\"psNm\" type=\"STRING\" size=\"256\"/><Column id=\"seq\" type=\"STRING\" size=\"256\"/><Column id=\"strDay\" type=\"STRING\" size=\"256\"/><Column id=\"endDay\" type=\"STRING\" size=\"256\"/><Column id=\"seasonCd\" type=\"STRING\" size=\"256\"/><Column id=\"seasonNm\" type=\"STRING\" size=\"256\"/><Column id=\"prsDcd\" type=\"STRING\" size=\"256\"/><Column id=\"prsNm\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"cntNm\" type=\"STRING\" size=\"256\"/><Column id=\"servVnt\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"servCnt0\" type=\"STRING\" size=\"256\"/><Column id=\"servCntr\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"servAmt\" type=\"STRING\" size=\"256\"/><Column id=\"servPAmt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_preminumCp", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"psCd\" type=\"STRING\" size=\"256\"/><Column id=\"psNm\" type=\"STRING\" size=\"256\"/><Column id=\"seq\" type=\"STRING\" size=\"256\"/><Column id=\"strDay\" type=\"STRING\" size=\"256\"/><Column id=\"endDay\" type=\"STRING\" size=\"256\"/><Column id=\"seasonCd\" type=\"STRING\" size=\"256\"/><Column id=\"seasonNm\" type=\"STRING\" size=\"256\"/><Column id=\"prsDcd\" type=\"STRING\" size=\"256\"/><Column id=\"prsNm\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"cntNm\" type=\"STRING\" size=\"256\"/><Column id=\"servVnt\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"servCnt0\" type=\"STRING\" size=\"256\"/><Column id=\"servCntr\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"servAmt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_preminumMst", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"psCd\" type=\"STRING\" size=\"256\"/><Column id=\"psNm\" type=\"STRING\" size=\"256\"/><Column id=\"seq\" type=\"STRING\" size=\"256\"/><Column id=\"ordId\" type=\"STRING\" size=\"256\"/><Column id=\"chanCd\" type=\"STRING\" size=\"256\"/><Column id=\"seasonCd\" type=\"STRING\" size=\"256\"/><Column id=\"servAmt\" type=\"STRING\" size=\"256\"/><Column id=\"memo\" type=\"STRING\" size=\"256\"/><Column id=\"strDay\" type=\"STRING\" size=\"256\"/><Column id=\"endDay\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_svcDetail", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"psCd\" type=\"STRING\" size=\"256\"/><Column id=\"prsDcd\" type=\"STRING\" size=\"256\"/><Column id=\"prsNm\" type=\"STRING\" size=\"256\"/><Column id=\"periodCd\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"servCnt\" type=\"STRING\" size=\"256\"/><Column id=\"servAmt\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/><Column id=\"memo\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_ord", this);
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

            obj = new Dataset("ds_chan", this);
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

            obj = new Dataset("ds_period", this);
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


            
            // UI Components Initialize
            obj = new Div("div_search", "absolute", "10", "10", null, "72", "10", null, this);
            obj.set_taborder("0");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Combo("cb_ord", "absolute", "84", "40", "88", "20", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("74");
            obj.set_innerdataset("@ds_ord");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_enable("false");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj.set_visible("false");
            obj = new Static("st_cnt", "absolute", "183", "40", "100", "20", null, null, this.div_search);
            obj.set_taborder("75");
            obj.set_text("채널");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_chan", "absolute", "232", "40", "102", "20", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("76");
            obj.set_innerdataset("@ds_chan");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_enable("false");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj.set_visible("false");
            obj = new Static("st_season", "absolute", "12", "40", "100", "20", null, null, this.div_search);
            obj.set_taborder("77");
            obj.set_text("주문구분");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_season00", "absolute", "12", "12", "100", "20", null, null, this.div_search);
            obj.set_taborder("78");
            obj.set_text("렌탈기간");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_period", "absolute", "84", "12", "88", "20", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("79");
            obj.set_innerdataset("@ds_period");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_enable("false");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new Static("st_cnt00", "absolute", "183", "12", "100", "20", null, null, this.div_search);
            obj.set_taborder("80");
            obj.set_text("본수");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_cnt", "absolute", "232", "12", "102", "20", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("81");
            obj.set_innerdataset("ds_cnt");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_enable("false");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new Static("st_season01", "absolute", "343", "12", "100", "20", null, null, this.div_search);
            obj.set_taborder("82");
            obj.set_text("계절구분");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_season", "absolute", "412", "12", "88", "20", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("83");
            obj.set_innerdataset("ds_season");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_enable("false");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new Button("btn_search", "absolute", null, "37", "45", "22", "12", null, this.div_search);
            obj.set_taborder("84");
            obj.set_text("조회");
            obj.set_cssclass("btn_WF_CRUD");
            obj.getSetter("domainId").set("nexa.add");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);

            obj = new Button("btn_close", "absolute", null, "301", "41", "21", "234", null, this);
            obj.set_taborder("1");
            obj.set_text("닫기");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);

            obj = new Grid("grid_preminum", "absolute", "10", "92", null, "199", "276", null, this);
            obj.set_taborder("2");
            obj.set_binddataset("ds_preminumMst");
            obj.set_cellsizingtype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"153\"/><Column size=\"78\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"프리미엄서비스 \"/><Cell col=\"1\" text=\"추가렌탈료\"/></Band><Band id=\"body\"><Cell celltype=\"none\" text=\"bind:psNm\" suppress=\"1\" suppressalign=\"first\"/><Cell col=\"1\" displaytype=\"number\" style=\"align:right;\" text=\"bind:servAmt\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Button("btn_choice", "absolute", null, "301", "41", "21", "279", null, this);
            obj.set_taborder("3");
            obj.set_text("선택");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);

            obj = new Grid("grid_svcDetail", "absolute", "276", "92", null, "199", "11", null, this);
            obj.set_taborder("4");
            obj.set_binddataset("ds_svcDetail");
            obj.set_cellsizingtype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"153\"/><Column size=\"78\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"상세서비스\"/><Cell col=\"1\" text=\"서비스횟수\"/></Band><Band id=\"body\"><Cell celltype=\"none\" text=\"bind:prsNm\" suppress=\"1\" suppressalign=\"first\"/><Cell col=\"1\" text=\"bind:servCnt\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 0, 72, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("0");
            		p.set_scrollbars("none");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 536, 342, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCOMMPreminumService2_pop");
            		p.set_titletext("New Form");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCOMMPreminumService2_pop.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCOMMPreminumService2_pop.xfdl", function() {
        /***************************************************************************************************
         * 파 일 명 : RTCOMMPreminumService2_pop.xfdl
         * 설    명 : 선택형 프리미엄 서비스 조회 및 선택(팝업)
         * 작 성 자 : wjim
         * 변경이력 :
         * 변경일자		변경자		변경내용
         * ----------	------		--------
         * 2018-02-20	wjim		[20180212_01] 신규 개발
         * 2018-03-01	wjim		[20180301_01] 본수 저장기준 변경
         *                          - 기존 : 기준정보상의 본수 (ZZ으로 발생할 수 있음)
         *                          - 변경 : 계약상의 본수
         ***************************************************************************************************/

        //include "lib::comLib.xjs"; 

        // 전역변수 선언
        this.fDayTp     = "";	//일자구분
        this.fApplyDate = "";	//적용일자
        this.fOrdId     = "";	//주문구분(S029)
        this.fChanCd    = "";	//채널구분(S030)
        this.fSeasonCd  = "";	//계절구분(S014)
        this.fCntCd     = "";	//본수(S022)
        this.fPeriodCd  = "";	//렌탈기간(S021)
        this.fMstRow    = -1;	//현재 선택된 프리미엄 서비스

        /**
         * 폼의 모든 컴포넌트가 생성되고, 모든 오브젝트가 로딩되었을 때 이벤트 처리
         */
        this.RTCOMMPreminumService2_pop_onload = function(obj,e) {
        	Ex.core.init(obj);
        	
        	// 부모화면에서 넘어온 파라미터를 전역변수로 세팅
        	this.fDayTp     = nvl(this.parent.dayTp);		//일자구분
        	this.fApplyDate = nvl(this.parent.applyDate);	//적용일자
        	this.fOrdId     = nvl(this.parent.ordId);		//주문구분(S029)
        	this.fChanCd    = nvl(this.parent.chanCd);		//채널구분(S030)
        	this.fSeasonCd  = nvl(this.parent.seasonCd);	//계절구분(S014)
        	this.fCntCd     = nvl(this.parent.cntCd);		//본수(S022)
        	this.fPeriodCd  = nvl(this.parent.periodCd);	//렌탈기간(S021)
        	
        	this.fn_init();	
        }

        /**
         * 초기화
         * - 콤보용 공통코드 조회
         */
        this.fn_init = function() {	
        	var sSvcID      	= "initRTCOMMPreminumService";  
        	var sController   	= "rtms/comm/initRTCOMMPreminumService.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_ord=mapDsOrd ds_chan=mapDsChan ds_season=mapDsSeason ds_period=mapDsPeriod ds_cnt=mapDsCnt";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        
        /**
         * '조회' 버튼의 클릭 이벤트 처리
         */
        this.div_search_btn_search_onclick = function(obj,e) {
        	// 기존 조회결과 DataSet 초기화
        	this.ds_preminum.deleteAll();
        	
        	// 프리미엄 서비스 마스터 조회
        	var sSvcID       = "preminumMstList";                    
        	var sController  = "rtms/comm/preminumMstList.do";
        	var sInDatasets  = "";
        	var sOutDatasets = "ds_preminumMst=preminumMstMap";
        	var sArgs 		 = "";	
        	var fn_callBack  = "fn_callBack";
        	
        	sArgs += Ex.util.setParam("dayTp"    , this.fDayTp);
        	sArgs += Ex.util.setParam("applyDate", this.fApplyDate);
        	sArgs += Ex.util.setParam("ordId"    , this.fOrdId);
        	sArgs += Ex.util.setParam("chanCd"   , this.fChanCd);
        	sArgs += Ex.util.setParam("seasonCd" , this.fSeasonCd);
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * '프리미엄서비스' 그리드 셀 클릭 이벤트 처리
         * - 상세서비스 조회
         */
        this.grid_preminum_oncellclick = function(obj,e) {
        	this.fMstRow = e.row;
        	
        	// 기존 조회결과 DataSet 초기화
        	this.ds_svcDetail.deleteAll();
        	
        	// 프리미엄 서비스 상세 조회
        	var sSvcID       = "listSvcDetail";                    
        	var sController  = "rtms/comm/listPreminumDetail.do";
        	var sInDatasets  = "";
        	var sOutDatasets = "ds_svcDetail=preminumDetailMap";
        	var sArgs 		 = "";	
        	var fn_callBack  = "fn_callBack";
        	
        	sArgs += Ex.util.setParam("psCd"    , this.ds_preminumMst.getColumn(e.row, "psCd"));
        	sArgs += Ex.util.setParam("periodCd", this.fPeriodCd);
        	sArgs += Ex.util.setParam("cntCd"   , this.fCntCd);
        		
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * '선택' 버튼의 클릭 이벤트 처리
         */
        this.btn_choice_onclick = function(obj,e) {
        	this.FN_choice();
        }

        /*
         * 프리미엄 서비스 선택 시 처리
         */
        this.FN_choice = function(){
        	this.ds_preminum.clearData();
        	var mstRow = this.ds_preminumMst.get
        	
        	for (var i = 0; i < this.ds_svcDetail.getRowCount(); i++) {
        		this.ds_preminum.addRow();
        		
        		this.ds_preminum.setColumn(i, "psCd"    , this.ds_preminumMst.getColumn(this.fMstRow, "psCd"));
        		this.ds_preminum.setColumn(i, "psNm"    , this.ds_preminumMst.getColumn(this.fMstRow, "psNm"));
        		this.ds_preminum.setColumn(i, "seq"     , this.ds_preminumMst.getColumn(this.fMstRow, "seq"));
        		this.ds_preminum.setColumn(i, "strDay"  , this.ds_preminumMst.getColumn(this.fMstRow, "strDay"));
        		this.ds_preminum.setColumn(i, "endDay"  , this.ds_preminumMst.getColumn(this.fMstRow, "endDay"));
        		this.ds_preminum.setColumn(i, "seasonCd", this.ds_preminumMst.getColumn(this.fMstRow, "seasonCd"));
        		this.ds_preminum.setColumn(i, "servPAmt", this.ds_preminumMst.getColumn(this.fMstRow, "servAmt"));
        		
        		this.ds_preminum.setColumn(i, "prsDcd"  , this.ds_svcDetail.getColumn(i, "prsDcd"));
        		this.ds_preminum.setColumn(i, "prsNm"   , this.ds_svcDetail.getColumn(i, "prsNm"));
        		//this.ds_preminum.setColumn(i, "cntCd"   , this.ds_svcDetail.getColumn(i, "cntCd"));	// [20180301_01] 이전
        		this.ds_preminum.setColumn(i, "cntCd"   , this.fCntCd);									// [20180301_01]
        		this.ds_preminum.setColumn(i, "servCnt0", this.ds_svcDetail.getColumn(i, "servCnt"));
        		this.ds_preminum.setColumn(i, "servCntr", this.ds_svcDetail.getColumn(i, "servCnt"));
        		this.ds_preminum.setColumn(i, "servAmt" , this.ds_svcDetail.getColumn(i, "servAmt"));
        		this.ds_preminum.setColumn(i, "regId"   , this.ds_svcDetail.getColumn(i, "regId"));
        		
        	}
        	
        	this.ds_preminumCp.copyData(this.ds_preminum);
        	var arr = [this.ds_preminumCp];
        	this.close(this.opener.returnPreminum(arr));
        }

        /**
         * '닫기' 버튼의 클릭 이벤트 처리
         */
        this.btn_close_onclick = function(obj,e) {
        	this.close();
        }

        /**
         * 키 입력 이벤트 처리
         * - ESC : 화면 close
         */
        this.RTCOMMPreminumService2_pop_onkeyup = function(obj,e) {
        	if (e.keycode == 27) {
        		this.close();
        	}
        }

        /**
         * CallBack 처리
         */
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg,resultCnt,checkAuthGrpuCd) {
        	if (strSvcId == "initRTCOMMPreminumService") {
        		this.div_search.cb_ord.set_value(this.fOrdId);
        		this.div_search.cb_chan.set_value(this.fChanCd);
        		this.div_search.cb_season.set_value(this.fSeasonCd);
        		this.div_search.cb_period.set_value(this.fPeriodCd);
        		this.div_search.cb_cnt.set_value(this.fCntCd);		
        	
        		// 조회
        		this.div_search_btn_search_onclick();
        	}
        	
        	if (strSvcId == "preminumMstList") {
        		var rowCt = this.ds_preminumMst.getRowCount();
        		
        		if (rowCt == 0) {
        			this.alert("선택가능한 프리미엄서비스가 없습니다.");
        			this.grid_preminum.set_nodatatext( "조회된 데이터가 없습니다." );
        		}
        	}
        	
        	if (strSvcId == "listSvcDetail") {
        		var rowCt = this.ds_svcDetail.getRowCount();
        		
        		if (rowCt == 0) {
        			this.alert("해당 프리미엄서비스에 상세서브스가 존재하지 않습니다.");
        			this.grid_svcDetail.set_nodatatext( "조회된 데이터가 없습니다." );
        		}
        	}
        }
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTCOMMPreminumService2_pop_onload, this);
            this.addEventHandler("onkeyup", this.RTCOMMPreminumService2_pop_onkeyup, this);
            this.div_search.btn_search.addEventHandler("onclick", this.div_search_btn_search_onclick, this);
            this.btn_close.addEventHandler("onclick", this.btn_close_onclick, this);
            this.grid_preminum.addEventHandler("oncellclick", this.grid_preminum_oncellclick, this);
            this.btn_choice.addEventHandler("onclick", this.btn_choice_onclick, this);

        };

        this.loadIncludeScript("RTCOMMPreminumService2_pop.xfdl");

       
    };
}
)();
