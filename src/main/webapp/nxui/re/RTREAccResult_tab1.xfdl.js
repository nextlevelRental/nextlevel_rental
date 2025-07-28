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
                this.set_name("RTREAccResult_tab1");
                this.set_classname("re00050_cms");
                this.set_titletext("[STEP1] 결과파일반영");
                this._setFormPosition(0,0,1122,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_R010", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
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


            
            // UI Components Initialize
            obj = new Static("Static17", "absolute", "10", "236", "1102", "31", null, null, this);
            obj.set_taborder("0");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "10", "10", "1102", "82", null, null, this);
            obj.set_taborder("1");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_searchCondition", "absolute", "20", "8", "114", "30", null, null, this.div_search);
            obj.set_taborder("54");
            obj.set_text("계좌신청일");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_accReqDate", "absolute", "131", "12", "120", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("55");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_value("null");
            obj = new Static("Static22", "absolute", "1", "0", "1097", "12", null, null, this.div_search);
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
            obj = new Static("Static44", "absolute", "81", "77", "47", "21", null, null, this.div_search);
            obj.set_taborder("58");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_color("red");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition00", "absolute", "19", "41", "114", "30", null, null, this.div_search);
            obj.set_taborder("59");
            obj.set_text("작업구분");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "-1", "33", "20", "45", null, null, this.div_search);
            obj.set_taborder("61");
            obj.set_text("FIX \r\nw20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "0", "66", "1098", "12", null, null, this.div_search);
            obj.set_taborder("62");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static46", "absolute", "130", "47", "1", "30", null, null, this.div_search);
            obj.set_taborder("63");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_background("red");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static45", "absolute", "125", "47", "1", "30", null, null, this.div_search);
            obj.set_taborder("64");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_background("red");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static23", "absolute", "1", "33", "1097", "12", null, null, this.div_search);
            obj.set_taborder("65");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Radio("rdo_JobGubun", "absolute", "131", "31", "200", "51", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("66");
            obj.set_innerdataset("@ds_R010");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_columncount("0");
            obj.set_rowcount("0");
            obj.set_direction("vertical");
            obj.set_index("0");

            obj = new Static("Static04", "absolute", "0", "0", "1122", "10", null, null, this);
            obj.set_taborder("2");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "10", "10", "486", null, null, this);
            obj.set_taborder("3");
            obj.set_text("FIX \r\nh10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "1112", "10", "10", "486", null, null, this);
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

            obj = new Static("Static47", "absolute", "127", "90", null, "21", "966", null, this);
            obj.set_taborder("6");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_color("red");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "0", "93", "1122", "20", null, null, this);
            obj.set_taborder("7");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_procStatus", "absolute", "144", "241", "963", "21", null, null, this);
            obj.set_taborder("8");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "10", "211", "84", "20", null, null, this);
            obj.set_taborder("9");
            obj.set_text("작업상태");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static19", "absolute", "10", "236", "130", "31", null, null, this);
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

            obj = new Static("Static03", "absolute", "10", "226", null, "10", "9", null, this);
            obj.set_taborder("12");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static09", "absolute", "10", "134", "1103", "31", null, null, this);
            obj.set_taborder("14");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static11", "absolute", "10", "164", "1103", "31", null, null, this);
            obj.set_taborder("15");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static08", "absolute", "10", "134", "130", "31", null, null, this);
            obj.set_taborder("17");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_fileSvrLoc", "absolute", "144", "169", "500", "21", null, null, this);
            obj.set_taborder("18");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static10", "absolute", "10", "164", "130", "31", null, null, this);
            obj.set_taborder("19");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Radio("rdo_locPos", "absolute", "18", "141", "120", "20", null, null, this);
            this.addChild(obj.name, obj);
            var rdo_locPos_innerdataset = new Dataset("rdo_locPos_innerdataset", this.rdo_locPos);
            rdo_locPos_innerdataset._setContents("<ColumnInfo><Column id=\"codecolumn\" size=\"256\"/><Column id=\"datacolumn\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"codecolumn\">1</Col><Col id=\"datacolumn\">CMS Pro</Col></Row></Rows>");
            obj.set_innerdataset(rdo_locPos_innerdataset);
            obj.set_taborder("20");
            obj.set_codecolumn("codecolumn");
            obj.set_datacolumn("datacolumn");
            obj.set_value("1");
            obj.set_index("0");

            obj = new Radio("rdo_svrPos", "absolute", "18", "170", "120", "20", null, null, this);
            this.addChild(obj.name, obj);
            var rdo_svrPos_innerdataset = new Dataset("rdo_svrPos_innerdataset", this.rdo_svrPos);
            rdo_svrPos_innerdataset._setContents("<ColumnInfo><Column id=\"codecolumn\" size=\"256\"/><Column id=\"datacolumn\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"codecolumn\">1</Col><Col id=\"datacolumn\">Server</Col></Row></Rows>");
            obj.set_innerdataset(rdo_svrPos_innerdataset);
            obj.set_taborder("21");
            obj.set_codecolumn("codecolumn");
            obj.set_datacolumn("datacolumn");
            obj.set_value("0");
            obj.set_enableevent("true");

            obj = new Static("Static21", "absolute", "10", "109", "142", "20", null, null, this);
            obj.set_taborder("22");
            obj.set_text("업로드 파일 위치");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static07", "absolute", "10", "124", null, "10", "9", null, this);
            obj.set_taborder("23");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static12", "absolute", "10", "195", "1110", "20", null, null, this);
            obj.set_taborder("24");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new FileUpload("FileUpload00", "absolute", "144", "138", "500", "25", null, null, this);
            obj.set_taborder("26");
            obj.getSetter("retry").set("0");
            obj.style.set_buttontext("파일선택");
            obj.style.set_cursor("auto");
            obj.getSetter("innerdataset").set("@ds_File");
            obj.set_index("0");
            this.addChild(obj.name, obj);

            obj = new Static("sta_fileDesc", "absolute", "649", "140", "455", "20", null, null, this);
            obj.set_taborder("27");
            obj.set_cssclass("sta_WF_text");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_fileNm", "absolute", "145", "139", "427", "21", null, null, this);
            obj.set_taborder("28");
            obj.set_enable("false");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1102, 82, this.div_search,
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
        this.addIncludeScript("RTREAccResult_tab1.xfdl", "lib::comLib.xjs");
        this.registerScript("RTREAccResult_tab1.xfdl", function() {
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //include "lib::comLib.xjs";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.toDay 		= ""; 	//현재날짜
        this.toHour 	= "";	//현재시간
        this.bfAfDay 	= "";	//계좌신청일 
        this.checkDay 	= "";	//영업일-5	
        this.sFilePath	= "";	//업로드파일경로(로컬)
        this.sFileName	= "";	//업로드파일명(로컬)
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg){ 
        	if (nErrorCode < 0)	{
        		return Ex.core.comMsg("alert",strErrorMsg);	
        	}
        	
        	switch (strSvcId){
        		case "getAccReqDate":
        			if(parseInt(nvl(this.toHour,10)) >= 18){ //18시이후에는 계좌신청일 세팅 안함
        				this.div_search.cal_accReqDate.set_value("");					
        			}else {
        				this.div_search.cal_accReqDate.set_value(this.bfAfDay);
        			}
        			break;
        		case "getCheckDate"	: break;					
        		case "getCommCode"	:
        			var sFileLoc = nvl(this.ds_R016.lookup("cd","EB14","cdDesc"));
        			this.sta_fileDesc.set_text("* 업로드 하실 파일의 위치는 " + sFileLoc + " 경로입니다.");			
        			this.div_search.rdo_JobGubun.set_index(0);
        			break;
        		default:
        			break;
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/ 
        this.form_onload = function(obj,e){
        	Ex.core.init(obj); 	
        	this.fn_init();
        } 
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_init = function() {
        	this.fn_getAccReqDate(2);		//전일(영업일) 조회 - 회사접수 2일로 셋팅함.
        	this.fn_getCheckDate();			//조회조건 체크에 사용할 영업일-5일조회
        	this.fn_getCommCode();			//공통코드조회
        	this.fn_initBtn();				//버튼초기화
        	this.FileUpload00.setEventHandler("onsuccess", this.FileUpload00_onsuccess, this);
        	this.FileUpload00.setEventHandler("onerror", this.FileUpload00_onerror, this);	
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_getAccReqDate  = function(days) {
        	if( nvl(days) != "" ){
        		var sSvcID      	= "getAccReqDate";
        		var sController   	= "ntrms/re/getAccReqDate.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		sArgs += Ex.util.setParam("serchGb", '-');	
        		sArgs += Ex.util.setParam("days", days);
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 		
        	}else{
        		alert("접수일자 오류입니다.");
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_getCheckDate  = function() {
        	var sSvcID      	= "getCheckDate";  
        	var sController   	= "ntrms/re/getCheckDate.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	sArgs += Ex.util.setParam("serchGb", '-');	
        	sArgs += Ex.util.setParam("days", 5);
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 		

        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_getCommCode  = function() {//공통코드 조회
        	var sSvcID      	= "getCommCode";  
        	var sController   	= "ntrms/re/getAccResultCommCode.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_R010=outputR010 ds_R016=outputR016";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 		
        }	
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_initBtn  = function() {
        	/* 1. N : 신규추가		* 2. S : 조회		* 3. C : 데이타생성		* 4. E : 엑셀데이타생성		* 5. AG: 집계		* 6. DN: 다운*/	
        	this.parent.parent.parent.setButton("UP",this);		
        	this.edt_procStatus.set_value("");					
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_upload  = function() {
        	var accReqDate = nvl(this.div_search.cal_accReqDate.value);
        	if(accReqDate == "") {
        		alert('계좌신청일을 입력하세요.');
        		this.div_search.cal_accReqDate.setFocus();
        		return;
        	}
        	if(nvl(this.FileUpload00.value) == "") {
        		alert('업로드 파일을 선택하세요.');
        		this.this.FileUpload00.setFocus();
        		return;			
        	}
        	var sChkFileNm = "";

        	if(this.div_search.rdo_JobGubun.value == "A") {		//작업구분이 회사접수분일 경우
        		sChkFileNm = "EB14"+ accReqDate.substr(4,4);
        	}
        	
        	if(this.div_search.rdo_JobGubun.value == "B") {		//작업구분이 은행접수분일 경우
        		sChkFileNm = "EB11"+ accReqDate.substr(4,4);		
        	}		

        	this.sFilePath = this.FileUpload00.value;  
        	var dirExpt = this.sFilePath.lastIndexOf("\\")+1;	
        	
        	this.sFileName = this.fn_clearFileExt(this.sFilePath.substr(dirExpt));

        	if(sChkFileNm != this.sFileName) {
        		alert('선택하신 파일은 업로드 할수 없습니다.');
        		return;
        	}	
        	var acrqFg = nvl(this.div_search.rdo_JobGubun.value);
        	var sController = "/ntrms/re/accResultFileUpload.do?fileNm="+this.sFileName+"&rqstDay="+accReqDate+"&acrqFg="+acrqFg;
        	this.FileUpload00.set_uploadurl(sController);
        	var bSucc = this.FileUpload00.upload(sController);
        }	
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.cal_accReqDate_onchanged = function(obj,e){
        	//(영업일 이전5일 ~ 오늘)
        	if(parseInt(this.div_search.cal_accReqDate.value,10) < parseInt(this.checkDay,10) || parseInt(this.div_search.cal_accReqDate.value,10) > parseInt(this.toDay,10)){
        		alert('처리할수 없는 계좌신청일입니다.');
        		this.div_search.cal_accReqDate.set_value("");			
        		this.div_search.cal_accReqDate.setFocus();
        		return;			
        	}
        }	
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/	
        this.rdo_JobGubun_onitemchanged = function(obj,e){
        	this.fn_jobChange();
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.FileUpload00_onitemchanged = function(obj,e){// 파일업로드 변경이벤트
        	this.sFilePath = this.FileUpload00.value;  
        	var dirExpt = this.sFilePath.lastIndexOf("\\")+1;	
        	this.edt_fileNm.set_value(this.sFilePath.substr(dirExpt));
        	this.edt_procStatus.set_value("");	
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.FileUpload00_onerror = function(obj,e){// 파일업로드 에러이벤트
        	this.edt_procStatus.set_value(e.errormsg);
        }	
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.FileUpload00_onsuccess = function(obj,e){// 파일업로드 성공이벤트
        	this.edt_procStatus.set_value(e.errormsg);	
        }	
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.rdo_locPos_onitemclick = function(obj,e){// 파일생성위치 클릭 이벤트
        	this.rdo_locPos.set_value("1");		
        	this.rdo_svrPos.set_value("0");	
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.rdo_svrPos_onitemclick = function(obj,e){// 파일생성위치 클릭 이벤트
        	this.rdo_locPos.set_value("0");		
        	this.rdo_svrPos.set_value("1");		
        }	
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_jobChange = function(){// 작업구분값 변경시 파일경로
        	this.edt_procStatus.set_value("");		
        	
        	if(this.div_search.rdo_JobGubun.value == "A") {	//회사접수
        		var sFileLoc = nvl(this.ds_R016.lookup("cd","EB14","cdDesc"));
        		this.sta_fileDesc.set_text("* 업로드 하실 파일의 위치는 " + sFileLoc + " 경로입니다.");			
        		//this.edt_fileLocalLoc.set_value("C:\\CMS\\99$$$$$$$(기관번호)\\EB14\\");
        		this.fn_getAccReqDate(2);		//전일(영업일) 조회 - 회사접수 2일로 셋팅함.
        	}
        	
        	if(this.div_search.rdo_JobGubun.value == "B") {	//은행접수
        		//this.edt_fileLocalLoc.set_value("C:\\CMS\\99$$$$$$$(기관번호)\\EB11\\");	
        		var sFileLoc = nvl(this.ds_R016.lookup("cd","EB11","cdDesc"));
        		this.sta_fileDesc.set_text("* 업로드 하실 파일의 위치는 " + sFileLoc + " 경로입니다.");				
        		this.fn_getAccReqDate(1);		//전일(영업일) 조회 - 은행접수 1일로 셋팅함.
        	}	
        }
        //---------------------------------------------------------------------------------
        // 버튼생성
        //---------------------------------------------------------------------------------

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_clearFileExt = function(val){	// 파일확장자 제거
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
            this.addEventHandler("onload", this.form_onload, this);
            this.div_search.cal_accReqDate.addEventHandler("onchanged", this.cal_accReqDate_onchanged, this);
            this.div_search.rdo_JobGubun.addEventHandler("onitemchanged", this.rdo_JobGubun_onitemchanged, this);
            this.rdo_locPos.addEventHandler("onitemclick", this.rdo_locPos_onitemclick, this);
            this.rdo_svrPos.addEventHandler("onitemclick", this.rdo_svrPos_onitemclick, this);
            this.FileUpload00.addEventHandler("onitemchanged", this.FileUpload00_onitemchanged, this);
            this.FileUpload00.addEventHandler("onsuccess", this.FileUpload00_onsuccess, this);
            this.FileUpload00.addEventHandler("onerror", this.FileUpload00_onerror, this);

        };

        this.loadIncludeScript("RTREAccResult_tab1.xfdl");

       
    };
}
)();
