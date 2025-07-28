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
                this.set_name("RTSDProvisionalContractContact_tab01");
                this.set_classname("RTSDProvisionalContractContact_tab01");
                this.set_titletext("New Form");
                this._setFormPosition(0,0,1091,97);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_S093_cond", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_S094_cond", this);
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
            obj = new Static("Static10", "absolute", "217", "14", "9", "53", null, null, this);
            obj.set_taborder("0");
            obj.set_text("~");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "0", "0", "1090", "97", null, null, this);
            obj.set_taborder("1");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_date", "absolute", "20", "8", "80", "21", null, null, this.div_search);
            obj.set_taborder("31");
            obj.set_text("주문접수일");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static07", "absolute", "0", "0", "1091", "8", null, null, this.div_search);
            obj.set_taborder("32");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "0", "0", "20", "94", null, null, this.div_search);
            obj.set_taborder("33");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static10", "absolute", "0", "29", "1091", "8", null, null, this.div_search);
            obj.set_taborder("35");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_custNm", "absolute", "349", "8", "52", "21", null, null, this.div_search);
            obj.set_taborder("36");
            obj.set_text("고객명");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_custNm", "absolute", "411", "8", "104", "21", null, null, this.div_search);
            obj.set_taborder("37");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cmb_condProvsnSt", "absolute", "596", "36", "81", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("40");
            obj.set_innerdataset("ds_S093_cond");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("6");
            obj = new Combo("cmb_condProvsnStDtl", "absolute", "681", "36", "144", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("41");
            obj.set_innerdataset("ds_S094_cond");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj = new Static("st_custNm00", "absolute", "535", "36", "52", "21", null, null, this.div_search);
            obj.set_taborder("43");
            obj.set_text("상태");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_custNm01", "absolute", "534", "8", "52", "21", null, null, this.div_search);
            obj.set_taborder("45");
            obj.set_text("연락처");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_mobNo", "absolute", "596", "8", "120", "21", null, null, this.div_search);
            obj.set_taborder("46");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_custNm02", "absolute", "350", "36", "52", "21", null, null, this.div_search);
            obj.set_taborder("47");
            obj.set_text("상담사");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_callId", "absolute", "411", "36", "104", "21", null, null, this.div_search);
            obj.set_taborder("48");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static11", "absolute", "0", "57", "1091", "8", null, null, this.div_search);
            obj.set_taborder("49");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_date00", "absolute", "20", "36", "80", "21", null, null, this.div_search);
            obj.set_taborder("51");
            obj.set_text("상담일자");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_condCallDayFrom", "absolute", "109", "37", "100", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("52");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Static("Static13", "absolute", "215", "40", "9", "21", null, null, this.div_search);
            obj.set_taborder("53");
            obj.set_text("~");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_condCallDayTo", "absolute", "229", "37", "100", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("54");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Static("st_custNm03", "absolute", "741", "8", "52", "21", null, null, this.div_search);
            obj.set_taborder("57");
            obj.set_text("판매처");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cmb_condSaleId", "absolute", "820", "8", "141", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("58");
            obj.set_innerdataset("ds_user");
            obj.set_codecolumn("userId");
            obj.set_datacolumn("userNm");
            obj.set_displayrowcount("6");
            obj = new Static("st_custNm04", "absolute", "844", "36", "83", "21", null, null, this.div_search);
            obj.set_taborder("59");
            obj.set_text("재컨택일자");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_recallDay", "absolute", "943", "36", "100", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("60");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Static("Static14", "absolute", "215", "10", "9", "21", null, null, this.div_search);
            obj.set_taborder("62");
            obj.set_text("~");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_date01", "absolute", "20", "65", "80", "21", null, null, this.div_search);
            obj.set_taborder("63");
            obj.set_text("가계약번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "0", "85", "1091", "8", null, null, this.div_search);
            obj.set_taborder("67");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_provsnNoF", "absolute", "111", "67", "100", "21", null, null, this.div_search);
            obj.set_taborder("4");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static19", "absolute", "217", "68", "9", "21", null, null, this.div_search);
            obj.set_taborder("5");
            obj.set_text("~");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_provsnNoT", "absolute", "231", "67", "100", "21", null, null, this.div_search);
            obj.set_taborder("6");
            this.div_search.addChild(obj.name, obj);

            obj = new Calendar("cal_condProvsnDayFrom", "absolute", "111", "10", "100", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("2");
            obj.set_dateformat("yyyy-MM-dd");

            obj = new Calendar("cal_condProvsnDayTo", "absolute", "231", "10", "100", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("3");
            obj.set_dateformat("yyyy-MM-dd");


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1112, 49, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("1");
            		p.set_scrollbars("none");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1091, 97, this,
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
        this.addIncludeScript("RTSDProvisionalContractContact_tab01.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDProvisionalContractContact_tab01.xfdl", function() {
        /***************************************************************************************************
         * 파 일 명 : RTSDProvisionalContractContact_tab01.xfdl
         * 설    명 : 가계약상담_조회1
         * 작 성 자 : 
         * 변경이력 :
         * ---------------------------------
         * 변경일자		변경자		변경내용
         * --------------------------------- 
         * 2019-07-30	wjim		[20190716_01] 신규생성
         ***************************************************************************************************/

        //include "lib::comLib.xjs";

        /**
         * 폼의 모든 컴포넌트가 생성되고, 모든 오브젝트가 로딩되었을 때 이벤트 처리
         */
        this.RTSDProvisionalContractContact_tab01_onload = function(obj,e) {
        	//Ex.core.init(obj);	
        }

        /**
         * 상태 조회조건 콤보에서 변경된 값이 적용된 후 이벤트 처리
         */
        this.div_search_cmb_condProvsnSt_onitemchanged = function(obj,e) {
        	if (e.postvalue == "") {
        		this.ds_S094_cond.filter("cd == ''");
        	} else {
        		this.ds_S094_cond.filter("cd == '' || cd.substr(0,2) == '" + e.postvalue + "'");
        	}
        	
        	this.div_search.cmb_condProvsnStDtl.set_value("");
        }
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTSDProvisionalContractContact_tab01_onload, this);
            this.div_search.cmb_condProvsnSt.addEventHandler("onitemchanged", this.div_search_cmb_condProvsnSt_onitemchanged, this);
            this.div_search.cmb_condSaleId.addEventHandler("onitemchanged", this.div_search_cmb_condProvsnSt_onitemchanged, this);

        };

        this.loadIncludeScript("RTSDProvisionalContractContact_tab01.xfdl");

       
    };
}
)();
