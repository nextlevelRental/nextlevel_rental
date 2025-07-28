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
                this.set_titletext("프로그램-권한그룹 연동 등록");
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
            obj._setContents("<ColumnInfo><Column id=\"check\" type=\"STRING\" size=\"256\"/><Column id=\"prgmCd\" type=\"STRING\" size=\"256\"/><Column id=\"prgmNm\" type=\"STRING\" size=\"256\"/><Column id=\"prgmPath\" type=\"STRING\" size=\"256\"/><Column id=\"prgmDesc\" type=\"STRING\" size=\"256\"/><Column id=\"mdlCd\" type=\"STRING\" size=\"256\"/><Column id=\"mdlNm\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"readAuthYn\" type=\"STRING\" size=\"256\"/><Column id=\"saveAuthYn\" type=\"STRING\" size=\"256\"/><Column id=\"delAuthYn\" type=\"STRING\" size=\"256\"/><Column id=\"prntAuthYn\" type=\"STRING\" size=\"256\"/><Column id=\"exptAuthYn\" type=\"STRING\" size=\"256\"/><Column id=\"chgAuthYn\" type=\"STRING\" size=\"256\"/><Column id=\"etc1AuthYn\" type=\"STRING\" size=\"256\"/><Column id=\"etc2AuthYn\" type=\"STRING\" size=\"256\"/><Column id=\"etc3AuthYn\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
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
            obj._setContents("<ColumnInfo><Column id=\"check\" type=\"STRING\" size=\"256\"/><Column id=\"prgmCd\" type=\"STRING\" size=\"256\"/><Column id=\"prgmNm\" type=\"STRING\" size=\"256\"/><Column id=\"prgmPath\" type=\"STRING\" size=\"256\"/><Column id=\"prgmDesc\" type=\"STRING\" size=\"256\"/><Column id=\"mdlCd\" type=\"STRING\" size=\"256\"/><Column id=\"mdlNm\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"authGrpCd\" type=\"STRING\" size=\"256\"/><Column id=\"readAuthYn\" type=\"STRING\" size=\"256\"/><Column id=\"saveAuthYn\" type=\"STRING\" size=\"256\"/><Column id=\"delAuthYn\" type=\"STRING\" size=\"256\"/><Column id=\"prntAuthYn\" type=\"STRING\" size=\"256\"/><Column id=\"exptAuthYn\" type=\"STRING\" size=\"256\"/><Column id=\"chgAuthYn\" type=\"STRING\" size=\"256\"/><Column id=\"etc1AuthYn\" type=\"STRING\" size=\"256\"/><Column id=\"etc2AuthYn\" type=\"STRING\" size=\"256\"/><Column id=\"etc3AuthYn\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
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

            obj = new Dataset("useYn", this);
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
            obj = new Static("Static07", "absolute", "318", "56", "300", "31", null, null, this);
            obj.set_taborder("24");
            obj.set_text("권한그룹별 프로그램");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Div("Div01", "absolute", "318", "86", null, "184", "25", null, this);
            obj.set_taborder("2");
            obj.set_text("Div01");
            this.addChild(obj.name, obj);
            obj = new Grid("Grid00", "absolute", "1", "0", null, "180", "0", null, this.Div01);
            obj.set_taborder("2");
            obj.set_binddataset("dsAuth");
            obj.set_visible("false");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"35\"/><Column size=\"100\"/><Column size=\"130\"/><Column size=\"130\"/><Column size=\"180\"/><Column size=\"60\"/><Column size=\"80\"/><Column size=\"60\"/><Column size=\"35\"/><Column size=\"35\"/><Column size=\"35\"/><Column size=\"35\"/><Column size=\"60\"/><Column size=\"60\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell edittype=\"checkbox\"/><Cell col=\"1\" text=\"프로그램 코드\"/><Cell col=\"2\" text=\"프로그램명\"/><Cell col=\"3\" text=\"프로그램 URL\"/><Cell col=\"4\" text=\"프로그램 설명\"/><Cell col=\"5\" text=\"모듈코드\"/><Cell col=\"6\" text=\"모듈명\"/><Cell col=\"7\" text=\"사용유무\"/><Cell col=\"8\" text=\"읽기\"/><Cell col=\"9\" text=\"저장\"/><Cell col=\"10\" text=\"삭제\"/><Cell col=\"11\" text=\"인쇄\"/><Cell col=\"12\" text=\"엑셀저장\"/><Cell col=\"13\" text=\"조직수정\"/><Cell col=\"14\" text=\"기타1\"/><Cell col=\"15\" text=\"기타2\"/><Cell col=\"16\" text=\"기타3\"/></Band><Band id=\"body\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\" text=\"bind:check\"/><Cell col=\"1\" text=\"bind:prgmCd\"/><Cell col=\"2\" text=\"bind:prgmNm\"/><Cell col=\"3\" text=\"bind:prgmPath\"/><Cell col=\"4\" text=\"bind:prgmDesc\"/><Cell col=\"5\" text=\"bind:mdlCd\"/><Cell col=\"6\" text=\"bind:mdlNm\"/><Cell col=\"7\" text=\"bind:useYn\"/><Cell col=\"8\" text=\"bind:readAuthYn\"/><Cell col=\"9\" text=\"bind:saveAuthYn\"/><Cell col=\"10\" text=\"bind:delAuthYn\"/><Cell col=\"11\" text=\"bind:prntAuthYn\"/><Cell col=\"12\" text=\"bind:exptAuthYn\"/><Cell col=\"13\" text=\"bind:chgAuthYn\"/><Cell col=\"14\" text=\"bind:etc1AuthYn\"/><Cell col=\"15\" text=\"bind:etc2AuthYn\"/><Cell col=\"16\" text=\"bind:etc3AuthYn\"/></Band></Format></Formats>");
            this.Div01.addChild(obj.name, obj);
            obj = new Grid("Grid01", "absolute", "1", "0", null, "180", "1", null, this.Div01);
            obj.set_taborder("3");
            obj.set_binddataset("dsAuth");
            obj.set_nodatatext("데이터가 없습니다.");
            obj.set_visible("true");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"35\"/><Column size=\"100\"/><Column size=\"130\"/><Column size=\"55\"/><Column size=\"55\"/><Column size=\"55\"/><Column size=\"55\"/><Column size=\"60\"/><Column size=\"60\"/><Column size=\"55\"/><Column size=\"55\"/><Column size=\"55\"/><Column size=\"130\"/><Column size=\"180\"/><Column size=\"60\"/><Column size=\"80\"/><Column size=\"60\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell edittype=\"checkbox\"/><Cell col=\"1\" text=\"프로그램 코드\"/><Cell col=\"2\" text=\"프로그램명\"/><Cell col=\"3\" text=\"읽기\"/><Cell col=\"4\" text=\"저장\"/><Cell col=\"5\" text=\"삭제\"/><Cell col=\"6\" text=\"인쇄\"/><Cell col=\"7\" text=\"엑셀저장\"/><Cell col=\"8\" text=\"조직수정\"/><Cell col=\"9\" text=\"기타1\"/><Cell col=\"10\" text=\"기타2\"/><Cell col=\"11\" text=\"기타3\"/><Cell col=\"12\" text=\"프로그램 URL\"/><Cell col=\"13\" text=\"프로그램 설명\"/><Cell col=\"14\" text=\"모듈코드\"/><Cell col=\"15\" text=\"모듈명\"/><Cell col=\"16\" text=\"사용유무\"/></Band><Band id=\"body\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\" text=\"bind:check\"/><Cell col=\"1\" text=\"bind:prgmCd\"/><Cell col=\"2\" text=\"bind:prgmNm\"/><Cell col=\"3\" displaytype=\"combo\" edittype=\"combo\" text=\"bind:readAuthYn\" combodataset=\"useYn\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"4\" displaytype=\"combo\" edittype=\"combo\" text=\"bind:saveAuthYn\" combodataset=\"useYn\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"5\" displaytype=\"combo\" edittype=\"combo\" text=\"bind:delAuthYn\" combodataset=\"useYn\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"6\" displaytype=\"combo\" edittype=\"combo\" text=\"bind:prntAuthYn\" combodataset=\"useYn\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"7\" displaytype=\"combo\" edittype=\"combo\" text=\"bind:exptAuthYn\" combodataset=\"useYn\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"8\" displaytype=\"combo\" edittype=\"combo\" text=\"bind:chgAuthYn\" combodataset=\"useYn\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"9\" displaytype=\"combo\" edittype=\"combo\" text=\"bind:etc1AuthYn\" combodataset=\"useYn\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"10\" displaytype=\"combo\" edittype=\"combo\" text=\"bind:etc2AuthYn\" combodataset=\"useYn\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"11\" displaytype=\"combo\" edittype=\"combo\" text=\"bind:etc3AuthYn\" combodataset=\"useYn\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"12\" text=\"bind:prgmPath\"/><Cell col=\"13\" text=\"bind:prgmDesc\"/><Cell col=\"14\" text=\"bind:mdlCd\"/><Cell col=\"15\" text=\"bind:mdlNm\"/><Cell col=\"16\" text=\"bind:useYn\"/></Band></Format></Formats>");
            this.Div01.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "0", "0", null, "45", "25", null, this);
            obj.set_taborder("13");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_searchCondition", "absolute", "19", "0", "72", "41", null, null, this.div_search);
            obj.set_taborder("35");
            obj.set_text("권한 그룹");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cmb_searchCondition", "absolute", "93", "10", "140", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("36");
            obj.set_innerdataset("@ds_grCb");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new Edit("edt_searchKeyword", "absolute", "238", "10", "260", "21", null, null, this.div_search);
            obj.set_taborder("37");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "1122", "0", "25", "496", null, null, this);
            obj.set_taborder("14");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "45", "1122", "20", null, null, this);
            obj.set_taborder("15");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "319", "76", "802", "10", null, null, this);
            obj.set_taborder("16");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "299", "65", "20", "431", null, null, this);
            obj.set_taborder("17");
            obj.set_text("FIX\r\nw20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Grid("Grid00", "absolute", "0", "65", "300", "431", null, null, this);
            obj.set_taborder("18");
            obj.set_binddataset("dsList");
            obj.set_autofittype("none");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"130\"/><Column size=\"170\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"권한그룹코드\"/><Cell col=\"1\" text=\"권한그룹명\"/></Band><Band id=\"body\"><Cell text=\"bind:authGrpCd\"/><Cell col=\"1\" text=\"bind:authGrpNm\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "0", "0", "20", "45", null, null, this);
            obj.set_taborder("19");
            obj.set_text("FIX \r\nw20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static08", "absolute", "318", "277", "69", "31", null, null, this);
            obj.set_taborder("21");
            obj.set_text("검색");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static10", "absolute", "319", "297", "803", "10", null, null, this);
            obj.set_taborder("23");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Grid("Grid01", "absolute", "319", "307", null, "189", "25", null, this);
            obj.set_taborder("25");
            obj.set_binddataset("dsUser");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"35\"/><Column size=\"100\"/><Column size=\"130\"/><Column size=\"130\"/><Column size=\"180\"/><Column size=\"60\"/><Column size=\"80\"/><Column size=\"60\"/><Column size=\"35\"/><Column size=\"35\"/><Column size=\"35\"/><Column size=\"35\"/><Column size=\"60\"/><Column size=\"60\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell edittype=\"checkbox\"/><Cell col=\"1\" text=\"프로그램 코드\"/><Cell col=\"2\" text=\"프로그램명\"/><Cell col=\"3\" text=\"프로그램 URL\"/><Cell col=\"4\" text=\"프로그램 설명\"/><Cell col=\"5\" text=\"모듈코드\"/><Cell col=\"6\" text=\"모듈명\"/><Cell col=\"7\" text=\"사용유무\"/><Cell col=\"8\" text=\"읽기\"/><Cell col=\"9\" text=\"저장\"/><Cell col=\"10\" text=\"삭제\"/><Cell col=\"11\" text=\"인쇄\"/><Cell col=\"12\" text=\"엑셀저장\"/><Cell col=\"13\" text=\"조직수정\"/><Cell col=\"14\" text=\"기타1\"/><Cell col=\"15\" text=\"기타2\"/><Cell col=\"16\" text=\"기타3\"/></Band><Band id=\"body\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\" text=\"bind:check\"/><Cell col=\"1\" text=\"bind:prgmCd\"/><Cell col=\"2\" text=\"bind:prgmNm\"/><Cell col=\"3\" text=\"bind:prgmPath\"/><Cell col=\"4\" text=\"bind:prgmDesc\"/><Cell col=\"5\" text=\"bind:mdlCd\"/><Cell col=\"6\" text=\"bind:mdlNm\"/><Cell col=\"7\" text=\"bind:useYn\"/><Cell col=\"8\" text=\"bind:readAuthYn\"/><Cell col=\"9\" text=\"bind:saveAuthYn\"/><Cell col=\"10\" text=\"bind:delAuthYn\"/><Cell col=\"11\" text=\"bind:prntAuthYn\"/><Cell col=\"12\" text=\"bind:exptAuthYn\"/><Cell col=\"13\" text=\"bind:chgAuthYn\"/><Cell col=\"14\" text=\"bind:etc1AuthYn\"/><Cell col=\"15\" text=\"bind:etc2AuthYn\"/><Cell col=\"16\" text=\"bind:etc3AuthYn\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Combo("cmb_searchCondition2", "absolute", "391", "280", "113", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("7");
            obj.set_value("0");
            obj.set_text("선택");
            obj.set_innerdataset("@ds_grCb2");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj.set_index("0");

            obj = new Edit("edt_searchKeyword2", "absolute", "509", "280", "149", "21", null, null, this);
            obj.set_taborder("6");
            this.addChild(obj.name, obj);

            obj = new Button("btn_search2", "absolute", "668", "279", "45", "22", null, null, this);
            obj.set_taborder("5");
            obj.set_text("조회");
            obj.set_cssclass("btn_WF_module");
            this.addChild(obj.name, obj);

            obj = new Button("Button00", "absolute", null, "279", "23", "23", "54", null, this);
            obj.set_taborder("11");
            obj.style.set_font("11 Verdana");
            obj.set_cssclass("btn_WF_suttleT");
            this.addChild(obj.name, obj);

            obj = new Button("Button01", "absolute", null, "279", "23", "23", "28", null, this);
            obj.set_taborder("12");
            obj.style.set_font("11 Verdana");
            obj.set_cssclass("btn_WF_suttleB");
            this.addChild(obj.name, obj);


            
            // Layout Functions
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
            obj = new Layout("default", "", 0, 45, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("13");
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
            		p.set_classname("RTCMGrpReg");
            		p.set_titletext("프로그램-권한그룹 연동 등록");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCMProReg.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCMProReg.xfdl", function() {

        
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
        		this.parent.setButton("E|C|S", this);
        	} 

        //권한그룹 사용자 좌측 Grid 조회
        this.fn_search = function(obj,e)
        {
        	var sSvcID        	= "proRegService";                    
        	var sController   	= "proRegController.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "dsList=output ds_grCb=output2 ds_grCb2=output3 useYn=output4";
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
        	var sSvcID        	= "proRegService2";                    
        	var sController   	= "proRegController22.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "dsUser=output";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	if(this.cmb_searchCondition2.value == "PRGM_CD"){
        		if(this.edt_searchKeyword2.getLength() == 0) {
        			alert("프로그램 코드를 입력해주세요");
        			return false;
        		} else {
        			sArgs = "prgmCd=" + nvl(this.edt_searchKeyword2.value)+" cd=" + checkAuthMenuCd;;
        		}
        	} else if(this.cmb_searchCondition2.value == "PRGM_NM") {
        		if(this.edt_searchKeyword2.getLength() < 2) {
        			alert("2자이상 입력해주세요")
        			return false;
        		} else {
        			sArgs = "prgmNm=" + nvl(this.edt_searchKeyword2.value)+" cd=" + checkAuthMenuCd;;
        		}
        	} else {
        		alert("검색조건을 선택해주세요.");
        		return false;
        	}
        	this.dsUser.clearData();
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
        			if(nTotalCnt == 0) {
        				this.Div02.Grid00.set_nodatatext("조회된 데이터가 없습니다.");
        			}
        			
        		}
        		
        		if (strSvcId == "saveData") 
        		{
        			alert(strErrorMsg);
        			this.fn_search();
        		}
        		
        		if(strSvcId == "proRegService")
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
        		checkAuthGrpCd  = this.dsList.getColumn(rnum, "authGrpCd");
        		var sSvcID        	= "saveData";                    
        		var sController   	= "proRegSaveDaset.do";
        		var sInDatasets   	= "input=dsAuth:U";
        		var sOutDatasets  	= "";
        		var sArgs 			= "authGrpCd=" + checkAuthGrpCd;
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
        this.searchList = function(cd)
        	{
        		var sSvcID        	= "searchList";                    
        		var sController   	= "proRegController11.do";
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
        			var prgmCd = this.dsUser.getColumn(i, "prgmCd");
        			var prgmNm = this.dsUser.getColumn(i, "prgmNm");
        			var prgmPath = this.dsUser.getColumn(i, "prgmPath");
        			var prgmDesc = this.dsUser.getColumn(i, "prgmDesc");
        			var mdlCd = this.dsUser.getColumn(i, "mdlCd");
        			var mdlNm = this.dsUser.getColumn(i, "mdlNm");
        			var useYn = this.dsUser.getColumn(i, "useYn");
        			//권한
        			var readAuthYn = this.dsUser.getColumn(i, "readAuthYn");
        			var saveAuthYn = this.dsUser.getColumn(i, "saveAuthYn");
        			var delAuthYn = this.dsUser.getColumn(i, "delAuthYn");
        			var prntAuthYn = this.dsUser.getColumn(i, "prntAuthYn");
        			var exptAuthYn = this.dsUser.getColumn(i, "exptAuthYn");
        			var chgAuthYn = this.dsUser.getColumn(i, "chgAuthYn");
        			var etc1AuthYn = this.dsUser.getColumn(i, "etc1AuthYn");
        			var etc2AuthYn = this.dsUser.getColumn(i, "etc2AuthYn");
        			var etc3AuthYn = this.dsUser.getColumn(i, "etc3AuthYn");
        			
        			//로우 생성및 순번값
        			var idx = this.dsAuth.addRow();
        			
        			// 로우값 컬럼별로 세팅
        			this.dsAuth.setColumn(idx, "prgmCd" , prgmCd);
        			this.dsAuth.setColumn(idx, "prgmNm" , prgmNm);
        			this.dsAuth.setColumn(idx, "prgmPath" , prgmPath);
        			this.dsAuth.setColumn(idx, "prgmDesc" , prgmDesc);
        			this.dsAuth.setColumn(idx, "mdlCd" , mdlCd);
        			this.dsAuth.setColumn(idx, "mdlNm" , mdlNm);
        			this.dsAuth.setColumn(idx, "useYn" , useYn);
        			//권한들 N값으로 세팅
        			this.dsAuth.setColumn(idx, "readAuthYn" , readAuthYn);
        			this.dsAuth.setColumn(idx, "saveAuthYn" , saveAuthYn);
        			this.dsAuth.setColumn(idx, "delAuthYn" , delAuthYn);
        			this.dsAuth.setColumn(idx, "prntAuthYn" , prntAuthYn);
        			this.dsAuth.setColumn(idx, "exptAuthYn" , exptAuthYn);
        			this.dsAuth.setColumn(idx, "chgAuthYn" , chgAuthYn);
        			this.dsAuth.setColumn(idx, "etc1AuthYn" , etc1AuthYn);
        			this.dsAuth.setColumn(idx, "etc2AuthYn" , etc2AuthYn);
        			this.dsAuth.setColumn(idx, "etc3AuthYn" , etc3AuthYn);
        			this.dsUser.deleteRow(i);
        			
        			checkCnt++;
        		}
        	}
        		
        	if(checkCnt == 0) {
        		alert("등록하실 사용자를 선택해주세요.");
        	} /*else {
        		this.Div01.Grid01.set_visible(true);
        		this.Div01.Grid00.set_visible(false);
        	}*/
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
        			var prgmPath = this.dsAuth.getColumn(i, "prgmPath");
        			var prgmDesc = this.dsAuth.getColumn(i, "prgmDesc");
        			var mdlCd = this.dsAuth.getColumn(i, "mdlCd");
        			var mdlNm = this.dsAuth.getColumn(i, "mdlNm");
        			var useYn = this.dsAuth.getColumn(i, "useYn");
        			//권한
        			var readAuthYn = this.dsAuth.getColumn(i, "readAuthYn");
        			var saveAuthYn = this.dsAuth.getColumn(i, "saveAuthYn");
        			var delAuthYn = this.dsAuth.getColumn(i, "delAuthYn");
        			var prntAuthYn = this.dsAuth.getColumn(i, "prntAuthYn");
        			var exptAuthYn = this.dsAuth.getColumn(i, "exptAuthYn");
        			var chgAuthYn = this.dsAuth.getColumn(i, "chgAuthYn");
        			var etc1AuthYn = this.dsAuth.getColumn(i, "etc1AuthYn");
        			var etc2AuthYn = this.dsAuth.getColumn(i, "etc2AuthYn");
        			var etc3AuthYn = this.dsAuth.getColumn(i, "etc3AuthYn");
        			
        			//로우 생성및 순번값
        			var idx = this.dsUser.addRow();
        			
        			// 로우값 컬럼별로 세팅
        			this.dsUser.setColumn(idx, "prgmCd" , prgmCd);
        			this.dsUser.setColumn(idx, "prgmNm" , prgmNm);
        			this.dsUser.setColumn(idx, "prgmPath" , prgmPath);
        			this.dsUser.setColumn(idx, "prgmDesc" , prgmDesc);
        			this.dsUser.setColumn(idx, "mdlCd" , mdlCd);
        			this.dsUser.setColumn(idx, "mdlNm" , mdlNm);
        			this.dsUser.setColumn(idx, "useYn" , useYn);
        			//권한들 N값으로 세팅
        			this.dsUser.setColumn(idx, "readAuthYn" , readAuthYn);
        			this.dsUser.setColumn(idx, "saveAuthYn" , saveAuthYn);
        			this.dsUser.setColumn(idx, "delAuthYn" , delAuthYn);
        			this.dsUser.setColumn(idx, "prntAuthYn" , prntAuthYn);
        			this.dsUser.setColumn(idx, "exptAuthYn" , exptAuthYn);
        			this.dsUser.setColumn(idx, "chgAuthYn" , chgAuthYn);
        			this.dsUser.setColumn(idx, "etc1AuthYn" , etc1AuthYn);
        			this.dsUser.setColumn(idx, "etc2AuthYn" , etc2AuthYn);
        			this.dsUser.setColumn(idx, "etc3AuthYn" , etc3AuthYn);
        			this.dsAuth.deleteRow(i);
        			
        			checkCnt++;
        		}
        	}
        	if(checkCnt == 0) {
        		alert("삭제하실 사용자를 선택해주세요.");
        	} /*else {
        		this.Div01.Grid01.set_visible(false);
        	this.Div01.Grid00.set_visible(true);
        	}*/
        	
        }

        	this.fn_excel= function() {
        		var objArray1 = new Array();
        		objArray1.push(this.Grid00);
        		objArray1.push(this.Div01.Grid01);
        		objArray1.push(this.Grid01);
        		Ex.core.exportExcel(this, objArray1);
        	}
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.Static07.addEventHandler("onclick", this.Static00_onclick, this);
            this.div_search.cmb_searchCondition.addEventHandler("onitemchanged", this.div_search_cmb_searchCondition_onitemchanged, this);
            this.div_search.edt_searchKeyword.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.Grid00.addEventHandler("oncellclick", this.Div00_Grid00_oncellclick, this);
            this.Static08.addEventHandler("onclick", this.Static00_onclick, this);
            this.edt_searchKeyword2.addEventHandler("onkeyup", this.div_search_edt_searchKeyword2_onkeyup, this);
            this.btn_search2.addEventHandler("onclick", this.btn_search2_onclick, this);
            this.Button00.addEventHandler("onclick", this.Button00_onclick, this);
            this.Button01.addEventHandler("onclick", this.Button01_onclick, this);

        };

        this.loadIncludeScript("RTCMProReg.xfdl");

       
    };
}
)();
