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
                this.set_name("RTREAccReqProc_tab3");
                this.set_classname("re00050_cms");
                this.set_titletext("[STEP3] 파일생성");
                this._setFormPosition(0,0,1122,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_list", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"rqstDay\" type=\"STRING\" size=\"256\"/><Column id=\"fileNm\" type=\"STRING\" size=\"256\"/><Column id=\"rowSeq\" type=\"STRING\" size=\"256\"/><Column id=\"fileTp\" type=\"STRING\" size=\"256\"/><Column id=\"fileSeq\" type=\"STRING\" size=\"256\"/><Column id=\"rowData\" type=\"STRING\" size=\"256\"/><Column id=\"delYn\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_R016", this);
            obj.set_firefirstcount("0");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/><Column id=\"cdDesc\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_list2", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"rqstDay\" type=\"STRING\" size=\"256\"/><Column id=\"fileNm\" type=\"STRING\" size=\"256\"/><Column id=\"rowSeq\" type=\"STRING\" size=\"256\"/><Column id=\"fileTp\" type=\"STRING\" size=\"256\"/><Column id=\"fileSeq\" type=\"STRING\" size=\"256\"/><Column id=\"rowData\" type=\"STRING\" size=\"256\"/><Column id=\"delYn\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_rdo", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"nm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cd\">EB13</Col><Col id=\"nm\">EB13</Col></Row><Row><Col id=\"cd\">EI13</Col><Col id=\"nm\">EI13</Col></Row></Rows>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Div("div_search", "absolute", "10", "10", "1102", "45", null, null, this);
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
            obj = new Static("Static22", "absolute", "1", "0", null, "12", "430", null, this.div_search);
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
            obj = new Static("Static23", "absolute", "1", "33", null, "12", "430", null, this.div_search);
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
            obj = new Radio("rdo_FileGubun", "absolute", "23.77%", "13", null, "20", "64.94%", null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("52");
            obj.set_innerdataset("@ds_rdo");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("nm");
            obj.set_columncount("0");
            obj.set_direction("vertical");

            obj = new Static("Static04", "absolute", "0", "0", "1122", "10", null, null, this);
            obj.set_taborder("1");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "10", "10", "459", null, null, this);
            obj.set_taborder("2");
            obj.set_text("FIX \r\nh10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1112", "10", "10", "459", null, null, this);
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

            obj = new Static("Static21", "absolute", "10", "72", "101", "20", null, null, this);
            obj.set_taborder("7");
            obj.set_text("파일생성 위치");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "10", "87", null, "10", "9", null, this);
            obj.set_taborder("8");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "56", "1122", "20", null, null, this);
            obj.set_taborder("9");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "10", "207", "1112", "20", null, null, this);
            obj.set_taborder("10");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static07", "absolute", "10", "240", "1112", "12", null, null, this);
            obj.set_taborder("11");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static17", "absolute", "10", "250", "1103", "31", null, null, this);
            obj.set_taborder("12");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_procStatus", "absolute", "144", "255", "964", "21", null, null, this);
            obj.set_taborder("13");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static19", "absolute", "10", "250", "130", "31", null, null, this);
            obj.set_taborder("14");
            obj.set_text("작업상태");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "10", "223", null, "20", "1028", null, this);
            obj.set_taborder("15");
            obj.set_text("작업상태");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static09", "absolute", "10", "97", "1103", "31", null, null, this);
            obj.set_taborder("16");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static11", "absolute", "10", "127", "1103", "31", null, null, this);
            obj.set_taborder("17");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_fileLocalLoc", "absolute", "144", "102", "964", "21", null, null, this);
            obj.set_taborder("18");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static08", "absolute", "10", "97", "130", "31", null, null, this);
            obj.set_taborder("19");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_fileSvrLoc", "absolute", "144", "132", "964", "21", null, null, this);
            obj.set_taborder("20");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static10", "absolute", "10", "127", "130", "31", null, null, this);
            obj.set_taborder("21");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Button("btn_send", "absolute", "1041", "70", "71", "22", null, null, this);
            obj.set_taborder("22");
            obj.set_text("전송완료");
            obj.set_enable("false");
            obj.set_cssclass("btn_WF_module");
            this.addChild(obj.name, obj);

            obj = new Radio("rdo_locPos", "absolute", "18", "104", "120", "20", null, null, this);
            this.addChild(obj.name, obj);
            var rdo_locPos_innerdataset = new Dataset("rdo_locPos_innerdataset", this.rdo_locPos);
            rdo_locPos_innerdataset._setContents("<ColumnInfo><Column id=\"codecolumn\" size=\"256\"/><Column id=\"datacolumn\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"codecolumn\">1</Col><Col id=\"datacolumn\">CMS Pro</Col></Row></Rows>");
            obj.set_innerdataset(rdo_locPos_innerdataset);
            obj.set_taborder("23");
            obj.set_codecolumn("codecolumn");
            obj.set_datacolumn("datacolumn");
            obj.set_value("1");
            obj.set_index("0");

            obj = new Static("sta_fileDesc", "absolute", "9", "162", "635", "20", null, null, this);
            obj.set_taborder("24");
            obj.set_text("* 파일저장은 반드시 C:\\CMS\\99$$$$$$$$(기관번호)\\EB13 경로에 하시기 바랍니다.");
            obj.set_cssclass("sta_WF_text");
            this.addChild(obj.name, obj);

            obj = new Static("Static13", "absolute", "9", "192", "635", "20", null, null, this);
            obj.set_taborder("25");
            obj.set_text("* 미처리시 이후 작업이 진행되지 않습니다. ");
            obj.set_cssclass("sta_WF_text");
            this.addChild(obj.name, obj);

            obj = new Radio("rdo_svrPos", "absolute", "18", "133", "120", "20", null, null, this);
            this.addChild(obj.name, obj);
            var rdo_svrPos_innerdataset = new Dataset("rdo_svrPos_innerdataset", this.rdo_svrPos);
            rdo_svrPos_innerdataset._setContents("<ColumnInfo><Column id=\"codecolumn\" size=\"256\"/><Column id=\"datacolumn\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"codecolumn\">1</Col><Col id=\"datacolumn\">Server</Col></Row></Rows>");
            obj.set_innerdataset(rdo_svrPos_innerdataset);
            obj.set_taborder("26");
            obj.set_codecolumn("codecolumn");
            obj.set_datacolumn("datacolumn");
            obj.set_value("0");

            obj = new Static("Static14", "absolute", "9", "177", "635", "20", null, null, this);
            obj.set_taborder("27");
            obj.set_text("* CMS Pro를 이용하여 파일 전송 후 전송완료 처리를 하시기 바랍니다.");
            obj.set_cssclass("sta_WF_text");
            this.addChild(obj.name, obj);

            obj = new Button("btn_FileManualDown", "absolute", "932", "70", "100", "22", null, null, this);
            obj.set_taborder("29");
            obj.set_text("파일수기생성");
            obj.set_cssclass("btn_WF_module");
            obj.set_enable("true");
            obj.set_visible("false");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1102, 45, this.div_search,
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
            obj = new Layout("default", "", 1122, 496, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("re00050_cms");
            		p.set_titletext("[STEP3] 파일생성");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTREAccReqProc_tab3.xfdl", "lib::comLib.xjs");
        this.registerScript("RTREAccReqProc_tab3.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분 : 수금관리 > CMS관리 > 계좌신청처리 > [STEP3] 파일생성
         * 02. 그룹명   : RTREAccReqProc_tab3.xfdl
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
        	this.toDay 			= ""; 	//현재날짜 
        	this.toHour 		= "";	//현재시간
        	this.bfAfDay 		= "";	//계좌신청일 	 
        	this.checkDay 	= "";	//영업일-5		
        	this.bSuccFileDn 	= true;	//파일다운로드성공여부
        	this.crlfYn			= ""; 	//CRLF여부	
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
        		//조회조건 체크에 사용할 영업일-5일조회
        		this.fn_getCheckDate();			
        		//공통코드 조회
        		this.fn_getCommCode();					
        		//버튼초기화		
        		this.fn_initBtn();	
        		//라디오버튼 초기화
        		this.div_search.rdo_FileGubun.set_value("EB13");
        	}
        		 
        	/***********************************************************************************
        	* Transaction Function
        	***********************************************************************************/
            //-------------------------------------------------------------------------------  	
        	//공통코드 조회
            //-------------------------------------------------------------------------------  	
        	this.fn_getCommCode = function() 
        	{
        		var sSvcID      	= "getCommCode";  
        		var sController   	= "ntrms/re/getAccReqProcCommCode.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_R016=outputR016";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 	
        	}		
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
         	//---------------------------------------------------------------------------------
        	// 전일(영업일) 조회 -5일
        	//---------------------------------------------------------------------------------
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
          	//---------------------------------------------------------------------------------
        	// 다운
        	//---------------------------------------------------------------------------------
        	this.fn_down  = function() {
        		this.edt_procStatus.set_value("");	
        		
        		if ("EB13" == this.div_search.rdo_FileGubun.value) {
        			this.fn_makeData();
        		} else {
        			this.fn_makeData2();
        		}
        	}	

          	//---------------------------------------------------------------------------------
        	// 파일생성
        	//---------------------------------------------------------------------------------
        	this.fn_createFile = function() {
        		var rqstDay = this.ds_list.getColumn(0,"rqstDay");
        		var rowSeq 	= this.ds_list.getColumn(0,"rowSeq");
        		var delYn	= "N";
        		
        		var fileNm;
        		var fileTp;
        		var gubun;
        		
        		if ("EB13" == this.div_search.rdo_FileGubun.value) {
        			fileNm 	= this.ds_list.getColumn(0,"fileNm");			
        			fileTp 	= this.ds_list.getColumn(0,"fileTp");		
        			gubun 	= "EB13";
        		} else {			
        			fileNm = this.ds_list2.getColumn(0,"fileNm");
        			fileTp = this.ds_list2.getColumn(0,"fileTp");		
        			gubun 	= "EI13";	
        		}
        		
        		var param = "?rqstDay=" + rqstDay;
        			param += "&fileNm=" + fileNm;
        			param += "&rowSeq=" + rowSeq;			
        			param += "&fileTp=" + fileTp;					
        			param += "&gubun="  + gubun;					
        			param += "&crlfYn=" + this.crlfYn;		
        			param += "&delYn="  + delYn;

        		location.href = application.gv_host+"/createFile.do"+param;
        		
        		/*
        		var rqstDay = nvl(this.div_search.cal_accReqDate.value);
        		var fileNm 	= "EB13" + "" + rqstDay.substr(4,4);
        		var gubun 	= "EB13";
        		location.href = application.gv_host+"/createFile.do?rqstDay=" + rqstDay+ "&fileNm="+fileNm+"&gubun="+gubun;
        		*/
        	}	

          	//---------------------------------------------------------------------------------
        	// EB13 송신데이터 생성
        	//---------------------------------------------------------------------------------	
        	this.fn_makeData = function() {
        		var rqstDay = nvl(this.div_search.cal_accReqDate.value);
        		if(rqstDay == "") {
        			alert('계좌신청일을 입력하세요');
        			this.div_search.cal_accReqDate.setFocus();
        			return;
        		}		
        		var sSvcID      	= "accReqMakeData";  
        		var sController   	= "ntrms/re/accReqMakeData.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_list=output";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		sArgs += Ex.util.setParam("rqstDay"	, nvl(this.div_search.cal_accReqDate.value));		//계좌신청일자	
        		sArgs += Ex.util.setParam("fileNm"	, "EB13" + "" + nvl(this.div_search.cal_accReqDate.value).substr(4,4));		//파일명	

        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 			
        	}
        	
        	//---------------------------------------------------------------------------------
        	// EI13 송신데이터 생성
        	//---------------------------------------------------------------------------------	
        	this.fn_makeData2 = function() {
        		var rqstDay = nvl(this.div_search.cal_accReqDate.value);
        		
        		if(rqstDay == "") {
        			alert('계좌신청일을 입력하세요');
        			this.div_search.cal_accReqDate.setFocus();
        			return;
        		}
        		
        		var sSvcID      	= "accReqMakeData2";  
        		var sController   	= "ntrms/re/accReqMakeData.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_list2=output";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		sArgs += Ex.util.setParam("rqstDay"	, nvl(this.div_search.cal_accReqDate.value));		//계좌신청일자	
        		sArgs += Ex.util.setParam("fileNm"	, "EI13" + "" + nvl(this.div_search.cal_accReqDate.value).substr(4,4));		//파일명	
        		alert(sArgs);
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 			
        	}
        	
          	//---------------------------------------------------------------------------------
        	// 전송완료
        	//---------------------------------------------------------------------------------	
        	this.fn_send = function(obj,e)
        	{
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
        		
        		sArgs += Ex.util.setParam("fileTp"	, "EB13");		//송수신파일구분
        		sArgs += Ex.util.setParam("rqstDay"	, nvl(this.div_search.cal_accReqDate.value));		//계좌신청일자	
        		sArgs += Ex.util.setParam("fileNm"	, "EB13" + "" + nvl(this.div_search.cal_accReqDate.value).substr(4,4));		//파일명	
        		sArgs += Ex.util.setParam("cnfStep"	, "TRAN");		//송신처리단계
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 		
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
        			if(strSvcId == "confirmProc") {
        				this.edt_procStatus.set_value(strErrorMsg);
        				return;
        			}
        			else if(strSvcId == "accReqMakeData") {
        				this.btn_send.set_enable(false);					
        				this.edt_procStatus.set_value(strErrorMsg);
        				return;
        			}
        			else {
        				return Ex.core.comMsg("alert",strErrorMsg);		
        			}
        		}
        		
        		switch (strSvcId) 
        		{
        			case "getCommCode":
        					var sFileLoc = nvl(this.ds_R016.lookup("cd","EB13","cdDesc"));
        					this.edt_fileLocalLoc.set_value(sFileLoc);		
        					this.sta_fileDesc.set_text("* 파일저장은 반드시 " + sFileLoc + " 경로에 하시기 바랍니다.");
        				break;			
        			case "getAccReqDate":
        				//10시이후에는 계좌신청일 세팅 안함
        				if(parseInt(nvl(this.toHour,10)) >= 12) {
        					this.div_search.cal_accReqDate.set_value("");					
        				}
        				else {
        					this.div_search.cal_accReqDate.set_value(this.bfAfDay);
        				}
        				break;	
        			case "getCheckDate":
        				break;						
        			case "accReqMakeData":
        				this.btn_send.set_enable(true);	
        				this.edt_procStatus.set_value(strErrorMsg);
        				this.fn_createFile();
        				break;
        			case "accReqMakeData2":
        				this.btn_send.set_enable(true);	
        				this.edt_procStatus.set_value(strErrorMsg);								
        				this.fn_createFile();
        				break;
        			case "confirmProc":		
        				this.edt_procStatus.set_value(strErrorMsg);
        				break;
        			default:
        				break;
        		}
        	}

        	/***********************************************************************************
        	* Component Event
        	***********************************************************************************/
            this.cal_accReqDate_onchanged = function(obj,e)
        	{
        		//(영업일 이전5일 ~ 오늘)
        		if(parseInt(this.div_search.cal_accReqDate.value,10) < parseInt(this.checkDay,10) || parseInt(this.div_search.cal_accReqDate.value,10) > parseInt(this.toDay,10)) 
        		{
        			alert('처리할수 없는 계좌신청일입니다.');
        			this.div_search.cal_accReqDate.set_value("");			
        			this.div_search.cal_accReqDate.setFocus();
        			return;			
        		}	
        	}
        	
        	this.btn_send_onclick = function(obj,e)
        	{
        		this.fn_send();
        	}	
        	
        	this.rdo_locPos_onitemclick = function(obj,e)
        	{
        		this.rdo_locPos.set_value("1");		
        		this.rdo_svrPos.set_value("0");	
        	}
        	
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
        		this.parent.parent.parent.setButton("DN",this);		
        		this.edt_procStatus.set_value("");		
        		this.btn_send.set_enable(false);				
        	}
        	
        this.div_search_FileDownload_onclick = function(obj,e)
        {
        	this.ds_list.addRow();
        	this.ds_list.setColumn(0, "rqstDay", "20190605");
        	this.ds_list.setColumn(0, "rowSeq", 1);
        	this.ds_list.setColumn(0, "fileNm", "EI130605");
        	this.ds_list.setColumn(0, "fileTp", "EI13");
        	
        	this.fn_makeData2();
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.div_search.cal_accReqDate.addEventHandler("onchanged", this.cal_accReqDate_onchanged, this);
            this.div_search.FileDownload.addEventHandler("onclick", this.div_search_FileDownload_onclick, this);
            this.btn_send.addEventHandler("onclick", this.btn_send_onclick, this);
            this.rdo_locPos.addEventHandler("onitemclick", this.rdo_locPos_onitemclick, this);
            this.rdo_svrPos.addEventHandler("onitemclick", this.rdo_svrPos_onitemclick, this);
            this.btn_FileManualDown.addEventHandler("onclick", this.fn_createFileManual, this);

        };

        this.loadIncludeScript("RTREAccReqProc_tab3.xfdl");

       
    };
}
)();
