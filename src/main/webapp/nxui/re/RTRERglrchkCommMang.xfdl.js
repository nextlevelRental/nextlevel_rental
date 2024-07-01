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
                this.set_name("RTRERglrchkCommMang");
                this.set_classname("RTRERglrchkCommMang");
                this.set_titletext("정기점검수수료 관리");
                this._setFormPosition(0,0,1122,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize

            
            // UI Components Initialize
            obj = new Tab("Tab02", "absolute", "0", "0", "1122", "496", null, null, this);
            obj.set_taborder("0");
            obj.set_tabindex("0");
            obj.set_scrollbars("autoboth");
            obj.style.set_showextrabutton("false");
            this.addChild(obj.name, obj);
            obj = new Tabpage("tabpage1", this.Tab02);
            obj.set_text("[STEP 1] 지급대상 집계");
            obj.set_url("re::RTRERglrchkCommMang_tab1.xfdl");
            this.Tab02.addChild(obj.name, obj);
            obj = new Tabpage("tabpage2", this.Tab02);
            obj.set_text("[STEP 2] 변경대상 업로드");
            obj.set_url("re::RTRERglrchkCommMang_tab2.xfdl");
            this.Tab02.addChild(obj.name, obj);
            obj = new Tabpage("tabpage3", this.Tab02);
            obj.set_text("지급대상 조회");
            obj.set_url("re::RTRERglrchkCommMang_tab3.xfdl");
            this.Tab02.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "0", "0", "25", "496", null, null, this);
            obj.set_taborder("1");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.set_positionstep("1");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1122, 496, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTRERglrchkCommMang");
            		p.set_titletext("정기점검수수료 관리");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        
        this.loadPreloadList = function()
        {
            this._addPreloadList("fdl", "re::RTRERglrchkCommMang_tab1.xfdl");
            this._addPreloadList("fdl", "re::RTRERglrchkCommMang_tab2.xfdl");
            this._addPreloadList("fdl", "re::RTRERglrchkCommMang_tab3.xfdl");
        };
        
        // User Script
        this.addIncludeScript("RTRERglrchkCommMang.xfdl", "lib::comLib.xjs");
        this.registerScript("RTRERglrchkCommMang.xfdl", function() {
        /***************************************************************************************************
         * 파 일 명 : RTRERglrchkCommMang.xfdl
         * 설    명 : 정기점검수수료 관리
         * 작 성 자 : wjim
         * 변경이력 :
         * 변경일자		변경자		변경내용
         * ----------	------		--------
         * 2017-05-26	wjim		신규 개발
         ***************************************************************************************************/

        //include "lib::comLib.xjs";

        /**
         * 폼의 모든 컴포넌트가 생성되고, 모든 오브젝트가 로딩되었을 때 이벤트 처리
         */
        this.RTRERglrchkCommMang_onload = function(obj,e) {
        	// 폼 로드 공통함수
        	Ex.core.init(obj);
        }

        /**
         * 탭 이동 완료 시 이벤트 처리
         */
        this.Tab02_onchanged = function(obj,e) {
        	// 탭 페이지별 화면 초기화
        	switch (obj.tabindex) {
        		case 0:
        			this.Tab02.tabpage1.fn_init();
        			break;		
        		case 1:
        			this.Tab02.tabpage2.fn_init();		
        			break;		
        		case 2:
        			this.Tab02.tabpage3.fn_init();		
        			break;									
        		default:
        			break;
        	}
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTRERglrchkCommMang_onload, this);
            this.Tab02.addEventHandler("onchanged", this.Tab02_onchanged, this);

        };

        this.loadIncludeScript("RTRERglrchkCommMang.xfdl");
        this.loadPreloadList();
       
    };
}
)();
