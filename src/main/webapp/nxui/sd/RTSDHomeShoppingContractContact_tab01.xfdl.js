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
                this.set_name("RTSDHomeShoppingContractContact_tab01");
                this.set_classname("RTSDHomeShoppingContractContact_tab01");
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

            obj = new Dataset("ds_S096", this);
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
            obj = new Div("div_search", "absolute", "0", "0", "1091", "97", null, null, this);
            obj.set_taborder("0");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_date", "absolute", "16", "7", "80", "21", null, null, this.div_search);
            obj.set_taborder("42");
            obj.set_text("주문접수일");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_custNm", "absolute", "356", "7", "52", "21", null, null, this.div_search);
            obj.set_taborder("47");
            obj.set_text("고객명");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_custNm", "absolute", "429", "7", "104", "21", null, null, this.div_search);
            obj.set_taborder("48");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cmb_condProvsnSt", "absolute", "625", "34", "81", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("51");
            obj.set_innerdataset("ds_S093_cond");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("6");
            obj = new Combo("cmb_condProvsnStDtl", "absolute", "710", "34", "144", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("52");
            obj.set_innerdataset("ds_S094_cond");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj = new Static("st_custNm00", "absolute", "553", "34", "52", "21", null, null, this.div_search);
            obj.set_taborder("54");
            obj.set_text("상태");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_custNm01", "absolute", "552", "7", "52", "21", null, null, this.div_search);
            obj.set_taborder("56");
            obj.set_text("연락처");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_mobNo", "absolute", "625", "7", "120", "21", null, null, this.div_search);
            obj.set_taborder("57");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_custNm02", "absolute", "357", "34", "52", "21", null, null, this.div_search);
            obj.set_taborder("58");
            obj.set_text("상담사");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_callId", "absolute", "429", "34", "104", "21", null, null, this.div_search);
            obj.set_taborder("59");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_date00", "absolute", "16", "34", "80", "21", null, null, this.div_search);
            obj.set_taborder("62");
            obj.set_text("상담일자");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_condCallDayFrom", "absolute", "116", "35", "100", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("63");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Static("Static13", "absolute", "222", "38", "9", "21", null, null, this.div_search);
            obj.set_taborder("64");
            obj.set_text("~");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_condCallDayTo", "absolute", "236", "35", "100", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("65");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Static("Static14", "absolute", "222", "9", "9", "21", null, null, this.div_search);
            obj.set_taborder("67");
            obj.set_text("~");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_custNm03", "absolute", "770", "7", "52", "21", null, null, this.div_search);
            obj.set_taborder("68");
            obj.set_text("방송사");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cmb_homeshoppingList", "absolute", "849", "7", "141", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("69");
            obj.set_innerdataset("ds_S096");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("6");
            obj = new Static("st_custNm04", "absolute", "873", "34", "83", "21", null, null, this.div_search);
            obj.set_taborder("71");
            obj.set_text("재컨택일자");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_recallDay", "absolute", "972", "34", "100", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("72");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Static("st_date01", "absolute", "16", "64", "80", "21", null, null, this.div_search);
            obj.set_taborder("75");
            obj.set_text("가계약번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_provsnNoF", "absolute", "115", "65", "107", "21", null, null, this.div_search);
            obj.set_taborder("77");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_provsnNoT", "absolute", "236", "65", "107", "21", null, null, this.div_search);
            obj.set_taborder("79");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static19", "absolute", "223", "66", "9", "21", null, null, this.div_search);
            obj.set_taborder("81");
            obj.set_text("~");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_imageYn", "absolute", "357", "65", "52", "21", null, null, this.div_search);
            obj.set_taborder("82");
            obj.set_text("이미지");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cmb_imgYn", "absolute", "429", "65", "81", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("83");
            obj.set_innerdataset("ds_imgYn");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("6");
            obj = new Calendar("cal_condProvsnDayFrom", "absolute", "116", "7", "100", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("84");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Calendar("cal_condProvsnDayTo", "absolute", "236", "7", "100", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("85");
            obj.set_dateformat("yyyy-MM-dd");


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1112, 49, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("0");
            		p.set_scrollbars("none");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1091, 97, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTSDHomeShoppingContractContact_tab01");
            		p.set_titletext("New Form");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTSDHomeShoppingContractContact_tab01.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDHomeShoppingContractContact_tab01.xfdl", function() {
        /***************************************************************************************************
         * 파 일 명 : RTSDHomeShoppingContractContact_tab01.xfdl
         * 설    명 : 홈쇼핑가계약상담_조회1
         * 작 성 자 : 
         * 변경이력 :
         * ---------------------------------
         * 변경일자		변경자		변경내용
         * --------------------------------- 
         * 2019-07-16	wjim		[20190716_01] 신규생성
         ***************************************************************************************************/

        //include "lib::comLib.xjs";

        /**
         * 폼의 모든 컴포넌트가 생성되고, 모든 오브젝트가 로딩되었을 때 이벤트 처리
         */
        this.RTSDHomeShoppingContractContact_tab01_onload = function(obj,e) {
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
            this.ds_S096.addEventHandler("onrowposchanged", this.checkSaveMode, this);
            this.addEventHandler("onload", this.RTSDHomeShoppingContractContact_tab01_onload, this);
            this.div_search.cmb_condProvsnSt.addEventHandler("onitemchanged", this.div_search_cmb_condProvsnSt_onitemchanged, this);
            this.div_search.cmb_homeshoppingList.addEventHandler("onitemchanged", this.div_search_cmb_condProvsnSt_onitemchanged, this);
            this.div_search.cmb_imgYn.addEventHandler("onitemchanged", this.div_search_cmb_condProvsnSt_onitemchanged, this);

        };

        this.loadIncludeScript("RTSDHomeShoppingContractContact_tab01.xfdl");

       
    };
}
)();
