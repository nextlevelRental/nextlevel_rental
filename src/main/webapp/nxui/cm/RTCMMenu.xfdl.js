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
                this.set_titletext("메뉴등록");
                this._setFormPosition(0,0,1147,496);
            }
            this.getSetter("inheritanceid").set("");

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("dsList", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"선택\" type=\"STRING\" size=\"256\"/><Column id=\"menuCd\" type=\"STRING\" size=\"256\"/><Column id=\"menuNm\" type=\"STRING\" size=\"256\"/><Column id=\"menuLvl\" type=\"STRING\" size=\"256\"/><Column id=\"uprMenuCd\" type=\"STRING\" size=\"256\"/><Column id=\"uprMenuNm\" type=\"STRING\" size=\"256\"/><Column id=\"mdlCd\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"menuDesc\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/><Column id=\"sortOdr\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsYn", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_searchCond", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cd\"/><Col id=\"cdNm\">선택</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsTreeList", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"선택\" type=\"STRING\" size=\"256\"/><Column id=\"menuCd\" type=\"STRING\" size=\"256\"/><Column id=\"menuNm\" type=\"STRING\" size=\"256\"/><Column id=\"menuLvl\" type=\"STRING\" size=\"256\"/><Column id=\"uprMenuCd\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"menuDesc\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/><Column id=\"mdlCd\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsMdlCode", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("st_BG", "absolute", "10", "0", null, "40", "-10", null, this);
            obj.set_cssclass("sta_WF_SearchBox");
            obj.set_taborder("1");
            this.addChild(obj.name, obj);

            obj = new Grid("grdList", "absolute", "319", "86", null, "410", "25", null, this);
            obj.set_taborder("4");
            obj.set_binddataset("dsList");
            obj.set_autoenter("select");
            obj.set_cellsizingtype("col");
            obj.set_autofittype("none");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"0\"/><Column size=\"70\"/><Column size=\"120\"/><Column size=\"65\"/><Column size=\"80\"/><Column size=\"120\"/><Column size=\"100\"/><Column size=\"120\"/><Column size=\"60\"/><Column size=\"100\"/><Column size=\"80\"/><Column size=\"100\"/><Column size=\"80\"/><Column size=\"100\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"선택\"/><Cell col=\"1\" text=\"메뉴코드\"/><Cell col=\"2\" text=\"메뉴명\"/><Cell col=\"3\" text=\"메뉴레벨\"/><Cell col=\"4\" text=\"상위메뉴코드\"/><Cell col=\"5\" text=\"상위메뉴명\"/><Cell col=\"6\" text=\"메뉴설명\"/><Cell col=\"7\" text=\"모듈명\"/><Cell col=\"8\" text=\"정렬순서\"/><Cell col=\"9\" text=\"사용유무\"/><Cell col=\"10\" text=\"등록자\"/><Cell col=\"11\" text=\"등록일자\"/><Cell col=\"12\" text=\"수정자\"/><Cell col=\"13\" text=\"수정일자\"/></Band><Band id=\"body\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\" text=\"bind:선택\"/><Cell col=\"1\" displaytype=\"normal\" edittype=\"expr:(dataset.getRowType(currow) == 2) ? 'normal' : 'none'\" editfilter=\"upper,number,char\" text=\"bind:menuCd\" editlimit=\"12\" editautoselect=\"true\" editlengthunit=\"ascii\"/><Cell col=\"2\" edittype=\"expr:(dataset.getRowType(currow) == 2) ? 'normal' : 'none'\" editfilter=\"upper,number,char\" style=\"align:left middle;\" text=\"bind:menuNm\" editautoselect=\"true\"/><Cell col=\"3\" edittype=\"expr:(dataset.getRowType(currow) == 2) ? 'normal' : 'none'\" editfilter=\"digit\" text=\"bind:menuLvl\" editlimit=\"1\" editlengthunit=\"ascii\"/><Cell col=\"4\" edittype=\"normal\" editfilter=\"upper,number,char\" text=\"bind:uprMenuCd\" editlimit=\"12\" editlengthunit=\"ascii\"/><Cell col=\"5\" edittype=\"normal\" editfilter=\"upper,number,char\" style=\"align:left middle;\" text=\"bind:uprMenuNm\"/><Cell col=\"6\" edittype=\"normal\" style=\"align:left middle;\" text=\"bind:menuDesc\"/><Cell col=\"7\" displaytype=\"combo\" edittype=\"combo\" text=\"bind:mdlCd\" combodataset=\"dsMdlCode\" combocodecol=\"cd\" combodatacol=\"cdNm\" combodisplay=\"display\"/><Cell col=\"8\" edittype=\"normal\" text=\"bind:sortOdr\" combodisplay=\"edit\"/><Cell col=\"9\" displaytype=\"combo\" edittype=\"combo\" text=\"bind:useYn\" combodataset=\"dsYn\" combocodecol=\"cd\" combodatacol=\"cdNm\" combodisplaynulltext=\"bind:useYn\" combodisplay=\"display\"/><Cell col=\"10\" displaytype=\"normal\" text=\"bind:regId\"/><Cell col=\"11\" displaytype=\"date\" text=\"bind:regDt\" mask=\"yyyy-MM-dd\" calendardisplaynulltype=\"none\"/><Cell col=\"12\" text=\"bind:chgId\"/><Cell col=\"13\" displaytype=\"date\" text=\"bind:chgDt\" mask=\"yyyy-MM-dd\" calendardisplaynulltype=\"none\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Div("div_grid_top", "absolute", "10", "55", null, "23", "-10", null, this);
            obj.set_taborder("3");
            obj.set_scrollbars("none");
            this.addChild(obj.name, obj);

            obj = new Grid("grdTree", "absolute", "0", "86", "300", "410", null, null, this);
            obj.set_taborder("2");
            obj.set_binddataset("dsTreeList");
            obj.set_treeuseline("true");
            obj.set_treeusecheckbox("false");
            obj.set_treeinitstatus("expand,all");
            obj.set_scrollpixel("default");
            obj.set_autofittype("col");
            obj.set_treeusebutton("use");
            obj.style.set_treeopenbuttonimage("URL('theme://images/ico_WF_treeexpand.png')");
            obj.style.set_treeclosebuttonimage("URL('theme://images/ico_WF_treecollapse.png')");
            obj.style.set_treecollapseimage("URL('theme://images/ico_WF_treeopen.png')");
            obj.style.set_treeexpandimage("URL('theme://images/ico_WF_treehide.png')");
            obj.style.set_treeitemimage("URL('theme://images/ico_treeitem.png')");
            obj.style.set_treelinetype("1px solid #afafafff");
            obj.style.set_cursor("hand");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"209\"/></Columns><Rows><Row size=\"30\"/></Rows><Band id=\"body\"><Cell displaytype=\"tree\" edittype=\"tree\" style=\"line: ;\" text=\"bind:menuNm\" expandshow=\"hide\" treestartlevel=\"0\" treelevel=\"bind:menuLvl\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "0", "0", null, "45", "25", null, this);
            obj.set_taborder("5");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_searchCondition", "absolute", "20", "0", "90", "41", null, null, this.div_search);
            obj.set_taborder("24");
            obj.set_text("검색");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cmb_searchCondition", "absolute", "61", "10", "140", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("25");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj.set_innerdataset("@ds_searchCond");
            obj.set_text("선택");
            obj.set_index("0");
            obj = new Edit("edt_searchKeyword", "absolute", "206", "10", "260", "21", null, null, this.div_search);
            obj.set_taborder("26");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "1122", "0", "25", "496", null, null, this);
            obj.set_taborder("6");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "45", "1122", "20", null, null, this);
            obj.set_taborder("7");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static24", "absolute", "468", "0", null, "44", "649", null, this);
            obj.set_taborder("8");
            obj.set_text("FIX \r\nw30");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static22", "absolute", "1", "0", null, "12", "430", null, this);
            obj.set_taborder("9");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static23", "absolute", "1", "33", null, "12", "430", null, this);
            obj.set_taborder("10");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "0", "0", "20", "45", null, null, this);
            obj.set_taborder("11");
            obj.set_text("FIX \r\nw20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "299", "86", "20", "410", null, null, this);
            obj.set_taborder("12");
            obj.set_text("FIX\r\nw20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "61", "241", "20", null, null, this);
            obj.set_taborder("13");
            obj.set_text("메뉴등록");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "0", "76", "1122", "10", null, null, this);
            obj.set_taborder("14");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Button("Button00", "absolute", null, "58", "45", "22", "73", null, this);
            obj.set_taborder("15");
            obj.set_text("삭제");
            obj.set_cssclass("btn_WF_module");
            obj.set_visible("true");
            this.addChild(obj.name, obj);

            obj = new Button("Button37", "absolute", null, "58", "45", "22", "25", null, this);
            obj.set_taborder("16");
            obj.set_text("추가");
            obj.set_cssclass("btn_WF_module");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 0, 23, this.div_grid_top,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("3");
            		p.set_scrollbars("none");

            	}
            );
            this.div_grid_top.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 0, 45, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("5");
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
            		p.set_classname("Authority");
            		p.getSetter("inheritanceid").set("");
            		p.set_titletext("메뉴등록");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCMMenu.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCMMenu.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분 : 메뉴등록
         * 02. 그룹명   : RTCMMenu.xfdl
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

        var searchWord;			//검색단어
        var searchCond;			//검색조건
        this.resultCnt = "";	//중복메뉴카운트
        this.chkMenuCd = "";	//중복메뉴코드
        var uprMenuCd;			//상위메뉴코드
        var nExistRow; 			//중복체크ROW
        var nRowPos; 			//트리메뉴 포지션
        this.nRowCnt  = "";
        /***********************************************************************
         * 그룹 변수 선언부
         ************************************************************************/
             
        	this.form_onload = function(obj,e){
        		Ex.core.init(obj); 	
        		this.fn_getTreeMenuList();
        		this.parent.setButton("E|C|S", this);
        	} 
        	 
         

        	/***********************************************************************************
        	* Transaction Function
        	***********************************************************************************/
            //-------------------------------------------------------------------------------  	
        	//TREE메뉴 조회
            //-------------------------------------------------------------------------------  	
        	this.fn_getTreeMenuList = function() {
        		var sSvcID      	= "listTreeMenu";  
        		var sController   	= "ntrms/cm/listTreeMenu.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "dsTreeList=output ds_searchCond=output2 dsMdlCode=output3 dsYn=output4";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        	}
            //-------------------------------------------------------------------------------  		
        	//목록조회 Search
            //-------------------------------------------------------------------------------  	
        	this.fn_search = function()
        	{
        		var sSvcID        	= "listMenu";                    
        		var sController   	= "ntrms/cm/listMenu.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "dsList=output";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		searchWord  = this.div_search.edt_searchKeyword.value;
        		searchCond  = this.div_search.cmb_searchCondition.value;

        		if (searchCond == "MENU_CD")
        		{
        			sArgs += Ex.util.setParam("menuCd", searchWord);
        			sArgs += Ex.util.setParam("uprMenuCd", "");
        		}
        		else if (searchCond == "MENU_NM")
        		{
        			sArgs += Ex.util.setParam("menuNm",searchWord);
        			sArgs += Ex.util.setParam("uprMenuCd", "");
        		}
        		else {
        			this.alert("검색조건을 선택하세요.");
        			this.div_search.cmb_searchCondition.setFocus();
        			return;
        		}
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        	}
            //-------------------------------------------------------------------------------  
        	//서브메뉴리스트 조회
            //-------------------------------------------------------------------------------  	
        	this.fn_getSubMenuList = function(nRowPos) {
        		
        		this.dsList.clearData();
        		uprMenuCd  = this.dsTreeList.getColumn(nRowPos, "menuCd");
        		
        		var sSvcID        	= "listMenu";                    
        		var sController   	= "ntrms/cm/listMenu.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "dsList=output";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		sArgs += Ex.util.setParam("uprMenuCd",uprMenuCd);
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 		
        	}	
            //-------------------------------------------------------------------------------  	
        	//저장
            //-------------------------------------------------------------------------------  	
            this.fn_save = function()
        	{
        		var cnt = 0;
        		var menuListSeviceCnt = this.dsList.getRowCount();
        		for( var i = 0 ; i < menuListSeviceCnt ; i++ ){
        			var iRowType = this.dsList.getRowType(i);		
        			if( iRowType == 2 || iRowType == 4 || iRowType == 8 ){ //2:Insert, 4:Update, 8:Delete
        				cnt++;
        			}
        		}
        		if(nvl(cnt) != 0){
        			if(this.fn_validCheck()) {	
        				var sSvcID        	= "saveMenuInfo";                    
        				var sController   	= "ntrms/cm/saveMenuInfo.do";
        				var sInDatasets   	= "";
        				var sOutDatasets  	= "";
        				var sArgs 			= "";	
        				sInDatasets   		= "input=dsList:U";
        				sOutDatasets  		= "";
        				var fn_callBack		= "fn_callBack";
        				Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        			}
        		}else{
        				alert("변경된 데이터가 없습니다!");
        				return false;
        		     }
        	}

        // 	this.fn_save = function()
        // 	{
        // 		if(this.fn_validCheck()) {	
        // 			var sSvcID        	= "saveMenuInfo";                    
        // 			var sController   	= "ntrms/cm/saveMenuInfo.do";
        // 			var sInDatasets   	= "";
        // 			var sOutDatasets  	= "";
        // 			var sArgs 			= "";	
        // 			sInDatasets   		= "input=dsList:U";
        // 			sOutDatasets  		= "";
        // 			var fn_callBack		= "fn_callBack";
        // 			Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        // 		}
        // 	}
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
        			case "listTreeMenu":
        				this.dsTreeList.set_rowposition(nRowPos)
        				this.fn_getSubMenuList(nRowPos);			
        				break;
        			case "listMenu":
        				//this.grd_Group.set_scrollbars("autoboth");
        				this.nRowCnt = this.dsList.rowcount;
        				if(this.dsList.rowcount == 0)
        				{
        					this.grdList.set_nodatatext("조회된 데이터가 없습니다.");
        					return;
        				}
        				break;
        			case "saveMenuInfo":
        				Ex.core.comMsg("alert",strErrorMsg);
        				this.fn_getTreeMenuList();			
        				break;			
        			case "menuCdExists":
        				var msg = "";
        				if(this.resultCnt > 0) {
        					msg = '입력하신 메뉴코드\'' + this.chkMenuCd + '\'는 존재하고 있습니다.';
        			
        					Ex.core.showMsg(this, "alert", "_alert1", msg, "information");
        					this.dsList.setColumn(nExistRow,"menuCd", "");
        				} 		
        				break;						
        			default:
        				break;
        		}
        	}
        	/***********************************************************************************
        	* Component Event
        	***********************************************************************************/
            //-------------------------------------------------------------------------------  
        	// 추가 버튼 클릭시 이벤트 처리
            //-------------------------------------------------------------------------------  	
        	this.fn_add = function(obj,e)
        	{
        		var nRow = this.dsList.addRow();		
        	
        		var sUprMenuCd = this.dsTreeList.getColumn(this.dsTreeList.rowposition, "menuCd");
        		var sUprMenuNm = this.dsTreeList.getColumn(this.dsTreeList.rowposition, "menuNm");
        		var nMenuLvl   = this.dsTreeList.getColumn(this.dsTreeList.rowposition, "menuLvl");
        		var sMdlCd     = this.dsTreeList.getColumn(this.dsTreeList.rowposition, "mdlCd");

        		this.dsList.setColumn(nRow,"uprMenuCd", sUprMenuCd);
        		this.dsList.setColumn(nRow,"uprMenuNm", sUprMenuNm);
        		this.dsList.setColumn(nRow,"menuLvl"  , nMenuLvl+1);	
        		//this.dsList.setColumn(nRow,"mdlCd"  , this.dsMdlCode.getColumn(0,"cd"));		
        		this.dsList.setColumn(nRow,"mdlCd"  , sMdlCd);		
        		this.dsList.setColumn(nRow,"useYn"  , "Y");					
        	}
            //-------------------------------------------------------------------------------  
        	//삭제 버튼 클릭시 이벤트 처리
            //-------------------------------------------------------------------------------  	
        	this.fn_delete = function(obj,e)
        	{
        		var nRow = this.dsList.rowposition;
        		if(nRow >= this.nRowCnt) {
        			this.dsList.deleteRow(nRow);
        		}
        	}
            //-------------------------------------------------------------------------------  
        	//검색 시 Enter키 이벤트 처리
            //-------------------------------------------------------------------------------  	
        	this.div_search_edt_searchKeyword_onkeyup = function(obj,e)
        	{
        		if ( e.keycode == 13 )
        		{
        			this.fn_search();
        		}
        	}
            //-------------------------------------------------------------------------------  
        	//grdTree_cantreestatuschange 이벤트 처리
            //-------------------------------------------------------------------------------  		
        	this.grdTree_cantreestatuschange = function(obj,e)
        	{
        		this.treeStatus = 1;
        	}
            //-------------------------------------------------------------------------------  	
        	//그리드 트리 클릭
            //-------------------------------------------------------------------------------  	
        	this.grdTree_oncellclick = function(obj,e)
        	{
        		//저장후 선택할 트리메뉴 rowposition 세팅
        		nRowPos = this.dsTreeList.rowposition;
        		this.fn_getSubMenuList(nRowPos);		
        	}
            //-------------------------------------------------------------------------------  	
        	// dsList_oncolumnchanged 이벤트
            //-------------------------------------------------------------------------------  
            /*
        	this.dsList_oncolumnchanged = function(obj:Dataset, e:nexacro.DSColChangeEventInfo)
        	{
        			if(e.columnid == "menuCd") {
        				nExistRow = e.row;
        				this.fn_menuCd_exists(obj.getColumn(e.row, "menuCd"));
        			}		
        	}	
        	*/
            //-------------------------------------------------------------------------------  	
        	// dsList_cancolumnchange 이벤트
            //-------------------------------------------------------------------------------  	
        	this.dsList_cancolumnchange = function(obj,e)
        	{
        		if(e.columnid == "menuCd"){
        			//alert(e.newvalue);
        			for(var i=0; i<this.dsList.rowcount; i++) {
        				var nIdx = this.dsList.findRowExpr("menuCd == '"+ e.newvalue + "' && currow != "+e.row+"");
        				if (nIdx > -1){
        					application.alert("입력하신 메뉴코드 '"+ e.newvalue + "' 이 중복되었습니다.");
        					 return false;
        				}			
        			}
        		}
        	}
        	
        	/***********************************************************************************
        	* User Function
        	***********************************************************************************/
            //-------------------------------------------------------------------------------  	
        	//엑셀저장
            //-------------------------------------------------------------------------------  		
        	this.fn_excel = function(obj,e)
        	{
        		//Ex.core.exportExcel(this, this.grdList);	
        		var objArray1 = new Array();
        		objArray1.push(this.grdTree);
        		objArray1.push(this.grdList);
        		Ex.core.exportExcel(this, objArray1);
        	}
            //-------------------------------------------------------------------------------  	
        	//메뉴코드 중복확인
            //-------------------------------------------------------------------------------  		
        	this.fn_menuCd_exists = function(objVal)
        	{
        		var sSvcID        	= "menuCdExists";                    
        		var sController   	= "ntrms/cm/checkMenuCdExists.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";
        		var sMenuCd			= objVal;
        		sArgs += Ex.util.setParam("menuCd",sMenuCd);
        		sInDatasets   		= "";
        		sOutDatasets  		= "";
        		var fn_callBack		= "fn_callBack";
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
            //-------------------------------------------------------------------------------  		
        	//VALID 체크
            //-------------------------------------------------------------------------------  		
        	this.fn_validCheck = function() {

        		this.grdList.set_autoenter("select");
        		this.grdList.showEditor(true);
        			
        		for(var i = 0; i < this.dsList.rowcount; i++) {
        			this.dsList.set_rowposition(i);		
        			if(nvl(this.dsList.getColumn(i,"menuCd")) == "") {
        				alert("메뉴코드를 입력하세요");
        	
        				this.grdList.setCellPos(1);
        				return false;
        			}
        			if(nvl(this.dsList.getColumn(i,"menuNm")) == "") {
        				alert("메뉴명을 입력하세요");
        				this.grdList.setCellPos(2);				
        				return false;
        			}	
        			if(nvl(this.dsList.getColumn(i,"menuLvl")) == "") {
        				alert("메뉴레벨을 입력하세요");
        				this.grdList.setCellPos(3);				
        				return false;
        			}	
        			if(nvl(this.dsList.getColumn(i,"mdlCd")) == "") {
        				alert("모듈명을 선택하세요");
        				this.grdList.setCellPos(7);				
        				return false;
        			}								
        		}	
        		return true;
        	}
        	
        	
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.dsList.addEventHandler("cancolumnchange", this.dsList_cancolumnchange, this);
            this.addEventHandler("ontimer", this.form_ontimer, this);
            this.addEventHandler("onload", this.form_onload, this);
            this.grdTree.addEventHandler("cantreestatuschange", this.grdTree_cantreestatuschange, this);
            this.grdTree.addEventHandler("oncellclick", this.grdTree_oncellclick, this);
            this.grdTree.addEventHandler("onselectchanged", this.grdTree_oncellclick, this);
            this.div_search.edt_searchKeyword.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.Static00.addEventHandler("onclick", this.Static00_onclick, this);
            this.Button00.addEventHandler("onclick", this.fn_delete, this);
            this.Button37.addEventHandler("onclick", this.fn_add, this);

        };

        this.loadIncludeScript("RTCMMenu.xfdl");

       
    };
}
)();
