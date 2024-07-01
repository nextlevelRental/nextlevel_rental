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
                this.set_name("RTSDArrivalAlarmList");
                this.set_classname("RTSDProvisionalContractRegister");
                this.set_titletext("가계약등록");
                this._setFormPosition(0,0,1147,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_list", this);
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"statNm\" type=\"STRING\" size=\"256\"/><Column id=\"chanNm\" type=\"STRING\" size=\"256\"/><Column id=\"chanMclsCd\" type=\"STRING\" size=\"256\"/><Column id=\"ordAgentNm\" type=\"STRING\" size=\"256\"/><Column id=\"ordDay\" type=\"STRING\" size=\"256\"/><Column id=\"orderNo\" type=\"STRING\" size=\"256\"/><Column id=\"orderDate\" type=\"STRING\" size=\"256\"/><Column id=\"deliveryNo\" type=\"STRING\" size=\"256\"/><Column id=\"deliveryDate\" type=\"STRING\" size=\"256\"/><Column id=\"arrivalDate\" type=\"STRING\" size=\"256\"/><Column id=\"deliveryGbn\" type=\"STRING\" size=\"256\"/><Column id=\"rdcNm\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"o2oYn\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"agencyCd\" type=\"STRING\" size=\"256\"/><Column id=\"agencyNm\" type=\"STRING\" size=\"256\"/><Column id=\"vkburNm\" type=\"STRING\" size=\"256\"/><Column id=\"vkgrpNm\" type=\"STRING\" size=\"256\"/><Column id=\"carNm\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_user", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"tmpPwYn\" type=\"string\" size=\"32\"/><Column id=\"lastPwDt\" type=\"datetime\" size=\"17\"/><Column id=\"agentNm\" type=\"string\" size=\"32\"/><Column id=\"failCnt\" type=\"bigdecimal\" size=\"16\"/><Column id=\"userGrpNm\" type=\"string\" size=\"32\"/><Column id=\"agentId\" type=\"string\" size=\"32\"/><Column id=\"oldPassword\" type=\"string\" size=\"32\"/><Column id=\"chgId\" type=\"string\" size=\"32\"/><Column id=\"password\" type=\"string\" size=\"32\"/><Column id=\"userGrp\" type=\"string\" size=\"32\"/><Column id=\"userNm\" type=\"string\" size=\"32\"/><Column id=\"vkgrpNm\" type=\"string\" size=\"32\"/><Column id=\"lastLogonDt\" type=\"datetime\" size=\"17\"/><Column id=\"userId\" type=\"string\" size=\"32\"/><Column id=\"chgDt\" type=\"datetime\" size=\"17\"/><Column id=\"vkbur\" type=\"string\" size=\"32\"/><Column id=\"regDt\" type=\"datetime\" size=\"17\"/><Column id=\"regId\" type=\"string\" size=\"32\"/><Column id=\"lockYn\" type=\"string\" size=\"32\"/><Column id=\"vkburNm\" type=\"string\" size=\"32\"/><Column id=\"vkgrp\" type=\"string\" size=\"32\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_excelUp", this);
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"statNm\" type=\"STRING\" size=\"256\"/><Column id=\"chanNm\" type=\"STRING\" size=\"256\"/><Column id=\"chanMclsCd\" type=\"STRING\" size=\"256\"/><Column id=\"ordAgentNm\" type=\"STRING\" size=\"256\"/><Column id=\"ordDay\" type=\"STRING\" size=\"256\"/><Column id=\"orderNo\" type=\"STRING\" size=\"256\"/><Column id=\"orderDate\" type=\"STRING\" size=\"256\"/><Column id=\"deliveryNo\" type=\"STRING\" size=\"256\"/><Column id=\"deliveryDate\" type=\"STRING\" size=\"256\"/><Column id=\"arrivalDate\" type=\"STRING\" size=\"256\"/><Column id=\"deliveryGbn\" type=\"STRING\" size=\"256\"/><Column id=\"rdcNm\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"o2oYn\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"agencyCd\" type=\"STRING\" size=\"256\"/><Column id=\"agencyNm\" type=\"STRING\" size=\"256\"/><Column id=\"vkburNm\" type=\"STRING\" size=\"256\"/><Column id=\"vkgrpNm\" type=\"STRING\" size=\"256\"/><Column id=\"carNm\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static04", "absolute", "0", "0", "1122", "10", null, null, this);
            obj.set_taborder("0");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "10", "10", "486", null, null, this);
            obj.set_taborder("19");
            obj.set_text("FIX \r\nh10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1122", "0", "25", "496", null, null, this);
            obj.set_taborder("20");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "10", "75", "120", "21", null, null, this);
            obj.set_taborder("21");
            obj.set_text("문자발송목록");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0", "95", "1122", "10", null, null, this);
            obj.set_taborder("22");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Grid("grid_provsnList", "absolute", "9", "104", "1113", "376", null, null, this);
            obj.set_taborder("18");
            obj.set_autofittype("none");
            obj.set_scrollbars("autoboth");
            obj.set_binddataset("ds_list");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"60\"/><Column size=\"60\"/><Column size=\"100\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"60\"/><Column size=\"60\"/><Column size=\"60\"/><Column size=\"60\"/><Column size=\"60\"/><Column size=\"60\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"60\"/><Column size=\"200\"/><Column size=\"40\"/><Column size=\"60\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"60\"/><Column size=\"60\"/><Column size=\"80\"/><Column size=\"80\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"30\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"계약번호\"/><Cell col=\"1\" text=\"계약상태\"/><Cell col=\"2\" text=\"채널\"/><Cell col=\"3\" text=\"채널중분류\"/><Cell col=\"4\" text=\"판매인명\"/><Cell col=\"5\" text=\"계약일자\"/><Cell col=\"6\" text=\"orderNo\"/><Cell col=\"7\" text=\"order Date\"/><Cell col=\"8\" text=\"delivery No\"/><Cell col=\"9\" text=\"delivery Date\"/><Cell col=\"10\" text=\"도착일\"/><Cell col=\"11\" text=\"배송방법\"/><Cell col=\"12\" text=\"관할\"/><Cell col=\"13\" text=\"장착일자\"/><Cell col=\"14\" text=\"상품코드\"/><Cell col=\"15\" text=\"거점\"/><Cell col=\"16\" text=\"상품명\"/><Cell col=\"17\" text=\"본수\"/><Cell col=\"18\" text=\"고객명\"/><Cell col=\"19\" text=\"휴대폰번호\"/><Cell col=\"20\" text=\"대리점코드\"/><Cell col=\"21\" text=\"대리점\"/><Cell col=\"22\" text=\"지사\"/><Cell col=\"23\" text=\"지점\"/><Cell col=\"24\" text=\"차종\"/><Cell col=\"25\" text=\"차량번호\"/></Band><Band id=\"body\"><Cell text=\"bind:ordNo\"/><Cell col=\"1\" text=\"bind:statNm\"/><Cell col=\"2\" text=\"bind:chanNm\"/><Cell col=\"3\" text=\"bind:chanMclsCd\"/><Cell col=\"4\" text=\"bind:ordAgentNm\"/><Cell col=\"5\" text=\"bind:ordDay\"/><Cell col=\"6\" text=\"bind:orderNo\"/><Cell col=\"7\" text=\"bind:orderDate\"/><Cell col=\"8\" text=\"bind:deliveryNo\"/><Cell col=\"9\" text=\"bind:deliveryDate\"/><Cell col=\"10\" text=\"bind:arrivalDate\"/><Cell col=\"11\" displaytype=\"combo\" text=\"bind:deliveryGbn\" combodataset=\"ds_user\" combocodecol=\"userId\" combodatacol=\"userNm\"/><Cell col=\"12\" text=\"bind:rdcNm\"/><Cell col=\"13\" displaytype=\"normal\" style=\"align:center;\" text=\"bind:procDay\"/><Cell col=\"14\" text=\"bind:matCd\"/><Cell col=\"15\" text=\"bind:o2oYn\"/><Cell col=\"16\" text=\"bind:matNm\"/><Cell col=\"17\" text=\"bind:cntCd\"/><Cell col=\"18\" text=\"bind:custNm\"/><Cell col=\"19\" text=\"bind:mobNo\"/><Cell col=\"20\" text=\"bind:agencyCd\"/><Cell col=\"21\" text=\"bind:agencyNm\"/><Cell col=\"22\" text=\"bind:vkburNm\"/><Cell col=\"23\" text=\"bind:vkgrpNm\"/><Cell col=\"24\" text=\"bind:carNm\"/><Cell col=\"25\" text=\"bind:carNo\"/></Band><Band id=\"summary\"><Cell/><Cell col=\"1\"/><Cell col=\"2\"/><Cell col=\"3\"/><Cell col=\"4\"/><Cell col=\"5\"/><Cell col=\"6\"/><Cell col=\"7\"/><Cell col=\"8\"/><Cell col=\"9\"/><Cell col=\"10\"/><Cell col=\"11\"/><Cell col=\"12\"/><Cell col=\"13\" text=\"총계\"/><Cell col=\"14\"/><Cell col=\"15\"/><Cell col=\"16\"/><Cell col=\"17\"/><Cell col=\"18\"/><Cell col=\"19\"/><Cell col=\"20\"/><Cell col=\"21\"/><Cell col=\"22\"/><Cell col=\"23\"/><Cell col=\"24\"/><Cell col=\"25\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "480", null, "15", "0", null, this);
            obj.set_taborder("23");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_border("0 none #808080,1 solid #d2020bff");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "9", "10", "1113", "45", null, null, this);
            obj.set_taborder("44");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_procDay", "absolute", "25", "12", "108", "21", null, null, this.div_search);
            obj.set_taborder("94");
            obj.set_text("업로드 엑셀파일");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static26", "absolute", "0", "0", "1122", "12", null, null, this.div_search);
            obj.set_taborder("95");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static07", "absolute", "0", "33", "1118", "12", null, null, this.div_search);
            obj.set_taborder("96");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static08", "absolute", "0", "0", "25", "41", null, null, this.div_search);
            obj.set_taborder("97");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_fileChoice", "absolute", "156", "12", "100", "21", null, null, this.div_search);
            obj.set_taborder("98");
            obj.set_text("파일선택");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "136", "0", "20", "45", null, null, this.div_search);
            obj.set_taborder("99");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static07", "absolute", "0", "55", "1122", "20", null, null, this);
            obj.set_taborder("45");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1113, 45, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("44");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1147, 496, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTSDProvisionalContractRegister");
            		p.set_titletext("가계약등록");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCSArrivalAlarmList.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCSArrivalAlarmList.xfdl", function() {
        //include "lib::comLib.xjs"; 

        // 전역변수 선언
        this.url = application.services["svcurl"].url+"XImport";	// 엑셀 import용 URL
        this.fUserId  = "";											// 현재 로그인 사용자의 ID
        this.fUserGrp = "";											// 현재 로그인 사용자의 사용자그룹

        /**
         * 폼의 모든 컴포넌트가 생성되고, 모든 오브젝트가 로딩되었을 때 이벤트 처리
         */
        this.RTSDProvisionalContractRegister_onload = function(obj,e) {
        	Ex.core.init(obj);
        	this.parent.setButton("C", this);

        	// 사용자그룹 설정 
        	this.fUserId  = application.gds_userInfo.getColumn(0, "userId" );
        	this.fUserGrp = application.gds_userInfo.getColumn(0, "userGrp");
        }

        /**
         * 저장 버튼의 클릭 이벤트 처리
         */
        this.fn_save = function() {
        	this.rowCnt = this.ds_provsnList.getRowCount();
        	
        	for (var i=0; i < this.rowCnt; i++) {
        		var nRow = i+1;
        				
        	    if(nvl(this.ds_provsnList.getColumn(i, "custNm")) == ""){
        			this.alert(nRow + "행 : 고객명이 누락되었습니다.");
        			return false;
        	    }
        	    
        	    if(nvl(this.ds_provsnList.getColumn(i, "mobNo")) == ""){
        			this.alert(nRow + "행 : 휴대폰 번호가 누락되었습니다.");
        			return false;
        	    }
        	    
        	}
        	
        	if (this.rowCnt > 0) {
        		if (confirm( "저장하시겠습니까?")) {
        			var sSvcID        	= "saveAlarmList";                    
        			var sController   	= "rtms/sd/saveArrivalAlarmList.do";
        			var sInDatasets   	= "ds_list=ds_list:U";
        			var sOutDatasets  	= "";
        			var sArgs 			= "";	
        			var fn_callBack		= "fn_callBack";
        			
        			Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        		}
        	} else {
        		this.alert("저장할 건이 없습니다.");
        		return false;
        	}
        }

        /**
         * CallBack 처리
         */
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg) {
        	if (nErrorCode < 0)
        		return Ex.core.comMsg("alert",strErrorMsg);	
        	
        	switch (strSvcId) {
        		
        		case "saveAlarmList":
        			alert(strErrorMsg);
        			this.reload();		     
        			break;
        			
        		default:
        			break;
        	}
        }

        /**
         * 파일선택 버튼의 클릭 이벤트 처리
         */
        this.div_search_btn_fileChoice_onclick = function(obj,e) {
        		
        	this.ds_excelUp.clear();
        	
        	this.importObj = new nexacro.ExcelImportObject("Import01",this);
        	this.importObj.addEventHandler("onsuccess", this.Import01_onsuccess, this);
        	this.importObj.addEventHandler("onerror", this.Import01_onerror, this);
        	this.importObj.set_importurl(this.url);
        	this.importObj.importData("", "Sheet1!A1:O", "ds_excelUp");
        	this.importObj.parent.addChild("Import01",this.importObj);
        	this.importObj = null;
        }

        /**
         * 엑셀업로드 성공 시 처리
         */
        this.Import01_onsuccess = function(obj,e) {
        	// 업로드 데이터 검증로직 추가예정
        	if (this.fn_chkUpDataset()) {
        		// 엑셀업로드 데이터셋을 가계약목록 데이터셋으로 복사
        		if (this.fn_copyUpDataset()) {
        			this.alert("엑셀업로드 완료!");
        		} else {
        			this.alert("업로드 데이터 복사 실패!");
        		}
        	}
        }

        /**
         * 엑셀업로드 실패 시 처리
         */
        this.Import01_onerror = function(obj,e) {
        	this.alert("엑셀업로드 실패!");
        }

        /**
         * 엑셀업로드 데이터셋 유효성 검사
         */
        this.fn_chkUpDataset = function () {
        	for (var i=0; i < this.ds_excelUp.getRowCount(); i++) {
        		var nRow        = i+1;

        		var vCustNm     = this.ds_excelUp.getColumn(i, 0);	// 고객명
        		var vMobNo      = this.ds_excelUp.getColumn(i, 1);	// 연락처

        		if (nvl(vCustNm) == "") {
        			this.alert(nRow + "번째 행의 고객명이 누락되었습니다.");
        			return false;
        		} else if (nvl(vMobNo) == "") {
        			this.alert(nRow + "번째 행의 연락처가 누락되었습니다.");
        			return false;
        		}
        	}
        	
        	return true;
        }

        /**
         * 엑셀업로드 데이터셋을 가계약목록 데이터셋으로 복사
         */
        this.fn_copyUpDataset = function () {
        	for (var i=0; i < this.ds_excelUp.getRowCount(); i++) {
        		var idxAddRow     = this.ds_list.addRow();	
        		/* 엑셀파일 업로드 시 헤더명이 바뀔 수 있음을 고려하여 copyRow 미사용 */
        		
        		this.ds_list.setColumn(idxAddRow, "ordNo"          , this.ds_excelUp.getColumn(i, 0));
        		this.ds_list.setColumn(idxAddRow, "statNm"         , this.ds_excelUp.getColumn(i, 1));
        		this.ds_list.setColumn(idxAddRow, "chanNm"         , this.ds_excelUp.getColumn(i, 2));
        		this.ds_list.setColumn(idxAddRow, "ordAgentNm"     , this.ds_excelUp.getColumn(i, 3));
        		this.ds_list.setColumn(idxAddRow, "ordDay"         , this.ds_excelUp.getColumn(i, 4));
        		this.ds_list.setColumn(idxAddRow, "orderNo"        , this.ds_excelUp.getColumn(i, 5));
        		this.ds_list.setColumn(idxAddRow, "orderDate"      , this.ds_excelUp.getColumn(i, 6));
        		this.ds_list.setColumn(idxAddRow, "deliveryNo"     , this.ds_excelUp.getColumn(i, 7));
        		this.ds_list.setColumn(idxAddRow, "deliveryDate"   , this.ds_excelUp.getColumn(i, 8));
        		this.ds_list.setColumn(idxAddRow, "arrivalDate"    , this.ds_excelUp.getColumn(i, 9));
        		this.ds_list.setColumn(idxAddRow, "deliveryGbn"    , this.ds_excelUp.getColumn(i, 10));
        		this.ds_list.setColumn(idxAddRow, "rdcNm"          , this.ds_excelUp.getColumn(i, 11));
        		this.ds_list.setColumn(idxAddRow, "procDay"        , this.ds_excelUp.getColumn(i, 12));
        		this.ds_list.setColumn(idxAddRow, "matCd"          , this.ds_excelUp.getColumn(i, 13));
        		this.ds_list.setColumn(idxAddRow, "o2oYn"          , this.ds_excelUp.getColumn(i, 14));
        		this.ds_list.setColumn(idxAddRow, "matNm"          , this.ds_excelUp.getColumn(i, 15));
        		this.ds_list.setColumn(idxAddRow, "cntNm"          , this.ds_excelUp.getColumn(i, 16));
        		this.ds_list.setColumn(idxAddRow, "custNm"         , this.ds_excelUp.getColumn(i, 17));
        		this.ds_list.setColumn(idxAddRow, "mobNo"          , this.ds_excelUp.getColumn(i, 18));
        		this.ds_list.setColumn(idxAddRow, "agencyCd"       , this.ds_excelUp.getColumn(i, 19));
        		this.ds_list.setColumn(idxAddRow, "agencyNm"       , this.ds_excelUp.getColumn(i, 20));
        		this.ds_list.setColumn(idxAddRow, "vkburNm"        , this.ds_excelUp.getColumn(i, 21));
        		this.ds_list.setColumn(idxAddRow, "vkgrpNm"        , this.ds_excelUp.getColumn(i, 22));
        		this.ds_list.setColumn(idxAddRow, "carNm"          , this.ds_excelUp.getColumn(i, 23));
        		this.ds_list.setColumn(idxAddRow, "carNo"          , this.ds_excelUp.getColumn(i, 24));		

        	}
        	
        	return true;
        }
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.ds_user.addEventHandler("onrowposchanged", this.checkSaveMode, this);
            this.addEventHandler("onload", this.RTSDProvisionalContractRegister_onload, this);
            this.grid_provsnList.addEventHandler("oncellclick", this.grid_closeList_oncellclick, this);
            this.div_search.btn_fileChoice.addEventHandler("onclick", this.div_search_btn_fileChoice_onclick, this);

        };

        this.loadIncludeScript("RTCSArrivalAlarmList.xfdl");

       
    };
}
)();
