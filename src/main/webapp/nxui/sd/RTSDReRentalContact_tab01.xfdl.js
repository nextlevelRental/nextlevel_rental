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
                this.set_name("RTSDReRentalContact_tab01");
                this.set_classname("RTSDProvisionalContractContact_tab01");
                this.set_titletext("New Form");
                this._setFormPosition(0,0,1123,119);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("dsS103", this);
            obj.set_firefirstcount("0");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsS104", this);
            obj.set_firefirstcount("0");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Div("div_search", "absolute", "0", "1", "1119", "99", null, null, this);
            obj.set_taborder("0");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "25", "12", "80", "20", null, null, this.div_search);
            obj.set_taborder("194");
            obj.set_text("장착일자");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "626", "11", "80", "20", null, null, this.div_search);
            obj.set_taborder("195");
            obj.set_text("연락처");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static09", "absolute", "1122", "0", "25", "496", null, null, this.div_search);
            obj.set_taborder("196");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static05", "absolute", "400", "11", "80", "20", null, null, this.div_search);
            obj.set_taborder("197");
            obj.set_text("고객명");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static22", "absolute", "0", "0", "1118", "12", null, null, this.div_search);
            obj.set_taborder("198");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static13", "absolute", "375", "0", "25", "65", null, null, this.div_search);
            obj.set_taborder("199");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static14", "absolute", "600", "0", "25", "65", null, null, this.div_search);
            obj.set_taborder("200");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static15", "absolute", "0", "0", "25", "109", null, null, this.div_search);
            obj.set_taborder("201");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static10", "absolute", "0", "32", "1118", "6", null, null, this.div_search);
            obj.set_taborder("202");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "25", "38", "80", "20", null, null, this.div_search);
            obj.set_taborder("203");
            obj.set_text("만료일자");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_custNm", "absolute", "480", "12", "120", "21", null, null, this.div_search);
            obj.set_taborder("204");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("dt_procFday", "absolute", "117", "12", "120", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("205");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Static("Static00", "absolute", "240", "12", "10", "21", null, null, this.div_search);
            obj.set_taborder("206");
            obj.set_text("~");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("dt_procTday", "absolute", "256", "12", "120", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("207");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Edit("ed_mobNo", "absolute", "713", "12", "111", "21", null, null, this.div_search);
            obj.set_taborder("208");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "850", "12", "80", "20", null, null, this.div_search);
            obj.set_taborder("209");
            obj.set_text("계약번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_ordNo", "absolute", "937", "12", "139", "21", null, null, this.div_search);
            obj.set_taborder("210");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_orderNo", "absolute", "1055", "12", "21", "21", null, null, this.div_search);
            obj.set_taborder("211");
            obj.set_cssclass("btn_WF_edtSch");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static07", "absolute", "824", "8", "25", "57", null, null, this.div_search);
            obj.set_taborder("212");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_osDayFrom", "absolute", "117", "38", "120", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("213");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Static("Static08", "absolute", "240", "38", "10", "21", null, null, this.div_search);
            obj.set_taborder("214");
            obj.set_text("~");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_osDayTo", "absolute", "256", "38", "120", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("215");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Static("Static16", "absolute", "849", "40", "80", "20", null, null, this.div_search);
            obj.set_taborder("216");
            obj.set_text("상태");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_stat", "absolute", "84.04%", "38", null, "20", "9.78%", null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("217");
            obj.set_innerdataset("dsS103");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj = new Combo("cb_statDetl", "absolute", "90.22%", "38", null, "20", "3.5%", null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("218");
            obj.set_innerdataset("dsS104");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj = new Static("st_custNm04", "absolute", "626", "38", "83", "21", null, null, this.div_search);
            obj.set_taborder("221");
            obj.set_text("재컨택일자");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_recallDay", "absolute", "713", "38", "111", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("222");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Static("Static11", "absolute", "8", "83", "1118", "12", null, null, this.div_search);
            obj.set_taborder("224");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static18", "absolute", "399", "39", "80", "20", null, null, this.div_search);
            obj.set_taborder("229");
            obj.set_text("상담사");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_callId", "absolute", "480", "38", "120", "21", null, null, this.div_search);
            obj.set_taborder("230");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_date01", "absolute", "24", "61", "80", "21", null, null, this.div_search);
            obj.set_taborder("231");
            obj.set_text("가계약번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_provsnNoF", "absolute", "117", "62", "119", "21", null, null, this.div_search);
            obj.set_taborder("232");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static19", "absolute", "240", "63", "9", "21", null, null, this.div_search);
            obj.set_taborder("233");
            obj.set_text("~");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_provsnNoT", "absolute", "256", "62", "120", "21", null, null, this.div_search);
            obj.set_taborder("234");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static12", "absolute", "0", "56", "1118", "6", null, null, this.div_search);
            obj.set_taborder("235");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1119, 99, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("0");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1123, 119, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTSDProvisionalContractContact_tab01");
            		p.set_titletext("New Form");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTSDReRentalContact_tab01.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDReRentalContact_tab01.xfdl", function() {
        /***************************************************************************************************
         * 파 일 명 : RTSDReRentalContact_tab01.xfdl
         * 설    명 : 재렌탈상담_조회1
         * 작 성 자 : 
         * 변경이력 :
         * ---------------------------------
         * 변경일자		변경자		변경내용
         * --------------------------------- 
         * 2023-06-13   	kstka		[20230613_01] 신규생성
         ***************************************************************************************************/

        //include "lib::comLib.xjs";

        /**
         * 폼의 모든 컴포넌트가 생성되고, 모든 오브젝트가 로딩되었을 때 이벤트 처리
         */
        this.RTSDReRentalContact_tab01_onload = function(obj,e) {
        	//Ex.core.init(obj);	
        }

        /**
         * 상태 조회조건 콤보에서 변경된 값이 적용된 후 이벤트 처리
         */
        this.div_search_cb_stat_onitemchanged = function(obj,e)
        {
        	this.dsS104.filter("");
        	if (e.postvalue == "") {
        		this.dsS104.filter("cd == ''");
        	} else {
        		this.dsS104.filter("cd == '' || cd.substr(0,1) == '" + e.postvalue.substring(0,1) + "'");
        	}
        	
        	this.div_search.cb_statDetl.set_value("");
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTSDProvisionalContractContact_tab01_onload, this);
            this.div_search.ed_custNm.addEventHandler("onkeyup", this.div_search_ed_custCd_onkeyup, this);
            this.div_search.ed_mobNo.addEventHandler("onkeyup", this.div_search_ed_custCd_onkeyup, this);
            this.div_search.btn_orderNo.addEventHandler("onclick", this.div_search_bt_ordNo_onclick, this);
            this.div_search.cb_stat.addEventHandler("onitemchanged", this.div_search_cb_stat_onitemchanged, this);
            this.div_search.ed_callId.addEventHandler("onkeyup", this.div_search_ed_custCd_onkeyup, this);

        };

        this.loadIncludeScript("RTSDReRentalContact_tab01.xfdl");

       
    };
}
)();
