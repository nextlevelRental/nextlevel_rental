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
                this.set_name("RTCMGrpReg");
                this.set_classname("RTCMGrpReg");
                this.set_titletext("메뉴-권한그룹 연동 등록");
                this._setFormPosition(0,0,1147,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_grCb", this);
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

            obj = new Dataset("dsList", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"authGrpCd\" type=\"STRING\" size=\"256\"/><Column id=\"authGrpNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
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
            obj._setContents("<ColumnInfo><Column id=\"check\" type=\"STRING\" size=\"256\"/><Column id=\"menuCd\" type=\"STRING\" size=\"256\"/><Column id=\"menuNm\" type=\"STRING\" size=\"256\"/><Column id=\"menuLvl\" type=\"STRING\" size=\"256\"/><Column id=\"uprMenuCd\" type=\"STRING\" size=\"256\"/><Column id=\"upMenuNm\" type=\"STRING\" size=\"256\"/><Column id=\"menuDesc\" type=\"STRING\" size=\"256\"/><Column id=\"mdlNm\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsUser", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"check\" type=\"STRING\" size=\"256\"/><Column id=\"menuCd\" type=\"STRING\" size=\"256\"/><Column id=\"menuNm\" type=\"STRING\" size=\"256\"/><Column id=\"menuLvl\" type=\"STRING\" size=\"256\"/><Column id=\"uprMenuCd\" type=\"STRING\" size=\"256\"/><Column id=\"upMenuNm\" type=\"STRING\" size=\"256\"/><Column id=\"menuDesc\" type=\"STRING\" size=\"256\"/><Column id=\"mdlNm\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_grCb2", this);
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
            obj = new Static("Static06", "absolute", "318", "287", "69", "20", null, null, this);
            obj.set_taborder("18");
            obj.set_text("검색");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Button("Button02", "absolute", null, "284", "22", "22", "54", null, this);
            obj.set_taborder("22");
            obj.set_cssclass("btn_WF_suttleT");
            obj.style.set_font("11 Verdana");
            this.addChild(obj.name, obj);

            obj = new Button("Button03", "absolute", null, "284", "22", "22", "29", null, this);
            obj.set_taborder("23");
            obj.set_cssclass("btn_WF_suttleB");
            obj.style.set_font("11 Verdana");
            this.addChild(obj.name, obj);

            obj = new Static("Static07", "absolute", "318", "61", "300", "20", null, null, this);
            obj.set_taborder("24");
            obj.set_text("권한그룹별 메뉴");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "0", "0", null, "45", "25", null, this);
            obj.set_taborder("0");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_searchCondition", "absolute", "20", "10", "71", "20", null, null, this.div_search);
            obj.set_taborder("30");
            obj.set_text("권한 그룹");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cmb_searchCondition", "absolute", "93", "10", "140", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("31");
            obj.set_value("0");
            obj.set_text("선택");
            obj.set_innerdataset("@ds_grCb");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj.set_index("0");
            obj = new Edit("edt_searchKeyword", "absolute", "237", "10", "260", "21", null, null, this.div_search);
            obj.set_taborder("32");
            this.div_search.addChild(obj.name, obj);

            obj = new Div("Div01", "absolute", "318", "86", null, "180", "25", null, this);
            obj.set_taborder("2");
            obj.set_text("Div01");
            this.addChild(obj.name, obj);
            obj = new Grid("Grid00", "absolute", "0", "0", null, "180", "0", null, this.Div01);
            obj.set_taborder("0");
            obj.set_autofittype("col");
            obj.set_binddataset("dsAuth");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"30\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"90\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell edittype=\"checkbox\"/><Cell col=\"1\" text=\"메뉴코드\"/><Cell col=\"2\" text=\"메뉴 명\"/><Cell col=\"3\" text=\"메뉴레벨\"/><Cell col=\"4\" text=\"상위메뉴코드\"/><Cell col=\"5\" text=\"상위메뉴명\"/><Cell col=\"6\" text=\"메뉴설명\"/><Cell col=\"7\" text=\"모듈명\"/><Cell col=\"8\" text=\"사용유무\"/></Band><Band id=\"body\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\" text=\"bind:check\"/><Cell col=\"1\" text=\"bind:menuCd\"/><Cell col=\"2\" text=\"bind:menuNm\"/><Cell col=\"3\" text=\"bind:menuLvl\"/><Cell col=\"4\" text=\"bind:uprMenuCd\"/><Cell col=\"5\" text=\"bind:upMenuNm\"/><Cell col=\"6\" text=\"bind:menuDesc\"/><Cell col=\"7\" text=\"bind:mdlNm\"/><Cell col=\"8\" text=\"bind:useYn\"/></Band></Format></Formats>");
            this.Div01.addChild(obj.name, obj);

            obj = new Div("Div02", "absolute", "318", "307", null, "189", "25", null, this);
            obj.set_taborder("10");
            obj.set_text("Div02");
            this.addChild(obj.name, obj);
            obj = new Grid("Grid00", "absolute", "0", "8", null, "180", "0", null, this.Div02);
            obj.set_taborder("0");
            obj.set_binddataset("dsUser");
            obj.set_autofittype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"30\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"90\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell edittype=\"checkbox\"/><Cell col=\"1\" text=\"메뉴코드\"/><Cell col=\"2\" text=\"메뉴 명\"/><Cell col=\"3\" text=\"메뉴레벨\"/><Cell col=\"4\" text=\"상위메뉴코드\"/><Cell col=\"5\" text=\"상위메뉴명\"/><Cell col=\"6\" text=\"메뉴설명\"/><Cell col=\"7\" text=\"모듈명\"/><Cell col=\"8\" text=\"사용유무\"/></Band><Band id=\"body\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\" text=\"bind:check\"/><Cell col=\"1\" text=\"bind:menuCd\"/><Cell col=\"2\" text=\"bind:menuNm\"/><Cell col=\"3\" text=\"bind:menuLvl\"/><Cell col=\"4\" text=\"bind:uprMenuCd\"/><Cell col=\"5\" text=\"bind:upMenuNm\"/><Cell col=\"6\" text=\"bind:menuDesc\"/><Cell col=\"7\" text=\"bind:mdlNm\"/><Cell col=\"8\" text=\"bind:useYn\"/></Band></Format></Formats>");
            this.Div02.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "1122", "0", "25", "496", null, null, this);
            obj.set_taborder("13");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Grid("Grid00", "absolute", "0", "65", "298", "431", null, null, this);
            obj.set_taborder("16");
            obj.set_binddataset("dsList");
            obj.set_autofittype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"80\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"권한그룹코드\"/><Cell col=\"1\" text=\"권한그룹명\"/></Band><Band id=\"body\"><Cell text=\"bind:authGrpCd\"/><Cell col=\"1\" text=\"bind:authGrpNm\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Combo("cmb_searchCondition2", "absolute", "391", "285", "113", "20", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("7");
            obj.set_value("0");
            obj.set_text("선택");
            obj.set_innerdataset("@ds_grCb2");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj.set_index("0");

            obj = new Button("btn_search2", "absolute", "668", "284", "45", "21", null, null, this);
            obj.set_taborder("5");
            obj.set_text("조회");
            obj.set_cssclass("btn_WF_module");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_searchKeyword2", "absolute", "509", "285", "149", "20", null, null, this);
            obj.set_taborder("6");
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
            obj = new Layout("default", "", 714, 118, this.Div01,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("2");
            		p.set_text("Div01");

            	}
            );
            this.Div01.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 714, 118, this.Div02,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("10");
            		p.set_text("Div02");

            	}
            );
            this.Div02.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1147, 496, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCMGrpReg");
            		p.set_titletext("메뉴-권한그룹 연동 등록");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCMMenuReg.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCMMenuReg.xfdl", function() {

        
        /***********************************************************************
         * Script Include 
         ************************************************************************/
                //include "lib::comLib.xjs";

                var num;
                var cd;
                var rnum;
                var checkAuthMenuCd;
                this.form_onload = function(obj,e) //온로드시 처리작업
                	{
                		Ex.core.init(obj);
                		//this.div_search.cmb_searchCondition.set_index(0);
                		this.fn_search();
                		this.parent.setButton("C|S", this);
                	} 

                nvl = function(p_value) { //null값이 들어왔을때 공백으로 처리방법
                	var strVal = new String(p_value);
                	if(strVal == null || strVal == "null" || strVal == "undefined"){
                		return "";
                	} else {
                		return strVal.trim();
                	}
                }

                

                //권한그룹 사용자 좌측 Grid 조회
               this.fn_search = function()
                {
                	var sSvcID        	= "menuRegService";                    
                	var sController   	= "/ntrms/cm/menuRegController.do";
                	var sInDatasets   	= "";
                	var sOutDatasets  	= "dsList=output ds_grCb=output2 ds_grCb2=output3"; //output: 좌측Grid권란리스트, output2:권한그룹 combobox, output3:메뉴코드 combobox
                	var sArgs 			= "";	
                	var fn_callBack		= "fn_callBack";
                		
                	this.dsList.clearData();
                	if(this.div_search.cmb_searchCondition.value == "AUTHGRPCD"){ 
                		sArgs = "authGrpCd=" + nvl(this.div_search.edt_searchKeyword.value);
                	} else if(this.div_search.cmb_searchCondition.value == "AUTHGRPNM") {
                		if(this.div_search.edt_searchKeyword.getLength() < 2) {
                			alert("2자이상 입력해주세요")
                			return false;
                		} else {
                			sArgs = "authGrpNm=" + nvl(this.div_search.edt_searchKeyword.value);
                		}
                		
                	} else if(this.div_search.cmb_searchCondition.value == 0) {
                	
                		//alert("검색조건을 선택해주세요.");
                		//return false;
                	} else {
                		var params = "";
                	}
                	this.dsAuth.clearData(); //해당 그리드 초기화
                	this.dsUser.clearData(); //해당 그리드 초기화
                	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
                }

                //권한그룹 사용자 우측 하단 Grid 조회
                this.btn_search2_onclick = function(obj,e)
                {
                	rnum = this.dsList.rowposition;
                	checkAuthMenuCd  = this.dsList.getColumn(rnum, "authGrpCd");
                	var sSvcID        	= "menuRegService2";                    
                	var sController   	= "/ntrms/cm/menuRegController22.do";
                	var sInDatasets   	= "";
                	var sOutDatasets  	= "dsUser=output";
                	var sArgs 			= "";	
                	var fn_callBack		= "fn_callBack";
                	
                	this.dsUser.clearData();
                	
                	if(this.cmb_searchCondition2.value == "MENU_CD"){
                		if(this.edt_searchKeyword2.getLength() == 0) {
                			alert("메뉴코드를 입력해주세요");
                			return false;
                		} else {
                			sArgs = "menuCd=" + nvl(this.edt_searchKeyword2.value)+" cd=" + checkAuthMenuCd;
                		}
                	} else if(this.cmb_searchCondition2.value == "MENU_NM") {
                		if(this.edt_searchKeyword2.getLength() < 2) {
                			alert("메뉴명을 2자이상 입력해주세요")
                			return false;
                		} else {
                			sArgs = "menuNm=" + nvl(this.edt_searchKeyword2.value)+ " cd=" + checkAuthMenuCd;
                		}
                	} else {
                		alert("검색조건을 선택해주세요.");
                		return false;
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
                		
                		if (strSvcId == "searchList") 
                		{
                			var nTotalCnt = this.dsUser.rowcount;
                			//this.sta_total_cnt.set_text(nTotalCnt);
                			//this.grd_Group.hscrollbar ;
                			//alert(this.dsUser.rowcount);
                			if(nTotalCnt == 0) {
                				this.Div02.Grid00.set_nodatatext("조회된 데이터가 없습니다.");
                			}				
                		}
                		
                		if (strSvcId == "saveData") 
                		{
        					alert(strErrorMsg);
                			this.fn_search();
                		}
                		
                		if(strSvcId == "menuRegService")
                		{
                			var cd = this.dsList.getColumn( num, "authGrpCd"); //순번에 있는 authGrpCd값 세팅
                			this.dsList.set_rowposition(num); //로우 선택
                			this.searchList(cd);
                			
                			if(this.dsUser.rowcount == 0) {
                				this.Div02.Grid00.set_nodatatext("조회된 데이터가 없습니다.");
                			}	

                		}
                	}
                //저장
                 this.fn_save = function(obj,e)
                	{
                		rnum = this.dsList.rowposition;
                		checkAuthMenuCd  = this.dsList.getColumn(rnum, "authGrpCd");
                		var sSvcID        	= "saveData";                    
                		var sController   	= "/ntrms/cm/menuRegSaveDaset.do";
                		var sInDatasets   	= "input=dsAuth:U";
                		var sOutDatasets  	= "";
                		var sArgs 			= "authGrpCd=" + checkAuthMenuCd;	
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
                	}

                
                //상단검색시 Enter키 이벤트 처리
                this.div_search_edt_searchKeyword_onkeyup = function(obj,e)
                {
                	if ( e.keycode == 13 )
                	{
                		this.fn_search();
                	}
                }
                //하단검색시 Enter키 이벤트 처리
                this.div_search_edt_searchKeyword2_onkeyup = function(obj,e)
                {
                	if ( e.keycode == 13 )
                	{
                		this.btn_search2_onclick();
                	}
                }

                //상단 조회
                this.Div00_Grid00_oncellclick = function(obj,e)
                {
                	num = this.dsList.rowposition; //row 순번가져오기
                	cd = this.dsList.getColumn( num, "authGrpCd"); //순번에 있는 authGrpCd값 세팅
                	this.searchList(cd);
                }
                 
                //권한그룹 사용자 우측 상단 하단 Grid 정보 가져오기
                this.searchList = function(cd) {
                		var sSvcID        	= "searchList";                    
                		var sController   	= "/ntrms/cm/menuRegController11.do";
                		var sInDatasets   	= "";
                		
                		var sOutDatasets  	= "dsAuth=listAuth dsUser=listUser";
                		var sArgs 			= "cd="+cd;

                		var fn_callBack		= "fn_callBack";
                		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
                	}

                //위 버튼
                this.Button00_onclick = function(obj,e)
                {
                	var cnt = this.dsUser.rowcount;
                	var checkCnt = 0;
                	
                	for(var i = cnt; i >=0; i--) {
                		if(this.dsUser.getColumn(i, "check")  == "1") {
                			var menuCd = this.dsUser.getColumn(i, "menuCd");
                			var menuNm = this.dsUser.getColumn(i, "menuNm");
                			var menuLvl = this.dsUser.getColumn(i, "menuLvl");
                			var uprMenuCd = this.dsUser.getColumn(i, "uprMenuCd");
                			var upMenuNm = this.dsUser.getColumn(i, "upMenuNm");
                			var menuDesc = this.dsUser.getColumn(i, "menuDesc");
                			var mdlNm = this.dsUser.getColumn(i, "mdlNm");
                			var useYn = this.dsUser.getColumn(i, "useYn");
                			
                			//로우 생성및 순번값
                			var idx = this.dsAuth.addRow();
                			
                			// 로우값 컬럼별로 세팅
                			this.dsAuth.setColumn(idx, "menuCd" , menuCd);
                			this.dsAuth.setColumn(idx, "menuNm" , menuNm);
                			this.dsAuth.setColumn(idx, "menuLvl" , menuLvl);
                			this.dsAuth.setColumn(idx, "uprMenuCd" , uprMenuCd);
                			this.dsAuth.setColumn(idx, "upMenuNm" , upMenuNm);
                			this.dsAuth.setColumn(idx, "menuDesc" , menuDesc);
                			this.dsAuth.setColumn(idx, "mdlNm" , mdlNm);
                			this.dsAuth.setColumn(idx, "useYn" , useYn);
                			this.dsUser.deleteRow(i);
                			
                			checkCnt++;
                		}
                	}
                	if(checkCnt == 0) {
                		alert("등록하실 사용자를 선택해주세요.");
                	}
                }

                // 아래버튼

                this.Button01_onclick = function(obj,e)
                {
                	var cnt = this.dsAuth.rowcount;
                	var checkCnt = 0;
                	
                	for(var i = cnt; i >=0; i--) {
                		if(this.dsAuth.getColumn(i, "check")  == "1") {
                			var menuCd = this.dsAuth.getColumn(i, "menuCd");
                			var menuNm = this.dsAuth.getColumn(i, "menuNm");
                			var menuLvl = this.dsAuth.getColumn(i, "menuLvl");
                			var uprMenuCd = this.dsAuth.getColumn(i, "uprMenuCd");
                			var upMenuNm = this.dsAuth.getColumn(i, "upMenuNm");
                			var menuDesc = this.dsAuth.getColumn(i, "menuDesc");
                			var mdlNm = this.dsAuth.getColumn(i, "mdlNm");
                			var useYn = this.dsAuth.getColumn(i, "useYn");
                			
                			//로우 생성및 순번값
                			var idx = this.dsUser.addRow();
                			
                			// 로우값 컬럼별로 세팅
                			this.dsUser.setColumn(idx, "menuCd" , menuCd);
                			this.dsUser.setColumn(idx, "menuNm" , menuNm);
                			this.dsUser.setColumn(idx, "menuLvl" , menuLvl);
                			this.dsUser.setColumn(idx, "uprMenuCd" , uprMenuCd);
                			this.dsUser.setColumn(idx, "upMenuNm" , upMenuNm);
                			this.dsUser.setColumn(idx, "menuDesc" , menuDesc);
                			this.dsUser.setColumn(idx, "mdlNm" , mdlNm);
                			this.dsUser.setColumn(idx, "useYn" , useYn);
                			this.dsAuth.deleteRow(i);
                			
                			checkCnt++;
                		}
                	}
                	if(checkCnt == 0) {
                		alert("삭제하실 사용자를 선택해주세요.");
                	}
                }

        
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.Static06.addEventHandler("onclick", this.Static00_onclick, this);
            this.Button02.addEventHandler("onclick", this.Button00_onclick, this);
            this.Button03.addEventHandler("onclick", this.Button01_onclick, this);
            this.Static07.addEventHandler("onclick", this.Static00_onclick, this);
            this.div_search.cmb_searchCondition.addEventHandler("onitemchanged", this.div_search_cmb_searchCondition_onitemchanged, this);
            this.div_search.edt_searchKeyword.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.Grid00.addEventHandler("oncellclick", this.Div00_Grid00_oncellclick, this);
            this.btn_search2.addEventHandler("onclick", this.btn_search2_onclick, this);
            this.edt_searchKeyword2.addEventHandler("onkeyup", this.div_search_edt_searchKeyword2_onkeyup, this);

        };

        this.loadIncludeScript("RTCMMenuReg.xfdl");

       
    };
}
)();
