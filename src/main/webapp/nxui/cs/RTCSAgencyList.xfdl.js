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
                this.set_name("RTCSAgencyList");
                this.set_classname("RTCSAgencyList");
                this.set_titletext("대리점 조회");
                this._setFormPosition(0,0,1147,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
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

            obj = new Dataset("ds_S014", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_S091", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cdNm\">전체</Col><Col id=\"cd\"/></Row><Row><Col id=\"cd\">0101</Col><Col id=\"cdNm\">타이어테크</Col></Row><Row><Col id=\"cd\">0102</Col><Col id=\"cdNm\">카포스</Col></Row><Row><Col id=\"cd\">0103</Col><Col id=\"cdNm\">애니카</Col></Row><Row><Col id=\"cd\">0104</Col><Col id=\"cdNm\">프로미</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_Ch_Yn", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cdNm\">전체</Col><Col id=\"cd\"/></Row><Row><Col id=\"cd\">Y</Col><Col id=\"cdNm\">Y</Col></Row><Row><Col id=\"cd\">N</Col><Col id=\"cdNm\">N</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_Lm_Yn", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cdNm\">전체</Col><Col id=\"cd\"/></Row><Row><Col id=\"cd\">Y</Col><Col id=\"cdNm\">Y</Col></Row><Row><Col id=\"cd\">N</Col><Col id=\"cdNm\">N</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_AgencyList", this);
            obj._setContents("<ColumnInfo><Column id=\"agencyCd\" type=\"STRING\" size=\"256\"/><Column id=\"sidoCd\" type=\"STRING\" size=\"256\"/><Column id=\"sidoNm\" type=\"STRING\" size=\"256\"/><Column id=\"sigunCd\" type=\"STRING\" size=\"256\"/><Column id=\"sigunNm\" type=\"STRING\" size=\"256\"/><Column id=\"agencyNm\" type=\"STRING\" size=\"256\"/><Column id=\"addr\" type=\"STRING\" size=\"256\"/><Column id=\"seasonGbn\" type=\"STRING\" size=\"256\"/><Column id=\"seasonGbnNm\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"chYn\" type=\"STRING\" size=\"256\"/><Column id=\"lmYn\" type=\"STRING\" size=\"256\"/><Column id=\"chanMclsCd\" type=\"STRING\" size=\"256\"/><Column id=\"chanMclsNm\" type=\"STRING\" size=\"256\"/><Column id=\"cntProc\" type=\"STRING\" size=\"256\"/><Column id=\"memo\" type=\"STRING\" size=\"256\"/><Column id=\"desorptCd\" type=\"STRING\" size=\"256\"/><Column id=\"desorptNm\" type=\"STRING\" size=\"256\"/><Column id=\"alignCd\" type=\"STRING\" size=\"256\"/><Column id=\"alignNm\" type=\"STRING\" size=\"256\"/><Column id=\"balanceCd\" type=\"STRING\" size=\"256\"/><Column id=\"balanceNm\" type=\"STRING\" size=\"256\"/><Column id=\"premPrplYn\" type=\"STRING\" size=\"256\"/><Column id=\"totEvalPoint\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_S100", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_S101", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_S102", this);
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
            obj = new Static("Static01", "absolute", "1122", "0", "25", "496", null, null, this);
            obj.set_taborder("0");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "0", "0", "1122", "81", null, null, this);
            obj.set_taborder("1");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_agencyCd", "absolute", "414", "12", "80", "21", null, null, this.div_search);
            obj.set_taborder("46");
            obj.set_text("채널");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_salesOffice", "absolute", "214", "12", "80", "21", null, null, this.div_search);
            obj.set_taborder("48");
            obj.set_text("시군구");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_salesGroupNm", "absolute", "25", "12", "80", "21", null, null, this.div_search);
            obj.set_taborder("49");
            obj.set_text("광역시도");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "901", "12", "80", "21", null, null, this.div_search);
            obj.set_taborder("51");
            obj.set_text("계절구분");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_procDay", "absolute", "596", "11", "80", "21", null, null, this.div_search);
            obj.set_taborder("52");
            obj.set_text("전략추천");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static26", "absolute", "0", "0", "1122", "12", null, null, this.div_search);
            obj.set_taborder("54");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static07", "absolute", "0", "33", "1118", "12", null, null, this.div_search);
            obj.set_taborder("55");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static08", "absolute", "0", "4", "25", "79", null, null, this.div_search);
            obj.set_taborder("56");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static09", "absolute", "189", "0", "25", "46", null, null, this.div_search);
            obj.set_taborder("57");
            obj.set_text("h72");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_ChanMcls", "absolute", "463", "12", "108", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("2");
            obj.set_autoselect("true");
            obj.set_innerdataset("@ds_S091");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj.set_index("0");
            obj = new Combo("cb_Sido", "absolute", "97", "12", "92", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("0");
            obj.set_autoselect("true");
            obj.set_innerdataset("@ds_S016");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("10");
            obj.set_index("0");
            obj = new Combo("cb_Sigun", "absolute", "273", "12", "116", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("1");
            obj.set_autoselect("true");
            obj.set_innerdataset("@ds_S017");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("10");
            obj.set_index("0");
            obj = new Combo("cb_ChYn", "absolute", "669", "12", "60", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("3");
            obj.set_autoselect("true");
            obj.set_innerdataset("@ds_Ch_Yn");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj.set_index("0");
            obj = new Static("st_salesOffice00", "absolute", "754", "12", "80", "21", null, null, this.div_search);
            obj.set_taborder("73");
            obj.set_text("경정비");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_LmYn", "absolute", "816", "12", "60", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("4");
            obj.set_autoselect("true");
            obj.set_innerdataset("@ds_Lm_Yn");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj.set_index("0");
            obj = new Combo("cb_SeasonGbn", "absolute", "981", "12", "108", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("5");
            obj.set_autoselect("true");
            obj.set_innerdataset("@ds_S014");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj.set_index("0");
            obj = new Static("Static00", "absolute", "389", "0", "25", "46", null, null, this.div_search);
            obj.set_taborder("76");
            obj.set_text("h72");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "571", "0", "25", "46", null, null, this.div_search);
            obj.set_taborder("77");
            obj.set_text("h72");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "729", "0", "25", "46", null, null, this.div_search);
            obj.set_taborder("78");
            obj.set_text("h72");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "876", "0", "25", "46", null, null, this.div_search);
            obj.set_taborder("79");
            obj.set_text("h72");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static05", "absolute", "1093", "4", "25", "39", null, null, this.div_search);
            obj.set_taborder("80");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "25", "45", "80", "21", null, null, this.div_search);
            obj.set_taborder("81");
            obj.set_text("탈착기");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_DesorptCd", "absolute", "96", "45", "116", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("82");
            obj.set_autoselect("true");
            obj.set_innerdataset("@ds_S100");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj = new Static("Static10", "absolute", "0", "66", "1118", "12", null, null, this.div_search);
            obj.set_taborder("83");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static11", "absolute", "233", "45", "80", "21", null, null, this.div_search);
            obj.set_taborder("84");
            obj.set_text("얼라인먼트");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_AlignCd", "absolute", "323", "45", "148", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("85");
            obj.set_autoselect("true");
            obj.set_innerdataset("@ds_S101");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj = new Static("Static12", "absolute", "500", "45", "80", "21", null, null, this.div_search);
            obj.set_taborder("86");
            obj.set_text("밸런스");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_BalanceCd", "absolute", "571", "45", "116", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("87");
            obj.set_autoselect("true");
            obj.set_innerdataset("@ds_S102");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");

            obj = new Grid("grid_AgencyList", "absolute", "0", "88", "1122", "408", null, null, this);
            obj.set_taborder("2");
            obj.set_binddataset("ds_AgencyList");
            obj.set_cellsizingtype("col");
            obj.set_autosizebandtype("allband");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"62\"/><Column size=\"95\"/><Column size=\"190\"/><Column size=\"133\"/><Column size=\"87\"/><Column size=\"356\"/><Column size=\"64\"/><Column size=\"107\"/><Column size=\"58\"/><Column size=\"44\"/><Column size=\"85\"/><Column size=\"116\"/><Column size=\"88\"/><Column size=\"100\"/><Column size=\"59\"/><Column size=\"300\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"24\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"광역시도\"/><Cell col=\"1\" text=\"시군구\"/><Cell col=\"2\" text=\"장착점명\"/><Cell col=\"3\" text=\"프리미엄 퍼플점 여부\"/><Cell col=\"4\" text=\"만족도 총평점\"/><Cell col=\"5\" text=\"주소\"/><Cell col=\"6\" text=\"계절구분\"/><Cell col=\"7\" text=\"연락처\"/><Cell col=\"8\" text=\"전략추천\"/><Cell col=\"9\" text=\"경정비\"/><Cell col=\"10\" text=\"탈착기\"/><Cell col=\"11\" text=\"얼라인먼트\"/><Cell col=\"12\" text=\"밸런스\"/><Cell col=\"13\" text=\"채널중분류\"/><Cell col=\"14\" text=\"렌탈계정\"/><Cell col=\"15\" text=\"비고\"/></Band><Band id=\"body\"><Cell text=\"bind:sidoNm\"/><Cell col=\"1\" text=\"bind:sigunNm\"/><Cell col=\"2\" edittype=\"normal\" text=\"bind:agencyNm\"/><Cell col=\"3\" text=\"bind:premPrplYn\"/><Cell col=\"4\" text=\"bind:totEvalPoint\"/><Cell col=\"5\" edittype=\"normal\" text=\"bind:addr\"/><Cell col=\"6\" text=\"bind:seasonGbnNm\"/><Cell col=\"7\" edittype=\"normal\" text=\"bind:telNo\"/><Cell col=\"8\" displaytype=\"text\" edittype=\"readonly\" text=\"bind:chYn\"/><Cell col=\"9\" text=\"bind:lmYn\"/><Cell col=\"10\" text=\"bind:desorptNm\"/><Cell col=\"11\" text=\"bind:alignNm\"/><Cell col=\"12\" text=\"bind:balanceNm\"/><Cell col=\"13\" text=\"bind:chanMclsNm\"/><Cell col=\"14\" text=\"bind:cntProc\"/><Cell col=\"15\" celltype=\"body\" style=\"align:left;\" text=\"bind:memo\" wordwrap=\"none\" expandshow=\"hide\" autosizerow=\"default\" autosizecol=\"default\"/></Band><Band id=\"summary\"><Cell text=\"총합계\"/><Cell col=\"1\" style=\"align:right;\" expr=\"expr:dataset.getRowCount()+&quot;(건)&quot;\"/><Cell col=\"2\"/><Cell col=\"3\"/><Cell col=\"4\"/><Cell col=\"5\"/><Cell col=\"6\"/><Cell col=\"7\"/><Cell col=\"8\"/><Cell col=\"9\"/><Cell col=\"10\"/><Cell col=\"11\"/><Cell col=\"12\"/><Cell col=\"13\"/><Cell col=\"14\"/><Cell col=\"15\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1122, 81, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("1");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1147, 496, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCSAgencyList");
            		p.set_titletext("대리점 조회");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCSAgencyList.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCSAgencyList.xfdl", function() {
        /***************************************************************************************************
         * 파 일 명 : RTCSAgencyList.xfdl
         * 설    명 : 대리점 조회 
         * 작 성 자 :
         * 변경이력 :
         * 변경일자		변경자		변경내용
         * ----------	------		-------- 
         * 2018-01-02	wjim		[20171226_01] 비고 추가
         * 2018-03-12	wjim		[20180312_01] 탈착기, 얼라인먼트, 밸런스 추가
         ***************************************************************************************************/

        //include "lib::comLib.xjs";

        /**
         * 폼의 모든 컴포넌트가 생성되고, 모든 오브젝트가 로딩되었을 때 이벤트 처리
         */
        this.RTCSAgencyList_onload = function(obj,e) {
        	Ex.core.init(obj);
        	// 공통버튼 세팅
        	this.parent.setButton("E|S", this);
        	// 공통코드 조회
        	this.fn_getCommCode();	
        }

        /**
         * 공통코드 조회
         */ 
        this.fn_getCommCode  = function() {
        	var sSvcID      	= "getCommCode";  
        	var sController   	= "/rtms/sd/initRTSDAgency.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_S016=mapSidoCd ds_S017=mapSigunCd ds_S014=mapSeasonCd ds_S100=mapDesorptCd ds_S101=mapAlignCd ds_S102=mapBalanceCd";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 		
        }

        /**
         * 조회 버튼의 클릭 이벤트 처리
         */
        this.fn_search = function() {
        	// 기존 조회결과 초기화
         	this.ds_AgencyList.deleteAll();
        	// Transaction 관련 정보 세팅
         	var sSvcID        	= "listAgency";                    
         	var sController   	= "/rtms/sd/agencyCallList.do";
         	var sInDatasets   	= "";
         	var sOutDatasets  	= "ds_AgencyList=ds_agency";
         	var sArgs 			= "";	
         	var fn_callBack		= "fn_callBack";
         	// Transaction 파라미터 세팅
         	sArgs += Ex.util.setParam("sidoCd"    , this.div_search.cb_Sido.value     );
         	sArgs += Ex.util.setParam("sigunCd"   , this.div_search.cb_Sigun.value    );
         	sArgs += Ex.util.setParam("chanMclsCd", this.div_search.cb_ChanMcls.value );
         	sArgs += Ex.util.setParam("chYn"      , this.div_search.cb_ChYn.value     );
         	sArgs += Ex.util.setParam("lmYn"      , this.div_search.cb_LmYn.value     );
         	sArgs += Ex.util.setParam("seasonGbn" , this.div_search.cb_SeasonGbn.value);
         	sArgs += Ex.util.setParam("desorptCd" , this.div_search.cb_DesorptCd.value);
         	sArgs += Ex.util.setParam("alignCd"   , this.div_search.cb_AlignCd.value  );
         	sArgs += Ex.util.setParam("balanceCd" , this.div_search.cb_BalanceCd.value);
        	// 조회 수행
         	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 엑셀 버튼의 클릭 이벤트 처리
         */
        this.fn_excel= function() {
        	Ex.core.exportExcel(this, this.grid_AgencyList);
        }

        /**
         * CallBack 처리
         */
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg) {
        	if (nErrorCode < 0)
        		return Ex.core.comMsg("alert",strErrorMsg);	
        	
        	switch (strSvcId) {
        		case "getCommCode":
        			// 조회조건-광역시도 초기화
        			var insert = this.ds_S016.insertRow(0);
        			this.ds_S016.setColumn(insert,"cd","");
        			this.ds_S016.setColumn(insert,"cdNm","전체");
        			this.div_search.cb_Sido.set_value("");
        			// 조회조건-시군구 초기화
        			var insert = this.ds_S017.insertRow(0);
        			this.ds_S017.setColumn(insert,"cd","");
        			this.ds_S017.setColumn(insert,"cdNm","전체");
        			this.div_search.cb_Sigun.set_value("");
        			// 조회조건-계절구분 초기화
        			var insert = this.ds_S014.insertRow(0);
        			this.ds_S014.setColumn(insert,"cd","");
        			this.ds_S014.setColumn(insert,"cdNm","전체");
        			this.div_search.cb_SeasonGbn.set_value("");
        			// 조회조건-탈착기 초기화 [20180312_01]
        			var insert = this.ds_S100.insertRow(0);
        			this.ds_S100.setColumn(insert,"cd","");
        			this.ds_S100.setColumn(insert,"cdNm","전체");
        			this.div_search.cb_DesorptCd.set_value("");
        			// 조회조건-얼라인먼트 초기화 [20180312_01]
        			var insert = this.ds_S101.insertRow(0);
        			this.ds_S101.setColumn(insert,"cd","");
        			this.ds_S101.setColumn(insert,"cdNm","전체");
        			this.div_search.cb_AlignCd.set_value("");
        			// 조회조건-밸런스 초기화 [20180312_01]
        			var insert = this.ds_S102.insertRow(0);
        			this.ds_S102.setColumn(insert,"cd","");
        			this.ds_S102.setColumn(insert,"cdNm","전체");
        			this.div_search.cb_BalanceCd.set_value("");
        			
        		    break;
        		
        		case "listAgency":
        			var rowCt = this.ds_AgencyList.getRowCount();
        		
        			if( rowCt == 0 ){
        				this.alert("조회된 데이터가 없습니다.");
        				this.grid_AgencyList.set_nodatatext("조회된 데이터가 없습니다.");
        			}
        						
        			break;
        		
        		default:
        			break;
        	}
        }

        /**
         * 광역시도 콤보에서 변경된 값이 적용된 후 이벤트 처리
         * - 시군구 콤보 필터링
         */
        this.div_search_cb_Sido_onitemchanged = function(obj,e) {
        	this.ds_S017.filter("");
        	
        	if(e.postvalue != "") {
        		this.ds_S017.filter("cd.substr(0,2)=='" + e.posttext + "' || cd==''");
        	}
        	
        	this.div_search.cb_Sigun.set_index(0);
        }

        

        /**
         * 목록 그리드의 주소 영역 셀 더블 클릭 이벤트 처리
         * - 상담 팝업 grd_list01_oncellclick
         */
        this.ds_AgencyList_oncelldblclick = function(obj,e) {

        	// 팝업화면 연동 파라미터 세팅
        	var rowPo1 = this.ds_AgencyList.rowposition;
        	var full_addr = this.ds_AgencyList.getColumn(rowPo1, "addr");
        	var agency_nm = this.ds_AgencyList.getColumn(rowPo1, "agencyNm");
        	
        	var arr = {addr : full_addr, agencyNm : agency_nm};
        	Ex.core.popup(this, "대리점 위치조회", "cs::RTCSAgencyList_pop.xfdl", arr, "modaless=false");
        }
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTCSAgencyList_onload, this);
            this.div_search.cb_Sido.addEventHandler("onitemchanged", this.div_search_cb_Sido_onitemchanged, this);
            this.grid_AgencyList.addEventHandler("oncelldblclick", this.ds_AgencyList_oncelldblclick, this);

        };

        this.loadIncludeScript("RTCSAgencyList.xfdl");

       
    };
}
)();
