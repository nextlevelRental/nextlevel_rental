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
                this.set_name("RTCSAdvicetStatus_tab_info10_prdInfo");
                this.set_classname("RTSDContractStatus_tab_info5_preminumService");
                this.set_titletext("[STEP11]가계약정보");
                this._setFormPosition(0,0,1147,168);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_provsnList", this);
            obj._setContents("<ColumnInfo><Column id=\"provsnNo\" type=\"STRING\" size=\"256\"/><Column id=\"provsnTp\" type=\"STRING\" size=\"256\"/><Column id=\"provsnDay\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"addr\" type=\"STRING\" size=\"256\"/><Column id=\"mcNm\" type=\"STRING\" size=\"256\"/><Column id=\"specNm\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"patternNm\" type=\"STRING\" size=\"256\"/><Column id=\"cnt\" type=\"STRING\" size=\"256\"/><Column id=\"period\" type=\"STRING\" size=\"256\"/><Column id=\"regiAmt\" type=\"STRING\" size=\"256\"/><Column id=\"rentAmt\" type=\"STRING\" size=\"256\"/><Column id=\"planDay\" type=\"STRING\" size=\"256\"/><Column id=\"emailAddr\" type=\"STRING\" size=\"256\"/><Column id=\"provsnSt\" type=\"STRING\" size=\"256\"/><Column id=\"provsnStDtl\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/><Column id=\"hshopTp\" type=\"STRING\" size=\"256\"/><Column id=\"hshopOrdno\" type=\"STRING\" size=\"256\"/><Column id=\"airDay\" type=\"STRING\" size=\"256\"/><Column id=\"airTm\" type=\"STRING\" size=\"256\"/><Column id=\"contactGet\" type=\"STRING\" size=\"256\"/><Column id=\"contactCnt\" type=\"STRING\" size=\"256\"/><Column id=\"custReq\" type=\"STRING\" size=\"256\"/><Column id=\"recallDay\" type=\"STRING\" size=\"256\"/><Column id=\"recallTm\" type=\"STRING\" size=\"256\"/><Column id=\"atflPathNm\" type=\"STRING\" size=\"256\"/><Column id=\"atflNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static09", "absolute", "0", "0", null, "5", "0", null, this);
            obj.set_taborder("0");
            obj.set_text("w5");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static83", "absolute", "1107", "0", "40", null, null, "0", this);
            obj.set_taborder("1");
            obj.set_text("w40");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Grid("grid_provsnList", "absolute", "1", "6", "1113", "157", null, null, this);
            obj.set_taborder("2");
            obj.set_binddataset("ds_provsnList");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"108\"/><Column size=\"73\"/><Column size=\"103\"/><Column size=\"65\"/><Column size=\"93\"/><Column size=\"178\"/><Column size=\"57\"/><Column size=\"89\"/><Column size=\"40\"/><Column size=\"71\"/><Column size=\"72\"/><Column size=\"88\"/><Column size=\"88\"/><Column size=\"76\"/><Column size=\"66\"/><Column size=\"101\"/><Column size=\"36\"/><Column size=\"33\"/><Column size=\"56\"/><Column size=\"58\"/><Column size=\"82\"/><Column size=\"96\"/><Column size=\"217\"/><Column size=\"265\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"판매처\"/><Cell col=\"1\" text=\"주문접수일\"/><Cell col=\"2\" text=\"가계약번호\"/><Cell col=\"3\" text=\"고객명\"/><Cell col=\"4\" text=\"연락처\"/><Cell col=\"5\" text=\"주소\"/><Cell col=\"6\" text=\"상태\"/><Cell col=\"7\" text=\"세부상태\"/><Cell col=\"8\" text=\"컨택\"/><Cell col=\"9\" text=\"재컨택일자\"/><Cell col=\"10\" text=\"재컨택시간\"/><Cell col=\"11\" text=\"진계약번호\"/><Cell col=\"12\" text=\"차종\"/><Cell col=\"13\" text=\"타이어규격\"/><Cell col=\"14\" displaytype=\"normal\" text=\"차량번호\"/><Cell col=\"15\" text=\"패턴\"/><Cell col=\"16\" text=\"개수\"/><Cell col=\"17\" text=\"기간\"/><Cell col=\"18\" text=\"등록비\"/><Cell col=\"19\" text=\"월렌탈료\"/><Cell col=\"20\" text=\"장착희망일\"/><Cell col=\"21\" text=\"e-mail\"/><Cell col=\"22\" text=\"고객요청사항\"/><Cell col=\"23\" text=\"연락처수집방법\"/></Band><Band id=\"body\"><Cell displaytype=\"combo\" text=\"bind:hshopTp\" combodataset=\"ds_user\" combocodecol=\"userId\" combodatacol=\"userNm\"/><Cell col=\"1\" text=\"bind:provsnDay\" mask=\"####-##-##\" suppress=\"0\"/><Cell col=\"2\" text=\"bind:provsnNo\" suppress=\"0\"/><Cell col=\"3\" displaytype=\"normal\" style=\"align:center;\" text=\"bind:custNm\"/><Cell col=\"4\" displaytype=\"normal\" style=\"align:center;\" text=\"bind:mobNo\"/><Cell col=\"5\" displaytype=\"normal\" style=\"align:left;\" text=\"bind:addr\"/><Cell col=\"6\" displaytype=\"combo\" text=\"bind:provsnSt\" combodataset=\"ds_S093\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"7\" displaytype=\"combo\" text=\"bind:provsnStDtl\" combodataset=\"ds_S094\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"8\" text=\"bind:contactCnt\"/><Cell col=\"9\" text=\"bind:recallDay\" mask=\"####-##-##\"/><Cell col=\"10\" text=\"bind:recallTm\" mask=\"##:##\"/><Cell col=\"11\" text=\"bind:ordNo\"/><Cell col=\"12\" displaytype=\"normal\" style=\"align:center;\" text=\"bind:mcNm\"/><Cell col=\"13\" displaytype=\"normal\" style=\"align:center;\" text=\"bind:specNm\" combodataset=\"ds_R051\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"14\" displaytype=\"normal\" style=\"align:center;\" text=\"bind:carNo\"/><Cell col=\"15\" displaytype=\"normal\" style=\"align:center;\" text=\"bind:patternNm\"/><Cell col=\"16\" displaytype=\"normal\" style=\"align:right;\" text=\"bind:cnt\"/><Cell col=\"17\" displaytype=\"normal\" style=\"align:right;\" text=\"bind:period\" combodataset=\"ds_reltCd\" combocodecol=\"cd\" combodatacol=\"nm\" combodisplay=\"edit\"/><Cell col=\"18\" displaytype=\"number\" style=\"align:right;\" text=\"bind:regiAmt\"/><Cell col=\"19\" displaytype=\"number\" style=\"align:right;\" text=\"bind:rentAmt\"/><Cell col=\"20\" displaytype=\"normal\" style=\"align:center;\" text=\"bind:planDay\" mask=\"####-##-##\"/><Cell col=\"21\" displaytype=\"normal\" style=\"align:center;\" text=\"bind:emailAddr\"/><Cell col=\"22\" style=\"align:left;\" text=\"bind:custReq\"/><Cell col=\"23\" displaytype=\"normal\" style=\"align:left;\" text=\"bind:contactGet\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1147, 168, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTSDContractStatus_tab_info5_preminumService");
            		p.set_titletext("[STEP11]가계약정보");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCSAdvicetStatus_tab_info10_collection.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCSAdvicetStatus_tab_info10_collection.xfdl", function() {
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //include "lib::comLib.xjs";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.obj_data;
        this.BUTTON_CELL = 2;			//버튼CELL 위치

        this.writeYn = "";

        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg){

        	if(strErrorMsg != "") {
        		alert(strErrorMsg);
        		return;
        	}	
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.ds_provsnList.addEventHandler("canrowposchange", this.ds_provsnList_canrowposchange, this);
            this.addEventHandler("onload", this.RTCSAdvice_tab_info3_prdInfo, this);
            this.grid_provsnList.addEventHandler("oncellclick", this.grid_provsnList_oncellclick, this);
            this.grid_provsnList.addEventHandler("oncelldblclick", this.grid_provsnList_oncelldblclick, this);

        };

        this.loadIncludeScript("RTCSAdvicetStatus_tab_info10_collection.xfdl");

       
    };
}
)();
