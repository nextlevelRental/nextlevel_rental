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
                this.set_name("RTCOMMAgencyEtc_pop");
                this.set_classname("RTCOMMAgencyEtc_pop");
                this.set_titletext("대리점조회");
                this._setFormPosition(0,0,1024,491);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_agencyPop", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"agencyCd\" type=\"STRING\" size=\"256\"/><Column id=\"agencyNm\" type=\"STRING\" size=\"256\"/><Column id=\"salesGroup\" type=\"STRING\" size=\"256\"/><Column id=\"salesGroupNm\" type=\"STRING\" size=\"256\"/><Column id=\"salesOffice\" type=\"STRING\" size=\"256\"/><Column id=\"salesOfficeNm\" type=\"STRING\" size=\"256\"/><Column id=\"posCd\" type=\"STRING\" size=\"256\"/><Column id=\"city\" type=\"STRING\" size=\"256\"/><Column id=\"street\" type=\"STRING\" size=\"256\"/><Column id=\"sidoCd\" type=\"STRING\" size=\"256\"/><Column id=\"sigunCd\" type=\"STRING\" size=\"256\"/><Column id=\"serNo\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"faxNo\" type=\"STRING\" size=\"256\"/><Column id=\"taxNo\" type=\"STRING\" size=\"256\"/><Column id=\"repNm\" type=\"STRING\" size=\"256\"/><Column id=\"busiType\" type=\"STRING\" size=\"256\"/><Column id=\"busiCond\" type=\"STRING\" size=\"256\"/><Column id=\"rentalYn\" type=\"STRING\" size=\"256\"/><Column id=\"strDay\" type=\"STRING\" size=\"256\"/><Column id=\"endDay\" type=\"STRING\" size=\"256\"/><Column id=\"posX\" type=\"STRING\" size=\"256\"/><Column id=\"posY\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/><Column id=\"lmYn\" type=\"STRING\" size=\"256\"/><Column id=\"fmYn\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_S016", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_S017", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Button("btn_close", "absolute", "974", "460", "41", "21", null, null, this);
            obj.set_taborder("7");
            obj.set_text("닫기");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);

            obj = new Button("btn_choice", "absolute", "928", "460", "41", "21", null, null, this);
            obj.set_taborder("5");
            obj.set_text("선택");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);

            obj = new Grid("grid_agency", "absolute", "10", "65", "1004", "385", null, null, this);
            obj.set_taborder("3");
            obj.set_binddataset("ds_agencyPop");
            obj.set_cellsizingtype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"250\"/><Column size=\"60\"/><Column size=\"60\"/><Column size=\"60\"/><Column size=\"80\"/><Column size=\"60\"/><Column size=\"200\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"대리점코드\"/><Cell col=\"1\" text=\"대리점명\"/><Cell col=\"2\" text=\"지사코드\"/><Cell col=\"3\" text=\"지사명\"/><Cell col=\"4\" text=\"지점코드\"/><Cell col=\"5\" text=\"지점명\"/><Cell col=\"6\" text=\"우편번호\"/><Cell col=\"7\" text=\"주소\"/><Cell col=\"8\" text=\"상세주소\"/><Cell col=\"9\" text=\"전화번호\"/><Cell col=\"10\" text=\"대표명\"/><Cell col=\"11\" text=\"렌탈대리점 여부 \"/><Cell col=\"12\" text=\"경정비\"/><Cell col=\"13\" text=\"수입차경정비\"/></Band><Band id=\"body\"><Cell text=\"bind:agencyCd\"/><Cell col=\"1\" style=\"align:left;\" text=\"bind:agencyNm\"/><Cell col=\"2\" text=\"bind:salesGroup\"/><Cell col=\"3\" text=\"bind:salesGroupNm\"/><Cell col=\"4\" text=\"bind:salesOffice\"/><Cell col=\"5\" text=\"bind:salesOfficeNm\"/><Cell col=\"6\" text=\"bind:posCd\"/><Cell col=\"7\" style=\"align:left;\" text=\"bind:city\"/><Cell col=\"8\" style=\"align:left;\" text=\"bind:street\"/><Cell col=\"9\" text=\"bind:telNo\" expr=\"expr:FN_numberHyphenInReturn(telNo)\"/><Cell col=\"10\" text=\"bind:repNm\"/><Cell col=\"11\" text=\"bind:rentalYn\"/><Cell col=\"12\" text=\"bind:lmYn\"/><Cell col=\"13\" text=\"bind:fmYn\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "10", "10", "1004", "45", null, null, this);
            obj.set_taborder("0");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Button("btn_search", "absolute", "935", "10", "45", "22", null, null, this.div_search);
            obj.set_taborder("4");
            obj.set_text("조회");
            obj.set_cssclass("btn_WF_CRUD");
            obj.getSetter("domainId").set("nexa.search");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchAgency", "absolute", "332", "10", "80", "20", null, null, this.div_search);
            obj.set_taborder("5");
            obj.set_text("대리점");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_agencyNm", "absolute", "412", "10", "140", "21", null, null, this.div_search);
            obj.set_taborder("2");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchRentalYn00", "absolute", "20", "10", "80", "20", null, null, this.div_search);
            obj.set_taborder("6");
            obj.set_text("지역");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "0", "0", "20", "41", null, null, this.div_search);
            obj.set_taborder("7");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static22", "absolute", "0", "0", "1000", "10", null, null, this.div_search);
            obj.set_taborder("8");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "298", "0", "30", "41", null, null, this.div_search);
            obj.set_taborder("9");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "552", "0", "30", "41", null, null, this.div_search);
            obj.set_taborder("10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "0", "31", "1000", "10", null, null, this.div_search);
            obj.set_taborder("11");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Radio("ra_lmFmYn", "absolute", "662", "10", "200", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            var ra_lmFmYn_innerdataset = new Dataset("ra_lmFmYn_innerdataset", this.div_search.ra_lmFmYn);
            ra_lmFmYn_innerdataset._setContents("<ColumnInfo><Column id=\"codecolumn\" size=\"256\"/><Column id=\"datacolumn\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"codecolumn\">01</Col><Col id=\"datacolumn\">경정비</Col></Row><Row><Col id=\"codecolumn\">02</Col><Col id=\"datacolumn\">수입차경정비</Col></Row></Rows>");
            obj.set_innerdataset(ra_lmFmYn_innerdataset);
            obj.set_taborder("3");
            obj.set_codecolumn("codecolumn");
            obj.set_datacolumn("datacolumn");
            obj.set_direction("vertical");
            obj = new Static("Static03", "absolute", "980", "0", "20", "41", null, null, this.div_search);
            obj.set_taborder("12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchAgency00", "absolute", "582", "10", "80", "20", null, null, this.div_search);
            obj.set_taborder("13");
            obj.set_text("정비구분");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_S016", "absolute", "99", "10", "100", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("14");
            obj.set_innerdataset("@ds_S016");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj = new Combo("cb_S017", "absolute", "198", "10", "100", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("15");
            obj.set_innerdataset("@ds_S017");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");

            obj = new Static("Static22", "absolute", "0", "0", "1024", "10", null, null, this);
            obj.set_taborder("1");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "0", "10", "491", null, null, this);
            obj.set_taborder("2");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "0", "481", "1024", "10", null, null, this);
            obj.set_taborder("4");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1014", "0", "10", "491", null, null, this);
            obj.set_taborder("6");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "8", "450", null, "10", "0", null, this);
            obj.set_taborder("8");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0", "55", "1024", "10", null, null, this);
            obj.set_taborder("9");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1004, 45, this.div_search,
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
            obj = new Layout("default", "", 1024, 491, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCOMMAgencyEtc_pop");
            		p.set_titletext("대리점조회");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCOMMAgencyEtc_pop.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCOMMAgencyEtc_pop.xfdl", function() {
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //include "lib::comLib.xjs";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg,resultCnt){
        	if( strSvcId == "initRTCOMMAgencyEtcPop" ){
        		var nCnt = this.ds_S016.getRowCount()
        		if( nCnt != 0 ){
        			var insertRow = this.ds_S016.insertRow(0);
        			this.ds_S016.setColumn(insertRow, "cd", " ");
        			this.ds_S016.setColumn(insertRow, "cdNm", "전체");
        			this.div_search.cb_S016.set_value(" ");
        			this.div_search.ra_lmFmYn.set_value("01");
        		}
        	}
        	
        	if( strSvcId == "selectSigunCd" ){
        		var nCnt = this.ds_S017.getRowCount()
        		if( nCnt != 0 ){
        			var insertRow = this.ds_S017.insertRow(0);
        			this.ds_S017.setColumn(insertRow, "cd", " ");
        			this.ds_S017.setColumn(insertRow, "cdNm", "전체");
        			this.div_search.cb_S017.set_value(" ");
        		}
        	}
        	
        	if( strSvcId == "listAgencyPop" ){
        		var ct = this.ds_agencyPop.rowcount;
        		if( ct != 0 ){
        		}else{
        			alert("조회된 데이터가 없습니다.");
        			this.grid_agency.set_nodatatext("조회된 데이터가 없습니다.");
        			this.div_search.ed_searchAgency.setFocus();
        		}
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.RTCOMMAgencyEtc_pop_onload = function(obj,e){
        	Ex.core.init(obj);
        	this.fn_init();
        }
        this.fn_init = function(){
        	var sSvcID      	= "initRTCOMMAgencyEtcPop";  
        	var sController   	= "rtms/comm/initRTCOMMAgencyEtcPop.do";
        	var sInDatasets   	= "";
        	var sOutDatasets	= "";
        	var sArgs 			= "";
        	var fn_callBack		= "fn_callBack";
        	sOutDatasets += " ds_S016=mapDsS016 ";
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.btn_search_onclick = function(obj,e){
        	var agencyNm 	= nvl(this.div_search.ed_agencyNm.value);
        	var salesGroup 	= "";
        	var salesOffice = "";
        	var rentalYn 	= "Y"
        	var sidoCd      = nvl(this.div_search.cb_S016.value);
            var sigunCd     = nvl(this.div_search.cb_S017.value);
            
        	var lmFnYn		= nvl(this.div_search.ra_lmFmYn.value);
        	var lmYn		= "";
        	var fnYn		= "";
        	if( lmFnYn == "01" ){
        		lmYn		= "Y";
        		fnYn		= "";
        	}else{
        		lmYn		= "";
        		fnYn		= "Y";
        	}
        	
        	var sSvcID        	= "listAgencyPop";                    
        	var sController   	= "rtms/comm/listAgencyPop.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_agencyPop=mapAgencyPop";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	this.ds_agencyPop.deleteAll();
        	sArgs += Ex.util.setParam("agencyNm", 		agencyNm);
        	sArgs += Ex.util.setParam("salesGroup", 	salesGroup);
        	sArgs += Ex.util.setParam("salesOffice", 	salesOffice);
        	sArgs += Ex.util.setParam("rentalYn", 		rentalYn);
        	sArgs += Ex.util.setParam("sidoCd", 		sidoCd);
        	sArgs += Ex.util.setParam("sigunCd", 		sigunCd);
        	sArgs += Ex.util.setParam("lmYn", 			lmYn);
        	sArgs += Ex.util.setParam("fnYn", 			fnYn);
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.btn_choice_onclick = function(obj,e){
        	this.FN_choice();
        }
        this.grid_agency_oncelldblclick = function(obj,e){
        	this.FN_choice();
        }
        this.FN_choice = function(){
        	var idx = this.ds_agencyPop.rowposition;
        	if( idx != -1 ){
        		var agencyCd  		= this.ds_agencyPop.getColumn(idx, "agencyCd");
        		var agencyNm  		= this.ds_agencyPop.getColumn(idx, "agencyNm");
        		var salesGroup		= this.ds_agencyPop.getColumn(idx, "salesGroup");
        		var salesOffice 	= this.ds_agencyPop.getColumn(idx, "salesOffice");
        		var salesGroupNm 	= this.ds_agencyPop.getColumn(idx, "salesGroupNm");
        		var salesOfficeNm 	= this.ds_agencyPop.getColumn(idx, "salesOfficeNm");
        		var telNo  			= this.ds_agencyPop.getColumn(idx, "telNo");
        		var posCd  			= this.ds_agencyPop.getColumn(idx, "posCd");
        		var city  			= this.ds_agencyPop.getColumn(idx, "city");
        		var street  		= this.ds_agencyPop.getColumn(idx, "street");
        		var arr = [ agencyCd, agencyNm, telNo, posCd, city, street];
        		this.close(this.opener.returnAgencyCd(arr));
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.btn_close_onclick = function(obj,e){
        	this.close();
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.RTCOMMAgencyEtc_pop_onkeyup = function(obj,e){
        	if(e.keycode == 27){
        		this.close();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_cb_S016_onitemchanged = function(obj,e){
        	var cdDesc = nvl(this.div_search.cb_S016.value);
        	if( cdDesc != "" ){
        		var sSvcID        	= "selectSigunCd";                    
        		var sController   	= "rtms/comm/selectSigunCd.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_S017=mapDsS017";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		this.ds_S017.deleteAll();
        		sArgs += Ex.util.setParam("salesGroup", "S017");
        		sArgs += Ex.util.setParam("cdDesc", cdDesc);
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        }

        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTCOMMAgencyEtc_pop_onload, this);
            this.addEventHandler("onkeyup", this.RTCOMMAgencyEtc_pop_onkeyup, this);
            this.btn_close.addEventHandler("onclick", this.btn_close_onclick, this);
            this.btn_choice.addEventHandler("onclick", this.btn_choice_onclick, this);
            this.grid_agency.addEventHandler("oncelldblclick", this.grid_agency_oncelldblclick, this);
            this.div_search.btn_search.addEventHandler("onclick", this.btn_search_onclick, this);
            this.div_search.ed_agencyNm.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.div_search.cb_S016.addEventHandler("onitemchanged", this.div_search_cb_S016_onitemchanged, this);

        };

        this.loadIncludeScript("RTCOMMAgencyEtc_pop.xfdl");

       
    };
}
)();
