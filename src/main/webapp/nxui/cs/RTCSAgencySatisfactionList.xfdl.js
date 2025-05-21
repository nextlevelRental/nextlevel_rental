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
                this.set_name("RTCSAgencySatisfactionList");
                this.set_classname("RTCMClaim");
                this.set_titletext("대리점별 만족도 조회");
                this._setFormPosition(0,0,1123,550);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_list", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"rentalGroupNm\" type=\"STRING\" size=\"50\"/><Column id=\"rentalOfficeNm\" type=\"STRING\" size=\"50\"/><Column id=\"agencyCd\" type=\"STRING\" size=\"20\"/><Column id=\"agencyNm\" type=\"STRING\" size=\"50\"/><Column id=\"rentalYn\" type=\"STRING\" size=\"10\"/><Column id=\"opYn\" type=\"STRING\" size=\"256\"/><Column id=\"premPrplYn\" type=\"STRING\" size=\"256\"/><Column id=\"prplYn\" type=\"STRING\" size=\"256\"/><Column id=\"chYn\" type=\"STRING\" size=\"256\"/><Column id=\"totCnt\" type=\"INT\" size=\"10\"/><Column id=\"totEvalPoint\" type=\"FLOAT\" size=\"10\"/><Column id=\"stfyPointCd1_1\" type=\"INT\" size=\"256\"/><Column id=\"stfyPointCd1_2\" type=\"INT\" size=\"256\"/><Column id=\"stfyPointCd1_3\" type=\"INT\" size=\"256\"/><Column id=\"stfyPointCd1_4\" type=\"INT\" size=\"256\"/><Column id=\"stfyPointCd1_5\" type=\"INT\" size=\"256\"/><Column id=\"stfyPointCd1\" type=\"FLOAT\" size=\"256\"/><Column id=\"stfyPointCd2_1\" type=\"INT\" size=\"256\"/><Column id=\"stfyPointCd2_2\" type=\"INT\" size=\"256\"/><Column id=\"stfyPointCd2_3\" type=\"INT\" size=\"256\"/><Column id=\"stfyPointCd2_4\" type=\"INT\" size=\"256\"/><Column id=\"stfyPointCd2_5\" type=\"INT\" size=\"256\"/><Column id=\"stfyPointCd2\" type=\"FLOAT\" size=\"256\"/><Column id=\"stfyPointCd3_1\" type=\"INT\" size=\"256\"/><Column id=\"stfyPointCd3_2\" type=\"INT\" size=\"256\"/><Column id=\"stfyPointCd3_3\" type=\"INT\" size=\"256\"/><Column id=\"stfyPointCd3_4\" type=\"INT\" size=\"256\"/><Column id=\"stfyPointCd3_5\" type=\"INT\" size=\"256\"/><Column id=\"stfyPointCd3\" type=\"FLOAT\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_rentalYn", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cd\"/><Col id=\"cdNm\">ALL</Col></Row><Row><Col id=\"cd\">Y</Col><Col id=\"cdNm\">Y</Col></Row><Row><Col id=\"cd\">N</Col><Col id=\"cdNm\">N</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_opYn", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cd\"/><Col id=\"cdNm\">ALL</Col></Row><Row><Col id=\"cd\">Y</Col><Col id=\"cdNm\">Y</Col></Row><Row><Col id=\"cd\">N</Col><Col id=\"cdNm\">N</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_premPrplYn", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cd\"/><Col id=\"cdNm\">ALL</Col></Row><Row><Col id=\"cd\">Y</Col><Col id=\"cdNm\">Y</Col></Row><Row><Col id=\"cd\">N</Col><Col id=\"cdNm\">N</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_prplYn", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cd\"/><Col id=\"cdNm\">ALL</Col></Row><Row><Col id=\"cd\">Y</Col><Col id=\"cdNm\">Y</Col></Row><Row><Col id=\"cd\">N</Col><Col id=\"cdNm\">N</Col></Row></Rows>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Grid("grd_list", "absolute", "3", "103", "1119", "390", null, null, this);
            obj.set_taborder("4");
            obj.set_autofittype("none");
            obj.set_binddataset("ds_list");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"50\"/><Column size=\"60\"/><Column size=\"60\"/><Column size=\"79\"/><Column size=\"120\"/><Column size=\"83\"/><Column size=\"122\"/><Column size=\"125\"/><Column size=\"71\"/><Column size=\"107\"/><Column size=\"47\"/><Column size=\"50\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/></Columns><Rows><Row size=\"20\" band=\"head\"/><Row size=\"20\" band=\"head\"/><Row size=\"30\"/><Row size=\"30\" band=\"summ\"/></Rows><Band id=\"head\"><Cell rowspan=\"2\" text=\"순번\"/><Cell col=\"1\" rowspan=\"2\" text=\"렌탈지사\"/><Cell col=\"2\" rowspan=\"2\" text=\"렌탈지점\"/><Cell col=\"3\" rowspan=\"2\" text=\"대리점코드\"/><Cell col=\"4\" rowspan=\"2\" text=\"대리점명\"/><Cell col=\"5\" rowspan=\"2\" text=\"렌탈가능여부\"/><Cell col=\"6\" rowspan=\"2\" text=\"온라인장착 가능여부\"/><Cell col=\"7\" rowspan=\"2\" text=\"프리미엄퍼플점 여부\"/><Cell col=\"8\" rowspan=\"2\" text=\"퍼플점 여부\"/><Cell col=\"9\" rowspan=\"2\" text=\"추천 장착점 여부\"/><Cell col=\"10\" rowspan=\"2\" text=\"총건수\"/><Cell col=\"11\" rowspan=\"2\" text=\"총평점\"/><Cell col=\"12\" colspan=\"6\" text=\"장착응대\"/><Cell col=\"18\" colspan=\"6\" text=\"렌탈혜택설명\"/><Cell col=\"24\" colspan=\"6\" text=\"친절\"/><Cell row=\"1\" col=\"12\" text=\"1\"/><Cell row=\"1\" col=\"13\" text=\"2\"/><Cell row=\"1\" col=\"14\" text=\"3\"/><Cell row=\"1\" col=\"15\" text=\"4\"/><Cell row=\"1\" col=\"16\" text=\"5\"/><Cell row=\"1\" col=\"17\" text=\"통계\"/><Cell row=\"1\" col=\"18\" text=\"1\"/><Cell row=\"1\" col=\"19\" text=\"2\"/><Cell row=\"1\" col=\"20\" text=\"3\"/><Cell row=\"1\" col=\"21\" text=\"4\"/><Cell row=\"1\" col=\"22\" text=\"5\"/><Cell row=\"1\" col=\"23\" text=\"통계\"/><Cell row=\"1\" col=\"24\" text=\"1\"/><Cell row=\"1\" col=\"25\" text=\"2\"/><Cell row=\"1\" col=\"26\" text=\"3\"/><Cell row=\"1\" col=\"27\" text=\"4\"/><Cell row=\"1\" col=\"28\" text=\"5\"/><Cell row=\"1\" col=\"29\" text=\"통계\"/></Band><Band id=\"body\"><Cell displaytype=\"normal\" expr=\"expr:currow+1\"/><Cell col=\"1\" celltype=\"none\" text=\"bind:rentalGroupNm\" tooltiptext=\"bind:rentalGroupNm\"/><Cell col=\"2\" celltype=\"none\" text=\"bind:rentalOfficeNm\" tooltiptext=\"bind:rentalOfficeNm\"/><Cell col=\"3\" text=\"bind:agencyCd\" tooltiptext=\"bind:agencyCd\"/><Cell col=\"4\" celltype=\"none\" text=\"bind:agencyNm\" tooltiptext=\"bind:agencyNm\"/><Cell col=\"5\" text=\"bind:rentalYn\" tooltiptext=\"bind:rentalYn\"/><Cell col=\"6\" text=\"bind:opYn\" tooltiptext=\"bind:opYn\"/><Cell col=\"7\" text=\"bind:premPrplYn\" tooltiptext=\"bind:premPrplYn\"/><Cell col=\"8\" text=\"bind:prplYn\" tooltiptext=\"bind:prplYn\"/><Cell col=\"9\" text=\"bind:chYn\" tooltiptext=\"bind:chYn\"/><Cell col=\"10\" text=\"bind:totCnt\" tooltiptext=\"bind:totCnt\"/><Cell col=\"11\" text=\"bind:totEvalPoint\" tooltiptext=\"bind:totEvalPoint\"/><Cell col=\"12\" text=\"bind:stfyPointCd1_1\" tooltiptext=\"bind:stfyPointCd1_1\"/><Cell col=\"13\" text=\"bind:stfyPointCd1_2\" tooltiptext=\"bind:stfyPointCd1_2\"/><Cell col=\"14\" text=\"bind:stfyPointCd1_3\" tooltiptext=\"bind:stfyPointCd1_3\"/><Cell col=\"15\" text=\"bind:stfyPointCd1_4\" tooltiptext=\"bind:stfyPointCd1_4\"/><Cell col=\"16\" text=\"bind:stfyPointCd1_5\" tooltiptext=\"bind:stfyPointCd1_5\"/><Cell col=\"17\" text=\"bind:stfyPointCd1\" tooltiptext=\"bind:stfyPointCd1\"/><Cell col=\"18\" text=\"bind:stfyPointCd2_1\" tooltiptext=\"bind:stfyPointCd2_1\"/><Cell col=\"19\" text=\"bind:stfyPointCd2_2\" tooltiptext=\"bind:stfyPointCd2_2\"/><Cell col=\"20\" text=\"bind:stfyPointCd2_3\" tooltiptext=\"bind:stfyPointCd2_3\"/><Cell col=\"21\" text=\"bind:stfyPointCd2_4\" tooltiptext=\"bind:stfyPointCd2_4\"/><Cell col=\"22\" text=\"bind:stfyPointCd2_5\" tooltiptext=\"bind:stfyPointCd2_5\"/><Cell col=\"23\" text=\"bind:stfyPointCd2\" tooltiptext=\"bind:stfyPointCd2\"/><Cell col=\"24\" text=\"bind:stfyPointCd3_1\" tooltiptext=\"bind:stfyPointCd3_1\"/><Cell col=\"25\" text=\"bind:stfyPointCd3_2\" tooltiptext=\"bind:stfyPointCd3_2\"/><Cell col=\"26\" text=\"bind:stfyPointCd3_3\" tooltiptext=\"bind:stfyPointCd3_3\"/><Cell col=\"27\" text=\"bind:stfyPointCd3_4\" tooltiptext=\"bind:stfyPointCd3_4\"/><Cell col=\"28\" text=\"bind:stfyPointCd3_5\" tooltiptext=\"bind:stfyPointCd3_5\"/><Cell col=\"29\" text=\"bind:stfyPointCd3\" tooltiptext=\"bind:stfyPointCd3\"/></Band><Band id=\"summary\"><Cell text=\"총계\"/><Cell col=\"1\"/><Cell col=\"2\"/><Cell col=\"3\"/><Cell col=\"4\"/><Cell col=\"5\"/><Cell col=\"6\"/><Cell col=\"7\"/><Cell col=\"8\"/><Cell col=\"9\"/><Cell col=\"10\" expr=\"dataset.getSum(&quot;totCnt&quot;)\"/><Cell col=\"11\" expr=\"expr:nexacro.toNumber(nexacro.round(dataset.getAvg(&quot;totEvalPoint&quot;), 1),0,0)\"/><Cell col=\"12\" expr=\"dataset.getSum(&quot;stfyPointCd1_1&quot;)\"/><Cell col=\"13\" expr=\"dataset.getSum(&quot;stfyPointCd1_2&quot;)\"/><Cell col=\"14\" expr=\"dataset.getSum(&quot;stfyPointCd1_3&quot;)\"/><Cell col=\"15\" expr=\"dataset.getSum(&quot;stfyPointCd1_4&quot;)\"/><Cell col=\"16\" expr=\"dataset.getSum(&quot;stfyPointCd1_5&quot;)\"/><Cell col=\"17\" expr=\"expr:nexacro.toNumber(nexacro.round(dataset.getAvg(&quot;stfyPointCd1&quot;), 1),0,0)\"/><Cell col=\"18\" expr=\"dataset.getSum(&quot;stfyPointCd2_1&quot;)\"/><Cell col=\"19\" expr=\"dataset.getSum(&quot;stfyPointCd2_2&quot;)\"/><Cell col=\"20\" expr=\"dataset.getSum(&quot;stfyPointCd2_3&quot;)\"/><Cell col=\"21\" expr=\"dataset.getSum(&quot;stfyPointCd2_4&quot;)\"/><Cell col=\"22\" expr=\"dataset.getSum(&quot;stfyPointCd2_5&quot;)\"/><Cell col=\"23\" expr=\"expr:nexacro.toNumber(nexacro.round(dataset.getAvg(&quot;stfyPointCd2&quot;), 1),0,0)\"/><Cell col=\"24\" expr=\"dataset.getSum(&quot;stfyPointCd3_1&quot;)\"/><Cell col=\"25\" expr=\"dataset.getSum(&quot;stfyPointCd3_2&quot;)\"/><Cell col=\"26\" expr=\"dataset.getSum(&quot;stfyPointCd3_3&quot;)\"/><Cell col=\"27\" expr=\"dataset.getSum(&quot;stfyPointCd3_4&quot;)\"/><Cell col=\"28\" expr=\"dataset.getSum(&quot;stfyPointCd3_5&quot;)\"/><Cell col=\"29\" expr=\"expr:nexacro.toNumber(nexacro.round(dataset.getAvg(&quot;stfyPointCd3&quot;), 1),0,0)\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "3", "81", "213", "20", null, null, this);
            obj.set_taborder("9");
            obj.set_text("렌탈대리점 카카오톡 만족도 현황");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "0", "0", "1123", "71", null, null, this);
            obj.set_taborder("16");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
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
            obj = new Static("st_rentalYn", "absolute", "15", "40", "103", "21", null, null, this.div_search);
            obj.set_taborder("23");
            obj.set_text("렌탈 가능여부");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_dlvrDay", "absolute", "15", "7", "80", "20", null, null, this.div_search);
            obj.set_taborder("24");
            obj.set_text("제출일자");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_subtDayF", "absolute", "88", "7", "100", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("25");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Calendar("cal_subtDayT", "absolute", "208", "7", "100", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("140");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Static("Static03", "absolute", "832", "7", "80", "20", null, null, this.div_search);
            obj.set_taborder("28");
            obj.set_text("대리점");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_rentalYn", "absolute", "122", "40", "60", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("26");
            obj.set_innerdataset("@ds_rentalYn");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj.set_displaynulltext("ALL");
            obj = new Edit("agencyCd", "absolute", "904", "7", "90", "21", null, null, this.div_search);
            obj.set_taborder("27");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("10");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_save02", "absolute", "972", "7", "21", "21", null, null, this.div_search);
            obj.set_taborder("29");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("agencyNm", "absolute", "993", "7", "100", "21", null, null, this.div_search);
            obj.set_taborder("30");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("150");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static08", "absolute", "193", "7", "10", "21", null, null, this.div_search);
            obj.set_taborder("141");
            obj.set_text("~");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_opYn", "absolute", "332", "40", "140", "21", null, null, this.div_search);
            obj.set_taborder("142");
            obj.set_text("온라인장착 가능여부");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_opYn", "absolute", "473", "40", "60", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("143");
            obj.set_innerdataset("@ds_opYn");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj.set_displaynulltext("ALL");
            obj = new Static("st_premPrplYn", "absolute", "583", "40", "139", "21", null, null, this.div_search);
            obj.set_taborder("144");
            obj.set_text("프리미엄 퍼플점 여부");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_premPrplYn", "absolute", "724", "40", "60", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("145");
            obj.set_innerdataset("@ds_premPrplYn");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj.set_displaynulltext("ALL");
            obj = new Static("st_prplYn", "absolute", "832", "40", "80", "21", null, null, this.div_search);
            obj.set_taborder("146");
            obj.set_text("퍼플점 여부");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_prplYn", "absolute", "919", "40", "60", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("147");
            obj.set_innerdataset("@ds_prplYn");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj.set_displaynulltext("ALL");
            obj = new Edit("ed_salesGroupNm", "absolute", "475", "9", "90", "21", null, null, this.div_search);
            obj.set_taborder("17");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchSalesGroup", "absolute", "332", "9", "68", "20", null, null, this.div_search);
            obj.set_taborder("18");
            obj.set_text("렌탈지사");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchSalesOffice", "absolute", "583", "9", "68", "20", null, null, this.div_search);
            obj.set_taborder("19");
            obj.set_text("렌탈지점");
            obj.set_cssclass("sta_WF_schTitle");
            obj.set_enableevent("false");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_salesOfficeNm", "absolute", "726", "9", "90", "21", null, null, this.div_search);
            obj.set_taborder("20");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_salesGroup", "absolute", "405", "9", "70", "21", null, null, this.div_search);
            obj.set_taborder("21");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_salesOffice", "absolute", "656", "9", "70", "21", null, null, this.div_search);
            obj.set_taborder("22");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("bt_searchSalesGroup", "absolute", "454", "8", "21", "21", null, null, this.div_search);
            obj.set_taborder("23");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("bt_searchSalesOffice", "absolute", "705", "9", "21", "21", null, null, this.div_search);
            obj.set_taborder("24");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);


            
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
            obj = new Layout("default", "", 1123, 550, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCMClaim");
            		p.set_titletext("대리점별 만족도 조회");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCSAgencySatisfactionList.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCSAgencySatisfactionList.xfdl", function() {
        /***************************************************************************************************
         * 파 일 명 : RTCSAgencySatisfactionList.xfdl
         * 설    명 : 대리점별 만족도 조회
         * 변경이력 :
         ***************************************************************************************************/ 

        /***********************************************************************
         * Script Include 
         ************************************************************************/
        //include "lib::comLib.xjs";
        this.p_arg = "RTSDAgencyStatus";	//렌탈지사, 렌탈지점 팝업에서 return 받기위한 값.

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
        this.form_onload = function(obj,e) {
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
        	
        	//만족도 리스트 조회
        	//this.fn_search();
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

        //---------------------------------------------------------------------------------
        // 만족도조사 내역 조회
        //---------------------------------------------------------------------------------	
        this.fn_search = function(obj,e) {

        	var subtDayF  		= nvl(this.div_search.cal_subtDayF.value);		//당월1일
        	var subtDayT 		= nvl(this.div_search.cal_subtDayT.value);		//현재일
        	var rentalGroup 	= nvl(this.div_search.ed_salesGroup.value); 	//렌탈지사
        	var rentalOffice 	= nvl(this.div_search.ed_salesOffice.value); 	//렌탈지점
        	var agencyCd 		= nvl(this.div_search.agencyCd.value);			//대리점코드
        	var rentalYn   		= nvl(this.div_search.cb_rentalYn.value);		//렌탈가능 여부
        	var opYn   			= nvl(this.div_search.cb_opYn.value);			//온라인장착 가능 여부
        	var premPrplYn   	= nvl(this.div_search.cb_premPrplYn.value);		//프리미엄 퍼플점 여부
        	var prplYn   		= nvl(this.div_search.cb_prplYn.value);			//퍼플점 여부
        	
        	var sSvcID        	= "agencySatisfactionList";
        	var sController   	= "ntrms/cs/selectAgencySatisfactionList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_list=output";
        	var sArgs 			= "";
        	var fn_callBack		= "fn_callBack";

        	sArgs += Ex.util.setParam("subtDayF"	, subtDayF);
        	sArgs += Ex.util.setParam("subtDayT"	, subtDayT);
        	sArgs += Ex.util.setParam("rentalGroup"	, rentalGroup);
        	sArgs += Ex.util.setParam("rentalOffice", rentalOffice);
        	sArgs += Ex.util.setParam("agencyCd"	, agencyCd);
        	sArgs += Ex.util.setParam("rentalYn"	, rentalYn);
        	sArgs += Ex.util.setParam("opYn"		, opYn);
        	sArgs += Ex.util.setParam("premPrplYn"	, premPrplYn);
        	sArgs += Ex.util.setParam("prplYn"		, prplYn);
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /***********************************************************************************
        * CallBack Event (strSvcId - Sevice ID, nErrorCode - ErrorCode, strErrorMsg - Error Message)
        ***********************************************************************************/
        //-------------------------------------------------------------------------------  	
        // callBack함수 
        //------------------------------------------------------------------------------- 
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg) { 
        	if (nErrorCode < 0) {
        		alert(strErrorMsg);		
        		return;
        	}

        	switch (strSvcId) 
        	{
        	
        		 //신청일자 
        		 case "getToday":
        			var sFirstDay = Eco.date.getFirstDate(this.toDay);
        			this.div_search.cal_subtDayF.set_value(sFirstDay);
        			this.div_search.cal_subtDayT.set_value(this.toDay);
        			break;
        		//대리점별 만족도 조회 검색결과
        		case "agencySatisfactionList":
        			if(this.ds_list.rowcount == 0) {
        			   this.div_search.grd_list.set_nodatatext("조회된 데이터가 없습니다.");
        			}
        			break;
        	}	
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
        	this.parent.setButton("S|E",this);
        }

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.showAgency = function(obj,e) {
        	var args = {p_formId : "RTSDAgency"};
        	Ex.core.popup(this,"대리점 조회","comm::RTCOMMAgency_pop.xfdl",args,"modaless=false");
        }
        this._setReturn = function(val) {
        	var cd = val[0];
        	var nm = val[1];
        	this.div_search.agencyCd.set_value(cd);
        	this.div_search.agencyNm.set_value(nm);
        }

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_bt_salesGroupNm_onclick = function(obj,e){
        	var args ={p_arg : this.p_arg};
        	Ex.core.popup(this,"지사","comm::RTCOMMVkgrp_pop.xfdl",args, "modaless=false");
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.return_salesGroup = function(arr){
        	this.div_search.ed_salesGroupNm.set_value(arr[0]);
        	this.div_search.ed_salesGroup.set_value(arr[1]);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_edt_searchKeyword_onkeyup = function(obj,e){
        	if( e.keycode == "13" ){
        		this.fn_search();
        	}
        }

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_bt_salesOffice_onclick = function(obj,e){
        	var args ={p_arg : this.p_arg, p_rentalGroup:this.div_search.ed_salesGroup.value};
        	Ex.core.popup(this,"지점조회","comm::RTCOMMVkbur_pop.xfdl",args, "modaless=false");
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.return_salesOffice = function(arr){
        	this.div_search.ed_salesOfficeNm.set_value(arr[0]);
        	this.div_search.ed_salesOffice.set_value(arr[1]);
        }

        /**
         * 대리점별 만족도 조회 엑셀다운로드
         */
        this.fn_excel= function() {
        	Ex.core.exportExcel(this, this.grd_list);
        }
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.div_search.cal_subtDayF.addEventHandler("oneditclick", this.div_search_cal_slcmFr_oneditclick, this);
            this.div_search.cal_subtDayT.addEventHandler("oneditclick", this.div_search_cal_slcmFr_oneditclick, this);
            this.div_search.agencyCd.addEventHandler("onkeyup", this.div_search_agencyCd_onkeyup, this);
            this.div_search.btn_save02.addEventHandler("onclick", this.showAgency, this);
            this.div_search.ed_salesGroupNm.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.div_search.ed_salesOfficeNm.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.div_search.ed_salesGroup.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.div_search.ed_salesGroup.addEventHandler("oneditclick", this.div_search_ed_salesGroup_oneditclick, this);
            this.div_search.ed_salesOffice.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.div_search.bt_searchSalesGroup.addEventHandler("onclick", this.div_search_bt_salesGroupNm_onclick, this);
            this.div_search.bt_searchSalesOffice.addEventHandler("onclick", this.div_search_bt_salesOffice_onclick, this);

        };

        this.loadIncludeScript("RTCSAgencySatisfactionList.xfdl");

       
    };
}
)();
