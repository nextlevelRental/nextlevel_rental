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
                this.set_name("RTCOMMLogistics_pop");
                this.set_classname("RTCMVkgrp");
                this.set_cssclass("from_POP");
                this.set_titletext("택배배송조회 팝업");
                this._setFormPosition(0,0,415,586);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize

            
            // UI Components Initialize
            obj = new WebBrowser("WebBrowser00", "absolute", "1.2%", "7", null, "573", "1.2%", null, this);
            obj.set_taborder("0");
            obj.set_url("https://portal.tirerental.co.kr/interface/sweettracker/tracking_main.jsp");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 415, 586, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCMVkgrp");
            		p.set_cssclass("from_POP");
            		p.set_titletext("택배배송조회 팝업");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCOMMLogistics_pop.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCOMMLogistics_pop.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분 : 수금관리 > 결제정보관리 > 결제정보변경 > 고객계좌선택 팝업
         * 02. 그룹명   : RTREAccount_POPUP.xfdl
         * 03. 그룹설명 : 리스트=> 암호화-계좌번호
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
         * FORM 변수 선언 영역
        ************************************************************************/

        /***********************************************************************
         * 그룹 변수 선언부
         ************************************************************************/
            //-------------------------------------------------------------------------------   
        	//폼로드시 공통함수      
        	//-------------------------------------------------------------------------------   	
        	this.form_onload = function (obj,e)
        	{
        		Ex.core.init(obj);
        	}
        	 
            //-------------------------------------------------------------------------------  	
        	//닫기버튼 클릭시
            //-------------------------------------------------------------------------------  	
        	this.fn_close = function(obj,e)
        	{
        		this.close();
        	}
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.addEventHandler("onkeyup", this.RTCOMMAccount_pop_onkeyup, this);

        };

        this.loadIncludeScript("RTCOMMLogistics_pop.xfdl");

       
    };
}
)();
