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
                this.set_name("RTCOMMOrdAgentList_pop");
                this.set_classname("RTCOMMSellersList_pop");
                this.set_titletext("판매인조회");
                this._setFormPosition(0,0,800,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_ordAgent", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"ordAgent\" type=\"STRING\" size=\"256\"/><Column id=\"orgAgnm\" type=\"STRING\" size=\"256\"/><Column id=\"orgAgtel\" type=\"STRING\" size=\"256\"/><Column id=\"chanCd\" type=\"STRING\" size=\"256\"/><Column id=\"chanNm\" type=\"STRING\" size=\"256\"/><Column id=\"lifnr\" type=\"STRING\" size=\"256\"/><Column id=\"num\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_useYn", this);
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

            obj = new Dataset("ds_chanCd", this);
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


            
            // UI Components Initialize
            obj = new Div("div_search", "absolute", "10", "10", "782", "72", null, null, this);
            obj.set_taborder("0");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_1", "absolute", "20", "9", "80", "20", null, null, this.div_search);
            obj.set_taborder("82");
            obj.set_text("판매인코드");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_ordAgent", "absolute", "100", "10", "120", "21", null, null, this.div_search);
            obj.set_taborder("83");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_orgAgnm", "absolute", "330", "11", "120", "21", null, null, this.div_search);
            obj.set_taborder("84");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_3", "absolute", "20", "36", "80", "20", null, null, this.div_search);
            obj.set_taborder("85");
            obj.set_text("사용여부");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_2", "absolute", "250", "10", "80", "20", null, null, this.div_search);
            obj.set_taborder("87");
            obj.set_text("판매인명");
            obj.set_cssclass("sta_WF_schTitle");
            obj.set_enableevent("false");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static22", "absolute", "0", "0", null, "12", "0", null, this.div_search);
            obj.set_taborder("88");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "450", "0", "30", "68", null, null, this.div_search);
            obj.set_taborder("89");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "0", "30", "778", "6", null, null, this.div_search);
            obj.set_taborder("90");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "220", "0", "30", "68", null, null, this.div_search);
            obj.set_taborder("91");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "682", "0", "30", "68", null, null, this.div_search);
            obj.set_taborder("92");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "0", "0", "20", "68", null, null, this.div_search);
            obj.set_taborder("93");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static05", "absolute", "758", "0", "20", "68", null, null, this.div_search);
            obj.set_taborder("94");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_useYn", "absolute", "100", "36", "80", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("95");
            obj.set_autoselect("true");
            obj.set_innerdataset("@ds_useYn");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj = new Button("btn_search", "absolute", null, "12", "45", "22", "21", null, this.div_search);
            obj.set_taborder("96");
            obj.set_text("검색");
            obj.set_cssclass("btn_WF_CRUD");
            obj.getSetter("domainId").set("nexa.add");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_chanCd", "absolute", "562", "12", "120", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("97");
            obj.set_autoselect("true");
            obj.set_innerdataset("@ds_chanCd");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj = new Static("st_4", "absolute", "482", "12", "80", "20", null, null, this.div_search);
            obj.set_taborder("98");
            obj.set_text("채널");
            obj.set_cssclass("sta_WF_schTitle");
            obj.set_enableevent("false");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "0", "56", "778", "12", null, null, this.div_search);
            obj.set_taborder("99");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);

            obj = new Grid("grid_ordAgent", "absolute", "10", "92", "782", "356", null, null, this);
            obj.set_taborder("1");
            obj.set_binddataset("ds_ordAgent");
            obj.set_cellsizingtype("col");
            obj.set_autofittype("col");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"120\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"120\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell text=\"판매인코드\"/><Cell col=\"1\" text=\"판매인명\"/><Cell col=\"2\" text=\"연락처\"/><Cell col=\"3\" text=\"채널명\"/></Band><Band id=\"body\"><Cell text=\"bind:ordAgent\"/><Cell col=\"1\" text=\"bind:orgAgnm\"/><Cell col=\"2\" text=\"bind:orgAgtel\"/><Cell col=\"3\" text=\"bind:chanNm\"/></Band></Format></Formats>");
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

            obj = new Static("Static00", "absolute", "0", "82", "800", "10", null, null, this);
            obj.set_taborder("6");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "790", "0", "10", "496", null, null, this);
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
            obj = new Layout("default", "", 782, 72, this.div_search,
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
            obj = new Layout("default", "", 800, 496, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCOMMSellersList_pop");
            		p.set_titletext("판매인조회");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCOMMOrdAgentList_pop.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCOMMOrdAgentList_pop.xfdl", function() {
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //include "lib::comLib.xjs"; 
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg){
        	if( strSvcId == "initRTCOMMOrdAgentList" ){
        		var useYnCnt = this.ds_useYn.getRowCount();
        		if( useYnCnt != 0 ){
        			this.div_search.cb_useYn.set_index(0);
        		}
        		
        		var chanCdCnt = this.ds_chanCd.getRowCount();
        		if( chanCdCnt != 0){
        			var nRow = this.ds_chanCd.insertRow(0);
        			this.ds_chanCd.setColumn(0,"cd"," ");
        			this.ds_chanCd.setColumn(0,"cdNm","전체");
        			this.div_search.cb_chanCd.set_value(" ");
        			
        			if( (this.parent.p_arg  == "selectRTRESalesCommMangOpenMall") || (this.parent.p_arg  == "insertRTRESalesCommMangOpenMall") ){
        				this.div_search.cb_chanCd.set_value("03");
        				this.div_search.cb_chanCd.set_enable(false);
        			}else{
        				this.div_search.cb_chanCd.set_enable(true);
        			}
        		}
        	}
        	
        	if( strSvcId == "selectRTCOMMSellersList" ){
        		var nRowCount = this.ds_ordAgent.getRowCount();
        		if(nRowCount != 0){
        		
        		}else{
        			alert("조회된 데이터가 없습니다.");
        			this.grid_rtcs0200.set_nodatatext("조회된 데이터가 없습니다.");
        		}
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.RTCOMMSellersList_pop_onload = function(obj,e){
        	Ex.core.init(obj);
        	this.fn_init();
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_init = function(){
        	var sSvcID      	= "initRTCOMMOrdAgentList";
        	var sController   	= "rtms/comm/initRTCOMMOrdAgentList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets	= "";
        	var sArgs 			= "";
        	var fn_callBack		= "fn_callBack";
        	sOutDatasets += " ds_useYn=mapDsUseYn ";
        	sOutDatasets += " ds_chanCd=mapDsChanCd ";
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_btn_search_onclick = function(obj,e){
        	var ordAgent = nvl(this.div_search.ed_ordAgent.value);
        	var orgAgnm  = nvl(this.div_search.ed_orgAgnm.value);
        	var useYn 	 = nvl(this.div_search.cb_useYn.value);
        	var chanCd 	 = nvl(this.div_search.cb_chanCd.value);
        	
        	var sSvcID        	= "selectRTCOMMOrdAgentList";                    
        	var sController   	= "rtms/comm/selectRTCOMMOrdAgentList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_ordAgent=mapOrdAgent";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	sArgs += Ex.util.setParam("ordAgent", ordAgent);
        	sArgs += Ex.util.setParam("orgAgnm" , orgAgnm);
        	sArgs += Ex.util.setParam("useYn"	, useYn);
        	sArgs += Ex.util.setParam("chanCd"	, chanCd);
        	this.ds_ordAgent.clearData();
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.grid_sellers_oncelldblclick = function(obj,e){
        	this.FN_choice();
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.btn_choice_onclick = function(obj,e){
        	this.FN_choice();
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.FN_choice = function(){
        	var nRow 	 = this.ds_ordAgent.rowposition;
        	var ordAgent = this.ds_ordAgent.getColumn( nRow, "ordAgent" );
        	var orgAgnm  = this.ds_ordAgent.getColumn( nRow, "orgAgnm" );
        	
        	res = [ ordAgent, orgAgnm];
        		
        	if( this.parent.p_arg == "RTSDOrdAgentResult" || this.parent.p_arg == "RTCMOrdAgentOrder" || this.parent.p_arg == "RTSDOrdAgentRegister" ){
        		this.close( this.opener.FN_sellers(res) );
        	}else if( this.parent.p_arg  == "selectRTRESalesCommMangOpenMall" ){
        		this.close( this.opener.retrunSelect(res ));
        	}else if( this.parent.p_arg  == "insertRTRESalesCommMangOpenMall" ){
        		this.close( this.opener.retrunInsert(res ));
        	}else{
        	
        	}
        	
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.btn_close_onclick = function(obj,e){
        	this.close();
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTCOMMSellersList_pop_onload, this);
            this.div_search.ed_ordAgent.addEventHandler("onkeyup", this.div_search_ed_warehCd_onkeyup, this);
            this.div_search.ed_orgAgnm.addEventHandler("onkeyup", this.div_search_ed_warehNm_onkeyup, this);
            this.div_search.cb_useYn.addEventHandler("onitemchanged", this.div_search_cb_makerSearch_onitemchanged, this);
            this.div_search.btn_search.addEventHandler("onclick", this.div_search_btn_search_onclick, this);
            this.grid_ordAgent.addEventHandler("oncelldblclick", this.grid_sellers_oncelldblclick, this);
            this.btn_choice.addEventHandler("onclick", this.btn_choice_onclick, this);
            this.btn_close.addEventHandler("onclick", this.btn_close_onclick, this);

        };

        this.loadIncludeScript("RTCOMMOrdAgentList_pop.xfdl");

       
    };
}
)();
