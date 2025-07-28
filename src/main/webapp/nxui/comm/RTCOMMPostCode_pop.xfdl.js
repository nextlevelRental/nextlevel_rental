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
                this.set_name("RTCOMMPostCode_pop");
                this.set_classname("RTCMPostCode_pop");
                this.set_titletext("우편번호조회");
                this._setFormPosition(0,0,720,521);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_postCode", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"rnAddr1D\" size=\"256\"/><Column id=\"rnAddr2D\" size=\"256\"/><Column id=\"rnAddr1B\" size=\"256\"/><Column id=\"rnAddr2B\" size=\"256\"/><Column id=\"bldMngNo\" size=\"256\"/><Column id=\"areaNum\" size=\"256\"/><Column id=\"doNm\" size=\"256\"/><Column id=\"doNmE\" size=\"256\"/><Column id=\"ctNm\" size=\"256\"/><Column id=\"ctNmE\" size=\"256\"/><Column id=\"emNm\" size=\"256\"/><Column id=\"emNmE\" size=\"256\"/><Column id=\"rdCd\" size=\"256\"/><Column id=\"rdNm\" size=\"256\"/><Column id=\"rdNmE\" size=\"256\"/><Column id=\"undrGrnd\" size=\"256\"/><Column id=\"bldMb\" size=\"256\"/><Column id=\"bldSb\" size=\"256\"/><Column id=\"mdNm\" size=\"256\"/><Column id=\"bldNm1\" size=\"256\"/><Column id=\"bDngCd\" size=\"256\"/><Column id=\"bDngNm\" size=\"256\"/><Column id=\"bRiNm\" size=\"256\"/><Column id=\"hDngNm\" size=\"256\"/><Column id=\"sCd\" size=\"256\"/><Column id=\"lotMb\" size=\"256\"/><Column id=\"dngSeq\" size=\"256\"/><Column id=\"lotSb\" size=\"256\"/><Column id=\"zipNum\" size=\"256\"/><Column id=\"seq\" size=\"256\"/><Column id=\"sidoCd\" size=\"256\"/><Column id=\"sigunCd\" size=\"256\"/><Column id=\"useYn\" size=\"256\"/><Column id=\"regId\" size=\"256\"/><Column id=\"regDt\" size=\"256\"/><Column id=\"chgId\" size=\"256\"/><Column id=\"chgDt\" size=\"256\"/><Column id=\"totalCnt\" size=\"256\"/><Column id=\"siNm\" type=\"STRING\" size=\"256\"/><Column id=\"sggNm\" type=\"STRING\" size=\"256\"/><Column id=\"emdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_postCode2", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"rnAddr1D\" size=\"256\"/><Column id=\"rnAddr2D\" size=\"256\"/><Column id=\"rnAddr1B\" size=\"256\"/><Column id=\"rnAddr2B\" size=\"256\"/><Column id=\"bldMngNo\" size=\"256\"/><Column id=\"areaNum\" size=\"256\"/><Column id=\"doNm\" size=\"256\"/><Column id=\"doNmE\" size=\"256\"/><Column id=\"ctNm\" size=\"256\"/><Column id=\"ctNmE\" size=\"256\"/><Column id=\"emNm\" size=\"256\"/><Column id=\"emNmE\" size=\"256\"/><Column id=\"rdCd\" size=\"256\"/><Column id=\"rdNm\" size=\"256\"/><Column id=\"rdNmE\" size=\"256\"/><Column id=\"undrGrnd\" size=\"256\"/><Column id=\"bldMb\" size=\"256\"/><Column id=\"bldSb\" size=\"256\"/><Column id=\"mdNm\" size=\"256\"/><Column id=\"bldNm1\" size=\"256\"/><Column id=\"bDngCd\" size=\"256\"/><Column id=\"bDngNm\" size=\"256\"/><Column id=\"bRiNm\" size=\"256\"/><Column id=\"hDngNm\" size=\"256\"/><Column id=\"sCd\" size=\"256\"/><Column id=\"lotMb\" size=\"256\"/><Column id=\"dngSeq\" size=\"256\"/><Column id=\"lotSb\" size=\"256\"/><Column id=\"zipNum\" size=\"256\"/><Column id=\"seq\" size=\"256\"/><Column id=\"sidoCd\" size=\"256\"/><Column id=\"sigunCd\" size=\"256\"/><Column id=\"useYn\" size=\"256\"/><Column id=\"regId\" size=\"256\"/><Column id=\"regDt\" size=\"256\"/><Column id=\"chgId\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/><Column id=\"totalCnt\" size=\"256\"/><Column id=\"siNm\" type=\"STRING\" size=\"256\"/><Column id=\"sggNm\" type=\"STRING\" size=\"256\"/><Column id=\"emdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_do", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_ct", this);
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
            obj = new Grid("grid_postCode", "absolute", "10", "173", "700", "300", null, null, this);
            obj.set_taborder("4");
            obj.set_binddataset("ds_postCode");
            obj.set_scrollpixel("none");
            obj.set_cellsizingtype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"60\"/><Column size=\"350\"/><Column size=\"195\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"우편번호\"/><Cell col=\"1\"/><Cell col=\"2\" text=\"주소\"/><Cell col=\"3\" text=\"상세주소\"/></Band><Band id=\"body\"><Cell rowspan=\"2\" text=\"bind:areaNum\"/><Cell col=\"1\" text=\"도로명\"/><Cell col=\"2\" style=\"align:left;\" text=\"bind:rnAddr1D\"/><Cell col=\"3\" style=\"align:left;\" text=\"bind:rnAddr2D\"/><Cell row=\"1\" col=\"1\" text=\"지번\"/><Cell row=\"1\" col=\"2\" style=\"align:left;\" text=\"bind:rnAddr1B\"/><Cell row=\"1\" col=\"3\" style=\"align:left;\" text=\"bind:rnAddr2B\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("sta_searchCt2", "absolute", "160", "146", "45", "20", null, null, this);
            obj.set_taborder("2");
            obj.set_text("0");
            obj.set_cssclass("sta_WF_GridFound");
            obj.style.set_align("right middle");
            obj.style.set_font("bold 9 Dotum");
            this.addChild(obj.name, obj);

            obj = new Static("sta_searchCt3", "absolute", "205", "146", "57", "20", null, null, this);
            obj.set_taborder("3");
            obj.set_text("건 입니다.");
            obj.set_cssclass("sta_WF_GridFound2");
            this.addChild(obj.name, obj);

            obj = new Static("sta_searchCt", "absolute", "12", "146", "82", "20", null, null, this);
            obj.set_taborder("1");
            obj.set_text("검색한 결과 총");
            obj.set_cssclass("sta_WF_GridFound2");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "10", "10", null, "126", "10", null, this);
            obj.set_taborder("0");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Button("btn_search", "absolute", null, "87", "45", "22", "20", null, this.div_search);
            obj.set_taborder("5");
            obj.set_text("조회");
            obj.set_cssclass("btn_WF_CRUD");
            obj.getSetter("domainId").set("nexa.add");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchModel", "absolute", "308", "11", "86", "20", null, null, this.div_search);
            obj.set_taborder("49");
            obj.set_text("주소유형");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchAddr", "absolute", "308", "35", "86", "20", null, null, this.div_search);
            obj.set_taborder("52");
            obj.set_text("시도/구군");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchMbNm", "absolute", "308", "87", "86", "20", null, null, this.div_search);
            obj.set_taborder("53");
            obj.set_text("건물번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchRdDngNm", "absolute", "20", "14", "150", "20", null, null, this.div_search);
            obj.set_taborder("54");
            obj.set_text("도로명/지번 주소 입력");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Radio("ra_searchAddr", "absolute", "402", "10", "200", "22", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            var ra_searchAddr_innerdataset = new Dataset("ra_searchAddr_innerdataset", this.div_search.ra_searchAddr);
            ra_searchAddr_innerdataset._setContents("<ColumnInfo><Column id=\"codecolumn\" size=\"256\"/><Column id=\"datacolumn\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"codecolumn\">D</Col><Col id=\"datacolumn\">도로명주소</Col></Row><Row><Col id=\"codecolumn\">B</Col><Col id=\"datacolumn\">지번 주소</Col></Row></Rows>");
            obj.set_innerdataset(ra_searchAddr_innerdataset);
            obj.set_taborder("0");
            obj.set_codecolumn("codecolumn");
            obj.set_datacolumn("datacolumn");
            obj.set_value("D");
            obj.set_direction("vertical");
            obj.set_visible("false");
            obj.set_index("0");
            obj = new Combo("cb_searchDo", "absolute", "400", "34", "140", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("1");
            obj.set_displaynulltext("선택");
            obj.set_innerdataset("@ds_do");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj.set_visible("false");
            obj = new Combo("cb_searchCt", "absolute", "545", "34", "140", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("2");
            obj.set_displaynulltext("선택");
            obj.set_innerdataset("@ds_ct");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj.set_visible("false");
            obj = new Edit("ed_searchRdDngNm", "absolute", "176", "13", "140", "21", null, null, this.div_search);
            obj.set_taborder("3");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_searchMbNm", "absolute", "400", "88", "140", "21", null, null, this.div_search);
            obj.set_taborder("4");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchRdDngNm2", "absolute", "176", "40", "170", "45", null, null, this.div_search);
            obj.set_taborder("55");
            obj.set_text("예시) 지번 : 방배동 796-27\r\n        도로명 : 방배로 226\r\n        건물명 : 넥센강남타워 ");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);

            obj = new Button("btn_choice", "absolute", null, "482", "41", "21", "54", null, this);
            obj.set_taborder("5");
            obj.set_text("선택");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);

            obj = new Button("btn_close", "absolute", null, "482", "41", "21", "9", null, this);
            obj.set_taborder("6");
            obj.set_text("닫기");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);

            obj = new Static("sta_searchCt1", "absolute", "94", "146", "45", "20", null, null, this);
            obj.set_taborder("7");
            obj.set_text("0");
            obj.set_cssclass("sta_WF_GridFound");
            obj.style.set_align("right middle");
            obj.style.set_font("bold 9 Dotum");
            this.addChild(obj.name, obj);

            obj = new Static("sta_searchCt00", "absolute", "302", "146", "44", "20", null, null, this);
            obj.set_taborder("8");
            obj.set_cssclass("sta_WF_GridFound");
            obj.style.set_align("right middle");
            obj.style.set_font("bold 9 Dotum");
            this.addChild(obj.name, obj);

            obj = new Static("sta_searchCt04", "absolute", "140", "146", "20", "20", null, null, this);
            obj.set_taborder("9");
            obj.set_text("/");
            obj.set_cssclass("sta_WF_GridFound");
            obj.style.set_align("center middle");
            obj.style.set_font("bold 9 Dotum");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_addr2", "absolute", "10", "483", "302", "21", null, null, this);
            obj.set_taborder("10");
            obj.set_displaynulltext("상세주소");
            obj.set_maxlength("100");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 0, 126, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("0");
            		p.set_scrollbars("none");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 720, 521, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCMPostCode_pop");
            		p.set_titletext("우편번호조회");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCOMMPostCode_pop.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCOMMPostCode_pop.xfdl", function() {
        	//include "lib::comLib.xjs";
        	this.args 	= "";
        	this.pageNo = 1;
            this.getCnt = "10";
            
            this.RTCMPostCode_pop_onload = function(obj,e)
        	{
        		Ex.core.init(obj);
        		//this.fn_init();
        	}
        	

        	this.fn_init = function(){
        		var sSvcID      	= "listDoCombo";  
        		var sController   	= "rtms/comm/listDoCombo.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_do=mapListDoCombo";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        	
        	
        	
        	/***********************************************************************************
        	* CallBack Event (strSvcId - Sevice ID, nErrorCode - ErrorCode, strErrorMsg - Error Message)
        	***********************************************************************************/
            this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg,resultCnt)
        	{
        		if( strSvcId == "listPostPageCodePop" ){
        			var nRowCount2 = this.ds_postCode2.getRowCount();
        			if(nRowCount2 != 0){
        				if(this.pageNo == 1){
        					this.ds_postCode.clearData();
        				}
        				this.ds_postCode.appendData(this.ds_postCode2);
        				var nRowCount = this.ds_postCode.getRowCount();
        				
        				this.sta_searchCt1.set_text(this.ds_postCode2.getColumn(0,"totalCnt"));
        				this.sta_searchCt2.set_text(nRowCount);
        			}else{
        				this.ds_postCode2.clearData();
        				this.ds_postCode.clearData();
        				this.sta_searchCt1.set_text(0);
        				this.sta_searchCt2.set_text(0);
        				this.pageNo = 1;				
        				alert("조회된 데이터가 없습니다.");
        				this.grid_postCode.set_nodatatext("조회된 데이터가 없습니다.");
        				this.div_search.ed_searchRdDngNm.setFocus(true);
        			}
        		}

        		if(strSvcId == "listCtCombo") {
        			this.div_search.cb_searchCt.set_value("");
        		}
        		if(strSvcId == "listDoCombo") {

        		}
        	}
        	
        	
        	
        	this.RTCOMMPostCode_pop_onkeyup = function(obj,e)
        	{
        		if(e.keycode == 27){
        			this.close();
        		}
        	}

        

        	this.btn_search_onclick = function(obj,e)
        	{
        		this.ds_postCode.clearData();
        		this.ds_postCode2.clearData();
        		this.pageNo = 1;
        		this.FN_search();
        	}   
        	
        	
        	this.div_search_ed_searchRdDngNm_onkeyup = function(obj,e)
        	{	
        		if( e.keycode == "13" ){
        			this.ds_postCode.clearData();
        			this.ds_postCode2.clearData();
        			this.pageNo = 1;		
        			this.FN_search();
        		}
        	}
        	
        	
        	
        	this.div_search_ed_searchMbNm_onkeyup = function(obj,e)
        	{
        		if( e.keycode == "13" ){
        			this.FN_search();
        		}
        	}
        	
        	
        	
        	this.grid_postCode_onvscroll = function(obj,e)
        	{
        		
        		if( e.type == "selectlastover" || e.type == "tracklastover" || e.type == 'wheellastover' ) {
        			var ct1 = this.ds_postCode2.getColumn(0,"totalCnt");
        			var ct2 = this.ds_postCode.getRowCount();
        			if( ct1 != ct2 ){
        				this.pageNo++;
        				this.FN_search();
        			}
        		}
        	}
        	
        	
        	
        	this.grid_postCode_onselectchanged = function(obj,e)
        	{
        		var row = this.ds_postCode.rowposition + 1;
        		var ct = this.ds_postCode.getRowCount();
        		var ct1 = this.ds_postCode2.getColumn(0,"totalCnt");
        		var ct2 = this.ds_postCode.getRowCount();
        		if( ct1 != ct2 ){
        			if( row == ct ){
        				this.pageNo++;
        				this.FN_search();
        			}
        		}
        	}
        	
        	
        	this.FN_search = function(){
        		var edSearchRdDngNmVal 	= nvl(this.div_search.ed_searchRdDngNm.value);

        		if( edSearchRdDngNmVal == "" ){
        			alert( this.div_search.st_searchRdDngNm.text + " 값이 없습니다." );
        			this.div_search.ed_searchRdDngNm.setFocus(true);
        			return;			
        		}
        		
        		if( this.pageNo > 10 ){
        			alert( "검색결과가 너무 많습니다.\n 다시 조회하세요.");
        			this.div_search.ed_searchRdDngNm.setFocus(true);
        		}else{
        			var sSvcID        	= "listPostPageCodePop";                    
        			var sController   	= "rtms/comm/listPostPageCodePop.do";
        			var sInDatasets   	= "";
        			var sOutDatasets  	= "ds_postCode2=mapPostPageCode";
        			var sArgs 			= "";	
        			var fn_callBack		= "fn_callBack";
        			
        			sArgs += Ex.util.setParam("rdDngNm", 	edSearchRdDngNmVal);
        			sArgs += Ex.util.setParam("pageNo", 	this.pageNo);
        			sArgs += Ex.util.setParam("getCnt", 	this.getCnt);
        			//alert(sArgs);
        			Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        		}
        	}
        	

        
        	this.div_search_cb_searchDo_onitemchanged = function(obj,e)
        	{
        		this.ds_ct.clearData();
        		var cbSearchDoVal 	= nvl(this.div_search.cb_searchDo.value);
        		
        		var sSvcID      	= "listCtCombo";  
        		var sController   	= "rtms/comm/listCtCombo.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_ct=mapListCtCombo";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		if( cbSearchDoVal != "" ){
        			sArgs += Ex.util.setParam("doNm", cbSearchDoVal);
        			Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        		}
        	}

        

        	this.div_search_ra_searchAddr_onitemchanged = function(obj,e)
        	{
        		if( e.postvalue == "D"){
        			this.div_search.st_searchRdDngNm.set_text("동명/도로명");
        			this.div_search.st_searchMbNm.set_text("건물번호");
        		}else{
        			this.div_search.st_searchRdDngNm.set_text("동명/리");
        			this.div_search.st_searchMbNm.set_text("번지");
        		}
        		this.div_search.ed_searchRdDngNm.set_value("");
        		this.div_search.ed_searchMbNm.set_value("");
        	}
        	
        	
        	
        	this.grid_postCode_oncelldblclick = function(obj,e)
        	{
        		this.FN_choice();
        	}
        	
        	
        	
        	this.btn_choice_onclick = function(obj,e)
        	{
        		this.FN_choice();
        	}
        	
        	
        	
        	this.btn_close_onclick = function(obj,e)
        	{
        		this.close();
        	}

        

        	this.FN_choice = function(){
        		var nRow = this.ds_postCode.rowposition;
        		
        		if( nRow == -1 ){
        			alert("선택된 데이터가 없습니다.");
        		}else{
        			if( nvl(this.ed_addr2.value) == "" ){
        				if( confirm( "상세주소 입력하시겠습니까?") ){
        					this.ed_addr2.setFocus(true);
        				}else{
        					this.FN_choice2();
        				}
        			}else{
        				this.FN_choice2();
        			}
        		}
        	}
        	this.FN_choice2 = function(){
        		var areaNum = "";
        		var addr1 = "";
        		var addr2 = "";
        		var bldMngNo = "";
        		var nRow = this.ds_postCode.rowposition;
        		
        		//20200304 kstka 시구동 정보 추가
        		var siNm = "";
        		var sggNm = "";
        		var emdNm = "";
        		
        		var res = "";
        		var division = "";
        		
        		areaNum 	+= this.ds_postCode.getColumn(nRow, "areaNum");
        		addr1 		+= this.ds_postCode.getColumn(nRow, "rnAddr1D");
        		addr2 		+= this.ds_postCode.getColumn(nRow, "rnAddr2D")+" "+nvl(this.ed_addr2.value);
        		bldMngNo 	+= this.ds_postCode.getColumn(nRow, "bldMngNo");
        			
        		siNm		+=  this.ds_postCode.getColumn(nRow, "siNm");       
        		sggNm		+=  this.ds_postCode.getColumn(nRow, "sggNm");       
        		emdNm		+=  this.ds_postCode.getColumn(nRow, "emdNm");       

        		res = [ areaNum, addr1, addr2, bldMngNo, siNm, sggNm, emdNm ];
        		
        		if( this.parent.p_arg == "RTSDCustRegister_1" ){		//고객등록화면:::RTSDCustRegister.xfdl:::고객주소
        			division = ["addr1"];
        			this.close( this.opener.FN_postCd(res, division) );
        		}else if( this.parent.p_arg == "RTSDCustRegister_2"){	//고객등록화면:::RTSDCustRegister.xfdl:::보조주소
        			division = ["addr2"];
        			this.close( this.opener.FN_postCd(res, division) );
        		}else if( this.parent.p_arg == "RTCSAdviceStatus_tab_info1_custInfo_1"){	//고객등록화면:::RTSDCustRegister.xfdl:::보조주소
        			division = ["addr1"];
        			this.close( this.opener.FN_postCd(res, division) );
        		}else if( this.parent.p_arg == "RTCSAdviceStatus_tab_info1_custInfo_2"){	//고객등록화면:::RTSDCustRegister.xfdl:::보조주소
        			division = ["addr2"];
        			this.close( this.opener.FN_postCd(res, division) );
        		}else if(this.parent.p_arg == "RTCSCarmasterMemReg") {
        			this.close( this.opener.FN_postCd(res) );
        		}else if(this.parent.p_arg == "RTCSWarehouseRegister") {
        			this.close( this.opener.FN_postCd(res) );
        		}else if(this.parent.p_arg == "RTCSEngineOilRepSer") {
        			this.close( this.opener.FN_postCd(res) );
        		}else if(this.parent.p_arg == "RTSDClaimMgmt_pop") {
        			this.close( this.opener.FN_postCd(res) );
        		}
        		else{
        		
        		}
        	}
        	
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTCMPostCode_pop_onload, this);
            this.addEventHandler("onkeyup", this.RTCOMMPostCode_pop_onkeyup, this);
            this.grid_postCode.addEventHandler("oncelldblclick", this.grid_postCode_oncelldblclick, this);
            this.grid_postCode.addEventHandler("onvscroll", this.grid_postCode_onvscroll, this);
            this.grid_postCode.addEventHandler("onselectchanged", this.grid_postCode_onselectchanged, this);
            this.div_search.btn_search.addEventHandler("onclick", this.btn_search_onclick, this);
            this.div_search.ra_searchAddr.addEventHandler("onitemchanged", this.div_search_ra_searchAddr_onitemchanged, this);
            this.div_search.cb_searchDo.addEventHandler("onitemchanged", this.div_search_cb_searchDo_onitemchanged, this);
            this.div_search.ed_searchRdDngNm.addEventHandler("onkeyup", this.div_search_ed_searchRdDngNm_onkeyup, this);
            this.div_search.ed_searchMbNm.addEventHandler("onkeyup", this.div_search_ed_searchMbNm_onkeyup, this);
            this.btn_choice.addEventHandler("onclick", this.btn_choice_onclick, this);
            this.btn_close.addEventHandler("onclick", this.btn_close_onclick, this);

        };

        this.loadIncludeScript("RTCOMMPostCode_pop.xfdl");

       
    };
}
)();
