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
                this.set_name("form");
                this.set_classname("Authority");
                this.set_titletext("결제정보변경");
                this._setFormPosition(0,0,1147,496);
            }
            this.getSetter("inheritanceid").set("");

            
            // Object(Dataset, ExcelExportObject) Initialize

            
            // UI Components Initialize
            obj = new Tab("tabPayment", "absolute", "0", "0", "1122", "578", null, null, this);
            obj.set_taborder("0");
            obj.set_tabindex("0");
            obj.style.set_buttonpadding("7 10 7 10");
            obj.style.set_showextrabutton("false");
            obj.set_tabjustify("false");
            this.addChild(obj.name, obj);
            obj = new Tabpage("RTREPaymentTab1", this.tabPayment);
            obj.set_text("결제방법 및 결제일 변경");
            obj.set_url("re::RTREPayment_tab1.xfdl");
            this.tabPayment.addChild(obj.name, obj);
            obj = new Tabpage("RTREPaymentTab2", this.tabPayment);
            obj.set_text("변경 HISTORY");
            obj.set_enableevent("true");
            obj.set_enable("true");
            obj.set_url("re::RTREPayment_tab2.xfdl");
            this.tabPayment.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1122", "0", "25", "496", null, null, this);
            obj.set_taborder("1");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1147, 496, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("Authority");
            		p.getSetter("inheritanceid").set("");
            		p.set_titletext("결제정보변경");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        
        this.loadPreloadList = function()
        {
            this._addPreloadList("fdl", "re::RTREPayment_tab1.xfdl");
            this._addPreloadList("fdl", "re::RTREPayment_tab2.xfdl");
        };
        
        // User Script
        this.addIncludeScript("RTREPayment.xfdl", "lib::comLib.xjs");
        this.registerScript("RTREPayment.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분 : 수금관리 > 결제정보변경
         * 02. 그룹명   : RTREPayment.xfdl
         * 03. 그룹설명 :
         * 04. 작성일   :
         * 05. 작성자   : 
         * 06. 수정이력 :
         ***********************************************************************
         *     수정일     작성자   내용
         ***********************************************************************
         *
         ***********************************************************************
         */

        /***********************************************************************
         * Script Include 
         ************************************************************************/
        //include "lib::comLib.xjs";

        	/***********************************************************************
        	 * 그룹 변수 선언부
        	 ************************************************************************/
            //-------------------------------------------------------------------------------   
        	//폼로드시 공통함수      
        	//-------------------------------------------------------------------------------  
        	this.form_onload = function(obj,e)
        	{
        		Ex.core.init(obj); 	
        		this.parent.setButton("",this);		
        	} 
        		 
        	/***********************************************************************************
        	* Transaction Function
        	***********************************************************************************/

        	/***********************************************************************************
        	* CallBack Event (strSvcId - Sevice ID, nErrorCode - ErrorCode, strErrorMsg - Error Message)
        	***********************************************************************************/

        	/***********************************************************************************
        	* Component Event
        	***********************************************************************************/

        	/***********************************************************************************
        	* User Function
        	***********************************************************************************/
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);

        };

        this.loadIncludeScript("RTREPayment.xfdl");
        this.loadPreloadList();
       
    };
}
)();
