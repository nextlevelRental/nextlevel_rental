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
                this.set_name("RTSDCustRegister");
                this.set_classname("RTCMCustRegister");
                this.set_scrollbars("autoboth");
                this.set_titletext("고객등록");
                this.set_name("RTSDCustRegister");
                this._setFormPosition(0,0,1147,560);
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
            obj._setContents("<ColumnInfo><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custTp\" type=\"STRING\" size=\"256\"/><Column id=\"custTp2\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"birthDay\" type=\"STRING\" size=\"256\"/><Column id=\"genderCd\" type=\"STRING\" size=\"256\"/><Column id=\"lfCd\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"mobFirm\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"faxNo\" type=\"STRING\" size=\"256\"/><Column id=\"bldMngNo\" type=\"STRING\" size=\"256\"/><Column id=\"posCd\" type=\"STRING\" size=\"256\"/><Column id=\"addr1\" type=\"STRING\" size=\"256\"/><Column id=\"addr2\" type=\"STRING\" size=\"256\"/><Column id=\"telNo2\" type=\"STRING\" size=\"256\"/><Column id=\"bldMngNo2\" type=\"STRING\" size=\"256\"/><Column id=\"posCd2\" type=\"STRING\" size=\"256\"/><Column id=\"addr12\" type=\"STRING\" size=\"256\"/><Column id=\"addr22\" type=\"STRING\" size=\"256\"/><Column id=\"safekey\" type=\"STRING\" size=\"256\"/><Column id=\"buslNo\" type=\"STRING\" size=\"256\"/><Column id=\"corpNo\" type=\"STRING\" size=\"256\"/><Column id=\"repNm\" type=\"STRING\" size=\"256\"/><Column id=\"oCustnm\" type=\"STRING\" size=\"256\"/><Column id=\"oBirthday\" type=\"STRING\" size=\"256\"/><Column id=\"oGendercd\" type=\"STRING\" size=\"256\"/><Column id=\"oLfcd\" type=\"STRING\" size=\"256\"/><Column id=\"oMobno\" type=\"STRING\" size=\"256\"/><Column id=\"oSafekey\" type=\"STRING\" size=\"256\"/><Column id=\"cCustnm\" type=\"STRING\" size=\"256\"/><Column id=\"cTelno\" type=\"STRING\" size=\"256\"/><Column id=\"emailAddr\" type=\"STRING\" size=\"256\"/><Column id=\"emailAddr1\" type=\"STRING\" size=\"256\"/><Column id=\"emailAddr2\" type=\"STRING\" size=\"256\"/><Column id=\"busiType\" type=\"STRING\" size=\"256\"/><Column id=\"busiCond\" type=\"STRING\" size=\"256\"/><Column id=\"taxYn\" type=\"STRING\" size=\"256\"/><Column id=\"kunnr\" type=\"STRING\" size=\"256\"/><Column id=\"ciCd\" type=\"STRING\" size=\"256\"/><Column id=\"diCd\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
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

            obj = new Dataset("ds_certification", this);
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

            obj = new Dataset("ds_certification2", this);
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

            obj = new Dataset("ds_mobFirm", this);
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

            obj = new Dataset("ds_emailAddr2", this);
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

            obj = new Dataset("ds_custTp2", this);
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

            obj = new Dataset("ds_safekeyResult", this);
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

            obj = new Dataset("ds_rtsd0110", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"seq\" type=\"STRING\" size=\"256\"/><Column id=\"certDay\" type=\"STRING\" size=\"256\"/><Column id=\"safekey\" type=\"STRING\" size=\"256\"/><Column id=\"certCd\" type=\"STRING\" size=\"256\"/><Column id=\"certYn\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"mobFirm\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_rtsd0111", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"agDay\" type=\"STRING\" size=\"256\"/><Column id=\"seq\" type=\"STRING\" size=\"256\"/><Column id=\"safekey\" type=\"STRING\" size=\"256\"/><Column id=\"nagYn\" type=\"STRING\" size=\"256\"/><Column id=\"cagYn\" type=\"STRING\" size=\"256\"/><Column id=\"cagYn1\" type=\"STRING\" size=\"256\"/><Column id=\"cagYn2\" type=\"STRING\" size=\"256\"/><Column id=\"cagYn3\" type=\"STRING\" size=\"256\"/><Column id=\"cagYn4\" type=\"STRING\" size=\"256\"/><Column id=\"cthYn1\" type=\"STRING\" size=\"256\"/><Column id=\"cthYn2\" type=\"STRING\" size=\"256\"/><Column id=\"cthYn3\" type=\"STRING\" size=\"256\"/><Column id=\"filePath\" type=\"STRING\" size=\"256\"/><Column id=\"fileName\" type=\"STRING\" size=\"256\"/><Column id=\"inputDt\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_nagYn", this);
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

            obj = new Dataset("ds_online", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"loginId\" type=\"STRING\" size=\"256\"/><Column id=\"custName\" type=\"STRING\" size=\"256\"/><Column id=\"legrBrthYmd\" type=\"STRING\" size=\"256\"/><Column id=\"gendCd\" type=\"STRING\" size=\"256\"/><Column id=\"frgnCd\" type=\"STRING\" size=\"256\"/><Column id=\"ciVal\" type=\"STRING\" size=\"256\"/><Column id=\"diVal\" type=\"STRING\" size=\"256\"/><Column id=\"vnVal\" type=\"STRING\" size=\"256\"/><Column id=\"safekey\" type=\"STRING\" size=\"256\"/><Column id=\"addrDivCd\" type=\"STRING\" size=\"256\"/><Column id=\"posNo\" type=\"STRING\" size=\"256\"/><Column id=\"addr\" type=\"STRING\" size=\"256\"/><Column id=\"dtlAddr\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"email\" type=\"STRING\" size=\"256\"/><Column id=\"emailRecvYn\" type=\"STRING\" size=\"256\"/><Column id=\"carOwnYn\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_onlineUpdate", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"diVal\" type=\"STRING\" size=\"256\"/><Column id=\"posNo\" type=\"STRING\" size=\"256\"/><Column id=\"addr\" type=\"STRING\" size=\"256\"/><Column id=\"dtlAddr\" type=\"STRING\" size=\"256\"/><Column id=\"bldMngNo\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"email\" type=\"STRING\" size=\"256\"/><Column id=\"onlineId\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_controlAuth", this);
            obj._setContents("<ColumnInfo><Column id=\"mdlCd\" type=\"STRING\" size=\"256\"/><Column id=\"prgmCd\" type=\"STRING\" size=\"256\"/><Column id=\"controlId\" type=\"STRING\" size=\"256\"/><Column id=\"userGrp\" type=\"STRING\" size=\"256\"/><Column id=\"userId\" type=\"STRING\" size=\"256\"/><Column id=\"typeCd\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
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
            obj = new Static("Static02", "absolute", "0", "90", null, "31", "0", null, this.div_cust);
            obj.set_taborder("61");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_cust.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "0", "120", null, "31", "0", null, this.div_cust);
            obj.set_taborder("62");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_cust.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "0", "150", null, "31", "0", null, this.div_cust);
            obj.set_taborder("63");
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
            this.div_cust.addChild(obj.name, obj);
            obj = new Combo("cb_mobFirm", "absolute", "392", "65", "58", "21", null, null, this.div_cust);
            this.div_cust.addChild(obj.name, obj);
            obj.set_taborder("12");
            obj.set_displaynulltext("선택");
            obj.set_innerdataset("@ds_mobFirm");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj.set_index("-1");
            obj = new Static("st_custNm", "absolute", "0", "30", "120", "31", null, null, this.div_cust);
            obj.set_taborder("33");
            obj.set_text("고객명");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_cust.addChild(obj.name, obj);
            obj = new Static("st_mobNo", "absolute", "0", "60", "120", "31", null, null, this.div_cust);
            obj.set_taborder("34");
            obj.set_text("휴대폰");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_cust.addChild(obj.name, obj);
            obj = new Static("st_posCd", "absolute", "0", "90", "120", "31", null, null, this.div_cust);
            obj.set_taborder("35");
            obj.set_text("고객주소");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_cust.addChild(obj.name, obj);
            obj = new Edit("ed_posCd", "absolute", "124", "95", "140", "21", null, null, this.div_cust);
            obj.set_taborder("27");
            obj.set_maxlength("6");
            obj.set_inputtype("number");
            obj.set_enable("false");
            this.div_cust.addChild(obj.name, obj);
            obj = new Static("st_posCd2", "absolute", "0", "120", "120", "31", null, null, this.div_cust);
            obj.set_taborder("36");
            obj.set_text("근무지주소");
            obj.getSetter("domainId").set("nexa.s_condition");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_cust.addChild(obj.name, obj);
            obj = new Edit("ed_posCd2", "absolute", "124", "125", "140", "21", null, null, this.div_cust);
            obj.set_taborder("29");
            obj.set_maxlength("6");
            obj.set_inputtype("number");
            obj.set_enable("false");
            this.div_cust.addChild(obj.name, obj);
            obj = new Static("st_birthDay", "absolute", "268", "30", "120", "31", null, null, this.div_cust);
            obj.set_taborder("37");
            obj.set_text("법정생년월일");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_cust.addChild(obj.name, obj);
            obj = new Static("st_mobFirm", "absolute", "268", "60", "120", "31", null, null, this.div_cust);
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
            obj = new Combo("cb_genderCd", "absolute", "647", "35", "102", "21", null, null, this.div_cust);
            this.div_cust.addChild(obj.name, obj);
            obj.set_taborder("7");
            obj.set_displaynulltext("선택");
            obj.set_innerdataset("@ds_genderCd");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj.set_index("-1");
            obj = new Combo("cb_lfCd", "absolute", "859", "35", "107", "21", null, null, this.div_cust);
            this.div_cust.addChild(obj.name, obj);
            obj.set_taborder("9");
            obj.set_displaynulltext("선택");
            obj.set_innerdataset("@ds_lfCd");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj.set_index("-1");
            obj = new Static("st_lfCd", "absolute", "755", "30", "100", "31", null, null, this.div_cust);
            obj.set_taborder("40");
            obj.set_text("내/외국인");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_cust.addChild(obj.name, obj);
            obj = new Static("st_custNo", "absolute", "543", "0", "100", "31", null, null, this.div_cust);
            obj.set_taborder("41");
            obj.set_text("고객번호");
            obj.getSetter("domainId").set("nexa.s_condition");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_cust.addChild(obj.name, obj);
            obj = new Edit("ed_custNo", "absolute", "648", "5", "103", "21", null, null, this.div_cust);
            obj.set_taborder("1");
            obj.set_enable("false");
            this.div_cust.addChild(obj.name, obj);
            obj = new Button("btn_custNoSearch", "absolute", "755", "5", "69", "21", null, null, this.div_cust);
            obj.set_taborder("2");
            obj.set_text("고객조회");
            obj.getSetter("domainId").set("nexa.save");
            this.div_cust.addChild(obj.name, obj);
            obj = new Button("btn_safeKeyConfirm", "absolute", "454", "65", "77", "21", null, null, this.div_cust);
            obj.set_taborder("13");
            obj.set_text("인증번호확인");
            obj.getSetter("domainId").set("nexa.save");
            this.div_cust.addChild(obj.name, obj);
            obj = new Static("st_mobFirmResult", "absolute", "543", "60", "100", "31", null, null, this.div_cust);
            obj.set_taborder("42");
            obj.set_text("확인결과");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            obj.set_visible("false");
            this.div_cust.addChild(obj.name, obj);
            obj = new Edit("ed_emailAddr1", "absolute", "859", "65", "90", "21", null, null, this.div_cust);
            obj.set_taborder("16");
            obj.set_maxlength("35");
            obj.set_imemode("none");
            this.div_cust.addChild(obj.name, obj);
            obj = new Static("st_emailAddr", "absolute", "755", "60", "100", "31", null, null, this.div_cust);
            obj.set_taborder("43");
            obj.set_text("e-mail주소");
            obj.getSetter("domainId").set("nexa.s_condition");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_cust.addChild(obj.name, obj);
            obj = new Combo("cb_emailAddr2", "absolute", "965", "65", "136", "21", null, null, this.div_cust);
            this.div_cust.addChild(obj.name, obj);
            obj.set_taborder("17");
            obj.set_displaynulltext("선택");
            obj.set_innerdataset("@ds_emailAddr2");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj.set_index("-1");
            obj = new Static("st_cdGrpCd11", "absolute", "952", "65", "25", "20", null, null, this.div_cust);
            obj.set_taborder("44");
            obj.set_text("@");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_cust.addChild(obj.name, obj);
            obj = new Static("st_addr1", "absolute", "268", "90", "120", "31", null, null, this.div_cust);
            obj.set_taborder("45");
            obj.set_text("주소");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_cust.addChild(obj.name, obj);
            obj = new Edit("ed_addr1", "absolute", "392", "95", "210", "21", null, null, this.div_cust);
            obj.set_taborder("28");
            obj.set_maxlength("100");
            obj.set_enable("false");
            this.div_cust.addChild(obj.name, obj);
            obj = new Static("st_addr2", "absolute", "268", "120", "120", "31", null, null, this.div_cust);
            obj.set_taborder("46");
            obj.set_text("주소");
            obj.getSetter("domainId").set("nexa.s_condition");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_cust.addChild(obj.name, obj);
            obj = new Edit("ed_addr12", "absolute", "392", "125", "210", "21", null, null, this.div_cust);
            obj.set_taborder("30");
            obj.set_maxlength("100");
            obj.set_enable("false");
            this.div_cust.addChild(obj.name, obj);
            obj = new Edit("ed_addr22", "absolute", "606", "125", "245", "21", null, null, this.div_cust);
            obj.set_taborder("24");
            obj.set_maxlength("160");
            obj.set_enable("false");
            this.div_cust.addChild(obj.name, obj);
            obj = new Edit("ed_addr2", "absolute", "606", "95", "245", "21", null, null, this.div_cust);
            obj.set_taborder("21");
            obj.set_maxlength("160");
            obj.set_enable("false");
            this.div_cust.addChild(obj.name, obj);
            obj = new Static("st_telNo", "absolute", "854", "90", "100", "31", null, null, this.div_cust);
            obj.set_taborder("47");
            obj.set_text("전화번호");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_cust.addChild(obj.name, obj);
            obj = new Static("st_telNo2", "absolute", "854", "120", "100", "31", null, null, this.div_cust);
            obj.set_taborder("48");
            obj.set_text("전화번호");
            obj.getSetter("domainId").set("nexa.s_condition");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_cust.addChild(obj.name, obj);
            obj = new Static("st_safekey", "absolute", "0", "150", "120", "31", null, null, this.div_cust);
            obj.set_taborder("49");
            obj.set_text("본인인증");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_cust.addChild(obj.name, obj);
            obj = new Button("btn_certification", "absolute", "276", "155", "41", "21", null, null, this.div_cust);
            obj.set_taborder("26");
            obj.set_text("인증");
            obj.getSetter("domainId").set("nexa.save");
            obj.set_visible("false");
            this.div_cust.addChild(obj.name, obj);
            obj = new Radio("ra_custTp", "absolute", "130", "8", "140", "20", null, null, this.div_cust);
            this.div_cust.addChild(obj.name, obj);
            obj.set_taborder("0");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_direction("vertical");
            obj.set_rowcount("0");
            obj.set_columncount("0");
            obj.set_innerdataset("@ds_custTp");
            obj.set_index("-1");
            obj = new MaskEdit("ed_birthDay", "absolute", "392", "35", "140", "20", null, null, this.div_cust);
            obj.set_taborder("4");
            obj.set_type("string");
            obj.set_mask("####-##-##");
            this.div_cust.addChild(obj.name, obj);
            obj = new Edit("ed_emailAddr2", "absolute", "963", "65", "92", "21", null, null, this.div_cust);
            obj.set_taborder("18");
            obj.set_maxlength("35");
            obj.set_visible("false");
            this.div_cust.addChild(obj.name, obj);
            obj = new Button("btn_emailAddr2", "absolute", "1059", "65", "41", "21", null, null, this.div_cust);
            obj.set_taborder("19");
            obj.set_text("선택");
            obj.getSetter("domainId").set("nexa.save");
            obj.set_visible("false");
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
            this.div_cust.addChild(obj.name, obj);
            obj = new Static("st_custTp2", "absolute", "543", "30", "100", "31", null, null, this.div_cust);
            obj.set_taborder("53");
            obj.set_text("고객분류");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            obj.set_visible("false");
            this.div_cust.addChild(obj.name, obj);
            obj = new Static("st_busiCond", "absolute", "913", "30", "70", "31", null, null, this.div_cust);
            obj.set_taborder("54");
            obj.set_text("업태");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            obj.set_visible("false");
            this.div_cust.addChild(obj.name, obj);
            obj = new Static("st_repNm", "absolute", "543", "60", "100", "31", null, null, this.div_cust);
            obj.set_taborder("55");
            obj.set_text("대표자명");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            obj.set_visible("false");
            this.div_cust.addChild(obj.name, obj);
            obj = new Static("st_busiType", "absolute", "755", "30", "70", "31", null, null, this.div_cust);
            obj.set_taborder("56");
            obj.set_text("업종");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            obj.set_visible("false");
            this.div_cust.addChild(obj.name, obj);
            obj = new Edit("ed_busiType", "absolute", "829", "35", "80", "21", null, null, this.div_cust);
            obj.set_taborder("8");
            obj.set_maxlength("80");
            obj.set_visible("false");
            this.div_cust.addChild(obj.name, obj);
            obj = new Edit("ed_busiCond", "absolute", "987", "35", "114", "21", null, null, this.div_cust);
            obj.set_taborder("10");
            obj.set_maxlength("80");
            obj.set_visible("false");
            this.div_cust.addChild(obj.name, obj);
            obj = new Combo("cb_safekeyResult", "absolute", "647", "65", "103", "21", null, null, this.div_cust);
            this.div_cust.addChild(obj.name, obj);
            obj.set_taborder("15");
            obj.set_displaynulltext("선택");
            obj.set_innerdataset("@ds_safekeyResult");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj.set_enable("false");
            obj.set_visible("false");
            obj = new CheckBox("ch_birthDayAndBuslNoCh", "absolute", "866", "181", "190", "20", null, null, this.div_cust);
            obj.set_taborder("57");
            obj.set_text("법정생년월일&사업자번호체크");
            obj.set_visible("false");
            obj.set_enable("false");
            obj.set_value("true");
            obj.set_readonly("false");
            this.div_cust.addChild(obj.name, obj);
            obj = new Edit("ed_telNo", "absolute", "960", "95", "139", "21", null, null, this.div_cust);
            obj.set_taborder("22");
            obj.set_maxlength("80");
            obj.set_inputtype("number");
            this.div_cust.addChild(obj.name, obj);
            obj = new Edit("ed_telNo2", "absolute", "960", "125", "139", "21", null, null, this.div_cust);
            obj.set_taborder("25");
            obj.set_maxlength("80");
            obj.set_inputtype("number");
            this.div_cust.addChild(obj.name, obj);
            obj = new Button("btn_postSearch1", "absolute", "244", "94", "20", "21", null, null, this.div_cust);
            obj.set_taborder("20");
            obj.getSetter("domainId").set("nexa.save");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_cust.addChild(obj.name, obj);
            obj = new Button("btn_postSearch2", "absolute", "244", "124", "20", "21", null, null, this.div_cust);
            obj.set_taborder("23");
            obj.getSetter("domainId").set("nexa.save");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_cust.addChild(obj.name, obj);
            obj = new Combo("cb_custTp2", "absolute", "647", "35", "103", "21", null, null, this.div_cust);
            this.div_cust.addChild(obj.name, obj);
            obj.set_taborder("6");
            obj.set_innerdataset("@ds_custTp2");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_enable("false");
            obj.set_visible("false");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new Static("st_nagYn", "absolute", "854", "150", "100", "31", null, null, this.div_cust);
            obj.set_taborder("64");
            obj.set_text("정보제공동의");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_cust.addChild(obj.name, obj);
            obj = new WebBrowser("nice_interface", "absolute", "319", "156", "124", "24", null, null, this.div_cust);
            obj.set_taborder("65");
            obj.set_visible("false");
            obj.set_url("https://portal.tirerental.co.kr/interface/di_safekey/main.jsp");
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
            obj = new Edit("ed_repNm", "absolute", "647", "65", "103", "21", null, null, this.div_cust);
            obj.set_taborder("14");
            obj.set_maxlength("80");
            obj.set_visible("false");
            this.div_cust.addChild(obj.name, obj);
            obj = new WebBrowser("safekey_interface", "absolute", "395", "3", "133", "26", null, null, this.div_cust);
            obj.set_taborder("68");
            obj.set_visible("false");
            obj.set_url("https://portal.tirerental.co.kr/interface/web_safekey/checkplus_body.jsp");
            this.div_cust.addChild(obj.name, obj);
            obj = new Combo("cb_nagYn", "absolute", "960", "155", "90", "21", null, null, this.div_cust);
            this.div_cust.addChild(obj.name, obj);
            obj.set_taborder("69");
            obj.set_displaynulltext("선택");
            obj.set_innerdataset("@ds_nagYn");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_enable("false");
            obj.set_visible("false");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new CheckBox("ch_safekeyFlag", "absolute", "526", "181", "65", "21", null, null, this.div_cust);
            obj.set_taborder("70");
            obj.set_value("false");
            obj.set_enable("false");
            obj.set_visible("false");
            obj.set_text("safekey");
            obj.set_readonly("false");
            this.div_cust.addChild(obj.name, obj);
            obj = new Static("st_loginId", "absolute", "542", "150", "100", "31", null, null, this.div_cust);
            obj.set_taborder("71");
            obj.set_text("회원ID");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            obj.set_visible("false");
            this.div_cust.addChild(obj.name, obj);
            obj = new Edit("ed_loginId", "absolute", "646", "155", "140", "21", null, null, this.div_cust);
            obj.set_taborder("72");
            obj.set_maxlength("80");
            obj.set_visible("false");
            obj.set_enable("true");
            this.div_cust.addChild(obj.name, obj);
            obj = new Button("btn_idCheck", "absolute", "790", "155", "59", "21", null, null, this.div_cust);
            obj.set_taborder("73");
            obj.set_text("중복체크");
            obj.set_visible("false");
            obj.getSetter("domainId").set("nexa.save");
            obj.set_enable("true");
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
            obj = new Radio("ra_certification", "absolute", "130", "156", "140", "21", null, null, this.div_cust);
            this.div_cust.addChild(obj.name, obj);
            obj.set_taborder("76");
            obj.set_innerdataset("@ds_certification");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_direction("vertical");
            obj = new Edit("ed_mobNo", "absolute", "124", "65", "140", "21", null, null, this.div_cust);
            obj.set_taborder("11");
            obj.set_maxlength("80");
            this.div_cust.addChild(obj.name, obj);
            obj = new Static("st_cCustnm", "absolute", "0", "150", "120", "31", null, null, this.div_cust);
            obj.set_taborder("77");
            obj.set_text("담당자명");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            obj.set_visible("false");
            this.div_cust.addChild(obj.name, obj);
            obj = new Edit("ed_Ccustnm", "absolute", "124", "155", "140", "21", null, null, this.div_cust);
            obj.set_taborder("78");
            obj.set_maxlength("80");
            obj.set_visible("false");
            this.div_cust.addChild(obj.name, obj);
            obj = new Static("st_cTelno", "absolute", "268", "150", "120", "31", null, null, this.div_cust);
            obj.set_taborder("79");
            obj.set_text("담당자 전화번호");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            obj.set_visible("false");
            this.div_cust.addChild(obj.name, obj);
            obj = new Edit("ed_cTelno", "absolute", "392", "155", "140", "21", null, null, this.div_cust);
            obj.set_taborder("80");
            obj.set_maxlength("80");
            obj.set_visible("false");
            this.div_cust.addChild(obj.name, obj);
            obj = new Button("checkPrvHistory", "absolute", "92.07%", "5", "69", "21", null, null, this.div_cust);
            obj.set_taborder("81");
            obj.set_text("이력조회");
            this.div_cust.addChild(obj.name, obj);

            obj = new Tab("Tab00", "absolute", "0", "199", "1122", "357", null, null, this);
            obj.set_taborder("3");
            obj.set_tabindex("0");
            obj.set_scrollbars("autoboth");
            obj.set_visible("true");
            obj.style.set_showextrabutton("false");
            this.addChild(obj.name, obj);
            obj = new Tabpage("tabpage1", this.Tab00);
            obj.set_text("계좌");
            obj.set_scrollbars("autoboth");
            obj.set_async("true");
            obj.set_url("sd::RTSDCustRegister_tab1.xfdl");
            this.Tab00.addChild(obj.name, obj);
            obj = new Tabpage("tabpage2", this.Tab00);
            obj.set_text("카드");
            obj.set_url("sd::RTSDCustRegister_tab2.xfdl");
            obj.set_enable("true");
            this.Tab00.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1122", "0", "25", "729", null, null, this);
            obj.set_taborder("6");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Button("Button00", "absolute", "12.73%", "206", null, "19", "81.78%", null, this);
            obj.set_taborder("7");
            obj.set_text("Button00");
            obj.set_visible("false");
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
            obj = new Layout("default", "", 1147, 560, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCMCustRegister");
            		p.set_scrollbars("autoboth");
            		p.set_titletext("고객등록");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("bind_custTp","div_cust.ra_custTp","value","ds_cust","custTp");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("bind_custNo","div_cust.ed_custNo","value","ds_cust","custNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("bind_custNm","div_cust.ed_custNm","value","ds_cust","custNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("bind_genderCd","div_cust.cb_genderCd","value","ds_cust","genderCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("bind_lfCd","div_cust.cb_lfCd","value","ds_cust","lfCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("bind_mobFirm","div_cust.cb_mobFirm","value","ds_cust","mobFirm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("bind_emailAddr1","div_cust.ed_emailAddr1","value","ds_cust","emailAddr1");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("bind_emailAddr2","div_cust.cb_emailAddr2","value","ds_cust","emailAddr2");
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
            obj = new BindItem("bind_safekey","div_cust.ed_safekey","value","ds_cust","safekey");
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
            obj = new BindItem("bind_busiType","div_cust.ed_busiType","value","ds_cust","busiType");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item1","div_cust.ed_busiCond","value","ds_cust","busiCond");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("bind_buslNo","div_cust.ed_buslNo","value","ds_cust","buslNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("bind_telNo","div_cust.ed_telNo","value","ds_cust","telNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("bind_telNo2","div_cust.ed_telNo2","value","ds_cust","telNo2");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("bind_custTp2","div_cust.cb_custTp2","value","ds_cust","custTp2");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("bind_repNm","div_cust.ed_repNm","value","ds_cust","repNm");
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
            obj = new BindItem("item4","div_cust.ed_Ccustnm","value","ds_cust","cCustnm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item5","div_cust.ed_cTelno","value","ds_cust","cTelno");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        
        this.loadPreloadList = function()
        {
            this._addPreloadList("fdl", "sd::RTSDCustRegister_tab1.xfdl");
            this._addPreloadList("fdl", "sd::RTSDCustRegister_tab2.xfdl");
        };
        
        // User Script
        this.addIncludeScript("RTSDCustRegister.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDCustRegister.xfdl", function() {
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
        /*온라인 회원가입*/
        this.checkCustId = "";
        this.countCustId = 0;
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        /*사용자 정보*/
        this.userId = application.gds_userInfo.getColumn(0,"userId");
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
        	
        	if( strSvcId == "saveCustRegister" ){
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
        	
        	if( strSvcId == "checkBuslNo" ){
        		if( this.resultBuslCnt != "0"){
        			alert("입력하신 " + this.div_cust.st_buslNo.text  + " \'"+ this.checkbuslNo + "\' 는 존재하고 있습니다.");
        			this.div_cust.ed_buslNo.set_value("");
        			return this.div_cust.ed_buslNo.setFocus(true);
        		}else{
        			var buslNo = nvl(this.div_cust.ed_buslNo.value);
        			var intBuslNo = parseInt(buslNo.substring(3,5));		//사업자번호 4,5번째 자리
        			if( buslNo.length != 10){
        				alert( this.div_cust.st_buslNo.text + " 를 확인하세요." );
        			}else{
        				if( (1 <= intBuslNo && intBuslNo <= 79) || (intBuslNo == 80) || (89 <= intBuslNo && intBuslNo <= 99) ){
        					this.div_cust.cb_custTp2.set_value("0002");		//고객분류 : 개인사업자
        					if( (89 <= intBuslNo && intBuslNo <= 99) || (intBuslNo == 80) ){
        						this.div_cust.ed_taxYn.set_value("N");		//개인사업자 면세여부
        					}else{
        						this.div_cust.ed_taxYn.set_value("Y");		//개인사업자 면세여부
        					}
        				}else if( (intBuslNo == 83) || (intBuslNo == 82)){
        					this.div_cust.ed_taxYn.set_value("N");			//개인사업자 면세여부
        					this.div_cust.cb_custTp2.set_value("0003");		//고객분류 : 관공서
        				}else if( (intBuslNo == 81) || (intBuslNo == 84) || (intBuslNo == 85) || (intBuslNo == 86) || (intBuslNo == 87) || (intBuslNo == 88) ){
        					this.div_cust.ed_taxYn.set_value("N");			//개인사업자 면세여부
        					this.div_cust.cb_custTp2.set_value("0004");		//고객분류 : 법인
        				}else{
        					this.div_cust.ed_taxYn.set_value("N");			//개인사업자 면세여부
        					this.div_cust.cb_custTp2.set_value("0005");		//고객분류 : 기타
        				}
        			}
        		}
        	}
        	
        	if( strSvcId == "listCustInfo" ){
        		var cnt = this.ds_cust.getRowCount();
        		if( cnt != 0 ){
        			this.FN_inputEmail();
        			this.oldMobNo = this.ds_cust.getColumn(0,"mobNo");
        			this.div_cust.ed_mobNo.set_value( FN_numberHyphenInReturn(this.ds_cust.getColumn(0,"mobNo")) );
        			this.div_cust.ed_telNo.set_value( FN_numberHyphenInReturn(this.ds_cust.getColumn(0,"telNo")) );
        			this.div_cust.ed_telNo2.set_value( FN_numberHyphenInReturn(this.ds_cust.getColumn(0,"telNo2")) );
        			this.div_cust.ed_cTelno.set_value( FN_numberHyphenInReturn(this.ds_cust.getColumn(0,"cTelno")) );
        			
        			this.FN_onlineEnterdupe();
        			
        			this.FN_custTpOnEnable();
        			this.FN_selectCertification();
        			this.FN_searchRtsd0111();
        			
        			this.Tab00.tabpage1.div_search.set_enable(true);
        			this.fn_getList();
        		}
        	}
        	
        	if( strSvcId == "selectRtsd0110" ){
        		var certCd = this.ds_rtsd0110.getColumn(0, "certCd");
        		if( certCd == "01" ){
        			this.div_cust.ra_certification.set_enable(false);
        		}else{
        			this.div_cust.ra_certification.set_enable(true);
        		}
        		this.div_cust.ra_certification.set_value( certCd );
        		this.div_cust_ra_certification_onitemchanged();
        	}
        	
        	if( strSvcId == "selectRtsd0111" ){
        		var cnt = this.ds_rtsd0111.getRowCount();
        		if( cnt != 0 ){
        			this.div_cust.cb_nagYn.set_value( this.ds_rtsd0111.getColumn(this.ds_rtsd0111.rowposition, "nagYn") );
        		}
        	}
        	
        	if( strSvcId == "saveBeforSafeKeyConfirm"){

        		if( nvl(this.selectSafekey) != "0" ){
        			this.div_cust.ed_safekey.set_value( this.selectSafekey );
        			var sSvcID        	= "saveBeforSafeKeySelect";                    
        			var sController   	= "rtms/sd/saveBeforSafeKeySelect.do";
        			var sInDatasets   	= "";
        			var sOutDatasets  	= "";
        			var sArgs 			= "";	
        			var fn_callBack		= "fn_callBack";
        			sArgs += Ex.util.setParam("safekey", this.selectSafekey);
        			Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 				
        		}else{
        			alert("인증번호 확인이 되지 않아 저장할 수 없습니다.");
        		}
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
        	
        	if( strSvcId == "onlineEnterdupe" ){
        		if( nvl(this.checkCustId) != "" ){
        			this.div_cust.ed_loginId.set_value(this.checkCustId);
        			this.div_cust.ed_loginId.set_enable(false);
        			this.div_cust.btn_idCheck.set_enable(false);
        			this.div_cust.ch_loginCheck1.set_value(false);
        		}else{
        			if( this.ds_cust.getRowType(this.ds_cust.rowposition) == 2 ){
        				this.div_cust.ed_loginId.set_enable(true);
        				this.div_cust.btn_idCheck.set_enable(true);
        				this.div_cust.ch_loginCheck1.set_value(true);
        			}else{
        				this.div_cust.ed_loginId.set_enable(false);
        				this.div_cust.btn_idCheck.set_enable(false);
        				this.div_cust.ch_loginCheck1.set_value(false);
        			}
        		}
        	}
        	
        	if( strSvcId == "onlineDupe" ){
        		if( this.countCustId == 0 ){
        			alert("사용할 수 있는 아이디입니다.");
        			this.div_cust.ch_loginCheck2.set_value(true);
        			this.div_cust.ed_loginId.set_enable(false);
        		}else{
        			alert("중복된 아이디입니다.");
        			this.div_cust.ed_loginId.set_value("");
        			this.div_cust.ed_loginId.setFocus(true);
        			this.div_cust.ch_loginCheck2.set_value(false);
        		}
        	}
        	
        	if(strSvcId == "beforeCheckEmpInfo") {
        		if(nErrorCode == "-1") {
        			alert(strErrorMsg);
        		} else {
        			alert("등록 가능합니다.");
        		}
        	}
        	
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.RTSDCustRegister_onload = function(obj,e){
        	Ex.core.init(obj);
        	this.fn_init();
        	this.listControlAuth("SD", "RTSDCustRegister");
        	this.fn_getToday();
        	if(this.parent.parent.components[0].id == "div_work"){
        		this.parent.parent.setButton("C|N", this);
        	}else{
        		this.parent.setButton("C|N", this);
        	}
        	this.selectChangeMenu("고객등록");
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_init = function(){
        	this.div_cust.st_nagYn.set_visible(false);
        	this.div_cust.cb_nagYn.set_visible(false);
        	
        	var nRow = this.ds_cust.addRow();
        	
        	var sSvcID      	= "initRTCMCustRegister";  
        	var sController   	= "rtms/sd/initRTCMCustRegister.do";
        	var sInDatasets   	= "";
        	var sOutDatasets	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        		 
        	sOutDatasets += " ds_custTp=mapDsCustTp";
        	sOutDatasets += " ds_certification=mapDsCertification";
        	sOutDatasets += " ds_genderCd=mapDsGenderCd";
        	sOutDatasets += " ds_lfCd=mapDsLfcd";
        	sOutDatasets += " ds_mobFirm=mapDsMobFirm";
        	sOutDatasets += " ds_emailAddr2=mapEmailAddr2";
        	sOutDatasets += " ds_custTp2=mapDsCustTp2";
        	sOutDatasets += " ds_safekeyResult=mapDsSafekeyResult";
        	sOutDatasets += " ds_nagYn=mapDsNagYn";
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
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
        this.fn_add = function(obj,e){
        	if( confirm( "추가 클릭시 기존 입력내용은 사라집니다." ) ){
        		this.reload();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_save = function(obj,e){
        	if(this.div_cust.ra_custTp.value == "01" && this.div_cust.ch_safekeyFlag.value == false && this.ds_cust.getRowType(0) != 4){
        		var custNm 	 = nvl(this.div_cust.ed_custNm.value);
        		var birthDay = nvl(this.div_cust.ed_birthDay.value);
        		var genderCd = nvl(this.div_cust.cb_genderCd.value);
        		var mobNo 	 = FN_numberHyphenOut(nvl(this.div_cust.ed_mobNo.value));
        		
        		var sSvcID        	= "saveBeforSafeKeyConfirm";                    
        		var sController   	= "rtms/sd/saveBeforSafeKeyConfirm.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        			
        		sArgs += Ex.util.setParam("custNm", custNm);
        		sArgs += Ex.util.setParam("birthDay", birthDay);
        		sArgs += Ex.util.setParam("genderCd", genderCd);
        		sArgs += Ex.util.setParam("mobNo", mobNo);
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        	}else{
        		this.fn_goSave();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_goSave = function(){
        	var nRow 	  = this.ds_cust.rowposition ;
        	var custTpVal = nvl(this.ds_cust.getColumn(nRow,"custTp"));
        	var regId = nvl(this.ds_cust.getColumn(nRow,"regId"));
        	var userGrp = application.gds_userInfo.getColumn(0, "userGrp");

        	if( custTpVal == "02" && regId == "ONL_SYS" && userGrp != "01"){
        		alert("고객유형이 사업자인 경우 온라인에서 등록한 정보는 수정할 수가 없습니다.");
        		return false;
        	}
        	
        	//01 : 영업관리자		//02 : 콜센터		//03 : 지사		//04 : 지점			//05 : 대리점
        	
        	if( custTpVal == "02" && regId != "ONL_SYS" && userGrp != "01"){
        		alert("고객유형이 사업자인 경우 영업관리자만 수정가능합니다.");
        		return false;
        	}
        	
        	/*
        	if( custTpVal == "02"){
        		alert("고객유형이 사업자인 경우에는 수정할 수가 없습니다.");
        		return false;
        	}
        	*/
        	
        	var emailAddr = ""
        	
        	if( this.div_cust.cb_emailAddr2.value == "01" ){
        		emailAddr = nvl( this.ds_cust.getColumn( nRow, "emailAddr1" ) ) +"@"+ nvl(this.div_cust.ed_emailAddr2.text);
        	}else{
        		emailAddr = nvl( this.ds_cust.getColumn( nRow, "emailAddr1" ) ) +"@"+ nvl(this.div_cust.cb_emailAddr2.text);
        	}
        	this.ds_cust.setColumn( nRow, "emailAddr", emailAddr);
        	
        	
        	//공통사항체크
        	var emailAddr1 		= nvl(this.ds_cust.getColumn(nRow,"emailAddr1"));	//e-mail주소
        	var emailAddr2 		= nvl(this.ds_cust.getColumn(nRow,"emailAddr2"));	//e-mail주소
        	var posCd 			= nvl(this.ds_cust.getColumn(nRow,"posCd"));		//우편번호
        	var addr1 			= nvl(this.ds_cust.getColumn(nRow,"addr1"));		//주소
        	var custTp2 		= nvl(this.ds_cust.getColumn(nRow,"custTp2"));		//고객분류
        	var bldMngNo 		= nvl(this.ds_cust.getColumn(nRow,"bldMngNo"));		//고객주소-우편번호PK(건물관리번호)	: hidden
        	var useYn 			= nvl(this.ds_cust.getColumn(nRow,"useYn"));		//사용여부								: hidden
        	var taxYn 			= nvl(this.ds_cust.getColumn(nRow,"taxYn"));		//개인사업자 면세여부					: hidden
        	var birthAndbusl    = nvl(this.div_cust.ch_birthDayAndBuslNoCh.value); 	//법정생년월일 & 사업자번호 체크
        	var meg 			= " 값이 없습니다.";
        	
        	if( emailAddr1 == "" ){
        		alert( nvl(this.div_cust.st_emailAddr.text) + meg);
        		this.div_cust.ed_emailAddr1.setFocus();
        		return false;
        	}else if( emailAddr2 == "" ){
        		alert( nvl(this.div_cust.st_emailAddr.text) + meg);
        		this.div_cust.cb_emailAddr2.setFocus();
        		return false;
        	}else if( this.div_cust.cb_emailAddr2.value == "01" && nvl(this.div_cust.ed_emailAddr2.value) == ""){
        		/*
        		var regExp =  /[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/;
        		if( regExp.test( nvl(this.div_cust.ed_emailAddr2.value)) ){
        			alert( nvl(this.div_cust.st_emailAddr.text) + meg);
        			this.div_cust.ed_emailAddr2.set_value("");
        			this.div_cust.ed_emailAddr2.setFocus(true);
        			return false;
        		}
        		*/
        		alert( nvl(this.div_cust.st_emailAddr.text) + meg);
        		this.div_cust.ed_emailAddr2.set_value("");
        		this.div_cust.ed_emailAddr2.setFocus(true);
        		return false;
        	}else if( posCd == "" ){
        		alert( nvl(this.div_cust.st_posCd.text) + meg);
        		this.div_cust.ed_posCd.setFocus();
        		return false;
        	}else if( addr1 == "" ){
        		alert( nvl(this.div_cust.st_addr1.text) + meg);
        		this.div_cust.ed_addr1.setFocus();
        		return false;
        	}else if( custTp2 == "" ){
        		alert( nvl(this.div_cust.st_custTp2.text) + meg);
        		return false;
        	}else if( bldMngNo == "" ){
        		alert( "고객주소-우편번호PK(건물관리번호)" + meg);
        		return false;
        	}else if( useYn == "" ){
        		alert( "사용여부" + meg);
        		return false;
        	}else if( taxYn == "" ){
        		alert( "개인사업자 면세여부" + meg);
        		return false;
        	}else if( birthAndbusl == false ){
        		if( custTp2 == "01" ){
        			alert( this.div_cust.st_birthDay.text + " 을 확인하세요." );
        			return false;
        		}else if( custTp2 == "02" ){
        			alert( this.div_cust.st_buslNo.text + " 를 확인하세요." );
        			return false;
        		}
        	}else if( custTpVal == "01"){
        		//저장전 고객유형:개인 체크
        		var custNm 		= nvl(this.ds_cust.getColumn(nRow,"custNm"));		//고객명
        		var birthDay 	= nvl(this.ds_cust.getColumn(nRow,"birthDay"));		//법정생년월일
        		var genderCd 	= nvl(this.ds_cust.getColumn(nRow,"genderCd"));		//성별
        		var lfCd 		= nvl(this.ds_cust.getColumn(nRow,"lfCd"));			//내/외국인
        		var safekey 	= nvl(this.ds_cust.getColumn(nRow,"safekey"));		//safekey
        		var diCd		= nvl(this.ds_cust.getColumn(nRow,"diCd"));			//di
        		var ciCd		= nvl(this.ds_cust.getColumn(nRow,"ciCd"));			//ci
        		var mobNo 		= nvl(this.ds_cust.getColumn(nRow,"mobNo"));		//휴대폰
        		var mobFirm 	= nvl(this.ds_cust.getColumn(nRow,"mobFirm"));		//통신사
        		var telNo 		= nvl(this.ds_cust.getColumn(nRow,"telNo"));		//전화번호
        		var telNo2 		= nvl(this.ds_cust.getColumn(nRow,"telNo2"));		//전화번호
        	
        		var certification = nvl(this.div_cust.ra_certification.value);
        		
        		var mobNoSubStr = mobNo.substr(0,3);
        		
        		if( mobNo == "" ){
        			alert( nvl(this.div_cust.st_mobNo.text) + meg);
        			this.div_cust.ed_mobNo.setFocus();
        			return false;
        		}else if( mobNoSubStr != "010" && mobNoSubStr != "011" && mobNoSubStr != "016" && mobNoSubStr != "017" && mobNoSubStr != "018" && mobNoSubStr != "019"){
        			alert("휴대폰번호를 확인하세요.");
        			return false;
        		}else if((this.ds_cust.getRowType(nRow) == "4") && (this.oldMobNo != FN_numberHyphenOut(this.ds_cust.getColumn(nRow,"mobNo"))) && (this.certificationFlag == false) ){
        			if(userGrp != "01"){
        				alert("본인인증을 하세요.");
        				return false;
        			}
        		//}else if( this.cerChangeFlag == false ){
        		//	alert("본인인증을 하세요2.");
        		//	return false;
        		}else if( mobFirm == "" ){
        			alert( nvl(this.div_cust.st_mobFirm.text) + meg);
        			this.div_cust.cb_mobFirm.setFocus();
        			return false;
        		}else if( telNo == "" ){
        			alert( nvl(this.div_cust.st_telNo.text) + meg);
        			this.div_cust.ed_telNo.setFocus();
        			return false;
        		}else if( !FN_telNoCheck(telNo) ){
        			alert( "전화번호를 확인하세요." );
        			this.div_cust.ed_telNo.setFocus();
        			return false;
        		}else if( !FN_telNoCheck(telNo2) && telNo2 != "" ){
        			alert( "전화번호를 확인하세요." );
        			this.div_cust.ed_telNo2.setFocus();
        			return false;
        		}else if( custNm == "" ){
        			alert( nvl(this.div_cust.st_custNm.text) + meg);
        			this.div_cust.ed_custNm.setFocus();
        			return false;
        		}else if( birthDay == "" ){
        			alert( nvl(this.div_cust.st_birthDay.text) + meg);
        			this.div_cust.ed_birthDay.setFocus();
        			return false;
        		}else if( genderCd == "" ){
        			alert( nvl(this.div_cust.st_genderCd.text) + meg);
        			this.div_cust.cb_genderCd.setFocus();
        			return false;
        		}else if( lfCd == "" ){
        			alert( nvl(this.div_cust.st_lfCd.text) + meg);
        			this.div_cust.cb_lfCd.setFocus();
        			return false;
        		}else if( safekey == "" || safekey == "0"){
        			alert("인증번호확인 값이 없습니다.");
        			this.div_cust.btn_safeKeyConfirm.setFocus(true);
        			return false;
        		}else if( certification == "01" ){
        			if(this.userId != "10164030" && this.userId != "10083012" && this.userId != "kstka"){
        				if( diCd == "" || ciCd == "" ){
        					alert("본인인증 값이 없습니다.");
        					this.div_cust.btn_certification.setFocus(true);
        					return false;
        				}
        			}
        		}else{
        		
        		}
        	}else if( custTpVal == "02" ){
        		//저장전 고객유형:사업자 체크
        		var buslNo 		= nvl(this.ds_cust.getColumn(nRow,"buslNo"));		//사업자번호
        		var busiType 	= nvl(this.ds_cust.getColumn(nRow,"busiType"));		//업종
        		var busiCond 	= nvl(this.ds_cust.getColumn(nRow,"busiCond"));		//업태
        		var repNm 		= nvl(this.ds_cust.getColumn(nRow,"repNm"));		//대표자명
        		var cCustnm 	= nvl(this.ds_cust.getColumn(nRow,"cCustnm"));		//담당자 명                        
        		var cTelno 		= nvl(this.ds_cust.getColumn(nRow,"cTelno"));		//담당자 전화번호     
        		
        		if( buslNo == "" ){
        			alert( nvl(this.div_cust.st_buslNo.text) + meg);
        			this.div_cust.ed_buslNo.setFocus();
        			return false;
        		}else if( busiType == "" ){
        			alert( nvl(this.div_cust.st_busiType.text) + meg);
        			this.div_cust.ed_busiType.setFocus();
        			return false;
        		}else if( busiCond == "" ){
        			alert( nvl(this.div_cust.st_busiCond.text) + meg);
        			this.div_cust.ed_busiCond.setFocus();
        			return false;
        		}else if( repNm == "" ){
        			alert( nvl(this.div_cust.st_repNm.text) + meg);
        			this.div_cust.ed_repNm.setFocus();
        			return false;
        		}else if( cCustnm == "" ){
        			alert( nvl(this.div_cust.st_cCustnm.text) + meg);
        			this.div_cust.ed_Ccustnm.setFocus();
        			return false;
        		}else if( cTelno == "" ){
        			alert( nvl(this.div_cust.st_cTelno.text) + meg);
        			this.div_cust.ed_cTelno.setFocus();
        			return false;
        		}
        	}

        	this.ds_rtsd0110.clearData();
        	this.ds_online.clearData();
        	this.ds_onlineUpdate.clearData();
        	
        	if( this.ds_cust.getRowType(nRow) == "2"  ){
        		if( custTpVal == "01" ){
        			var nRowRtsd0110 = this.ds_rtsd0110.addRow();
        			this.ds_rtsd0110.setColumn(nRowRtsd0110, 	"safekey",	nvl(this.ds_cust.getColumn(nRow,"safekey")) );
        			this.ds_rtsd0110.setColumn(nRowRtsd0110, 	"certCd",	nvl(this.div_cust.ra_certification.value) );
        			this.ds_rtsd0110.setColumn(nRowRtsd0110, 	"certYn",	this.div_cust.ch_safekeyFlag.value == true ? "Y" : "N");
        			this.ds_rtsd0110.setColumn(nRowRtsd0110, 	"mobNo",	FN_numberHyphenOut( nvl(this.ds_cust.getColumn(nRow,"mobNo")) ) );
        			this.ds_rtsd0110.setColumn(nRowRtsd0110, 	"mobFirm",	nvl(this.ds_cust.getColumn(nRow,"mobFirm")) );
        			
        			if(  nvl(this.div_cust.ed_loginId.value) != "" && this.div_cust.ch_loginCheck1.value == true && this.div_cust.ch_loginCheck2.value == true ){
        				var frgnCd = nvl(this.ds_cust.getColumn(0, "lfCd"));
        				if( frgnCd == "2" ){
        					frgnCd = 0;
        				}
        				var nRowOnline = this.ds_online.addRow();
        				this.ds_online.setColumn(nRowOnline,"loginId"     , nvl(this.div_cust.ed_loginId.value) );
        				this.ds_online.setColumn(nRowOnline,"custName"    , nvl(this.ds_cust.getColumn(0, "custNm")) );
        				this.ds_online.setColumn(nRowOnline,"legrBrthYmd" , nvl(this.ds_cust.getColumn(0, "birthDay")) );
        				this.ds_online.setColumn(nRowOnline,"gendCd"      , nvl(this.ds_cust.getColumn(0, "genderCd")) );
        				this.ds_online.setColumn(nRowOnline,"frgnCd"      , frgnCd );
        				this.ds_online.setColumn(nRowOnline,"ciVal"       , nvl(this.ds_cust.getColumn(0, "ciCd")) );
        				this.ds_online.setColumn(nRowOnline,"diVal"       , nvl(this.ds_cust.getColumn(0, "diCd")) );
        				this.ds_online.setColumn(nRowOnline,"vnVal"       , "");
        				this.ds_online.setColumn(nRowOnline,"safekey"     , nvl(this.ds_cust.getColumn(0, "safekey")) );
        				this.ds_online.setColumn(nRowOnline,"addrDivCd"   , "1" );
        				this.ds_online.setColumn(nRowOnline,"posNo"       , nvl(this.ds_cust.getColumn(0, "posCd")) );
        				this.ds_online.setColumn(nRowOnline,"addr"        , nvl(this.ds_cust.getColumn(0, "addr1")) );
        				this.ds_online.setColumn(nRowOnline,"dtlAddr"     , nvl(this.ds_cust.getColumn(0, "addr2")) );
        				this.ds_online.setColumn(nRowOnline,"mobNo"       , nvl(this.ds_cust.getColumn(0, "mobNo" )) );
        				this.ds_online.setColumn(nRowOnline,"telNo"       , nvl(this.ds_cust.getColumn(0, "telNo")) );
        				this.ds_online.setColumn(nRowOnline,"email"       , nvl(this.ds_cust.getColumn(0, "emailAddr")) );
        				this.ds_online.setColumn(nRowOnline,"emailRecvYn" , "N" );
        				this.ds_online.setColumn(nRowOnline,"carOwnYn"    , "N" );
        			}
        		}
        	}
        	
        // 	if( (this.ds_cust.getRowType(nRow) == "4") ){ //(this.oldMobNo != FN_numberHyphenOut(this.ds_cust.getColumn(0,"mobNo")))
        // 		var nRowRtsd0110 = this.ds_rtsd0110.addRow();
        // 		this.ds_rtsd0110.setColumn(nRowRtsd0110, 	"safekey",	nvl(this.ds_cust.getColumn(nRow,"safekey")) );
        // 		this.ds_rtsd0110.setColumn(nRowRtsd0110, 	"certCd",	nvl(this.div_cust.ra_certification.value) );
        // 		this.ds_rtsd0110.setColumn(nRowRtsd0110, 	"certYn",	"Y");
        // 		this.ds_rtsd0110.setColumn(nRowRtsd0110, 	"mobNo",	FN_numberHyphenOut( nvl(this.ds_cust.getColumn(nRow,"mobNo")) ) );
        // 		this.ds_rtsd0110.setColumn(nRowRtsd0110, 	"mobFirm",	nvl(this.ds_cust.getColumn(nRow,"mobFirm")) );
        // 	}
        	
        	if( (this.ds_cust.getRowType(nRow) == "4") && (nvl(this.checkCustId) != "") ){
        		if( custTpVal == "01" ){
        			var nRowOnlUp = this.ds_onlineUpdate.addRow();
        			this.ds_onlineUpdate.setColumn(nRowOnlUp, "diVal" , 	nvl(this.ds_cust.getColumn(0, "diCd")));
        			this.ds_onlineUpdate.setColumn(nRowOnlUp, "posNo" , 	nvl(this.ds_cust.getColumn(0, "posCd")));
        			this.ds_onlineUpdate.setColumn(nRowOnlUp, "addr" ,  	nvl(this.ds_cust.getColumn(0, "addr1")));
        			this.ds_onlineUpdate.setColumn(nRowOnlUp, "dtlAddr" , 	nvl(this.ds_cust.getColumn(0, "addr2")));
        			this.ds_onlineUpdate.setColumn(nRowOnlUp, "bldMngNo" , 	nvl(this.ds_cust.getColumn(0, "bldMngNo")));
        			this.ds_onlineUpdate.setColumn(nRowOnlUp, "mobNo" , 	nvl(this.ds_cust.getColumn(0, "mobNo" )));
        			this.ds_onlineUpdate.setColumn(nRowOnlUp, "telNo" , 	nvl(this.ds_cust.getColumn(0, "telNo")));
        			this.ds_onlineUpdate.setColumn(nRowOnlUp, "email" , 	nvl(this.ds_cust.getColumn(0, "emailAddr")));
        			this.ds_onlineUpdate.setColumn(nRowOnlUp, "onlineId" ,	nvl(this.checkCustId));
        		}
        	}
        	
        	if( custTpVal == "01" ){
        		var loginCh_1 = nvl(this.div_cust.ch_loginCheck1.value);
        		var loginCh_2 = nvl(this.div_cust.ch_loginCheck2.value);
        		var loginId	  = nvl(this.div_cust.ed_loginId.value);
        		
        		if( loginCh_1 == true  && loginCh_2 == false && loginId != "" ){
        			alert("회원아이디 중복체크를 해주세요.");
        			return false;
        		}
        	}
        	
        	if( confirm( "저장하시겠습니까?") ){
        		var sSvcID        	= "saveCustRegister";                    
        		var sController   	= "rtms/sd/saveCustRegister.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		sInDatasets   		= "input1=ds_cust:U input2=ds_rtsd0110:U input3=ds_online:U input4=ds_onlineUpdate:U";
        		sOutDatasets  		= "";
        		var fn_callBack		= "fn_callBack";
        		
        		var nRow = this.ds_cust.rowposition;
        		this.ds_cust.setColumn(nRow, "mobNo",FN_numberHyphenOut(this.ds_cust.getColumn(nRow,"mobNo")));
        		this.ds_cust.setColumn(nRow, "telNo",FN_numberHyphenOut(this.ds_cust.getColumn(nRow,"telNo")));
        		this.ds_cust.setColumn(nRow, "telNo2",FN_numberHyphenOut(this.ds_cust.getColumn(nRow,"telNo2")));
        		this.ds_cust.setColumn(nRow, "cTelno",FN_numberHyphenOut(this.ds_cust.getColumn(nRow,"cTelno")));
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_cust_btn_postSearch1_onclick = function(obj,e){
        	var args ={p_arg : "RTSDCustRegister_1"};
        	Ex.core.popup(this,"우편번호 조회","comm::RTCOMMPostCode_pop.xfdl",args, "modaless=false");
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_cust_btn_postSearch2_onclick = function(obj,e){
        	var args ={p_arg : "RTSDCustRegister_2"};
        	Ex.core.popup(this,"우편번호 조회","comm::RTCOMMPostCode_pop.xfdl",args, "modaless=false");
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.FN_postCd = function(res,division ){
        	if( division == "addr1"){
        		this.div_cust.ed_addr2.set_enable(true);
        		this.div_cust.ed_posCd.set_value( res[0] );
        		this.div_cust.ed_addr1.set_value( res[1] );
        		this.div_cust.ed_addr2.set_value( res[2] );
        		this.ds_cust.setColumn(this.ds_cust.rowposition, "bldMngNo", res[3])
        	}else{
        		this.div_cust.ed_addr22.set_enable(true);
        		this.div_cust.ed_posCd2.set_value( res[0] );
        		this.div_cust.ed_addr12.set_value( res[1] );
        		this.div_cust.ed_addr22.set_value( res[2] );
        		this.ds_cust.setColumn(this.ds_cust.rowposition, "bldMngNo2", res[3])
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_cust_cb_emailAddr2_onitemchanged = function(obj,e){
        	if( this.div_cust.cb_emailAddr2.value == "01" ){
        		this.div_cust.ed_emailAddr2.set_visible(true);
        		this.div_cust.ed_emailAddr2.set_value("");
        		this.div_cust.ed_emailAddr2.setFocus();
        		this.div_cust.btn_emailAddr2.set_visible(true);
        		this.div_cust.cb_emailAddr2.set_visible(false);
        	}else{
        		this.div_cust.ed_emailAddr2.set_visible(false);
        		this.div_cust.btn_emailAddr2.set_visible(false);
        		this.div_cust.cb_emailAddr2.set_visible(true);
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_cust_btn_emailAddr2_onclick = function(obj,e){
        	this.div_cust.ed_emailAddr2.set_visible(false);
        	this.div_cust.btn_emailAddr2.set_visible(false);
        	this.div_cust.cb_emailAddr2.set_visible(true);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_cust_ra_custTp_onitemchanged = function(obj,e){
        	if( application.gds_userInfo.getColumn(0, "userGrp") == "01" ){
        		if( confirm( "고객유형 변경시 기존 입력내용은 사라집니다." ) ){
        			this.FN_custTpOnChangedView();
        			this.FN_custTpOnChangedValue();
        		}
        	}else{
        		if( e.postvalue == "02" ){
        			alert("사업자는 입력을 하실 수 없습니다.");
        			this.div_cust.ra_custTp.set_value(e.prevalue);
        		}
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_cust_btn_custNoSearch_onclick = function(obj,e){
        	var args ={p_arg : "RTSDCustRegister"};
        	Ex.core.popup(this,"고객찾기","comm::RTCOMMCust_pop.xfdl",args, "modaless=false");
        }
        this.returnCustInfo = function(ds){
        	if(ds[0].rowcount > 0){
        		this.div_cust.ed_emailAddr2.set_visible(false);
        		this.div_cust.btn_emailAddr2.set_visible(false);
        		this.div_cust.cb_emailAddr2.set_visible(true);
        		
        		this.ds_cust.clearData();
        		this.ds_cust.copyData(ds[0]);
        		this.FN_custTpOnChangedView();
        		this.FN_custTpOnEnable();
        		
        		this.FN_inputEmail();
        		
        		this.certificationFlag = false;
        		this.cerChangeFlag	   = true;
        		
        		this.oldMobNo = ds[0].getColumn(0,"mobNo");
        		
        		this.div_cust.ed_mobNo.set_value( FN_numberHyphenInReturn(ds[0].getColumn(0,"mobNo")) );
        		this.div_cust.ed_telNo.set_value( FN_numberHyphenInReturn(ds[0].getColumn(0,"telNo")) );
        		this.div_cust.ed_telNo2.set_value( FN_numberHyphenInReturn(ds[0].getColumn(0,"telNo2")) );
        		this.div_cust.ed_cTelno.set_value( FN_numberHyphenInReturn(ds[0].getColumn(0,"cTelno")) );
        		
        		this.FN_selectCertification();
        		var custNo = nvl(this.ds_cust.getColumn(0,"custNo"));
        		/*
        		this.div_cust.st_loginId.set_visible(true);
        		this.div_cust.ed_loginId.set_visible(true);
        		this.div_cust.btn_idCheck.set_visible(true);
        		*/
        		this.FN_searchRtsd0111(custNo);
        		
        		if( this.ds_cust.getColumn(0,"custTp") != "02" ){
        			this.FN_onlineEnterdupe();
        			this.div_cust.st_nagYn.set_visible(true);
        			this.div_cust.cb_nagYn.set_visible(true);
        		}
        		
        		this.Tab00.tabpage1.div_search.set_enable(true);
        		this.fn_getList();
        		this.Tab00_onchanged();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.FN_selectCertification = function(){//본인인증 이력 Select Max Seq
        	var sSvcID        	= "selectRtsd0110";                    
        	var sController   	= "rtms/sd/selectRtsd0110.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_rtsd0110=mapRtsd0110";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	sArgs += Ex.util.setParam("custNo", this.ds_cust.getColumn(0,"custNo"));
        	this.ds_rtsd0110.clearData();
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.FN_searchRtsd0111 = function(custNo ){//개인정보제공 동의 NAG_YN 조회
        	var sSvcID        	= "selectRtsd0111";                    
        	var sController   	= "rtms/sd/selectRtsd0111.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_rtsd0111=mapRtsd0111";
        	var sArgs 			= "";
        	var fn_callBack		= "fn_callBack";
        	sArgs += Ex.util.setParam("custNo",custNo);
        	this.ds_rtsd0111.clearData();
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.FN_custTpOnEnable = function(){
        	this.div_cust.ra_custTp.set_enable(false);
        	this.div_cust.ed_custNm.set_enable(false);
        	this.div_cust.ed_buslNo.set_enable(false);
        	this.div_cust.ed_birthDay.set_enable(false);
        	this.div_cust.cb_genderCd.set_enable(false);
        	this.div_cust.cb_lfCd.set_enable(false);
        	this.div_cust.ed_mobNo.set_enable(true);
        	this.div_cust.cb_mobFirm.set_enable(true);
        	this.div_cust.btn_safeKeyConfirm.set_visible(false);
        	this.div_cust.ra_certification.set_enable(true);
        	this.div_cust.btn_certification.set_visible(true);
        	this.div_cust.ed_addr2.set_enable(false);
        	this.div_cust.ed_addr22.set_enable(false);
        	
        	//20200423 kstka 고객정보 수정 권한 추가
        	var authYn = this.getControlAuthCheck("btn_custUpdate", "", this.userId);
        	if(authYn == "Y"){
        		this.div_cust.ed_custNm.set_enable(true);
        		this.div_cust.cb_genderCd.set_enable(true);
        		this.div_cust.cb_lfCd.set_enable(true);
        		//20200708 kstka 주민번호 변경 추가
        		this.div_cust.ed_birthDay.set_enable(true);
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.FN_custTpOnChangedView = function(){
        	if( this.div_cust.ra_custTp.value == "01" ){
        		this.div_cust.st_custNm.set_text("고객명");	//고객명
        		this.div_cust.st_telNo2.set_text("전화번호");	//고객명
        		
        		//개인
        		this.div_cust.st_genderCd.set_visible(true);	//성별
        		this.div_cust.cb_genderCd.set_visible(true);	//성별
        		this.div_cust.st_birthDay.set_visible(true);	//법정생년월일
        		this.div_cust.ed_birthDay.set_visible(true);	//법정생년월일
        		this.div_cust.st_genderCd.set_visible(true);	//성별
        		this.div_cust.cb_genderCd.set_visible(true);	//성별
        		this.div_cust.st_birthDay.set_visible(true);	//법정생년월일
        		this.div_cust.ed_birthDay.set_visible(true);	//법정생년월일
        		this.div_cust.st_lfCd.set_visible(true);		//내/외국인
        		this.div_cust.cb_lfCd.set_visible(true);		//내/외국인
        		this.div_cust.btn_safeKeyConfirm.set_visible(true);
        		
        		//사업자
        		this.div_cust.st_busiCond.set_visible(false);	//업태
        		this.div_cust.ed_busiCond.set_visible(false);	//업태
        		this.div_cust.st_busiType.set_visible(false);	//업종
        		this.div_cust.ed_busiType.set_visible(false);	//업종
        		this.div_cust.st_custTp2.set_visible(false);	//고객분류
        		this.div_cust.cb_custTp2.set_visible(false);	//고객분류
        		this.div_cust.st_buslNo.set_visible(false);		//사업자번호
        		this.div_cust.ed_buslNo.set_visible(false);		//사업자번호
        		this.div_cust.st_repNm.set_visible(false);		//대표자명
        		this.div_cust.ed_repNm.set_visible(false);		//대표자명
        		
        		this.div_cust.st_safekey.set_visible(true);
        		this.div_cust.ra_certification.set_visible(true);
        		//this.div_cust.btn_certification.set_visible(true);
        		//this.div_cust.nice_interface.set_visible(true);

        		this.div_cust.st_loginId.set_visible(true);
        		this.div_cust.ed_loginId.set_visible(true);
        		this.div_cust.btn_idCheck.set_visible(true);

        		this.div_cust.st_nagYn.set_visible(true);
        		this.div_cust.cb_nagYn.set_visible(true);

        		this.div_cust.st_cCustnm.set_visible(false);
        		this.div_cust.ed_Ccustnm.set_visible(false);

        		this.div_cust.st_cTelno.set_visible(false);
        		this.div_cust.ed_cTelno.set_visible(false);
        	}else{
        		this.div_cust.st_custNm.set_text("법인명");	//법인명
        		this.div_cust.st_telNo2.set_text("회사전화");	//회사전화
        		
        		//개인
        		this.div_cust.st_genderCd.set_visible(false);	//성별
        		this.div_cust.cb_genderCd.set_visible(false);	//성별
        		this.div_cust.st_birthDay.set_visible(false);	//법정생년월일
        		this.div_cust.ed_birthDay.set_visible(false);	//법정생년월일
        		this.div_cust.st_lfCd.set_visible(false);		//내/외국인
        		this.div_cust.cb_lfCd.set_visible(false);		//내/외국인
        		this.div_cust.btn_safeKeyConfirm.set_visible(false);
        		
        		//사업자
        		this.div_cust.st_busiCond.set_visible(true);	//업태
        		this.div_cust.ed_busiCond.set_visible(true);	//업태
        		this.div_cust.st_busiType.set_visible(true);	//업종
        		this.div_cust.ed_busiType.set_visible(true);	//업종
        		this.div_cust.st_custTp2.set_visible(true);		//고객분류
        		this.div_cust.cb_custTp2.set_visible(true);		//고객분류
        		this.div_cust.st_buslNo.set_visible(true);		//사업자번호
        		this.div_cust.ed_buslNo.set_visible(true);		//사업자번호
        		this.div_cust.st_repNm.set_visible(true);		//대표자명
        		this.div_cust.ed_repNm.set_visible(true);		//대표자명
        		
        		this.div_cust.st_safekey.set_visible(false);
        		this.div_cust.ra_certification.set_visible(false);
        		//this.div_cust.btn_certification.set_visible(false);
        		//this.div_cust.nice_interface.set_visible(false);

        		this.div_cust.st_loginId.set_visible(false);
        		this.div_cust.ed_loginId.set_visible(false);
        		this.div_cust.btn_idCheck.set_visible(false);

        		this.div_cust.st_nagYn.set_visible(false);
        		this.div_cust.cb_nagYn.set_visible(false);

        		this.div_cust.st_cCustnm.set_visible(true);
        		this.div_cust.ed_Ccustnm.set_visible(true);
        		
        		this.div_cust.st_cTelno.set_visible(true);
        		this.div_cust.ed_cTelno.set_visible(true);
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.FN_custTpOnChangedValue = function(){
        	var nRow = this.ds_cust.rowposition;
        	this.ds_cust.setColumn(nRow,"custNo", "")
        	//this.ds_cust.setColumn(nRow,"custTp", "")
        	this.ds_cust.setColumn(nRow,"custTp2", "")
        	this.ds_cust.setColumn(nRow,"custNm", "")
        	this.ds_cust.setColumn(nRow,"birthDay", "")
        	this.ds_cust.setColumn(nRow,"genderCd", "")
        	this.ds_cust.setColumn(nRow,"lfCd", "")
        	this.ds_cust.setColumn(nRow,"mobNo", "")
        	this.ds_cust.setColumn(nRow,"mobFirm", "")
        	this.ds_cust.setColumn(nRow,"telNo", "")
        	this.ds_cust.setColumn(nRow,"faxNo", "")
        	this.ds_cust.setColumn(nRow,"bldMngNo", "")
        	this.ds_cust.setColumn(nRow,"posCd", "")
        	this.ds_cust.setColumn(nRow,"addr1", "")
        	this.ds_cust.setColumn(nRow,"addr2", "")
        	this.ds_cust.setColumn(nRow,"telNo2", "")
        	this.ds_cust.setColumn(nRow,"bldMngNo2", "")
        	this.ds_cust.setColumn(nRow,"posCd2", "")
        	this.ds_cust.setColumn(nRow,"addr12", "")
        	this.ds_cust.setColumn(nRow,"addr22", "")
        	this.ds_cust.setColumn(nRow,"safekey", "")
        	this.ds_cust.setColumn(nRow,"buslNo", "")
        	this.ds_cust.setColumn(nRow,"corpNo", "")
        	this.ds_cust.setColumn(nRow,"repNm", "")
        	this.ds_cust.setColumn(nRow,"oCustnm", "")
        	this.ds_cust.setColumn(nRow,"oBirthday", "")
        	this.ds_cust.setColumn(nRow,"oGendercd", "")
        	this.ds_cust.setColumn(nRow,"oLfcd", "")
        	this.ds_cust.setColumn(nRow,"oMobno", "")
        	this.ds_cust.setColumn(nRow,"oSafekey", "")
        	this.ds_cust.setColumn(nRow,"cCustnm", "")
        	this.ds_cust.setColumn(nRow,"cTelno", "")
        	this.ds_cust.setColumn(nRow,"emailAddr", "")
        	this.ds_cust.setColumn(nRow,"emailAddr1", "")
        	this.ds_cust.setColumn(nRow,"emailAddr2", "")
        	this.ds_cust.setColumn(nRow,"busiType", "")
        	this.ds_cust.setColumn(nRow,"busiCond", "")
        	this.ds_cust.setColumn(nRow,"taxYn", "")
        	this.ds_cust.setColumn(nRow,"kunnr", "")
        	this.ds_cust.setColumn(nRow,"ciCd", "")
        	this.ds_cust.setColumn(nRow,"diCd", "")
        	this.ds_cust.setColumn(nRow,"cCustnm", "")
        	this.ds_cust.setColumn(nRow,"cTelno", "")
        	
        	this.div_cust.ch_birthDayAndBuslNoCh.set_value("true");
        	
        	if( this.div_cust.ra_custTp.value == "01" ){
        		this.div_cust.ed_useYn.set_value("Y");
        		this.div_cust.ed_taxYn.set_value("N");		//고객유형이 개인이면 개인사업자 면세여부는 "N" 
        		this.div_cust.cb_custTp2.set_value("0001");	//고객유형이 개인이면 고객분류는 개인
        	}else{
        		this.div_cust.ed_useYn.set_value("Y");
        		this.div_cust.ed_taxYn.set_value("N");
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_cust_ed_birthDay_onchanged = function(obj,e){
        	if( !FN_birthDayCheck( this.div_cust.ed_birthDay.value ) ){
        		this.div_cust.ed_birthDay.setFocus(true);
        		this.div_cust.ch_birthDayAndBuslNoCh.set_value("false");
        		this.div_cust.ed_birthDay.set_value("");
        		return false;
        	}else{
        		this.div_cust.ch_birthDayAndBuslNoCh.set_value("true");
        	}		
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_cust_ed_birthDay_onsetfocus = function(obj,e){
        	obj.setSelect(0);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_cust_ed_buslNo_onchanged = function(obj,e){
        	var checkBuslNo = FN_buslNoCheck( nvl(this.div_cust.ed_buslNo.value) )//comLib 사업자번호체크
        	if( !checkBuslNo ){
        		alert("사업자번호를 다시 확인 해 주세요.");
        		this.div_cust.ch_birthDayAndBuslNoCh.set_value("false");
        		return false;
        	}else{
        		this.div_cust.ch_birthDayAndBuslNoCh.set_value("true");
        	}
        	
        	var sSvcID        	= "checkBuslNo";
        	var sController   	= "rtms/sd/checkBuslNo.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= Ex.util.setParam("buslNo", nvl(this.div_cust.ed_buslNo.value));
        	var fn_callBack		= "fn_callBack";
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_cust_ed_buslNo_onsetfocus = function(obj,e){
        	obj.setSelect(0);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_cust_ed_mobNo_onsetfocus = function(obj,e){
        	obj.setSelect(0);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_cust_btn_safeKeyConfirm_onclick = function(obj,e){
        	var custTp 		= nvl(this.ds_cust.getColumn(0,"custTp"));
        	var custNm 		= nvl(this.ds_cust.getColumn(0,"custNm"));
        	var birthDay 	= nvl(this.ds_cust.getColumn(0,"birthDay"));
        	var genderCd 	= nvl(this.ds_cust.getColumn(0,"genderCd"));
        	var lfCd 		= nvl(this.ds_cust.getColumn(0,"lfCd"));
        	var mobNo 		= FN_numberHyphenOut( nvl(this.ds_cust.getColumn(0,"mobNo")) );
        	var mobFirm 	= nvl(this.ds_cust.getColumn(0,"mobFirm"));
        	var age			= (parseInt(this.toDay.substr(0,4))-parseInt(birthDay.substr(0,4))) + 1;
        	switch( custTp == "01" ){
        		case custNm 	== "" : alert( this.div_cust.st_custNm.text + " 값이 없습니다." );
        								this.div_cust.ed_custNm.setFocus(true);
        								break;
        		case birthDay 	== "" : alert( this.div_cust.st_birthDay.text + " 값이 없습니다." );
        								this.div_cust.ed_birthDay.setFocus(true);
        								break;
        		case birthDay.length != 8 : alert( this.div_cust.st_birthDay.text + "을 확인해주세요." );
        									this.div_cust.ed_birthDay.setFocus(true);
        									break;
        		case genderCd 	== "" : alert( this.div_cust.st_genderCd.text + " 값이 없습니다." );
        								this.div_cust.cb_genderCd.setFocus(true);
        								break;
        		case lfCd 		== "" : alert( this.div_cust.st_lfCd.text + " 값이 없습니다." );
        								this.div_cust.cb_lfCd.setFocus(true);
        								break;
        		case mobNo	 	== "" : alert( this.div_cust.st_mobNo.text + " 값이 없습니다." );
        								this.div_cust.ed_mobNo.setFocus(true);
        								break;
        		//case mobNo.length != 11	: alert( this.div_cust.st_mobNo.text + " 값을 확인해주세요." );
        		//							  this.div_cust.ed_mobNo.setFocus(true);
        		//							  break;						
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
        this.div_cust_ra_certification_onitemchanged = function(obj,e){
        	var value = this.div_cust.ra_certification.value;
        	
        	if( value == "01" ){
        		this.div_cust.btn_certification.set_visible(true);
        		this.div_cust.st_loginId.set_visible(true);
        		this.div_cust.ed_loginId.set_visible(true);
        		this.div_cust.btn_idCheck.set_visible(true);
        	}else if( value == "02" ){
        		this.div_cust.btn_certification.set_visible(false);
        		this.div_cust.st_loginId.set_visible(false);
        		this.div_cust.ed_loginId.set_visible(false);
        		this.div_cust.btn_idCheck.set_visible(false);
        	}else{
        	
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_cust_btn_certificationConfirm_onclick = function(obj,e){
        	var popGb = this.div_cust.ra_certification.value ;
        	var doc = this.div_cust.nice_interface.document;

        	if(popGb == '01') {			//휴대폰인증인경우
        		doc.getElementById("di_fn_popup").click();
        	} else if(popGb == '02') {	//신분증
        		doc.getElementById("fn_popup").click();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.web_onusernotify = function(obj,e){
        	var obj 				= this.div_cust.nice_interface.document;
        	var sName 				= nvl(obj.getElementById("sName").value);
        	var sBirthDate 			= nvl(obj.getElementById("sBirthDate").value);
        	var sGender 			= nvl(obj.getElementById("sGender").value);
        	var sNationalInfo 		= nvl(obj.getElementById("sNationalInfo").value);
        	var sNational 			= "";
        	var custNm 				= nvl(this.div_cust.ed_custNm.value);
        	var birthDay 			= nvl(this.div_cust.ed_birthDay.value);
        	var genderCd 			= nvl(this.div_cust.cb_genderCd.value);
        	var lfCd 	 			= nvl(this.div_cust.cb_lfCd.value);
        	
        	if( sGender == "0"){
        		sGender = "2";
        	}
        	
        	if( sNationalInfo == "0" ){
        		sNational = "1";
        	}else if( sNationalInfo == "1" ){
        		sNational = "2";
        	}else{
        		alert("내/외국 인코드값 ERROR");
        	}
        	
        	if( custNm != custNm){
        		alert("입력하신 고객정보와 본인인증정보가 다릅니다.\n다시 본인인증하시기 바랍니다.");
        		this.div_cust.ed_di.set_value("");
        		this.div_cust.ed_ci.set_value("");
        	}else if( sBirthDate != birthDay ){
        		alert("입력하신 고객정보와 본인인증정보가 다릅니다.\n다시 본인인증하시기 바랍니다.");
        		this.div_cust.ed_di.set_value("");
        		this.div_cust.ed_ci.set_value("");
        	}else if( sGender != genderCd ){
        		alert("입력하신 고객정보와 본인인증정보가 다릅니다.\n다시 본인인증하시기 바랍니다.");
        		this.div_cust.ed_di.set_value("");
        		this.div_cust.ed_ci.set_value("");
        	}else if( sNational != lfCd ){
        		alert("입력하신 고객정보와 본인인증정보가 다릅니다.\n다시 본인인증하시기 바랍니다.");
        		this.div_cust.ed_di.set_value("");
        		this.div_cust.ed_ci.set_value("");
        	}else{
        		alert("본인인증을 성공하였습니다.");
        		this.div_cust.ed_di.set_value( obj.getElementById("di").value );
        		this.div_cust.ed_ci.set_value( obj.getElementById("ci").value );
        		this.certificationFlag	= true;
        		this.cerChangeFlag 		= true;
        		this.FN_onlineEnterdupe();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.FN_onlineEnterdupe = function(){//온라인 회원 체크 : param = di
        	var sSvcID        	= "onlineEnterdupe";                    
        	var sController   	= "rtms/sd/onlineEnterdupe.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";
        	var fn_callBack		= "fn_callBack";
        	sArgs += " di=" + nvl(this.div_cust.ed_di.value);
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_cust_btn_idCheck_onclick = function(obj,e){
        	var di 		 = nvl(this.div_cust.ed_di.value);
        	var ci 		 = nvl(this.div_cust.ed_ci.value);
        	var loginId  = nvl(this.div_cust.ed_loginId.value);
        	var pattern  =/^[a-zA-Z0-9]{4,12}$/;
        	
        	
        	/*if( di == "" || ci == "" ){
        		alert("휴대폰인증을 해주세요.");
        		return false;
        	}
        	*/
        	if( loginId == "" ){
        		alert("회원ID 값이 없습니다.");
        		this.div_cust.ed_loginId.setFocus(true);
        		return false;
        	}
        	if( !pattern.test(loginId) ){
        		alert("아이디는 반드시 영문,숫자의 조합으로 4-12자리내에서 입력하십시오.");
        		this.div_cust.ed_loginId.setFocus(true);
        		return false;
        	}
        		
        	if(	loginId.replace(/[a-z]/ig,'').length == 0 || loginId.replace(/[0-9]/ig,'').length == 0){
        		alert("아이디는 반드시 영어와 숫자의 조합으로 정해주세요");
        		this.div_cust.ed_loginId.setFocus(true);
        		return false;
        	}
        	
        	var sSvcID        	= "onlineDupe";                    
        	var sController   	= "rtms/sd/onlineDupe.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	sArgs += " custId=" + nvl(this.div_cust.ed_loginId.value);
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        	
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.FN_custNoSelect = function(custNo ){
        	var sSvcID        	= "listCustInfo";                    
        	var sController   	= "rtms/comm/listCustInfo.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_cust=mapCustInfo";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	sArgs += Ex.util.setParam("custNo", custNo);
        	this.ds_cust.clearData();
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.FN_inputEmail = function(){
        	if(	this.ds_cust.getRowCount != 0 ){
        		var emailAddr = this.ds_cust.getColumn(this.ds_cust.rowposition,"emailAddr");
        		
        		if( nvl(emailAddr) != "" ){
        			var arrEmailAddr = emailAddr.split("@");
        			this.div_cust.ed_emailAddr1.set_value(arrEmailAddr[0]);
        			var nRow = this.ds_emailAddr2.findRow( "cdNm", arrEmailAddr[1] );
        			this.div_cust.cb_emailAddr2.set_value("01");
        			if( nRow < 0 ){
        				this.div_cust.ed_emailAddr2.set_visible(true);
        				this.div_cust.ed_emailAddr2.set_value("");
        				this.div_cust.ed_emailAddr2.setFocus();
        				this.div_cust.btn_emailAddr2.set_visible(true);
        				this.div_cust.cb_emailAddr2.set_visible(false);
        				this.div_cust.ed_emailAddr2.set_value(arrEmailAddr[1]);
        			}else{
        				this.div_cust.cb_emailAddr2.set_text(arrEmailAddr[1]);
        			}
        		}
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_cust_ed_loginId_onkeyup = function(obj,e){
        	if( this.div_cust.ch_loginCheck2.value == true ){
        		this.div_cust.ch_loginCheck2.set_value(false);
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_getList = function(){
        	this.Tab00.tabpage1.RTSDCustRegister_tab1_onload();
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.Tab00_onchanged = function(obj,e){
        	var idx = this.Tab00.tabindex;
        	if(idx == 0) {
        		this.Tab00.tabpage1.RTSDCustRegister_tab1_onload();
        	}else{
        		this.Tab00.tabpage2.RTSDCustRegister_tab2_onload();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_cust_ra_certification_canitemchange = function(obj,e){
        	var stat = this.ds_cust.getRowType( this.ds_cust.rowposition );
        	if( (stat == "04") && (e.prevalue == "01") ){
        		//alert("변경할 수 없습니다.");
        		//return false;
        	}else{
        		this.cerChangeFlag = false;
        	}
        }

        this.Button00_onclick = function(obj,e)
        {

        	var kunnr 			= nvl(this.div_cust.ed_custNo.value);
        	var birthDay 		= nvl(this.div_cust.ed_birthDay.value);
        	var mobNo 			= FN_numberHyphenOut(nvl(this.div_cust.ed_mobNo.value));
        	var gender 			= nvl(this.div_cust.cb_genderCd.value);
        	var emailAddr1  	= nvl(this.div_cust.ed_emailAddr1.value);
        	var emailAddr2  	= nvl(this.div_cust.ed_emailAddr2.value);	
        	var custNm 			= nvl(this.div_cust.ed_custNm.value);
        	var email 			= emailAddr1 + "@" + emailAddr2;
        	
        	this.div_cust.safekey_interface.set_url("http://1.254.67.135:9080/interface/web_safekey/checkplus_body.jsp");
        	var doc = this.div_cust.safekey_interface.document;
        	doc.getElementById("kunnr").value 		= kunnr;
        	doc.getElementById("username").value 	= custNm;
        	doc.getElementById("birthdate").value 	= birthDay;
        	doc.getElementById("gender").value 		= gender;
        	doc.getElementById("mobileno").value 	= mobNo;
        	doc.getElementById("email").value 		= email;
        	doc.getElementById("safe_fn_popup").click();
        }

        //[20230607_1] kstka
        //==================================================================================
        this.listControlAuth = function(mdlCd,prgmCd){
        	
        	var sSvcID        	= "listControlAuth";                    
        	var sController   	= "/rtms/cm/listControlAuth.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_controlAuth=output";
        	var sArgs 			= Ex.util.setParam("mdlCd", mdlCd);
        		sArgs 			+= Ex.util.setParam("prgmCd", prgmCd);
        	    
        	var fn_callBack		= "fn_callBack";

        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        this.getControlAuthCheck = function(controlId,userGrp,userId){
        	var expr = "controlId == '" + controlId + "'";
        	if(nvl(userGrp) != "") expr += " && userGrp == '" + userGrp + "'";
        	if(nvl(userId) != "") expr += " && userId == '" + userId + "'";
        	expr += " && useYn == 'Y'";
        	
        	var nRow = this.ds_controlAuth.findRowExpr(expr);
        	if(nRow < 0) return "N";
        	if(nRow >= 0) return "Y";
        }
        //==================================================================================
        this.div_cust_checkPrvHistory_onclick = function(obj,e){
        	var nRow 	  = this.ds_cust.rowposition ;
        	
        	var custNo		= this.resultCustNo;
        	var custNm 		= nvl(this.ds_cust.getColumn(nRow,"custNm"));		//고객명
        	var birthDay 	= nvl(this.ds_cust.getColumn(nRow,"birthDay"));		//법정생년월일
        	var mobNo 		= nvl(this.ds_cust.getColumn(nRow,"mobNo"));		//휴대폰
        	var safeKey 	= nvl(this.div_cust.ed_safekey.value);				//인증번호
        	
        	
        	// 필수값 validation
        	if( custNm == "" ){
        		alert("고객명을 입력하세요.");
        		this.div_cust.ed_custNm.setFocus();
        		return false;
        	}else if( birthDay == "" ){
        		alert("생년월일 입력하세요.");
        		this.div_cust.ed_birthDay.setFocus();
        		return false;
        	}else if( mobNo == "" ){
        		alert("휴대폰번호를 입력하세요.");
        		this.div_cust.ed_mobNo.setFocus();
        		return false;
        	}else if( safeKey == "" ){
        		alert("인증번호확인을 먼저 진행해주세요.");
        		return false;
        	}else{
        	
        	}
        	
        	var sSvcID        	= "beforeCheckEmpInfo";                    
        	var sController   	= "rtms/sd/beforeCheckEmpInfo.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("custNo", custNo);
        	sArgs += Ex.util.setParam("custNm", custNm);
        	sArgs += Ex.util.setParam("birthDay", birthDay);
        	sArgs += Ex.util.setParam("mobNo", FN_numberHyphenOut(mobNo));
        	sArgs += Ex.util.setParam("safeKey", safeKey);
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTSDCustRegister_onload, this);
            this.div_cust.btn_custNoSearch.addEventHandler("onclick", this.div_cust_btn_custNoSearch_onclick, this);
            this.div_cust.btn_safeKeyConfirm.addEventHandler("onclick", this.div_cust_btn_safeKeyConfirm_onclick, this);
            this.div_cust.cb_emailAddr2.addEventHandler("onitemchanged", this.div_cust_cb_emailAddr2_onitemchanged, this);
            this.div_cust.btn_certification.addEventHandler("onclick", this.div_cust_btn_certificationConfirm_onclick, this);
            this.div_cust.ra_custTp.addEventHandler("onitemchanged", this.div_cust_ra_custTp_onitemchanged, this);
            this.div_cust.ed_birthDay.addEventHandler("onchanged", this.div_cust_ed_birthDay_onchanged, this);
            this.div_cust.ed_birthDay.addEventHandler("onsetfocus", this.div_cust_ed_birthDay_onsetfocus, this);
            this.div_cust.btn_emailAddr2.addEventHandler("onclick", this.div_cust_btn_emailAddr2_onclick, this);
            this.div_cust.ed_buslNo.addEventHandler("onchanged", this.div_cust_ed_buslNo_onchanged, this);
            this.div_cust.ed_buslNo.addEventHandler("onsetfocus", this.div_cust_ed_buslNo_onsetfocus, this);
            this.div_cust.ed_telNo.addEventHandler("onkeyup", this.div_cust_ed_telNo_onkeyup, this);
            this.div_cust.ed_telNo2.addEventHandler("onkeyup", this.div_cust_ed_telNo2_onkeyup, this);
            this.div_cust.btn_postSearch1.addEventHandler("onclick", this.div_cust_btn_postSearch1_onclick, this);
            this.div_cust.btn_postSearch2.addEventHandler("onclick", this.div_cust_btn_postSearch2_onclick, this);
            this.div_cust.cb_custTp2.addEventHandler("onitemchanged", this.div_search_cmb_searchCondition_onitemchanged, this);
            this.div_cust.nice_interface.addEventHandler("onusernotify", this.web_onusernotify, this);
            this.div_cust.ed_loginId.addEventHandler("onkeyup", this.div_cust_ed_loginId_onkeyup, this);
            this.div_cust.btn_idCheck.addEventHandler("onclick", this.div_cust_btn_idCheck_onclick, this);
            this.div_cust.ra_certification.addEventHandler("onitemchanged", this.div_cust_ra_certification_onitemchanged, this);
            this.div_cust.ra_certification.addEventHandler("canitemchange", this.div_cust_ra_certification_canitemchange, this);
            this.div_cust.ed_mobNo.addEventHandler("onkeyup", this.div_cust_ed_mobNo_onkeyup, this);
            this.div_cust.ed_cTelno.addEventHandler("onkeyup", this.div_cust_ed_cTelno_onkeyup, this);
            this.div_cust.checkPrvHistory.addEventHandler("onclick", this.div_cust_checkPrvHistory_onclick, this);
            this.Tab00.addEventHandler("onchanged", this.Tab00_onchanged, this);
            this.Button00.addEventHandler("onclick", this.Button00_onclick, this);

        };

        this.loadIncludeScript("RTSDCustRegister.xfdl");
        this.loadPreloadList();
       
    };
}
)();
