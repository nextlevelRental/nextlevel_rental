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
                this.set_name("RTREKCPPayHisCheck_tab1");
                this.set_classname("RTREKCPPayHisCheck_tab1");
                this.set_titletext("[STEP1]엑셀업로드");
                this._setFormPosition(0,0,1147,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_checkSet", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"checkSet\" type=\"STRING\" size=\"256\"/><Column id=\"setNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_dupGb", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_payDivision", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_output", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"fileid\" type=\"STRING\" size=\"256\"/><Column id=\"filename\" type=\"STRING\" size=\"256\"/><Column id=\"filesize\" type=\"STRING\" size=\"256\"/><Column id=\"savepath\" type=\"STRING\" size=\"256\"/><Column id=\"ErrorMsg\" type=\"STRING\" size=\"256\"/><Column id=\"ErrorCode\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_verProcess", this);
            obj._setContents("<ColumnInfo><Column id=\"checkDay\" type=\"STRING\" size=\"256\"/><Column id=\"checkSet\" type=\"STRING\" size=\"256\"/><Column id=\"jobGb\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Div("div_search", "absolute", "0", "0", "1117", "110", null, null, this);
            obj.set_taborder("0");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_searchCondition", "absolute", "20", "12", "100", "21", null, null, this.div_search);
            obj.set_taborder("86");
            obj.set_text("체크일자");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static22", "absolute", "0", "0", "1113", "12", null, null, this.div_search);
            obj.set_taborder("87");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "0", "0", "20", "106", null, null, this.div_search);
            obj.set_taborder("88");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static23", "absolute", "0", "33", "1113", "12", null, null, this.div_search);
            obj.set_taborder("89");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_checkDay", "absolute", "120", "12", "120", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("90");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_enable("false");
            obj = new Radio("ra_dupGb", "absolute", "220", "75", "174", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("91");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_direction("vertical");
            obj.set_innerdataset("@ds_dupGb");
            obj = new Static("Static03", "absolute", "20", "43", "100", "21", null, null, this.div_search);
            obj.set_taborder("92");
            obj.set_text("체크회차");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_checkSet", "absolute", "120", "43", "120", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("93");
            obj.set_codecolumn("checkSet");
            obj.set_datacolumn("setNm");
            obj.set_displayrowcount("5");
            obj.set_innerdataset("@ds_checkSet");
            obj = new Static("Static00", "absolute", "0", "64", "1113", "12", null, null, this.div_search);
            obj.set_taborder("94");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "20", "75", "200", "21", null, null, this.div_search);
            obj.set_taborder("95");
            obj.set_text("[거래번호 중복건 처리 방법]");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "0", "94", "1113", "12", null, null, this.div_search);
            obj.set_taborder("96");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("bt_upload", "absolute", "1049", "12", "58", "22", null, null, this.div_search);
            obj.set_taborder("97");
            obj.set_text("업로드");
            obj.set_cssclass("btn_WF_CRUD");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("bt_verProcess", "absolute", "972", "12", "71", "22", null, null, this.div_search);
            obj.set_taborder("98");
            obj.set_text("검증처리");
            obj.set_cssclass("btn_WF_CRUD");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static09", "absolute", "0", "122", "1117", "187", null, null, this);
            obj.set_taborder("5");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Radio("ra_payDivision", "absolute", "40", "132", "140", "140", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("6");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_innerdataset("@ds_payDivision");
            obj.set_index("-1");

            obj = new FileUpload("accApproveUploadFile", "absolute", "160", "225", "491", "50", null, null, this);
            obj.set_taborder("7");
            obj.getSetter("retry").set("0");
            obj.getSetter("innerdataset").set("ds_File");
            obj.style.set_buttontext("파일선택");
            obj.style.set_cursor("auto");
            obj.set_index("0");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0", "110", "1147", "12", null, null, this);
            obj.set_taborder("10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "1117", "0", "30", "496", null, null, this);
            obj.set_taborder("11");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "0", "122", "40", "187", null, null, this);
            obj.set_taborder("12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "0", "122", "1117", "38", null, null, this);
            obj.set_taborder("14");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "189", "1147", "12", null, null, this);
            obj.set_taborder("15");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "651", "122", "20", "187", null, null, this);
            obj.set_taborder("19");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Button("bt_accApproveAdd", "absolute", "671", "225", "58", "22", null, null, this);
            obj.set_taborder("20");
            obj.set_text("파일추가");
            obj.set_cssclass("btn_WF_module");
            this.addChild(obj.name, obj);

            obj = new Button("bt_accApproveDelete", "absolute", "671", "249", "58", "22", null, null, this);
            obj.set_taborder("21");
            obj.set_text("파일삭제");
            obj.set_cssclass("btn_WF_module");
            this.addChild(obj.name, obj);

            obj = new FileUpload("cardApproveUploadFile", "absolute", "160", "160", "491", "50", null, null, this);
            obj.set_taborder("22");
            obj.getSetter("retry").set("0");
            obj.getSetter("innerdataset").set("ds_File");
            obj.style.set_buttontext("파일선택");
            obj.style.set_cursor("auto");
            obj.set_index("0");
            this.addChild(obj.name, obj);

            obj = new Button("bt_cardApproveAdd", "absolute", "671", "160", "58", "22", null, null, this);
            obj.set_taborder("23");
            obj.set_text("파일추가");
            obj.set_cssclass("btn_WF_module");
            this.addChild(obj.name, obj);

            obj = new Button("bt_cardApproveDelete", "absolute", "671", "184", "58", "22", null, null, this);
            obj.set_taborder("24");
            obj.set_text("파일삭제");
            obj.set_cssclass("btn_WF_module");
            this.addChild(obj.name, obj);

            obj = new Static("Static07", "absolute", "0", "271", "1117", "38", null, null, this);
            obj.set_taborder("25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1117, 110, this.div_search,
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
            obj = new Layout("default", "", 1147, 496, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTREKCPPayHisCheck_tab1");
            		p.set_titletext("[STEP1]엑셀업로드");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTREKCPPayHisCheck_tab1.xfdl", "lib::comLib.xjs");
        this.registerScript("RTREKCPPayHisCheck_tab1.xfdl", function() {
        //include "lib::comLib.xjs";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.p_arg = "RTREKCPPayHisCheck_tab1";
        this.toDay = "";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg){
        	if( strSvcId == "getToday" ){
        		if( this.toDay != "" ){
        			this.div_search.cal_checkDay.set_value(this.toDay);
        			this.fn_initSelectCheckSet();
        		}
        	}
        	
        	if( strSvcId == "initRTREKCPPayHisCheck" ){
        		var dupGbCnt 		= this.ds_dupGb.getRowCount();
        		var payDivisionCnt  = this.ds_payDivision.getRowCount();
        		
        		if( dupGbCnt != 0 ){
        			this.div_search.ra_dupGb.set_value("M");
        		}
        		
        		if( payDivisionCnt != 0 ){
        			var deleteArr = new Array();
        			for( var  i = 0 ; i < payDivisionCnt ; i++ ){
        				var cd = this.ds_payDivision.getColumn( i, "cd" );
        				if( (cd != "P1") && (cd != "P2") ){
        					 deleteArr.push(i);
        				}
        			}
        			this.ds_payDivision.deleteMultiRows(deleteArr);
        			this.ra_payDivision.set_value("P1");
        			this.ra_payDivision_onitemchanged();
        		}
        	}
        	
        	if( strSvcId == "selectCheckSet" ){
        		var nCnt = this.ds_checkSet.getRowCount();
        		if( nCnt == 0 ){
        			var nRow = this.ds_checkSet.addRow();
        			this.ds_checkSet.setColumn(nRow, "checkSet", "1");
        			this.ds_checkSet.setColumn(nRow, "setNm", "1회차");
        			this.div_search.cb_checkSet.set_value("1");
        		}else{
        			nCnt = nCnt+1;
        			var nRow = this.ds_checkSet.insertRow(nCnt);
        			this.ds_checkSet.setColumn(nRow, "checkSet", nCnt);
        			this.ds_checkSet.setColumn(nRow, "setNm", nCnt+"회차");
        			this.div_search.cb_checkSet.set_value(nCnt);
        		}
        	}
        	
        	if( strSvcId == "saveVerProcess" ){
        		alert(strErrorMsg);
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/	
        this.RTREKCPPayHisCheck_tab1_onload = function(obj,e){
        	Ex.core.init(obj); 	
        	this.fn_init();
        }
        this.fn_init = function(){
        	this.cardApproveUploadFile.setEventHandler("onsuccess", this.cardApproveUploadFile_onsuccess, this);
        	this.cardApproveUploadFile.setEventHandler("onerror", this.cardApproveUploadFile_onerror, this);
        	this.accApproveUploadFile.setEventHandler("onsuccess", this.accApproveUploadFile_onsuccess, this);
        	this.accApproveUploadFile.setEventHandler("onerror", this.accApproveUploadFile_onerror, this);
        	this.fn_getToday();
        	this.fn_initCombo();
        	this.parent.parent.parent.setButton("",this);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_getToday = function(){
        	var sSvcID      	= "getToday";  
        	var sController   	= "/rtms/comm/getToday.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 	
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_initCombo = function(){
        	var sSvcID        	= "initRTREKCPPayHisCheck";
        	var sController   	= "rtms/re/initRTREKCPPayHisCheck.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	sOutDatasets += " ds_dupGb=mapDsDupGb ";
        	sOutDatasets += " ds_payDivision=mapDsPayDivision ";
        	var sArgs 			= "";
        	var fn_callBack		= "fn_callBack";
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_initSelectCheckSet = function(){
        	var sSvcID        	= "selectCheckSet";
        	var sController   	= "rtms/re/selectCheckSet.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_checkSet=selectCheckSetMap";
        	var sArgs 			= "";
        	var fn_callBack		= "fn_callBack";
        	sArgs += Ex.util.setParam("checkDay", this.toDay);
        	this.ds_checkSet.clearData();
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.ra_payDivision_onitemchanged = function(obj,e){
        	var recpPay = nvl(this.ra_payDivision.value);
        	if( recpPay == "P1" ){
        		this.accApproveUploadFile.set_enable(false);
        		this.bt_accApproveAdd.set_enable(false);
        		this.bt_accApproveDelete.set_enable(false);
        		
        		this.cardApproveUploadFile.set_enable(true);
        		this.bt_cardApproveAdd.set_enable(true);
        		this.bt_cardApproveDelete.set_enable(true);
        	}else if( recpPay == "P2" ){
        		this.accApproveUploadFile.set_enable(true);
        		this.bt_accApproveAdd.set_enable(true);
        		this.bt_accApproveDelete.set_enable(true);
        		
        		this.cardApproveUploadFile.set_enable(false);
        		this.bt_cardApproveAdd.set_enable(false);
        		this.bt_cardApproveDelete.set_enable(false);
        	}else{
        		alert("ERROR");
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_bt_upload_onclick = function(obj,e){
        	var recpPay = nvl(this.ra_payDivision.value);
        	if( recpPay == "P1" ){
        		this.FN_cardApproveUploadFile();
        	}else if( recpPay == "P2" ){
        		this.FN_accApproveUploadFile();
        	}else{
        		alert("ERROR");
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_bt_verProcess_onclick = function(obj,e){
        	this.ds_verProcess.clearData();
        	var nRow = this.ds_verProcess.addRow();
        	var checkDay = nvl(this.div_search.cal_checkDay.value);
        	var checkSet = nvl(this.div_search.cb_checkSet.value);
        	
        	if( checkDay == "" ){
        		alert("체크일자 값이 없습니다."); return false;
        	}else if( checkSet == "" ){
        		alert("체크회차 값이 없습니다."); return false;
        	}else{
        		this.ds_verProcess.setColumn(nRow, "checkDay", checkDay);
        		this.ds_verProcess.setColumn(nRow, "checkSet", checkSet);
        		this.ds_verProcess.setColumn(nRow, "jobGb", "O");
        		var sSvcID        	= "saveVerProcess";                    
        		var sController   	= "rtms/re/saveVerProcess.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		sInDatasets   		= "input=ds_verProcess:U";
        		sOutDatasets  		= "";
        		var fn_callBack		= "fn_callBack";
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.FN_cardApproveUploadFile = function(obj,e){
        	var checkDay = nvl(this.div_search.cal_checkDay.value);
        	var checkSet = nvl(this.div_search.cb_checkSet.value);
        	var dupGb	 = nvl(this.div_search.ra_dupGb.value);
        	var recpPay	 = nvl(this.ra_payDivision.value);
        	var fileCnt1 = this.cardApproveUploadFile.getItemCount(true);
        	var fileCnt2 = this.cardApproveUploadFile.getItemCount(false);
        	
        	if( checkDay == "" ){
        		alert("체크일자 값이 없습니다."); return false;
        	}else if( checkSet == "" ){
        		alert("체크회차 값이 없습니다."); return false;
        	}else if( dupGb == "" ){
        		alert("거래번호 중복건 처리 방법 값이 없습니다."); return false;
        	}else if( recpPay == "" ){
        		alert("결제구분 값이 없습니다."); return false;
        	}else if( fileCnt1 == 0 ){
        		alert("업로드 파일을 확인하세요."); return false;
        	}else if( fileCnt1 != fileCnt2 ){
        		alert("업로드 파일을 확인하세요."); return false;
        	}else{
        		if( confirm( "카드 파일을 저장하시겠습니까?") ){
        			application.set_httptimeout(120);
        			var sController = "/ntrms/re/cardApproveUploadFile.do?checkDay="+checkDay+"&checkSet="+checkSet+"&dupGb="+dupGb+"&recpPay="+recpPay;
        			this.cardApproveUploadFile.set_uploadurl(sController);
        			var bSucc = this.cardApproveUploadFile.upload(sController);
        			Ex.core.set_wait(true);
        		}
        	}
        }
        this.cardApproveUploadFile_onerror = function(obj,e){
        	application.set_httptimeout(60);
        	Ex.core.set_wait(false);
        	if( e.errormsg == "failed to get"){
        		alert("업로드를 실패하였습니다.");
        	}else{
        		alert(e.errormsg);
        	}
        }

        this.cardApproveUploadFile_onsuccess = function(obj,e){
        	application.set_httptimeout(60);
        	Ex.core.set_wait(false);
        	alert(e.errormsg);
        	this.reload();
        }

        this.bt_cardApproveAdd_onclick = function(obj,e){
        	var fileCnt	 = this.cardApproveUploadFile.getItemCount(false);
        	if( fileCnt == 1){
        		this.cardApproveUploadFile.appendItem();
        	}
        }

        this.bt_cardApproveDelete_onclick = function(obj,e){
        	var fileCnt	 = this.cardApproveUploadFile.getItemCount(false);
        	if( fileCnt == 2){
        		this.cardApproveUploadFile.deleteItem(1); 
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.FN_accApproveUploadFile = function(obj,e){
        	var checkDay = nvl(this.div_search.cal_checkDay.value);
        	var checkSet = nvl(this.div_search.cb_checkSet.value);
        	var dupGb	 = nvl(this.div_search.ra_dupGb.value);
        	var recpPay	 = nvl(this.ra_payDivision.value);
        	var fileCnt1	 = this.accApproveUploadFile.getItemCount(true);
        	var fileCnt2	 = this.accApproveUploadFile.getItemCount(false);
        	
        	if( checkDay == "" ){
        		alert("체크일자 값이 없습니다."); return false;
        	}else if( checkSet == "" ){
        		alert("체크회차 값이 없습니다."); return false;
        	}else if( dupGb == "" ){
        		alert("거래번호 중복건 처리 방법 값이 없습니다."); return false;
        	}else if( recpPay == "" ){
        		alert("결제구분 값이 없습니다."); return false;
        	}else if( fileCnt1 == 0 ){
        		alert("업로드 파일을 확인하세요."); return false;
        	}else if( fileCnt1 != fileCnt2 ){
        		alert("업로드 파일을 확인하세요."); return false;
        	}else{
        		if( confirm( "계좌 파일을 저장하시겠습니까?") ){
        			application.set_httptimeout(120);
        			var sController = "/ntrms/re/accApproveUploadFile.do?checkDay="+checkDay+"&checkSet="+checkSet+"&dupGb="+dupGb+"&recpPay="+recpPay;
        			this.accApproveUploadFile.set_uploadurl(sController);
        			var bSucc = this.accApproveUploadFile.upload(sController);
        			Ex.core.set_wait(true);
        		}
        	}
        }
        this.accApproveUploadFile_onerror = function(obj,e){
        	application.set_httptimeout(60);
        	Ex.core.set_wait(false);
        	if( e.errormsg == "failed to get"){
        		alert("업로드를 실패하였습니다.");
        	}else{
        		alert(e.errormsg);
        	}
        }
        this.accApproveUploadFile_onsuccess = function(obj,e){
        	application.set_httptimeout(60);
        	Ex.core.set_wait(false);
        	alert(e.errormsg);
        	this.reload();
        }
        this.bt_accApproveAdd_onclick = function(obj,e){
        	var fileCnt	 = this.accApproveUploadFile.getItemCount(false);
        	if( fileCnt == 1){
        		this.accApproveUploadFile.appendItem();
        	}
        }
        this.bt_accApproveDelete_onclick = function(obj,e){
        	var fileCnt	 = this.accApproveUploadFile.getItemCount(false);
        	if( fileCnt == 2){
        		this.accApproveUploadFile.deleteItem(1); 
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_clearFileExt = function(val){
        	var retVal = "";
        	var idx = val.lastIndexOf(".");
        	if(idx < 0){
        		retVal = val;
        	}else{
        		retVal = val.substring(0,idx);
        	}
        	return retVal;
        }

        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTREKCPPayHisCheck_tab1_onload, this);
            this.div_search.cal_checkDay.addEventHandler("onchanged", this.cal_cashReceiptDate_onchanged, this);
            this.div_search.bt_upload.addEventHandler("onclick", this.div_search_bt_upload_onclick, this);
            this.div_search.bt_verProcess.addEventHandler("onclick", this.div_search_bt_verProcess_onclick, this);
            this.ra_payDivision.addEventHandler("onitemchanged", this.ra_payDivision_onitemchanged, this);
            this.accApproveUploadFile.addEventHandler("onerror", this.accApproveUploadFile_onerror, this);
            this.accApproveUploadFile.addEventHandler("onsuccess", this.accApproveUploadFile_onsuccess, this);
            this.bt_accApproveAdd.addEventHandler("onclick", this.bt_accApproveAdd_onclick, this);
            this.bt_accApproveDelete.addEventHandler("onclick", this.bt_accApproveDelete_onclick, this);
            this.cardApproveUploadFile.addEventHandler("onerror", this.cardApproveUploadFile_onerror, this);
            this.cardApproveUploadFile.addEventHandler("onsuccess", this.cardApproveUploadFile_onsuccess, this);
            this.bt_cardApproveAdd.addEventHandler("onclick", this.bt_cardApproveAdd_onclick, this);
            this.bt_cardApproveDelete.addEventHandler("onclick", this.bt_cardApproveDelete_onclick, this);

        };

        this.loadIncludeScript("RTREKCPPayHisCheck_tab1.xfdl");

       
    };
}
)();
