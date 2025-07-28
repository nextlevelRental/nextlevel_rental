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
                this.set_name("RTSDHomeShoppingContractContact_tab03");
                this.set_classname("RTSDHomeShoppingContractContact_tab03");
                this.set_titletext("New Form");
                this._setFormPosition(0,0,1091,97);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize

            
            // UI Components Initialize
            obj = new Div("div_search", "absolute", "0", "0", "1091", "97", null, null, this);
            obj.set_taborder("0");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_custNm04", "absolute", "17", "10", "83", "21", null, null, this.div_search);
            obj.set_taborder("103");
            obj.set_text("재컨택일자");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_recallDay", "absolute", "116", "10", "100", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("104");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Static("st_custNm02", "absolute", "229", "10", "52", "21", null, null, this.div_search);
            obj.set_taborder("105");
            obj.set_text("상담사");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_callId", "absolute", "301", "10", "104", "21", null, null, this.div_search);
            obj.set_taborder("106");
            this.div_search.addChild(obj.name, obj);


            
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
            		p.set_classname("RTSDHomeShoppingContractContact_tab03");
            		p.set_titletext("New Form");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTSDHomeShoppingContractContact_tab03.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDHomeShoppingContractContact_tab03.xfdl", function() {
        /***************************************************************************************************
         * 파 일 명 : RTSDHomeShoppingContractContact_tab03.xfdl
         * 설    명 : 홈쇼핑가계약상담_조회3
         * 작 성 자 : 
         * 변경이력 :
         * ---------------------------------
         * 변경일자		변경자		변경내용
         * --------------------------------- 
         * 2019-07-25	wjim		[20190716_01] 신규생성
         * 2019-08-08	wjim		[20190808_01] 조회조건3 상담사 조회조건 추가
         ***************************************************************************************************/

        //include "lib::comLib.xjs";

        /**
         * 폼의 모든 컴포넌트가 생성되고, 모든 오브젝트가 로딩되었을 때 이벤트 처리
         */
        this.RTSDHomeShoppingContractContact_tab03_onload = function(obj,e) {
        	//Ex.core.init(obj);
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTSDHomeShoppingContractContact_tab03_onload, this);

        };

        this.loadIncludeScript("RTSDHomeShoppingContractContact_tab03.xfdl");

       
    };
}
)();
