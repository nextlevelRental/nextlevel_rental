﻿(function()
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
                this.set_name("RTRECmsTranResult");
                this.set_classname("re00050_cms");
                this.set_titletext("CMS출금이체 결과처리");
                this._setFormPosition(0,0,1147,496);
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
            obj.set_text("[STEP 1] 결과파일반영");
            obj.set_url("re::RTRECmsTranResult_tab1.xfdl");
            this.Tab02.addChild(obj.name, obj);
            obj = new Tabpage("tabpage2", this.Tab02);
            obj.set_text("[STEP 2] 결과파일반영조회");
            obj.set_url("re::RTRECmsTranResult_tab2.xfdl");
            this.Tab02.addChild(obj.name, obj);
            obj = new Tabpage("tabpage3", this.Tab02);
            obj.set_text("[STEP 3] CMS수납처리");
            obj.set_url("re::RTRECmsTranResult_tab3.xfdl");
            this.Tab02.addChild(obj.name, obj);

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
            		p.set_classname("re00050_cms");
            		p.set_titletext("CMS출금이체 결과처리");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        
        this.loadPreloadList = function()
        {
            this._addPreloadList("fdl", "re::RTRECmsTranResult_tab1.xfdl");
            this._addPreloadList("fdl", "re::RTRECmsTranResult_tab2.xfdl");
            this._addPreloadList("fdl", "re::RTRECmsTranResult_tab3.xfdl");
        };
        
        // User Script
        this.addIncludeScript("RTRECmsTranResult.xfdl", "lib::comLib.xjs");
        this.registerScript("RTRECmsTranResult.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분 : 수금관리 > CMS관리 > CMS출금이체 결과처리
         * 02. 그룹명   : RTRECmsTranResult.xfdl
         * 03. 그룹설명 : 
         * 04. 작성일   :
         * 05. 작성자   :
         * 06. 수정이력 :
         ***********************************************************************
         *	수정일		작성자		내용
         ***********************************************************************
         *	2016-06-20	이영근		트랜젝션 대기시간 5분으로 연장
         *	2016-08-27	임욱재		트랜젝션 대기시간 15분으로 연장
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
        	this.form_onload = function(obj,e)
        	{ 
        		Ex.core.init(obj); 	
        		application.set_httptimeout(900); // 트랜젝션 대기시간 설정(900초=15분)
        	} 
        		 
        	/***********************************************************************************
        	* Transaction Function
        	***********************************************************************************/
         
        	/***********************************************************************************
        	* CallBack Event (strSvcId - Sevice ID, nErrorCode - ErrorCode, strErrorMsg - Error Message)
        	***********************************************************************************/
            //-------------------------------------------------------------------------------  	
        	// callBack함수 
            //-------------------------------------------------------------------------------  	
        	this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg)
        	{ 
        		if (nErrorCode < 0) 
        		{
        			return Ex.core.comMsg("alert",strErrorMsg);		
        		}
        		
        		switch (strSvcId) 
        		{
        			case "":
        				break;			
        			default:
        				break;
        		}
        	}

        	/***********************************************************************************
        	* Component Event
        	***********************************************************************************/
        	//---------------------------------------------------------------------------------
        	// Tab02_onchanged event
        	//---------------------------------------------------------------------------------	
        	  this.Tab02_onchanged = function(obj,e)
        	{
        		this.fn_getButton(obj.tabindex);
        	}
        	/***********************************************************************************
        	* User Function
        	***********************************************************************************/
        	//---------------------------------------------------------------------------------
        	// 탭변경시 버튼변경처리
        	//---------------------------------------------------------------------------------
        	this.fn_getButton = function(idx) {
        		switch (idx) 
        		{
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
            this.addEventHandler("onload", this.form_onload, this);
            this.Tab02.addEventHandler("onchanged", this.Tab02_onchanged, this);

        };

        this.loadIncludeScript("RTRECmsTranResult.xfdl");
        this.loadPreloadList();
       
    };
}
)();
