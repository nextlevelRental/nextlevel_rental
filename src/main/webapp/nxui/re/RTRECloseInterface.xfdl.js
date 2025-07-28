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
                this.set_name("RTRECloseInterface");
                this.set_classname("RTRECloseInterface");
                this.set_titletext("마감 EAI전송");
                this._setFormPosition(0,0,1147,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_closeIfList", this);
            obj._setContents("<ColumnInfo><Column id=\"chk\" type=\"STRING\" size=\"256\"/><Column id=\"ifNo\" type=\"STRING\" size=\"256\"/><Column id=\"closeYm\" type=\"STRING\" size=\"256\"/><Column id=\"ifId\" type=\"STRING\" size=\"256\"/><Column id=\"ifNm\" type=\"STRING\" size=\"256\"/><Column id=\"ifTimeCd\" type=\"STRING\" size=\"256\"/><Column id=\"callProc\" type=\"STRING\" size=\"256\"/><Column id=\"exeSec\" type=\"STRING\" size=\"256\"/><Column id=\"reltCode\" type=\"STRING\" size=\"256\"/><Column id=\"reltMsg\" type=\"STRING\" size=\"256\"/><Column id=\"inParam01\" type=\"STRING\" size=\"256\"/><Column id=\"inParam02\" type=\"STRING\" size=\"256\"/><Column id=\"multiSendYn\" type=\"STRING\" size=\"256\"/><Column id=\"rawDataProc\" type=\"STRING\" size=\"256\"/><Column id=\"sendAmount\" type=\"INT\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_reltCd", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"nm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cd\">N</Col><Col id=\"nm\">미수행</Col></Row><Row><Col id=\"cd\">S</Col><Col id=\"nm\">성공</Col></Row><Row><Col id=\"cd\">E</Col><Col id=\"nm\">실패</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_R051", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static04", "absolute", "0", "0", "1122", "10", null, null, this);
            obj.set_taborder("0");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "10", "10", "486", null, null, this);
            obj.set_taborder("1");
            obj.set_text("FIX \r\nh10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "0", "60", "1122", "20", null, null, this);
            obj.set_taborder("2");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1122", "0", "25", "496", null, null, this);
            obj.set_taborder("3");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "10", "10", "1112", "49", null, null, this);
            obj.set_taborder("4");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_date", "absolute", "20", "12", "80", "21", null, null, this.div_search);
            obj.set_taborder("126");
            obj.set_text("기준년월");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static07", "absolute", "0", "0", "1108", "12", null, null, this.div_search);
            obj.set_taborder("127");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "0", "0", "20", "45", null, null, this.div_search);
            obj.set_taborder("128");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "105", "0", "20", "45", null, null, this.div_search);
            obj.set_taborder("129");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "273", "0", "20", "45", null, null, this.div_search);
            obj.set_taborder("130");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "379", "0", "20", "45", null, null, this.div_search);
            obj.set_taborder("131");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static05", "absolute", "539", "0", "20", "45", null, null, this.div_search);
            obj.set_taborder("132");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static10", "absolute", "0", "33", "1108", "12", null, null, this.div_search);
            obj.set_taborder("133");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("edtYear", "absolute", "124", "12", "60", "21", null, null, this.div_search);
            obj.set_taborder("134");
            obj.set_inputtype("digit");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("4");
            obj.set_autoskip("true");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition06", "absolute", "188", "12", "20", "20", null, null, this.div_search);
            obj.set_taborder("135");
            obj.set_text("년");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("edtMonth", "absolute", "214", "12", "40", "21", null, null, this.div_search);
            obj.set_taborder("136");
            obj.set_inputtype("digit");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("2");
            obj.set_autoskip("true");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition07", "absolute", "258", "12", "20", "20", null, null, this.div_search);
            obj.set_taborder("137");
            obj.set_text("월");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_createEai", "absolute", "26.35%", "14", null, "18", "64.35%", null, this.div_search);
            obj.set_taborder("138");
            obj.set_text("마감리스트생성");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "10", "80", "120", "21", null, null, this);
            obj.set_taborder("5");
            obj.set_text("검색결과");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Grid("grid_closeList", "absolute", "9", "110", "1113", "386", null, null, this);
            obj.set_taborder("6");
            obj.set_binddataset("ds_closeIfList");
            obj.set_autofittype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"40\"/><Column size=\"102\"/><Column size=\"70\"/><Column size=\"92\"/><Column size=\"182\"/><Column size=\"90\"/><Column size=\"82\"/><Column size=\"81\"/><Column size=\"58\"/><Column size=\"54\"/><Column size=\"265\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"30\" band=\"summ\"/></Rows><Band id=\"head\"><Cell displaytype=\"none\" edittype=\"none\"/><Cell col=\"1\" text=\"인터페이스번호\"/><Cell col=\"2\" text=\"마감년월\"/><Cell col=\"3\" text=\"인터페이스ID\"/><Cell col=\"4\" text=\"인터페이스명\"/><Cell col=\"5\" text=\"수행시기\"/><Cell col=\"6\" displaytype=\"normal\" text=\"입력1\"/><Cell col=\"7\" text=\"입력2\"/><Cell col=\"8\" text=\"수행시간\"/><Cell col=\"9\" text=\"결과\"/><Cell col=\"10\" text=\"결과메시지\"/></Band><Band id=\"body\"><Cell displaytype=\"expr:reltCode=='S' ? 'none':'checkbox'\" edittype=\"expr:reltCode=='S' ? 'none':'checkbox'\" text=\"bind:chk\"/><Cell col=\"1\" text=\"bind:ifNo\"/><Cell col=\"2\" text=\"bind:closeYm\"/><Cell col=\"3\" text=\"bind:ifId\"/><Cell col=\"4\" displaytype=\"normal\" style=\"align:left;\" text=\"bind:ifNm\"/><Cell col=\"5\" displaytype=\"combo\" text=\"bind:ifTimeCd\" combodataset=\"ds_R051\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"6\" displaytype=\"normal\" style=\"align:center;\" text=\"bind:inParam01\"/><Cell col=\"7\" style=\"align:center;\" text=\"bind:inParam02\"/><Cell col=\"8\" style=\"align:right;\" text=\"bind:exeSec\"/><Cell col=\"9\" displaytype=\"combo\" text=\"bind:reltCode\" combodataset=\"ds_reltCd\" combocodecol=\"cd\" combodatacol=\"nm\" combodisplay=\"edit\"/><Cell col=\"10\" style=\"align:left;\" text=\"bind:reltMsg\"/></Band><Band id=\"summary\"><Cell/><Cell col=\"1\" text=\"총계\"/><Cell col=\"2\" style=\"align:right;\" expr=\"expr:dataset.getRowCount()+&quot;(건)&quot;\"/><Cell col=\"3\" style=\"align:right;\"/><Cell col=\"4\" style=\"align:right;\"/><Cell col=\"5\"/><Cell col=\"6\" displaytype=\"normal\" style=\"align:right;\"/><Cell col=\"7\"/><Cell col=\"8\"/><Cell col=\"9\"/><Cell col=\"10\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0", "100", "1122", "10", null, null, this);
            obj.set_taborder("7");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1112, 49, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("4");
            		p.set_scrollbars("none");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1147, 496, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTRECloseInterface");
            		p.set_titletext("마감 EAI전송");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTRECloseInterface.xfdl", "lib::comLib.xjs");
        this.registerScript("RTRECloseInterface.xfdl", function() {
        //include "lib::comLib.xjs";

        this.curMonth = "";

        this.RTRECloseInterface_onload = function(obj,e) {
        	Ex.core.init(obj);
        	this.fn_init(); 
        	this.parent.setButton("S|C", this);
        }

        this.fn_init = function() {
        	// 공통코드 조회
        	this.fn_getCommCode();
        	// 기준년월 조회
        	this.fn_initYmd();	
        }

        // 공통코드 조회
        this.fn_getCommCode  = function() {
        	var sSvcID      	= "getCommCode";  
        	var sController   	= "/rtms/re/rTRECloseInterfaceCommCode.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_R051=outputR051";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 		
        }	

        // 기준년월 조회
        this.fn_initYmd = function() {
        	var sSvcID      	= "getDayMongth";  
        	var sController   	= "ntrms/re/getDayMongth.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }

        this.fn_search = function() {
        	var nYear  = nvl(this.div_search.edtYear.value);
        	var nMonth = nvl(this.div_search.edtMonth.value);
        	
        	if(nYear.length < 4) {
        		this.alert('기준년월을 입력하세요.');
        		this.div_search.edtYear.setFocus();
        		return false;
        	}
        	
        	if(nMonth.length < 2) {
        		this.alert('기준년월을 입력하세요.');
        		this.div_search.edtMonth.setFocus();
        		return false;
        	}
        		
        	this.closeYm = nYear + nMonth;
        		
        	this.ds_closeIfList.deleteAll();
        	
        	var sSvcID        	= "rTRECloseInterfaceList";                    
        	var sController   	= "/rtms/re/rTRECloseInterfaceList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_closeIfList=closeListMap";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("closeYm"	,this.closeYm);
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        this.fn_save = function() {
        	this.rowCnt = this.ds_closeIfList.getRowCount();
        	
        	if (this.rowCnt > 0) {
        		var sSvcID        	= "ifRTRECloseSendEai";                    
        		var sController   	= "rtms/re/ifRTRECloseSendEai_New.do";
        		var sInDatasets   	= "ds_closeIfList=ds_closeIfList:U";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		// EAI I/F 수행시간을 고려하여 timeout 시간(초) 조정 (default = 60 sec)
        		application.set_httptimeout(330);
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	} else {
        		this.alert("전송할 건이 없습니다.");
        		return false;
        	}
        }

        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg){
        	if (nErrorCode < 0)
        		return Ex.core.comMsg("alert",strErrorMsg);	
        	
        	switch (strSvcId) {
        		case "getCommCode":
        		     break;
        		case "getDayMongth":
        			this.div_search.edtYear.set_value(this.curMonth.substr(0,4));
        			this.div_search.edtMonth.set_value(this.curMonth.substr(4,2));				
        			break;
        			
        		case "rTRECloseInterfaceList":
        			var rowCt = this.ds_closeIfList.getRowCount();
        		
        			if( rowCt == 0 ){
        				this.alert("조회된 데이터가 없습니다.");
        				this.grid_closeList.set_nodatatext("조회된 데이터가 없습니다.");
        			}
        							
        			break;
        			
        		case "ifRTRECloseSendEai":
        			//Ex.core.comMsg("alert","nErrorCode = [" + nErrorCode + "], strErrorMsg = [" + strErrorMsg + "]");
        			
        			// 전송 후 결과 재조회
        			this.fn_search();
        			
        			break;
        		case "ifRTRECreateEaiList":
        			this.alert("EAI리스트 생성완료되었습니다.");
        			break;
        		default:
        			break;
        	}
        }

        
        this.grid_closeList_oncellclick = function(obj,e) {
        	// 체크박스를 체크했을 때
        	if ((obj.getCellPos() == 0) && (obj.getCellValue(obj.currentrow, obj.getCellPos()) == 1)) {
        		// 이미 체크된 건이 존재하면 알람 후 체크 취소
        		if (this.ds_closeIfList.findRowAs("chk", 1) != obj.currentrow) {
        			this.alert("한 건만 선택할 수 있습니다.");
        			this.ds_closeIfList.setColumn(obj.currentrow, "chk", 0);
        			return false;
        		}
        	}
        }

        //마감리스트 생성
        this.div_search_btn_createEai_onclick = function(obj,e)
        {
        	var nYear  = nvl(this.div_search.edtYear.value);
        	var nMonth = nvl(this.div_search.edtMonth.value);
        	
        	var sSvcID        	= "ifRTRECreateEaiList";                    
        	var sController   	= "rtms/re/ifRTRECreateEaiList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("closeYm"	,nYear + nMonth);
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTRECloseInterface_onload, this);
            this.div_search.edtYear.addEventHandler("onchanged", this.cal_accReqDate_onchanged, this);
            this.div_search.edtMonth.addEventHandler("onchanged", this.cal_accReqDate_onchanged, this);
            this.div_search.btn_createEai.addEventHandler("onclick", this.div_search_btn_createEai_onclick, this);
            this.grid_closeList.addEventHandler("oncellclick", this.grid_closeList_oncellclick, this);

        };

        this.loadIncludeScript("RTRECloseInterface.xfdl");

       
    };
}
)();
