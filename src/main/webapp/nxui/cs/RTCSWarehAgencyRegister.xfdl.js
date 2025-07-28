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
                this.set_name("RTCSWarehAgencyRegister");
                this.set_classname("RTCSWarehAgencyRegister");
                this.set_titletext("대리점 창고 관리");
                this._setFormPosition(0,0,1147,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_rtcs0202", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"awSeq\" type=\"STRING\" size=\"256\"/><Column id=\"agencyCd\" type=\"STRING\" size=\"256\"/><Column id=\"agencyNm\" type=\"STRING\" size=\"256\"/><Column id=\"begday\" type=\"STRING\" size=\"256\"/><Column id=\"endday\" type=\"STRING\" size=\"256\"/><Column id=\"warehCd\" type=\"STRING\" size=\"256\"/><Column id=\"warehNm\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
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


            
            // UI Components Initialize
            obj = new Div("div_search", "absolute", "0", "0", "1122", "45", null, null, this);
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_wareh", "absolute", "401", "10", "100", "21", null, null, this.div_search);
            obj.set_taborder("6");
            obj.set_text("창고코드");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_agency", "absolute", "8", "10", "100", "21", null, null, this.div_search);
            obj.set_taborder("7");
            obj.set_text("대리점코드");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "371", "0", "30", "44", null, null, this.div_search);
            obj.set_taborder("8");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static22", "absolute", "0", "0", null, "12", "0", null, this.div_search);
            obj.set_taborder("9");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "0", "30", null, "12", "0", null, this.div_search);
            obj.set_taborder("10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_agencyCd", "absolute", "112", "10", "120", "21", null, null, this.div_search);
            obj.set_taborder("0");
            obj.set_enable("true");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_agencyNm", "absolute", "251", "10", "120", "21", null, null, this.div_search);
            obj.set_taborder("2");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("bt_agency", "absolute", "231", "9", "21", "21", null, null, this.div_search);
            obj.set_taborder("1");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_warehCd", "absolute", "501", "10", "120", "21", null, null, this.div_search);
            obj.set_taborder("3");
            obj.set_enable("true");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("bt_wareh", "absolute", "620", "9", "21", "21", null, null, this.div_search);
            obj.set_taborder("4");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_warehNm", "absolute", "640", "10", "120", "21", null, null, this.div_search);
            obj.set_taborder("5");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1122", "0", "25", "496", null, null, this);
            obj.set_taborder("3");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "45", "1147", "20", null, null, this);
            obj.set_taborder("4");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "61", "169", "20", null, null, this);
            obj.set_taborder("5");
            obj.set_text("검색결과");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "0", "76", "1147", "10", null, null, this);
            obj.set_taborder("18");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Grid("grid_rtcs0202", "absolute", "0", "86", "1122", "299", null, null, this);
            obj.set_taborder("17");
            obj.set_binddataset("ds_rtcs0202");
            obj.set_cellsizingtype("col");
            obj.set_autofittype("col");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"140\"/><Column size=\"140\"/><Column size=\"140\"/><Column size=\"140\"/><Column size=\"140\"/><Column size=\"140\"/><Column size=\"140\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"24\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"순번\"/><Cell col=\"1\" text=\"대리점코드\"/><Cell col=\"2\" text=\"대리점명\"/><Cell col=\"3\" text=\"창고코드\"/><Cell col=\"4\" text=\"창고명\"/><Cell col=\"5\" text=\"시작일자\"/><Cell col=\"6\" text=\"종료일자\"/><Cell col=\"7\" text=\"사용여부\"/></Band><Band id=\"body\"><Cell text=\"bind:awSeq\" tooltiptext=\"bind:awSeq\"/><Cell col=\"1\" text=\"bind:agencyCd\" tooltiptext=\"bind:agencyCd\"/><Cell col=\"2\" text=\"bind:agencyNm\" tooltiptext=\"bind:agencyNm\"/><Cell col=\"3\" text=\"bind:warehCd\" tooltiptext=\"bind:warehCd\"/><Cell col=\"4\" text=\"bind:warehNm\" tooltiptext=\"bind:warehNm\"/><Cell col=\"5\" displaytype=\"date\" text=\"bind:begday\" calendardisplaynulltype=\"none\" tooltiptext=\"bind:begday\"/><Cell col=\"6\" displaytype=\"date\" text=\"bind:endday\" calendardisplaynulltype=\"none\" tooltiptext=\"bind:endday\"/><Cell col=\"7\" text=\"bind:useYn\" tooltiptext=\"bind:useYn\"/></Band><Band id=\"summary\"><Cell text=\"총계\"/><Cell col=\"1\" style=\"align:right;\" text=\"expr:dataset.getRowCount()+&quot;(건)&quot;\"/><Cell col=\"2\" style=\"align:right;\"/><Cell col=\"3\" style=\"align:right;\"/><Cell col=\"4\" style=\"align:right;\"/><Cell col=\"5\" style=\"align:right;\"/><Cell col=\"6\" style=\"align:right;\"/><Cell col=\"7\" style=\"align:right;\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0", "435", "1122", "31", null, null, this);
            obj.set_taborder("1");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_begday", "absolute", "448", "435", "100", "31", null, null, this);
            obj.set_taborder("19");
            obj.set_text("시작일자");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("st_useYn", "absolute", "718", "435", "100", "31", null, null, this);
            obj.set_taborder("20");
            obj.set_text("사용여부");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("st_agency", "absolute", "0", "435", "100", "31", null, null, this);
            obj.set_taborder("21");
            obj.set_text("대리점코드");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "0", "465", "1122", "31", null, null, this);
            obj.set_taborder("2");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_endday", "absolute", "448", "465", "100", "31", null, null, this);
            obj.set_taborder("22");
            obj.set_text("종료일자");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("st_wareh", "absolute", "0", "465", "100", "31", null, null, this);
            obj.set_taborder("23");
            obj.set_text("창고코드");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("Static22", "absolute", "0", "385", "1147", "20", null, null, this);
            obj.set_taborder("24");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Button("btn_delete", "absolute", "1035", "405", "41", "21", null, null, this);
            obj.set_taborder("6");
            obj.set_text("삭제");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Button("btn_insert", "absolute", "1081", "405", "41", "21", null, null, this);
            obj.set_taborder("7");
            obj.set_text("신규");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Static("Static10", "absolute", "0", "425", "1147", "10", null, null, this);
            obj.set_taborder("25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Calendar("cal_begday", "absolute", "553", "440", "160", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("11");
            obj.set_dateformat("yyyy-MM-dd");
            obj.style.set_align("middle");

            obj = new Calendar("cal_endday", "absolute", "553", "470", "160", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("16");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_enable("false");

            obj = new Combo("cb_useYn", "absolute", "823", "440", "160", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("12");
            obj.set_autoselect("true");
            obj.set_innerdataset("@ds_useYn");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj.set_index("0");

            obj = new Static("Static11", "absolute", "0", "407", "169", "20", null, null, this);
            obj.set_taborder("26");
            obj.set_text("변경할 내용");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_agencyCd", "absolute", "104", "440", "160", "21", null, null, this);
            obj.set_taborder("8");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Button("bt_agency", "absolute", "262", "439", "21", "21", null, null, this);
            obj.set_taborder("9");
            obj.set_cssclass("btn_WF_edtSch");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_agencyNm", "absolute", "283", "440", "160", "21", null, null, this);
            obj.set_taborder("10");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_warehCd", "absolute", "104", "470", "160", "21", null, null, this);
            obj.set_taborder("13");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Button("bt_wareh", "absolute", "262", "469", "21", "21", null, null, this);
            obj.set_taborder("14");
            obj.set_cssclass("btn_WF_edtSch");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_warehNm", "absolute", "283", "470", "160", "21", null, null, this);
            obj.set_taborder("15");
            obj.set_enable("false");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1122, 45, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_text("Div00");
            		p.set_scrollbars("none");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1147, 496, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCSWarehAgencyRegister");
            		p.set_titletext("대리점 창고 관리");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item0","ed_agencyCd","value","ds_rtcs0202","agencyCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item1","ed_agencyNm","value","ds_rtcs0202","agencyNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item2","cal_begday","value","ds_rtcs0202","begday");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item3","cb_useYn","value","ds_rtcs0202","useYn");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item4","ed_warehCd","value","ds_rtcs0202","warehCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item5","ed_warehNm","value","ds_rtcs0202","warehNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item6","cal_endday","value","ds_rtcs0202","endday");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCSWarehAgencyRegister.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCSWarehAgencyRegister.xfdl", function() {
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //include "lib::comLib.xjs"; 
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.p_arg 			= "RTCSWarehouseRegister";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.toDay 			= "";		//현재날짜
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg){
        	if (nErrorCode < 0) {
        		alert(strErrorMsg);		
        		return;
        	}
        	
        	if( strSvcId == "initRTCSWarehAgencyRegister" ){
        	
        	}
        	
        	if( strSvcId == "getToday" ){
        	
        	}
        	
        	if( strSvcId == "saveRTCSWarehAgencyRegister" ){
        		alert(strErrorMsg);
        		if( nErrorCode == "0" ){
        			this.fn_search();
        		}
        	}
        	
        	if( strSvcId == "selectRTCSWarehAgencyRegister" ){
        		var nRowCount = this.ds_rtcs0202.getRowCount();
        		if(nRowCount != 0){
        			
        		}else{
        			alert("조회된 데이터가 없습니다.");
        			this.grid_rtcs0202.set_nodatatext("조회된 데이터가 없습니다.");
        			this.div_search.ed_agencyCd.setFocus(true);
        		}
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.RTCSWarehAgencyRegister_onload = function(obj,e){
        	Ex.core.init(obj);
        	this.parent.setButton("E|C|S", this);
        	this.fn_init();
        	
        }
        this.fn_init = function(){
        	var sSvcID      	= "initRTCSWarehAgencyRegister";  
        	var sController   	= "rtms/cs/initRTCSWarehAgencyRegister.do";
        	var sInDatasets   	= "";
        	var sOutDatasets	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	sOutDatasets += " ds_useYn=mapDsUseYn ";
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	
        	var sSvcID      	= "getToday";  
        	var sController   	= "/rtms/comm/getToday.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_save = function(){
        	
        	if( !this.FN_saveCheckRequired() ) {
        		return false;
        	}
        	
        	if( !this.FN_saveCheckChange() ) {
        		alert('변경된 데이터가 없습니다.');
        		return false;
        	}
        	
        	if( !this.FN_saveCheckChangeCount() ) {
        		alert('변경된 데이터가 1건 이상입니다.');
        		return false;
        	}
        	
        	var sSvcID        	= "saveRTCSWarehAgencyRegister";                    
        	var sController   	= "rtms/cs/saveRTCSWarehAgencyRegister.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	sInDatasets   		= "input=ds_rtcs0202:U";
        	sOutDatasets  		= "";
        	var fn_callBack		= "fn_callBack";
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        this.FN_saveCheckRequired = function(){
        	var returnFlag = true;
        	var cnt = this.ds_rtcs0202.getRowCount();
        	var msg = " 값이 없습니다.";
        	for( var  i = 0 ; i < cnt ; i++ ){
        		if( (this.ds_rtcs0202.getRowType(i) == 2) || (this.ds_rtcs0202.getRowType(i) == 4) ){
        			var agencyCd= nvl(this.ds_rtcs0202.getColumn(i,"agencyCd"));
        			var warehCd	= nvl(this.ds_rtcs0202.getColumn(i,"warehCd"));
        			var begday 	= nvl(this.ds_rtcs0202.getColumn(i,"begday"));
        			var endday 	= nvl(this.ds_rtcs0202.getColumn(i,"endday"));
        			var useYn 	= nvl(this.ds_rtcs0202.getColumn(i,"useYn"));
        			if( agencyCd == "" ){ 	alert( "창고코드" + msg); 		this.ds_rtcs0202.set_rowposition(i); this.ed_agencyCd.setFocus(true); 	returnFlag = false; break;}
        			if( warehCd == "" ){ 	alert( "대리점코드" + msg); 	this.ds_rtcs0202.set_rowposition(i); this.ed_warehCd.setFocus(true); 	returnFlag = false; break;}
        			if( begday == "" ){ 	alert( "시작일자" + msg); 		this.ds_rtcs0202.set_rowposition(i); this.cal_begday.setFocus(true);	returnFlag = false; break;}
        			if( endday == "" ){ 	alert( "종료일자" + msg); 		this.ds_rtcs0202.set_rowposition(i); this.cal_endday.setFocus(true); 	returnFlag = false; break;}
        			if( useYn == "" ){ 		alert( "사용여부" + msg); 		this.ds_rtcs0202.set_rowposition(i); this.cb_useYn.setFocus(true); 		returnFlag = false; break;}
        		}
        	}
        	return returnFlag;
        }
        this.FN_saveCheckChange = function(){
        	var returnFlag = true;
        	var cnt = this.ds_rtcs0202.getRowCount();
        	for( var  i = 0 ; i < cnt ; i++ ){
        		if( (this.ds_rtcs0202.getRowType(i) == 2) || (this.ds_rtcs0202.getRowType(i) == 4) ){
        			returnFlag = true;
        			break;
        		}else{
        			returnFlag = false;
        		}
        	}
        	return returnFlag;
        }
        this.FN_saveCheckChangeCount = function(){
        	var returnFlag = true;
        	var changeCount = 0;
        	var cnt = this.ds_rtcs0202.getRowCount();
        	for( var i = 0 ; i < cnt ; i++ ){
        		if( (this.ds_rtcs0202.getRowType(i) == 2) || (this.ds_rtcs0202.getRowType(i) == 4) ){
        			changeCount++;
        		}
        	}
        	if( changeCount == 1 ){
        		returnFlag = true;
        	}else{
        		returnFlag = false;
        	}
        	return returnFlag;
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_excel = function(){
        	Ex.core.exportExcel(this, this.grid_rtcs0202);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_search = function(){
        	var agencyCd = nvl(this.div_search.ed_agencyCd.value);
        	var warehCd  = nvl(this.div_search.ed_warehCd.value);
        	var loginId  = application.gds_userInfo.getColumn(0, "userId"); //사용자ID
        	
        	var sSvcID        	= "selectRTCSWarehAgencyRegister";                    
        	var sController   	= "rtms/cs/selectRTCSWarehAgencyRegister.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_rtcs0202=mapRtcs0202";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	sArgs += Ex.util.setParam("agencyCd", agencyCd);
        	sArgs += Ex.util.setParam("warehCd", warehCd);
        	sArgs += Ex.util.setParam("loginId", loginId);
        	this.ds_rtcs0202.clearData();
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_bt_agency_onclick = function(obj,e){
        	var args = {p_arg : "RTCSWarehAgencyRegister_select"};
        	Ex.core.popup(this,"대리점 조회","comm::RTCOMMAgency_pop.xfdl",args,"modaless=false");
        }
        this.returnAgencyCdSelect = function(res) {
        	this.div_search.ed_agencyCd.set_value( res[0] );
        	this.div_search.ed_agencyNm.set_value( res[1] );
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_bt_wareh_onclick = function(obj,e){
        	var args ={p_arg : "RTCSWarehAgencyRegister_select"};
        	Ex.core.popup(this,"창고 조회","comm::RTCOMMWarehouse_pop.xfdl",args, "modaless=false");
        }
        this.returnWarehCdSelect = function(res ){
        	this.div_search.ed_warehCd.set_value( res[0] );
        	this.div_search.ed_warehNm.set_value( res[1] );
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.grid_rtcs0202_onselectchanged = function(obj,e){
        	if( this.ds_rtcs0202.getRowType( this.ds_rtcs0202.rowposition ) == 2 ){
        		this.bt_agency.set_enable(true);
        		this.bt_wareh.set_enable(true);
        		this.cal_begday.set_enable(true);
        		this.cb_useYn.set_enable(false);
        	}else{
        		this.bt_agency.set_enable(false);
        		this.bt_wareh.set_enable(false);
        		this.cal_begday.set_enable(false);
        		this.cb_useYn.set_enable(true);
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.btn_delete_onclick = function(obj,e){
        	var delRow = -1;
        	var cnt = this.ds_rtcs0202.getRowCount();
        	for( var i = 0 ; i < cnt ; i++ ){
        		if( this.ds_rtcs0202.getRowType(i) == 2 ){
        			delRow = i;
        		}else{
        			delRow = -1
        		}
        	}
        	
        	if( delRow != -1 ){
        		this.ds_rtcs0202.deleteRow(delRow);
        	}else{
        		alert("삭제할 행이 없습니다.");
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.btn_insert_onclick = function(obj,e){
        	if( this.FN_addRow() ){
        		this.FN_addValue();
        	}
        }
        this.FN_addRow = function(){
        	var addRowFlag = false;
        	var cnt = this.ds_rtcs0202.getRowCount();
        	if( cnt == 0 ){
        		addRowFlag = true;
        	}else{		
        		for( var  i = 0 ; i < cnt ; i++ ){
        			if( this.ds_rtcs0202.getRowType(i) == 2 || this.ds_rtcs0202.getRowType(i) == 4){
        				alert("추가,수정된 행이 있으므로 추가하실 수 없습니다.\n저장 후 다시 작업하세요.");
        				this.ds_rtcs0202.set_rowposition(i);
        				addRowFlag = false;
        				break;
        			}else{
        				addRowFlag = true;
        			}
        		}
        	}
        	return addRowFlag;
        }
        this.FN_addValue = function(){
        	var nRow = this.ds_rtcs0202.addRow();
        	this.cal_begday.set_value(this.toDay);
        	this.cal_endday.set_value("99991231");
        	this.cb_useYn.set_value("Y");
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.bt_agency_onclick = function(obj,e){
        	var args = {p_arg : "RTCSWarehAgencyRegister_insert"};
        	Ex.core.popup(this,"대리점 조회","comm::RTCOMMAgency_pop.xfdl",args,"modaless=false");
        }
        this.returnAgencyCdInsert = function(res) {
        	this.ed_agencyCd.set_value( res[0] );
        	this.ed_agencyNm.set_value( res[1] );
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.bt_wareh_onclick = function(obj,e){
        	var args ={p_arg : "RTCSWarehAgencyRegister_insert"};
        	Ex.core.popup(this,"창고 조회","comm::RTCOMMWarehouse_pop.xfdl",args, "modaless=false");
        }
        this.returnWarehCdIsnert = function(res ){
        	this.ed_warehCd.set_value( res[0] );
        	this.ed_warehNm.set_value( res[1] );
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.cal_begday_onchanged = function(obj,e){
        	var thisValue =  obj.value;
        	var firstDate =  Eco.date.getFirstDate(this.toDay);
        	var lastDay   =  this.toDay.substr(0,4)+this.toDay.substr(4,2)+Eco.date.getLastDayOfMonth(this.toDay);
        	
        	if( !(( firstDate <= thisValue ) && (thisValue <= lastDay)) ){
        		alert("시작일자는 "+firstDate+" ~ "+lastDay+" 선택가능합니다.");
        		obj.set_value(this.toDay);
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_ed_agencyCd_onchanged = function(obj,e){
        	this.div_search.ed_agencyNm.set_value("");
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_ed_warehCd_onchanged = function(obj,e){
        	this.div_search.ed_warehNm.set_value("");
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTCSWarehAgencyRegister_onload, this);
            this.div_search.ed_agencyCd.addEventHandler("onchanged", this.div_search_ed_agencyCd_onchanged, this);
            this.div_search.bt_agency.addEventHandler("onclick", this.div_search_bt_agency_onclick, this);
            this.div_search.ed_warehCd.addEventHandler("onchanged", this.div_search_ed_warehCd_onchanged, this);
            this.div_search.bt_wareh.addEventHandler("onclick", this.div_search_bt_wareh_onclick, this);
            this.grid_rtcs0202.addEventHandler("onselectchanged", this.grid_rtcs0202_onselectchanged, this);
            this.btn_delete.addEventHandler("onclick", this.btn_delete_onclick, this);
            this.btn_insert.addEventHandler("onclick", this.btn_insert_onclick, this);
            this.cal_begday.addEventHandler("onchanged", this.cal_begday_onchanged, this);
            this.bt_agency.addEventHandler("onclick", this.bt_agency_onclick, this);
            this.bt_wareh.addEventHandler("onclick", this.bt_wareh_onclick, this);

        };

        this.loadIncludeScript("RTCSWarehAgencyRegister.xfdl");

       
    };
}
)();
