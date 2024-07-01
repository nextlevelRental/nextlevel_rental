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
                this.set_name("RTSDProvisionalContractContact_tab02");
                this.set_classname("RTSDProvisionalContractContact_tab02");
                this.set_titletext("New Form");
                this._setFormPosition(0,0,1091,82);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize

            
            // UI Components Initialize
            obj = new Static("Static10", "absolute", "217", "14", "9", "53", null, null, this);
            obj.set_taborder("0");
            obj.set_text("~");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "0", "0", "1090", "81", null, null, this);
            obj.set_taborder("1");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("Static07", "absolute", "0", "0", "1108", "12", null, null, this.div_search);
            obj.set_taborder("64");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "0", "0", "20", "45", null, null, this.div_search);
            obj.set_taborder("65");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static10", "absolute", "0", "33", "1108", "12", null, null, this.div_search);
            obj.set_taborder("66");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_custNm", "absolute", "20", "12", "52", "21", null, null, this.div_search);
            obj.set_taborder("67");
            obj.set_text("고객명");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_custNm", "absolute", "82", "12", "104", "21", null, null, this.div_search);
            obj.set_taborder("68");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_custNm01", "absolute", "205", "12", "52", "21", null, null, this.div_search);
            obj.set_taborder("72");
            obj.set_text("연락처");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_mobNo", "absolute", "267", "12", "120", "21", null, null, this.div_search);
            obj.set_taborder("73");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static11", "absolute", "8", "65", "1108", "12", null, null, this.div_search);
            obj.set_taborder("76");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static12", "absolute", "0", "32", "20", "45", null, null, this.div_search);
            obj.set_taborder("77");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_date01", "absolute", "412", "11", "80", "21", null, null, this.div_search);
            obj.set_taborder("78");
            obj.set_text("가계약번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_provsnNoF", "absolute", "511", "12", "107", "21", null, null, this.div_search);
            obj.set_taborder("79");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static19", "absolute", "619", "13", "9", "21", null, null, this.div_search);
            obj.set_taborder("80");
            obj.set_text("~");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_provsnNoT", "absolute", "632", "12", "107", "21", null, null, this.div_search);
            obj.set_taborder("81");
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
            obj = new Layout("default", "", 1091, 82, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTSDProvisionalContractContact_tab02");
            		p.set_titletext("New Form");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTSDProvisionalContractContact_tab02.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDProvisionalContractContact_tab02.xfdl", function() {
        /***************************************************************************************************
         * 파 일 명 : RTSDProvisionalContractContact_tab02.xfdl
         * 설    명 : 가계약상담_조회2
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
        this.RTSDProvisionalContractContact_tab02_onload = function(obj,e) {
        	//Ex.core.init(obj);
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTSDProvisionalContractContact_tab02_onload, this);

        };

        this.loadIncludeScript("RTSDProvisionalContractContact_tab02.xfdl");

       
    };
}
)();
