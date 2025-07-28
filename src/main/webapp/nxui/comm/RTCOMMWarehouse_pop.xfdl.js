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
                this.set_name("RTCOMMWarehouse_pop");
                this.set_classname("RTCSWarehouse_pop");
                this.set_titletext("창고조회");
                this._setFormPosition(0,0,802,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_rtcs0200", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"warehCd\" type=\"STRING\" size=\"256\"/><Column id=\"warehNm\" type=\"STRING\" size=\"256\"/><Column id=\"begday\" type=\"STRING\" size=\"256\"/><Column id=\"endday\" type=\"STRING\" size=\"256\"/><Column id=\"bldMngNo\" type=\"STRING\" size=\"256\"/><Column id=\"posCd\" type=\"STRING\" size=\"256\"/><Column id=\"addr1\" type=\"STRING\" size=\"256\"/><Column id=\"addr2\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"faxNo\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Div("div_search", "absolute", "10", "10", "782", "45", null, null, this);
            obj.set_taborder("0");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Button("btn_search", "absolute", "680", "10", "78", "22", null, null, this.div_search);
            obj.set_taborder("67");
            obj.set_text("조회");
            obj.set_cssclass("btn_WF_CRUD");
            obj.getSetter("domainId").set("nexa.search");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_warehCd", "absolute", "20", "9", "70", "20", null, null, this.div_search);
            obj.set_taborder("68");
            obj.set_text("창고코드");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_warehCd", "absolute", "90", "10", "120", "21", null, null, this.div_search);
            obj.set_taborder("69");
            obj.set_enable("true");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_warehNm", "absolute", "310", "11", "120", "21", null, null, this.div_search);
            obj.set_taborder("70");
            obj.set_enable("true");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_telNo", "absolute", "460", "11", "70", "20", null, null, this.div_search);
            obj.set_taborder("71");
            obj.set_text("전화번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_telNo", "absolute", "530", "10", "120", "21", null, null, this.div_search);
            obj.set_taborder("72");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_warehNm", "absolute", "240", "10", "70", "20", null, null, this.div_search);
            obj.set_taborder("73");
            obj.set_text("창고명");
            obj.set_cssclass("sta_WF_schTitle");
            obj.set_enableevent("false");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static22", "absolute", "0", "0", null, "12", "0", null, this.div_search);
            obj.set_taborder("74");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "430", "0", "30", "41", null, null, this.div_search);
            obj.set_taborder("75");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "0", "30", null, "12", "0", null, this.div_search);
            obj.set_taborder("76");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "210", "0", "30", "41", null, null, this.div_search);
            obj.set_taborder("77");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "650", "0", "30", "41", null, null, this.div_search);
            obj.set_taborder("78");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "0", "0", "20", "41", null, null, this.div_search);
            obj.set_taborder("79");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static05", "absolute", "758", "0", "20", "41", null, null, this.div_search);
            obj.set_taborder("80");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);

            obj = new Grid("grid_rtcs0200", "absolute", "10", "65", "782", "385", null, null, this);
            obj.set_taborder("1");
            obj.set_binddataset("ds_rtcs0200");
            obj.set_cellsizingtype("col");
            obj.set_autofittype("col");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"100\"/><Column size=\"100\"/><Column size=\"400\"/><Column size=\"100\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"창고코드\"/><Cell col=\"1\" text=\"창고명\"/><Cell col=\"2\" text=\"주소\"/><Cell col=\"3\" text=\"전화번호\"/></Band><Band id=\"body\"><Cell text=\"bind:warehCd\" tooltiptext=\"bind:warehCd\"/><Cell col=\"1\" text=\"bind:warehNm\" tooltiptext=\"bind:warehNm\"/><Cell col=\"2\" style=\"align:left;\" expr=\"expr:&quot;( &quot; + posCd + &quot;  ) &quot; + addr1 + &quot;  &quot; + addr2\" tooltiptext=\"expr:&quot;( &quot; + posCd + &quot;  ) &quot; + addr1 + &quot;  &quot; + addr2\"/><Cell col=\"3\" text=\"bind:telNo\" expr=\"expr:FN_numberHyphenInReturn(telNo)\" tooltiptext=\"expr:FN_numberHyphenInReturn(telNo)\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Button("btn_choice", "absolute", "706", "462", "41", "21", null, null, this);
            obj.set_taborder("2");
            obj.set_text("선택");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);

            obj = new Button("btn_close", "absolute", "751", "462", "41", "21", null, null, this);
            obj.set_taborder("3");
            obj.set_text("닫기");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);

            obj = new Static("Static22", "absolute", "0", "0", "802", "10", null, null, this);
            obj.set_taborder("4");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "0", "10", "496", null, null, this);
            obj.set_taborder("5");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "8", "55", "794", "10", null, null, this);
            obj.set_taborder("6");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "792", "0", "10", "496", null, null, this);
            obj.set_taborder("7");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0", "447", "802", "10", null, null, this);
            obj.set_taborder("8");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "0", "486", "802", "10", null, null, this);
            obj.set_taborder("9");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 782, 45, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("0");
            		p.set_text("Div00");
            		p.set_scrollbars("none");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 802, 496, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCSWarehouse_pop");
            		p.set_titletext("창고조회");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCOMMWarehouse_pop.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCOMMWarehouse_pop.xfdl", function() {
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //include "lib::comLib.xjs"; 
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg){
        	if( strSvcId == "selectRTCSWarehouseRegister" ){
        		var nRowCount = this.ds_rtcs0200.getRowCount();
        		if(nRowCount != 0){
        			
        		}else{
        			alert("조회된 데이터가 없습니다.");
        			this.grid_rtcs0200.set_nodatatext("조회된 데이터가 없습니다.");
        			this.div_search.ed_warehCd.setFocus(true);
        		}
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.RTCOMMWarehouse_pop_onload = function(obj,e){
        	
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_btn_search_onclick = function(obj,e){
        	var warehCd = nvl(this.div_search.ed_warehCd.value);
        	var warehNm = nvl(this.div_search.ed_warehNm.value);
        	var telNo 	= nvl(FN_numberHyphenOut(nvl(this.div_search.ed_telNo.value)));
        	
        	var sSvcID        	= "selectRTCSWarehouseRegister";                    
        	var sController   	= "rtms/cs/selectRTCSWarehouseRegister.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_rtcs0200=mapRtcs0200";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("warehCd", warehCd);
        	sArgs += Ex.util.setParam("warehNm", warehNm);
        	sArgs += Ex.util.setParam("telNo", telNo);
        	
        	this.ds_rtcs0200.clearData();
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.grid_rtcs0200_oncelldblclick = function(obj,e){
        	this.FN_choice();
        }
        this.btn_choice_onclick = function(obj,e){
        	this.FN_choice();
        }
        this.FN_choice = function(){
        	var pos = this.ds_rtcs0200.rowposition;
        		
        	if( pos == -1 ){
        		alert("선택된 데이터가 없습니다.");
        	}else{
        		var warehCd 	= this.ds_rtcs0200.getColumn(pos, "warehCd");
        		var warehNm 	= this.ds_rtcs0200.getColumn(pos, "warehNm");
        		res = [ warehCd, warehNm ];
        			
        		if( this.parent.p_arg == "RTCSWarehouseRegister" ){
        			this.close( this.opener.returnWarehCd(res) );
        		}else if( this.parent.p_arg == "RTCSWarehAgencyRegister_select" ){
        			this.close( this.opener.returnWarehCdSelect(res) );
        		}else if( this.parent.p_arg == "RTCSWarehAgencyRegister_insert" ){
        			this.close( this.opener.returnWarehCdIsnert(res) );
        		}else if( this.parent.p_arg == "RTCSWarehouseRegister_isnert" ){
        			this.close( this.opener.returnWarehCd(res) );
        		}else if( this.parent.p_arg == "RTCSKeepHistory" ){
        			this.close( this.opener.returnWarehCd(res) );
        		}else{
        			
        		}
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.btn_close_onclick = function(obj,e){
        	this.close();
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.RTCOMMWarehouse_pop_onkeyup = function(obj,e){
        	if(e.keycode == 27){
        		this.close();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_ed_warehCd_onkeyup = function(obj,e){
        	if( e.keycode == "13" ){
        		this.div_search_btn_search_onclick();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_ed_warehNm_onkeyup = function(obj,e){
        	if( e.keycode == "13" ){
        		this.div_search_btn_search_onclick();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_ed_telNo_onkeyup = function(obj,e){
        	if( e.keycode == "13" ){
        		this.div_search_btn_search_onclick();
        	}else{
        		FN_numberHyphenIn(obj, e);
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTCOMMWarehouse_pop_onload, this);
            this.addEventHandler("onkeyup", this.RTCOMMWarehouse_pop_onkeyup, this);
            this.div_search.btn_search.addEventHandler("onclick", this.div_search_btn_search_onclick, this);
            this.div_search.ed_warehCd.addEventHandler("onkeyup", this.div_search_ed_warehCd_onkeyup, this);
            this.div_search.ed_warehNm.addEventHandler("onkeyup", this.div_search_ed_warehNm_onkeyup, this);
            this.div_search.ed_telNo.addEventHandler("onkeyup", this.div_search_ed_telNo_onkeyup, this);
            this.grid_rtcs0200.addEventHandler("oncelldblclick", this.grid_rtcs0200_oncelldblclick, this);
            this.btn_choice.addEventHandler("onclick", this.btn_choice_onclick, this);
            this.btn_close.addEventHandler("onclick", this.btn_close_onclick, this);

        };

        this.loadIncludeScript("RTCOMMWarehouse_pop.xfdl");

       
    };
}
)();
