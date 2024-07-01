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
                this.set_name("RTREContact_pop");
                this.set_classname("Authority");
                this.set_scrollbars("none");
                this.set_titletext("채권추심관리내역 등록");
                this._setFormPosition(0,0,800,400);
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

            obj = new Dataset("dsInfo", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"ramgSeq\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"ramgYm\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"cntctDay\" type=\"STRING\" size=\"256\"/><Column id=\"cntctGb\" type=\"STRING\" size=\"256\"/><Column id=\"cntctDesc\" type=\"STRING\" size=\"256\"/><Column id=\"attchFlSeq\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"delYn\" type=\"STRING\" size=\"256\"/><Column id=\"userId\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
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

            obj = new Dataset("ds_R036", this);
            obj.set_firefirstcount("0");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Div("div_grid_bottom", "absolute", "0.75%", null, null, "20", "-10", "51", this);
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
            obj.set_text("등록일자");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "0", "30", "130", "31", null, null, this);
            obj.set_taborder("29");
            obj.set_text("고객번호");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("Edit02", "absolute", "148", "-92", null, "20", "561", null, this);
            obj.set_taborder("30");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "60", null, "31", "0", null, this);
            obj.set_taborder("31");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "0", "60", "130", "31", null, null, this);
            obj.set_taborder("35");
            obj.set_text("계약번호");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static08", "absolute", "0", "90", null, "235", "0", null, this);
            obj.set_taborder("38");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static09", "absolute", "0", "324", null, "31", "0", null, this);
            obj.set_taborder("39");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static10", "absolute", "0", "90", "130", "235", null, null, this);
            obj.set_taborder("42");
            obj.set_text("컨택내역\r\n\r\n(1000자 이내)");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static11", "absolute", "0", "324", "130", "31", null, null, this);
            obj.set_taborder("43");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.set_text("첨부파일");
            this.addChild(obj.name, obj);

            obj = new Static("sta_custNm", "absolute", "264", "35", "200", "21", null, null, this);
            obj.set_taborder("58");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "382", "60", "130", "31", null, null, this);
            obj.set_taborder("60");
            obj.set_text("채권결과구분");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Combo("cbo_contactGbn", "absolute", "515", "65", "140", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("3");
            obj.set_innerdataset("ds_R036");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_index("-1");

            obj = new Button("btn_delete", "absolute", "444", "368", "41", "21", null, null, this);
            obj.set_taborder("9");
            obj.set_text("삭제");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Button("btn_save", "absolute", "394", "368", "41", "21", null, null, this);
            obj.set_taborder("8");
            obj.set_text("등록");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Button("btn_close", "absolute", "344", "368", "41", "21", null, null, this);
            obj.set_taborder("7");
            obj.set_text("닫기");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_custNo", "absolute", "134", "35", "122", "21", null, null, this);
            obj.set_taborder("1");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new TextArea("txt_cntctDesc", "absolute", "134", "95", null, "224", "5", null, this);
            obj.set_taborder("4");
            obj.set_lengthunit("utf8");
            obj.set_maxlength("3000");
            this.addChild(obj.name, obj);

            obj = new Button("btn_fileUpload", "absolute", "641", "329", "65", "21", null, null, this);
            obj.set_taborder("6");
            obj.set_text("파일첨부");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Edit("fileList", "absolute", "134", "329", "491", "21", null, null, this);
            obj.set_taborder("5");
            this.addChild(obj.name, obj);

            obj = new Calendar("cal_regDt", "absolute", "134", "5", "120", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("0");
            obj.set_enable("false");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_value("null");

            obj = new Edit("edt_ordNo", "absolute", "134", "65", "122", "21", null, null, this);
            obj.set_taborder("2");
            obj.set_enable("false");
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
            obj = new Layout("default", "", 800, 400, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("Authority");
            		p.getSetter("inheritanceid").set("");
            		p.set_scrollbars("none");
            		p.set_titletext("채권추심관리내역 등록");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item0","cal_regDt","value","dsInfo","cntctDay");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item8","edt_custNo","value","dsInfo","custNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item1","edt_ordNo","value","dsInfo","ordNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item2","cbo_contactGbn","value","dsInfo","cntctGb");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item13","txt_cntctDesc","value","dsInfo","cntctDesc");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTREContact_pop.xfdl", "lib::comLib.xjs");
        this.registerScript("RTREContact_pop.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분 : 수금관리 > 채권관리 > 채권추심관리 내역  등록
         * 02. 그룹명   : RTREContact_pop.xfdl
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
        	this.prgmCd 	= "";	//프로그램CD	 
        	this.dvsn 		= "I";
        	this.attchFlSeq = "";	
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
        		var auth = Ex.core.o_auth;
        		this.prgmCd = auth.prgmCd; //프로그램코드 	
        		//공통코드조회
        		this.fn_getCommCode();	
        		//버튼활성화처리
        		this.fn_btnAble();
        		this.dvsn = this.parent.p_saveFlag;		
        	}	
        	//-------------------------------------------------------------------------------
        	//초기데이터 세팅
        	//-------------------------------------------------------------------------------	 
        	this.fn_initInfo = function() {
        		var row;
        		var rowCnt = this.parent.p_arg.rowcount;	
        		this.sta_custNm.set_text(nvl(this.parent.p_arg.getColumn(0,"custNm")));
        		this.attchFlSeq = nvl(this.parent.p_arg.getColumn(0,"attchFlSeq"));

        		this.dsInfo.copyData(this.parent.p_arg);
        		if(this.parent.p_saveFlag == "I") {
        			this.cbo_contactGbn.set_index(0);		
        		}
        		if(this.parent.p_saveFlag == "U") {		
        			//첨부파일조회
        			this.getFileInfo();
        		}
        	}
        	/***********************************************************************************
        	* Transaction Function
        	***********************************************************************************/
         	//---------------------------------------------------------------------------------
        	// 공통코드 조회
        	//---------------------------------------------------------------------------------
        	this.fn_getCommCode  = function() {
        		var sSvcID      	= "getCommCode";  
        		var sController   	= "ntrms/re/getBondMngCode.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_R036=outputR036";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 		
        	}	
        		
         	//---------------------------------------------------------------------------------	
        	//등록
         	//---------------------------------------------------------------------------------	
        	this.fn_save = function() {
        		if(nvl(this.cbo_contactGbn.value) == "") {
        			alert('채권결과구분을 선택하세요.');
        			this.cbo_contactGbn.setFocus();
        			return;
        		}
        		if(nvl(this.txt_cntctDesc.value) == "") {
        			alert('컨택내역을 입력하세요.');
        			this.txt_cntctDesc.setFocus();
        			return;
        		}		
        		
        		this.dsFile.setRowType(0, Dataset.ROWTYPE_INSERT);
        		this.dsInfo.setColumn(0, "delYn", "N");
        		var sSvcID        	= "saveContactInfo";                    
        		var sController   	= "/ntrms/re/saveContactInfo.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "dvsn=" + nvl(this.dvsn) + " prgmCd=" + nvl(this.prgmCd) + " attchFlSeq=" + nvl(this.attchFlSeq);
        		sInDatasets   		= "input=dsInfo userFile=dsFile";
        		sOutDatasets  		= "";
        		var fn_callBack		= "fn_callBack";
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
         	//---------------------------------------------------------------------------------	
        	//삭제처리
         	//---------------------------------------------------------------------------------	
        	this.fn_delete = function() {
        	
        		this.dsFile.setRowType(0, Dataset.REASON_DELETE);
        		this.dsInfo.setColumn(0, "delYn", "Y");
        		var sSvcID        	= "saveContactInfo";                    
        		var sController   	= "/ntrms/re/saveContactInfo.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "dvsn=D prgmCd=" + nvl(this.prgmCd) + " attchFlSeq=" + nvl(this.attchFlSeq);
        		sInDatasets   		= "input=dsInfo userFile=dsFile";
        		sOutDatasets  		= "";
        		var fn_callBack		= "fn_callBack";
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}	
         	//---------------------------------------------------------------------------------		
        	//첨부파일정보 조회
         	//---------------------------------------------------------------------------------		
        	this.getFileInfo = function() {
        		var sSvcID        	= "getFileInfo";                    
        		var sController   	= "/ntrms/re/getFileInfo.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";
        		sInDatasets   		= "input=dsInfo";
        		sOutDatasets  		= "dsImg=listFile";
        		var fn_callBack		= "fn_callBack";
        		
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
        			return Ex.core.comMsg("alert",strErrorMsg);		
        		}
        		
        		switch (strSvcId) 
        		{
        			//공통코드 조회					
        			case "getCommCode":
        				var nRow = this.ds_R036.insertRow(0);
        				this.ds_R036.setColumn(nRow,"cd","");
        				this.ds_R036.setColumn(nRow,"cdNm","선택");	
        				this.cbo_contactGbn.set_index(0);
        				//초기데이터세팅
        				this.fn_initInfo();
        				break;	
        			//등록/삭제			
        			case "saveContactInfo":		
        				alert(strErrorMsg);
        				this.closePopUp();
        				break;	
        			//파일조회		
        			case "getFileInfo":						
        				var cnt = this.dsImg.rowcount;
        				var fileNm = "";
        				for(var i = 0; i<cnt; i++) {
        					fileNm += this.dsImg.getColumn(i, "filePnm") + ",";
        				}
        				this.fileList.set_value(fileNm);	

        				break;
        			default:
        				break;
        		}
        	}

        	/***********************************************************************************
        	* Component Event
        	***********************************************************************************/
         	
        	/***********************************************************************************
        	* User Function
        	***********************************************************************************/
            //-------------------------------------------------------------------------------  	
        	//파일업로드 팝업생성
            //-------------------------------------------------------------------------------  	
        	this.fileUpload = function(obj,e) {
        		  var args ={p_arg:""};
        		  Ex.core.popup(this,"","comm::FileUpDownload.xfdl", args, "modaless=false");
        	}	
            //-------------------------------------------------------------------------------  	
        	//이미지정보 데이타셋 반환
            //-------------------------------------------------------------------------------  		
        	this.resultUploadFile = function(val) {

        		this.dsFile.copyData(val[0]);
        		var cnt = this.dsFile.rowcount;
        		var fileNm = "";
        		var fileTmp = "";
        		for(var i = 0; i<cnt; i++) {
        			fileNm += this.dsFile.getColumn(i, "filename") + ", ";
        		}
        		this.fileList.set_value(fileNm);
        	}
            //-------------------------------------------------------------------------------  	
        	//팝업CLOSE
            //-------------------------------------------------------------------------------  	
        	this.closePopUp = function(obj,e){
        		var arr = [""];	
        		this.close(this.opener.fn_getContactList());
        	}
            //-------------------------------------------------------------------------------  	
        	//등록팝업
            //-------------------------------------------------------------------------------  	
        	this.fileList_onsetfocus = function(obj,e)
        	{
        		//등록팝업생성
        		var args ={p_arg:this.dsImg};
        		Ex.core.popup(this,"파일목록","comm::RTCOMMFileList_pop.xfdl", args, "modaless=false");
        	}	
            //-------------------------------------------------------------------------------   
            // 대상년월에 따른 버튼 활성화처리  
            //-------------------------------------------------------------------------------   	
        	this.fn_btnAble = function() {
        		this.btn_save.set_enable(this.parent.p_btnFlag);
        		this.btn_delete.set_enable(this.parent.p_btnFlag);
        	}
        	//------------------------------------------------------------------------------
        	// 닫기
        	//------------------------------------------------------------------------------
        	this.fn_close = function(obj,e)
        	{
        		this.close();
        	}
        	//------------------------------------------------------------------------------
        	// 닫기
        	//------------------------------------------------------------------------------
        	this.RTREContact_pop_onkeyup = function(obj,e)
        	{
        		if(e.keycode == 27){
        			this.close();
        		}	
        	}
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("ontimer", this.form_ontimer, this);
            this.addEventHandler("onload", this.form_onload, this);
            this.addEventHandler("onkeyup", this.RTREContact_pop_onkeyup, this);
            this.btn_delete.addEventHandler("onclick", this.fn_delete, this);
            this.btn_save.addEventHandler("onclick", this.fn_save, this);
            this.btn_close.addEventHandler("onclick", this.fn_close, this);
            this.txt_cntctDesc.addEventHandler("oneditclick", this.txt_cntctDesc_oneditclick, this);
            this.btn_fileUpload.addEventHandler("onclick", this.fileUpload, this);
            this.fileList.addEventHandler("onlbuttonup", this.fileList_onsetfocus, this);

        };

        this.loadIncludeScript("RTREContact_pop.xfdl");

       
    };
}
)();
