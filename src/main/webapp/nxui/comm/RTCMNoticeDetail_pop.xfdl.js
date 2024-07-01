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
                this.set_enable("true");
                this._setFormPosition(0,0,529,344);
            }
            this.getSetter("inheritanceid").set("");

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("dsNotice", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
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
            obj.style.setStyleValue("color", "disabled", "#2b2b2bff");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "0", "30", "130", "31", null, null, this);
            obj.set_taborder("29");
            obj.set_text("제목");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.style.setStyleValue("color", "disabled", "#2b2b2bff");
            this.addChild(obj.name, obj);

            obj = new Edit("Edit02", "absolute", "148", "-92", null, "20", "561", null, this);
            obj.set_taborder("30");
            this.addChild(obj.name, obj);

            obj = new Static("Static08", "absolute", "0", "60", null, "284", "0", null, this);
            obj.set_taborder("38");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static10", "absolute", "0", "60", "130", "252", null, null, this);
            obj.set_taborder("42");
            obj.set_text("공지사항");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.style.setStyleValue("color", "disabled", "#2b2b2bff");
            this.addChild(obj.name, obj);

            obj = new Static("notice_gb", "absolute", "25.9%", "7", null, "20", "3.02%", null, this);
            obj.set_taborder("57");
            obj.style.set_border("1 none #808080ff");
            obj.style.set_bordertype("normal 0 0");
            obj.style.setStyleValue("color", "disabled", "#2b2b2bff");
            obj.set_wordwrap("char");
            this.addChild(obj.name, obj);

            obj = new Static("notice_title", "absolute", "25.9%", "37", null, "20", "3.02%", null, this);
            obj.set_taborder("58");
            obj.style.setStyleValue("color", "disabled", "#2b2b2bff");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "311", null, "33", "399", null, this);
            obj.set_taborder("61");
            obj.set_text("첨부파일");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.style.setStyleValue("color", "disabled", "#2b2b2bff");
            this.addChild(obj.name, obj);

            obj = new Edit("fileList", "absolute", "24.39%", "311", null, "33", "0%", null, this);
            obj.set_taborder("62");
            obj.style.set_color("#2b2b2bff");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new TextArea("notice_content", "absolute", "25.14%", "64", null, "244", "0.57%", null, this);
            obj.set_taborder("63");
            obj.set_wordwrap("char");
            obj.style.set_border("0 solid #a6a6a9ff,0 solid #d5d5d5ff,0 solid #d5d5d5ff,0 solid #a6a6a9ff");
            obj.set_readonly("true");
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
            obj = new Layout("default", "", 529, 344, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("Authority");
            		p.getSetter("inheritanceid").set("");
            		p.set_scrollbars("none");
            		p.set_titletext("공지사항 등록폼");
            		p.set_enable("true");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCMNoticeDetail_pop.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCMNoticeDetail_pop.xfdl", function() {
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
        	
        /***********************************************************************
         * 그룹 변수 선언부
         ************************************************************************/
        	this.form_onload = function(obj,e) {
        		Ex.core.init(obj);
        		this.setData(this.parent.p_arg);
        	} 

        	this.setData = function(obj) {
        		this.notice_gb.set_text(obj.getColumn(row, "ntcType"));
        		this.notice_title.set_text(obj.getColumn(row, "title"));
        		this.notice_content.set_value(obj.getColumn(row, "contents"));
        		
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

        	/***********************************************************************************
        	* CallBack Event (strSvcId - Sevice ID, nErrorCode - ErrorCode, strErrorMsg - Error Message)
        	***********************************************************************************/

        	/* callBack함수 */
        	this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg)
        	{ 
        		if (nErrorCode < 0) {
        			alert(strErrorMsg);
        		} else {
        		
        			if (strSvcId == "saveNoticeInfo") {
        				alert(strErrorMsg);
        				this.closeNoticePopUp();
        			}else if(strSvcId == "setDetailNoticeInfo") {
        				var cnt = this.dsImg.rowcount;
        				var fileNm = "";
        				for(var i = 0; i<cnt; i++) {
        					fileNm += this.dsImg.getColumn(i, "filePnm") + ",";
        				}
        				this.fileList.set_value(fileNm);
        				this.fileList.set_enable(true);
        			}
        		}
        	}

        this.fileList_oneditclick = function(obj,e)
        {
        	//등록팝업생성
        	var args ={p_arg:this.dsImg};
        	Ex.core.popup(this,"파일목록","comm::RTCOMMFileList_pop.xfdl", args, "modaless=false");
        }

        this.fileList_oneditclick_tablet = function(obj,e)
        {
        	//모바일 경우에는 ONEDITCLICK이벤트 처리 20160419 한승훈 
        	if(nexacro.OS == "Android" || nexacro.OS == "iOS"){
        		//등록팝업생성
        		var args ={p_arg:this.dsImg};
        		Ex.core.popup(this,"파일목록","comm::RTCOMMFileList_pop.xfdl", args, "modaless=false");
        	}
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("ontimer", this.form_ontimer, this);
            this.addEventHandler("onload", this.form_onload, this);
            this.fileList.addEventHandler("onlbuttonup", this.fileList_oneditclick, this);
            this.fileList.addEventHandler("oneditclick", this.fileList_oneditclick_tablet, this);

        };

        this.loadIncludeScript("RTCMNoticeDetail_pop.xfdl");

       
    };
}
)();
