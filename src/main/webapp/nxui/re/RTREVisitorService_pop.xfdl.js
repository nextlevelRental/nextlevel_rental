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
                this.set_name("RTREVisitorService_pop");
                this.set_classname("test_form");
                this.set_titletext("방문점검 서비스수수료상세");
                this._setFormPosition(0,0,1147,496);
            }
            this.style.set_color("#333333ff");

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_list", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"commTpNm\" type=\"STRING\" size=\"256\"/><Column id=\"chanLclsNm\" type=\"STRING\" size=\"256\"/><Column id=\"chanMclsNm\" type=\"STRING\" size=\"256\"/><Column id=\"minCnt\" type=\"STRING\" size=\"256\"/><Column id=\"strDay\" type=\"STRING\" size=\"256\"/><Column id=\"maxCnt\" type=\"STRING\" size=\"256\"/><Column id=\"endDay\" type=\"STRING\" size=\"256\"/><Column id=\"commTp\" type=\"STRING\" size=\"256\"/><Column id=\"chanLclsCd\" type=\"STRING\" size=\"256\"/><Column id=\"chanMclsCd\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_list2", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"chk\" type=\"STRING\" size=\"256\"/><Column id=\"minCnt\" type=\"STRING\" size=\"256\"/><Column id=\"maxCnt\" type=\"STRING\" size=\"256\"/><Column id=\"commTp\" type=\"STRING\" size=\"256\"/><Column id=\"chrSeq\" type=\"STRING\" size=\"256\"/><Column id=\"chanMclsCd\" type=\"STRING\" size=\"256\"/><Column id=\"chanLclsCd\" type=\"STRING\" size=\"256\"/><Column id=\"saleMinCnt\" type=\"STRING\" size=\"256\"/><Column id=\"commAmt\" type=\"STRING\" size=\"256\"/><Column id=\"saleMaxCnt\" type=\"STRING\" size=\"256\"/><Column id=\"seq\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
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
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cd\">Y</Col><Col id=\"cdNm\">사용</Col></Row><Row><Col id=\"cd\">N</Col><Col id=\"cdNm\">사용안함</Col></Row></Rows>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static01", "absolute", "1122", "0", "25", "496", null, null, this);
            obj.set_taborder("13");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "83", "1122", "20", null, null, this);
            obj.set_taborder("14");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "0", "99", "143", "20", null, null, this);
            obj.set_taborder("15");
            obj.set_text("방문점검 서비스 실적");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0", "114", null, "10", "25", null, this);
            obj.set_taborder("16");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "0", "32", "1122", "46", null, null, this);
            obj.set_taborder("0");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("Static22", "absolute", "1", "0", null, "12", "430", null, this.div_search);
            obj.set_taborder("9");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "0", "0", "20", "45", null, null, this.div_search);
            obj.set_taborder("10");
            obj.set_text("FIX \r\nw20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static44", "absolute", "81", "77", "47", "21", null, null, this.div_search);
            obj.set_taborder("11");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_color("red");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static23", "absolute", "1", "33", null, "12", "430", null, this.div_search);
            obj.set_taborder("12");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "-1", "33", "20", "45", null, null, this.div_search);
            obj.set_taborder("16");
            obj.set_text("FIX \r\nw20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static24", "absolute", "346", "0", "30", "44", null, null, this.div_search);
            obj.set_taborder("18");
            obj.set_text("FIX w30");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "346", "32", "30", "44", null, null, this.div_search);
            obj.set_taborder("20");
            obj.set_text("FIX w30");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition", "absolute", "20", "8", "114", "30", null, null, this.div_search);
            obj.set_taborder("27");
            obj.set_text("수수료명");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("CommTpNm", "absolute", "131", "12", "243", "21", null, null, this.div_search);
            obj.set_taborder("0");
            obj.set_lengthunit("ascii");
            obj.set_autoskip("true");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "0", "66", null, "12", "431", null, this.div_search);
            obj.set_taborder("34");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static46", "absolute", "130", "47", "1", "30", null, null, this.div_search);
            obj.set_taborder("35");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_background("red");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static45", "absolute", "125", "47", "1", "30", null, null, this.div_search);
            obj.set_taborder("36");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_background("red");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("CommTp", "absolute", "131", "12", "67", "21", null, null, this.div_search);
            obj.set_taborder("37");
            obj.set_lengthunit("ascii");
            obj.set_autoskip("true");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("CommTp00", "absolute", "395", "12", "67", "21", null, null, this.div_search);
            obj.set_taborder("38");
            obj.set_lengthunit("ascii");
            obj.set_autoskip("true");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("CommTp01", "absolute", "475", "12", "67", "21", null, null, this.div_search);
            obj.set_taborder("39");
            obj.set_lengthunit("ascii");
            obj.set_autoskip("true");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("CommTp02", "absolute", "555", "12", "67", "21", null, null, this.div_search);
            obj.set_taborder("40");
            obj.set_lengthunit("ascii");
            obj.set_autoskip("true");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("CommTp03", "absolute", "571", "12", "67", "21", null, null, this.div_search);
            obj.set_taborder("41");
            obj.set_lengthunit("ascii");
            obj.set_autoskip("true");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "600", "99", "203", "20", null, null, this);
            obj.set_taborder("19");
            obj.set_text("판매실적에 따른 방문점검 수수료");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Grid("Grid00", "absolute", "0", "124", "453", "92", null, null, this);
            obj.set_taborder("24");
            obj.set_binddataset("ds_list");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"70\"/><Column size=\"70\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"75\"/><Column size=\"72\"/></Columns><Rows><Row size=\"34\" band=\"head\"/><Row size=\"43\"/></Rows><Band id=\"head\"><Cell text=\"기준시작일\"/><Cell col=\"1\" text=\"기준종료일\"/><Cell col=\"2\" text=\"채널대분류\"/><Cell col=\"3\" text=\"채널중분류\"/><Cell col=\"4\" text=\"점검서비스 최소건수\" wordwrap=\"char\"/><Cell col=\"5\" text=\"점검서비스 최대건수\" wordwrap=\"char\"/></Band><Band id=\"body\"><Cell text=\"bind:strDay\"/><Cell col=\"1\" text=\"bind:endDay\"/><Cell col=\"2\" text=\"bind:chanLclsNm\"/><Cell col=\"3\" text=\"bind:chanMclsNm\"/><Cell col=\"4\" text=\"bind:minCnt\"/><Cell col=\"5\" text=\"bind:maxCnt\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Button("btn_search", "absolute", null, "9", "45", "22", "76", null, this);
            obj.set_taborder("25");
            obj.set_text("조회");
            obj.set_cssclass("btn_WF_CRUD");
            obj.getSetter("domainId").set("nexa.search");
            this.addChild(obj.name, obj);

            obj = new Button("btn_save", "absolute", null, "9", "45", "22", "28", null, this);
            obj.set_taborder("26");
            obj.set_text("저장");
            obj.set_cssclass("btn_WF_CRUD");
            obj.getSetter("domainId").set("nexa.search");
            this.addChild(obj.name, obj);

            obj = new Button("btnSaleListAdd", "absolute", null, "98", "45", "22", "76", null, this);
            obj.set_taborder("27");
            obj.set_text("추가");
            obj.set_cssclass("btn_WF_module");
            this.addChild(obj.name, obj);

            obj = new Button("btn_del", "absolute", null, "98", "45", "22", "28", null, this);
            obj.set_taborder("28");
            obj.set_text("삭제");
            obj.set_cssclass("btn_WF_module");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Grid("Grid01", "absolute", "600", "124", "514", "160", null, null, this);
            obj.set_taborder("29");
            obj.set_binddataset("ds_list2");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"50\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"70\"/><Column size=\"70\"/><Column size=\"60\"/><Column size=\"100\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell text=\"선택\"/><Cell col=\"1\" text=\"점검서비스 최소건수\" wordwrap=\"char\"/><Cell col=\"2\" text=\"점검서비스 최대건수\" wordwrap=\"char\"/><Cell col=\"3\" text=\"판매 실적 최소 건수\" wordwrap=\"char\"/><Cell col=\"4\" text=\"판매 실적  최대 건수\" wordwrap=\"char\"/><Cell col=\"5\" text=\"수수료\"/><Cell col=\"6\" text=\"사용여부\"/></Band><Band id=\"body\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\" text=\"bind:chk\"/><Cell col=\"1\" text=\"bind:minCnt\"/><Cell col=\"2\" text=\"bind:maxCnt\"/><Cell col=\"3\" edittype=\"normal\" text=\"bind:saleMinCnt\"/><Cell col=\"4\" edittype=\"normal\" text=\"bind:saleMaxCnt\"/><Cell col=\"5\" edittype=\"normal\" text=\"bind:commAmt\"/><Cell col=\"6\" displaytype=\"combo\" edittype=\"combo\" text=\"bind:useYn\" combodataset=\"useYn\" combocodecol=\"cd\" combodatacol=\"cdNm\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1122, 46, this.div_search,
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
            obj = new Layout("default", "", 1147, 496, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("test_form");
            		p.set_titletext("방문점검 서비스수수료상세");
            		p.style.set_color("#333333ff");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item16","div_search.CommTpNm","value","ds_chgInfo","expireY");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item0","div_search.CommTp","value","ds_chgInfo","expireY");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item1","div_search.CommTp00","value","ds_chgInfo","expireY");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item2","div_search.CommTp01","value","ds_chgInfo","expireY");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item3","div_search.CommTp02","value","ds_chgInfo","expireY");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item4","div_search.CommTp03","value","ds_chgInfo","expireY");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTREVisitorService_pop.xfdl", "lib::comLib.xjs");
        this.registerScript("RTREVisitorService_pop.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분 : 수금관리 > 수수료 > 방문점검 서비스 수수료 상세(팝업)
         * 02. 그룹명   : RTREVisitorService_pop.xfdl
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

        	/***********************************************************************
        	 * 그룹 변수 선언부
        	 ************************************************************************/
        	
        	this.saveFlag	= "";   //저장구분(I:등록,U:수정)
        	this.saveDate	= "";	//등록일자
        	this.custNo		= "";   //고객번호
        	this.ordNo		= "";	//계약번호
        	this.btnFlag	= true;	//팝업버튼 활성화FLAG
        	this.ramgYm		= "";   //채권관리년월
            //-------------------------------------------------------------------------------   
        	//폼로드시 공통함수      
        	//-------------------------------------------------------------------------------  	 
        	this.form_onload = function(obj,e)
        	{
        		Ex.core.init(obj);
        		this.div_search.CommTp.set_value(this.parent.p_commTp);
        		this.div_search.CommTpNm.set_value(this.parent.p_commTpNm);
        		this.div_search.CommTp00.set_value(this.parent.p_chanLcCd);
        		this.div_search.CommTp01.set_value(this.parent.p_chanMcCd);
        		this.div_search.CommTp02.set_value(this.parent.p_min);		
        		this.div_search.CommTp03.set_value(this.parent.p_max);
        		this.fn_search();
        		this.fn_search2();

        	} 
            //-------------------------------------------------------------------------------   
        	//초기화  
        	//------------------------------------------------------------------------------- 	
        	 
        	/***********************************************************************************
        	* Transaction Function
        	***********************************************************************************/
        //  	//---------------------------------------------------------------------------------
        // 	// 공통코드 조회
        // 	//---------------------------------------------------------------------------------
        // 	this.fn_getCommCode  = function() {
        // 		var sSvcID      	= "getCommCode";  
        // 		var sController   	= "ntrms/re/getBondMngCode.do";
        // 		var sInDatasets   	= "";
        // 		var sOutDatasets  	= "ds_R035=outputR035";
        // 		var sArgs 			= "";	
        // 		var fn_callBack		= "fn_callBack";
        // 		
        // 		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 		
        // 	}	

         	//---------------------------------------------------------------------------------
        	// 채권계정 내역 조회
        	//---------------------------------------------------------------------------------		
        	this.fn_search = function()
        	{
        	
        		var sSvcID      	= "visitorService";  
        		var sController   	= "ntrms/re/visitorService.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_list=output";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";

        		sArgs += Ex.util.setParam("commTp"	    , nvl(this.div_search.CommTp.value));		//고객번호
        		sArgs += Ex.util.setParam("chrSeq"	    , nvl(this.parent.p_chrSeq));		//고객번호
        	
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 	
        	}
        	
        	 	//---------------------------------------------------------------------------------
        	// 채권계정 내역 조회
        	//---------------------------------------------------------------------------------		
        	this.fn_search2 = function()
        	{
        		var sSvcID      	= "visitorService2";  
        		var sController   	= "ntrms/re/visitorService2.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_list2=output";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";

        		sArgs += Ex.util.setParam("commTp"	    , nvl(this.div_search.CommTp.value));		//고객번호
        	
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 		
        	}

        	
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
        			case "visitorService2":
        			this.ds_list2.addColumn("chk", "string", 256);
        			this.ds_list2.addColumn("minCnt", "string", 256);
        			this.ds_list2.addColumn("maxCnt", "string", 256);
        			
        			for(var i=0; i<this.ds_list2.getRowCount();i++){
        			this.ds_list2.setColumn(i,"commTp",this.div_search.CommTp.value);
        			this.ds_list2.setColumn(i,"chanLclsCd",this.div_search.CommTp00.value);
        			this.ds_list2.setColumn(i,"chanMclsCd",this.div_search.CommTp01.value);
        			this.ds_list2.setColumn(i,"minCnt",this.div_search.CommTp02.value);
        			this.ds_list2.setColumn(i,"maxCnt",this.div_search.CommTp03.value);
        			}
        			break;
        			
        		
        			//채권계정내역 조회				
        			case "visitorService":		
        				//			
        				if(this.ds_list.rowcount == 0) {
        					this.Grid00.set_nodatatext("조회된 결과가 없습니다.");
        				}
        				if(this.ds_list.rowcount > 0) {
        					this.ds_list.set_rowposition(0);
        					var pos = this.ds_list.rowposition;					
        				}
        // 				for(var i =0;i<this.ds_list.getRowCount();i++){
        // 				alert(this.ds_list.getColumn(i,"chanLclsCd"));
        // 				alert(this.ds_list.getColumn(i,"chanMclsCd"));
        // 				}
        				

        				break;
        			//계약별내역 조회	
        			
        			default:
        				break;
        		}
        	}

        	/***********************************************************************************
        	* Component Event
        	***********************************************************************************/

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
        	//고객번호  Enter키 이벤트 처리
            //-------------------------------------------------------------------------------  	
        	this.custNo_onkeyup = function(obj,e)
        	{
        		this.div_search.edt_custNoKeyword.set_value("");	
        		if ( e.keycode == 13 )
        		{
        			if(nvl(this.div_search.edt_custNo.value) == "") {
        				this.alert("고객번호를 입력하세요");
        				this.div_search.edt_custNo.setFocus();
        				return;
        			}
        			//고객명 조회
        			this.fn_getCustNm();
        		}		
        	}	

        	
        this.btn_del_onclick = function(obj,e)
        {
        	for(var i =0; i<this.ds_list2.getRowCount();i++){
        	if(this.ds_list2.getColumn(i,"chk",1)==1){
        		this.ds_list2.deleteRow(this.Grid01.currentrow);
        	}
        	}

        }

        this.btn_search_onclick = function(obj,e)
        {
        	this.fn_search();
        	this.fn_search2();
        }

        this.div_search_btnSaleListAdd_onclick = function(obj,e)
        {
        	
        	var nCnt = this.ds_list2.getRowCount();
        	var row = this.ds_list2.getRowCount()-1;
        	
        	if(this.ds_list2.getColumn(row,"saleMinCnt")==null || this.ds_list2.getColumn(row,"saleMinCnt")==""){
        	alert("판매실적 최소건수를 입력해주세요");
        	return;
        	}
        		
        	if(this.ds_list2.getColumn(row,"saleMaxCnt")==null || this.ds_list2.getColumn(row,"saleMaxCnt")==""){
        	alert("판매실적 최대건수를 입력해주세요");
        	return;
        	}
        	
        	var nRow = this.ds_list2.addRow();

        	this.ds_list2.setColumn(nRow,"commTp",this.div_search.CommTp.value);
        	this.ds_list2.setColumn(nRow,"chanMclsCd",this.div_search.CommTp00.value);
        	this.ds_list2.setColumn(nRow,"chanLclsCd",this.div_search.CommTp01.value);
        	this.ds_list2.setColumn(nRow,"minCnt",this.div_search.CommTp02.value);
        	this.ds_list2.setColumn(nRow,"maxCnt",this.div_search.CommTp03.value);
        }

        
        this.visitorService2_oncolumnchanged = function(obj,e)
        {
        	var sColId 	= e.columnid;
        	var nRow 	= e.row;
        	
        	if(sColId == "saleMinCnt") { //최소건 입력 시
        		
        		for(var i =0;i<nRow;i++){
        			var curMinCnt2 = nvl(obj.getColumn(i,"saleMinCnt"),0);
        			var prvMinCnt2 = nvl(obj.getColumn(i,"saleMaxCnt"),0);
        			var curMinCnt = nvl(obj.getColumn(nRow,"saleMinCnt"),0);
        			var curMaxCnt = nvl(obj.getColumn(nRow,"saleMaxCnt"),0);

        			if(parseInt(curMinCnt2)<=parseInt(curMinCnt)){
        				if(parseInt(curMinCnt)<=parseInt(prvMinCnt2)){
        				alert("이전행 보다 값이 작습니다. 다시 입력하여 주십시오");
        				obj.setColumn(nRow, "saleMinCnt", "");
        				return;
        				}
        			}		
        		}
        	} else if(sColId == "saleMaxCnt") { //최대건 입력 시

        		var curMinCnt = nvl(obj.getColumn(nRow,"saleMinCnt"),0);
        		var curMaxCnt = nvl(obj.getColumn(nRow,"saleMaxCnt"),0);
        		
        			if(parseInt(curMaxCnt) <= parseInt(curMinCnt)) {
        				alert("최대건이 최소건보다 작습니다. 다시 입력하여 주십시오");
        				obj.setColumn(nRow, "saleMaxCnt", "");
        				return;
          			}
        			for(var i =0;i<nRow;i++){
        				var curMinCnt2 = nvl(obj.getColumn(i,"saleMinCnt"),0);
        				var prvMinCnt2 = nvl(obj.getColumn(i,"saleMaxCnt"),0);	
        			
        			if(parseInt(curMinCnt)<=parseInt(curMinCnt2)){
        			
        				if(parseInt(curMaxCnt)>=parseInt(prvMinCnt2)){
        					alert("최대건이 이전최소건보다 작습니다. 다시 입력하여 주십시오");
        					obj.setColumn(nRow, "saleMaxCnt", "");
        					return;
        				}
        			}
        			if(parseInt(curMinCnt2)<=parseInt(curMaxCnt)){
        				if(parseInt(curMaxCnt)<parseInt(prvMinCnt2)){
        					alert("최대건이 이전최소건보다 작습니다. 다시 입력하여 주십시오2");
        					obj.setColumn(nRow, "saleMaxCnt", "");
        					return;
        				}
        			}
        		}
        	}
        }

        this.btn_save_onclick = function(obj,e)
        {
        	var changeCount = 0;
        	var cnt = this.ds_list2.getRowCount();
        		
        	for( var i = 0 ; i < cnt ; i++ ){
        		var iRowType = this.ds_list2.getRowType(i);
        		if( iRowType == 2 || iRowType == 4 || iRowType == 8 ){ //2:Insert, 4:Update, 8:Delete
        			changeCount++;
        		}
        	}
        	
        	if( changeCount == 0 ) {
        		alert('변경된 데이터가 없습니다.');
        		return false;
        	}

        	if( confirm( "저장하시겠습니까?") ){
        		var sSvcID        	= "saveVisitorService";
        		var sController   	= "/ntrms/re/saveVisitorService.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";
        		sInDatasets   		= "input=ds_list2:U";
        		sOutDatasets  		= "";
        		var fn_callBack		= "fn_callBack";
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        }

        this.Grid01_oncellclick = function(obj,e)
        {
        	var sColId 		= e.col;
        	var nRow 		= e.row;
        	
        	for (var i=0; i<=this.ds_list2.rowcount; i++) {
        		
        		if(this.ds_list2.rowposition == i) {
        			this.ds_list2.addColumn("chk", "STRING", "256")
        		}
        		else {
        			this.ds_list2.setColumn(i,"chk","0");
        		}
        	}
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.ds_list2.addEventHandler("oncolumnchanged", this.visitorService2_oncolumnchanged, this);
            this.addEventHandler("onload", this.form_onload, this);
            this.div_search.CommTpNm.addEventHandler("onchanged", this.cal_accReqDate_onchanged, this);
            this.div_search.CommTp.addEventHandler("onchanged", this.cal_accReqDate_onchanged, this);
            this.div_search.CommTp00.addEventHandler("onchanged", this.cal_accReqDate_onchanged, this);
            this.div_search.CommTp01.addEventHandler("onchanged", this.cal_accReqDate_onchanged, this);
            this.div_search.CommTp02.addEventHandler("onchanged", this.cal_accReqDate_onchanged, this);
            this.div_search.CommTp03.addEventHandler("onchanged", this.cal_accReqDate_onchanged, this);
            this.btn_search.addEventHandler("onclick", this.btn_search_onclick, this);
            this.btn_save.addEventHandler("onclick", this.btn_save_onclick, this);
            this.btnSaleListAdd.addEventHandler("onclick", this.div_search_btnSaleListAdd_onclick, this);
            this.btn_del.addEventHandler("onclick", this.btn_del_onclick, this);
            this.Grid01.addEventHandler("oncellclick", this.Grid01_oncellclick, this);

        };

        this.loadIncludeScript("RTREVisitorService_pop.xfdl");

       
    };
}
)();
