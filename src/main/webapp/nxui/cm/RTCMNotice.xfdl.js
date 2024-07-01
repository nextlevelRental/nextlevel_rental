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
                this.set_titletext("공지사항목록");
                this._setFormPosition(0,0,1147,496);
            }
            this.style.set_color("#333333ff");

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("dsList", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"ntcSeq\" type=\"STRING\" size=\"256\"/><Column id=\"ntcType\" type=\"STRING\" size=\"256\"/><Column id=\"title\" type=\"STRING\" size=\"256\"/><Column id=\"contents\" type=\"STRING\" size=\"256\"/><Column id=\"startDt\" type=\"STRING\" size=\"256\"/><Column id=\"endDt\" type=\"STRING\" size=\"256\"/><Column id=\"readCnt\" type=\"STRING\" size=\"256\"/><Column id=\"attchFlSeq\" type=\"STRING\" size=\"256\"/><Column id=\"delYn\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/><Column id=\"fileCnt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsCopy", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"ntcSeq\" type=\"STRING\" size=\"256\"/><Column id=\"ntcType\" type=\"STRING\" size=\"256\"/><Column id=\"title\" type=\"STRING\" size=\"256\"/><Column id=\"contents\" type=\"STRING\" size=\"256\"/><Column id=\"startDt\" type=\"STRING\" size=\"256\"/><Column id=\"endDt\" type=\"STRING\" size=\"256\"/><Column id=\"readCnt\" type=\"STRING\" size=\"256\"/><Column id=\"attchFlSeq\" type=\"STRING\" size=\"256\"/><Column id=\"delYn\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Grid("Grid00", "absolute", "0", "86", null, "410", "25", null, this);
            obj.set_taborder("6");
            obj.set_binddataset("dsList");
            obj.set_autofittype("none");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"107\"/><Column size=\"499\"/><Column size=\"115\"/><Column size=\"152\"/><Column size=\"92\"/><Column size=\"80\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"No\"/><Cell col=\"1\" text=\"공지구분\"/><Cell col=\"2\" text=\"제목\"/><Cell col=\"3\" text=\"첨부파일 정보\"/><Cell col=\"4\" text=\"작성자\"/><Cell col=\"5\" text=\"작성일\"/><Cell col=\"6\" text=\"조회수\"/></Band><Band id=\"body\"><Cell text=\"bind:ntcSeq\"/><Cell col=\"1\" text=\"bind:ntcType\"/><Cell col=\"2\" style=\"align:left;\" text=\"bind:title\"/><Cell col=\"3\" text=\"bind:fileCnt\"/><Cell col=\"4\" text=\"bind:regId\"/><Cell col=\"5\" displaytype=\"date\" text=\"bind:regDt\"/><Cell col=\"6\" text=\"bind:readCnt\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "0", "0", null, "45", "25", null, this);
            obj.set_taborder("12");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_searchCondition", "absolute", "20", "9", "70", "20", null, null, this.div_search);
            obj.set_taborder("24");
            obj.set_text("검색");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cmb_searchCondition", "absolute", "61", "10", "140", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            var cmb_searchCondition_innerdataset = new Dataset("cmb_searchCondition_innerdataset", this.div_search.cmb_searchCondition);
            cmb_searchCondition_innerdataset._setContents("<ColumnInfo><Column id=\"codecolumn\" size=\"256\"/><Column id=\"datacolumn\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"codecolumn\">0</Col><Col id=\"datacolumn\">제목</Col></Row><Row><Col id=\"codecolumn\">1</Col><Col id=\"datacolumn\">작성자</Col></Row></Rows>");
            obj.set_innerdataset(cmb_searchCondition_innerdataset);
            obj.set_taborder("25");
            obj.set_value("-1");
            obj.set_text("선택");
            obj.set_codecolumn("codecolumn");
            obj.set_datacolumn("datacolumn");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj.set_index("0");
            obj = new Edit("edt_searchKeyword", "absolute", "206", "10", "260", "21", null, null, this.div_search);
            obj.set_taborder("26");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("regFdt", "absolute", "550", "9", "120", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("29");
            obj.set_readonly("false");
            obj = new Calendar("regTdt", "absolute", "685", "9", "120", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("30");
            obj.set_readonly("false");
            obj = new Static("st_searchCondition00", "absolute", "496", "10", "70", "20", null, null, this.div_search);
            obj.set_taborder("31");
            obj.set_text("작성일");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static12", "absolute", "673", "9", "9", "21", null, null, this.div_search);
            obj.set_taborder("32");
            obj.set_text("~");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1122", "0", "25", "496", null, null, this);
            obj.set_taborder("13");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "45", "1122", "20", null, null, this);
            obj.set_taborder("14");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "0", "61", "81", "20", null, null, this);
            obj.set_taborder("15");
            obj.set_text("검색결과");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0", "76", null, "10", "25", null, this);
            obj.set_taborder("16");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
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
            		p.set_titletext("공지사항목록");
            		p.style.set_color("#333333ff");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCMNotice.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCMNotice.xfdl", function() {
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
        		
        		this.fn_search();
        	} 

        
        	this.fn_excel= function() {
        		Ex.core.exportExcel(this, this.Grid00);
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

        
        	this.btnAdd_onclick = function(obj,e) {
        		this.dsList.addRow();
        	}

        	this.btnDel_onclick = function(obj,e) {
        		var col = this.Grid00.currentrow;
        		this.dsList.deleteRow(col);
        	}

        	this.Button06_onclick = function(obj,e) {
        		this.D.addRow();
        	}

        	this.Button07_onclick = function(obj,e) {
        		var col = this.Grid01.currentrow;
        		this.D.deleteRow(col);
        	}

        	//조회
        	this.fn_search = function(obj,e){
        		var sSvcID        	= "listNoticeInfo";                    
        		var sController   	= "/ntrms/cm/listNoticeInfo.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "dsList=listNotice";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		if(this.div_search.cmb_searchCondition.value == '0'){ 
        			sArgs += " title=" + nvl(this.div_search.edt_searchKeyword.value);
        		} else if(this.div_search.cmb_searchCondition.value == 1) {
        			sArgs += " userNm=" + nvl(this.div_search.edt_searchKeyword.value);
        		} 
        		sArgs += " regFdt=" + nvl(this.div_search.regFdt.value);
        		sArgs += " regTdt=" + nvl(this.div_search.regTdt.value);
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
        		} else {
        			if (strSvcId == "proService") {
        				var nTotalCnt = this.dsList.rowcount;
        				this.sta_total_cnt.set_text(nTotalCnt);
        				this.grd_Group.hscrollbar ;
        			
        			} if (strSvcId == "save") {
        				this.fn_search();
        			}
        			
        			if(strSvcId == "listNoticeInfo") {
        				this.parent.setButton("N|S", this);
        			}
        		}
        	}

        
        	
        	//등록팝업생성
        	this.fn_add = function(obj,e){
        	  var args ={p_arg:""};
        	  Ex.core.popup(this,"공지사항","cm::RTCMNoticeInput.xfdl",args, "modaless=false");
        	  //this.dsList.addRow();
        	}
        	//팝업종료후 재조회실행
        	this.returnUserInfo = function(val) {
        		this.fn_search();
        	}
        	
        	
        	
        	this.enterKeySearch = function(obj,e)
        	{
        		if ( e.keycode == 13 ){
        			this.btn_search_onclick();
        		}
        	}

        	this.Button00_onclick = function(obj,e)
        	{
        		this.Grid01.appendContentsCol(2);
        	}
        	
        	//상세보기
        	this.Grid00_oncelldblclick = function(obj,e)
        	{
        		var pos = this.dsList.rowposition;
        		this.dsCopy.deleteAll();
        		var row = this.dsCopy.addRow();
        		this.dsCopy.copyRow(row, this.dsList, pos);
        		
        		//등록팝업생성
        		var args ={p_arg:this.dsCopy};
        		Ex.core.popup(this,"공지사항","cm::RTCMNoticeInput.xfdl", args, "modaless=false");
        	}
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.Grid00.addEventHandler("oncelldblclick", this.Grid00_oncelldblclick, this);
            this.div_search.cmb_searchCondition.addEventHandler("onitemchanged", this.div_search_cmb_searchCondition_onitemchanged, this);
            this.div_search.edt_searchKeyword.addEventHandler("onkeyup", this.enterKeySearch, this);

        };

        this.loadIncludeScript("RTCMNotice.xfdl");

       
    };
}
)();
