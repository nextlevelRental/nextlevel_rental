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
                this.set_name("RTRESaleChargeInsentive");
                this.set_classname("test");
                this.set_titletext("판매장려인센티브집계");
                this._setFormPosition(0,0,1147,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_actionMsg", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"msg\" type=\"STRING\" size=\"256\"/><Column id=\"status\" type=\"STRING\" size=\"256\"/><Column id=\"fontColor\" type=\"STRING\" size=\"256\"/><Column id=\"bgColor\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cd\">N001</Col><Col id=\"fontColor\">black</Col><Col id=\"status\"/><Col id=\"msg\"/><Col id=\"bgColor\"/></Row><Row><Col id=\"cd\">C001</Col><Col id=\"msg\">집계년월이 변경되었습니다.</Col><Col id=\"fontColor\">mediumpurple</Col><Col id=\"status\">Change</Col><Col id=\"bgColor\"/></Row><Row><Col id=\"cd\">B001</Col><Col id=\"fontColor\">darkturquoise</Col><Col id=\"msg\">인센티브 기초집계를 수행합니다.</Col><Col id=\"status\">Execution</Col><Col id=\"bgColor\"/></Row><Row><Col id=\"cd\">B002</Col><Col id=\"fontColor\">darkturquoise</Col><Col id=\"msg\">인센티브 / 장려금 판매집계를 수행합니다.</Col><Col id=\"status\">Execution</Col><Col id=\"bgColor\"/></Row><Row><Col id=\"cd\">R001</Col><Col id=\"status\">Success</Col><Col id=\"fontColor\">royalblue</Col><Col id=\"bgColor\"/><Col id=\"msg\">성공</Col></Row><Row><Col id=\"cd\">R002</Col><Col id=\"status\">Fail</Col><Col id=\"fontColor\">tomato</Col><Col id=\"bgColor\"/><Col id=\"msg\">실패</Col></Row><Row><Col id=\"cd\">R003</Col><Col id=\"msg\">최종 인센티브 기초집계 내역이 조회되었습니다.</Col><Col id=\"fontColor\">mediumseagreen</Col><Col id=\"bgColor\"/><Col id=\"status\">Search</Col></Row><Row><Col id=\"cd\">R004</Col><Col id=\"msg\">최종 인센티브 / 장려금 판매집계 내역이 조회되었습니다.</Col><Col id=\"fontColor\">mediumseagreen</Col><Col id=\"bgColor\"/><Col id=\"status\">Search</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_incBasAggrList", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"commTpNm\" type=\"STRING\" size=\"256\"/><Column id=\"userNm\" type=\"STRING\" size=\"256\"/><Column id=\"execTm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_incSbsSlsAggrList", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"slcmYm\" type=\"STRING\" size=\"256\"/><Column id=\"agencyCd\" type=\"STRING\" size=\"256\"/><Column id=\"agencyNm\" type=\"STRING\" size=\"256\"/><Column id=\"userGrpCd\" type=\"STRING\" size=\"256\"/><Column id=\"userGrpNm\" type=\"STRING\" size=\"256\"/><Column id=\"agncIncn\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"aflVslsIncn\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"rdnIncn\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"agncSbs\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"aflVslsSbs\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"rdnSbs\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"userNm\" type=\"STRING\" size=\"256\"/><Column id=\"execTm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_grpList", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"userGrpCd\" type=\"STRING\" size=\"256\"/><Column id=\"userGrpNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("st_procStatusMsg1", "absolute", "158", "198", null, "31", "25", null, this);
            obj.set_taborder("15");
            obj.set_cssclass("sta_WF_detailLabel2");
            obj.style.set_padding("0 0 0 10");
            this.addChild(obj.name, obj);

            obj = new Static("st_procStatus1", "absolute", "79", "198", "80", "31", null, null, this);
            obj.set_taborder("17");
            obj.set_cssclass("sta_WF_detailLabel2");
            obj.style.set_background("white");
            obj.style.set_border("1 solid #c9c6c3ff");
            obj.style.set_align("center middle");
            obj.style.set_font("bold 9 Dotum");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1122", "0", "25", "496", null, null, this);
            obj.set_taborder("25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "0", "0", null, "45", "25", null, this);
            obj.set_taborder("27");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_referYM", "absolute", "20", "8", "78", "30", null, null, this.div_search);
            obj.set_taborder("79");
            obj.set_text("집계년월");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_aggregateYm", "absolute", "98", "12", "80", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("80");
            obj.set_dateformat("yyyy-MM");
            obj.set_editformat("yyyy-MM");
            obj.set_value("null");
            obj.set_autoskip("true");
            obj.set_autoselect("true");
            obj.style.set_usetrailingday("true");
            obj = new Static("Static22", "absolute", "1", "0", null, "12", "0", null, this.div_search);
            obj.set_taborder("81");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "0", "0", "20", "45", null, null, this.div_search);
            obj.set_taborder("82");
            obj.set_text("FIX \r\nw20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static23", "absolute", "1", "33", null, "12", "0", null, this.div_search);
            obj.set_taborder("83");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "0", "45", null, "20", "25", null, this);
            obj.set_taborder("28");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("st_incBasAggr", "absolute", "0", "65", "180", "20", null, null, this);
            obj.set_taborder("29");
            obj.set_text("인센티브 기초집계");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "85", null, "10", "25", null, this);
            obj.set_taborder("30");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Button("btn_aggregateIncentive", "absolute", null, "64", "45", "22", "25", null, this);
            obj.set_taborder("31");
            obj.set_text("집계");
            obj.set_cssclass("btn_WF_CRUD");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "0", "229", null, "20", "25", null, this);
            obj.set_taborder("32");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("st_incSbsSlsAggr", "absolute", "0", "249", "180", "20", null, null, this);
            obj.set_taborder("33");
            obj.set_text("인센티브 / 장려금 판매집계");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static08", "absolute", "0", "269", null, "10", "25", null, this);
            obj.set_taborder("34");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("st_procStatusMsg2", "absolute", "158", "454", null, "31", "25", null, this);
            obj.set_taborder("80");
            obj.set_cssclass("sta_WF_detailLabel2");
            obj.style.set_padding("0 0 0 10");
            this.addChild(obj.name, obj);

            obj = new Button("btn_aggregateSbs", "absolute", null, "247", "45", "22", "25", null, this);
            obj.set_taborder("82");
            obj.set_text("집계");
            obj.set_cssclass("btn_WF_CRUD");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_incBasAggrList", "absolute", "0", "95", null, "99", "25", null, this);
            obj.set_taborder("83");
            obj.set_binddataset("ds_incBasAggrList");
            obj.set_autofittype("col");
            obj.set_selecttype("cell");
            obj.set_readonly("true");
            obj.set_enableevent("false");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"100\"/><Column size=\"150\"/><Column size=\"250\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell celltype=\"head\" text=\"집계구분\"/><Cell col=\"1\" text=\"수행자\"/><Cell col=\"2\" text=\"최종수행시각\"/></Band><Band id=\"body\"><Cell style=\"align:center middle;background2:transparent;\" text=\"bind:commTpNm\"/><Cell col=\"1\" style=\"align:center middle;background2:transparent;\" text=\"bind:userNm\"/><Cell col=\"2\" style=\"align:center middle;background2:transparent;\" text=\"bind:execTm\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_incSbsSlsAggrList", "absolute", "0", "279", null, "171", "25", null, this);
            obj.set_taborder("84");
            obj.set_binddataset("ds_incSbsSlsAggrList");
            obj.set_autofittype("col");
            obj.set_selecttype("cell");
            obj.set_enableevent("false");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"80\"/><Column size=\"120\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"120\"/><Column size=\"150\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell rowspan=\"2\" text=\"집계년월\"/><Cell col=\"1\" colspan=\"2\" text=\"판매인\"/><Cell col=\"3\" rowspan=\"2\" text=\"판매인구분\"/><Cell col=\"4\" colspan=\"3\" text=\"인센티브\"/><Cell col=\"7\" colspan=\"3\" text=\"장려금\"/><Cell col=\"10\" rowspan=\"2\" text=\"수행자\"/><Cell col=\"11\" rowspan=\"2\" text=\"최종수행시각\"/><Cell row=\"1\" col=\"1\" text=\"코드\"/><Cell row=\"1\" col=\"2\" text=\"코드명\"/><Cell row=\"1\" col=\"4\" text=\"대리점\"/><Cell row=\"1\" col=\"5\" text=\"방문판매\"/><Cell row=\"1\" col=\"6\" text=\"로디안\"/><Cell row=\"1\" col=\"7\" text=\"대리점\"/><Cell row=\"1\" col=\"8\" text=\"방문판매\"/><Cell row=\"1\" col=\"9\" text=\"로디안\"/></Band><Band id=\"body\"><Cell style=\"align:center middle;\" text=\"bind:slcmYm\"/><Cell col=\"1\" style=\"align:center middle;\" text=\"bind:agencyCd\"/><Cell col=\"2\" style=\"align:left middle;\" text=\"bind:agencyNm\" tooltiptext=\"bind:agencyNm\"/><Cell col=\"3\" style=\"align:center middle;\" text=\"bind:userGrpNm\"/><Cell col=\"4\" style=\"align:right middle;\" text=\"bind:agncIncn\"/><Cell col=\"5\" style=\"align:right middle;\" text=\"bind:aflVslsIncn\"/><Cell col=\"6\" style=\"align:right middle;\" text=\"bind:rdnIncn\"/><Cell col=\"7\" style=\"align:right middle;\" text=\"bind:agncSbs\"/><Cell col=\"8\" style=\"align:right middle;\" text=\"bind:aflVslsSbs\"/><Cell col=\"9\" style=\"align:right middle;\" text=\"bind:rdnSbs\"/><Cell col=\"10\" text=\"bind:userNm\" tooltiptext=\"bind:userNm\"/><Cell col=\"11\" text=\"bind:execTm\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("st_procStatus2", "absolute", "79", "454", "80", "31", null, null, this);
            obj.set_taborder("86");
            obj.set_cssclass("sta_WF_detailLabel2");
            obj.style.set_background("white");
            obj.style.set_align("center middle");
            obj.style.set_font("bold 9 Dotum");
            this.addChild(obj.name, obj);

            obj = new Static("st_procStatusTh1", "absolute", "0", "198", "80", "31", null, null, this);
            obj.set_taborder("87");
            obj.set_cssclass("sta_WF_detailLabel2");
            obj.style.set_background("azure");
            obj.style.set_align("center middle");
            obj.style.set_font("bold 9 Dotum");
            obj.set_text("작업상태");
            this.addChild(obj.name, obj);

            obj = new Static("st_procStatusTh2", "absolute", "0", "454", "80", "31", null, null, this);
            obj.set_taborder("88");
            obj.set_cssclass("sta_WF_detailLabel2");
            obj.style.set_background("azure");
            obj.style.set_align("center middle");
            obj.style.set_font("bold 9 Dotum");
            obj.set_text("작업상태");
            this.addChild(obj.name, obj);

            obj = new Combo("cbo_grpList", "absolute", null, "249", "100", "21", "135", null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("89");
            obj.set_innerdataset("@ds_grpList");
            obj.set_codecolumn("userGrpCd");
            obj.set_datacolumn("userGrpNm");
            obj.set_displaynulltext("전체");

            obj = new Button("btn_excel", "absolute", null, "247", "45", "22", "80", null, this);
            obj.set_taborder("90");
            obj.set_text("엑셀");
            obj.set_cssclass("btn_WF_CRUD");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 0, 45, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("27");
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
            		p.set_classname("test");
            		p.set_titletext("판매장려인센티브집계");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTRESalesChargeInsentive.xfdl", "lib::comLib.xjs");
        this.registerScript("RTRESalesChargeInsentive.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분	: 수금관리 > 수수료 > 판매장려 인센티브 집계
         * 02. 그룹명		: RTRESaleChargeInsentive.xfdl
         * 03. 그룹설명	: 
         * 04. 작성일		: 2019-01-18
         * 05. 작성자		: 노창호
         * 06. 수정이력	: 
         ***********************************************************************
         *		수정일			작성자		내용
         ***********************************************************************
         *		2019-01-18		노창호		최초작성
         ***********************************************************************/

        /***********************************************************************
         * Script Include
         ***********************************************************************/
        //include "lib::comLib.xjs";

        /***********************************************************************
         * FORM 변수 선언 영역
         ***********************************************************************/
        this.aggregateYm;		/* 집계년월					*/
        this.toDay	  = "";		/* 서버기준 오늘날짜			*/
        this.msgFix	  = "N";	/* Msg 고정유무				*/
        this.aggrStat = "EACH";	/* 집계 상태(전체 / 개별)		*/
        this.succYn	  = "SUCC";	/* 집계성공여부(Succ/Fail)	*/

        /***********************************************************************
         * 그룹 변수 선언부
         ***********************************************************************/

        /***********************************************************************************
         * Form Load Common Function
         ***********************************************************************************/
        this.form_onload = function(obj,e) {
        	/* 폼 로드 공통함수 */
        	Ex.core.init(obj);
        	
        	/* 공통버튼 Set(AG : 집계 */
        	this.parent.setButton("AG", this);
        	
        	/* 화면 초기화 */
        	this.fn_init();
        }

        this.fn_init = function() {
        	/* 집계년월 세팅 */
        	this.fn_setAggregateYm();
        }

        /***********************************************************************************
         * Transaction Function
         ***********************************************************************************/
        /**
         * 집계년월 세팅
         */
        this.fn_setAggregateYm = function() {
        	var sSvcID		 = "setAggregateYm";
        	var sController	 = "/rtms/comm/getToday.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "";
        	var sArgs		 = "";
        	var fn_callBack	 = "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 인센티브 기초집계 조회
         */
        this.fn_retrieveIncBasAggrList = function() {
        	/* 필수값 검증 - 집계년월 */
        	if(Eco.isEmpty(this.div_search.cal_aggregateYm.value)) {
        		this.alert("집계년월을 입력하세요");
        		
        		this.div_search.cal_aggregateYm.setFocus();
        		return;
        	}
        	
        	this.ds_incBasAggrList.clearData();
        	
        	var slcmYm = this.aggregateYm;
        	var aggGrp = application.gds_userInfo.getColumn(0, "userGrp");
        	
        	var sSvcID		 = "retrieveIncBasAggrList";
        	var sController	 = "retrieveIncBasAggrList.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "ds_incBasAggrList=dsIncBasAggrList";
        	var sArgs		 = "";
        		sArgs		+= Ex.util.setParam("slcmYm", nvl(slcmYm)); /* 집계년월	*/
        		sArgs		+= Ex.util.setParam("aggGrp", nvl(aggGrp)); /* 사용자구분	*/
        	var fn_callBack	 = "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 인센티브 / 장려금 판매집계 조회
         */
        this.fn_retrieveIncSbsSlsAggrList = function() {
        	/* 필수값 검증 - 집계년월 */
        	if(Eco.isEmpty(this.div_search.cal_aggregateYm.value)) {
        		this.alert("집계년월을 입력하세요");
        		
        		this.div_search.cal_aggregateYm.setFocus();
        		return;
        	}
        	
        	this.ds_incSbsSlsAggrList.filter("");
        	this.ds_incSbsSlsAggrList.clearData();
        	
        	var sSvcID		 = "retrieveIncSbsSlsAggrList";
        	var sController	 = "retrieveIncSbsSlsAggrList.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "ds_incSbsSlsAggrList=dsIncSbsSlsAggrList";
        	var sArgs		 = "";
        		sArgs		+= Ex.util.setParam("slcmYm", nvl(this.aggregateYm)); /* 집계년월 */
        	var fn_callBack	 = "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 인센티브 기초집계
         */
        this.fn_aggregateIncentive = function() {
        	this.ds_incBasAggrList.clearData();
        	
        	var sSvcID		 = "aggregateIncentive";
        	var sController	 = "aggregateIncentive.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "";
        	var sArgs		 = "";
        		sArgs		+= Ex.util.setParam("slcmYm", nvl(this.aggregateYm)); /* 집계년월 */
        	var fn_callBack	 = "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 인센티브 / 장려금 판매집계
         */
        this.fn_aggregateSbs = function() {
        	this.ds_incSbsSlsAggrList.clearData();
        	
        	var sSvcID		 = "aggregateSbs";
        	var sController	 = "aggregateSbs.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "";
        	var sArgs		 = "";
        		sArgs		+= Ex.util.setParam("slcmYm", nvl(this.aggregateYm)); /* 집계년월 */
        	var fn_callBack	 = "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * check grid data
         */
        this.fn_checkGridNoData = function(grid)  {
        	if (Eco.isXComponent(grid)) {
        		try {
        			if (grid.getBindDataset().getRowCount() == 0) {
        				grid.set_nodatatext("조회된 결과가 없습니다.");
        			}
        		}
        		catch(e) {
        		}
        	}
        }

        /***********************************************************************************
         * CallBack Event(strSvcId - Sevice ID, nErrorCode - ErrorCode, strErrorMsg - Error Message)
         ***********************************************************************************/
        this.fn_callBack = function(strSvcId,nErrorCode,strErrorMsg) {
        	var errCode = "";
        	
        	if(nErrorCode < 0) {
        		errCode = "R002";
        	} else {
        		errCode = "R001";
        	}
        	
        	switch(strSvcId.toUpperCase()) {
        		/* 집계년월 세팅 */
        		case "setAggregateYm".toUpperCase():
        			this.aggregateYm = this.toDay.substr(0, 4) + (this.toDay.substr(4, 2));
        			
        			this.div_search.cal_aggregateYm.set_value(this.aggregateYm);
        			
        			/* 인센티브 기초집계 조회 */
        			this.fn_retrieveIncBasAggrList();
        			
        			/* 인센티브 / 장려금 판매집계 조회 */
        			this.fn_retrieveIncSbsSlsAggrList();
        			
        			break;
        		
        		/* 인센티브 기초집계 조회 */
        		case "retrieveIncBasAggrList".toUpperCase():
        			var userNm = "";
        			var ds	   = this.ds_incBasAggrList;
        			var nRow   = ds.findRowExpr("!Eco.isEmpty(userNm)");
        			
        			if(this.msgFix == "N") {
        				this.fn_setProcStatus("incentive", "R003", "");
        			} else {
        				this.msgFix = "N"
        			}
        			
        			if(nRow > -1) {
        				userNm = ds.getColumn(nRow, "userNm");
        			} else {
        				var userId = application.gds_userInfo.getColumn(0, "userId");
        				var chgNm  = application.gds_userInfo.getColumn(0, "chgNm");
        				
        				if(Eco.isEmpty(chgNm)) {
        					userNm = userId;
        				} else {
        					userNm = userId + " / " + chgNm;
        				}
        			}
        			
        			var isExist = false;
        			for(var i = 0; i < ds.rowcount; i++) {
        				if (!Eco.isEmpty(Ex.util.getData(ds, i, "userNm"))) {
        					isExist = true;
        					break;
        				}
        			}
        			
        			if (isExist) {
        				for(var i = 0; i < ds.rowcount; i++) {
        					ds.setColumn(i, "userNm", userNm);
        				}
        			}
        			else {
        				ds.clearData();
        			}
        			
        			this.fn_checkGridNoData(this.grd_incBasAggrList)
        			
        			if(this.aggrStat == "ALL" && this.succYn == "SUCC") {
        				this.fn_setProcStatus("sbs", "B002", "");
        				
        				this.fn_aggregateSbs();
        			}
        			break;
        		
        		/* 인센티브 / 장려금 판매집계 조회 */
        		case "retrieveIncSbsSlsAggrList".toUpperCase():
        			/*
        			if(this.ds_incSbsSlsAggrList.getRowCount() == 0) {
        				this.grd_incSbsSlsAggrList.set_nodatatext("조회된 결과가 없습니다.");
        			}
        			*/
        			this.fn_checkGridNoData(this.grd_incSbsSlsAggrList);
        			
        			if(this.msgFix == "N") {
        				this.fn_setProcStatus("sbs", "R004", "");
        			} else {
        				this.msgFix = "N"
        			}
        			
        			this.aggrStat = "EACH";
        			
        			/* Grp List Combo Set */
        			this.fn_grpListComboSet();
        			
        			break;
        		
        		/* 인센티브 기초집계 */
        		case "aggregateIncentive".toUpperCase():
        			this.fn_setProcStatus("incentive", errCode, strErrorMsg);
        			
        			/* Msg 고정 */
        			this.msgFix = "Y";
        			this.succYn = "SUCC";
        			
        			if(errCode < 0) {
        				this.succYn = "FAIL";
        			}
        			
        			/* 인센티브 기초집계 조회 */
        			this.fn_retrieveIncBasAggrList();
        			break;
        		
        		/* 인센티브 / 장려금 판매집계 */
        		case "aggregateSbs".toUpperCase():
        			this.fn_setProcStatus("sbs", errCode, strErrorMsg);
        			
        			/* Msg 고정 */
        			this.msgFix = "Y";
        			
        			/* 인센티브 / 장려금 판매집계 조회 */
        			this.fn_retrieveIncSbsSlsAggrList();
        			break;
        		
        		default:
        			break;
        	}
        }

        /***********************************************************************************
         * User Function
         ***********************************************************************************/
        /**
         * 작업상태창 Msg 표시
         */
        this.fn_setProcStatus = function(place,cd,errMsg) {
        	var ds		= this.ds_actionMsg;
        	var findRow	= ds.findRow("cd", cd);
        	
        	if(place == "incentive") {
        		this.st_procStatus1.set_text(ds.getColumn(findRow, "status"));
        		this.st_procStatus1.style.set_color(ds.getColumn(findRow, "fontColor"));
        		
        		if(Eco.isEmpty(errMsg)) {
        			this.st_procStatusMsg1.set_text(ds.getColumn(findRow, "msg"));
        		} else {
        			this.st_procStatusMsg1.set_text(errMsg);
        		}
        	} else if(place == "sbs") {
        		this.st_procStatus2.set_text(ds.getColumn(findRow, "status"));
        		this.st_procStatus2.style.set_color(ds.getColumn(findRow, "fontColor"));
        		
        		if(Eco.isEmpty(errMsg)) {
        			this.st_procStatusMsg2.set_text(ds.getColumn(findRow, "msg"));
        		} else {
        			this.st_procStatusMsg2.set_text(errMsg);
        		}
        	}
        }

        /* Grp List Combo Set */
        this.fn_grpListComboSet = function() {
        	var dsGrp	= this.ds_grpList;
        	var dsSbs	= this.ds_incSbsSlsAggrList;
        	var nGrpRow	= 0;
        	
        	this.cbo_grpList.set_enableevent(false);
        	this.cbo_grpList.set_value("");
        	this.cbo_grpList.set_enableevent(true);
        	
        	dsGrp.clearData();
        	
        	nGrpRow = dsGrp.addRow();
        	dsGrp.setColumn(nGrpRow, "userGrpCd", "");
        	dsGrp.setColumn(nGrpRow, "userGrpNm", "전체");
        	
        	for(var i = 0; i < dsSbs.rowcount; i++) {
        		if(dsSbs.getColumn(i, "userGrpCd") != "ZZ") {
        			if(dsGrp.findRow("userGrpCd", dsSbs.getColumn(i, "userGrpCd")) < 0) {
        				nGrpRow = dsGrp.addRow();
        				dsGrp.setColumn(nGrpRow, "userGrpCd", dsSbs.getColumn(i, "userGrpCd"));
        				dsGrp.setColumn(nGrpRow, "userGrpNm", dsSbs.getColumn(i, "userGrpNm"));
        			}
        		}
        	}
        	
        	/* Dataset 중복제거 */
        	var regExpr = "rowidx==dataset.findRowExpr(\"" + "" + "userGrpCd" + "=='\" + " + "userGrpCd" + " + \"'" + "\")";
        	
        	dsGrp.filter(regExpr);
        }

        /***********************************************************************************
         * Component Event & Function
         ***********************************************************************************/
        /**
         * 집계(전체집계)
         */
        this.fn_aggregate = function() {
        	this.aggrStat = "ALL";
        	
        	this.fn_setProcStatus("incentive", "B001", "");
        	
        	this.fn_aggregateIncentive();
        }

        /**
         * 인센티브 / 장려금 판매집계 엑셀다운로드
         */
        this.btn_excel_onclick = function(obj,e) {
        	if(this.ds_incSbsSlsAggrList.getRowCount() > 0) {
        		Ex.core.exportExcel(this, this.grd_incSbsSlsAggrList, this.aggregateYm + "_IncentiveSalesAgg");
        	} else {
        		this.alert("다운로드할 조회결과가 없습니다");
        	}
        }

        /**
         * 집계년월 Onchanged Event
         */
        this.div_search_cal_aggregateYm_onchanged = function(obj,e) {
        	this.fn_setProcStatus("incentive", "C001", "");
        	this.fn_setProcStatus("sbs",	   "C001", "");
        	
        	this.aggregateYm = e.postvalue.toString().substr(0, 6);
        	
        	/* 인센티브 기초집계 조회 */
        	this.fn_retrieveIncBasAggrList();
        	
        	/* 인센티브 / 장려금 판매집계 조회 */
        	this.fn_retrieveIncSbsSlsAggrList();
        }

        /**
         * 인센티브 기초집계 Onclick Event
         */
        this.btn_aggregateIncentive_onclick = function(obj,e) {
        	this.aggrStat = "EACH";
        	
        	this.fn_setProcStatus("incentive", "B001", "");
        	
        	this.fn_aggregateIncentive();
        }

        /**
         * 인센티브 / 장려금 판매집계 Onclick Event
         */
        this.btn_aggregateSbs_onclick = function(obj,e) {
        	this.fn_setProcStatus("sbs", "B002", "");
        	
        	this.fn_aggregateSbs();
        }

        /**
         * Grp List Onitemchanged Event
         */
        this.cbo_grpList_onitemchanged = function(obj,e) {
        	if(e.postvalue == "") {
        		this.ds_incSbsSlsAggrList.filter("");
        	} else {
        		this.ds_incSbsSlsAggrList.filter("userGrpCd == '" + e.postvalue + "'");
        	}
        }
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.div_search.cal_aggregateYm.addEventHandler("onchanged", this.div_search_cal_aggregateYm_onchanged, this);
            this.btn_aggregateIncentive.addEventHandler("onclick", this.btn_aggregateIncentive_onclick, this);
            this.btn_aggregateSbs.addEventHandler("onclick", this.btn_aggregateSbs_onclick, this);
            this.grd_incBasAggrList.addEventHandler("onheadclick", this.grd_incBasAggrList_onheadclick, this);
            this.cbo_grpList.addEventHandler("onitemchanged", this.cbo_grpList_onitemchanged, this);
            this.btn_excel.addEventHandler("onclick", this.btn_excel_onclick, this);

        };

        this.loadIncludeScript("RTRESalesChargeInsentive.xfdl");

       
    };
}
)();
