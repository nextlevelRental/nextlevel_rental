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
                this.set_titletext("메뉴-프로그램 연동 등록");
                this.set_visible("false");
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
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cd\">-1</Col><Col id=\"cdNm\">선택</Col></Row></Rows>");
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
            obj._setContents("<ColumnInfo><Column id=\"선택\" type=\"STRING\" size=\"256\"/><Column id=\"menuCd\" type=\"STRING\" size=\"256\"/><Column id=\"menuNm\" type=\"STRING\" size=\"256\"/><Column id=\"menuLvl\" type=\"STRING\" size=\"256\"/><Column id=\"uprMenuCd\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"menuDesc\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
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

            obj = new Dataset("dsAuthNot", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"check\" type=\"STRING\" size=\"256\"/><Column id=\"prgmCd\" type=\"STRING\" size=\"256\"/><Column id=\"prgmNm\" type=\"STRING\" size=\"256\"/><Column id=\"prgmDesc\" type=\"STRING\" size=\"256\"/><Column id=\"mdlCd\" type=\"STRING\" size=\"256\"/><Column id=\"mdlNm\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsAuth", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"check\" type=\"STRING\" size=\"256\"/><Column id=\"prgmCd\" type=\"STRING\" size=\"256\"/><Column id=\"sortOdr\" type=\"INT\" size=\"256\"/><Column id=\"prgmNm\" type=\"STRING\" size=\"256\"/><Column id=\"prgmDesc\" type=\"STRING\" size=\"256\"/><Column id=\"mdlCd\" type=\"STRING\" size=\"256\"/><Column id=\"mdlNm\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsPro", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Grid("Grid01", "absolute", "319", "86", null, "180", "25", null, this);
            obj.set_taborder("44");
            obj.set_binddataset("dsAuth");
            obj.set_autofittype("col");
            obj.set_nodatatext("데이터가 없습니다.");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"40\"/><Column size=\"139\"/><Column size=\"60\"/><Column size=\"154\"/><Column size=\"136\"/><Column size=\"111\"/><Column size=\"68\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\"/><Cell col=\"1\" text=\"프로그램 코드\"/><Cell col=\"2\" text=\"정렬코드\"/><Cell col=\"3\" text=\"프로그램명\"/><Cell col=\"4\" text=\"프로그램 설명\"/><Cell col=\"5\" text=\"모듈명\"/><Cell col=\"6\" text=\"사용여부\"/></Band><Band id=\"body\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\" text=\"bind:check\"/><Cell col=\"1\" text=\"bind:prgmCd\"/><Cell col=\"2\" displaytype=\"text\" edittype=\"text\" text=\"bind:sortOdr\"/><Cell col=\"3\" text=\"bind:prgmNm\"/><Cell col=\"4\" text=\"bind:prgmDesc\"/><Cell col=\"5\" text=\"bind:mdlNm\"/><Cell col=\"6\" text=\"bind:useYn\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "1122", "0", "25", "496", null, null, this);
            obj.set_taborder("35");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "45", "1122", "20", null, null, this);
            obj.set_taborder("36");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "318", "61", "300", "20", null, null, this);
            obj.set_taborder("37");
            obj.set_text("권한그룹별 프로그램");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "319", "76", "802", "10", null, null, this);
            obj.set_taborder("38");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static07", "absolute", "319", "266", "803", "20", null, null, this);
            obj.set_taborder("39");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "318", "282", "69", "20", null, null, this);
            obj.set_taborder("40");
            obj.set_text("검색");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static08", "absolute", "319", "297", "803", "10", null, null, this);
            obj.set_taborder("41");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static09", "absolute", "299", "65", "20", "431", null, null, this);
            obj.set_taborder("42");
            obj.set_text("FIX\r\nw20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("st_BG", "absolute", "10", "0", null, "40", "-10", null, this);
            obj.set_cssclass("sta_WF_SearchBox");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "0", "0", null, "45", "25", null, this);
            obj.set_taborder("19");
            obj.set_cssclass("div_WF_searchBg");
            obj.set_scrollbars("none");
            obj.set_visible("true");
            this.addChild(obj.name, obj);

            obj = new Grid("grdTree", "absolute", "0", "65", "300", "431", null, null, this);
            obj.set_taborder("24");
            obj.set_binddataset("dsTreeList");
            obj.set_treeuseline("true");
            obj.set_treeusecheckbox("false");
            obj.set_treeinitstatus("expand,all");
            obj.style.set_treeopenbuttonimage("URL('theme://images/ico_WF_treeexpand.png')");
            obj.style.set_treeclosebuttonimage("URL('theme://images/ico_WF_treecollapse.png')");
            obj.style.set_treecollapseimage("URL('theme://images/ico_WF_treeopen.png')");
            obj.style.set_treeexpandimage("URL('theme://images/ico_WF_treehide.png')");
            obj.style.set_treeitemimage("URL('theme://images/ico_treeitem.png')");
            obj.style.set_treelinetype("1px solid #afafafff");
            obj.style.set_cursor("hand");
            obj.set_scrollpixel("default");
            obj.set_autofittype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"209\"/></Columns><Rows><Row size=\"24\"/></Rows><Band id=\"body\"><Cell displaytype=\"tree\" edittype=\"tree\" style=\"line: ;\" text=\"bind:menuNm\" expandshow=\"hide\" treestartlevel=\"0\" treelevel=\"bind:menuLvl\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Combo("cmb_searchCondition", "absolute", "391", "280", "113", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("27");
            obj.set_value("0");
            obj.set_text("선택");
            obj.set_innerdataset("@dsPro");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj.set_index("0");

            obj = new Edit("edt_searchKeyword", "absolute", null, "280", "149", "21", "489", null, this);
            obj.set_taborder("28");
            this.addChild(obj.name, obj);

            obj = new Button("btn_search2", "absolute", "668", "280", "45", "22", null, null, this);
            obj.set_taborder("29");
            obj.set_text("조회");
            obj.set_cssclass("btn_WF_module");
            this.addChild(obj.name, obj);

            obj = new Button("Button00", "absolute", null, "279", "22", "22", "54", null, this);
            obj.set_taborder("30");
            obj.style.set_font("11 Verdana");
            obj.set_cssclass("btn_WF_suttleT");
            this.addChild(obj.name, obj);

            obj = new Button("Button01", "absolute", null, "279", "22", "22", "29", null, this);
            obj.set_taborder("31");
            obj.style.set_font("11 Verdana");
            obj.set_cssclass("btn_WF_suttleB");
            this.addChild(obj.name, obj);

            obj = new Grid("Grid00", "absolute", "318", "307", null, "189", "25", null, this);
            obj.set_taborder("43");
            obj.set_binddataset("dsAuthNot");
            obj.set_autofittype("col");
            obj.set_nodatatext("데이터가 없습니다.");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"40\"/><Column size=\"139\"/><Column size=\"154\"/><Column size=\"136\"/><Column size=\"111\"/><Column size=\"68\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\"/><Cell col=\"1\" text=\"프로그램 코드\"/><Cell col=\"2\" text=\"프로그램명\"/><Cell col=\"3\" text=\"프로그램 설명\"/><Cell col=\"4\" text=\"모듈명\"/><Cell col=\"5\" text=\"사용유무\"/></Band><Band id=\"body\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\" text=\"bind:check\"/><Cell col=\"1\" text=\"bind:prgmCd\"/><Cell col=\"2\" text=\"bind:prgmNm\"/><Cell col=\"3\" text=\"bind:prgmDesc\"/><Cell col=\"4\" text=\"bind:mdlNm\"/><Cell col=\"5\" text=\"bind:useYn\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 0, 45, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("19");
            		p.set_cssclass("div_WF_searchBg");
            		p.set_scrollbars("none");
            		p.set_visible("true");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1147, 496, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("Authority");
            		p.getSetter("inheritanceid").set("");
            		p.set_titletext("메뉴-프로그램 연동 등록");
            		p.set_visible("false");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCMMenuProReg.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCMMenuProReg.xfdl", function() {
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

        var searchWord;	//검색단어
        var searchCond;	//검색조건
        this.resultCnt = "";	//중복메뉴카운트
        this.chkMenuCd = "";	//중복메뉴코드
        var uprMenuCd;	//상위메뉴코드
        var nExistRow; 	//중복체크ROW
        /***********************************************************************
         * 그룹 변수 선언부
         ************************************************************************/
             
        	this.form_onload = function(obj,e){
        		Ex.core.init(obj); 	
        		this.fn_getTreeMenuList();
        		this.parent.setButton("E|C", this);
        	} 
        	 
         

        	/***********************************************************************************
        	* Transaction Function
        	***********************************************************************************/
        	//TREE메뉴 조회
        	this.fn_getTreeMenuList = function() {
        		var sSvcID      	= "listTreeMenuPro";  
        		var sController   	= "/ntrms/cm/listTreeMenuPro.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "dsTreeList=output dsPro=output2";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        	}
        		
        	//목록조회 Search
        	this.fn_search = function()
        	{
        		var sSvcID        	= "listMenu";                    
        		var sController   	= "/ntrms/cm/listMenu.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "dsList=output dsPro=output2";
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

        	//서브메뉴리스트 조회
        	this.fn_getSubMenuList = function() {
        		
        		uprMenuCd  = this.dsTreeList.getColumn(this.dsTreeList.rowposition, "menuCd");
        		
        		var sSvcID        	= "listMenu";               
        		var sController   	= "/ntrms/cm/listMenuPro.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "dsList=output dsAuth=output2 dsAuthNot=output3";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		
        		sArgs += Ex.util.setParam("uprMenuCd",uprMenuCd);
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 		
        	}	

        	//저장..
        		this.fn_save = function(obj,e)
        		{
        		var cnt = 0;
        		var menuListSeviceCnt = this.dsAuth.getRowCount();
        		for( var i = 0 ; i < menuListSeviceCnt ; i++ ){
        			var iRowType = this.dsAuth.getRowType(i);		
        			if( iRowType == 2 || iRowType == 4 || iRowType == 8 ){ //2:Insert, 4:Update, 8:Delete
        				cnt++;
        			}
        		}
        		if(nvl(cnt) != 0){
        			rnum = this.dsList.rowposition;
        			menuCd  = this.dsTreeList.getColumn(this.dsTreeList.rowposition, "menuCd");
        			
        			var sSvcID        	= "saveData";                    
        			var sController   	= "/ntrms/cm/menuProSaveDaset.do";
        			var sInDatasets   	= "input=dsAuth:U";
        			var sOutDatasets  	= "";
        			var sArgs 			= "menuCd=" + menuCd;
        			var fn_callBack		= "fn_callBack";
        			/*
        			for(var i=0; i < this.dsAuth.getRowCount(); i++) {
        				alert(this.dsAuth.getRowType(i));
        			}
        			
        			if() {
        				sInDatasets   		= "input=dsAuth:U";
        			} else {
        				sInDatasets   		= "input=dsUser:U";
        			}
        			*/
        			sOutDatasets  		= "";
        			Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        			}else{
        				  alert("변경된 데이터가 없습니다!");
        				  return false;
        		         }
        	}
        // 	this.fn_save = function(obj:Button,  e:nexacro.ClickEventInfo)
        // 	{
        // 		rnum = this.dsList.rowposition;
        // 		menuCd  = this.dsTreeList.getColumn(this.dsTreeList.rowposition, "menuCd");
        // 		
        // 		var sSvcID        	= "saveData";                    
        // 		var sController   	= "/ntrms/cm/menuProSaveDaset.do";
        // 		var sInDatasets   	= "input=dsAuth:U";
        // 		var sOutDatasets  	= "";
        // 		var sArgs 			= "menuCd=" + menuCd;
        // 		var fn_callBack		= "fn_callBack";
        // 		/*
        // 		for(var i=0; i < this.dsAuth.getRowCount(); i++) {
        // 			alert(this.dsAuth.getRowType(i));
        // 		}
        // 		
        // 		if() {
        // 			sInDatasets   		= "input=dsAuth:U";
        // 		} else {
        // 			sInDatasets   		= "input=dsUser:U";
        // 		}
        // 		*/
        // 		sOutDatasets  		= "";
        // 		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        // 	}
        	/***********************************************************************************
        	* CallBack Event (strSvcId - Sevice ID, nErrorCode - ErrorCode, strErrorMsg - Error Message)
        	***********************************************************************************/

        	/* callBack함수 */
        	this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg,resultCnt,chkMenuCd)
        	{ 
        		if (nErrorCode < 0) 
        		{
        			alert(strErrorMsg);		
        		} else {
        		
        			if (strSvcId == "listTreeMenuPro") 
        			{
        				this.fn_getSubMenuList();
        				//this.fn_search_post();
        				//this.grd_Group.set_scrollbars("autoboth");
        			}
        		
        			if(strSvcId == "listMenu") 
        			{
        				this.fn_search_post();
        				this.grd_Group.set_scrollbars("autoboth");	
        			}
        		
        			if (strSvcId == "saveData") 
        			{
        				this.grdTree_oncellclick();
        				alert(strErrorMsg);
        				
        			}
        		}
        	}

        	/***********************************************************************************
        	* Component Event
        	***********************************************************************************/

        	// 추가 버튼 클릭시 이벤트 처리
        	this.fn_add = function(obj,e)
        	{

        		if(this.dsList.getRowCount() == 0) {
        			//this.fn_addColumnInfo();
        		}
        		var nRow = this.dsList.addRow();		
        	
        		var sUprMenuCd = this.dsTreeList.getColumn(this.dsTreeList.rowposition, "menuCd");
        		var sUprMenuNm = this.dsTreeList.getColumn(this.dsTreeList.rowposition, "menuNm");
        		var nMenuLvl   = this.dsTreeList.getColumn(this.dsTreeList.rowposition, "menuLvl");

        		this.dsList.setColumn(nRow,"uprMenuCd", sUprMenuCd);
        		this.dsList.setColumn(nRow,"uprMenuNm", sUprMenuNm);
        		this.dsList.setColumn(nRow,"menuLvl"  , nMenuLvl+1);		
        		this.dsList.setColumn(nRow,"useYn"  , "Y");		
        	}

        	//삭제 버튼 클릭시 이벤트 처리
        	this.fn_delete = function(obj,e)
        	{
        		var nRow = this.dsList.rowposition;
        		this.dsList.deleteRow(nRow);
        	}

        	/***********************************************************************************
        	* User Function
        	***********************************************************************************/

        	this.fn_addColumnInfo = function() 
        	{
        			var o_cinfo =  new ColumnInfo();		
        			o_cinfo.set_type("STRING");
        			o_cinfo.set_size("256");
         		
        			this.dsList.addColumnInfo("선택" ,o_cinfo);
        			this.dsList.addColumnInfo("menuCd" ,o_cinfo);
        			this.dsList.addColumnInfo("menuNm" ,o_cinfo);
        			this.dsList.addColumnInfo("menuLvl" ,o_cinfo);
        			this.dsList.addColumnInfo("uprMenuCd" ,o_cinfo);
        			this.dsList.addColumnInfo("uprMenuNm" ,o_cinfo);
        			this.dsList.addColumnInfo("mdlCd" ,o_cinfo);
        			this.dsList.addColumnInfo("useYn" ,o_cinfo);
        			this.dsList.addColumnInfo("menuDesc" ,o_cinfo);
        			this.dsList.addColumnInfo("sortOdr" ,o_cinfo);
        			this.dsList.addColumnInfo("regId" ,o_cinfo);
        			this.dsList.addColumnInfo("regDt" ,o_cinfo);
        			this.dsList.addColumnInfo("chgId" ,o_cinfo);			
        			this.dsList.addColumnInfo("chgDt" ,o_cinfo);													
        		
        	}
        	//조회 후처리
        	this.fn_search_post = function()
        	{
        		var nTotalCnt = this.dsList.rowcount;
        		//this.div_grid_top.sta_total_cnt.set_text(nTotalCnt);
        		//alert(this.grdList.hscrollbar);
        		this.grdTree.hscrollbar;
        	}

        	//팝업 후처리 작업
        	this.fn_popupAfter = function(sPopupId,val)
        	{

        	}

        	//페이징 후처리 작업
        	this.fn_pageAfter = function(sObjId,nViewPage)
        	{
         
        	}

        	this.grdTree_cantreestatuschange = function(obj,e)
        	{
        		this.treeStatus = 1;
        	}

        	//그리드 트리 클릭시
        	this.grdTree_oncellclick = function(obj,e)
        	{
        		//trace(e.canvasX);
        		this.fn_getSubMenuList();
        		/*
        		var objDs = this[obj.binddataset];
        		if (this.treeStatus == 1){
        			this.treeStatus = 0;
        			return;
        		}

        		var childRow = obj.getTreeChildRow(objDs.rowposition, 0, true);

        		// 자식 노드가 존재할 경우
        		if (childRow >= 0) 
        		{
        			var gridRow = obj.getTreeRow(objDs.rowposition);
        			if (obj.isTreeCollapsedRow(childRow, true)) 
        			{
        				obj.setTreeStatus(gridRow, true);
        			}
        			else 
        			{
        				obj.setTreeStatus(gridRow, false);
        			}
        		}
        		this.treeStatus = 0;	
        		*/

        	}
        	
        	//엑셀저장
        	this.fn_excel = function(obj,e)
        	{
        		Ex.core.exportExcel(this, this.grdList, "메뉴등록");
        	}
        	
        	//VALID 체크
        	this.fn_validCheck = function() {

        		this.grdList.set_autoenter("select");
        		this.grdList.showEditor(true);
        		//this.dsList.set_rowposition(this.dsList.getRowCount()-1);						
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

        	this.dsList_oncolumnchanged = function(obj,e)
        	{
        			if(e.columnid == "menuCd") {
        				nExistRow = e.row;
        				this.fn_menuCd_exists(obj.getColumn(e.row, "menuCd"));
        			}		
        	}
        	
        //조회버튼
        this.btn_search2_onclick = function(obj,e)
        {
        	rnum = this.dsList.rowposition;
        	checkAuthMenuCd  = this.dsList.getColumn(rnum, "authGrpCd");
        	var sSvcID        	= "authNotService";                    
        	var sController   	= "/ntrms/cm/authNotInfo.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "dsAuthNot=output";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	uprMenuCd  = this.dsTreeList.getColumn(this.dsTreeList.rowposition, "menuCd");
        	
        	if(this.cmb_searchCondition.value == "PRGM_CD"){
        		if(this.edt_searchKeyword.getLength() == 0) {
        			alert("프로그램 코드를 입력해주세요");
        			this.cmb_searchCondition.setFocus();
        			return false;
        		} else {
        			sArgs = "prgmCd=" + nvl(this.edt_searchKeyword.value)+" menuCd=" + uprMenuCd;;
        		}
        	} else if(this.cmb_searchCondition.value == "PRGM_NM") {
        		if(this.edt_searchKeyword.getLength() < 2) {
        			alert("2자이상 입력해주세요")
        			this.edt_searchKeyword.setFocus();
        			return false;
        		} else {
        			sArgs = "prgmNm=" + nvl(this.edt_searchKeyword.value)+" menuCd=" + uprMenuCd;;
        		}
        	} else {
        		alert("검색조건을 선택해주세요.");
        		return false;
        	}
        	this.dsAuthNot.clearData();
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        //위 버튼
        this.Button00_onclick = function(obj,e)
        {
        	var cnt = this.dsAuthNot.rowcount;
        	var checkCnt = 0;
        	
        	for(var i = cnt; i >=0; i--) {
        		if(this.dsAuthNot.getColumn(i, "check")  == "1") {
        			var prgmCd = this.dsAuthNot.getColumn(i, "prgmCd");
        			var sortOdr = 0;
        			var prgmNm = this.dsAuthNot.getColumn(i, "prgmNm");
        			var prgmDesc = this.dsAuthNot.getColumn(i, "prgmDesc");
        			var mdlNm = this.dsAuthNot.getColumn(i, "mdlNm");
        			var useYn = this.dsAuthNot.getColumn(i, "useYn");
        			
        			//로우 생성및 순번값
        			var idx = this.dsAuth.addRow();
        			
        			// 로우값 컬럼별로 세팅
        			this.dsAuth.setColumn(idx, "prgmCd" , prgmCd);
        			this.dsAuth.setColumn(idx, "sortOdr" , sortOdr);
        			this.dsAuth.setColumn(idx, "prgmNm" , prgmNm);
        			this.dsAuth.setColumn(idx, "prgmDesc" , prgmDesc);
        			this.dsAuth.setColumn(idx, "mdlNm" , mdlNm);
        			this.dsAuth.setColumn(idx, "useYn" , useYn);
        			this.dsAuthNot.deleteRow(i);
        			
        			checkCnt++;
        		}
        	}
        		
        	if(checkCnt == 0) {
        		alert("등록할 프로그램을 선택해주세요.");
        	} 
        }
        // 아래버튼

        this.Button01_onclick = function(obj,e)
        {
        	var cnt = this.dsAuth.rowcount;
        	var checkCnt = 0;
        	
        	for(var i = cnt; i >=0; i--) {
        		if(this.dsAuth.getColumn(i, "check")  == "1") {
        			var prgmCd = this.dsAuth.getColumn(i, "prgmCd");
        			var prgmNm = this.dsAuth.getColumn(i, "prgmNm");
        			var prgmDesc = this.dsAuth.getColumn(i, "prgmDesc");
        			var mdlNm = this.dsAuth.getColumn(i, "mdlNm");
        			var useYn = this.dsAuth.getColumn(i, "useYn");
        			
        			//로우 생성및 순번값
        			var idx = this.dsAuthNot.addRow();
        			
        			// 로우값 컬럼별로 세팅
        			this.dsAuthNot.setColumn(idx, "prgmCd" , prgmCd);
        			this.dsAuthNot.setColumn(idx, "prgmNm" , prgmNm);
        			this.dsAuthNot.setColumn(idx, "prgmDesc" , prgmDesc);
        			this.dsAuthNot.setColumn(idx, "mdlNm" , mdlNm);
        			this.dsAuthNot.setColumn(idx, "useYn" , useYn);
        			
        			this.dsAuth.deleteRow(i);
        			
        			checkCnt++;
        		}
        	}
        	if(checkCnt == 0) {
        		alert("삭제하실 사용자를 선택해주세요.");
        	} 
        	
        }

        
        //검색 시 Enter키 이벤트 처리
        this.div_search_edt_searchKeyword_onkeyup = function(obj,e)
        {
        	if ( e.keycode == 13 )
        	{
        		this.btn_search2_onclick();
        	}
        }

        	this.fn_excel= function() {
        		//Ex.core.exportExcel(this, this.Grid01);
        		var objArray1 = new Array();
        		objArray1.push(this.grdTree);
        		objArray1.push(this.Grid01);
        		objArray1.push(this.Grid00);
        		Ex.core.exportExcel(this, objArray1);
        	}

        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.dsList.addEventHandler("oncolumnchanged", this.dsList_oncolumnchanged, this);
            this.addEventHandler("ontimer", this.form_ontimer, this);
            this.addEventHandler("onload", this.form_onload, this);
            this.Static04.addEventHandler("onclick", this.Static00_onclick, this);
            this.Static06.addEventHandler("onclick", this.Static00_onclick, this);
            this.grdTree.addEventHandler("cantreestatuschange", this.grdTree_cantreestatuschange, this);
            this.grdTree.addEventHandler("oncellclick", this.grdTree_oncellclick, this);
            this.grdTree.addEventHandler("oncelldblclick", this.grdTree_oncelldblclick, this);
            this.edt_searchKeyword.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.btn_search2.addEventHandler("onclick", this.btn_search2_onclick, this);
            this.Button00.addEventHandler("onclick", this.Button00_onclick, this);
            this.Button01.addEventHandler("onclick", this.Button01_onclick, this);

        };

        this.loadIncludeScript("RTCMMenuProReg.xfdl");

       
    };
}
)();
