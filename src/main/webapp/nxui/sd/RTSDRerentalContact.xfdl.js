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
                this.set_name("RTSDRerentalContact");
                this.set_classname("RTCSHappyCallRegister");
                this.set_titletext("재렌탈계약 상담");
                this._setFormPosition(0,0,1147,492);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("dsS103", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsS104", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsOrdList", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"num\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"cdText\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsS030", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_provsnList", this);
            obj._setContents("<ColumnInfo><Column id=\"provsnNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"posCd\" type=\"STRING\" size=\"256\"/><Column id=\"addr1\" type=\"STRING\" size=\"256\"/><Column id=\"addr2\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"patternNm\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"period\" type=\"STRING\" size=\"256\"/><Column id=\"regiAmt\" type=\"STRING\" size=\"256\"/><Column id=\"rentAmt\" type=\"STRING\" size=\"256\"/><Column id=\"planDay\" type=\"STRING\" size=\"256\"/><Column id=\"emailAddr\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"realOrdNo\" type=\"STRING\" size=\"256\"/><Column id=\"chanCd\" type=\"STRING\" size=\"256\"/><Column id=\"ordDay\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"osDay\" type=\"STRING\" size=\"256\"/><Column id=\"osDayF\" type=\"STRING\" size=\"256\"/><Column id=\"osDayT\" type=\"STRING\" size=\"256\"/><Column id=\"psCd\" type=\"STRING\" size=\"256\"/><Column id=\"provsnSt\" type=\"STRING\" size=\"256\"/><Column id=\"provsnStDtl\" type=\"STRING\" size=\"256\"/><Column id=\"callSeq\" type=\"STRING\" size=\"256\"/><Column id=\"recallDay\" type=\"STRING\" size=\"256\"/><Column id=\"recallTm\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"contactGet\" type=\"STRING\" size=\"256\"/><Column id=\"fOrdNo\" type=\"STRING\" size=\"256\"/><Column id=\"orgAgent\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsS103_1", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsS104_1", this);
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
            obj._setContents("<ColumnInfo><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"bldMngNo\" type=\"STRING\" size=\"256\"/><Column id=\"posCd\" type=\"STRING\" size=\"256\"/><Column id=\"addr1\" type=\"STRING\" size=\"256\"/><Column id=\"addr2\" type=\"STRING\" size=\"256\"/><Column id=\"emailAddr\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsListForExcel", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"provsnNo\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"ordDay\" type=\"STRING\" size=\"256\"/><Column id=\"periodCd\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"cnt\" type=\"STRING\" size=\"256\"/><Column id=\"psNm\" type=\"STRING\" size=\"256\"/><Column id=\"mfpYn\" type=\"STRING\" size=\"256\"/><Column id=\"osDayT\" type=\"STRING\" size=\"256\"/><Column id=\"rentAmt\" type=\"STRING\" size=\"256\"/><Column id=\"addr1\" type=\"STRING\" size=\"256\"/><Column id=\"addr2\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"stat\" type=\"STRING\" size=\"256\"/><Column id=\"statDetl\" type=\"STRING\" size=\"256\"/><Column id=\"planDay\" type=\"STRING\" size=\"256\"/><Column id=\"contactGet\" type=\"STRING\" size=\"256\"/><Column id=\"contactDesc\" type=\"STRING\" size=\"256\"/><Column id=\"posCd\" type=\"STRING\" size=\"256\"/><Column id=\"reqText\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"sumArreAmt\" type=\"STRING\" size=\"256\"/><Column id=\"prvOrdNo\" type=\"STRING\" size=\"256\"/><Column id=\"custReq\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"provsnSt\" type=\"STRING\" size=\"256\"/><Column id=\"provsnStDtl\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"bldMngNo\" type=\"STRING\" size=\"256\"/><Column id=\"emailAddr\" type=\"STRING\" size=\"256\"/><Column id=\"callSeq\" type=\"STRING\" size=\"256\"/><Column id=\"callId\" type=\"STRING\" size=\"256\"/><Column id=\"callDay\" type=\"STRING\" size=\"256\"/><Column id=\"callDtl\" type=\"STRING\" size=\"256\"/><Column id=\"nagYn\" type=\"STRING\" size=\"256\"/><Column id=\"cagYn\" type=\"STRING\" size=\"256\"/><Column id=\"cagYn1\" type=\"STRING\" size=\"256\"/><Column id=\"cagYn2\" type=\"STRING\" size=\"256\"/><Column id=\"cagYn3\" type=\"STRING\" size=\"256\"/><Column id=\"cagYn4\" type=\"STRING\" size=\"256\"/><Column id=\"cthYn1\" type=\"STRING\" size=\"256\"/><Column id=\"cthYn2\" type=\"STRING\" size=\"256\"/><Column id=\"cthYn3\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsList", this);
            obj._setContents("<ColumnInfo><Column id=\"provsnNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"posCd\" type=\"STRING\" size=\"256\"/><Column id=\"addr1\" type=\"STRING\" size=\"256\"/><Column id=\"addr2\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"patternNm\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"period\" type=\"STRING\" size=\"256\"/><Column id=\"regiAmt\" type=\"STRING\" size=\"256\"/><Column id=\"rentAmt\" type=\"STRING\" size=\"256\"/><Column id=\"planDay\" type=\"STRING\" size=\"256\"/><Column id=\"emailAddr\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"realOrdNo\" type=\"STRING\" size=\"256\"/><Column id=\"chanCd\" type=\"STRING\" size=\"256\"/><Column id=\"ordDay\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"osDay\" type=\"STRING\" size=\"256\"/><Column id=\"osDayF\" type=\"STRING\" size=\"256\"/><Column id=\"osDayT\" type=\"STRING\" size=\"256\"/><Column id=\"psCd\" type=\"STRING\" size=\"256\"/><Column id=\"provsnSt\" type=\"STRING\" size=\"256\"/><Column id=\"provsnStDtl\" type=\"STRING\" size=\"256\"/><Column id=\"callSeq\" type=\"STRING\" size=\"256\"/><Column id=\"recallDay\" type=\"STRING\" size=\"256\"/><Column id=\"recallTm\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"contactGet\" type=\"STRING\" size=\"256\"/><Column id=\"fOrdNo\" type=\"STRING\" size=\"256\"/><Column id=\"orgAgent\" type=\"STRING\" size=\"256\"/><Column id=\"mfpYn\" type=\"STRING\" size=\"256\"/><Column id=\"b00007\" type=\"STRING\" size=\"256\"/><Column id=\"callDay\" type=\"STRING\" size=\"256\"/><Column id=\"callId\" type=\"STRING\" size=\"256\"/><Column id=\"nagYn\" type=\"STRING\" size=\"256\"/><Column id=\"cagYn\" type=\"STRING\" size=\"256\"/><Column id=\"cagYn1\" type=\"STRING\" size=\"256\"/><Column id=\"cagYn2\" type=\"STRING\" size=\"256\"/><Column id=\"cagYn3\" type=\"STRING\" size=\"256\"/><Column id=\"cagYn4\" type=\"STRING\" size=\"256\"/><Column id=\"cthYn1\" type=\"STRING\" size=\"256\"/><Column id=\"cthYn2\" type=\"STRING\" size=\"256\"/><Column id=\"cthYn3\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsS043", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsList00", this);
            obj._setContents("<ColumnInfo><Column id=\"provsnNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"posCd\" type=\"STRING\" size=\"256\"/><Column id=\"addr1\" type=\"STRING\" size=\"256\"/><Column id=\"addr2\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"patternNm\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"period\" type=\"STRING\" size=\"256\"/><Column id=\"regiAmt\" type=\"STRING\" size=\"256\"/><Column id=\"rentAmt\" type=\"STRING\" size=\"256\"/><Column id=\"planDay\" type=\"STRING\" size=\"256\"/><Column id=\"emailAddr\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"realOrdNo\" type=\"STRING\" size=\"256\"/><Column id=\"chanCd\" type=\"STRING\" size=\"256\"/><Column id=\"ordDay\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"osDay\" type=\"STRING\" size=\"256\"/><Column id=\"osDayF\" type=\"STRING\" size=\"256\"/><Column id=\"osDayT\" type=\"STRING\" size=\"256\"/><Column id=\"psCd\" type=\"STRING\" size=\"256\"/><Column id=\"provsnSt\" type=\"STRING\" size=\"256\"/><Column id=\"provsnStDtl\" type=\"STRING\" size=\"256\"/><Column id=\"callSeq\" type=\"STRING\" size=\"256\"/><Column id=\"recallDay\" type=\"STRING\" size=\"256\"/><Column id=\"recallTm\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"contactGet\" type=\"STRING\" size=\"256\"/><Column id=\"fOrdNo\" type=\"STRING\" size=\"256\"/><Column id=\"orgAgent\" type=\"STRING\" size=\"256\"/><Column id=\"mfpYn\" type=\"STRING\" size=\"256\"/><Column id=\"b00007\" type=\"STRING\" size=\"256\"/><Column id=\"callDay\" type=\"STRING\" size=\"256\"/><Column id=\"callId\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsRealOrdList", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"num\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static01", "absolute", "1122", "0", "25", "492", null, null, this);
            obj.set_taborder("9");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Div("div_detail", "absolute", "0", "339", "1133", "153", null, null, this);
            obj.set_taborder("11");
            obj.set_scrollbars("none");
            obj.style.set_border("0 solid #808080ff");
            this.addChild(obj.name, obj);
            obj = new Edit("ed_bldMngNo", "absolute", "432", "35", "78", "21", null, null, this.div_detail);
            obj.set_taborder("113");
            obj.set_enable("false");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("Static34", "absolute", "0", "30", "1122", "31", null, null, this.div_detail);
            obj.set_taborder("56");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("st_rentalAmt", "absolute", "0", "30", "130", "31", null, null, this.div_detail);
            obj.set_taborder("57");
            obj.set_text("잔여렌탈료");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_detail.addChild(obj.name, obj);
            obj = new Edit("ed_rentalAmt", "absolute", "134", "35", "142", "21", null, null, this.div_detail);
            obj.set_taborder("58");
            obj.set_enable("false");
            this.div_detail.addChild(obj.name, obj);
            obj = new Edit("ed_posCd", "absolute", "414", "35", "71", "21", null, null, this.div_detail);
            obj.set_taborder("60");
            obj.set_enable("false");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "0", "60", "561", "31", null, null, this.div_detail);
            obj.set_taborder("61");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("st_carNo", "absolute", "0", "60", "130", "31", null, null, this.div_detail);
            obj.set_taborder("62");
            obj.set_text("차량번호");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.div_detail.addChild(obj.name, obj);
            obj = new Edit("ed_carNo", "absolute", "134", "65", "142", "21", null, null, this.div_detail);
            obj.set_taborder("63");
            obj.set_enable("false");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("Static26", "absolute", "0", "0", "1122", "31", null, null, this.div_detail);
            obj.set_taborder("68");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("st_custNm", "absolute", "0", "0", "130", "31", null, null, this.div_detail);
            obj.set_taborder("69");
            obj.set_text("고객명");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_detail.addChild(obj.name, obj);
            obj = new Edit("ed_custNm", "absolute", "134", "5", "142", "21", null, null, this.div_detail);
            obj.set_taborder("70");
            obj.set_enable("false");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("st_osDay", "absolute", "560", "0", "130", "31", null, null, this.div_detail);
            obj.set_taborder("71");
            obj.set_text("계약만료일");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("Static10", "absolute", "0", "90", "1122", "31", null, null, this.div_detail);
            obj.set_taborder("72");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("st_reqDesc", "absolute", "0", "90", "130", "31", null, null, this.div_detail);
            obj.set_taborder("73");
            obj.set_text("고객요청사항");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.div_detail.addChild(obj.name, obj);
            obj = new Edit("ed_reqDesc", "absolute", "134", "95", "142", "21", null, null, this.div_detail);
            obj.set_taborder("74");
            obj.set_enable("true");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("Static11", "absolute", "560", "60", "562", "31", null, null, this.div_detail);
            obj.set_taborder("75");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("st_ordDay", "absolute", "560", "60", "130", "31", null, null, this.div_detail);
            obj.set_taborder("76");
            obj.set_text("예약접수일");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.div_detail.addChild(obj.name, obj);
            obj = new Calendar("ca_osDay", "absolute", "694", "5", "143", "21", null, null, this.div_detail);
            this.div_detail.addChild(obj.name, obj);
            obj.set_taborder("81");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Edit("ed_addr1", "absolute", "485", "35", "371", "21", null, null, this.div_detail);
            obj.set_taborder("82");
            obj.set_enable("false");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("st_addr", "absolute", "280", "30", "130", "31", null, null, this.div_detail);
            obj.set_taborder("84");
            obj.set_text("주소");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("st_mobNo", "absolute", "280", "0", "130", "31", null, null, this.div_detail);
            obj.set_taborder("86");
            obj.set_text("연락처");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_detail.addChild(obj.name, obj);
            obj = new Edit("ed_mobNo", "absolute", "414", "5", "142", "21", null, null, this.div_detail);
            obj.set_taborder("87");
            obj.set_enable("true");
            obj.set_readonly("true");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("st_contactCnt", "absolute", "840", "0", "130", "31", null, null, this.div_detail);
            obj.set_taborder("90");
            obj.set_text("컨택횟수");
            obj.set_cssclass("sta_WF_detailLabel");
            this.div_detail.addChild(obj.name, obj);
            obj = new Edit("ed_contactCnt", "absolute", "974", "5", "143", "21", null, null, this.div_detail);
            obj.set_taborder("91");
            obj.set_enable("false");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("st_stat", "absolute", "280", "60", "130", "31", null, null, this.div_detail);
            obj.set_taborder("92");
            obj.set_text("상태");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("st_addMobNo", "absolute", "840", "60", "130", "31", null, null, this.div_detail);
            obj.set_taborder("94");
            obj.set_text("추가연락처");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("st_ordNoList", "absolute", "280", "90", "130", "31", null, null, this.div_detail);
            obj.set_taborder("95");
            obj.set_text("보유계약번호");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.div_detail.addChild(obj.name, obj);
            obj = new Edit("ed_addMobNo", "absolute", "974", "65", "143", "21", null, null, this.div_detail);
            obj.set_taborder("98");
            obj.set_enable("true");
            this.div_detail.addChild(obj.name, obj);
            obj = new Combo("cb_ordNoList", "absolute", "36.54%", "96", null, "20", "50.93%", null, this.div_detail);
            this.div_detail.addChild(obj.name, obj);
            obj.set_taborder("102");
            obj.set_innerdataset("@dsOrdList");
            obj.set_codecolumn("ordNo");
            obj.set_datacolumn("ordNo");
            obj = new Edit("ed_ordDetl", "absolute", "560", "95", "557", "21", null, null, this.div_detail);
            obj.set_taborder("106");
            obj.set_enable("false");
            obj.set_displaynulltext("차종/차량번호/계약일자/수량/프리미엄서비스");
            this.div_detail.addChild(obj.name, obj);
            obj = new Calendar("ca_ordDay", "absolute", "694", "65", "143", "21", null, null, this.div_detail);
            this.div_detail.addChild(obj.name, obj);
            obj.set_taborder("107");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Combo("cb_stat", "absolute", "36.54%", "66", null, "20", "57.37%", null, this.div_detail);
            this.div_detail.addChild(obj.name, obj);
            obj.set_taborder("108");
            obj.set_innerdataset("@dsS103_1");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj = new Combo("cb_statDetl", "absolute", "42.37%", "66", null, "20", "50.93%", null, this.div_detail);
            this.div_detail.addChild(obj.name, obj);
            obj.set_taborder("110");
            obj.set_innerdataset("@dsS104_1");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj = new Button("bt_addr", "absolute", "466", "34", "20", "21", null, null, this.div_detail);
            obj.set_taborder("111");
            obj.set_cssclass("btn_WF_edtSch");
            obj.set_enable("true");
            obj.getSetter("domainId").set("nexa.save");
            this.div_detail.addChild(obj.name, obj);
            obj = new Edit("ed_addr2", "absolute", "859", "35", "259", "21", null, null, this.div_detail);
            obj.set_taborder("112");
            obj.set_enable("false");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "0", "120", "1122", "31", null, null, this.div_detail);
            obj.set_taborder("114");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_detail.addChild(obj.name, obj);
            obj = new Static("st_reqDesc01", "absolute", "0", "120", "130", "31", null, null, this.div_detail);
            obj.set_taborder("117");
            obj.set_text("재컨택일자");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.div_detail.addChild(obj.name, obj);
            obj = new Calendar("ca_recallDay", "absolute", "134", "125", "143", "21", null, null, this.div_detail);
            this.div_detail.addChild(obj.name, obj);
            obj.set_taborder("118");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Static("st_reqDesc02", "absolute", "280", "120", "130", "31", null, null, this.div_detail);
            obj.set_taborder("119");
            obj.set_text("진계약번호");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.div_detail.addChild(obj.name, obj);
            obj = new Edit("ed_realOrdNo", "absolute", "560", "125", "142", "21", null, null, this.div_detail);
            obj.set_taborder("120");
            obj.set_imemode("alpha");
            obj.set_inputfilter("dot,comma,sign,symbol,space");
            obj.set_inputtype("number,english");
            this.div_detail.addChild(obj.name, obj);
            obj = new Combo("cb_realOrdList", "absolute", "36.54%", "125", null, "20", "50.93%", null, this.div_detail);
            this.div_detail.addChild(obj.name, obj);
            obj.set_taborder("121");
            obj.set_innerdataset("@dsRealOrdList");
            obj.set_codecolumn("num");
            obj.set_datacolumn("ordNo");
            obj = new Button("btn_realOrdAdd", "absolute", "62.22%", "125", null, "20", "33.54%", null, this.div_detail);
            obj.set_taborder("122");
            obj.set_text("추가");
            this.div_detail.addChild(obj.name, obj);

            obj = new Button("btn_new", "absolute", "999", "315", "72", "22", null, null, this);
            obj.set_taborder("12");
            obj.set_text("상담전환");
            obj.set_cssclass("btn_WF_module");
            obj.getSetter("domainId").set("nexa.save");
            obj.set_visible("true");
            this.addChild(obj.name, obj);

            obj = new Button("btn_del", "absolute", "1077", "315", "45", "22", null, null, this);
            obj.set_taborder("13");
            obj.set_text("삭제");
            obj.set_cssclass("btn_WF_module");
            obj.getSetter("domainId").set("nexa.save");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Button("btn_contact", "absolute", "1077", "315", "45", "22", null, null, this);
            obj.set_taborder("15");
            obj.set_text("상담");
            obj.set_cssclass("btn_WF_module");
            obj.set_visible("true");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Button("btn_addr_save", "absolute", "1075", "374", "45", "22", null, null, this);
            obj.set_taborder("16");
            obj.set_text("저장");
            obj.getSetter("domainId").set("nexa.save");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_newOrdNo", "absolute", "850", "315", "142", "21", null, null, this);
            obj.set_taborder("18");
            obj.set_readonly("false");
            obj.set_displaynulltext("전환할 주문번호를 입력해주세요.");
            this.addChild(obj.name, obj);

            obj = new Tab("tab_cond", "absolute", "0%", "0", null, "147", "2.27%", null, this);
            obj.set_taborder("19");
            obj.set_tabindex("0");
            obj.set_scrollbars("autoboth");
            this.addChild(obj.name, obj);
            obj = new Tabpage("tabpage1", this.tab_cond);
            obj.set_text("조건1");
            obj.set_url("sd::RTSDReRentalContact_tab01.xfdl");
            this.tab_cond.addChild(obj.name, obj);
            obj = new Tabpage("tabpage2", this.tab_cond);
            obj.set_text("조건2");
            obj.set_url("sd::RTSDReRentalContact_tab02.xfdl");
            this.tab_cond.addChild(obj.name, obj);
            obj = new Tabpage("tabpage3", this.tab_cond);
            obj.set_text("조건3");
            obj.set_url("sd::RTSDReRentalContact_tab03.xfdl");
            this.tab_cond.addChild(obj.name, obj);

            obj = new Grid("grid_rerental", "absolute", "0", "145", "1122", "167", null, null, this);
            obj.set_taborder("5");
            obj.set_binddataset("dsList");
            obj.set_autofittype("none");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"82\"/><Column size=\"90\"/><Column size=\"90\"/><Column size=\"0\"/><Column size=\"93\"/><Column size=\"90\"/><Column size=\"90\"/><Column size=\"90\"/><Column size=\"60\"/><Column size=\"90\"/><Column size=\"40\"/><Column size=\"90\"/><Column size=\"90\"/><Column size=\"90\"/><Column size=\"90\"/><Column size=\"101\"/><Column size=\"84\"/><Column size=\"100\"/><Column size=\"60\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"40\"/><Column size=\"80\"/><Column size=\"60\"/><Column size=\"60\"/><Column size=\"60\"/><Column size=\"60\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"24\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"가계약번호\"/><Cell col=\"1\" text=\"계약번호\"/><Cell col=\"2\" text=\"고객명\"/><Cell col=\"3\" text=\"휴대폰\"/><Cell col=\"4\" text=\"계약일자\"/><Cell col=\"5\" text=\"계약기간\"/><Cell col=\"6\" text=\"장착일자\"/><Cell col=\"7\" text=\"연락처\"/><Cell col=\"8\" text=\"상태\"/><Cell col=\"9\" text=\"세부상태\"/><Cell col=\"10\" text=\"컨택\"/><Cell col=\"11\" text=\"재컨택일자\"/><Cell col=\"12\" text=\"재컨택시간\"/><Cell col=\"13\" text=\"상품명\"/><Cell col=\"14\" text=\"수량\"/><Cell col=\"15\" text=\"프리미엄서비스\"/><Cell col=\"16\" text=\"중도완납여부\"/><Cell col=\"17\" text=\"상담일자\"/><Cell col=\"18\" text=\"상담사\"/><Cell col=\"19\" text=\"걱정제로잔여횟수\"/><Cell col=\"20\" text=\"우편번호\"/><Cell col=\"21\" text=\"주소\"/><Cell col=\"22\" text=\"상세주소\"/><Cell col=\"23\" text=\"동의하지않음\"/><Cell col=\"24\" text=\"SMS동의\"/><Cell col=\"25\" text=\"전화동의\"/><Cell col=\"26\" text=\"이메일동의\"/><Cell col=\"27\" text=\"우편동의\"/></Band><Band id=\"body\"><Cell text=\"bind:provsnNo\"/><Cell col=\"1\" displaytype=\"normal\" edittype=\"readonly\" text=\"bind:ordNo\" editdisplay=\"edit\" calendardisplaynulltype=\"none\"/><Cell col=\"2\" edittype=\"none\" text=\"bind:custNm\"/><Cell col=\"3\" text=\"bind:mobNo\"/><Cell col=\"4\" displaytype=\"date\" edittype=\"none\" text=\"bind:ordDay\" calendardisplaynulltype=\"none\"/><Cell col=\"5\" displaytype=\"normal\" edittype=\"none\" text=\"bind:period\" calendardisplaynulltype=\"none\"/><Cell col=\"6\" displaytype=\"date\" edittype=\"none\" text=\"bind:procDay\" editdisplay=\"display\" calendardisplay=\"edit\" calendardisplaynulltype=\"none\"/><Cell col=\"7\" displaytype=\"normal\" edittype=\"none\" text=\"bind:mobNo\" calendardisplaynulltype=\"none\"/><Cell col=\"8\" displaytype=\"combo\" text=\"bind:provsnSt\" combodataset=\"dsS103\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"9\" displaytype=\"combo\" text=\"bind:provsnStDtl\" combodataset=\"dsS104\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"10\" text=\"bind:callSeq\"/><Cell col=\"11\" displaytype=\"date\" text=\"bind:recallDay\" mask=\"####-##-##\" editdisplay=\"display\" calendardisplaynulltype=\"none\"/><Cell col=\"12\" displaytype=\"normal\" text=\"bind:recallTm\" mask=\"##:##\" maskchar=\"_\" editdisplay=\"edit\" calendardisplaynulltype=\"none\"/><Cell col=\"13\" displaytype=\"normal\" edittype=\"none\" text=\"bind:patternNm\" calendardisplaynulltype=\"none\"/><Cell col=\"14\" displaytype=\"normal\" edittype=\"none\" text=\"bind:cntCd\" calendardisplaynulltype=\"none\"/><Cell col=\"15\" displaytype=\"combo\" edittype=\"none\" text=\"bind:psCd\" combodataset=\"dsS043\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"16\" edittype=\"none\" text=\"bind:mfpYn\"/><Cell col=\"17\" displaytype=\"date\" edittype=\"none\" text=\"bind:callDay\" mask=\"####-##-##\"/><Cell col=\"18\" text=\"bind:callId\"/><Cell col=\"19\" text=\"bind:b00007\"/><Cell col=\"20\" text=\"bind:posCd\"/><Cell col=\"21\" text=\"bind:addr1\"/><Cell col=\"22\" text=\"bind:addr2\"/><Cell col=\"23\" text=\"bind:cagYn\"/><Cell col=\"24\" text=\"bind:cagYn1\"/><Cell col=\"25\" text=\"bind:cagYn2\"/><Cell col=\"26\" text=\"bind:cagYn3\"/><Cell col=\"27\" text=\"bind:cagYn4\"/></Band><Band id=\"summary\"><Cell/><Cell col=\"1\" text=\"총계\"/><Cell col=\"2\" displaytype=\"number\" expr=\"dataset.getCountNF(0)\"/><Cell col=\"3\"/><Cell col=\"4\" text=\"건\"/><Cell col=\"5\"/><Cell col=\"6\"/><Cell col=\"7\"/><Cell col=\"8\"/><Cell col=\"9\"/><Cell col=\"10\"/><Cell col=\"11\"/><Cell col=\"12\"/><Cell col=\"13\"/><Cell col=\"14\"/><Cell col=\"15\"/><Cell col=\"16\"/><Cell col=\"17\"/><Cell col=\"18\"/><Cell col=\"19\"/><Cell col=\"20\"/><Cell col=\"21\"/><Cell col=\"22\"/><Cell col=\"23\"/><Cell col=\"24\"/><Cell col=\"25\"/><Cell col=\"26\"/><Cell col=\"27\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Grid("grid_rerentalForExcel", "absolute", "6", "199", "1122", "167", null, null, this);
            obj.set_taborder("20");
            obj.set_binddataset("dsListForExcel");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj.set_visible("false");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"82\"/><Column size=\"90\"/><Column size=\"90\"/><Column size=\"0\"/><Column size=\"93\"/><Column size=\"90\"/><Column size=\"90\"/><Column size=\"90\"/><Column size=\"60\"/><Column size=\"90\"/><Column size=\"40\"/><Column size=\"90\"/><Column size=\"90\"/><Column size=\"90\"/><Column size=\"90\"/><Column size=\"101\"/><Column size=\"84\"/><Column size=\"100\"/><Column size=\"60\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"80\"/><Column size=\"60\"/><Column size=\"60\"/><Column size=\"60\"/><Column size=\"60\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"24\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"가계약번호\"/><Cell col=\"1\" text=\"계약번호\"/><Cell col=\"2\" text=\"고객명\"/><Cell col=\"3\" text=\"휴대폰\"/><Cell col=\"4\" text=\"계약일자\"/><Cell col=\"5\" text=\"계약기간\"/><Cell col=\"6\" text=\"장착일자\"/><Cell col=\"7\" text=\"연락처\"/><Cell col=\"8\" text=\"상태\"/><Cell col=\"9\" text=\"세부상태\"/><Cell col=\"10\" text=\"컨택\"/><Cell col=\"11\" text=\"재컨택일자\"/><Cell col=\"12\" text=\"재컨택시간\"/><Cell col=\"13\" text=\"상품명\"/><Cell col=\"14\" text=\"수량\"/><Cell col=\"15\" text=\"프리미엄서비스\"/><Cell col=\"16\" text=\"중도완납여부\"/><Cell col=\"17\" text=\"상담일자\"/><Cell col=\"18\" text=\"상담사\"/><Cell col=\"19\" text=\"걱정제로잔여횟수\"/><Cell col=\"20\" text=\"우편번호\"/><Cell col=\"21\" text=\"주소\"/><Cell col=\"22\" text=\"상세주소\"/><Cell col=\"23\" text=\"상담내용\"/><Cell col=\"24\" text=\"동의하지않음\"/><Cell col=\"25\" text=\"SMS동의\"/><Cell col=\"26\" text=\"전화동의\"/><Cell col=\"27\" text=\"이메일동의\"/><Cell col=\"28\" text=\"우편동의\"/></Band><Band id=\"body\"><Cell text=\"bind:provsnNo\"/><Cell col=\"1\" displaytype=\"normal\" edittype=\"readonly\" text=\"bind:ordNo\" editdisplay=\"edit\" calendardisplaynulltype=\"none\"/><Cell col=\"2\" edittype=\"none\" text=\"bind:custNm\"/><Cell col=\"3\" text=\"bind:mobNo\"/><Cell col=\"4\" displaytype=\"date\" edittype=\"none\" text=\"bind:ordDay\" calendardisplaynulltype=\"none\"/><Cell col=\"5\" displaytype=\"normal\" edittype=\"none\" text=\"bind:period\" calendardisplaynulltype=\"none\"/><Cell col=\"6\" displaytype=\"date\" edittype=\"none\" text=\"bind:procDay\" editdisplay=\"display\" calendardisplay=\"edit\" calendardisplaynulltype=\"none\"/><Cell col=\"7\" displaytype=\"normal\" edittype=\"none\" text=\"bind:mobNo\" calendardisplaynulltype=\"none\"/><Cell col=\"8\" displaytype=\"combo\" text=\"bind:provsnSt\" combodataset=\"dsS103\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"9\" displaytype=\"combo\" text=\"bind:provsnStDtl\" combodataset=\"dsS104\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"10\" text=\"bind:callSeq\"/><Cell col=\"11\" displaytype=\"date\" text=\"bind:recallDay\" mask=\"####-##-##\" editdisplay=\"display\" calendardisplaynulltype=\"none\"/><Cell col=\"12\" displaytype=\"normal\" text=\"bind:recallTm\" mask=\"##:##\" maskchar=\"_\" editdisplay=\"edit\" calendardisplaynulltype=\"none\"/><Cell col=\"13\" displaytype=\"normal\" edittype=\"none\" text=\"bind:patternNm\" calendardisplaynulltype=\"none\"/><Cell col=\"14\" displaytype=\"normal\" edittype=\"none\" text=\"bind:cntCd\" calendardisplaynulltype=\"none\"/><Cell col=\"15\" displaytype=\"combo\" edittype=\"none\" text=\"bind:psCd\" combodataset=\"dsS043\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"16\" edittype=\"none\" text=\"bind:mfpYn\"/><Cell col=\"17\" displaytype=\"date\" edittype=\"none\" text=\"bind:callDay\" mask=\"####-##-##\"/><Cell col=\"18\" text=\"bind:callId\"/><Cell col=\"19\" text=\"bind:b00007\"/><Cell col=\"20\" text=\"bind:posCd\"/><Cell col=\"21\" text=\"bind:addr1\"/><Cell col=\"22\" text=\"bind:addr2\"/><Cell col=\"23\" text=\"bind:callDtl\"/><Cell col=\"24\" text=\"bind:cagYn\"/><Cell col=\"25\" text=\"bind:cagYn1\"/><Cell col=\"26\" text=\"bind:cagYn2\"/><Cell col=\"27\" text=\"bind:cagYn3\"/><Cell col=\"28\" text=\"bind:cagYn4\"/></Band><Band id=\"summary\"><Cell/><Cell col=\"1\" text=\"총계\"/><Cell col=\"2\" displaytype=\"number\" expr=\"dataset.getCountNF(0)\"/><Cell col=\"3\"/><Cell col=\"4\" text=\"건\"/><Cell col=\"5\"/><Cell col=\"6\"/><Cell col=\"7\"/><Cell col=\"8\"/><Cell col=\"9\"/><Cell col=\"10\"/><Cell col=\"11\"/><Cell col=\"12\"/><Cell col=\"13\"/><Cell col=\"14\"/><Cell col=\"15\"/><Cell col=\"16\"/><Cell col=\"17\"/><Cell col=\"18\"/><Cell col=\"19\"/><Cell col=\"20\"/><Cell col=\"21\"/><Cell col=\"22\"/><Cell col=\"23\"/><Cell col=\"24\"/><Cell col=\"25\"/><Cell col=\"26\"/><Cell col=\"27\"/><Cell col=\"28\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1133, 153, this.div_detail,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("11");
            		p.set_scrollbars("none");
            		p.style.set_border("0 solid #808080ff");

            	}
            );
            this.div_detail.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1147, 492, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCSHappyCallRegister");
            		p.set_titletext("재렌탈계약 상담");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item0","div_detail.ed_custNm","value","dsList","custNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item1","div_detail.ed_mobNo","value","dsList","mobNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item2","div_detail.ca_osDay","value","dsList","osDayT");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item3","div_detail.ed_addMobNo","value","dsList","contactGet");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item4","div_detail.ed_reqDesc","value","dsList","custReq");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item6","div_detail.ca_ordDay","value","dsList","planDay");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item7","div_detail.ed_rentalAmt","value","dsList","sumArreAmt");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item8","div_detail.ed_posCd","value","dsList","posCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item9","div_detail.ed_addr1","value","dsList","addr1");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item10","div_detail.cb_stat","value","dsList","provsnSt");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item11","div_detail.cb_statDetl","value","dsList","provsnStDtl");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item12","div_detail.ed_carNo","value","dsList","carNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item13","div_detail.cb_ordNoList","value","dsList","ordNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item5","div_detail.ed_contactCnt","value","dsList","callSeq");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item14","div_detail.ed_addr2","value","dsList","addr2");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item15","div_detail.ed_bldMngNo","value","dsList","bldMngNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item17","div_detail.ca_recallDay","value","dsList","recallDay");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item16","div_detail.cb_realOrdList","value","dsList","realOrdNo");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        
        this.loadPreloadList = function()
        {
            this._addPreloadList("fdl", "sd::RTSDReRentalContact_tab01.xfdl");
            this._addPreloadList("fdl", "sd::RTSDReRentalContact_tab02.xfdl");
            this._addPreloadList("fdl", "sd::RTSDReRentalContact_tab03.xfdl");
        };
        
        // User Script
        this.addIncludeScript("RTSDRerentalContact.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDRerentalContact.xfdl", function() {
        /***********************************************************************
         * Script Include 
         ************************************************************************/
        //include "lib::comLib.xjs";

        this.toDay  = "";
        this.firstDate = "";
        this.lastDate = "";
        this.fUserGrp  = "";
        this.fUserId = "";
        this.seller = "666666";

        // Server호출 관련 정보
        var unit_sel_rownum=500; // 한번 Server호출시 가져올 row갯수
        var start_sel_rowno=1;   // Server호출시 시작할 row no
        var start_page_no=1;     // 현재 조회된 페이지 번호

        this.form_onload = function(obj,e){
        	Ex.core.init(obj);
        	this.fn_initYmd();
        	this.fn_init();
        	this.parent.setButton("E|C|S", this);
        	
        	this.fUserId  = application.gds_userInfo.getColumn(0, "userId" );
        	this.fUserGrp = application.gds_userInfo.getColumn(0, "userGrp");
        }

        /**
         * 서버기준 오늘 날자 조회 후 세팅
         */
        this.fn_initYmd = function() {
        	var sSvcID      	= "getToday";  
        	var sController   	= "ntrms/re/getDayMongth.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }

        //java comm에서 현재 날짜 가져오기
        // this.get_date = function() 
        // {
        // 	var sSvcID        	= "getDate";                    
        // 	var sController   	= "/rtms/sd/getDate.do";
        // 	var sInDatasets   	= "";
        // 	var sOutDatasets  	= "";
        // 	var sArgs 			= "";	
        // 	var fn_callBack		= "fn_callBack";
        // 	
        // 	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        // }

        //조회
        this.fn_search = function(obj,e)
        {
        	start_sel_rowno = 1;
        	start_page_no = 1;
        	
        	this.dsList.clearData();	
        	
        	this.getData(this.grid_rerental.vscrollbar.max, "tracklast");
        }

        /***********************************************************************************
        * CallBack Event (strSvcId - Sevice ID, nErrorCode - ErrorCode, strErrorMsg - Error Message)
        ***********************************************************************************/

        /* callBack함수 */
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg)
        { 
        	if (nErrorCode < 0) 
        	{
        		alert(strErrorMsg);				
        		return;
        	} 
        	if (strSvcId == "getToday") {}
        	if (strSvcId == "searchList") 
        	{
        		var cnt = this.dsList00.getRowCount();
        		if( cnt <= 0) {
        			alert("조회된 데이터가 없습니다.");
        			return;
        		} else {
        			
        		    this.fn_ordList();
        		}
        	}
        	if(strSvcId == "selectRTSD0108"){
        		this.fn_setOrdInfo();
        	}
        	if(strSvcId == "selectRTSDReRental"){
        	    this.dsS103_1.copyData(this.dsS103);
        	    this.dsS104_1.copyData(this.dsS104);
        	    this.dsS103_1.set_keystring("S:+cd");
        	    
        		this.tab_cond.tabpage1.dsS103.copyData(this.dsS103);
        		this.tab_cond.tabpage1.dsS104.copyData(this.dsS104);
        		this.tab_cond.tabpage1.dsS103.set_keystring("S:+cd");
        		
        		this.dsS030.insertRow(0);
        		this.dsS030.setColumn(0, "cd", "");
        		this.dsS030.setColumn(0, "cdNm", "전체");
        		
        		this.dsS103.insertRow(0);
        		this.dsS103.setColumn(0, "cd", "");
        		this.dsS103.setColumn(0, "cdNm", "전체");
        		
        		this.dsS104.insertRow(0);
        		this.dsS104.setColumn(0, "cd", "");
        		this.dsS104.setColumn(0, "cdNm", "전체");
        		
        		this.dsS043.insertRow(0);
        		this.dsS043.setColumn(0, "cd", "");
        		this.dsS043.setColumn(0, "cdNm", "전체");
        	}	
        	if (strSvcId == "createRtsd0123"){}
        	if (strSvcId == "searchListForExcel"){Ex.core.exportExcel(this, this.grid_rerentalForExcel);}
        }

        this.fn_excel= function() {
        	this.fn_searchExcel();
        	//Ex.core.exportExcel(this, this.grid_rerental);
        }

        /**
         * 저장 버튼의 클릭 이벤트 처리
         */
        this.fn_save = function() {	

        	var provsnNo = this.dsList.getColumn(this.dsList.rowposition, "provsnNo");
        	
        	//sudo - RTSD0121 UPDATE
        	this.ds_provsnList.clearData();
        	this.ds_provsnList.addRow();
        	
        	this.ds_provsnList.set_updatecontrol(false);
        	this.ds_provsnList.setRowType(0, Dataset.ROWTYPE_UPDATE);
        	this.ds_provsnList.set_updatecontrol(true);
        	
        	this.ds_provsnList.setColumn(0, "provsnNo", nvl(provsnNo));
        	this.ds_provsnList.setColumn(0, "custNm", this.div_detail.ed_custNm.text);
        	this.ds_provsnList.setColumn(0, "mobNo", this.div_detail.ed_mobNo.text);
        	this.ds_provsnList.setColumn(0, "posCd", this.div_detail.ed_posCd.text);
        	this.ds_provsnList.setColumn(0, "addr1", this.div_detail.ed_addr1.text);
        	this.ds_provsnList.setColumn(0, "addr2", this.div_detail.ed_addr1.text);
        	this.ds_provsnList.setColumn(0, "carNo", this.div_detail.ed_carNo.text);
        	this.ds_provsnList.setColumn(0, "cntCd", this.dsList.getColumn(this.dsList.rowposition, "cntCd"));
        	this.ds_provsnList.setColumn(0, "period", this.dsList.getColumn(this.dsList.rowposition, "periodCd"));
        	this.ds_provsnList.setColumn(0, "provsnSt", this.div_detail.cb_stat.value); //접수
        	this.ds_provsnList.setColumn(0, "provsnStDtl", this.div_detail.cb_statDetl.value); //초기배정
        	this.ds_provsnList.setColumn(0, "custReq", nvl(this.div_detail.ed_reqDesc.text));
        	this.ds_provsnList.setColumn(0, "ordNo", this.dsList.getColumn(this.dsList.rowposition, "ordNo"));
        	this.ds_provsnList.setColumn(0, "planDay", nvl(this.div_detail.ca_ordDay.value));
        	this.ds_provsnList.setColumn(0, "contactGet", nvl(this.div_detail.ed_addMobNo.text));
        	this.ds_provsnList.setColumn(0, "regiCd", this.fUserId); //판매인코드
        	this.ds_provsnList.setColumn(0, "callSeq", this.dsList.getColumn(this.dsList.rowposition, "callSeq"));
        	this.ds_provsnList.setColumn(0, "recallDay", this.dsList.getColumn(this.dsList.rowposition, "recallDay"));
        	this.ds_provsnList.setColumn(0, "recallTm", this.dsList.getColumn(this.dsList.rowposition, "recallTm"));
        	
        	var obj = {items:[]};
        	for(var i=0; i<this.dsRealOrdList.rowcount; i++){
        		var item = {
        			num : i + 1,
        			ordNo : this.dsRealOrdList.getColumn(i, "ordNo")
        		};
        		
        		obj.items[i] = item;
        	}
        	
        	var strJSON = JSON.stringify(obj);

        	this.ds_provsnList.setColumn(0, "realOrdNo", strJSON);
        /*	this.ds_provsnList.setColumn(0, "hshopTp", this.seller); //판매인코드*/
        	
        	if (confirm( "저장하시겠습니까?")) {
        		var sSvcID        	= "saveProvsn";                    
        		var sController   	= "rtms/sd/saveRerentalContract.do";
        		var sInDatasets   	= "ds_provsnList=ds_provsnList:U";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        }

        //상담
        this.btn_new_onclick = function(obj,e)
        {
        	if(nvl(this.ed_newOrdNo.text) == ""){
        		this.alert("주문번호가 입력되지 않았습니다.");
        		this.ed_newOrdNo.setFocus();
        		return false;
        	}
        	
        	var sSvcID        	= "createRtsd0123";                    
        	var sController   	= "rtms/sd/createRtsd0123.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("ordNo", this.ed_newOrdNo.text);
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        // this.btn_update_onclick = function(obj:Button,  e:nexacro.ClickEventInfo)
        // {
        // 	var provsnNo = this.dsList.getColumn(this.dsList.rowposition, "provsnNo");
        // 	
        // 	//sudo - RTSD0121 UPDATE
        // 	this.ds_provsnList.clearData();
        // 	this.ds_provsnList.addRow();
        // 	
        // // 	if(nvl(provsnNo) == ""){
        // //  		this.alert("가계약으로 전환되지 않았습니다. 가계약전환하여 상담내역을 생성하여 주십시오.");
        // //  		return false;
        // // 					
        // // 	}
        // 
        // 	this.ds_provsnList.set_updatecontrol(false);
        // 	this.ds_provsnList.setRowType(0, Dataset.ROWTYPE_UPDATE);
        // 	this.ds_provsnList.set_updatecontrol(true);
        // 	
        // 	this.ds_provsnList.setColumn(0, "provsnNo", nvl(provsnNo));
        // 	this.ds_provsnList.setColumn(0, "custNm", this.div_detail.ed_custNm.text);
        // 	this.ds_provsnList.setColumn(0, "mobNo", this.div_detail.ed_mobNo.text);
        // 	this.ds_provsnList.setColumn(0, "posCd", this.div_detail.ed_posCd.text);
        // 	this.ds_provsnList.setColumn(0, "addr1", this.div_detail.ed_addr1.text);
        // 	this.ds_provsnList.setColumn(0, "addr2", this.div_detail.ed_addr1.text);
        // 	this.ds_provsnList.setColumn(0, "carNo", this.div_detail.ed_carNo.text);
        // 	this.ds_provsnList.setColumn(0, "cntCd", this.dsList.getColumn(this.dsList.rowposition, "cntCd"));
        // 	this.ds_provsnList.setColumn(0, "period", this.dsList.getColumn(this.dsList.rowposition, "periodCd"));
        // 	this.ds_provsnList.setColumn(0, "provsnSt", this.div_detail.cb_stat.value); //접수
        // 	this.ds_provsnList.setColumn(0, "provsnStDtl", this.div_detail.cb_statDetl.value); //초기배정
        // 	this.ds_provsnList.setColumn(0, "custReq", nvl(this.div_detail.ed_reqDesc.text));
        // 	this.ds_provsnList.setColumn(0, "ordNo", this.dsList.getColumn(this.dsList.rowposition, "ordNo"));
        // 	this.ds_provsnList.setColumn(0, "planDay", nvl(this.div_detail.ca_ordDay.value));
        // 	this.ds_provsnList.setColumn(0, "contactGet", nvl(this.div_detail.ed_addMobNo.text));
        // 	this.ds_provsnList.setColumn(0, "regiCd", this.fUserId); //판매인코드
        // 	this.ds_provsnList.setColumn(0, "callSeq", this.dsList.getColumn(this.dsList.rowposition, "callSeq"));
        // 	this.ds_provsnList.setColumn(0, "recallDay", this.dsList.getColumn(this.dsList.rowposition, "recallDay"));
        // 	this.ds_provsnList.setColumn(0, "recallTm", this.dsList.getColumn(this.dsList.rowposition, "recallTm"));
        // 	this.ds_provsnList.setColumn(0, "realOrdNo", this.dsList.getColumn(this.dsList.rowposition, "realOrdNo"));
        // /*	this.ds_provsnList.setColumn(0, "hshopTp", this.seller); //판매인코드*/
        // 	
        // 	if (confirm( "저장하시겠습니까?")) {
        // 		var sSvcID        	= "saveProvsn";                    
        // 		var sController   	= "rtms/sd/saveRerentalContract.do";
        // 		var sInDatasets   	= "ds_provsnList=ds_provsnList:U";
        // 		var sOutDatasets  	= "";
        // 		var sArgs 			= "";	
        // 		var fn_callBack		= "fn_callBack";
        // 		
        // 		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        // 	}
        // }

        //삭제
        // this.btn_del_onclick = function(obj:Button,  e:nexacro.ClickEventInfo)
        // {
        // 	var provsnNo = this.dsList.getColumn(this.dsList.rowposition, "provsnNo");
        // 	
        // 	//sudo - RTSD0121 DELETE
        // 	this.ds_provsnList.set_updatecontrol(false);
        // 	this.ds_provsnList.setRowType(Dataset.ROWTYPE_DELETE);
        // 	this.ds_provsnList.set_updatecontrol(true);
        // 	
        // 	this.ds_provsnList.clearData();
        // 	this.ds_provsnList.addRow();
        // 	this.ds_provsnList.setColumn(0, "provsnNo", this.dsList.getColumn(this.dsList.rowposition, "provsnNo"));
        // 	this.ds_provsnList.setColumn(0, "custNm", this.div_detail.ed_custNm.text);
        // 	this.ds_provsnList.setColumn(0, "mobNo", this.div_detail.ed_mobNo.text);
        // 	this.ds_provsnList.setColumn(0, "addr", this.div_detail.ed_addr.text);
        // 	this.ds_provsnList.setColumn(0, "carNo", this.div_detail.ed_carNo.text);
        // 	this.ds_provsnList.setColumn(0, "cntCd", this.dsList.getColumn(this.dsList.rowposition, "cntCd"));
        // 	this.ds_provsnList.setColumn(0, "period", this.dsList.getColumn(this.dsList.rowposition, "periodCd"));
        // 	this.ds_provsnList.setColumn(0, "provsnSt", "10"); //접수
        // 	this.ds_provsnList.setColumn(0, "provsnStDtl", "1010"); //초기배정
        // 	this.ds_provsnList.setColumn(0, "custReq", this.div_detail.ed_reqDesc.text);
        // 	this.ds_provsnList.setColumn(0, "ordNo", this.dsList.getColumn(this.dsList.rowposition, "ordNo"));
        // /*	this.ds_provsnList.setColumn(0, "rsrvDay", this.div_detail.ca_ordDay.value);*/
        // 	this.ds_provsnList.setColumn(0, "contactGet", this.div_detail.ed_addMobNo.text);
        // 	
        // 	this.ds_provsnList.set_updatecontrol(false);
        // 	this.ds_provsnList.setRowType(Dataset.ROWTYPE_DELETE);
        // 	this.ds_provsnList.set_updatecontrol(true);
        // 	
        // 	if (confirm( "저장하시겠습니까?")) {
        // 		var sSvcID        	= "saveProvsn";                    
        // 		var sController   	= "rtms/sd/saveProvisionalContract.do";
        // 		var sInDatasets   	= "ds_provsnList=ds_provsnList:U";
        // 		var sOutDatasets  	= "";
        // 		var sArgs 			= "";	
        // 		var fn_callBack		= "fn_callBack";
        // 		
        // 		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        // 	}
        // }

        //===========================================================================
        // 공통코드
        //===========================================================================
        this.fn_init = function() {
        	
        	var sSvcID      	= "selectRTSDReRental";  
        	var sController   	= "/rtms/sd/initRTSDReRental.do";
        	var sInDatasets   	= "";
        	var sOutDatasets	= "dsS030=output1 dsS103=output2 dsS104=output3 dsS043=output4";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";

        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	
        }

        //===========================================================================
        // 해당고객의 주문리스트
        //===========================================================================
        this.fn_ordList = function() {
        	
        	var sSvcID      	= "selectRTSD0108";  
        	var sController   	= "/rtms/sd/rtsd0108OrdList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets	= "dsOrdList=dsResult";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";

        	
        	sArgs += Ex.util.setParam("custNo", this.dsList.getColumn(this.dsList.rowposition, "custNo"));

        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	
        }

        //===========================================================================
        // 계약번호조회를 위한 팝업호출
        //===========================================================================
        this.div_search_bt_ordNo_onclick = function(obj,e)
        {
        	var args ={ p_arg : this.p_arg };
        	Ex.core.popup(this,"계약번호 조회","comm::RTCOMMOrderNo_pop.xfdl",args, "modaless=false");	
        }

        this.returnOrderNoInfo = function(ordNo){
        	this.tab_cond.tabpage1.div_search.ordNo.set_value(ordNo);
        }

        this.grid_rerental_oncellclick = function(obj,e)
        {
        	//this.fn_ordList();
        	this.fn_setOrdInfo();
        }

        this.fn_setOrdInfo = function(){

        	var idx = 0;
         	for(var i=0; i<this.dsOrdList.rowcount; i++){
         		if(this.dsOrdList.getColumn(i, "ordNo") == this.div_detail.cb_ordNoList.text){
         			idx = i;
         			break;
         		}
         	}
        	
        	this.div_detail.ed_ordDetl.set_value(this.dsOrdList.getColumn(idx, "cdText"));

        	this.div_detail.ed_realOrdNo.set_value("");
        	this.dsRealOrdList.clearData();
        	
        	var obj = JSON.parse(this.dsList.getColumn(this.dsList.rowposition, "realOrdNo"));
        	for(var i=0; i<obj.items.length; i++){
        	
        		var nRow = this.dsRealOrdList.addRow();
        		this.dsRealOrdList.setColumn(nRow, "num", obj.items[i].num);
        		this.dsRealOrdList.setColumn(nRow, "ordNo", obj.items[i].ordNo);
        	}
        	
        	this.div_detail.cb_realOrdList.set_index(0);
        }

        this.div_detail_cb_ordNoList_onitemchanged = function(obj,e)
        {
        	this.fn_setOrdInfo();
        }

        this.btn_contact_onclick = function(obj,e)
        {
        	var provsnNo = this.dsList.getColumn(this.dsList.rowposition, "provsnNo");
        	if (this.dsList.getRowCount() < 1) {
        		this.alert("상담할 재렌탈대상이 존재하지 않습니다.");
        		return false;
        	}

        	var arr ={
        		  p_provsnNo : provsnNo
        		, p_today    : this.toDay
        		, p_userGrp  : this.fUserGrp
        		, p_mobNo    : this.div_detail.ed_mobNo.text
        	};
        			
        	Ex.core.popup(this, "재렌탈계약상담", "sd::RTSDRerentalContractContactPopUp.xfdl", arr, "modaless=false");
        }

        this.div_detail_bt_addr_onclick = function(obj,e){
        	var args ={p_arg : "RTSDCustRegister_1"};
        	Ex.core.popup(this,"우편번호 조회","comm::RTCOMMPostCode_pop.xfdl",args, "modaless=false");
        }

        //===========================================
        // 우편번호 찾기 팝업호출 후처리.
        //===========================================
        this.FN_postCd = function(res,division ){
        	if( division == "addr1"){
        		this.div_detail.ed_posCd.set_value( res[0] );
        		this.div_detail.ed_addr1.set_value( res[1] );
        		this.div_detail.ed_addr2.set_value( res[2] );
        		this.div_detail.ed_bldMngNo.set_value(res[3]);
        	}
        }

        //===========================================================================
        // 고객주소변경(고객원장)
        //===========================================================================
        this.btn_addr_save_onclick = function(obj,e)
        {
        	var custNo = this.dsList.getColumn(this.dsList.rowposition, "custNo");
        	var posCd = this.dsList.getColumn(this.dsList.rowposition, "posCd");
        	var bldMngNo = this.dsList.getColumn(this.dsList.rowposition, "bldMngNo");
        	var addr1 = this.dsList.getColumn(this.dsList.rowposition, "addr1");
        	var addr2 = this.dsList.getColumn(this.dsList.rowposition, "addr2");
        	var emailAddr = this.dsList.getColumn(this.dsList.rowposition, "emailAddr");
        	var telNo = this.dsList.getColumn(this.dsList.rowposition, "telNo");
        	var mobNo = this.dsList.getColumn(this.dsList.rowposition, "mobNo");

        	this.ds_cust.clearData();
        	this.ds_cust.addRow();
        	
        	this.ds_cust.setColumn(0, "custNo", custNo);
        	this.ds_cust.setColumn(0, "mobNo", mobNo);
        	this.ds_cust.setColumn(0, "telNo", telNo);
        	this.ds_cust.setColumn(0, "addr1", addr1);
        	this.ds_cust.setColumn(0, "addr2", addr2);
        	this.ds_cust.setColumn(0, "emailAddr", emailAddr);
        	this.ds_cust.setColumn(0, "bldMngNo", bldMngNo);
        	this.ds_cust.setColumn(0, "posCd", posCd);
        	
        	var sSvcID        	= "updateCustInfo";                    
        	var sController   	= "/rtms/sd/updateCustInfo.do";
        	var sInDatasets   	= "input=ds_cust:U";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        this.div_search_ed_custNm_onkeyup = function(obj,e)
        {
        	if ( e.keycode == 13 ){
        		this.fn_search();
        	}
        }

        this.div_search_ed_mobNo_onkeyup = function(obj,e)
        {
        	if ( e.keycode == 13 ){
        		this.fn_search();
        	}
        }

        this.grid_rerental_onvscroll = function(obj,e)
        {
        	this.getData(e.pos, e.type);
        }

        this.dsList00_onload = function(obj,e)
        {
        	 if(e.reason == 0){ 
        		this.dsList.appendData(this.dsList00, true, true);
        	 }
        }

        this.grid_calc = function(){
        	 start_page_no++;
        	 start_sel_rowno += unit_sel_rownum; 
        }

        this.getData = function(pos,type){
        	
        	var _args = "";
        	var day = 1000 * 60 * 60 * 24;
        	
        	var provsnDiffDay = 0;
        	var osDiffDay = 0;
        	
        	if (this.tab_cond.tabindex == 0) {
        	
        		var procdayF = this.tab_cond.tabpage1.div_search.dt_procFday.value;
        		var procdayT = this.tab_cond.tabpage1.div_search.dt_procTday.value;
        		
        		var osdayF = this.tab_cond.tabpage1.div_search.cal_osDayFrom.value;
        		var osdayT = this.tab_cond.tabpage1.div_search.cal_osDayTo.value;
        		
        		//장착일자
        		if(nvl(procdayF) != "" || nvl(procdayT) != ""){
        		
        			var provsnFrom = this.tab_cond.tabpage1.div_search.dt_procFday.text.split('-');
        			var provsnTo = this.tab_cond.tabpage1.div_search.dt_procTday.text.split('-');
        			
        			

        			if(nvl(provsnFrom ) == "" || nvl(provsnTo) == "") {
        				alert("장착일은 시작일/종료일 모두 입력해야 합니다.");
        				return;
        			}		
        			
        			var provsnFromDate = new Date(provsnFrom[0], provsnFrom[1] - 1, provsnFrom[2]);
        			var provsnToDate = new Date(provsnTo[0], provsnTo[1] - 1, provsnTo[2]);

        			var provsnDiff = provsnToDate - provsnFromDate;
        			
        			var provsnDiffDay = parseInt(provsnDiff/day);	
        		}
        		
        		if(provsnDiffDay > 30) {
        			this.alert("장착일 조회기간은 30일 이내로 지정해 주세요.");
        			return;
        		}
        		
        		//계약만료일자
        		if(nvl(osdayF) != "" || nvl(osdayT) != ""){
        		
        			var provsnFrom = this.tab_cond.tabpage1.div_search.cal_osDayFrom.text.split('-');
        			var provsnTo = this.tab_cond.tabpage1.div_search.cal_osDayTo.text.split('-');

        			if(nvl(provsnFrom ) == "" || nvl(provsnTo) == "") {
        				alert("계약만료일은 시작일/종료일 모두 입력해야 합니다.");
        				return;
        			}		
        			
        			var provsnFromDate = new Date(provsnFrom[0], provsnFrom[1] - 1, provsnFrom[2]);
        			var provsnToDate = new Date(provsnTo[0], provsnTo[1] - 1, provsnTo[2]);

        			var provsnDiff = provsnToDate - provsnFromDate;
        			
        			var provsnDiffDay = parseInt(provsnDiff/day);	
        		}
        		
        		if(osDiffDay > 30) {
        			this.alert("계약만료일 조회기간은 30일 이내로 지정해 주세요.");
        			return;
        		}
        	
        		_args += Ex.util.setParam("procDayF", procdayF);
        		_args += Ex.util.setParam("procDayT", procdayT);
        		_args += Ex.util.setParam("custNm", this.tab_cond.tabpage1.div_search.ed_custNm.value);
        		_args += Ex.util.setParam("mobNo", this.tab_cond.tabpage1.div_search.ed_mobNo.value);
        		_args += Ex.util.setParam("callId", this.tab_cond.tabpage1.div_search.ed_callId.value);
        		_args += Ex.util.setParam("provsnSt", this.tab_cond.tabpage1.div_search.cb_stat.value);
        		_args += Ex.util.setParam("provsnStDtl", this.tab_cond.tabpage1.div_search.cb_statDetl.value);
        		_args += Ex.util.setParam("recallDay", this.tab_cond.tabpage1.div_search.cal_recallDay.value);
        	    _args += Ex.util.setParam("provsnNoF", this.tab_cond.tabpage1.div_search.ed_provsnNoF.value);
        		_args += Ex.util.setParam("provsnNoT", this.tab_cond.tabpage1.div_search.ed_provsnNoT.value);
        		_args += Ex.util.setParam("osDayF", this.tab_cond.tabpage1.div_search.cal_osDayFrom.value);
        		_args += Ex.util.setParam("osDayT", this.tab_cond.tabpage1.div_search.cal_osDayTo.value);
        		_args += Ex.util.setParam("ordNo", this.tab_cond.tabpage1.div_search.ed_ordNo.value);
        		
        	} else if (this.tab_cond.tabindex == 1) {
        	
        		_args += Ex.util.setParam("custNm", this.tab_cond.tabpage2.div_search.ed_custNm.value);
        		_args += Ex.util.setParam("mobNo", this.tab_cond.tabpage2.div_search.ed_mobNo.value);
        		_args += Ex.util.setParam("provsnNoF", this.tab_cond.tabpage2.div_search.ed_provsnNoF.value);
        		_args += Ex.util.setParam("provsnNoT", this.tab_cond.tabpage2.div_search.ed_provsnNoT.value);
        	
        	} else {
        	
        		_args += Ex.util.setParam("recallDay", this.tab_cond.tabpage3.div_search.cal_recallDay.value);
        		_args += Ex.util.setParam("callId", this.tab_cond.tabpage3.div_search.ed_callId.value);
        	}
        	
        	if(pos == this.grid_rerental.vscrollbar.max){
        		if(type == "tracklast"||type == "last" ||type == "wheellast"){ 
        		
        		
        			var sSvcID        	= "searchList";             
        			var sController   	= "/rtms/sd/listReRental.do";
        			var sInDatasets   	= "";
        			var sOutDatasets  	= "dsList00=reRentalList";
        			var sArgs 			= ""
        			var fn_callBack		= "fn_callBack";
        			
        			this.dsList00.clearData();
        			
        			_args += Ex.util.setParam("rowStart", start_sel_rowno);
        			_args += Ex.util.setParam("rowEnd", Number(start_sel_rowno) + Number(unit_sel_rownum) - 1);
        			
        			sArgs = _args;
        			
        			this.grid_calc();			

        			Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        		}
        	}
        }

        this.fn_searchExcel = function(){

        	var _args = "";
        	var day = 1000 * 60 * 60 * 24;
        	
        	var provsnDiffDay = 0;
        	var osDiffDay = 0;
        	
        	if (this.tab_cond.tabindex == 0) {
        	
        		var procdayF = this.tab_cond.tabpage1.div_search.dt_procFday.value;
        		var procdayT = this.tab_cond.tabpage1.div_search.dt_procTday.value;
        		
        		var osdayF = this.tab_cond.tabpage1.div_search.cal_osDayFrom.value;
        		var osdayT = this.tab_cond.tabpage1.div_search.cal_osDayTo.value;
        		
        		//장착일자
        		if(nvl(procdayF) != "" || nvl(procdayT) != ""){
        		
        			var provsnFrom = this.tab_cond.tabpage1.div_search.dt_procFday.text.split('-');
        			var provsnTo = this.tab_cond.tabpage1.div_search.dt_procTday.text.split('-');

        			if(nvl(provsnFrom ) == "" || nvl(provsnTo) == "") {
        				alert("주문접수일은 시작일/종료일 모두 입력해야 합니다.");
        				return;
        			}		
        			
        			var provsnFromDate = new Date(provsnFrom[0], provsnFrom[1] - 1, provsnFrom[2]);
        			var provsnToDate = new Date(provsnTo[0], provsnTo[1] - 1, provsnTo[2]);

        			var provsnDiff = provsnToDate - provsnFromDate;
        			
        			var provsnDiffDay = parseInt(provsnDiff/day);	
        		}
        		
        		if(provsnDiffDay > 30) {
        			this.alert("주문접수일 조회기간은 30일 이내로 지정해 주세요.");
        			return;
        		}
        	
        		//계약만료일자
        		if(nvl(osdayF) != "" || nvl(osdayT) != ""){
        		
        			var provsnFrom = this.tab_cond.tabpage1.div_search.cal_osDayFrom.text.split('-');
        			var provsnTo = this.tab_cond.tabpage1.div_search.cal_osDayTo.text.split('-');

        			if(nvl(provsnFrom ) == "" || nvl(provsnTo) == "") {
        				alert("계약만료일은 시작일/종료일 모두 입력해야 합니다.");
        				return;
        			}		
        			
        			var provsnFromDate = new Date(provsnFrom[0], provsnFrom[1] - 1, provsnFrom[2]);
        			var provsnToDate = new Date(provsnTo[0], provsnTo[1] - 1, provsnTo[2]);

        			var provsnDiff = provsnToDate - provsnFromDate;
        			
        			var provsnDiffDay = parseInt(provsnDiff/day);	
        		}
        		
        		if(osDiffDay > 30) {
        			this.alert("계약만료일 조회기간은 30일 이내로 지정해 주세요.");
        			return;
        		}
        		
        		_args += Ex.util.setParam("procDayF", procdayF);
        		_args += Ex.util.setParam("procDayT", procdayT);
        		_args += Ex.util.setParam("custNm", this.tab_cond.tabpage1.div_search.ed_custNm.value);
        		_args += Ex.util.setParam("mobNo", this.tab_cond.tabpage1.div_search.ed_mobNo.value);
        		_args += Ex.util.setParam("callId", this.tab_cond.tabpage1.div_search.ed_callId.value);
        		_args += Ex.util.setParam("provsnSt", this.tab_cond.tabpage1.div_search.cb_stat.value);
        		_args += Ex.util.setParam("provsnStDtl", this.tab_cond.tabpage1.div_search.cb_statDetl.value);
        		_args += Ex.util.setParam("recallDay", this.tab_cond.tabpage1.div_search.cal_recallDay.value);
        	    _args += Ex.util.setParam("provsnNoF", this.tab_cond.tabpage1.div_search.ed_provsnNoF.value);
        		_args += Ex.util.setParam("provsnNoT", this.tab_cond.tabpage1.div_search.ed_provsnNoT.value);
        		
        		_args += Ex.util.setParam("osDayF", this.tab_cond.tabpage1.div_search.cal_osDayFrom.value);
        		_args += Ex.util.setParam("osDayT", this.tab_cond.tabpage1.div_search.cal_osDayTo.value);
        		
        	} else if (this.tab_cond.tabindex == 1) {
        	
        		_args += Ex.util.setParam("custNm", this.tab_cond.tabpage2.div_search.ed_custNm.value);
        		_args += Ex.util.setParam("mobNo", this.tab_cond.tabpage2.div_search.ed_mobNo.value);
        		_args += Ex.util.setParam("provsnNoF", this.tab_cond.tabpage2.div_search.ed_provsnNoF.value);
        		_args += Ex.util.setParam("provsnNoT", this.tab_cond.tabpage2.div_search.ed_provsnNoT.value);
        	
        	} else {
        	
        		_args += Ex.util.setParam("recallDay", this.tab_cond.tabpage3.div_search.cal_recallDay.value);
        		_args += Ex.util.setParam("callId", this.tab_cond.tabpage3.div_search.ed_callId.value);
        	}
        	
        	var sSvcID        	= "searchListForExcel";             
        	var sController   	= "/rtms/sd/listReRentalForExcel.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "dsListForExcel=reRentalListForExcel";
        	var sArgs 			= ""
        	var fn_callBack		= "fn_callBack";
        	
        	this.dsListForExcel.clearData();
        	
        	sArgs = _args;		

        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }

        //재렌탈 상담팝업에서 넘겨온 데이터
        this.returnPopup = function(arr){

         	this.dsList.setColumn(this.dsList.rowposition, "recallDay", arr.p_recallDay);
         	this.dsList.setColumn(this.dsList.rowposition, "recallTm", arr.p_recallTm);
         	this.dsList.setColumn(this.dsList.rowposition, "callSeq", arr.p_callSeq);
        }

        this.div_detail_btn_realOrdAdd_onclick = function(obj,e)
        {
        	var realOrdNo = this.div_detail.ed_realOrdNo.value;
        	if(realOrdNo != ""){
        		
        		var nRow = this.dsRealOrdList.findRowExpr("ordNo=='" + realOrdNo + "'");
        		if(nRow < 0){
        		
        			nRow = this.dsRealOrdList.addRow();
        			this.dsRealOrdList.setColumn(nRow, "num", nRow);
        			this.dsRealOrdList.setColumn(nRow, "ordNo", this.div_detail.ed_realOrdNo.value);
        		}
        	}
        }

        this.div_detail_cb_stat_onitemchanged = function(obj,e)
        {
        	this.dsS104_1.filter("");
        	if (e.postvalue == "") {
        		this.dsS104_1.filter("cd == ''");
        	} else {
        		this.dsS104_1.filter("cd == '' || cd.substr(0,1) == '" + e.postvalue.substring(0,1) + "'");
        	}
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.dsS103.addEventHandler("onrowposchanged", this.dsS103_onrowposchanged, this);
            this.dsS104.addEventHandler("onrowposchanged", this.dsS104_onrowposchanged, this);
            this.dsList00.addEventHandler("onload", this.dsList00_onload, this);
            this.dsRealOrdList.addEventHandler("onrowposchanged", this.dsS103_onrowposchanged, this);
            this.addEventHandler("onload", this.form_onload, this);
            this.div_detail.ca_osDay.addEventHandler("onchanged", this.div_detail_ca_dlvrDay_onchanged, this);
            this.div_detail.ed_contactCnt.addEventHandler("onkeyup", this.div_detail_ed_dlvTel_onkeyup, this);
            this.div_detail.cb_ordNoList.addEventHandler("onitemchanged", this.div_detail_cb_ordNoList_onitemchanged, this);
            this.div_detail.ca_ordDay.addEventHandler("onchanged", this.div_detail_ca_dlvrDay_onchanged, this);
            this.div_detail.cb_stat.addEventHandler("onitemchanged", this.div_detail_cb_stat_onitemchanged, this);
            this.div_detail.bt_addr.addEventHandler("onclick", this.div_detail_bt_addr_onclick, this);
            this.div_detail.ca_recallDay.addEventHandler("onchanged", this.div_detail_ca_dlvrDay_onchanged, this);
            this.div_detail.btn_realOrdAdd.addEventHandler("onclick", this.div_detail_btn_realOrdAdd_onclick, this);
            this.btn_new.addEventHandler("onclick", this.btn_new_onclick, this);
            this.btn_del.addEventHandler("onclick", this.btn_del_onclick, this);
            this.btn_contact.addEventHandler("onclick", this.btn_contact_onclick, this);
            this.btn_addr_save.addEventHandler("onclick", this.btn_addr_save_onclick, this);
            this.tab_cond.addEventHandler("canchange", this.tab_cond_canchange, this);
            this.grid_rerental.addEventHandler("oncellclick", this.grid_rerental_oncellclick, this);
            this.grid_rerental.addEventHandler("onvscroll", this.grid_rerental_onvscroll, this);
            this.grid_rerentalForExcel.addEventHandler("onvscroll", this.grid_rerental_onvscroll, this);
            this.grid_rerentalForExcel.addEventHandler("oncellclick", this.grid_rerental_oncellclick, this);
            this.grid_rerentalForExcel.addEventHandler("oncelldblclick", this.grid_rerental_oncelldblclick, this);

        };

        this.loadIncludeScript("RTSDRerentalContact.xfdl");
        this.loadPreloadList();
       
    };
}
)();
