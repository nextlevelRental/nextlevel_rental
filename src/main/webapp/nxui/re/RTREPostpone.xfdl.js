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
                this.set_name("RTREPostpone");
                this.set_classname("RTREDeferSelect");
                this.set_titletext("이연처리 내역 조회");
                this._setFormPosition(0,0,1147,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_postpone", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"postpYm\" type=\"STRING\" size=\"256\"/><Column id=\"postpTp\" type=\"STRING\" size=\"256\"/><Column id=\"postpTpNm\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"custTp\" type=\"STRING\" size=\"256\"/><Column id=\"custTpNm\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"ordQty\" type=\"STRING\" size=\"256\"/><Column id=\"agencyCd\" type=\"STRING\" size=\"256\"/><Column id=\"AgencyNm\" type=\"STRING\" size=\"256\"/><Column id=\"ordAgent\" type=\"STRING\" size=\"256\"/><Column id=\"ordAgnm\" type=\"STRING\" size=\"256\"/><Column id=\"postpStat\" type=\"STRING\" size=\"256\"/><Column id=\"postpStatNm\" type=\"STRING\" size=\"256\"/><Column id=\"postpTerm\" type=\"STRING\" size=\"256\"/><Column id=\"acqAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"lyTppAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"cyPpAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"cyTppAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"cmPpAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"cmRamt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"totalCnt\" type=\"STRING\" size=\"256\"/><Column id=\"rowNum\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_postponeExcel", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"postpYm\" type=\"STRING\" size=\"256\"/><Column id=\"postpTp\" type=\"STRING\" size=\"256\"/><Column id=\"postpTpNm\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"custTp\" type=\"STRING\" size=\"256\"/><Column id=\"custTpNm\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"ordQty\" type=\"STRING\" size=\"256\"/><Column id=\"agencyCd\" type=\"STRING\" size=\"256\"/><Column id=\"AgencyNm\" type=\"STRING\" size=\"256\"/><Column id=\"ordAgent\" type=\"STRING\" size=\"256\"/><Column id=\"ordAgnm\" type=\"STRING\" size=\"256\"/><Column id=\"postpStat\" type=\"STRING\" size=\"256\"/><Column id=\"postpStatNm\" type=\"STRING\" size=\"256\"/><Column id=\"postpTerm\" type=\"STRING\" size=\"256\"/><Column id=\"acqAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"lyTppAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"cyPpAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"cyTppAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"cmPpAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"cmRamt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"totalCnt\" type=\"STRING\" size=\"256\"/><Column id=\"rowNum\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_postpTp", this);
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

            obj = new Dataset("ds_postpStat", this);
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
            obj = new Static("Static01", "absolute", "1122", "0", "25", "496", null, null, this);
            obj.set_taborder("5");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "0", "0", null, "45", "25", null, this);
            obj.set_taborder("6");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_postpTp", "absolute", "567", "10", "80", "21", null, null, this.div_search);
            obj.set_taborder("79");
            obj.set_text("이연항목");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_postpTp", "absolute", "647", "10", "140", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("80");
            obj.set_displaynulltext("전체");
            obj.set_innerdataset("ds_postpTp");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new Edit("ed_ordNo", "absolute", "399", "10", "148", "21", null, null, this.div_search);
            obj.set_taborder("82");
            obj.set_maxlength("80");
            obj.set_enable("true");
            obj.set_visible("true");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_postpStat", "absolute", "807", "10", "80", "21", null, null, this.div_search);
            obj.set_taborder("86");
            obj.set_text("이연상태");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_ordNo", "absolute", "293", "10", "80", "21", null, null, this.div_search);
            obj.set_taborder("87");
            obj.set_text("계약번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_postpYm", "absolute", "20", "10", "80", "21", null, null, this.div_search);
            obj.set_taborder("88");
            obj.set_text("기준년월");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_postpStat", "absolute", "887", "10", "140", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("90");
            obj.set_displaynulltext("전체");
            obj.set_innerdataset("ds_postpStat");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new Static("Static07", "absolute", "0", "0", "1118", "10", null, null, this.div_search);
            obj.set_taborder("91");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "0", "31", "1118", "10", null, null, this.div_search);
            obj.set_taborder("92");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "0", "0", "20", "41", null, null, this.div_search);
            obj.set_taborder("93");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "105", "0", "20", "41", null, null, this.div_search);
            obj.set_taborder("94");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "273", "0", "20", "41", null, null, this.div_search);
            obj.set_taborder("95");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "379", "0", "20", "41", null, null, this.div_search);
            obj.set_taborder("96");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static05", "absolute", "547", "0", "20", "41", null, null, this.div_search);
            obj.set_taborder("98");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("bt_searchOrdNo", "absolute", "527", "9", "20", "21", null, null, this.div_search);
            obj.set_taborder("103");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("edtYear", "absolute", "124", "10", "60", "21", null, null, this.div_search);
            obj.set_taborder("104");
            obj.set_inputtype("digit");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("4");
            obj.set_autoskip("true");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition06", "absolute", "188", "10", "20", "20", null, null, this.div_search);
            obj.set_taborder("105");
            obj.set_text("년");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("edtMonth", "absolute", "214", "10", "40", "21", null, null, this.div_search);
            obj.set_taborder("106");
            obj.set_inputtype("digit");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("2");
            obj.set_autoskip("true");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition07", "absolute", "258", "10", "20", "20", null, null, this.div_search);
            obj.set_taborder("107");
            obj.set_text("월");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "787", "0", "20", "41", null, null, this.div_search);
            obj.set_taborder("108");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "0", "55", "100", "21", null, null, this);
            obj.set_taborder("7");
            obj.set_text("검색결과");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Grid("grid_postpone", "absolute", "0", "81", "1122", "376", null, null, this);
            obj.set_taborder("8");
            obj.set_binddataset("ds_postpone");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"40\"/><Column size=\"80\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"120\"/><Column size=\"160\"/><Column size=\"80\"/><Column size=\"60\"/><Column size=\"120\"/><Column size=\"80\"/><Column size=\"120\"/><Column size=\"60\"/><Column size=\"60\"/><Column size=\"90\"/><Column size=\"90\"/><Column size=\"90\"/><Column size=\"90\"/><Column size=\"90\"/><Column size=\"90\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"No\"/><Cell col=\"1\" text=\"대상년월\"/><Cell col=\"2\" text=\"이연항목\"/><Cell col=\"3\" text=\"고객번호\"/><Cell col=\"4\" text=\"고객명\"/><Cell col=\"5\" text=\"고객구분\"/><Cell col=\"6\" text=\"계약번호\"/><Cell col=\"7\" text=\"상품명\"/><Cell col=\"8\" text=\"장착일자\"/><Cell col=\"9\" text=\"장착대수\"/><Cell col=\"10\" text=\"장착점\"/><Cell col=\"11\" text=\"판매원코드\"/><Cell col=\"12\" text=\"판매원명\"/><Cell col=\"13\" text=\"이연상태\"/><Cell col=\"14\" text=\"이연기간\"/><Cell col=\"15\" text=\"이연대상금액\"/><Cell col=\"16\" text=\"전기말 누계액\"/><Cell col=\"17\" text=\"당기 처리액\"/><Cell col=\"18\" text=\"당기 총누계액\"/><Cell col=\"19\" text=\"당월 처리액\"/><Cell col=\"20\" text=\"당월 잔존가액\"/></Band><Band id=\"body\"><Cell text=\"bind:rowNum\"/><Cell col=\"1\" text=\"bind:postpYm\"/><Cell col=\"2\" style=\"align:left;\" text=\"bind:postpTpNm\"/><Cell col=\"3\" text=\"bind:custNo\"/><Cell col=\"4\" text=\"bind:custNm\"/><Cell col=\"5\" text=\"bind:custTpNm\"/><Cell col=\"6\" displaytype=\"text\" edittype=\"readonly\" text=\"bind:ordNo\"/><Cell col=\"7\" style=\"align:left;\" text=\"bind:matNm\"/><Cell col=\"8\" text=\"bind:procDay\"/><Cell col=\"9\" text=\"bind:ordQty\"/><Cell col=\"10\" text=\"bind:AgencyNm\"/><Cell col=\"11\" text=\"bind:ordAgent\"/><Cell col=\"12\" text=\"bind:ordAgnm\"/><Cell col=\"13\" text=\"bind:postpStatNm\"/><Cell col=\"14\" text=\"bind:postpTerm\"/><Cell col=\"15\" displaytype=\"number\" style=\"align:right;\" text=\"bind:acqAmt\" mask=\"###,###,###,##0\"/><Cell col=\"16\" displaytype=\"number\" style=\"align:right;\" text=\"bind:lyTppAmt\" mask=\"###,###,###,##0\"/><Cell col=\"17\" displaytype=\"number\" style=\"align:right;\" text=\"bind:cyPpAmt\" mask=\"###,###,###,##0\"/><Cell col=\"18\" displaytype=\"number\" style=\"align:right;\" text=\"bind:cyTppAmt\" mask=\"###,###,###,##0\"/><Cell col=\"19\" displaytype=\"number\" style=\"align:right;\" text=\"bind:cmPpAmt\" mask=\"###,###,###,##0\"/><Cell col=\"20\" displaytype=\"number\" style=\"align:right;\" text=\"bind:cmRamt\" mask=\"###,###,###,##0\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static10", "absolute", "0", "45", "1147", "15", null, null, this);
            obj.set_taborder("9");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_border("0 none #808080,1 solid #d2020bff");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "71", "1147", "10", null, null, this);
            obj.set_taborder("10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_border("0 none #808080,1 solid #d2020bff");
            this.addChild(obj.name, obj);

            obj = new Div("div_paging", "absolute", "261", "468", "600", "22", null, null, this);
            obj.set_taborder("19");
            obj.set_text("Div00");
            obj.set_url("comm::Paging.xfdl");
            this.addChild(obj.name, obj);

            obj = new Grid("grid_postponeExcel", "absolute", "0", "113", "1122", "55", null, null, this);
            obj.set_taborder("20");
            obj.set_binddataset("ds_postponeExcel");
            obj.set_visible("false");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"40\"/><Column size=\"80\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"120\"/><Column size=\"160\"/><Column size=\"80\"/><Column size=\"60\"/><Column size=\"120\"/><Column size=\"80\"/><Column size=\"120\"/><Column size=\"60\"/><Column size=\"60\"/><Column size=\"90\"/><Column size=\"90\"/><Column size=\"90\"/><Column size=\"90\"/><Column size=\"90\"/><Column size=\"90\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"No\"/><Cell col=\"1\" text=\"대상년월\"/><Cell col=\"2\" text=\"이연항목\"/><Cell col=\"3\" text=\"고객번호\"/><Cell col=\"4\" text=\"고객명\"/><Cell col=\"5\" text=\"고객구분\"/><Cell col=\"6\" text=\"계약번호\"/><Cell col=\"7\" text=\"상품명\"/><Cell col=\"8\" text=\"장착일자\"/><Cell col=\"9\" text=\"장착대수\"/><Cell col=\"10\" text=\"장착점\"/><Cell col=\"11\" text=\"판매원코드\"/><Cell col=\"12\" text=\"판매원명\"/><Cell col=\"13\" text=\"이연상태\"/><Cell col=\"14\" text=\"이연기간\"/><Cell col=\"15\" text=\"이연대상금액\"/><Cell col=\"16\" text=\"전기말 누계액\"/><Cell col=\"17\" text=\"당기 처리액\"/><Cell col=\"18\" text=\"당기 총누계액\"/><Cell col=\"19\" text=\"당월 처리액\"/><Cell col=\"20\" text=\"당월 잔존가액\"/></Band><Band id=\"body\"><Cell text=\"bind:rowNum\"/><Cell col=\"1\" text=\"bind:postpYm\"/><Cell col=\"2\" style=\"align:left;\" text=\"bind:postpTpNm\"/><Cell col=\"3\" text=\"bind:custNo\"/><Cell col=\"4\" text=\"bind:custNm\"/><Cell col=\"5\" text=\"bind:custTpNm\"/><Cell col=\"6\" displaytype=\"text\" edittype=\"readonly\" text=\"bind:ordNo\"/><Cell col=\"7\" style=\"align:left;\" text=\"bind:matNm\"/><Cell col=\"8\" text=\"bind:procDay\"/><Cell col=\"9\" text=\"bind:ordQty\"/><Cell col=\"10\" text=\"bind:AgencyNm\"/><Cell col=\"11\" text=\"bind:ordAgent\"/><Cell col=\"12\" text=\"bind:ordAgnm\"/><Cell col=\"13\" text=\"bind:postpStatNm\"/><Cell col=\"14\" text=\"bind:postpTerm\"/><Cell col=\"15\" displaytype=\"number\" style=\"align:right;\" text=\"bind:acqAmt\" mask=\"###,###,###,##0\"/><Cell col=\"16\" displaytype=\"number\" style=\"align:right;\" text=\"bind:lyTppAmt\" mask=\"###,###,###,##0\"/><Cell col=\"17\" displaytype=\"number\" style=\"align:right;\" text=\"bind:cyPpAmt\" mask=\"###,###,###,##0\"/><Cell col=\"18\" displaytype=\"number\" style=\"align:right;\" text=\"bind:cyTppAmt\" mask=\"###,###,###,##0\"/><Cell col=\"19\" displaytype=\"number\" style=\"align:right;\" text=\"bind:cmPpAmt\" mask=\"###,###,###,##0\"/><Cell col=\"20\" displaytype=\"number\" style=\"align:right;\" text=\"bind:cmRamt\" mask=\"###,###,###,##0\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 0, 45, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("6");
            		p.set_scrollbars("none");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1147, 496, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTREDeferSelect");
            		p.set_titletext("이연처리 내역 조회");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item16","div_search.edtYear","value","ds_chgInfo","expireY");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item17","div_search.edtMonth","value","ds_chgInfo","expireM");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        
        this.loadPreloadList = function()
        {
            this._addPreloadList("fdl", "comm::Paging.xfdl");
        };
        
        // User Script
        this.addIncludeScript("RTREPostpone.xfdl", "lib::comLib.xjs");
        this.registerScript("RTREPostpone.xfdl", function() {
        //include "lib::comLib.xjs";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.p_arg 		= "RTREDeferSelect";
        this.toDay		= ""; 	//당일
        this.yesterDay	= ""; 	//전일
        this.curMonth 	= "";	//당월	
        this.prevMonth	= ""; 	//전월
        this.nextMonth	= ""; 	//익월
        this.postpYm	= "";
        this.LIST_COUNT = 10;	// 한 페이지에 보여줄 
        this.PAGE_COUNT = 10;	// 페이지 번호 표시 개수
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg){
        	if( strSvcId == "initRTREPostpone" ){
        		var rowPostpTp = this.ds_postpTp.rowcount;
        		if( rowPostpTp != 0 ){
        			var insert = this.ds_postpTp.insertRow( 0 );
        			this.ds_postpTp.setColumn(insert,"cd"," ");
        			this.ds_postpTp.setColumn(insert,"cdNm","전체");
        			this.div_search.cb_postpTp.set_value( " " );
        		}
        		
        		var rowPostpStat = this.ds_postpStat.rowcount;
        		if( rowPostpStat != 0 ){
        			var insert = this.ds_postpStat.insertRow( 0 );
        			this.ds_postpStat.setColumn(insert,"cd"," ");
        			this.ds_postpStat.setColumn(insert,"cdNm","전체");
        			this.div_search.cb_postpStat.set_value(" ");
        		}
        	}
        	
        	if( strSvcId == "getDayMongth" ){
        		this.div_search.edtYear.set_value(this.curMonth.substr(0,4));
        		this.div_search.edtMonth.set_value(this.curMonth.substr(4,2));
        		this.postpYm = this.curMonth;
        	}
        	
        	if( strSvcId == "rTREPostponeList"){
        		var rowCt = this.ds_postpone.getRowCount();
        		if(rowCt != 0){
        			var totalCount = this.ds_postpone.getColumn(0,"totalCnt");
        			this.div_paging.setPage(totalCount);
        		}else{
        			alert("조회된 데이터가 없습니다.");
        			this.grid_postpone.set_nodatatext("조회된 데이터가 없습니다.");
        		}
        	}
        	
        	if( strSvcId == "rTREPostponeListExcel" ){
        		var rowCt = this.ds_postponeExcel.getRowCount();
        		if(rowCt != 0){
        			Ex.core.exportExcel(this, this.grid_postponeExcel);
        		}else{
        			alert("조회된 데이터가 없습니다.");
        		}
        		application.set_httptimeout(60);
        	}
        }

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.RTREPostpone_onload = function(obj,e){
        	Ex.core.init(obj);
        	this.fn_init();
        	this.parent.setButton("E|S", this);
        	this.div_paging.initPaging(this.LIST_COUNT, this.PAGE_COUNT, this.onChangePage, obj);	
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_init = function(){
        	var sSvcID      	= "initRTREPostpone";  
        	var sController   	= "rtms/re/initRTREPostpone.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	sOutDatasets += " ds_postpTp=mapDsPostpTp ";
        	sOutDatasets += " ds_postpStat=mapDsPostpStat ";
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	
        	var sSvcID      	= "getDayMongth";  
        	var sController   	= "ntrms/re/getDayMongth.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.cal_accReqDate_onchanged = function(obj,e){
        	if(nvl(this.div_search.edtMonth.value) != "" && obj.getLength() == 1) {
        		if(parseInt(this.div_search.edtMonth.value,10) < 10) {
        			this.div_search.edtMonth.set_value("0" + obj.value);
        		}
        	}
        	this.postpYm = nvl(this.div_search.edtYear.value) + "" + nvl(this.div_search.edtMonth.value);
        	if(this.postpYm != "") {
        		if(this.postpYm.length == 6) {
        			if(!this.fn_chkYm(this.div_search.edtYear.value, this.div_search.edtMonth.value)){
        				return;
        			}else {
        				this.FN_change();
        			}
        		}else{
        			var nYear = nvl(this.div_search.edtYear.value);
        			var nMonth = nvl(this.div_search.edtMonth.value);
        			if(nYear.length < 4) {
        				alert('마감월을 입력하세요.');
        				this.div_search.edtYear.setFocus();
        				return false;
        			}
        			if(nMonth.length < 2) {
        				alert('마감월을 입력하세요.');
        				this.div_search.edtMonth.setFocus();
        				return false;
        			}				
        		}
        	}
        }
        this.fn_chkYm = function(nYear,nMonth){
        	if(nYear.length < 4){
        		alert('기준년을 입력하세요.');							this.div_search.edtYear.setFocus();		return false;
        	}
        	if(nMonth.length < 2){
        		alert('기준월을 입력하세요.');							this.div_search.edtMonth.setFocus();	return false;
        	}	
        	if (nYear < 1900 || nYear > 3000){ 
        		this.alert("사용할수 없는 기준월이 입력되었습니다.");	this.div_search.edtYear.setFocus();		return false;
        	}
        	if (nMonth < 1 || nMonth > 12){  
        		this.alert("사용할수 없는 기준월이 입력되었습니다.");	this.div_search.edtMonth.setFocus();	return false;		
        	}
        	var yyyymm = nYear + "" + nMonth;
        	if(parseInt(yyyymm,10) > parseInt(this.curMonth,10)){
        		alert("현재이후년월로 조회할 수 없습니다.");			this.div_search.edtYear.setFocus(true);	return false;
        	}
        	return true;
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_bt_searchSalesGroup_onclick = function(obj,e){
        	var args ={ p_arg : this.p_arg };
        	Ex.core.popup(this,"계약번호 조회","comm::RTCOMMOrderNo_pop.xfdl",args, "modaless=false");	
        }
        this.returnOrderNoInfo = function(ordNo){
        	this.div_search.ed_ordNo.set_value(ordNo);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_search = function(){
        	//var page = this.div_paging.getCurrentPage();
        	var page = this.div_paging.setCurrentPage(1);
        	this.searchData(page);
        }
        this.onChangePage = function(page){
        	this.searchData(page);
        }
        this.searchData = function(page){
        	var ordNo     = nvl(this.div_search.ed_ordNo.value);
        	var postpTp   = nvl(this.div_search.cb_postpTp.value);
        	var postpStat = nvl(this.div_search.cb_postpStat.value);
        	
        	if( this.ordNo == "" && this.postpYm == "" ){
        		alert("기준년월 또는 계약번호 값은 필수입니다.");
        		return false;
        	}else{
        		var sSvcID        	= "rTREPostponeList";
        		var sController   	= "rtms/re/rTREPostponeList.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_postpone=postponeMap";
        		var sArgs 			= "";
        		var fn_callBack		= "fn_callBack";
        		this.ds_postpone.clearData();
        		sArgs += Ex.util.setParam("postpYm"		,this.postpYm);
        		sArgs += Ex.util.setParam("ordNo"		,ordNo);
        		sArgs += Ex.util.setParam("postpTp"		,postpTp);
        		sArgs += Ex.util.setParam("postpStat"	,postpStat);
        		sArgs += Ex.util.setParam("pageNo"		,page);
        		sArgs += Ex.util.setParam("getCnt"		,this.PAGE_COUNT);
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_excel = function(){
        	application.set_httptimeout(120);
        	var ordNo     = nvl(this.div_search.ed_ordNo.value);
        	var postpTp   = nvl(this.div_search.cb_postpTp.value);
        	var postpStat = nvl(this.div_search.cb_postpStat.value);
        	
        	if( this.postpYm == "" ){
        		alert("기준년월 값이 없습니다.");
        		return false;
        	}else if( (postpTp == "") && (postpStat == "") ){
        		alert("이연항목이나 이연상태를 선택하셔야합니다.");
        		return false;
        	}else{
        		var sSvcID        	= "rTREPostponeListExcel";
        		var sController   	= "rtms/re/rTREPostponeListExcel.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_postponeExcel=postponeExcelMap";
        		var sArgs 			= "";
        		var fn_callBack		= "fn_callBack";
        		this.ds_postponeExcel.clearData();
        		sArgs += Ex.util.setParam("postpYm"		,this.postpYm);
        		sArgs += Ex.util.setParam("ordNo"		,ordNo);
        		sArgs += Ex.util.setParam("postpTp"		,postpTp);
        		sArgs += Ex.util.setParam("postpStat"	,postpStat);
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_ed_ordNo_onchanged = function(obj,e){
        	this.FN_change();
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_cb_postpTp_onitemchanged = function(obj,e){
        	this.FN_change();
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_cb_postpStat_onitemchanged = function(obj,e){
        	this.FN_change();
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.FN_change = function(){
        	this.ds_postpone.clearData();
        	this.ds_postponeExcel.clearData();
        }
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTREPostpone_onload, this);
            this.div_search.cb_postpTp.addEventHandler("onitemchanged", this.div_search_cb_postpTp_onitemchanged, this);
            this.div_search.ed_ordNo.addEventHandler("onchanged", this.div_search_ed_ordNo_onchanged, this);
            this.div_search.cb_postpStat.addEventHandler("onitemchanged", this.div_search_cb_postpStat_onitemchanged, this);
            this.div_search.bt_searchOrdNo.addEventHandler("onclick", this.div_search_bt_searchSalesGroup_onclick, this);
            this.div_search.edtYear.addEventHandler("onchanged", this.cal_accReqDate_onchanged, this);
            this.div_search.edtMonth.addEventHandler("onchanged", this.cal_accReqDate_onchanged, this);
            this.grid_postpone.addEventHandler("onselectchanged", this.grid_postpone_onselectchanged, this);
            this.grid_postpone.addEventHandler("onvscroll", this.grid_postpone_onvscroll, this);
            this.grid_postponeExcel.addEventHandler("onvscroll", this.grid_postpone_onvscroll, this);
            this.grid_postponeExcel.addEventHandler("onselectchanged", this.grid_postpone_onselectchanged, this);

        };

        this.loadIncludeScript("RTREPostpone.xfdl");
        this.loadPreloadList();
       
    };
}
)();
