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
                this.set_titletext("파일목록조회");
                this._setFormPosition(0,0,1147,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("dsFileList", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"fileSeq\" type=\"STRING\" size=\"256\"/><Column id=\"fileGrpSeq\" type=\"STRING\" size=\"256\"/><Column id=\"fileLnm\" type=\"STRING\" size=\"256\"/><Column id=\"filePnm\" type=\"STRING\" size=\"256\"/><Column id=\"filePath\" type=\"STRING\" size=\"256\"/><Column id=\"fileSize\" type=\"STRING\" size=\"256\"/><Column id=\"uplpgCd\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Grid("Grid00", "absolute", "0", "92", null, "404", "25", null, this);
            obj.set_taborder("6");
            obj.set_binddataset("dsFileList");
            obj.set_autofittype("none");
            obj.set_autoenter("none");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"30\"/><Column size=\"62\"/><Column size=\"173\"/><Column size=\"116\"/><Column size=\"121\"/><Column size=\"73\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"0\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"76\"/><Column size=\"70\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"No\"/><Cell col=\"1\" text=\"그룹번호\"/><Cell col=\"2\" text=\"파일명\"/><Cell col=\"3\" text=\"물리적 파일명\"/><Cell col=\"4\" text=\"파일경로\"/><Cell col=\"5\" text=\"파일사이즈\"/><Cell col=\"6\" text=\"프로그램 코드\"/><Cell col=\"7\" text=\"고객번호\"/><Cell col=\"8\" text=\"주문번호\"/><Cell col=\"9\" text=\"사용여부\"/><Cell col=\"10\" text=\"등록자 ID\"/><Cell col=\"11\" text=\"등록일\"/><Cell col=\"12\" text=\"변경자 ID\"/><Cell col=\"13\" text=\"변경일\"/></Band><Band id=\"body\"><Cell text=\"bind:fileSeq\" autosizecol=\"limitmax\"/><Cell col=\"1\" text=\"bind:fileGrpSeq\" autosizecol=\"limitmax\"/><Cell col=\"2\" text=\"bind:fileLnm\" autosizecol=\"limitmax\"/><Cell col=\"3\" text=\"bind:filePnm\" autosizecol=\"limitmax\"/><Cell col=\"4\" text=\"bind:filePath\" autosizecol=\"limitmax\"/><Cell col=\"5\" text=\"bind:fileSize\" autosizecol=\"limitmax\"/><Cell col=\"6\" text=\"bind:uplpgCd\" autosizecol=\"limitmax\"/><Cell col=\"7\" text=\"bind:custNo\" autosizecol=\"limitmax\"/><Cell col=\"8\" text=\"bind:ordNo\" autosizecol=\"limitmax\"/><Cell col=\"9\" text=\"bind:useYn\" autosizecol=\"limitmax\"/><Cell col=\"10\" text=\"bind:regId\" autosizecol=\"limitmax\"/><Cell col=\"11\" displaytype=\"date\" text=\"bind:regDt\" autosizecol=\"limitmax\"/><Cell col=\"12\" text=\"bind:chgId\" autosizecol=\"limitmax\"/><Cell col=\"13\" displaytype=\"date\" text=\"bind:chgDt\" autosizecol=\"limitmax\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "0", "0", null, "72", "25", null, this);
            obj.set_taborder("12");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_searchCondition", "absolute", "20", "40", "72", "20", null, null, this.div_search);
            obj.set_taborder("24");
            obj.set_text("파일명");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("fileLnm", "absolute", "87", "39", "255", "21", null, null, this.div_search);
            obj.set_taborder("26");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("regFdt", "absolute", "87", "12", "120", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("29");
            obj.set_readonly("false");
            obj = new Calendar("regTdt", "absolute", "222", "12", "120", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("30");
            obj.set_readonly("false");
            obj = new Static("st_searchCondition00", "absolute", "20", "12", "72", "20", null, null, this.div_search);
            obj.set_taborder("31");
            obj.set_text("작성일");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition01", "absolute", "752", "13", "72", "20", null, null, this.div_search);
            obj.set_taborder("32");
            obj.set_text("프로그램");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("uplpgCd", "absolute", "819", "12", "111", "21", null, null, this.div_search);
            obj.set_taborder("33");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition02", "absolute", "372", "12", "72", "20", null, null, this.div_search);
            obj.set_taborder("34");
            obj.set_text("고객번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("custNo", "absolute", "440", "12", "120", "21", null, null, this.div_search);
            obj.set_taborder("35");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ordNo", "absolute", "440", "39", "120", "21", null, null, this.div_search);
            obj.set_taborder("36");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition03", "absolute", "372", "39", "72", "20", null, null, this.div_search);
            obj.set_taborder("37");
            obj.set_text("주문번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("Button00", "absolute", "540", "11", "20", "21", null, null, this.div_search);
            obj.set_taborder("38");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("Button01", "absolute", "540", "38", "20", "21", null, null, this.div_search);
            obj.set_taborder("39");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("custNm", "absolute", "565", "12", "157", "21", null, null, this.div_search);
            obj.set_taborder("40");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ordNm", "absolute", "565", "39", "157", "21", null, null, this.div_search);
            obj.set_taborder("41");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("Button02", "absolute", "910", "11", "20", "21", null, null, this.div_search);
            obj.set_taborder("42");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("uplpgNm", "absolute", "935", "12", "139", "21", null, null, this.div_search);
            obj.set_taborder("43");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "209", "11", "9", "21", null, null, this.div_search);
            obj.set_taborder("44");
            obj.set_text("~");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "1122", "0", "25", "496", null, null, this);
            obj.set_taborder("13");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "72", "1122", "20", null, null, this);
            obj.set_taborder("14");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 0, 72, this.div_search,
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
            		p.set_titletext("파일목록조회");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCMFileList.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCMFileList.xfdl", function() {
        /***********************************************************************
         * Script Include 
         ************************************************************************/
        //include "lib::comLib.xjs";

        	this.prgmCd;	//프로그램CD
        	
        	this.form_onload = function(obj,e){
        		Ex.core.init(obj);
        		var d = this.DateDemo().replace("/", "");
        		this.div_search.regFdt.set_value(d + "01");
        		var cDate = new Date(this.DateDemo() + "/01");
        		cDate.addMonth(1);
        		cDate.addDate(-1);
        		var lastDay = cDate.getDate();
        		this.div_search.regTdt.set_value(d + lastDay);
        		
        		this.setBtnAuth(this.div_search);
        		this.fn_search();
        		this.parent.setButton("E|S", this);
        	} 

        
        	this.DateDemo = function(){
        	
        		var obj, y, m, d, s = "";
        		obj = new Date();
        		s += obj.getFullYear() + "/";
        		m = obj.getMonth() + 1;
        		if(String(m).length == 1) {
        			m = "0" + m;
        		} 
        		s += m + "";
        		return(s);
        	}

        

        	//조회
        	this.fn_search = function(obj,e){
        		var sSvcID        	= "listFileInfo";                    
        		var sController   	= "/ntrms/cm/listFileInfo.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "dsFileList=listFileInfo";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";

        		sArgs += " regFdt=" + nvl(this.div_search.regFdt.value);
        		sArgs += " regTdt=" + nvl(this.div_search.regTdt.value);
        		sArgs += " uplpgCd=" + nvl(this.div_search.uplpgCd.value);
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        	}
        	
        	//프로그램 정보조회
        	this.bt_prog_onclick = function(obj,e)
        	{
        		var args ={p_arg:""};
        		Ex.core.popup(this,"listUser","comm::RTCMPro_pop.xfdl",args, "modaless=false");
        	}
        	
        		
        	this.returnFileInfo = function(arr) {
        		var cd = arr[0].getColumn(0, "prgmCd");
        		var nm = arr[0].getColumn(0, "prgmNm");
        		
        		this.div_search.uplpgCd.set_value(cd);
        		this.div_search.uplpgNm.set_value(nm);
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
        		} else {
        			if(strSvcId == "listFileInfo") {
        				return;
        			}
        		}
        	}

        
        	this.fn_excel= function() {
        		Ex.core.exportExcel(this, this.Grid00);
        	}
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.Grid00.addEventHandler("oncelldblclick", this.Grid00_oncelldblclick, this);
            this.div_search.fileLnm.addEventHandler("onkeyup", this.enterKeySearch, this);
            this.div_search.uplpgCd.addEventHandler("onkeyup", this.enterKeySearch, this);
            this.div_search.custNo.addEventHandler("onkeyup", this.enterKeySearch, this);
            this.div_search.ordNo.addEventHandler("onkeyup", this.enterKeySearch, this);
            this.div_search.custNm.addEventHandler("onkeyup", this.enterKeySearch, this);
            this.div_search.ordNm.addEventHandler("onkeyup", this.enterKeySearch, this);
            this.div_search.Button02.addEventHandler("onclick", this.bt_prog_onclick, this);
            this.div_search.uplpgNm.addEventHandler("onkeyup", this.enterKeySearch, this);

        };

        this.loadIncludeScript("RTCMFileList.xfdl");

       
    };
}
)();
