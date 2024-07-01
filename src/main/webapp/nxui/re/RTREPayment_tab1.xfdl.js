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
                this.set_name("RTREPaymentTab1");
                this.set_classname("Authority");
                this.set_titletext("결제방법 및 결제일 변경");
                this._setFormPosition(0,0,1122,510);
            }
            this.getSetter("inheritanceid").set("");

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("dsS024", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cdNm\">선택</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_chgInfo", this);
            obj.set_firefirstcount("0");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj.set_preload("true");
            obj.set_useclientlayout("false");
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"vehicleNo\" type=\"STRING\" size=\"256\"/><Column id=\"accSeq\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"strDay\" type=\"STRING\" size=\"256\"/><Column id=\"endDay\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"custTp\" type=\"STRING\" size=\"256\"/><Column id=\"ebirDay\" type=\"STRING\" size=\"256\"/><Column id=\"buslNo\" type=\"STRING\" size=\"256\"/><Column id=\"bankCd\" type=\"STRING\" size=\"256\"/><Column id=\"bankNm\" type=\"STRING\" size=\"256\"/><Column id=\"acctNo\" type=\"STRING\" size=\"256\"/><Column id=\"accChk\" type=\"STRING\" size=\"256\"/><Column id=\"acncId\" type=\"STRING\" size=\"256\"/><Column id=\"acncDesc\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/><Column id=\"crdSeq\" type=\"STRING\" size=\"256\"/><Column id=\"cardcomCd\" type=\"STRING\" size=\"256\"/><Column id=\"cardcomNm\" type=\"STRING\" size=\"256\"/><Column id=\"cardNo\" type=\"STRING\" size=\"256\"/><Column id=\"expireYm\" type=\"STRING\" size=\"256\"/><Column id=\"bkeyChk\" type=\"STRING\" size=\"256\"/><Column id=\"batchKey\" type=\"STRING\" size=\"256\"/><Column id=\"payMthd\" type=\"STRING\" size=\"256\"/><Column id=\"productNm\" type=\"STRING\" size=\"256\"/><Column id=\"payDd\" type=\"STRING\" size=\"256\"/><Column id=\"arrearsAmt\" type=\"STRING\" size=\"256\"/><Column id=\"depositor\" type=\"STRING\" size=\"256\"/><Column id=\"expireY\" type=\"STRING\" size=\"256\"/><Column id=\"expireM\" type=\"STRING\" size=\"256\"/><Column id=\"tcgrpNo\" type=\"STRING\" size=\"256\"/><Column id=\"deleteTp\" type=\"STRING\" size=\"256\"/><Column id=\"accStat\" type=\"STRING\" size=\"256\"/><Column id=\"pCustTp\" type=\"STRING\" size=\"256\"/><Column id=\"oBuslNo\" type=\"STRING\" size=\"256\"/><Column id=\"birthDay\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"safeKey\" type=\"STRING\" size=\"256\"/><Column id=\"certCd\" type=\"STRING\" size=\"256\"/><Column id=\"mobFirm\" type=\"STRING\" size=\"256\"/><Column id=\"lfCd\" type=\"STRING\" size=\"256\"/><Column id=\"genderCd\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsR001", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cdNm\">선택</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsR002", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cdNm\">선택</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsR005", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cdNm\">선택</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsR006", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsR004", this);
            obj.set_firefirstcount("0");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cdNm\">선택</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsInList", this);
            obj.set_firefirstcount("0");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"rpcDay\" type=\"STRING\" size=\"256\"/><Column id=\"rpcUid\" type=\"STRING\" size=\"256\"/><Column id=\"rpcCd\" type=\"STRING\" size=\"256\"/><Column id=\"rpcRsn\" type=\"STRING\" size=\"256\"/><Column id=\"acrqDay\" type=\"STRING\" size=\"256\"/><Column id=\"acrqSeq\" type=\"STRING\" size=\"256\"/><Column id=\"fileGrpSeq\" type=\"STRING\" size=\"256\"/><Column id=\"bfcustNo\" type=\"STRING\" size=\"256\"/><Column id=\"bftcgrpNo\" type=\"STRING\" size=\"256\"/><Column id=\"bfpayMthd\" type=\"STRING\" size=\"256\"/><Column id=\"bfpayDd\" type=\"STRING\" size=\"256\"/><Column id=\"bfaccSeq\" type=\"STRING\" size=\"256\"/><Column id=\"bfacustNm\" type=\"STRING\" size=\"256\"/><Column id=\"bfacustTp\" type=\"STRING\" size=\"256\"/><Column id=\"bfaebirDay\" type=\"STRING\" size=\"256\"/><Column id=\"bfabuslNo\" type=\"STRING\" size=\"256\"/><Column id=\"bfbankNo\" type=\"STRING\" size=\"256\"/><Column id=\"bfacctNo\" type=\"STRING\" size=\"256\"/><Column id=\"bfcrdSeq\" type=\"STRING\" size=\"256\"/><Column id=\"bfccustNm\" type=\"STRING\" size=\"256\"/><Column id=\"bfccustTp\" type=\"STRING\" size=\"256\"/><Column id=\"bfcebirDay\" type=\"STRING\" size=\"256\"/><Column id=\"bfcbuslNo\" type=\"STRING\" size=\"256\"/><Column id=\"bfcardcomNo\" type=\"STRING\" size=\"256\"/><Column id=\"bfcardNo\" type=\"STRING\" size=\"256\"/><Column id=\"bfexpireYm\" type=\"STRING\" size=\"256\"/><Column id=\"bfbatchKey\" type=\"STRING\" size=\"256\"/><Column id=\"bfaccStat\" type=\"STRING\" size=\"256\"/><Column id=\"afcustNo\" type=\"STRING\" size=\"256\"/><Column id=\"aftcgrpNo\" type=\"STRING\" size=\"256\"/><Column id=\"afpayMthd\" type=\"STRING\" size=\"256\"/><Column id=\"afpayDd\" type=\"STRING\" size=\"256\"/><Column id=\"afaccSeq\" type=\"STRING\" size=\"256\"/><Column id=\"afacustNm\" type=\"STRING\" size=\"256\"/><Column id=\"afacustTp\" type=\"STRING\" size=\"256\"/><Column id=\"afaebirDay\" type=\"STRING\" size=\"256\"/><Column id=\"afabuslNo\" type=\"STRING\" size=\"256\"/><Column id=\"afbankNo\" type=\"STRING\" size=\"256\"/><Column id=\"afacctNo\" type=\"STRING\" size=\"256\"/><Column id=\"afaccChk\" type=\"STRING\" size=\"256\"/><Column id=\"afcrdSeq\" type=\"STRING\" size=\"256\"/><Column id=\"afbatchKey\" type=\"STRING\" size=\"256\"/><Column id=\"afccustNm\" type=\"STRING\" size=\"256\"/><Column id=\"afccustTp\" type=\"STRING\" size=\"256\"/><Column id=\"afcebirDay\" type=\"STRING\" size=\"256\"/><Column id=\"afcbuslNo\" type=\"STRING\" size=\"256\"/><Column id=\"afcardcomNo\" type=\"STRING\" size=\"256\"/><Column id=\"afcardNo\" type=\"STRING\" size=\"256\"/><Column id=\"afexpireYm\" type=\"STRING\" size=\"256\"/><Column id=\"userId\" type=\"STRING\" size=\"256\"/><Column id=\"deleteTp\" type=\"STRING\" size=\"256\"/><Column id=\"afbkeyChk\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_List", this);
            obj.set_firefirstcount("0");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"vehicleNo\" type=\"STRING\" size=\"256\"/><Column id=\"accSeq\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"strDay\" type=\"STRING\" size=\"256\"/><Column id=\"endDay\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"custTp\" type=\"STRING\" size=\"256\"/><Column id=\"ebirDay\" type=\"STRING\" size=\"256\"/><Column id=\"buslNo\" type=\"STRING\" size=\"256\"/><Column id=\"bankCd\" type=\"STRING\" size=\"256\"/><Column id=\"bankNm\" type=\"STRING\" size=\"256\"/><Column id=\"acctNo\" type=\"STRING\" size=\"256\"/><Column id=\"accChk\" type=\"STRING\" size=\"256\"/><Column id=\"acncId\" type=\"STRING\" size=\"256\"/><Column id=\"acncDesc\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/><Column id=\"crdSeq\" type=\"STRING\" size=\"256\"/><Column id=\"cardcomCd\" type=\"STRING\" size=\"256\"/><Column id=\"cardcomNm\" type=\"STRING\" size=\"256\"/><Column id=\"cardNo\" type=\"STRING\" size=\"256\"/><Column id=\"expireYm\" type=\"STRING\" size=\"256\"/><Column id=\"bkeyChk\" type=\"STRING\" size=\"256\"/><Column id=\"batchKey\" type=\"STRING\" size=\"256\"/><Column id=\"payMthd\" type=\"STRING\" size=\"256\"/><Column id=\"productNm\" type=\"STRING\" size=\"256\"/><Column id=\"payDd\" type=\"STRING\" size=\"256\"/><Column id=\"arrearsAmt\" type=\"STRING\" size=\"256\"/><Column id=\"depositor\" type=\"STRING\" size=\"256\"/><Column id=\"expireY\" type=\"STRING\" size=\"256\"/><Column id=\"expireM\" type=\"STRING\" size=\"256\"/><Column id=\"tcgrpNo\" type=\"STRING\" size=\"256\"/><Column id=\"deleteTp\" type=\"STRING\" size=\"256\"/><Column id=\"accStat\" type=\"STRING\" size=\"256\"/><Column id=\"custTp2\" type=\"STRING\" size=\"256\"/><Column id=\"oBirthDay\" type=\"STRING\" size=\"256\"/><Column id=\"oCustNm\" type=\"STRING\" size=\"256\"/><Column id=\"pCustTp\" type=\"STRING\" size=\"256\"/><Column id=\"oBuslNo\" type=\"STRING\" size=\"256\"/><Column id=\"birthDay\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"safeKey\" type=\"STRING\" size=\"256\"/><Column id=\"certCd\" type=\"STRING\" size=\"256\"/><Column id=\"mobFirm\" type=\"STRING\" size=\"256\"/><Column id=\"lfCd\" type=\"STRING\" size=\"256\"/><Column id=\"genderCd\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
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

            obj = new Dataset("ds_delInfo", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"delTp\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
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

            obj = new Dataset("dsFile", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_certification", this);
            obj.set_firefirstcount("0");
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
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"seq\" type=\"STRING\" size=\"256\"/><Column id=\"certDay\" type=\"STRING\" size=\"256\"/><Column id=\"safekey\" type=\"STRING\" size=\"256\"/><Column id=\"certCd\" type=\"STRING\" size=\"256\"/><Column id=\"certYn\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"mobFirm\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static06", "absolute", "10", "232", "84", "20", null, null, this);
            obj.set_taborder("35");
            obj.set_text("변경할 내용");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "10", "10", "1102", "45", null, null, this);
            obj.set_taborder("9");
            obj.set_text("Div00");
            obj.set_cssclass("div_WF_searchBg");
            obj.set_scrollbars("none");
            this.addChild(obj.name, obj);
            obj = new Button("btn_search", "absolute", null, null, "45", "22", "209", "8", this.div_search);
            obj.set_taborder("14");
            obj.set_text("조회");
            obj.set_cssclass("btn_WF_CRUD");
            obj.getSetter("domainId").set("nexa.search");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition", "absolute", "20", "10", "64", "20", null, null, this.div_search);
            obj.set_taborder("15");
            obj.set_text("계약번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_save", "absolute", null, "11", "45", "22", "107", null, this.div_search);
            obj.set_taborder("21");
            obj.set_text("저장");
            obj.set_cssclass("btn_WF_CRUD");
            obj.getSetter("domainId").set("nexa.save");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_Excel", "absolute", null, "11", "45", "22", "5", null, this.div_search);
            obj.set_taborder("22");
            obj.set_text("엑셀");
            obj.set_cssclass("btn_WF_CRUD");
            obj.getSetter("domainId").set("nexa.save");
            obj.getSetter("_excel").set("this.grdList");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("edt_ordNo", "absolute", "88", "10", "140", "21", null, null, this.div_search);
            obj.set_taborder("23");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_odrPopUp", "absolute", "207", "9", "20", "21", null, null, this.div_search);
            obj.set_taborder("24");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("edt_custNoKeyword", "absolute", "467", "10", "140", "21", null, null, this.div_search);
            obj.set_taborder("25");
            obj.set_inputfilter("space");
            obj.set_lengthunit("ascii");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("edt_custNo", "absolute", "326", "10", "140", "21", null, null, this.div_search);
            obj.set_taborder("26");
            obj.set_inputfilter("space");
            obj.set_lengthunit("ascii");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_custPopUp", "absolute", "448", "9", "20", "21", null, null, this.div_search);
            obj.set_taborder("27");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition00", "absolute", "258", "10", "64", "20", null, null, this.div_search);
            obj.set_taborder("28");
            obj.set_text("고객번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_new", "absolute", null, "11", "45", "22", "158", null, this.div_search);
            obj.set_taborder("29");
            obj.set_text("신규");
            obj.set_cssclass("btn_WF_CRUD");
            obj.getSetter("domainId").set("nexa.save");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_Delete", "absolute", null, "11", "45", "22", "56", null, this.div_search);
            obj.set_taborder("30");
            obj.set_text("삭제");
            obj.set_cssclass("btn_WF_CRUD");
            obj.style.set_font("dotum,8, bold");
            obj.getSetter("domainId").set("nexa.delete");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("sta_title", "absolute", "142", "55", null, "16", "1000", null, this);
            obj.set_taborder("23");
            obj.set_text("Records Found");
            obj.set_cssclass("sta_WF_GridFound2");
            this.addChild(obj.name, obj);

            obj = new Static("sta_total_cnt", "absolute", "89", "58", null, "16", "1132", null, this);
            obj.set_taborder("24");
            obj.set_text("0");
            obj.set_cssclass("sta_WF_GridFound");
            obj.style.set_align("right middle");
            this.addChild(obj.name, obj);

            obj = new Static("sta_result", "absolute", "0", "55", null, "16", "1155", null, this);
            obj.set_taborder("26");
            obj.set_text("검색결과");
            obj.set_cssclass("sta_WF_GridFound");
            obj.style.set_align("left middle");
            obj.style.set_font("bold 9 Verdana");
            this.addChild(obj.name, obj);

            obj = new Grid("grdList", "absolute", "10", "66", "1102", "150", null, null, this);
            obj.set_taborder("10");
            obj.set_binddataset("ds_List");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"120\"/><Column size=\"80\"/><Column size=\"0\"/><Column size=\"100\"/><Column size=\"93\"/><Column size=\"120\"/><Column size=\"91\"/><Column size=\"96\"/><Column size=\"100\"/><Column size=\"128\"/><Column size=\"80\"/><Column size=\"102\"/><Column size=\"121\"/><Column size=\"111\"/><Column size=\"114\"/><Column size=\"80\"/><Column size=\"0\"/><Column size=\"0\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"계약번호\"/><Cell col=\"1\" text=\"차량번호\"/><Cell col=\"2\" text=\"고객번호\"/><Cell col=\"3\" text=\"고객번호\"/><Cell col=\"4\" text=\"고객명\"/><Cell col=\"5\" text=\"상품명\"/><Cell col=\"6\" text=\"결제방법\"/><Cell col=\"7\" text=\"결제일\"/><Cell col=\"8\" text=\"은행\"/><Cell col=\"9\" text=\"계좌번호\"/><Cell col=\"10\" text=\"예금주\"/><Cell col=\"11\" text=\"카드사\"/><Cell col=\"12\" text=\"카드번호\"/><Cell col=\"13\" text=\"법정생년월일\"/><Cell col=\"14\" text=\"사업자번호\"/><Cell col=\"15\" text=\"미납금액\"/><Cell col=\"16\" text=\"삭제가능여부\"/><Cell col=\"17\"/></Band><Band id=\"body\"><Cell displaytype=\"text\" edittype=\"readonly\" text=\"bind:ordNo\"/><Cell col=\"1\" text=\"bind:vehicleNo\"/><Cell col=\"2\" displaytype=\"none\" text=\"bind:password\"/><Cell col=\"3\" text=\"bind:custNo\"/><Cell col=\"4\" text=\"bind:custNm\"/><Cell col=\"5\" text=\"bind:productNm\"/><Cell col=\"6\" displaytype=\"combo\" text=\"bind:payMthd\" combodataset=\"dsR004\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"7\" displaytype=\"combo\" text=\"bind:payDd\" combodataset=\"expr:payMthd == &quot;A&quot; ? &quot;dsR005&quot; : &quot;dsR006&quot;\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"8\" displaytype=\"combo\" text=\"bind:bankCd\" combodataset=\"dsR001\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"9\" text=\"bind:acctNo\"/><Cell col=\"10\" text=\"bind:depositor\"/><Cell col=\"11\" displaytype=\"combo\" text=\"bind:cardcomCd\" combodataset=\"dsR002\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"12\" text=\"bind:cardNo\"/><Cell col=\"13\" displaytype=\"normal\" text=\"bind:ebirDay\" mask=\"##-##-##\" calendardisplaynulltype=\"none\"/><Cell col=\"14\" text=\"bind:buslNo\" mask=\"###-##-#####\"/><Cell col=\"15\" displaytype=\"number\" style=\"align:right middle;\" text=\"bind:arrearsAmt\" mask=\"###,###,###,##0\"/><Cell col=\"16\" text=\"bind:deleteTp\"/><Cell col=\"17\" text=\"bind:tcgrpNo\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Div("divInfo", "absolute", "10", "259", "1102", "269", null, null, this);
            obj.set_taborder("16");
            obj.set_text("Div00");
            this.addChild(obj.name, obj);
            obj = new Div("divChgCmInfo", "absolute", "0", "0", "1102", "32", null, null, this.divInfo);
            obj.set_taborder("1");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            this.divInfo.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "0", "0", "1102", "31", null, null, this.divInfo.divChgCmInfo);
            obj.set_taborder("44");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.divInfo.divChgCmInfo.addChild(obj.name, obj);
            obj = new Combo("cmbPayment", "absolute", "114", "5", "204", "21", null, null, this.divInfo.divChgCmInfo);
            this.divInfo.divChgCmInfo.addChild(obj.name, obj);
            obj.set_taborder("37");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_innerdataset("@dsR004");
            obj.set_enable("false");
            obj.set_displaynulltext("선택");
            obj.set_index("-1");
            obj = new Static("st_searchCondition08", "absolute", "734", "0", "110", "31", null, null, this.divInfo.divChgCmInfo);
            obj.set_taborder("38");
            obj.set_text("구분");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.divInfo.divChgCmInfo.addChild(obj.name, obj);
            obj = new Static("st_searchCondition03", "absolute", "367", "0", "110", "31", null, null, this.divInfo.divChgCmInfo);
            obj.set_taborder("39");
            obj.set_text("결제일");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.divInfo.divChgCmInfo.addChild(obj.name, obj);
            obj = new Button("btn_PayPop", "absolute", "322", "5", "41", "21", null, null, this.divInfo.divChgCmInfo);
            obj.set_taborder("40");
            obj.set_text("선택");
            obj.getSetter("domainId").set("nexa.save");
            obj.set_enable("false");
            this.divInfo.divChgCmInfo.addChild(obj.name, obj);
            obj = new Static("st_searchCondition", "absolute", "0", "0", "110", "31", null, null, this.divInfo.divChgCmInfo);
            obj.set_taborder("41");
            obj.set_text("결제방법");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.divInfo.divChgCmInfo.addChild(obj.name, obj);
            obj = new Combo("cmbPaymentDay", "absolute", "481", "5", "140", "21", null, null, this.divInfo.divChgCmInfo);
            this.divInfo.divChgCmInfo.addChild(obj.name, obj);
            obj.set_taborder("42");
            obj.set_innerdataset("@dsR005");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj.set_value("-1");
            obj.set_text("선택");
            obj.set_displaynulltext("선택");
            obj.set_index("0");
            obj = new Combo("cmbGubun", "absolute", "848", "5", "140", "21", null, null, this.divInfo.divChgCmInfo);
            this.divInfo.divChgCmInfo.addChild(obj.name, obj);
            obj.set_taborder("43");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj.set_enable("false");
            obj.set_innerdataset("@dsS024");
            obj.set_text("선택");
            obj.set_displaynulltext("선택");
            obj.set_index("0");
            obj = new Div("divChgInfo", "absolute", "-1", "30", "1103", "92", null, null, this.divInfo);
            obj.set_taborder("2");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            this.divInfo.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "1", "0", "1102", "31", null, null, this.divInfo.divChgInfo);
            obj.set_taborder("53");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.divInfo.divChgInfo.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "1", "30", "1102", "31", null, null, this.divInfo.divChgInfo);
            obj.set_taborder("54");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.divInfo.divChgInfo.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "1", "60", "1102", "31", null, null, this.divInfo.divChgInfo);
            obj.set_taborder("55");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.divInfo.divChgInfo.addChild(obj.name, obj);
            obj = new Static("st_searchCondition10", "absolute", "1", "30", "110", "31", null, null, this.divInfo.divChgInfo);
            obj.set_taborder("35");
            obj.set_text("법정생년월일");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.divInfo.divChgInfo.addChild(obj.name, obj);
            obj = new Static("st_searchCondition09", "absolute", "368", "0", "110", "31", null, null, this.divInfo.divChgInfo);
            obj.set_taborder("36");
            obj.set_text("예금주명");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.divInfo.divChgInfo.addChild(obj.name, obj);
            obj = new Edit("edtAccConfirm", "absolute", "115", "65", "140", "21", null, null, this.divInfo.divChgInfo);
            obj.set_taborder("37");
            obj.set_enable("false");
            this.divInfo.divChgInfo.addChild(obj.name, obj);
            obj = new Edit("edtDepositor", "absolute", "482", "5", "140", "21", null, null, this.divInfo.divChgInfo);
            obj.set_taborder("38");
            obj.set_enable("false");
            this.divInfo.divChgInfo.addChild(obj.name, obj);
            obj = new Edit("edtAccNo", "absolute", "849", "5", "249", "21", null, null, this.divInfo.divChgInfo);
            obj.set_taborder("39");
            obj.set_enable("false");
            obj.set_inputtype("digit");
            obj.set_lengthunit("ascii");
            this.divInfo.divChgInfo.addChild(obj.name, obj);
            obj = new Static("st_searchCondition01", "absolute", "735", "0", "110", "31", null, null, this.divInfo.divChgInfo);
            obj.set_taborder("40");
            obj.set_text("계좌번호");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.divInfo.divChgInfo.addChild(obj.name, obj);
            obj = new Static("st_searchCondition00", "absolute", "1", "0", "110", "31", null, null, this.divInfo.divChgInfo);
            obj.set_taborder("41");
            obj.set_text("은행");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.divInfo.divChgInfo.addChild(obj.name, obj);
            obj = new Static("st_searchCondition02", "absolute", "735", "30", "110", "31", null, null, this.divInfo.divChgInfo);
            obj.set_taborder("43");
            obj.set_text("신청서선택");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.divInfo.divChgInfo.addChild(obj.name, obj);
            obj = new Static("st_searchCondition04", "absolute", "368", "30", "110", "31", null, null, this.divInfo.divChgInfo);
            obj.set_taborder("44");
            obj.set_text("사업자번호");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.divInfo.divChgInfo.addChild(obj.name, obj);
            obj = new Button("btn_AccConfirm", "absolute", "259", "65", "77", "21", null, null, this.divInfo.divChgInfo);
            obj.set_taborder("45");
            obj.set_text("계좌인증");
            obj.getSetter("domainId").set("nexa.save");
            obj.set_enable("false");
            this.divInfo.divChgInfo.addChild(obj.name, obj);
            obj = new MaskEdit("maeBusiNo", "absolute", "482", "35", "140", "21", null, null, this.divInfo.divChgInfo);
            obj.set_taborder("47");
            obj.set_type("string");
            obj.set_mask("###-##-#####");
            obj.set_enable("false");
            this.divInfo.divChgInfo.addChild(obj.name, obj);
            obj = new Combo("cmbBank", "absolute", "115", "5", "204", "21", null, null, this.divInfo.divChgInfo);
            this.divInfo.divChgInfo.addChild(obj.name, obj);
            obj.set_taborder("49");
            obj.set_innerdataset("@dsR001");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_enable("false");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj.set_value("-1");
            obj.set_text("선택");
            obj.set_displaynulltext("선택");
            obj.set_index("0");
            obj = new Edit("edtBirth", "absolute", "115", "35", "140", "21", null, null, this.divInfo.divChgInfo);
            obj.set_taborder("50");
            obj.set_enable("false");
            obj.set_inputtype("digit");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("6");
            this.divInfo.divChgInfo.addChild(obj.name, obj);
            obj = new Button("btn_File", "absolute", "1021", "35", "77", "21", null, null, this.divInfo.divChgInfo);
            obj.set_taborder("51");
            obj.set_text("파일첨부");
            obj.getSetter("domainId").set("nexa.s_condition");
            obj.set_enable("false");
            this.divInfo.divChgInfo.addChild(obj.name, obj);
            obj = new Edit("fileList", "absolute", "849", "35", null, "21", "103", null, this.divInfo.divChgInfo);
            obj.set_taborder("52");
            this.divInfo.divChgInfo.addChild(obj.name, obj);
            obj = new Static("st_searchCondition03", "absolute", "1", "60", "110", "31", null, null, this.divInfo.divChgInfo);
            obj.set_taborder("56");
            obj.set_text("계좌인증");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.divInfo.divChgInfo.addChild(obj.name, obj);
            obj = new Static("st_searchCondition05", "absolute", "368", "60", "110", "31", null, null, this.divInfo.divChgInfo);
            obj.set_taborder("57");
            obj.set_text("이체동의");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.divInfo.divChgInfo.addChild(obj.name, obj);
            obj = new Button("btn_arsCall", "absolute", "483", "65", "77", "21", null, null, this.divInfo.divChgInfo);
            obj.set_taborder("58");
            obj.set_text("출금이체동의");
            obj.set_enable("false");
            obj.getSetter("domainId").set("nexa.save");
            this.divInfo.divChgInfo.addChild(obj.name, obj);
            obj = new MaskEdit("ed_mobNo", "absolute", "850", "65", "124", "21", null, null, this.divInfo.divChgInfo);
            obj.set_taborder("59");
            obj.set_type("string");
            obj.set_mask("###-####-####");
            obj.set_enable("false");
            this.divInfo.divChgInfo.addChild(obj.name, obj);
            obj = new Static("st_mobNo", "absolute", "735", "60", "110", "31", null, null, this.divInfo.divChgInfo);
            obj.set_taborder("60");
            obj.set_text("휴대폰");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.divInfo.divChgInfo.addChild(obj.name, obj);
            obj = new Radio("ra_certification", "absolute", "972", "66", "124", "20", null, null, this.divInfo.divChgInfo);
            this.divInfo.divChgInfo.addChild(obj.name, obj);
            obj.set_taborder("61");
            obj.set_innerdataset("ds_certification");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_direction("vertical");
            obj.set_enable("false");
            obj.set_visible("false");
            obj = new WebBrowser("nice_interface", "absolute", "1027", "64", "124", "24", null, null, this.divInfo.divChgInfo);
            obj.set_taborder("62");
            obj.set_url("https://portal.tirerental.co.kr/interface/di_safekey/main.jsp");
            obj.set_visible("false");
            this.divInfo.divChgInfo.addChild(obj.name, obj);
            obj = new Button("btn_certification", "absolute", "980", "65", "41", "21", null, null, this.divInfo.divChgInfo);
            obj.set_taborder("63");
            obj.set_text("인증");
            obj.set_enable("false");
            obj.getSetter("domainId").set("nexa.save");
            this.divInfo.divChgInfo.addChild(obj.name, obj);
            obj = new Div("divChgInfo2", "absolute", "0", "120", "1102", "122", null, null, this.divInfo);
            obj.set_taborder("0");
            obj.set_scrollbars("none");
            obj.set_visible("false");
            this.divInfo.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "0", "90", "1102", "31", null, null, this.divInfo.divChgInfo2);
            obj.set_taborder("58");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.divInfo.divChgInfo2.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "0", "0", "1102", "31", null, null, this.divInfo.divChgInfo2);
            obj.set_taborder("54");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.divInfo.divChgInfo2.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "0", "30", "1102", "31", null, null, this.divInfo.divChgInfo2);
            obj.set_taborder("55");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.divInfo.divChgInfo2.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "0", "60", "1102", "31", null, null, this.divInfo.divChgInfo2);
            obj.set_taborder("57");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.divInfo.divChgInfo2.addChild(obj.name, obj);
            obj = new Static("st_searchCondition10", "absolute", "368", "30", "110", "31", null, null, this.divInfo.divChgInfo2);
            obj.set_taborder("29");
            obj.set_text("법정생년월일");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.divInfo.divChgInfo2.addChild(obj.name, obj);
            obj = new Static("st_searchCondition09", "absolute", "368", "0", "110", "31", null, null, this.divInfo.divChgInfo2);
            obj.set_taborder("30");
            obj.set_text("카드주명");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.divInfo.divChgInfo2.addChild(obj.name, obj);
            obj = new Edit("edtResultContents", "absolute", "482", "65", null, "21", "262", null, this.divInfo.divChgInfo2);
            obj.set_taborder("31");
            obj.set_enable("false");
            obj.set_autoskip("false");
            this.divInfo.divChgInfo2.addChild(obj.name, obj);
            obj = new Edit("edtDepositor", "absolute", "482", "5", "140", "21", null, null, this.divInfo.divChgInfo2);
            obj.set_taborder("32");
            obj.set_enable("false");
            this.divInfo.divChgInfo2.addChild(obj.name, obj);
            obj = new Edit("edtCardNo", "absolute", "114", "35", "140", "21", null, null, this.divInfo.divChgInfo2);
            obj.set_taborder("33");
            obj.set_enable("false");
            obj.set_inputtype("digit");
            this.divInfo.divChgInfo2.addChild(obj.name, obj);
            obj = new Static("st_searchCondition01", "absolute", "0", "30", "110", "31", null, null, this.divInfo.divChgInfo2);
            obj.set_taborder("34");
            obj.set_text("카드번호");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.divInfo.divChgInfo2.addChild(obj.name, obj);
            obj = new Static("st_searchCondition00", "absolute", "0", "0", "110", "31", null, null, this.divInfo.divChgInfo2);
            obj.set_taborder("35");
            obj.set_text("카드사");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.divInfo.divChgInfo2.addChild(obj.name, obj);
            obj = new Combo("cmbCard", "absolute", "114", "5", "140", "21", null, null, this.divInfo.divChgInfo2);
            this.divInfo.divChgInfo2.addChild(obj.name, obj);
            obj.set_taborder("36");
            obj.set_innerdataset("@dsR002");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj.set_enable("false");
            obj.set_value("-1");
            obj.set_text("선택");
            obj.set_displaynulltext("선택");
            obj.set_index("0");
            obj = new Static("st_searchCondition02", "absolute", "0", "90", "110", "31", null, null, this.divInfo.divChgInfo2);
            obj.set_taborder("37");
            obj.set_text("신청서선택");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.divInfo.divChgInfo2.addChild(obj.name, obj);
            obj = new Static("st_searchCondition04", "absolute", "735", "30", "110", "31", null, null, this.divInfo.divChgInfo2);
            obj.set_taborder("38");
            obj.set_text("사업자번호");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.divInfo.divChgInfo2.addChild(obj.name, obj);
            obj = new Button("btn_BatchKey", "absolute", "843", "94", "106", "21", null, null, this.divInfo.divChgInfo2);
            obj.set_taborder("39");
            obj.set_text("BatchKey 생성");
            obj.getSetter("domainId").set("nexa.save");
            obj.set_enable("false");
            this.divInfo.divChgInfo2.addChild(obj.name, obj);
            obj = new MaskEdit("maeBusiNo", "absolute", "849", "35", "100", "21", null, null, this.divInfo.divChgInfo2);
            obj.set_taborder("41");
            obj.set_type("string");
            obj.set_mask("###-##-#####");
            obj.set_enable("false");
            this.divInfo.divChgInfo2.addChild(obj.name, obj);
            obj = new Static("st_searchCondition05", "absolute", "0", "60", "110", "31", null, null, this.divInfo.divChgInfo2);
            obj.set_taborder("43");
            obj.set_text("유효년월");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.divInfo.divChgInfo2.addChild(obj.name, obj);
            obj = new Edit("edtYear", "absolute", "114", "65", "60", "21", null, null, this.divInfo.divChgInfo2);
            obj.set_taborder("44");
            obj.set_inputtype("digit");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("4");
            obj.set_enable("false");
            obj.set_autoskip("true");
            this.divInfo.divChgInfo2.addChild(obj.name, obj);
            obj = new Edit("edtMonth", "absolute", "204", "65", "40", "21", null, null, this.divInfo.divChgInfo2);
            obj.set_taborder("45");
            obj.set_inputtype("digit");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("2");
            obj.set_enable("false");
            obj.set_autoskip("true");
            this.divInfo.divChgInfo2.addChild(obj.name, obj);
            obj = new Static("st_searchCondition06", "absolute", "178", "65", "20", "20", null, null, this.divInfo.divChgInfo2);
            obj.set_taborder("46");
            obj.set_text("년");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.divInfo.divChgInfo2.addChild(obj.name, obj);
            obj = new Static("st_searchCondition07", "absolute", "248", "65", "20", "20", null, null, this.divInfo.divChgInfo2);
            obj.set_taborder("47");
            obj.set_text("월");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.divInfo.divChgInfo2.addChild(obj.name, obj);
            obj = new Static("st_searchCondition11", "absolute", "368", "60", "110", "31", null, null, this.divInfo.divChgInfo2);
            obj.set_taborder("48");
            obj.set_text("인증결과내용");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.divInfo.divChgInfo2.addChild(obj.name, obj);
            obj = new Static("st_searchCondition12", "absolute", "368", "90", "110", "31", null, null, this.divInfo.divChgInfo2);
            obj.set_taborder("49");
            obj.set_text("Batch Key");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.divInfo.divChgInfo2.addChild(obj.name, obj);
            obj = new Edit("edtBatchKey", "absolute", "482", "95", null, "21", "262", null, this.divInfo.divChgInfo2);
            obj.set_taborder("50");
            obj.set_enable("false");
            obj.set_autoskip("false");
            this.divInfo.divChgInfo2.addChild(obj.name, obj);
            obj = new Edit("edtBirth", "absolute", "482", "35", "140", "21", null, null, this.divInfo.divChgInfo2);
            obj.set_taborder("51");
            obj.set_inputtype("digit");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("6");
            obj.set_enable("false");
            this.divInfo.divChgInfo2.addChild(obj.name, obj);
            obj = new Edit("fileList", "absolute", "114", "95", "169", "21", null, null, this.divInfo.divChgInfo2);
            obj.set_taborder("52");
            this.divInfo.divChgInfo2.addChild(obj.name, obj);
            obj = new Button("btn_File", "absolute", "287", "95", "77", "21", null, null, this.divInfo.divChgInfo2);
            obj.set_taborder("53");
            obj.set_text("파일첨부");
            obj.getSetter("domainId").set("nexa.s_condition");
            obj.set_enable("false");
            this.divInfo.divChgInfo2.addChild(obj.name, obj);

            obj = new CheckBox("ch_resultArsCall", "absolute", "986", "232", "125", "16", null, null, this);
            obj.set_taborder("36");
            obj.set_text("출금이체동의여부");
            obj.set_value("0");
            obj.set_truevalue("1");
            obj.set_falsevalue("0");
            obj.set_enable("false");
            obj.set_visible("false");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1102, 45, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("9");
            		p.set_text("Div00");
            		p.set_cssclass("div_WF_searchBg");
            		p.set_scrollbars("none");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1102, 32, this.divInfo.divChgCmInfo,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("1");
            		p.set_text("Div00");
            		p.set_scrollbars("none");

            	}
            );
            this.divInfo.divChgCmInfo.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1016, 145, this.divInfo.divChgInfo,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("2");
            		p.set_text("Div00");
            		p.set_scrollbars("none");

            	}
            );
            this.divInfo.divChgInfo.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1016, 160, this.divInfo.divChgInfo2,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("0");
            		p.set_scrollbars("none");
            		p.set_visible("false");

            	}
            );
            this.divInfo.divChgInfo2.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1102, 269, this.divInfo,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("16");
            		p.set_text("Div00");

            	}
            );
            this.divInfo.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1122, 510, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("Authority");
            		p.getSetter("inheritanceid").set("");
            		p.set_titletext("결제방법 및 결제일 변경");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item0","div_search.edt_ordNo","value","ds_Search","SEARCH_KEYWORD");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item1","div_search.edt_custNoKeyword","value","ds_Search","SEARCH_KEYWORD");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item2","div_search.edt_custNo","value","ds_Search","SEARCH_KEYWORD");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item3","divInfo.divChgCmInfo.cmbPaymentDay","value","ds_chgInfo","payDd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item4","divInfo.divChgCmInfo.cmbPayment","value","ds_chgInfo","payMthd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item5","divInfo.divChgCmInfo.cmbGubun","value","ds_chgInfo","custTp");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item6","divInfo.divChgInfo.cmbBank","value","ds_chgInfo","bankCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item7","divInfo.divChgInfo.edtDepositor","value","ds_chgInfo","depositor");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item8","divInfo.divChgInfo.edtAccNo","value","ds_chgInfo","acctNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item9","divInfo.divChgInfo.edtBirth","value","ds_chgInfo","ebirDay");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item10","divInfo.divChgInfo.maeBusiNo","value","ds_chgInfo","buslNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item11","divInfo.divChgInfo2.cmbCard","value","ds_chgInfo","cardcomCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item12","divInfo.divChgInfo2.edtDepositor","value","ds_chgInfo","depositor");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item13","divInfo.divChgInfo2.edtCardNo","value","ds_chgInfo","cardNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item14","divInfo.divChgInfo2.edtBirth","value","ds_chgInfo","ebirDay");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item15","divInfo.divChgInfo2.maeBusiNo","value","ds_chgInfo","buslNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item16","divInfo.divChgInfo2.edtYear","value","ds_chgInfo","expireY");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item17","divInfo.divChgInfo2.edtMonth","value","ds_chgInfo","expireM");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item20","divInfo.divChgInfo2.edtBatchKey","value","ds_chgInfo","batchKey");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item18","divInfo.divChgInfo.edtAccConfirm","value","ds_chgInfo","accChk");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item32","divInfo.divChgInfo.ed_mobNo","value","ds_chgInfo","mobNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item41","divInfo.divChgInfo.ra_certification","value","ds_chgInfo","certCd");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        
        this.loadPreloadList = function()
        {
            this._addPreloadList("data", "", "ds_chgInfo");
        };
        
        // User Script
        this.addIncludeScript("RTREPayment_tab1.xfdl", "lib::comLib.xjs");
        this.registerScript("RTREPayment_tab1.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분 : 수금관리 > 결제정보관리 > 결제정보관리 > 결제정보변경 > 결제방법 및 결제일 변경
         * 02. 그룹명   : RTREPayment_tab1.xfdl
         * 03. 그룹설명 : 리스트=> 암호화-카드번호, 암호화-계좌번호
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
        this.nToRow 	= "";		//선택ROW
        this.sCustNo	= "";		//고객번호
        this.sGubun		= ""; 		//구분
        this.bBtnFlag 	= false; 	//저장버튼 활성화FLAG
        this.bNewFlag 	= false;  	//신규구분
        this.bChkFlag 	= true;  	//인증구분
        this.bChkVal  	= 'N';  	//인증구분값
        this.toDay 		= ""; 		//현재날짜
        this.sPayDd		= "";		//선택팝업에서 조회된 결제일
        this.attchFlSeq = "";		//첨부파일SEQ
        this.prgmCd 	= "";		//프로그램CD
        this.dvsn 		= "I";
        this.certificationFlag	= false;
        	/***********************************************************************
        	 * 그룹 변수 선언부
        	 ************************************************************************/

            //-------------------------------------------------------------------------------   
        	//폼로드시 공통함수      
        	//-------------------------------------------------------------------------------  	 
        	this.form_onload = function(obj,e)
        	{
        		Ex.core.init(obj); 	

        		this.setBtnAuth(this.div_search);			
        		this.fn_getCodeInfo();
        		//오늘날짜조회
        		this.fn_getToday();
        		if(this.parent.p_arg=="RTCSAdviceStatus"){
        			if(this.parent.p_custNo!=""){
        				this.div_search.edt_custNo.set_value(nvl(this.parent.p_custNo));
        				this.fn_search(); 			
        			}
         		}
        	} 
        		 
        	/***********************************************************************************
        	* Transaction Function
        	***********************************************************************************/
            //-------------------------------------------------------------------------------  	
        	//오늘날짜 조회
            //-------------------------------------------------------------------------------  	
        	this.fn_getToday = function() 
        	{
        		var sSvcID      	= "getToday";  
        		var sController   	= "/rtms/comm/getToday.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";

        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 	
        	}		
            //-------------------------------------------------------------------------------  	
        	//공통코드 조회
            //-------------------------------------------------------------------------------  	
        	this.fn_getCodeInfo = function() 
        	{
        		var sSvcID      	= "getCodeInfo";  
        		var sController   	= "ntrms/re/getCodeInfo.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "dsS024=outputS024 dsR001=outputR001 dsR002=outputR002 dsR004=outputR004 dsR005=outputR005 dsR006=outputR006 ds_certification=mapDsCertification";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 	
        	}
            //-------------------------------------------------------------------------------  	
        	//조회
            //-------------------------------------------------------------------------------  	
        	this.fn_search = function() 
        	{
        		this.divInfo.divChgInfo.fileList.set_value("");
        		this.divInfo.divChgInfo2.fileList.set_value("");
        		this.ds_List.clearData();
        		this.ds_chgInfo.clearData();
        		this.fn_DisableBtn();
        		this.div_search.btn_save.set_enable(false);			
        		this.div_search.btn_Delete.set_enable(false);			
        		
        		
        		if(nvl(this.div_search.edt_ordNo.value) == "" && nvl(this.div_search.edt_custNo.value) == "") 
        		{
        			this.alert("조회조건을 입력하세요.");
        			return;
        		}
        		else 
        		{
        			var sSvcID        	= "listPayInfo";                    
        			var sController   	= "ntrms/re/listPayInfo.do";
        			var sInDatasets   	= "";
        			var sOutDatasets  	= "ds_List=output";
        			var sArgs 			= "";	
        			var fn_callBack		= "fn_callBack";
        			
        			var srchOrdNo  	= this.div_search.edt_ordNo.value;
        			var srchCustNo  = this.div_search.edt_custNo.value;
        			
        			sArgs += Ex.util.setParam("ordNo", nvl(srchOrdNo));
        			sArgs += Ex.util.setParam("custNo", nvl(srchCustNo));
        			
        			Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 		
        		}
        	}
            //-------------------------------------------------------------------------------  	
        	//저장
            //-------------------------------------------------------------------------------  	
        	this.fn_save = function(obj,e)
        	{
        		this.fn_makeSaveData();
        		if(this.fn_validCheck()) 
        		{
        			var sSvcID        	= "savePaymentInfo";                    
        			var sController   	= "ntrms/re/savePaymentInfo.do";
        			var sInDatasets   	= "";
        			var sOutDatasets  	= "";
        			var sArgs 			= "dvsn=" + nvl(this.dvsn) + " prgmCd=" + nvl(this.prgmCd) + " attchFlSeq=" + nvl(this.attchFlSeq);

        			sInDatasets   		= "userFile=dsFile input=dsInList:U";
        			//var sArgs 			= "";			
        			//sInDatasets   		= "input=dsInList:U";
        			sOutDatasets  		= "";
        			var fn_callBack		= "fn_callBack";
        			Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);	
        		}

        	}	
            //-------------------------------------------------------------------------------  	
        	//삭제
            //-------------------------------------------------------------------------------  		
        	this.fn_Delete = function(obj,e)
        	{
        		if(Ex.core.comMsg("confirm","삭제하시겠습니까?"))
        		{		
        			this.ds_delInfo.clearData();
        			var nRow = this.ds_delInfo.addRow();
        			this.ds_delInfo.setColumn(nRow,"ordNo", this.ds_List.getColumn(this.ds_List.rowposition, "ordNo"));
        			this.ds_delInfo.setColumn(nRow,"delTp", this.ds_List.getColumn(this.ds_List.rowposition, "deleteTp"));			

        			var sSvcID        	= "delPaymentInfo";                    
        			var sController   	= "ntrms/re/delPaymentInfo.do";
        			var sInDatasets   	= "";
        			var sOutDatasets  	= "";
        			var sArgs 			= "";	
        			sInDatasets   		= "input=ds_delInfo:U";
        			sOutDatasets  		= "";
        			var fn_callBack		= "fn_callBack";
        			
        			//sArgs += Ex.util.setParam("ordNo", this.ds_List.getColumn(this.ds_List.rowposition, "ordNo"));	
        			//sArgs += Ex.util.setParam("delTp", this.ds_List.getColumn(this.ds_List.rowposition, "deleteTp"));	
        			//alert(this.ds_delInfo.saveXML());
        			Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);	
        		}			
        	}	
        	/***********************************************************************************
        	* CallBack Event (strSvcId - Sevice ID, nErrorCode - ErrorCode, strErrorMsg - Error Message)
        	***********************************************************************************/
            //-------------------------------------------------------------------------------  	
        	// callBack함수 
            //-------------------------------------------------------------------------------  	
        	this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg)
        	{	 
        		if (nErrorCode != 0) 
        		{
        			if(strSvcId == "batchService") {
        				this.bChkVal =  'N';
        				this.div_search.btn_save.set_enable(false);
        				return;
        			}
        			if(strSvcId == "kftcCmsDocInfo") {
        				this.bChkVal =  'N';
        				this.divInfo.divChgInfo.edtAccConfirm.set_value("N");
        				this.div_search.btn_save.set_enable(false);
        				return;
        			}	
        			if(strSvcId == "arsCallService") {
        				this.alert("출금이체동의에 실패하였습니다.\n["+strErrorMsg+"]");
        				this.ch_resultArsCall.set_value(false);
        				return;
        			}	
        			if(strSvcId == "insertRtsd0110"){
        				this.alert("본인인증을 실패하였습니다.");
        				this.certificationFlag	= false;	
        				return;
        			}							
        			
        			return Ex.core.comMsg("alert",strErrorMsg);		
        		}
        		
        		switch (strSvcId) 
        		{
        			case "getCodeInfo":
        				break;
        			case "listPayInfo":
        				this.fn_listResultPost();
        				break;
        			case "savePaymentInfo":
        				Ex.core.comMsg("alert",strErrorMsg);	
        				this.fn_search();
        				break;			
        			case "listCustInfo":
        				if(this.ds_cust.rowcount > 0 ) {
        					this.div_search.edt_custNoKeyword.set_value(this.ds_cust.getColumn(0, "custNm"));
        					this.fn_search();
        				}	
        				break;	
        			case "delPaymentInfo":
        				Ex.core.comMsg("alert",strErrorMsg);
        				this.fn_search();
        				break;	
        			//카드인증	
        			case "batchService":	
        				//Ex.core.comMsg("alert",strErrorMsg);	
        				
        				this.divInfo.divChgInfo2.edtResultContents.set_value(this.dsBatch.getColumn(0,"res_cd") + " : " + this.dsBatch.getColumn(0,"res_msg"));
        				this.divInfo.divChgInfo2.edtBatchKey.set_value(this.dsBatch.getColumn(0,"batchKey"));
        				
        				//정상일경우
        				if(nvl(this.dsBatch.getColumn(0,"res_cd")) == "0000") {
        					this.bChkVal =  'Y';
        				}
        				else {
        					this.bChkVal =  'N';
        					this.div_search.btn_save.set_enable(false);
        				}
        				
        				if(nvl(this.dsBatch.getColumn(0,"cardcomCd")) != "") {
        					this.divInfo.divChgInfo2.cmbCard.set_value(this.dsBatch.getColumn(0,"cardcomCd"));
        				}
        				this.saveBatchResult();
        				break;
        			case "batchResultService":
        				break;
        			//계좌인증	
        			case "kftcCmsDocInfo":	
        				if(nvl(this.dsBatch.getColumn(0,"returnCode")) == "0000") {
        					alert('계좌인증 성공');
        					this.divInfo.divChgInfo.edtAccConfirm.set_value("Y");
        					this.bChkVal =  'Y';
        				}
        				else {
        					alert('계좌인증 실패');
        					this.bChkVal =  'N';
        					this.divInfo.divChgInfo.edtAccConfirm.set_value("N");
        					this.div_search.btn_save.set_enable(false);				
        				}
        				break;		
        			case "arsCallService":
        				this.alert(strErrorMsg);
        				this.ch_resultArsCall.set_value(true);
        				this.divInfo.divChgInfo.cmbBank.set_enable(false);
        				this.divInfo.divChgInfo.edtAccNo.set_enable(false);
        				break;
        			case "insertRtsd0110":
        				this.alert("본인인증을 성공하였습니다.");
        				this.certificationFlag	= true;		
        				break;
        			
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
        	//계약번호  Enter키 이벤트 처리
            //-------------------------------------------------------------------------------  	
        	this.edt_ordNo_onkeyup = function(obj,e)
        	{
        		if ( e.keycode == 13 )
        		{
        			if(nvl(this.div_search.edt_ordNo.value) == "") {
        				this.alert("계약번호를 입력하세요");
        				this.div_search.edt_ordNo.setFocus();
        				return;
        			}
        			this.fn_search();
        		}		
        	}
        		
            //-------------------------------------------------------------------------------  	
        	//고객번호  Enter키 이벤트 처리
            //-------------------------------------------------------------------------------  	
        	this.custNo_onkeyup = function(obj,e)
        	{
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
        	
            //-------------------------------------------------------------------------------  
        	//결제방법 변경 이벤트
        	//-------------------------------------------------------------------------------  
        	this.cmbPayment_onitemchanged = function(obj,e)
        	{
        		this.divInfo.divChgInfo2.edtResultContents.set_value("");	
        		if(nvl(this.ds_List.getColumn(this.ds_List.rowposition, "payMthd")) != nvl(this.ds_chgInfo.getColumn(0,"payMthd")))
        		{
        			this.bNewFlag = true;
        			this.bChkFlag = false;	
        			this.bChkVal =  'N';						
        		}
        		else 
        		{
        			this.bNewFlag = false;
        			this.bChkFlag = true;
        			this.bChkVal =  'Y';				
        		}	
        		
        		//변경데이터초기화
        		this.fn_setInitObj();
        		this.fn_chgDiv(obj);
        		this.fn_BirthEnable(this.divInfo.divChgCmInfo.cmbGubun.value);		
        	}
            //-------------------------------------------------------------------------------  	
        	//계좌인증 버튼 클릭 이벤트
            //-------------------------------------------------------------------------------  	
        	this.btn_AccConfirm_onclick = function(obj,e)
        	{
        		var btn_nm = obj.id;
        		this.fn_accConfirm(btn_nm);
        	}
            //-------------------------------------------------------------------------------  
        	//BatchKey생성 버튼 클릭 이벤트
            //-------------------------------------------------------------------------------  	
        	this.btn_batchKeyConfirm_onclick = function(obj,e)
        	{
        		this.fn_crdConfirm();
        	}	
        	
            //-------------------------------------------------------------------------------  	
        	//결제방법 버튼 클릭
            //-------------------------------------------------------------------------------  	
        	this.btn_PayPop_onclick = function(obj,e)
        	{
        		var popUrl;
        		var popTitle;
        	
        		if(nvl(this.divInfo.divChgCmInfo.cmbPayment.value) == "") 
        		{
        			this.alert("결제방법을 선택하세요");
        			this.divInfo.divChgCmInfo.cmbPayment.setFocus();
        			return false;
        		}
        			
        		//CMS
        		if(this.divInfo.divChgCmInfo.cmbPayment.value == "A")
        		{
        			popUrl = "comm::RTCOMMAccount_pop.xfdl";
        			popTitle ="계좌선택";
        		}
        		//카드이체
        		if(this.divInfo.divChgCmInfo.cmbPayment.value == "C")
        		{
        			popUrl = "comm::RTCOMMCard_pop.xfdl";	
        			popTitle ="카드선택"				
        		}		
        		var args ={p_gubun:this.divInfo.divChgCmInfo.cmbPayment.value, p_toRow:this.nToRow, p_custNo:this.ds_List.getColumn(this.ds_List.rowposition, "custNo")};
        		Ex.core.popup(this,popTitle,popUrl,args,"modaless=false,width=820,height=480");	
        	}
        	
            //-------------------------------------------------------------------------------  
        	//구분값 변경에 따른 처리
            //-------------------------------------------------------------------------------  	
        	this.cmbGubun_onitemchanged = function(obj,e)
        	{
        		this.fn_BirthEnable(obj.value);
        	}	
            //-------------------------------------------------------------------------------  
        	//검색결과 그리드 클릭
            //-------------------------------------------------------------------------------  		
        	this.grdList_oncellclick = function(obj,e)
        	{
        		this.divInfo.divChgInfo.fileList.set_value("");
        		this.divInfo.divChgInfo2.fileList.set_value("");
        		this.divInfo.divChgInfo2.edtResultContents.set_value("");	
        		//삭제버튼 활성화처리
        		this.fn_EnDelBtn(e.row);
        		
        		this.bNewFlag = false;
        		this.bChkFlag = true;		
        		this.bChkVal =  'Y';
        		this.fn_setInitObj();
        		//신규버튼 활성화
        		this.fn_EnableBtn();
        		//변경할내용세팅			
        		this.ds_chgInfo.clearData();		
        		var nRow = this.ds_chgInfo.addRow();
        		this.ds_chgInfo.copyRow(nRow,this.ds_List, this.ds_List.rowposition);
        		this.fn_chgDiv(this.divInfo.divChgCmInfo.cmbPayment);
        		this.sPayDd = this.ds_List.getColumn(this.ds_List.rowposition,"payDd");
        		for(var i=0; i<this.ds_chgInfo.rowcount; i++) {
        			this.ds_chgInfo.setColumn(i,"payDd",this.ds_List.getColumn(this.ds_List.rowposition,"payDd"));
        		}
        		
        		this.fn_setObjDisable();			
        	}
            //-------------------------------------------------------------------------------  
        	//카드회사 변경시 이벤트
            //------------------------------------------------------------------------------- 	
        	this.cmbCard_onitemchanged = function(obj,e)
        	{
        		if(nvl(this.ds_List.getColumn(this.ds_List.rowposition, "cardcomCd")) != nvl(this.ds_chgInfo.getColumn(0,"cardcomCd")))
        		{
        			this.bNewFlag = true;
        			this.bChkFlag = false;
        			this.bChkVal =  'N';
        		}
        		else 
        		{
        			this.bNewFlag = false;
        			this.bChkFlag = true;
        			this.bChkVal =  'N';
        		}	
        		this.divInfo.divChgInfo2.edtCardNo.set_value("");
        		this.divInfo.divChgInfo2.edtYear.set_value("");
        		this.divInfo.divChgInfo2.edtMonth.set_value("");
        	}	
            //-------------------------------------------------------------------------------  
        	//은행 변경시 이벤트
            //------------------------------------------------------------------------------- 	
        	this.cmbBank_onitemchanged = function(obj,e)
        	{
        		if(nvl(this.ds_List.getColumn(this.ds_List.rowposition, "bankCd")) != nvl(this.ds_chgInfo.getColumn(0,"bankCd")))
        		{
        			this.bNewFlag = true;
        			this.bChkFlag = false;
        			this.bChkVal =  'N';
        		}
        		else 
        		{
        			this.bNewFlag = false;
        			this.bChkFlag = true;
        			this.bChkVal =  'Y';
        		}
        		
        		this.divInfo.divChgInfo.edtAccNo.set_value("");
        	}    
            //-------------------------------------------------------------------------------  
        	//계좌번호 변경시 이벤트
            //------------------------------------------------------------------------------- 	
        	this.edtAccNo_onkillfocus = function(obj,e)
        	{
        		if(nvl(this.ds_List.getColumn(this.ds_List.rowposition, "acctNo")) != nvl(this.ds_chgInfo.getColumn(0,"acctNo")))
        		{
        			this.bNewFlag = true;
        			this.bChkFlag = false;			
        			this.bChkVal =  'N';			
        		}
        		else {
        			this.bNewFlag = false;
        			this.bChkFlag = true;		
        			this.bChkVal =  'Y';					
        		}	
        	}
            //-------------------------------------------------------------------------------  
        	//카드번호 변경시 이벤트
            //------------------------------------------------------------------------------- 	
        	this.edtCardNo_onkillfocus = function(obj,e)
        	{
        		if(nvl(this.ds_List.getColumn(this.ds_List.rowposition, "cardNo")) != nvl(this.ds_chgInfo.getColumn(0,"cardNo")))
        		{
        			this.bNewFlag = true;
        			this.bChkFlag = false;		
        			this.bChkVal =  'N';					
        		}
        		else {
        			this.bNewFlag = false;
        			this.bChkFlag = true;	
        			this.bChkVal =  'Y';							
        		}		
        	}	
            //-------------------------------------------------------------------------------  
        	//결제일 변경시 이벤트
            //------------------------------------------------------------------------------- 	
        	this.cmbPaymentDay_onitemchanged = function(obj,e)
        	{
        		/*
        		if(!this.bNewFlag)
        		{
        			if(nvl(this.ds_List.getColumn(this.ds_List.rowposition, "payDd")) != nvl(this.ds_chgInfo.getColumn(0,"payDd")))
        			{
        				this.bChkFlag = true;
        				this.bChkVal =  'Y';					
        			}
        		}
        		else 
        		{
        			if(nvl(this.ds_List.getColumn(this.ds_List.rowposition, "payDd")) != nvl(this.ds_chgInfo.getColumn(0,"payDd")))
        			{
        				this.bChkFlag = false;
        				this.bChkVal =  'N';
        			}
        		}
        		*/	
        		this.bNewFlag = true;		
        		this.bChkFlag = false;
        		this.bChkVal =  'N';
        		
        		//결제방법(CMS)
        		if(this.divInfo.divChgCmInfo.cmbPayment.value == "A") 
        		{				
        			this.divInfo.divChgInfo.edtAccConfirm.set_value("");
        		}
        		//결제방법(카드이체)
        		if(this.divInfo.divChgCmInfo.cmbPayment.value == "C") 
        		{	
        			this.divInfo.divChgInfo2.edtResultContents.set_value("");				
        			this.divInfo.divChgInfo2.edtBatchKey.set_value("");
        		}		
        	}
            //-------------------------------------------------------------------------------  
        	//사업자번호 변경시 이벤트(CMS)
            //------------------------------------------------------------------------------- 		
        /*    
        	this.divChgInfo_maeBusiNo_onchanged = function(obj:MaskEdit, e:nexacro.ChangeEventInfo)
        	{
        		var checkBuslNo = FN_buslNoCheck(this.divInfo.divChgInfo.maeBusiNo.value)//comLib 사업자번호체크
        		if(!checkBuslNo){
        			alert("사업자번호를 확인하세요.");
        			this.divInfo.divChgInfo.maeBusiNo.setFocus();
        		}	
        	}	
            //-------------------------------------------------------------------------------  
        	//사업자번호 변경시 이벤트(카드)
            //------------------------------------------------------------------------------- 	
        	this.divChgInfo2_maeBusiNo_onchanged = function(obj:MaskEdit, e:nexacro.ChangeEventInfo)
        	{
        		var checkBuslNo = FN_buslNoCheck(this.divInfo.divChgInfo2.maeBusiNo.value)//comLib 사업자번호체크
        		if(!checkBuslNo){
        			alert("사업자번호를 확인하세요.");
        			this.divInfo.divChgInfo2.maeBusiNo.setFocus();
        		}			
        	}
        */	

        		
        	//--------------------------------------------------------------------
        	// 생년월일 변경시 이벤트(CMS)
        	//--------------------------------------------------------------------
        /*	
        	this.divChgInfo_edtBirth_onchanged = function(obj:Edit, e:nexacro.ChangeEventInfo)
        	{
        		if( !FN_YYMMDDCheck(this.divInfo.divChgInfo.edtBirth.value)){
        			alert('법정생년월일을 확인하세요');
        			this.divInfo.divChgInfo.edtBirth.setFocus();
        			return;
        		}	
        	}
        	
        	//--------------------------------------------------------------------
        	// 생년월일 변경시 이벤트(카드)
        	//--------------------------------------------------------------------	
        	this.divChgInfo2_edtBirth_onchanged = function(obj:Edit, e:nexacro.ChangeEventInfo)
        	{
        		if( !FN_YYMMDDCheck(this.divInfo.divChgInfo.edtBirth.value)){
        			alert('법정생년월일을 확인하세요');		
        			this.divInfo.divChgInfo.edtBirth.setFocus();
        			return;
        		}
        	}		
        */	
        	//--------------------------------------------------------------------
        	// ds_List_onrowposchanged 이벤트
        	//--------------------------------------------------------------------		
        	this.ds_List_onrowposchanged = function(obj,e)
        	{
        		this.div_search.btn_save.set_enable(false);	
        		//alert(this.ds_List.rowposition);
        	}	
        	/***********************************************************************************
        	* User Function
        	***********************************************************************************/
            //-------------------------------------------------------------------------------  
        	//결제방법 변경시 DIV 활성화
            //-------------------------------------------------------------------------------  	
        	this.fn_chgDiv = function(obj) 
        	{	
        		//CMS
        		//alert(obj.value);
        		if(obj.value == "A") {
        			this.divInfo.divChgCmInfo.cmbPaymentDay.set_innerdataset("dsR005");
        			this.divInfo.divChgInfo.set_visible(true);
        			this.divInfo.divChgInfo2.set_visible(false);
        		}
        		//카드이체
        		if(obj.value == "C") {
        			this.divInfo.divChgCmInfo.cmbPaymentDay.set_innerdataset("dsR006");
        			this.divInfo.divChgInfo.set_visible(false);
        			this.divInfo.divChgInfo2.set_visible(true);
        	
        			var nX = this.divInfo.divChgInfo.getOffsetTop();
        			this.divInfo.divChgInfo2.set_top(nX);			
        		}	
        		//this.divInfo.divChgCmInfo.cmbPaymentDay.set_value("");
        		
        		/*
        		var sGubun 	 = this.ds_List.getColumn(this.ds_List.rowposition, "custTp");
        		var sEbirDay = this.ds_List.getColumn(this.ds_List.rowposition, "ebirDay");
        		var sBuslNo  = this.ds_List.getColumn(this.ds_List.rowposition, "buslNo");
        		*/
        		var sGubun 	 	= this.ds_chgInfo.getColumn(0, "custTp");
        		var sGubun2  	= this.ds_chgInfo.getColumn(0, "pCustTp");
        		var custTp2  	= nvl(this.ds_List.getColumn(this.ds_List.rowposition, "custTp2"));
        		var sEbirDay 	= this.ds_chgInfo.getColumn(0, "ebirDay");
        		var sBuslNo  	= this.ds_chgInfo.getColumn(0, "buslNo");		
        		var sDepositor	= this.ds_chgInfo.getColumn(0, "depositor");
        		var sExpireYm 	= nvl(this.ds_chgInfo.getColumn(0,"expireYm"));
        		var sExpireY 	= "";
        		var sExpireM 	= "";
        		if(sExpireYm != "") 
        		{
        			if(sExpireYm.length == 6) 
        			{
        				sExpireY = sExpireYm.substr(0,4);
        				sExpireM = sExpireYm.substr(4,2);
        			}
        		}		
        		this.ds_chgInfo.setColumn(0,"expireY",sExpireY);
        		this.ds_chgInfo.setColumn(0,"expireM",sExpireM);
        		
        		//구분,법정생년월일,사업자번호,예금주, 카드주명 세팅		
        		this.divInfo.divChgCmInfo.cmbGubun.set_value(sGubun2);
        		
        		//개인사업자일경우 대표자의 법정생년월일로 세팅
        		if(custTp2 == "0002") {
        			var oBirthDay = this.ds_List.getColumn(this.ds_List.rowposition, "oBirthDay");
        			var oCustNm   = this.ds_List.getColumn(this.ds_List.rowposition, "oCustNm");

        			this.divInfo.divChgInfo.edtBirth.set_value(oBirthDay.substring(2,8));
        			this.divInfo.divChgInfo2.edtBirth.set_value(oBirthDay.substring(2,8));
        			
        			this.divInfo.divChgInfo.edtDepositor.set_value(oCustNm);
        			this.divInfo.divChgInfo2.edtDepositor.set_value(oCustNm);				
        		}
        		else {
        			this.divInfo.divChgInfo.edtBirth.set_value(this.ds_List.getColumn(this.ds_List.rowposition, "ebirDay"));
        			this.divInfo.divChgInfo2.edtBirth.set_value(this.ds_List.getColumn(this.ds_List.rowposition, "ebirDay"));
        			

        		}
        				
        		this.divInfo.divChgInfo.maeBusiNo.set_value(sBuslNo);
        		this.divInfo.divChgInfo2.maeBusiNo.set_value(sBuslNo);	
        		
        		//CMS
        		if(obj.value == "A") {	
        			//개인사업자일경우 대표자명으로 세팅
        			if(custTp2 == "0002") {		
        				var oCustNm   = this.ds_List.getColumn(this.ds_List.rowposition, "oCustNm");
        				this.divInfo.divChgInfo.edtDepositor.set_value(oCustNm);
        			}
        			else {
        				this.divInfo.divChgInfo.edtDepositor.set_value(this.ds_List.getColumn(this.ds_List.rowposition, "custNm"));
        			}
        		}
        		//카드이체
        		if(obj.value == "C") {
        			//개인사업자일경우 대표자명으로 세팅
        			if(custTp2 == "0002") {		
        				var oCustNm   = this.ds_List.getColumn(this.ds_List.rowposition, "oCustNm");
        				this.divInfo.divChgInfo2.edtDepositor.set_value(oCustNm);
        			}
        			else {
        				this.divInfo.divChgInfo2.edtDepositor.set_value(this.ds_List.getColumn(this.ds_List.rowposition, "custNm"));				
        			}
        		}
        		this.divInfo.divChgCmInfo.cmbPaymentDay.set_index(0);
        	}

            //-------------------------------------------------------------------------------  
        	//엑셀저장
            //-------------------------------------------------------------------------------  	
        	this.fn_excel = function(obj,e)
        	{
        		Ex.core.exportExcel(this, this.grdList, "리스트");
        	}
        	
            //-------------------------------------------------------------------------------  
        	//VALID 체크
            //-------------------------------------------------------------------------------  	
        	this.fn_validCheck = function() {
        	
        		var sExpireYm = nvl(this.divInfo.divChgInfo2.edtYear.value) + "" + nvl(this.divInfo.divChgInfo2.edtMonth.value);
        		
        		if(nvl(this.divInfo.divChgCmInfo.cmbPayment.value) == "") 
        		{
        			this.alert("결제방법을 선택하세요");
        			this.divInfo.divChgCmInfo.cmbPayment.setFocus();
        			return false;
        		}
        		else 
        		{
        			if(nvl(this.divInfo.divChgCmInfo.cmbPaymentDay.value) == "") 
        			{
        				this.alert("결제일을 선택하세요");
        				this.divInfo.divChgCmInfo.cmbPaymentDay.setFocus();
        				return false;
        			}
        			
        			if(nvl(this.divInfo.divChgCmInfo.cmbGubun.value) == "") 
        			{
        				this.alert("구분을 선택하세요");
        				this.divInfo.divChgCmInfo.cmbGubun.setFocus();
        				return false;
        			}
        			
        			//결제방법(CMS)
        			if(this.divInfo.divChgCmInfo.cmbPayment.value == "A") 
        			{
        				if(nvl(this.divInfo.divChgInfo.cmbBank.value) == "") 
        				{
        					this.alert("은행을 선택하세요");
        					this.divInfo.divChgInfo.cmbBank.setFocus();
        					return false;
        				}
        				if(nvl(this.divInfo.divChgInfo.edtAccNo.value) == "") 
        				{
        					this.alert("계좌번호를 입력하세요");
        					this.divInfo.divChgInfo.edtAccNo.setFocus();		
        					return false;
        				}		
        				if(nvl(this.divInfo.divChgInfo.edtDepositor.value) == "") 
        				{
        					this.alert("예금주명을 입력하세요");
        					this.divInfo.divChgInfo.edtDepositor.setFocus();
        					return false;
        				}							
        				if(nvl(this.divInfo.divChgCmInfo.cmbGubun.value) == "01") 	//개인
        				{
        					if(nvl(this.divInfo.divChgInfo.edtBirth.value) == "")
        					{
        						this.alert("법정생년월일을 입력하세요");
        						this.divInfo.divChgInfo.edtBirth.setFocus();
        						return false;
        					}
        					/*
        					if( !FN_YYMMDDCheck(this.divInfo.divChgInfo.edtBirth.value)){
        						alert('법정생년월일을 확인하세요');							
        						this.divInfo.divChgInfo.edtBirth.setFocus();
        						return false;
        					}
        					*/	
        				}
        				else //사업자
        				{
        					if(nvl(this.divInfo.divChgInfo.maeBusiNo.value) == "")
        					{
        						this.alert("사업자번호를 입력하세요");
        						this.divInfo.divChgInfo.maeBusiNo.setFocus();
        						return false;
        					}	
        					/*	
        					var checkBuslNo = FN_buslNoCheck(this.divInfo.divChgInfo.maeBusiNo.value)//comLib 사업자번호체크
        					if(!checkBuslNo){
        						alert("사업자번호를 확인하세요.");
        						this.divInfo.divChgInfo.maeBusiNo.setFocus();
        						return false;
        					}	
        					*/						
        				}						
        				
        				// 2016-06-8 이영근, ARS 출금동의 확인
        				var userId = application.gds_userInfo.getColumn(0, "userId");
        				if(this.ch_resultArsCall.value == "0" && userId != "rosso203" && userId != "kstka")
        				{
        					this.alert("출금이체동의 버튼을 클릭해주세요.");
        					this.divInfo.divChgInfo.btn_arsCall.setFocus();
        					return false;
        				}				
        			}
        			if(this.divInfo.divChgCmInfo.cmbPayment.value == "C")  //결제방법(카드이체)
        			{
        				if(nvl(this.divInfo.divChgInfo2.cmbCard.value) == "") 
        				{
        					this.alert("카드사를 선택하세요");
        					this.divInfo.divChgInfo2.cmbCard.setFocus();
        					return false;
        				}	
        				if(nvl(this.divInfo.divChgInfo2.edtCardNo.value) == "") 
        				{
        					this.alert("카드번호를 입력하세요");
        					this.divInfo.divChgInfo2.edtCardNo.setFocus();
        					return false;
        				}					
        				if(nvl(this.divInfo.divChgInfo2.edtYear.value) == "") 
        				{
        					this.alert("유효기간을 입력하세요");
        					this.divInfo.divChgInfo2.edtYear.setFocus();
        					return false;
        				}	
        				if(nvl(this.divInfo.divChgInfo2.edtMonth.value) == "") 
        				{
        					this.alert("유효기간을 입력하세요");
        					this.divInfo.divChgInfo2.edtMonth.setFocus();
        					return false;
        				}	
        				
        				if(!this.fn_chkExpireYm(this.divInfo.divChgInfo2.edtYear.value, this.divInfo.divChgInfo2.edtMonth.value))
        				{
        					this.alert("사용할수 없는 유효기간이 입력되었습니다.");
        					return false;
        				}
        				if(nvl(this.divInfo.divChgInfo2.edtDepositor.value) == "") 
        				{
        					this.alert("카드주명을 입력하세요");
        					this.divInfo.divChgInfo2.edtDepositor.setFocus();
        					return false;
        				}					
        				if(parseInt(sExpireYm) < parseInt(this.toDay.substring(0, 6)))
        				{
        					this.alert("유효기간은 현재 년, 월 보다 커야 합니다.");
        					this.divInfo.divChgInfo2.edtMonth.setFocus();						
        					return false;
        				}

        				if(nvl(this.divInfo.divChgCmInfo.cmbGubun.value) == "01") 	//개인
        				{
        					if(nvl(this.divInfo.divChgInfo2.edtBirth.value) == "")
        					{
        						this.alert("법정생년월일을 입력하세요");
        						this.divInfo.divChgInfo2.edtBirth.setFocus();
        						return false;
        					}
        					/*
        					if( !FN_YYMMDDCheck(this.divInfo.divChgInfo.edtBirth.value)){
        						alert('법정생년월일을 확인하세요');		
        						this.divInfo.divChgInfo2.edtBirth.setFocus();
        						return false;
        					}
        					*/	
        				}
        				else //사업자
        				{
        					if(nvl(this.divInfo.divChgInfo2.maeBusiNo.value) == "")
        					{
        						this.alert("사업자번호를 입력하세요");
        						this.divInfo.divChgInfo2.maeBusiNo.setFocus();
        						return false;
        					}			
        					/*			
        					var checkBuslNo = FN_buslNoCheck(this.divInfo.divChgInfo2.maeBusiNo.value)//comLib 사업자번호체크
        					if(!checkBuslNo){
        						alert("사업자번호를 확인하세요.");
        						this.divInfo.divChgInfo2.maeBusiNo.setFocus();
        						return false;
        					}
        					*/									
        				}														
        			}
        		}
        		//alert('this.bNewFlag > ' + this.bNewFlag);
        		//alert('this.bChkFlag > ' + this.bChkFlag);
        		if(this.bNewFlag)
        		{
        			if(!this.bChkFlag) 
        			{
        				if(this.ds_chgInfo.getColumn(0,"payMthd") == "A")
        				{
        					this.alert("계좌인증후 저장하세요.");
        					this.divInfo.divChgInfo.btn_AccConfirm.setFocus();
        					return false;
        				}
        				if(this.ds_chgInfo.getColumn(0,"payMthd") == "C")
        				{
        					this.alert("BatchKey 생성후 저장하세요.");
        					this.divInfo.divChgInfo2.btn_BatchKey.setFocus();
        					return false;
        				}
        			}
        		}
        		return true;
        	}
        	
            //-------------------------------------------------------------------------------  
        	//계악번호 팝업창
            //-------------------------------------------------------------------------------  	
        	this.fn_odrPopUp = function(obj,e)
        	{
        	  var args ={p_arg:""};
        	  Ex.core.popup(this,"계약번호찾기","comm::RTCOMMOrderNo_pop.xfdl",args,"modaless=false");			
        	}
        	
        	
            //-------------------------------------------------------------------------------  	
        	//고객번호 팝업창
            //-------------------------------------------------------------------------------  	
        	this.fn_custPopUp = function(obj,e)
        	{
        		var args ={p_formId:this.id, p_custNo:nvl(this.div_search.edt_custNo.value), p_custNm:nvl(this.div_search.edt_custNoKeyword.value)};
        		Ex.core.popup(this,"고객찾기","comm::RTCOMMCust_pop.xfdl",args, "modaless=false");
        	}

            //-------------------------------------------------------------------------------  	
        	//고객명 조회
            //-------------------------------------------------------------------------------  	
        	this.fn_getCustNm = function() {
        		var sSvcID        	= "listCustInfo";                    
        		var sController   	= "rtms/comm/listCustInfo.do";
        		var sInDatasets   	= "user_=ds_user";
        		var sOutDatasets  	= "ds_cust=mapCustInfo";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		sArgs += Ex.util.setParam("custNo", this.div_search.edt_custNo.value);			
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 	
        	}
            //-------------------------------------------------------------------------------  	
        	//신규
            //-------------------------------------------------------------------------------  	
        	this.fn_new = function() 
        	{
        		this.divInfo.divChgInfo2.edtResultContents.set_value("");	
        		this.div_search.btn_save.set_enable(true);
        		//this.fn_chgDiv(this.divInfo.divChgCmInfo.cmbPayment);
        /*
        		if(this.sPayDd != "") {		
        			for(var i=0; i<this.ds_chgInfo.rowcount; i++) {
        				this.ds_chgInfo.setColumn(i,"payDd",this.ds_List.getColumn(this.ds_List.rowposition,"payDd"));
        			}
        		}		
        */		
        		this.fn_setObjEnable();
        		this.fn_BirthEnable(this.divInfo.divChgCmInfo.cmbGubun.value);		
        	}

        	
            //-------------------------------------------------------------------------------  	
        	//구분값 변경에 따른 생년월일/사업자번호 활성화처리
            //-------------------------------------------------------------------------------  	
        	this.fn_BirthEnable = function(val)
        	{
        		//변경된 값이 개인일 경우
        		if(val == "01") 
        		{
        			var custTp2 = nvl(this.ds_List.getColumn(this.ds_List.rowposition, "custTp2"));
        			//개인사업자일 경우 대표자명, 대표자생년월일로 세팅
        			if(custTp2 == "0002") {
        				this.divInfo.divChgInfo.edtBirth.set_enable(false);
        				this.divInfo.divChgInfo.maeBusiNo.set_enable(false);
        				this.divInfo.divChgInfo2.edtBirth.set_enable(false);
        				this.divInfo.divChgInfo2.maeBusiNo.set_enable(false);
        				
        				var oBirthDay = this.ds_List.getColumn(this.ds_List.rowposition, "oBirthDay");
        				var oCustNm   = this.ds_List.getColumn(this.ds_List.rowposition, "oCustNm");

        				this.divInfo.divChgInfo.edtBirth.set_value(oBirthDay.substring(2,8));
        				this.divInfo.divChgInfo2.edtBirth.set_value(oBirthDay.substring(2,8));
        				
        				this.divInfo.divChgInfo.edtDepositor.set_value(oCustNm);
        				this.divInfo.divChgInfo2.edtDepositor.set_value(oCustNm);				
          				
        			}else {
        				this.divInfo.divChgInfo.edtBirth.set_enable(false);
        				this.divInfo.divChgInfo.maeBusiNo.set_enable(false);
        				this.divInfo.divChgInfo2.edtBirth.set_enable(false);
        				this.divInfo.divChgInfo2.maeBusiNo.set_enable(false);	
        						
        				this.divInfo.divChgInfo.edtBirth.set_value(this.ds_List.getColumn(this.ds_List.rowposition, "ebirDay"));
        				this.divInfo.divChgInfo2.edtBirth.set_value(this.ds_List.getColumn(this.ds_List.rowposition, "ebirDay"));
        				
        				this.divInfo.divChgInfo.edtDepositor.set_value(this.ds_List.getColumn(this.ds_List.rowposition, "custNm"));
        				this.divInfo.divChgInfo2.edtDepositor.set_value(this.ds_List.getColumn(this.ds_List.rowposition, "custNm"));					
        			}
        			this.divInfo.divChgInfo.maeBusiNo.set_value("");
        			this.divInfo.divChgInfo2.maeBusiNo.set_value("");
        		}
        		//변경된 값이 사업자일 경우
        		if(val == "02") 
        		{

        			this.divInfo.divChgInfo.edtBirth.set_enable(false);
        			this.divInfo.divChgInfo.maeBusiNo.set_enable(false);	
        			this.divInfo.divChgInfo2.edtBirth.set_enable(false);
        			this.divInfo.divChgInfo2.maeBusiNo.set_enable(false);	
        			
        			this.divInfo.divChgInfo.maeBusiNo.set_value(this.ds_chgInfo.getColumn(0, "oBuslNo"));
        			this.divInfo.divChgInfo2.maeBusiNo.set_value(this.ds_chgInfo.getColumn(0, "oBuslNo"));
        								
        			//this.divInfo.divChgInfo.edtBirth.set_value(this.ds_List.getColumn(this.ds_List.rowposition, "ebirDay"));
        			//this.divInfo.divChgInfo2.edtBirth.set_value(this.ds_List.getColumn(this.ds_List.rowposition, "ebirDay"));
        			this.divInfo.divChgInfo.edtBirth.set_value("");
        			this.divInfo.divChgInfo2.edtBirth.set_value("");
        			
        			this.divInfo.divChgInfo.edtDepositor.set_value(this.ds_List.getColumn(this.ds_List.rowposition, "custNm"));
        			this.divInfo.divChgInfo2.edtDepositor.set_value(this.ds_List.getColumn(this.ds_List.rowposition, "custNm"));										
        		}
        	}	
            //-------------------------------------------------------------------------------  	
        	//변경할 내용 값 초기화
            //-------------------------------------------------------------------------------  	
        	this.fn_setInitObj = function() 
        	{
        		this.divInfo.divChgCmInfo.cmbPaymentDay.set_index("0");
        		this.divInfo.divChgInfo.cmbBank.set_index("0");
        		//this.divInfo.divChgInfo.edtDepositor.set_value("");
        		this.divInfo.divChgInfo.edtAccNo.set_value("");	
        		this.divInfo.divChgInfo2.cmbCard.set_index("0");
        		//this.divInfo.divChgInfo2.edtDepositor.set_value("");
        		this.divInfo.divChgInfo2.edtCardNo.set_value("");
        		this.divInfo.divChgInfo2.edtYear.set_value("");
        		this.divInfo.divChgInfo2.edtMonth.set_value("");
        		this.ds_chgInfo.setColumn(0,"expireYm", "");
        	}
            //-------------------------------------------------------------------------------  	
        	//변경내용 활성화처리
            //-------------------------------------------------------------------------------  	
        	this.fn_setObjEnable = function()
        	{
        		//개인
        		if(this.ds_List.getColumn(this.ds_List.rowposition, "custTp") == "01") {
        			this.divInfo.divChgCmInfo.btn_PayPop.set_enable(true);
        			this.divInfo.divChgCmInfo.cmbPayment.set_enable(true);
        			this.divInfo.divChgCmInfo.cmbPaymentDay.set_enable(true);
        			this.divInfo.divChgCmInfo.cmbGubun.set_enable(false);		
        							
        			this.divInfo.divChgInfo.btn_AccConfirm.set_enable(true);
        			this.divInfo.divChgInfo.btn_File.set_enable(true);
        			this.divInfo.divChgInfo.cmbBank.set_enable(true);
        			//this.divInfo.divChgInfo.edtDepositor.set_enable(true);
        			this.divInfo.divChgInfo2.edtDepositor.set_enable(false);
        			this.divInfo.divChgInfo.edtAccNo.set_enable(true);		
        			this.divInfo.divChgInfo.edtBirth.set_enable(false);					
        			this.divInfo.divChgInfo.btn_arsCall.set_enable(true);
        			this.ch_resultArsCall.set_value(false);

        			this.divInfo.divChgInfo2.btn_BatchKey.set_enable(true);
        			this.divInfo.divChgInfo2.btn_File.set_enable(true);		
        			this.divInfo.divChgInfo2.edtBirth.set_enable(false);
        			this.divInfo.divChgInfo2.cmbCard.set_enable(true);
        			//this.divInfo.divChgInfo2.edtDepositor.set_enable(true);
        			this.divInfo.divChgInfo2.edtDepositor.set_enable(false);
        			this.divInfo.divChgInfo2.edtCardNo.set_enable(true);
        			this.divInfo.divChgInfo2.edtYear.set_enable(true);
        			this.divInfo.divChgInfo2.edtMonth.set_enable(true);			
        		}
        		//사업자(0001개인/0002개인사업자/0003관공서/0004법인/0005기타)
        		else {
        			//개인사업자일 경우 구분콤보를 활성화
        			if(this.ds_List.getColumn(this.ds_List.rowposition, "custTp2") == "0002") {
        				this.divInfo.divChgCmInfo.btn_PayPop.set_enable(true);
        				this.divInfo.divChgCmInfo.cmbPayment.set_enable(true);
        				this.divInfo.divChgCmInfo.cmbPaymentDay.set_enable(true);
        				this.divInfo.divChgCmInfo.cmbGubun.set_enable(true);		
        								
        				this.divInfo.divChgInfo.btn_AccConfirm.set_enable(true);
        				this.divInfo.divChgInfo.btn_File.set_enable(true);
        				this.divInfo.divChgInfo.cmbBank.set_enable(true);
        				this.divInfo.divChgInfo.edtDepositor.set_enable(true);				
        				this.divInfo.divChgInfo.edtAccNo.set_enable(true);		
        				this.divInfo.divChgInfo.edtBirth.set_enable(false);
        				this.divInfo.divChgInfo.btn_arsCall.set_enable(true);

        				this.divInfo.divChgInfo2.btn_BatchKey.set_enable(true);
        				this.divInfo.divChgInfo2.btn_File.set_enable(true);		
        				this.divInfo.divChgInfo2.edtBirth.set_enable(false);
        				this.divInfo.divChgInfo2.cmbCard.set_enable(true);
        				this.divInfo.divChgInfo2.edtDepositor.set_enable(true);				
        				this.divInfo.divChgInfo2.edtCardNo.set_enable(true);
        				this.divInfo.divChgInfo2.edtYear.set_enable(true);
        				this.divInfo.divChgInfo2.edtMonth.set_enable(true);			
        			}
        			else {
        				this.divInfo.divChgCmInfo.btn_PayPop.set_enable(true);
        				this.divInfo.divChgCmInfo.cmbPayment.set_enable(true);
        				this.divInfo.divChgCmInfo.cmbPaymentDay.set_enable(true);
        				this.divInfo.divChgCmInfo.cmbGubun.set_enable(false);		
        								
        				this.divInfo.divChgInfo.btn_AccConfirm.set_enable(true);
        				this.divInfo.divChgInfo.btn_File.set_enable(true);
        				this.divInfo.divChgInfo.cmbBank.set_enable(true);
        				this.divInfo.divChgInfo.edtDepositor.set_enable(true);				
        				this.divInfo.divChgInfo.edtAccNo.set_enable(true);		
        				this.divInfo.divChgInfo.edtBirth.set_enable(false);		
        				this.divInfo.divChgInfo.btn_arsCall.set_enable(true);				

        				this.divInfo.divChgInfo2.btn_BatchKey.set_enable(true);
        				this.divInfo.divChgInfo2.btn_File.set_enable(true);		
        				this.divInfo.divChgInfo2.edtBirth.set_enable(false);
        				this.divInfo.divChgInfo2.cmbCard.set_enable(true);
        				this.divInfo.divChgInfo2.edtDepositor.set_enable(true);				
        				this.divInfo.divChgInfo2.edtCardNo.set_enable(true);
        				this.divInfo.divChgInfo2.edtYear.set_enable(true);
        				this.divInfo.divChgInfo2.edtMonth.set_enable(true);					
        			}			
        		}
        	}
            //-------------------------------------------------------------------------------  	
        	//변경내용 비활성화처리
            //-------------------------------------------------------------------------------  	
        	this.fn_setObjDisable = function()
        	{
        		
        		this.divInfo.divChgCmInfo.btn_PayPop.set_enable(false);
        		this.divInfo.divChgCmInfo.cmbPayment.set_enable(false);
        		this.divInfo.divChgCmInfo.cmbGubun.set_enable(false);		

        		this.divInfo.divChgInfo.btn_AccConfirm.set_enable(false);
        		this.divInfo.divChgInfo.btn_File.set_enable(false);		
        		this.divInfo.divChgInfo.cmbBank.set_enable(false);
        		this.divInfo.divChgInfo.edtDepositor.set_enable(false);
        		this.divInfo.divChgInfo.edtAccNo.set_enable(false);		
        		this.divInfo.divChgInfo.edtBirth.set_enable(false);		
        		this.divInfo.divChgInfo.btn_arsCall.set_enable(false);
        		this.ch_resultArsCall.set_value(false);

        		this.divInfo.divChgInfo2.btn_BatchKey.set_enable(false);
        		this.divInfo.divChgInfo2.btn_File.set_enable(false);		
        		this.divInfo.divChgInfo2.edtBirth.set_enable(false);
        		this.divInfo.divChgInfo2.cmbCard.set_enable(false);
        		this.divInfo.divChgInfo2.edtDepositor.set_enable(false);
        		this.divInfo.divChgInfo2.edtCardNo.set_enable(false);
        		this.divInfo.divChgInfo2.edtYear.set_enable(false);
        		this.divInfo.divChgInfo2.edtMonth.set_enable(false);
        	}	
            //-------------------------------------------------------------------------------  
        	// 계약번호조회팝업창 파라미터 반환
            //-------------------------------------------------------------------------------  		
        	this.returnOrderNoInfo = function(arr) {
        		if(arr[0].rowcount > 0) 
        		{	
        			this.div_search.edt_ordNo.set_value(arr[0].getColumn(0,"ordNo"));
        			this.fn_search();
        		}
        	}		
            //-------------------------------------------------------------------------------  
        	// 고객조회팝업창 파라미터 반환
            //-------------------------------------------------------------------------------  		
        	this.returnCustInfo = function(arr) {
        		this.div_search.edt_custNo.set_value(arr[0].getColumn(0,"custNo"));
        		this.div_search.edt_custNoKeyword.set_value(arr[0].getColumn(0,"custNm"));
        		this.fn_search();		
        	}
        		
            //-------------------------------------------------------------------------------  
        	// 팝업 파라미터 반환
            //-------------------------------------------------------------------------------  	
        	this._setReturn = function(ds) {
        		this.divInfo.divChgInfo2.edtResultContents.set_value("");
        		this.bNewFlag = true;
        		this.bChkFlag = false;		
        		this.bChkVal =  'N';			
        		this.ds_chgInfo.clearData();
        		var nRow = this.ds_chgInfo.addRow();
        		this.ds_chgInfo.copyRow(nRow, ds[0], 0);
        		
        		this.ds_chgInfo.setColumn( nRow, "pCustTp", ds[0].getColumn(0,"custTp") );
        		this.ds_chgInfo.setColumn( nRow, "mobNo", this.ds_List.getColumn(this.ds_List.currow,"mobNo"));
        		
        		this.fn_chgDiv(this.divInfo.divChgCmInfo.cmbPayment);	
        		this.sPayDd = nvl(this.ds_chgInfo.getColumn(0,"payDd"));
        		this.divInfo.divChgCmInfo.cmbPaymentDay.set_index(0);
        		//변경할내용 비활성화
        		this.fn_setObjDisable();
        		this.divInfo.divChgInfo.btn_AccConfirm.set_enable(true);
        		this.divInfo.divChgInfo.btn_arsCall.set_enable(true); // 2016-06-27 이영근, 결제방법 가져올시 버튼 활성화
        		this.ch_resultArsCall.set_value(false);
        		this.divInfo.divChgInfo2.btn_BatchKey.set_enable(true);
        	}
            //-------------------------------------------------------------------------------   
            // 존재하는 날자(유효한 날자) 인지 체크   
            //-------------------------------------------------------------------------------   
            this.fn_chkExpireYm = function(nYear,nMonth) 
            {
        		if (nYear < 1900 || nYear > 3000)   
        		{ 
        			return false;
        		}   
        	  
        		if (nMonth < 1 || nMonth > 12)   
        		{  
        			return false;
        		}      
        		return true;
            }
            //-------------------------------------------------------------------------------   
            // 신규버튼 활성화
            //-------------------------------------------------------------------------------     
            this.fn_EnableBtn = function() 
            {
        		this.div_search.btn_new.set_enable(true);
            }
            //-------------------------------------------------------------------------------   
            // 신규버튼 비활성화
            //-------------------------------------------------------------------------------     
            this.fn_DisableBtn = function() 
            {
        		this.div_search.btn_new.set_enable(false);
            } 
            //-------------------------------------------------------------------------------   
            // 삭제버튼 활성/비활성화
            //-------------------------------------------------------------------------------      
            this.fn_EnDelBtn = function(row) {
        		//삭제가능여부값 체크해서 삭제버튼 활성화처리
        		//if(this.grdList.getCellValue(row,16) == "S") {
        		if(this.ds_List.getColumn(row,"deleteTp") == "S") {
        			this.div_search.btn_Delete.set_enable(true);
        		}
        		else {
        			this.div_search.btn_Delete.set_enable(false);			
        		}    
            }
            //-------------------------------------------------------------------------------   
            // 조회후 호출함수
            //-------------------------------------------------------------------------------      
            this.fn_listResultPost =  function()
            {
        		this.sta_total_cnt.set_text(this.ds_List.rowcount);
        		this.fn_setObjDisable();
        		if(this.ds_List.rowcount > 0) 
        		{
        			//삭제버튼 활성/비활성화
        			this.fn_EnDelBtn(0);
        			this.fn_setInitObj();
        			//신규버튼 활성화
        			this.fn_EnableBtn();
        			//변경할내용세팅			
        			this.ds_chgInfo.clearData();		
        			var nRow = this.ds_chgInfo.addRow();
        			this.ds_chgInfo.copyRow(nRow,this.ds_List, this.ds_List.rowposition);
        			this.fn_chgDiv(this.divInfo.divChgCmInfo.cmbPayment);
        			for(var i=0; i<this.ds_chgInfo.rowcount; i++) {
        				this.ds_chgInfo.setColumn(i,"payDd",this.ds_List.getColumn(this.ds_List.rowposition,"payDd"));
        			}			
        			var certCd = nvl(this.ds_chgInfo.getColumn(0, "certCd"));
        			if(certCd == "02"){
        				
        			}else{
        				this.certificationFlag = true; // 2016-06-13 이영근, 휴대폰 인증한 경우
        			}			
        		}
        		else {
        			this.grdList.set_nodatatext("조회된 데이터가 없습니다.");
        		}
        	}
        	//-------------------------------------------------------------------------------  
        	//파일업로드 팝업생성
        	//-------------------------------------------------------------------------------  
        	this.fileUpload = function(obj,e) {
        		  var args ={p_arg:""};
        		  Ex.core.popup(this,"inputFile","comm::FileUpDownload.xfdl", args, "modaless=false");
        	}
        	
        	//-------------------------------------------------------------------------------  
        	//계좌인증
        	//-------------------------------------------------------------------------------  	
        	this.fn_accConfirm = function(btn_nm) {

        		if(nvl(this.divInfo.divChgCmInfo.cmbGubun.value) == "") {
        			alert('구분을 선택하세요');
        			this.divInfo.divChgCmInfo.cmbGubun.setFocus();
        			return;
        		}
        		if(nvl(this.divInfo.divChgInfo.cmbBank.value) == "") {
        			alert('은행을 선택하세요');
        			this.divInfo.divChgInfo.cmbBank.setFocus();
        			return;
        		}	
        		if(nvl(this.divInfo.divChgInfo.edtAccNo.value) == "") {
        			alert('계좌번호를 입력하세요');
        			this.divInfo.divChgInfo.edtAccNo.setFocus();
        			return;
        		}	
        		if(nvl(this.divInfo.divChgInfo.edtDepositor.value) == "") {
        			alert('예금주명을 입력하세요');
        			this.divInfo.divChgInfo.edtDepositor.setFocus();
        			return;
        		}			
        		
        		if(nvl(this.divInfo.divChgCmInfo.cmbGubun.value) == "01") 	//개인
        		{
        			if(nvl(this.divInfo.divChgInfo.edtBirth.value) == "")
        			{
        				this.alert("법정생년월일을 입력하세요");
        				this.divInfo.divChgInfo.edtBirth.setFocus();
        				return;
        			}
        			/*
        			if( !FN_YYMMDDCheck(this.divInfo.divChgInfo.edtBirth.value)){
        				alert('법정생년월일을 확인하세요');							
        				this.divInfo.divChgInfo.edtBirth.setFocus();
        				return;
        			}
        			*/	
        		}
        		else //사업자
        		{
        			if(nvl(this.divInfo.divChgInfo.maeBusiNo.value) == "")
        			{
        				this.alert("사업자번호를 입력하세요");
        				this.divInfo.divChgInfo.maeBusiNo.setFocus();
        				return;
        			}	
        			/*	
        			var checkBuslNo = FN_buslNoCheck(this.divInfo.divChgInfo.maeBusiNo.value)//comLib 사업자번호체크
        			if(!checkBuslNo){
        				alert("사업자번호를 확인하세요.");
        				this.divInfo.divChgInfo.maeBusiNo.setFocus();
        				return;
        			}
        			*/							
        		}						
        		if(btn_nm == "btn_AccConfirm"){						
        			this.divInfo.divChgInfo.edtAccConfirm.set_value("");	
        			this.bChkFlag = true;
        		}				

        		var userType = nvl(this.divInfo.divChgCmInfo.cmbGubun.value);	//구분(개인/사업자)
        		var bankCd	 = nvl(this.divInfo.divChgInfo.cmbBank.value);		//은행코드
        		var acctCd 	 = nvl(this.divInfo.divChgInfo.edtAccNo.value);		//계좌번호
        		var bizNo	 = "";	//생년월일 또는 사업자번호
        		if(nvl(this.divInfo.divChgCmInfo.cmbGubun.value) == "01") 		//개인
        		{
        			if(btn_nm == "btn_AccConfirm")
        				bizNo = nvl(this.divInfo.divChgInfo.edtBirth.value);		//생년월일
        			else
        				//bizNo = nvl(this.ds_chgInfo.getColumn(0,"birthDay"));		//생년월일				
        				bizNo = nvl(this.ds_List.getColumn(this.ds_List.currow, "birthDay"));		//생년월일(출금이체동의)			
        		}
        		else 
        		{
        			bizNo = nvl(this.divInfo.divChgInfo.maeBusiNo.value);		//사업자번호
        		}	
        		
        		var acctCdLen 	= acctCd.length;
        		var acctSubstr	= acctCd.substr(0,3);
        	
        		if( (bankCd == '003') && ((acctCdLen == 10) || (acctCdLen == 11)) ){
        			alert("평생계좌는 자동이체 신청이 불가능합니다.\n기업은행 : 계좌번호가 10자리, 11자리\n신한은행 : 계좌번호가 10자리~14자리면서 앞번호 010 시작");
        			return false;
        		}else if( (bankCd == '088') && ((acctCdLen == 10) || (acctCdLen == 11) || (acctCdLen == 12) || (acctCdLen == 13) || (acctCdLen == 14)) && (acctSubstr == "010") ){
        			alert("평생계좌는 자동이체 신청이 불가능합니다.\n기업은행:계좌번호가 10자리, 11자리\n신한은행:계좌번호가 10자리~14자리면서 앞번호 010 시작");
        			return false;
        		}else if(this.divInfo.divChgInfo.ra_certification.value == "02" || this.certificationFlag == false){
        			// 2016-06-13 이영근, 신분증으로 본인인증한 경우 CMS 등록하지 못하도록 처리
        			alert("결제방법이 'CMS'인 경우, 휴대폰으로 본인인증한 회원만 신청이 가능합니다.");
        			this.divInfo.divChgInfo.ra_certification.set_enable(true);
        			this.divInfo.divChgInfo.btn_certification.set_enable(true);
        			this.divInfo.divChgInfo.ra_certification.set_value("01");
        			this.divInfo.divChgInfo.btn_certification.setFocus();
        			return false;			
        		}else{
        			var custNo	 = nvl(this.ds_chgInfo.getColumn(0,"custNo"));		//고객번호
        			var custNm	 = nvl(this.ds_chgInfo.getColumn(0,"custNm"));		//고객명
        			var ownerNm	 = nvl(this.divInfo.divChgInfo.edtDepositor.value);	//예금주명
        			
        			var bankNm	 = nvl(this.divInfo.divChgInfo.cmbBank.text);
        			var mobNo	 = nvl(this.divInfo.divChgInfo.ed_mobNo.value);			
        			
        			if(btn_nm == "btn_AccConfirm"){			
        				var sSvcID        	= "kftcCmsDocInfo";                    
        				var sController   	= "rtms/sms/kftcCmsDocInfo.do";
        			}else{
        				if(this.divInfo.divChgInfo.edtAccConfirm.value != 'Y'){
        					alert("계좌인증 후 진행해주시기 바랍니다.");
        					return;
        				}			
        				application.set_httptimeout(300); // 2016-06-08 이영근, 타임아웃 시간 5분으로 연장
        				var sSvcID        	= "arsCallService";                    
        				var sController   	= "rtms/sms/arsCallService.do";				
        			}			
        			var sInDatasets   	= "";
        			var sOutDatasets 	= "dsBatch=cmdKey";
        			var sArgs 			= "";	
        			var fn_callBack		= "fn_callBack";
        			sArgs += " userType=" + userType + " bankCd=" + bankCd + " acctCd=" + acctCd + " bizNo=" + bizNo;
        			sArgs += " custNo=" + custNo + " custNm=" + custNm + " ownerNm=" + ownerNm + " bankNm=" + bankNm + " mobNo=" + mobNo;

        			//trace(sArgs);
        			Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        		}
        	}

        	//-------------------------------------------------------------------------------  
        	//카드인증
        	//-------------------------------------------------------------------------------  	
        	this.fn_crdConfirm = function() {
        		// site_cust_id   	: 고객번호 (입력값)
        		// site_apply_ymd 	: 신청(접수)일자 (오늘날짜)
        		// site_apply_no  	: 신청접수 일련번호 (시퀀스)
        		// group_id 		: 카드사제공 (BA0011000328)
        		// cust_name 		: 고객명 (입력값)
        		// mobile_no		: 핸드폰번호(입력값X 고객코드로 조회후 설정)
        		// email			: 이메일(입력값X 고객코드로 조회후 설정)
        		// pay_type			: 결제수단 카드사제공 (PACA)
        		// pay_id			: 카드번호(화면입력값)
        		// pay_expiry_yy	: 유효기간(년)2자리
        		// pay_expiry_mm    : 유효기간(월)2자리
        		// pay_owner_nm		: 카드소유자명(입력값)
        		// pay_cert_no		: 6자리 + 마스킹처리
        		if(nvl(this.divInfo.divChgCmInfo.cmbGubun.value) == "") {
        			alert('구분을 선택하세요');
        			this.divInfo.divChgCmInfo.cmbGubun.setFocus();
        			return;
        		}
        		if(nvl(this.divInfo.divChgInfo2.cmbCard.value) == '') {
        			alert('카드사를 선택하세요.');
        			this.divInfo.divChgInfo2.cmbCard.setFocus();
        			return;
        		}				
        		if(nvl(this.divInfo.divChgInfo2.edtCardNo.value) == '') {
        			alert('카드번호는 필수입력항목 입니다.');
        			this.divInfo.divChgInfo2.edtCardNo.setFocus();					
        			return;
        		}
        		if(nvl(this.divInfo.divChgInfo2.edtYear.value) == '') {
        			alert('유효기간은  필수입력항목 입니다.');
        			this.divInfo.divChgInfo2.edtYear.setFocus();				
        			return;
        		}		
        		if(nvl(this.divInfo.divChgInfo2.edtMonth.value) == '') {
        			alert('유효기간은  필수입력항목 입니다.');
        			this.divInfo.divChgInfo2.edtMonth.setFocus();			
        			return;
        		}		
        		var sExpireYm = nvl(this.divInfo.divChgInfo2.edtYear.value) + "" + nvl(this.divInfo.divChgInfo2.edtMonth.value);
        						
        		if(!this.fn_chkExpireYm(this.divInfo.divChgInfo2.edtYear.value, this.divInfo.divChgInfo2.edtMonth.value))
        		{
        			this.alert("사용할수 없는 유효기간이 입력되었습니다.");
        			this.divInfo.divChgInfo2.edtYear.setFocus();			
        			return false;
        		}
        		
        		if(parseInt(sExpireYm) < parseInt(this.toDay.substring(0, 6)))
        		{
        			this.alert("유효기간은 현재 년, 월 보다 커야 합니다.");
        			this.divInfo.divChgInfo2.edtMonth.setFocus();				
        			return false;
        		}
        								
        		if(nvl(this.divInfo.divChgInfo2.edtDepositor.value) == '') {
        			alert('카드주명을 입력하세요.');
        			this.divInfo.divChgInfo2.edtDepositor.setFocus();
        			return;
        		}	
        		
        		if(nvl(this.divInfo.divChgCmInfo.cmbGubun.value) == "01") {
        			if(nvl(this.divInfo.divChgInfo2.edtBirth.value) == '') {
        				alert('법정생년월일을 입력하세요.');
        				this.divInfo.divChgInfo2.edtBirth.setFocus();
        				return;
        			}			
        		}
        		/*
        		if( !FN_YYMMDDCheck(this.divInfo.divChgInfo.edtBirth.value)){
        			alert('법정생년월일을 확인하세요');		
        			this.divInfo.divChgInfo2.edtBirth.setFocus();
        			return;
        		}
        		*/					
        		if(nvl(this.divInfo.divChgCmInfo.cmbGubun.value) == "02") {
        			if(nvl(this.divInfo.divChgInfo2.maeBusiNo.value) == '') {
        				alert('사업자번호를 입력하세요.');
        				this.divInfo.divChgInfo2.maeBusiNo.setFocus();
        				return;
        			}			
        		}	
        		/*	
        		var checkBuslNo = FN_buslNoCheck(this.divInfo.divChgInfo2.maeBusiNo.value)//comLib 사업자번호체크
        		if(!checkBuslNo){
        			alert("사업자번호를 확인하세요.");
        			this.divInfo.divChgInfo2.maeBusiNo.setFocus();
        			return;
        		}				
        		*/		
        		this.bChkFlag = true;	
        						
        		var pos = this.ds_List.rowposition;
        		var sSvcID 			= "batchService";
        		var sInDatasets 	= "";
        		var sOutDatasets 	= "dsBatch=batch_output";
        		var sController 	= "/rtms/cms/kcphubBatch.do";
        		var fn_callBack 	= "fn_callBack";
        		var args 			= "";
        		args += " site_cust_id=" + nvl(this.ds_chgInfo.getColumn(0,"custNo"));		//고객아이디
        		args += " group_id=" 	 + application.gv_group_id ;						//그룹번호
        		args += " cust_name=" 	 + nvl(this.ds_chgInfo.getColumn(0,"custNm"));		//고객명
        		args += " pay_type=" 	 + application.gv_pay_type;							//결제수단				
        		args += " pay_id=" 		 + nvl(this.divInfo.divChgInfo2.edtCardNo.value);	//카드번호
        		args += " pay_expiry_yy="+ nvl(this.divInfo.divChgInfo2.edtYear.value);		//유효기간(년)
        		args += " pay_expiry_mm="+ nvl(this.divInfo.divChgInfo2.edtMonth.value);	//유효기간(월)
        		args += " pay_owner_nm=" + nvl(this.divInfo.divChgInfo2.edtDepositor.value);//카드소유자명
        		args += " pay_cert_no="  + nvl(this.divInfo.divChgInfo2.edtBirth.value);	//생년월일
        		args += " cmbGubun=" 	 + nvl(this.divInfo.divChgCmInfo.cmbGubun.value);	//구분(개인/사업자)
        		args += " busl_no=" 	 + nvl(this.divInfo.divChgInfo2.maeBusiNo.value);   //사업자번호
        		args += " cardcomCd=" 	 + nvl(this.divInfo.divChgInfo2.cmbCard.value);		//카드사코드	
        		Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, args, fn_callBack); 				
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
        	
        	//-------------------------------------------------------------------------------  
        	//저장 데이터 생성
        	//------------------------------------------------------------------------------- 	
        	this.fn_makeSaveData = function()
        	{
        		this.dsInList.clearData();
        		
        		this.dsInList.addColumn("dvsn", "string", 256);
        		
        		this.dsInList.addRow();
        		
        		this.dsInList.setColumn(0, "dvsn"		, "I"); //처리구분(I,U,D)
        		this.dsInList.setColumn(0, "ordNo"		, this.ds_List.getColumn(this.ds_List.rowposition,"ordNo")); //주문번호                     
        		this.dsInList.setColumn(0, "rpcDay"		, ""); 	//결제변경요청일(오늘날짜yyyymmdd)
        		this.dsInList.setColumn(0, "rpcUid"		, "");	//결제변경요청자(로그인사용자ID)
        		this.dsInList.setColumn(0, "rpcCd"		, "04");//변경사유코드('04:회사접수')                 		
        		this.dsInList.setColumn(0, "rpcRsn"		, "회사접수");//변경사유('04:회사접수')                 
        		this.dsInList.setColumn(0, "fileGrpSeq"	, "");	//첨부파일                  
        		this.dsInList.setColumn(0, "bfcustNo"	, this.ds_List.getColumn(this.ds_List.rowposition,"custNo"));	//변경전 고객번호      
        		this.dsInList.setColumn(0, "bftcgrpNo"	, this.ds_List.getColumn(this.ds_List.rowposition,"tcgrpNo"));	//변경전 통합청구번호(추가필요108)    
        		this.dsInList.setColumn(0, "bfpayMthd"	, this.ds_List.getColumn(this.ds_List.rowposition,"payMthd"));	//변경전 결제방법           
        		this.dsInList.setColumn(0, "bfpayDd"	, this.ds_List.getColumn(this.ds_List.rowposition,"payDd"));	//변경전 결제일자           
        		this.dsInList.setColumn(0, "bfaccSeq"	, this.ds_List.getColumn(this.ds_List.rowposition,"accSeq"));	//변경전 계좌순번           
        		this.dsInList.setColumn(0, "bfacustNm"	, this.ds_List.getColumn(this.ds_List.rowposition,"depositor"));//변경전 예금주명           
        		this.dsInList.setColumn(0, "bfacustTp"	, this.ds_List.getColumn(this.ds_List.rowposition,"pCustTp"));	//변경전 계좌 고객유형				//20151111수정 custTp->pCustTp
        		this.dsInList.setColumn(0, "bfaebirDay"	, this.ds_List.getColumn(this.ds_List.rowposition,"ebirDay"));	//변경전 계좌 법정생년월일  
        		this.dsInList.setColumn(0, "bfabuslNo"	, this.ds_List.getColumn(this.ds_List.rowposition,"buslNo"));	//변경전 계좌 사업자번호    
        		this.dsInList.setColumn(0, "bfbankNo"	, this.ds_List.getColumn(this.ds_List.rowposition,"bankCd"));	//변경전 은행코드           
        		this.dsInList.setColumn(0, "bfacctNo"	, this.ds_List.getColumn(this.ds_List.rowposition,"acctNo"));	//변경전 계좌번호           
        		this.dsInList.setColumn(0, "bfcrdSeq"	, this.ds_List.getColumn(this.ds_List.rowposition,"crdSeq"));	//변경전 카드순번           
        		this.dsInList.setColumn(0, "bfccustNm"	, this.ds_List.getColumn(this.ds_List.rowposition,"depositor"));//변경전 카드주명           
        		this.dsInList.setColumn(0, "bfccustTp"	, this.ds_List.getColumn(this.ds_List.rowposition,"pCustTp"));	//변경전 카드 고객유형 -- 2016-07-29 custTp -> pCustTp 오류 수정      
        		this.dsInList.setColumn(0, "bfcebirDay"	, this.ds_List.getColumn(this.ds_List.rowposition,"ebirDay"));	//변경전 카드 법정생년월일  
        		this.dsInList.setColumn(0, "bfcbuslNo"	, this.ds_List.getColumn(this.ds_List.rowposition,"buslNo"));	//변경전 카드 사업자번호    
        		this.dsInList.setColumn(0, "bfcardcomNo", this.ds_List.getColumn(this.ds_List.rowposition,"cardcomCd"));//변경전 카드사코드         
        		this.dsInList.setColumn(0, "bfcardNo"	, this.ds_List.getColumn(this.ds_List.rowposition,"cardNo"));	//변경전 카드번호           
        		this.dsInList.setColumn(0, "bfexpireYm"	, this.ds_List.getColumn(this.ds_List.rowposition,"expireYm"));	//변경전 유효기간           
        		this.dsInList.setColumn(0, "bfbatchKey"	, this.ds_List.getColumn(this.ds_List.rowposition,"batchKey"));	//변경전 BATCH_KEY(추가필요108)
        		this.dsInList.setColumn(0, "bfaccStat"	, this.ds_List.getColumn(this.ds_List.rowposition,"accStat"));	//변경전 계좌신청상태(추가필요108)
        		this.dsInList.setColumn(0, "afcustNo"	, this.ds_List.getColumn(this.ds_List.rowposition,"custNo"));	//변경후 고객번호           
        		this.dsInList.setColumn(0, "aftcgrpNo"	, this.ds_List.getColumn(this.ds_List.rowposition,"tcgrpNo"));	//변경후 통합청구번호 
        		      
        		this.dsInList.setColumn(0, "afpayMthd"	, this.ds_chgInfo.getColumn(0,"payMthd"));	//변경후 결제방법           
        		this.dsInList.setColumn(0, "afpayDd"	, this.ds_chgInfo.getColumn(0,"payDd"));	//변경후 결제일자   
        		//신규이면 순번은 null 처리.
        		if(this.bNewFlag) {
        			if(nvl(this.ds_List.getColumn(this.ds_List.rowposition,"accSeq")) == nvl(this.ds_chgInfo.getColumn(0,"accSeq"))) {	
        				this.dsInList.setColumn(0, "afaccSeq"	, "");	//변경후 계좌순번
        			}
        			else {
        				this.dsInList.setColumn(0, "afaccSeq"	, nvl(this.ds_chgInfo.getColumn(0,"accSeq")));	//변경후 계좌순번
        			}
        		}
        		else {
        			this.dsInList.setColumn(0, "afaccSeq"	, this.ds_chgInfo.getColumn(0,"accSeq"));	//변경후 계좌순번   		
        		}
         
        		//변경후 결제방법이 CMS이면
        		if(this.ds_chgInfo.getColumn(0,"payMthd") == "A" ) {		
        			this.dsInList.setColumn(0, "afaccChk"	, nvl(this.bChkVal));						//변경후 계좌확인상태	
        			this.dsInList.setColumn(0, "afbkeyChk"	, "N"); 									//변경후 카드확인상태
        			
        			this.dsInList.setColumn(0, "afacustNm"	, this.ds_chgInfo.getColumn(0,"depositor"));	//변경후 예금주명           
        			this.dsInList.setColumn(0, "afacustTp"	, this.ds_chgInfo.getColumn(0,"custTp"));		//변경후 계좌 고객유형      
        			this.dsInList.setColumn(0, "afaebirDay"	, this.ds_chgInfo.getColumn(0,"ebirDay"));		//변경후 계좌 법정생년월일  
        			this.dsInList.setColumn(0, "afabuslNo"	, this.ds_chgInfo.getColumn(0,"buslNo"));		//변경후 계좌 사업자번호    
        			this.dsInList.setColumn(0, "afbankNo"	, this.ds_chgInfo.getColumn(0,"bankCd"));		//변경후 은행코드           
        			this.dsInList.setColumn(0, "afacctNo"	, this.ds_chgInfo.getColumn(0,"acctNo"));		//변경후 계좌번호    
        					
        			this.dsInList.setColumn(0, "afbatchKey"	, "");	//변경후 BATCH_KEY          
        			this.dsInList.setColumn(0, "afccustNm"	, "");	//변경후 카드주명           
        			this.dsInList.setColumn(0, "afccustTp"	, "");	//변경후 카드 고객유형      
        			this.dsInList.setColumn(0, "afcebirDay"	, "");	//변경후 카드 법정생년월일  
        			this.dsInList.setColumn(0, "afcbuslNo"	, "");	//변경후 카드 사업자번호    
        			this.dsInList.setColumn(0, "afcardcomNo", "");	//변경후 카드사코드         
        			this.dsInList.setColumn(0, "afcardNo"	, "");	//변경후 카드번호				
        		}	
        		//변경후 결제방법이 카드이면		
        		if(this.ds_chgInfo.getColumn(0,"payMthd") == "C" ) {		
        			this.dsInList.setColumn(0, "afaccChk"	, "N");										//변경후 계좌확인상태		
        			this.dsInList.setColumn(0, "afbkeyChk"	, nvl(this.bChkVal)); 						//변경후 카드확인상태	
        						
        			this.dsInList.setColumn(0, "afbatchKey"	, this.ds_chgInfo.getColumn(0,"batchKey"));		//변경후 BATCH_KEY          
        			this.dsInList.setColumn(0, "afccustNm"	, this.ds_chgInfo.getColumn(0,"depositor"));	//변경후 카드주명           
        			this.dsInList.setColumn(0, "afccustTp"	, this.ds_chgInfo.getColumn(0,"custTp"));		//변경후 카드 고객유형      
        			this.dsInList.setColumn(0, "afcebirDay"	, this.ds_chgInfo.getColumn(0,"ebirDay"));		//변경후 카드 법정생년월일  
        			this.dsInList.setColumn(0, "afcbuslNo"	, this.ds_chgInfo.getColumn(0,"buslNo"));		//변경후 카드 사업자번호    
        			this.dsInList.setColumn(0, "afcardcomNo", this.ds_chgInfo.getColumn(0,"cardcomCd"));	//변경후 카드사코드         
        			this.dsInList.setColumn(0, "afcardNo"	, this.ds_chgInfo.getColumn(0,"cardNo"));		//변경후 카드번호		
        							
        			this.dsInList.setColumn(0, "afacustNm"	, "");		//변경후 예금주명           
        			this.dsInList.setColumn(0, "afacustTp"	, "");		//변경후 계좌 고객유형      
        			this.dsInList.setColumn(0, "afaebirDay"	, "");		//변경후 계좌 법정생년월일  
        			this.dsInList.setColumn(0, "afabuslNo"	, "");		//변경후 계좌 사업자번호    
        			this.dsInList.setColumn(0, "afbankNo"	, "");		//변경후 은행코드           
        			this.dsInList.setColumn(0, "afacctNo"	, "");		//변경후 계좌번호    
        									
        		}			      
        		//this.dsInList.setColumn(0, "afaccChk"	, this.ds_chgInfo.getColumn(0,"accChk"));		//변경후 계좌확인상태   
        		
        		//신규이면 순번은 null 처리.
        		if(this.bNewFlag) {
        			if(nvl(this.ds_List.getColumn(this.ds_List.rowposition,"crdSeq")) == nvl(this.ds_chgInfo.getColumn(0,"crdSeq"))) {	
        				this.dsInList.setColumn(0, "afcrdSeq"	, "");	//변경후 카드순번    		
        			}
        			else {
        				this.dsInList.setColumn(0, "afcrdSeq"	, nvl(this.ds_chgInfo.getColumn(0,"crdSeq")));	//변경후 카드순번 
        			}
        		}
        		else {
        			this.dsInList.setColumn(0, "afcrdSeq"	, this.ds_chgInfo.getColumn(0,"crdSeq"));	//변경후 카드순번  		
        		}		    
        		
        		this.dsInList.setColumn(0, "afexpireYm"	, this.ds_chgInfo.getColumn(0,"expireY")+""+this.ds_chgInfo.getColumn(0,"expireM"));		//변경후 유효기간
        		//this.dsInList.setColumn(0, "afbkeyChk"	, this.ds_chgInfo.getColumn(0,"bkeyChk"));	//변경후 카드확인상태
        		this.dsInList.setColumn(0, "userId"		, "");		//로그인사용자 ID       
        		        		    		
        	}
        	//-------------------------------------------------------------------------------  	
        	//이미지정보 데이타셋 반환
        	//-------------------------------------------------------------------------------  
        	this.resultUploadFile = function(val) {

        		this.dsFile.copyData(val[0]);
        		var cnt = this.dsFile.rowcount;
        		var fileNm = "";
        		var fileTmp = "";
        		for(var i = 0; i<cnt; i++) {
        			fileNm += this.dsFile.getColumn(i, "filename") + ", ";
        		}
        		if(this.divInfo.divChgCmInfo.cmbPayment.value == "C")  //결제방법(카드이체)
        		{
        			this.divInfo.divChgInfo2.fileList.set_value(fileNm);
        		}
        		else {
        			this.divInfo.divChgInfo.fileList.set_value(fileNm);		
        		}
        	}

        this.div_cust_btn_certificationConfirm_onclick = function(obj,e){
        	var popGb = this.divInfo.divChgInfo.ra_certification.value;
        	var doc = this.divInfo.divChgInfo.nice_interface.document;

        	if(popGb == '01') {			//휴대폰인증인경우
        		doc.getElementById("di_fn_popup").click();
        	} else if(popGb == '02') {	//신분증
        		doc.getElementById("fn_popup").click();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.web_onusernotify = function(obj,e){
        	var obj 				= this.divInfo.divChgInfo.nice_interface.document;
        	var sName 				= nvl(obj.getElementById("sName").value);
        	var sBirthDate 			= nvl(obj.getElementById("sBirthDate").value);
        	var sGender 			= nvl(obj.getElementById("sGender").value);
        	var sNationalInfo 		= nvl(obj.getElementById("sNationalInfo").value);
        	var sNational 			= "";
        	var custNm 				= nvl(this.ds_chgInfo.getColumn(0,"custNm"));
        	var birthDay 			= nvl(this.ds_chgInfo.getColumn(0,"birthDay"));
        	var genderCd 			= nvl(this.ds_chgInfo.getColumn(0,"genderCd"));
        	var lfCd 	 			= nvl(this.ds_chgInfo.getColumn(0,"lfCd"));
        	
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
        	}else if( sBirthDate != birthDay ){
        		alert("입력하신 고객정보와 본인인증정보가 다릅니다.\n다시 본인인증하시기 바랍니다.");
        	}else if( sGender != genderCd ){
        		alert("입력하신 고객정보와 본인인증정보가 다릅니다.\n다시 본인인증하시기 바랍니다.");
        	}else if( sNational != lfCd ){
        		alert("입력하신 고객정보와 본인인증정보가 다릅니다.\n다시 본인인증하시기 바랍니다.");
        	}else{
        		this.fn_hpCertifcation();
        	}
        }

        this.fn_hpCertifcation = function(){	
        	this.ds_rtsd0110.clearData();

        	var nRowRtsd0110 = this.ds_rtsd0110.addRow();
        	this.ds_rtsd0110.setColumn(nRowRtsd0110, 	"safekey",	nvl(this.ds_chgInfo.getColumn(0,"safeKey")) );
        	this.ds_rtsd0110.setColumn(nRowRtsd0110, 	"certCd",	nvl(this.divInfo.divChgInfo.ra_certification.value) );
        	this.ds_rtsd0110.setColumn(nRowRtsd0110, 	"certYn",	"Y");
        	this.ds_rtsd0110.setColumn(nRowRtsd0110, 	"mobNo",	nvl(this.ds_chgInfo.getColumn(0,"mobNo")) );
        	this.ds_rtsd0110.setColumn(nRowRtsd0110, 	"mobFirm",	nvl(this.ds_chgInfo.getColumn(0,"mobFirm")) );
        	this.ds_rtsd0110.setColumn(nRowRtsd0110, 	"custNo",	nvl(this.ds_chgInfo.getColumn(0,"custNo")) );

        	var sSvcID        	= "insertRtsd0110";                    
        	var sController   	= "rtms/sd/insertRtsd0110.do";
        	var sInDatasets   	= "input2=ds_rtsd0110:U";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";
        	var fn_callBack		= "fn_callBack";
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.ds_List.addEventHandler("onrowposchanged", this.ds_List_onrowposchanged, this);
            this.addEventHandler("onload", this.form_onload, this);
            this.div_search.btn_search.addEventHandler("onclick", this.fn_search, this);
            this.div_search.btn_save.addEventHandler("onclick", this.fn_save, this);
            this.div_search.btn_Excel.addEventHandler("onclick", this.fn_excel, this);
            this.div_search.edt_ordNo.addEventHandler("onkeyup", this.edt_ordNo_onkeyup, this);
            this.div_search.btn_odrPopUp.addEventHandler("onclick", this.fn_odrPopUp, this);
            this.div_search.edt_custNo.addEventHandler("onkeyup", this.custNo_onkeyup, this);
            this.div_search.btn_custPopUp.addEventHandler("onclick", this.fn_custPopUp, this);
            this.div_search.btn_new.addEventHandler("onclick", this.fn_new, this);
            this.div_search.btn_Delete.addEventHandler("onclick", this.fn_Delete, this);
            this.grdList.addEventHandler("oncellclick", this.grdList_oncellclick, this);
            this.grdList.addEventHandler("onselectchanged", this.grdList_oncellclick, this);
            this.divInfo.divChgCmInfo.cmbPayment.addEventHandler("onitemchanged", this.cmbPayment_onitemchanged, this);
            this.divInfo.divChgCmInfo.btn_PayPop.addEventHandler("onclick", this.btn_PayPop_onclick, this);
            this.divInfo.divChgCmInfo.cmbPaymentDay.addEventHandler("onitemchanged", this.cmbPaymentDay_onitemchanged, this);
            this.divInfo.divChgCmInfo.cmbGubun.addEventHandler("onitemchanged", this.cmbGubun_onitemchanged, this);
            this.divInfo.divChgInfo.edtAccNo.addEventHandler("onkillfocus", this.edtAccNo_onkillfocus, this);
            this.divInfo.divChgInfo.btn_AccConfirm.addEventHandler("onclick", this.btn_AccConfirm_onclick, this);
            this.divInfo.divChgInfo.maeBusiNo.addEventHandler("onchanged", this.divChgInfo_maeBusiNo_onchanged, this);
            this.divInfo.divChgInfo.cmbBank.addEventHandler("onitemchanged", this.cmbBank_onitemchanged, this);
            this.divInfo.divChgInfo.edtBirth.addEventHandler("onchanged", this.divChgInfo_edtBirth_onchanged, this);
            this.divInfo.divChgInfo.edtBirth.addEventHandler("canchange", this.divChgInfo_edtBirth_canchange, this);
            this.divInfo.divChgInfo.btn_File.addEventHandler("onclick", this.fileUpload, this);
            this.divInfo.divChgInfo.btn_arsCall.addEventHandler("onclick", this.btn_AccConfirm_onclick, this);
            this.divInfo.divChgInfo.nice_interface.addEventHandler("onusernotify", this.web_onusernotify, this);
            this.divInfo.divChgInfo.btn_certification.addEventHandler("onclick", this.div_cust_btn_certificationConfirm_onclick, this);
            this.divInfo.divChgInfo2.edtCardNo.addEventHandler("onkillfocus", this.edtCardNo_onkillfocus, this);
            this.divInfo.divChgInfo2.cmbCard.addEventHandler("onitemchanged", this.cmbCard_onitemchanged, this);
            this.divInfo.divChgInfo2.btn_BatchKey.addEventHandler("onclick", this.btn_batchKeyConfirm_onclick, this);
            this.divInfo.divChgInfo2.maeBusiNo.addEventHandler("onchanged", this.divChgInfo2_maeBusiNo_onchanged, this);
            this.divInfo.divChgInfo2.edtBirth.addEventHandler("onchanged", this.divChgInfo2_edtBirth_onchanged, this);
            this.divInfo.divChgInfo2.btn_File.addEventHandler("onclick", this.fileUpload, this);

        };

        this.loadIncludeScript("RTREPayment_tab1.xfdl");
        this.loadPreloadList();
       
    };
}
)();
