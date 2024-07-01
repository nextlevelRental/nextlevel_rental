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
                this.set_name("RTCOMMPrice_pop");
                this.set_classname("RTCMPrice_pop");
                this.set_titletext("가격조회");
                this._setFormPosition(0,0,490,490);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_price", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"priceCd\" type=\"STRING\" size=\"256\"/><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"periodCd\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"regiCd\" type=\"STRING\" size=\"256\"/><Column id=\"regiAmt\" type=\"STRING\" size=\"256\"/><Column id=\"rentAmt\" type=\"STRING\" size=\"256\"/><Column id=\"strDay\" type=\"STRING\" size=\"256\"/><Column id=\"endDay\" type=\"STRING\" size=\"256\"/><Column id=\"seq\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_period", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_cnt", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Grid("grid_price", "absolute", "10", "146", null, "304", "10", null, this);
            obj.set_taborder("1");
            obj.set_binddataset("ds_price");
            obj.set_cellsizingtype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"116\"/><Column size=\"117\"/><Column size=\"117\"/><Column size=\"118\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"렌탈기간\"/><Cell col=\"1\" text=\"타이어본수\"/><Cell col=\"2\" text=\"렌탈등록비\"/><Cell col=\"3\" text=\"월렌탈료\"/></Band><Band id=\"body\"><Cell text=\"bind:periodCd\"/><Cell col=\"1\" text=\"bind:cntCd\"/><Cell col=\"2\" text=\"bind:regiAmt\"/><Cell col=\"3\" text=\"bind:rentAmt\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "10", "10", null, "126", "10", null, this);
            obj.set_taborder("0");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_searchSalesGroup", "absolute", "20", "11", "86", "20", null, null, this.div_search);
            obj.set_taborder("7");
            obj.set_text("상품");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchPeriod", "absolute", "20", "37", "86", "20", null, null, this.div_search);
            obj.set_taborder("8");
            obj.set_text("렌탈기간");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchOrdDay", "absolute", "20", "91", "86", "20", null, null, this.div_search);
            obj.set_taborder("9");
            obj.set_text("가격적용일");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCnt", "absolute", "20", "64", "86", "20", null, null, this.div_search);
            obj.set_taborder("10");
            obj.set_text("타이어본수");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_search", "absolute", null, "86", "45", "22", "18", null, this.div_search);
            obj.set_taborder("6");
            obj.set_text("검색");
            obj.getSetter("domainId").set("nexa.add");
            obj.set_cssclass("btn_WF_CRUD");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_searchOrdDay", "absolute", "101", "91", "100", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("5");
            obj = new Combo("cb_searchCnt", "absolute", "101", "64", "140", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("4");
            obj.set_innerdataset("@ds_cnt");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj.set_index("-1");
            obj = new Combo("cb_period", "absolute", "101", "37", "140", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("3");
            obj.set_innerdataset("@ds_period");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj.set_index("-1");
            obj = new Edit("ed_searchProductCd", "absolute", "101", "10", "140", "21", null, null, this.div_search);
            obj.set_taborder("0");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("bt_searchProduct", "absolute", "221", "9", "20", "21", null, null, this.div_search);
            obj.set_taborder("1");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_searchProductNm", "absolute", "245", "10", "203", "21", null, null, this.div_search);
            obj.set_taborder("2");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);

            obj = new Button("btn_choice", "absolute", null, "460", "41", "21", "55", null, this);
            obj.set_taborder("2");
            obj.set_text("선택");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);

            obj = new Button("btn_close", "absolute", null, "460", "41", "21", "10", null, this);
            obj.set_taborder("3");
            obj.set_text("닫기");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 0, 126, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("0");
            		p.set_scrollbars("none");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 490, 490, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCMPrice_pop");
            		p.set_titletext("가격조회");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCOMMPrice_pop.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCOMMPrice_pop.xfdl", function() {
        	//include "lib::comLib.xjs";   
            
            
        	this.RTCMPrice_pop_onload = function(obj,e)
        	{
        		Ex.core.init(obj);
        		this.fn_init();
        		
        		if( this.parent.p_formId == "RTSDContractRegister"){
        			this.div_search.ed_searchProductCd.set_value(this.parent.p_cd);
        			this.div_search.ed_searchProductNm.set_value(this.parent.p_nm);
        			this.div_search.bt_searchProduct.set_visible(false);
        		}
        	}

        

        	this.fn_init = function(){
        		var sSvcID      	= "initPriceCombo";  
        		var sController   	= "rtms/comm/initRTCOMMPricePop.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_period=output1 ds_cnt=output2";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        	
        	
        	
        	/***********************************************************************************
        	* CallBack Event (strSvcId - Sevice ID, nErrorCode - ErrorCode, strErrorMsg - Error Message)
        	***********************************************************************************/
            this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg,resultCnt)
        	{
        		if( strSvcId == "listPricePop" ){
        			var nRow = this.ds_price.rowcount;
        			if( nRow == 0 ){
        				this.grid_price.set_nodatatext("조회된 데이터가 없습니다.");
        			}
        		}
        	}
        	
        	
        	
        	this.div_search_btn_search_onclick = function(obj,e)
        	{
        		var edSearchProductCdVal = nvl(this.div_search.ed_searchProductCd.value);
        		var cbPeriodVal 		 = nvl(this.div_search.cb_period.value);
        		var cbSearchCntVal 		 = nvl(this.div_search.cb_searchCnt.value);
        		var calSearchOrdDayVal 	 = nvl(this.div_search.cal_searchOrdDay.value);
        		
        		if( edSearchProductCdVal == "" ){
        			alert( this.div_search.st_searchSalesGroup.text  + " 값이 없습니다.");
        			return this.div_search.ed_searchProductCd.setFocus();
        		}else if( cbPeriodVal == "" ){
        			alert( this.div_search.st_searchPeriod.text + " 값이 없습니다.");
        			return this.div_search.cb_period.setFocus();
        		}else if( cbSearchCntVal == "" ){
        			alert( this.div_search.st_searchCnt.text + " 값이 없습니다.");
        			return this.div_search.cb_searchCnt.setFocus();
        		}else if( calSearchOrdDayVal == "" ){
        			alert( this.div_search.st_searchOrdDay.text + " 값이 없습니다.");
        			return this.div_search.cal_searchOrdDay.setFocus();
        		}else{
        				var sSvcID        	= "listPricePop";                    
        				var sController   	= "rtms/comm/listPricePop.do";
        				var sInDatasets   	= "";
        				var sOutDatasets  	= "ds_price=mapPrice";
        				var sArgs 			= "";	
        				var fn_callBack		= "fn_callBack";
        				
        				this.ds_price.deleteAll();
        				
        				sArgs += Ex.util.setParam("ordDay", calSearchOrdDayVal);
        				sArgs += Ex.util.setParam("matCd", edSearchProductCdVal);
        				sArgs += Ex.util.setParam("periodCd", cbPeriodVal);
        				sArgs += Ex.util.setParam("cntCd", cbSearchCntVal);
        				
        				Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        		}
        	}

        

        	this.div_search_bt_searchSalesGroup_onclick = function(obj,e)
        	{
        		var args ={p_formId :"RTCOMMPrice_pop"};
        		Ex.core.popup(this,"상품조회","comm::RTCOMMProduct_pop.xfdl",args, "modaless=false");
        	}
        	
        	this.returnProduct = function(arr){
        		this.div_search.ed_searchProductCd.set_value(arr.cd);
        		this.div_search.ed_searchProductNm.set_value(arr.nm);
        	}

        	this.grid_price_oncelldblclick = function(obj,e)
        	{
        		
        	}

        	this.btn_choice_onclick = function(obj,e)
        	{
        		
        	}

        	this.btn_close_onclick = function(obj,e)
        	{
        		this.close();
        	}

        	this.RTCOMMPrice_pop_onkeyup = function(obj,e)
        	{
        		if(e.keycode == 27){
        			this.close();
        		}
        	}
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTCMPrice_pop_onload, this);
            this.addEventHandler("onkeyup", this.RTCOMMPrice_pop_onkeyup, this);
            this.grid_price.addEventHandler("oncelldblclick", this.grid_price_oncelldblclick, this);
            this.div_search.btn_search.addEventHandler("onclick", this.div_search_btn_search_onclick, this);
            this.div_search.cb_searchCnt.addEventHandler("onitemchanged", this.div_search_cb_searchBrand_onitemchanged, this);
            this.div_search.cb_period.addEventHandler("onitemchanged", this.div_search_cb_searchBrand_onitemchanged, this);
            this.div_search.ed_searchProductCd.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.div_search.bt_searchProduct.addEventHandler("onclick", this.div_search_bt_searchSalesGroup_onclick, this);
            this.div_search.ed_searchProductNm.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.btn_choice.addEventHandler("onclick", this.btn_choice_onclick, this);
            this.btn_close.addEventHandler("onclick", this.btn_close_onclick, this);

        };

        this.loadIncludeScript("RTCOMMPrice_pop.xfdl");

       
    };
}
)();
