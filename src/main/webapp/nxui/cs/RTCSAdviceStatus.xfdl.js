﻿(function()
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
                this.set_name("RTCSAdviceStatus");
                this.set_classname("contractStatus");
                this.set_titletext("상담통합관리");
                this._setFormPosition(0,0,1147,565);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_contractStatus", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"ordNm\" type=\"STRING\" size=\"256\"/><Column id=\"chanNm\" type=\"STRING\" size=\"256\"/><Column id=\"saleNm\" type=\"STRING\" size=\"256\"/><Column id=\"statNm\" type=\"STRING\" size=\"256\"/><Column id=\"ordDay\" type=\"STRING\" size=\"256\"/><Column id=\"planDay\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"cancDay\" type=\"STRING\" size=\"256\"/><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"ordQty\" type=\"STRING\" size=\"256\"/><Column id=\"periodNm\" type=\"STRING\" size=\"256\"/><Column id=\"osYn\" type=\"STRING\" size=\"256\"/><Column id=\"mfpYn\" type=\"STRING\" size=\"256\"/><Column id=\"psNm\" type=\"STRING\" size=\"256\"/><Column id=\"makerNm\" type=\"STRING\" size=\"256\"/><Column id=\"mcNm\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"carOwner\" type=\"STRING\" size=\"256\"/><Column id=\"cMileage\" type=\"STRING\" size=\"256\"/><Column id=\"maMileage\" type=\"STRING\" size=\"256\"/><Column id=\"reqText\" type=\"STRING\" size=\"256\"/><Column id=\"birthDay\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"monAmt\" type=\"STRING\" size=\"256\"/><Column id=\"agencyCd\" type=\"STRING\" size=\"256\"/><Column id=\"agencyNm\" type=\"STRING\" size=\"256\"/><Column id=\"genderCd\" type=\"STRING\" size=\"256\"/><Column id=\"genderCdNm\" type=\"STRING\" size=\"256\"/><Column id=\"addr1\" type=\"STRING\" size=\"256\"/><Column id=\"addr2\" type=\"STRING\" size=\"256\"/><Column id=\"telNo2\" type=\"STRING\" size=\"256\"/><Column id=\"buslNo\" type=\"STRING\" size=\"256\"/><Column id=\"posCd\" type=\"STRING\" size=\"256\"/><Column id=\"posCd2\" type=\"STRING\" size=\"256\"/><Column id=\"mobFirm\" type=\"STRING\" size=\"256\"/><Column id=\"custTpNm\" type=\"STRING\" size=\"256\"/><Column id=\"custTp\" type=\"STRING\" size=\"256\"/><Column id=\"vbeln\" type=\"STRING\" size=\"256\"/><Column id=\"chanCd\" type=\"STRING\" size=\"256\"/><Column id=\"statCd\" type=\"STRING\" size=\"256\"/><Column id=\"seasonNm\" type=\"STRING\" size=\"256\"/><Column id=\"makerCd\" type=\"STRING\" size=\"256\"/><Column id=\"modelCd\" type=\"STRING\" size=\"256\"/><Column id=\"contentsCd\" type=\"STRING\" size=\"256\"/><Column id=\"frCd\" type=\"STRING\" size=\"256\"/><Column id=\"provsnNo\" type=\"STRING\" size=\"256\"/><Column id=\"prptYn\" type=\"STRING\" size=\"256\"/><Column id=\"rerentDayF\" type=\"STRING\" size=\"256\"/><Column id=\"rerentDayT\" type=\"STRING\" size=\"256\"/><Column id=\"saleCd\" type=\"STRING\" size=\"256\"/><Column id=\"saleCdNm\" type=\"STRING\" size=\"256\"/><Column id=\"saleCdDc\" type=\"STRING\" size=\"256\"/><Column id=\"orderSt\" type=\"STRING\" size=\"256\"/><Column id=\"orderStNm\" type=\"STRING\" size=\"256\"/><Column id=\"sumMonAmt\" type=\"STRING\" size=\"256\"/><Column id=\"bondSelDay\" type=\"STRING\" size=\"256\"/><Column id=\"payDd\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_installCp", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"agencyNm\" type=\"STRING\" size=\"256\"/><Column id=\"agencyCd\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"salesOffice\" type=\"STRING\" size=\"256\"/><Column id=\"salesOfficeCd\" type=\"STRING\" size=\"256\"/><Column id=\"salesGroup\" type=\"STRING\" size=\"256\"/><Column id=\"salesGroupCd\" type=\"STRING\" size=\"256\"/><Column id=\"engNm\" type=\"STRING\" size=\"256\"/><Column id=\"equNo\" type=\"STRING\" size=\"256\"/><Column id=\"instYn\" type=\"STRING\" size=\"256\"/><Column id=\"planDay\" type=\"STRING\" size=\"256\"/><Column id=\"agDesc\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"posCd\" type=\"STRING\" size=\"256\"/><Column id=\"city\" type=\"STRING\" size=\"256\"/><Column id=\"street\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_payCp", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"payMthd\" type=\"STRING\" size=\"256\"/><Column id=\"payDd\" type=\"STRING\" size=\"256\"/><Column id=\"accSeq\" type=\"STRING\" size=\"256\"/><Column id=\"bankNm\" type=\"STRING\" size=\"256\"/><Column id=\"acctNo\" type=\"STRING\" size=\"256\"/><Column id=\"crdSeq\" type=\"STRING\" size=\"256\"/><Column id=\"cardcomNm\" type=\"STRING\" size=\"256\"/><Column id=\"cardNo\" type=\"STRING\" size=\"256\"/><Column id=\"accChk\" type=\"STRING\" size=\"256\"/><Column id=\"accStat\" type=\"STRING\" size=\"256\"/><Column id=\"bkeyChk\" type=\"STRING\" size=\"256\"/><Column id=\"batchKey\" type=\"STRING\" size=\"256\"/><Column id=\"billYn\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_discountCp", this);
            obj.set_firefirstcount("0");
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
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"recvTp\" type=\"STRING\" size=\"256\"/><Column id=\"recvTpNm\" type=\"STRING\" size=\"256\"/><Column id=\"recDday\" type=\"STRING\" size=\"256\"/><Column id=\"resuSt\" type=\"STRING\" size=\"256\"/><Column id=\"resuStNm\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"endDay\" type=\"STRING\" size=\"256\"/><Column id=\"callNo\" type=\"STRING\" size=\"256\"/><Column id=\"userId\" type=\"STRING\" size=\"256\"/><Column id=\"userIdNm\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"callDtl\" type=\"STRING\" size=\"256\"/><Column id=\"boundGb\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_saveOrdCancel", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_historyCp", this);
            obj.set_firefirstcount("0");
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
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"saleGdsCd\" type=\"STRING\" size=\"256\"/><Column id=\"standard\" type=\"STRING\" size=\"256\"/><Column id=\"amt\" type=\"STRING\" size=\"256\"/><Column id=\"groupSale\" type=\"STRING\" size=\"256\"/><Column id=\"chnlSale\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"periodNm\" type=\"STRING\" size=\"256\"/><Column id=\"seasonNm\" type=\"STRING\" size=\"256\"/><Column id=\"cntNm\" type=\"STRING\" size=\"256\"/><Column id=\"seasonCd\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"seq\" type=\"STRING\" size=\"256\"/><Column id=\"ordId\" type=\"STRING\" size=\"256\"/><Column id=\"periodCd\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"regiCd\" type=\"STRING\" size=\"256\"/><Column id=\"frCd\" type=\"STRING\" size=\"256\"/><Column id=\"lrCd\" type=\"STRING\" size=\"256\"/><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"ordQty\" type=\"STRING\" size=\"256\"/><Column id=\"regiAmt\" type=\"STRING\" size=\"256\"/><Column id=\"rentAmt\" type=\"STRING\" size=\"256\"/><Column id=\"rentpAmt\" type=\"STRING\" size=\"256\"/><Column id=\"fDcrate\" type=\"STRING\" size=\"256\"/><Column id=\"fDcamt\" type=\"STRING\" size=\"256\"/><Column id=\"monDcamt\" type=\"STRING\" size=\"256\"/><Column id=\"monAmt\" type=\"STRING\" size=\"256\"/><Column id=\"planDay\" type=\"STRING\" size=\"256\"/><Column id=\"planTm\" type=\"STRING\" size=\"256\"/><Column id=\"instDay\" type=\"STRING\" size=\"256\"/><Column id=\"instTm\" type=\"STRING\" size=\"256\"/><Column id=\"instYn\" type=\"STRING\" size=\"256\"/><Column id=\"valYn\" type=\"STRING\" size=\"256\"/><Column id=\"equNo\" type=\"STRING\" size=\"256\"/><Column id=\"osId\" type=\"STRING\" size=\"256\"/><Column id=\"osDay\" type=\"STRING\" size=\"256\"/><Column id=\"statCd\" type=\"STRING\" size=\"256\"/><Column id=\"flYn\" type=\"STRING\" size=\"256\"/><Column id=\"frYn\" type=\"STRING\" size=\"256\"/><Column id=\"rlYn\" type=\"STRING\" size=\"256\"/><Column id=\"rrYn\" type=\"STRING\" size=\"256\"/><Column id=\"matDesc\" type=\"STRING\" size=\"256\"/><Column id=\"saleCd\" type=\"STRING\" size=\"256\"/><Column id=\"gdsGb\" type=\"STRING\" size=\"256\"/><Column id=\"gdsGrp\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_etcPrdInfoCp", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"chk\" type=\"STRING\" size=\"256\"/><Column id=\"addGdsCd\" type=\"STRING\" size=\"256\"/><Column id=\"addGdsNm\" type=\"STRING\" size=\"256\"/><Column id=\"amt\" type=\"STRING\" size=\"256\"/><Column id=\"makerNm\" type=\"STRING\" size=\"256\"/><Column id=\"gdsDesc\" type=\"STRING\" size=\"256\"/><Column id=\"gdsGrpNm\" type=\"STRING\" size=\"256\"/><Column id=\"gdsGrp\" type=\"STRING\" size=\"256\"/><Column id=\"dcAmt\" type=\"STRING\" size=\"256\"/><Column id=\"actAmt\" type=\"STRING\" size=\"256\"/><Column id=\"dcYn\" type=\"STRING\" size=\"256\"/><Column id=\"monAmt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_custCp", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custTp\" type=\"STRING\" size=\"256\"/><Column id=\"custTp2\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"birthDay\" type=\"STRING\" size=\"256\"/><Column id=\"genderCd\" type=\"STRING\" size=\"256\"/><Column id=\"lfCd\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"mobFirm\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"faxNo\" type=\"STRING\" size=\"256\"/><Column id=\"bldMngNo\" type=\"STRING\" size=\"256\"/><Column id=\"posCd\" type=\"STRING\" size=\"256\"/><Column id=\"addr1\" type=\"STRING\" size=\"256\"/><Column id=\"addr2\" type=\"STRING\" size=\"256\"/><Column id=\"telNo2\" type=\"STRING\" size=\"256\"/><Column id=\"bldMngNo2\" type=\"STRING\" size=\"256\"/><Column id=\"posCd2\" type=\"STRING\" size=\"256\"/><Column id=\"addr12\" type=\"STRING\" size=\"256\"/><Column id=\"addr22\" type=\"STRING\" size=\"256\"/><Column id=\"safekey\" type=\"STRING\" size=\"256\"/><Column id=\"buslNo\" type=\"STRING\" size=\"256\"/><Column id=\"corpNo\" type=\"STRING\" size=\"256\"/><Column id=\"repNm\" type=\"STRING\" size=\"256\"/><Column id=\"oCustnm\" type=\"STRING\" size=\"256\"/><Column id=\"oBirthday\" type=\"STRING\" size=\"256\"/><Column id=\"oGendercd\" type=\"STRING\" size=\"256\"/><Column id=\"oLfcd\" type=\"STRING\" size=\"256\"/><Column id=\"oMobno\" type=\"STRING\" size=\"256\"/><Column id=\"oSafekey\" type=\"STRING\" size=\"256\"/><Column id=\"cCustnm\" type=\"STRING\" size=\"256\"/><Column id=\"cTelno\" type=\"STRING\" size=\"256\"/><Column id=\"emailAddr\" type=\"STRING\" size=\"256\"/><Column id=\"emailAddr1\" type=\"STRING\" size=\"256\"/><Column id=\"emailAddr2\" type=\"STRING\" size=\"256\"/><Column id=\"busiType\" type=\"STRING\" size=\"256\"/><Column id=\"busiCond\" type=\"STRING\" size=\"256\"/><Column id=\"taxYn\" type=\"STRING\" size=\"256\"/><Column id=\"kunnr\" type=\"STRING\" size=\"256\"/><Column id=\"ciCd\" type=\"STRING\" size=\"256\"/><Column id=\"diCd\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_list05Cp", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"recvSeq\" type=\"STRING\" size=\"256\"/><Column id=\"ritmSeq\" type=\"STRING\" size=\"256\"/><Column id=\"recvDay\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"recpTp\" type=\"STRING\" size=\"256\"/><Column id=\"recpTnm\" type=\"STRING\" size=\"256\"/><Column id=\"recpPay\" type=\"STRING\" size=\"256\"/><Column id=\"recpPnm\" type=\"STRING\" size=\"256\"/><Column id=\"recpFg\" type=\"STRING\" size=\"256\"/><Column id=\"recpFnm\" type=\"STRING\" size=\"256\"/><Column id=\"recpAmt\" type=\"STRING\" size=\"256\"/><Column id=\"schdSeq\" type=\"STRING\" size=\"256\"/><Column id=\"recpNu\" type=\"STRING\" size=\"256\"/><Column id=\"cncStat\" type=\"STRING\" size=\"256\"/><Column id=\"tNo\" type=\"STRING\" size=\"256\"/><Column id=\"bankCd\" type=\"STRING\" size=\"256\"/><Column id=\"bankNm\" type=\"STRING\" size=\"256\"/><Column id=\"acctNo\" type=\"STRING\" size=\"256\"/><Column id=\"cardcomCd\" type=\"STRING\" size=\"256\"/><Column id=\"cardcomNm\" type=\"STRING\" size=\"256\"/><Column id=\"cardNo\" type=\"STRING\" size=\"256\"/><Column id=\"bankRecpDay\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_messageCp", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"msgGb\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regNm\" type=\"STRING\" size=\"256\"/><Column id=\"rcvPhnId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"sndMsg\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_list_mainCp", this);
            obj._setContents("<ColumnInfo><Column id=\"stdYm\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"equNo\" type=\"STRING\" size=\"256\"/><Column id=\"jobSeq\" type=\"STRING\" size=\"256\"/><Column id=\"seq\" type=\"STRING\" size=\"256\"/><Column id=\"mrCd\" type=\"STRING\" size=\"256\"/><Column id=\"userNm\" type=\"STRING\" size=\"256\"/><Column id=\"planDay\" type=\"STRING\" size=\"256\"/><Column id=\"planTm\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"cntNm\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"bldMngNo\" type=\"STRING\" size=\"256\"/><Column id=\"poscd\" type=\"STRING\" size=\"256\"/><Column id=\"addr1\" type=\"STRING\" size=\"256\"/><Column id=\"addr1Old\" type=\"STRING\" size=\"256\"/><Column id=\"addr2\" type=\"STRING\" size=\"256\"/><Column id=\"callCnt\" type=\"STRING\" size=\"256\"/><Column id=\"obSt\" type=\"STRING\" size=\"256\"/><Column id=\"obStDtl\" type=\"STRING\" size=\"256\"/><Column id=\"mrMemo\" type=\"STRING\" size=\"256\"/><Column id=\"apprScnt\" type=\"STRING\" size=\"256\"/><Column id=\"targetNm\" type=\"STRING\" size=\"256\"/><Column id=\"chkStat\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"procDay2\" type=\"STRING\" size=\"256\"/><Column id=\"modelNm\" type=\"STRING\" size=\"256\"/><Column id=\"servCnt0\" type=\"STRING\" size=\"256\"/><Column id=\"servCnt\" type=\"STRING\" size=\"256\"/><Column id=\"servCntr\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_provsnListCp", this);
            obj._setContents("<ColumnInfo><Column id=\"provsnNo\" type=\"STRING\" size=\"256\"/><Column id=\"provsnTp\" type=\"STRING\" size=\"256\"/><Column id=\"provsnDay\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"addr\" type=\"STRING\" size=\"256\"/><Column id=\"mcNm\" type=\"STRING\" size=\"256\"/><Column id=\"specNm\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"patternNm\" type=\"STRING\" size=\"256\"/><Column id=\"cnt\" type=\"STRING\" size=\"256\"/><Column id=\"period\" type=\"STRING\" size=\"256\"/><Column id=\"regiAmt\" type=\"STRING\" size=\"256\"/><Column id=\"rentAmt\" type=\"STRING\" size=\"256\"/><Column id=\"planDay\" type=\"STRING\" size=\"256\"/><Column id=\"emailAddr\" type=\"STRING\" size=\"256\"/><Column id=\"provsnSt\" type=\"STRING\" size=\"256\"/><Column id=\"provsnStDtl\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/><Column id=\"hshopTp\" type=\"STRING\" size=\"256\"/><Column id=\"hshopOrdno\" type=\"STRING\" size=\"256\"/><Column id=\"airDay\" type=\"STRING\" size=\"256\"/><Column id=\"airTm\" type=\"STRING\" size=\"256\"/><Column id=\"contactGet\" type=\"STRING\" size=\"256\"/><Column id=\"contactCnt\" type=\"STRING\" size=\"256\"/><Column id=\"custReq\" type=\"STRING\" size=\"256\"/><Column id=\"recallDay\" type=\"STRING\" size=\"256\"/><Column id=\"recallTm\" type=\"STRING\" size=\"256\"/><Column id=\"atflPathNm\" type=\"STRING\" size=\"256\"/><Column id=\"atflNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_contract", this);
            obj.set_preload("true");
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"ordNm\" type=\"STRING\" size=\"256\"/><Column id=\"chanNm\" type=\"STRING\" size=\"256\"/><Column id=\"saleNm\" type=\"STRING\" size=\"256\"/><Column id=\"statNm\" type=\"STRING\" size=\"256\"/><Column id=\"ordDay\" type=\"STRING\" size=\"256\"/><Column id=\"planDay\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"cancDay\" type=\"STRING\" size=\"256\"/><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"ordQty\" type=\"STRING\" size=\"256\"/><Column id=\"periodNm\" type=\"STRING\" size=\"256\"/><Column id=\"osYn\" type=\"STRING\" size=\"256\"/><Column id=\"mfpYn\" type=\"STRING\" size=\"256\"/><Column id=\"psNm\" type=\"STRING\" size=\"256\"/><Column id=\"makerNm\" type=\"STRING\" size=\"256\"/><Column id=\"mcNm\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"carOwner\" type=\"STRING\" size=\"256\"/><Column id=\"cMileage\" type=\"STRING\" size=\"256\"/><Column id=\"maMileage\" type=\"STRING\" size=\"256\"/><Column id=\"reqText\" type=\"STRING\" size=\"256\"/><Column id=\"birthDay\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"monAmt\" type=\"STRING\" size=\"256\"/><Column id=\"agencyNm\" type=\"STRING\" size=\"256\"/><Column id=\"genderCd\" type=\"STRING\" size=\"256\"/><Column id=\"genderCdNm\" type=\"STRING\" size=\"256\"/><Column id=\"addr1\" type=\"STRING\" size=\"256\"/><Column id=\"addr2\" type=\"STRING\" size=\"256\"/><Column id=\"telNo2\" type=\"STRING\" size=\"256\"/><Column id=\"buslNo\" type=\"STRING\" size=\"256\"/><Column id=\"posCd\" type=\"STRING\" size=\"256\"/><Column id=\"posCd2\" type=\"STRING\" size=\"256\"/><Column id=\"mobFirm\" type=\"STRING\" size=\"256\"/><Column id=\"custTpNm\" type=\"STRING\" size=\"256\"/><Column id=\"custTp\" type=\"STRING\" size=\"256\"/><Column id=\"vbeln\" type=\"STRING\" size=\"256\"/><Column id=\"chanCd\" type=\"STRING\" size=\"256\"/><Column id=\"statCd\" type=\"STRING\" size=\"256\"/><Column id=\"seasonNm\" type=\"STRING\" size=\"256\"/><Column id=\"makerCd\" type=\"STRING\" size=\"256\"/><Column id=\"modelCd\" type=\"STRING\" size=\"256\"/><Column id=\"contentsCd\" type=\"STRING\" size=\"256\"/><Column id=\"frCd\" type=\"STRING\" size=\"256\"/><Column id=\"provsnNo\" type=\"STRING\" size=\"256\"/><Column id=\"rerentDayF\" type=\"STRING\" size=\"256\"/><Column id=\"rerentDayT\" type=\"STRING\" size=\"256\"/><Column id=\"saleCd\" type=\"STRING\" size=\"256\"/><Column id=\"saleCdNm\" type=\"STRING\" size=\"256\"/><Column id=\"saleCdDc\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_controlAuth", this);
            obj._setContents("<ColumnInfo><Column id=\"mdlCd\" type=\"STRING\" size=\"256\"/><Column id=\"prgmCd\" type=\"STRING\" size=\"256\"/><Column id=\"controlId\" type=\"STRING\" size=\"256\"/><Column id=\"userGrp\" type=\"STRING\" size=\"256\"/><Column id=\"userId\" type=\"STRING\" size=\"256\"/><Column id=\"typeCd\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static17", "absolute", "0", "0", "308", "31", null, null, this);
            obj.set_taborder("2");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_custNo", "absolute", "105", "5", "100", "20", null, null, this);
            obj.set_taborder("3");
            obj.set_maxlength("15");
            this.addChild(obj.name, obj);

            obj = new Button("btn_orderNo", "absolute", "211", "5", "89", "21", null, null, this);
            obj.set_taborder("4");
            obj.set_text("고객조회");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Static("st_ordNo", "absolute", "0", "0", "100", "31", null, null, this);
            obj.set_taborder("5");
            obj.set_text("고객번호");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

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

            obj = new Grid("grid_ordNoList", "absolute", "2", "40", "1125", "199", null, null, this);
            obj.set_taborder("85");
            obj.set_binddataset("ds_contractStatus");
            obj.set_cellsizingtype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"86\"/><Column size=\"120\"/><Column size=\"80\"/><Column size=\"0\"/><Column size=\"0\"/><Column size=\"120\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"70\"/><Column size=\"120\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"100\"/><Column size=\"0\"/><Column size=\"100\"/><Column size=\"0\"/><Column size=\"124\"/><Column size=\"55\"/><Column size=\"75\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"24\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"고객번호\"/><Cell col=\"1\" text=\"계약번호\"/><Cell col=\"2\" text=\"고객명\"/><Cell col=\"3\" text=\"전화번호2\"/><Cell col=\"4\" text=\"주소\"/><Cell col=\"5\" text=\"차종\"/><Cell col=\"6\" text=\"차량번호\"/><Cell col=\"7\" text=\"계약일자\"/><Cell col=\"8\" text=\"장착일자\"/><Cell col=\"9\" text=\"계약상태\"/><Cell col=\"10\" text=\"중도완납\"/><Cell col=\"11\" text=\"채권매각\"/><Cell col=\"12\" text=\"핸드폰\"/><Cell col=\"13\" text=\"핸드폰\"/><Cell col=\"14\" text=\"전화번호\"/><Cell col=\"15\" text=\"전화번호\"/><Cell col=\"16\" text=\"지점\"/><Cell col=\"17\" text=\"결제일\"/><Cell col=\"18\" text=\"월렌탈료\"/></Band><Band id=\"body\"><Cell text=\"bind:custNo\"/><Cell col=\"1\" displaytype=\"text\" edittype=\"readonly\" text=\"bind:ordNo\"/><Cell col=\"2\" text=\"bind:custNm\"/><Cell col=\"3\" text=\"bind:telNo2\" expr=\"expr:FN_numberHyphenInReturn(telNo2)\"/><Cell col=\"4\" text=\"bind:addr\"/><Cell col=\"5\" text=\"bind:mcNm\"/><Cell col=\"6\" text=\"bind:carNo\"/><Cell col=\"7\" displaytype=\"date\" text=\"bind:ordDay\" calendardisplaynulltype=\"none\"/><Cell col=\"8\" text=\"bind:procDay\"/><Cell col=\"9\" text=\"bind:statNm\"/><Cell col=\"10\" text=\"bind:mfpYn\"/><Cell col=\"11\" text=\"bind:bondSelDay\"/><Cell col=\"12\" text=\"bind:mobNo\" expr=\"expr:FN_numberMaskReturn(mobNo)\"/><Cell col=\"13\" text=\"bind:mobNo\"/><Cell col=\"14\" text=\"bind:telNo\" expr=\"expr:FN_numberMaskReturn(telNo)\"/><Cell col=\"15\" text=\"bind:telNo\" expr=\"expr:FN_numberHyphenInReturn(telNo)\"/><Cell col=\"16\" text=\"bind:agencyNm\"/><Cell col=\"17\" text=\"bind:payDd\"/><Cell col=\"18\" displaytype=\"number\" text=\"bind:sumMonAmt\"/></Band><Band id=\"summary\"><Cell text=\"총계\"/><Cell col=\"1\" expr=\"dataset.getRowCount()+&quot;(건)&quot;\"/><Cell col=\"2\"/><Cell col=\"3\"/><Cell col=\"4\"/><Cell col=\"5\"/><Cell col=\"6\"/><Cell col=\"7\"/><Cell col=\"8\"/><Cell col=\"9\"/><Cell col=\"10\"/><Cell col=\"11\"/><Cell col=\"12\"/><Cell col=\"13\"/><Cell col=\"14\"/><Cell col=\"15\"/><Cell col=\"16\"/><Cell col=\"17\"/><Cell col=\"18\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Tab("tab_info", "absolute", "0", "326", "1122", "183", null, null, this);
            obj.set_taborder("86");
            obj.set_tabindex("0");
            obj.set_scrollbars("autoboth");
            obj.style.set_showextrabutton("false");
            obj.set_preload("true");
            this.addChild(obj.name, obj);
            obj = new Tabpage("tab_info1_custInfo", this.tab_info);
            obj.set_text("고객정보");
            obj.set_url("cs::RTCSAdvicetStatus_tab_info1_custInfo.xfdl");
            this.tab_info.addChild(obj.name, obj);
            obj = new Tabpage("tab_info1_contractInfo", this.tab_info);
            obj.set_text("계약정보");
            obj.set_url("cs::RTCSAdvicetStatus_tab_info1_contractInfo.xfdl");
            this.tab_info.addChild(obj.name, obj);
            obj = new Tabpage("tab_info2_prdInfo", this.tab_info);
            obj.set_text("제품정보");
            obj.set_url("cs::RTCSAdvicetStatus_tab_info2_prdInfo.xfdl");
            this.tab_info.addChild(obj.name, obj);
            obj = new Tabpage("tab_info3_etcPrdInfo", this.tab_info);
            obj.set_text("부가제품정보");
            obj.set_url("cs::RTCSAdviceStatus_tab_info3_etcPrdInfo.xfdl");
            this.tab_info.addChild(obj.name, obj);
            obj = new Tabpage("tab_info4_install", this.tab_info);
            obj.set_text("설치내역");
            obj.set_url("cs::RTCSAdvicetStatus_tab_info4_install.xfdl");
            this.tab_info.addChild(obj.name, obj);
            obj = new Tabpage("tab_info5_history", this.tab_info);
            obj.set_text("상담내역");
            obj.set_url("cs::RTCSAdvicetStatus_tab_info5_history.xfdl");
            this.tab_info.addChild(obj.name, obj);
            obj = new Tabpage("tab_info6_collection", this.tab_info);
            obj.set_text("수금이력");
            obj.set_url("cs::RTCSAdvicetStatus_tab_info6_collection.xfdl");
            this.tab_info.addChild(obj.name, obj);
            obj = new Tabpage("tab_info7_history", this.tab_info);
            obj.set_text("서비스이력");
            obj.set_url("cs::RTCSAdviceStatus_tab_info7_history.xfdl");
            this.tab_info.addChild(obj.name, obj);
            obj = new Tabpage("tab_info8_seller", this.tab_info);
            obj.set_text("정기점검스케쥴");
            obj.set_url("cs::RTCSAdviceStatus_tab_info8_seller.xfdl");
            this.tab_info.addChild(obj.name, obj);
            obj = new Tabpage("tab_info9_message", this.tab_info);
            obj.set_text("메시지발송이력");
            obj.set_url("cs::RTCSAdviceStatus_tab_info9_message.xfdl");
            this.tab_info.addChild(obj.name, obj);
            obj = new Tabpage("tab_info10_collection", this.tab_info);
            obj.set_text("가계약정보");
            obj.set_url("cs::RTCSAdvicetStatus_tab_info10_collection.xfdl");
            this.tab_info.addChild(obj.name, obj);

            obj = new Button("btn_orderNo00", "absolute", "11", "285", "89", "21", null, null, this);
            obj.set_taborder("87");
            obj.set_text("상담등록");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Button("btn_orderNo01", "absolute", "107", "285", "89", "21", null, null, this);
            obj.set_taborder("88");
            obj.set_text("결제정보변경");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Button("btn_orderNo02", "absolute", "203", "285", "89", "21", null, null, this);
            obj.set_taborder("89");
            obj.set_text("연체금수납");
            obj.getSetter("domainId").set("nexa.save");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Button("btn_orderNo03", "absolute", "299", "285", "89", "21", null, null, this);
            obj.set_taborder("90");
            obj.set_text("선납할인");
            obj.getSetter("domainId").set("nexa.save");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Button("btn_orderNo04", "absolute", "395", "285", "89", "21", null, null, this);
            obj.set_taborder("91");
            obj.set_text("중도완납/해지");
            obj.getSetter("domainId").set("nexa.save");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Button("btn_orderNo05", "absolute", "491", "285", "89", "21", null, null, this);
            obj.set_taborder("92");
            obj.set_text("클레임등록");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Button("btn_kakao", "absolute", "587", "285", "89", "21", null, null, this);
            obj.set_taborder("93");
            obj.set_text("계약서발송");
            obj.getSetter("domainId").set("nexa.save");
            obj.set_enable("false");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 0, 0, this.tab_info.tab_info3_etcPrdInfo,
            	//-- Layout function
            	function(p) {
            		p.set_text("부가제품정보");
            		p.set_url("cs::RTCSAdviceStatus_tab_info3_etcPrdInfo.xfdl");

            	}
            );
            this.tab_info.tab_info3_etcPrdInfo.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 0, 0, this.tab_info.tab_info7_history,
            	//-- Layout function
            	function(p) {
            		p.set_text("서비스이력");
            		p.set_url("cs::RTCSAdviceStatus_tab_info7_history.xfdl");

            	}
            );
            this.tab_info.tab_info7_history.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1147, 565, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("contractStatus");
            		p.set_titletext("상담통합관리");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        
        this.loadPreloadList = function()
        {
            this._addPreloadList("data", "", "ds_contract");
            this._addPreloadList("fdl", "cs::RTCSAdvicetStatus_tab_info1_custInfo.xfdl");
            this._addPreloadList("fdl", "cs::RTCSAdvicetStatus_tab_info1_contractInfo.xfdl");
            this._addPreloadList("fdl", "cs::RTCSAdvicetStatus_tab_info2_prdInfo.xfdl");
            this._addPreloadList("fdl", "cs::RTCSAdviceStatus_tab_info3_etcPrdInfo.xfdl");
            this._addPreloadList("fdl", "cs::RTCSAdvicetStatus_tab_info4_install.xfdl");
            this._addPreloadList("fdl", "cs::RTCSAdvicetStatus_tab_info5_history.xfdl");
            this._addPreloadList("fdl", "cs::RTCSAdvicetStatus_tab_info6_collection.xfdl");
            this._addPreloadList("fdl", "cs::RTCSAdviceStatus_tab_info7_history.xfdl");
            this._addPreloadList("fdl", "cs::RTCSAdviceStatus_tab_info8_seller.xfdl");
            this._addPreloadList("fdl", "cs::RTCSAdviceStatus_tab_info9_message.xfdl");
            this._addPreloadList("fdl", "cs::RTCSAdvicetStatus_tab_info10_collection.xfdl");
        };
        
        // User Script
        this.addIncludeScript("RTCSAdviceStatus.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCSAdviceStatus.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분	: 서비스관리 > 상담관리 > 상담통합관리
         * 02. 그룹명		: RTCSAdviceStatus.xfdl
         * 03. 그룹설명	: 
         * 04. 작성일		: 
         * 05. 작성자		: 
         * 06. 수정이력	: 
         ***********************************************************************
         *		수정일			작성자		내용
         ***********************************************************************
         *		2017-10-30		wjim		[20171027_02] 가계약번호, 재렌탈가능일자 추가
         *		2018-01-19		wjim		[20180119_01] 전자서명탭 기존 조회 계약분 오조회 보완
         ***********************************************************************/

        /***********************************************************************
         * Script Include
         ***********************************************************************/
        //include "lib::comLib.xjs";

        /***********************************************************************
         * FORM 변수 선언 영역
         ***********************************************************************/
        this.p_arg		 = "RTCSAdviceStatus";
        this.returnOrdNo = "";
        this.nRow		 = 0;
        this.ordNo		 = "";
        this.popupYn	 = "Y"; /* 수납 후 결과창을 위한 변수 */

        this.userId      = application.gds_userInfo.getColumn(0,"userId");
        this.userGrp     = application.gds_userInfo.getColumn(0,"userGrp");
        /***********************************************************************
         * 그룹 변수 선언부
         ***********************************************************************/

        /***********************************************************************************
         * Form Load Common Function
         ***********************************************************************************/
        this.RTCSAdviceStatus_onload = function(obj,e) {
        	Ex.core.init(obj);
        	this.parent.setButton("", this);
        	this.listControlAuth("CS", "RTCSAdviceStatus");
        	this.fn_getToday();
        	
        	
        	
        }

        /***********************************************************************************
         * Transaction Function
         ***********************************************************************************/
        /**
         * 현재날짜 조회
         */
        this.fn_getToday = function() {
        	var sSvcID		 = "getToday";
        	var sController	 = "/rtms/comm/getToday.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "";
        	var sArgs		 = "";
        	var fn_callBack	 = "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 계약내역 조회
         */
        this.fn_listStatus = function(){
        	this.fn_tabDataSetClear();
        	
        	this.ds_contractStatus.clearData();
        	
        	var sSvcID		 = "listStatus";
        	var sController	 = "rtms/sd/AdviceStatus.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "ds_contractStatus=mapStatus";
        	var sArgs		 = "";
        		sArgs		+= Ex.util.setParam("custNo", this.ed_custNo.value);
        	var fn_callBack	 = "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 고객정보
         */
        this.fn_listCustInfo = function() {
        	var sSvcID		 = "listCustInfo";
        	var sController	 = "rtms/comm/listCustInfo.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "ds_custCp=mapCustInfo";
        	var sArgs		 = "";
        		sArgs		+= Ex.util.setParam("custNo", this.ed_custNo.value);
        	var fn_callBack	 = "fn_callBack";

        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         *  계약정보
         */
        this.fn_listStatus2 = function() {
        	var sSvcID		 = "listStatus2";
        	var sController	 = "rtms/sd/listcontractInfo.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "ds_contract=listcontractInfo";
        	var sArgs		 = "";
        		sArgs += Ex.util.setParam("ordNo", this.ordNo);
        	var fn_callBack	 = "fn_callBack";

        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 제품정보
         */
        this.fn_listPrdInfo = function() {
        	var sSvcID		 = "listPrdInfo";
        	var sController	 = "/rtms/sd/listPrdInfo.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "ds_prdInfoCp=listPrdInfo";
        	var sArgs		 = "";
        		sArgs		+= Ex.util.setParam("ordNo", this.ordNo);
        	var fn_callBack	 = "fn_callBack";

        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 부가제품정보
         */
        this.fn_listEtcPrdInfo = function() {
        	var sSvcID		 = "listEtcPrdInfo";
        	var sController	 = "rtms/sd/listProductInfoSch.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "ds_etcPrdInfoCp=listProductInfoSch";
        	var sArgs		 = "";
        		sArgs		+= Ex.util.setParam("ordNo", this.ordNo);
        	var fn_callBack	 = "fn_callBack";

        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 설치정보
         */
        this.fn_advicelistInstall = function() {
        	var sSvcID		 = "advicelistInstall";
        	var sController	 = "rtms/sd/AdvicelistInstall.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "ds_installCp=mapInstall";
        	var sArgs		 = "";
        		sArgs		+= Ex.util.setParam("ordNo", this.ordNo);
        	var fn_callBack	 = "fn_callBack";

        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 상담내역
         */
        this.fn_listAdvice = function() {
        	var sSvcID		 = "listAdvice";
        	var sController	 = "rtms/sd/listAdvice.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "ds_adviceCp=mapAdvice";
        	var sArgs		 = "";
        		sArgs		+= Ex.util.setParam("ordNo", this.ordNo);
        	var fn_callBack	 = "fn_callBack";

        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 수납이력
         */
        this.fn_getReceiptList = function() {
        	var sSvcID		 = "getReceiptList";
        	var sController	 = "ntrms/sd/getReceiptList.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "ds_list05Cp=output";
        	var sArgs		 = "";
        		sArgs		+= Ex.util.setParam("ordNo", this.ordNo);
        	var fn_callBack	 = "fn_callBack";

        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 서비스이력
         */
        this.fn_serviceHistory = function() {
        	var sSvcID		 = "serviceHistory";
        	var sController	 = "rtms/cs/serviceHistory.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "ds_historyCp=mapHistory";
        	var sArgs		 = "";
        		sArgs		+= Ex.util.setParam("ordNo", this.ordNo);
        	var fn_callBack	 = "fn_callBack";

        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 정기점검스케쥴
         */
        this.fn_listMain = function() {
        	var sSvcID		 = "listMain";
        	var sController	 = "/rtms/cs/AdviceCallList.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "ds_list_mainCp=ds_list_main";
        	var sArgs		 = "";
        		sArgs		+= Ex.util.setParam("ordNo", this.ordNo);
        	var fn_callBack	 = "fn_callBack";
        	
        	if (Eco.isEmpty(this.ordNo)) {
        		alert("계약번호를 알 수 없습니다.");
        		return;
        	}
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * SMS내역
         */
        this.fn_listmessage = function() {
        	var mobNo = nvl(this.ds_contractStatus.getColumn(this.nRow, "mobNo"));

        	var sSvcID		 = "listmessage";
        	var sController	 = "rtms/sd/listmessage.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "ds_messageCp=mapMessage";
        	var sArgs		 = "";
        		sArgs		+= Ex.util.setParam("mobNo", mobNo);
        	var fn_callBack	 = "fn_callBack";

        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 가계약정보
         */
        this.fn_listProvsn = function() {
        	var sSvcID		 = "listProvsn";
        	var sController	 = "rtms/sd/listProvisionalContract2.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "ds_provsnListCp=mapProvsn";
        	var sArgs		 = "";
        		sArgs		+= Ex.util.setParam("provsnTp",	"B");
        		sArgs		+= Ex.util.setParam("ordNo",	this.ordNo);
        	var fn_callBack	 = "fn_callBack";

        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /***********************************************************************************
         * CallBack Event(strSvcId - Sevice ID, nErrorCode - ErrorCode, strErrorMsg - Error Message)
         ***********************************************************************************/
        this.fn_callBack = function(strSvcId,nErrorCode,strErrorMsg) {
        	var ds	  = this.ds_contractStatus;
        	var ordNo = nvl(ds.getColumn(0, "ordNo"));
        	
        	if(nErrorCode < 0) {
        		return Ex.core.comMsg("alert", strErrorMsg);
        	}
        	
        	switch(strSvcId) {
        		/* 현재날짜 조회 */
        		case "getToday":
        			break;
        		
        		/* 계약내역 조회 */
        		case "listStatus":
        			if(ds.getRowCount == 0) {
        				this.alert("존재하지 않는 계약번호입니다.\n확인 후 재작업 바랍니다.");
        			}
        			
        			if(this.tab_info.tabindex == 0) {
        				this.fn_listCustInfo();
        			} else {
        				this.tab_info.set_tabindex(0);
        			}
        			break;
        		
        		/* 고객정보 */
        		case "listCustInfo":
        			this.ds_custCp.setColumn(0, "ordNo", ordNo);
        			this.tab_info.tab_info1_custInfo.ds_cust.copyData(this.ds_custCp);
        			break;
        		
        		/* 계약정보 */
        		case "listStatus2":
        			this.tab_info.tab_info1_contractInfo.ds_contractStatus.copyData(this.ds_contract);
        			break;
        		
        		/* 제품정보 */
        		case "listPrdInfo":
        			this.ds_prdInfoCp.setColumn(0, "ordNo", ordNo);
        			this.tab_info.tab_info2_prdInfo.ds_prdInfo.copyData(this.ds_prdInfoCp);
        			break;
        		
        		/* 부가제품정보 */
        		case "listEtcPrdInfo":
        			this.ds_prdInfoCp.setColumn(0, "ordNo", ordNo);
        			this.tab_info.tab_info3_etcPrdInfo.ds_etcPrdInfo.copyData(this.ds_etcPrdInfoCp);
        			break;
        		
        		/* 설치정보 */
        		case "advicelistInstall":
        			this.ds_installCp.setColumn(0, "ordNo", ordNo);
        			this.tab_info.tab_info4_install.ds_install.copyData(this.ds_installCp);
        			break;
        		
        		/* 상담내역 */
        		case "listAdvice":
        			this.ds_adviceCp.setColumn(0, "ordNo", ordNo);
        			this.tab_info.tab_info5_history.ds_advice.copyData(this.ds_adviceCp);
        			break;
        		
        		/* 수납이력 */
        		case "getReceiptList":
        			this.ds_list05Cp.setColumn(0, "ordNo", ordNo);
        			this.tab_info.tab_info6_collection.ds_list05.copyData(this.ds_list05Cp);
        			break;
        		
        		/* 서비스이력 */
        		case "serviceHistory":
        			this.ds_historyCp.setColumn(0, "ordNo", ordNo);
        			this.tab_info.tab_info7_history.ds_history.copyData(this.ds_historyCp);
        			break;
        		/* 정기점검스케쥴 */
        		case "listMain":
        			this.ds_list_mainCp.setColumn(0, "ordNo", ordNo);
        			this.tab_info.tab_info8_seller.ds_list_main.copyData(this.ds_list_mainCp);
        			break;
        		
        		/* SMS내역 */
        		case "listmessage":
        			this.ds_messageCp.setColumn(0, "ordNo", ordNo);
        			this.tab_info.tab_info9_message.ds_message.copyData(this.ds_messageCp);
        			break;
        		
        		/* 가계약정보 */
        		case "listProvsn":
        			this.ds_provsnListCp.setColumn(0, "ordNo", ordNo);
        			this.tab_info.tab_info10_collection.ds_provsnList.copyData(this.ds_provsnListCp);
        			break;		
        		case "listControlAuth":
        			var authYn = this.getControlAuthCheck("btn_kakao", this.userGrp, "");
        			if(authYn == "Y"){
        				this.btn_kakao.set_enable(true);
        			}else{
        				this.btn_kakao.set_enable(false);
        			}
        		default:
        			break;
        	}
        }

        /**
         * 고객조회 Popup Callback
         */
        this.returnCustInfo = function(ds) {
        	this.ed_custNo.set_value(ds[0].getColumn(0, "custNo"));
        	this.ed_custNo.set_enable(false);
        	this.fn_listStatus(); 	
        }

        /**
         * 수납/취소 popup callback
         */
        this.fn_popupCallback = function(args) {
        	Ex.core.popup(this, "KCP 카드즉시출금 결과", "re::RTREPaymentCommCrdResult_pop.xfdl", args, "modaless=false");
        }

        /***********************************************************************************
         * User Function
         ***********************************************************************************/
        this.fn_tabDataSetClear = function() {
        	this.ds_prdInfoCp.clearData();		/* 제품			*/
        	this.ds_etcPrdInfoCp.clearData();	/* 부가제품	*/
        	this.ds_installCp.clearData();		/* 설치내역	*/
        	this.ds_adviceCp.clearData();		/* 상담내역	*/
        	this.ds_messageCp.clearData();		/* SMS내역		*/
        }

        /***********************************************************************************
         * Component Event & Function
         ***********************************************************************************/
        /**
         * 고객조회 Onclick Event
         */
        this.btn_orderNo_onclick = function(obj,e) {
        	var args = {p_arg : this.p_arg};
        	
        	Ex.core.popup(this, "고객찾기", "comm::RTCOMMCust_pop.xfdl", args, "modaless=false");
        }

        /**
         * 차량정보변경 Onclick Event
         */
        // this.tab_info.tab_info1_contractInfo.btn_carInfoUpdate_onclick = function () {
        // 	var args = {p_arg : this.p_arg};
        // 	
        // 	Ex.core.popup(this, "차량정보변경", "comm::RTCOMMCarInfoUpdate.xfdl", args, "modaless=false");
        // }
        // 
        // /**
        //  *
        //  */
        // this.tab_info.tab_info1_contractInfo.FN_carInfoUpdate = function(ordNo) {
        // 	
        // }

        /**
         * tab_info Onchanged Event
         */
        this.tab_info_onchanged = function(obj,e) {
        	this.fn_tabDataSetClear();
        	
        	this.ordNo = nvl(this.ds_contractStatus.getColumn(this.nRow, "ordNo"));
        	
        	if(!Eco.isEmpty(this.ordNo)) {
        		if(e.postindex == 0) {
        			/* 고객정보 */
        			this.fn_listCustInfo();
        		} else if(e.postindex == 1) {
        			/* 계약정보 */
        			this.fn_listStatus2();
        		} else if(e.postindex == 2) {
        			/* 제품정보 */
        			this.fn_listPrdInfo();
        		} else if(e.postindex == 3) {
        			/* 부가제품정보 */
        			this.fn_listEtcPrdInfo();
        		} else if(e.postindex == 4) {
        			/* 설치정보 */
        			this.fn_advicelistInstall();
        		} else if(e.postindex == 5) {
        			/* 상담내역 */
        			this.fn_listAdvice();
        		} else if(e.postindex == 6) {
        			/* 수납이력 */
        			this.fn_getReceiptList();
        		} else if(e.postindex == 7) {
        			/* 서비스이력 */
        			this.fn_serviceHistory();
        		} else if(e.postindex == 8) {
        			/* 정기점검스케쥴 */
        			this.fn_listMain();
        		} else if(e.postindex == 9) {
        			/* SMS내역 */
        			this.fn_listmessage();
        		} else if(e.postindex == 10) {
        			/* 가계약정보 */
        			this.fn_listProvsn();
        		}
        	}
        }

        /**
         * 상담등록 Onclick Event
         */
        this.btn_orderNo00_onclick = function(obj,e) {
        	var args = {  p_arg	   : this.p_arg
        				, p_custNo : nvl(this.ed_custNo.value)
        				, p_custNm : nvl(this.ds_contractStatus.getColumn(0, "custNm"))
        			   };
        	
        	Ex.core.popup(this, "상담 등록", "cs::RTCSInboundAdviceRegister_pop.xfdl", args, "modaless=false, bLayered=false");
        }

        /**
         * 결제정보변경 Onclick Event
         */
        this.btn_orderNo01_onclick = function(obj,e) {
        	if(this.ds_contractStatus.getRowCount() == 0) {
        		this.alert("고객조회 후에 버튼을 클릭해 주세요.");
        		
        		return false;
        	}
        	var args = {  p_arg	   : this.p_arg
        				, p_custNo : nvl(this.ed_custNo.value)
        			   };	
        		
        	Ex.core.popup(this, "결제정보 변경", "re::RTREPayment_tab1.xfdl", args, "modaless=false");
        }

        /**
         * 연체금수납 Onclick Event
         */
        this.btn_orderNo02_onclick = function(obj,e) {
        	if(this.ds_contractStatus.getRowCount() == 0) {
        		this.alert("고객조회 후에 버튼을 클릭해 주세요.");
        		
        		return false;
        	}
        	
        	var args = {  p_arg	 : this.p_arg
        				, custNo : this.ed_custNo.value
        			   };
        	
        	Ex.core.popup(this, "연체금 수납", "re::RTREPaymentComm_tab1.xfdl", args, "modaless=false");
        }

        /**
         * 선납할인 Onclick Event
         */
        this.btn_orderNo03_onclick = function(obj,e) {
        	var ds = this.ds_contractStatus;
        	
        	if(ds.getRowCount() == 0) {
        		this.alert("고객조회 후에 버튼을 클릭해 주세요.");
        		
        		return false;
        	}
        	
        	var orderSt	  = ds.getColumn(this.nRow, "orderSt");
        	var orderStNm = ds.getColumn(this.nRow, "orderStNm");
        	
        	if(orderSt == "01" || orderSt == "02" || orderSt == "03") {
        		this.alert(orderStNm + " 계약건은 선납할인이 불가능 합니다.");
        		
        		return false;
        	}
        	
        	if(ds.getColumn(this.nRow, "mfpYn") == "Y") {
        		this.alert("선납할인이 가능하지 않습니다.");
        		
        		return false;
        	}
        	
        	var args = {  p_arg	  : this.p_arg
        				, p_ordNo : ds.getColumn(this.nRow, "ordNo")
        			   };
        	
        	Ex.core.popup(this, "선납 할인", "re::RTREPaymentComm_tab2.xfdl", args, "modaless=false");
        }

        /**
         * 중도완납/해지 Onclick Event
         */
        this.btn_orderNo04_onclick = function(obj,e) {
        	var ds = this.ds_contractStatus;

        	if(ds.getRowCount() == 0) {
        		this.alert("고객조회 후에 버튼을 클릭해 주세요.");
        		
        		return false;
        	}
        	
        	var orderSt	  = ds.getColumn(this.nRow, "orderSt");
        	var orderStNm = ds.getColumn(this.nRow, "orderStNm");
        	
        	if(orderSt == "01" || orderSt == "02" || orderSt == "03") {
        		this.alert(orderStNm + " 계약건은 중도완납이 불가능 합니다.");
        		
        		return false;
        	}
        	
        	if(ds.getColumn(this.nRow, "mfpYn") == "Y") {
        		this.alert("중도완납이 가능하지 않습니다.");
        		
        		return false;
        	}
        		var args = {  p_arg	  : this.p_arg
        					, p_ordNo : ds.getColumn(this.nRow, "ordNo")
        				   };
        	
        	Ex.core.popup(this, "중도완납", "re::RTREPaymentComm_tab3.xfdl", args, "modaless=false");
        }

        /**
         * 클레임등록 Onclick Event
         */
        this.btn_orderNo05_onclick = function(obj,e) {
        	var args = {  p_arg	   : this.p_arg
        				, p_custNo : this.ed_custNo.value
        			   };
        	
        	Ex.core.popup(this, "클레임 등록", "sd::RTSDClaimMgmt_pop.xfdl", args, "modaless=false");
        }

        this.ds_contractStatus_onrowposchanged = function(obj,e){
        	if(obj.getColumn(e.newrow, "statCd") == "04") {
        		//2019.05.15 채권매각대상은 수납금지
        		if(obj.getColumn(e.newrow, "mfpYn") != "D" || this.userId == "kstka"){
        			this.btn_orderNo02.set_enable(true);	/* 연체금수납		*/		
        			this.btn_orderNo03.set_enable(true);	/* 선납할인		*/
        			this.btn_orderNo04.set_enable(true);	/* 중도완납/ 해지	*/
        		}else{
        			this.btn_orderNo02.set_enable(false);	/* 연체금수납		*/		
        			this.btn_orderNo03.set_enable(false);	/* 선납할인		*/
        			this.btn_orderNo04.set_enable(false);	/* 중도완납/ 해지	*/
        		}
        	} else {
        		this.btn_orderNo02.set_enable(false);
        		this.btn_orderNo03.set_enable(false);
        		this.btn_orderNo04.set_enable(false);
        	}
        	
        	this.nRow  = e.newrow;
        	this.ordNo = obj.getColumn(e.newrow, "ordNo");
        	
        	if(this.tab_info.tabindex == 0) {
        		/* 고객정보 */
        		this.fn_listCustInfo();
        	} else if(this.tab_info.tabindex == 1) {
        		/* 계약정보 */
        		this.fn_listStatus2();
        	} else if(this.tab_info.tabindex == 2) {
        		/* 제품정보 */
        		this.fn_listPrdInfo();
        	} else if(this.tab_info.tabindex == 3) {
        		/* 부가제품정보 */
        		this.fn_listEtcPrdInfo();
        	} else if(this.tab_info.tabindex == 4) {
        		/* 설치정보 */
        		this.fn_advicelistInstall();
        	} else if(this.tab_info.tabindex == 5) {
        		/* 상담내역 */
        		this.fn_listAdvice();
        	} else if(this.tab_info.tabindex == 6) {
        		/* 수납이력 */
        		this.fn_getReceiptList();
        	} else if(this.tab_info.tabindex == 7) {
        		/* 서비스이력 */
        		this.fn_serviceHistory();
        	} else if(this.tab_info.tabindex == 8) {
        		/* 정기점검스케쥴 */
        		this.fn_listMain();
        	} else if(this.tab_info.tabindex == 9) {
        		/* SMS내역 */
        		this.fn_listmessage();
        	} else if(this.tab_info.tabindex == 10) {
        		/* 가계약정보 */
        		this.fn_listProvsn();
        	}
        }

        //계약서 알림톡 발송
        this.btn_kakao_onclick = function(obj,e)
        {
        	if(this.ds_contractStatus.rowcount == 0) {
        		alert("발송계약이 존재하지 않습니다."); 
        		return;
        	}
        	
        	var nRow = this.ds_contractStatus.rowposition;
        	
        	var sSvcID        	= "tabInfo9EleSigEmail";                    
        	var sController   	= "rtms/sd/tabInfo9EleSigEmail.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("ordFDay", 		this.ds_contractStatus.getColumn(nRow, "ordDay"));
        	sArgs += Ex.util.setParam("ordEDay", 		this.ds_contractStatus.getColumn(nRow, "ordDay"));
        	sArgs += Ex.util.setParam("id", 			this.ds_contractStatus.getColumn(nRow, "agencyCd"));
        	sArgs += Ex.util.setParam("custNm", 		this.ds_contractStatus.getColumn(nRow, "custNm"));
        	sArgs += Ex.util.setParam("birthDay", 		this.ds_contractStatus.getColumn(nRow, "birthDay"));
        	sArgs += Ex.util.setParam("mobNo", 		    this.ds_contractStatus.getColumn(nRow, "mobNo"));
        	sArgs += Ex.util.setParam("useType", 		"02"); //계약서 발송 유형 (01:최초발송, 02:재발송)
        	sArgs += Ex.util.setParam("ordNo", 		    this.ds_contractStatus.getColumn(nRow, "ordNo"));
        	sArgs += Ex.util.setParam("sheetId", 		"02");
        	sArgs += Ex.util.setParam("fileName", 		"");

        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
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
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.ds_contractStatus.addEventHandler("onrowposchanged", this.ds_contractStatus_onrowposchanged, this);
            this.ds_etcPrdInfoCp.addEventHandler("oncolumnchanged", this.dsPrice_oncolumnchanged, this);
            this.ds_messageCp.addEventHandler("oncolumnchanged", this.dsPrice_oncolumnchanged, this);
            this.ds_provsnListCp.addEventHandler("canrowposchange", this.ds_provsnList_canrowposchange, this);
            this.ds_contract.addEventHandler("onrowsetchanged", this.ds_abc_onrowsetchanged, this);
            this.addEventHandler("onload", this.RTCSAdviceStatus_onload, this);
            this.ed_custNo.addEventHandler("onkeyup", this.ed_ordNo_onkeyup, this);
            this.btn_orderNo.addEventHandler("onclick", this.btn_orderNo_onclick, this);
            this.tab_info.addEventHandler("onchanged", this.tab_info_onchanged, this);
            this.btn_orderNo00.addEventHandler("onclick", this.btn_orderNo00_onclick, this);
            this.btn_orderNo01.addEventHandler("onclick", this.btn_orderNo01_onclick, this);
            this.btn_orderNo02.addEventHandler("onclick", this.btn_orderNo02_onclick, this);
            this.btn_orderNo03.addEventHandler("onclick", this.btn_orderNo03_onclick, this);
            this.btn_orderNo04.addEventHandler("onclick", this.btn_orderNo04_onclick, this);
            this.btn_orderNo05.addEventHandler("onclick", this.btn_orderNo05_onclick, this);
            this.btn_kakao.addEventHandler("onclick", this.btn_kakao_onclick, this);

        };

        this.loadIncludeScript("RTCSAdviceStatus.xfdl");
        this.loadPreloadList();
       
    };
}
)();
