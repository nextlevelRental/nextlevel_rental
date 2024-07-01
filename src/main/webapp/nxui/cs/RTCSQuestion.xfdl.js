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
                this.set_name("RTCSQuestion");
                this.set_classname("RTCSQuestion");
                this.set_titletext("질문관리");
                this._setFormPosition(0,0,1147,745);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("dsList", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"questionNo\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"questionTp\" type=\"STRING\" size=\"256\"/><Column id=\"question\" type=\"STRING\" size=\"256\"/><Column id=\"confYn\" type=\"STRING\" size=\"256\"/><Column id=\"answerNo\" type=\"STRING\" size=\"256\"/><Column id=\"answer\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows/>");
            this.addChild(obj.name, obj);

            obj = new Dataset("useYn", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsQuestionTp", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cdNm\">선택</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsPram", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"answer\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static04", "absolute", "0", "44", "1122", "20", null, null, this);
            obj.set_taborder("10");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "0", "-1", null, "45", "25", null, this);
            obj.set_taborder("12");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Combo("Combo00", "absolute", "326", "10", "140", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("0");
            obj.set_innerdataset("@useYn");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj = new Static("Static03", "absolute", "258", "11", "68", "20", null, null, this.div_search);
            obj.set_taborder("1");
            obj.set_text("사용여부");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("Edit00", "absolute", "88", "10", "140", "21", null, null, this.div_search);
            obj.set_taborder("2");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("3");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "20", "11", "66", "20", null, null, this.div_search);
            obj.set_taborder("3");
            obj.set_text("질문번호");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("Button00", "absolute", null, "10", "71", "22", "95", null, this.div_search);
            obj.set_taborder("4");
            obj.set_text("질문조회");
            obj.set_visible("false");
            obj.set_cssclass("btn_WF_CRUD");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("Button13", "absolute", null, "10", "71", "22", "20", null, this.div_search);
            obj.set_taborder("5");
            obj.set_text("답변조회");
            obj.set_visible("false");
            obj.set_cssclass("btn_WF_CRUD");
            this.div_search.addChild(obj.name, obj);

            obj = new Div("Div00", "absolute", "0", "64", null, "427", "25", null, this);
            obj.set_taborder("7");
            this.addChild(obj.name, obj);
            obj = new Static("Static17", "absolute", "0", "147", null, "245", "0", null, this.Div00);
            obj.set_taborder("115");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "0", "391", "281", "31", null, null, this.Div00);
            obj.set_taborder("95");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static07", "absolute", "280", "391", "281", "31", null, null, this.Div00);
            obj.set_taborder("98");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static11", "absolute", "560", "391", "281", "31", null, null, this.Div00);
            obj.set_taborder("101");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static14", "absolute", "841", "391", null, "31", "0", null, this.Div00);
            obj.set_taborder("104");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static45", "absolute", "280", "0", "281", "31", null, null, this.Div00);
            obj.set_taborder("47");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static34", "absolute", "0", "0", "281", "31", null, null, this.Div00);
            obj.set_taborder("51");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static39", "absolute", "0", "30", null, "88", "0", null, this.Div00);
            obj.set_taborder("52");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static35", "absolute", "0", "0", "130", "31", null, null, this.Div00);
            obj.set_taborder("53");
            obj.set_text("질문번호");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.Div00.addChild(obj.name, obj);
            obj = new Edit("questionNo", "absolute", "134", "5", "142", "21", null, null, this.Div00);
            obj.set_taborder("54");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("3");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static36", "absolute", "0", "30", "130", "88", null, null, this.Div00);
            obj.set_taborder("55");
            obj.set_text("질문내용");
            obj.set_cssclass("sta_WF_detailLabel");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static27", "absolute", "280", "0", "130", "31", null, null, this.Div00);
            obj.set_taborder("60");
            obj.set_text("사용여부");
            obj.set_cssclass("sta_WF_detailLabel");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "2", "117", null, "31", "0", null, this.Div00);
            obj.set_taborder("65");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static09", "absolute", "0", "117", "130", "31", null, null, this.Div00);
            obj.set_taborder("71");
            obj.set_text("답변번호");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static47", "absolute", "560", "0", "281", "31", null, null, this.Div00);
            obj.set_taborder("86");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static49", "absolute", "841", "0", null, "31", "0", null, this.Div00);
            obj.set_taborder("87");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static31", "absolute", "840", "0", "130", "31", null, null, this.Div00);
            obj.set_taborder("89");
            obj.set_text("평가반영여부");
            obj.set_cssclass("sta_WF_detailLabel");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static28", "absolute", "560", "0", "130", "31", null, null, this.Div00);
            obj.set_taborder("91");
            obj.set_text("질문유형");
            obj.set_cssclass("sta_WF_detailLabel");
            this.Div00.addChild(obj.name, obj);
            obj = new Combo("cbo_useYn", "absolute", "414", "5", "142", "21", null, null, this.Div00);
            this.Div00.addChild(obj.name, obj);
            obj.set_taborder("92");
            obj.set_innerdataset("@useYn");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_index("-1");
            obj = new Static("Static00", "absolute", "0", "391", "130", "31", null, null, this.Div00);
            obj.set_taborder("93");
            obj.set_text("수정일자");
            obj.set_cssclass("sta_WF_detailLabel");
            this.Div00.addChild(obj.name, obj);
            obj = new Edit("regId", "absolute", "134", "396", "142", "21", null, null, this.Div00);
            obj.set_taborder("94");
            obj.set_readonly("true");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static05", "absolute", "280", "391", "130", "31", null, null, this.Div00);
            obj.set_taborder("96");
            obj.set_text("수정자");
            obj.set_cssclass("sta_WF_detailLabel");
            this.Div00.addChild(obj.name, obj);
            obj = new Edit("regDt", "absolute", "414", "396", "142", "21", null, null, this.Div00);
            obj.set_taborder("97");
            obj.set_readonly("true");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static08", "absolute", "560", "391", "130", "31", null, null, this.Div00);
            obj.set_taborder("99");
            obj.set_text("등록일자");
            obj.set_cssclass("sta_WF_detailLabel");
            this.Div00.addChild(obj.name, obj);
            obj = new Edit("chgId", "absolute", "694", "396", "142", "21", null, null, this.Div00);
            obj.set_taborder("100");
            obj.set_readonly("true");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static13", "absolute", "840", "391", "130", "31", null, null, this.Div00);
            obj.set_taborder("102");
            obj.set_text("등록자");
            obj.set_cssclass("sta_WF_detailLabel");
            this.Div00.addChild(obj.name, obj);
            obj = new Edit("chgDt", "absolute", "974", "396", "143", "21", null, null, this.Div00);
            obj.set_taborder("103");
            obj.set_readonly("true");
            this.Div00.addChild(obj.name, obj);
            obj = new Combo("questionTp", "absolute", "694", "5", "142", "21", null, null, this.Div00);
            this.Div00.addChild(obj.name, obj);
            obj.set_taborder("105");
            obj.set_innerdataset("@dsQuestionTp");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj.set_displaynulltext("선택");
            obj.set_index("-1");
            obj = new Combo("confYn", "absolute", "974", "5", "142", "21", null, null, this.Div00);
            this.Div00.addChild(obj.name, obj);
            obj.set_taborder("106");
            obj.set_innerdataset("@useYn");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj.set_displaynulltext("선택");
            obj.set_index("-1");
            obj = new Static("Static16", "absolute", "0", "147", "130", "245", null, null, this.Div00);
            obj.set_taborder("114");
            obj.set_text("답변내용");
            obj.set_cssclass("sta_WF_detailLabel");
            this.Div00.addChild(obj.name, obj);
            obj = new Edit("answerNo", "absolute", "134", "122", "142", "21", null, null, this.Div00);
            obj.set_taborder("116");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("3");
            this.Div00.addChild(obj.name, obj);
            obj = new TextArea("question", "absolute", "134", "35", "982", "78", null, null, this.Div00);
            obj.set_taborder("117");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("2000");
            this.Div00.addChild(obj.name, obj);
            obj = new TextArea("TextArea01", "absolute", "134", "152", "982", "235", null, null, this.Div00);
            obj.set_taborder("118");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("2000");
            this.Div00.addChild(obj.name, obj);

            obj = new Grid("Grid00", "absolute", "0", "506", null, "183", "25", null, this);
            obj.set_taborder("11");
            obj.set_binddataset("dsList");
            obj.set_visible("false");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/></Columns><Rows><Row band=\"head\" size=\"24\"/><Row band=\"body\" size=\"24\"/></Rows><Band id=\"head\"><Cell col=\"0\" disptype=\"normal\" text=\"questionNo\"/><Cell col=\"1\" disptype=\"normal\" text=\"useYn\"/><Cell col=\"2\" disptype=\"normal\" text=\"questionTp\"/><Cell col=\"3\" disptype=\"normal\" text=\"question\"/><Cell col=\"4\" disptype=\"normal\" text=\"confYn\"/><Cell col=\"5\" disptype=\"normal\" text=\"answerNo\"/><Cell col=\"6\" disptype=\"normal\" text=\"regId\"/><Cell col=\"7\" disptype=\"normal\" text=\"regDt\"/><Cell col=\"8\" disptype=\"normal\" text=\"chgId\"/><Cell col=\"9\" disptype=\"normal\" text=\"chgDt\"/></Band><Band id=\"body\"><Cell col=\"0\" disptype=\"normal\" text=\"bind:questionNo\"/><Cell col=\"1\" disptype=\"normal\" text=\"bind:useYn\"/><Cell col=\"2\" disptype=\"normal\" text=\"bind:questionTp\"/><Cell col=\"3\" disptype=\"normal\" text=\"bind:question\"/><Cell col=\"4\" disptype=\"normal\" text=\"bind:confYn\"/><Cell col=\"5\" disptype=\"normal\" text=\"bind:answerNo\"/><Cell col=\"6\" disptype=\"normal\" text=\"bind:regId\"/><Cell col=\"7\" disptype=\"normal\" text=\"bind:regDt\"/><Cell col=\"8\" disptype=\"normal\" text=\"bind:chgId\"/><Cell col=\"9\" disptype=\"normal\" text=\"bind:chgDt\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1122", "0", "25", "744", null, null, this);
            obj.set_taborder("13");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 0, 45, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("12");
            		p.set_scrollbars("none");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 0, 427, this.Div00,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("7");

            	}
            );
            this.Div00.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1147, 745, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCSQuestion");
            		p.set_titletext("질문관리");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item0","Div00.questionNo","value","dsList","questionNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item1","Div00.cbo_useYn","value","dsList","useYn");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item2","Div00.questionTp","value","dsList","questionTp");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item3","Div00.confYn","value","dsList","confYn");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item4","Div00.question","value","dsList","question");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item5","Div00.answerNo","value","dsList","answerNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item6","Div00.regId","value","dsList","chgDt");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item7","Div00.regDt","value","dsList","chgId");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item8","Div00.chgId","value","dsList","regDt");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item9","Div00.chgDt","value","dsList","regId");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item10","Div00.TextArea01","value","dsList","answer");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCSQuestion.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCSQuestion.xfdl", function() {
        /***********************************************************************
         * Script Include 
         ************************************************************************/
        //include "lib::comLib.xjs";

        this.form_onload = function(obj,e){
        	Ex.core.init(obj);
        	this.fn_init();
        	this.parent.setButton("C|N|S", this);
        	//this.dsList.addRow();
        }

        //콤보박스 세팅, readonly
        this.fn_init = function(){
        	var sSvcID      	= "initCombo";  
        	var sController   	= "/ntrms/cs/initQuestion.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "useYn=output dsQuestionTp=output2";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        //추가
        this.fn_add = function(obj,e)
        {
        	this.dsList.clearData();
        	this.dsList.addRow();
        	//this.dsList.selectRow(nRow);
        	//this.dsList.addColumn();
        	this.Div00.questionNo.set_enable(true);
        	this.Div00.answerNo.set_enable(true);
        	this.Div00.questionNo.setFocus(true);
        	this.div_search.Edit00.set_value("");
        	this.div_search.Combo00.set_index(-1);
        	this.Div00.cbo_useYn.set_index(0);
        }

        
        //답변
        this.Div00_answerNo_ontextchanged = function(obj,e)
        {
        	var answerNo = nvl(this.Div00.answerNo.value);

        	var sSvcID        	= "answerList";            
        	var sController   	= "/ntrms/cs/answerList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "dsPram=output";
        	var sArgs 			= "answerNo="+answerNo;	
        	var fn_callBack		= "fn_callBack";
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        //조회
        this.fn_search = function(obj,e)
        {
        	var questionNo = 	nvl(this.div_search.Edit00.value); //질문번호
        	var useYn = 		nvl(this.div_search.Combo00.value); //사용여부	
        	
        	if(questionNo == "" || questionNo == null || questionNo.length == 0) {
        		alert("질문번호를 입력해주세요.");
        		return;
        	}
        	
        	var sSvcID        	= "questionList";                    
        	var sController   	= "/ntrms/cs/questionList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "dsList=output";
        	var sArgs 			= ""
        	var fn_callBack		= "fn_callBack";
        	
        	this.dsList.clearData();
        	
        	sArgs += Ex.util.setParam("questionNo", questionNo);
        	sArgs += Ex.util.setParam("useYn", useYn);
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }

        	/***********************************************************************************
        	* CallBack Event (strSvcId - Sevice ID, nErrorCode - ErrorCode, strErrorMsg - Error Message)
        	***********************************************************************************/

        	/* callBack함수 */
        	this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg)
        	{ 
        		if (nErrorCode < 0) 
        		{
        			alert(strErrorMsg);				
        			return;
        		} 
        		
        		if (strSvcId == "questionList") 
        		{
        			var cnt = this.dsList.getRowCount();
        			if( cnt <= 0) {
        				alert("조회된 데이터가 없습니다.");
        				this.Edit00.setFocus(true);  //focus
        			} else {
        				this.Div00.questionNo.set_enable(false);
        				//this.Div00.answerNo.set_enable(false);
        			}
        		}
        		
        		if(strSvcId == "answerList") {
        			this.Div00.TextArea01.set_value(this.dsPram.getColumn(0, "answer"));
        		}
        		
        		if (strSvcId == "initCombo") {
        			//alert(this.useYn.getColumn(0, "cd"));
        			this.Div00.cbo_useYn.set_index(0);
        			//this.Div00.questionTp.set_value("");
        		}		
        		
        		if (strSvcId == "saveData") {
        			alert(strErrorMsg);
        			this.dsList.clearData();
        		}
        	}
        //저장
        this.fn_save = function(obj,e)
        	{
        		var questionNo = nvl(this.Div00.questionNo.value); //질문번호
        		var useYn = nvl(this.Div00.cbo_useYn.value); //사용여부
        		var questionTp = nvl(this.Div00.questionTp.value); // 질문유형
        		var confYn = nvl(this.Div00.confYn.value); //평가반영여부
        		var question = nvl(this.Div00.question.value); //질문내용
        		var answerNo = nvl(this.Div00.answerNo.value); //답변번호
        		
        		if(questionNo == null || questionNo == "" || questionNo.length == 0) {
        			alert("질문번호를 입력해주세요.");
        			return;
        		}
        		
        		if(answerNo == null || answerNo == "" || answerNo.length == 0) {
        			alert("답변번호를 입력해주세요");
        			return;
        		}
        		
        		if(questionNo.length != 3) {
        			alert("질문번호 3자리수로");
        			return;
        		}
        		
        		if(answerNo.length != 3) {
        			alert("답변번호 3자리수로");
        			return;
        		}
        		
        		if(questionTp == null || questionTp == "" || questionTp.length == 0) {
        			alert("질문유형을 선택해주세요.");
        			return;
        		}
        		
        		if(confYn == null || confYn == "" || confYn.length == 0) {
        			alert("평가반영여부를 선택해주세요.");
        			return;
        		}
        		
        		var sSvcID        	= "saveData";
        		var sController   	= "/ntrms/cs/questionSaveDaset.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";
        		sInDatasets   		= "input=dsList:U";
        		sOutDatasets  		= "";
        		var fn_callBack		= "fn_callBack";
        /*		
        		sArgs += Ex.util.setParam("questionNo", questionNo);
        		sArgs += Ex.util.setParam("useYn", useYn);
        		sArgs += Ex.util.setParam("questionTp", questionTp);
        		sArgs += Ex.util.setParam("confYn", confYn);
        		sArgs += Ex.util.setParam("question", question);
        		sArgs += Ex.util.setParam("answerNo", answerNo);
        */	
        		Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}

        
        this.fn_excel= function() {
        	Ex.core.exportExcel(this, this.Grid00);
        }

        //검색 시 Enter키 이벤트 처리
        this.div_search_edt_searchKeyword_onkeyup = function(obj,e)
        {
        	if ( e.keycode == 13 )
        	{
        		this.fn_search();
        	}
        }

        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.div_search.Combo00.addEventHandler("onitemchanged", this.Combo00_onitemchanged, this);
            this.Div00.answerNo.addEventHandler("ontextchanged", this.Div00_answerNo_ontextchanged, this);

        };

        this.loadIncludeScript("RTCSQuestion.xfdl");

       
    };
}
)();
