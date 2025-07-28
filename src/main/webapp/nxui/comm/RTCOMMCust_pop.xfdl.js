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
                this.set_name("RTCOMMCust_pop");
                this.set_classname("RTCOMMCust_pop");
                this.set_titletext("고객찾기");
                this._setFormPosition(0,0,1085,450);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_cust", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custTp\" type=\"STRING\" size=\"256\"/><Column id=\"custTp2\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"birthDay\" type=\"STRING\" size=\"256\"/><Column id=\"genderCd\" type=\"STRING\" size=\"256\"/><Column id=\"lfCd\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"mobFirm\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"faxNo\" type=\"STRING\" size=\"256\"/><Column id=\"bldMngNo\" type=\"STRING\" size=\"256\"/><Column id=\"posCd\" type=\"STRING\" size=\"256\"/><Column id=\"addr1\" type=\"STRING\" size=\"256\"/><Column id=\"addr2\" type=\"STRING\" size=\"256\"/><Column id=\"telNo2\" type=\"STRING\" size=\"256\"/><Column id=\"bldMngNo2\" type=\"STRING\" size=\"256\"/><Column id=\"posCd2\" type=\"STRING\" size=\"256\"/><Column id=\"addr12\" type=\"STRING\" size=\"256\"/><Column id=\"addr22\" type=\"STRING\" size=\"256\"/><Column id=\"addrSum1\" type=\"STRING\" size=\"256\"/><Column id=\"addrSum2\" type=\"STRING\" size=\"256\"/><Column id=\"safekey\" type=\"STRING\" size=\"256\"/><Column id=\"buslNo\" type=\"STRING\" size=\"256\"/><Column id=\"corpNo\" type=\"STRING\" size=\"256\"/><Column id=\"repNm\" type=\"STRING\" size=\"256\"/><Column id=\"oCustnm\" type=\"STRING\" size=\"256\"/><Column id=\"oBirthday\" type=\"STRING\" size=\"256\"/><Column id=\"oGendercd\" type=\"STRING\" size=\"256\"/><Column id=\"oLfcd\" type=\"STRING\" size=\"256\"/><Column id=\"oMobno\" type=\"STRING\" size=\"256\"/><Column id=\"oSafekey\" type=\"STRING\" size=\"256\"/><Column id=\"cCustnm\" type=\"STRING\" size=\"256\"/><Column id=\"cTelno\" type=\"STRING\" size=\"256\"/><Column id=\"emailAddr\" type=\"STRING\" size=\"256\"/><Column id=\"emailAddr1\" type=\"STRING\" size=\"256\"/><Column id=\"emailAddr2\" type=\"STRING\" size=\"256\"/><Column id=\"busiType\" type=\"STRING\" size=\"256\"/><Column id=\"busiCond\" type=\"STRING\" size=\"256\"/><Column id=\"taxYn\" type=\"STRING\" size=\"256\"/><Column id=\"kunnr\" type=\"STRING\" size=\"256\"/><Column id=\"ciCd\" type=\"STRING\" size=\"256\"/><Column id=\"diCd\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_custCp", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custTp\" type=\"STRING\" size=\"256\"/><Column id=\"custTp2\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"birthDay\" type=\"STRING\" size=\"256\"/><Column id=\"genderCd\" type=\"STRING\" size=\"256\"/><Column id=\"lfCd\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"mobFirm\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"faxNo\" type=\"STRING\" size=\"256\"/><Column id=\"bldMngNo\" type=\"STRING\" size=\"256\"/><Column id=\"posCd\" type=\"STRING\" size=\"256\"/><Column id=\"addr1\" type=\"STRING\" size=\"256\"/><Column id=\"addr2\" type=\"STRING\" size=\"256\"/><Column id=\"telNo2\" type=\"STRING\" size=\"256\"/><Column id=\"bldMngNo2\" type=\"STRING\" size=\"256\"/><Column id=\"posCd2\" type=\"STRING\" size=\"256\"/><Column id=\"addr12\" type=\"STRING\" size=\"256\"/><Column id=\"addr22\" type=\"STRING\" size=\"256\"/><Column id=\"addrSum1\" type=\"STRING\" size=\"256\"/><Column id=\"addrSum2\" type=\"STRING\" size=\"256\"/><Column id=\"safekey\" type=\"STRING\" size=\"256\"/><Column id=\"buslNo\" type=\"STRING\" size=\"256\"/><Column id=\"corpNo\" type=\"STRING\" size=\"256\"/><Column id=\"repNm\" type=\"STRING\" size=\"256\"/><Column id=\"oCustnm\" type=\"STRING\" size=\"256\"/><Column id=\"oBirthday\" type=\"STRING\" size=\"256\"/><Column id=\"oGendercd\" type=\"STRING\" size=\"256\"/><Column id=\"oLfcd\" type=\"STRING\" size=\"256\"/><Column id=\"oMobno\" type=\"STRING\" size=\"256\"/><Column id=\"oSafekey\" type=\"STRING\" size=\"256\"/><Column id=\"cCustnm\" type=\"STRING\" size=\"256\"/><Column id=\"cTelno\" type=\"STRING\" size=\"256\"/><Column id=\"emailAddr\" type=\"STRING\" size=\"256\"/><Column id=\"emailAddr1\" type=\"STRING\" size=\"256\"/><Column id=\"emailAddr2\" type=\"STRING\" size=\"256\"/><Column id=\"busiType\" type=\"STRING\" size=\"256\"/><Column id=\"busiCond\" type=\"STRING\" size=\"256\"/><Column id=\"taxYn\" type=\"STRING\" size=\"256\"/><Column id=\"kunnr\" type=\"STRING\" size=\"256\"/><Column id=\"ciCd\" type=\"STRING\" size=\"256\"/><Column id=\"diCd\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_custTp", this);
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

            obj = new Dataset("ds_genderCd", this);
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

            obj = new Dataset("ds_lfCd", this);
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
            obj = new Grid("grid_cust", "absolute", "10", "120", null, "286", "10", null, this);
            obj.set_taborder("1");
            obj.set_binddataset("ds_cust");
            obj.set_cellsizingtype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"100\"/><Column size=\"80\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"0\"/><Column size=\"100\"/><Column size=\"0\"/><Column size=\"80\"/><Column size=\"280\"/><Column size=\"210\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"고객번호\"/><Cell col=\"1\" text=\"고객명\"/><Cell col=\"2\" text=\"법정생년월일\"/><Cell col=\"3\" text=\"사업자번호\"/><Cell col=\"4\" text=\"전화번호\"/><Cell col=\"5\" text=\"전화번호\"/><Cell col=\"6\" text=\"휴대폰번호\"/><Cell col=\"7\" text=\"휴대폰번호\"/><Cell col=\"8\" text=\"우편번호\"/><Cell col=\"9\" text=\"주소\"/><Cell col=\"10\" text=\"상세주소\"/></Band><Band id=\"body\"><Cell style=\"align:center;\" text=\"bind:custNo\"/><Cell col=\"1\" style=\"align:center;\" text=\"bind:custNm\"/><Cell col=\"2\" style=\"align:center;\" text=\"bind:birthDay\" mask=\"####-##-##\"/><Cell col=\"3\" style=\"align:center;\" text=\"bind:buslNo\" mask=\"###-##-#####\"/><Cell col=\"4\" text=\"bind:telNo\" expr=\"expr:FN_numberMaskReturn(telNo)\"/><Cell col=\"5\" style=\"align:center;\" text=\"bind:telNo\" expr=\"expr:FN_numberHyphenInReturn(telNo)\"/><Cell col=\"6\" text=\"bind:mobNo\" expr=\"expr:FN_numberMaskReturn(mobNo)\"/><Cell col=\"7\" style=\"align:center;\" text=\"bind:mobNo\"/><Cell col=\"8\" style=\"align:center;\" text=\"bind:posCd\"/><Cell col=\"9\" edittype=\"readonly\" style=\"align:left;\" text=\"bind:addr1\"/><Cell col=\"10\" style=\"align:left;\" text=\"bind:addr2\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "10", "10", "1065", "100", null, null, this);
            obj.set_taborder("0");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Button("btn_search", "absolute", null, "61", "45", "22", "20", null, this.div_search);
            obj.set_taborder("9");
            obj.set_text("검색");
            obj.set_cssclass("btn_WF_CRUD");
            obj.getSetter("domainId").set("nexa.add");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_custTp", "absolute", "20", "10", "100", "21", null, null, this.div_search);
            obj.set_taborder("10");
            obj.set_text("고객유형");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_custNm", "absolute", "140", "35", "120", "21", null, null, this.div_search);
            obj.set_taborder("1");
            obj.set_enable("true");
            this.div_search.addChild(obj.name, obj);
            obj = new Radio("ra_custTp", "absolute", "140", "12", "120", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("0");
            obj.set_innerdataset("@ds_custTp");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_direction("vertical");
            obj.set_index("-1");
            obj = new Static("st_buslNo", "absolute", "280", "35", "100", "21", null, null, this.div_search);
            obj.set_taborder("11");
            obj.set_text("사업자번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_telNo", "absolute", "280", "61", "100", "21", null, null, this.div_search);
            obj.set_taborder("14");
            obj.set_text("전화번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_telNo2", "absolute", "540", "61", "100", "21", null, null, this.div_search);
            obj.set_taborder("13");
            obj.set_text("전화번호2");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_telNo", "absolute", "400", "61", "120", "21", null, null, this.div_search);
            obj.set_taborder("7");
            obj.set_enable("true");
            obj.set_inputtype("number");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_telNo2", "absolute", "660", "61", "120", "21", null, null, this.div_search);
            obj.set_taborder("8");
            obj.set_enable("true");
            obj.set_inputtype("number");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_custNm", "absolute", "20", "35", "100", "21", null, null, this.div_search);
            obj.set_taborder("12");
            obj.set_text("고객명");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_birthDay", "absolute", "280", "35", "100", "21", null, null, this.div_search);
            obj.set_taborder("18");
            obj.set_text("법정생년월일");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_genderCd", "absolute", "540", "35", "100", "21", null, null, this.div_search);
            obj.set_taborder("16");
            obj.set_text("성별");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_genderCd", "absolute", "660", "35", "120", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("4");
            obj.set_displaynulltext("선택");
            obj.set_innerdataset("ds_genderCd");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new Static("st_lfCd", "absolute", "800", "35", "100", "21", null, null, this.div_search);
            obj.set_taborder("17");
            obj.set_text("내/외국인");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_lfCd", "absolute", "920", "35", "120", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("5");
            obj.set_displaynulltext("선택");
            obj.set_innerdataset("ds_lfCd");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new Static("st_mobNo", "absolute", "20", "61", "100", "21", null, null, this.div_search);
            obj.set_taborder("15");
            obj.set_text("휴대폰");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new MaskEdit("ed_mobNo", "absolute", "140", "61", "120", "21", null, null, this.div_search);
            obj.set_taborder("6");
            obj.set_type("string");
            obj.set_mask("###-####-####");
            this.div_search.addChild(obj.name, obj);
            obj = new MaskEdit("ed_birthDay", "absolute", "400", "35", "120", "21", null, null, this.div_search);
            obj.set_taborder("3");
            obj.set_type("string");
            obj.set_mask("####-##-##");
            this.div_search.addChild(obj.name, obj);
            obj = new MaskEdit("ed_buslNo", "absolute", "400", "35", "120", "21", null, null, this.div_search);
            obj.set_taborder("2");
            obj.set_type("string");
            obj.set_mask("###-##-#####");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static07", "absolute", "0", "0", "1041", "12", null, null, this.div_search);
            obj.set_taborder("19");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "0", "84", "1041", "12", null, null, this.div_search);
            obj.set_taborder("20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "0", "0", "20", "96", null, null, this.div_search);
            obj.set_taborder("21");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "0", "55", "1041", "6", null, null, this.div_search);
            obj.set_taborder("23");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "0", "31", "1041", "6", null, null, this.div_search);
            obj.set_taborder("24");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "260", "0", "20", "96", null, null, this.div_search);
            obj.set_taborder("25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static05", "absolute", "380", "0", "20", "96", null, null, this.div_search);
            obj.set_taborder("26");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static08", "absolute", "520", "0", "20", "96", null, null, this.div_search);
            obj.set_taborder("27");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static09", "absolute", "640", "0", "20", "96", null, null, this.div_search);
            obj.set_taborder("28");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static10", "absolute", "780", "0", "20", "96", null, null, this.div_search);
            obj.set_taborder("29");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static11", "absolute", "900", "0", "20", "96", null, null, this.div_search);
            obj.set_taborder("30");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static12", "absolute", "1041", "0", "20", "96", null, null, this.div_search);
            obj.set_taborder("31");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "120", "0", "20", "96", null, null, this.div_search);
            obj.set_taborder("32");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);

            obj = new Button("btn_choice", "absolute", null, "416", "41", "21", "55", null, this);
            obj.set_taborder("2");
            obj.set_text("선택");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);

            obj = new Button("btn_close", "absolute", null, "416", "41", "21", "10", null, this);
            obj.set_taborder("3");
            obj.set_text("닫기");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1092, 142, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("0");
            		p.set_scrollbars("none");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1085, 450, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCOMMCust_pop");
            		p.set_titletext("고객찾기");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCOMMCust_pop.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCOMMCust_pop.xfdl", function() {
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //include "lib::comLib.xjs";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg,resultCnt,checkAuthGrpuCd){
        	if (strSvcId == "initRTCOMMCustPop"){
        		if( this.ds_custTp.rowcount != 0 ){
        			this.div_search.ra_custTp.set_value( this.ds_custTp.getColumn(0,"cd") );
        			this.div_search_ra_custTp_onitemchanged();
        		}
        	}
        	if(strSvcId == "listCustInfo"){
        		var rowCt = this.ds_cust.getRowCount();
        		if( rowCt == 0 ){
        			alert("조회된 데이터가 없습니다.");
        			this.grid_cust.set_nodatatext("조회된 데이터가 없습니다.");
        		}
        	}
        	
        	if (strSvcId == "saveCustRegister"){
        		
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.RTCOMMCust_pop_onload = function(obj,e){
        	Ex.core.init(obj);
        	this.fn_init();
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_init = function(){
        	var sSvcID      	= "initRTCOMMCustPop";  
        	var sController   	= "rtms/comm/initRTCOMMCustPop.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_custTp=mapDsCustTp ds_genderCd=mapDsGenderCd ds_lfCd=mapDsLfcd";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_ra_custTp_onitemchanged = function(obj,e){
        	this.ds_cust.deleteAll();
        	if( this.div_search.ra_custTp.value == "01" ){
        		this.div_search.st_custNm.set_text("고객명");
        		
        		this.div_search.st_birthDay.set_visible(true);
        		this.div_search.ed_birthDay.set_visible(true);
        		
        		this.div_search.st_buslNo.set_visible(false);
        		this.div_search.ed_buslNo.set_visible(false);
        		
        		this.div_search.st_mobNo.set_visible(true);
        		this.div_search.ed_mobNo.set_visible(true);

        		this.div_search.st_genderCd.set_visible(true);
        		this.div_search.cb_genderCd.set_visible(true);

        		this.div_search.st_lfCd.set_visible(true);
        		this.div_search.cb_lfCd.set_visible(true);
        		
        		this.grid_cust.setRealColSize( 2, 100 );//법정생년월일
        		this.grid_cust.setRealColSize( 3, 0 );//사업자번호
        		
        		this.grid_cust.setCellProperty( "Head", 1, "text", "고객명");
        		
        		this.div_search.st_telNo.move(280,61);
        		this.div_search.ed_telNo.move(400,61);
        		
        		this.div_search.st_telNo2.move(540,61);
        		this.div_search.ed_telNo2.move(660,61);
        	}else{
        		this.div_search.st_custNm.set_text("법인명");
        		
        		this.div_search.st_birthDay.set_visible(false);
        		this.div_search.ed_birthDay.set_visible(false);
        		
        		this.div_search.st_buslNo.set_visible(true);
        		this.div_search.ed_buslNo.set_visible(true);
        		
        		this.div_search.st_mobNo.set_visible(false);
        		this.div_search.ed_mobNo.set_visible(false);

        		this.div_search.st_genderCd.set_visible(false);
        		this.div_search.cb_genderCd.set_visible(false);

        		this.div_search.st_lfCd.set_visible(false);
        		this.div_search.cb_lfCd.set_visible(false);
        		
        		this.grid_cust.setRealColSize( 2, 0 );//법정생년월일
        		this.grid_cust.setRealColSize( 3, 100 );//사업자번호
        			
        		this.grid_cust.setCellProperty( "Head", 1, "text", "법인명");
        		
        		this.div_search.st_telNo.move(540,35);
        		this.div_search.ed_telNo.move(660,35);
        		
        		this.div_search.st_telNo2.move(800,35);
        		this.div_search.ed_telNo2.move(920,35);
        	}
        	this.div_search.ed_custNm.set_value("");
        	this.div_search.ed_telNo.set_value("");
        	this.div_search.ed_mobNo.set_value("");
        	this.div_search.ed_telNo2.set_value("");
        	this.div_search.ed_buslNo.set_value("");
        	this.div_search.ed_birthDay.set_value("");
        	this.div_search.cb_genderCd.set_index(-1);
        	this.div_search.cb_lfCd.set_index(-1);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_btn_search_onclick = function(obj,e){
        	var sSvcID        	= "listCustInfo";                    
        	var sController   	= "rtms/comm/listCustInfo.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_cust=mapCustInfo";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        		
        	var custTp 		= nvl(this.div_search.ra_custTp.value);	
        	var custNm 		= nvl(this.div_search.ed_custNm.value);
        	
        	var birthDay 	= nvl(this.div_search.ed_birthDay.value);
        	var buslNo 		= nvl(this.div_search.ed_buslNo.value);
        	
        	var mobNo 		= nvl(this.div_search.ed_mobNo.value);
        	var telNo 		= nvl(FN_numberHyphenOut(nvl(this.div_search.ed_telNo.value)));
        	var telNo2 		= nvl(FN_numberHyphenOut(nvl(this.div_search.ed_telNo2.value)));
        	
        	var genderCd 	= nvl(this.div_search.cb_genderCd.value);
        	var lfCd 		= nvl(this.div_search.cb_lfCd.value);
        	var ordId		= nvl(this.parent.ordId);
        		
        	if( custTp == "01" ){
        		var searchCt = 0;
        		if( custNm != "")	{ searchCt++; }
        		if( birthDay != "")	{ searchCt++; }
        		if( mobNo != "")	{ searchCt++; }
        		if( telNo != "")	{ searchCt++; }
        		
        		if( searchCt <= 1){
        			alert("고객명, 법정생년월일, 핸드폰, 전화번호 중 최소 2개는 입력하셔야합니다.");
        			return false;
        		}else{
        			sArgs += Ex.util.setParam("birthDay", birthDay);
        			sArgs += Ex.util.setParam("mobNo", mobNo);
        			sArgs += Ex.util.setParam("genderCd", genderCd);
        			sArgs += Ex.util.setParam("lfCd", lfCd);
        		}
        	}else{
        		var searchCt = 0;
        		if( custNm != "")	{ searchCt++; }
        		if( buslNo != "")	{ searchCt++; }
        		
        		if( searchCt < 1){
        			alert("법인명 , 사업자번호 중 최소 1개는 입력하셔야합니다.");
        			return false;
        		}else{
        			sArgs += Ex.util.setParam("buslNo", buslNo);
        		}
        	}
        	
        	sArgs += Ex.util.setParam("custTp",custTp);
        	sArgs += Ex.util.setParam("custNm", custNm);
        	sArgs += Ex.util.setParam("telNo", telNo);
        	sArgs += Ex.util.setParam("telNo2", telNo2);
        	sArgs += Ex.util.setParam("ordId", ordId);
        	
        	this.ds_cust.clearData();
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.grid_cust_oncelldblclick = function(obj,e){
        	this.FN_choice();
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.btn_choice_onclick = function(obj,e){
        	this.FN_choice();
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.FN_choice = function(){
        	var pos = this.ds_cust.rowposition;
        	
        	if( pos == -1 ){
        		alert("선택된 데이터가 없습니다.");
        	}else{
        		if( this.parent.p_arg == "RTSDCustGrp_1" ){
        			var custNo 	= this.ds_cust.getColumn(pos, "custNo");
        			res = [ custNo ];
        			this.close( this.opener.FN_custNo_1(res) );
        		}else if( this.parent.p_arg == "RTSDCustGrp_2" ){
        			var custNm 	= this.ds_cust.getColumn(pos, "custNm");
        			var custNo 	= this.ds_cust.getColumn(pos, "custNo");
        			res = [ custNm, custNo ];
        			this.close( this.opener.FN_custNo_2(res) );
        		}else if( this.parent.p_arg == "RTCSInboundAdviceRegister" ){
        			var mobNo 	= this.ds_cust.getColumn(pos, "mobNo");
        			var custNm 	= this.ds_cust.getColumn(pos, "custNm");
        			var custNo 	= this.ds_cust.getColumn(pos, "custNo");
        			res = [ mobNo, custNm, custNo ];
        			this.close( this.opener.FN_custNo(res) );
        		}else if( this.parent.p_arg == "RTCSKeepHistory"   || this.parent.p_arg=="RTCSEngineOilRepSer" || this.parent.p_arg=="RTCSZeroSed_makerNmervice"){
        			var custNo 	= this.ds_cust.getColumn(pos, "custNo");
        			var custNm 	= this.ds_cust.getColumn(pos, "custNm");
        			res = [ custNo,custNm ];
        			this.close( this.opener.returnCustNo(res) );
        		}else if( this.parent.p_arg == "RTCMOrdAgentOrder" ){
        			var custNo 	= this.ds_cust.getColumn(pos, "custNo");
        			var custNm 	= this.ds_cust.getColumn(pos, "custNm");
        			res = [ custNo, custNm ];
        			this.close( this.opener.returnCustInfo(res) );
        		}else if( this.parent.p_arg == "RTSDBillModify" ){
        			var custNo 	= this.ds_cust.getColumn(pos, "custNo");
        			var custNm 	= this.ds_cust.getColumn(pos, "custNm");
        			res = [ custNo, custNm ];
        			this.close( this.opener.returnCustInfo(res) );
        		}else if( this.parent.p_arg == "RTCSZeroRepService" ){
        			var custNo 	= this.ds_cust.getColumn(pos, "custNo");
        			var custNm 	= this.ds_cust.getColumn(pos, "custNm");
        			res = [ custNo, custNm ];
        			this.close( this.opener.returnCustInfo(res) );
        		}else if( this.parent.p_arg == "RTSDClaimMgmt_pop" ){
        			var custNo 	= this.ds_cust.getColumn(pos, "custNo");
        			res = [ custNo ];
        			this.close( this.opener.returnCustInfo(res) );
        		}else{
        			this.ds_custCp.clearData();
        			var idx = this.ds_custCp.addRow();
        			this.ds_custCp.copyRow(idx, this.ds_cust, pos);
        			var arr = [this.ds_custCp];
        			this.close(this.opener.returnCustInfo(arr));
        		}
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.btn_close_onclick = function(obj,e){
        	this.close();
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_ed_telNo_onkeyup = function(obj,e){
        	FN_numberHyphenIn(obj, e);
        }
        this.div_search_ed_telNo2_onkeyup = function(obj,e){
        	FN_numberHyphenIn(obj, e);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_ed_mobNo_onsetfocus = function(obj,e){
        	this.FN_setSelect(obj);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_ed_mobNo_oneditclick = function(obj,e){
        	this.FN_setSelect(obj);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_ed_buslNo_oneditclick = function(obj,e){
        	this.FN_setSelect(obj);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_ed_buslNo_onsetfocus = function(obj,e){
        	this.FN_setSelect(obj);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_ed_birthDay_oneditclick = function(obj,e){
        	this.FN_setSelect(obj);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_ed_birthDay_onsetfocus = function(obj,e){
        	this.FN_setSelect(obj);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.FN_setSelect = function(obj){
        	obj.setSelect(0);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.RTCOMMCust_pop_onkeyup = function(obj,e){
        	if(e.keycode == 27){
        		this.close();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_ed_buslNo_onkeyup = function(obj,e){
        	if( e.keycode == "13" ){
        		this.div_search_btn_search_onclick();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_ed_birthDay_onkeyup = function(obj,e){
        	if( e.keycode == "13" ){
        		this.div_search_btn_search_onclick();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTCOMMCust_pop_onload, this);
            this.addEventHandler("onkeyup", this.RTCOMMCust_pop_onkeyup, this);
            this.grid_cust.addEventHandler("oncelldblclick", this.grid_cust_oncelldblclick, this);
            this.div_search.btn_search.addEventHandler("onclick", this.div_search_btn_search_onclick, this);
            this.div_search.ra_custTp.addEventHandler("onitemchanged", this.div_search_ra_custTp_onitemchanged, this);
            this.div_search.ed_telNo.addEventHandler("onkeyup", this.div_search_ed_telNo_onkeyup, this);
            this.div_search.ed_telNo2.addEventHandler("onkeyup", this.div_search_ed_telNo2_onkeyup, this);
            this.div_search.ed_mobNo.addEventHandler("onsetfocus", this.div_search_ed_mobNo_onsetfocus, this);
            this.div_search.ed_mobNo.addEventHandler("oneditclick", this.div_search_ed_mobNo_oneditclick, this);
            this.div_search.ed_birthDay.addEventHandler("oneditclick", this.div_search_ed_birthDay_oneditclick, this);
            this.div_search.ed_birthDay.addEventHandler("onsetfocus", this.div_search_ed_birthDay_onsetfocus, this);
            this.div_search.ed_birthDay.addEventHandler("onkeyup", this.div_search_ed_birthDay_onkeyup, this);
            this.div_search.ed_buslNo.addEventHandler("oneditclick", this.div_search_ed_buslNo_oneditclick, this);
            this.div_search.ed_buslNo.addEventHandler("onsetfocus", this.div_search_ed_buslNo_onsetfocus, this);
            this.div_search.ed_buslNo.addEventHandler("onkeyup", this.div_search_ed_buslNo_onkeyup, this);
            this.btn_choice.addEventHandler("onclick", this.btn_choice_onclick, this);
            this.btn_close.addEventHandler("onclick", this.btn_close_onclick, this);

        };

        this.loadIncludeScript("RTCOMMCust_pop.xfdl");

       
    };
}
)();
