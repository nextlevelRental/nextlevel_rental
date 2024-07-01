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
                this.set_name("RTCSEngineOilChangeService");
                this.set_classname("RTCMClaim");
                this.set_titletext("엔진오일 교체 서비스 내역 조회");
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
            obj._setContents("<ColumnInfo><Column id=\"dlvrDay\" type=\"STRING\" size=\"256\"/><Column id=\"dlvrSeq\" type=\"STRING\" size=\"0\"/><Column id=\"ordNo\" type=\"STRING\" size=\"0\"/><Column id=\"custNo\" type=\"STRING\" size=\"0\"/><Column id=\"custNm\" type=\"STRING\" size=\"0\"/><Column id=\"makerCd\" type=\"STRING\" size=\"256\"/><Column id=\"makerNm\" type=\"STRING\" size=\"256\"/><Column id=\"modelCd\" type=\"STRING\" size=\"256\"/><Column id=\"modelNm\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"fuelCd\" type=\"STRING\" size=\"256\"/><Column id=\"fuelNm\" type=\"STRING\" size=\"256\"/><Column id=\"yrmlCd\" type=\"STRING\" size=\"256\"/><Column id=\"yrmlNm\" type=\"STRING\" size=\"256\"/><Column id=\"dsplmtCd\" type=\"STRING\" size=\"256\"/><Column id=\"dsplmtNm\" type=\"STRING\" size=\"256\"/><Column id=\"dlvGb\" type=\"STRING\" size=\"256\"/><Column id=\"dlvgbNm\" type=\"STRING\" size=\"256\"/><Column id=\"consignee\" type=\"STRING\" size=\"256\"/><Column id=\"posCd\" type=\"STRING\" size=\"0\"/><Column id=\"addr1\" type=\"STRING\" size=\"0\"/><Column id=\"addr2\" type=\"STRING\" size=\"0\"/><Column id=\"dlvTel\" type=\"STRING\" size=\"0\"/><Column id=\"dlvDesc\" type=\"STRING\" size=\"256\"/><Column id=\"dlvStat\" type=\"STRING\" size=\"256\"/><Column id=\"dlvstatNm\" type=\"STRING\" size=\"256\"/><Column id=\"dlvEnt\" type=\"STRING\" size=\"256\"/><Column id=\"trspDoc\" type=\"STRING\" size=\"256\"/><Column id=\"servSeq\" type=\"STRING\" size=\"256\"/><Column id=\"agencyCd\" type=\"STRING\" size=\"256\"/><Column id=\"servrqDay\" type=\"STRING\" size=\"256\"/><Column id=\"downDay\" type=\"STRING\" size=\"256\"/><Column id=\"dlvsDay\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"agencyNm\" type=\"STRING\" size=\"256\"/><Column id=\"carId\" type=\"STRING\" size=\"256\"/><Column id=\"userGrpNm\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroup\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOffice\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroupNm\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOfficeNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
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


            
            // UI Components Initialize
            obj = new Button("btn_search", "absolute", "945", null, null, "25", "16", "735", this);
            obj.set_taborder("7");
            obj.set_text("조회");
            obj.set_cssclass("btn_WF_schArea");
            obj.getSetter("domainId").set("nexa.search");
            this.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "1", "121", "169", "20", null, null, this);
            obj.set_taborder("9");
            obj.set_text("검색결과");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "0", "137", "1147", "10", null, null, this);
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

            obj = new Div("div_search", "absolute", "0", "0", "1121", "104", null, null, this);
            obj.set_taborder("16");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_dlvrDay", "absolute", "377", "41", "80", "20", null, null, this.div_search);
            obj.set_taborder("9");
            obj.set_text("신청일자");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_dlvrDayF", "absolute", "453", "40", "110", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("10");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_value("null");
            obj.set_editformat("yyyy-MM-dd");
            obj = new Calendar("cal_dlvrDayT", "absolute", "582", "40", "110", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("11");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_editformat("yyyy-MM-dd");
            obj.set_value("null");
            obj = new Static("st01", "absolute", "566", "44", "10", "21", null, null, this.div_search);
            obj.set_taborder("12");
            obj.set_text("~");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static09", "absolute", "1122", "0", "25", "496", null, null, this.div_search);
            obj.set_taborder("13");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static12", "absolute", "0", "63", "1118", "7", null, null, this.div_search);
            obj.set_taborder("14");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static13", "absolute", "703", "0", "31", "106", null, null, this.div_search);
            obj.set_taborder("15");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static14", "absolute", "344", "0", "30", "106", null, null, this.div_search);
            obj.set_taborder("16");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static15", "absolute", "0", "0", "25", "106", null, null, this.div_search);
            obj.set_taborder("17");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_stateCd", "absolute", "739", "41", "80", "21", null, null, this.div_search);
            obj.set_taborder("18");
            obj.set_text("상태");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_stateCd", "absolute", "809", "41", "132", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("19");
            obj.set_autoselect("false");
            obj.set_innerdataset("@ds_stateCd");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj.set_autoskip("false");
            obj.set_index("-1");
            obj = new Static("Static10", "absolute", "0", "31", "1118", "6", null, null, this.div_search);
            obj.set_taborder("20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_dateCd", "absolute", "114", "40", "155", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("21");
            obj.set_innerdataset("ds_dateCd");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj.set_index("-1");
            obj = new Static("st_downDay", "absolute", "377", "41", "80", "20", null, null, this.div_search);
            obj.set_taborder("24");
            obj.set_text("집계일자");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_downDay", "absolute", "453", "41", "110", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("25");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Static("st_downDay00", "absolute", "35", "42", "80", "20", null, null, this.div_search);
            obj.set_taborder("26");
            obj.set_text("일자구분");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "378", "7", "62", "20", null, null, this.div_search);
            obj.set_taborder("27");
            obj.set_text("렌탈지점");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "739", "7", "80", "20", null, null, this.div_search);
            obj.set_taborder("28");
            obj.set_text("대리점");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("vkgrpNm", "absolute", "222", "7", "105", "21", null, null, this.div_search);
            obj.set_taborder("0");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("150");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("vkgrpCd", "absolute", "114", "7", "108", "21", null, null, this.div_search);
            obj.set_taborder("1");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("3");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "35", "7", "67", "20", null, null, this.div_search);
            obj.set_taborder("2");
            obj.set_text("렌탈지사");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("vkburCd", "absolute", "453", "7", "120", "21", null, null, this.div_search);
            obj.set_taborder("3");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("4");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("vkburNm", "absolute", "573", "7", "120", "21", null, null, this.div_search);
            obj.set_taborder("4");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("150");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_save01", "absolute", "553", "6", "21", "21", null, null, this.div_search);
            obj.set_taborder("5");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("vkazcCd", "absolute", "809", "7", "120", "21", null, null, this.div_search);
            obj.set_taborder("6");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("10");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_save02", "absolute", "908", "7", "21", "21", null, null, this.div_search);
            obj.set_taborder("7");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("vkazcNm", "absolute", "929", "7", "120", "21", null, null, this.div_search);
            obj.set_taborder("8");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("150");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_save00", "absolute", "201", "7", "21", "21", null, null, this.div_search);
            obj.set_taborder("29");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition00", "absolute", "35", "74", "64", "20", null, null, this.div_search);
            obj.set_taborder("30");
            obj.set_text("계약번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_ordNo", "absolute", "114", "74", "136", "21", null, null, this.div_search);
            obj.set_taborder("31");
            obj.set_inputfilter("space");
            obj.set_lengthunit("ascii");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_custPopUp00", "absolute", "249", "73", "20", "21", null, null, this.div_search);
            obj.set_taborder("32");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "0", "105", "1147", "20", null, null, this);
            obj.set_taborder("22");
            obj.set_text("Static02");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Edit("userGrp", "absolute", "977", "73", "118", "21", null, null, this);
            obj.set_taborder("33");
            obj.set_enable("false");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Edit("userNm", "absolute", "857", "73", "118", "21", null, null, this);
            obj.set_taborder("34");
            obj.set_enable("false");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Edit("userId", "absolute", "737", "73", "118", "21", null, null, this);
            obj.set_taborder("35");
            obj.set_enable("false");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_list", "absolute", "0", "147", "1122", null, null, "10", this);
            obj.set_taborder("36");
            obj.set_binddataset("ds_list");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"80\"/><Column size=\"100\"/><Column size=\"90\"/><Column size=\"90\"/><Column size=\"90\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"200\"/><Column size=\"80\"/><Column size=\"300\"/><Column size=\"300\"/><Column size=\"120\"/><Column size=\"70\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"100\"/><Column size=\"80\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"73\"/><Column size=\"73\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"30\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"접수일자\"/><Cell col=\"1\" text=\"순번\"/><Cell col=\"2\" text=\"계약번호\"/><Cell col=\"3\" text=\"렌탈지사\"/><Cell col=\"4\" text=\"렌탈지점\"/><Cell col=\"5\" text=\"고객번호\"/><Cell col=\"6\" text=\"고객명\"/><Cell col=\"7\" text=\"제조사\"/><Cell col=\"8\" text=\"차종\"/><Cell col=\"9\" text=\"차량 No\"/><Cell col=\"10\" text=\"유종\"/><Cell col=\"11\" text=\"연식\"/><Cell col=\"12\" text=\"배기량\"/><Cell col=\"13\" text=\"배송지구분\"/><Cell col=\"14\" text=\"수취인\"/><Cell col=\"15\" text=\"우편번호\"/><Cell col=\"16\" text=\"배송지 주소\"/><Cell col=\"17\" text=\"상세주소\"/><Cell col=\"18\" text=\"고객 핸드폰 번호\"/><Cell col=\"19\" text=\"대리점코드\"/><Cell col=\"20\" text=\"대리점\"/><Cell col=\"21\" text=\"배송지 연락처\"/><Cell col=\"22\" text=\"택배사\"/><Cell col=\"23\" text=\"운송장 번호\"/><Cell col=\"24\" text=\"운송장등록일자\"/><Cell col=\"25\" text=\"상태\"/><Cell col=\"26\" text=\"교체예정일자\"/><Cell col=\"27\" text=\"처리완료일자\"/><Cell col=\"28\" text=\"차대번호\"/><Cell col=\"29\" text=\"신청경로\"/></Band><Band id=\"body\"><Cell displaytype=\"date\" text=\"bind:dlvrDay\" calendardisplaynulltype=\"none\" tooltiptext=\"bind:dlvrDay\"/><Cell col=\"1\" text=\"bind:dlvrSeq\" tooltiptext=\"bind:dlvrSeq\"/><Cell col=\"2\" displaytype=\"text\" edittype=\"readonly\" text=\"bind:ordNo\" tooltiptext=\"bind:ordNo\"/><Cell col=\"3\" displaytype=\"text\" edittype=\"readonly\" text=\"bind:rentalGroupNm\" tooltiptext=\"bind:custNo\"/><Cell col=\"4\" displaytype=\"text\" edittype=\"readonly\" text=\"bind:rentalOfficeNm\" tooltiptext=\"bind:custNo\"/><Cell col=\"5\" displaytype=\"text\" edittype=\"readonly\" text=\"bind:custNo\" tooltiptext=\"bind:custNo\"/><Cell col=\"6\" text=\"bind:custNm\" tooltiptext=\"bind:custNm\"/><Cell col=\"7\" text=\"bind:makerNm\" tooltiptext=\"bind:makerNm\"/><Cell col=\"8\" text=\"bind:modelNm\" tooltiptext=\"bind:modelNm\"/><Cell col=\"9\" text=\"bind:carNo\" tooltiptext=\"bind:carNo\"/><Cell col=\"10\" text=\"bind:fuelNm\" tooltiptext=\"bind:fuelNm\"/><Cell col=\"11\" text=\"bind:yrmlNm\" tooltiptext=\"bind:yrmlNm\"/><Cell col=\"12\" text=\"bind:dsplmtNm\" tooltiptext=\"bind:dsplmtNm\"/><Cell col=\"13\" text=\"bind:dlvgbNm\" tooltiptext=\"bind:dlvgbNm\"/><Cell col=\"14\" text=\"bind:consignee\" tooltiptext=\"bind:consignee\"/><Cell col=\"15\" text=\"bind:posCd\" tooltiptext=\"bind:posCd\"/><Cell col=\"16\" text=\"bind:addr1\" tooltiptext=\"bind:addr1\"/><Cell col=\"17\" style=\"align:left;\" text=\"bind:addr2\" tooltiptext=\"bind:addr2\"/><Cell col=\"18\" text=\"bind:mobNo\" expr=\"expr:FN_numberHyphenInReturn(mobNo)\" tooltiptext=\"bind:mobNo\"/><Cell col=\"19\" text=\"bind:agencyCd\"/><Cell col=\"20\" style=\"align: ;\" text=\"bind:agencyNm\" tooltiptext=\"bind:agencyNm\"/><Cell col=\"21\" text=\"bind:dlvTel\" expr=\"expr:FN_numberHyphenInReturn(dlvTel)\" tooltiptext=\"bind:dlvTel\"/><Cell col=\"22\" text=\"bind:dlvEnt\" tooltiptext=\"bind:dlvEnt\"/><Cell col=\"23\" text=\"bind:trspDoc\" tooltiptext=\"bind:trspDoc\"/><Cell col=\"24\" displaytype=\"date\" text=\"bind:dlvsDay\" calendardisplaynulltype=\"none\" tooltiptext=\"bind:dlvsDay\"/><Cell col=\"25\" text=\"bind:dlvstatNm\" tooltiptext=\"bind:dlvstatNm\"/><Cell col=\"26\" displaytype=\"date\" text=\"bind:servrqDay\" calendardisplaynulltype=\"none\" tooltiptext=\"bind:servrqDay\"/><Cell col=\"27\" displaytype=\"date\" text=\"bind:procDay\" calendardisplaynulltype=\"none\" tooltiptext=\"bind:procDay\"/><Cell col=\"28\" displaytype=\"text\" edittype=\"readonly\" text=\"bind:carId\" tooltiptext=\"bind:carId\"/><Cell col=\"29\" text=\"bind:userGrpNm\" tooltiptext=\"bind:userGrpNm\"/></Band><Band id=\"summary\"><Cell text=\"총계\"/><Cell col=\"1\" style=\"align:right;\" expr=\"dataset.getRowCount()+&quot;(건)&quot;\"/><Cell col=\"2\"/><Cell col=\"3\"/><Cell col=\"4\"/><Cell col=\"5\"/><Cell col=\"6\"/><Cell col=\"7\"/><Cell col=\"8\"/><Cell col=\"9\"/><Cell col=\"10\"/><Cell col=\"11\"/><Cell col=\"12\"/><Cell col=\"13\"/><Cell col=\"14\"/><Cell col=\"15\"/><Cell col=\"16\"/><Cell col=\"17\"/><Cell col=\"18\"/><Cell col=\"19\"/><Cell col=\"20\"/><Cell col=\"21\"/><Cell col=\"22\"/><Cell col=\"23\"/><Cell col=\"24\"/><Cell col=\"25\"/><Cell col=\"26\"/><Cell col=\"27\"/><Cell col=\"28\"/><Cell col=\"29\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1121, 104, this.div_search,
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
            		p.set_titletext("엔진오일 교체 서비스 내역 조회");

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
        this.addIncludeScript("RTCSEngineOilChangeService.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCSEngineOilChangeService.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분 : 엔진오일 교체 서비스 내역 조회
         * 02. 그룹명   : RTCSEngineOilChangeService.xfdl
         * 03. 그룹설명 :
         * 04. 작성일   : 2015.12.14
         * 05. 작성자   : 윤용택
         * 06. 수정이력 :
         ***********************************************************************
         *     수정일     작성자   내용
         ***********************************************************************
         *
         ***********************************************************************
         */

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
        		//버튼초기화		
        		this.fn_initBtn();
        		//공통코드(상태)
        		this.fn_getStateCode();
        		//선택날짜
        		this.fn_getdateCode();
        		//검색초기화 
        		//this.fn_init1();
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
        	var sController   	= "ntrms/cs/getengineOilChangeServiceCommCode.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_stateCd=outputC019";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 		
        	}
        	
        	//-------------------------------------------------------------------------------  	
        	//공통코드(선택날짜)
            //-------------------------------------------------------------------------------  	
        	this.fn_getdateCode  = function(){
        	     this.div_search.cb_dateCd.set_index(0);
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
        	// 엔진오일 교체 서비스 내역 조회
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
        // 		if(Eco.isEmpty(afVkgrp)) {
        // 			this.alert("렌탈지사를 선택하세요.");
        // 			return false;
        // 		}
        // 		
        // 		if(Eco.isEmpty(afVkbur)) {
        // 			this.alert("렌탈지점을 선택하세요.");
        // 			return false;
        // 		}
        		
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
        		
        		if ( this.div_search.cb_dateCd.value == "01")
        		{
        			if( this.fn_getValid()) 
        			{	    
        				var dlvrDayF  		= nvl(this.div_search.cal_dlvrDayF.value); //당월1일
        				var dlvrDayT 		= nvl(this.div_search.cal_dlvrDayT.value); //현재일
        				var dlvStat         = nvl(this.div_search.cb_stateCd.value);   //상태
        				var salesGroup 		= ""; 	//지사
        				var salesOffice 	= ""; 	//지점
        				var agencyCd 		= nvl(this.div_search.vkazcCd.value); 	//장착대리점		
        				var ordNo			= nvl(this.div_search.ed_ordNo.value); 	//주문번호추가 20160407 한승훈 
        					
        				var rentalGroup 	= nvl(this.div_search.vkgrpCd.value); 	//렌탈지사
        				var rentalOffice 	= nvl(this.div_search.vkburCd.value); 	//렌탈지점
        				var userId      	= application.gds_userInfo.getColumn(0, "userId"); //사용자ID
        				
        				/* 렌탈지사지점 Check 해제 */
        // 				if (rentalGroup == "" || rentalGroup == null)
        // 				{
        // 					alert("렌탈지사를 선택하세요.");
        // 					return false;
        // 				}
        // 				if (rentalOffice == "" || rentalOffice == null)
        // 				{
        // 					alert("렌탈지점을 선택하세요.");
        // 					return false;
        // 				}
        				
        				var sSvcID        	= "engineOilChangeServiceList";                    
        				var sController   	= "nrtms/cs/engineOilChangeServiceList.do";
        				var sInDatasets   	= "";
        				var sOutDatasets  	= "ds_list=output";
        				var sArgs 			= "";	
        				var fn_callBack		= "fn_callBack";
        				
        				sArgs += Ex.util.setParam("dlvrDayF", dlvrDayF);
        				sArgs += Ex.util.setParam("dlvrDayT", dlvrDayT);
        				sArgs += Ex.util.setParam("dlvStat", dlvStat);
        				sArgs += Ex.util.setParam("ordNo", ordNo);
        				sArgs += Ex.util.setParam("custNo", "");
        				
        				sArgs += Ex.util.setParam("salesGroup", salesGroup);
        				sArgs += Ex.util.setParam("salesOffice", salesOffice);
        				sArgs += Ex.util.setParam("agencyCd", agencyCd);	
        				
        				sArgs += Ex.util.setParam("rentalGroup", rentalGroup);
        				sArgs += Ex.util.setParam("rentalOffice", rentalOffice);
        				sArgs += Ex.util.setParam("userId", userId);		
        				
        				Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        			 }
        			  
        		}else{
        				var downDay          = nvl(this.div_search.cal_downDay.value); //집계일자
        			
        				var sSvcID        	= "engineOilChangeServiceDownList";                    
        				var sController   	= "nrtms/cs/engineOilChangeServiceDownList.do";
        				var sInDatasets   	= "";
        				var sOutDatasets  	= "ds_list=output";
        				var sArgs 			= "";	
        				var fn_callBack		= "fn_callBack";
        				
        				sArgs += Ex.util.setParam("downDay", downDay);
        				
        				Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        				
        		}
        		
        	}
        	
        	
        	//---------------------------------------------------------------------------------
        	// 집계
        	//---------------------------------------------------------------------------------	
        	this.fn_aggregate  = function() {
        		
        		  if( this.fn_getValid()) 
        			{
        				var sSvcID      	= "engineOilChangeServiceExcelDown";  
        				var sController   	= "nrtms/cs/engineOilChangeServiceExcelDown.do";
        				var sInDatasets   	= "";
        				var sOutDatasets  	= "";
        				var sArgs 			= "";	
        				var fn_callBack		= "fn_callBack";
        			
        				Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 		
                   }
        	}	
        	
        	
        	//---------------------------------------------------------------------------------
        	// 엑셀
        	//---------------------------------------------------------------------------------
        	this.fn_excel= function() {
        	    Ex.core.exportExcel(this, this.grd_list);  
        	}
        	
        	/*
        	this.fn_excel=function() { 
        		this.FN_exportExcel(this, this.grd_list);
        	}
        	
        	this.FN_exportExcel = function(objForm,obj,sFileName,strSheet)
        	{
        		
        		this.ffobj = objForm;
        		this.fv_exportObject = obj;		    
        		this.fv_exportFileName = sFileName;
        		var updateFlag = false;

        		application.set_usewaitcursor(true,true);

        		this.ct_sheet = Eco.isEmpty(strSheet) ? "sheet" :strSheet;

        		 this.FN_exportExcelProcess();

        	}
        	this.FN_exportExcelProcess = function(){

        		var obj = this.fv_exportObject;
        		var sFileName = this.sfv_exportFileName;
        		var dToday = new Date();
        		var oGrid;
        		var sSheetName;
        		
        		var strType = obj.toString().toUpperCase();
        		if(!Eco.isEmpty(sFileName)){
        			sFileName = dToday.getTime() + "_" + sFileName;
        		}else{
        			sFileName = dToday.getTime();
        		}

        		var exportObj = new ExcelExportObject();

        		var sSvcUrl = application.services["svcurl"].url+"XExportImport";
        		this.ffobj.setWaitCursor(true,true);
        	 
        		exportObj.addEventHandler("onsuccess", this._exportExcelSuccess, this);
        		exportObj.addEventHandler("onerror", this._exportExcelFail, this);

        		exportObj.set_exporttype(nexacro.ExportTypes.EXCEL2007);
        		exportObj.set_exporturl("http://localhost/XExportImport");
        		exportObj.set_exportfilename(sFileName);
        		updateFlag = true;

        		if(strType == "[OBJECT GRID]")
        		{
        			oGrid = obj;
        			sSheetName = this.ct_sheet+"1";
        			exportObj.addExportItem(nexacro.ExportItemTypes.GRID, oGrid,  sSheetName + "!A1","allband","allrecord","suppress","allstyle","background","font", "both");
        		}
        		else
        		{
        			for(var i=0; i<obj.length; i++)
        			{
        				sSheetName = this.ct_sheet+(i+1);
        				oGrid = obj[i];
        				exportObj.addExportItem(nexacro.ExportItemTypes.GRID, oGrid,  sSheetName + "!A1","allband","allrecord","suppress","allstyle","background","font", "both");
        			}
        		}

        		exportObj.exportData();
        	}
        	
        	this._exportExcelSuccess = function(){
        	         
        	    if(updateFlag)
        	    {
        			var sSvcID        	= "engineOilChangeServiceExcelDown";                
        			var sController   	= "nrtms/cs/engineOilChangeServiceExcelDown.do";
        			var sInDatasets   	= "input=ds_list:U";
        			var sOutDatasets  	= "";
        			var sArgs 			= "";
        			var fn_callBack		= "fn_callBack";		
        			
        			Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        	     }
        		
        		alert("성공");
        		this.ffobj.setWaitCursor(false,true);
        		
        	}
        	
        	this._exportExcelFail = function(){
        		alert("실패");
        		this.ffobj.setWaitCursor(false,true);
        	}
        	
        	*/
        	
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
        			case "engineOilChangeServiceList":
        				if(this.ds_list.rowcount == 0) {
        				   this.div_search.grd_list.set_nodatatext("조회된 데이터가 없습니다.");
        			    }
        				break;
        			//집계일자 검색결과				
        			case "engineOilChangeServiceDownList":
        				if(this.ds_list.rowcount == 0) {
        				   this.div_search.grd_list.set_nodatatext("조회된 데이터가 없습니다.");
        			    }
        				break;
        			case "engineOilChangeServiceExcelDown":	
        				alert('엔진오일 교체신청 대상 집계 처리 합니다.');			
        				break;		
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
        		//this.parent.setButton("E|S|AG",this);		
        	}
        	
        	//---------------------------------------------------------------------------------
        	// 검색조건 초기화 설정 
        	//---------------------------------------------------------------------------------
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
        			//대리점
        			this.div_search.cb_dateCd.set_enable(false);	//일자구분 비활성
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
        			//지점
        			this.div_search.cb_dateCd.set_enable(false);	//일자구분 비활성
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
        			//지사, 타이어뱅크 
        			this.div_search.cb_dateCd.set_enable(false);	//일자구분 비활성
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

        	this.div_search_cb_dateCd_onitemchanged = function(obj,e)
        	{
        		var userGrp = application.gds_userInfo.getColumn(0, "userGrp"); //그룹
        		
        		if( this.div_search.cb_dateCd.value == "01"){
        			
        			 this.ds_list.clearData(); 
        			//신청일자
        			this.div_search.st_dlvrDay.set_visible(true);
        			this.div_search.cal_dlvrDayF.set_visible(true);
        			this.div_search.st01.set_visible(true);
        			this.div_search.cal_dlvrDayT.set_visible(true);
        			
        			this.div_search.st_stateCd.set_visible(true);
        			this.div_search.cb_stateCd.set_visible(true);
        			
        			//집계일자
        			this.div_search.st_downDay.set_visible(false);
        			this.div_search.cal_downDay.set_visible(false);
        			this.div_search.ed_ordNo.set_enable(true);
        			this.div_search.btn_custPopUp00.set_enable(true);			
        			this.div_search.ed_ordNo.set_value(""); 	
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
        			this.div_search.ed_ordNo.set_value(""); 
        			this.div_search.ed_ordNo.set_enable(false);
        			this.div_search.btn_custPopUp00.set_enable(false);
        			this.parent.setButton("E|AG|S",this);	
        		
        		}
        		this.div_search.ed_ordNo.setFocus();
        	}
        	
        	/*지사조회 버튼 클릭 시 */
        	this.showVkgrp = function(obj,e){
        	  var args ={p_arg:"RTSDOrder"};
        	  Ex.core.popup(this,"지사 조회","comm::RTCOMMVkgrp_pop.xfdl",args,"modaless=false");
        	}
        	/*지점조회 버튼 클릭 시 */
        	this.showVkbur = function(obj,e){
        		var args ={p_arg:"RTSDOrder", p_rentalGroup:this.div_search.vkgrpCd.value};
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
        	
        	/* 대리점조회 버튼 클릭시 */
        	this.showVkazc = function(obj,e) {
        		var div = this.div_search;
        		
        		var args = {  vkgrpCd : div.vkgrpCd.value
        					, vkgrpNm : div.vkgrpNm.value
        					, vkburCd : div.vkburCd.value
        					, vkburNm : div.vkburNm.value
        					, vkazcNm : div.vkazcNm.value
        				   };
        		Ex.core.popup(this, "대리점 조회", "comm::RTCOMMAgencyEngineOil_pop.xfdl", args, "modaless=false");
        	}
        	
        	this.returnAgencyCd = function(arr) {
        		this.div_search.vkgrpCd.set_value(arr[0]);
        		this.div_search.vkgrpNm.set_value(arr[1]);
        		this.div_search.vkburCd.set_value(arr[2]);
        		this.div_search.vkburNm.set_value(arr[3]);
        		this.div_search.vkazcCd.set_value(arr[4]);
        		this.div_search.vkazcNm.set_value(arr[5]);
        	}
        	
        	/*계약조회 버튼 클릭시 20160407 추가 한승훈  */
        	this.fn_custPopUp = function(obj,e)
        	{
        		var args ={p_arg:"RTSDOrder"};
        		Ex.core.popup(this,"계약번호 조회","comm::RTCOMMOrderNo_pop.xfdl", args ,"modaless=false");
        	}
        	this.returnOrderNoInfo = function(val) {
        		this.div_search.ed_ordNo.set_value(val);
        	}
        	
        	/*계약번호 엔터입력시  20160407 추가 한승훈  */
        	this.ed_ordNo_onkeyup = function(obj,e)
        	{
        		if(e.keycode == 13 ){	
        			var ordNo = nvl(this.div_search.ed_ordNo.value);
        			if( ordNo == "" ){
        				alert("계약번호를 입력하세요.");
        				return;
        			}else{
        				this.fn_search(null,null);				
        			}	
        		}
        	}
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.btn_search.addEventHandler("onclick", this.fn_search, this);
            this.div_search.cal_dlvrDayF.addEventHandler("oneditclick", this.div_search_cal_slcmFr_oneditclick, this);
            this.div_search.cb_dateCd.addEventHandler("onitemchanged", this.div_search_cb_dateCd_onitemchanged, this);
            this.div_search.cal_downDay.addEventHandler("oneditclick", this.div_search_cal_slcmFr_oneditclick, this);
            this.div_search.vkgrpCd.addEventHandler("onkeyup", this.div_search_vkgrpCd_onkeyup, this);
            this.div_search.vkburCd.addEventHandler("onkeyup", this.div_search_vkburCd_onkeyup, this);
            this.div_search.btn_save01.addEventHandler("onclick", this.showVkbur, this);
            this.div_search.vkazcCd.addEventHandler("onkeyup", this.div_search_vkazcCd_onkeyup, this);
            this.div_search.btn_save02.addEventHandler("onclick", this.showVkazc, this);
            this.div_search.btn_save00.addEventHandler("onclick", this.showVkgrp, this);
            this.div_search.ed_ordNo.addEventHandler("onkeyup", this.ed_ordNo_onkeyup, this);
            this.div_search.btn_custPopUp00.addEventHandler("onclick", this.fn_custPopUp, this);

        };

        this.loadIncludeScript("RTCSEngineOilChangeService.xfdl");

       
    };
}
)();
