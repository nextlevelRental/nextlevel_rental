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
                this.set_name("RTCMCdGrp");
                this.set_classname("RTCMCdGrp");
                this.set_titletext("공통코드등록");
                this._setFormPosition(0,0,1147,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_searchCondition", this);
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

            obj = new Dataset("ds_cdGrp", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cdGrpCd\" type=\"STRING\" size=\"256\"/><Column id=\"cdGrpNm\" type=\"STRING\" size=\"256\"/><Column id=\"cdGrpDesc\" type=\"STRING\" size=\"256\"/><Column id=\"mdlCd\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_cdGrpChild", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cdGrpCd\" type=\"STRING\" size=\"256\"/><Column id=\"cdGrpNm\" type=\"STRING\" size=\"256\"/><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/><Column id=\"cdDesc\" type=\"STRING\" size=\"256\"/><Column id=\"orderPt\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"useYnNm\" type=\"STRING\" size=\"256\"/><Column id=\"remark\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_mdl", this);
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

            obj = new Dataset("ds_useYn", this);
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

            obj = new Dataset("ds_useYnChild", this);
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

            obj = new Dataset("ds_searchConditionChild", this);
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


            
            // UI Components Initialize
            obj = new Grid("grid_cdGrp", "absolute", "0", "65", "300", "421", null, null, this);
            obj.set_taborder("17");
            obj.set_binddataset("ds_cdGrp");
            obj.set_cellsizingtype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"100\"/><Column size=\"184\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"공통코드\"/><Cell col=\"1\" text=\"공통코드명\"/></Band><Band id=\"body\"><Cell text=\"bind:cdGrpCd\"/><Cell col=\"1\" text=\"bind:cdGrpNm\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "0", "0", null, "45", "25", null, this);
            obj.set_taborder("7");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_searchCondition", "absolute", "20", "10", "71", "20", null, null, this.div_search);
            obj.set_taborder("36");
            obj.set_text("검색");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_searchCondition", "absolute", "61", "10", "140", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("37");
            obj.set_innerdataset("@ds_searchConditionChild");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj.set_visible("true");
            obj.set_readonly("false");
            obj.set_displaynulltext("선택");
            obj.set_index("-1");
            obj = new Edit("ed_searchKeyword", "absolute", "206", "10", "260", "21", null, null, this.div_search);
            obj.set_taborder("38");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "1122", "0", "25", "496", null, null, this);
            obj.set_taborder("9");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "45", "1122", "20", null, null, this);
            obj.set_taborder("10");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "318", "61", "100", "20", null, null, this);
            obj.set_taborder("11");
            obj.set_text("코드그룹");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "319", "76", "802", "10", null, null, this);
            obj.set_taborder("12");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static07", "absolute", "319", "177", "803", "20", null, null, this);
            obj.set_taborder("13");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "318", "193", "100", "20", null, null, this);
            obj.set_taborder("14");
            obj.set_text("검색");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static08", "absolute", "319", "208", "803", "10", null, null, this);
            obj.set_taborder("15");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "299", "65", "20", "431", null, null, this);
            obj.set_taborder("16");
            obj.set_text("FIX\r\nw20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static11", "absolute", "319", "86", null, "31", "25", null, this);
            obj.set_taborder("20");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static12", "absolute", "319", "116", null, "31", "25", null, this);
            obj.set_taborder("21");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_cdGrpCd", "absolute", "319", "86", "130", "31", null, null, this);
            obj.set_taborder("18");
            obj.set_text("공통코드");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.addChild(obj.name, obj);

            obj = new Static("st_cdGrpNm", "absolute", "319", "116", "130", "31", null, null, this);
            obj.set_taborder("19");
            obj.set_text("공통코드명");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.addChild(obj.name, obj);

            obj = new Static("Static10", "absolute", "719", "86", "130", "31", null, null, this);
            obj.set_taborder("24");
            obj.set_text("모듈");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.addChild(obj.name, obj);

            obj = new Static("st_useYn", "absolute", "719", "116", "130", "31", null, null, this);
            obj.set_taborder("25");
            obj.set_text("사용여부");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.addChild(obj.name, obj);

            obj = new Static("Static14", "absolute", "319", "146", null, "31", "25", null, this);
            obj.set_taborder("26");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static15", "absolute", "319", "146", "130", "31", null, null, this);
            obj.set_taborder("27");
            obj.set_text("설명");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_cdGrpCd", "absolute", "453", "91", "193", "21", null, null, this);
            obj.set_taborder("28");
            obj.set_inputmode("upper");
            obj.set_inputtype("number,english");
            obj.set_maxlength("4");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_cdGrpNm", "absolute", "453", "121", "262", "21", null, null, this);
            obj.set_taborder("29");
            obj.set_maxlength("100");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_cdGrpDesc", "absolute", "453", "151", "650", "21", null, null, this);
            obj.set_taborder("30");
            obj.set_maxlength("100");
            this.addChild(obj.name, obj);

            obj = new Button("btn_overlapConfirm", "absolute", "650", "91", "65", "21", null, null, this);
            obj.set_taborder("31");
            obj.set_text("중복확인");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Combo("cb_mdlCd", "absolute", "853", "91", "120", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("32");
            obj.set_displaynulltext("선택");
            obj.set_innerdataset("@ds_mdl");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");

            obj = new Combo("cd_useYn", "absolute", "853", "121", "120", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("33");
            obj.set_displaynulltext("선택");
            obj.set_innerdataset("@ds_useYn");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");

            obj = new Edit("ed_overlapConfirmFlag", "absolute", "977", "91", "140", "21", null, null, this);
            obj.set_taborder("34");
            obj.set_value("false");
            obj.set_maxlength("20");
            obj.set_enable("false");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Combo("cb_searchConditionChild", "absolute", "391", "191", "113", "20", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("38");
            obj.set_displaynulltext("선택");
            obj.set_innerdataset("@ds_searchConditionChild");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");

            obj = new Edit("ed_searchKeywordChild", "absolute", "509", "191", "149", "21", null, null, this);
            obj.set_taborder("39");
            this.addChild(obj.name, obj);

            obj = new Button("btn_searchChild", "absolute", "668", "191", "45", "22", null, null, this);
            obj.set_taborder("40");
            obj.set_text("조회");
            obj.set_cssclass("btn_WF_module");
            obj.getSetter("domainId").set("nexa.search");
            this.addChild(obj.name, obj);

            obj = new Button("Button00", "absolute", null, "191", "45", "22", "73", null, this);
            obj.set_taborder("42");
            obj.set_text("삭제");
            obj.set_cssclass("btn_WF_module");
            this.addChild(obj.name, obj);

            obj = new Button("Button37", "absolute", null, "191", "45", "22", "25", null, this);
            obj.set_taborder("43");
            obj.set_text("추가");
            obj.set_cssclass("btn_WF_module");
            this.addChild(obj.name, obj);

            obj = new Grid("grid_cdGrpChild", "absolute", "319", "218", "803", "268", null, null, this);
            obj.set_taborder("44");
            obj.set_binddataset("ds_cdGrpChild");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"100\"/><Column size=\"200\"/><Column size=\"300\"/><Column size=\"95\"/><Column size=\"95\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"코드\"/><Cell col=\"1\" text=\"코드명\"/><Cell col=\"2\" text=\"설명\"/><Cell col=\"3\" text=\"정렬순서\"/><Cell col=\"4\" text=\"사용여부\"/></Band><Band id=\"body\"><Cell edittype=\"expr:(dataset.getRowType(currow) == 2) ? 'normal' : 'none'\" text=\"bind:cd\"/><Cell col=\"1\" edittype=\"normal\" text=\"bind:cdNm\"/><Cell col=\"2\" edittype=\"normal\" text=\"bind:cdDesc\"/><Cell col=\"3\" edittype=\"normal\" text=\"bind:orderPt\"/><Cell col=\"4\" displaytype=\"combo\" edittype=\"combo\" text=\"bind:useYn\" combodataset=\"ds_useYnChild\" combocodecol=\"cd\" combodatacol=\"cdNm\" combodisplay=\"display\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 0, 45, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("7");
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
            		p.set_classname("RTCMCdGrp");
            		p.set_titletext("공통코드등록");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item5","ed_cdGrpCd","value","ds_cdGrp","cdGrpCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item6","ed_cdGrpNm","value","ds_cdGrp","cdGrpNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item7","ed_cdGrpDesc","value","ds_cdGrp","cdGrpDesc");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item8","cb_mdlCd","value","ds_cdGrp","mdlCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item9","cd_useYn","value","ds_cdGrp","useYn");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCMCdGrp.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCMCdGrp.xfdl", function() {
        	//include "lib::comLib.xjs";
        	
        	this.resultCnt = "";//중복코드카운트
        	this.checkCd = "";	//중복코드코드
        	var checkCdRow; 	//중복체크ROW
        	
            
            FN_stringByteLength = function(p_val){
        		var objString = new String(p_val);
        		var stringByteLength = 0;
        		for(var i=0; i<objString.length; i++)
        		{
        			if( escape(objString.charAt(i)).length >= 4)  stringByteLength += 3;
        			else if(escape(objString.charAt(i)) == "%A7") stringByteLength += 3;
        			else if(escape(objString.charAt(i)) != "%0D") stringByteLength++;
        		}
        		return stringByteLength;
        	}
            
        	
        	
        	
        	this.RTCMCdGrp_onload = function(obj,e)
        	{
        		Ex.core.init(obj); 	
        		this.fn_init();
        		this.parent.setButton("E|C|N|S", this);
        	}

        

        	this.fn_init = function(){
        		var sSvcID      	= "listcdGrpCombo";  
        		var sController   	= "rtms/cm/listcdGrpCombo.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_searchCondition=output1 ds_searchConditionChild=output2 ds_mdl=output3 ds_useYn=output4 ds_useYnChild=output5";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}

        

            /***********************************************************************************
        	* CallBack Event (strSvcId - Sevice ID, nErrorCode - ErrorCode, strErrorMsg - Error Message)
        	***********************************************************************************/
            this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg,resultCnt,checkCd)
        	{
        		if( strSvcId == "listCdGrp" ){
        			var dsCdGrpRowCt = this.ds_cdGrp.getRowCount();
        			if( dsCdGrpRowCt == 0 ){
        				this.grid_cdGrp.set_nodatatext("조회된 데이터가 없습니다.");
        				this.div_search.ed_searchKeyword.setFocus();
        			}
        		}
        		
        		if (strSvcId == "checkCd") 
        		{
        			if(this.resultCnt != '0') {
        				alert( "입력하신 " + nvl( this.grid_cdGrpChild.getCellText(-1, 0) ) + " \'" + this.checkCd + "\' 는 존재하고 있습니다." );
        				this.ds_cdGrpChild.setColumn(checkCdRow,"cd", "");
        				this.grid_cdGrpChild.selectRow(checkCdRow);
        				this.grid_cdGrpChild.setCellPos(0);
        			}
        		}
        		
        		if( strSvcId == "cdGrpCdOverlapConfirm" ){
        			var msg = "";
        			if(this.resultCnt != "0") {
        				msg = "입력하신 공통코드 \'" + this.ed_cdGrpCd.value + "\'는 존재하고 있습니다.";
        				this.ed_cdGrpCd.set_value("");
        				this.ed_cdGrpCd.setFocus();
        			} else {
        				msg = "사용가능한 공통코드 입니다.";
        				this.ed_cdGrpCd.set_enable(false);
        				this.btn_overlapConfirm.set_visible(false)
        				this.ed_overlapConfirmFlag.set_value("true");
        				this.ed_cdGrpNm.setFocus(true);
        			}
        			resultCnt = 0;
        			alert(msg);
        		}
        		
        		if( strSvcId == "saveCdGrp" ){
        			if( nErrorCode == "0" ){
        				alert(strErrorMsg);
        				this.reload();
        			}else{
        				alert(strErrorMsg);
        			}
        		}
        		
        		if( strSvcId == "listCdGrpChild" ){
        			var dsCdGrpChildRowCt = this.ds_cdGrpChild.getRowCount();
        			if( dsCdGrpChildRowCt == 0 ){
        				this.grid_cdGrpChild.set_nodatatext("조회된 데이터가 없습니다.");
        			}
        		}
        		//최초로드시 공통코드선택
        		if(strSvcId == "listcdGrpCombo") {
        			this.div_search.cb_searchCondition.set_value("CD_GRP_CD");
        		}
        	}
        	
        	
        	
        	this.div_cdGrp_grid_codeGrp_onselectchanged = function(obj,e)
        	{
        		if(this.ds_cdGrp.getRowType( this.ds_cdGrp.rowposition ) != 2){
        			this.ed_cdGrpCd.set_value	(this.ds_cdGrp.getColumn(this.grid_cdGrp.currentrow, "cdGrpCd"));
        			this.cb_mdlCd.set_value		(this.ds_cdGrp.getColumn(this.grid_cdGrp.currentrow, "mdlCd"));
        			this.ed_cdGrpNm.set_value	(this.ds_cdGrp.getColumn(this.grid_cdGrp.currentrow, "cdGrpNm"));
        			this.cd_useYn.set_value		(this.ds_cdGrp.getColumn(this.grid_cdGrp.currentrow, "useYn"));
        			this.ed_cdGrpDesc.set_value	(this.ds_cdGrp.getColumn(this.grid_cdGrp.currentrow, "cdGrpDesc"));
        			
        			this.ed_cdGrpCd.set_enable(false);
        			this.btn_overlapConfirm.set_visible(false);
        			
        			this.ed_overlapConfirmFlag.set_value("true");
        			this.fn_listCdGrpChild("parent");
        		}
        		
        		if(this.ds_cdGrp.getRowType( this.ds_cdGrp.rowposition ) == 2){
        			this.ed_cdGrpCd.set_enable(true);
        			this.btn_overlapConfirm.set_visible(true);
        			this.ed_overlapConfirmFlag.set_value("false");
        			this.ds_cdGrpChild.clearData();
        		}
        	}
        	
        	this.fn_add = function(obj,e)
        	{
        		var nRow = this.ds_cdGrp.addRow();
        		this.ds_cdGrp.setColumn(nRow,"useYn", "Y");
        		this.ed_cdGrpCd.setFocus(true);
        		this.ds_cdGrpChild.clearData();
        	}

        

        	this.fn_search = function(obj,e)
        	{
        		var cbSearchConditionVal 	= nvl(this.div_search.cb_searchCondition.value);
        		var cbSearchConditionTxt 	= nvl(this.div_search.cb_searchCondition.text);
        		var edSearchKeywordVal 		= nvl(this.div_search.ed_searchKeyword.value);
        		
        		var sSvcID        	= "listCdGrp";                    
        		var sController   	= "rtms/cm/listCdGrp.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_cdGrp=mapCdGrp";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		if( cbSearchConditionVal == 'CD_GRP_CD' ){
        			sArgs += Ex.util.setParam("cdGrpCd", edSearchKeywordVal);
        		}else if(  cbSearchConditionVal == 'CD_GRP_NM' ){
        			if( edSearchKeywordVal.length < 2){
        				alert(cbSearchConditionTxt + "은 최소 2글자 이상이여야 합니다.");
        				return this.div_search.ed_searchKeyword.setFocus();
        			}else{
        				sArgs += Ex.util.setParam("cdGrpNm", edSearchKeywordVal);
        			}
        		}else{
        			alert("검색조건을 선택하세요.");
        			return this.div_search.cb_searchCondition.setFocus();
        		}
        		
        		this.ds_cdGrp.clearData();
        		this.ds_cdGrpChild.clearData();
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        	
        	

        	this.fn_save = function(obj,e)
        	{
        		var dsCdGrpChildRowCt = this.ds_cdGrpChild.getRowCount();
        		var exitFlag = false;
        		var overlapConfirmVal 	= nvl(this.ed_overlapConfirmFlag.value);
        		var overlapConfirmTxt 	= nvl(this.btn_overlapConfirm.text);
        		
        		if( overlapConfirmVal == "true" ){
        			var edCdGrpCdVal 	= nvl(this.ed_cdGrpCd.value);
        			var cbMdlCdVal 		= nvl(this.cb_mdlCd.value);
        			var edCdGrpNmVal 	= nvl(this.ed_cdGrpNm.value);
        			var cdUseYnVal 		= nvl(this.cd_useYn.value);
        			var edCdGrpDescVal 	= nvl(this.ed_cdGrpDesc.value);
        			
        			var cdGrpCdTxt 		= nvl(this.st_cdGrpCd.text);
        			var cdGrpNmTxt 		= nvl(this.st_cdGrpNm.text);
        			var cdUseYnTxt 		= nvl(this.st_useYn.text);
        			
        			if( edCdGrpCdVal == "" ){
        				alert(cdGrpCdTxt + " 값이 없습니다.");
        				this.ed_cdGrpCd.setFocus();
        			}else if( FN_stringByteLength(edCdGrpCdVal)  > 4 ){
        				alert(cdGrpCdTxt + " 크기가 4Byte를 초과하였습니다.");
        				this.ed_cdGrpCd.setFocus();
        			}else if( edCdGrpNmVal == "" ){
        				alert("저장되었습니다.");
        				this.ed_cdGrpNm.setFocus();
        			}else if( cdUseYnVal == "" ){
        				alert(cdUseYnTxt + " 값이 없습니다.");
        				this.cd_useYn.setFocus();
        			}else{
        				
        				if( dsCdGrpChildRowCt > 0){
        					for( var row_i = 1 , row_ii = 0 ; row_i <= dsCdGrpChildRowCt ; row_i++, row_ii++){
        						for( var cell_i = 0 ; cell_i <= 3 ; cell_i++){
        						
        							var cellVal = nvl(this.grid_cdGrpChild.getCellValue(row_ii, cell_i));
        							
        							if( (cell_i == 0 || cell_i == 1) && cellVal == "" ){
        								alert(nvl(this.grid_cdGrpChild.getCellText(-1, cell_i)) + " 값이 없습니다.");
        								this.grid_cdGrpChild.selectRow(row_ii);
        								this.grid_cdGrpChild.setCellPos(cell_i);
        								this.grid_cdGrpChild.showEditor(true);
        								exitFlag = true;
        							}
        							/*
        							else if( cell_i == 0 && FN_stringByteLength(cellVal) > 16 ){
        								alert(nvl(this.grid_cdGrpChild.getCellText(-1, cell_i)) + " 크기가 16Byte를 초과하였습니다.");
        								this.grid_cdGrpChild.selectRow(row_ii);
        								this.grid_cdGrpChild.setCellPos(cell_i);
        								this.grid_cdGrpChild.showEditor(true);
        								exitFlag = true;
        							}
        							*/
        							if(exitFlag){break;}
        						}
        						for( var find_i = 1 ; find_i <= dsCdGrpChildRowCt ; find_i++ ){
        							if( row_i != find_i && nvl(this.ds_cdGrpChild.getColumn( row_i, "cd" )) ==  nvl(this.ds_cdGrpChild.getColumn( find_i, "cd" )) ){
        								alert( "\'" + nvl(this.ds_cdGrpChild.getColumn(  find_i, "cd" )) + "\'" + " 중복된 코드값입니다." );
        								this.grid_cdGrpChild.selectRow(find_i);
        								this.grid_cdGrpChild.setCellPos(0);
        								this.grid_cdGrpChild.showEditor(true);
        								exitFlag = true;
        							}
        							if(exitFlag){break;}
        						}
        					}
        				}else{
        					exitFlag = false;
        				}
        				
        				if( !exitFlag  ){
        					var saveFlag_1 = true;
        					var saveFlag_2 = true;
        					if( this.ds_cdGrp.getRowType( this.ds_cdGrp.rowposition ) == 1 ){
        						saveFlag_1 = false;
        					}else{
        						saveFlag_1 = true;
        					}
        					
        					for(var i  = 0 ; i < this.ds_cdGrpChild.getRowCount() ; i++){
        						if( this.ds_cdGrpChild.getRowType( i ) == 1){
        							saveFlag_2 = false;
        						}else{
        							saveFlag_2 = true;break;
        						}
        					}
        					
        					if( saveFlag_1 == true || saveFlag_2 == true){
        						var sSvcID        	= "saveCdGrp";                    
        						var sController   	= "rtms/cm/saveCdGrp.do";
        						var sInDatasets   	= "";
        						var sOutDatasets  	= "";
        						var sArgs 			= "";
        						var fn_callBack		= "fn_callBack";
        						sInDatasets += "input1=ds_cdGrp:U input2=ds_cdGrpChild:U";
        						Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        					}else{
        						alert("수정된 사항이 없습니다.");
        					}
        				}				
        			}
        		}else{
        			alert(overlapConfirmTxt + "을 하십시오.");
        			this.btn_overlapConfirm.setFocus();
        		}
        	}

        

        	this.div_cdGrpDetails_btn_overlapConfirm_onclick = function(obj,e)
        	{
        		var edCdGrpCdVal = nvl(this.ed_cdGrpCd.value);
        		
        		if( nvl(edCdGrpCdVal) != "" ){
        			var sSvcID        	= "cdGrpCdOverlapConfirm";                    
        			var sController   	= "rtms/cm/cdGrpCdOverlapConfirm.do";
        			var sInDatasets   	= "";
        			var sOutDatasets  	= "";
        			var sArgs 			= "";
        			sInDatasets   		= "";
        			sOutDatasets  		= "";
        			var fn_callBack		= "fn_callBack";
        			
        			sArgs += Ex.util.setParam("cdGrpCd",edCdGrpCdVal);
        			
        			Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        		}else{
        			alert("공통코드 값이 없습니다.");
        			this.ed_cdGrpCd.setFocus();
        		}
        	}
        	
        	
        	
        	this.div_cdGrpChild_btn_searchChild_onclick = function(obj,e)
        	{
        		this.fn_listCdGrpChild("child");
        	}
        	
        	
        	
        	this.fn_listCdGrpChild = function(division){
        		var grid_cdGrp_selectNb = this.grid_cdGrp.currentrow;
        	
        		var cbSearchConditionChildVal = nvl(this.cb_searchConditionChild.value);
        		var cbSearchConditionTxt 	  = this.cb_searchConditionChild.text;
        		var edSearchKeywordChildVal   = nvl(this.ed_searchKeywordChild.value);
        		
        		var sSvcID        	= "listCdGrpChild";
        		var sController   	= "rtms/cm/listCdGrpChild.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_cdGrpChild=mapCdGrpChild";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		sArgs += Ex.util.setParam( "cdGrpCd", this.ds_cdGrp.getColumn(grid_cdGrp_selectNb, "cdGrpCd") );
        		
        		if( division == "child"){
        			if( cbSearchConditionChildVal == 'CD_GRP_CD' ){
        				sArgs += Ex.util.setParam("cd", edSearchKeywordChildVal);
        			}else if( cbSearchConditionChildVal == 'CD_GRP_NM' ){
        				
        				if( edSearchKeywordChildVal.length < 2){
        					alert(cbSearchConditionTxt + "은 최소 2글자 이상이여야 합니다.");
        					this.div_cdGrpChild.ed_searchKeywordChild.setFocus();
        				}else{
        					sArgs += Ex.util.setParam( "cdNm", edSearchKeywordChildVal );
        				}
        			}else{
        				alert("검색조건을 선택하세요.");
        				return this.cb_searchConditionChild.setFocus();
        			}
        		}
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}

        

        	this.btnAddChild_onclick = function(obj,e)
        	{
        		var cdGrpCdVal 			= nvl(this.ed_cdGrpCd.value);
        		var cdGrpNmVal 			= nvl(this.ed_cdGrpNm.value);
        		var cdUseYnVal 			= nvl(this.cd_useYn.value);
        		var overlapConfirmVal 	= nvl(this.ed_overlapConfirmFlag.value);
        		
        		var cdGrpCdTxt = nvl(this.st_cdGrpCd.text);
        		var cdGrpNmTxt = nvl(this.st_cdGrpNm.text);
        		var cdUseYnTxt = nvl(this.st_useYn.text);
        		var overlapConfirmTxt = nvl(this.btn_overlapConfirm.text);
        		
        		if( cdGrpCdVal == "" ){
        			alert(cdGrpCdTxt + " 값이 없습니다.");
        			this.ed_cdGrpCd.setFocus();
        		}else if( cdGrpNmVal == "" ){
        			alert(cdGrpNmTxt + " 값이 없습니다.");
        			this.ed_cdGrpNm.setFocus();
        		}else if( cdUseYnVal == "" ){
        			alert(cdUseYnTxt + " 값이 없습니다.");
        			this.cd_useYn.setFocus();
        		}else if( overlapConfirmVal == "false"){
        			alert(overlapConfirmTxt + "을 하십시오.");
        			this.btn_overlapConfirm.setFocus();
        		}else{
        			var nRow = this.ds_cdGrpChild.addRow();
        			this.grid_cdGrpChild.selectRow(nRow);
        			this.grid_cdGrpChild.setCellPos(0);
        			this.grid_cdGrpChild.showEditor(true);
        			this.ds_cdGrpChild.setColumn(nRow,"useYn","Y");
        			this.ds_cdGrpChild.setColumn(nRow,"cdGrpCd",cdGrpCdVal);
        		}
        	}

        

        	this.btnDelChild_onclick = function(obj,e)
        	{
        		var gridCdGrpChildSlected = this.grid_cdGrpChild.currentrow;
        		
        		if( gridCdGrpChildSlected == -9 ){
        			alert("삭제할 행을 선택하여 주십시오.");
        		}else{
        			this.ds_cdGrpChild.deleteRow(gridCdGrpChildSlected);
        		}
        	}

        

        	this.ds_cdGrpChild_oncolumnchanged = function(obj,e)
        	{
        		if(e.columnid == "cd") {
        			checkCdRow = e.row;
        			this.FN_cdGrpCdCheck( nvl(obj.getColumn(e.row, "cdGrpCd")), nvl(obj.getColumn(e.row, "cd")) );
        		}
        	}

        

        	this.FN_cdGrpCdCheck = function(objVal1,objVal2)
        	{
        		var sSvcID        	= "checkCd";
        		var sController   	= "rtms/cm/checkCd.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";
        		sInDatasets   		= "";
        		sOutDatasets  		= "";
        		var fn_callBack		= "fn_callBack";
        		
        		sArgs += Ex.util.setParam("cdGrpCd",objVal1);
        		sArgs += Ex.util.setParam("cd"	   ,objVal2);
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        	
        	
        	this.fn_excel= function() {
        		//Ex.core.exportExcel(this, this.grid_cdGrpChild);
        		var objArray1 = new Array();
        		objArray1.push(this.grid_cdGrp);
        		objArray1.push(this.grid_cdGrpChild);
        		Ex.core.exportExcel(this, objArray1);
        	}
        	

        
        // 2016-05-03 이영근, 엔터키 입력시 조회
        this.div_search_ed_searchKeyword_onkeyup = function(obj,e)
        {
        	if( e.keycode == "13" ){
        		this.fn_search();
        	}	
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.ds_cdGrpChild.addEventHandler("oncolumnchanged", this.ds_cdGrpChild_oncolumnchanged, this);
            this.addEventHandler("onload", this.RTCMCdGrp_onload, this);
            this.grid_cdGrp.addEventHandler("onselectchanged", this.div_cdGrp_grid_codeGrp_onselectchanged, this);
            this.div_search.ed_searchKeyword.addEventHandler("onkeyup", this.div_search_ed_searchKeyword_onkeyup, this);
            this.Static00.addEventHandler("onclick", this.Static00_onclick, this);
            this.Static01.addEventHandler("onclick", this.Static00_onclick, this);
            this.btn_overlapConfirm.addEventHandler("onclick", this.div_cdGrpDetails_btn_overlapConfirm_onclick, this);
            this.btn_searchChild.addEventHandler("onclick", this.div_cdGrpChild_btn_searchChild_onclick, this);
            this.Button00.addEventHandler("onclick", this.btnDelChild_onclick, this);
            this.Button37.addEventHandler("onclick", this.btnAddChild_onclick, this);

        };

        this.loadIncludeScript("RTCMCdGrp.xfdl");

       
    };
}
)();
