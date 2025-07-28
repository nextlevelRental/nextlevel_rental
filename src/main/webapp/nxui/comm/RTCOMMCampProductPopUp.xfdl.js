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
                this.set_name("RTCOMMProduct_pop");
                this.set_classname("RTCMPrice_pop");
                this.set_titletext("상품 조회(패턴,규격)");
                this._setFormPosition(0,0,885,482);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_product", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"petternCd\" type=\"STRING\" size=\"256\"/><Column id=\"sectionWidth\" type=\"STRING\" size=\"256\"/><Column id=\"aspectRatio\" type=\"STRING\" size=\"256\"/><Column id=\"wheelInches\" type=\"STRING\" size=\"256\"/><Column id=\"plyRating\" type=\"STRING\" size=\"256\"/><Column id=\"demmndQty\" type=\"STRING\" size=\"256\"/><Column id=\"pgCd\" type=\"STRING\" size=\"256\"/><Column id=\"seasonCd\" type=\"STRING\" size=\"256\"/><Column id=\"sizeNm\" type=\"STRING\" size=\"256\"/><Column id=\"pettrenNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Div("div_search", "absolute", "10", "8", "864", "45", null, null, this);
            obj.set_taborder("0");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Button("btn_search", "absolute", "760", "12", "80", "23", null, null, this.div_search);
            obj.set_taborder("42");
            obj.set_text("조회");
            obj.set_cssclass("btn_WF_CRUD");
            obj.getSetter("domainId").set("nexa.add");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchModel", "absolute", "20", "12", "80", "21", null, null, this.div_search);
            obj.set_taborder("45");
            obj.set_text("검색어");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("Edit00", "absolute", "100", "12", "160", "21", null, null, this.div_search);
            obj.set_taborder("46");
            obj.set_tooltiptext("edit");
            obj.set_displaynulltext("상품명");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "0", "0", "20", "41", null, null, this.div_search);
            obj.set_taborder("47");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "260", "0", "30", "41", null, null, this.div_search);
            obj.set_taborder("48");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static05", "absolute", "840", "0", "20", "41", null, null, this.div_search);
            obj.set_taborder("50");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static22", "absolute", "0", "0", "860", "12", null, null, this.div_search);
            obj.set_taborder("51");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "0", "33", "860", "12", null, null, this.div_search);
            obj.set_taborder("52");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "740", "0", "20", "41", null, null, this.div_search);
            obj.set_taborder("53");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);

            obj = new Grid("grid_price", "absolute", "10", "63", "865", "380", null, null, this);
            obj.set_taborder("1");
            obj.set_binddataset("ds_product");
            obj.set_autosizebandtype("body");
            obj.set_autofittype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"200\"/><Column size=\"220\"/><Column size=\"220\"/><Column size=\"220\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"상품코드\"/><Cell col=\"1\" text=\"상품명\"/><Cell col=\"2\" text=\"패턴코드\"/><Cell col=\"3\" text=\"패턴명\"/></Band><Band id=\"body\"><Cell text=\"bind:matCd\"/><Cell col=\"1\" text=\"bind:matNm\"/><Cell col=\"2\" text=\"bind:petternCd\"/><Cell col=\"3\" text=\"bind:pettrenNm\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Button("btn_choice", "absolute", "787", "453", "41", "21", null, null, this);
            obj.set_taborder("2");
            obj.set_text("선택");
            obj.set_positionstep("0");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);

            obj = new Button("btn_close", "absolute", "834", "452", "41", "21", null, null, this);
            obj.set_taborder("3");
            obj.set_text("닫기");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);

            obj = new Static("Static22", "absolute", "0", "0", "885", "10", null, null, this);
            obj.set_taborder("4");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "53", "885", "10", null, null, this);
            obj.set_taborder("5");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "0", "10", "480", null, null, this);
            obj.set_taborder("6");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "875", "0", "10", "480", null, null, this);
            obj.set_taborder("7");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0", "443", "885", "10", null, null, this);
            obj.set_taborder("8");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "0", "473", "885", "10", null, null, this);
            obj.set_taborder("9");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 864, 45, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("0");
            		p.set_scrollbars("none");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 885, 482, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCMPrice_pop");
            		p.set_titletext("상품 조회(패턴,규격)");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCOMMCampProductPopUp.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCOMMCampProductPopUp.xfdl", function() {
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //include "lib::comLib.xjs";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.args = "";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg,resultCnt){
        	if( strSvcId == "listBrandCombo" ){
        		var dsBrandRowCt = this.ds_brand.getRowCount();
        		if( dsBrandRowCt != 0 ){
        			
        		}
        	}
        	
        	if( strSvcId == "listModelCombo" ){
        		var dsBrandRowCt = this.ds_brand.getRowCount();
        		if( dsBrandRowCt != 0 ){
        			
        		}
        	}
        	
        	if( strSvcId == "listProductPop" ){
        		var dsProductRowCt = this.ds_product.getRowCount();
        		if( dsProductRowCt == 0 ){
        			this.grid_product.set_nodatatext("조회된 데이터가 없습니다.");
        			this.div_search.cb_searchModel.setFocus();
        		} 
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.RTCMPrice_pop_onload = function(obj,e){
        	Ex.core.init(obj);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_init = function(){
        	var sSvcID      	= "listBrandCombo";  
        	var sController   	= "rtms/comm/listBrandCombo.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_brand=output1";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_cb_searchBrand_onitemchanged = function(obj,e){
        	var cbSearchBrandlVal 	= nvl(this.div_search.cb_searchBrand.value);
        	var sSvcID      	= "listModelCombo";  
        	var sController   	= "rtms/comm/listModelCombo.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_model=mapModelCombo";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	if( cbSearchBrandlVal != "" ){
        		sArgs += Ex.util.setParam("makerCd", cbSearchBrandlVal);
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_cb_searchModel_onitemchanged = function(obj,e){
        	var nRow1 = this.ds_model.findRow( "rn", this.div_search.cb_searchModel.value );
        	var nRow2 = this.ds_model.findRow( "mcNm", this.div_search.cb_searchModel.text );
        	if( nvl(nRow1) != "" && nvl(nRow2) != "" ){
        		this.grid_model.selectRow( nRow1 );
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_btn_search_onclick = function(obj,e){
        	var matNm = nvl(this.div_search.Edit00.value);
        	var sSvcID        	= "listProductPop";                    
        	var sController   	= "rtms/sd/listCampProductPop.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_product=mapProduct";
        	var sArgs 			= "";
        	var fn_callBack		= "fn_callBack";
        	this.ds_product.deleteAll();
        	sArgs += Ex.util.setParam("matNm", matNm);
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.FN_choice = function(){
        	var nCnt= this.ds_product.getRowCount();
        	var idx = this.ds_product.rowposition;
        	var cd 	= this.ds_product.getColumn(idx, "matCd");
        	var nm 	= this.ds_product.getColumn(idx, "matNm");
        	
        	if( nCnt == 0 ){
        		alert("조회된 상품정보가 없습니다.");
        		return false;
        	}
        	
        	if( nvl(cd) == "" && nvl(nm) == "" ){
        		alert("상품정보를 다시 확인하세요.");
        		return false;
        	}
        	
        	if( this.parent.p_formId == "RTSDCampReg" ){
        		var arr = { cd : cd, nm : nm };
        		this.close(this.opener.returnProduct(arr));
        	}else if( (this.parent.p_formId == "RTRESalesCommMang_tab1_Select")
        				|| (this.parent.p_formId == "RTREInstallCommMang_tab1_Select")
        					|| (this.parent.p_formId == "RTREServiceCommMang_tab1_Select")){
        		var arr = { cd : cd, nm : nm };
        		this.close(this.opener.returnProductSelect(arr));
        	}else if( (this.parent.p_formId == "RTRESalesCommMang_tab1_Insert")
        				|| (this.parent.p_formId == "RTREInstallCommMang_tab1_Insert")
        					|| (this.parent.p_formId == "RTREServiceCommMang_tab1_Insert")){
        		var arr = { cd : cd, nm : nm };
        		this.close(this.opener.returnProductInsert(arr));
        	}else{
        		this.close();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.grid_product_oncelldblclick = function(obj,e){
        	this.FN_choice();
        }

        this.btn_choice_onclick = function(obj,e){
        	this.FN_choice();
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.btn_close_onclick = function(obj,e)
        {
        	this.close();
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_Edit00_onkeyup = function(obj,e){
        	if( e.keycode == "13" ){
        		this.div_search_btn_search_onclick();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.RTCOMMProduct_pop_onkeyup = function(obj,e){
        	if(e.keycode == 27){
        		this.close();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTCMPrice_pop_onload, this);
            this.addEventHandler("onkeyup", this.RTCOMMProduct_pop_onkeyup, this);
            this.div_search.btn_search.addEventHandler("onclick", this.div_search_btn_search_onclick, this);
            this.div_search.Edit00.addEventHandler("onkeyup", this.div_search_Edit00_onkeyup, this);
            this.grid_price.addEventHandler("oncelldblclick", this.grid_product_oncelldblclick, this);
            this.btn_choice.addEventHandler("onclick", this.btn_choice_onclick, this);
            this.btn_close.addEventHandler("onclick", this.btn_close_onclick, this);

        };

        this.loadIncludeScript("RTCOMMCampProductPopUp.xfdl");

       
    };
}
)();
