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
                this.set_name("RTCOMMCrdTranDtl_pop");
                this.set_classname("RTCMVkgrp");
                this.set_cssclass("from_POP");
                this.set_titletext("카드이체 청구세부조회 팝업");
                this._setFormPosition(0,0,800,400);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_List", this);
            obj.set_firefirstcount("0");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj.set_useclientlayout("false");
            obj._setContents("<ColumnInfo><Column id=\"rcrdDay\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"recpTp\" type=\"STRING\" size=\"256\"/><Column id=\"recpTpNm\" type=\"STRING\" size=\"256\"/><Column id=\"recpNu\" type=\"STRING\" size=\"256\"/><Column id=\"zfbDay\" type=\"STRING\" size=\"256\"/><Column id=\"saleAmt\" type=\"STRING\" size=\"256\"/><Column id=\"arreAmt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static21", "absolute", "10", "16", "161", "20", null, null, this);
            obj.set_taborder("4");
            obj.set_text("카드이체 청구세부 내역");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_List", "absolute", "10", "41", null, "308", "10", null, this);
            obj.set_taborder("0");
            obj.set_binddataset("ds_List");
            obj.set_autosizebandtype("head");
            obj.set_cellclickbound("cell");
            obj.set_autofittype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"60\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"24\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"카드이체일자\"/><Cell col=\"1\" text=\"계약번호\"/><Cell col=\"2\" text=\"고객번호\"/><Cell col=\"3\" text=\"고객명\"/><Cell col=\"4\" text=\"청구구분\"/><Cell col=\"5\" text=\"회차\"/><Cell col=\"6\" text=\"만기일자\"/><Cell col=\"7\" text=\"매출금액\"/><Cell col=\"8\" text=\"미납금액\"/></Band><Band id=\"body\"><Cell displaytype=\"date\" text=\"bind:rcrdDay\" calendardisplaynulltype=\"none\"/><Cell col=\"1\" style=\"align:left;\" text=\"bind:ordNo\"/><Cell col=\"2\" text=\"bind:custNo\"/><Cell col=\"3\" text=\"bind:custNm\"/><Cell col=\"4\" text=\"bind:recpTpNm\"/><Cell col=\"5\" text=\"bind:recpNu\" calendardisplay=\"edit\" calendardisplaynulltype=\"none\"/><Cell col=\"6\" displaytype=\"date\" text=\"bind:zfbDay\" calendardisplaynulltype=\"none\"/><Cell col=\"7\" displaytype=\"number\" style=\"align:right middle;\" text=\"bind:saleAmt\" mask=\"###,###,###,##0\"/><Cell col=\"8\" displaytype=\"number\" style=\"align:right middle;\" text=\"bind:arreAmt\" mask=\"###,###,###,##0\"/></Band><Band id=\"summary\"><Cell text=\"합계\"/><Cell col=\"1\"/><Cell col=\"2\"/><Cell col=\"3\"/><Cell col=\"4\"/><Cell col=\"5\"/><Cell col=\"6\"/><Cell col=\"7\" displaytype=\"number\" style=\"align:right middle;\" text=\"expr:comp.parent.ds_List.getSum(&quot;saleAmt&quot;)\" mask=\"###,###,###,##0\"/><Cell col=\"8\" displaytype=\"number\" style=\"align:right middle;\" text=\"expr:comp.parent.ds_List.getSum(&quot;arreAmt&quot;)\" mask=\"###,###,###,##0\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Button("btn_close", "absolute", null, "359", "41", "21", "380", null, this);
            obj.set_taborder("2");
            obj.set_text("닫기");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 800, 400, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCMVkgrp");
            		p.set_cssclass("from_POP");
            		p.set_titletext("카드이체 청구세부조회 팝업");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCOMMCrdTranDtl_pop.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCOMMCrdTranDtl_pop.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분 : 수금관리 > CMS관리 > 카드이체조회 > 청구세부조회 팝업
         * 02. 그룹명   : RTCOMMCrdTranDtl_pop.xfdl
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
        		this.fn_search();
        	}
        	 
        	/***********************************************************************************
        	* Transaction Function
        	***********************************************************************************/
            //-------------------------------------------------------------------------------  	
        	//목록조회 Search
            //-------------------------------------------------------------------------------  	
        	this.fn_search = function()
        	{
        		var sSvcID        	= "crdTranDetail";                    
        		var sController   	= "ntrms/comm/crdTranDetail.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_List=output";
        		var sArgs 			= "";		
        			sArgs 			+= Ex.util.setParam("rcrdDay",this.parent.p_rcrdDay);
        			sArgs 			+= Ex.util.setParam("rcrdSeq",this.parent.p_rcrdSeq);
        		var fn_callBack		= "fn_callBack";
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        	}

        	/***********************************************************************************
        	* CallBack Event (strSvcId - Sevice ID, nErrorCode - ErrorCode, strErrorMsg - Error Message)
        	***********************************************************************************/
            //-------------------------------------------------------------------------------  
            // callback 함수
            //-------------------------------------------------------------------------------      	
        	this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg)
        	{  
        	  
        		if (nErrorCode < 0) 
        		{
        			return Ex.core.comMsg("alert",strErrorMsg);		
        		}
        		
        		switch (strSvcId) 
        		{
        			case "crdTranChargeDetail":
        				if(this.ds_List.rowcount == 0) {
        					this.grd_List.set_nodatatext("조회된 데이터가 없습니다.");
        					return;
        				}
        				break;
        				
        			default:
        				break;
        		}
        	}
        	

        	/***********************************************************************************
        	* User Function
        	***********************************************************************************/
            //-------------------------------------------------------------------------------  	
        	//닫기버튼 클릭시
            //-------------------------------------------------------------------------------  	
        	this.fn_close = function(obj,e)
        	{
        		this.close();
        	}
         
        	this.RTCOMMCrdTranDtl_pop_onkeyup = function(obj,e)
        	{
        		if(e.keycode == 27){
        			this.close();
        		}
        	}
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.addEventHandler("onkeyup", this.RTCOMMCrdTranDtl_pop_onkeyup, this);
            this.grd_List.addEventHandler("oncelldblclick", this.fn_return, this);
            this.btn_close.addEventHandler("onclick", this.fn_close, this);

        };

        this.loadIncludeScript("RTCOMMCrdTranDtl_pop.xfdl");

       
    };
}
)();
