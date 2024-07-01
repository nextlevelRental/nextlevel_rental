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
                this.set_name("RTCOMMSaleAgentList_pop");
                this.set_classname("RTCOMMSellersList_pop");
                this.set_titletext("판매처조회");
                this._setFormPosition(0,0,800,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_saleAgent", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"agencyCd\" type=\"STRING\" size=\"256\"/><Column id=\"agencyNm\" type=\"STRING\" size=\"256\"/><Column id=\"salesGroup\" type=\"STRING\" size=\"256\"/><Column id=\"salesOffice\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"chanCd\" type=\"STRING\" size=\"256\"/><Column id=\"lifnr\" type=\"STRING\" size=\"256\"/><Column id=\"taxRqcd\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_chanCd", this);
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
            obj = new Div("div_search", "absolute", "10", "10", "782", "78", null, null, this);
            obj.set_taborder("0");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Button("btn_search", "absolute", "691", "10", "78", "22", null, null, this.div_search);
            obj.set_taborder("81");
            obj.set_text("조회");
            obj.set_cssclass("btn_WF_CRUD");
            obj.getSetter("domainId").set("nexa.search");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_warehCd", "absolute", "20", "9", "80", "20", null, null, this.div_search);
            obj.set_taborder("82");
            obj.set_text("판매인코드");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_saleAgent", "absolute", "100", "10", "100", "21", null, null, this.div_search);
            obj.set_taborder("83");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_saleAgnm", "absolute", "304", "11", "120", "21", null, null, this.div_search);
            obj.set_taborder("84");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_warehNm", "absolute", "234", "10", "80", "20", null, null, this.div_search);
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
            obj = new Static("Static03", "absolute", "426", "0", "30", "41", null, null, this.div_search);
            obj.set_taborder("89");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "0", "33", null, "9", "0", null, this.div_search);
            obj.set_taborder("90");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "203", "0", "30", "41", null, null, this.div_search);
            obj.set_taborder("91");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "0", "2", "20", "41", null, null, this.div_search);
            obj.set_taborder("93");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_chanCd", "absolute", "305", "43", "100", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("95");
            obj.set_autoselect("true");
            obj.set_innerdataset("ds_chanCd");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj.set_index("0");
            obj = new Static("Static06", "absolute", "233", "43", "80", "21", null, null, this.div_search);
            obj.set_taborder("96");
            obj.set_text("채널구분");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_saleOffice", "absolute", "99", "43", "100", "21", null, null, this.div_search);
            obj.set_taborder("97");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_warehCd00", "absolute", "20", "45", "80", "20", null, null, this.div_search);
            obj.set_taborder("98");
            obj.set_text("지점코드");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static07", "absolute", "0", "41", "20", "41", null, null, this.div_search);
            obj.set_taborder("99");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static08", "absolute", "0", "64", null, "12", "0", null, this.div_search);
            obj.set_taborder("100");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static09", "absolute", "203", "40", "30", "41", null, null, this.div_search);
            obj.set_taborder("101");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_warehCd01", "absolute", "459", "11", "80", "20", null, null, this.div_search);
            obj.set_taborder("102");
            obj.set_text("지사코드");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_saleGroup", "absolute", "528", "11", "100", "21", null, null, this.div_search);
            obj.set_taborder("103");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_warehCd02", "absolute", "456", "43", "80", "20", null, null, this.div_search);
            obj.set_taborder("104");
            obj.set_text("벤터코드");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_lifnr", "absolute", "530", "42", "100", "21", null, null, this.div_search);
            obj.set_taborder("105");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static05", "absolute", "426", "40", "30", "41", null, null, this.div_search);
            obj.set_taborder("106");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "633", "0", "30", "41", null, null, this.div_search);
            obj.set_taborder("107");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static10", "absolute", "633", "40", "30", "41", null, null, this.div_search);
            obj.set_taborder("108");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);

            obj = new Grid("grid_saleAgent", "absolute", "11", "131", "782", "317", null, null, this);
            obj.set_taborder("1");
            obj.set_binddataset("ds_saleAgent");
            obj.set_cellsizingtype("col");
            obj.set_autofittype("col");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"150\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"120\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"140\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell text=\"판매처코드\"/><Cell col=\"1\" text=\"판매처명\"/><Cell col=\"2\" text=\"지사\"/><Cell col=\"3\" text=\"지점\"/><Cell col=\"4\" text=\"전화번호\"/><Cell col=\"5\" text=\"채널구분\"/><Cell col=\"6\" text=\"벤더코드\"/><Cell col=\"7\" text=\"세금계산서 발행방법\"/></Band><Band id=\"body\"><Cell text=\"bind:agencyCd\"/><Cell col=\"1\" text=\"bind:agencyNm\"/><Cell col=\"2\" text=\"bind:salesGroup\"/><Cell col=\"3\" text=\"bind:salesOffice\"/><Cell col=\"4\" text=\"bind:telNo\"/><Cell col=\"5\" text=\"bind:chanCd\"/><Cell col=\"6\" text=\"bind:lifnr\"/><Cell col=\"7\" text=\"bind:taxRqcd\"/></Band></Format></Formats>");
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

            obj = new Static("Static04", "absolute", "0", "484", "802", "10", null, null, this);
            obj.set_taborder("9");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 782, 78, this.div_search,
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
            		p.set_titletext("판매처조회");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCOMMSaleAgentList_pop.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCOMMSaleAgentList_pop.xfdl", function() {
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //include "lib::comLib.xjs"; 
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg){
        	if( strSvcId == "initRTCOMMSaleAgentList" ){
        		var rowCt = this.ds_chanCd.getRowCount();
        		if( rowCt != 0 ){
        			var nRow = this.ds_chanCd.findRowAs( "cd", "01" );
        			
        			for( var i = 0 ; i < rowCt ; i++ ){
        				if( i != nRow){
        					this.ds_chanCd.deleteRow(i);
        				}
        			}
        			
        			var rowposition = this.ds_chanCd.rowposition;
        			var insert = this.ds_chanCd.insertRow( 0 );
        			this.ds_chanCd.setColumn(insert,"cd"," ");
        			this.ds_chanCd.setColumn(insert,"cdNm","전체");
        			this.div_search.cb_chanCd.set_value( " " );
        			
        			this.div_search.cb_chanCd.set_value(this.ds_chanCd.getColumn(rowposition, "cd"));
        		}
        	}
        	
        	if( strSvcId == "selectRTCOMMSaleAgentList" ){
        		var rowCt = this.ds_saleAgent.getRowCount();
        		if( rowCt == 0 ){
        			this.grid_saleAgent.set_nodatatext("조회된 데이터가 없습니다.");
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
        	var sSvcID      	= "initRTCOMMSaleAgentList";  
        	var sController   	= "rtms/comm/initRTCOMMSaleAgentList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	sOutDatasets += " ds_chanCd=mapDsChanCd ";
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_btn_search_onclick = function(obj,e){
        	var saleAgent = nvl(this.div_search.ed_saleAgent.value);
        	var saleAgnm  = nvl(this.div_search.ed_saleAgnm.value);
        	var saleOffice = nvl(this.div_search.ed_saleOffice.value);
        	var saleGroup = nvl(this.div_search.ed_saleGroup.value);
        	var chanCd = nvl(this.div_search.cb_chanCd.value);
        	var lifnr = nvl(this.div_search.ed_lifnr.value);
        	
        	var sSvcID        	= "selectRTCOMMSaleAgentList";                    
        	var sController   	= "rtms/comm/selectRTCOMMSaleAgentList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_saleAgent=mapSaleAgent";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("saleAgent", saleAgent);
        	sArgs += Ex.util.setParam("saleAgnm", saleAgnm);
        	sArgs += Ex.util.setParam("saleOffice", saleOffice);
        	sArgs += Ex.util.setParam("saleGroup", saleGroup);
        	sArgs += Ex.util.setParam("chanCd", chanCd);
        	sArgs += Ex.util.setParam("lifnr", lifnr);
        	
        	this.ds_saleAgent.clearData();
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
        	var nRow 	 = this.ds_saleAgent.rowposition;
        	var agencyCd = this.ds_saleAgent.getColumn( nRow, "agencyCd" );
        	var agencyNm  = this.ds_saleAgent.getColumn( nRow, "agencyNm" );
        	
        	res = [agencyCd, agencyNm];
        		
        	if( this.parent.p_arg == "RTRESaleCommission") {
        	    this.close( this.opener.FN_sellers(res));
        	}else if( this.parent.p_arg == "RTREAllowanceSavingContract") {
        	    this.close( this.opener.FN_sellers(res));
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
            this.div_search.btn_search.addEventHandler("onclick", this.div_search_btn_search_onclick, this);
            this.div_search.ed_saleAgent.addEventHandler("onkeyup", this.div_search_ed_warehCd_onkeyup, this);
            this.div_search.ed_saleAgnm.addEventHandler("onkeyup", this.div_search_ed_warehNm_onkeyup, this);
            this.div_search.ed_saleOffice.addEventHandler("onkeyup", this.div_search_ed_warehCd_onkeyup, this);
            this.div_search.ed_saleGroup.addEventHandler("onkeyup", this.div_search_ed_warehNm_onkeyup, this);
            this.div_search.ed_lifnr.addEventHandler("onkeyup", this.div_search_ed_warehCd_onkeyup, this);
            this.grid_saleAgent.addEventHandler("oncelldblclick", this.grid_sellers_oncelldblclick, this);
            this.btn_choice.addEventHandler("onclick", this.btn_choice_onclick, this);
            this.btn_close.addEventHandler("onclick", this.btn_close_onclick, this);

        };

        this.loadIncludeScript("RTCOMMSaleAgentList_pop.xfdl");

       
    };
}
)();
