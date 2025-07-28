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
                this.set_name("RTREPaymentComm");
                this.set_classname("RTREPaymentComm");
                this.set_titletext("수납공통화면");
                this._setFormPosition(0,0,1147,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize

            
            // UI Components Initialize
            obj = new Tab("RTREPaymentCommTab", "absolute", "0", "0", null, "496", "25", null, this);
            obj.set_taborder("0");
            obj.set_tabindex("0");
            obj.set_scrollbars("autoboth");
            obj.style.set_showextrabutton("false");
            this.addChild(obj.name, obj);
            obj = new Tabpage("RTREPaymentComm_tab1", this.RTREPaymentCommTab);
            obj.set_text("연체금");
            obj.set_url("re::RTREPaymentComm_tab1.xfdl");
            this.RTREPaymentCommTab.addChild(obj.name, obj);
            obj = new Tabpage("RTREPaymentComm_tab2", this.RTREPaymentCommTab);
            obj.set_text("선납할인");
            obj.set_url("re::RTREPaymentComm_tab2.xfdl");
            this.RTREPaymentCommTab.addChild(obj.name, obj);
            obj = new Tabpage("RTREPaymentComm_tab3", this.RTREPaymentCommTab);
            obj.set_text("중도완납");
            obj.set_url("re::RTREPaymentComm_tab3.xfdl");
            this.RTREPaymentCommTab.addChild(obj.name, obj);
            obj = new Tabpage("RTREPaymentComm_tab4", this.RTREPaymentCommTab);
            obj.set_text("수금취소");
            obj.set_url("re::RTREPaymentComm_tab4.xfdl");
            this.RTREPaymentCommTab.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1122", "0", "25", "496", null, null, this);
            obj.set_taborder("1");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1147, 496, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTREPaymentComm");
            		p.set_titletext("수납공통화면");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        
        this.loadPreloadList = function()
        {
            this._addPreloadList("fdl", "re::RTREPaymentComm_tab1.xfdl");
            this._addPreloadList("fdl", "re::RTREPaymentComm_tab2.xfdl");
            this._addPreloadList("fdl", "re::RTREPaymentComm_tab3.xfdl");
            this._addPreloadList("fdl", "re::RTREPaymentComm_tab4.xfdl");
        };
        
        // User Script
        this.addIncludeScript("RTREPaymentComm.xfdl", "lib::comLib.xjs");
        this.registerScript("RTREPaymentComm.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분	: 수금관리 > 수납공통화면
         * 02. 그룹명		: RTREPaymentComm.xfdl
         * 03. 그룹설명	: 
         * 04. 작성일		: 2018-11-09
         * 05. 작성자		: 노창호
         * 06. 수정이력	: 
         ***********************************************************************
         *		수정일			작성자		내용
         ***********************************************************************
         *		2018-11-09		노창호		최초작성
         ***********************************************************************/

        /***********************************************************************
         * Script Include
         ***********************************************************************/
        //include "lib::comLib.xjs";

        /***********************************************************************
         * FORM 변수 선언 영역
         ***********************************************************************/
        this.p_arg = "RTREPaymentComm";

        /***********************************************************************************
         * Form Load Common Function
         ***********************************************************************************/
        this.RTREPaymentComm_onload = function(obj,e) {
        	Ex.core.init(obj);
        }

        /***********************************************************************************
         * Component Event & Function
         ***********************************************************************************/
        this.RTREPaymentCommTab_onchanged = function(obj,e) {
        	switch(obj.tabindex) {
        		case 0:
        			break;
        		case 1:
        			break;
        		case 2:
        			break;
        		case 3:
        			break;
        		default:
        			break;
        	}
        }
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTREPaymentComm_onload, this);
            this.RTREPaymentCommTab.addEventHandler("onchanged", this.RTREPaymentCommTab_onchanged, this);

        };

        this.loadIncludeScript("RTREPaymentComm.xfdl");
        this.loadPreloadList();
       
    };
}
)();
