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
                this.set_name("RTREAccResult_tab3");
                this.set_classname("re00050_cms");
                this.set_titletext("[STEP3] 계좌신청결과반영");
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

            obj = new Dataset("ds_list", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"rqstDay\" type=\"STRING\" size=\"256\"/><Column id=\"fileNm\" type=\"STRING\" size=\"256\"/><Column id=\"rowSeq\" type=\"STRING\" size=\"256\"/><Column id=\"fileTp\" type=\"STRING\" size=\"256\"/><Column id=\"fileSeq\" type=\"STRING\" size=\"256\"/><Column id=\"rowData\" type=\"STRING\" size=\"256\"/><Column id=\"delYn\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Div("div_search", "absolute", "10", "10", "1102", "82", null, null, this);
            obj.set_taborder("0");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_searchCondition", "absolute", "20", "8", "114", "30", null, null, this.div_search);
            obj.set_taborder("45");
            obj.set_text("계좌신청일");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_accReqDate", "absolute", "131", "12", "120", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("46");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_value("null");
            obj = new Static("Static22", "absolute", "1", "0", "1097", "12", null, null, this.div_search);
            obj.set_taborder("47");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "0", "0", "20", "45", null, null, this.div_search);
            obj.set_taborder("48");
            obj.set_text("FIX \r\nw20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static44", "absolute", "81", "40", "47", "21", null, null, this.div_search);
            obj.set_taborder("49");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_color("red");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static23", "absolute", "1", "33", "1097", "12", null, null, this.div_search);
            obj.set_taborder("50");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new FileDownload("FileDownload", "absolute", "692", "6", "38", "28", null, null, this.div_search);
            obj.set_taborder("51");
            obj.getSetter("retry").set("0");
            obj.set_text("다운");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Radio("rdo_JobGubun", "absolute", "131", "31", "200", "51", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("52");
            obj.set_innerdataset("ds_R010");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_direction("vertical");
            obj.set_index("0");
            obj = new Static("st_searchCondition00", "absolute", "19", "41", "114", "30", null, null, this.div_search);
            obj.set_taborder("53");
            obj.set_text("작업구분");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "0", "66", "1098", "12", null, null, this.div_search);
            obj.set_taborder("54");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "-1", "33", "20", "45", null, null, this.div_search);
            obj.set_taborder("55");
            obj.set_text("FIX \r\nw20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "0", "0", "1122", "10", null, null, this);
            obj.set_taborder("1");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "10", "10", "486", null, null, this);
            obj.set_taborder("2");
            obj.set_text("FIX \r\nh10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1112", "10", "10", "486", null, null, this);
            obj.set_taborder("3");
            obj.set_text("FIX \r\nh10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static45", "absolute", "137", "27", "1", "30", null, null, this);
            obj.set_taborder("4");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_background("red");
            this.addChild(obj.name, obj);

            obj = new Static("Static46", "absolute", "142", "27", "1", "30", null, null, this);
            obj.set_taborder("5");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_background("red");
            this.addChild(obj.name, obj);

            obj = new Static("Static47", "absolute", "127", "53", null, "21", "966", null, this);
            obj.set_taborder("6");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_color("red");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "10", "167", "1112", "20", null, null, this);
            obj.set_taborder("10");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static07", "absolute", "10", "126", "1112", "12", null, null, this);
            obj.set_taborder("11");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static17", "absolute", "10", "136", "1103", "31", null, null, this);
            obj.set_taborder("12");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_procStatus", "absolute", "144", "141", "964", "21", null, null, this);
            obj.set_taborder("13");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static19", "absolute", "10", "136", "130", "31", null, null, this);
            obj.set_taborder("14");
            obj.set_text("작업상태");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "10", "109", null, "20", "1028", null, this);
            obj.set_taborder("15");
            obj.set_text("작업상태");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "93", "1122", "20", null, null, this);
            obj.set_taborder("19");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Div("div_file", "absolute", "10", "180", "1103", "155", null, null, this);
            obj.set_taborder("31");
            obj.set_text("Div00");
            obj.set_enable("true");
            obj.set_visible("false");
            this.addChild(obj.name, obj);
            obj = new Static("Static09", "absolute", "0", "27", "1103", "31", null, null, this.div_file);
            obj.set_taborder("0");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_file.addChild(obj.name, obj);
            obj = new Static("Static11", "absolute", "0", "57", "1103", "31", null, null, this.div_file);
            obj.set_taborder("1");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_file.addChild(obj.name, obj);
            obj = new Static("Static21", "absolute", "0", "2", "101", "20", null, null, this.div_file);
            obj.set_taborder("2");
            obj.set_text("파일생성 위치");
            obj.set_cssclass("sta_WF_subTitle");
            this.div_file.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "0", "17", "1103", "10", null, null, this.div_file);
            obj.set_taborder("3");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.div_file.addChild(obj.name, obj);
            obj = new Edit("edt_fileLocalLoc", "absolute", "134", "32", "964", "21", null, null, this.div_file);
            obj.set_taborder("4");
            obj.set_enable("false");
            this.div_file.addChild(obj.name, obj);
            obj = new Static("Static08", "absolute", "0", "27", "130", "31", null, null, this.div_file);
            obj.set_taborder("5");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_file.addChild(obj.name, obj);
            obj = new Edit("edt_fileSvrLoc", "absolute", "134", "62", "964", "21", null, null, this.div_file);
            obj.set_taborder("6");
            obj.set_enable("false");
            this.div_file.addChild(obj.name, obj);
            obj = new Static("Static10", "absolute", "0", "57", "130", "31", null, null, this.div_file);
            obj.set_taborder("7");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_file.addChild(obj.name, obj);
            obj = new Radio("rdo_locPos", "absolute", "8", "34", "120", "20", null, null, this.div_file);
            this.div_file.addChild(obj.name, obj);
            var rdo_locPos_innerdataset = new Dataset("rdo_locPos_innerdataset", this.div_file.rdo_locPos);
            rdo_locPos_innerdataset._setContents("<ColumnInfo><Column id=\"codecolumn\" size=\"256\"/><Column id=\"datacolumn\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"codecolumn\">1</Col><Col id=\"datacolumn\">CMS Pro</Col></Row></Rows>");
            obj.set_innerdataset(rdo_locPos_innerdataset);
            obj.set_taborder("8");
            obj.set_codecolumn("codecolumn");
            obj.set_datacolumn("datacolumn");
            obj.set_value("1");
            obj.set_index("0");
            obj = new Radio("rdo_svrPos", "absolute", "8", "63", "120", "20", null, null, this.div_file);
            this.div_file.addChild(obj.name, obj);
            var rdo_svrPos_innerdataset = new Dataset("rdo_svrPos_innerdataset", this.div_file.rdo_svrPos);
            rdo_svrPos_innerdataset._setContents("<ColumnInfo><Column id=\"codecolumn\" size=\"256\"/><Column id=\"datacolumn\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"codecolumn\">1</Col><Col id=\"datacolumn\">Server</Col></Row></Rows>");
            obj.set_innerdataset(rdo_svrPos_innerdataset);
            obj.set_taborder("9");
            obj.set_codecolumn("codecolumn");
            obj.set_datacolumn("datacolumn");
            obj.set_value("0");
            obj = new Static("Static14", "absolute", "-1", "107", "635", "20", null, null, this.div_file);
            obj.set_taborder("10");
            obj.set_text("* CMS Pro를 이용하여 파일 전송 후 전송완료 처리를 하시기 바랍니다.");
            obj.set_cssclass("sta_WF_text");
            this.div_file.addChild(obj.name, obj);
            obj = new Static("Static13", "absolute", "-1", "122", "635", "20", null, null, this.div_file);
            obj.set_taborder("11");
            obj.set_text("* 미처리시 이후 작업이 진행되지 않습니다. ");
            obj.set_cssclass("sta_WF_text");
            this.div_file.addChild(obj.name, obj);
            obj = new Static("sta_fileDesc", "absolute", "-1", "92", "635", "20", null, null, this.div_file);
            obj.set_taborder("12");
            obj.set_text("* 파일저장은 반드시 C:\\CMS\\99$$$$$$$$(기관번호)\\EB12 경로에 하시기 바랍니다.");
            obj.set_cssclass("sta_WF_text");
            this.div_file.addChild(obj.name, obj);
            obj = new Button("btn_send", "absolute", "1031", "0", "71", "22", null, null, this.div_file);
            obj.set_taborder("13");
            obj.set_text("전송완료");
            obj.set_enable("false");
            obj.set_cssclass("btn_WF_module");
            this.div_file.addChild(obj.name, obj);
            obj = new Button("btn_down", "absolute", "983", "0", "45", "22", null, null, this.div_file);
            obj.set_taborder("14");
            obj.set_text("다운");
            obj.set_cssclass("btn_WF_module");
            obj.set_enable("true");
            this.div_file.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1102, 82, this.div_search,
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
            obj = new Layout("default", "", 1103, 155, this.div_file,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("31");
            		p.set_text("Div00");
            		p.set_enable("true");
            		p.set_visible("false");

            	}
            );
            this.div_file.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1122, 496, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("re00050_cms");
            		p.set_titletext("[STEP3] 계좌신청결과반영");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTREAccResult_tab3.xfdl", "lib::comLib.xjs");
        this.registerScript("RTREAccResult_tab3.xfdl", function() {
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //include "lib::comLib.xjs";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.toDay 			= ""; 	//현재날짜
        this.toHour 		= "";	//현재시간
        this.bfAfDay 		= "";	//계좌신청일 	
        this.checkDay 		= "";	//영업일-5			 
        this.bSuccFileDn 	= "";	//파일다운로드성공여부
        this.retMsg			= "";
        this.crlfYn			= ""; 	//CRLF여부
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/	
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg){ 
        	if (nErrorCode < 0){
        		if(strSvcId == "confirmProc") {
        			this.edt_procStatus.set_value(strErrorMsg);
        			return;
        		}else if(strSvcId == "accReqResultApplyA") {
        			this.edt_procStatus.set_value(strErrorMsg);
        			return;
        		}else if(strSvcId == "accReqResultApplyB") {
        			this.div_file.btn_send.set_enable(false);		
        			this.div_file.btn_down.set_enable(true);
        			this.edt_procStatus.set_value(strErrorMsg);
        			return;
        		}else if(strSvcId == "makeFileApplyB") {
        			this.div_file.btn_send.set_enable(false);					
        			this.edt_procStatus.set_value(strErrorMsg);
        			return;
        		}else {
        			return Ex.core.comMsg("alert",strErrorMsg);	
        		}
        	}
        	
        	switch (strSvcId){
        		case "getAccReqDate":
        			if(parseInt(nvl(this.toHour,10)) >= 18) {//18시이후에는 계좌신청일 세팅 안함
        				this.div_search.cal_accReqDate.set_value("");					
        			}else{
        				this.div_search.cal_accReqDate.set_value(this.bfAfDay);
        			}
        			break;	
        		case "getCheckDate"			: break;							
        		case "getCommCode"			: this.div_search.rdo_JobGubun.set_index(0); this.fn_fileDivStatus(); break;					
        		case "accReqResultApplyA"	: this.edt_procStatus.set_value(strErrorMsg); break;
        		case "accReqResultApplyB"	: this.div_file.btn_down.set_enable(true); this.edt_procStatus.set_value(strErrorMsg); break;			
        		case "makeFileApplyB"		: this.div_file.btn_send.set_enable(true); this.edt_procStatus.set_value(strErrorMsg); this.fn_createFile(); break;					
        		case "confirmProc"			: this.edt_procStatus.set_value(strErrorMsg); break;
        		default						: break;
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.form_onload = function(obj,e){
        	Ex.core.init(obj); 	
        	this.fn_init();
        	application.set_httptimeout(300); // 2016-06-20 이영근, 타임아웃 시간 5분으로 연장
        } 
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_init = function() {
        	//전일(영업일) 조회
        	this.fn_getAccReqDate(2);	
        	//조회조건 체크에 사용할 영업일-5일조회
        	this.fn_getCheckDate();					
        	//공통코드조회
        	this.fn_getCommCode();						
        	//버튼초기화		
        	this.fn_initBtn();		
        }	
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_getAccReqDate  = function(days){
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
        this.fn_getCommCode  = function() {
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
        	/* 1. N : 신규추가 	* 2. S : 조회 	* 3. C : 데이타생성 	* 4. E : 엑셀데이타생성 	* 5. AG: 집계 	* 6. DN: 다운 */	
        	this.parent.parent.parent.setButton("RA",this);		
        	this.div_file.btn_send.set_enable(false);	
        	this.edt_procStatus.set_value("");
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_resultapply = function() {
        	var rqstDay = nvl(this.div_search.cal_accReqDate.value);
        	
        	if(rqstDay == "") {
        		alert('계좌신청일을 입력하세요');
        		this.div_search.cal_accReqDate.setFocus();
        		return;
        	}	
        	//회사접수		
        	if(nvl(this.div_search.rdo_JobGubun.value) == "A") {
        		this.fn_resultapplyA();
        	}
        	//은행접수
        	if(nvl(this.div_search.rdo_JobGubun.value) == "B") {
        		this.fn_resultapplyB();
        	}	
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_resultapplyA = function() {
        	var sSvcID      	= "accReqResultApplyA";  
        	var sController   	= "ntrms/re/accReqResultApplyA.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("rqstDay", nvl(this.div_search.cal_accReqDate.value));	//요청일자
        		
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 		
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_resultapplyB = function() {
        	var sSvcID      	= "accReqResultApplyB";  
        	var sController   	= "ntrms/re/accReqResultApplyB.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("rqstDay", nvl(this.div_search.cal_accReqDate.value));	//요청일자
        			
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 		
        }	
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_down  = function() {
        	this.fn_makeData();	
        }	
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_createFile = function() {
        	var rqstDay = this.ds_list.getColumn(0,"rqstDay");
        	var fileNm 	= this.ds_list.getColumn(0,"fileNm");
        	var rowSeq 	= this.ds_list.getColumn(0,"rowSeq");
        	var fileTp 	= this.ds_list.getColumn(0,"fileTp");	

        	var gubun 	= "EB12";
        	var delYn	= "N";		
        	var param = "?rqstDay=" + rqstDay;
        		param += "&fileNm=" + fileNm;
        		param += "&rowSeq=" + rowSeq;			
        		param += "&fileTp=" + fileTp;					
        		param += "&gubun="  + gubun;					
        		param += "&crlfYn=" + this.crlfYn;		
        		param += "&delYn="  + delYn;					
        	location.href = application.gv_host+"/createFile.do"+param;
        }	
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_makeData = function() {
        	var sSvcID      	= "makeFileApplyB";  
        	var sController   	= "ntrms/re/makeFileApplyB.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_list=output";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("rqstDay"	, nvl(this.div_search.cal_accReqDate.value));		//계좌신청일자	
        	sArgs += Ex.util.setParam("fileNm"	, "EB12" + "" + nvl(this.div_search.cal_accReqDate.value).substr(4,4));		//파일명	
        			
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 			
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_send = function(obj,e){
        	if(nvl(this.div_search.cal_accReqDate.value) == "") {
        		alert('계좌신청일을 입력하세요');
        		this.div_search.cal_accReqDate.setFocus();
        		return;
        	}
        	this.edt_procStatus.set_value("");
        	var sSvcID      	= "confirmProc";  
        	var sController   	= "ntrms/re/confirmProc.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("fileTp"	, "EB12");		//송수신파일구분
        	sArgs += Ex.util.setParam("rqstDay"	, nvl(this.div_search.cal_accReqDate.value));		//계좌신청일자	
        	sArgs += Ex.util.setParam("fileNm"	, "EB12" + "" + nvl(this.div_search.cal_accReqDate.value).substr(4,4));		//파일명	
        	sArgs += Ex.util.setParam("cnfStep"	, "TRAN");		//송신처리단계
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 		
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
        this.btn_send_onclick = function(obj,e){
        	this.fn_send();
        }	
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/		
        this.rdo_locPos_onitemclick = function(obj,e){
        	this.div_file.rdo_locPos.set_value("1");		
        	this.div_file.rdo_svrPos.set_value("0");	
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/			
        this.rdo_svrPos_onitemclick = function(obj,e){
        	this.div_file.rdo_locPos.set_value("0");		
        	this.div_file.rdo_svrPos.set_value("1");		
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/	
        this.rdo_JobGubun_onitemchanged = function(obj,e){
        	this.fn_fileDivStatus();
        }	
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/		
        this.btn_down_onclick = function(obj,e){
        	this.fn_down();
        }	
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/	
        this.fn_fileDivStatus = function() {
        	this.edt_procStatus.set_value("");			
        	
        	if(this.div_search.rdo_JobGubun.value == "A") {	//회사접수분
        		this.div_file.set_visible(false);
        		this.fn_getAccReqDate(2);		//전일(영업일) 조회 - 회사접수 2일로 셋팅함.
        	}
        	
        	if(this.div_search.rdo_JobGubun.value == "B") {	//은행접수분
        		this.div_file.set_visible(true);
        		var sFileLoc = nvl(this.ds_R016.lookup("cd","EB12","cdDesc"));
        		this.div_file.edt_fileLocalLoc.set_value(sFileLoc);
        		this.div_file.sta_fileDesc.set_text("* 파일저장은 반드시 " + sFileLoc + " 경로에 하시기 바랍니다.");
        		this.fn_getAccReqDate(1);		//전일(영업일) 조회 - 은행접수 1일로 셋팅함.
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/	
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.div_search.cal_accReqDate.addEventHandler("onchanged", this.cal_accReqDate_onchanged, this);
            this.div_search.rdo_JobGubun.addEventHandler("onitemchanged", this.rdo_JobGubun_onitemchanged, this);
            this.div_file.rdo_locPos.addEventHandler("onitemclick", this.rdo_locPos_onitemclick, this);
            this.div_file.rdo_svrPos.addEventHandler("onitemclick", this.rdo_svrPos_onitemclick, this);
            this.div_file.btn_send.addEventHandler("onclick", this.btn_send_onclick, this);
            this.div_file.btn_down.addEventHandler("onclick", this.btn_down_onclick, this);

        };

        this.loadIncludeScript("RTREAccResult_tab3.xfdl");

       
    };
}
)();
