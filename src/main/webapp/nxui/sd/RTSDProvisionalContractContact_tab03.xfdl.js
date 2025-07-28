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
                this.set_name("RTSDProvisionalContractContact_tab03");
                this.set_classname("RTSDProvisionalContractContact_tab03");
                this.set_titletext("New Form");
                this._setFormPosition(0,0,1091,97);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize

            
            // UI Components Initialize
            obj = new Div("div_search", "absolute", "0", "0", "1090", "81", null, null, this);
            obj.set_taborder("1");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("Static07", "absolute", "0", "0", "1108", "12", null, null, this.div_search);
            obj.set_taborder("88");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "0", "0", "20", "45", null, null, this.div_search);
            obj.set_taborder("89");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static10", "absolute", "0", "33", "1108", "12", null, null, this.div_search);
            obj.set_taborder("90");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static11", "absolute", "8", "65", "1108", "12", null, null, this.div_search);
            obj.set_taborder("100");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static12", "absolute", "0", "32", "20", "45", null, null, this.div_search);
            obj.set_taborder("101");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_custNm04", "absolute", "20", "12", "83", "21", null, null, this.div_search);
            obj.set_taborder("108");
            obj.set_text("재컨택일자");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_recallDay", "absolute", "119", "12", "100", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("109");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Static("st_custNm02", "absolute", "229", "12", "52", "21", null, null, this.div_search);
            obj.set_taborder("110");
            obj.set_text("상담사");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_callId", "absolute", "301", "12", "104", "21", null, null, this.div_search);
            obj.set_taborder("111");
            this.div_search.addChild(obj.name, obj);


            
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
            		p.set_classname("RTSDProvisionalContractContact_tab03");
            		p.set_titletext("New Form");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTSDProvisionalContractContact_tab03.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDProvisionalContractContact_tab03.xfdl", function() {
        /***************************************************************************************************
         * 파 일 명 : RTSDProvisionalContractContact_tab03.xfdl
         * 설    명 : 가계약상담_조회3
         * 작 성 자 : 
         * 변경이력 :
         * ---------------------------------
         * 변경일자		변경자		변경내용
         * --------------------------------- 
         * 2019-07-30	wjim		[20190716_01] 신규생성
         * 2019-08-08	wjim		[20190808_01] 조회조건3 상담사 조회조건 추가
         ***************************************************************************************************/

        //include "lib::comLib.xjs";

        /**
         * 폼의 모든 컴포넌트가 생성되고, 모든 오브젝트가 로딩되었을 때 이벤트 처리
         */
        this.RTSDProvisionalContractContact_tab03_onload = function(obj,e) {
        	//Ex.core.init(obj);
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTSDProvisionalContractContact_tab03_onload, this);

        };

        this.loadIncludeScript("RTSDProvisionalContractContact_tab03.xfdl");

       
    };
}
)();
