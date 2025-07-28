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
                this.set_name("RTSDProductAndPrice");
                this.set_classname("RTSDProductAndPrice");
                this.set_titletext("상품 및 가격 조회");
                this._setFormPosition(0,0,1147,768);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_carClassCd", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_carMaker", this);
            obj._setContents("");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_carModel", this);
            obj._setContents("");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_contents", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_frCd", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_seasonCd", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_rtsd0005", this);
            obj._setContents("<ColumnInfo><Column id=\"petternCd\" type=\"STRING\" size=\"256\"/><Column id=\"petternNm\" type=\"STRING\" size=\"256\"/><Column id=\"specNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_specCd", this);
            obj._setContents("<ColumnInfo><Column id=\"specCd\" type=\"STRING\" size=\"256\"/><Column id=\"specNm\" type=\"STRING\" size=\"256\"/><Column id=\"aspectRatio\" type=\"STRING\" size=\"256\"/><Column id=\"plyRating\" type=\"STRING\" size=\"256\"/><Column id=\"sectionWidth\" type=\"STRING\" size=\"256\"/><Column id=\"wheelInches\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_cnt", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_period", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_rtsd0004", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_patternCd", this);
            obj._setContents("<ColumnInfo><Column id=\"petternCd\" type=\"STRING\" size=\"256\"/><Column id=\"petternNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_productAndPrice", this);
            obj._setContents("<ColumnInfo><Column id=\"modelCd\" type=\"STRING\" size=\"256\"/><Column id=\"contentsCd\" type=\"STRING\" size=\"256\"/><Column id=\"frCd\" type=\"STRING\" size=\"256\"/><Column id=\"petternCd\" type=\"STRING\" size=\"256\"/><Column id=\"specCd\" type=\"STRING\" size=\"256\"/><Column id=\"pureYn\" type=\"STRING\" size=\"256\"/><Column id=\"periodCd\" type=\"STRING\" size=\"256\"/><Column id=\"wheelQty\" type=\"STRING\" size=\"256\"/><Column id=\"regiCd\" type=\"STRING\" size=\"256\"/><Column id=\"amt\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"regiAmt\" type=\"STRING\" size=\"256\"/><Column id=\"rentAmt\" type=\"STRING\" size=\"256\"/><Column id=\"ordQty\" type=\"STRING\" size=\"256\"/><Column id=\"contentsCdNm\" type=\"STRING\" size=\"256\"/><Column id=\"frCdNm\" type=\"STRING\" size=\"256\"/><Column id=\"modelNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Div("div_search", "absolute", "10", "10", "1126", "69", null, null, this);
            obj.set_taborder("0");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_contentsCd", "absolute", "621", "12", "47", "21", null, null, this.div_search);
            obj.set_taborder("32");
            obj.set_text("사양");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_contentsCd", "absolute", "722", "12", "92", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("33");
            obj.set_displaynulltext("선택");
            obj.set_innerdataset("@ds_contents");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("");
            obj = new Edit("ed_frCd", "absolute", "276", "-10", "81", "21", null, null, this.div_search);
            obj.set_taborder("34");
            obj.set_maxlength("80");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_modelCd", "absolute", "80", "-10", "84", "21", null, null, this.div_search);
            obj.set_taborder("35");
            obj.set_maxlength("80");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_contentsCd", "absolute", "172", "-10", "104", "21", null, null, this.div_search);
            obj.set_taborder("36");
            obj.set_maxlength("80");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_cnt", "absolute", "833", "38", "80", "21", null, null, this.div_search);
            obj.set_taborder("39");
            obj.set_text("타이어본수");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_carModelCd", "absolute", "421", "12", "45", "21", null, null, this.div_search);
            obj.set_taborder("40");
            obj.set_text("차종");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_carGubunCd", "absolute", "20", "12", "75", "21", null, null, this.div_search);
            obj.set_taborder("41");
            obj.set_text("차량분류");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_cnt", "absolute", "928", "38", "109", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("43");
            obj.set_displaynulltext("선택");
            obj.set_innerdataset("ds_cnt");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new Static("Static07", "absolute", "0", "0", "1102", "12", null, null, this.div_search);
            obj.set_taborder("44");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "0", "32", "1102", "6", null, null, this.div_search);
            obj.set_taborder("45");
            obj.set_text("FIX h6");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "0", "0", "20", "65", null, null, this.div_search);
            obj.set_taborder("46");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "95", "0", "20", "65", null, null, this.div_search);
            obj.set_taborder("47");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "401", "0", "20", "63", null, null, this.div_search);
            obj.set_taborder("48");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "466", "0", "20", "65", null, null, this.div_search);
            obj.set_taborder("49");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static05", "absolute", "600", "0", "20", "63", null, null, this.div_search);
            obj.set_taborder("50");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static08", "absolute", "702", "0", "20", "64", null, null, this.div_search);
            obj.set_taborder("51");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static09", "absolute", "1102", "0", "20", "65", null, null, this.div_search);
            obj.set_taborder("52");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_seasonCd", "absolute", "115", "38", "92", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("54");
            obj.set_displaynulltext("선택");
            obj.set_innerdataset("ds_seasonCd");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new Static("st_searchOrdDay00", "absolute", "20", "38", "75", "21", null, null, this.div_search);
            obj.set_taborder("55");
            obj.set_text("계절구분");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_seach", "absolute", "1057", "12", "45", "22", null, null, this.div_search);
            obj.set_taborder("56");
            obj.set_text("검색");
            obj.set_cssclass("btn_WF_CRUD");
            obj.getSetter("domainId").set("nexa.add");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "1037", "0", "20", "60", null, null, this.div_search);
            obj.set_taborder("57");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchPettern", "absolute", "227", "38", "43", "21", null, null, this.div_search);
            obj.set_taborder("58");
            obj.set_text("패턴");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_petternCd", "absolute", "309", "38", "92", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("59");
            obj.set_displaynulltext("선택");
            obj.set_innerdataset("@ds_patternCd");
            obj.set_codecolumn("petternCd");
            obj.set_datacolumn("petternNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new Static("Static11", "absolute", "206", "0", "20", "64", null, null, this.div_search);
            obj.set_taborder("60");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_spec", "absolute", "421", "38", "80", "21", null, null, this.div_search);
            obj.set_taborder("61");
            obj.set_text("규격");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static12", "absolute", "290", "0", "20", "64", null, null, this.div_search);
            obj.set_taborder("62");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_specCd", "absolute", "486", "38", "114", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("63");
            obj.set_displaynulltext("선택");
            obj.set_innerdataset("ds_specCd");
            obj.set_codecolumn("specCd");
            obj.set_datacolumn("specNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new Combo("cb_carClassCd", "absolute", "115", "12", "92", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("64");
            obj.set_displaynulltext("선택");
            obj.set_innerdataset("ds_carClassCd");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new Static("st_carMakerCd", "absolute", "227", "12", "66", "21", null, null, this.div_search);
            obj.set_taborder("65");
            obj.set_text("제조사");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_carMakerCd", "absolute", "309", "12", "92", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("66");
            obj.set_displaynulltext("선택");
            obj.set_innerdataset("@ds_carMaker");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new Combo("cb_carModelCd", "absolute", "485", "12", "115", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("67");
            obj.set_displaynulltext("선택");
            obj.set_innerdataset("@ds_carModel");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new Static("st_frCd", "absolute", "833", "12", "65", "21", null, null, this.div_search);
            obj.set_taborder("68");
            obj.set_text("전후구분");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static13", "absolute", "814", "0", "20", "64", null, null, this.div_search);
            obj.set_taborder("69");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_frCd", "absolute", "928", "11", "109", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("70");
            obj.set_displaynulltext("선택");
            obj.set_innerdataset("@ds_frCd");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new Static("Static14", "absolute", "8", "59", "1094", "6", null, null, this.div_search);
            obj.set_taborder("71");
            obj.set_text("FIX h6");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_period", "absolute", "620", "38", "65", "21", null, null, this.div_search);
            obj.set_taborder("72");
            obj.set_text("계약기간");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_period", "absolute", "722", "38", "92", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("73");
            obj.set_displaynulltext("선택");
            obj.set_innerdataset("ds_period");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new Static("Static15", "absolute", "908", "8", "20", "55", null, null, this.div_search);
            obj.set_taborder("74");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);

            obj = new Grid("grid_productAndPrice", "absolute", "11", "90", "1125", "406", null, null, this);
            obj.set_taborder("1");
            obj.set_binddataset("ds_productAndPrice");
            obj.set_cellsizingtype("col");
            obj.set_autofittype("col");
            obj.set_readonly("true");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"120\"/><Column size=\"99\"/><Column size=\"60\"/><Column size=\"160\"/><Column size=\"160\"/><Column size=\"60\"/><Column size=\"60\"/><Column size=\"60\"/><Column size=\"0\"/><Column size=\"99\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"차종\"/><Cell col=\"1\" text=\"사양\"/><Cell col=\"2\" text=\"전후구분\"/><Cell col=\"3\" text=\"패턴\"/><Cell col=\"4\" text=\"규격\"/><Cell col=\"5\" text=\"순정여부\"/><Cell col=\"6\" text=\"계약기간\"/><Cell col=\"7\" text=\"본수\"/><Cell col=\"8\" text=\"등록비\"/><Cell col=\"9\" text=\"렌탈료\"/></Band><Band id=\"body\"><Cell edittype=\"normal\" text=\"bind:modelNm\"/><Cell col=\"1\" edittype=\"normal\" text=\"bind:contentsCdNm\"/><Cell col=\"2\" edittype=\"normal\" text=\"bind:frCdNm\"/><Cell col=\"3\" edittype=\"normal\" text=\"bind:petternCd\"/><Cell col=\"4\" edittype=\"normal\" text=\"bind:matNm\"/><Cell col=\"5\" edittype=\"normal\" text=\"bind:pureYn\"/><Cell col=\"6\" edittype=\"normal\" text=\"bind:periodCd\"/><Cell col=\"7\" edittype=\"normal\" text=\"bind:ordQty\"/><Cell col=\"8\" displaytype=\"normal\" edittype=\"normal\" text=\"bind:regiAmt\"/><Cell col=\"9\" edittype=\"normal\" text=\"bind:rentAmt\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1126, 69, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("0");
            		p.set_scrollbars("none");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1147, 768, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTSDProductAndPrice");
            		p.set_titletext("상품 및 가격 조회");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTSDProductAndPrice.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDProductAndPrice.xfdl", function() {
        /***************************************************************************************************
         * 파 일 명 : RTSDProductAndPrice.xfdl
         * 설    명 : 상품 및 가격조회
         * 작 성 자 : 
         * 변경이력 :
         * 변경일자		변경자		변경내용
         * ----------	------		--------
         * ...			...			... 
         * 2017-08-30	wjim		[20170830_01] 패턴명(코드)에 ' 포함에 따른 수정
         *							- 예) N'FERA AU7
         * 2017-08-30	wjim		[20170830_02] 선택한 패턴에 해당하는 규격만 조회조건에 노출되도록 수정
         *                          - 상담실 요청으로 원복
         * 2017-09-21	wjim		[20170921_01] 조회결과 모두 Copy & Paste 가능하도록 변경
         ***************************************************************************************************/

        //include "lib::comLib.xjs";

        //01 : 영업관리자
        //02 : 콜센터
        //03 : 지사
        //04 : 지점
        //05 : 대리점
        this.userGrp = application.gds_userInfo.getColumn(0,"userGrp");
        this.agentId = application.gds_userInfo.getColumn(0,"agentId");

        this.toDay = "";

        /*
         * 팝업화면 로드 시 처리
         */
        this.RTSDProductAndPrice_onload = function(obj,e)
        {
        	Ex.core.init(obj);
        	this.parent.setButton("E|S", this);
        	this.fn_initYmd();
        	this.fn_init();
        }

        /**
         * 서버기준 오늘 날자 조회 후 세팅
         */
        this.fn_initYmd = function() {
        	var sSvcID      	= "getToday";  
        	var sController   	= "ntrms/re/getDayMongth.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }

        /*
         * 공통코드성 조회조건용 콤보 조회
         */
        this.fn_init = function(){
        	var sSvcID      	= "initProductPriceCombo";  
        	var sController   	= "rtms/comm/initProductPriceCombo.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= " ";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sOutDatasets += " ds_carClassCd=mapCarGubun ";
        	sOutDatasets += " ds_carMaker=mapBrand ";
        	sOutDatasets += " ds_period=mapPeriod ";
        	sOutDatasets += " ds_cnt=mapCnt ";
        	sOutDatasets += " ds_seasonCd=mapSeasonCd ";

        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg,resultCnt){

        	if (strSvcId=="initProductPriceCombo") {
        		
        		this.ds_period.insertRow(0);
        		this.ds_period.setColumn(0, "cd","");
        		this.ds_period.setColumn(0, "cdNm","전체");
        		
        		this.fn_resetCombo(this.div_search.cb_period);
        		
        		this.ds_seasonCd.insertRow(0);
        		this.ds_seasonCd.setColumn(0, "cd","");
        		this.ds_seasonCd.setColumn(0, "cdNm","전체");
        		
        		this.fn_resetCombo(this.div_search.cb_seasonCd);
        		
        		this.ds_cnt.insertRow(0);
        		this.ds_cnt.setColumn(0, "cd","");
        		this.ds_cnt.setColumn(0, "cdNm","전체");
        		
        		this.fn_resetCombo(this.div_search.cb_cnt);
        		
        	}else if(strSvcId == "sRtsd0004ContentsSelect"){
        	
        		for(var i=0; i<this.ds_contents.rowcount; i++){
        			if(nvl(this.ds_contents.getColumn(i, "cdNm")) == ""){
        				this.ds_contents.setColumn(i, "cdNm", "사양없음");
        			}
        		}
        		
        	}else if(strSvcId == "sRtsd0004FrCdSelect"){
        		//조회한 전후구분코드로 세팅
        		for(var i=0; i<this.ds_frCd.rowcount;i++){
        			if(nvl(this.ds_frCd.getColumn(i, "cd")) == "Z"){
        				this.ds_frCd.setColumn(i, "cdNm", "구분없음");
        			}
        		}
        		
        		this.fn_resetCombo(this.div_search.cb_frCd);
        		
        	}else if(strSvcId == "sRtsd0005Select"){	
        		
        		this.ds_rtsd0005.filter("");
        		
        		var seasonCd = nvl(this.div_search.cb_seasonCd.value);		
        		if(nvl(this.div_search.cb_seasonCd.text) != "전체"){
        			this.ds_rtsd0005.filter("seasonCd == '" + seasonCd + "'");
        		}

        		var j=0;
        		for(var i=0; i<this.ds_rtsd0005.rowcount; i++){
        			var patternCd = nvl(this.ds_rtsd0005.getColumn(i, "petternCd"));
        			var patternNm = nvl(this.ds_rtsd0005.getColumn(i, "petternNm"));

        			// [20170830_01] 패턴명(코드)에 ' 포함에 따른 수정
        			//if(this.ds_patternCd.findRowExpr("petternCd == '" + patternCd + "'") < 0){
        			if(this.ds_patternCd.findRow("petternCd", patternCd) < 0){
        				this.ds_patternCd.addRow();
        				this.ds_patternCd.setColumn(j, "petternCd", patternCd);
        				this.ds_patternCd.setColumn(j, "petternNm", patternNm);
        				j++;
        			}
        		}
        		
        		this.ds_patternCd.insertRow(0);
        		this.ds_patternCd.setColumn(0, "petternCd", "");
        		this.ds_patternCd.setColumn(0, "petternNm", "전체");
        		
        		this.fn_resetCombo(this.div_search.cb_petternCd);
        	
        	}else if(strSvcId == "sRtsd0004Select"){
        	
        		var sectionWidth = "";
        		var aspectRatio = "";
        		var wheelInches = "";
        		var plyRating = "";
        		var specCd = "";
        		var specNm = "";
        		var j = 0;

        		for(var i=0; i<this.ds_rtsd0004.rowcount; i++){
        			sectionWidth = nvl(this.ds_rtsd0004.getColumn(i, "sectionWidth"));
        			aspectRatio = nvl(this.ds_rtsd0004.getColumn(i, "aspectRatio"));
        			wheelInches = nvl(this.ds_rtsd0004.getColumn(i, "wheelInches"));
        			plyRating = nvl(this.ds_rtsd0004.getColumn(i, "plyRating"));
        			
        			specCd = sectionWidth + "|" + aspectRatio + "|" + wheelInches + "|" + plyRating;
        			specNm = sectionWidth + "/" + aspectRatio + "R" + wheelInches + " " + plyRating + "P";
        									
        			// [20170830_01] 패턴명(코드)에 ' 포함에 따른 수정
        			// - [20170830_02] 로 변경했다가 원복
        			//if(nvl(this.ds_specCd.findRowExpr("specCd == '" + specCd + "'")) < 0){
        			if(nvl(this.ds_specCd.findRow("specCd", specCd)) < 0){
        				this.ds_specCd.addRow();
        				this.ds_specCd.setColumn(j, "specCd", specCd);
        				this.ds_specCd.setColumn(j, "specNm", specNm);
        				j++;
        			}
        			
        			// [20170830_02] 패턴명(코드)에 부합하는 규격만 노출
        			// - 상담실 패턴별 가격비교를 위해 기존 원복
        			/*
        			for (var k=0; k < this.ds_rtsd0005.rowcount; k++) {
        				if (
        					(this.ds_rtsd0005.getColumn(k, "petternCd") == this.div_search.cb_petternCd.value) 
        					&& 
        					(this.ds_rtsd0005.getColumn(k, "specNm") == specNm)
        					&& 
        					(this.ds_specCd.findRow("specCd", specCd) < 0)
        				) {
        					this.ds_specCd.addRow();
        					this.ds_specCd.setColumn(j, "specCd", specCd);
        					this.ds_specCd.setColumn(j, "specNm", specNm);
        					j++;
        				}
        			}
        			*/
        		}
        		
        		this.ds_specCd.insertRow(0);
            	this.ds_specCd.setColumn(0, "specCd", "");
        		this.ds_specCd.setColumn(0, "specNm", "전체");
         	
        		this.fn_resetCombo(this.div_search.cb_specCd);
        		
        	}else if(strSvcId == "sProductAndPriceList"){
        	
        		if(this.ds_productAndPrice.rowcount == 0){
        			this.grid_productAndPrice.set_nodatatext("조회된 데이터가 존재 하지 않습니다.");
        		}
        	}
        }

        //차량분류 변경
        this.div_search_cb_carClassCd_onitemchanged = function(obj,e)
        {
        	if(nvl(this.div_search.cb_carMakerCd.value) != ""){
        		this.div_search_cb_carMakerCd_onitemchanged();
        	}
        }

        //제조사에 해당하는 차종종류
        this.div_search_cb_carMakerCd_onitemchanged = function(obj,e)
        {
        	var sSvcID        	= "sRtsd0001ModelSelect";                    
        	var sController   	= "/rtms/sd/sRtsd0001ModelByClassSelect.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_carModel=modelSearchMap";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("makerCd",  nvl(this.div_search.cb_carMakerCd.value));
        	sArgs += Ex.util.setParam("classCd",  nvl(this.div_search.cb_carClassCd.value));
        	
        	this.ds_carModel.clearData();
        	this.ds_contents.clearData();
        	this.ds_frCd.clearData();
        	
        	this.fn_resetCombo(this.div_search.cb_carModelCd);
        	this.fn_resetCombo(this.div_search.cb_contentsCd);
        	this.fn_resetCombo(this.div_search.cb_petternCd);
        	this.fn_resetCombo(this.div_search.cb_specCd);
        	this.fn_resetCombo(this.div_search.cb_seasonCd);
        	this.fn_resetCombo(this.div_search.cb_period);
        	this.fn_resetCombo(this.div_search.cb_cnt);
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        //차종분류,차종에 해당하는 사양종류
        this.div_search_cb_carModelCd_onitemchanged = function(obj,e)
        {	
        	var sSvcID        	= "sRtsd0004ContentsSelect";                    
        	var sController   	= "/rtms/sd/sRtsd0004ContentsCdSelect.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_contents=contentsCdSearchMap";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("modelCd",  nvl(this.div_search.cb_carModelCd.value));
        	sArgs += Ex.util.setParam("classCd",  nvl(this.div_search.cb_carClassCd.value));
        	sArgs += Ex.util.setParam("useYn",  "Y");
        	
        	this.ds_contents.clearData();
        	this.ds_frCd.clearData();
        	
        	this.fn_resetCombo(this.div_search.cb_petternCd);
        	this.fn_resetCombo(this.div_search.cb_specCd);
        	this.fn_resetCombo(this.div_search.cb_contentsCd);
        	this.fn_resetCombo(this.div_search.cb_seasonCd);
        	this.fn_resetCombo(this.div_search.cb_period);
        	this.fn_resetCombo(this.div_search.cb_cnt);
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        //차종분류,차종에 해당하는 전후구분
        this.div_search_cb_contentsCd_onitemchanged = function(obj,e)
        {
        	var sSvcID        	= "sRtsd0004FrCdSelect";                    
        	var sController   	= "/rtms/sd/sRtsd0004FrCdSelect.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_frCd=fdCdSearchMap";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("classCd",  nvl(this.div_search.cb_carClassCd.value));
        	sArgs += Ex.util.setParam("contentsCd",  nvl(this.div_search.cb_contentsCd.value));
        	sArgs += Ex.util.setParam("modelCd",  nvl(this.div_search.cb_carModelCd.value));
        	sArgs += Ex.util.setParam("useYn",  "Y");
        	
        	this.ds_frCd.clearData();
        	
        	this.fn_resetCombo(this.div_search.cb_petternCd);
        	this.fn_resetCombo(this.div_search.cb_specCd);
        	this.fn_resetCombo(this.div_search.cb_seasonCd);
        	this.fn_resetCombo(this.div_search.cb_period);
        	this.fn_resetCombo(this.div_search.cb_cnt);
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        //패턴정보가져오기
        this.div_search_cb_seasonCd_onitemchanged = function(obj,e)
        {
        	var sSvcID        	= "sRtsd0005Select";                    
        	var sController   	= "/rtms/comm/combosetMat.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_rtsd0005=mapCombosetMat";
        	var sArgs 			= "";
        	var fn_callBack		= "fn_callBack";
        	
        	this.ds_rtsd0005.clearData();
         	this.ds_patternCd.clearData();
         	this.ds_specCd.clearData();
         	
         	this.fn_resetCombo(this.div_search.cb_petternCd);
         	this.fn_resetCombo(this.div_search.cb_specCd);
         	this.fn_resetCombo(this.div_search.cb_period);
         	this.fn_resetCombo(this.div_search.cb_cnt);
        	
        	sArgs += Ex.util.setParam("modelCd" 		,nvl(this.div_search.cb_carModelCd.value));
        	sArgs += Ex.util.setParam("contentsCd" 		,nvl(this.div_search.cb_contentsCd.value));
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        //규격정보가져오기
        this.div_search_cb_petternCd_onitemchanged = function(obj,e)
        {
        	var sSvcID        	= "sRtsd0004Select";                    
        	var sController   	= "/rtms/sd/sRtsd0004Select.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_rtsd0004=rtsd0004SearchMap";
        	var sArgs 			= "";
        	var fn_callBack		= "fn_callBack";

         	this.ds_specCd.clearData();
         	
         	this.fn_resetCombo(this.div_search.cb_specCd);
         	this.fn_resetCombo(this.div_search.cb_period);
         	this.fn_resetCombo(this.div_search.cb_cnt);
        	
        	sArgs += Ex.util.setParam("modelCd" 		,nvl(this.div_search.cb_carModelCd.value));
        	sArgs += Ex.util.setParam("contentsCd" 		,nvl(this.div_search.cb_contentsCd.value));
        	sArgs += Ex.util.setParam("frCd" 		,nvl(this.div_search.cb_frCd.value));
        	sArgs += Ex.util.setParam("classCd" 		,nvl(this.div_search.cb_carClassCd.value));
        	sArgs += Ex.util.setParam("useYn" 		,"Y");
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 조회 버튼의 클릭 이벤트 처리
         */
        this.fn_search = function(){
        	
        	if(nvl(this.div_search.cb_carClassCd.value) == ""){
        		this.alert("차량분류를 선택해주세요.");
        		return;
        	}
        	
        	if(nvl(this.div_search.cb_carMakerCd.value) == ""){
        		this.alert("제조사를 선택해주세요.");
        		return;
        	}
        	
        	if(nvl(this.div_search.cb_carModelCd.value) == ""){
        		this.alert("차량종류를 선택해주세요.");
        		return;
        	}
        	
        	if(nvl(this.div_search.cb_contentsCd.value) == ""){
        		this.alert("사양을 선택해주세요.");
        		return;
        	}
        	
        	var sSvcID        	= "sProductAndPriceList";                    
        	var sController   	= "/rtms/sd/listProductAndPriceInfo.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_productAndPrice=ds_output";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";	

        	var specCd = this.div_search.cb_specCd.value;
        	var arrSpecCd = new Array();
        	var sectionWidth = "";
        	var aspectRatio = "";
        	var wheelInches = "";
        	var plyRating = "";
        	
        	if(nvl(specCd) != ""){
        		arrSpecCd = specCd.split("|");
        		sectionWidth = nvl(arrSpecCd[0]);
        		aspectRatio = nvl(arrSpecCd[1]);
        		wheelInches = nvl(arrSpecCd[2]);
        		plyRating = nvl(arrSpecCd[3]);
        	}

        	sArgs += Ex.util.setParam("modelCd",  nvl(this.div_search.cb_carModelCd.value));
        	sArgs += Ex.util.setParam("contentsCd",  nvl(this.div_search.cb_contentsCd.value));
        	sArgs += Ex.util.setParam("frCd",  nvl(this.div_search.cb_frCd.value));
        	sArgs += Ex.util.setParam("sectionWidth",  sectionWidth);
        	sArgs += Ex.util.setParam("aspectRatio",  aspectRatio);
        	sArgs += Ex.util.setParam("wheelInches",  wheelInches);
        	sArgs += Ex.util.setParam("plyRating",  plyRating);
        	sArgs += Ex.util.setParam("seasonCd",  nvl(this.div_search.cb_seasonCd.value));
        	sArgs += Ex.util.setParam("petternCd",  nvl(this.div_search.cb_petternCd.value));
        	sArgs += Ex.util.setParam("ordDay",  this.toDay);
        	sArgs += Ex.util.setParam("periodCd",  nvl(this.div_search.cb_period.value));
        	sArgs += Ex.util.setParam("cntCd",  nvl(this.div_search.cb_cnt.value));
        	
        	this.ds_productAndPrice.clearData();
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 엑셀 버튼의 클릭 이벤트 처리
         */
        this.fn_excel= function() {
        	Ex.core.exportExcel(this, this.grid_productAndPrice);
        }

        /**
         * 콤보박스 컨트롤 초기화
         */
        this.fn_resetCombo = function(cbObj){
        	
        	cbObj.set_index(-1);
        	cbObj.value = "";
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTSDProductAndPrice_onload, this);
            this.div_search.cb_contentsCd.addEventHandler("onitemchanged", this.div_search_cb_contentsCd_onitemchanged, this);
            this.div_search.cb_cnt.addEventHandler("onitemchanged", this.div_search_cb_searchCnt_onitemchanged, this);
            this.div_search.cb_seasonCd.addEventHandler("onitemchanged", this.div_search_cb_seasonCd_onitemchanged, this);
            this.div_search.btn_seach.addEventHandler("onclick", this.div_search_btn_seach_onclick, this);
            this.div_search.Static01.addEventHandler("onclick", this.div_search_Static01_onclick, this);
            this.div_search.cb_petternCd.addEventHandler("onitemchanged", this.div_search_cb_petternCd_onitemchanged, this);
            this.div_search.cb_specCd.addEventHandler("onitemchanged", this.div_search_cb_specCd_onitemchanged, this);
            this.div_search.cb_carClassCd.addEventHandler("onitemchanged", this.div_search_cb_carClassCd_onitemchanged, this);
            this.div_search.cb_carMakerCd.addEventHandler("onitemchanged", this.div_search_cb_carMakerCd_onitemchanged, this);
            this.div_search.cb_carModelCd.addEventHandler("onitemchanged", this.div_search_cb_carModelCd_onitemchanged, this);
            this.div_search.cb_frCd.addEventHandler("onitemchanged", this.div_search_cb_searchPeriod_onitemchanged, this);
            this.div_search.cb_period.addEventHandler("onitemchanged", this.div_search_cb_searchPeriod_onitemchanged, this);

        };

        this.loadIncludeScript("RTSDProductAndPrice.xfdl");

       
    };
}
)();
