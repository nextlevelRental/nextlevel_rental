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
                this.set_titletext("상품 조회");
                this._setFormPosition(0,0,600,490);
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
            obj._setContents("<ColumnInfo><Column id=\"petternCd\" type=\"STRING\" size=\"256\"/><Column id=\"pettrenNm\" type=\"STRING\" size=\"256\"/><Column id=\"sizeNm\" type=\"STRING\" size=\"256\"/><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"wheelQty\" type=\"STRING\" size=\"256\"/><Column id=\"weelLimitQty\" type=\"STRING\" size=\"256\"/><Column id=\"modelCd\" type=\"STRING\" size=\"256\"/><Column id=\"modelNm\" type=\"STRING\" size=\"256\"/><Column id=\"contentsCd\" type=\"STRING\" size=\"256\"/><Column id=\"contentsNm\" type=\"STRING\" size=\"256\"/><Column id=\"frCd\" type=\"STRING\" size=\"256\"/><Column id=\"frNm\" type=\"STRING\" size=\"256\"/><Column id=\"modelFullNm\" type=\"STRING\" size=\"256\"/><Column id=\"sectionWidth\" type=\"STRING\" size=\"256\"/><Column id=\"aspectRatio\" type=\"STRING\" size=\"256\"/><Column id=\"wheelInches\" type=\"STRING\" size=\"256\"/><Column id=\"plyRating\" type=\"STRING\" size=\"256\"/><Column id=\"demmndQty\" type=\"STRING\" size=\"256\"/><Column id=\"pgCd\" type=\"STRING\" size=\"256\"/><Column id=\"seasonCd\" type=\"STRING\" size=\"256\"/><Column id=\"classSd\" type=\"STRING\" size=\"256\"/><Column id=\"makerCd\" type=\"STRING\" size=\"256\"/><Column id=\"makerNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_brand", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_model", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"rn\" type=\"STRING\" size=\"256\"/><Column id=\"makerCd\" type=\"STRING\" size=\"256\"/><Column id=\"modelCd\" type=\"STRING\" size=\"256\"/><Column id=\"modelNm\" type=\"STRING\" size=\"256\"/><Column id=\"contentsCd\" type=\"STRING\" size=\"256\"/><Column id=\"conTentsNm\" type=\"STRING\" size=\"256\"/><Column id=\"frCd\" type=\"STRING\" size=\"256\"/><Column id=\"mcNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Div("div_search", "absolute", "10", "10", null, "45", "10", null, this);
            obj.set_taborder("0");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Button("btn_search", "absolute", null, "9", "45", "22", "18", null, this.div_search);
            obj.set_taborder("2");
            obj.set_text("검색");
            obj.set_cssclass("btn_WF_CRUD");
            obj.getSetter("domainId").set("nexa.add");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchModel", "absolute", "20", "11", "95", "20", null, null, this.div_search);
            obj.set_taborder("3");
            obj.set_text("차종");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_searchBrand", "absolute", "62", "10", "140", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("0");
            obj.set_displaynulltext("브랜드");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj.set_innerdataset("ds_brand");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_index("-1");
            obj = new Combo("cb_searchModel", "absolute", "207", "10", "180", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("1");
            obj.set_displaynulltext("모델");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj.set_innerdataset("ds_model");
            obj.set_codecolumn("rn");
            obj.set_datacolumn("mcNm");
            obj.set_index("-1");

            obj = new Grid("grid_price", "absolute", "10", "65", null, "385", "10", null, this);
            obj.set_taborder("1");
            obj.set_binddataset("ds_product");
            obj.set_cellsizingtype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"190\"/><Column size=\"88\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"패턴\"/><Cell col=\"1\" text=\"규격\"/><Cell col=\"2\" text=\"상품코드\"/><Cell col=\"3\" text=\"상품명\"/><Cell col=\"4\" text=\"장착가능수량\"/></Band><Band id=\"body\"><Cell style=\"align:left;\" text=\"bind:pettrenNm\"/><Cell col=\"1\" style=\"align:left;\" text=\"bind:sizeNm\"/><Cell col=\"2\" style=\"align:left;\" text=\"bind:matCd\"/><Cell col=\"3\" style=\"align:left;\" text=\"bind:matNm\"/><Cell col=\"4\" text=\"bind:wheelQty\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Grid("grid_model", "absolute", "1.67%", "221", null, "133", "1.67%", null, this);
            obj.set_taborder("2");
            obj.set_binddataset("ds_model");
            obj.set_visible("false");
            obj.set_enable("true");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"rn\"/><Cell col=\"1\" text=\"카메이커\"/><Cell col=\"2\" text=\"차종\"/><Cell col=\"3\" text=\"차종명\"/><Cell col=\"4\" text=\"사양\"/><Cell col=\"5\" text=\"사양명\"/><Cell col=\"6\" text=\"전후구분\"/><Cell col=\"7\" text=\"모델명\"/></Band><Band id=\"body\"><Cell text=\"bind:rn\"/><Cell col=\"1\" text=\"bind:makerCd\"/><Cell col=\"2\" text=\"bind:modelCd\"/><Cell col=\"3\" text=\"bind:modelNm\"/><Cell col=\"4\" text=\"bind:contentsCd\"/><Cell col=\"5\" text=\"bind:conTentsNm\"/><Cell col=\"6\" text=\"bind:frCd\"/><Cell col=\"7\" text=\"bind:mcNm\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Button("btn_choice", "absolute", null, "460", "41", "21", "55", null, this);
            obj.set_taborder("3");
            obj.set_text("선택");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);

            obj = new Button("btn_close", "absolute", null, "460", "41", "21", "10", null, this);
            obj.set_taborder("4");
            obj.set_text("닫기");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 0, 45, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("0");
            		p.set_scrollbars("none");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 600, 490, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCMPrice_pop");
            		p.set_titletext("상품 조회");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCOMMProduct_pop.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCOMMProduct_pop.xfdl", function() {
        	//include "lib::comLib.xjs";
        	this.args = "";
            
            
            this.RTCMPrice_pop_onload = function(obj,e)
        	{
        		Ex.core.init(obj);
        		this.fn_init();
        	}

        

        	this.fn_init = function(){
        		var sSvcID      	= "listBrandCombo";  
        		var sController   	= "rtms/comm/listBrandCombo.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_brand=output1";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        	
        	
        	
        	/***********************************************************************************
        	* CallBack Event (strSvcId - Sevice ID, nErrorCode - ErrorCode, strErrorMsg - Error Message)
        	***********************************************************************************/
            this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg,resultCnt)
        	{
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
        	
        	
        	this.div_search_cb_searchBrand_onitemchanged = function(obj,e)
        	{
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

        

        	this.div_search_cb_searchModel_onitemchanged = function(obj,e)
        	{
        		var nRow1 = this.ds_model.findRow( "rn", this.div_search.cb_searchModel.value );
        		var nRow2 = this.ds_model.findRow( "mcNm", this.div_search.cb_searchModel.text );
        		if( nvl(nRow1) != "" && nvl(nRow2) != "" ){
        			this.grid_model.selectRow( nRow1 );
        		}
        	}
        	
        	
        	
        	this.div_search_btn_search_onclick = function(obj,e)
        	{
        		var searchBrandVal = nvl(this.div_search.cb_searchBrand.value);
        		var searchModelVal = nvl(this.div_search.cb_searchModel.value);
        		
        		if( searchBrandVal == "" ){
        			alert( this.div_search.cb_searchBrand.displaynulltext + " 값이 없습니다.");
        			return this.div_search.cb_searchBrand.setFocus();
        		}else if( searchModelVal == "" ){
        			alert( this.div_search.cb_searchModel.displaynulltext + " 값이 없습니다.");
        			return this.div_search.cb_searchModel.setFocus();
        		}else{
        			var nRow 			= this.grid_model.currentrow;
        			var modelCdVal		= this.ds_model.getColumn( nRow, "modelCd");
        			var contentsCdVal 	= this.ds_model.getColumn( nRow, "contentsCd");
        			var frCdVal 		= this.ds_model.getColumn( nRow, "frCd");
        			
        			if( modelCdVal != "" && contentsCdVal != "" && frCdVal != ""){
        				var sSvcID        	= "listProductPop";                    
        				var sController   	= "rtms/comm/listProductPop.do";
        				var sInDatasets   	= "";
        				var sOutDatasets  	= "ds_product=mapProduct";
        				var sArgs 			= "";	
        				var fn_callBack		= "fn_callBack";
        				
        				this.ds_product.deleteAll();
        				
        				sArgs += Ex.util.setParam("modelCd", modelCdVal);
        				sArgs += Ex.util.setParam("contentsCd", contentsCdVal);
        				sArgs += Ex.util.setParam("frCd", frCdVal);
        				
        				Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        		
        			}else{
        				alert( "코드값 오류" );
        			}
        		}
        	}

        	

        	this.grid_product_oncelldblclick = function(obj,e)
        	{
        		this.FN_choice();
        	}
        	
        	
        	
        	this.btn_choice_onclick = function(obj,e)
        	{
        		this.FN_choice();
        	}

        
        	
        	this.FN_choice = function(){
        		var idx = this.ds_product.rowposition;
        		var cd 	= this.ds_product.getColumn(idx, "matCd");
        		var nm 	= this.ds_product.getColumn(idx, "matNm");
        		
        		if( idx != -1 ){
        			if( this.parent.p_formId == "RTCOMMPrice_pop" ){
        				if( nvl(cd) != "" && nvl(nm) != "" ){
        					var arr = { cd : cd, nm : nm };
        					this.close(this.opener.returnProduct(arr));
        				}
        			} else if(this.parent.p_formId == "RTSDCampReg") {
        				if( nvl(cd) != "" && nvl(nm) != "" ){
        					var arr = { cd : cd, nm : nm };
        					this.close(this.opener.returnProduct(arr));
        				}
        			}
        		}else{
        			alert("선택된 데이터가 없습니다.");
        		}
        		
        	}
        	
        	this.btn_close_onclick = function(obj,e)
        	{
        		this.close();
        	}

        	this.RTCOMMProduct_pop_onkeyup = function(obj,e)
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
            this.addEventHandler("onkeyup", this.RTCOMMProduct_pop_onkeyup, this);
            this.div_search.btn_search.addEventHandler("onclick", this.div_search_btn_search_onclick, this);
            this.div_search.cb_searchBrand.addEventHandler("onitemchanged", this.div_search_cb_searchBrand_onitemchanged, this);
            this.div_search.cb_searchModel.addEventHandler("onitemchanged", this.div_search_cb_searchModel_onitemchanged, this);
            this.grid_price.addEventHandler("oncelldblclick", this.grid_product_oncelldblclick, this);
            this.btn_choice.addEventHandler("onclick", this.btn_choice_onclick, this);
            this.btn_close.addEventHandler("onclick", this.btn_close_onclick, this);

        };

        this.loadIncludeScript("RTCOMMProduct_pop.xfdl");

       
    };
}
)();
