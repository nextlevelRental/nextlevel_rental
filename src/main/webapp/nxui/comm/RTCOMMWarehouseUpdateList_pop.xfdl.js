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
                this.set_name("RTCOMMWarehouseUpdateList_pop");
                this.set_classname("RTCSWarehouseUpdateList_pop");
                this.set_titletext("창고변경이력");
                this._setFormPosition(0,0,1000,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_rtcs0201", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"wrhSeq\" type=\"STRING\" size=\"256\"/><Column id=\"warehCd\" type=\"STRING\" size=\"256\"/><Column id=\"warehNm\" type=\"STRING\" size=\"256\"/><Column id=\"begday\" type=\"STRING\" size=\"256\"/><Column id=\"endday\" type=\"STRING\" size=\"256\"/><Column id=\"bldMngNo\" type=\"STRING\" size=\"256\"/><Column id=\"posCd\" type=\"STRING\" size=\"256\"/><Column id=\"addr1\" type=\"STRING\" size=\"256\"/><Column id=\"addr2\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"faxNo\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Grid("grid_rtcs0201", "absolute", "10", "9", "980", "438", null, null, this);
            obj.set_taborder("1");
            obj.set_binddataset("ds_rtcs0201");
            obj.set_cellsizingtype("col");
            obj.set_autofittype("col");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"40\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"60\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"순번\"/><Cell col=\"1\" text=\"창고코드\"/><Cell col=\"2\" text=\"창고명\"/><Cell col=\"3\" text=\"시작일자\"/><Cell col=\"4\" text=\"종료일자\"/><Cell col=\"5\" text=\"우편번호\"/><Cell col=\"6\" text=\"주소\"/><Cell col=\"7\" text=\"주소상세\"/><Cell col=\"8\" text=\"전화번호\"/><Cell col=\"9\" text=\"팩스번호\"/><Cell col=\"10\" text=\"핸드폰번호\"/><Cell col=\"11\" text=\"사용여부\"/></Band><Band id=\"body\"><Cell text=\"bind:wrhSeq\" tooltiptext=\"bind:wrhSeq\"/><Cell col=\"1\" text=\"bind:warehCd\" tooltiptext=\"bind:warehCd\"/><Cell col=\"2\" text=\"bind:warehNm\" tooltiptext=\"bind:warehNm\"/><Cell col=\"3\" displaytype=\"date\" text=\"bind:begday\" calendardisplaynulltype=\"none\" tooltiptext=\"bind:begday\"/><Cell col=\"4\" displaytype=\"date\" text=\"bind:endday\" calendardisplaynulltype=\"none\" tooltiptext=\"bind:endday\"/><Cell col=\"5\" text=\"bind:posCd\" tooltiptext=\"bind:posCd\"/><Cell col=\"6\" text=\"bind:addr1\" tooltiptext=\"bind:addr1\"/><Cell col=\"7\" text=\"bind:addr2\" tooltiptext=\"bind:addr2\"/><Cell col=\"8\" text=\"bind:telNo\" expr=\"expr:FN_numberHyphenInReturn(telNo)\" tooltiptext=\"expr:FN_numberHyphenInReturn(telNo)\"/><Cell col=\"9\" text=\"bind:faxNo\" expr=\"expr:FN_numberHyphenInReturn(faxNo)\" tooltiptext=\"expr:FN_numberHyphenInReturn(faxNo)\"/><Cell col=\"10\" text=\"bind:mobNo\" expr=\"expr:FN_numberHyphenInReturn(mobNo)\" tooltiptext=\"expr:FN_numberHyphenInReturn(mobNo)\"/><Cell col=\"11\" text=\"bind:useYn\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Button("btn_close", "absolute", "949", "462", "41", "21", null, null, this);
            obj.set_taborder("3");
            obj.set_text("닫기");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);

            obj = new Static("Static22", "absolute", "0", "0", "1000", "10", null, null, this);
            obj.set_taborder("4");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "0", "10", "496", null, null, this);
            obj.set_taborder("5");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "990", "0", "10", "496", null, null, this);
            obj.set_taborder("7");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0", "447", "1000", "10", null, null, this);
            obj.set_taborder("8");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "0", "486", "1000", "10", null, null, this);
            obj.set_taborder("9");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1000, 496, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCSWarehouseUpdateList_pop");
            		p.set_titletext("창고변경이력");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCOMMWarehouseUpdateList_pop.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCOMMWarehouseUpdateList_pop.xfdl", function() {
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //include "lib::comLib.xjs"; 
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg){
        	if( strSvcId == "selectRTCSWarehouseUpdateList" ){
        		var nRowCount = this.ds_rtcs0201.getRowCount();
        		if(nRowCount != 0){
        		
        		}else{
        			alert("조회된 데이터가 없습니다.");
        			this.grid_rtcs0200.set_nodatatext("조회된 데이터가 없습니다.");
        		}
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.RTCOMMWarehouseUpdateList_pop_onload = function(obj,e){
        	var warehCd = nvl(this.parent.warehCd);
        	if( warehCd != "" ){
        		var sSvcID        	= "selectRTCSWarehouseUpdateList";                    
        		var sController   	= "rtms/cs/selectRTCSWarehouseUpdateList.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_rtcs0201=mapRtcs0201";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		sArgs += Ex.util.setParam("warehCd", warehCd);
        		this.ds_rtcs0201.clearData();
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}else{
        		alert("창고번호가 없습니다.");
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.RTCOMMWarehouseUpdateList_pop_onkeyup = function(obj,e){
        	if(e.keycode == 27){
        		this.close();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.btn_close_onclick = function(obj,e){
        	this.close();
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onkeyup", this.RTCOMMWarehouseUpdateList_pop_onkeyup, this);
            this.addEventHandler("onload", this.RTCOMMWarehouseUpdateList_pop_onload, this);
            this.grid_rtcs0201.addEventHandler("oncelldblclick", this.grid_rtcs0200_oncelldblclick, this);
            this.btn_close.addEventHandler("onclick", this.btn_close_onclick, this);

        };

        this.loadIncludeScript("RTCOMMWarehouseUpdateList_pop.xfdl");

       
    };
}
)();
