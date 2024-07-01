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
                this.set_name("RTCSAdvicetStatus_tab_info1_custInfo");
                this.set_classname("RTCMCustRegister");
                this.set_scrollbars("autoboth");
                this.set_titletext("[STEP1]고객등록");
                this.set_name("RTSDCustRegister");
                this._setFormPosition(0,0,1147,221);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_genderCd", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_mobFirm", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_emailAddr2", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_cust", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custTp\" type=\"STRING\" size=\"256\"/><Column id=\"custTp2\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"birthDay\" type=\"STRING\" size=\"256\"/><Column id=\"genderCd\" type=\"STRING\" size=\"256\"/><Column id=\"lfCd\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"mobFirm\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"faxNo\" type=\"STRING\" size=\"256\"/><Column id=\"bldMngNo\" type=\"STRING\" size=\"256\"/><Column id=\"posCd\" type=\"STRING\" size=\"256\"/><Column id=\"addr1\" type=\"STRING\" size=\"256\"/><Column id=\"addr2\" type=\"STRING\" size=\"256\"/><Column id=\"telNo2\" type=\"STRING\" size=\"256\"/><Column id=\"bldMngNo2\" type=\"STRING\" size=\"256\"/><Column id=\"posCd2\" type=\"STRING\" size=\"256\"/><Column id=\"addr12\" type=\"STRING\" size=\"256\"/><Column id=\"addr22\" type=\"STRING\" size=\"256\"/><Column id=\"safekey\" type=\"STRING\" size=\"256\"/><Column id=\"buslNo\" type=\"STRING\" size=\"256\"/><Column id=\"corpNo\" type=\"STRING\" size=\"256\"/><Column id=\"repNm\" type=\"STRING\" size=\"256\"/><Column id=\"oCustnm\" type=\"STRING\" size=\"256\"/><Column id=\"oBirthday\" type=\"STRING\" size=\"256\"/><Column id=\"oGendercd\" type=\"STRING\" size=\"256\"/><Column id=\"oLfcd\" type=\"STRING\" size=\"256\"/><Column id=\"oMobno\" type=\"STRING\" size=\"256\"/><Column id=\"oSafekey\" type=\"STRING\" size=\"256\"/><Column id=\"cCustnm\" type=\"STRING\" size=\"256\"/><Column id=\"cTelno\" type=\"STRING\" size=\"256\"/><Column id=\"emailAddr\" type=\"STRING\" size=\"256\"/><Column id=\"emailAddr1\" type=\"STRING\" size=\"256\"/><Column id=\"emailAddr2\" type=\"STRING\" size=\"256\"/><Column id=\"busiType\" type=\"STRING\" size=\"256\"/><Column id=\"busiCond\" type=\"STRING\" size=\"256\"/><Column id=\"taxYn\" type=\"STRING\" size=\"256\"/><Column id=\"kunnr\" type=\"STRING\" size=\"256\"/><Column id=\"ciCd\" type=\"STRING\" size=\"256\"/><Column id=\"diCd\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Div("div_cust", "absolute", "0", "0", null, "242", "25", null, this);
            obj.set_taborder("0");
            obj.style.set_background("@gradation");
            obj.set_scrollbars("none");
            obj.set_enable("true");
            this.addChild(obj.name, obj);
            obj = new Edit("ed_safekey", "absolute", "17.74%", "180", "100", "20", null, null, this.div_cust);
            obj.set_taborder("31");
            obj.set_enable("false");
            obj.set_displaynulltext("SAFEKEY");
            obj.set_visible("false");
            obj.set_readonly("false");
            this.div_cust.addChild(obj.name, obj);
            obj = new Edit("ed_taxYn", "absolute", "303", "180", "120", "20", null, null, this.div_cust);
            obj.set_taborder("51");
            obj.set_displaynulltext("개인사업자 면세여부");
            obj.set_enable("false");
            obj.set_visible("false");
            obj.set_readonly("false");
            this.div_cust.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "0", "60", null, "31", "0", null, this.div_cust);
            obj.set_taborder("60");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_cust.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "0", "30", null, "31", "0", null, this.div_cust);
            obj.set_taborder("59");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_cust.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "0", "60", null, "31", "0", null, this.div_cust);
            obj.set_taborder("61");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_cust.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "0", "90", null, "31", "0", null, this.div_cust);
            obj.set_taborder("62");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_cust.addChild(obj.name, obj);
            obj = new Static("Static17", "absolute", "0", "0", null, "31", "0", null, this.div_cust);
            obj.set_taborder("58");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_cust.addChild(obj.name, obj);
            obj = new Static("st_custTp", "absolute", "0", "0", "120", "31", null, null, this.div_cust);
            obj.set_taborder("32");
            obj.set_text("고객유형");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_cust.addChild(obj.name, obj);
            obj = new Edit("ed_custNm", "absolute", "124", "35", "140", "21", null, null, this.div_cust);
            obj.set_taborder("3");
            obj.set_maxlength("80");
            obj.set_imemode("hangul");
            obj.set_readonly("true");
            this.div_cust.addChild(obj.name, obj);
            obj = new Static("st_custNm", "absolute", "0", "30", "120", "31", null, null, this.div_cust);
            obj.set_taborder("33");
            obj.set_text("고객명");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_cust.addChild(obj.name, obj);
            obj = new Static("st_mobNo", "absolute", "543", "0", "100", "31", null, null, this.div_cust);
            obj.set_taborder("34");
            obj.set_text("휴대폰");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_cust.addChild(obj.name, obj);
            obj = new Static("st_posCd", "absolute", "0", "60", "120", "31", null, null, this.div_cust);
            obj.set_taborder("35");
            obj.set_text("고객주소");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_cust.addChild(obj.name, obj);
            obj = new Edit("ed_posCd", "absolute", "124", "65", "140", "21", null, null, this.div_cust);
            obj.set_taborder("27");
            obj.set_maxlength("6");
            obj.set_inputtype("number");
            obj.set_enable("true");
            obj.set_readonly("true");
            this.div_cust.addChild(obj.name, obj);
            obj = new Static("st_posCd2", "absolute", "0", "90", "120", "31", null, null, this.div_cust);
            obj.set_taborder("36");
            obj.set_text("근무지주소");
            obj.getSetter("domainId").set("nexa.s_condition");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_cust.addChild(obj.name, obj);
            obj = new Edit("ed_posCd2", "absolute", "124", "95", "140", "21", null, null, this.div_cust);
            obj.set_taborder("29");
            obj.set_maxlength("6");
            obj.set_inputtype("number");
            obj.set_enable("true");
            obj.set_readonly("true");
            this.div_cust.addChild(obj.name, obj);
            obj = new Static("st_birthDay", "absolute", "268", "30", "120", "31", null, null, this.div_cust);
            obj.set_taborder("37");
            obj.set_text("법정생년월일");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_cust.addChild(obj.name, obj);
            obj = new Static("st_mobFirm", "absolute", "795", "0", "120", "31", null, null, this.div_cust);
            obj.set_taborder("38");
            obj.set_text("통신사");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_cust.addChild(obj.name, obj);
            obj = new Static("st_genderCd", "absolute", "543", "30", "100", "31", null, null, this.div_cust);
            obj.set_taborder("39");
            obj.set_text("성별");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_cust.addChild(obj.name, obj);
            obj = new Static("st_custNo", "absolute", "268", "0", "120", "31", null, null, this.div_cust);
            obj.set_taborder("41");
            obj.set_text("고객번호");
            obj.getSetter("domainId").set("nexa.s_condition");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_cust.addChild(obj.name, obj);
            obj = new Edit("ed_custNo", "absolute", "392", "5", "140", "21", null, null, this.div_cust);
            obj.set_taborder("1");
            obj.set_enable("true");
            obj.set_readonly("true");
            this.div_cust.addChild(obj.name, obj);
            obj = new Button("btn_safeKeyConfirm", "absolute", "986", "5", "77", "21", null, null, this.div_cust);
            obj.set_taborder("13");
            obj.set_text("인증번호확인");
            obj.getSetter("domainId").set("nexa.save");
            this.div_cust.addChild(obj.name, obj);
            obj = new Edit("ed_emailAddr1", "absolute", "867", "35", "90", "21", null, null, this.div_cust);
            obj.set_taborder("16");
            obj.set_maxlength("35");
            obj.set_imemode("none");
            obj.set_enable("true");
            obj.set_readonly("true");
            this.div_cust.addChild(obj.name, obj);
            obj = new Static("st_emailAddr", "absolute", "763", "30", "100", "31", null, null, this.div_cust);
            obj.set_taborder("43");
            obj.set_text("e-mail주소");
            obj.getSetter("domainId").set("nexa.s_condition");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_cust.addChild(obj.name, obj);
            obj = new Static("st_cdGrpCd11", "absolute", "958", "34", "25", "20", null, null, this.div_cust);
            obj.set_taborder("44");
            obj.set_text("@");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_cust.addChild(obj.name, obj);
            obj = new Static("st_addr1", "absolute", "268", "60", "120", "31", null, null, this.div_cust);
            obj.set_taborder("45");
            obj.set_text("주소");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_cust.addChild(obj.name, obj);
            obj = new Edit("ed_addr1", "absolute", "392", "65", "210", "21", null, null, this.div_cust);
            obj.set_taborder("28");
            obj.set_maxlength("100");
            obj.set_enable("true");
            obj.set_readonly("true");
            this.div_cust.addChild(obj.name, obj);
            obj = new Static("st_addr2", "absolute", "268", "90", "120", "31", null, null, this.div_cust);
            obj.set_taborder("46");
            obj.set_text("주소");
            obj.getSetter("domainId").set("nexa.s_condition");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_cust.addChild(obj.name, obj);
            obj = new Edit("ed_addr12", "absolute", "392", "95", "210", "21", null, null, this.div_cust);
            obj.set_taborder("30");
            obj.set_maxlength("100");
            obj.set_enable("true");
            obj.set_readonly("true");
            this.div_cust.addChild(obj.name, obj);
            obj = new Edit("ed_addr22", "absolute", "606", "95", "245", "21", null, null, this.div_cust);
            obj.set_taborder("24");
            obj.set_maxlength("160");
            obj.set_enable("true");
            obj.set_readonly("true");
            this.div_cust.addChild(obj.name, obj);
            obj = new Edit("ed_addr2", "absolute", "606", "65", "245", "21", null, null, this.div_cust);
            obj.set_taborder("21");
            obj.set_maxlength("160");
            obj.set_enable("true");
            obj.set_readonly("true");
            this.div_cust.addChild(obj.name, obj);
            obj = new Static("st_telNo", "absolute", "854", "60", "100", "31", null, null, this.div_cust);
            obj.set_taborder("47");
            obj.set_text("전화번호");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_cust.addChild(obj.name, obj);
            obj = new Static("st_telNo2", "absolute", "854", "90", "100", "31", null, null, this.div_cust);
            obj.set_taborder("48");
            obj.set_text("전화번호");
            obj.getSetter("domainId").set("nexa.s_condition");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_cust.addChild(obj.name, obj);
            obj = new MaskEdit("ed_birthDay", "absolute", "392", "35", "140", "20", null, null, this.div_cust);
            obj.set_taborder("4");
            obj.set_type("string");
            obj.set_mask("####-##-##");
            obj.set_enable("false");
            this.div_cust.addChild(obj.name, obj);
            obj = new Edit("ed_emailAddr2", "absolute", "971", "35", "92", "21", null, null, this.div_cust);
            obj.set_taborder("18");
            obj.set_maxlength("35");
            obj.set_visible("true");
            obj.set_enable("true");
            obj.set_readonly("true");
            this.div_cust.addChild(obj.name, obj);
            obj = new Edit("ed_useYn", "absolute", "418", "180", "100", "20", null, null, this.div_cust);
            obj.set_taborder("50");
            obj.set_displaynulltext("사용여부");
            obj.set_enable("false");
            obj.set_visible("false");
            obj.set_readonly("false");
            this.div_cust.addChild(obj.name, obj);
            obj = new Static("st_buslNo", "absolute", "268", "30", "120", "31", null, null, this.div_cust);
            obj.set_taborder("52");
            obj.set_text("사업자번호");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            obj.set_visible("false");
            this.div_cust.addChild(obj.name, obj);
            obj = new MaskEdit("ed_buslNo", "absolute", "392", "35", "140", "21", null, null, this.div_cust);
            obj.set_taborder("5");
            obj.set_type("string");
            obj.set_mask("###-##-#####");
            obj.set_visible("false");
            obj.set_enable("false");
            this.div_cust.addChild(obj.name, obj);
            obj = new CheckBox("ch_birthDayAndBuslNoCh", "absolute", "866", "181", "190", "20", null, null, this.div_cust);
            obj.set_taborder("57");
            obj.set_text("법정생년월일&사업자번호체크");
            obj.set_visible("false");
            obj.set_enable("false");
            obj.set_value("true");
            obj.set_readonly("false");
            this.div_cust.addChild(obj.name, obj);
            obj = new Edit("ed_telNo", "absolute", "960", "65", "139", "21", null, null, this.div_cust);
            obj.set_taborder("22");
            obj.set_maxlength("80");
            obj.set_inputtype("number");
            obj.set_readonly("true");
            this.div_cust.addChild(obj.name, obj);
            obj = new Edit("ed_telNo2", "absolute", "960", "95", "139", "21", null, null, this.div_cust);
            obj.set_taborder("25");
            obj.set_maxlength("80");
            obj.set_inputtype("number");
            obj.set_readonly("true");
            this.div_cust.addChild(obj.name, obj);
            obj = new Button("btn_postSearch1", "absolute", "244", "64", "20", "21", null, null, this.div_cust);
            obj.set_taborder("20");
            obj.getSetter("domainId").set("nexa.save");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_cust.addChild(obj.name, obj);
            obj = new Button("btn_postSearch2", "absolute", "244", "94", "20", "21", null, null, this.div_cust);
            obj.set_taborder("23");
            obj.getSetter("domainId").set("nexa.save");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_cust.addChild(obj.name, obj);
            obj = new Edit("ed_di", "absolute", "0", "180", "100", "21", null, null, this.div_cust);
            obj.set_taborder("66");
            obj.set_maxlength("80");
            obj.set_enable("false");
            obj.set_displaynulltext("di");
            obj.set_visible("false");
            obj.set_readonly("false");
            this.div_cust.addChild(obj.name, obj);
            obj = new Edit("ed_ci", "absolute", "99", "180", "100", "21", null, null, this.div_cust);
            obj.set_taborder("67");
            obj.set_maxlength("80");
            obj.set_enable("false");
            obj.set_displaynulltext("ci");
            obj.set_visible("false");
            obj.set_readonly("false");
            this.div_cust.addChild(obj.name, obj);
            obj = new CheckBox("ch_safekeyFlag", "absolute", "526", "181", "65", "21", null, null, this.div_cust);
            obj.set_taborder("70");
            obj.set_value("false");
            obj.set_enable("false");
            obj.set_visible("false");
            obj.set_text("safekey");
            obj.set_readonly("false");
            this.div_cust.addChild(obj.name, obj);
            obj = new CheckBox("ch_loginCheck2", "absolute", "733", "181", "128", "24", null, null, this.div_cust);
            obj.set_taborder("74");
            obj.set_text("로그인아이디체크");
            obj.set_visible("false");
            obj.set_enable("false");
            obj.set_readonly("false");
            this.div_cust.addChild(obj.name, obj);
            obj = new CheckBox("ch_loginCheck1", "absolute", "605", "181", "128", "24", null, null, this.div_cust);
            obj.set_taborder("75");
            obj.set_text("로그인아이디체크");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_cust.addChild(obj.name, obj);
            obj = new Edit("ed_mobNo", "absolute", "647", "5", "140", "21", null, null, this.div_cust);
            obj.set_taborder("11");
            obj.set_maxlength("80");
            obj.set_readonly("true");
            this.div_cust.addChild(obj.name, obj);
            obj = new Edit("ed_custTp", "absolute", "124", "5", "20", "21", null, null, this.div_cust);
            obj.set_taborder("76");
            obj.set_imemode("hangul");
            obj.set_maxlength("80");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_cust.addChild(obj.name, obj);
            obj = new Edit("ed_mobFirm", "absolute", "919", "5", "59", "21", null, null, this.div_cust);
            obj.set_taborder("78");
            obj.set_maxlength("80");
            obj.set_readonly("true");
            this.div_cust.addChild(obj.name, obj);
            obj = new Edit("ed_genderCd", "absolute", "659", "35", "91", "21", null, null, this.div_cust);
            obj.set_taborder("79");
            obj.set_maxlength("80");
            obj.set_visible("false");
            this.div_cust.addChild(obj.name, obj);
            obj = new Edit("ed_custTpNm", "absolute", "124", "5", "140", "21", null, null, this.div_cust);
            obj.set_taborder("80");
            obj.set_imemode("hangul");
            obj.set_maxlength("80");
            obj.set_enable("false");
            obj.set_visible("true");
            this.div_cust.addChild(obj.name, obj);
            obj = new Edit("ed_genderCdNm", "absolute", "659", "35", "91", "21", null, null, this.div_cust);
            obj.set_taborder("81");
            obj.set_maxlength("80");
            obj.set_visible("true");
            obj.set_readonly("true");
            this.div_cust.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1122", "0", "25", "222", null, null, this);
            obj.set_taborder("6");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Button("bt_save", "absolute", "1042", "122", "45", "22", null, null, this);
            obj.set_taborder("7");
            obj.set_text("저장");
            obj.set_cssclass("btn_WF_module");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1024, 301, this.div_cust,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("0");
            		p.style.set_background("@gradation");
            		p.set_scrollbars("none");
            		p.set_enable("true");

            	}
            );
            this.div_cust.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1147, 221, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCMCustRegister");
            		p.set_scrollbars("autoboth");
            		p.set_titletext("[STEP1]고객등록");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("bind_custNo","div_cust.ed_custNo","value","ds_cust","custNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("bind_custNm","div_cust.ed_custNm","value","ds_cust","custNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("bind_emailAddr1","div_cust.ed_emailAddr1","value","ds_cust","emailAddr1");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("bind_posCd","div_cust.ed_posCd","value","ds_cust","posCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("bind_addr1","div_cust.ed_addr1","value","ds_cust","addr1");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("bind_addr2","div_cust.ed_addr2","value","ds_cust","addr2");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("bind_posCd2","div_cust.ed_posCd2","value","ds_cust","posCd2");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("bind_addr12","div_cust.ed_addr12","value","ds_cust","addr12");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("bind_addr22","div_cust.ed_addr22","value","ds_cust","addr22");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("bind_birthDay","div_cust.ed_birthDay","value","ds_cust","birthDay");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("bind_useYn","div_cust.ed_useYn","value","ds_cust","useYn");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("bind_taxYn","div_cust.ed_taxYn","value","ds_cust","taxYn");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("bind_buslNo","div_cust.ed_buslNo","value","ds_cust","buslNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("bind_telNo","div_cust.ed_telNo","value","ds_cust","telNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("bind_telNo2","div_cust.ed_telNo2","value","ds_cust","telNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item0","div_cust.ed_di","value","ds_cust","diCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item2","div_cust.ed_ci","value","ds_cust","ciCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item3","div_cust.ed_mobNo","value","ds_cust","mobNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item1","div_cust.ed_custTp","value","ds_cust","custTp");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item5","div_cust.ed_mobFirm","value","ds_cust","mobFirm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item6","div_cust.ed_emailAddr2","value","ds_cust","emailAddr2");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item4","div_cust.ed_genderCd","value","ds_cust","genderCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item7","div_cust.ed_custTpNm","value","ds_contractStatus","custTpNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item8","div_cust.ed_genderCdNm","value","ds_contractStatus","genderCdNm");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCSAdvicetStatus_tab_info1_custInfo.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCSAdvicetStatus_tab_info1_custInfo.xfdl", function() {
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //include "lib::comLib.xjs"; 
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.resultSafekey 		= "0";
        this.resultCustNo 		= "0";
        this.resultBuslCnt 		= "0";
        this.checkbuslNo 		= "";
        this.resultSuccessCd 	= "";
        this.resultSuccessMsg 	= "";
        this.resultNagYn 		= "N";
        this.selectSafekey 		= "";
        this.oldMobNo			= "";
        this.certificationFlag	= false;
        this.cerChangeFlag		= false;//본인인증 신분증->휴대폰으로 변경하면 인증을 받아야함.
        this.toDay 				= "";   //현재날짜
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg){
        	if( strSvcId == "initRTCMCustRegister" ){
        		if( this.ds_custTp.rowcount != 0 && this.ds_certification.rowcount != 0){
        			this.initSetValue();
        			this.div_cust.ed_custNm.setFocus(true);
        		}
        	}
        	
        	if(strSvcId == "getToday"){
        	}	

        	if( strSvcId == "safeKeyConfirm" ){

        		if( this.resultCustNo == "0" ){

        			if( nvl(this.resultSafekey) != "0" && this.resultSuccessCd == "P000" ){
        				this.FN_safekeyEnable();
        				this.div_cust.ch_safekeyFlag.set_value(true);
        				this.div_cust.ed_safekey.set_value( nvl(this.resultSafekey) );
        				alert("인증번호 확인완료했습니다.");
        			}else{
        				var msg = "";
        				if( this.resultSuccessCd == "S003" ){ 
        					msg = "인증번호 확인이 되지 않아 safekey 등록을 시작합니다.";
        				}
        				if( this.resultSuccessCd == "P015" ){
        					msg = "중복건이 존재하므로 등록을 시작합니다.";
        				}
        				if( this.resultSuccessCd == "S003" || this.resultSuccessCd == "P015"){
        					if( confirm(msg) ){
        						this.FN_safekeyEnable();
        						this.div_cust.ch_safekeyFlag.set_value(false);
        						// safekey 가 존재하지 않고 
        						// IR통신을 통해 전달된 safekey가 없는경우 팝업을 통해 
        						// safekey 인증을 시작한다.

        						var kunnr 			= nvl(this.div_cust.ed_custNo.value);
        						var birthDay 		= nvl(this.div_cust.ed_birthDay.value);
        						var mobNo 			= FN_numberHyphenOut(nvl(this.div_cust.ed_mobNo.value));
        						var gender 			= nvl(this.div_cust.cb_genderCd.value);
        						var emailAddr1  	= nvl(this.div_cust.ed_emailAddr1.value);
        						var emailAddr2  	= nvl(this.div_cust.ed_emailAddr2.value);	
        						var custNm 			= nvl(this.div_cust.ed_custNm.value);
        						var email 			= emailAddr1 + "@" + emailAddr2;
        						
        						var doc = this.div_cust.safekey_interface.document;
        						doc.getElementById("kunnr").value 		= kunnr;
        						doc.getElementById("username").value 	= custNm;
        						doc.getElementById("birthdate").value 	= birthDay;
        						doc.getElementById("gender").value 		= gender;
        						doc.getElementById("mobileno").value 	= mobNo;
        						doc.getElementById("email").value 		= email;
        						doc.getElementById("safe_fn_popup").click();
        					}
        				}else{
        					var nRow = application.gds_msg.findRow( "cd", this.resultSuccessCd);
        					var msg  = application.gds_msg.getColumn(nRow, "msg");
        					alert(this.resultSuccessCd + " : " +msg);
        				}
        			}
        		}else{
        			if( confirm( "인증번호로 이미 등록된 고객이 있습니다.\n고객번호는 \'"+this.resultCustNo+"\' 입니다." + "\고객번호로 조회하시겠습니까?") ){
        				this.FN_custNoSelect( this.resultCustNo );
        			}else{
        				return false;
        			}
        		}
        	}
        	
        	if( strSvcId == "saveAdviceCust" ){
        		if( nErrorCode == "0" && this.resultCustNo != "0" ){
        			if( confirm( strErrorMsg +"\n저장된 고객번호는 \'"+this.resultCustNo+"\' 입니다." + "\n저장된 고객번호로 조회하시겠습니까?") ){
        				this.certificationFlag	= false;
        				this.cerChangeFlag		= true;
        				this.FN_custNoSelect( this.resultCustNo );
        			}else{
        				this.reload();
        			}
        		}else{
        			alert(strErrorMsg);
        		}
        	}

        	
        	if( strSvcId == "saveBeforSafeKeyConfirm"){
        /*		if( nvl(this.selectSafekey) != "0" ){*/
        			this.div_cust.ed_safekey.set_value( this.selectSafekey );
        			var sSvcID        	= "saveBeforSafeKeySelect";                    
        			var sController   	= "rtms/sd/saveBeforSafeKeySelect.do";
        			var sInDatasets   	= "";
        			var sOutDatasets  	= "";
        			var sArgs 			= "";	
        			var fn_callBack		= "fn_callBack";
        			sArgs += Ex.util.setParam("safekey", this.selectSafekey);
        			Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 				
        // 		}else{
        // 			alert("인증번호 확인이 되지 않아 저장할 수 없습니다.");
        // 		}
        	}
        	
        	if( strSvcId == "saveBeforSafeKeySelect" ){
        		if( this.resultCustNo == "0" ){
        			this.div_cust.ch_safekeyFlag.set_value(true);
        			this.fn_goSave();
        		}else{
        			if( confirm( "인증번호로 이미 등록된 고객이 있습니다.\n고객번호는 \'"+this.resultCustNo+"\' 입니다." + "\고객번호로 조회하시겠습니까?") ){
        				this.FN_custNoSelect( this.resultCustNo );
        			}else{
        				return false;
        			}
        		}
        	}

        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.RTCSAdviceStatus_tab_info1_custInfo_onload = function(obj,e){
        	Ex.core.init(obj);
        	this.fn_getToday();
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_getToday = function(){
        	var sSvcID      	= "getToday";  
        	var sController   	= "/rtms/comm/getToday.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 	
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.FN_safekeyEnable = function(){
        	this.div_cust.btn_safeKeyConfirm.set_enable(false);
        	this.div_cust.ra_custTp.set_enable(false);
        	this.div_cust.ed_custNm.set_enable(false);
        	this.div_cust.ed_birthDay.set_enable(false);
        	this.div_cust.cb_genderCd.set_enable(false);
        	this.div_cust.cb_lfCd.set_enable(false);
        	this.div_cust.ed_mobNo.set_enable(false);
        	this.div_cust.cb_mobFirm.set_enable(false);
        	this.div_cust.ed_emailAddr1.setFocus(true);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.initSetValue = function(){
        	this.div_cust.ra_custTp.set_value( this.ds_custTp.getColumn(0,"cd") );
        	this.div_cust.ra_certification.set_value( this.ds_certification.getColumn(0,"cd") );
        	this.div_cust.ed_taxYn.set_value("N");		//고객유형이 개인이면 개인사업자 면세여부는 "N"
        	this.div_cust.cb_custTp2.set_value("0001");	//고객분류 : 개인사업자
        	this.div_cust.ed_useYn.set_value("Y");
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_save = function(obj,e){
        	this.fn_goSave();
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_goSave = function(){

        	if( confirm( "저장하시겠습니까?") ){
        	
        		var cnt = 0;
        		var dsCustCnt = this.ds_cust.getRowCount();
        		for( var i = 0 ; i < dsCustCnt ; i++ ){
        		var iRowType = this.ds_cust.getRowType(i);		
        		if( iRowType == 2 || iRowType == 4 || iRowType == 8 ){ //2:Insert, 4:Update, 8:Delete
        			cnt++;
        			}
        		}
        		if(cnt != 0) {
        			var sSvcID        	= "saveAdviceCust";                    
        		var sController   	= "rtms/sd/saveAdviceCust.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		sInDatasets   		+= "input=ds_cust:U";
        		sOutDatasets  		= "";
        		var fn_callBack		= "fn_callBack";
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);	
        		}else{
        			alert("변경된 데이터가 없습니다!");
        			return false; 
        		}	
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_cust_btn_postSearch1_onclick = function(obj,e){
        	var args ={p_arg : "RTCSAdviceStatus_tab_info1_custInfo_1"};
        	Ex.core.popup(this,"우편번호 조회","comm::RTCOMMPostCode_pop.xfdl",args, "modaless=false");
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_cust_btn_postSearch2_onclick = function(obj,e){
        	var args ={p_arg : "RTCSAdviceStatus_tab_info1_custInfo_2"};
        	Ex.core.popup(this,"우편번호 조회","comm::RTCOMMPostCode_pop.xfdl",args, "modaless=false");
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.FN_postCd = function(res,division ){
        	if( division == "addr1"){
        		this.div_cust.ed_addr2.set_enable(true);
        		this.div_cust.ed_posCd.set_value( res[0] );
        		this.div_cust.ed_addr1.set_value( res[1] );
        		this.div_cust.ed_addr2.set_value( res[2] );
        		//20200709 kstka 빌딩번호 추가
        		this.ds_cust.setColumn(this.ds_cust.rowposition, "bldMngNo", res[3]);
        	}else{
        		this.div_cust.ed_addr22.set_enable(true);
        		this.div_cust.ed_posCd2.set_value( res[0] );
        		this.div_cust.ed_addr12.set_value( res[1] );
        		this.div_cust.ed_addr22.set_value( res[2] );
        		//20200709 kstka 빌딩번호 추가
        		this.ds_cust.setColumn(this.ds_cust.rowposition, "bldMngNo2", res[3]);
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_cust_btn_safeKeyConfirm_onclick = function(obj,e){
        	var custTpNm 	= nvl(this.div_cust.ed_custTpNm.value);
        	var custTp		= nvl(this.div_cust.ed_custTp.value);
        	var custNm 		= nvl(this.div_cust.ed_custNm.value);
        	var birthDay 	= nvl(this.div_cust.ed_birthDay.value);
        	var genderCd 	= nvl(this.div_cust.ed_genderCd.value);
        	var genderCdNm 	= nvl(this.div_cust.ed_genderCdNm.value);
        	var mobNo 		= FN_numberHyphenOut( nvl(this.div_cust.ed_mobNo.value) );
        	var mobFirm 	= nvl(this.div_cust.ed_mobFirm.value);
        	var age			= (parseInt(this.toDay.substr(0,4))-parseInt(birthDay.substr(0,4))) + 1;

        
        	switch( custTp == "01" ){

        		case custNm 	== "" : alert( this.div_cust.st_custNm.text + " 값이 없습니다." );
        								this.div_cust.ed_custNm.setFocus(true);
        								break;
        		case birthDay 	== "" : alert( this.div_cust.st_birthDay.text + " 값이 없습니다." );
        								this.div_cust.ed_birthDay.setFocus(true);
        								break;

        		case genderCd 	== "" : alert( this.div_cust.st_genderCd.text + " 값이 없습니다." );
        								this.div_cust.cb_genderCd.setFocus(true);
        								break;

        		case mobNo	 	== "" : alert( this.div_cust.st_mobNo.text + " 값이 없습니다." );
        								this.div_cust.ed_mobNo.setFocus(true);
        								break;
        			
        		case mobFirm 	== "" : alert( this.div_cust.st_mobFirm.text + " 값이 없습니다." );
        								this.div_cust.cb_mobFirm.setFocus(true);
        								break;
        		case age >  100 : alert( "법정생년월일을 확인하세요." );
        						  this.div_cust.ed_birthDay.setFocus(true);
        						  break;
        		default : this.FN_safekeyConfirm(custNm, birthDay, genderCd, mobNo, mobFirm);
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.FN_safekeyConfirm = function(custNm,birthDay,genderCd,mobNo,mobFirm){

        	var sSvcID        	= "safeKeyConfirm";                    
        	var sController   	= "rtms/sd/safeKeyConfirm.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        		
        	sArgs += Ex.util.setParam("custNm", custNm);
        	sArgs += Ex.util.setParam("birthDay", birthDay);
        	sArgs += Ex.util.setParam("genderCd", 	genderCd);
        	sArgs += Ex.util.setParam("mobNo", mobNo);
        	sArgs += Ex.util.setParam("mobFirm", mobFirm);
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_cust_ed_mobNo_onkeyup = function(obj,e){
        	FN_numberHyphenIn(obj, e);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_cust_ed_telNo_onkeyup = function(obj,e){
        	FN_numberHyphenIn(obj, e);
        }

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_cust_ed_telNo2_onkeyup = function(obj,e){
        	FN_numberHyphenIn(obj, e);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_cust_ed_cTelno_onkeyup = function(obj,e){
        	FN_numberHyphenIn(obj, e);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

        this.bt_save_onclick = function(obj,e)
        {
        	this.fn_save();
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTCSAdviceStatus_tab_info1_custInfo_onload, this);
            this.div_cust.ed_custNo.addEventHandler("oneditclick", this.div_cust_ed_custNo_oneditclick, this);
            this.div_cust.btn_safeKeyConfirm.addEventHandler("onclick", this.div_cust_btn_safeKeyConfirm_onclick, this);
            this.div_cust.ed_birthDay.addEventHandler("onchanged", this.div_cust_ed_birthDay_onchanged, this);
            this.div_cust.ed_birthDay.addEventHandler("onsetfocus", this.div_cust_ed_birthDay_onsetfocus, this);
            this.div_cust.ed_buslNo.addEventHandler("onchanged", this.div_cust_ed_buslNo_onchanged, this);
            this.div_cust.ed_buslNo.addEventHandler("onsetfocus", this.div_cust_ed_buslNo_onsetfocus, this);
            this.div_cust.ed_telNo.addEventHandler("onkeyup", this.div_cust_ed_telNo_onkeyup, this);
            this.div_cust.ed_telNo2.addEventHandler("onkeyup", this.div_cust_ed_telNo2_onkeyup, this);
            this.div_cust.btn_postSearch1.addEventHandler("onclick", this.div_cust_btn_postSearch1_onclick, this);
            this.div_cust.btn_postSearch2.addEventHandler("onclick", this.div_cust_btn_postSearch2_onclick, this);
            this.div_cust.ed_mobNo.addEventHandler("onkeyup", this.div_cust_ed_mobNo_onkeyup, this);
            this.div_cust.ed_genderCd.addEventHandler("onkeyup", this.div_cust_ed_mobNo_onkeyup, this);
            this.div_cust.ed_genderCdNm.addEventHandler("onkeyup", this.div_cust_ed_mobNo_onkeyup, this);
            this.bt_save.addEventHandler("onclick", this.bt_save_onclick, this);

        };

        this.loadIncludeScript("RTCSAdvicetStatus_tab_info1_custInfo.xfdl");

       
    };
}
)();
