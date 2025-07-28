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
                this.set_name("RTREClosePosting");
                this.set_classname("RTSDProvisionalContractRegister");
                this.set_titletext("마감전표확인");
                this._setFormPosition(0,0,1147,498);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_postingList", this);
            obj._setContents("<ColumnInfo><Column id=\"chk\" type=\"STRING\" size=\"256\"/><Column id=\"zmonth\" type=\"STRING\" size=\"256\"/><Column id=\"stmtCd\" type=\"STRING\" size=\"256\"/><Column id=\"stmtNm\" type=\"STRING\" size=\"256\"/><Column id=\"stmtSeq\" type=\"STRING\" size=\"256\"/><Column id=\"bukrs\" type=\"STRING\" size=\"256\"/><Column id=\"budat\" type=\"STRING\" size=\"256\"/><Column id=\"bldat\" type=\"STRING\" size=\"256\"/><Column id=\"bktxt\" type=\"STRING\" size=\"256\"/><Column id=\"waers\" type=\"STRING\" size=\"256\"/><Column id=\"eSubrc\" type=\"STRING\" size=\"256\"/><Column id=\"eBelnr\" type=\"STRING\" size=\"256\"/><Column id=\"eRemsg\" type=\"STRING\" size=\"256\"/><Column id=\"manualYn\" type=\"STRING\" size=\"256\"/><Column id=\"stmtTgtYn\" type=\"STRING\" size=\"256\"/><Column id=\"cncYn\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/><Column id=\"itmSeq\" type=\"STRING\" size=\"256\"/><Column id=\"bschl\" type=\"STRING\" size=\"256\"/><Column id=\"hkont\" type=\"STRING\" size=\"256\"/><Column id=\"hkontNm\" type=\"STRING\" size=\"256\"/><Column id=\"mwskz\" type=\"STRING\" size=\"256\"/><Column id=\"kostl\" type=\"STRING\" size=\"256\"/><Column id=\"dmbtr\" type=\"STRING\" size=\"256\"/><Column id=\"dmbtrD\" type=\"STRING\" size=\"256\"/><Column id=\"dmbtrC\" type=\"STRING\" size=\"256\"/><Column id=\"sgtxt\" type=\"STRING\" size=\"256\"/><Column id=\"sideCd\" type=\"STRING\" size=\"256\"/><Column id=\"sideNm\" type=\"STRING\" size=\"256\"/><Column id=\"itmRegId\" type=\"STRING\" size=\"256\"/><Column id=\"itmRegDt\" type=\"STRING\" size=\"256\"/><Column id=\"itmChgId\" type=\"STRING\" size=\"256\"/><Column id=\"itmChgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_R066", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_C033", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cd\">S</Col><Col id=\"cdNm\">S</Col></Row><Row><Col id=\"cd\">N</Col><Col id=\"cdNm\">N</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_postingListCp", this);
            obj._setContents("<ColumnInfo><Column id=\"chk\" type=\"STRING\" size=\"256\"/><Column id=\"zmonth\" type=\"STRING\" size=\"256\"/><Column id=\"stmtCd\" type=\"STRING\" size=\"256\"/><Column id=\"stmtSeq\" type=\"STRING\" size=\"256\"/><Column id=\"bukrs\" type=\"STRING\" size=\"256\"/><Column id=\"budat\" type=\"STRING\" size=\"256\"/><Column id=\"bldat\" type=\"STRING\" size=\"256\"/><Column id=\"bktxt\" type=\"STRING\" size=\"256\"/><Column id=\"waers\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
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

            obj = new Static("Static00", "absolute", "0", "10", "10", "410", null, null, this);
            obj.set_taborder("19");
            obj.set_text("FIX \r\nh10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1122", "0", "25", "496", null, null, this);
            obj.set_taborder("20");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "10", "75", "120", "21", null, null, this);
            obj.set_taborder("21");
            obj.set_text("조회결과");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0", "95", "1122", "10", null, null, this);
            obj.set_taborder("22");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Grid("grid_postingList", "absolute", "9", "104", "1113", "380", null, null, this);
            obj.set_taborder("18");
            obj.set_autofittype("none");
            obj.set_scrollbars("autoboth");
            obj.set_binddataset("ds_postingList");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"40\"/><Column size=\"99\"/><Column size=\"213\"/><Column size=\"40\"/><Column size=\"106\"/><Column size=\"96\"/><Column size=\"110\"/><Column size=\"57\"/><Column size=\"40\"/><Column size=\"69\"/><Column size=\"40\"/><Column size=\"81\"/><Column size=\"178\"/><Column size=\"95\"/><Column size=\"80\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"197\"/><Column size=\"70\"/><Column size=\"60\"/><Column size=\"80\"/><Column size=\"60\"/><Column size=\"90\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"24\" band=\"summ\"/></Rows><Band id=\"head\"><Cell/><Cell col=\"1\" text=\"전표항목코드\"/><Cell col=\"2\" text=\"전표항목명\"/><Cell col=\"3\" text=\"순번\"/><Cell col=\"4\" text=\"SAP전표연동여부\"/><Cell col=\"5\" displaytype=\"normal\" text=\"SAP전표번호\"/><Cell col=\"6\" text=\"SAP전표연동결과\"/><Cell col=\"7\" text=\"수기전표\"/><Cell col=\"8\" text=\"취소\"/><Cell col=\"9\" text=\"Item No.\"/><Cell col=\"10\" text=\"Pstky\"/><Cell col=\"11\" text=\"계정코드\"/><Cell col=\"12\" text=\"계정명\"/><Cell col=\"13\" text=\"Tax Code\"/><Cell col=\"14\" text=\"Cost Center\"/><Cell col=\"15\" text=\"금액\"/><Cell col=\"16\" text=\"차변\"/><Cell col=\"17\" text=\"대변\"/><Cell col=\"18\" text=\"설명\"/><Cell col=\"19\" text=\"차대\"/><Cell col=\"20\" text=\"등록ID\"/><Cell col=\"21\" text=\"등록일시\"/><Cell col=\"22\" text=\"수정자ID\"/><Cell col=\"23\" text=\"수정일시\"/></Band><Band id=\"body\"><Cell displaytype=\"expr:eSubrc=='S' ? 'none':'checkbox'\" edittype=\"expr:eSubrc=='S' ? 'none':'checkbox'\" text=\"bind:chk\"/><Cell col=\"1\" displaytype=\"normal\" text=\"bind:stmtCd\"/><Cell col=\"2\" displaytype=\"normal\" style=\"align:center;\" text=\"bind:stmtNm\"/><Cell col=\"3\" displaytype=\"normal\" style=\"align:center;\" text=\"bind:stmtSeq\"/><Cell col=\"4\" displaytype=\"normal\" style=\"align:center;\" text=\"bind:stmtTgtYn\"/><Cell col=\"5\" displaytype=\"normal\" edittype=\"normal\" style=\"align:center;\" text=\"bind:eBelnr\"/><Cell col=\"6\" displaytype=\"combo\" edittype=\"combo\" text=\"bind:eSubrc\" combodataset=\"ds_C033\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"7\" text=\"bind:manualYn\"/><Cell col=\"8\" text=\"bind:cncYn\"/><Cell col=\"9\" text=\"bind:itmSeq\"/><Cell col=\"10\" text=\"bind:bschl\"/><Cell col=\"11\" text=\"bind:hkont\"/><Cell col=\"12\" text=\"bind:hkontNm\"/><Cell col=\"13\" text=\"bind:mwskz\"/><Cell col=\"14\" text=\"bind:kostl\"/><Cell col=\"15\" displaytype=\"number\" text=\"bind:dmbtr\" mask=\"###,###,###\"/><Cell col=\"16\" displaytype=\"number\" text=\"bind:dmbtrD\" mask=\"###,###,###\"/><Cell col=\"17\" displaytype=\"number\" text=\"bind:dmbtrC\" mask=\"###,###,###\"/><Cell col=\"18\" text=\"bind:sgtxt\"/><Cell col=\"19\" text=\"bind:sideNm\"/><Cell col=\"20\" text=\"bind:regId\"/><Cell col=\"21\" displaytype=\"date\" text=\"bind:regDt\" mask=\"yyyy-MM-dd\"/><Cell col=\"22\" text=\"bind:chgId\"/><Cell col=\"23\" displaytype=\"date\" text=\"bind:chgDt\" mask=\"yyyy-MM-dd\"/></Band><Band id=\"summary\"><Cell/><Cell col=\"1\" text=\"총계\"/><Cell col=\"2\" expr=\"expr:dataset.getRowCount()+&quot;(건)&quot;\"/><Cell col=\"3\"/><Cell col=\"4\"/><Cell col=\"5\"/><Cell col=\"6\"/><Cell col=\"7\"/><Cell col=\"8\"/><Cell col=\"9\"/><Cell col=\"10\"/><Cell col=\"11\"/><Cell col=\"12\"/><Cell col=\"13\"/><Cell col=\"14\"/><Cell col=\"15\"/><Cell col=\"16\"/><Cell col=\"17\"/><Cell col=\"18\"/><Cell col=\"19\"/><Cell col=\"20\"/><Cell col=\"21\"/><Cell col=\"22\"/><Cell col=\"23\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "484", null, "15", "0", null, this);
            obj.set_taborder("23");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_border("0 none #808080,1 solid #d2020bff");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "9", "10", "1113", "45", null, null, this);
            obj.set_taborder("44");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("Static26", "absolute", "0", "0", "1122", "12", null, null, this.div_search);
            obj.set_taborder("95");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static07", "absolute", "0", "33", "1118", "12", null, null, this.div_search);
            obj.set_taborder("96");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static08", "absolute", "0", "0", "25", "41", null, null, this.div_search);
            obj.set_taborder("97");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_payMm", "absolute", "29", "12", "69", "21", null, null, this.div_search);
            obj.set_taborder("100");
            obj.set_text("마감월");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "96", "0", "20", "45", null, null, this.div_search);
            obj.set_taborder("102");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "258", "0", "20", "45", null, null, this.div_search);
            obj.set_taborder("103");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_closeYm", "absolute", "116", "12", "142", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("104");
            obj.set_dateformat("yyyy-MM");
            obj.set_value("null");
            obj.set_editformat("yyyy-MM");

            obj = new Static("Static07", "absolute", "0", "55", "1122", "20", null, null, this);
            obj.set_taborder("45");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_f10n", "absolute", "85.61%", "74", null, "20", "2.18%", null, this);
            obj.set_taborder("46");
            obj.set_displaynulltext("0");
            this.addChild(obj.name, obj);

            obj = new Static("st_f10n", "absolute", "910", "75", "69", "21", null, null, this);
            obj.set_taborder("47");
            obj.set_text("F10N");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1113, 45, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("44");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1147, 498, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTSDProvisionalContractRegister");
            		p.set_titletext("마감전표확인");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item9","div_search.cal_closeYm","value","ds_provsnList","planDay");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTREClosePosting.xfdl", "lib::comLib.xjs");
        this.registerScript("RTREClosePosting.xfdl", function() {
        //include "lib::comLib.xjs"; 

        
        // 전역변수 선언
        this.fUserId  = "";											// 현재 로그인 사용자의 ID
        this.fUserGrp = "";											// 현재 로그인 사용자의 사용자그룹
        this.firstDate  = "";
        this.lastDate  = "";

        /**
         * 폼의 모든 컴포넌트가 생성되고, 모든 오브젝트가 로딩되었을 때 이벤트 처리
         */
        this.RTSDProvisionalContractRegister_onload = function(obj,e) {
        	Ex.core.init(obj);
        	this.parent.setButton("E|AG|S|N", this);
        	
        	this.get_date();
        	
        	// 사용자그룹 설정 
        	this.fUserId  = application.gds_userInfo.getColumn(0, "userId" );
        	this.fUserGrp = application.gds_userInfo.getColumn(0, "userGrp");
        }	

        /**
         * CallBack 처리
         */
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg) {
        	if (nErrorCode < 0)
        		return Ex.core.comMsg("alert",strErrorMsg);	

        	switch (strSvcId) {
        		case "getDate":
        			this.div_search.cal_closeYm.set_value(this.firstDate);
        			break;
        	    case "listCommInfo":
        			break;
        		case "listClosePosting":
        			
        			var rowCt = this.ds_postingList.getRowCount();
        		
        			if( rowCt == 0 ){
        				this.alert("조회된 데이터가 없습니다.");
        				this.grid_postingList.set_nodatatext("조회된 데이터가 없습니다.");
        			}
        							
        			break;
        		case "aggregatePostingData":
        			this.alert("집계완료되었습니다.");
        			break;
        		case "ifRTREClosePostingEai":
        			// 전송 후 결과 재조회
        			this.fn_search();
        			break;
        		default:
        			break;
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //java comm에서 현재 날짜 가져오기
        this.get_date = function() 
        {
        	var sSvcID        	= "getDate";                    
        	var sController   	= "/rtms/sd/getDate.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.FN_listClosePosting = function(){

        	var closeYm = nvl(this.div_search.cal_closeYm.value).substring(0, 6);
        	
        	var sSvcID        	= "listClosePosting";                    
        	var sController   	= "rtms/re/rTREClosePostingList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_postingList=output";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("closeYm", 	closeYm);
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_search = function(){
        	
        	this.FN_listClosePosting();
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //EAI인터페이스
        this.fn_add = function() {

        	this.rowCnt = this.ds_postingList.getRowCount();
        	
        	//공통입력값만 추출하여 전송
        	var nRow = this.ds_postingList.findRowExpr("chk == '1'");

        	this.ds_postingListCp.addRow();
        	this.ds_postingListCp.setColumn(0, "chk", this.ds_postingList.getColumn(nRow, "chk"));
        	this.ds_postingListCp.setColumn(0, "zmonth", this.ds_postingList.getColumn(nRow, "zmonth"));
        	this.ds_postingListCp.setColumn(0, "stmtCd", this.ds_postingList.getColumn(nRow, "stmtCd"));
        	this.ds_postingListCp.setColumn(0, "stmtSeq", this.ds_postingList.getColumn(nRow, "stmtSeq"));
        	this.ds_postingListCp.setColumn(0, "bukrs", this.ds_postingList.getColumn(nRow, "bukrs"));
        	this.ds_postingListCp.setColumn(0, "budat", this.ds_postingList.getColumn(nRow, "budat"));
        	this.ds_postingListCp.setColumn(0, "bldat", this.ds_postingList.getColumn(nRow, "bldat"));
        	this.ds_postingListCp.setColumn(0, "bktxt", this.ds_postingList.getColumn(nRow, "bktxt"));
        	this.ds_postingListCp.setColumn(0, "waers", this.ds_postingList.getColumn(nRow, "waers"));

        	if (this.rowCnt > 0) {		
        		var sSvcID        	= "ifRTREClosePostingEai";                    
        		var sController   	= "rtms/re/ifRTREClosePostingEai.do";
        		var sInDatasets   	= "ds_postingList=ds_postingListCp:U";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		sArgs += Ex.util.setParam("ifId", 	"NTRMS_122");	//인터페이스ID
        		
        		// EAI I/F 수행시간을 고려하여 timeout 시간(초) 조정 (default = 60 sec)
        		application.set_httptimeout(330);
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	} else {
        		this.alert("전송할 건이 없습니다.");
        		return false;
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_aggregate = function(){

        	if(nvl(this.ed_f10n.value) == ""){
        		alert("F10N 금액이 입려되지 않았습니다.");
        		return;
        	}
        	
        	var sSvcID        	= "aggregatePostingData";                    
        	var sController   	= "rtms/re/aggregatePostingData.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("closeYm", 	nvl(this.div_search.cal_closeYm.value).substring(0, 6));	//마감월
        	sArgs += Ex.util.setParam("f10nAmt", 	nvl(this.ed_f10n.value));									//F10N 금액
        	
        	// EAI I/F 수행시간을 고려하여 timeout 시간(초) 조정 (default = 60 sec)
        	application.set_httptimeout(330);
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        		
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_save = function(){

        	var sSvcID        	= "updatePostingData";                    
        	var sController   	= "rtms/re/updatePostingData.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("closeYm", 	nvl(this.div_search.cal_closeYm.value).substring(0, 6));	//마감월
        	sArgs += Ex.util.setParam("stmtCd", 	nvl(this.div_search.cal_closeYm.value).substring(0, 6));	//계정항목
        	sArgs += Ex.util.setParam("eSubrc", 	"N");														//인터페이스결과
        	sArgs += Ex.util.setParam("eBelnr", 	this.ds_postingList.getColumn(this.ds_postingList.rowposition, "eBelnr"));	//전표번호													//인터페이스결과
        	sArgs += Ex.util.setParam("eRemsg", 	this.ds_postingList.getColumn(this.ds_postingList.rowposition, "eRemsg"));	//인터페이스결과메세지													//인터페이스결과
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.grid_postingList_oncellclick = function(obj,e)
        {
        	// 체크박스를 체크했을 때
        	if ((obj.getCellPos() == 0) && (obj.getCellValue(obj.currentrow, obj.getCellPos()) == 1)) {
        		var stmtCd = this.ds_postingList.getColumn(obj.currentrow, "stmtCd");
        		var nRow = this.ds_postingList.findRowExpr("stmtCd == '" + stmtCd + "'");
        		var chk = this.ds_postingList.getColumn(obj.currentrow, "chk");
        		
        		//전체 초기화
        		for(var i=0; i<this.ds_postingList.rowcount; i++){
        			this.ds_postingList.setColumn(i, "chk", 0);
        		}
        		
        		for(var i=0; i<this.ds_postingList.rowcount; i++){
        			if(this.ds_postingList.getColumn(i, "stmtCd") == stmtCd){
        				this.ds_postingList.setColumn(i, "chk", 1);
        			}
        		}

        	}else if((obj.getCellPos() == 0) && (obj.getCellValue(obj.currentrow, obj.getCellPos()) == 0)){
        		//전체 초기화
        		for(var i=0; i<this.ds_postingList.rowcount; i++){
        			this.ds_postingList.setColumn(i, "chk", 0);
        		}
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_excel = function(obj,e){
        	Ex.core.exportExcel(this, this.grid_postingList, "마감전표내역");
        }
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTSDProvisionalContractRegister_onload, this);
            this.grid_postingList.addEventHandler("oncellclick", this.grid_postingList_oncellclick, this);

        };

        this.loadIncludeScript("RTREClosePosting.xfdl");

       
    };
}
)();
