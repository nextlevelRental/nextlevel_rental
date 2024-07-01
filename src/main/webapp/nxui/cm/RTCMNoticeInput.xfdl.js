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
                this.set_name("form");
                this.set_classname("Authority");
                this.set_scrollbars("none");
                this.set_titletext("공지사항 등록폼");
                this._setFormPosition(0,0,800,385);
            }
            this.getSetter("inheritanceid").set("");

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("dsFile", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsNotice", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"ntcSeq\" type=\"STRING\" size=\"256\"/><Column id=\"ntcType\" type=\"STRING\" size=\"256\"/><Column id=\"title\" type=\"STRING\" size=\"256\"/><Column id=\"contents\" type=\"STRING\" size=\"256\"/><Column id=\"startDt\" type=\"STRING\" size=\"256\"/><Column id=\"endDt\" type=\"STRING\" size=\"256\"/><Column id=\"readCnt\" type=\"STRING\" size=\"256\"/><Column id=\"attchFlSeq\" type=\"STRING\" size=\"256\"/><Column id=\"delYn\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"regNm\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsDetail", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"ntcSeq\" type=\"STRING\" size=\"256\"/><Column id=\"ntcType\" type=\"STRING\" size=\"256\"/><Column id=\"title\" type=\"STRING\" size=\"256\"/><Column id=\"contents\" type=\"STRING\" size=\"256\"/><Column id=\"startDt\" type=\"STRING\" size=\"256\"/><Column id=\"endDt\" type=\"STRING\" size=\"256\"/><Column id=\"readCnt\" type=\"STRING\" size=\"256\"/><Column id=\"attchFlSeq\" type=\"STRING\" size=\"256\"/><Column id=\"delYn\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsImg", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Div("div_grid_bottom", "absolute", "0.79%", null, null, "20", "-10", "21", this);
            obj.set_taborder("20");
            obj.set_scrollbars("none");
            this.addChild(obj.name, obj);
            obj = new Static("sta_bg", "absolute", "0%", "0", null, null, "0%", "0", this.div_grid_bottom);
            obj.set_taborder("23");
            obj.set_cssclass("sta_WF_GridDis");
            this.div_grid_bottom.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0", "0", null, "31", "0", null, this);
            obj.set_taborder("24");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "0", "30", null, "31", "0", null, this);
            obj.set_taborder("25");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "0", "0", "130", "31", null, null, this);
            obj.set_taborder("28");
            obj.set_text("공지구분");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "0", "30", "130", "31", null, null, this);
            obj.set_taborder("29");
            obj.set_text("제목");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("Edit02", "absolute", "148", "-92", null, "20", "561", null, this);
            obj.set_taborder("30");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "60", null, "31", "0", null, this);
            obj.set_taborder("31");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "90", null, "31", "0", null, this);
            obj.set_taborder("32");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "0", "60", "130", "31", null, null, this);
            obj.set_taborder("35");
            obj.set_text("공지기간");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static07", "absolute", "0", "90", "130", "31", null, null, this);
            obj.set_taborder("36");
            obj.set_text("작성자");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static08", "absolute", "0", "120", null, "235", "0", null, this);
            obj.set_taborder("38");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static09", "absolute", "0", "354", null, "31", "0", null, this);
            obj.set_taborder("39");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static10", "absolute", "0", "120", "130", "235", null, null, this);
            obj.set_taborder("42");
            obj.set_text("공지사항");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static11", "absolute", "0", "354", "130", "31", null, null, this);
            obj.set_taborder("43");
            obj.set_text("파일첨부");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ntcType", "absolute", "133", "5", "617", "21", null, null, this);
            obj.set_taborder("44");
            this.addChild(obj.name, obj);

            obj = new Edit("title", "absolute", "134", "35", "661", "21", null, null, this);
            obj.set_taborder("45");
            this.addChild(obj.name, obj);

            obj = new Calendar("startDt", "absolute", "134", "65", "120", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("47");

            obj = new Calendar("endDt", "absolute", "270", "65", "120", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("48");

            obj = new Static("Static12", "absolute", "257", "65", "9", "21", null, null, this);
            obj.set_taborder("49");
            obj.set_text("~");
            this.addChild(obj.name, obj);

            obj = new Edit("regId", "absolute", "295", "95", "214", "21", null, null, this);
            obj.set_taborder("50");
            obj.set_maxlength("20");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Edit("regNm", "absolute", "134", "95", "157", "21", null, null, this);
            obj.set_taborder("51");
            obj.set_maxlength("20");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new TextArea("contents", "absolute", "134", "125", null, "224", "5", null, this);
            obj.set_taborder("52");
            this.addChild(obj.name, obj);

            obj = new Button("btn_Excel", "absolute", "641", "359", "65", "21", null, null, this);
            obj.set_taborder("53");
            obj.set_text("파일첨부");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Edit("fileList", "absolute", "134", "359", "491", "21", null, null, this);
            obj.set_taborder("54");
            this.addChild(obj.name, obj);

            obj = new Button("btn_save", "absolute", "709", "359", "41", "21", null, null, this);
            obj.set_taborder("55");
            obj.set_text("저장");
            obj.getSetter("domainId").set("nexa.save");
            obj.getSetter("valid").set("");
            this.addChild(obj.name, obj);

            obj = new Button("btn_save00", "absolute", "753", "359", "41", "21", null, null, this);
            obj.set_taborder("56");
            obj.set_text("삭제");
            obj.getSetter("domainId").set("nexa.save");
            obj.getSetter("valid").set("");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 0, 20, this.div_grid_bottom,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("20");
            		p.set_scrollbars("none");

            	}
            );
            this.div_grid_bottom.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 800, 385, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("Authority");
            		p.getSetter("inheritanceid").set("");
            		p.set_scrollbars("none");
            		p.set_titletext("공지사항 등록폼");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item7","ntcType","value","dsNotice","ntcType");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item8","title","value","dsNotice","title");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item9","startDt","value","dsNotice","startDt");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item10","endDt","value","dsNotice","endDt");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item11","regId","value","dsNotice","regId");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item12","regNm","value","dsNotice","regNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item13","contents","value","dsNotice","contents");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCMNoticeInput.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCMNoticeInput.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분 : 사용자 등록관리
         * 02. 그룹명   :
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
        	
        	this.prgmCd = "";	//프로그램CD
        /***********************************************************************
         * 그룹 변수 선언부
         ************************************************************************/
        	this.dvsn = "I";
        	this.attchFlSeq = "";
        	
        	this.form_onload = function(obj,e) {
        		Ex.core.init(obj);
        		var row;
        		var rowCnt = this.parent.p_arg.rowcount;
        		
        		//상세보기 인경우
        		if(rowCnt >0) {
        			this.dvsn = "U";
        			this.setData(this.parent.p_arg);
        			
        		} else {
        			this.dvsn = "I";
        			var row = this.dsNotice.addRow();
        		}
        		
        		if(this.dvsn == "I") {
        			this.startDt.set_value(FN_today());
        		}
        		
        		
        		var objDate = new Date();
        		objDate.addDate(14);
        		
        		var day14   = "";
        		var sYear 	= objDate.getFullYear() + "";
        		var sMonth 	= objDate.getMonth() + 1;
        		var sDate 	= objDate.getDate();
        		if(sMonth.toString().length == 1){
        			sMonth = "0" + sMonth;
        		}
        		if(sDate.toString().length == 1){
        			sDate = "0" + sDate;
        		}
        		day14 = sYear + sMonth + sDate;
        		
        		if(this.dvsn == "I") {
        			this.endDt.set_value(day14);
        		}
        		
        		this.regNm.set_value(application.gds_userInfo.getColumn(0, "userNm"));
        		this.getProgInfo();
        		
        		var auth = Ex.core.o_auth;
        		if( auth.saveAuthYn == "Y" ){
        			this.btn_Excel.set_enable(true);
        			this.btn_save.set_enable(true);
        			this.btn_save00.set_enable(true);
        		}else{
        			this.btn_Excel.set_enable(false);
        			this.btn_save.set_enable(false);
        			this.btn_save00.set_enable(false);
        		}
        	} 

        	this.setData = function(obj) {
        		var row = this.dsNotice.addRow();
        		this.dsNotice.setColumn(row, "ntcSeq", 		obj.getColumn(0, "ntcSeq"));
        		this.dsNotice.setColumn(row, "ntcType", 	obj.getColumn(0, "ntcType"));
        		this.dsNotice.setColumn(row, "title", 		obj.getColumn(0, "title"));
        		this.dsNotice.setColumn(row, "contents", 	obj.getColumn(0, "contents"));
        		this.dsNotice.setColumn(row, "startDt", 	obj.getColumn(0, "startDt"));
        		this.dsNotice.setColumn(row, "endDt", 		obj.getColumn(0, "endDt"));
        		this.dsNotice.setColumn(row, "readCnt", 	obj.getColumn(0, "readCnt"));
        		this.dsNotice.setColumn(row, "attchFlSeq", 	obj.getColumn(0, "attchFlSeq"));
        		this.dsNotice.setColumn(row, "delYn", 		obj.getColumn(0, "delYn"));
        		this.dsNotice.setColumn(row, "regId", 		obj.getColumn(0, "regId"));
        		this.dsNotice.setColumn(row, "regDt", 		obj.getColumn(0, "regDt"));
        		this.dsNotice.setColumn(row, "chgId", 		obj.getColumn(0, "chgId"));
        		this.dsNotice.setColumn(row, "chgDt", 		obj.getColumn(0, "chgDt"));
        		this.attchFlSeq = obj.getColumn(0, "attchFlSeq");
        		this.setDetailNoticeInfo();
        	}

        	/***********************************************************************************
        	* Transaction Function
        	***********************************************************************************/
        	
        	//첨부파일정보 조회 및 조회수 증가처리
        	this.setDetailNoticeInfo = function() {
        		var sSvcID        	= "setDetailNoticeInfo";                    
        		var sController   	= "/ntrms/cm/setDetailNoticeInfo.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";
        		sInDatasets   		= "input=dsNotice";
        		sOutDatasets  		= "dsImg=listFile";
        		var fn_callBack		= "fn_callBack";
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}

        	this.inputColumnCheck = function() {
        		if(nvl(this.ntcType.value) == "") {
        			alert("공지구분은 필수입력항목입니다.");
        			this.ntcType.setFocus();
        			return false;
        		}
        		
        		if(nvl(this.title.value) == "") {
        			alert("제목은 필수입력항목입니다.");
        			this.title.setFocus();
        			return false;
        		}
        		
        		if(nvl(this.startDt.value) == "") {
        			alert("공지시작일은 필수입력항목입니다.");
        			this.startDt.setFocus();
        			return false;
        		}
        		
        		if(nvl(this.endDt.value) == "") {
        			alert("공지종료일은 필수입력항목입니다.");
        			this.endDt.setFocus();
        			return false;
        		}
        		
        		if(nvl(this.contents.value) == "") {
        			alert("공지내용은 필수입력항목입니다.");
        			this.contents.setFocus();
        			return false;
        		}
        		return true;
        	}	
        	
        	//저장
        	this.fn_save = function() {
        		
        		if(!this.inputColumnCheck()) {
        			return;
        		}
        	
        		this.dsFile.setRowType(0, Dataset.ROWTYPE_INSERT);
        	
        		if(this.dvsn == "U") {
        			if(this.regId.value != application.gds_userInfo.getColumn(0, "userId")) {
        				alert('본인이 작성한 글만 수정가능합니다.');
        				return;
        			}
        		}

        		var sSvcID        	= "saveNoticeInfo";                    
        		var sController   	= "/ntrms/cm/saveNoticeInfo.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "dvsn=" + nvl(this.dvsn) + " prgmCd=" + nvl(this.prgmCd) + " attchFlSeq=" + nvl(this.attchFlSeq);
        		sInDatasets   		= "input=dsNotice userFile=dsFile";
        		sOutDatasets  		= "";
        		var fn_callBack		= "fn_callBack";
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        	
        	//삭제처리
        	this.fn_delete = function() {
        		this.dsFile.setRowType(0, Dataset.REASON_DELETE);
        	
        		if(this.dvsn == "U") {
        			if(this.regId.value != application.gds_userInfo.getColumn(0, "userId")) {
        				alert('본인이 작성한 글만 삭제가능합니다.');
        				return;
        			}
        		}
        		
        		var sSvcID        	= "saveNoticeInfo";                    
        		var sController   	= "/ntrms/cm/saveNoticeInfo.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "dvsn=D prgmCd=" + nvl(this.prgmCd) + " attchFlSeq=" + nvl(this.attchFlSeq);
        		sInDatasets   		= "input=dsNotice userFile=dsFile";
        		sOutDatasets  		= "";
        		var fn_callBack		= "fn_callBack";
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        	
        	/***********************************************************************************
        	* CallBack Event (strSvcId - Sevice ID, nErrorCode - ErrorCode, strErrorMsg - Error Message)
        	***********************************************************************************/

        	/* callBack함수 */
        	this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg)
        	{ 
        		if (nErrorCode < 0) {
        			//return ExtNx.core.comMsg("alert",strErrorMsg);	
        			//ExtNx.core.comMsg("alert",strErrorMsg);
        			alert(strErrorMsg);
        		} else {
        		
        			if (strSvcId == "saveNoticeInfo") {
        				alert(strErrorMsg);
        				this.closeNoticePopUp();
        			} else if(strSvcId == "setDetailNoticeInfo") {
        				var cnt = this.dsImg.rowcount;
        				var fileNm = "";
        				for(var i = 0; i<cnt; i++) {
        					fileNm += this.dsImg.getColumn(i, "filePnm") + ",";
        				}
        				this.fileList.set_value(fileNm);
        			}
        		}
        	}
        	
        	//파일업로드 팝업생성
        	this.fileUpload = function(obj,e) {
        		if(this.dvsn == "U") {
        			if(this.regId.value != application.gds_userInfo.getColumn(0, "userId")) {
        				alert('본인이 작성한 글만 파일업로드 가능합니다.');
        				return;
        			}
        		}

        		  var args ={p_arg:""};
        		  Ex.core.popup(this,"","comm::FileUpDownload.xfdl", args, "modaless=false");
        	}
        	
        	
        	
        	
        	//이미지정보 데이타셋 반환
        	this.resultUploadFile = function(val) {

        		this.dsFile.copyData(val[0]);
        		var cnt = this.dsFile.rowcount;
        		var fileNm = "";
        		var fileTmp = "";
        		for(var i = 0; i<cnt; i++) {
        			fileNm += this.dsFile.getColumn(i, "filename") + ", ";
        			//fileTmp += this.dsFile.getColumn(i, "filename") + "|";
        		}
        		this.fileList.set_value(fileNm);
        		//this.setImgButton(fileTmp);

        	}
        	
        	//공지사항 팝업종료
        	this.closeNoticePopUp = function(obj,e){
        		var arr = [""];	
        		this.close(this.opener.returnUserInfo(arr));
        		//this.gfn_popupClose(arr);
        	}
        	
        	
        this.fileList_onsetfocus = function(obj,e)
        {
        	//등록팝업생성
        	var args ={p_arg:this.dsImg};
        	Ex.core.popup(this,"파일목록","comm::RTCOMMFileList_pop.xfdl", args, "modaless=false");
        }

        this.closePop = function() {

        }
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("ontimer", this.form_ontimer, this);
            this.addEventHandler("onload", this.form_onload, this);
            this.btn_Excel.addEventHandler("onclick", this.fileUpload, this);
            this.fileList.addEventHandler("onlbuttonup", this.fileList_onsetfocus, this);
            this.btn_save.addEventHandler("onclick", this.fn_save, this);
            this.btn_save00.addEventHandler("onclick", this.fn_delete, this);

        };

        this.loadIncludeScript("RTCMNoticeInput.xfdl");

       
    };
}
)();
