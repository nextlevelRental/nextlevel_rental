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
                this.set_name("RTREMiddleFullPayment");
                this.set_classname("RTREMiddleFullPayment");
                this.set_titletext("중도완납");
                this._setFormPosition(0,0,1147,511);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_endTp", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_cancelList", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"endTp\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"statCd\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"ordNm\" type=\"STRING\" size=\"256\"/><Column id=\"chanNm\" type=\"STRING\" size=\"256\"/><Column id=\"saleNm\" type=\"STRING\" size=\"256\"/><Column id=\"statNm\" type=\"STRING\" size=\"256\"/><Column id=\"ordDay\" type=\"STRING\" size=\"256\"/><Column id=\"planDay\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"cancDay\" type=\"STRING\" size=\"256\"/><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"ordQty\" type=\"STRING\" size=\"256\"/><Column id=\"periodNm\" type=\"STRING\" size=\"256\"/><Column id=\"osYn\" type=\"STRING\" size=\"256\"/><Column id=\"mepYn\" type=\"STRING\" size=\"256\"/><Column id=\"psNm\" type=\"STRING\" size=\"256\"/><Column id=\"makerNm\" type=\"STRING\" size=\"256\"/><Column id=\"mcNm\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"carOwner\" type=\"STRING\" size=\"256\"/><Column id=\"cMileage\" type=\"STRING\" size=\"256\"/><Column id=\"maMileage\" type=\"STRING\" size=\"256\"/><Column id=\"reqText\" type=\"STRING\" size=\"256\"/><Column id=\"monAmt\" type=\"STRING\" size=\"256\"/><Column id=\"saleAmt\" type=\"STRING\" size=\"256\"/><Column id=\"recpAmt\" type=\"STRING\" size=\"256\"/><Column id=\"blancAmt\" type=\"STRING\" size=\"256\"/><Column id=\"arre1Amt\" type=\"STRING\" size=\"256\"/><Column id=\"arre2Amt\" type=\"STRING\" size=\"256\"/><Column id=\"makeAmt\" type=\"STRING\" size=\"256\"/><Column id=\"servAmt\" type=\"STRING\" size=\"256\"/><Column id=\"planAmt\" type=\"STRING\" size=\"256\"/><Column id=\"canclDay\" type=\"STRING\" size=\"256\"/><Column id=\"saleAmt2\" type=\"STRING\" size=\"256\"/><Column id=\"regiAmt\" type=\"STRING\" size=\"256\"/><Column id=\"rgcpAmt\" type=\"STRING\" size=\"256\"/><Column id=\"rgblancAmt\" type=\"STRING\" size=\"256\"/><Column id=\"balanceAmt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_cancelSave", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"endTp\" type=\"STRING\" size=\"256\"/><Column id=\"canclDay\" type=\"STRING\" size=\"256\"/><Column id=\"bankRecpDay\" type=\"STRING\" size=\"256\"/><Column id=\"recpAmt\" type=\"STRING\" size=\"256\"/><Column id=\"arre1Amt\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_prdInfo", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"saleGdsCd\" type=\"STRING\" size=\"256\"/><Column id=\"standard\" type=\"STRING\" size=\"256\"/><Column id=\"amt\" type=\"STRING\" size=\"256\"/><Column id=\"groupSale\" type=\"STRING\" size=\"256\"/><Column id=\"chnlSale\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"periodNm\" type=\"STRING\" size=\"256\"/><Column id=\"seasonNm\" type=\"STRING\" size=\"256\"/><Column id=\"cntNm\" type=\"STRING\" size=\"256\"/><Column id=\"seasonCd\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"seq\" type=\"STRING\" size=\"256\"/><Column id=\"ordId\" type=\"STRING\" size=\"256\"/><Column id=\"periodCd\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"regiCd\" type=\"STRING\" size=\"256\"/><Column id=\"frCd\" type=\"STRING\" size=\"256\"/><Column id=\"lrCd\" type=\"STRING\" size=\"256\"/><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"ordQty\" type=\"STRING\" size=\"256\"/><Column id=\"regiAmt\" type=\"STRING\" size=\"256\"/><Column id=\"rentAmt\" type=\"STRING\" size=\"256\"/><Column id=\"rentpAmt\" type=\"STRING\" size=\"256\"/><Column id=\"fDcrate\" type=\"STRING\" size=\"256\"/><Column id=\"fDcamt\" type=\"STRING\" size=\"256\"/><Column id=\"monDcamt\" type=\"STRING\" size=\"256\"/><Column id=\"monAmt\" type=\"STRING\" size=\"256\"/><Column id=\"planDay\" type=\"STRING\" size=\"256\"/><Column id=\"planTm\" type=\"STRING\" size=\"256\"/><Column id=\"instDay\" type=\"STRING\" size=\"256\"/><Column id=\"instTm\" type=\"STRING\" size=\"256\"/><Column id=\"instYn\" type=\"STRING\" size=\"256\"/><Column id=\"valYn\" type=\"STRING\" size=\"256\"/><Column id=\"equNo\" type=\"STRING\" size=\"256\"/><Column id=\"osId\" type=\"STRING\" size=\"256\"/><Column id=\"osDay\" type=\"STRING\" size=\"256\"/><Column id=\"statCd\" type=\"STRING\" size=\"256\"/><Column id=\"flYn\" type=\"STRING\" size=\"256\"/><Column id=\"frYn\" type=\"STRING\" size=\"256\"/><Column id=\"rlYn\" type=\"STRING\" size=\"256\"/><Column id=\"rrYn\" type=\"STRING\" size=\"256\"/><Column id=\"matDesc\" type=\"STRING\" size=\"256\"/><Column id=\"saleCd\" type=\"STRING\" size=\"256\"/><Column id=\"gdsGb\" type=\"STRING\" size=\"256\"/><Column id=\"gdsGrp\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static00", "absolute", "0", "0", "790", "31", null, null, this);
            obj.set_taborder("0");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_ordNo", "absolute", "0", "0", "100", "31", null, null, this);
            obj.set_taborder("1");
            obj.set_text("계약번호");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_ordNoSearch", "absolute", "104", "5", "140", "20", null, null, this);
            obj.set_taborder("2");
            obj.set_enable("true");
            obj.set_readonly("false");
            this.addChild(obj.name, obj);

            obj = new Button("btn_orderNoSearch", "absolute", "250", "5", "89", "21", null, null, this);
            obj.set_taborder("3");
            obj.set_text("계약번호찾기");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "0", "38", "80", "21", null, null, this);
            obj.set_taborder("4");
            obj.set_text("계약정보");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "60", "1122", "31", null, null, this);
            obj.set_taborder("5");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_custNm", "absolute", "280", "60", "120", "31", null, null, this);
            obj.set_taborder("8");
            obj.set_text("고객명");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_custNo", "absolute", "125", "65", "150", "21", null, null, this);
            obj.set_taborder("9");
            obj.set_maxlength("6");
            obj.set_enable("false");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_custNo", "absolute", "0", "60", "120", "31", null, null, this);
            obj.set_taborder("10");
            obj.set_text("고객코드");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_custNm", "absolute", "405", "65", "150", "21", null, null, this);
            obj.set_taborder("11");
            obj.set_maxlength("6");
            obj.set_enable("false");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1122", "0", "25", "729", null, null, this);
            obj.set_taborder("12");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0", "90", "1122", "31", null, null, this);
            obj.set_taborder("13");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_statNm", "absolute", "406", "95", "150", "21", null, null, this);
            obj.set_taborder("14");
            obj.set_maxlength("80");
            obj.set_enable("false");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_statNm", "absolute", "280", "90", "120", "31", null, null, this);
            obj.set_taborder("15");
            obj.set_text("계약상태");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_saleNm", "absolute", "125", "95", "150", "21", null, null, this);
            obj.set_taborder("16");
            obj.set_maxlength("80");
            obj.set_enable("false");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_saleNm", "absolute", "0", "90", "120", "31", null, null, this);
            obj.set_taborder("17");
            obj.set_text("계약유형");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_chanNm", "absolute", "965", "65", "150", "21", null, null, this);
            obj.set_taborder("18");
            obj.set_maxlength("6");
            obj.set_enable("false");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_chanNm", "absolute", "840", "60", "120", "31", null, null, this);
            obj.set_taborder("7");
            obj.set_text("채널구분");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_ordNm", "absolute", "685", "65", "150", "21", null, null, this);
            obj.set_taborder("19");
            obj.set_maxlength("6");
            obj.set_enable("false");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "0", "120", "1122", "31", null, null, this);
            obj.set_taborder("20");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_telNo04", "absolute", "840", "90", "120", "30", null, null, this);
            obj.set_taborder("21");
            obj.set_text("취소일자");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("st_ordDay", "absolute", "560", "90", "120", "31", null, null, this);
            obj.set_taborder("22");
            obj.set_text("접수일자");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "0", "150", "280", "31", null, null, this);
            obj.set_taborder("23");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_periodNm", "absolute", "0", "120", "120", "31", null, null, this);
            obj.set_taborder("24");
            obj.set_text("총렌탈기간");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("st_monAmt", "absolute", "0", "150", "120", "31", null, null, this);
            obj.set_taborder("25");
            obj.set_text("월렌탈료");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_psNm", "absolute", "965", "125", "150", "21", null, null, this);
            obj.set_taborder("26");
            obj.set_maxlength("80");
            obj.set_enable("false");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_psNm", "absolute", "840", "119", "120", "32", null, null, this);
            obj.set_taborder("27");
            obj.set_text("프리미엄서비스");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_mapYn", "absolute", "685", "125", "150", "21", null, null, this);
            obj.set_taborder("28");
            obj.set_maxlength("6");
            obj.set_enable("false");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_mapYn", "absolute", "560", "120", "120", "31", null, null, this);
            obj.set_taborder("29");
            obj.set_text("중도완납여부");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_osYn", "absolute", "405", "125", "150", "21", null, null, this);
            obj.set_taborder("30");
            obj.set_maxlength("6");
            obj.set_enable("false");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_osYn", "absolute", "280", "120", "120", "31", null, null, this);
            obj.set_taborder("31");
            obj.set_text("소유권이전여부");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("Static08", "absolute", "0", "318", "80", "21", null, null, this);
            obj.set_taborder("32");
            obj.set_text("결제정보");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static09", "absolute", "0", "370", "1122", "31", null, null, this);
            obj.set_taborder("33");
            obj.set_cssclass("sta_WF_detailLabel2");
            obj.set_enable("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_blancAmt", "absolute", "740", "370", "150", "31", null, null, this);
            obj.set_taborder("34");
            obj.set_text("렌탈료잔액");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("st_recpAmt", "absolute", "370", "370", "150", "31", null, null, this);
            obj.set_taborder("35");
            obj.set_text("렌탈료 수납액");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("st_saleAmt", "absolute", "0", "370", "150", "31", null, null, this);
            obj.set_taborder("36");
            obj.set_text("총렌탈료");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("Static10", "absolute", "0", "400", "1122", "31", null, null, this);
            obj.set_taborder("37");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_MakeAmt", "absolute", "740", "400", "150", "31", null, null, this);
            obj.set_taborder("38");
            obj.set_text("납부예정금액");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("st_arre2Amt", "absolute", "370", "400", "150", "31", null, null, this);
            obj.set_taborder("39");
            obj.set_text("할인 대상");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("st_arre1Amt", "absolute", "0", "400", "150", "31", null, null, this);
            obj.set_taborder("40");
            obj.set_text("할인 미대상");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("Static11", "absolute", "0", "430", "1122", "31", null, null, this);
            obj.set_taborder("41");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_planAmt", "absolute", "740", "430", "150", "31", null, null, this);
            obj.set_taborder("42");
            obj.set_text("총납부예정금액");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("st_servAmt", "absolute", "370", "430", "150", "31", null, null, this);
            obj.set_taborder("43");
            obj.set_text("추가납부금액");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("Static12", "absolute", "0", "460", "1122", "31", null, null, this);
            obj.set_taborder("44");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_planAmt2", "absolute", "740", "460", "150", "31", null, null, this);
            obj.set_taborder("45");
            obj.set_text("수납금액");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("st_addr08", "absolute", "370", "460", "150", "31", null, null, this);
            obj.set_taborder("46");
            obj.set_text("은행입금일");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("st_canclDay", "absolute", "0", "460", "150", "31", null, null, this);
            obj.set_taborder("47");
            obj.set_text("중도완납일자");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("st_endTp", "absolute", "345", "0", "100", "31", null, null, this);
            obj.set_taborder("48");
            obj.set_text("계약종료유형");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Combo("cb_endTpSearch", "absolute", "450", "5", "104", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("49");
            obj.set_innerdataset("@ds_endTp");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_enable("true");
            obj.set_visible("true");
            obj.getSetter("domainId").set("nexa.name;nexa.code");

            obj = new Calendar("cal_cancDay", "absolute", "966", "95", "150", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("50");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_enable("false");
            obj.set_readonly("true");

            obj = new Calendar("cal_ordDay", "absolute", "685", "95", "150", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("51");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_enable("false");
            obj.set_readonly("true");

            obj = new Calendar("cal_canclDay", "absolute", "155", "465", "210", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("52");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_enable("false");
            obj.set_visible("true");
            obj.set_readonly("false");

            obj = new Calendar("ed_bankRecpDay", "absolute", "525", "465", "210", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("53");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_enable("true");
            obj.set_visible("true");

            obj = new MaskEdit("ed_recpAmt2", "absolute", "895", "465", "221", "21", null, null, this);
            obj.set_taborder("54");
            obj.set_mask("###,###,##0");
            obj.set_enable("true");
            obj.set_visible("true");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("ed_planAmt", "absolute", "895", "435", "221", "21", null, null, this);
            obj.set_taborder("55");
            obj.set_mask("###,###,##0");
            obj.set_enable("false");
            obj.set_visible("true");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("ed_makeAmt", "absolute", "895", "405", "221", "21", null, null, this);
            obj.set_taborder("56");
            obj.set_mask("###,###,##0");
            obj.set_enable("false");
            obj.set_visible("true");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("ed_blancAmt", "absolute", "895", "375", "221", "21", null, null, this);
            obj.set_taborder("57");
            obj.set_mask("###,###,##0");
            obj.set_enable("false");
            obj.set_visible("true");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("ed_recpAmt", "absolute", "525", "375", "210", "21", null, null, this);
            obj.set_taborder("58");
            obj.set_mask("###,###,##0");
            obj.set_enable("false");
            obj.set_visible("true");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("ed_servAmt", "absolute", "525", "435", "210", "21", null, null, this);
            obj.set_taborder("59");
            obj.set_mask("###,###,##0");
            obj.set_enable("true");
            obj.set_visible("true");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("ed_saleAmt", "absolute", "155", "375", "210", "21", null, null, this);
            obj.set_taborder("60");
            obj.set_mask("###,###,##0");
            obj.set_enable("false");
            obj.set_visible("true");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("ed_monAmt", "absolute", "126", "155", "150", "21", null, null, this);
            obj.set_taborder("61");
            obj.set_mask("###,###,##0");
            obj.set_enable("false");
            obj.set_visible("true");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_cancDay", "absolute", "560", "0", "100", "31", null, null, this);
            obj.set_taborder("62");
            obj.set_text("취소일자");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Calendar("cal_cancDaySearch", "absolute", "665", "5", "120", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("63");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_enable("true");
            obj.set_readonly("false");

            obj = new Edit("ed_psNm00", "absolute", "126", "125", "150", "21", null, null, this);
            obj.set_taborder("64");
            obj.set_maxlength("80");
            obj.set_enable("false");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("Static07", "absolute", "0", "340", "1122", "31", null, null, this);
            obj.set_taborder("65");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_regiAmt", "absolute", "0", "340", "150", "31", null, null, this);
            obj.set_taborder("66");
            obj.set_text("회원등록비");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("ed_regiAmt", "absolute", "155", "345", "210", "21", null, null, this);
            obj.set_taborder("67");
            obj.set_readonly("true");
            obj.set_mask("###,###,##0");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("st_rgcpAmt", "absolute", "370", "340", "150", "31", null, null, this);
            obj.set_taborder("68");
            obj.set_text("회원등록비 수납액");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("ed_rgcpAmt", "absolute", "525", "345", "210", "21", null, null, this);
            obj.set_taborder("69");
            obj.set_readonly("true");
            obj.set_mask("###,###,##0");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("st_rgblancAmt", "absolute", "740", "340", "150", "31", null, null, this);
            obj.set_taborder("70");
            obj.set_text("회원등록비잔액");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("ed_rgblancAmt", "absolute", "895", "345", "221", "21", null, null, this);
            obj.set_taborder("71");
            obj.set_readonly("true");
            obj.set_mask("###,###,##0");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("ed_arre1Amt", "absolute", "155", "405", "210", "21", null, null, this);
            obj.set_taborder("72");
            obj.set_readonly("true");
            obj.set_mask("###,###,##0");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("ed_arre2Amt", "absolute", "525", "405", "210", "21", null, null, this);
            obj.set_taborder("73");
            obj.set_readonly("true");
            obj.set_mask("###,###,##0");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("st_balanceAmt", "absolute", "0", "430", "150", "31", null, null, this);
            obj.set_taborder("74");
            obj.set_text("선수금 잔액");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            obj.style.set_color("black");
            obj.style.set_font("9 arial");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("ed_balanceAmt", "absolute", "155", "435", "210", "21", null, null, this);
            obj.set_taborder("75");
            obj.set_readonly("true");
            obj.set_mask("###,###,##0");
            obj.set_enable("false");
            obj.style.setStyleValue("color", "disabled", "red");
            obj.style.setStyleValue("font", "disabled", "9 맑은 고딕");
            this.addChild(obj.name, obj);

            obj = new Grid("grid_prdInfo", "absolute", "0", "213", "1122", "99", null, null, this);
            obj.set_taborder("76");
            obj.set_binddataset("ds_prdInfo");
            obj.set_scrollbars("autohorz");
            obj.set_cellsizingtype("col");
            obj.set_autofittype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"123\"/><Column size=\"251\"/><Column size=\"110\"/><Column size=\"148\"/><Column size=\"153\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell text=\"상품코드\" expandsize=\"13\"/><Cell col=\"1\" text=\"상품명\"/><Cell col=\"2\" text=\"수량\"/><Cell col=\"3\" text=\"장착예정일\"/><Cell col=\"4\" text=\"장착일\"/></Band><Band id=\"body\"><Cell celltype=\"none\" text=\"bind:matCd\"/><Cell col=\"1\" celltype=\"none\" text=\"bind:matNm\"/><Cell col=\"2\" celltype=\"none\" displaytype=\"normal\" edittype=\"none\" text=\"bind:ordQty\"/><Cell col=\"3\" displaytype=\"date\" text=\"bind:planDay\" calendardisplaynulltype=\"none\"/><Cell col=\"4\" displaytype=\"date\" text=\"bind:instDay\" calendardisplay=\"edit\" calendardisplaynulltype=\"none\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static13", "absolute", "0", "189", "80", "21", null, null, this);
            obj.set_taborder("77");
            obj.set_text("제품정보");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("st_custNm00", "absolute", "560", "60", "120", "31", null, null, this);
            obj.set_taborder("78");
            obj.set_text("고객명");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("st_ordNm", "absolute", "560", "60", "120", "31", null, null, this);
            obj.set_taborder("79");
            obj.set_text("주문구분");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1147, 511, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTREMiddleFullPayment");
            		p.set_titletext("중도완납");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item0","ed_custNo","value","ds_cancelList","custNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item1","ed_custNm","value","ds_cancelList","custNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item2","ed_ordNm","value","ds_cancelList","ordNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item3","ed_chanNm","value","ds_cancelList","chanNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item4","ed_saleNm","value","ds_cancelList","saleNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item5","ed_statNm","value","ds_cancelList","statNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item6","cal_ordDay","value","ds_cancelList","ordDay");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item9","cal_cancDay","value","ds_cancelList","cancDay");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item13","ed_psNm00","value","ds_cancelList","periodNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item14","ed_osYn","value","ds_cancelList","osYn");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item15","ed_mapYn","value","ds_cancelList","mepYn");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item16","ed_psNm","value","ds_cancelList","psNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item17","ed_monAmt","value","ds_cancelList","monAmt");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item18","ed_saleAmt","value","ds_cancelList","saleAmt");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item19","ed_recpAmt","value","ds_cancelList","recpAmt");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item20","ed_blancAmt","value","ds_cancelList","blancAmt");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item23","ed_makeAmt","value","ds_cancelList","makeAmt");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item25","ed_planAmt","value","ds_cancelList","planAmt");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item27","ed_servAmt","value","ds_cancelList","servAmt");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item24","ed_recpAmt2","value","ds_cancelSave","recpAmt");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item26","ed_bankRecpDay","value","ds_cancelSave","bankRecpDay");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item28","cal_canclDay","value","ds_cancelSave","canclDay");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item29","ed_regiAmt","value","ds_cancelList","regiAmt");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item30","ed_rgcpAmt","value","ds_cancelList","rgcpAmt");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item31","ed_rgblancAmt","value","ds_cancelList","rgblancAmt");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item21","ed_arre1Amt","value","ds_cancelList","arre1Amt");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item22","ed_arre2Amt","value","ds_cancelList","arre2Amt");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item32","ed_balanceAmt","value","ds_cancelList","balanceAmt");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTREMiddleFullPayment.xfdl", "lib::comLib.xjs");
        this.registerScript("RTREMiddleFullPayment.xfdl", function() {
        	//include "lib::comLib.xjs";
        	
        	this.SUPER_ID   = "wjim";	// 슈퍼유저 ID
        	
        	this.p_arg = "RTSDContractRegister";
        	this.fg_isSuper = "N";	// 슈퍼유저 여부
        	
        	this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg){
        		if(strSvcId == "initRTREMiddleFullPayment"){
        			var ct = this.ds_endTp.getRowCount();
        			if( ct != 0 ){
        				this.cb_endTpSearch.set_value( this.ds_endTp.getColumn(this.ds_endTp.rowposition,"cd") );
        			}
        		}
        		
        		if(strSvcId == "pSrtsd0109CancelList") {
        			if(this.ds_cancelList.getRowCount() > 0) {
        				this.ds_cancelSave.setColumn(0, "arre1Amt", this.ds_cancelList.getColumn(0, "arre1Amt"));
        				this.ed_servAmt.setFocus(true);
        				
        				var ordNo 	= nvl(this.ed_ordNoSearch.value);
        				this.FN_ListPrdInfo(ordNo);//2018-12-14 제품정보 그리드 추가
        			}else{
        				alert("조회결과가 없습니다.");
        			}
        		}
        		
        		if(strSvcId == "cancelSave"){
        			if( nErrorCode == "0" ){
        				alert(strErrorMsg);
        				this.reload();
        			}else{
        				alert(strErrorMsg);
        			}
        		}
        		//2018-12-24 제품정보 그리드 추가
        		if( strSvcId == "getListPrdInfo" ){
        			var cnt = this.ds_prdInfo.getRowCount();
        			if( cnt == 0 ){
        				this.grid_prdInfo.set_nodatatext("조회된 결과가 없습니다.");
        			}
        		}
        	}
        	
        	
        	
        	this.RTREMiddleFullPayment_onload = function(obj,e)
        	{
        		Ex.core.init(obj);
        		this.FN_init();
        		this.parent.setButton("S", this);
        		/*this.parent.setButton("C|S", this);*/
        	}
        	
        	
        	
        	this.FN_init = function(){
        		// 슈퍼유저여부 확인
        		// - 슈퍼유저인 경우 중도완납일자를 수정할 수 있음
        		if (application.gds_userInfo.getColumn(0, "userId" ) == this.SUPER_ID) {
        			this.fg_isSuper = "Y";
        			this.cal_canclDay.set_enable(true);		// 중도완납일자 수정가능
        		} else {
        			this.fg_isSuper = "N";
        			this.cal_canclDay.set_enable(false);	// 중도완납일자 수정불가(기본세팅)
        		}
        		
        		this.ds_cancelSave.addRow();
        		
        		this.cal_cancDaySearch.set_value(FN_today());
        		this.cal_canclDay.set_value(FN_today());
        		this.ed_bankRecpDay.set_value(FN_today());
        			
        		var sSvcID      	= "initRTREMiddleFullPayment";  
        		var sController   	= "rtms/re/initRTREMiddleFullPayment.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_endTp=mapDsEndTp";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        	
        	
        	
        	this.btn_orderNoSearch_onclick = function(obj,e)
        	{
        		var args ={ p_arg : this.p_arg };
        		Ex.core.popup(this,"계약번호 조회","comm::RTCOMMOrderNo_pop.xfdl",args, "modaless=false");	
        	}
        	this.returnOrderNoInfo = function(ordNo){
        		this.FN_change();
        		this.ed_ordNoSearch.set_value(ordNo);
        	}
        	
        	
        	
        	this.fn_search = function(){
        	
        		this.ds_prdInfo.clearData();//2018-12-24 제품정보 그리드 추가
        		
        		var sSvcID        	= "pSrtsd0109CancelList";                    
        		var sController   	= "rtms/re/pSrtsd0109CancelList.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_cancelList=mapCancelList";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		this.FN_change();
        		
        		var ordNo 	= nvl(this.ed_ordNoSearch.value);
        		var endTp 	= nvl(this.cb_endTpSearch.value);
        		var cancDay = nvl(this.cal_cancDaySearch.value);
        		
        		
        		
        		if( cancDay < FN_today()){
        			if (this.fg_isSuper == "Y") {
        				this.alert("슈퍼유저시군요! 단, 이전날자로 조회/처리 시 해당월 마감여부를 반드시 확인하시기 바랍니다!");
        			} else {
        				alert("이전날짜는 조회할 수가 없습니다.");
        				this.cal_cancDaySearch.set_value( FN_today() );
        				return false;
        			}			
        		}
        			
        			
        	
        		if( ordNo == "" ){
        			alert("계약번호 값이 없습니다.");
        			//this.btn_orderNoSearch_onclick();
        		}
        			
        		
        		
        		sArgs += Ex.util.setParam("ordNo", ordNo);
        		sArgs += Ex.util.setParam("endTp", endTp);
        		sArgs += Ex.util.setParam("cancDay", cancDay);
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        	
        	
        	
        	this.FN_change = function(){
        		this.ds_cancelList.clearData();
        		this.ds_cancelSave.clearData();
        		this.ds_cancelSave.addRow();
        		this.cal_canclDay.set_value(FN_today());
        		this.ed_bankRecpDay.set_value(FN_today());
        		this.ds_prdInfo.clearData();//2018-12-24 제품정보 그리드 추가
        	}
        	
        	
        	
        	this.cb_endTpSearch_onitemchanged = function(obj,e)
        	{
        		this.FN_change();
        		
        		//C	중도해지
        		//E	중도완납
        		if( obj.value == "C" ){
        			this.st_canclDay.set_text("중도해지일자");
        		}
        		if( obj.value == "E" ){
        			this.st_canclDay.set_text("중도완납일자");
        		}
        	}
        	this.cal_cancDaySearch_onchanged = function(obj,e)
        	{
        		this.FN_change();
        	}
        	this.ed_ordNoSearch_onchanged = function(obj,e)
        	{
        		this.FN_change();
        	}
        	this.ed_servAmt_onchanged = function(obj,e)
        	{
        		if( obj.value < 0 ){
        			alert("0보다 작습니다.");
        			return false;
        		}else{
        			var makeAmt = parseInt(this.ed_makeAmt.value);
        			var servAmt = parseInt(obj.value);
        			var sum = makeAmt + servAmt;
        			this.ed_planAmt.set_value(sum);
        		}
        	}
        	
        	
        // 	this.fn_save = function(){
        // 		var statCd   = this.ds_cancelList.getColumn(0, "statCd");
        // 		var cancDay1 = nvl(this.cal_cancDaySearch.value);
        // 		var cancDay2 = nvl(this.cal_canclDay.value);
        // 		
        // 		if( cancDay1 != cancDay2 ){
        // 			alert("취소일자랑 중도완납일자랑 다릅니다.\n오늘날짜로 다시 조회 후 저장하세요.");
        // 			return false;
        // 		}
        // 		
        // 		if( statCd == "04"){//계약상태가 장착
        // 			var cnt = this.ds_cancelSave.getRowCount();
        // 			if( cnt == 1 ){
        // 				this.ds_cancelSave.setColumn(0, "ordNo", this.ed_ordNoSearch.value);
        // 				this.ds_cancelSave.setColumn(0, "endTp", this.cb_endTpSearch.value);
        // 				this.ds_cancelSave.setColumn(0, "arre1Amt", this.ed_arre1Amt.value);
        // 				
        // 				var ordNo 		= nvl(this.ds_cancelSave.getColumn(0, "ordNo"));
        // 				var endTp 		= nvl(this.ds_cancelSave.getColumn(0, "endTp"));
        // 				var canclDay 	= nvl(this.ds_cancelSave.getColumn(0, "canclDay"));
        // 				var bankRecpDay = nvl(this.ds_cancelSave.getColumn(0, "bankRecpDay"));
        // 				var recpAmt 	= nvl(this.ds_cancelSave.getColumn(0, "recpAmt"));
        // 				var arre1Amt	= nvl(this.ds_cancelSave.getColumn(0, "arre1Amt"));
        // 				
        // 				var planAmt = this.ds_cancelList.getColumn(0, "planAmt");
        // 				
        // 				if( ordNo == "" ){ 			alert("계약번호 값이 없습니다."); 	return false; }
        // 				if( endTp == "" ){ 			alert("종료유형 값이 없습니다."); 	return false; }
        // 				if( canclDay == "" ){ 		alert("중도완납일 값이 없습니다."); 	return false; }
        // 				if( bankRecpDay == "" ){ 	alert("은행입금일 값이 없습니다."); 	return false; }
        // 				if( recpAmt == "" ){ 		alert("수납금액 값이 없습니다."); 	this.ed_recpAmt2.setFocus(true); return false; }
        // 				if( arre1Amt == "" ){  		alert("할인미대상 값이 없습니다."); 	return false; }
        // 				
        // 				if( recpAmt != planAmt ){	alert("총납부예정금액과 수납금액이 같아야 합니다."); 	return false; }
        // 				
        // 				if( confirm( "중도완납(해지) 처리가 되면 원복이 불가능합니다. 처리하시겠습니까?") ){
        // 					var sSvcID        	= "cancelSave";                    
        // 					var sController   	= "rtms/sd/cancelSave.do";
        // 					var sInDatasets   	= "";
        // 					var sOutDatasets  	= "";
        // 					var sArgs 			= "";	
        // 					sInDatasets   		= "input1=ds_cancelSave:U";
        // 					sOutDatasets  		= "";
        // 					var fn_callBack		= "fn_callBack";
        // 					Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        // 				}
        // 			}else{
        // 				alert("중도완납 저장을 실패하였습니다.");
        // 				this.reload();
        // 			}
        // 		}else{
        // 			alert("계약상태가 장착이 아닙니다.\n확인바랍니다.");
        // 		}
        // 	}
        	
        		//2018-12-14 제품정보 그리드 추가
        	this.FN_ListPrdInfo = function(ordNo ){
        		var sSvcID      	= "getListPrdInfo";  
        		var sController   	= "rtms/sd/listPrdInfo.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_prdInfo=listPrdInfo";
        		var sArgs 			= "";
        			sArgs		   += Ex.util.setParam("ordNo"	, ordNo);
        		var fn_callBack		= "fn_callBack";
        		
        		Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        		

        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTREMiddleFullPayment_onload, this);
            this.ed_ordNoSearch.addEventHandler("onchanged", this.ed_ordNoSearch_onchanged, this);
            this.btn_orderNoSearch.addEventHandler("onclick", this.btn_orderNoSearch_onclick, this);
            this.cb_endTpSearch.addEventHandler("onitemchanged", this.cb_endTpSearch_onitemchanged, this);
            this.ed_servAmt.addEventHandler("onchanged", this.ed_servAmt_onchanged, this);
            this.cal_cancDaySearch.addEventHandler("onchanged", this.cal_cancDaySearch_onchanged, this);

        };

        this.loadIncludeScript("RTREMiddleFullPayment.xfdl");

       
    };
}
)();
