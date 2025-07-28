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
                this.set_name("RTSDContractStatus");
                this.set_classname("contractStatus");
                this.set_titletext("계약현황조회(본사용)");
                this._setFormPosition(0,0,1147,538);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_contractStatus", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"ordNm\" type=\"STRING\" size=\"256\"/><Column id=\"chanNm\" type=\"STRING\" size=\"256\"/><Column id=\"saleNm\" type=\"STRING\" size=\"256\"/><Column id=\"statNm\" type=\"STRING\" size=\"256\"/><Column id=\"ordDay\" type=\"STRING\" size=\"256\"/><Column id=\"planDay\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"cancDay\" type=\"STRING\" size=\"256\"/><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"ordQty\" type=\"STRING\" size=\"256\"/><Column id=\"periodNm\" type=\"STRING\" size=\"256\"/><Column id=\"osYn\" type=\"STRING\" size=\"256\"/><Column id=\"mfpYn\" type=\"STRING\" size=\"256\"/><Column id=\"psNm\" type=\"STRING\" size=\"256\"/><Column id=\"makerNm\" type=\"STRING\" size=\"256\"/><Column id=\"mcNm\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"carOwner\" type=\"STRING\" size=\"256\"/><Column id=\"cMileage\" type=\"STRING\" size=\"256\"/><Column id=\"maMileage\" type=\"STRING\" size=\"256\"/><Column id=\"reqText\" type=\"STRING\" size=\"256\"/><Column id=\"birthDay\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"vbeln\" type=\"STRING\" size=\"256\"/><Column id=\"chanCd\" type=\"STRING\" size=\"256\"/><Column id=\"statCd\" type=\"STRING\" size=\"256\"/><Column id=\"seasonNm\" type=\"STRING\" size=\"256\"/><Column id=\"makerCd\" type=\"STRING\" size=\"256\"/><Column id=\"modelCd\" type=\"STRING\" size=\"256\"/><Column id=\"contentsCd\" type=\"STRING\" size=\"256\"/><Column id=\"frCd\" type=\"STRING\" size=\"256\"/><Column id=\"provsnNo\" type=\"STRING\" size=\"256\"/><Column id=\"rerentDayF\" type=\"STRING\" size=\"256\"/><Column id=\"rerentDayT\" type=\"STRING\" size=\"256\"/><Column id=\"saleCd\" type=\"STRING\" size=\"256\"/><Column id=\"saleCdNm\" type=\"STRING\" size=\"256\"/><Column id=\"saleCdDc\" type=\"STRING\" size=\"256\"/><Column id=\"o2oYn\" type=\"STRING\" size=\"256\"/><Column id=\"today\" type=\"STRING\" size=\"256\"/><Column id=\"posCd\" type=\"STRING\" size=\"256\"/><Column id=\"city\" type=\"STRING\" size=\"256\"/><Column id=\"street\" type=\"STRING\" size=\"256\"/><Column id=\"agencyCd\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"tmsOrderId\" type=\"STRING\" size=\"256\"/><Column id=\"omsOrderNo\" type=\"STRING\" size=\"256\"/><Column id=\"cancCd\" type=\"STRING\" size=\"256\"/><Column id=\"firstDay\" type=\"STRING\" size=\"256\"/><Column id=\"bondSelDay\" type=\"STRING\" size=\"256\"/><Column id=\"Column0\" type=\"STRING\" size=\"256\"/><Column id=\"vbelnD\" type=\"STRING\" size=\"256\"/><Column id=\"vbelnR\" type=\"STRING\" size=\"256\"/><Column id=\"paidState\" type=\"STRING\" size=\"256\"/><Column id=\"ordCount\" type=\"STRING\" size=\"256\"/><Column id=\"roVan\" type=\"STRING\" size=\"256\"/><Column id=\"addrText\" type=\"STRING\" size=\"256\"/><Column id=\"instCd\" type=\"STRING\" size=\"256\"/><Column id=\"instNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_installCp", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"agencyNm\" type=\"STRING\" size=\"256\"/><Column id=\"agencyCd\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"salesOffice\" type=\"STRING\" size=\"256\"/><Column id=\"salesOfficeCd\" type=\"STRING\" size=\"256\"/><Column id=\"salesGroup\" type=\"STRING\" size=\"256\"/><Column id=\"salesGroupCd\" type=\"STRING\" size=\"256\"/><Column id=\"engNm\" type=\"STRING\" size=\"256\"/><Column id=\"equNo\" type=\"STRING\" size=\"256\"/><Column id=\"instYn\" type=\"STRING\" size=\"256\"/><Column id=\"planDay\" type=\"STRING\" size=\"256\"/><Column id=\"agDesc\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"instCd\" type=\"STRING\" size=\"256\"/><Column id=\"instNm\" type=\"STRING\" size=\"256\"/><Column id=\"instTm\" type=\"STRING\" size=\"256\"/><Column id=\"inst1PosCd\" type=\"STRING\" size=\"256\"/><Column id=\"inst1Addr1\" type=\"STRING\" size=\"256\"/><Column id=\"inst1Addr2\" type=\"STRING\" size=\"256\"/><Column id=\"inst2PosCd\" type=\"STRING\" size=\"256\"/><Column id=\"inst2Addr1\" type=\"STRING\" size=\"256\"/><Column id=\"inst2Addr2\" type=\"STRING\" size=\"256\"/><Column id=\"instDay\" type=\"STRING\" size=\"256\"/><Column id=\"addr\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_payCp", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"payMthd\" type=\"STRING\" size=\"256\"/><Column id=\"payDd\" type=\"STRING\" size=\"256\"/><Column id=\"accSeq\" type=\"STRING\" size=\"256\"/><Column id=\"bankNm\" type=\"STRING\" size=\"256\"/><Column id=\"acctNo\" type=\"STRING\" size=\"256\"/><Column id=\"crdSeq\" type=\"STRING\" size=\"256\"/><Column id=\"cardcomNm\" type=\"STRING\" size=\"256\"/><Column id=\"cardNo\" type=\"STRING\" size=\"256\"/><Column id=\"accChk\" type=\"STRING\" size=\"256\"/><Column id=\"accStat\" type=\"STRING\" size=\"256\"/><Column id=\"bkeyChk\" type=\"STRING\" size=\"256\"/><Column id=\"batchKey\" type=\"STRING\" size=\"256\"/><Column id=\"billYn\" type=\"STRING\" size=\"256\"/><Column id=\"sumMonAmt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_discountCp", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"regiAmt\" type=\"STRING\" size=\"256\"/><Column id=\"monAmt\" type=\"STRING\" size=\"256\"/><Column id=\"rentAmt\" type=\"STRING\" size=\"256\"/><Column id=\"monDcamt\" type=\"STRING\" size=\"256\"/><Column id=\"cDcamt\" type=\"STRING\" size=\"256\"/><Column id=\"grpYn\" type=\"STRING\" size=\"256\"/><Column id=\"grpNo\" type=\"STRING\" size=\"256\"/><Column id=\"gDcrate\" type=\"STRING\" size=\"256\"/><Column id=\"gDcamt\" type=\"STRING\" size=\"256\"/><Column id=\"lDcrate\" type=\"STRING\" size=\"256\"/><Column id=\"lDcamt\" type=\"STRING\" size=\"256\"/><Column id=\"fDcamt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_agreeCp", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"certNm\" type=\"STRING\" size=\"256\"/><Column id=\"certYn\" type=\"STRING\" size=\"256\"/><Column id=\"crdtStat\" type=\"STRING\" size=\"256\"/><Column id=\"nagYn\" type=\"STRING\" size=\"256\"/><Column id=\"statCd1\" type=\"STRING\" size=\"256\"/><Column id=\"statCd2\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_preminumCp", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"psCd\" type=\"STRING\" size=\"256\"/><Column id=\"psNm\" type=\"STRING\" size=\"256\"/><Column id=\"prsDcd\" type=\"STRING\" size=\"256\"/><Column id=\"prsNm\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"servCnt0\" type=\"STRING\" size=\"256\"/><Column id=\"servCntr\" type=\"STRING\" size=\"256\"/><Column id=\"servAmt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_sellerCp", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"ordAgent\" type=\"STRING\" size=\"256\"/><Column id=\"orgAgnm\" type=\"STRING\" size=\"256\"/><Column id=\"orgAgtel\" type=\"STRING\" size=\"256\"/><Column id=\"orgCd\" type=\"STRING\" size=\"256\"/><Column id=\"orgNm\" type=\"STRING\" size=\"256\"/><Column id=\"orgTel\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_adviceCp", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"Column0\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_saveOrdCancel", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"cancCd\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_historyCp", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"equNo\" type=\"STRING\" size=\"256\"/><Column id=\"servSeq\" type=\"STRING\" size=\"256\"/><Column id=\"seq\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"procTm\" type=\"STRING\" size=\"256\"/><Column id=\"serviceCd\" type=\"STRING\" size=\"256\"/><Column id=\"serviceNm\" type=\"STRING\" size=\"256\"/><Column id=\"procInCd\" type=\"STRING\" size=\"256\"/><Column id=\"procInNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_eleSigCP", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"sheetId\" type=\"STRING\" size=\"256\"/><Column id=\"sheetNm\" type=\"STRING\" size=\"256\"/><Column id=\"regDay\" type=\"STRING\" size=\"256\"/><Column id=\"regTm\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regNm\" type=\"STRING\" size=\"256\"/><Column id=\"fileName\" type=\"STRING\" size=\"256\"/><Column id=\"emailAddr\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_prdInfoCp", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"saleGdsCd\" type=\"STRING\" size=\"256\"/><Column id=\"standard\" type=\"STRING\" size=\"256\"/><Column id=\"amt\" type=\"STRING\" size=\"256\"/><Column id=\"groupSale\" type=\"STRING\" size=\"256\"/><Column id=\"chnlSale\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"periodNm\" type=\"STRING\" size=\"256\"/><Column id=\"seasonNm\" type=\"STRING\" size=\"256\"/><Column id=\"cntNm\" type=\"STRING\" size=\"256\"/><Column id=\"seasonCd\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"seq\" type=\"STRING\" size=\"256\"/><Column id=\"ordId\" type=\"STRING\" size=\"256\"/><Column id=\"periodCd\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"regiCd\" type=\"STRING\" size=\"256\"/><Column id=\"frCd\" type=\"STRING\" size=\"256\"/><Column id=\"lrCd\" type=\"STRING\" size=\"256\"/><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"ordQty\" type=\"STRING\" size=\"256\"/><Column id=\"regiAmt\" type=\"STRING\" size=\"256\"/><Column id=\"rentAmt\" type=\"STRING\" size=\"256\"/><Column id=\"rentpAmt\" type=\"STRING\" size=\"256\"/><Column id=\"fDcrate\" type=\"STRING\" size=\"256\"/><Column id=\"fDcamt\" type=\"STRING\" size=\"256\"/><Column id=\"monDcamt\" type=\"STRING\" size=\"256\"/><Column id=\"monAmt\" type=\"STRING\" size=\"256\"/><Column id=\"planDay\" type=\"STRING\" size=\"256\"/><Column id=\"planTm\" type=\"STRING\" size=\"256\"/><Column id=\"instDay\" type=\"STRING\" size=\"256\"/><Column id=\"instTm\" type=\"STRING\" size=\"256\"/><Column id=\"instYn\" type=\"STRING\" size=\"256\"/><Column id=\"valYn\" type=\"STRING\" size=\"256\"/><Column id=\"equNo\" type=\"STRING\" size=\"256\"/><Column id=\"osId\" type=\"STRING\" size=\"256\"/><Column id=\"osDay\" type=\"STRING\" size=\"256\"/><Column id=\"statCd\" type=\"STRING\" size=\"256\"/><Column id=\"flYn\" type=\"STRING\" size=\"256\"/><Column id=\"frYn\" type=\"STRING\" size=\"256\"/><Column id=\"rlYn\" type=\"STRING\" size=\"256\"/><Column id=\"rrYn\" type=\"STRING\" size=\"256\"/><Column id=\"matDesc\" type=\"STRING\" size=\"256\"/><Column id=\"saleCd\" type=\"STRING\" size=\"256\"/><Column id=\"gdsGb\" type=\"STRING\" size=\"256\"/><Column id=\"gdsGrp\" type=\"STRING\" size=\"256\"/><Column id=\"o2oStockYn\" type=\"STRING\" size=\"256\"/><Column id=\"outStockYn\" type=\"STRING\" size=\"256\"/><Column id=\"outStockType\" type=\"STRING\" size=\"256\"/><Column id=\"outStockTypeNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_etcPrdInfoCp", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"chk\" type=\"STRING\" size=\"256\"/><Column id=\"addGdsCd\" type=\"STRING\" size=\"256\"/><Column id=\"addGdsNm\" type=\"STRING\" size=\"256\"/><Column id=\"amt\" type=\"STRING\" size=\"256\"/><Column id=\"makerNm\" type=\"STRING\" size=\"256\"/><Column id=\"gdsDesc\" type=\"STRING\" size=\"256\"/><Column id=\"gdsGrpNm\" type=\"STRING\" size=\"256\"/><Column id=\"gdsGrp\" type=\"STRING\" size=\"256\"/><Column id=\"dcAmt\" type=\"STRING\" size=\"256\"/><Column id=\"actAmt\" type=\"STRING\" size=\"256\"/><Column id=\"dcYn\" type=\"STRING\" size=\"256\"/><Column id=\"monAmt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_rtsd0213", this);
            obj._setContents("<ColumnInfo><Column id=\"rentIfCntrNo\" type=\"STRING\" size=\"256\"/><Column id=\"ordDe\" type=\"STRING\" size=\"256\"/><Column id=\"saleTyCd\" type=\"STRING\" size=\"256\"/><Column id=\"rentIfReqSn\" type=\"STRING\" size=\"256\"/><Column id=\"rentIfBfistSeCd\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"iplMobNo\" type=\"STRING\" size=\"256\"/><Column id=\"iplTelNo\" type=\"STRING\" size=\"256\"/><Column id=\"istBpCd\" type=\"STRING\" size=\"256\"/><Column id=\"itemCd\" type=\"STRING\" size=\"256\"/><Column id=\"ordQy\" type=\"STRING\" size=\"256\"/><Column id=\"dlvTyDtlCd\" type=\"STRING\" size=\"256\"/><Column id=\"istReqDe\" type=\"STRING\" size=\"256\"/><Column id=\"pickupZip\" type=\"STRING\" size=\"256\"/><Column id=\"pickupBassAddr\" type=\"STRING\" size=\"256\"/><Column id=\"pickupDtlAddr\" type=\"STRING\" size=\"256\"/><Column id=\"iplZip\" type=\"STRING\" size=\"256\"/><Column id=\"iplAddr\" type=\"STRING\" size=\"256\"/><Column id=\"iplDtlAddr\" type=\"STRING\" size=\"256\"/><Column id=\"regUsrId\" type=\"STRING\" size=\"256\"/><Column id=\"ordRsn\" type=\"STRING\" size=\"256\"/><Column id=\"sendURL\" type=\"STRING\" size=\"256\"/><Column id=\"o2oYn\" type=\"STRING\" size=\"256\"/><Column id=\"opertSts\" type=\"STRING\" size=\"256\"/><Column id=\"opertDe\" type=\"STRING\" size=\"256\"/><Column id=\"drgMil\" type=\"STRING\" size=\"256\"/><Column id=\"orderId\" type=\"STRING\" size=\"256\"/><Column id=\"tmplCd\" type=\"STRING\" size=\"256\"/><Column id=\"omsOrderNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_S308", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_S313", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_controlAuth", this);
            obj._setContents("<ColumnInfo><Column id=\"mdlCd\" type=\"STRING\" size=\"256\"/><Column id=\"prgmCd\" type=\"STRING\" size=\"256\"/><Column id=\"controlId\" type=\"STRING\" size=\"256\"/><Column id=\"userGrp\" type=\"STRING\" size=\"256\"/><Column id=\"userId\" type=\"STRING\" size=\"256\"/><Column id=\"typeCd\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static17", "absolute", "0", "0", "444", "31", null, null, this);
            obj.set_taborder("2");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_ordNo", "absolute", "105", "5", "150", "20", null, null, this);
            obj.set_taborder("3");
            obj.set_maxlength("15");
            this.addChild(obj.name, obj);

            obj = new Button("btn_orderNo", "absolute", "259", "5", "89", "21", null, null, this);
            obj.set_taborder("4");
            obj.set_text("계약번호찾기");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Static("st_ordNo", "absolute", "0", "0", "100", "31", null, null, this);
            obj.set_taborder("5");
            obj.set_text("계약번호");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("Static34", "absolute", "0", "54", "1122", "31", null, null, this);
            obj.set_taborder("6");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_custNo", "absolute", "0", "54", "130", "31", null, null, this);
            obj.set_taborder("7");
            obj.set_text("고객코드");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_custNo", "absolute", "134", "59", "142", "21", null, null, this);
            obj.set_taborder("8");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_contractInfo", "absolute", "0", "34", "80", "21", null, null, this);
            obj.set_taborder("9");
            obj.set_text("계약정보");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("st_custNm", "absolute", "280", "54", "130", "31", null, null, this);
            obj.set_taborder("10");
            obj.set_text("고객명");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_custNm", "absolute", "414", "59", "142", "21", null, null, this);
            obj.set_taborder("11");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "84", "1122", "31", null, null, this);
            obj.set_taborder("16");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_statNm", "absolute", "974", "89", "142", "21", null, null, this);
            obj.set_taborder("17");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_statNm", "absolute", "840", "84", "130", "31", null, null, this);
            obj.set_taborder("18");
            obj.set_text("계약상태");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_saleNm", "absolute", "694", "89", "142", "21", null, null, this);
            obj.set_taborder("19");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_saleNm", "absolute", "560", "84", "130", "31", null, null, this);
            obj.set_taborder("20");
            obj.set_text("계약유형");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_chanNm", "absolute", "414", "89", "142", "21", null, null, this);
            obj.set_taborder("21");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_chanNm", "absolute", "280", "84", "130", "31", null, null, this);
            obj.set_taborder("22");
            obj.set_text("채널구분");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_ordNm", "absolute", "134", "89", "142", "21", null, null, this);
            obj.set_taborder("23");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_ordNm", "absolute", "0", "84", "130", "31", null, null, this);
            obj.set_taborder("24");
            obj.set_text("주문구분");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static08", "absolute", "0", "114", "1122", "31", null, null, this);
            obj.set_taborder("25");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_cancDay", "absolute", "280", "114", "130", "31", null, null, this);
            obj.set_taborder("27");
            obj.set_text("취소일자");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("st_ordDay", "absolute", "0", "114", "130", "31", null, null, this);
            obj.set_taborder("33");
            obj.set_text("접수일자");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static13", "absolute", "0", "144", "1122", "31", null, null, this);
            obj.set_taborder("34");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static19", "absolute", "0", "144", "1122", "31", null, null, this);
            obj.set_taborder("43");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_psNm", "absolute", "694", "149", "142", "21", null, null, this);
            obj.set_taborder("46");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_psNm", "absolute", "560", "144", "130", "31", null, null, this);
            obj.set_taborder("47");
            obj.set_text("프리미엄서비스");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_mepYn", "absolute", "414", "149", "142", "21", null, null, this);
            obj.set_taborder("48");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_mepYn", "absolute", "280", "144", "130", "31", null, null, this);
            obj.set_taborder("49");
            obj.set_text("중도완납여부");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_osYn", "absolute", "134", "149", "142", "21", null, null, this);
            obj.set_taborder("50");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_osYn", "absolute", "0", "144", "130", "31", null, null, this);
            obj.set_taborder("51");
            obj.set_text("소유권이전여부");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("st_carInfo", "absolute", "0", "238", "80", "21", null, null, this);
            obj.set_taborder("61");
            obj.set_text("차량정보");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static31", "absolute", "0", "31", null, "7", "0", null, this);
            obj.set_taborder("62");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_border("0 none #808080,1 solid #d2020bff");
            this.addChild(obj.name, obj);

            obj = new Static("Static32", "absolute", "0", "235", null, "7", "0", null, this);
            obj.set_taborder("63");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_border("0 none #808080,1 solid #d2020bff");
            this.addChild(obj.name, obj);

            obj = new Static("Static33", "absolute", "0", "288", "1122", "31", null, null, this);
            obj.set_taborder("64");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_maMileage", "absolute", "560", "288", "130", "31", null, null, this);
            obj.set_taborder("68");
            obj.set_text("월 평균주행거리");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("st_cMileage", "absolute", "280", "288", "130", "31", null, null, this);
            obj.set_taborder("70");
            obj.set_text("현재주행거리");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_carOwner", "absolute", "134", "293", "142", "21", null, null, this);
            obj.set_taborder("71");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_carOwner", "absolute", "0", "288", "130", "31", null, null, this);
            obj.set_taborder("72");
            obj.set_text("차량소유자");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Tab("tab_info", "absolute", "0", "326", "1122", "170", null, null, this);
            obj.set_taborder("82");
            obj.set_tabindex("0");
            obj.set_scrollbars("autoboth");
            obj.style.set_showextrabutton("false");
            obj.set_visible("true");
            this.addChild(obj.name, obj);
            obj = new Tabpage("tab_info1_prdInfo", this.tab_info);
            obj.set_text("제품정보");
            obj.set_url("sd::RTSDContractStatus_tab_info10_prdInfo.xfdl");
            obj.set_scrollbars("autoboth");
            this.tab_info.addChild(obj.name, obj);
            obj = new Tabpage("tab_info1_etcPrdInfo", this.tab_info);
            obj.set_text("부가제품정보");
            obj.set_url("sd::RTSDContractStatus_tab_info11_etcPrdInfo.xfdl");
            this.tab_info.addChild(obj.name, obj);
            obj = new Tabpage("tab_info1_install", this.tab_info);
            obj.set_text("설치정보");
            obj.set_url("sd::RTSDContractStatus_tab_info1_install.xfdl");
            this.tab_info.addChild(obj.name, obj);
            obj = new Tabpage("tab_info2_pay", this.tab_info);
            obj.set_text("결제정보");
            obj.set_url("sd::RTSDContractStatus_tab_info2_pay.xfdl");
            this.tab_info.addChild(obj.name, obj);
            obj = new Tabpage("tab_info3_discount", this.tab_info);
            obj.set_text("할인정보");
            obj.set_url("sd::RTSDContractStatus_tab_info3_discount.xfdl");
            this.tab_info.addChild(obj.name, obj);
            obj = new Tabpage("tab_info4_agree", this.tab_info);
            obj.set_text("동의,인증");
            obj.set_url("sd::RTSDContractStatus_tab_info4_agree.xfdl");
            this.tab_info.addChild(obj.name, obj);
            obj = new Tabpage("tab_info5_preminumService", this.tab_info);
            obj.set_text("프리미엄서비스");
            obj.set_url("sd::RTSDContractStatus_tab_info5_preminumService.xfdl");
            this.tab_info.addChild(obj.name, obj);
            obj = new Tabpage("tab_info8_history", this.tab_info);
            obj.set_text("서비스이력");
            obj.set_url("sd::RTSDContractStatus_tab_info8_history.xfdl");
            this.tab_info.addChild(obj.name, obj);
            obj = new Tabpage("tab_info6_seller", this.tab_info);
            obj.set_text("판매인정보");
            obj.set_url("sd::RTSDContractStatus_tab_info6_seller.xfdl");
            this.tab_info.addChild(obj.name, obj);
            obj = new Tabpage("tab_info7_advice", this.tab_info);
            obj.set_text("상담내역");
            obj.set_url("sd::RTSDContractStatus_tab_info7_advice.xfdl");
            this.tab_info.addChild(obj.name, obj);
            obj = new Tabpage("tab_info9_eleSig", this.tab_info);
            obj.set_text("전자서명");
            obj.set_url("sd::RTSDContractStatus_tab_info9_EleSig.xfdl");
            this.tab_info.addChild(obj.name, obj);

            obj = new Static("Static83", "absolute", "1122", "0", "25", null, null, "0", this);
            obj.set_taborder("83");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static45", "absolute", "0", "319", null, "7", "0", null, this);
            obj.set_taborder("84");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_border("0 none #808080,1 solid #d2020bff");
            this.addChild(obj.name, obj);

            obj = new Static("Static25", "absolute", "0", "258", "1122", "31", null, null, this);
            obj.set_taborder("86");
            obj.set_cssclass("sta_WF_detailLabel2");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("st_makerNm", "absolute", "0", "258", "130", "31", null, null, this);
            obj.set_taborder("97");
            obj.set_text("카메이커");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_makerNm", "absolute", "134", "263", "142", "21", null, null, this);
            obj.set_taborder("98");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_mcNm", "absolute", "280", "258", "130", "31", null, null, this);
            obj.set_taborder("99");
            obj.set_text("차종");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_mcNm", "absolute", "414", "263", "142", "21", null, null, this);
            obj.set_taborder("100");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_carNo", "absolute", "560", "258", "130", "31", null, null, this);
            obj.set_taborder("101");
            obj.set_text("차량번호");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_carNo", "absolute", "694", "263", "142", "21", null, null, this);
            obj.set_taborder("102");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Calendar("cal_cancDay", "absolute", "414", "119", "142", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("105");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_enable("true");
            obj.set_value("null");
            obj.set_readonly("true");

            obj = new Calendar("cla_ordDay", "absolute", "134", "119", "142", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("106");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_enable("true");
            obj.set_value("null");
            obj.set_type("normal");
            obj.set_readonly("true");

            obj = new MaskEdit("ed_cMileage", "absolute", "414", "293", "110", "21", null, null, this);
            obj.set_taborder("107");
            obj.set_readonly("true");
            obj.set_mask("###,###,###,##0");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("ed_maMileage", "absolute", "694", "293", "110", "21", null, null, this);
            obj.set_taborder("108");
            obj.set_readonly("true");
            obj.set_mask("###,###,###,##0");
            this.addChild(obj.name, obj);

            obj = new Static("st_cMileage2", "absolute", "530", "293", "25", "21", null, null, this);
            obj.set_taborder("109");
            obj.set_text("Km");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("st_cMileage00", "absolute", "810", "293", "25", "21", null, null, this);
            obj.set_taborder("110");
            obj.set_text("Km");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("cust_birth_title", "absolute", "560", "54", "130", "31", null, null, this);
            obj.set_taborder("111");
            obj.set_text("법정생년월일");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("cust_tel_title", "absolute", "840", "54", "130", "31", null, null, this);
            obj.set_taborder("112");
            obj.set_text("전화번호");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("cust_birthDay", "absolute", "694", "59", "142", "21", null, null, this);
            obj.set_taborder("113");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Edit("cust_telNo", "absolute", "974", "59", "142", "21", null, null, this);
            obj.set_taborder("114");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_vbeln", "absolute", "974", "149", "79", "21", null, null, this);
            obj.set_taborder("115");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_vbeln", "absolute", "840", "144", "130", "31", null, null, this);
            obj.set_taborder("116");
            obj.set_text("배송오더");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Button("btn_ordCancel", "absolute", "1056", "149", "60", "21", null, null, this);
            obj.set_taborder("117");
            obj.set_text("주문취소");
            obj.getSetter("domainId").set("nexa.save");
            obj.set_enable("true");
            this.addChild(obj.name, obj);

            obj = new Button("btn_carInfoUpdate", "absolute", "1036", "294", "80", "21", null, null, this);
            obj.set_taborder("120");
            obj.set_text("차량정보변경");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Button("btn_ordDel", "absolute", "351", "5", "89", "21", null, null, this);
            obj.set_taborder("121");
            obj.set_text("장착계약삭제");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "174", "1122", "31", null, null, this);
            obj.set_taborder("122");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_rerentDay", "absolute", "0", "174", "130", "31", null, null, this);
            obj.set_taborder("123");
            obj.set_text("재렌탈가능일자");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Calendar("cla_rerentDayF", "absolute", "134", "179", "142", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("124");
            obj.set_readonly("true");
            obj.set_dateformat("yyyy-MM-dd");

            obj = new Calendar("cla_rerentDayT", "absolute", "293", "179", "142", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("125");
            obj.set_readonly("true");
            obj.set_dateformat("yyyy-MM-dd");

            obj = new Static("st_provsnNo", "absolute", "560", "174", "130", "31", null, null, this);
            obj.set_taborder("126");
            obj.set_text("가계약번호");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_provsnNo", "absolute", "694", "179", "142", "21", null, null, this);
            obj.set_taborder("127");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "280", "178", "9", "21", null, null, this);
            obj.set_taborder("128");
            obj.set_text("~");
            this.addChild(obj.name, obj);

            obj = new Static("st_psNm00", "absolute", "560", "114", "130", "31", null, null, this);
            obj.set_taborder("129");
            obj.set_text("판매상품명");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("st_psNm01", "absolute", "840", "114", "130", "31", null, null, this);
            obj.set_taborder("130");
            obj.set_text("판매상품 할인율/원");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_saleCdNm", "absolute", "694", "119", "142", "21", null, null, this);
            obj.set_taborder("131");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_saleCdDc", "absolute", "974", "118", "142", "21", null, null, this);
            obj.set_taborder("132");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_vbeln00", "absolute", "840", "174", "130", "31", null, null, this);
            obj.set_taborder("133");
            obj.set_text("취소사유");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Combo("cb_cancCd", "absolute", "85%", "179", null, "20", "2.88%", null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("134");
            obj.set_innerdataset("@ds_S308");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");

            obj = new Static("Static02", "absolute", "0", "204", "1122", "31", null, null, this);
            obj.set_taborder("135");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_rerentDay00", "absolute", "0", "204", "130", "31", null, null, this);
            obj.set_taborder("136");
            obj.set_text("도착문자발송일");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Calendar("cla_arrivalDay", "absolute", "134", "209", "142", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("137");
            obj.set_readonly("true");
            obj.set_dateformat("yyyy-MM-dd");

            obj = new Static("st_rerentDay01", "absolute", "280", "204", "130", "31", null, null, this);
            obj.set_taborder("138");
            obj.set_text("채권매각일자");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Calendar("cal_bondSelDay", "absolute", "414", "210", "142", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("139");
            obj.set_readonly("true");
            obj.set_dateformat("yyyy-MM-dd");

            obj = new Button("btn_deliveryPop", "absolute", "1036", "210", "80", "21", null, null, this);
            obj.set_taborder("140");
            obj.set_text("배송현황조회");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Button("btn_order_01", "absolute", "656", "210", "75", "21", null, null, this);
            obj.set_taborder("141");
            obj.set_text("지정일출고");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Button("btn_order_02", "absolute", "888", "210", "60", "21", null, null, this);
            obj.set_taborder("142");
            obj.set_text("퀵(긴급)");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Button("btn_order_03", "absolute", "952", "210", "60", "21", null, null, this);
            obj.set_taborder("143");
            obj.set_text("익일도착");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Calendar("cal_setGiDay", "absolute", "734", "210", "142", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("144");
            obj.set_readonly("false");
            obj.set_dateformat("yyyy-MM-dd");

            obj = new Static("psTitle", "absolute", "52.31%", "8", null, "17", "42.2%", null, this);
            obj.set_taborder("158");
            obj.set_text("수납상태 :");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_paidState", "absolute", "57.45%", "6", "85", "20", null, null, this);
            obj.set_taborder("159");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("ocTitle", "absolute", "66.87%", "9", null, "17", "26.24%", null, this);
            obj.set_taborder("160");
            obj.set_text("현재계약건수 :");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_ordCount", "absolute", "73.93%", "7", "80", "20", null, null, this);
            obj.set_taborder("161");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("rvTitle", "absolute", "82.82%", "9", null, "17", "9.68%", null, this);
            obj.set_taborder("162");
            obj.set_text("기타제한사유 :");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_roVan", "absolute", "89.97%", "8", "85", "20", null, null, this);
            obj.set_taborder("163");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_addrText", "absolute", "48.82%", "238", "562", "20", null, null, this);
            obj.set_taborder("164");
            obj.set_readonly("true");
            obj.style.set_border("0 solid #808080");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1147, 538, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("contractStatus");
            		p.set_titletext("계약현황조회(본사용)");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item0","ed_custNo","value","ds_contractStatus","custNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item1","ed_custNm","value","ds_contractStatus","custNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item2","ed_ordNm","value","ds_contractStatus","ordNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item3","ed_chanNm","value","ds_contractStatus","chanNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item4","ed_saleNm","value","ds_contractStatus","saleNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item5","ed_statNm","value","ds_contractStatus","statNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item6","cla_ordDay","value","ds_contractStatus","ordDay");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item7","ed_saleCdNm","value","ds_contractStatus","saleCdNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item8","ed_saleCdDc","value","ds_contractStatus","saleCdDc");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item9","cal_cancDay","value","ds_contractStatus","cancDay");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item10","cb_cancCd","value","ds_contractStatus","cancCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item11","cla_arrivalDay","value","ds_contractStatus","firstDay");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item12","cal_bondSelDay","value","ds_contractStatus","bondSelDay");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item14","ed_osYn","value","ds_contractStatus","osYn");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item15","ed_mepYn","value","ds_contractStatus","mfpYn");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item16","ed_psNm","value","ds_contractStatus","psNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item17","ed_makerNm","value","ds_contractStatus","makerNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item18","ed_mcNm","value","ds_contractStatus","mcNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item19","ed_carNo","value","ds_contractStatus","carNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item20","ed_carOwner","value","ds_contractStatus","carOwner");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item21","ed_cMileage","value","ds_contractStatus","cMileage");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item22","ed_maMileage","value","ds_contractStatus","maMileage");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item23","cust_birthDay","value","ds_contractStatus","birthDay");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item24","cust_telNo","value","ds_contractStatus","mobNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item25","ed_vbeln","value","ds_contractStatus","vbeln");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item27","cla_rerentDayF","value","ds_contractStatus","rerentDayF");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item28","cla_rerentDayT","value","ds_contractStatus","rerentDayT");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item29","ed_provsnNo","value","ds_contractStatus","provsnNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item30","ed_paidState","value","ds_contractStatus","paidState");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item31","ed_ordCount","value","ds_contractStatus","ordCount");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item32","ed_roVan","value","ds_contractStatus","roVan");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item13","ed_addrText","value","ds_contractStatus","addrText");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        
        this.loadPreloadList = function()
        {
            this._addPreloadList("fdl", "sd::RTSDContractStatus_tab_info10_prdInfo.xfdl");
            this._addPreloadList("fdl", "sd::RTSDContractStatus_tab_info11_etcPrdInfo.xfdl");
            this._addPreloadList("fdl", "sd::RTSDContractStatus_tab_info1_install.xfdl");
            this._addPreloadList("fdl", "sd::RTSDContractStatus_tab_info2_pay.xfdl");
            this._addPreloadList("fdl", "sd::RTSDContractStatus_tab_info3_discount.xfdl");
            this._addPreloadList("fdl", "sd::RTSDContractStatus_tab_info4_agree.xfdl");
            this._addPreloadList("fdl", "sd::RTSDContractStatus_tab_info5_preminumService.xfdl");
            this._addPreloadList("fdl", "sd::RTSDContractStatus_tab_info8_history.xfdl");
            this._addPreloadList("fdl", "sd::RTSDContractStatus_tab_info6_seller.xfdl");
            this._addPreloadList("fdl", "sd::RTSDContractStatus_tab_info7_advice.xfdl");
            this._addPreloadList("fdl", "sd::RTSDContractStatus_tab_info9_EleSig.xfdl");
        };
        
        // User Script
        this.addIncludeScript("RTSDContractStatus.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDContractStatus.xfdl", function() {
        /***************************************************************************************************
         * 파 일 명 : RTSDContractStatus.xfdl
         * 설    명 : 주문현황조회
         * 작 성 자 : 
         * 변경이력 
         * ---------------------------------
         * 변경일자		변경자		변경내용
         * ---------------------------------
         * ...
         * 2017-10-30	wjim		[20171027_02] 가계약번호, 재렌탈가능일자 추가
         * 2018-01-19	wjim		[20180119_01] 전자서명탭 기존 조회 계약분 오조회 보완
         * 2019-02-20	wjim		[20190220_03] 주문취소 가능ID 추가
         ***************************************************************************************************/

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //include "lib::comLib.xjs";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.userGrp 	 = application.gds_userInfo.getColumn(0,"userGrp");//사용자 그룹 		--> *01:영업관리자     *02:콜센터     *03:지사     *04:지점     *05:대리점
        this.userId      = application.gds_userInfo.getColumn(0,"userId");
        this.p_arg 		 = "RTSDContractRegister";
        this.returnOrdNo = "";
        this.toDay = "";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg){

        	if (strSvcId == "listStatus"){
        		this.FN_tabDataSetClear();
        		var ct = this.ds_contractStatus.getRowCount();
        		if( ct != 0){
        			this.FN_initTab( 0 );
        			//var chanCd = this.ds_contractStatus.getColumn(0,"chanCd");
        			//var statCd = this.ds_contractStatus.getColumn(0,"statCd");//S032
        			//01 : 영업관리자//02 : 콜센터//03 : 지사//04 : 지점	//05 : 대리점
        			//var userGrp = application.gds_userInfo.getColumn(0, "userGrp");
        			//if( ( chanCd == "01" || chanCd == "05" ) &&( statCd == "01" || statCd == "03" ) && ( userGrp == "01" || userGrp == "02" )){
        			//	this.btn_ordCancel.set_enable(true);
        			//}else{
        			//	this.btn_ordCancel.set_enable(false);
        			//}

        
        			this.btn_ordCancel.set_enable(false);
        			var auth = this.getControlAuthCheck("btn_ordCancel", this.userGrp, "");
        			if( auth == "Y" ){
        				this.btn_carInfoUpdate.set_enable(true);
        				//[20221021_1] kstka 주문취소권한 콜센터에 부여
        				this.btn_ordCancel.set_enable(true);
        				
        				//2018.06.29 주문취소 버튼은 박정석 과장 / 김영작 사원만 권한 부여 - 박정석 과장
        				// [20190220_03] 임욱재 차장 추가
        				// [20220104_01] 신규직원 강소은, 류승휘사원 추가
        // 				if(this.userGrp == "01" && (this.userId == "10083012" || this.userId == "10164030" || this.userId == "kstka" || this.userId == "wjim" || this.userId == "10216011" || this.userId == " 10221001")){ 
        // 					this.btn_ordCancel.set_enable(true);
        // 				}
        			}else{
        				this.btn_carInfoUpdate.set_enable(false);
        			}
        			
        			//2019.05.15 채권매각 대상의 경우 - 중도완납 flag를 C로 설정
        			if(this.ds_contractStatus.getColumn(0, "mfpYn") == "C"){
        				this.ed_mepYn.set_value("채권매각");
        			}
        			
        			//20191217 OMS 데이터셋 초기화
        			this.ds_rtsd0213.clearData();
        			this.ds_rtsd0213.addRow();			
        			
        		}else{
        			this.FN_initTab( 0 );
        			alert("존재하지 않는 계약번호입니다.\n확인 후 재작업 바랍니다.");
        		}
        	}
        	
        	if (strSvcId == "listPrdInfo"){
        		this.ds_prdInfoCp.setColumn(0,"ordNo",this.ds_contractStatus.getColumn(0,"ordNo"));
        		this.tab_info.tab_info1_prdInfo.ds_prdInfo.copyData(this.ds_prdInfoCp);		
        	}
        	
        	if (strSvcId == "listEtcPrdInfo"){
        		this.ds_prdInfoCp.setColumn(0,"ordNo",this.ds_contractStatus.getColumn(0,"ordNo"));
        		this.tab_info.tab_info1_etcPrdInfo.ds_etcPrdInfo.copyData(this.ds_etcPrdInfoCp);
        	}
        	
        	if (strSvcId == "listInstall"){
        		this.ds_installCp.setColumn(0,"ordNo",this.ds_contractStatus.getColumn(0,"ordNo"));
        		this.tab_info.tab_info1_install.ds_install.copyData(this.ds_installCp);
        	}
        	
        	if (strSvcId == "listPay"){
        		this.tab_info.tab_info2_pay.ds_pay.copyData(this.ds_payCp);
        	}
        	
        	/*if(strSvcId == "listDiscount"){
        		this.tab_info.tab_info3_discount.ds_discount.copyData(this.ds_discountCp);
        		this.tab_info.tab_info3_discount.ed_regiAmt.set_style("color:black;");
        		this.tab_info.tab_info3_discount.ed_monAmt.set_style("color:black;");
        		this.tab_info.tab_info3_discount.ed_rentAmt.set_style("color:black;");
        		this.tab_info.tab_info3_discount.ed_monDcamt.set_style("color:black;");
        		this.tab_info.tab_info3_discount.ed_cDcamt.set_style("color:black;");
        		this.tab_info.tab_info3_discount.ed_gDcrate.set_style("color:black;");
        		this.tab_info.tab_info3_discount.ed_gDcamt.set_style("color:black;");
        		this.tab_info.tab_info3_discount.ed_lDcrate.set_style("color:black;");
        		this.tab_info.tab_info3_discount.ed_lDcamt.set_style("color:black;");
        		this.tab_info.tab_info3_discount.ed_fDcamt.set_style("color:black;");
        	}*/
        	
        	if(strSvcId == "listAgree"){
        		this.tab_info.tab_info4_agree.ds_agree.copyData(this.ds_agreeCp);
        	}
        	
        	if(strSvcId == "listPreminum"){
        		this.tab_info.tab_info5_preminumService.ds_preminum.copyData(this.ds_preminumCp);
        		/*
        		if(this.userGrp == "01"){ //영업관리자만 사용가능
        			this.tab_info.tab_info5_preminumService.FN_createRestoreButton(); //복원 버튼 생성
        		}
        		*/
        		// 사용자그룹에 따라 버튼 동적 생성
        		this.tab_info.tab_info5_preminumService.FN_createRestoreButton(this.userGrp);
        	}
        	
        	if(strSvcId == "listSeller"){
        		this.tab_info.tab_info6_seller.ds_seller.copyData(this.ds_sellerCp);
        	}
        	
        	if(strSvcId == "listAdvice"){
        		this.tab_info.tab_info7_advice.ds_advice.copyData(this.ds_adviceCp);
        	}
        	
        	if(strSvcId == "serviceHistory"){
        		this.tab_info.tab_info8_history.ds_history.copyData(this.ds_historyCp);
        	}
        	
        	if(strSvcId == "listEleSig"){
        		var ordNo = nvl(this.ds_contractStatus.getColumn(0,"ordNo"));
        		var cnt   = this.ds_eleSigCP.getRowCount();
        		
        		if( (ordNo != "") && (cnt != 0) ){
        			for( var i = 0 ; i < this.ds_eleSigCP.getRowCount() ; i++ ){
        				this.ds_eleSigCP.setColumn(i, "ordNo", ordNo);
        			} 
        			this.tab_info.tab_info9_eleSig.ds_eleSig.copyData(this.ds_eleSigCP);
        		}
        		
        		//계약서정보조회를 위한 dataset copy
        		this.tab_info.tab_info9_eleSig.ds_contractStatusCp.copyData(this.ds_contractStatus);
        		
        		var authYn = this.getControlAuthCheck("btn_format", this.userGrp, "");
        		if(authYn == "Y"){
        			this.tab_info.tab_info9_eleSig.btn_format.set_visible(true);
        		}else{
        			this.tab_info.tab_info9_eleSig.btn_format.set_visible(false);
        		}
        		
        		authYn = this.getControlAuthCheck("btn_kakao", this.userGrp, "");
        		if(authYn == "Y"){
        			this.tab_info.tab_info9_eleSig.btn_kakao.set_visible(true);
        		}else{
        			this.tab_info.tab_info9_eleSig.btn_kakao.set_visible(false);
        		}
        		
        		authYn = this.getControlAuthCheck("btn_mail", this.userGrp, "");
        		if(authYn == "Y"){
        			this.tab_info.tab_info9_eleSig.btn_mail.set_visible(true);
        		}else{
        			this.tab_info.tab_info9_eleSig.btn_mail.set_visible(false);
        		}
        		
        		authYn = this.getControlAuthCheck("btn_history", this.userGrp, "");
        		if(authYn == "Y"){
        			this.tab_info.tab_info9_eleSig.btn_history.set_visible(true);
        		}else{
        			this.tab_info.tab_info9_eleSig.btn_history.set_visible(false);
        		}
        		
        		
        		//2019.05.27 고객만족팀에 권한 부여
        // 		if( this.userGrp == "01" || this.userGrp == "12" ){
        //  			this.tab_info.tab_info9_eleSig.btn_format.set_visible(true);
        //  			this.tab_info.tab_info9_eleSig.btn_mail.set_visible(true);
        //  			this.tab_info.tab_info9_eleSig.btn_history.set_visible(true);
        // 
        // 			//20170712 - 행자부 개인정보보호 수검을 위해 임시 blocking
        // 			//this.tab_info.tab_info9_eleSig.btn_format.set_visible(false);
        // 			//this.tab_info.tab_info9_eleSig.btn_mail.set_visible(false);
        // 			//this.tab_info.tab_info9_eleSig.btn_history.set_visible(false);
        // 		//[20191015_01] 콜센터에 서식조회 권한 부여
        // 		}else if( this.userGrp == "02" ){
        //  			this.tab_info.tab_info9_eleSig.btn_format.set_visible(true);
        //  			this.tab_info.tab_info9_eleSig.btn_mail.set_visible(true);
        // 		}else{
        // 			this.tab_info.tab_info9_eleSig.btn_format.set_visible(false);
        // 			this.tab_info.tab_info9_eleSig.btn_mail.set_visible(false);
        // 			this.tab_info.tab_info9_eleSig.btn_history.set_visible(false);
        // 		}
        		
        	}
        	
        	if(strSvcId == "saveOrdCancel"){
        		if( nErrorCode == "0" ){
        			alert(strErrorMsg);	
        			this.fn_sapOrderCancel();
        		}else{
        			alert(strErrorMsg);
        			this.returnOrdNo = "";
        		}
        	}
        	
        	if(strSvcId == "sapOrderCancel"){
        		if( nErrorCode == "0" ){
        			alert(strErrorMsg);
        			this.FN_listStatus(nvl(this.ds_contractStatus.getColumn(0,"ordNo")));
        		}else{
        			alert(strErrorMsg);
        			this.returnOrdNo = "";
        		}
        	}
        	
        	if(strSvcId == "saveOrdDelete"){
        		if( nErrorCode == "0" ){
        			this.returnOrderNoInfo(nvl(this.ed_ordNo.value));
        		}else{
        			alert(strErrorMsg);
        		}
        	}
        	
        	if(strSvcId == "listControlAuth"){
        		
        		var authYn = this.getControlAuthCheck("btn_ordDel", "", this.userId);
        		if(authYn == "Y"){
        			this.btn_ordDel.set_enable(true);
        		}else{
        			this.btn_ordDel.set_enable(false);
        		}
        	}
        	
        	if(strSvcId == "initRTSDContractStatus"){
        		this.fn_getToday();
        	}
        	
        	if(strSvcId == "sapOrderCreate"){
        		if(nErrorCode < 0){
        			alert(strErrorMsg);
        			return;
        		} else {
        			alert("주문생성이 완료되었습니다.");
        		}
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.RTSDContractStatus_onload = function(obj,e){
        	Ex.core.init(obj);
        	this.parent.setButton("", this);
        	this.tab_info.removeTabpage(4);
        	this.tab_info.removeTabpage(8);

        	this.fn_init();
        	this.listControlAuth("SD", "RTSDContractStatus");
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_init = function(){
        		
        	var sSvcID      	= "initRTSDContractStatus";  
        	var sController   	= "rtms/sd/initRTSDContractStatus.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	sOutDatasets += " ds_S308=mapDsS308 ";
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //-------------------------------------------------------------------------------
        //당월 조회
        //-------------------------------------------------------------------------------
        this.fn_getToday  = function() {
        	var sSvcID      	= "getToday";  
        	var sController   	= "rtms/comm/getToday.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.btn_orderNo_onclick = function(obj,e){
        	var args ={ p_arg : this.p_arg };
        	Ex.core.popup(this,"계약번호 조회","comm::RTCOMMOrderNo_pop.xfdl",args, "modaless=false");
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.returnOrderNoInfo = function(ordNo,birthDay,telNo){
        	if( nvl(ordNo) == "" ){
        		alert("계약번호찾기를 확인 하세요.");
        	}else{
        		this.ed_ordNo.set_value(ordNo);
        		this.FN_listStatus(ordNo);
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.ed_ordNo_onkeyup = function(obj,e){
        	if(e.keycode == 13 ){	
        		var ordNo = nvl(this.ed_ordNo.value);
        			if( ordNo == "" ){
        			alert("계약번호를 입력하세요.");
        			return;
        		}else{
        			this.returnOrderNoInfo(ordNo);
        		}	
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.FN_listStatus = function(ordNo){
        	var sSvcID        	= "listStatus";                    
        	var sController   	= "rtms/sd/listStatus.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_contractStatus=mapStatus";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	this.ds_contractStatus.clearData();
        	this.FN_tabDataSetClear();
        	
        	sArgs += Ex.util.setParam("ordNo", 	ordNo);
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.tab_info_onchanged = function(obj,e){
        	this.FN_tabDataSetClear();
        	this.FN_initTab( e.postindex );
        }

        /*
         * 하단 탭 기존 조회정보 초기화
         *
         * 변경이력 
         * ---------------------------------
         * 변경일자		변경자		변경내용
         * ---------------------------------
         * 2018-01-19	wjim		[20180119_01] 전자서명탭 기존 조회 계약분 오조회 보완
         */
        this.FN_tabDataSetClear = function(){
        	this.ds_installCp.clearData();
        	this.ds_payCp.clearData();
        	this.ds_discountCp.clearData();
        	this.ds_agreeCp.clearData();
        	this.ds_preminumCp.clearData();
        	this.ds_sellerCp.clearData();
        	this.ds_adviceCp.clearData();
        	this.ds_eleSigCP.clearData();	// 전자서명 [20180119_01]에 의해 추가
        	this.ds_prdInfoCp.clearData();
        	this.ds_etcPrdInfoCp.clearData();	
        	
        	this.tab_info.tab_info1_prdInfo.ds_prdInfo.clearData();
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.FN_initTab = function(postindex){
        	var ordNo = nvl(this.ds_contractStatus.getColumn(0,"ordNo"));
        	if( ordNo != "" ){
        		this.FN_tabDataSetClear();
        		
        		if( postindex == 0 ){//제품정보
        	//this.alert("ordNo : " + ordNo + "\n " + "modelCd : " + modelCd + "\n " + "saleCd : " + saleCd );
        			this.tab_info.set_tabindex(0);
        			var sSvcID        	= "listPrdInfo";                    
        			var sController   	= "/rtms/sd/listPrdInfo.do";
        			var sInDatasets   	= "";
        			var sOutDatasets  	= "ds_prdInfoCp=listPrdInfo";
        			var sArgs 			= "";	
        			var fn_callBack		= "fn_callBack";
        			sArgs += Ex.util.setParam("ordNo", ordNo);
        			Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        		
        		}else if( postindex == 1 ){//부가제품정보
        	//this.alert("ordNo : " + ordNo );		
        			var sSvcID        	= "listEtcPrdInfo";                    
        			var sController   	= "rtms/sd/listProductInfoSch.do";
        			var sInDatasets   	= "";
        			var sOutDatasets  	= "ds_etcPrdInfoCp=listProductInfoSch";
        			var sArgs 			= "";	
        			var fn_callBack		= "fn_callBack";
        			sArgs += Ex.util.setParam("ordNo", 	ordNo);
        			Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        		
        		}else if( postindex == 2 ){//설치정보
        		
        			var sSvcID        	= "listInstall";                    
        			var sController   	= "rtms/sd/listInstall.do";
        			var sInDatasets   	= "";
        			var sOutDatasets  	= "ds_installCp=mapInstall";
        			var sArgs 			= "";	
        			var fn_callBack		= "fn_callBack";
        			sArgs += Ex.util.setParam("ordNo", 	ordNo);
        			Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        				
        		}else if( postindex == 3 ){//결제정보
        		
        			var sSvcID        	= "listPay";                    
        			var sController   	= "rtms/sd/listPay.do";
        			var sInDatasets   	= "";
        			var sOutDatasets  	= "ds_payCp=mapPay";
        			var sArgs 			= "";	
        			var fn_callBack		= "fn_callBack";
        			sArgs += Ex.util.setParam("ordNo", 	ordNo);
        			Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        			
        		/*}else if( postindex == 4 ){//할인정보
        		
        			var sSvcID        	= "listDiscount";                    
        			var sController   	= "rtms/sd/listDiscount.do";
        			var sInDatasets   	= "";
        			var sOutDatasets  	= "ds_discountCp=mapDiscount";
        			var sArgs 			= "";	
        			var fn_callBack		= "fn_callBack";
        			sArgs += Ex.util.setParam("ordNo", 	ordNo);
        			Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        		*/	
        		}else if( postindex == 4 ){//동의,인증
        		
        			var sSvcID        	= "listAgree";                    
        			var sController   	= "rtms/sd/listAgree.do";
        			var sInDatasets   	= "";
        			var sOutDatasets  	= "ds_agreeCp=mapAgree";
        			var sArgs 			= "";	
        			var fn_callBack		= "fn_callBack";
        			sArgs += Ex.util.setParam("ordNo", 	ordNo);
        			Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        			
        		}else if( postindex == 5 ){//프리미엄서비스
        		
        			var sSvcID        	= "listPreminum";                    
        			var sController   	= "rtms/sd/listPreminum.do";
        			var sInDatasets   	= "";
        			var sOutDatasets  	= "ds_preminumCp=mapPreminum";
        			var sArgs 			= "";	
        			var fn_callBack		= "fn_callBack";
        			sArgs += Ex.util.setParam("ordNo", 	ordNo);
        			Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        			
        		}else if( postindex == 6 ){//서비스이력
        			var sSvcID        	= "serviceHistory";                    
        			var sController   	= "rtms/cs/serviceHistory.do";
        			var sInDatasets   	= "";
        			var sOutDatasets  	= "ds_historyCp=mapHistory";
        			var sArgs 			= "";	
        			var fn_callBack		= "fn_callBack";
        			sArgs += Ex.util.setParam("ordNo", 	ordNo);
        			Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        			
        		}else if( postindex == 7 ){//판매인정보
        			var sSvcID        	= "listSeller";                    
        			var sController   	= "rtms/sd/listSeller.do";
        			var sInDatasets   	= "";
        			var sOutDatasets  	= "ds_sellerCp=mapSeller";
        			var sArgs 			= "";	
        			var fn_callBack		= "fn_callBack";
        			sArgs += Ex.util.setParam("ordNo", 	ordNo);
        			Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        			
        		/*}else if( postindex == 8 ){//상담내역
        			var sSvcID        	= "listAdvice";                    
        			var sController   	= "rtms/sd/listAdvice.do";
        			var sInDatasets   	= "";
        			var sOutDatasets  	= "ds_adviceCp=mapAdvice";
        			var sArgs 			= "";	
        			var fn_callBack		= "fn_callBack";
        			sArgs += Ex.util.setParam("ordNo", 	ordNo);
        			Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        		*/
        		}else if( postindex == 8 ){//전자서명
        			var sSvcID        	= "listEleSig";                    
        			var sController   	= "rtms/sd/listEleSig.do";
        			var sInDatasets   	= "";
        			var sOutDatasets  	= "ds_eleSigCP=mapEleSig";
        			var sArgs 			= "";	
        			var fn_callBack		= "fn_callBack";
        			sArgs += Ex.util.setParam("ordNo", 	ordNo);
        			Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        		}
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.btn_ordCancel_onclick = function(obj,e){
        	var ordNo = nvl(this.ds_contractStatus.getColumn(0,"ordNo"));
        	var cancCd = nvl(this.cb_cancCd.value);
        	this.ds_saveOrdCancel.clearData();
        	var nRow = this.ds_saveOrdCancel.addRow();
        	this.ds_saveOrdCancel.setColumn(nRow,"ordNo", ordNo);
        	this.ds_saveOrdCancel.setColumn(nRow,"cancCd", cancCd);
        	
        	if(cancCd == ""){
        		this.alert("취소사유가 등록되지 않았습니다.");
        		return;
        	}
        	
        	//20191205 kstka 거점장착정보
        	//===========================================================================================
        	var nRowOms = this.ds_rtsd0213.rowposition;
        	
        	this.ds_rtsd0213.setColumn(nRowOms, "rentIfCntrNo", nvl(ordNo));
        	this.ds_rtsd0213.setColumn(nRowOms, "saleTyCd", "1102");
        	this.ds_rtsd0213.setColumn(nRowOms, "rentIfReqSn", "1");
        	this.ds_rtsd0213.setColumn(nRowOms, "rentIfBfistSeCd", "04");

        	this.ds_rtsd0213.setColumn(nRowOms, "sendURL", "/rentalapi/sd/rentalOpertResultTMS.do");
        	this.ds_rtsd0213.setColumn(nRowOms, "opertSts", "70");
        	this.ds_rtsd0213.setColumn(nRowOms, "opertDe", nvl(this.ds_contractStatus.getColumn(this.ds_contractStatus.rowposition, "today")));
        	this.ds_rtsd0213.setColumn(nRowOms, "drgMil", "");
        	this.ds_rtsd0213.setColumn(nRowOms, "regUsrId", "rentalusr");

        	this.ds_rtsd0213.setColumn(nRowOms, "ordDe", nvl(this.ds_contractStatus.getColumn(this.ds_contractStatus.rowposition, "ordDay")));
        	this.ds_rtsd0213.setColumn(nRowOms, "custNm", encodeURI(nvl(this.ds_contractStatus.getColumn(this.ds_contractStatus.rowposition, "custNm"))));
        	this.ds_rtsd0213.setColumn(nRowOms, "carNo", encodeURI(nvl(this.ds_contractStatus.getColumn(this.ds_contractStatus.rowposition, "carNo"))));
        	this.ds_rtsd0213.setColumn(nRowOms, "iplMobNo", nvl(this.ds_contractStatus.getColumn(this.ds_contractStatus.rowposition, "mobNo")));
        	this.ds_rtsd0213.setColumn(nRowOms, "iplTelNo", "");

        	var agencyCd = nvl(this.ds_contractStatus.getColumn(this.ds_contractStatus.rowposition, "agencyCd"));
        	var _agencyCd = "";
        	var str = "";
        	for(var i=0; i<10-agencyCd.length; i++){
        		str += "0";
        	}
        	_agencyCd = str + agencyCd;
        	
        	var posCd = nvl(this.ds_contractStatus.getColumn(this.ds_contractStatus.rowposition, "posCd"));
        	var city = nvl(this.ds_contractStatus.getColumn(this.ds_contractStatus.rowposition, "city"));
        	var street = nvl(this.ds_contractStatus.getColumn(this.ds_contractStatus.rowposition, "street"));
        	
        	if(posCd == ""){
        		this.alert("대리점 정보에 우편번호가 존재하지 않습니다.");
        		return;
        	}

        	this.ds_rtsd0213.setColumn(nRowOms, "istBpCd", _agencyCd);
        	this.ds_rtsd0213.setColumn(nRowOms, "itemCd", "");
        	this.ds_rtsd0213.setColumn(nRowOms, "ordQy", nvl(this.ds_contractStatus.getColumn(this.ds_contractStatus.rowposition, "cntCd")));
        	this.ds_rtsd0213.setColumn(nRowOms, "dlvTyDtlCd", "");
        	this.ds_rtsd0213.setColumn(nRowOms, "istReqDe", nvl(this.ds_contractStatus.getColumn(this.ds_contractStatus.rowposition, "procDay")));
        	this.ds_rtsd0213.setColumn(nRowOms, "pickupZip", "");
        	this.ds_rtsd0213.setColumn(nRowOms, "pickupBassAddr", "");
        	this.ds_rtsd0213.setColumn(nRowOms, "pickupDtlAddr", "");
        	this.ds_rtsd0213.setColumn(nRowOms, "iplZip", posCd);
        	this.ds_rtsd0213.setColumn(nRowOms, "iplAddr", encodeURI(city));
        	this.ds_rtsd0213.setColumn(nRowOms, "iplDtlAddr", encodeURI(street));
        	this.ds_rtsd0213.setColumn(nRowOms, "regUsrId", "rentalusr");
        	this.ds_rtsd0213.setColumn(nRowOms, "ordRsn", "R43");
        	
        	//20200311 kstka tms OrderId 추가
        	this.ds_rtsd0213.setColumn(nRowOms, "orderId", nvl(this.ds_contractStatus.getColumn(this.ds_contractStatus.rowposition, "tmsOrderId")));
        	
        	var o2oYn = "N";
        	var chanCd = nvl(this.ds_contractStatus.getColumn(this.ds_contractStatus.rowposition, "chanCd"));
        	if((chanCd == "02" || chanCd == "03" || chanCd == "04") 
        		&& nvl(this.ds_contractStatus.getColumn(this.ds_contractStatus.rowposition, "o2oYn")) == "Y"){
        		o2oYn = "Y"
        	}else{
        		o2oYn = "N";
        	}

        	this.ds_rtsd0213.setColumn(nRowOms, "o2oYn", o2oYn);
        	
        	//20200619 kstka 추가컬럼
        	this.ds_rtsd0213.setColumn(nRowOms, "omsOrderNo", this.ds_contractStatus.getColumn(0, "omsOrderNo"));
        	this.ds_rtsd0213.setColumn(nRowOms, "tmplCd", "NXO2O000000000000022");
        	//===========================================================================================
        	
        	//[20220203_01] kstka 고객번호 추가
        	this.ds_rtsd0213.setColumn(nRowOms, "custNo", this.ds_contractStatus.getColumn(0, "custNo"));
        	
        	if( this.ds_saveOrdCancel.getColumn(nRow, "ordNo") == "" ){
        		alert("계약번호를 확인하세요.");
        	}else{
        		if( confirm( "주문취소 하시겠습니까?") ){
        			//[20220104_01] 온라인주문취소 가능
        // 			if(nvl(this.ds_saveOrdCancel.getColumn(nRow, "ordNo")).substring(0, 1) == "O"){
        // 				this.alert("온라인 계약은 주문취소가 불가합니다.");
        // 				return;
        // // 				var sSvcID        	= "saveOnlineOrdCancel";                    
        // // 				var sController   	= "rtms/sd/saveOnlineOrdCancel.do";
        // // 				var sInDatasets   	= "";
        // // 				var sOutDatasets  	= "";
        // // 				var sArgs 			= "";
        // // 				sInDatasets   		= "input=ds_saveOrdCancel:U";
        // // 				var fn_callBack		= "fn_callBack";
        // 			}else{
        				var sSvcID        	= "saveOrdCancel";                    
        				var sController   	= "rtms/sd/saveOrdCancel.do";
        				var sInDatasets   	= "";
        				var sOutDatasets  	= "";
        				var sArgs 			= "";
        				sInDatasets   		+= " input=ds_saveOrdCancel:U ";
        				sInDatasets   		+= " input1=ds_rtsd0213:A ";
        				var fn_callBack		= "fn_callBack";
        //			}
        			Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        		}
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.btn_carInfoUpdate_onclick = function(obj,e){
        	var args ={p_arg : this.p_arg};
        	Ex.core.popup(this,"차량정보변경","comm::RTCOMMCarInfoUpdate.xfdl",args, "modaless=false");
        }
        this.FN_carInfoUpdate = function(ordNo){
        	this.FN_listStatus(ordNo);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

        this.btn_ordDel_onclick = function(obj,e)
        {
        	if(nvl(this.ds_contractStatus.getColumn(this.ds_contractStatus.rowposition, "o2oYn")) == "Y"){
        		this.alert("해당 계약은 OMS연계된 계약입니다. OMS에 삭제후 처리하세요.");
        		//return;
        	}
        	
        	if(confirm("※장착계약을 삭제하면 복구할 수 없습니다. 장착계약 삭제 하시겠습니까? ")){
        	
        		var sSvcID        	= "saveOrdDelete";                    
        		var sController   	= "rtms/sd/saveRTCOMMOrdDelete.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";
        		var fn_callBack		= "fn_callBack";	

        		var ordNo = nvl(this.ed_ordNo.value);
        		
        		if(nvl(ordNo) == ""){
        			alert("주문번호가 설정되어 있지 않습니다.");
        			return;
        		}
        		
        		sArgs += Ex.util.setParam("ordNo", 	ordNo);
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

        this.btn_delyBackup_onclick = function(obj,e)
        {
        	var sSvcID        	= "saveRtre0100Update";                    
        	var sController   	= "rtms/sd/saveRTRE0100Update.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";
        	var fn_callBack		= "fn_callBack";	
        		
        	sArgs += Ex.util.setParam("custNo", 	this.ds_contractStatus.getColumn(0, "custNo"));
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        this.btn_delyRollBack_onclick = function(obj,e)
        {
        	var sSvcID        	= "saveRtre0100Update";                    
        	var sController   	= "rtms/sd/saveRTRE0100Update.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";
        	var fn_callBack		= "fn_callBack";	
        		
        	sArgs += Ex.util.setParam("custNo", 	this.ds_contractStatus.getColumn(0, "custNo"));
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        this.btn_deliveryPop_onclick = function(obj,e)
        {
        	var args = {  ordNo :   this.ed_ordNo.value, reqNum : "0" };
        	Ex.core.popup(this,"배송조회팝업","comm::RTCOMMDeliveryBoard_pop.xfdl",args, "modaless=false");
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

        this.btn_order_onclick = function(obj,e)
        {
        	var toDayYear    = this.toDay.substr(0, 4);
        	var toDayMonth   = this.toDay.substr(4, 2);
        	var toDayDate    = this.toDay.substr(6, 2);

        	var nextDay       = new Date(toDayYear, Number(toDayMonth), Number(toDayDate) + 1);

        	var nextDayYear      = nextDay.getFullYear();
        	var nextDayMonth     = nextDay.getMonth(); nextDayMonth = (nextDayMonth < 10) ? '0' + nextDayMonth : nextDayMonth;
        	var nextDayDate      = nextDay.getDate(); nextDayDate = (nextDayDate < 10) ? '0' + nextDayDate : nextDayDate;
        	
        	var ordNo = nvl(this.ds_contractStatus.getColumn(0, "ordNo"));
        	var statCd = nvl(this.ds_contractStatus.getColumn(0, "statCd"));
        	var vbelnR = nvl(this.ds_contractStatus.getColumn(0, "vbelnR"));
        	var setGiDay = nvl(this.cal_setGiDay.value);
        	var audat = this.toDay;
        	if(ordNo == ""){
        		alert("변경할 주문이 선택되지 않았습니다.");
        		return;
        	}
        	
        	if(statCd != "01"){
        		alert("접수주문만 주문 유형 변경이 가능합니다.");
        		return;
        	}
        	
        	if(vbelnR != ""){
        		alert("취소처리가 완료되어 재주문이 불가합니다.");
        		return;
        	}
        	
        	var usage = "";
        	if(obj.id == "btn_order_01"){ //지정일출고
        		usage = "01";
        		audat = setGiDay;
        	} else if(obj.id == "btn_order_02") { //퀵(긴급)
        		usage = "02";
        	}
        	
        	var chanCd = this.ds_contractStatus.getColumn(0, "chanCd");
        	var augru = "";
        	var text = "";
        	if(chanCd == "01" || chanCd == "05") {
        		augru = "R42";
        		text = "오프라인_렌탈(" + this.ds_contractStatus.getColumn(0, "ordNo") + ")";
        	} else {
        		augru = "R41";
        		text = this.ds_contractStatus.getColumn(0, "instNm") + "_렌탈(" + this.ds_contractStatus.getColumn(0, "custNm") + "," + this.ds_contractStatus.getColumn(0, "mobNo") + "," + this.ds_contractStatus.getColumn(0, "ordNo") + ")";
        	}
        	
        	var sSvcID        	= "sapOrderCreate";                    
        	var sController   	= "/rtms/sd/sapOrderCreate.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= Ex.util.setParam("sendType", "003");
        		sArgs 		   += Ex.util.setParam("bstkd", this.ds_contractStatus.getColumn(0, "ordNo"));		//계약번호
        		sArgs 		   += Ex.util.setParam("gubun", "N");        //N
        		sArgs 		   += Ex.util.setParam("kunnr", this.ds_contractStatus.getColumn(0, "agencyCd"));		//대리점코드
        		sArgs 		   += Ex.util.setParam("bname", this.ds_contractStatus.getColumn(0, "custNm"));		//고객명
        		sArgs 		   += Ex.util.setParam("augru", augru);		//order reason
        		sArgs 		   += Ex.util.setParam("audat", audat);		//요청일자
        		sArgs 		   += Ex.util.setParam("matnr", this.ds_prdInfoCp.getColumn(0, "matCd"));		//대표규격코드
        		sArgs 		   += Ex.util.setParam("kwmeng",Number(this.ds_contractStatus.getColumn(0, "cntCd")));		//수량
        		sArgs 		   += Ex.util.setParam("abrvw", usage);		//usage
        		sArgs 		   += Ex.util.setParam("text", text);			//송장 비고란 문구
        	    
        	var fn_callBack		= "fn_callBack";

        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        //==================================================================================

        this.fn_sapOrderCancel = function(){

        	var sSvcID        	= "sapOrderCancel";                    
        	var sController   	= "/nrtms/sd/sapOrderCancel.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";
        		sArgs 		   += Ex.util.setParam("ordNo",  this.ds_contractStatus.getColumn(0, "ordNo"));    //계약번호
        		sArgs 		   += Ex.util.setParam("vbeln", this.ds_contractStatus.getColumn(0,  "vbeln"));    //오더번호
        		sArgs 		   += Ex.util.setParam("vbelnD", this.ds_contractStatus.getColumn(0, "vbelnD"));   //딜리버리번호
        	    
        	var fn_callBack		= "fn_callBack";

        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.ds_etcPrdInfoCp.addEventHandler("oncolumnchanged", this.dsPrice_oncolumnchanged, this);
            this.addEventHandler("onload", this.RTSDContractStatus_onload, this);
            this.ed_ordNo.addEventHandler("onkeyup", this.ed_ordNo_onkeyup, this);
            this.btn_orderNo.addEventHandler("onclick", this.btn_orderNo_onclick, this);
            this.tab_info.addEventHandler("onchanged", this.tab_info_onchanged, this);
            this.btn_ordCancel.addEventHandler("onclick", this.btn_ordCancel_onclick, this);
            this.btn_carInfoUpdate.addEventHandler("onclick", this.btn_carInfoUpdate_onclick, this);
            this.btn_ordDel.addEventHandler("onclick", this.btn_ordDel_onclick, this);
            this.btn_deliveryPop.addEventHandler("onclick", this.btn_deliveryPop_onclick, this);
            this.btn_order_01.addEventHandler("onclick", this.btn_order_onclick, this);
            this.btn_order_02.addEventHandler("onclick", this.btn_order_onclick, this);
            this.btn_order_03.addEventHandler("onclick", this.btn_order_onclick, this);

        };

        this.loadIncludeScript("RTSDContractStatus.xfdl");
        this.loadPreloadList();
       
    };
}
)();
