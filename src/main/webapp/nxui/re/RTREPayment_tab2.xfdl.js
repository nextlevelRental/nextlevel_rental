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
                this.set_titletext("변경 HISTORY");
                this._setFormPosition(0,0,1122,510);
            }
            this.getSetter("inheritanceid").set("");

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_List", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"rpcSeq\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"rpcDay\" type=\"STRING\" size=\"256\"/><Column id=\"rpcUid\" type=\"STRING\" size=\"256\"/><Column id=\"rpcRsn\" type=\"STRING\" size=\"256\"/><Column id=\"fileGrpSeq\" type=\"STRING\" size=\"256\"/><Column id=\"bfcustNo\" type=\"STRING\" size=\"256\"/><Column id=\"bftcgrpNo\" type=\"STRING\" size=\"256\"/><Column id=\"bfpayMthd\" type=\"STRING\" size=\"256\"/><Column id=\"bpayMthdNm\" type=\"STRING\" size=\"256\"/><Column id=\"bfpayDd\" type=\"STRING\" size=\"256\"/><Column id=\"bfpayDdNm\" type=\"STRING\" size=\"256\"/><Column id=\"bfaccSeq\" type=\"STRING\" size=\"256\"/><Column id=\"bfbankCd\" type=\"STRING\" size=\"256\"/><Column id=\"bfbankNm\" type=\"STRING\" size=\"256\"/><Column id=\"bfacctNo\" type=\"STRING\" size=\"256\"/><Column id=\"bfcustNm\" type=\"STRING\" size=\"256\"/><Column id=\"bfcrdSeq\" type=\"STRING\" size=\"256\"/><Column id=\"bfcardcomNm\" type=\"STRING\" size=\"256\"/><Column id=\"bfcadNo\" type=\"STRING\" size=\"256\"/><Column id=\"bfexpireYm\" type=\"STRING\" size=\"256\"/><Column id=\"bfebirDay\" type=\"STRING\" size=\"256\"/><Column id=\"bfbusNo\" type=\"STRING\" size=\"256\"/><Column id=\"bfbatchKey\" type=\"STRING\" size=\"256\"/><Column id=\"bfregId\" type=\"STRING\" size=\"256\"/><Column id=\"bfregNm\" type=\"STRING\" size=\"256\"/><Column id=\"bfaccStat\" type=\"STRING\" size=\"256\"/><Column id=\"bfacrqSt\" type=\"STRING\" size=\"256\"/><Column id=\"bfacrqFg\" type=\"STRING\" size=\"256\"/><Column id=\"bfacrqDay\" type=\"STRING\" size=\"256\"/><Column id=\"bfacrqSeq\" type=\"STRING\" size=\"256\"/><Column id=\"bfrpcSeq\" type=\"STRING\" size=\"256\"/><Column id=\"afcustNo\" type=\"STRING\" size=\"256\"/><Column id=\"aftcgrpNo\" type=\"STRING\" size=\"256\"/><Column id=\"afpayMthd\" type=\"STRING\" size=\"256\"/><Column id=\"apayMthdNm\" type=\"STRING\" size=\"256\"/><Column id=\"afpayDd\" type=\"STRING\" size=\"256\"/><Column id=\"afpayDdNm\" type=\"STRING\" size=\"256\"/><Column id=\"afaccSeq\" type=\"STRING\" size=\"256\"/><Column id=\"afbankCd\" type=\"STRING\" size=\"256\"/><Column id=\"afbankNm\" type=\"STRING\" size=\"256\"/><Column id=\"afacctNo\" type=\"STRING\" size=\"256\"/><Column id=\"afcustNm\" type=\"STRING\" size=\"256\"/><Column id=\"afcrdSeq\" type=\"STRING\" size=\"256\"/><Column id=\"afcardcomNm\" type=\"STRING\" size=\"256\"/><Column id=\"afcadNo\" type=\"STRING\" size=\"256\"/><Column id=\"afexpireYm\" type=\"STRING\" size=\"256\"/><Column id=\"afebirDay\" type=\"STRING\" size=\"256\"/><Column id=\"afbusNo\" type=\"STRING\" size=\"256\"/><Column id=\"afbatchKey\" type=\"STRING\" size=\"256\"/><Column id=\"afregId\" type=\"STRING\" size=\"256\"/><Column id=\"afregNm\" type=\"STRING\" size=\"256\"/><Column id=\"afaccStat\" type=\"STRING\" size=\"256\"/><Column id=\"afacrqSt\" type=\"STRING\" size=\"256\"/><Column id=\"afacrqFg\" type=\"STRING\" size=\"256\"/><Column id=\"afacrqDay\" type=\"STRING\" size=\"256\"/><Column id=\"afacrqSeq\" type=\"STRING\" size=\"256\"/><Column id=\"abrpcSeq\" type=\"STRING\" size=\"256\"/><Column id=\"delYn\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regNm\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgNm\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_bfList", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"rpcSeq\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"rpcDay\" type=\"STRING\" size=\"256\"/><Column id=\"rpcUid\" type=\"STRING\" size=\"256\"/><Column id=\"rpcRsn\" type=\"STRING\" size=\"256\"/><Column id=\"fileGrpSeq\" type=\"STRING\" size=\"256\"/><Column id=\"bfcustNo\" type=\"STRING\" size=\"256\"/><Column id=\"bftcgrpNo\" type=\"STRING\" size=\"256\"/><Column id=\"bfpayMthd\" type=\"STRING\" size=\"256\"/><Column id=\"bpayMthdNm\" type=\"STRING\" size=\"256\"/><Column id=\"bfpayDd\" type=\"STRING\" size=\"256\"/><Column id=\"bfpayDdNm\" type=\"STRING\" size=\"256\"/><Column id=\"bfaccSeq\" type=\"STRING\" size=\"256\"/><Column id=\"bfbankCd\" type=\"STRING\" size=\"256\"/><Column id=\"bfbankNm\" type=\"STRING\" size=\"256\"/><Column id=\"bfacctNo\" type=\"STRING\" size=\"256\"/><Column id=\"bfcustNm\" type=\"STRING\" size=\"256\"/><Column id=\"bfcrdSeq\" type=\"STRING\" size=\"256\"/><Column id=\"bfcardcomNm\" type=\"STRING\" size=\"256\"/><Column id=\"bfcadNo\" type=\"STRING\" size=\"256\"/><Column id=\"bfexpireYm\" type=\"STRING\" size=\"256\"/><Column id=\"bfebirDay\" type=\"STRING\" size=\"256\"/><Column id=\"bfbusNo\" type=\"STRING\" size=\"256\"/><Column id=\"bfbatchKey\" type=\"STRING\" size=\"256\"/><Column id=\"bfregId\" type=\"STRING\" size=\"256\"/><Column id=\"bfregNm\" type=\"STRING\" size=\"256\"/><Column id=\"bfaccStat\" type=\"STRING\" size=\"256\"/><Column id=\"bfacrqSt\" type=\"STRING\" size=\"256\"/><Column id=\"bfacrqFg\" type=\"STRING\" size=\"256\"/><Column id=\"bfacrqDay\" type=\"STRING\" size=\"256\"/><Column id=\"bfacrqSeq\" type=\"STRING\" size=\"256\"/><Column id=\"bfrpcSeq\" type=\"STRING\" size=\"256\"/><Column id=\"afcustNo\" type=\"STRING\" size=\"256\"/><Column id=\"aftcgrpNo\" type=\"STRING\" size=\"256\"/><Column id=\"afpayMthd\" type=\"STRING\" size=\"256\"/><Column id=\"apayMthdNm\" type=\"STRING\" size=\"256\"/><Column id=\"afpayDd\" type=\"STRING\" size=\"256\"/><Column id=\"afpayDdNm\" type=\"STRING\" size=\"256\"/><Column id=\"afaccSeq\" type=\"STRING\" size=\"256\"/><Column id=\"afbankCd\" type=\"STRING\" size=\"256\"/><Column id=\"afbankNm\" type=\"STRING\" size=\"256\"/><Column id=\"afacctNo\" type=\"STRING\" size=\"256\"/><Column id=\"afcustNm\" type=\"STRING\" size=\"256\"/><Column id=\"afcrdSeq\" type=\"STRING\" size=\"256\"/><Column id=\"afcardcomNm\" type=\"STRING\" size=\"256\"/><Column id=\"afcadNo\" type=\"STRING\" size=\"256\"/><Column id=\"afexpireYm\" type=\"STRING\" size=\"256\"/><Column id=\"afebirDay\" type=\"STRING\" size=\"256\"/><Column id=\"afbusNo\" type=\"STRING\" size=\"256\"/><Column id=\"afbatchKey\" type=\"STRING\" size=\"256\"/><Column id=\"afregId\" type=\"STRING\" size=\"256\"/><Column id=\"afregNm\" type=\"STRING\" size=\"256\"/><Column id=\"afaccStat\" type=\"STRING\" size=\"256\"/><Column id=\"afacrqSt\" type=\"STRING\" size=\"256\"/><Column id=\"afacrqFg\" type=\"STRING\" size=\"256\"/><Column id=\"afacrqDay\" type=\"STRING\" size=\"256\"/><Column id=\"afacrqSeq\" type=\"STRING\" size=\"256\"/><Column id=\"abrpcSeq\" type=\"STRING\" size=\"256\"/><Column id=\"delYn\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regNm\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgNm\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_afList", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"rpcSeq\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"rpcDay\" type=\"STRING\" size=\"256\"/><Column id=\"rpcUid\" type=\"STRING\" size=\"256\"/><Column id=\"rpcRsn\" type=\"STRING\" size=\"256\"/><Column id=\"fileGrpSeq\" type=\"STRING\" size=\"256\"/><Column id=\"bfcustNo\" type=\"STRING\" size=\"256\"/><Column id=\"bftcgrpNo\" type=\"STRING\" size=\"256\"/><Column id=\"bfpayMthd\" type=\"STRING\" size=\"256\"/><Column id=\"bpayMthdNm\" type=\"STRING\" size=\"256\"/><Column id=\"bfpayDd\" type=\"STRING\" size=\"256\"/><Column id=\"bfpayDdNm\" type=\"STRING\" size=\"256\"/><Column id=\"bfaccSeq\" type=\"STRING\" size=\"256\"/><Column id=\"bfbankCd\" type=\"STRING\" size=\"256\"/><Column id=\"bfbankNm\" type=\"STRING\" size=\"256\"/><Column id=\"bfacctNo\" type=\"STRING\" size=\"256\"/><Column id=\"bfcustNm\" type=\"STRING\" size=\"256\"/><Column id=\"bfcrdSeq\" type=\"STRING\" size=\"256\"/><Column id=\"bfcardcomNm\" type=\"STRING\" size=\"256\"/><Column id=\"bfcadNo\" type=\"STRING\" size=\"256\"/><Column id=\"bfexpireYm\" type=\"STRING\" size=\"256\"/><Column id=\"bfebirDay\" type=\"STRING\" size=\"256\"/><Column id=\"bfbusNo\" type=\"STRING\" size=\"256\"/><Column id=\"bfbatchKey\" type=\"STRING\" size=\"256\"/><Column id=\"bfregId\" type=\"STRING\" size=\"256\"/><Column id=\"bfregNm\" type=\"STRING\" size=\"256\"/><Column id=\"bfaccStat\" type=\"STRING\" size=\"256\"/><Column id=\"bfacrqSt\" type=\"STRING\" size=\"256\"/><Column id=\"bfacrqFg\" type=\"STRING\" size=\"256\"/><Column id=\"bfacrqDay\" type=\"STRING\" size=\"256\"/><Column id=\"bfacrqSeq\" type=\"STRING\" size=\"256\"/><Column id=\"bfrpcSeq\" type=\"STRING\" size=\"256\"/><Column id=\"afcustNo\" type=\"STRING\" size=\"256\"/><Column id=\"aftcgrpNo\" type=\"STRING\" size=\"256\"/><Column id=\"afpayMthd\" type=\"STRING\" size=\"256\"/><Column id=\"apayMthdNm\" type=\"STRING\" size=\"256\"/><Column id=\"afpayDd\" type=\"STRING\" size=\"256\"/><Column id=\"afpayDdNm\" type=\"STRING\" size=\"256\"/><Column id=\"afaccSeq\" type=\"STRING\" size=\"256\"/><Column id=\"afbankCd\" type=\"STRING\" size=\"256\"/><Column id=\"afbankNm\" type=\"STRING\" size=\"256\"/><Column id=\"afacctNo\" type=\"STRING\" size=\"256\"/><Column id=\"afcustNm\" type=\"STRING\" size=\"256\"/><Column id=\"afcrdSeq\" type=\"STRING\" size=\"256\"/><Column id=\"afcardcomNm\" type=\"STRING\" size=\"256\"/><Column id=\"afcadNo\" type=\"STRING\" size=\"256\"/><Column id=\"afexpireYm\" type=\"STRING\" size=\"256\"/><Column id=\"afebirDay\" type=\"STRING\" size=\"256\"/><Column id=\"afbusNo\" type=\"STRING\" size=\"256\"/><Column id=\"afbatchKey\" type=\"STRING\" size=\"256\"/><Column id=\"afregId\" type=\"STRING\" size=\"256\"/><Column id=\"afregNm\" type=\"STRING\" size=\"256\"/><Column id=\"afaccStat\" type=\"STRING\" size=\"256\"/><Column id=\"afacrqSt\" type=\"STRING\" size=\"256\"/><Column id=\"afacrqFg\" type=\"STRING\" size=\"256\"/><Column id=\"afacrqDay\" type=\"STRING\" size=\"256\"/><Column id=\"afacrqSeq\" type=\"STRING\" size=\"256\"/><Column id=\"abrpcSeq\" type=\"STRING\" size=\"256\"/><Column id=\"delYn\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regNm\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgNm\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

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


            
            // UI Components Initialize
            obj = new Div("div_subHist", "absolute", "10", "248", "1104", "247", null, null, this);
            obj.set_taborder("10");
            obj.set_text("DIV00");
            this.addChild(obj.name, obj);
            obj = new Grid("grd_AfterList", "absolute", "0", "141", "1102", "100", null, null, this.div_subHist);
            obj.set_taborder("3");
            obj.set_binddataset("ds_afList");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"60\"/><Column size=\"80\"/><Column size=\"85\"/><Column size=\"93\"/><Column size=\"83\"/><Column size=\"87\"/><Column size=\"106\"/><Column size=\"80\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"120\"/><Column size=\"100\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"결제일\"/><Cell col=\"1\" text=\"결제방법\"/><Cell col=\"2\" text=\"출금계좌&#13;&#10;은행\"/><Cell col=\"3\" text=\"출금계좌번호\"/><Cell col=\"4\" text=\"예금주\"/><Cell col=\"5\" text=\"카드이체&#13;&#10;카드사\"/><Cell col=\"6\" text=\"카드이체&#13;&#10;카드번호\"/><Cell col=\"7\" text=\"유효기간\"/><Cell col=\"8\" text=\"법정생년월일\"/><Cell col=\"9\" text=\"사업자번호\"/><Cell col=\"10\" text=\"BatchKey\"/><Cell col=\"11\" text=\"등록자\"/></Band><Band id=\"body\"><Cell text=\"bind:afpayDdNm\"/><Cell col=\"1\" text=\"bind:apayMthdNm\"/><Cell col=\"2\" text=\"bind:afbankNm\"/><Cell col=\"3\" text=\"bind:afacctNo\"/><Cell col=\"4\" text=\"bind:afcustNm\"/><Cell col=\"5\" text=\"bind:afcardcomNm\"/><Cell col=\"6\" text=\"bind:afcadNo\"/><Cell col=\"7\" text=\"bind:afexpireYm\" mask=\"####-##\"/><Cell col=\"8\" text=\"bind:afebirDay\" mask=\"##-##-##\"/><Cell col=\"9\" text=\"bind:afbusNo\" mask=\"###-##-#####\"/><Cell col=\"10\" text=\"bind:afbatchKey\"/><Cell col=\"11\" text=\"bind:afregId\"/></Band></Format></Formats>");
            this.div_subHist.addChild(obj.name, obj);
            obj = new Grid("grd_BeforeList", "absolute", "0", "0", "1102", "109", null, null, this.div_subHist);
            obj.set_taborder("1");
            obj.set_binddataset("ds_bfList");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"60\"/><Column size=\"80\"/><Column size=\"85\"/><Column size=\"93\"/><Column size=\"83\"/><Column size=\"87\"/><Column size=\"106\"/><Column size=\"80\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"120\"/><Column size=\"100\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell text=\"결제일\"/><Cell col=\"1\" text=\"결제방법\"/><Cell col=\"2\" text=\"출금계좌&#13;&#10;은행\"/><Cell col=\"3\" text=\"출금계좌번호\"/><Cell col=\"4\" text=\"예금주\"/><Cell col=\"5\" text=\"카드이체&#13;&#10;카드사\"/><Cell col=\"6\" text=\"카드이체&#13;&#10;카드번호\"/><Cell col=\"7\" text=\"유효기간\"/><Cell col=\"8\" text=\"법정생년월일\"/><Cell col=\"9\" text=\"사업자번호\"/><Cell col=\"10\" text=\"BatchKey\"/><Cell col=\"11\" text=\"등록자\"/></Band><Band id=\"body\"><Cell text=\"bind:bfpayDdNm\"/><Cell col=\"1\" text=\"bind:bpayMthdNm\"/><Cell col=\"2\" text=\"bind:bfbankNm\"/><Cell col=\"3\" text=\"bind:bfacctNo\"/><Cell col=\"4\" text=\"bind:bfcustNm\"/><Cell col=\"5\" text=\"bind:bfcardcomNm\"/><Cell col=\"6\" text=\"bind:bfcadNo\"/><Cell col=\"7\" text=\"bind:bfexpireYm\" mask=\"####-##\"/><Cell col=\"8\" text=\"bind:bfebirDay\" mask=\"##-##-##\"/><Cell col=\"9\" text=\"bind:bfbusNo\" mask=\"###-##-#####\"/><Cell col=\"10\" text=\"bind:bfbatchKey\"/><Cell col=\"11\" text=\"bind:bfregNm\"/></Band></Format></Formats>");
            this.div_subHist.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "0", "116", "84", "20", null, null, this.div_subHist);
            obj.set_taborder("4");
            obj.set_text("변경후");
            obj.set_cssclass("sta_WF_subTitle");
            this.div_subHist.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "10", "224", "120", "20", null, null, this);
            obj.set_taborder("19");
            obj.set_text("변경전");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "10", "10", "1102", "45", null, null, this);
            obj.set_taborder("1");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Button("btn_search", "absolute", null, null, "45", "22", "57", "9", this.div_search);
            obj.set_taborder("0");
            obj.set_text("조회");
            obj.set_cssclass("btn_WF_CRUD");
            obj.getSetter("domainId").set("nexa.search");
            obj.set_enable("true");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition", "absolute", "20", "10", "64", "20", null, null, this.div_search);
            obj.set_taborder("1");
            obj.set_text("계약번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("edt_ordNo", "absolute", "88", "10", "140", "21", null, null, this.div_search);
            obj.set_taborder("3");
            obj.set_enable("true");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_popUp", "absolute", "208", "9", "20", "21", null, null, this.div_search);
            obj.set_taborder("4");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("edt_custNoKeyword", "absolute", "467", "10", "140", "21", null, null, this.div_search);
            obj.set_taborder("5");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("edt_custNo", "absolute", "326", "10", "140", "21", null, null, this.div_search);
            obj.set_taborder("6");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_popUp2", "absolute", "448", "9", "20", "21", null, null, this.div_search);
            obj.set_taborder("7");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition00", "absolute", "258", "10", "64", "20", null, null, this.div_search);
            obj.set_taborder("8");
            obj.set_text("고객번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("Button00", "absolute", "1047", "10", "45", "22", null, null, this.div_search);
            obj.set_taborder("9");
            obj.set_text("엑셀");
            obj.set_cssclass("btn_WF_CRUD");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("sta_title", "absolute", "94", "61", null, "16", "930", null, this);
            obj.set_taborder("2");
            obj.set_text("Records Found");
            obj.set_cssclass("sta_WF_GridFound2");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("sta_total_cnt", "absolute", "-29", "61", null, "16", "1066", null, this);
            obj.set_taborder("3");
            obj.set_text("0");
            obj.set_cssclass("sta_WF_GridFound");
            obj.style.set_align("right middle");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("sta_result", "absolute", "-66", "68", null, "16", "1122", null, this);
            obj.set_taborder("4");
            obj.set_text("검색결과");
            obj.set_cssclass("sta_WF_GridFound");
            obj.style.set_align("left middle");
            obj.style.set_font("bold 9 Verdana");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_List", "absolute", "10", "64", "1102", "150", null, null, this);
            obj.set_taborder("5");
            obj.set_binddataset("ds_List");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"120\"/><Column size=\"80\"/><Column size=\"0\"/><Column size=\"93\"/><Column size=\"150\"/><Column size=\"91\"/><Column size=\"60\"/><Column size=\"80\"/><Column size=\"120\"/><Column size=\"80\"/><Column size=\"93\"/><Column size=\"123\"/><Column size=\"80\"/><Column size=\"120\"/><Column size=\"80\"/><Column size=\"77\"/><Column size=\"120\"/><Column size=\"80\"/><Column size=\"100\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"계약번호\"/><Cell col=\"1\" text=\"차량번호\"/><Cell col=\"2\" text=\"고객번호\"/><Cell col=\"3\" text=\"고객명\"/><Cell col=\"4\" text=\"상품명\"/><Cell col=\"5\" text=\"결제방법\"/><Cell col=\"6\" text=\"결제일\"/><Cell col=\"7\" text=\"은행\"/><Cell col=\"8\" text=\"계좌번호\"/><Cell col=\"9\" text=\"예금주\"/><Cell col=\"10\" text=\"카드사\"/><Cell col=\"11\" text=\"카드번호\"/><Cell col=\"12\" text=\"등록자코드\"/><Cell col=\"13\" text=\"등록자명\"/><Cell col=\"14\" text=\"등록일자\"/><Cell col=\"15\" text=\"수정자코드\"/><Cell col=\"16\" text=\"수정자명\"/><Cell col=\"17\" text=\"수정일자\"/><Cell col=\"18\" style=\"align: ;\" text=\"변경사유\"/></Band><Band id=\"body\"><Cell displaytype=\"text\" edittype=\"readonly\" text=\"bind:ordNo\"/><Cell col=\"1\" text=\"bind:carNo\"/><Cell col=\"2\" displaytype=\"none\" text=\"bind:password\"/><Cell col=\"3\" text=\"bind:custNm\"/><Cell col=\"4\" text=\"bind:matNm\"/><Cell col=\"5\" text=\"bind:apayMthdNm\"/><Cell col=\"6\" text=\"bind:afpayDdNm\"/><Cell col=\"7\" text=\"bind:afbankNm\"/><Cell col=\"8\" text=\"bind:afacctNo\"/><Cell col=\"9\" text=\"bind:afcustNm\"/><Cell col=\"10\" text=\"bind:afcardcomNm\"/><Cell col=\"11\" text=\"bind:afcadNo\"/><Cell col=\"12\" text=\"bind:regId\"/><Cell col=\"13\" text=\"bind:regNm\"/><Cell col=\"14\" displaytype=\"date\" text=\"bind:regDt\" calendardisplaynulltype=\"none\"/><Cell col=\"15\" text=\"bind:chgId\"/><Cell col=\"16\" text=\"bind:chgNm\"/><Cell col=\"17\" displaytype=\"date\" text=\"bind:chgDt\" calendardisplaynulltype=\"none\"/><Cell col=\"18\" style=\"align:left;\" text=\"bind:rpcRsn\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Button("Button01", "absolute", "1067", "224", "45", "22", null, null, this);
            obj.set_taborder("20");
            obj.set_text("엑셀");
            obj.set_cssclass("btn_WF_CRUD");
            this.addChild(obj.name, obj);

            obj = new Button("Button02", "absolute", "1067", "362", "45", "22", null, null, this);
            obj.set_taborder("21");
            obj.set_text("엑셀");
            obj.set_cssclass("btn_WF_CRUD");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1104, 247, this.div_subHist,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("10");
            		p.set_text("DIV00");

            	}
            );
            this.div_subHist.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1102, 45, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("1");
            		p.set_text("Div00");
            		p.set_scrollbars("none");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1122, 510, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("Authority");
            		p.getSetter("inheritanceid").set("");
            		p.set_titletext("변경 HISTORY");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTREPayment_tab2.xfdl", "lib::comLib.xjs");
        this.registerScript("RTREPayment_tab2.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분 : 수금관리 > 결제정보관리 > 결제정보관리 > 결제정보변경 > 변경 HISTORY
         * 02. 그룹명   : RTREPayment_tab2.xfdl
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
        	 * 그룹 변수 선언부
        	 ************************************************************************/
        	 nvl = function(p_value) {
        		var strVal = new String(p_value);
        		if(strVal == null || strVal == "null" || strVal == "undefined"){
        			return "";
        		} else {
        			return strVal.trim();
        		}
        	}
            //-------------------------------------------------------------------------------   
        	//폼로드시 공통함수      
        	//-------------------------------------------------------------------------------    	 
        	this.form_onload = function(obj,e)
        	{
        		Ex.core.init(obj); 	
        		this.setBtnAuth(this.div_search);
        		
        		var auth = Ex.core.o_auth;
        		if( auth.exptAuthYn == "N" ){
        			this.Button00.set_enable(false);
        			this.Button01.set_enable(false);
        			this.Button02.set_enable(false);
        		}
        	} 
        		 
        	/***********************************************************************************
        	* Transaction Function
        	***********************************************************************************/

        	/***********************************************************************************
        	* CallBack Event (strSvcId - Sevice ID, nErrorCode - ErrorCode, strErrorMsg - Error Message)
        	***********************************************************************************/
            //-------------------------------------------------------------------------------  
            // callback함수
            //-------------------------------------------------------------------------------      
        	this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg)
        	{ 
        		if (nErrorCode < 0) 
        		{
        			return Ex.core.comMsg("alert",strErrorMsg);		
        		}
        		
        		switch (strSvcId) 
        		{
        			case "listPaymentHist":
        				if(this.ds_List.rowcount == 0) 
        				{
        					this.grd_List.set_nodatatext("조회된 데이터가 없습니다.");
        				}	
        				this.sta_total_cnt.set_text(this.ds_List.rowcount);
        				this.grd_List_oncellclick(this.grd_List,0);
        				
        				break;
        			case "listCustInfo":
        				if(this.ds_cust.rowcount > 0 ) {
        					this.div_search.edt_custNoKeyword.set_value(this.ds_cust.getColumn(0, "custNm"));
        					this.fn_search();
        				}	
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
        	//검색결과 그리드 클릭시
            //-------------------------------------------------------------------------------  	
        	this.grd_List_oncellclick = function(obj,e)
        	{
        		//변경전 변경후 리스트 COPY
        		if(this.ds_List.rowcount > 0) {
        			this.ds_afList.clearData();
        			this.ds_bfList.clearData();
        			this.ds_afList.addRow();
        			this.ds_bfList.addRow();
        			this.ds_afList.copyRow(0,this.ds_List, e.row);
        			this.ds_bfList.copyRow(0,this.ds_List, e.row);
        		}
        		else {
        			this.div_subHist.grd_BeforeList.set_nodatatext("조회된 데이터가 없습니다.");
        			this.div_subHist.grd_AfterList.set_nodatatext("조회된 데이터가 없습니다.");			
        		}
        	}	

        	/***********************************************************************************
        	* User Function
        	***********************************************************************************/
            //-------------------------------------------------------------------------------  	
        	//조회
            //-------------------------------------------------------------------------------  	
        	this.fn_search = function() 
        	{
        		this.sta_total_cnt.set_text(0);	
        		this.ds_List.clearData();
        		this.ds_bfList.clearData();
        		this.ds_afList.clearData();
        		
        		if(nvl(this.div_search.edt_ordNo.value) == "" && nvl(this.div_search.edt_custNo.value) == "") 
        		{
        			this.alert("조회조건을 입력하세요.");
        			return;
        		}
        		else 
        		{
        			var sSvcID        	= "listPaymentHist";                    
        			var sController   	= "ntrms/re/listPaymentHist.do";
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
        		this.div_search.edt_custNoKeyword.set_value("");	
        		if ( e.keycode == 13 )
        		{
        			if(nvl(this.div_search.edt_custNo.value) == "") {
        				this.alert("고객번호를 입력하세요");
        				this.div_search.edt_custNo.setFocus();
        				return;
        			}
        			//고객명조회
        			this.fn_getCustNm();
        		}		
        	}	
            //-------------------------------------------------------------------------------  
        	//주문번호 팝업창
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
        	//엑셀저장
            //-------------------------------------------------------------------------------  	
        	this.Button00_onclick = function(obj,e)
        	{
        		//var grdArry = new Array();
        		//grdArry[0] = this.grd_List;
        		//grdArry[1] = this.div_subHist.grd_BeforeList;
        		//grdArry[2] = this.div_subHist.grd_AfterList;
        		Ex.core.exportExcel(this, this.grd_List);	
        	}
        	
        	this.Button01_onclick = function(obj,e)
        	{
        		Ex.core.exportExcel(this, this.div_subHist.grd_BeforeList);
        	}

        	this.Button02_onclick = function(obj,e)
        	{
        		Ex.core.exportExcel(this, this.div_subHist.grd_AfterList);
        	}
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.div_search.btn_search.addEventHandler("onclick", this.fn_search, this);
            this.div_search.edt_ordNo.addEventHandler("onkeyup", this.edt_ordNo_onkeyup, this);
            this.div_search.btn_popUp.addEventHandler("onclick", this.fn_odrPopUp, this);
            this.div_search.edt_custNo.addEventHandler("onkeyup", this.custNo_onkeyup, this);
            this.div_search.btn_popUp2.addEventHandler("onclick", this.fn_custPopUp, this);
            this.div_search.Button00.addEventHandler("onclick", this.Button00_onclick, this);
            this.grd_List.addEventHandler("oncellclick", this.grd_List_oncellclick, this);
            this.grd_List.addEventHandler("onselectchanged", this.grd_List_oncellclick, this);
            this.Button01.addEventHandler("onclick", this.Button01_onclick, this);
            this.Button02.addEventHandler("onclick", this.Button02_onclick, this);

        };

        this.loadIncludeScript("RTREPayment_tab2.xfdl");

       
    };
}
)();
