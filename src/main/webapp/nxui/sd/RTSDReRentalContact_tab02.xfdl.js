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
                this.set_name("RTSDReRentalContact_tab02");
                this.set_classname("RTSDProvisionalContractContact_tab01");
                this.set_titletext("New Form");
                this._setFormPosition(0,0,1123,119);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize

            
            // UI Components Initialize
            obj = new Div("div_search", "absolute", "0", "1", "1119", "99", null, null, this);
            obj.set_taborder("0");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "250", "11", "80", "20", null, null, this.div_search);
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
            obj = new Static("Static05", "absolute", "24", "11", "80", "20", null, null, this.div_search);
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
            obj = new Static("Static13", "absolute", "223", "0", "25", "101", null, null, this.div_search);
            obj.set_taborder("199");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static14", "absolute", "448", "0", "25", "101", null, null, this.div_search);
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
            obj = new Edit("ed_custNm", "absolute", "104", "12", "120", "21", null, null, this.div_search);
            obj.set_taborder("204");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_mobNo", "absolute", "337", "12", "111", "21", null, null, this.div_search);
            obj.set_taborder("208");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static07", "absolute", "800", "8", "25", "93", null, null, this.div_search);
            obj.set_taborder("212");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static11", "absolute", "8", "83", "1118", "12", null, null, this.div_search);
            obj.set_taborder("224");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_date01", "absolute", "473", "11", "80", "21", null, null, this.div_search);
            obj.set_taborder("231");
            obj.set_text("가계약번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_provsnNoF", "absolute", "572", "12", "107", "21", null, null, this.div_search);
            obj.set_taborder("232");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static19", "absolute", "680", "13", "9", "21", null, null, this.div_search);
            obj.set_taborder("233");
            obj.set_text("~");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_provsnNoT", "absolute", "693", "12", "107", "21", null, null, this.div_search);
            obj.set_taborder("234");
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
        this.addIncludeScript("RTSDReRentalContact_tab02.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDReRentalContact_tab02.xfdl", function() {
        /***************************************************************************************************
         * 파 일 명 : RTSDReRentalContact_tab01.xfdl
         * 설    명 : 재렌탈상담_조회2
         * 작 성 자 : 
         * 변경이력 :
         * ---------------------------------
         * 변경일자		변경자		변경내용
         * --------------------------------- 
         * 2023-06-13	    kstka		[20230613_01] 신규생성
         ***************************************************************************************************/

        //include "lib::comLib.xjs";

        /**
         * 폼의 모든 컴포넌트가 생성되고, 모든 오브젝트가 로딩되었을 때 이벤트 처리
         */
        this.RTSDReRentalContact_tab01_onload = function(obj,e) {
        	//Ex.core.init(obj);	
        }
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTSDProvisionalContractContact_tab01_onload, this);
            this.div_search.ed_custNm.addEventHandler("onkeyup", this.div_search_ed_custCd_onkeyup, this);
            this.div_search.ed_mobNo.addEventHandler("onkeyup", this.div_search_ed_custCd_onkeyup, this);

        };

        this.loadIncludeScript("RTSDReRentalContact_tab02.xfdl");

       
    };
}
)();
