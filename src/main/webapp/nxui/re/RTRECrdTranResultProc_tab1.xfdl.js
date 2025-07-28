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
                this.set_name("RTRECrdTranResultProc_tab1");
                this.set_classname("re00050_cms");
                this.set_titletext("[STEP1] 결과파일반영");
                this._setFormPosition(0,0,1122,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
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

            obj = new Dataset("ds_File", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"FILE_PATH\" type=\"STRING\" size=\"256\"/><Column id=\"FILE_NAME\" type=\"STRING\" size=\"256\"/><Column id=\"FILE_SIZE\" type=\"STRING\" size=\"256\"/><Column id=\"FILE_SAVENM\" type=\"STRING\" size=\"256\"/><Column id=\"FILE_TYPE\" type=\"STRING\" size=\"256\"/><Column id=\"NUM\" type=\"STRING\" size=\"256\"/><Column id=\"CHK\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_R016", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/><Column id=\"cdDesc\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_token", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"accessToken\" type=\"STRING\" size=\"256\"/><Column id=\"refreshToken\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static17", "absolute", "10", "203", "1102", "31", null, null, this);
            obj.set_taborder("0");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "10", "10", "1102", "49", null, null, this);
            obj.set_taborder("1");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_searchCondition", "absolute", "20", "8", "114", "30", null, null, this.div_search);
            obj.set_taborder("54");
            obj.set_text("카드이체일");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_accReqDate", "absolute", "131", "12", "120", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("55");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_value("null");
            obj = new Static("Static22", "absolute", "1", "0", null, "12", "430", null, this.div_search);
            obj.set_taborder("56");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "0", "0", "20", "45", null, null, this.div_search);
            obj.set_taborder("57");
            obj.set_text("FIX \r\nw20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static44", "absolute", "81", "44", "47", "21", null, null, this.div_search);
            obj.set_taborder("58");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_color("red");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static23", "absolute", "1", "33", null, "12", "430", null, this.div_search);
            obj.set_taborder("65");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "0", "0", "1122", "10", null, null, this);
            obj.set_taborder("2");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "10", "10", "459", null, null, this);
            obj.set_taborder("3");
            obj.set_text("FIX \r\nh10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "1112", "10", "10", "459", null, null, this);
            obj.set_taborder("4");
            obj.set_text("FIX \r\nh10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static46", "absolute", "142", "27", "1", "30", null, null, this);
            obj.set_taborder("5");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_background("red");
            this.addChild(obj.name, obj);

            obj = new Static("Static47", "absolute", "127", "57", null, "21", "966", null, this);
            obj.set_taborder("6");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_color("red");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "0", "60", "1122", "20", null, null, this);
            obj.set_taborder("7");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_procStatus", "absolute", "144", "208", "963", "21", null, null, this);
            obj.set_taborder("8");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "10", "178", "84", "20", null, null, this);
            obj.set_taborder("9");
            obj.set_text("작업상태");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static19", "absolute", "10", "203", "130", "31", null, null, this);
            obj.set_taborder("10");
            obj.set_text("작업상태");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.addChild(obj.name, obj);

            obj = new Static("Static45", "absolute", "137", "27", "1", "30", null, null, this);
            obj.set_taborder("11");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_background("red");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "10", "193", null, "10", "9", null, this);
            obj.set_taborder("12");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static09", "absolute", "10", "101", "1103", "31", null, null, this);
            obj.set_taborder("14");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static11", "absolute", "10", "131", "1103", "31", null, null, this);
            obj.set_taborder("15");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static08", "absolute", "10", "101", "146", "31", null, null, this);
            obj.set_taborder("17");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_fileSvrLoc", "absolute", "160", "136", "500", "21", null, null, this);
            obj.set_taborder("18");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static10", "absolute", "10", "131", "146", "31", null, null, this);
            obj.set_taborder("19");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Radio("rdo_locPos", "absolute", "18", "108", "135", "20", null, null, this);
            this.addChild(obj.name, obj);
            var rdo_locPos_innerdataset = new Dataset("rdo_locPos_innerdataset", this.rdo_locPos);
            rdo_locPos_innerdataset._setContents("<ColumnInfo><Column id=\"codecolumn\" size=\"256\"/><Column id=\"datacolumn\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"codecolumn\">1</Col><Col id=\"datacolumn\">KCP 관리자 Site</Col></Row></Rows>");
            obj.set_innerdataset(rdo_locPos_innerdataset);
            obj.set_taborder("20");
            obj.set_codecolumn("codecolumn");
            obj.set_datacolumn("datacolumn");
            obj.set_value("1");
            obj.set_index("0");

            obj = new Radio("rdo_svrPos", "absolute", "18", "137", "135", "20", null, null, this);
            this.addChild(obj.name, obj);
            var rdo_svrPos_innerdataset = new Dataset("rdo_svrPos_innerdataset", this.rdo_svrPos);
            rdo_svrPos_innerdataset._setContents("<ColumnInfo><Column id=\"codecolumn\" size=\"256\"/><Column id=\"datacolumn\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"codecolumn\">1</Col><Col id=\"datacolumn\">Server</Col></Row></Rows>");
            obj.set_innerdataset(rdo_svrPos_innerdataset);
            obj.set_taborder("21");
            obj.set_codecolumn("codecolumn");
            obj.set_datacolumn("datacolumn");
            obj.set_value("0");
            obj.set_enableevent("true");

            obj = new Static("Static21", "absolute", "10", "76", "158", "20", null, null, this);
            obj.set_taborder("22");
            obj.set_text("업로드 파일 위치");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static07", "absolute", "10", "91", null, "10", "9", null, this);
            obj.set_taborder("23");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static12", "absolute", "10", "162", "1110", "20", null, null, this);
            obj.set_taborder("24");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new FileUpload("FileUpload00", "absolute", "160", "105", "500", "25", null, null, this);
            obj.set_taborder("26");
            obj.getSetter("retry").set("0");
            obj.style.set_buttontext("파일선택");
            obj.style.set_cursor("auto");
            obj.getSetter("innerdataset").set("@ds_File");
            obj.set_index("0");
            this.addChild(obj.name, obj);

            obj = new Static("sta_fileDesc", "absolute", "665", "107", "455", "20", null, null, this);
            obj.set_taborder("27");
            obj.set_cssclass("sta_WF_text");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_fileNm", "absolute", "161", "106", "427", "21", null, null, this);
            obj.set_taborder("28");
            obj.set_enable("false");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1102, 49, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("1");
            		p.set_text("Div00");
            		p.set_scrollbars("none");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1122, 496, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("re00050_cms");
            		p.set_titletext("[STEP1] 결과파일반영");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTRECrdTranResultProc_tab1.xfdl", "lib::comLib.xjs");
        this.registerScript("RTRECrdTranResultProc_tab1.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분 : 수금관리 > 카드이체관리 > 카드이체 결과처리 > [STEP1] 결과파일반영
         * 02. 그룹명   : RTRECrdTranResultProc_tab1.xfdl
         * 03. 그룹설명 : 
         * 04. 작성일   :
         * 05. 작성자   :
         * 06. 수정이력 :
         ***********************************************************************
         *     수정일     작성자   내용
         ***********************************************************************
         *
         ***********************************************************************
         */

        /***********************************************************************
         * Script Include 
         ************************************************************************/
        //include "lib::comLib.xjs";
        /***********************************************************************
         * FORM 변수 선언 영역
        ************************************************************************/

        	/***********************************************************************
        	 * 그룹 변수 선언부
        	 ************************************************************************/
        	this.toDay 		= ""; 	//현재날짜
        	this.toHour 	= "";	//현재시간
        	this.bfAfDay 	= "";	//카드이체일
        	this.sFilePath	= "";	//업로드파일경로(로컬)
        	this.sFileName	= "";	//업로드파일명(로컬)
            //-------------------------------------------------------------------------------   
        	//폼로드시 공통함수      
        	//-------------------------------------------------------------------------------  	 
        	this.form_onload = function(obj,e)
        	{
        		Ex.core.init(obj); 	
        		this.fn_init();
        	} 
            //-------------------------------------------------------------------------------   
        	//초기화  
        	//------------------------------------------------------------------------------- 	
        	this.fn_init = function() {
        		//전일(영업일) 조회
        		this.fn_getAccReqDate();	
        		//오늘날짜조회
        		this.fn_getToday();	
        		//공통코드조회
        		this.fn_getCommCode();			
        		//버튼초기화
        		this.fn_initBtn();	
        		this.FileUpload00.setEventHandler("onsuccess", this.FileUpload00_onsuccess, this);
        		this.FileUpload00.setEventHandler("onerror", this.FileUpload00_onerror, this);	
        	}	
        		 
        	/***********************************************************************************
        	* Transaction Function
        	***********************************************************************************/
         	//---------------------------------------------------------------------------------
        	// 전일(영업일) 조회
        	//---------------------------------------------------------------------------------
        	this.fn_getAccReqDate  = function() {
        		var sSvcID      	= "getAccReqDate";  
        		var sController   	= "ntrms/re/getAccReqDate.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		sArgs += Ex.util.setParam("serchGb", '-');	
        		sArgs += Ex.util.setParam("days", 1);			
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 		
        	
        	}	
            //-------------------------------------------------------------------------------  	
        	//오늘날짜 조회
            //-------------------------------------------------------------------------------  	
        	this.fn_getToday = function() 
        	{
        		var sSvcID      	= "getToday";  
        		var sController   	= "/rtms/comm/getToday.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";

        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 	
        	}		
         	//---------------------------------------------------------------------------------
        	// 공통코드 조회
        	//---------------------------------------------------------------------------------
        	this.fn_getCommCode  = function() {
        		var sSvcID      	= "getCommCode";  
        		var sController   	= "ntrms/re/getAccResultCommCode.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_R016=outputR016";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 		
        	}		
         	//---------------------------------------------------------------------------------
        	// 업로드
        	//---------------------------------------------------------------------------------
        	this.fn_upload  = function() {
        	
        		var fileTp = "BC02_OUT";
        		var accReqDate = nvl(this.div_search.cal_accReqDate.value);
        		if(accReqDate == "") {
        			alert('카드이체일을 입력하세요.');
        			this.div_search.cal_accReqDate.setFocus();
        			return;
        		}
        		if(nvl(this.FileUpload00.value) == "") {
        			alert('업로드 파일을 선택하세요.');
        			this.this.FileUpload00.setFocus();
        			return;			
        		}

        		var	sChkFileNm = "KCP_BATCH_FILE_BC02_OUT_V5407_"+ accReqDate;

        		this.sFilePath = this.FileUpload00.value;  
        		var dirExpt = this.sFilePath.lastIndexOf("\\")+1;	
        		
        		this.sFileName = this.fn_clearFileExt(this.sFilePath.substr(dirExpt));
        		/*
        		if(sChkFileNm != this.sFileName) {
        			alert('선택하신 파일은 업로드 할수 없습니다.');
        			return;
        		}	
        		*/
        		var sController = "/ntrms/re/crdTranResultFileUpload.do?fileNm="+this.sFileName+"&rqstDay="+accReqDate+"&fileTp="+fileTp;
        		this.FileUpload00.set_uploadurl(sController);
        		var bSucc = this.FileUpload00.upload(sController);
        	}	
        	//-------------------------------------------------------------------------------  	
        	// 저장
            //-------------------------------------------------------------------------------
            this.fn_save  = function() {
        		this.fn_getAccessToken();
            }
            //-------------------------------------------------------------------------------  	
        	// 결과파일다운로드
            //-------------------------------------------------------------------------------
            this.fn_down  = function() {
        		this.fn_downloadKCP();
            }
        	/***********************************************************************************
        	* CallBack Event (strSvcId - Sevice ID, nErrorCode - ErrorCode, strErrorMsg - Error Message)
        	***********************************************************************************/
            //-------------------------------------------------------------------------------  	
        	// callBack함수 
            //-------------------------------------------------------------------------------  	
        	this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg)
        	{ 
        		if (nErrorCode < 0) 
        		{
        			return Ex.core.comMsg("alert",strErrorMsg);	
        		}
        		
        		switch (strSvcId) 
        		{
        			case "getAccReqDate":
        				//17시이후에는 카드이체청구일 세팅 안함
        				if(parseInt(nvl(this.toHour,10)) >= 17) {
        					this.div_search.cal_accReqDate.set_value("");					
        				}
        				else {
        					this.div_search.cal_accReqDate.set_value(this.bfAfDay);
        				}
        				break;		
        			case "getCommCode":
        				var sFileLoc = nvl(this.ds_R016.lookup("cd","BC02_OUT","cdDesc"));
        				this.sta_fileDesc.set_text("* 업로드 하실 파일의 위치는 " + sFileLoc + " 경로입니다.");			
        				break;
        			case "getAccessToken":				
        				var accessToken = this.ds_token.getColumn(0, "accessToken");
        				//로컬저장소에 token저장
        				var bSucc = application.setPrivateProfile("accessToken", accessToken);
        				if(bSucc){
        					alert("token이 정상 발급 되었습니다.");
        				}else{
        					alert("token이 정상 발급 되지않았습니다.");
        				}
        				break;	
        			default:
        				break;
        		}
        	}

        	/***********************************************************************************
        	* Component Event
        	***********************************************************************************/
            //-------------------------------------------------------------------------------  	
        	// 카드이체일 변경이벤트
            //-------------------------------------------------------------------------------  		
        	this.cal_accReqDate_onchanged = function(obj,e)
        	{
        		var accReqDate = nvl(this.div_search.cal_accReqDate.value);

        		if(accReqDate != "") {
        			if(parseInt(this.div_search.cal_accReqDate.value,10) >= this.toDay) 
        			{
        				alert('카드이체일은 당일이전 일자만 가능합니다.');
        				this.div_search.cal_accReqDate.set_value("");			
        				this.div_search.cal_accReqDate.setFocus();
        				return;
        			}	
        		}
        		else {
        			alert('카드이체일을 입력하세요.');
        			this.div_search.cal_accReqDate.setFocus();			
        		}
        	}	
            //-------------------------------------------------------------------------------  	
        	// 파일업로드 변경이벤트
            //-------------------------------------------------------------------------------  		
        	this.FileUpload00_onitemchanged = function(obj,e)
        	{
        		this.sFilePath = this.FileUpload00.value;  
        		var dirExpt = this.sFilePath.lastIndexOf("\\")+1;	
        		this.edt_fileNm.set_value(this.sFilePath.substr(dirExpt));	
        		this.edt_procStatus.set_value("");	
        	}
            //-------------------------------------------------------------------------------  	
        	// 파일업로드 에러이벤트
            //-------------------------------------------------------------------------------  		
        	this.FileUpload00_onerror = function(obj,e)
        	{
        		this.edt_procStatus.set_value(e.errormsg);
        	}	
            //-------------------------------------------------------------------------------  	
        	// 파일업로드 성공이벤트
            //-------------------------------------------------------------------------------  		
        	this.FileUpload00_onsuccess = function(obj,e)
        	{
        		this.edt_procStatus.set_value(e.errormsg);	
        	}	
            //-------------------------------------------------------------------------------  	
        	// 파일생성위치 클릭이벤트
            //-------------------------------------------------------------------------------  		
        	this.rdo_locPos_onitemclick = function(obj,e)
        	{
        		this.rdo_locPos.set_value("1");		
        		this.rdo_svrPos.set_value("0");	
        	}
            //-------------------------------------------------------------------------------  	
        	// 파일생성위치 클릭이벤트
            //-------------------------------------------------------------------------------  		
        	this.rdo_svrPos_onitemclick = function(obj,e)
        	{
        		this.rdo_locPos.set_value("0");		
        		this.rdo_svrPos.set_value("1");		
        	}	
        	/***********************************************************************************
        	* User Function
        	***********************************************************************************/
        	//---------------------------------------------------------------------------------
        	// 버튼생성
        	//---------------------------------------------------------------------------------
        	this.fn_initBtn  = function() {
        		/* 1. N : 신규추가
        		 * 2. S : 조회
        		 * 3. C : 데이타생성
        		 * 4. E : 엑셀데이타생성
        		 * 5. AG: 집계
        		 * 6. DN: 다운
        		 */	
        		this.parent.parent.parent.setButton("UP|DN|C",this);		
        		this.edt_procStatus.set_value("");					
        	}
        	
        	//---------------------------------------------------------------------------------
        	// 파일확장자 제거
        	//---------------------------------------------------------------------------------		
        	this.fn_clearFileExt = function(val) {
        		var retVal = "";
        		var idx = val.lastIndexOf(".");
        		if(idx < 0) {
        			retVal = val;
        		}
        		else {
        			retVal = val.substring(0,idx);
        		}
        		
        		return retVal;
        	}
        	
        	//---------------------------------------------------------------------------------
        	// exports서버 jwt token을 받아온다.
        	//---------------------------------------------------------------------------------
        	this.fn_getAccessToken = function(){
        		
        		var sSvcID      	= "getAccessToken";  
        		var sController   	= "ntrms/re/getAccessToken.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_token=output";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        	
        	//---------------------------------------------------------------------------------
        	// exports서버 파일 업로드/다운로드
        	//---------------------------------------------------------------------------------
        	this.fn_downloadKCP = function(){
        		
        		//로컬 저장소에서 토큰 획득
        		var accessToken = application.getPrivateProfile("accessToken");		
        		
        		var accReqDate = nvl(this.div_search.cal_accReqDate.value);
        		if(accReqDate == "") {
        			alert('카드이체일을 입력하세요.');
        			this.div_search.cal_accReqDate.setFocus();
        			return;
        		}
        		
        		var yyyy = accReqDate.substring(0, 4);
        		var mm = accReqDate.substring(4, 6);
        		var dd = accReqDate.substring(6, 8);
        		
        		trace(yyyy);
        		trace(mm);
        		trace(dd);
        		
        		var curDay = new Date(yyyy, mm, dd);
        		var downDay = curDay.getFullYear() + nvl(curDay.getMonth()).padStart(2, '0') + nvl(curDay.getDate() + 1).padStart(2, '0'); 
        		
        		trace(downDay);

        		
        		if(nvl(accessToken) == ""){
        			alert("token이 정상적으로 발급되지 않았습니다.");
        			return;
        		}
        		
        		//header에 토큰 추가
        		application.setVariable("Authorization", accessToken, "header");
        		
        		var sSvcID      	= "downloadKCP";  
        		var sController   	= "ntrms/re/downloadKCP.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        			
        		sArgs += Ex.util.setParam("kcpFlag"	, "BC02");		//송수신파일구분
        		sArgs += Ex.util.setParam("kcpReqType"	, "DOWN");		//요청일자
        		sArgs += Ex.util.setParam("kcpReqDate"	, downDay);		//요청일자
        		sArgs += Ex.util.setParam("fileNm"	, "KCP_BACH_FILE_BC02_OUT_V5407_" + "" + downDay);		//파일명	
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.div_search.cal_accReqDate.addEventHandler("onchanged", this.cal_accReqDate_onchanged, this);
            this.rdo_locPos.addEventHandler("onitemclick", this.rdo_locPos_onitemclick, this);
            this.rdo_svrPos.addEventHandler("onitemclick", this.rdo_svrPos_onitemclick, this);
            this.FileUpload00.addEventHandler("onitemchanged", this.FileUpload00_onitemchanged, this);
            this.FileUpload00.addEventHandler("onsuccess", this.FileUpload00_onsuccess, this);
            this.FileUpload00.addEventHandler("onerror", this.FileUpload00_onerror, this);

        };

        this.loadIncludeScript("RTRECrdTranResultProc_tab1.xfdl");

       
    };
}
)();
