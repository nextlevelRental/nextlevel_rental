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
                this.set_name("RTCSZeroChangeService");
                this.set_classname("RTCMClaim");
                this.set_titletext("걱정제로 타이어 교체 서비스 내역 조회");
                this._setFormPosition(0,0,1147,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_list", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"dlvrDay\" type=\"STRING\" size=\"256\"/><Column id=\"dlvrSeq\" type=\"STRING\" size=\"0\"/><Column id=\"ordNo\" type=\"STRING\" size=\"0\"/><Column id=\"custNo\" type=\"STRING\" size=\"0\"/><Column id=\"custNm\" type=\"STRING\" size=\"0\"/><Column id=\"makerCd\" type=\"STRING\" size=\"256\"/><Column id=\"makerNm\" type=\"STRING\" size=\"256\"/><Column id=\"modelCd\" type=\"STRING\" size=\"256\"/><Column id=\"modelNm\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"addr1\" type=\"STRING\" size=\"0\"/><Column id=\"dlvTel\" type=\"STRING\" size=\"0\"/><Column id=\"dlvDesc\" type=\"STRING\" size=\"256\"/><Column id=\"dlvStat\" type=\"STRING\" size=\"256\"/><Column id=\"dlvstatNm\" type=\"STRING\" size=\"256\"/><Column id=\"agencyCd\" type=\"STRING\" size=\"256\"/><Column id=\"servrqDay\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"cntNm\" type=\"STRING\" size=\"256\"/><Column id=\"agencyNm\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"inRoute\" type=\"STRING\" size=\"256\"/><Column id=\"reqNum\" type=\"STRING\" size=\"256\"/><Column id=\"rowNum\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroup\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOffice\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroupNm\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOfficeNm\" type=\"STRING\" size=\"256\"/><Column id=\"o2oStockYn\" type=\"STRING\" size=\"256\"/><Column id=\"dlvGb\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_stateCd", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_dateCd", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cdNm\">신청일자</Col><Col id=\"cd\">01</Col></Row><Row><Col id=\"cd\">02</Col><Col id=\"cdNm\">집계일자</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsRentalInfo", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"userId\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroup\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOffice\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroupNm\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOfficeNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_C039", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cd\">01</Col><Col id=\"cdNm\">장착</Col></Row><Row><Col id=\"cd\">02</Col><Col id=\"cdNm\">수령</Col></Row></Rows>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Grid("grd_list", "absolute", "0", "98", "1122", null, null, "12", this);
            obj.set_taborder("4");
            obj.set_autofittype("none");
            obj.set_binddataset("ds_list");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"73\"/><Column size=\"32\"/><Column size=\"90\"/><Column size=\"90\"/><Column size=\"90\"/><Column size=\"56\"/><Column size=\"83\"/><Column size=\"90\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"60\"/><Column size=\"157\"/><Column size=\"59\"/><Column size=\"40\"/><Column size=\"109\"/><Column size=\"152\"/><Column size=\"257\"/><Column size=\"96\"/><Column size=\"80\"/><Column size=\"88\"/><Column size=\"88\"/><Column size=\"61\"/><Column size=\"40\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"30\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"접수일자\"/><Cell col=\"1\" text=\"순번\"/><Cell col=\"2\" text=\"계약번호\"/><Cell col=\"3\" text=\"렌탈지사\"/><Cell col=\"4\" text=\"렌탈지점\"/><Cell col=\"5\" text=\"신청회차\"/><Cell col=\"6\" text=\"고객명\"/><Cell col=\"7\" text=\"제조사\"/><Cell col=\"8\" text=\"차종\"/><Cell col=\"9\" text=\"차량 No\"/><Cell col=\"10\" text=\"상품코드\"/><Cell col=\"11\" text=\"상품명\"/><Cell col=\"12\" text=\"신청본수\"/><Cell col=\"13\" text=\"거점\"/><Cell col=\"14\" text=\"고객 핸드폰 번호\"/><Cell col=\"15\" text=\"대리점\"/><Cell col=\"16\" text=\"대리점주소\"/><Cell col=\"17\" text=\"대리점 연락처\"/><Cell col=\"18\" text=\"상태\"/><Cell col=\"19\" text=\"교체예정일자\"/><Cell col=\"20\" text=\"처리완료일자\"/><Cell col=\"21\" text=\"유입경로\"/><Cell col=\"22\" text=\"수령여부\"/></Band><Band id=\"body\"><Cell displaytype=\"date\" text=\"bind:dlvrDay\" calendardisplaynulltype=\"none\" tooltiptext=\"bind:dlvrDay\"/><Cell col=\"1\" text=\"bind:dlvrSeq\" tooltiptext=\"bind:dlvrSeq\"/><Cell col=\"2\" displaytype=\"text\" edittype=\"readonly\" text=\"bind:ordNo\" tooltiptext=\"bind:ordNo\"/><Cell col=\"3\" text=\"bind:rentalGroupNm\"/><Cell col=\"4\" text=\"bind:rentalOfficeNm\"/><Cell col=\"5\" text=\"bind:reqNum\"/><Cell col=\"6\" text=\"bind:custNm\" tooltiptext=\"bind:custNm\"/><Cell col=\"7\" text=\"bind:makerNm\" tooltiptext=\"bind:makerNm\"/><Cell col=\"8\" text=\"bind:modelNm\" tooltiptext=\"bind:modelNm\"/><Cell col=\"9\" text=\"bind:carNo\" tooltiptext=\"bind:carNo\"/><Cell col=\"10\" text=\"bind:matCd\" tooltiptext=\"bind:fuelNm\"/><Cell col=\"11\" text=\"bind:matNm\" tooltiptext=\"bind:fuelNm\"/><Cell col=\"12\" text=\"bind:cntNm\" tooltiptext=\"bind:yrmlNm\"/><Cell col=\"13\" text=\"bind:o2oStockYn\"/><Cell col=\"14\" text=\"bind:mobNo\" expr=\"expr:FN_numberHyphenInReturn(mobNo)\" tooltiptext=\"bind:mobNo\"/><Cell col=\"15\" text=\"bind:agencyNm\"/><Cell col=\"16\" text=\"bind:addr1\"/><Cell col=\"17\" text=\"bind:dlvTel\" expr=\"expr:FN_numberHyphenInReturn(dlvTel)\" tooltiptext=\"bind:dlvTel\"/><Cell col=\"18\" text=\"bind:dlvstatNm\" tooltiptext=\"bind:dlvstatNm\"/><Cell col=\"19\" displaytype=\"date\" text=\"bind:servrqDay\" calendardisplaynulltype=\"none\" tooltiptext=\"bind:servrqDay\"/><Cell col=\"20\" displaytype=\"date\" text=\"bind:procDay\" calendardisplaynulltype=\"none\"/><Cell col=\"21\" text=\"bind:inRoute\"/><Cell col=\"22\" displaytype=\"combo\" text=\"bind:dlvGb\" combodataset=\"ds_C039\" combocodecol=\"cd\" combodatacol=\"cdNm\"/></Band><Band id=\"summary\"><Cell text=\"총계\"/><Cell col=\"1\" style=\"align:right;\" expr=\"dataset.getRowCount()+&quot;(건)&quot;\"/><Cell col=\"2\"/><Cell col=\"3\"/><Cell col=\"4\"/><Cell col=\"5\"/><Cell col=\"6\"/><Cell col=\"7\"/><Cell col=\"8\"/><Cell col=\"9\"/><Cell col=\"10\"/><Cell col=\"11\"/><Cell col=\"12\"/><Cell col=\"13\"/><Cell col=\"14\"/><Cell col=\"15\"/><Cell col=\"16\"/><Cell col=\"17\"/><Cell col=\"18\"/><Cell col=\"19\"/><Cell col=\"20\"/><Cell col=\"21\"/><Cell col=\"22\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Button("btn_search", "absolute", "945", null, null, "25", "16", "735", this);
            obj.set_taborder("7");
            obj.set_text("조회");
            obj.set_cssclass("btn_WF_schArea");
            obj.getSetter("domainId").set("nexa.search");
            this.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "1", "72", "169", "20", null, null, this);
            obj.set_taborder("9");
            obj.set_text("검색결과");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "0", "88", "1147", "10", null, null, this);
            obj.set_taborder("10");
            obj.set_text("Static02");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "1122", "0", "25", "479", null, null, this);
            obj.set_taborder("12");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "0", "0", "1123", "71", null, null, this);
            obj.set_taborder("16");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_dlvrDay", "absolute", "25", "37", "80", "20", null, null, this.div_search);
            obj.set_taborder("118");
            obj.set_text("신청일자");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_dlvrDayF", "absolute", "98", "36", "110", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("119");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_value("null");
            obj.set_editformat("yyyy-MM-dd");
            obj = new Calendar("cal_dlvrDayT", "absolute", "232", "36", "110", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("120");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_editformat("yyyy-MM-dd");
            obj.set_value("null");
            obj = new Static("st01", "absolute", "216", "40", "10", "21", null, null, this.div_search);
            obj.set_taborder("121");
            obj.set_text("~");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static09", "absolute", "1122", "0", "25", "496", null, null, this.div_search);
            obj.set_taborder("124");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static12", "absolute", "0", "72", "1118", "38", null, null, this.div_search);
            obj.set_taborder("128");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static13", "absolute", "703", "0", "31", "96", null, null, this.div_search);
            obj.set_taborder("129");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static14", "absolute", "342", "0", "24", "96", null, null, this.div_search);
            obj.set_taborder("130");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static15", "absolute", "0", "0", "25", "96", null, null, this.div_search);
            obj.set_taborder("131");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_stateCd", "absolute", "367", "37", "80", "21", null, null, this.div_search);
            obj.set_taborder("134");
            obj.set_text("상태");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_stateCd", "absolute", "439", "36", "132", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("138");
            obj.set_autoselect("false");
            obj.set_innerdataset("@ds_stateCd");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj.set_autoskip("false");
            obj.set_index("-1");
            obj = new Static("Static10", "absolute", "0", "31", "1118", "3", null, null, this.div_search);
            obj.set_taborder("139");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "25", "7", "80", "20", null, null, this.div_search);
            obj.set_taborder("142");
            obj.set_text("렌탈지사");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("vkgrpCd", "absolute", "98", "7", "120", "21", null, null, this.div_search);
            obj.set_taborder("143");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("3");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_save00", "absolute", "204", "6", "21", "21", null, null, this.div_search);
            obj.set_taborder("144");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("vkgrpNm", "absolute", "225", "7", "117", "21", null, null, this.div_search);
            obj.set_taborder("145");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("150");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "366", "7", "80", "20", null, null, this.div_search);
            obj.set_taborder("146");
            obj.set_text("렌탈지점");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("vkburCd", "absolute", "440", "7", "120", "21", null, null, this.div_search);
            obj.set_taborder("147");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("4");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_save01", "absolute", "540", "6", "21", "21", null, null, this.div_search);
            obj.set_taborder("148");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("vkburNm", "absolute", "560", "7", "120", "21", null, null, this.div_search);
            obj.set_taborder("149");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("150");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "739", "7", "80", "20", null, null, this.div_search);
            obj.set_taborder("150");
            obj.set_text("장착대리점");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("vkazcCd", "absolute", "826", "7", "120", "21", null, null, this.div_search);
            obj.set_taborder("151");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("10");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_save02", "absolute", "925", "6", "21", "21", null, null, this.div_search);
            obj.set_taborder("152");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("vkazcNm", "absolute", "946", "7", "120", "21", null, null, this.div_search);
            obj.set_taborder("153");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("150");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition00", "absolute", "741", "37", "64", "20", null, null, this.div_search);
            obj.set_taborder("154");
            obj.set_text("계약번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_ordNo", "absolute", "826", "37", "140", "21", null, null, this.div_search);
            obj.set_taborder("155");
            obj.set_inputfilter("space");
            obj.set_lengthunit("ascii");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_custPopUp00", "absolute", "946", "36", "20", "21", null, null, this.div_search);
            obj.set_taborder("156");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "0", "64", "1147", "9", null, null, this);
            obj.set_taborder("22");
            obj.set_text("Static02");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Edit("userId", "absolute", "729", "73", "118", "21", null, null, this);
            obj.set_taborder("23");
            obj.set_enable("false");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Edit("userNm", "absolute", "857", "73", "118", "21", null, null, this);
            obj.set_taborder("24");
            obj.set_enable("false");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Edit("userGrp", "absolute", "985", "73", "118", "21", null, null, this);
            obj.set_taborder("25");
            obj.set_enable("false");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Button("btn_deliveryPop", "absolute", "1036", "73", "80", "21", null, null, this);
            obj.set_taborder("26");
            obj.set_text("배송현황조회");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1123, 71, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("16");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1147, 496, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCMClaim");
            		p.set_titletext("걱정제로 타이어 교체 서비스 내역 조회");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item0","","","dsSdStaus","");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCSZeroChangeService.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCSZeroChangeService.xfdl", function() {
        /***************************************************************************************************
         * 파 일 명 : RTCSEngineOilChangeService.xfdl
         * 설    명 : 걱정제로 교체 서비스 내역 조회
         * 작 성 자 : 김한나
         * 변경이력 :
         * 변경일자		변경자		변경내용
         * ----------	------		--------
         * 2016-02-04	김한나		신규 개발
         * 2017-04-27	wjim		[20170427_01] 걱정제로 신청회차 추가
         * 2017-12-11	wjim		[20171211_01] 상품명 추가
         * 2017-12-18	wjim		[20171218_02] 계약번호 조회조건 추가
         ***************************************************************************************************/ 

        /***********************************************************************
         * Script Include 
         ************************************************************************/
        //include "lib::comLib.xjs";

        /***********************************************************************
         * FORM 변수 선언 영역
        ************************************************************************/

        /***********************************************************************
         * 그룹 변수 선언부
         ************************************************************************/
        this.toDay 	    = ""; 	   //현재날짜
        //-------------------------------------------------------------------------------   
        //폼로드시 공통함수      
        //-------------------------------------------------------------------------------  	 
        this.form_onload = function(obj,e)
        {
        	Ex.core.init(obj); 		
        	this.fn_init();
        } 
        //-------------------------------------------------------------------------------   
        //초기화  
        //------------------------------------------------------------------------------- 	
        this.fn_init = function() {
        	//당월 조회
        	this.fn_getToday();	
        	//
        	//this.fn_init1();
        	//버튼초기화		
        	this.fn_initBtn();
        	//공통코드(상태)
        	this.fn_getStateCode();
        	//선택날짜
        	this.fn_getdateCode();
        	
        	this.fn_userRentalGroupInfo();
        	
        }		  
        /***********************************************************************************
        * Transaction Function
        ***********************************************************************************/
        //-------------------------------------------------------------------------------  	
        //당월 조회
        //-------------------------------------------------------------------------------  	
        this.fn_getToday  = function() {
        	var sSvcID      	= "getToday";  
        	var sController   	= "rtms/comm/getToday.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        			
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 		

        }

        //-------------------------------------------------------------------------------  	
        //공통코드(상태)
        //-------------------------------------------------------------------------------  	
        this.fn_getStateCode  = function(){

        var sSvcID      	= "getStateCode";  
        var sController   	= "ntrms/cs/geteZeroServiceCommCode.do";
        var sInDatasets   	= "";
        var sOutDatasets  	= "ds_stateCd=outputC024";
        var sArgs 			= "";	
        var fn_callBack		= "fn_callBack";

        Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 		
        }

        //-------------------------------------------------------------------------------  	
        //공통코드(선택날짜)
        //-------------------------------------------------------------------------------  	
        this.fn_getdateCode  = function(){
        	 //this.div_search.cb_dateCd.set_index(0);
        	 this.div_search_cb_dateCd_onitemchanged();  	
        }

        //----------------------------------------------------------------------------------
        // Search: 사용자 렌탈그룹 조회
        //----------------------------------------------------------------------------------
        this.fn_userRentalGroupInfo = function()
        {
        	this.dsRentalInfo.clearData();
        	
        	var sSvcID        	= "userRentalGroupInfo";                    
        	var sController   	= "/rtms/sd/userRentalGroupInfo.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "dsRentalInfo=ds_output";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        		sArgs 			+= Ex.util.setParam("userId", application.gds_userInfo.getColumn(0, "userId"));
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }
        	
        	
        //---------------------------------------------------------------------------------
        // 걱정제로 서비스 내역 조회
        //---------------------------------------------------------------------------------	
        this.fn_search = function(obj,e)
        {
        	var userGrp 	= application.gds_userInfo.getColumn(0, "userGrp"); //그룹
        	var bfVkgrp 	= application.gds_userInfo.getColumn(0, "vkgrp"); 	//지사코드
        	var bfVkgrpNm 	= application.gds_userInfo.getColumn(0, "vkgrpNm"); //지사Nm
        	var bfVkbur 	= application.gds_userInfo.getColumn(0, "vkbur"); 	//지점코드
        	var bfVkburNm 	= application.gds_userInfo.getColumn(0, "vkburNm"); //지점NM
        	var afVkgrp 	= this.div_search.vkgrpCd.value; 					//팝업 지사코드
        	var afVkgrpNm 	= this.div_search.vkgrpNm.value; 					//팝업 지사Nm
        	var afVkbur 	= this.div_search.vkburCd.value; 					//팝업 지점코드
        	var afVkburNm 	= this.div_search.vkburNm.value; 					//팝업 지점Nm
        	
        	/* 렌탈지사지점 Check 해제 */
        // 	if(Eco.isEmpty(afVkgrp)) {
        // 		this.alert("렌탈지사를 선택하세요.");
        // 		return false;
        // 	}
        // 	
        // 	if(Eco.isEmpty(afVkbur)) {
        // 		this.alert("렌탈지점을 선택하세요.");
        // 		return false;
        // 	}
        	
        	if(userGrp == '04') { //지점
        		if(bfVkgrp != afVkgrp || bfVkgrpNm != afVkgrpNm) {
        			alert("타 조직내역 조회 불가합니다.");
        			return;
        		}
        		if(bfVkbur != afVkbur || bfVkburNm != afVkburNm) {
        			alert("타 조직내역 조회 불가합니다.");
        			return;
        		}
        	}
        	
        	if(userGrp == '03' || userGrp == '07') { //지사
        		if(bfVkgrp != afVkgrp || bfVkgrpNm != afVkgrpNm) {
        			alert("타 조직내역 조회 불가합니다.");
        			return;
        		}
        	}	

        	if (this.fn_getValid()) {	    
        		var dlvrDayF  		= nvl(this.div_search.cal_dlvrDayF.value);	//당월1일
        		var dlvrDayT 		= nvl(this.div_search.cal_dlvrDayT.value);	//현재일
        		var dlvStat         = nvl(this.div_search.cb_stateCd.value);	//상태
        		var salesGroup 		= "";		//지사
        		var salesOffice 	= "";		//지점
        		var agencyCd 		= nvl(this.div_search.vkazcCd.value);		//장착대리점				
        		var ordNo   		= nvl(this.div_search.ed_ordNo.text);		//계약번호 [20171218_02]
        		
        		var rentalGroup 	= nvl(this.div_search.vkgrpCd.value); 	//렌탈지사
        		var rentalOffice 	= nvl(this.div_search.vkburCd.value); 	//렌탈지점
        		var userId      	= application.gds_userInfo.getColumn(0, "userId"); //사용자ID
        		
        		/* 렌탈지사지점 Check 해제 */
        // 		if (rentalGroup == "" || rentalGroup == null)
        // 		{
        // 			alert("렌탈지사를 선택하세요.");
        // 			return false;
        // 		}
        // 		if (rentalOffice == "" || rentalOffice == null)
        // 		{
        // 			alert("렌탈지점을 선택하세요.");
        // 			return false;
        // 		}
        				
        		var sSvcID        	= "zeroChangeServiceList";                    
        		var sController   	= "nrtms/cs/zeroChangeServiceList.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_list=output";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		sArgs += Ex.util.setParam("dlvrDayF"   , dlvrDayF);
        		sArgs += Ex.util.setParam("dlvrDayT"   , dlvrDayT);
        		sArgs += Ex.util.setParam("dlvStat"    , dlvStat);
        		sArgs += Ex.util.setParam("ordNo"      , ordNo);
        		sArgs += Ex.util.setParam("custNo"     , "");			
        		sArgs += Ex.util.setParam("salesGroup" , salesGroup);
        		sArgs += Ex.util.setParam("salesOffice", salesOffice);
        		sArgs += Ex.util.setParam("agencyCd"   , agencyCd);	
        		sArgs += Ex.util.setParam("rentalGroup", rentalGroup);
        		sArgs += Ex.util.setParam("rentalOffice", rentalOffice);
        		sArgs += Ex.util.setParam("userId", userId);			
        					
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}	
        	
        }
        //---------------------------------------------------------------------------------
        // 엑셀
        //---------------------------------------------------------------------------------
        this.fn_excel= function() {
        	Ex.core.exportExcel(this, this.grd_list);  
        }

        

        /***********************************************************************************
        * CallBack Event (strSvcId - Sevice ID, nErrorCode - ErrorCode, strErrorMsg - Error Message)
        ***********************************************************************************/
        //-------------------------------------------------------------------------------  	
        // callBack함수 
        //------------------------------------------------------------------------------- 
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg)
        { 
        	if (nErrorCode < 0) {
        		alert(strErrorMsg);		
        		return;
        	}
        		
        	if (strSvcId == "userRentalGroupInfo"){		
        		if (this.dsRentalInfo.getColumn(0, "rentalGroup") == "" || this.dsRentalInfo.getColumn(0, "rentalGroup") == null) return;
        		
        		this.fn_init1();
        	}

        	switch (strSvcId) 
        	{
        	
        		 //신청일자 
        		 case "getToday":
        			var sFirstDay = Eco.date.getFirstDate(this.toDay);
        			this.div_search.cal_dlvrDayF.set_value(sFirstDay);
        			this.div_search.cal_dlvrDayT.set_value(this.toDay);
        			this.div_search.cal_downDay.set_value(this.toDay);
        		 break;
        		 case "getStateCode":
        			this.div_search.cb_stateCd.set_value(" ");
        		 break;
        		 //신청일자 검색결과				
        		case "zeroChangeServiceList":
        			if(this.ds_list.rowcount == 0) {
        			   this.div_search.grd_list.set_nodatatext("조회된 데이터가 없습니다.");
        			}
        			break;
        	/*	//집계일자 검색결과				
        		case "engineOilChangeServiceDownList":
        			if(this.ds_list.rowcount == 0) {
        			   this.div_search.grd_list.set_nodatatext("조회된 데이터가 없습니다.");
        			}
        			break;
        		case "engineOilChangeServiceExcelDown":	
        			alert('엔진오일 교체신청 대상 집계 처리 합니다.');			
        			break;	*/	
        	}	
        }

        //체크여부
        this.fn_getValid = function(){
        	if(nvl(this.div_search.cal_dlvrDayF.value) == "" || nvl(this.div_search.cal_dlvrDayT.value) == "")
        	{
        		alert('신청일자을 다시 입력하세요');
        		this.div_search.cal_procDayF.setFocus();
        		return false;
        	}else{
        		return true;
        	}	
        	
        	if(parseInt(nvl(this.div_search.cal_dlvrDayF.value)) > parseInt(nvl(this.div_search.cal_dlvrDayT.value)))
        	{
        		alert('신청일자을 다시 입력하세요');
        		this.div_search.cal_dlvrDayF.setFocus();
        		return false;
        	}
          
        	return true;
        }

        
        /***********************************************************************************
        * User Function
        ***********************************************************************************/
        //---------------------------------------------------------------------------------
        // 버튼생성
        //---------------------------------------------------------------------------------
        this.fn_initBtn  = function() {
        	/* 1. N : 신규추가
        	 * 2. S : 조회
        	 * 3. C : 데이타생성
        	 * 4. E : 엑셀데이타생성
        	 * 5. AG: 집계
        	 * 6. DN: 다운
        	 */	
        	this.parent.setButton("E|S|",this);		
        }

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_init1 = function(){

        	var userId = application.gds_userInfo.getColumn(0, "userId"); 	//id
        	var userNm = application.gds_userInfo.getColumn(0, "userNm"); 	//이름
        	var userGrp = application.gds_userInfo.getColumn(0, "userGrp"); //그룹
        	
        	var vkgrp = this.dsRentalInfo.getColumn(0, "rentalGroup"); 	//지사코드
        	var vkgrpNm = this.dsRentalInfo.getColumn(0, "rentalGroupNm"); //지사Nm
        	var vkbur = this.dsRentalInfo.getColumn(0, "rentalOffice"); 	//지점코드
        	var vkburNm = this.dsRentalInfo.getColumn(0, "rentalOfficeNm"); //지점NM
        	
        	var vkazc = application.gds_userInfo.getColumn(0, "vkazc");	 	//대리점
        	var vkazcNm = application.gds_userInfo.getColumn(0, "vkazcNm"); //대리점NM
        	
        	this.userId.set_value(userId);
        	this.userNm.set_value(userNm);
        	this.userGrp.set_value(userGrp);
        	
        	if(userGrp != '01' && userGrp != 'RM'){ 
        	
        		this.div_search.vkgrpCd.set_enable(false); 		//지사code 비활성
        		this.div_search.vkgrpNm.set_enable(false); 		//지사name 비활성
        		this.div_search.btn_save00.set_visible(false); 	//지사button visible
        		this.div_search.vkburCd.set_enable(false); 		//지점code 비활성 
        		this.div_search.vkburNm.set_enable(false); 		//지점name 비활성
        		this.div_search.btn_save01.set_visible(false); 	//지점button visible
        		this.div_search.vkazcCd.set_enable(false); 		//장착대리점code 비활성
        		this.div_search.vkazcNm.set_enable(false); 		//장착대리점name 비활성
        		this.div_search.btn_save02.set_visible(false); 	//장착대리점button visible
        		
        		this.div_search.vkgrpCd.set_value(vkgrp);
        		this.div_search.vkgrpNm.set_value(vkgrpNm);
        		this.div_search.vkburCd.set_value(vkbur);
        		this.div_search.vkburNm.set_value(vkburNm);
        		this.div_search.vkazcCd.set_value(userId);	
        		this.div_search.vkazcNm.set_value(userNm);
        	}
        	/*
        	var userId = application.gds_userInfo.getColumn(0, "userId"); 	//id
        	var userNm = application.gds_userInfo.getColumn(0, "userNm"); 	//이름
        	var userGrp = application.gds_userInfo.getColumn(0, "userGrp"); //그룹
        	var vkgrp = application.gds_userInfo.getColumn(0, "vkgrp"); 	//지사코드
        	var vkgrpNm = application.gds_userInfo.getColumn(0, "vkgrpNm"); //지사Nm
        	var vkbur = application.gds_userInfo.getColumn(0, "vkbur"); 	//지점코드
        	var vkburNm = application.gds_userInfo.getColumn(0, "vkburNm"); //지점NM
        	var vkazc = application.gds_userInfo.getColumn(0, "vkazc");	 	//대리점
        	var vkazcNm = application.gds_userInfo.getColumn(0, "vkazcNm"); //대리점NM
        	
        	this.userId.set_value(userId);
        	this.userNm.set_value(userNm);
        	this.userGrp.set_value(userGrp);
        	
        	if(userGrp == '05'){ 
        		this.div_search.vkgrpCd.set_enable(false); 		//지사code 비활성
        		this.div_search.vkgrpNm.set_enable(false); 		//지사name 비활성
        		this.div_search.btn_save00.set_visible(false); 	//지사button visible
        		this.div_search.vkburCd.set_enable(false); 		//지점code 비활성 
        		this.div_search.vkburNm.set_enable(false); 		//지점name 비활성
        		this.div_search.btn_save01.set_visible(false); 	//지점button visible
        		this.div_search.vkazcCd.set_enable(false); 		//장착대리점code 비활성
        		this.div_search.vkazcNm.set_enable(false); 		//장착대리점name 비활성
        		this.div_search.btn_save02.set_visible(false); 	//장착대리점button visible
        		
        		this.div_search.vkgrpCd.set_value(vkgrp);
        		this.div_search.vkgrpNm.set_value(vkgrpNm);
        		this.div_search.vkburCd.set_value(vkbur);
        		this.div_search.vkburNm.set_value(vkburNm);
        		this.div_search.vkazcCd.set_value(userId);	
        		this.div_search.vkazcNm.set_value(userNm);
        	}else if(userGrp == '04'){
        		this.div_search.vkgrpCd.set_enable(false);	 	//지사code 비활성
        		this.div_search.vkgrpNm.set_enable(false); 		//지사name 비활성
        		this.div_search.btn_save00.set_visible(false); 	//지사button visible
        		this.div_search.vkburCd.set_enable(false); 		//지점code 비활성 
        		this.div_search.vkburNm.set_enable(false); 		//지점name 비활성
        		this.div_search.btn_save01.set_visible(false); 	//지점button visible
        		
        		this.div_search.vkgrpCd.set_value(vkgrp);
        		this.div_search.vkgrpNm.set_value(vkgrpNm);
        		this.div_search.vkburCd.set_value(vkbur);
        		this.div_search.vkburNm.set_value(vkburNm);
        		
        	} else if(userGrp == '03' || userGrp == '07') { 	//지사
        		this.div_search.vkgrpCd.set_enable(false); 		//지사code 비활성
        		this.div_search.vkgrpNm.set_enable(false); 		//지사name 비활성
        		this.div_search.btn_save00.set_visible(false); 	//지사button visible
        		this.div_search.vkburCd.set_enable(false); 		//지점code 비활성 
        		this.div_search.vkburNm.set_enable(false); 		//지점name 비활성
        		this.div_search.btn_save01.set_visible(false); 	//지점button visible
        		
        		this.div_search.vkgrpCd.set_value(vkgrp);
        		this.div_search.vkgrpNm.set_value(vkgrpNm);
        	}
        	*/
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_cb_dateCd_onitemchanged = function(obj,e)
        {
        		 this.ds_list.clearData(); 
        		//신청일자
        		this.div_search.st_dlvrDay.set_visible(true);
        		this.div_search.cal_dlvrDayF.set_visible(true);
        		this.div_search.st01.set_visible(true);
        		this.div_search.cal_dlvrDayT.set_visible(true);
        		
        		this.div_search.st_stateCd.set_visible(true);
        		this.div_search.cb_stateCd.set_visible(true);
        		
        		//집계일자
        		//this.div_search.st_downDay.set_visible(false);
        		//this.div_search.cal_downDay.set_visible(false);
        		
        		this.parent.setButton("E|S|",this);		
        	/*if( this.div_search.cb_dateCd.value == "01"){
        		
        		 this.ds_list.clearData(); 
        		//신청일자
        		this.div_search.st_dlvrDay.set_visible(true);
        		this.div_search.cal_dlvrDayF.set_visible(true);
        		this.div_search.st01.set_visible(true);
        		this.div_search.cal_dlvrDayT.set_visible(true);
        		
        		this.div_search.st_stateCd.set_visible(true);
        		this.div_search.cb_stateCd.set_visible(true);
        		
        		//집계일자
        		//this.div_search.st_downDay.set_visible(false);
        		//this.div_search.cal_downDay.set_visible(false);
        		
        		this.parent.setButton("E|S|",this);	

        	}else{
        	
        		this.ds_list.clearData(); 
        		//신청일자
        		this.div_search.st_dlvrDay.set_visible(false);
        		this.div_search.cal_dlvrDayF.set_visible(false);
        		this.div_search.st01.set_visible(false);
        		this.div_search.cal_dlvrDayT.set_visible(false);
        		
        		this.div_search.st_stateCd.set_visible(false);
        		this.div_search.cb_stateCd.set_visible(false);
        		
        		//집계일자
        		this.div_search.st_downDay.set_visible(true);
        		this.div_search.cal_downDay.set_visible(true);
        		this.div_search.cal_downDay.set_enable(false);
        		
        		this.parent.setButton("E|AG|S",this);	
        	}*/
        }

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.showVkgrp = function(obj,e){
          var args ={p_arg:"RTSDOrder"};
          Ex.core.popup(this,"지사 조회","comm::RTCOMMVkgrp_pop.xfdl",args,"modaless=false");
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.showVkbur = function(obj,e){
        	var args ={p_arg:"RTSDOrder", p_rentalGroup: this.div_search.vkgrpCd.value};
        	Ex.core.popup(this,"지점 조회","comm::RTCOMMVkbur_pop.xfdl",args,"modaless=false");
        }
        this._setReturn = function(val){
        	var cd = val[0];
        	var nm = val[1];
        	var gb = val[2];
        	if(gb == "vkgrp") {
        		this.div_search.vkgrpCd.set_value(cd);
        		this.div_search.vkgrpNm.set_value(nm);
        	} else if(gb == "vkbur" ) {
        		this.div_search.vkburCd.set_value(cd);
        		this.div_search.vkburNm.set_value(nm);
        	} else if(gb == "vkazc" ) {
        		this.div_search.vkazcCd.set_value(cd);
        		this.div_search.vkazcNm.set_value(nm);
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.showVkazc = function(obj,e){
        	var args = {p_vkgrpCd:this.div_search.vkgrpCd.value, p_vkgrpNm:this.div_search.vkgrpNm.value, 
        				p_vkburCd:this.div_search.vkburCd.value, p_vkburNm:this.div_search.vkburNm.value, 
        				p_formId : "RTSDOrder"};
        	Ex.core.popup(this,"대리점 조회","comm::RTCOMMAgency_pop.xfdl",args,"modaless=false");
        }
        this.return_agency = function(arr) {
        	this.div_search.vkgrpNm.set_value(arr[0]);
        	this.div_search.vkgrpCd.set_value(arr[1]);
        	this.div_search.vkburNm.set_value(arr[2]);
        	this.div_search.vkburCd.set_value(arr[3]);
        	this.div_search.vkazcNm.set_value(arr[4]);
        	this.div_search.vkazcCd.set_value(arr[5]);
        }

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

        /**
         * 계약번호 찾기 버튼 클릭 이벤트 처리 [20171218_02]
         * - 계약번호 조회 화면 팝업
         */
        this.div_search_btn_custPopUp00_onclick = function(obj,e) {
        	var args ={ p_arg : "RTCSRegularCheck" };
        	Ex.core.popup(this,"계약번호 조회","comm::RTCOMMOrderNo_pop.xfdl",args, "modaless=false");	
        }

        /**
         * 계약번호 찾기 결과 처리 [20171218_02]
         */
        this.returnOrderNoInfo = function(ordNo){
        	this.div_search.ed_ordNo.set_value(ordNo);
        }

        this.btn_deliveryPop_onclick = function(obj,e)
        {
        	if(this.ds_list.rowcount == 0){
        		alert("선택된 계약건이 없습니다.");
        		return;
        	}
        	
        	var reqNum = nvl(this.ds_list.getColumn(this.ds_list.rowposition, "reqNum"));
        	if(reqNum == "0"){
        		alert("취소된 계약입니다.");
        		return;
        	}
        	
        	var ordNo = nvl(this.ds_list.getColumn(this.ds_list.rowposition, "ordNo")) + "_" + reqNum;
        	var args = {  ordNo :   ordNo , reqNum : reqNum };
        	Ex.core.popup(this,"배송조회팝업","comm::RTCOMMDeliveryBoard_pop.xfdl",args, "modaless=false");
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.btn_search.addEventHandler("onclick", this.fn_search, this);
            this.div_search.cal_dlvrDayF.addEventHandler("oneditclick", this.div_search_cal_slcmFr_oneditclick, this);
            this.div_search.vkgrpCd.addEventHandler("onkeyup", this.div_search_vkgrpCd_onkeyup, this);
            this.div_search.btn_save00.addEventHandler("onclick", this.showVkgrp, this);
            this.div_search.vkburCd.addEventHandler("onkeyup", this.div_search_vkburCd_onkeyup, this);
            this.div_search.btn_save01.addEventHandler("onclick", this.showVkbur, this);
            this.div_search.vkazcCd.addEventHandler("onkeyup", this.div_search_vkazcCd_onkeyup, this);
            this.div_search.btn_save02.addEventHandler("onclick", this.showVkazc, this);
            this.div_search.ed_ordNo.addEventHandler("onkeydown", this.div_search_ed_ordNo_onkeydown, this);
            this.div_search.btn_custPopUp00.addEventHandler("onclick", this.div_search_btn_custPopUp00_onclick, this);
            this.btn_deliveryPop.addEventHandler("onclick", this.btn_deliveryPop_onclick, this);

        };

        this.loadIncludeScript("RTCSZeroChangeService.xfdl");

       
    };
}
)();
