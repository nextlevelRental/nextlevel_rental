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
                this.set_name("RTCOMMCard_pop");
                this.set_classname("RTCMVkgrp");
                this.set_cssclass("from_POP");
                this.set_titletext("고객카드정보 팝업");
                this._setFormPosition(0,0,800,400);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_chgInfo", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj.set_useclientlayout("false");
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"vehicleNo\" type=\"STRING\" size=\"256\"/><Column id=\"accSeq\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"strDay\" type=\"STRING\" size=\"256\"/><Column id=\"endDay\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"custTp\" type=\"STRING\" size=\"256\"/><Column id=\"ebirDay\" type=\"STRING\" size=\"256\"/><Column id=\"buslNo\" type=\"STRING\" size=\"256\"/><Column id=\"bankCd\" type=\"STRING\" size=\"256\"/><Column id=\"bankNm\" type=\"STRING\" size=\"256\"/><Column id=\"acctNo\" type=\"STRING\" size=\"256\"/><Column id=\"accChk\" type=\"STRING\" size=\"256\"/><Column id=\"acncId\" type=\"STRING\" size=\"256\"/><Column id=\"acncDesc\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/><Column id=\"crdSeq\" type=\"STRING\" size=\"256\"/><Column id=\"cardcomCd\" type=\"STRING\" size=\"256\"/><Column id=\"cardcomNm\" type=\"STRING\" size=\"256\"/><Column id=\"cardNo\" type=\"STRING\" size=\"256\"/><Column id=\"expireYm\" type=\"STRING\" size=\"256\"/><Column id=\"bkeyChk\" type=\"STRING\" size=\"256\"/><Column id=\"batchKey\" type=\"STRING\" size=\"256\"/><Column id=\"payMthd\" type=\"STRING\" size=\"256\"/><Column id=\"productNm\" type=\"STRING\" size=\"256\"/><Column id=\"payDd\" type=\"STRING\" size=\"256\"/><Column id=\"arrearsAmt\" type=\"STRING\" size=\"256\"/><Column id=\"depositor\" type=\"STRING\" size=\"256\"/><Column id=\"expireY\" type=\"STRING\" size=\"256\"/><Column id=\"expireM\" type=\"STRING\" size=\"256\"/><Column id=\"tcgrpNo\" type=\"STRING\" size=\"256\"/><Column id=\"deleteTp\" type=\"STRING\" size=\"256\"/><Column id=\"accStat\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_List", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj.set_useclientlayout("false");
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"vehicleNo\" type=\"STRING\" size=\"256\"/><Column id=\"accSeq\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"strDay\" type=\"STRING\" size=\"256\"/><Column id=\"endDay\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"custTp\" type=\"STRING\" size=\"256\"/><Column id=\"ebirDay\" type=\"STRING\" size=\"256\"/><Column id=\"buslNo\" type=\"STRING\" size=\"256\"/><Column id=\"bankCd\" type=\"STRING\" size=\"256\"/><Column id=\"bankNm\" type=\"STRING\" size=\"256\"/><Column id=\"acctNo\" type=\"STRING\" size=\"256\"/><Column id=\"accChk\" type=\"STRING\" size=\"256\"/><Column id=\"acncId\" type=\"STRING\" size=\"256\"/><Column id=\"acncDesc\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/><Column id=\"crdSeq\" type=\"STRING\" size=\"256\"/><Column id=\"cardcomCd\" type=\"STRING\" size=\"256\"/><Column id=\"cardcomNm\" type=\"STRING\" size=\"256\"/><Column id=\"cardNo\" type=\"STRING\" size=\"256\"/><Column id=\"expireYm\" type=\"STRING\" size=\"256\"/><Column id=\"bkeyChk\" type=\"STRING\" size=\"256\"/><Column id=\"batchKey\" type=\"STRING\" size=\"256\"/><Column id=\"payMthd\" type=\"STRING\" size=\"256\"/><Column id=\"productNm\" type=\"STRING\" size=\"256\"/><Column id=\"payDd\" type=\"STRING\" size=\"256\"/><Column id=\"arrearsAmt\" type=\"STRING\" size=\"256\"/><Column id=\"depositor\" type=\"STRING\" size=\"256\"/><Column id=\"expireY\" type=\"STRING\" size=\"256\"/><Column id=\"expireM\" type=\"STRING\" size=\"256\"/><Column id=\"tcgrpNo\" type=\"STRING\" size=\"256\"/><Column id=\"deleteTp\" type=\"STRING\" size=\"256\"/><Column id=\"accStat\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_card", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"crdSeq\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"custTp\" type=\"STRING\" size=\"256\"/><Column id=\"ebirDay\" type=\"STRING\" size=\"256\"/><Column id=\"buslNo\" type=\"STRING\" size=\"256\"/><Column id=\"cardcomCd\" type=\"STRING\" size=\"256\"/><Column id=\"cardNo\" type=\"STRING\" size=\"256\"/><Column id=\"expireYm\" type=\"STRING\" size=\"256\"/><Column id=\"bkeyChk\" type=\"STRING\" size=\"256\"/><Column id=\"batchKey\" type=\"STRING\" size=\"256\"/><Column id=\"acncId\" type=\"STRING\" size=\"256\"/><Column id=\"acncDesc\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"payMthd\" type=\"STRING\" size=\"256\"/><Column id=\"expireY\" type=\"STRING\" size=\"256\"/><Column id=\"expireM\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static21", "absolute", "10", "16", "81", "20", null, null, this);
            obj.set_taborder("4");
            obj.set_text("카드선택");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_List", "absolute", "10", "41", null, "308", "10", null, this);
            obj.set_taborder("0");
            obj.set_binddataset("ds_List");
            obj.set_autosizebandtype("head");
            obj.set_cellclickbound("cell");
            obj.set_autofittype("col");
            obj.set_cellsizingtype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"67\"/><Column size=\"80\"/><Column size=\"100\"/><Column size=\"140\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"74\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"카드순번\"/><Cell col=\"1\" text=\"카드사코드\"/><Cell col=\"2\" text=\"카드사명\"/><Cell col=\"3\" text=\"카드번호\"/><Cell col=\"4\" text=\"카드주명\"/><Cell col=\"5\" text=\"법정생년월일\"/><Cell col=\"6\" text=\"사업자번호\"/><Cell col=\"7\" text=\"유효기간\"/></Band><Band id=\"body\"><Cell text=\"bind:crdSeq\"/><Cell col=\"1\" style=\"align:left;\" text=\"bind:cardcomCd\"/><Cell col=\"2\" text=\"bind:cardcomNm\"/><Cell col=\"3\" text=\"bind:cardNo\"/><Cell col=\"4\" text=\"bind:depositor\"/><Cell col=\"5\" text=\"bind:ebirDay\" mask=\"##-##-##\" calendardisplay=\"edit\" calendardisplaynulltype=\"none\"/><Cell col=\"6\" text=\"bind:buslNo\" mask=\"###-##-#####\"/><Cell col=\"7\" text=\"bind:expireYm\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Button("btn_confirm", "absolute", null, "359", "41", "21", "55", null, this);
            obj.set_taborder("1");
            obj.set_text("선택");
            obj.getSetter("domainId").set("nexa.delete");
            this.addChild(obj.name, obj);

            obj = new Button("btn_close", "absolute", null, "359", "41", "21", "10", null, this);
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
            		p.set_titletext("고객카드정보 팝업");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCOMMCard_pop.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCOMMCard_pop.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분 : 수금관리 > 결제정보관리 > 결제정보변경 > 고객계좌선택 팝업
         * 02. 그룹명   : RTREAccount_POPUP.xfdl
         * 03. 그룹설명 : 리스트=> 암호화-카드번호
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
        this.ParserStr = "^&^";
        //var nToRow; 	//부모창선택ROW
        var sCustNo; 	//부모창선택고객번호
        //var sGubun;		//결제방법
        /***********************************************************************
         * 그룹 변수 선언부
         ************************************************************************/
            //-------------------------------------------------------------------------------  
        	//폼로드시 공통함수     	
            //-------------------------------------------------------------------------------  	     
        	this.form_onload = function (obj,e)
        	{
        		Ex.core.init(obj);
        		//nToRow 	= this.parent.p_toRow;
        		sCustNo	= this.parent.p_custNo;
        		//sGubun 	= this.parent.p_gubun;
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
        		var sSvcID        	= "listCustCard";                    
        		var sController   	= "ntrms/comm/listCustCard.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_List=output";
        		var sArgs 			= "";		
        			sArgs 			+= Ex.util.setParam("custNo",sCustNo);
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
        			case "listCustCard":
        				if(this.ds_List.rowcount == 0) {
        					alert("조회된 데이터가 없습니다.");
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
        	//선택버튼 클릭시
            //-------------------------------------------------------------------------------  	
        	this.fn_confirm = function(obj,e)
        	{
        		this.fn_setChgData();
        	}
            //-------------------------------------------------------------------------------  	
        	//닫기버튼 클릭시
            //-------------------------------------------------------------------------------  	
        	this.fn_close = function(obj,e)
        	{
        		this.close();
        	}
            //-------------------------------------------------------------------------------  	
        	//그리드 더블클릭시
            //-------------------------------------------------------------------------------  	
        	this.fn_return = function(obj,e)
        	{
        		this.fn_setChgData();
        	}
            //-------------------------------------------------------------------------------  
        	//그리드 더블클릭시 선택된 데이터를 ds_chgInfo 담아서 부모창으로 전달
            //-------------------------------------------------------------------------------  	
        	this.fn_setChgData = function()
        	{
        		if( this.parent.p_arg ==  "RTSDContractRegister" || this.parent.p_arg ==  "RTSDMemberOrder"){
        			if( this.ds_List.rowposition >= 0 ){
        				var addRow = this.ds_card.addRow();
        				var nRow = this.ds_List.rowposition;
        				
        				var sExpireYm = nvl(this.ds_List.getColumn(nRow,"expireYm"));
        				var sExpireY = "";
        				var sExpireM = "";
        				if(sExpireYm != ""){
        					if(sExpireYm.length == 6){
        						sExpireY = sExpireYm.substr(0,4);
        						sExpireM = sExpireYm.substr(4,2);
        					}
        				}
        				this.ds_card.setColumn(addRow, "crdSeq", 	this.ds_List.getColumn(nRow,"crdSeq"));
        				this.ds_card.setColumn(addRow, "custNo", 	this.ds_List.getColumn(nRow,"custNo"));
        				this.ds_card.setColumn(addRow, "custNm", 	this.ds_List.getColumn(nRow,"depositor"));
        				this.ds_card.setColumn(addRow, "custTp", 	this.ds_List.getColumn(nRow,"custTp"));
        				this.ds_card.setColumn(addRow, "ebirDay", 	this.ds_List.getColumn(nRow,"ebirDay"));
        				this.ds_card.setColumn(addRow, "buslNo", 	this.ds_List.getColumn(nRow,"buslNo"));
        				this.ds_card.setColumn(addRow, "cardcomCd", this.ds_List.getColumn(nRow,"cardcomCd"));
        				this.ds_card.setColumn(addRow, "cardNo", 	this.ds_List.getColumn(nRow,"cardNo"));
        				this.ds_card.setColumn(addRow, "expireYm", 	this.ds_List.getColumn(nRow,"expireYm"));
        				this.ds_card.setColumn(addRow, "bkeyChk", 	this.ds_List.getColumn(nRow,"bkeyChk"));
        				this.ds_card.setColumn(addRow, "batchKey", 	this.ds_List.getColumn(nRow,"batchKey"));
        				this.ds_card.setColumn(addRow, "acncId", 	this.ds_List.getColumn(nRow,"acncId"));
        				this.ds_card.setColumn(addRow, "acncDesc", 	this.ds_List.getColumn(nRow,"acncDesc"));
        				this.ds_card.setColumn(addRow, "useYn", 	this.ds_List.getColumn(nRow,"useYn"));
        				this.ds_card.setColumn(addRow, "regId", 	this.ds_List.getColumn(nRow,"regId"));
        				this.ds_card.setColumn(addRow, "payMthd", 	this.ds_List.getColumn(nRow,"payMthd"));
        				this.ds_card.setColumn(addRow, "expireYm", 	this.ds_List.getColumn(nRow,"expireYm"));
        				this.ds_card.setColumn(addRow, "expireY", 	sExpireY);
        				this.ds_card.setColumn(addRow, "expireM", 	sExpireM);
        				this.ds_card.setColumn(addRow, "payMthd", 	this.parent.p_gubun);

        				var arr = [this.ds_card];
        				this.close(this.opener.returnCard(arr,this.parent.p_arg));
        			}
        		}else{
        			var idx = this.ds_List.rowposition;
        			if(idx != -1) {			
        				this.ds_chgInfo.clearData();		
        				this.ds_chgInfo.addRow();
        				this.ds_chgInfo.copyRow(0,this.ds_List,idx);
        				this.ds_chgInfo.setColumn(0,"payMthd",this.parent.p_gubun);	
        				var arr = [this.ds_chgInfo];	
        				this.close(this.opener._setReturn(arr,this.parent.p_arg));	
        			}else{
        				alert("선택된 데이터가 없습니다.");
        			}
        		}
        	}	

        	this.RTCOMMCard_pop_onkeyup = function(obj,e)
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
            this.addEventHandler("onkeyup", this.RTCOMMCard_pop_onkeyup, this);
            this.grd_List.addEventHandler("oncelldblclick", this.fn_return, this);
            this.btn_confirm.addEventHandler("onclick", this.fn_confirm, this);
            this.btn_close.addEventHandler("onclick", this.fn_close, this);

        };

        this.loadIncludeScript("RTCOMMCard_pop.xfdl");

       
    };
}
)();
