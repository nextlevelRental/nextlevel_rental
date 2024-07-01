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
                this.set_name("test_form");
                this.set_classname("test_form");
                this.set_titletext("답변 등록");
                this._setFormPosition(0,0,1147,496);
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
            obj._setContents("<ColumnInfo><Column id=\"answerNo\" type=\"STRING\" size=\"256\"/><Column id=\"answerSeq\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"answer\" type=\"STRING\" size=\"256\"/><Column id=\"score\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("useYn", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cd\">Y</Col><Col id=\"cdNm\">Y</Col></Row><Row><Col id=\"cd\">N</Col><Col id=\"cdNm\">N</Col></Row></Rows>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static03", "absolute", "0", "45", "1122", "20", null, null, this);
            obj.set_taborder("17");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "0", "76", "1122", "10", null, null, this);
            obj.set_taborder("18");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Button("Button37", "absolute", null, "58", "45", "22", "25", null, this);
            obj.set_taborder("20");
            obj.set_text("추가");
            obj.set_cssclass("btn_WF_module");
            this.addChild(obj.name, obj);

            obj = new Grid("Grid00", "absolute", "0", "86", null, "410", "25", null, this);
            obj.set_taborder("6");
            obj.set_binddataset("dsList");
            obj.set_autofittype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"30\"/><Column size=\"20\"/><Column size=\"30\"/><Column size=\"300\"/><Column size=\"30\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"답변번호\"/><Cell col=\"1\" text=\"순번\"/><Cell col=\"2\" text=\"사용여부\"/><Cell col=\"3\" text=\"답변내용\"/><Cell col=\"4\" text=\"점수\"/></Band><Band id=\"body\"><Cell edittype=\"text\" text=\"bind:answerNo\" editlimit=\"3\" editlengthunit=\"ascii\"/><Cell col=\"1\" edittype=\"text\" text=\"bind:answerSeq\" editlimit=\"3\" editlengthunit=\"ascii\"/><Cell col=\"2\" edittype=\"combo\" text=\"bind:useYn\" editlimit=\"1\" editlengthunit=\"ascii\" combodataset=\"useYn\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"3\" edittype=\"text\" text=\"bind:answer\" editlimit=\"2000\" editlengthunit=\"ascii\"/><Cell col=\"4\" edittype=\"text\" text=\"bind:score\" editlimit=\"3\" editlengthunit=\"ascii\"/><Cell col=\"5\" text=\"bind:regId\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "0", "0", null, "45", "25", null, this);
            obj.set_taborder("12");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_searchCondition", "absolute", "20", "0", "71", "41", null, null, this.div_search);
            obj.set_taborder("24");
            obj.set_text("답변번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("edt_searchKeyword", "absolute", "88", "10", "140", "20", null, null, this.div_search);
            obj.set_taborder("26");
            obj.set_displaynulltext("전체");
            obj.set_maxlength("3");
            obj.set_lengthunit("ascii");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "1122", "0", "25", "496", null, null, this);
            obj.set_taborder("15");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "0", "61", "81", "20", null, null, this);
            obj.set_taborder("21");
            obj.set_text("답변등록");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 0, 45, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("12");
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
            		p.set_classname("test_form");
            		p.set_titletext("답변 등록");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCSAnswer.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCSAnswer.xfdl", function() {
        /***********************************************************************
         * Script Include 
         ************************************************************************/
        //include "lib::comLib.xjs";
        this.form_onload = function(obj,e){
        	Ex.core.init(obj);
        	this.parent.setButton("E|C|S", this);
        }

        //추가
        this.btnAdd_onclick = function(obj,e)
        {
        	this.dsList.addRow();
        	//var nRow = this.dsList.rowposition ;
        	//this.dsList.setColumn( nRow, "answerNo", 100);
        }

        //조회
        this.fn_search = function(obj,e)
        {
        	var answerNo = 	nvl(this.div_search.edt_searchKeyword.value); //답변번호
        	
        	var sSvcID        	= "answerList";                    
        	var sController   	= "/ntrms/cs/answerList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "dsList=output";
        	var sArgs 			= "answerNo="+answerNo;	
        	var fn_callBack		= "fn_callBack";
        	
        	this.dsList.clearData();
        	
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
        		
        		if (strSvcId == "answerList") 
        		{
        			
        		}
        		
        		if (strSvcId == "saveData") 
        		{
        			alert(strErrorMsg);
        			//this.fn_search();
        		}
        	}
        //저장
        this.fn_save = function(obj,e)
        	{	
        		var nRow = this.dsList.rowposition ;
        		var answerNo = nvl(this.dsList.getColumn(nRow,"answerNo"));
        		var answerSeq = nvl(this.dsList.getColumn(nRow,"answerSeq"));
        		var score = nvl(this.dsList.getColumn(nRow,"score"));
        		
        		if(answerNo.length != 3) {
        			alert("답변번호 3자리수로");
        		}
        		
        		if(answerSeq.length != 3) {
        			alert("순번 3자리수로");
        		}
        		
        		if(score == "" || score == null || score.length == 0) {
        			this.dsList.setColumn(nRow, "score", 0)
        		}
        		
        		if(score > 100) {
        			alert("점수는 100이하로");
        			return;
        		}
        		
        		
        		
        		var sSvcID        	= "saveData";
        		var sController   	= "/ntrms/cs/answerSaveDaset.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";
        		sInDatasets   		= "input=dsList:U";
        		sOutDatasets  		= "";
        		var fn_callBack		= "fn_callBack";
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
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
            this.Button37.addEventHandler("onclick", this.btnAdd_onclick, this);
            this.div_search.edt_searchKeyword.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);

        };

        this.loadIncludeScript("RTCSAnswer.xfdl");

       
    };
}
)();
