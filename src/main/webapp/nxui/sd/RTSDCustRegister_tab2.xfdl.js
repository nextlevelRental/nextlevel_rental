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
                this.set_name("RTSDCustRegister_tab2");
                this.set_classname("RTCMCustRegister_tab2");
                this.set_titletext("카드");
                this.set_enable("true");
                this.set_visible("true");
                this._setFormPosition(0,0,1122,768);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("dsCard", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"crdSeq\" type=\"STRING\" size=\"256\"/><Column id=\"cardcomCd\" type=\"STRING\" size=\"256\"/><Column id=\"cardcomNm\" type=\"STRING\" size=\"256\"/><Column id=\"cardNo\" type=\"STRING\" size=\"256\"/><Column id=\"expireYm\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"custTp\" type=\"STRING\" size=\"256\"/><Column id=\"custTpNm\" type=\"STRING\" size=\"256\"/><Column id=\"ebirDay\" type=\"STRING\" size=\"256\"/><Column id=\"buslNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"ccustNm\" type=\"STRING\" size=\"256\"/><Column id=\"strDay\" type=\"STRING\" size=\"256\"/><Column id=\"endDay\" type=\"STRING\" size=\"256\"/><Column id=\"bkeyChk\" type=\"STRING\" size=\"256\"/><Column id=\"batchKey\" type=\"STRING\" size=\"256\"/><Column id=\"acncId\" type=\"STRING\" size=\"256\"/><Column id=\"acncDesc\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/><Column id=\"expireY\" type=\"STRING\" size=\"256\"/><Column id=\"expireM\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsCardCustTp", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row/></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsCardType", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row/></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsUseYn", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row/></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsTransInfo", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsParamINfo", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsCms", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsBatch", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"res_cd\" type=\"STRING\" size=\"256\"/><Column id=\"res_msg\" type=\"STRING\" size=\"256\"/><Column id=\"group_id\" type=\"STRING\" size=\"256\"/><Column id=\"cardcomCd\" type=\"STRING\" size=\"256\"/><Column id=\"returnCode\" type=\"STRING\" size=\"256\"/><Column id=\"batchkey\" type=\"STRING\" size=\"256\"/><Column id=\"pay_type\" type=\"STRING\" size=\"256\"/><Column id=\"pay_id\" type=\"STRING\" size=\"256\"/><Column id=\"pay_cert_no\" type=\"STRING\" size=\"256\"/><Column id=\"pay_issue_cd\" type=\"STRING\" size=\"256\"/><Column id=\"pay_issue_nm\" type=\"STRING\" size=\"256\"/><Column id=\"ccertDay\" type=\"STRING\" size=\"256\"/><Column id=\"ccertSeq\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Grid("Grid00", "absolute", "10", "10", "810", "246", null, null, this);
            obj.set_taborder("0");
            obj.set_autofittype("none");
            obj.set_binddataset("dsCard");
            obj.set_scrollbars("autoboth");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"110\"/><Column size=\"80\"/><Column size=\"90\"/><Column size=\"110\"/><Column size=\"70\"/><Column size=\"80\"/><Column size=\"100\"/><Column size=\"70\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"130\"/><Column size=\"80\"/><Column size=\"130\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"카드순번\"/><Cell col=\"1\" text=\"카드사코드\"/><Cell col=\"2\" text=\"카드사명\"/><Cell col=\"3\" text=\"카드번호\"/><Cell col=\"4\" text=\"카드주명\"/><Cell col=\"5\" text=\"법정생년월일\"/><Cell col=\"6\" text=\"사업자번호\"/><Cell col=\"7\" text=\"유효기간\"/><Cell col=\"8\" text=\"사용여부\"/><Cell col=\"9\" text=\"등록자\"/><Cell col=\"10\" text=\"등록일자\"/><Cell col=\"11\" text=\"수정자\"/><Cell col=\"12\" text=\"수정일자\"/></Band><Band id=\"body\"><Cell text=\"bind:crdSeq\"/><Cell col=\"1\" text=\"bind:cardcomCd\"/><Cell col=\"2\" displaytype=\"combo\" text=\"bind:cardcomCd\" combodataset=\"dsCardType\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"3\" text=\"bind:cardNo\"/><Cell col=\"4\" text=\"bind:custNm\"/><Cell col=\"5\" text=\"bind:ebirDay\"/><Cell col=\"6\" text=\"bind:buslNo\"/><Cell col=\"7\" text=\"bind:expireYm\"/><Cell col=\"8\" text=\"bind:useYn\"/><Cell col=\"9\" text=\"bind:regId\"/><Cell col=\"10\" displaytype=\"normal\" text=\"bind:regDt\" mask=\"####-##-##\" calendardisplaynulltype=\"none\"/><Cell col=\"11\" text=\"bind:chgId\"/><Cell col=\"12\" displaytype=\"normal\" text=\"bind:chgDt\" mask=\"####-##-##\" calendardisplaynulltype=\"none\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Div("div_search2", "absolute", "840", "10", "272", "304", null, null, this);
            obj.set_taborder("1");
            obj.set_scrollbars("none");
            obj.set_enable("false");
            obj.set_visible("true");
            this.addChild(obj.name, obj);
            obj = new Static("Static08", "absolute", "0", "239", "272", "31", null, null, this.div_search2);
            obj.set_taborder("47");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_search2.addChild(obj.name, obj);
            obj = new Static("Static05", "absolute", "0", "209", "272", "31", null, null, this.div_search2);
            obj.set_taborder("48");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_search2.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "0", "179", "272", "31", null, null, this.div_search2);
            obj.set_taborder("49");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_search2.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "0", "149", "272", "31", null, null, this.div_search2);
            obj.set_taborder("50");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_search2.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "0", "119", "272", "31", null, null, this.div_search2);
            obj.set_taborder("51");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_search2.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "0", "89", "272", "31", null, null, this.div_search2);
            obj.set_taborder("52");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_search2.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "0", "59", "272", "31", null, null, this.div_search2);
            obj.set_taborder("53");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_search2.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "0", "29", "272", "31", null, null, this.div_search2);
            obj.set_taborder("54");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_search2.addChild(obj.name, obj);
            obj = new Button("btn_new", "absolute", "130", "3", "45", "22", null, null, this.div_search2);
            obj.set_taborder("0");
            obj.set_text("신규");
            obj.set_cssclass("btn_WF_module");
            obj.getSetter("domainId").set("nexa.save");
            obj.set_enable("true");
            obj.set_defaultbutton("false");
            obj.set_visible("true");
            this.div_search2.addChild(obj.name, obj);
            obj = new Button("btn_save", "absolute", "227", "3", "45", "22", null, null, this.div_search2);
            obj.set_taborder("1");
            obj.set_text("저장");
            obj.set_cssclass("btn_WF_module");
            obj.getSetter("domainId").set("nexa.save");
            obj.set_enable("true");
            this.div_search2.addChild(obj.name, obj);
            obj = new Static("st_cdGrpCd00", "absolute", "0", "29", "120", "31", null, null, this.div_search2);
            obj.set_taborder("26");
            obj.set_text("카드순번");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search2.addChild(obj.name, obj);
            obj = new Edit("ed_cardSeq", "absolute", "124", "34", "143", "21", null, null, this.div_search2);
            obj.set_taborder("2");
            obj.set_enable("false");
            this.div_search2.addChild(obj.name, obj);
            obj = new Static("st_cdGrpCd01", "absolute", "0", "89", "120", "31", null, null, this.div_search2);
            obj.set_taborder("28");
            obj.set_text("카드번호");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search2.addChild(obj.name, obj);
            obj = new Edit("ed_cardNo", "absolute", "124", "94", "143", "21", null, null, this.div_search2);
            obj.set_taborder("4");
            obj.set_inputtype("digit");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("16");
            obj.set_enable("true");
            this.div_search2.addChild(obj.name, obj);
            obj = new Static("st_cdGrpCd02", "absolute", "0", "149", "120", "31", null, null, this.div_search2);
            obj.set_taborder("30");
            obj.set_text("카드주명");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search2.addChild(obj.name, obj);
            obj = new Edit("ed_cardNm", "absolute", "124", "154", "98", "21", null, null, this.div_search2);
            obj.set_taborder("7");
            this.div_search2.addChild(obj.name, obj);
            obj = new Static("st_cdGrpCd06", "absolute", "0", "59", "120", "31", null, null, this.div_search2);
            obj.set_taborder("33");
            obj.set_text("카드사");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search2.addChild(obj.name, obj);
            obj = new Static("st_cdGrpCd03", "absolute", "0", "179", "120", "31", null, null, this.div_search2);
            obj.set_taborder("34");
            obj.set_text("구분");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search2.addChild(obj.name, obj);
            obj = new Combo("cb_cardTp", "absolute", "124", "184", "98", "21", null, null, this.div_search2);
            this.div_search2.addChild(obj.name, obj);
            obj.set_taborder("8");
            obj.set_displaynulltext("선택");
            obj.set_innerdataset("@dsCardCustTp");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new Static("st_cdGrpCd04", "absolute", "0", "239", "120", "31", null, null, this.div_search2);
            obj.set_taborder("36");
            obj.set_text("사용여부");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search2.addChild(obj.name, obj);
            obj = new Combo("cb_useYn", "absolute", "124", "244", "98", "21", null, null, this.div_search2);
            this.div_search2.addChild(obj.name, obj);
            obj.set_taborder("12");
            obj.set_displaynulltext("선택");
            obj.set_innerdataset("@dsUseYn");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new Static("st_cdGrpCd05", "absolute", "0", "209", "120", "31", null, null, this.div_search2);
            obj.set_taborder("38");
            obj.set_text("법정생년월일");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search2.addChild(obj.name, obj);
            obj = new Button("btn_overlapConfirm03", "absolute", "226", "214", "41", "21", null, null, this.div_search2);
            obj.set_taborder("9");
            obj.set_text("인증");
            obj.getSetter("domainId").set("nexa.save");
            this.div_search2.addChild(obj.name, obj);
            obj = new MaskEdit("ed_ebirDay", "absolute", "124", "214", "98", "21", null, null, this.div_search2);
            obj.set_taborder("10");
            obj.set_type("string");
            obj.set_mask("######");
            obj.style.setStyleValue("align", "disabled", "left middle");
            this.div_search2.addChild(obj.name, obj);
            obj = new MaskEdit("ed_buslNo", "absolute", "124", "214", "98", "21", null, null, this.div_search2);
            obj.set_taborder("11");
            obj.set_type("string");
            obj.set_mask("###-##-#####");
            obj.set_visible("false");
            obj.style.setStyleValue("align", "disabled", "left middle");
            this.div_search2.addChild(obj.name, obj);
            obj = new Static("st_cdGrpCd07", "absolute", "0", "119", "120", "31", null, null, this.div_search2);
            obj.set_taborder("42");
            obj.set_text("유효기간");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search2.addChild(obj.name, obj);
            obj = new Edit("ed_expireM", "absolute", "124", "124", "35", "21", null, null, this.div_search2);
            obj.set_taborder("5");
            obj.set_displaynulltext("월");
            obj.set_maxlength("2");
            this.div_search2.addChild(obj.name, obj);
            obj = new Edit("ed_expireY", "absolute", "165", "124", "47", "21", null, null, this.div_search2);
            obj.set_taborder("6");
            obj.set_displaynulltext("년도");
            obj.set_maxlength("4");
            this.div_search2.addChild(obj.name, obj);
            obj = new Combo("cb_cardCd", "absolute", "125", "62", "143", "21", null, null, this.div_search2);
            this.div_search2.addChild(obj.name, obj);
            obj.set_taborder("3");
            obj.set_displaynulltext("선택");
            obj.set_innerdataset("@dsCardType");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj.style.set_itemheight("17");
            obj.style.set_font("9 Dotum");
            obj.set_enable("true");
            obj.set_displayrowcount("10");
            obj.set_index("-1");
            obj = new Button("btn_del", "absolute", "178", "3", "45", "22", null, null, this.div_search2);
            obj.set_taborder("55");
            obj.set_text("삭제");
            obj.set_cssclass("btn_WF_module");
            obj.getSetter("domainId").set("nexa.save");
            obj.set_visible("true");
            this.div_search2.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 693, 65, this.div_search2,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("1");
            		p.set_scrollbars("none");
            		p.set_enable("false");
            		p.set_visible("true");

            	}
            );
            this.div_search2.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1122, 768, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCMCustRegister_tab2");
            		p.set_titletext("카드");
            		p.set_enable("true");
            		p.set_visible("true");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item0","div_search2.ed_cardSeq","value","dsCard","crdSeq");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item2","div_search2.ed_cardNo","value","dsCard","cardNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item3","div_search2.ed_cardNm","value","dsCard","custNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item4","div_search2.ed_ebirDay","value","dsCard","ebirDay");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item5","div_search2.ed_buslNo","value","dsCard","buslNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item6","div_search2.cb_useYn","value","dsCard","useYn");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item8","div_search2.ed_expireM","value","dsCard","expireM");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item9","div_search2.ed_expireY","value","dsCard","expireY");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item7","div_search2.cb_cardTp","value","dsCard","custTp");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item10","div_search2.cb_cardCd","value","dsCard","cardcomCd");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTSDCustRegister_tab2.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDCustRegister_tab2.xfdl", function() {
        //include "lib::comLib.xjs";
        this.chk = "N";
        this.toDay  = "";
        this.yyyy  = "";

        //onload
        this.RTSDCustRegister_tab2_onload = function() {
        	if(nvl(this.parent.parent.div_cust.ed_custNo.value) != "") {
        		this.div_search2.set_enable(true);
        	 } else {
        		this.div_search2.set_enable(false);
        	 }
        	 this.fn_init();
        	 this.get_date();

        	 //alert(nvl(this.parent.parent.div_cust.ed_custNo.value));
        }

        //java comm에서 현재 날짜 가져오기
        this.get_date = function() 
        {
        	var sSvcID        	= "getDate";                    
        	var sController   	= "/rtms/comm/getToday.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }

        //조회
        this.fn_init = function(){

        	//this.dsCard.clearData();
        	//var nRow = this.Tab00.tabpage1.dsAcc.addRow();
        	var custNo = this.parent.parent.ds_cust.getColumn( 0, "custNo");
        	
        	var sSvcID      	= "searchCard"; 
        	var sController   	= "rtms/sd/cardList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "dsCard=cardList dsCardCustTp=mapDsCustTp dsCardType=cardType dsUseYn=useType";
        	var sArgs 			= "custNo=" + custNo;
        	//sArgs += Ex.util.setParam("custNo", nvl(custNo));
        	var fn_callBack		= "fn_callBack";

        	//application.transaction( "searchCard" ,"svcurl::rtms/sd/cardList.do", sInDatasets, sOutDatasets, sArgs, "fn_callBack",false);

        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        //callBack
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg)
        	{
        		if (strSvcId == "searchCard") 
        		{
        			var custTp = this.parent.parent.ds_cust.getColumn( 0, "custTp");
         			if(custTp == "01") {
        				this.div_search2.cb_cardTp.set_value('01');
        			} else if(custTp == "02") {
         				this.div_search2.cb_cardTp.set_value('02');
        			}
        			this.searchEvent();
        			this.fn_makeYm(); 
        		}
        		
        		if(strSvcId == "getDate") {
        			var year = String(this.toDay);
        			this.yyyy = year.substring(0, 4);
        		}
        		
        		if (strSvcId == "saveCardData") 
        		{
        			alert(strErrorMsg);
        			this.fn_init();
        		}
        		
        		if(strSvcId == "batchService") {
        		
        			//정상일경우
        			if(nvl(this.dsBatch.getColumn(0,"res_cd")) == "0000") {
        				this.chk = "Y";
        				this.dsCard.setColumn(this.dsCard.rowposition, "bkeyChk", "Y"); 
        				this.dsCard.setColumn(this.dsCard.rowposition, "batchKey", this.dsBatch.getColumn(0, "batchKey")); 
        				
        				//20200722 kstka 카드인증후 정상카드사 코드 리턴된 후 매핑
        				this.dsCard.setColumn(this.dsCard.rowposition, "cardcomCd", this.dsBatch.getColumn(0, "cardcomCd"));
        				
        				alert("인증성공 하였습니다.");
        			} else {
        				this.chk = "N";
        				alert("인증실패 하였습니다.");
        				this.dsCard.setColumn(this.dsCard.rowposition, "bkeyChk", "N");
        			}
        			this.saveBatchResult();
        		}

        	}
        	
        //신규클릭 이벤트
        this.div_search_btn_new_onclick = function(obj,e)
        {
        	this.dsCard.addRow();
        	this.custTpCheck();
        	this.addEvent();
        	this.div_search2.cb_useYn.set_value("Y");
        	this.comboSet();
        	this.div_search2.cb_cardCd.setFocus();
        }

        //삭제버튼
        this.div_search_btn_del_onclick = function(obj,e)
        {
        	var row = this.dsCard.rowposition;
        	
        	if(this.dsCard.getRowType(row) != Dataset.ROWTYPE_NORMAL) {
        		return;
        	}
        	
        	this.dsCard.set_updatecontrol(false);
        	this.dsCard.setRowType(row, Dataset.ROWTYPE_DELETE);
        	this.dsCard.set_updatecontrol(true);
        }

        //저장클릭 이벤트
        this.div_search_btn_save_onclick = function(obj,e)
        {	
        	
        	var flag = false;
        	for(var i = 0 ; i < this.dsCard.getRowCount() ; i++){
        		if(this.dsCard.getRowType(i) == 2 || this.dsCard.getRowType(i) == 4 || this.dsCard.getRowType(i) == 8){
        			flag = true; 
        			break;
        		}
        	}
        	
        	if(flag){
        		var saveFlag = true;
        		
        		for(var i = 0 ; i < this.dsCard.getRowCount() ; i++){

        				if(this.dsCard.getRowType(i) == Dataset.ROWTYPE_INSERT && this.dsCard.getRowType(i) == Dataset.ROWTYPE_UPDATE
        					&& this.dsCard.getRowType(i) == Dataset.ROWTYPE_DELETE){
        				
        					var custNo 	  = nvl(this.dsCard.getColumn(i, "custNo"));	//고객번호
        					var cardcomCd = nvl(this.dsCard.getColumn(i, "cardcomCd")) //카드사코드
        					var cardNo = nvl(this.dsCard.getColumn(i, "cardNo")); //카드번호
        					var expireYm = nvl(this.dsCard.getColumn(i, "expireYm")); //유효기간 년도
        					var custNm = nvl(this.dsCard.getColumn(i, "custNm")); //카드주명
        					var bkeyChk = nvl(this.dsCard.getColumn(i, "bkeyChk")); //배치키 체크
        					var ebirDay = nvl(this.dsCard.getColumn(i, "ebirDay")); //생년월일
        					var useYn = nvl(this.dsCard.getColumn(i, "useYn")); //사용여부
        					var expireY = "";
        					var expireM = "";

        					var yyyyMm = this.toDay.substring(0, 6);
        					
        					if(cardcomCd == "") {
        						alert("카드사를 선택해주세요.");
        						this.Grid00.selectRow(i);
        						saveFlag = false;
        						break;
        						return false;
        					}
        					if(cardNo.length < 13) {
        						alert("카드번호 13자리 이상입력");
        						this.Grid00.selectRow(i);
        						saveFlag = false;
        						break;
        						return false;
        					}			
        					
        					
        					if(parseInt(expireYm, 10) < parseInt(yyyyMm, 10)) {
        						alert('유효기간은 현재 년, 월 보다 커야 합니다.');
        						this.Grid00.selectRow(i);
        						saveFlag = false;
        						break;
        						return false;
        					}
        				
        			
        					if(expireYm == "") {
        						alert("유효기간(년도)을 입력해주세요");
        						this.Grid00.selectRow(i);
        						saveFlag = false;
        						break;
        						return false;
        					} else {
        						if(expireYm.length == 6) {
        							expireY = expireYm.substr(0,4);
        							expireM = expireYm.substr(4,2);
        							if(expireY < this.yyyy) {
        								alert(this.yyyy + "년도 이상으로 입력");
        								this.Grid00.selectRow(i);
        								saveFlag = false;
        								break;
        								return false;
        							}
        							if(expireM > 12) {
        								alert('월을 확인하세요(12이하)');
        								this.Grid00.selectRow(i);
        								saveFlag = false;
        								break;
        								return false;
        							}
        						
        						} else {
        							alert("유효기간은 6자리(YYYYMM)로 입력해주세요.");
        							saveFlag = false;
        								break;
        								return false;
        						}
        					}
        				
        					if(custNm = "") {
        						alert("카드주명 입력");
        						this.Grid00.selectRow(i);
        						saveFlag = false;
        						break;
        						return false;
        					}
        				
        					if( !FN_YYMMDDCheck(ebirDay)){
        						alert('생년월일을 확인하세요');							
        						this.Grid00.selectRow(i);
        						saveFlag = false;
        						break;
        						return false;
        					}
        					
        					if( bkeyChk == "" || bkeyChk == "N"){
        						alert("카드인증을 해주세요");
        						this.Grid00.selectRow(i);
        						saveFlag = false;
        						break;
        						return false;
        					}
        					
        					if(nvl(this.div_search2.cb_useYn.value) == "" || this.div_search2.cb_useYn.value.length == 0) {
        						alert("사용여부를 선택해주세요.")
        						this.Grid00.selectRow(i);
        						saveFlag = false;
        						break;
        						return false;
        					}
        				}
        		}
        		
        		var custNo = this.parent.parent.ds_cust.getColumn( 0, "custNo");
        		this.dsCard.setColumn(this.dsCard.rowposition, "custNo", custNo);
        		
        		if( saveFlag ){
        			var sSvcID        	= "saveCardData";
        			var sController   	= "/rtms/sd/cardSave.do";
        			var sInDatasets   	= "input=dsCard:U";
        			var sOutDatasets  	= "";
        			var sArgs 			= ""
        			var fn_callBack		= "fn_callBack";
        			
        			/*for(var i = 0 ; i < this.dsAcc.getRowCount() ; i++){
        				alert(this.dsAcc.getRowType(i));
        			}*/
        			
        			//trace(">>>>>" + this.dsCard.saveXML());
        			//var seq  = this.dsAcc.getColumn(this.dsAcc.rowposition, "accSeq");
        			Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        		}else{
        			alert("수정된 데이터가 없습니다.");
        		}
        	}
        }
        //인증버튼
        this.div_search_btn_overlapConfirm03_onclick = function(obj,e)
        {
        	this.fn_crdConfirm();
        }

        //개인, 법인 구분 세팅.
        this.custTpCheck = function()
        {
        	var custTp = this.parent.parent.ds_cust.getColumn( 0, "custTp"); //고객정보쪽 고객유형
        	if(custTp == "01") {
        		this.div_search2.cb_cardTp.set_value('01');
        		this.div_search2.ed_buslNo.set_visible(false);
        		this.div_search2.ed_ebirDay.set_visible(true);
        		this.div_search2.st_cdGrpCd05.set_text('법정생년월일');
        	} else if(custTp == "02") {
        		this.div_search2.cb_cardTp.set_value('02');
        		this.div_search2.ed_buslNo.set_visible(true);
        		this.div_search2.ed_ebirDay.set_visible(false);
        		this.div_search2.st_cdGrpCd05.set_text('사업자번호');
        	}
        }

        

        this.div_search2_ed_expireM_onkeyup = function(obj,e)
        {
        	var sExpireYm = nvl(this.div_search2.ed_expireY.value) + nvl(this.div_search2.ed_expireM.value);
        	this.dsCard.setColumn(this.dsCard.rowposition, "expireYm", sExpireYm);
        	this.chk = "N";
        }

        this.div_search2_ed_expireY_onkeyup = function(obj,e)
        {
        	var sExpireYm = nvl(this.div_search2.ed_expireY.value) + nvl(this.div_search2.ed_expireM.value);
        	this.dsCard.setColumn(this.dsCard.rowposition, "expireYm", sExpireYm);
        	this.chk = "N";
        }

        //구분값 체인지시
        this.div_search2_cb_cardTp_onitemchanged = function(obj,e)
        {
        	var cbVal = this.div_search2.cb_cardTp.value;
        	if(cbVal == '01') {
        		this.div_search2.cb_cardTp.set_value('01');
        		this.div_search2.ed_buslNo.set_visible(false);
        		this.div_search2.ed_ebirDay.set_visible(true);
        		this.div_search2.st_cdGrpCd05.set_text('법정생년월일');
        	} else {
        		this.div_search2.cb_cardTp.set_value('02');
        		this.div_search2.ed_buslNo.set_visible(true);
        		this.div_search2.ed_ebirDay.set_visible(false);
        		this.div_search2.st_cdGrpCd05.set_text('사업자번호');
        	}
        	this.comboSet();
        }

        //grid click 이벤트
        this.Grid00_oncellclick = function(obj,e)
        {
        	this.fn_makeYm();
        	if(nvl(this.div_search2.ed_cardSeq.value) == "") {
        		this.addEvent();
        	} else {
        		this.searchEvent();
        	}
        	this.div_search2_cb_cardTp_onitemchanged();
        }

        //유효기간 세팅
        this.fn_makeYm = function() {
        	var sExpireYm = nvl(this.dsCard.getColumn(this.dsCard.rowposition,"expireYm"));
        	var sExpireY = "";
        	var sExpireM = "";	

        
        	if(sExpireYm != "") 
        	{
        		if(sExpireYm.length == 6) 
        		{
        			sExpireY = sExpireYm.substr(0,4);
        			sExpireM = sExpireYm.substr(4,2);
        		}
        	}
        	this.dsCard.set_updatecontrol(false);
        	this.dsCard.setColumn(this.dsCard.rowposition,"expireY",sExpireY);
        	this.dsCard.setColumn(this.dsCard.rowposition,"expireM",sExpireM);
        	this.dsCard.setRowType(this.dsCard.ROWTYPE_NORMAL);
        	this.dsCard.set_updatecontrol(true);
        }

        //일반 조회시
        this.searchEvent = function() {
        	this.div_search2.cb_cardCd.set_enable(false);
        	this.div_search2.ed_cardNo.set_enable(false);
        	this.div_search2.ed_expireM.set_enable(false);
        	this.div_search2.ed_expireY.set_enable(false);
        	this.div_search2.ed_cardNm.set_enable(false);
        	this.div_search2.cb_cardTp.set_enable(false);
        	this.div_search2.btn_overlapConfirm03.set_enable(false);
        	this.div_search2.ed_ebirDay.set_enable(false);
        	this.div_search2.ed_buslNo.set_enable(false);
        	this.chk = "N";
        }

        //신규 추가시
        this.addEvent = function() {
        	this.div_search2.cb_cardCd.set_enable(true);
        	this.div_search2.ed_cardNo.set_enable(true);
        	this.div_search2.ed_expireM.set_enable(true);
        	this.div_search2.ed_expireY.set_enable(true);
        	this.div_search2.ed_cardNm.set_enable(true);
        	this.div_search2.cb_cardTp.set_enable(true);
        	this.div_search2.btn_overlapConfirm03.set_enable(true);
        	this.div_search2.ed_ebirDay.set_enable(true);
        	this.div_search2.ed_buslNo.set_enable(true);
        	this.chk = "N";
        }

        

        
        this.div_search2_ed_cardSeq_onchanged = function(obj,e)
        {
        	this.chk = "N";
        }

        this.div_search2_cb_cardCd_onitemchanged = function(obj,e)
        {
        	this.chk = "N";
        }

        this.div_search2_ed_cardNo_onchanged = function(obj,e)
        {
        	this.chk = "N";
        }

        this.div_search2_ed_cardNm_onchanged = function(obj,e)
        {
        	this.chk = "N";
        }

        

        //유형에따른 콤보박스 세팅
        this.comboSet = function() 
        {
        	//신규등록시
        	var parentCustTp  = nvl(this.parent.parent.ds_cust.getColumn( 0, "custTp"));
        	var parentCustTp2 = nvl(this.parent.parent.ds_cust.getColumn( 0, "custTp2"));
        	var parentCustNm = nvl(this.parent.parent.ds_cust.getColumn( 0, "custNm"));
        	var cbVal = this.div_search2.cb_cardTp.value;
        	var row = this.dsCard.rowposition;
        	
        	if(this.dsCard.getRowType(row) != 2) { //신규가 아닐시 리턴
        		return;
        	}
        	
        	if(parentCustTp == "01" && parentCustTp2 == "0001") { //개인
        		this.div_search2.ed_cardNm.set_value(parentCustNm); //예금주
        		this.div_search2.cb_cardTp.set_value('01'); //구분값 개인으로 고정
        		this.div_search2.cb_cardTp.set_enable(false); //구분
        		
        		//법정생년월일 세팅
        		var birth = this.parent.parent.ds_cust.getColumn( 0, "birthDay");
        		var birthDay = birth.substring(2, 8);
        		this.div_search2.ed_ebirDay.set_value(birthDay);
        		this.div_search2.ed_ebirDay.set_enable(false); //생년월일
        		this.div_search2.ed_cardNm.set_value(this.parent.parent.ds_cust.getColumn( 0, "custNm")); //예금주 대표자명 세팅
        		
        	} else if(parentCustTp == "02" && parentCustTp2 == "0002") { //개인 사업자
        		if(cbVal == '02') { //사업자선택시
        			this.div_search2.ed_buslNo.set_visible(true); //사업자등록번호보임
        			this.div_search2.ed_buslNo.set_enable(false); //비활성
        			this.div_search2.ed_buslNo.set_value(this.parent.parent.ds_cust.getColumn( 0, "buslNo")); //사업자번호 세팅
        			
        			this.div_search2.ed_ebirDay.set_value("");//법정생년월일 clear
        			this.div_search2.ed_ebirDay.set_visible(false); //법정생년월일숨김
        			
        			this.div_search2.ed_cardNm.set_value(this.parent.parent.ds_cust.getColumn( 0, "custNm")); //예금주 대표자명 세팅
        			this.div_search2.st_cdGrpCd05.set_text('사업자등록번호'); //text바꾸기
        		} else { //개인선택시
        			//var birth = this.parent.parent.ds_cust.getColumn( 0, "oBirthday");
        			//var birthDay = birth.substring(2, 8);
        			this.div_search2.ed_ebirDay.set_value("");
        			this.div_search2.ed_ebirDay.set_enable(true);
        			this.div_search2.ed_ebirDay.set_visible(true); //법정생년월일보임
        			
        			this.div_search2.ed_buslNo.set_value(""); //사업자번호 clear
        			this.div_search2.ed_buslNo.set_visible(false); //사업자등록번호숨김
        			
        			
        			this.div_search2.ed_cardNm.set_value(this.parent.parent.ds_cust.getColumn( 0, "repNm")) //대표자명으로 세팅
        			this.div_search2.st_cdGrpCd05.set_text('법정생년월일'); //text바꾸기
        		}
        	} else {
        		this.div_search2.cb_cardTp.set_value("02"); //구분 사업자로 세팅
        		this.div_search2.cb_cardTp.set_enable(false); //구분 비활성
        		this.div_search2.ed_buslNo.set_value(this.parent.parent.ds_cust.getColumn( 0, "buslNo")); //사업자번호 세팅
        		this.div_search2.ed_buslNo.set_enable(false); //사업자번호 비활성
        		this.div_search2.ed_cardNm.set_value(this.parent.parent.ds_cust.getColumn( 0, "custNm")); //예금주 대표자명 세팅
        	}
        }

        	//-------------------------------------------------------------------------------  
        	//카드인증
        	//-------------------------------------------------------------------------------  	
        	this.fn_crdConfirm = function() {
        	
        		if(nvl(this.div_search2.ed_cardNo.value).length < 13) {
        			alert("카드번호 13자리 이상입력");
        			this.div_search2.ed_cardNo.setFocus();
        			return false;
        		}
        		
        		if(nvl(this.div_search2.ed_expireY.value) == "") {
        			alert("유효기간(년도)을 입력해주세요");
        			this.div_search2.ed_expireY.setFocus();
        			return false;
        		} else {
        			if(this.div_search2.ed_expireY.value < this.yyyy) {
        				alert(this.yyyy + "년도 이상으로 입력");
        				this.div_search2.ed_expireY.setFocus();
        				return false;
        			}
        		}
        		
        		if(nvl(this.div_search2.ed_expireM.value) == "") {
        			alert("유효기간(월)을 입력해주세요");
        			this.div_search2.ed_expireM.setFocus();
        			return false;
        		} else {
        			if(this.div_search2.ed_expireM.value > 12) {
        				alert('월을 확인하세요');
        				this.div_search2.ed_expireM.setFocus();
        				return false;
        			}
        		}
        		
        		var yyyyMm = this.toDay.substring(0, 6);
        		var inputToday = this.div_search2.ed_expireY.value + this.div_search2.ed_expireM.value;
        		
        		if(parseInt(inputToday, 10) < parseInt(yyyyMm, 10)) {
        			alert('유효기간은 현재 년, 월 보다 커야 합니다.');
        			this.div_search2.ed_expireM.setFocus();
        			return false;
        		}
        		
        		if( !FN_YYMMDDCheck(this.div_search2.ed_ebirDay.value)){
        			alert('생년월일을 확인하세요');
        			this.div_search2.ed_ebirDay.setFocus();
        			return false;
        		}
        		
        		var sSvcID 			= "batchService";
        		var sInDatasets 	= "";
        		var sOutDatasets 	= "dsBatch=batch_output";
        		var sController 	= "/rtms/cms/kcphubBatch.do";
        		var fn_callBack 	= "fn_callBack";
        		var sArgs 			= "";
        		
        		sArgs += Ex.util.setParam("site_cust_id"	, nvl(this.parent.parent.ds_cust.getColumn( 0, "custNo")));	//고객아이디	
        		sArgs += Ex.util.setParam("group_id"		, application.gv_group_id);									//그룹번호
        		sArgs += Ex.util.setParam("cust_name"		, nvl(this.parent.parent.ds_cust.getColumn( 0, "custNm")));	//고객명
        		sArgs += Ex.util.setParam("pay_type"		, application.gv_pay_type);									//결제수단
        		sArgs += Ex.util.setParam("pay_id"			, nvl(this.div_search2.ed_cardNo.value));					//카드번호
        		sArgs += Ex.util.setParam("pay_expiry_yy"	, nvl(this.div_search2.ed_expireY.value));					//유효기간(년)
        		sArgs += Ex.util.setParam("pay_expiry_mm"	, nvl(this.div_search2.ed_expireM.value));					//유효기간(월)
        		sArgs += Ex.util.setParam("pay_owner_nm"	, nvl(this.div_search2.ed_cardNm.value));					//카드소유자명
        		
        		//sArgs += Ex.util.setParam("pay_cert_no"		, nvl(this.div_search2.ed_ebirDay.value));					//생년월일	
        		sArgs += Ex.util.setParam("pay_cert_no"		, nvl(this.div_search2.ed_ebirDay.value));					//생년월일
        		sArgs += Ex.util.setParam("cmbGubun"		, nvl(this.div_search2.cb_cardTp.value));					//고객유형(01:개인/02:사업자)
        		sArgs += Ex.util.setParam("busl_no"			, nvl(this.div_search2.ed_buslNo.value));   				//사업자번호
        		sArgs += Ex.util.setParam("cardcomCd"		, nvl(this.div_search2.cb_cardCd.value));					//카드사코드

        		Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 				
        	}	

        	//-------------------------------------------------------------------------------  
        	//카드인증후 처리함수
        	//-------------------------------------------------------------------------------  		
        	this.saveBatchResult = function() {
        		var sSvcID        	= "batchResultService";                    
        		var sController   	= "ntrms/cm/kcphubBatchResult.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		sInDatasets   		= "input=dsBatch";
        		sOutDatasets  		= "";
        		var fn_callBack		= "fn_callBack";
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);	
        	}

        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTSDCustRegister_tab2_onload, this);
            this.Grid00.addEventHandler("oncellclick", this.Grid00_oncellclick, this);
            this.div_search2.btn_new.addEventHandler("onclick", this.div_search_btn_new_onclick, this);
            this.div_search2.btn_save.addEventHandler("onclick", this.div_search_btn_save_onclick, this);
            this.div_search2.ed_cardSeq.addEventHandler("onchanged", this.div_search2_ed_cardSeq_onchanged, this);
            this.div_search2.ed_cardNo.addEventHandler("onchanged", this.div_search2_ed_cardNo_onchanged, this);
            this.div_search2.ed_cardNm.addEventHandler("onchanged", this.div_search2_ed_cardNm_onchanged, this);
            this.div_search2.cb_cardTp.addEventHandler("onitemchanged", this.div_search2_cb_cardTp_onitemchanged, this);
            this.div_search2.btn_overlapConfirm03.addEventHandler("onclick", this.div_search_btn_overlapConfirm03_onclick, this);
            this.div_search2.ed_ebirDay.addEventHandler("oneditclick", this.div_search_MaskEdit00_oneditclick, this);
            this.div_search2.ed_buslNo.addEventHandler("oneditclick", this.div_search_ed_buslNo_oneditclick, this);
            this.div_search2.ed_buslNo.addEventHandler("onchanged", this.div_cust_ed_buslNo_onchanged, this);
            this.div_search2.ed_expireM.addEventHandler("onkeyup", this.div_search2_ed_expireM_onkeyup, this);
            this.div_search2.ed_expireY.addEventHandler("onkeyup", this.div_search2_ed_expireY_onkeyup, this);
            this.div_search2.cb_cardCd.addEventHandler("ontextchanged", this.div_search_cb_bankCd_ontextchanged, this);
            this.div_search2.cb_cardCd.addEventHandler("ontextchange", this.div_search_cb_bankCd_ontextchange, this);
            this.div_search2.cb_cardCd.addEventHandler("ontouchend", this.div_search2_cb_cardCd_ontouchend, this);
            this.div_search2.cb_cardCd.addEventHandler("ontouchstart", this.div_search2_cb_cardCd_ontouchstart, this);
            this.div_search2.cb_cardCd.addEventHandler("onitemchanged", this.div_search2_cb_cardCd_onitemchanged, this);
            this.div_search2.btn_del.addEventHandler("onclick", this.div_search_btn_del_onclick, this);

        };

        this.loadIncludeScript("RTSDCustRegister_tab2.xfdl");

       
    };
}
)();
