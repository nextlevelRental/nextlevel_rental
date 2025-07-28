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
                this.set_titletext("프로그램 관리");
                this._setFormPosition(0,0,1147,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("dsCb", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"CODE\" type=\"STRING\" size=\"256\"/><Column id=\"NAME\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"CODE\">0</Col><Col id=\"NAME\">전체</Col></Row><Row><Col id=\"CODE\">1</Col><Col id=\"NAME\">프로그램코드</Col></Row><Row><Col id=\"CODE\">2</Col><Col id=\"NAME\">프로그램명</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsList", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"check\" type=\"STRING\" size=\"256\"/><Column id=\"prgmCd\" type=\"STRING\" size=\"256\"/><Column id=\"prgmNm\" type=\"STRING\" size=\"256\"/><Column id=\"prgmPath\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"prgmDesc\" type=\"STRING\" size=\"256\"/><Column id=\"mdlCd\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("D", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column type=\"string\" id=\"tmpPwYn\" size=\"32\"/><Column type=\"string\" id=\"lastPwDt\" size=\"32\"/><Column type=\"bigdecimal\" id=\"failCnt\" size=\"16\"/><Column type=\"string\" id=\"agentId\" size=\"32\"/><Column type=\"string\" id=\"oldPassword\" size=\"32\"/><Column type=\"string\" id=\"chgId\" size=\"32\"/><Column type=\"string\" id=\"password\" size=\"32\"/><Column type=\"string\" id=\"userGrp\" size=\"32\"/><Column type=\"string\" id=\"userNm\" size=\"32\"/><Column type=\"string\" id=\"lastLogonDt\" size=\"32\"/><Column type=\"string\" id=\"userId\" size=\"32\"/><Column type=\"string\" id=\"chgDt\" size=\"32\"/><Column type=\"string\" id=\"vkbur\" size=\"32\"/><Column type=\"string\" id=\"regDt\" size=\"32\"/><Column type=\"string\" id=\"regId\" size=\"32\"/><Column type=\"string\" id=\"lockYn\" size=\"32\"/><Column type=\"string\" id=\"vkgrp\" size=\"32\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("Dataset00", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"CODE\" type=\"STRING\" size=\"256\"/><Column id=\"NAME\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"NAME\">Y</Col><Col id=\"CODE\">Y</Col></Row><Row><Col id=\"NAME\">N</Col><Col id=\"CODE\">N</Col></Row></Rows>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static00", "absolute", "0", "61", "241", "20", null, null, this);
            obj.set_taborder("16");
            obj.set_text("Menu Title");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

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

            obj = new Button("Button00", "absolute", null, "58", "45", "22", "73", null, this);
            obj.set_taborder("19");
            obj.set_text("삭제");
            obj.set_cssclass("btn_WF_module");
            this.addChild(obj.name, obj);

            obj = new Button("Button37", "absolute", null, "58", "45", "22", "25", null, this);
            obj.set_taborder("20");
            obj.set_text("추가");
            obj.set_cssclass("btn_WF_module");
            this.addChild(obj.name, obj);

            obj = new Grid("Grid00", "absolute", "0", "86", null, "409", "25", null, this);
            obj.set_taborder("6");
            obj.set_binddataset("dsList");
            obj.set_autofittype("col");
            obj.set_cellsizingtype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"20\"/><Column size=\"60\"/><Column size=\"110\"/><Column size=\"80\"/><Column size=\"60\"/><Column size=\"60\"/><Column size=\"40\"/><Column size=\"50\"/><Column size=\"80\"/><Column size=\"50\"/><Column size=\"80\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell edittype=\"checkbox\" text=\"선택\"/><Cell col=\"1\" text=\"프로그램 코드\"/><Cell col=\"2\" text=\"프로그램 명\"/><Cell col=\"3\" text=\"프로그램 URL\"/><Cell col=\"4\" text=\"프로그램 설명\"/><Cell col=\"5\" text=\"모듈명\"/><Cell col=\"6\" text=\"사용유무\"/><Cell col=\"7\" text=\"등록자\"/><Cell col=\"8\" text=\"등록일자\"/><Cell col=\"9\" text=\"수정자\"/><Cell col=\"10\" text=\"수정일자\"/></Band><Band id=\"body\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\" text=\"bind:check\" editlimit=\"0\"/><Cell col=\"1\" edittype=\"text\" editfilter=\"upper,number,char\" text=\"bind:prgmCd\" editlimit=\"12\" editlengthunit=\"ascii\"/><Cell col=\"2\" edittype=\"text\" editfilter=\"upper,number,char\" text=\"bind:prgmNm\" editlimit=\"150\" editlengthunit=\"ascii\"/><Cell col=\"3\" edittype=\"text\" editfilter=\"number,char\" text=\"bind:prgmPath\" editlimit=\"200\" editlengthunit=\"ascii\"/><Cell col=\"4\" edittype=\"text\" text=\"bind:prgmDesc\" editlimit=\"300\" editlengthunit=\"ascii\"/><Cell col=\"5\" edittype=\"text\" text=\"bind:mdlCd\" editlimit=\"4\" editlengthunit=\"ascii\"/><Cell col=\"6\" edittype=\"combo\" text=\"bind:useYn\" combodataset=\"Dataset00\" combocodecol=\"CODE\" combodatacol=\"NAME\"/><Cell col=\"7\" edittype=\"text\" text=\"bind:regId\" editlimit=\"20\" editlengthunit=\"ascii\"/><Cell col=\"8\" edittype=\"text\" text=\"bind:regDt\"/><Cell col=\"9\" edittype=\"text\" text=\"bind:chgId\" editlimit=\"20\" editlengthunit=\"ascii\"/><Cell col=\"10\" edittype=\"text\" text=\"bind:chgDt\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "0", "0", null, "45", "25", null, this);
            obj.set_taborder("12");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_searchCondition", "absolute", "1.99%", "0", null, "41", "91.65%", null, this.div_search);
            obj.set_taborder("24");
            obj.set_text("검색");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cmb_searchCondition", "absolute", "8.55%", "10", null, "20", "81.51%", null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("25");
            obj.set_value("-1");
            obj.set_text("선택");
            obj.set_innerdataset("@dsCb");
            obj.set_codecolumn("CODE");
            obj.set_datacolumn("NAME");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj.set_index("0");
            obj = new Edit("edt_searchKeyword", "absolute", "19.48%", "10", null, "20", "54.67%", null, this.div_search);
            obj.set_taborder("26");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "1122", "0", "25", "496", null, null, this);
            obj.set_taborder("15");
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
            		p.set_titletext("프로그램 관리");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCMPro.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCMPro.xfdl", function() {
        /***********************************************************************
         * Script Include 
         ************************************************************************/
        //include "lib::comLib.xjs";

        this.form_onload = function(obj,e){
        	Ex.core.init(obj);
        	this.parent.setButton("E|C|S", this);
        } 

            
        this.Button05_onclick = function(obj,e)
        {
        	this.transaction( "MyService01" ,"http://localhost/sampleController.do","input1=Dataset02","D=output","a=b","callbackFunction",true);

        }
        //추가버튼
        this.btnAdd_onclick = function(obj,e)
        {	
        	var cnt = this.dsList.rowcount - 1;
        	if(this.dsList.getRowType(cnt) == '2') {
        		return;
        	}
        	else {
        		this.dsList.addRow();
        		this.Grid00_oncellclick();
        	}	
        }

        this.btnDel_onclick = function(obj,e)
        {	
        	var col = this.Grid00.currentrow;
        	this.dsList.deleteRow(col);
        }

        this.Button06_onclick = function(obj,e)
        {
        	this.D.addRow();
        }

        this.Button07_onclick = function(obj,e)
        {
        	var col = this.Grid01.currentrow;
        	this.D.deleteRow(col);
        }

        //조회
        this.fn_search = function(obj,e)
        {
        	var sSvcID        	= "proService";                    
        	var sController   	= "/ntrms/cm/proController.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "dsList=output";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        		
        	this.dsList.clearData();
        	var serviceId 	= "proService";
        	var url 		= "src::proController.do";
        	if(this.div_search.cmb_searchCondition.value == 1){ 
        		sArgs = "prgmCd=" + nvl(this.div_search.edt_searchKeyword.value);
        	} else if(this.div_search.cmb_searchCondition.value == 2) {
        		sArgs = "prgmNm=" + nvl(this.div_search.edt_searchKeyword.value);
        	} else {
        		var params = "";
        	}
        	
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
        			return ExtNx.core.comMsg("alert",strErrorMsg);		
        		}
        		
        		if (strSvcId == "proService") 
        		{
        			this.dsList.addColumn("check", "string", 256);
        			var nTotalCnt = this.dsList.rowcount;
        			this.sta_total_cnt.set_text(nTotalCnt);
        			this.grd_Group.hscrollbar ;
        			
        		}
        		
        		if (strSvcId == "saveData") 
        		{
        			alert(strErrorMsg);
        			this.fn_search();
        		}
        	}
        //저장
        this.fn_save = function(obj,e) {
        	var flag = false;
        	for(var i = 0 ; i < this.dsList.getRowCount() ; i++){
        		if(this.dsList.getRowType(i) == 2 || this.dsList.getRowType(i) == 4 || this.dsList.getRowType(i) == 8){
        			flag = true; 
        			break;
        		}
        	}
        	if(flag){
        		var saveFlag = true;
        		
        		for(var i = 0 ; i < this.dsList.getRowCount() ; i++){
        	
        			var prgmCd 	  = nvl(this.dsList.getColumn(i, "prgmCd")); //프로그램 코드
        			if(prgmCd == "") {
        				alert("프로그램 코드를 선택해주세요.");
        				this.Grid00.selectRow(i);
        				saveFlag = false;
        				break;
        				return false;
        			}
        		}
        	}
        	if( saveFlag ){
        		var sSvcID        	= "saveData";                    
        		var sController   	= "/ntrms/cm/proSaveDaset.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";
        		sInDatasets   		= "input=dsList:U";
        		sOutDatasets  		= "";
        		var fn_callBack		= "fn_callBack";
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}else{
        		alert("수정된 데이터가 없습니다.");
        	}
        	
        }

        //검색 시 Enter키 이벤트 처리
        this.div_search_edt_searchKeyword_onkeyup = function(obj,e)
        {
        	if ( e.keycode == 13 )
        	{
        		this.fn_search();
        	}
        }

        this.fn_excel= function() {
        	Ex.core.exportExcel(this, this.Grid00);
        }

        //cell클릭 이벤트
        this.Grid00_oncellclick = function(obj,e)
        {
        	for (var i=0; i<=this.dsList.rowcount; i++) {
        		if(this.dsList.rowposition == i) {
        			this.dsList.setColumn(this.dsList.rowposition ,"check","1");
        		}
        		else {
        			this.dsList.setColumn(i,"check","0");
        		}
        	}
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.Static00.addEventHandler("onclick", this.Static00_onclick, this);
            this.Button00.addEventHandler("onclick", this.btnDel_onclick, this);
            this.Button37.addEventHandler("onclick", this.btnAdd_onclick, this);
            this.Grid00.addEventHandler("oncellclick", this.Grid00_oncellclick, this);
            this.Grid00.addEventHandler("oncelldblclick", this.Grid00_oncelldblclick, this);
            this.div_search.cmb_searchCondition.addEventHandler("onitemchanged", this.div_search_cmb_searchCondition_onitemchanged, this);
            this.div_search.edt_searchKeyword.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);

        };

        this.loadIncludeScript("RTCMPro.xfdl");

       
    };
}
)();
