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
                this.set_name("RTCOMMRGroup_pop");
                this.set_classname("RTCOMMRGroup_pop");
                this.set_titletext("렌탈지사 조회");
                this._setFormPosition(0,0,400,485);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("dsRGroup", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"rentalGroup\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroupNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsSelectInfo", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"rentalGroup\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroupNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Div("div_search", "absolute", "10", "10", null, "45", "10", null, this);
            obj.set_taborder("0");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_searchCondition", "absolute", "20", "10", "66", "20", null, null, this.div_search);
            obj.set_taborder("30");
            obj.set_text("렌탈지사");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("edt_searchKeyword", "absolute", "90", "10", "218", "21", null, null, this.div_search);
            obj.set_taborder("31");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_search", "absolute", null, "9", "45", "22", "18", null, this.div_search);
            obj.set_taborder("32");
            obj.set_text("검색");
            obj.set_cssclass("btn_WF_CRUD");
            obj.getSetter("domainId").set("nexa.add");
            this.div_search.addChild(obj.name, obj);

            obj = new Grid("grd_Group", "absolute", "10", "66", null, "380", "10", null, this);
            obj.set_taborder("1");
            obj.set_binddataset("dsRGroup");
            obj.set_cellsizingtype("col");
            obj.set_autofittype("col");
            obj.set_autosizebandtype("head");
            obj.set_cellclickbound("cell");
            obj.getSetter("domainId").set("nexa.id;nexa.name;nexa.dspt;nexa.password;nexa.phone;nexa.createdate;nexa.createuser;nexa.updatedate;nexa.updateuser");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"90\"/><Column size=\"280\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"렌탈지사코드\"/><Cell col=\"1\" text=\"렌탈지사명\"/></Band><Band id=\"body\"><Cell text=\"bind:rentalGroup\"/><Cell col=\"1\" text=\"bind:rentalGroupNm\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Button("btn_choice", "absolute", null, "456", "41", "21", "54", null, this);
            obj.set_taborder("2");
            obj.set_text("선택");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);

            obj = new Button("btn_close", "absolute", null, "456", "41", "21", "9", null, this);
            obj.set_taborder("3");
            obj.set_text("닫기");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 0, 45, this.div_search,
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
            obj = new Layout("default", "", 400, 485, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCOMMRGroup_pop");
            		p.set_titletext("렌탈지사 조회");

            		p.div_search.set_taborder("0");
            		p.div_search.set_text("Div00");
            		p.div_search.set_scrollbars("none");
            		p.div_search.set_cssclass("div_WF_searchBg");
            		p.div_search.move("10", "10", null, "45", "10", null);
            		p.grd_Group.set_taborder("1");
            		p.grd_Group.set_binddataset("dsRGroup");
            		p.grd_Group.getSetter("useinputpanel").set("false");
            		p.grd_Group.set_cellsizingtype("col");
            		p.grd_Group.set_autofittype("col");
            		p.grd_Group.set_autosizebandtype("head");
            		p.grd_Group.set_cellclickbound("cell");
            		p.grd_Group.getSetter("domainId").set("nexa.id;nexa.name;nexa.dspt;nexa.password;nexa.phone;nexa.createdate;nexa.createuser;nexa.updatedate;nexa.updateuser");
            		p.grd_Group.move("10", "66", null, "380", "10", null);
            		p.btn_choice.set_taborder("2");
            		p.btn_choice.set_text("선택");
            		p.btn_choice.getSetter("domainId").set("nexa.add");
            		p.btn_choice.move(null, "456", "41", "21", "54", null);
            		p.btn_close.set_taborder("3");
            		p.btn_close.set_text("닫기");
            		p.btn_close.getSetter("domainId").set("nexa.add");
            		p.btn_close.move(null, "456", "41", "21", "9", null);

            	}
            );
            this.addLayout(obj.name, obj);

            //-- Normal Layout
            obj = new Layout("Layout00", "Screen0", 1024, 1024, this,
            	//-- Layout function
            	function(p) {
            	}
            );
            this.addLayout(obj.name, obj);

            //-- Normal Layout
            obj = new Layout("Layout01", "Screen1", 1024, 1024, this,
            	//-- Layout function
            	function(p) {
            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCOMMRGroup_pop.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCOMMRGroup_pop.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분 : 렌탈지사 조회 팝업
         * 02. 그룹명   : RTCOMMRGroup_pop.xfdl
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
        this.ParserStr = "^&^";
        	
        	this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg,resultCnt){
        		
        		if (nErrorCode < 0) 
        		{
        			return Ex.core.comMsg("alert",strErrorMsg);		
        		}
        		
        		switch (strSvcId) 
        		{
        			case "listRentalGroup":
        				if(this.dsRGroup.rowcount == 0) {
        					alert("조회된 데이터가 없습니다.");
        					this.grd_Group.set_nodatatext("조회된 데이터가 없습니다.");
        					this.div_search.edt_searchKeyword.setFocus(true);
        					return;					
        				}			
        				break;
        				
        			default:
        				break;
        		}
        	}
        	
        	//-------------------------------------------------------------------------------   
        	//조회
        	//-------------------------------------------------------------------------------
        	this.fn_search = function(){
        		var userGrp = application.gds_userInfo.getColumn(0, "userGrp"); 
        		var userId = application.gds_userInfo.getColumn(0, "userId"); 	
        		
        		var sSvcID        	= "listRentalGroup";
        		var sController   	= "/listRentalGroup.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "dsRGroup=output";
        		var sArgs 			= "";		
        			sArgs += Ex.util.setParam("usrGroup", userGrp);		//사용자그룹
        			sArgs += Ex.util.setParam("usrId", userId);			//사용자Id
        			sArgs += Ex.util.setParam("keyword", this.div_search.edt_searchKeyword.text);
        			
        		var fn_callBack		= "fn_callBack";
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        	
        	//-------------------------------------------------------------------------------   
        	//그리드 더블클릭 시 오픈페이지에 선택 전달      
        	//-------------------------------------------------------------------------------
        	this.fn_choice = function(){

        		//변경할내용세팅	
        		var idx = this.dsRGroup.rowposition;
        		if( idx != -1 ) {
        			this.dsSelectInfo.clearData();		
        			this.dsSelectInfo.addRow();
        			this.dsSelectInfo.copyRow(0,this.dsRGroup,idx);
        			
        			this.close(this.opener._setReturn(this.dsSelectInfo,this.parent.p_arg));
        		}else{
        			alert("선택된 데이터가 없습니다.");
        		}
        	}

        	//-------------------------------------------------------------------------------   
        	//검색어 입력창 ENTER KEY
        	//-------------------------------------------------------------------------------
        	this.div_search_edt_searchKeyword_onkeyup = function(obj,e)
        	{
        		if( e.keycode == "13" ){
        			this.fn_search();
        		}
        	}
        	
        	//-------------------------------------------------------------------------------   
        	// 검색버튼 클릭
        	//-------------------------------------------------------------------------------
        	this.div_search_btn_search_onclick = function(obj,e)
        	{
        		this.fn_search();
        	}

        	//-------------------------------------------------------------------------------   
        	//그리드 더블클릭
        	//-------------------------------------------------------------------------------
        	this.fn_return = function(obj,e)
        	{
        		this.fn_choice();
        	}
        	
        	//-------------------------------------------------------------------------------   
        	//선택버튼 클릭
        	//-------------------------------------------------------------------------------
        	this.btn_choice_onclick = function(obj,e)
        	{
        		this.fn_choice();
        	}
        	
        	//-------------------------------------------------------------------------------   
        	//닫기버튼 클릭
        	//-------------------------------------------------------------------------------
        	this.btn_close_onclick = function(obj,e)
        	{
        		this.close();
        	}

        	//-------------------------------------------------------------------------------   
        	//폼로드시 공통함수      
        	//-------------------------------------------------------------------------------
        	this.RTCOMMRGroup_pop_onload = function(obj,e)
        	{
        		Ex.core.init(obj);
        		this.fn_search();
        	}
        	
        	//-------------------------------------------------------------------------------   
        	//폼 ESC KEY
        	//-------------------------------------------------------------------------------
        	this.RTCOMMRGroup_pop_onkeyup = function(obj,e)
        	{
        		if(e.keycode == 27){
        			this.close();
        		}
        	}
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTCOMMRGroup_pop_onload, this);
            this.addEventHandler("onkeyup", this.RTCOMMRGroup_pop_onkeyup, this);
            this.div_search.edt_searchKeyword.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.div_search.btn_search.addEventHandler("onclick", this.div_search_btn_search_onclick, this);
            this.grd_Group.addEventHandler("oncelldblclick", this.fn_return, this);
            this.btn_choice.addEventHandler("onclick", this.btn_choice_onclick, this);
            this.btn_close.addEventHandler("onclick", this.btn_close_onclick, this);

        };

        this.loadIncludeScript("RTCOMMRGroup_pop.xfdl");

       
    };
}
)();
