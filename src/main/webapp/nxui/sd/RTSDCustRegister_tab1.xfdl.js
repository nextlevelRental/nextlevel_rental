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
                this.set_name("RTSDCustRegister_tab1");
                this.set_classname("RTCMCustRegister_tab1");
                this.set_titletext("계좌");
                this.set_enable("true");
                this.set_visible("true");
                this._setFormPosition(0,0,1122,768);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("dsAcc", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"accSeq\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"strDay\" type=\"STRING\" size=\"256\"/><Column id=\"endDay\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"custTp\" type=\"STRING\" size=\"256\"/><Column id=\"custTpNm\" type=\"STRING\" size=\"256\"/><Column id=\"ebirDay\" type=\"STRING\" size=\"256\"/><Column id=\"buslNo\" type=\"STRING\" size=\"256\"/><Column id=\"bankCd\" type=\"STRING\" size=\"256\"/><Column id=\"bankNm\" type=\"STRING\" size=\"256\"/><Column id=\"acctNo\" type=\"STRING\" size=\"256\"/><Column id=\"accChk\" type=\"STRING\" size=\"256\"/><Column id=\"acncId\" type=\"STRING\" size=\"256\"/><Column id=\"acncNm\" type=\"STRING\" size=\"256\"/><Column id=\"acncDest\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsBankCustTp", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsBankType", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsUseYn", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsInput", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"accSeq\" type=\"STRING\" size=\"256\"/><Column id=\"bankCd\" type=\"STRING\" size=\"256\"/><Column id=\"bankNm\" type=\"STRING\" size=\"256\"/><Column id=\"acctNo\" type=\"STRING\" size=\"256\"/><Column id=\"custTp\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"ebirDay\" type=\"STRING\" size=\"256\"/><Column id=\"buslNo\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsBatch", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"res_cd\" type=\"STRING\" size=\"256\"/><Column id=\"res_msg\" type=\"STRING\" size=\"256\"/><Column id=\"group_id\" type=\"STRING\" size=\"256\"/><Column id=\"cardcomCd\" type=\"STRING\" size=\"256\"/><Column id=\"returnCode\" type=\"STRING\" size=\"256\"/><Column id=\"batch_key\" type=\"STRING\" size=\"256\"/><Column id=\"pay_type\" type=\"STRING\" size=\"256\"/><Column id=\"pay_id\" type=\"STRING\" size=\"256\"/><Column id=\"pay_cert_no\" type=\"STRING\" size=\"256\"/><Column id=\"pay_issue_cd\" type=\"STRING\" size=\"256\"/><Column id=\"pay_issue_nm\" type=\"STRING\" size=\"256\"/><Column id=\"ccertDay\" type=\"STRING\" size=\"256\"/><Column id=\"ccertSeq\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Grid("Grid00", "absolute", "9", "10", "811", "240", null, null, this);
            obj.set_taborder("0");
            obj.set_autofittype("none");
            obj.set_binddataset("dsAcc");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"110\"/><Column size=\"80\"/><Column size=\"140\"/><Column size=\"150\"/><Column size=\"100\"/><Column size=\"90\"/><Column size=\"120\"/><Column size=\"60\"/><Column size=\"90\"/><Column size=\"150\"/><Column size=\"90\"/><Column size=\"150\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"계좌순번\"/><Cell col=\"1\" text=\"은행코드\"/><Cell col=\"2\" text=\"은행명\"/><Cell col=\"3\" text=\"계좌번호\"/><Cell col=\"4\" text=\"예금주명\"/><Cell col=\"5\" text=\"법정생년월일\"/><Cell col=\"6\" text=\"사업자번호\"/><Cell col=\"7\" text=\"사용여부\"/><Cell col=\"8\" text=\"등록자\"/><Cell col=\"9\" text=\"등록일자\"/><Cell col=\"10\" text=\"수정자\"/><Cell col=\"11\" text=\"수정일자\"/></Band><Band id=\"body\"><Cell text=\"bind:accSeq\"/><Cell col=\"1\" displaytype=\"normal\" text=\"bind:bankCd\"/><Cell col=\"2\" displaytype=\"combo\" text=\"bind:bankCd\" combodataset=\"dsBankType\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"3\" text=\"bind:acctNo\"/><Cell col=\"4\" text=\"bind:custNm\"/><Cell col=\"5\" text=\"bind:ebirDay\"/><Cell col=\"6\" text=\"bind:buslNo\"/><Cell col=\"7\" text=\"bind:useYn\"/><Cell col=\"8\" text=\"bind:regId\"/><Cell col=\"9\" text=\"bind:regDt\" mask=\"####-##-##\" calendardisplaynulltype=\"none\"/><Cell col=\"10\" text=\"bind:chgId\"/><Cell col=\"11\" text=\"bind:chgDt\" mask=\"####-##-##\" calendardisplaynulltype=\"none\"/><Cell col=\"12\" text=\"bind:acncDesc\"/><Cell col=\"13\" text=\"bind:useYn\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "840", "10", "272", "300", null, null, this);
            obj.set_taborder("1");
            obj.set_scrollbars("none");
            obj.set_enable("false");
            obj.set_visible("true");
            this.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "0", "29", "272", "31", null, null, this.div_search);
            obj.set_taborder("43");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "0", "89", "272", "31", null, null, this.div_search);
            obj.set_taborder("44");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "0", "59", "272", "31", null, null, this.div_search);
            obj.set_taborder("45");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "0", "149", "272", "31", null, null, this.div_search);
            obj.set_taborder("46");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "0", "119", "272", "31", null, null, this.div_search);
            obj.set_taborder("47");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static05", "absolute", "0", "209", "272", "31", null, null, this.div_search);
            obj.set_taborder("48");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "0", "179", "272", "31", null, null, this.div_search);
            obj.set_taborder("49");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_new", "absolute", "130", "3", "45", "22", null, null, this.div_search);
            obj.set_taborder("0");
            obj.set_text("신규");
            obj.set_cssclass("btn_WF_module");
            obj.getSetter("domainId").set("nexa.save");
            obj.set_enable("true");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_save", "absolute", "227", "3", "45", "22", null, null, this.div_search);
            obj.set_taborder("1");
            obj.set_text("저장");
            obj.set_cssclass("btn_WF_module");
            obj.getSetter("domainId").set("nexa.save");
            obj.set_enable("true");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_cdGrpCd00", "absolute", "0", "29", "120", "31", null, null, this.div_search);
            obj.set_taborder("26");
            obj.set_text("계좌순번");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_accSeq", "absolute", "124", "34", "143", "21", null, null, this.div_search);
            obj.set_taborder("2");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_cdGrpCd01", "absolute", "0", "89", "120", "31", null, null, this.div_search);
            obj.set_taborder("28");
            obj.set_text("계좌번호");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_acctNo", "absolute", "124", "94", "143", "21", null, null, this.div_search);
            obj.set_taborder("4");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("20");
            obj.set_inputtype("digit");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_cdGrpCd02", "absolute", "0", "119", "120", "31", null, null, this.div_search);
            obj.set_taborder("30");
            obj.set_text("예금주");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_custNm", "absolute", "124", "124", "143", "21", null, null, this.div_search);
            obj.set_taborder("5");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_bankCd", "absolute", "124", "64", "143", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("3");
            obj.set_displaynulltext("선택");
            obj.set_innerdataset("@dsBankType");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new Static("st_cdGrpCd06", "absolute", "0", "59", "120", "31", null, null, this.div_search);
            obj.set_taborder("33");
            obj.set_text("은행");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_cdGrpCd03", "absolute", "0", "149", "120", "31", null, null, this.div_search);
            obj.set_taborder("34");
            obj.set_text("구분");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_custTp", "absolute", "124", "154", "98", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("6");
            obj.set_displaynulltext("선택");
            obj.set_innerdataset("@dsBankCustTp");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new Static("st_cdGrpCd04", "absolute", "0", "209", "120", "31", null, null, this.div_search);
            obj.set_taborder("36");
            obj.set_text("사용여부");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_useYn", "absolute", "125", "214", "98", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("10");
            obj.set_displaynulltext("선택");
            obj.set_innerdataset("@dsUseYn");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new Static("st_cdGrpCd05", "absolute", "0", "179", "120", "31", null, null, this.div_search);
            obj.set_taborder("38");
            obj.set_text("법정생년월일");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_overlapConfirm03", "absolute", "226", "184", "41", "21", null, null, this.div_search);
            obj.set_taborder("9");
            obj.set_text("인증");
            obj.getSetter("domainId").set("nexa.save");
            this.div_search.addChild(obj.name, obj);
            obj = new MaskEdit("ed_ebirDay", "absolute", "124", "184", "98", "21", null, null, this.div_search);
            obj.set_taborder("8");
            obj.set_type("string");
            obj.set_mask("######");
            obj.style.setStyleValue("align", "disabled", "left middle");
            this.div_search.addChild(obj.name, obj);
            obj = new MaskEdit("ed_buslNo", "absolute", "124", "184", "98", "21", null, null, this.div_search);
            obj.set_taborder("7");
            obj.set_type("string");
            obj.set_mask("###-##-#####");
            obj.set_visible("false");
            obj.style.setStyleValue("align", "disabled", "left middle");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_del", "absolute", "178", "3", "45", "22", null, null, this.div_search);
            obj.set_taborder("50");
            obj.set_text("삭제");
            obj.set_cssclass("btn_WF_module");
            obj.getSetter("domainId").set("nexa.save");
            obj.set_visible("true");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "820", "10", "20", "300", null, null, this);
            obj.set_taborder("2");
            obj.set_text("FIX\r\nw20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0", "0", null, "10", "-1", null, this);
            obj.set_taborder("3");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "8", "10", "308", null, null, this);
            obj.set_taborder("4");
            obj.set_text("FIX\r\nh10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1112", "0", "10", "316", null, null, this);
            obj.set_taborder("5");
            obj.set_text("FIX \r\nW10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "310", null, "10", "-1", null, this);
            obj.set_taborder("6");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 693, 65, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("1");
            		p.set_scrollbars("none");
            		p.set_enable("false");
            		p.set_visible("true");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1122, 768, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCMCustRegister_tab1");
            		p.set_titletext("계좌");
            		p.set_enable("true");
            		p.set_visible("true");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item0","div_search.ed_accSeq","value","dsAcc","accSeq");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item1","div_search.cb_bankCd","value","dsAcc","bankCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item2","div_search.ed_acctNo","value","dsAcc","acctNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item3","div_search.ed_custNm","value","dsAcc","custNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item4","div_search.cb_custTp","value","dsAcc","custTp");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item5","div_search.ed_buslNo","value","dsAcc","buslNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item6","div_search.cb_useYn","value","dsAcc","useYn");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item7","div_search.ed_ebirDay","value","dsAcc","ebirDay");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTSDCustRegister_tab1.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDCustRegister_tab1.xfdl", function() {
        //include "lib::comLib.xjs";
        var chk = "N";

        
        //onload
        this.RTSDCustRegister_tab1_onload = function(obj,e) {
        	//Ex.core.init(obj);
        	
        	if(nvl(this.parent.parent.div_cust.ed_custNo.value) != "") {
        		this.div_search.set_enable(true);
        	 } else {
        		this.div_search.set_enable(false);
        	 }
        	this.fn_init();	
        	this.custTpCheck();

        }

        
        //조회
        this.fn_init = function(){
        		this.dsAcc.clearData();
        		//var nRow = this.Tab00.tabpage1.dsAcc.addRow();
        		var custNo = this.parent.parent.ds_cust.getColumn( 0, "custNo");
        		var sSvcID      	= "searchAcc";  
        		var sController   	= "rtms/sd/accList.do";
        		var sInDatasets   	= "";
        		//var sOutDatasets  	= "dsAcc=accList dsBankCustTp=mapDsCustTp dsBankType=bankType dsUseYn=useType";
        		var sOutDatasets  	= "dsAcc=accList dsBankCustTp=mapDsCustTp dsBankType=bankType dsUseYn=useType";
        		var sArgs 			= "custNo="+ custNo;
        		var fn_callBack		= "fn_callBack";
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}

        //callBack
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg,resultCnt,checkAuthGrpuCd)
        {
        	if (strSvcId == "searchAcc") 
        	{
        		this.Grid00_oncellclick();
        	}
        	
        	if (strSvcId == "saveAccData") 
        	{
        		alert(strErrorMsg);
        		this.fn_init();
        	}
        	
        	if(strSvcId == "kftcCmsDocInfo") {
        		var returnCode = this.dsBatch.getColumn(0, "returnCode"); //리턴코드
        		if(returnCode == "0000"){
        			this.chk = "Y";
        			this.dsAcc.setColumn(this.dsAcc.rowposition, "accChk", "Y");
        			alert("인증성공 하였습니다.");
        		} else {
        			this.chk = "N";
        			this.dsAcc.setColumn(this.dsAcc.rowposition, "accChk", "N");
        			alert("인증실패 하였습니다.");
        		}
        	}
        }	
        	
        	
        //신규클릭 이벤트
        this.div_search_btn_new_onclick = function(obj,e)
        {
        	var custNo = nvl(this.parent.parent.ds_cust.getColumn( 0, "custNo"));
        	var custTp = nvl(this.parent.parent.ds_cust.getColumn( 0, "custTp"));
        	
        	if( custNo != "" ){
        		var nRow = this.dsAcc.addRow();
        		this.dsAcc.setColumn(nRow, "custNo", custNo);
        		this.div_search.cb_custTp.set_value(custTp);
        		this.addEvent();
        		this.custTpCheck();
        		this.div_search.cb_useYn.set_value("Y");
        		this.comboSet();
        		this.div_search.cb_bankCd.setFocus();
        		
        	}else{
        		alert("고객번호가 없으므로 추가하실 수 없습니다.");
        	}
        	
        	/*this.dsAcc.addRow();
        	this.addEvent();
        	this.custTpCheck();
        	this.div_search.cb_useYn.set_value("Y");
        	this.comboSet();
        	this.div_search.cb_bankCd.setFocus();*/
        	
        }

        
        //삭제버튼
        this.div_search_btn_del_onclick = function(obj,e)
        {
        	var row = this.dsAcc.rowposition;
        	if(this.dsAcc.getRowType(row) != 2) {
        		return;
        	}
        	this.dsAcc.deleteRow(row);
        }

        //저장클릭 이벤트
        this.div_search_btn_save_onclick = function(obj,e)
        {	
        	var flag = false;
        	for(var i = 0 ; i < this.dsAcc.getRowCount() ; i++){
        		if(this.dsAcc.getRowType(i) == 2 || this.dsAcc.getRowType(i) == 4 || this.dsAcc.getRowType(i) == 8){
        			flag = true; 
        			break;
        		}
        	}
        	if(flag){
        		var saveFlag = true;
        		
        		for(var i = 0 ; i < this.dsAcc.getRowCount() ; i++){
        			var custNo 		= nvl(this.dsAcc.getColumn(i, "custNo"));	//고객번호
        			var bankCd 		= nvl(this.dsAcc.getColumn(i, "bankCd"));	//은행
        			var acctNo 		= nvl(this.dsAcc.getColumn(i, "acctNo"));	//계좌번호
        			var custNm 		= nvl(this.dsAcc.getColumn(i, "custNm"));	//예금주
        			var custTp 		= nvl(this.dsAcc.getColumn(i, "custTp"));	//구분
        			var ebirDay 	= nvl(this.dsAcc.getColumn(i, "ebirDay"));	//법정생년월일
        			var buslNo 		= nvl(this.dsAcc.getColumn(i, "buslNo"));	//사업자번호
        			var accChk 		= nvl(this.dsAcc.getColumn(i, "accChk"));	//계좌확인상태
        			var useYn 		= nvl(this.dsAcc.getColumn(i, "useYn"));	//사용여부
        			var msg 		= " 값이 없습니다.";
        			
        			if( custNo == "" ){
        				alert("고객번호" + msg);
        				this.Grid00.selectRow(i);
        				saveFlag = false;
        				break;
        				return false;
        			}
        			
        			if( bankCd == ""){
        				alert("은행" + msg);
        				this.Grid00.selectRow(i);
        				saveFlag = false;
        				break;
        				return false;
        			}
        			
        			if( acctNo == "" ){
        				alert("계좌번호" + msg);
        				this.Grid00.selectRow(i);
        				saveFlag = false;
        				break;
        				return false;
        			}
        			
        			if( custNm == "" ){
        				alert("예금주" + msg);
        				this.Grid00.selectRow(i);
        				saveFlag = false;
        				break;
        				return false;
        			}
        			
        			if( custTp == "" ){
        				alert("구분" + msg);
        				this.Grid00.selectRow(i);
        				saveFlag = false;
        				break;
        				return false;
        			}else{
        				if( custTp == "01" && ebirDay == "" ){
        					alert("법정생년월일" + msg);
        					this.Grid00.selectRow(i);
        					saveFlag = false;
        					break;
        					return false;
        				}
        				if( custTp == "02" && buslNo == "" ){
        					alert("사업자번호" + msg);
        					this.Grid00.selectRow(i);
        					saveFlag = false;
        					break;
        					return false;
        				}
        			}
        			
        			if( accChk == "" ){
        				alert("계좌인증" + msg);
        				this.Grid00.selectRow(i);
        				saveFlag = false;
        				break;
        				return false;
        			}
        			
        			if( accChk == "N" ){
        				alert("계좌확인을 다시하세요.");
        				this.Grid00.selectRow(i);
        				saveFlag = false;
        				break;
        				return false;
        			}
        			
        			if( useYn == "" ){
        				alert("사용여부" + msg);
        				this.Grid00.selectRow(i);
        				saveFlag = false;
        				break;
        				return false;
        			}
        		}
        	
        		/*
        		for(var i = 0 ; i < this.dsAcc.getRowCount() ; i++){
        			alert(this.dsAcc.getRowType(i));
        		}
        		*/
        		var custNo = this.parent.parent.ds_cust.getColumn( 0, "custNo");
        		
        		this.dsAcc.setColumn(this.dsAcc.rowposition, "custNo", custNo);
        	
        		if( saveFlag ){
        			var sSvcID        	= "saveAccData";                    
        			var sController   	= "/rtms/sd/accSaveDaset.do";
        			var sInDatasets   	= "";
        			var sOutDatasets  	= "";
        			var sArgs 			= "";
        			sInDatasets   		= "input=dsAcc:U";
        			sOutDatasets  		= "";
        			var fn_callBack		= "fn_callBack";
        			
        			//var seq  = this.dsAcc.getColumn(this.dsAcc.rowposition, "accSeq");
        			Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        		} else {
        			alert("수정된 데이터가 없습니다.");
        		}
        	}
        }

        //인증버튼
        this.div_search_btn_overlapConfirm03_onclick = function(obj,e){
        	var userType 	= nvl(this.div_search.cb_custTp.value); //사용자 구분
        	var bankCd	 	= nvl(this.div_search.cb_bankCd.value); //은행 구분
        	var acctCd 	 	= nvl(this.div_search.ed_acctNo.value); //계좌번호
        	var acctCdLen 	= acctCd.length;
        	var acctSubstr	= acctCd.substr(0,3);
        	
        	if(userType == "01") {
        		var bizNo	 = nvl(this.div_search.ed_ebirDay.value); //
        	} else {
        		var bizNo	 = nvl(this.div_search.ed_buslNo.value); //
        	}
        	
        	if( (bankCd == '003') && ((acctCdLen == 10) || (acctCdLen == 11)) ){
        		alert("평생계좌는 자동이체 신청이 불가능합니다.\n기업은행 : 계좌번호가 10자리, 11자리\n신한은행 : 계좌번호가 10자리~14자리면서 앞번호 010 시작");
        		return false;
        	}else if( (bankCd == '088') && ((acctCdLen == 10) || (acctCdLen == 11) || (acctCdLen == 12) || (acctCdLen == 13) || (acctCdLen == 14)) && (acctSubstr == "010") ){
        		alert("평생계좌는 자동이체 신청이 불가능합니다.\n기업은행:계좌번호가 10자리, 11자리\n신한은행:계좌번호가 10자리~14자리면서 앞번호 010 시작");
        		return false;
        	}else{
        		var custNo	 		= nvl(this.parent.parent.ds_cust.getColumn( 0, "custNo"));
        		var custNm	 		= nvl(this.parent.parent.ds_cust.getColumn( 0, "custNm"));
        		var ownerNm	 		= nvl(this.div_search.ed_custNm.value);
        		var sSvcID        	= "kftcCmsDocInfo";    
        		var sController   	= "rtms/sms/kftcCmsDocInfo.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "dsBatch=cmdKey";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		sArgs += " userType=" + userType + " bankCd=" + bankCd + " acctCd=" + acctCd + " bizNo=" + bizNo;
        		sArgs += " custNo=" + custNo + " custNm=" + custNm + " ownerNm=" + ownerNm;
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 	
        	}
        }

        //고객 유형 체크
        this.custTpCheck = function()
        {
        	var custTp = this.dsAcc.getColumn(this.dsAcc.rowposition, "custTp");
        	
        	if(custTp == "01") {
        		this.div_search.cb_custTp.set_value('01');
        		this.div_search.ed_buslNo.set_visible(false);
        		this.div_search.ed_ebirDay.set_visible(true);
        		this.div_search.st_cdGrpCd05.set_text('법정생년월일');
        	} else if(custTp == "02") {
        		this.div_search.cb_custTp.set_value('02');
        		this.div_search.ed_buslNo.set_visible(true);
        		this.div_search.ed_ebirDay.set_visible(false);
        		this.div_search.st_cdGrpCd05.set_text('사업자번호');
        	}
        }

        //구분값 체인지시
        this.div_search_cb_custTp_onitemchanged = function(obj,e)
        {
        	var cbVal = this.div_search.cb_custTp.value;
        	if(cbVal == '01') {
        		this.div_search.cb_custTp.set_value('01'); //벨류값 세팅
        		this.div_search.ed_buslNo.set_visible(false); //숨김
        		this.div_search.ed_ebirDay.set_visible(true); //숨김해제
        		this.div_search.st_cdGrpCd05.set_text('법정생년월일'); //text바꾸기
        	} else {
        		this.div_search.cb_custTp.set_value('02');
        		this.div_search.ed_buslNo.set_visible(true);
        		this.div_search.ed_ebirDay.set_visible(false);
        		this.div_search.st_cdGrpCd05.set_text('사업자번호');
        	}
        	this.comboSet();
        	
        }

        //grid click 이벤트
        this.Grid00_oncellclick = function(obj,e)
        {
        	this.fn_makeYm();
        	if(nvl(this.div_search.ed_cardSeq.value) == "") {
        		this.addEvent();
        	} else {
        		this.searchEvent();
        	}
        	this.div_search_cb_custTp_onitemchanged();
        }

        //일반 조회시
        this.searchEvent = function() {
        	this.div_search.cb_bankCd.set_enable(false);
        	this.div_search.ed_acctNo.set_enable(false);
        	this.div_search.ed_custNm.set_enable(false);
        	this.div_search.cb_custTp.set_enable(false);
        	this.div_search.btn_overlapConfirm03.set_enable(false);
        	this.div_search.ed_ebirDay.set_enable(false);
        	this.div_search.ed_buslNo.set_enable(false);
        	this.chk = "Y";
        }

        //신규 추가시
        this.addEvent = function() {
        	this.div_search.cb_bankCd.set_enable(true);
        	this.div_search.ed_acctNo.set_enable(true);
        	this.div_search.ed_custNm.set_enable(true);
        	this.div_search.cb_custTp.set_enable(true);
        	this.div_search.btn_overlapConfirm03.set_enable(true);
        	this.div_search.ed_ebirDay.set_enable(true);
        	this.div_search.ed_buslNo.set_enable(true);
        	this.chk = "N";
        	
        	//this.div_search.cb_useYn.set_value("Y");
        }

        
        //데이터 값 변경시 인증 여부 체크값 변경

        
        this.div_search_cb_bankCd_onitemchanged = function(obj,e)
        {
        	this.chk = "N";
        }

        this.div_search_ed_acctNo_onchanged = function(obj,e)
        {
        	this.chk = "N";
        }

        this.div_search_ed_custNm_onchanged = function(obj,e)
        {
        	this.chk = "N";
        }

        this.div_cust_ed_buslNo_onchanged = function(obj,e)
        {
        	this.chk = "N";
        }

        //Grid click
        this.Grid00_oncellclick = function(obj,e)
        {
        	
        	if(nvl(this.div_search.ed_accSeq.value) == "") {
        		this.addEvent();
        	} else {
        		this.searchEvent();
        	}
        	
        	this.div_search_cb_custTp_onitemchanged();
        	
        }

        //유형에따른 콤보박스 세팅
        this.comboSet = function() 
        {
        	//신규등록시
        	var parentCustTp  = nvl(this.parent.parent.ds_cust.getColumn( 0, "custTp"));
        	var parentCustTp2 = nvl(this.parent.parent.ds_cust.getColumn( 0, "custTp2"));
        	var parentCustNm = nvl(this.parent.parent.ds_cust.getColumn( 0, "custNm"));
        	var cbVal = this.div_search.cb_custTp.value;
        	var row = this.dsAcc.rowposition;
        	
        	if(this.dsAcc.getRowType(row) != 2) { //신규가 아닐시
        		return;
        	}
        	
        	if(parentCustTp == "01" && parentCustTp2 == "0001") { //개인
        		this.div_search.ed_custNm.set_value(parentCustNm); //예금주
        		this.div_search.cb_custTp.set_value('01'); //구분값 개인으로 고정
        		this.div_search.cb_custTp.set_enable(false); //구분
        		
        		//법정생년월일 세팅
        		var birth = this.parent.parent.ds_cust.getColumn( 0, "birthDay");
        		var birthDay = birth.substring(2, 8);
        		this.div_search.ed_ebirDay.set_value(birthDay);
        		this.div_search.ed_ebirDay.set_enable(false); //생년월일
        		this.div_search.ed_ebirDay.set_visible(true); //법정생년월일보임
        		this.div_search.ed_buslNo.set_visible(false); //사업자등록번호숨김
        		this.div_search.st_cdGrpCd05.set_text('법정생년월일'); //text바꾸기
        		
        	} else if( parentCustTp == "02" && parentCustTp2 == "0002") { //개인 사업자
        		//this.div_search.cb_custTp.set_value("02"); //기본구분은 사업자
        		if(cbVal == '02') { //사업자선택시
        			this.div_search.ed_buslNo.set_visible(true); //사업자등록번호보임
        			this.div_search.ed_buslNo.set_enable(false); //비활성
        			this.div_search.ed_buslNo.set_value(this.parent.parent.ds_cust.getColumn( 0, "buslNo")); //사업자번호 세팅
        			
        			this.div_search.ed_ebirDay.set_value("");//법정생년월일 clear
        			this.div_search.ed_ebirDay.set_visible(false); //법정생년월일숨김
        			
        			this.div_search.ed_custNm.set_value(this.parent.parent.ds_cust.getColumn( 0, "custNm")); //예금주 대표자명 세팅
        			this.div_search.st_cdGrpCd05.set_text('사업자등록번호'); //text바꾸기
        		} else { //개인선택시
        			//var birth = this.parent.parent.ds_cust.getColumn( 0, "oBirthday");
        			//var birthDay = birth.substring(2, 8);
        			this.div_search.ed_ebirDay.set_value("");
        			this.div_search.ed_ebirDay.set_enable(true);
        			this.div_search.ed_ebirDay.set_visible(true); //법정생년월일보임
        			
        			this.div_search.ed_buslNo.set_value(""); //사업자번호 clear
        			this.div_search.ed_buslNo.set_visible(false); //사업자등록번호숨김
        			
        			this.div_search.ed_custNm.set_value(this.parent.parent.ds_cust.getColumn( 0, "repNm")) //대표자명으로 세팅
        			this.div_search.st_cdGrpCd05.set_text('법정생년월일'); //text바꾸기
        		}
        	} else {
        		//alert(this.parent.parent.ds_cust.getColumn( 0, "buslNo"));
        		this.div_search.cb_custTp.set_value("02"); //구분 사업자로 세팅
        		this.div_search.cb_custTp.set_enable(false); //구분 비활성
        		this.div_search.ed_buslNo.set_value(this.parent.parent.ds_cust.getColumn( 0, "buslNo")); //사업자번호 세팅
        		this.div_search.ed_buslNo.set_enable(false); //사업자번호 비활성
        		this.div_search.ed_custNm.set_value(this.parent.parent.ds_cust.getColumn( 0, "custNm")); //예금주 대표자명 세팅
        		this.div_search.ed_ebirDay.set_visible(false); //법정생년월일숨김
        		this.div_search.ed_buslNo.set_visible(true); //사업자등록번호보임
        		this.div_search.st_cdGrpCd05.set_text('사업자등록번호'); //text바꾸기
        	}
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.dsInput.addEventHandler("onvaluechanged", this.dsAcc_onvaluechanged, this);
            this.addEventHandler("onload", this.RTSDCustRegister_tab1_onload, this);
            this.Grid00.addEventHandler("oncellclick", this.Grid00_oncellclick, this);
            this.div_search.btn_new.addEventHandler("onclick", this.div_search_btn_new_onclick, this);
            this.div_search.btn_save.addEventHandler("onclick", this.div_search_btn_save_onclick, this);
            this.div_search.ed_acctNo.addEventHandler("onchanged", this.div_search_ed_acctNo_onchanged, this);
            this.div_search.ed_custNm.addEventHandler("onchanged", this.div_search_ed_custNm_onchanged, this);
            this.div_search.cb_bankCd.addEventHandler("ontextchange", this.div_search_cb_bankCd_ontextchange, this);
            this.div_search.cb_bankCd.addEventHandler("ontextchanged", this.div_search_cb_bankCd_ontextchanged, this);
            this.div_search.cb_bankCd.addEventHandler("onitemchanged", this.div_search_cb_bankCd_onitemchanged, this);
            this.div_search.cb_custTp.addEventHandler("onitemchanged", this.div_search_cb_custTp_onitemchanged, this);
            this.div_search.btn_overlapConfirm03.addEventHandler("onclick", this.div_search_btn_overlapConfirm03_onclick, this);
            this.div_search.ed_buslNo.addEventHandler("onchanged", this.div_cust_ed_buslNo_onchanged, this);
            this.div_search.btn_del.addEventHandler("onclick", this.div_search_btn_del_onclick, this);

        };

        this.loadIncludeScript("RTSDCustRegister_tab1.xfdl");

       
    };
}
)();
