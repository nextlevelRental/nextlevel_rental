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
                this.set_titletext("가격등록");
                this._setFormPosition(0,0,1147,496);
            }
            this.getSetter("inheritanceid").set("");

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("dsPrice", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"endDay\" type=\"string\" size=\"32\"/><Column id=\"matCd\" type=\"string\" size=\"32\"/><Column id=\"strDay\" type=\"string\" size=\"32\"/><Column id=\"chgId\" type=\"string\" size=\"32\"/><Column id=\"useYn\" type=\"string\" size=\"32\"/><Column id=\"priceCd\" type=\"string\" size=\"32\"/><Column id=\"amt\" type=\"bigdecimal\" size=\"16\"/><Column id=\"matNm\" type=\"string\" size=\"32\"/><Column id=\"periodCd\" type=\"string\" size=\"32\"/><Column id=\"cntCd\" type=\"string\" size=\"32\"/><Column id=\"chgDt\" type=\"string\" size=\"32\"/><Column id=\"seq\" type=\"bigdecimal\" size=\"16\"/><Column id=\"regiCd\" type=\"string\" size=\"32\"/><Column id=\"regDt\" type=\"string\" size=\"32\"/><Column id=\"regId\" type=\"string\" size=\"32\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("comPrice", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cdDesc\" type=\"string\" size=\"32\"/><Column id=\"cdNm\" type=\"string\" size=\"32\"/><Column id=\"cd\" type=\"string\" size=\"32\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("comPeriod", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cdDesc\" type=\"string\" size=\"32\"/><Column id=\"cdNm\" type=\"string\" size=\"32\"/><Column id=\"cd\" type=\"string\" size=\"32\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("comCntCd", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cdDesc\" type=\"string\" size=\"32\"/><Column id=\"cdNm\" type=\"string\" size=\"32\"/><Column id=\"cd\" type=\"string\" size=\"32\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("comRegi", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cdDesc\" type=\"string\" size=\"32\"/><Column id=\"cdNm\" type=\"string\" size=\"32\"/><Column id=\"cd\" type=\"string\" size=\"32\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static55", "absolute", "748", "435", "374", "31", null, null, this);
            obj.set_taborder("107");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static17", "absolute", "0", "405", "1122", "31", null, null, this);
            obj.set_taborder("102");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static10", "absolute", "0", "435", "749", "31", null, null, this);
            obj.set_taborder("50");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_BG", "absolute", "10", "0", null, "40", "-10", null, this);
            obj.set_cssclass("sta_WF_SearchBox");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "0", "0", "1122", "45", null, null, this);
            obj.set_taborder("19");
            obj.set_text("Div00");
            obj.set_cssclass("div_WF_searchBg");
            obj.set_scrollbars("none");
            this.addChild(obj.name, obj);
            obj = new Static("st_searchCondition", "absolute", "25", "12", "80", "20", null, null, this.div_search);
            obj.set_taborder("15");
            obj.set_text("가격유형");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cmb_searchCondition", "absolute", "105", "12", "140", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("17");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj.set_enable("false");
            obj.set_innerdataset("@comPrice");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_index("-1");
            obj = new Static("st_searchCondition01", "absolute", "270", "12", "80", "20", null, null, this.div_search);
            obj.set_taborder("20");
            obj.set_text("상품");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("matCd", "absolute", "350", "12", "140", "21", null, null, this.div_search);
            obj.set_taborder("21");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_save00", "absolute", "468", "11", "21", "21", null, null, this.div_search);
            obj.set_taborder("22");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static22", "absolute", "0", "0", "1118", "12", null, null, this.div_search);
            obj.set_taborder("23");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static23", "absolute", "0", "33", "1118", "12", null, null, this.div_search);
            obj.set_taborder("24");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "0", "61", "81", "20", null, null, this);
            obj.set_taborder("24");
            obj.set_text("검색결과");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "0", "0", "25", "45", null, null, this);
            obj.set_taborder("27");
            obj.set_text("FIX \r\nw20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static24", "absolute", "245", "0", "25", "44", null, null, this);
            obj.set_taborder("28");
            obj.set_text("FIX \r\nw30");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "0", "381", "97", "20", null, null, this);
            obj.set_taborder("35");
            obj.set_text("신규가격등록");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static07", "absolute", "374", "435", "130", "31", null, null, this);
            obj.set_taborder("38");
            obj.set_text("타이어본수");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("matCd", "absolute", "134", "410", "116", "21", null, null, this);
            obj.set_taborder("39");
            this.addChild(obj.name, obj);

            obj = new Static("Static08", "absolute", "748", "435", "130", "31", null, null, this);
            obj.set_taborder("43");
            obj.set_text("등록비코드");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static19", "absolute", "0", "405", "130", "31", null, null, this);
            obj.set_taborder("46");
            obj.set_text("상품");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.addChild(obj.name, obj);

            obj = new Static("Static18", "absolute", "0", "435", "130", "31", null, null, this);
            obj.set_taborder("47");
            obj.set_text("기간코드");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.addChild(obj.name, obj);

            obj = new Static("Static11", "absolute", "0", "465", "1122", "31", null, null, this);
            obj.set_taborder("51");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static14", "absolute", "0", "465", "130", "31", null, null, this);
            obj.set_taborder("57");
            obj.set_text("적용일");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.addChild(obj.name, obj);

            obj = new Edit("matNm", "absolute", "254", "410", "489", "21", null, null, this);
            obj.set_taborder("75");
            this.addChild(obj.name, obj);

            obj = new Button("Button02", "absolute", "228", "409", "20", "21", null, null, this);
            obj.set_taborder("77");
            obj.set_cssclass("btn_WF_edtSch");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Combo("periodCd", "absolute", "134", "440", "236", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("104");
            obj.set_value("0");
            obj.set_displayrowcount("5");
            obj.set_innerdataset("@comPeriod");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_index("0");

            obj = new Combo("cntCd", "absolute", "507", "440", "236", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("117");
            obj.set_value("0");
            obj.set_displayrowcount("5");
            obj.set_innerdataset("@comCntCd");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_index("0");

            obj = new Combo("regiCd", "absolute", "882", "440", "98", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("118");
            obj.set_displayrowcount("5");
            obj.set_innerdataset("@comRegi");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cd");
            obj.set_index("-1");

            obj = new Edit("regiAmt", "absolute", "984", "440", "133", "21", null, null, this);
            obj.set_taborder("119");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Calendar("strDay", "absolute", "134", "470", "117", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("120");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_value("null");

            obj = new Calendar("endDay", "absolute", "255", "470", "115", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("121");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_value("null");
            obj.set_readonly("true");

            obj = new Static("Static09", "absolute", "374", "465", "130", "31", null, null, this);
            obj.set_taborder("123");
            obj.set_text("가격유형");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Combo("priceCd", "absolute", "508", "470", "236", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("124");
            obj.set_innerdataset("@comPrice");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");

            obj = new Static("Static12", "absolute", "748", "465", "130", "31", null, null, this);
            obj.set_taborder("125");
            obj.set_text("렌탈료");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("amt", "absolute", "882", "470", "234", "21", null, null, this);
            obj.set_taborder("126");
            obj.set_inputtype("number");
            obj.set_maxlength("13");
            this.addChild(obj.name, obj);

            obj = new Grid("Grid01", "absolute", "0", "85", "1122", "281", null, null, this);
            obj.set_taborder("127");
            obj.set_binddataset("dsPrice");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"120\"/><Column size=\"285\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"상품코드\"/><Cell col=\"1\" text=\"상품명\"/><Cell col=\"2\" text=\"기간코드\"/><Cell col=\"3\" text=\"타이어본수\"/><Cell col=\"4\" text=\"등록비코드\"/><Cell col=\"5\" text=\"적용시작일\"/><Cell col=\"6\" text=\"적용종료일\"/><Cell col=\"7\" text=\"순번\"/><Cell col=\"8\" text=\"렌탈료\"/></Band><Band id=\"body\"><Cell text=\"bind:matCd\"/><Cell col=\"1\" text=\"bind:matNm\"/><Cell col=\"2\" text=\"bind:periodCd\"/><Cell col=\"3\" text=\"bind:cntCd\"/><Cell col=\"4\" text=\"bind:regiCd\"/><Cell col=\"5\" displaytype=\"date\" text=\"bind:strDay\" calendardisplaynulltype=\"none\"/><Cell col=\"6\" displaytype=\"date\" text=\"bind:endDay\" calendardisplaynulltype=\"none\"/><Cell col=\"7\" text=\"bind:seq\"/><Cell col=\"8\" style=\"align:right;\" text=\"bind:amt\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "45", "1147", "20", null, null, this);
            obj.set_taborder("128");
            obj.set_text("Static02");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "0", "75", "1147", "10", null, null, this);
            obj.set_taborder("129");
            obj.set_text("Static02");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1122", "0", "25", "690", null, null, this);
            obj.set_taborder("130");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0", "366", "1147", "20", null, null, this);
            obj.set_taborder("131");
            obj.set_text("Static02");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "396", "1147", "10", null, null, this);
            obj.set_taborder("132");
            obj.set_text("Static02");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1122, 45, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("19");
            		p.set_text("Div00");
            		p.set_cssclass("div_WF_searchBg");
            		p.set_scrollbars("none");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1147, 496, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("Authority");
            		p.getSetter("inheritanceid").set("");
            		p.set_titletext("가격등록");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item0","matCd","value","dsPrice","matCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item1","matNm","value","dsPrice","matNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item2","periodCd","value","dsPrice","periodCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item3","cntCd","value","dsPrice","cntCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item4","regiCd","value","dsPrice","regiCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item5","strDay","value","dsPrice","strDay");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item6","endDay","value","dsPrice","endDay");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item7","priceCd","value","dsPrice","priceCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item8","amt","value","dsPrice","amt");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTSDPriceInput.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDPriceInput.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분 : 사용자 등록관리
         * 02. 그룹명   :
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
         * 그룹 변수 선언부
         ************************************************************************/
        	//팝업에서 전달받은 변수 저장
        	this.arr ;

        	this.form_onload = function(obj,e)
        	{
        		/* 1. N : 신규추가
        		 * 2. S : 조회
        		 * 3. C : 데이타생성
        		 * 4. E : 엑셀데이타생성
        		 */
        		Ex.core.init(obj); 	
        		this.parent.setButton("E|C|N|S", this);
        		this.listCommInfo(); //화면로드시 공통코드 조회
        	} 
        	 
        	/***********************************************************************************
        	* Transaction Function
        	***********************************************************************************/
        	//공통
        	this.listCommInfo = function()
        	{
        		var sSvcID        	= "listCommInfo";                    
        		var sController   	= "rtms/sd/listCommInfo.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "comPrice=com_price comPeriod=com_period comCntCd=com_cnt_cd comRegi=com_regi";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        	}

        	/***********************************************************************************
        	* Transaction Function
        	***********************************************************************************/
        	//목록조회 Search
        	this.fn_search = function()
        	{
        		this.dsPrice.clearData();
        		var matCd 			= nvl(this.div_search.matCd.value);
        		var sSvcID        	= "listPriceInfo";                    
        		var sController   	= "rtms/sd/listPriceInfo.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "dsPrice=ds_output";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        			sArgs += " matCd=" + matCd;		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        	}
        	
        	//
        	this.submitFormCheck = function() {
        		if(nvl(this.matCd.value) == "") {
        			alert("상품정보조회후 등록 해주십시오.");
        			return false;
        		}
        		if(nvl(this.periodCd.value) == "") {
        			alert("기간코드 선택후 등록 해주십시오.");
        			return false;
        		}
        		if(nvl(this.cntCd.value) == "") {
        			alert("타이어본수 선택후 등록 해주십시오.");
        			return false;
        		}
        		if(nvl(this.regiCd.value) == "") {
        			alert("등록비코드 선택후 등록 해주십시오.");
        			return false;
        		}
        		if(nvl(this.strDay.value) == "") {
        			alert("적용시작일 선택후 등록 해주십시오.");
        			return false;
        		}
        		
        		if(nvl(this.priceCd.value) == "") {
        			alert("적용시작일 선택후 등록 해주십시오.");
        			return false;
        		}
        		
        		if(nvl(this.amt.value) == "") {
        			alert("렌탈금액 입력 후 등록해주십시오.");
        			return false;
        		}

        		if(parseInt(nvl(this.strDay.value)) >= parseInt(nvl(this.endDay.value))) {
        			alert('적용시작일은 적용종료일보다 작거나 같을수 없습니다.');
        			return false;
        		}
        		return true;
        	}
        	
        	/***********************************************
        	 * 동일자료건보다 높은 날짜등록 불가처리
        	 ***********************************************/
        	this.checkCodeExists = function() {
        		var f = false;
        		
        		//선택된 Row저장
        		var v_matCd 	= this.matCd.value;
        		var v_priceCd 	= this.priceCd.value;
        		var v_periodCd 	= this.periodCd.value;
        		var v_cntCd 	= this.cntCd.value;
        		var v_regiCd 	= this.regiCd.value;
        		var v_strDay 	= parseInt(this.strDay.value);
        		var v_amt		= this.amt.value;
        		var pos			= this.dsPrice.rowposition;
        		var v_amt2		= this.dsPrice.getOrgColumn(pos, "amt");
        		
        		var cnt = this.dsPrice.getRowCount();
        		for(var i = 0; i<cnt; i++) {
        			var matCd 		= this.dsPrice.getColumn(i, "matCd");
        			var priceCd 	= this.dsPrice.getColumn(i, "priceCd");
        			var periodCd 	= this.dsPrice.getColumn(i, "periodCd");
        			var cntCd 		= this.dsPrice.getColumn(i, "cntCd");
        			var regiCd 		= this.dsPrice.getColumn(i, "regiCd");
        			var strDay		= parseInt(this.dsPrice.getOrgColumn(i, "strDay"));
        			

        			f = ( 	
        				 matCd 		== v_matCd && 
        				 priceCd 	== v_priceCd && 
        				 periodCd 	== v_periodCd && 
        				 cntCd 		== v_cntCd && 
        				 regiCd 	== v_regiCd &&
        				 v_strDay 	<=  strDay &&
        				 i != this.dsPrice.rowposition &&
        				 v_amt == v_amt2
        				 );
        			if(f) {
        				alert('입력하신 적용시작일은 [' + i + ']행의 적용시작일보다 작거나 같을수 없습니다.');
        				break;
        			}
        		}
        		return f;
        	}
        	
        	this.fn_updateCnt = function() {
        		var b = false;
        		var cnt = this.dsPrice.getRowCount();
        		var updateCnt = 0;
        		for(var i = 0; i<cnt; i++) {
        			if(this.dsPrice.getRowType(i) == 4 || this.dsPrice.getRowType(i) == 2) {
        				b = true;
        				break;
        			}
        		}
        		return b;
        	}
        	//저장
        	this.fn_save = function()
        	{
        		if(!this.submitFormCheck()) {
        			return;
        		}
        		
        		if(this.checkCodeExists()) {
        			return;
        		}
        		
        		if(!this.fn_updateCnt()) {
        			alert('변경된 데이타가 없습니다.');
        			return;
        		}
        		
        		var sSvcID        	= "savePriceInfo";                    
        		var sController   	= "rtms/sd/savePriceInfo.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		sInDatasets   		= "input=dsPrice:U";
        		sOutDatasets  		= "";
        		var fn_callBack		= "fn_callBack";
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        	
        	/***********************************************************************************
        	* CallBack Event (strSvcId - Sevice ID, nErrorCode - ErrorCode, strErrorMsg - Error Message)
        	***********************************************************************************/

        	/* callBack함수 */
        	this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg)
        	{ 
        		if (nErrorCode < 0) {
        			alert(strErrorMsg);		
        		}
        		
        		if (strSvcId == "listCommInfo") {
        			this.div_search.cmb_searchCondition.set_value("0002");
        			
        		}
        		if (strSvcId == "listPriceInfo") {
        			//기본값렌탈료 세팅..
        		}
        		
        		if (strSvcId == "savePriceInfo") {
        			alert(strErrorMsg);
        			this.fn_search();
        			/*
        			this.regiAmt.set_value("");
        			this.matNm.set_value("");
        			*/
        		}
        	}

        	/***********************************************************************************
        	* Component Event
        	***********************************************************************************/

        	//=======================================
        	//검색 시 Enter키 이벤트 처리
        	//=======================================
        	this.div_search_edt_searchKeyword_onkeyup = function(obj,e){
        		if ( e.keycode == 13 ){
        			this.fn_search();
        		}
        	}

        	/***********************************************************************************
        	* User Function
        	***********************************************************************************/
        	//상품조회
        	this.searchProeuctPop = function(obj,e){
        		var args ={p_formId :"RTSDCampReg" };
        		Ex.core.popup(this,"상품조회","comm::RTCOMMCampProductPopUp.xfdl",args, "modaless=false");
        	}
        	
        	//=======================================
        	//상품조회 파라미터 반환
        	//=======================================
        	this.returnProduct = function(arr) {
        		this.arr = arr;
        		this.div_search.matCd.set_value(arr.cd);
        		this.fn_search();
        	}
        	
        	//========================================================
        	//신규등록 상품팝업조회
        	//========================================================
        	this.searchProductInfo = function(obj,e){
        		this.popup_type = "N";
        		var args ={p_formId :"RTSDCampReg" };
        		Ex.core.popup(this,"상품조회","sd::RTSDCampProductPopUp.xfdl",args, "modaless=false");
        	}
        	
        	//========================================================
        	// 등록비선택시 금액출력
        	//========================================================
        	this.changeRegiAmt = function(obj,e){
        		var cd = this.regiCd.value;
        		var row = this.regiCd.index;
        		this.regiAmt.set_value(this.comRegi.getColumn(row, "cdNm"));
        	}
        	
        	//========================================================
        	// 추가 버튼클릭시 DataSet에 새로운Row추가
        	//========================================================
        	this.fn_add = function() {
        	
        		if(nvl(this.div_search.matCd.value) == "") {
        			alert("상품검색후 추가해주십시오");
        			return;
        		}
        		
        		if(this.fn_updateCnt()) {
        			alert("수정 및 신규작성중인 자료저장후 추가해주십시오.");
        			return;
        		}
        	
        		var row = this.dsPrice.addRow();
        		//조회된 자료가 없고 추가버튼이 클릭된경우처리
        		
        		this.dsPrice.setColumn(row, "matCd", this.arr.cd);
        		this.dsPrice.setColumn(row, "matNm", this.arr.nm);
        		this.dsPrice.setColumn(row, "endDay", "99991231");
        		this.dsPrice.setColumn(row, "priceCd", "0002");
        		this.priceCd.set_enable(false);
        		this.dsPrice.setColumn(row, "useYn", "Y");
        	}

        	this.fn_excel= function() {
        		Ex.core.exportExcel(this, this.Grid01);
        	}
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("ontimer", this.form_ontimer, this);
            this.addEventHandler("onload", this.form_onload, this);
            this.div_search.matCd.addEventHandler("onkeyup", this.div_search_matCd_onkeyup, this);
            this.div_search.btn_save00.addEventHandler("onclick", this.searchProeuctPop, this);
            this.Button02.addEventHandler("onclick", this.searchProductInfo, this);
            this.cntCd.addEventHandler("onitemchanged", this.div_search00_userGrp_onitemchanged, this);
            this.regiCd.addEventHandler("onitemchanged", this.changeRegiAmt, this);

        };

        this.loadIncludeScript("RTSDPriceInput.xfdl");

       
    };
}
)();
