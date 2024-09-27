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
                this.set_name("RTSDContractRegister");
                this.set_classname("RTSDOrderRegister");
                this.set_scrollbars("autoboth");
                this.set_titletext("계약등록");
                this._setFormPosition(0,0,1147,1582);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
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

            obj = new Dataset("ds_payMthd", this);
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

            obj = new Dataset("ds_payCustTp", this);
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

            obj = new Dataset("ds_B_bank", this);
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

            obj = new Dataset("ds_C_bank", this);
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

            obj = new Dataset("ds_B_bankPayDay", this);
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

            obj = new Dataset("ds_C_bankPayDay", this);
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

            obj = new Dataset("ds_credit", this);
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

            obj = new Dataset("ds_conMthd", this);
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

            obj = new Dataset("ds_maker", this);
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

            obj = new Dataset("ds_sale", this);
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

            obj = new Dataset("ds_orgAgent", this);
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

            obj = new Dataset("ds_orgAgent2", this);
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

            obj = new Dataset("ds_model", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"rn\" type=\"STRING\" size=\"256\"/><Column id=\"makerCd\" type=\"STRING\" size=\"256\"/><Column id=\"modelCd\" type=\"STRING\" size=\"256\"/><Column id=\"modelNm\" type=\"STRING\" size=\"256\"/><Column id=\"contentsCd\" type=\"STRING\" size=\"256\"/><Column id=\"conTentsNm\" type=\"STRING\" size=\"256\"/><Column id=\"frCd\" type=\"STRING\" size=\"256\"/><Column id=\"mcNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_rtsd0100", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custTp\" type=\"STRING\" size=\"256\"/><Column id=\"custTp2\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"birthDay\" type=\"STRING\" size=\"256\"/><Column id=\"genderCd\" type=\"STRING\" size=\"256\"/><Column id=\"lfCd\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"mobFirm\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"faxNo\" type=\"STRING\" size=\"256\"/><Column id=\"bldMngNo\" type=\"STRING\" size=\"256\"/><Column id=\"posCd\" type=\"STRING\" size=\"256\"/><Column id=\"addr1\" type=\"STRING\" size=\"256\"/><Column id=\"addr2\" type=\"STRING\" size=\"256\"/><Column id=\"addr\" type=\"STRING\" size=\"256\"/><Column id=\"addrSum1\" type=\"STRING\" size=\"256\"/><Column id=\"addrSum2\" type=\"STRING\" size=\"256\"/><Column id=\"telNo2\" type=\"STRING\" size=\"256\"/><Column id=\"bldMngNo2\" type=\"STRING\" size=\"256\"/><Column id=\"posCd2\" type=\"STRING\" size=\"256\"/><Column id=\"addr12\" type=\"STRING\" size=\"256\"/><Column id=\"addr22\" type=\"STRING\" size=\"256\"/><Column id=\"safekey\" type=\"STRING\" size=\"256\"/><Column id=\"buslNo\" type=\"STRING\" size=\"256\"/><Column id=\"corpNo\" type=\"STRING\" size=\"256\"/><Column id=\"repNm\" type=\"STRING\" size=\"256\"/><Column id=\"oCustnm\" type=\"STRING\" size=\"256\"/><Column id=\"oBirthday\" type=\"STRING\" size=\"256\"/><Column id=\"oGendercd\" type=\"STRING\" size=\"256\"/><Column id=\"oLfcd\" type=\"STRING\" size=\"256\"/><Column id=\"oMobno\" type=\"STRING\" size=\"256\"/><Column id=\"oSafekey\" type=\"STRING\" size=\"256\"/><Column id=\"cCustnm\" type=\"STRING\" size=\"256\"/><Column id=\"cTelno\" type=\"STRING\" size=\"256\"/><Column id=\"emailAddr\" type=\"STRING\" size=\"256\"/><Column id=\"emailAddr1\" type=\"STRING\" size=\"256\"/><Column id=\"emailAddr2\" type=\"STRING\" size=\"256\"/><Column id=\"busiType\" type=\"STRING\" size=\"256\"/><Column id=\"busiCond\" type=\"STRING\" size=\"256\"/><Column id=\"taxYn\" type=\"STRING\" size=\"256\"/><Column id=\"kunnr\" type=\"STRING\" size=\"256\"/><Column id=\"ciCd\" type=\"STRING\" size=\"256\"/><Column id=\"diCd\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
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

            obj = new Dataset("ds_rtsd0104", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"ordDay\" type=\"STRING\" size=\"256\"/><Column id=\"ordId\" type=\"STRING\" size=\"256\"/><Column id=\"chanCd\" type=\"STRING\" size=\"256\"/><Column id=\"saleId\" type=\"STRING\" size=\"256\"/><Column id=\"periodCd\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"regiCd\" type=\"STRING\" size=\"256\"/><Column id=\"campYn\" type=\"STRING\" size=\"256\"/><Column id=\"cDcrate\" type=\"STRING\" size=\"256\"/><Column id=\"cDcamt\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custTp\" type=\"STRING\" size=\"256\"/><Column id=\"safekey\" type=\"STRING\" size=\"256\"/><Column id=\"grpYn\" type=\"STRING\" size=\"256\"/><Column id=\"grpNo\" type=\"STRING\" size=\"256\"/><Column id=\"gDcrate\" type=\"STRING\" size=\"256\"/><Column id=\"gDcamt\" type=\"STRING\" size=\"256\"/><Column id=\"lDcrate\" type=\"STRING\" size=\"256\"/><Column id=\"lDcamt\" type=\"STRING\" size=\"256\"/><Column id=\"fDcrate\" type=\"STRING\" size=\"256\"/><Column id=\"fDcamt\" type=\"STRING\" size=\"256\"/><Column id=\"bordNo\" type=\"STRING\" size=\"256\"/><Column id=\"statCd\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"cancDay\" type=\"STRING\" size=\"256\"/><Column id=\"agencyCd\" type=\"STRING\" size=\"256\"/><Column id=\"salesGroup\" type=\"STRING\" size=\"256\"/><Column id=\"salesOffice\" type=\"STRING\" size=\"256\"/><Column id=\"engNm\" type=\"STRING\" size=\"256\"/><Column id=\"agDesc\" type=\"STRING\" size=\"256\"/><Column id=\"makerCd\" type=\"STRING\" size=\"256\"/><Column id=\"modelCd\" type=\"STRING\" size=\"256\"/><Column id=\"contentsCd\" type=\"STRING\" size=\"256\"/><Column id=\"frCd\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"carOwner\" type=\"STRING\" size=\"256\"/><Column id=\"cMileage\" type=\"STRING\" size=\"256\"/><Column id=\"reqText\" type=\"STRING\" size=\"256\"/><Column id=\"payMthd\" type=\"STRING\" size=\"256\"/><Column id=\"payDd\" type=\"STRING\" size=\"256\"/><Column id=\"accSeq\" type=\"STRING\" size=\"256\"/><Column id=\"crdSeq\" type=\"STRING\" size=\"256\"/><Column id=\"accChk\" type=\"STRING\" size=\"256\"/><Column id=\"accStat\" type=\"STRING\" size=\"256\"/><Column id=\"bkeyChk\" type=\"STRING\" size=\"256\"/><Column id=\"batchKey\" type=\"STRING\" size=\"256\"/><Column id=\"billYn\" type=\"STRING\" size=\"256\"/><Column id=\"crdtStat\" type=\"STRING\" size=\"256\"/><Column id=\"certCd\" type=\"STRING\" size=\"256\"/><Column id=\"certStat\" type=\"STRING\" size=\"256\"/><Column id=\"ordAgent\" type=\"STRING\" size=\"256\"/><Column id=\"orgCd\" type=\"STRING\" size=\"256\"/><Column id=\"orgHq\" type=\"STRING\" size=\"256\"/><Column id=\"orgL1\" type=\"STRING\" size=\"256\"/><Column id=\"orgL2\" type=\"STRING\" size=\"256\"/><Column id=\"orgL3\" type=\"STRING\" size=\"256\"/><Column id=\"orgL4\" type=\"STRING\" size=\"256\"/><Column id=\"insOrg\" type=\"STRING\" size=\"256\"/><Column id=\"psCd\" type=\"STRING\" size=\"256\"/><Column id=\"cmsagYn\" type=\"STRING\" size=\"256\"/><Column id=\"conMthd\" type=\"STRING\" size=\"256\"/><Column id=\"pcertYn\" type=\"STRING\" size=\"256\"/><Column id=\"tcgrpNo\" type=\"STRING\" size=\"256\"/><Column id=\"vbeln\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/><Column id=\"agencyNm\" type=\"STRING\" size=\"256\"/><Column id=\"fcDay\" type=\"STRING\" size=\"256\"/><Column id=\"agDay\" type=\"STRING\" size=\"256\"/><Column id=\"agSeq\" type=\"STRING\" size=\"256\"/><Column id=\"inputDt\" type=\"STRING\" size=\"256\"/><Column id=\"filePath\" type=\"STRING\" size=\"256\"/><Column id=\"fileName\" type=\"STRING\" size=\"256\"/><Column id=\"seasonCd\" type=\"STRING\" size=\"256\"/><Column id=\"statNm\" type=\"STRING\" size=\"256\"/><Column id=\"saleCd\" type=\"STRING\" size=\"256\"/><Column id=\"saleNm\" type=\"STRING\" size=\"256\"/><Column id=\"prdtGrp\" type=\"STRING\" size=\"256\"/><Column id=\"prdtGrpNm\" type=\"STRING\" size=\"256\"/><Column id=\"chanCode\" type=\"STRING\" size=\"256\"/><Column id=\"chanNm\" type=\"STRING\" size=\"256\"/><Column id=\"hshopGb\" type=\"STRING\" size=\"256\"/><Column id=\"hshopGbNm\" type=\"STRING\" size=\"256\"/><Column id=\"payGb\" type=\"STRING\" size=\"256\"/><Column id=\"regiAmt\" type=\"STRING\" size=\"256\"/><Column id=\"sumMonAmt\" type=\"STRING\" size=\"256\"/><Column id=\"monAmt\" type=\"STRING\" size=\"256\"/><Column id=\"prdtGrpDtl\" type=\"STRING\" size=\"256\"/><Column id=\"instCd\" type=\"STRING\" size=\"256\"/><Column id=\"instTm\" type=\"STRING\" size=\"256\"/><Column id=\"inst1Poscd\" type=\"STRING\" size=\"256\"/><Column id=\"inst1Addr1\" type=\"STRING\" size=\"256\"/><Column id=\"inst1Addr2\" type=\"STRING\" size=\"256\"/><Column id=\"inst2Poscd\" type=\"STRING\" size=\"256\"/><Column id=\"inst2Addr1\" type=\"STRING\" size=\"256\"/><Column id=\"inst2Addr2\" type=\"STRING\" size=\"256\"/><Column id=\"tmsOrderId\" type=\"STRING\" size=\"256\"/><Column id=\"outStockYn\" type=\"STRING\" size=\"256\"/><Column id=\"outStockType\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_rtsd0106", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"seq\" type=\"STRING\" size=\"256\"/><Column id=\"ordId\" type=\"STRING\" size=\"256\"/><Column id=\"periodCd\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"regiCd\" type=\"STRING\" size=\"256\"/><Column id=\"frCd\" type=\"STRING\" size=\"256\"/><Column id=\"lrCd\" type=\"STRING\" size=\"256\"/><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"ordQty\" type=\"STRING\" size=\"256\"/><Column id=\"regiAmt\" type=\"STRING\" size=\"256\"/><Column id=\"rentAmt\" type=\"STRING\" size=\"256\"/><Column id=\"rentpAmt\" type=\"STRING\" size=\"256\"/><Column id=\"fDcrate\" type=\"STRING\" size=\"256\"/><Column id=\"fDcamt\" type=\"STRING\" size=\"256\"/><Column id=\"monDcamt\" type=\"STRING\" size=\"256\"/><Column id=\"monAmt\" type=\"STRING\" size=\"256\"/><Column id=\"planDay\" type=\"STRING\" size=\"256\"/><Column id=\"planTm\" type=\"STRING\" size=\"256\"/><Column id=\"instDay\" type=\"STRING\" size=\"256\"/><Column id=\"instTm\" type=\"STRING\" size=\"256\"/><Column id=\"instYn\" type=\"STRING\" size=\"256\"/><Column id=\"valYn\" type=\"STRING\" size=\"256\"/><Column id=\"equNo\" type=\"STRING\" size=\"256\"/><Column id=\"osId\" type=\"STRING\" size=\"256\"/><Column id=\"osDay\" type=\"STRING\" size=\"256\"/><Column id=\"statCd\" type=\"STRING\" size=\"256\"/><Column id=\"flYn\" type=\"STRING\" size=\"256\"/><Column id=\"frYn\" type=\"STRING\" size=\"256\"/><Column id=\"rlYn\" type=\"STRING\" size=\"256\"/><Column id=\"rrYn\" type=\"STRING\" size=\"256\"/><Column id=\"matDesc\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_price", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"petternCd\" type=\"STRING\" size=\"256\"/><Column id=\"sectionWidth\" type=\"STRING\" size=\"256\"/><Column id=\"aspectRatio\" type=\"STRING\" size=\"256\"/><Column id=\"wheelInches\" type=\"STRING\" size=\"256\"/><Column id=\"plyRating\" type=\"STRING\" size=\"256\"/><Column id=\"demendQty\" type=\"STRING\" size=\"256\"/><Column id=\"pgCd\" type=\"STRING\" size=\"256\"/><Column id=\"seasonCd\" type=\"STRING\" size=\"256\"/><Column id=\"seasonNm\" type=\"STRING\" size=\"256\"/><Column id=\"frCd\" type=\"STRING\" size=\"256\"/><Column id=\"contentsCd\" type=\"STRING\" size=\"256\"/><Column id=\"modelCd\" type=\"STRING\" size=\"256\"/><Column id=\"wheelQty\" type=\"STRING\" size=\"256\"/><Column id=\"wheelLimitQty\" type=\"STRING\" size=\"256\"/><Column id=\"classCd\" type=\"STRING\" size=\"256\"/><Column id=\"makerCd\" type=\"STRING\" size=\"256\"/><Column id=\"seq\" type=\"STRING\" size=\"256\"/><Column id=\"endDay\" type=\"STRING\" size=\"256\"/><Column id=\"strDay\" type=\"STRING\" size=\"256\"/><Column id=\"regiCd\" type=\"STRING\" size=\"256\"/><Column id=\"regiAmt\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"ordQty\" type=\"STRING\" size=\"256\"/><Column id=\"periodCd\" type=\"STRING\" size=\"256\"/><Column id=\"priceCd\" type=\"STRING\" size=\"256\"/><Column id=\"rentAmt\" type=\"STRING\" size=\"256\"/><Column id=\"cDcamt\" type=\"STRING\" size=\"256\"/><Column id=\"campYn\" type=\"STRING\" size=\"256\"/><Column id=\"gDcrate\" type=\"STRING\" size=\"256\"/><Column id=\"gDcamt\" type=\"STRING\" size=\"256\"/><Column id=\"lDcrate\" type=\"STRING\" size=\"256\"/><Column id=\"lDcamt\" type=\"STRING\" size=\"256\"/><Column id=\"fDcamt\" type=\"STRING\" size=\"256\"/><Column id=\"monAmt\" type=\"STRING\" size=\"256\"/><Column id=\"matDesc\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_rateAmt", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cDcamt\" type=\"STRING\" size=\"256\"/><Column id=\"campYn\" type=\"STRING\" size=\"256\"/><Column id=\"gDcrate\" type=\"STRING\" size=\"256\"/><Column id=\"gDcamt\" type=\"STRING\" size=\"256\"/><Column id=\"lDcrate\" type=\"STRING\" size=\"256\"/><Column id=\"lDcamt\" type=\"STRING\" size=\"256\"/><Column id=\"fDcamt\" type=\"STRING\" size=\"256\"/><Column id=\"monAmt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_rtre0010", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"accSeq\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"custTp\" type=\"STRING\" size=\"256\"/><Column id=\"ebirDay\" type=\"STRING\" size=\"256\"/><Column id=\"buslNo\" type=\"STRING\" size=\"256\"/><Column id=\"bankCd\" type=\"STRING\" size=\"256\"/><Column id=\"acctNo\" type=\"STRING\" size=\"256\"/><Column id=\"accChk\" type=\"STRING\" size=\"256\"/><Column id=\"acncId\" type=\"STRING\" size=\"256\"/><Column id=\"acncDesc\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"payMthd\" type=\"STRING\" size=\"256\"/><Column id=\"expireY\" type=\"STRING\" size=\"256\"/><Column id=\"expireM\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_rtre0020", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"crdSeq\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"custTp\" type=\"STRING\" size=\"256\"/><Column id=\"ebirDay\" type=\"STRING\" size=\"256\"/><Column id=\"buslNo\" type=\"STRING\" size=\"256\"/><Column id=\"cardcomCd\" type=\"STRING\" size=\"256\"/><Column id=\"cardNo\" type=\"STRING\" size=\"256\"/><Column id=\"expireYm\" type=\"STRING\" size=\"256\"/><Column id=\"bkeyChk\" type=\"STRING\" size=\"256\"/><Column id=\"batchKey\" type=\"STRING\" size=\"256\"/><Column id=\"acncId\" type=\"STRING\" size=\"256\"/><Column id=\"acncDesc\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"Column0\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"payMthd\" type=\"STRING\" size=\"256\"/><Column id=\"expireY\" type=\"STRING\" size=\"256\"/><Column id=\"expireM\" type=\"STRING\" size=\"256\"/><Column id=\"returnCode\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_rtsd0013", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"psCd\" type=\"STRING\" size=\"256\"/><Column id=\"psNm\" type=\"STRING\" size=\"256\"/><Column id=\"seq\" type=\"STRING\" size=\"256\"/><Column id=\"strDay\" type=\"STRING\" size=\"256\"/><Column id=\"endDay\" type=\"STRING\" size=\"256\"/><Column id=\"seasonCd\" type=\"STRING\" size=\"256\"/><Column id=\"seasonNm\" type=\"STRING\" size=\"256\"/><Column id=\"prsDcd\" type=\"STRING\" size=\"256\"/><Column id=\"prsNm\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"cntNm\" type=\"STRING\" size=\"256\"/><Column id=\"servVnt\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"servCnt0\" type=\"STRING\" size=\"256\"/><Column id=\"servCntr\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"servAmt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_rtsd0014", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"dcTp\" type=\"STRING\" size=\"256\"/><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"seq\" type=\"STRING\" size=\"256\"/><Column id=\"dcRate\" type=\"STRING\" size=\"256\"/><Column id=\"dcAmt\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsNice", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cdLevel\" type=\"string\" size=\"32\"/><Column id=\"chgDt\" type=\"string\" size=\"32\"/><Column id=\"seq\" type=\"bigdecimal\" size=\"16\"/><Column id=\"chgId\" type=\"string\" size=\"32\"/><Column id=\"regDt\" type=\"string\" size=\"32\"/><Column id=\"crGrade\" type=\"bigdecimal\" size=\"16\"/><Column id=\"creDay\" type=\"string\" size=\"32\"/><Column id=\"regId\" type=\"string\" size=\"32\"/><Column id=\"safekey\" type=\"string\" size=\"32\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsNice2", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cdLevel\" type=\"string\" size=\"32\"/><Column id=\"returnCode\" type=\"string\" size=\"32\"/><Column id=\"trustLevel\" type=\"string\" size=\"32\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsBis", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsBis2", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
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
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"res_cd\" type=\"STRING\" size=\"256\"/><Column id=\"res_msg\" type=\"STRING\" size=\"256\"/><Column id=\"group_id\" type=\"STRING\" size=\"256\"/><Column id=\"cardcomCd\" type=\"STRING\" size=\"256\"/><Column id=\"returnCode\" type=\"STRING\" size=\"256\"/><Column id=\"batchKey\" type=\"STRING\" size=\"256\"/><Column id=\"pay_type\" type=\"STRING\" size=\"256\"/><Column id=\"pay_id\" type=\"STRING\" size=\"256\"/><Column id=\"pay_cert_no\" type=\"STRING\" size=\"256\"/><Column id=\"pay_issue_cd\" type=\"STRING\" size=\"256\"/><Column id=\"pay_issue_nm\" type=\"STRING\" size=\"256\"/><Column id=\"ccertDay\" type=\"STRING\" size=\"256\"/><Column id=\"ccertSeq\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_rtsd0113", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/><Column id=\"tel\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_rtsd0113Combo", this);
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

            obj = new Dataset("ds_rtsd0205", this);
            obj._setContents("<ColumnInfo><Column id=\"chanCd\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"smsMsg\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_rtsd0115", this);
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_reRental", this);
            obj._setContents("<ColumnInfo><Column id=\"COL1\" type=\"STRING\" size=\"256\"/><Column id=\"COL2\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_saleItemList", this);
            obj._setContents("<ColumnInfo><Column id=\"saleCd\" type=\"STRING\" size=\"256\"/><Column id=\"saleNm\" type=\"STRING\" size=\"256\"/><Column id=\"saleStrDay\" type=\"STRING\" size=\"256\"/><Column id=\"saleEndDay\" type=\"STRING\" size=\"256\"/><Column id=\"chanCd\" type=\"STRING\" size=\"256\"/><Column id=\"chanNm\" type=\"STRING\" size=\"256\"/><Column id=\"hshopGb\" type=\"STRING\" size=\"256\"/><Column id=\"hshopGbNm\" type=\"STRING\" size=\"256\"/><Column id=\"dcRate\" type=\"STRING\" size=\"256\"/><Column id=\"dcAmt\" type=\"STRING\" size=\"256\"/><Column id=\"prdtGrp\" type=\"STRING\" size=\"256\"/><Column id=\"prdtGrpNm\" type=\"STRING\" size=\"256\"/><Column id=\"pkgDcYn\" type=\"STRING\" size=\"256\"/><Column id=\"preDcYn\" type=\"STRING\" size=\"256\"/><Column id=\"fpayYn\" type=\"STRING\" size=\"256\"/><Column id=\"fpayYnNm\" type=\"STRING\" size=\"256\"/><Column id=\"regiCalGb\" type=\"STRING\" size=\"256\"/><Column id=\"regiCalGbNm\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"grpSaleGb\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"grpSaleGbNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_productInfo", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"ordId\" type=\"STRING\" size=\"256\"/><Column id=\"seq\" type=\"STRING\" size=\"256\"/><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"periodCd\" type=\"STRING\" size=\"256\"/><Column id=\"periodNm\" type=\"STRING\" size=\"256\"/><Column id=\"seasonCd\" type=\"STRING\" size=\"256\"/><Column id=\"seasonNm\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"cntNm\" type=\"STRING\" size=\"256\"/><Column id=\"regiCd\" type=\"STRING\" size=\"256\"/><Column id=\"rentAmt\" type=\"STRING\" size=\"256\"/><Column id=\"chnlSale\" type=\"STRING\" size=\"256\"/><Column id=\"groupSale\" type=\"STRING\" size=\"256\"/><Column id=\"reRentalSaleAmt\" type=\"STRING\" size=\"256\"/><Column id=\"employeeSaleAmt\" type=\"STRING\" size=\"256\"/><Column id=\"regiAmt\" type=\"STRING\" size=\"256\"/><Column id=\"chk\" type=\"STRING\" size=\"256\"/><Column id=\"frCd\" type=\"STRING\" size=\"256\"/><Column id=\"lrCd\" type=\"STRING\" size=\"256\"/><Column id=\"ordQty\" type=\"STRING\" size=\"256\"/><Column id=\"rentpAmt\" type=\"STRING\" size=\"256\"/><Column id=\"fDcrate\" type=\"STRING\" size=\"256\"/><Column id=\"fDcamt\" type=\"STRING\" size=\"256\"/><Column id=\"monDcamt\" type=\"STRING\" size=\"256\"/><Column id=\"monAmt\" type=\"STRING\" size=\"256\"/><Column id=\"planDay\" type=\"STRING\" size=\"256\"/><Column id=\"planTm\" type=\"STRING\" size=\"256\"/><Column id=\"instDay\" type=\"STRING\" size=\"256\"/><Column id=\"instTm\" type=\"STRING\" size=\"256\"/><Column id=\"instYn\" type=\"STRING\" size=\"256\"/><Column id=\"valYn\" type=\"STRING\" size=\"256\"/><Column id=\"equNo\" type=\"STRING\" size=\"256\"/><Column id=\"osId\" type=\"STRING\" size=\"256\"/><Column id=\"osDay\" type=\"STRING\" size=\"256\"/><Column id=\"statCd\" type=\"STRING\" size=\"256\"/><Column id=\"flYn\" type=\"STRING\" size=\"256\"/><Column id=\"frYn\" type=\"STRING\" size=\"256\"/><Column id=\"rlYn\" type=\"STRING\" size=\"256\"/><Column id=\"rrYn\" type=\"STRING\" size=\"256\"/><Column id=\"matDesc\" type=\"STRING\" size=\"256\"/><Column id=\"saleCd\" type=\"STRING\" size=\"256\"/><Column id=\"gdsGb\" type=\"STRING\" size=\"256\"/><Column id=\"gdsGrp\" type=\"STRING\" size=\"256\"/><Column id=\"prsPk\" type=\"STRING\" size=\"256\"/><Column id=\"saleGdsCd\" type=\"STRING\" size=\"256\"/><Column id=\"standard\" type=\"STRING\" size=\"256\"/><Column id=\"amt\" type=\"STRING\" size=\"256\"/><Column id=\"frNm\" type=\"STRING\" size=\"256\"/><Column id=\"matCdS\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_ValuePrdtInfo", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"chk\" type=\"STRING\" size=\"256\"/><Column id=\"addGdsCd\" type=\"STRING\" size=\"256\"/><Column id=\"addGdsNm\" type=\"STRING\" size=\"256\"/><Column id=\"amt\" type=\"STRING\" size=\"256\"/><Column id=\"dcAmt\" type=\"STRING\" size=\"256\"/><Column id=\"actAmt\" type=\"STRING\" size=\"256\"/><Column id=\"dcYn\" type=\"STRING\" size=\"256\"/><Column id=\"monAmt\" type=\"STRING\" size=\"256\"/><Column id=\"makerNm\" type=\"STRING\" size=\"256\"/><Column id=\"gdsGrp\" type=\"STRING\" size=\"256\"/><Column id=\"gdsDesc\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("comGrp", this);
            obj._setContents("<ColumnInfo><Column id=\"cdDesc\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/><Column id=\"cd\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_dcYn", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cd\">Y</Col><Col id=\"cdNm\">할부</Col></Row><Row><Col id=\"cd\">N</Col><Col id=\"cdNm\">할부불가</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_seviceCd", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"saleCd\" type=\"STRING\" size=\"256\"/><Column id=\"prsDcd\" type=\"STRING\" size=\"256\"/><Column id=\"prsNm\" type=\"STRING\" size=\"256\"/><Column id=\"servAmt\" type=\"STRING\" size=\"256\"/><Column id=\"servInfAmt\" type=\"STRING\" size=\"256\"/><Column id=\"periodCd\" type=\"STRING\" size=\"256\"/><Column id=\"periodNm\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"cntNm\" type=\"STRING\" size=\"256\"/><Column id=\"servCnt\" type=\"STRING\" size=\"256\"/><Column id=\"servAmtSum\" type=\"STRING\" size=\"256\"/><Column id=\"servAmtSumOrg\" type=\"STRING\" size=\"256\"/><Column id=\"servCntOrg\" type=\"STRING\" size=\"256\"/><Column id=\"servInfYN\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"psCd\" type=\"STRING\" size=\"256\"/><Column id=\"servCnt0\" type=\"STRING\" size=\"256\"/><Column id=\"servCntr\" type=\"STRING\" size=\"256\"/><Column id=\"prsPk\" type=\"STRING\" size=\"256\"/><Column id=\"servAmt1\" type=\"STRING\" size=\"256\"/><Column id=\"servAmt2\" type=\"STRING\" size=\"256\"/><Column id=\"servAmt3\" type=\"STRING\" size=\"256\"/><Column id=\"servAmt4\" type=\"STRING\" size=\"256\"/><Column id=\"servAmt5\" type=\"STRING\" size=\"256\"/><Column id=\"servAmt6\" type=\"STRING\" size=\"256\"/><Column id=\"servAmt7\" type=\"STRING\" size=\"256\"/><Column id=\"servAmt8\" type=\"STRING\" size=\"256\"/><Column id=\"servAmt9\" type=\"STRING\" size=\"256\"/><Column id=\"servAmt10\" type=\"STRING\" size=\"256\"/><Column id=\"servAmt12\" type=\"STRING\" size=\"256\"/><Column id=\"servAmt18\" type=\"STRING\" size=\"256\"/><Column id=\"servAmt24\" type=\"STRING\" size=\"256\"/><Column id=\"servCntTemp\" type=\"STRING\" size=\"256\"/><Column id=\"saleAmt\" type=\"STRING\" size=\"256\"/><Column id=\"dcRate\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_contactDeliInfo", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"periodCd\" type=\"STRING\" size=\"256\"/><Column id=\"periodNm\" type=\"STRING\" size=\"256\"/><Column id=\"amt\" type=\"INT\" size=\"256\" prop=\"SUM\"/><Column id=\"rentAmt\" type=\"INT\" size=\"256\" prop=\"SUM\"/><Column id=\"regiAmt\" type=\"INT\" size=\"256\" prop=\"SUM\"/><Column id=\"dcAmt\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"prsPk\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_sumPayInfo", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"regiAmt\" type=\"STRING\" size=\"256\"/><Column id=\"regiAmtChg\" type=\"STRING\" size=\"256\"/><Column id=\"amt\" type=\"STRING\" size=\"256\"/><Column id=\"rentAmt\" type=\"STRING\" size=\"256\"/><Column id=\"sumSaleAmt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_RegAmtMgnt", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cd\">0</Col><Col id=\"cdNm\">0</Col></Row><Row><Col id=\"cd\">1</Col><Col id=\"cdNm\">1</Col></Row><Row><Col id=\"cd\">2</Col><Col id=\"cdNm\">2</Col></Row><Row><Col id=\"cd\">3</Col><Col id=\"cdNm\">3</Col></Row><Row><Col id=\"cd\">4</Col><Col id=\"cdNm\">4</Col></Row><Row><Col id=\"cd\">5</Col><Col id=\"cdNm\">5</Col></Row><Row><Col id=\"cd\">6</Col><Col id=\"cdNm\">6</Col></Row><Row><Col id=\"cd\">7</Col><Col id=\"cdNm\">7</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_svrCnt", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cd\">0</Col><Col id=\"cdNm\">0회</Col></Row><Row><Col id=\"cd\">1</Col><Col id=\"cdNm\">1회</Col></Row><Row><Col id=\"cd\">2</Col><Col id=\"cdNm\">2회</Col></Row><Row><Col id=\"cd\">3</Col><Col id=\"cdNm\">3회</Col></Row><Row><Col id=\"cd\">4</Col><Col id=\"cdNm\">4회</Col></Row><Row><Col id=\"cd\">5</Col><Col id=\"cdNm\">5회</Col></Row><Row><Col id=\"cd\">6</Col><Col id=\"cdNm\">6회</Col></Row><Row><Col id=\"cd\">7</Col><Col id=\"cdNm\">7회</Col></Row><Row><Col id=\"cd\">8</Col><Col id=\"cdNm\">8회</Col></Row><Row><Col id=\"cd\">9</Col><Col id=\"cdNm\">9회</Col></Row><Row><Col id=\"cd\">10</Col><Col id=\"cdNm\">10회</Col></Row><Row><Col id=\"cd\">11</Col><Col id=\"cdNm\">11회</Col></Row><Row><Col id=\"cd\">12</Col><Col id=\"cdNm\">12회</Col></Row><Row><Col id=\"cd\">13</Col><Col id=\"cdNm\">13회</Col></Row><Row><Col id=\"cd\">14</Col><Col id=\"cdNm\">14회</Col></Row><Row><Col id=\"cd\">15</Col><Col id=\"cdNm\">15회</Col></Row><Row><Col id=\"cd\">16</Col><Col id=\"cdNm\">16회</Col></Row><Row><Col id=\"cd\">17</Col><Col id=\"cdNm\">17회</Col></Row><Row><Col id=\"cd\">18</Col><Col id=\"cdNm\">18회</Col></Row><Row><Col id=\"cd\">19</Col><Col id=\"cdNm\">19회</Col></Row><Row><Col id=\"cd\">20</Col><Col id=\"cdNm\">20회</Col></Row><Row><Col id=\"cd\">21</Col><Col id=\"cdNm\">21회</Col></Row><Row><Col id=\"cd\">22</Col><Col id=\"cdNm\">22회</Col></Row><Row><Col id=\"cd\">23</Col><Col id=\"cdNm\">23회</Col></Row><Row><Col id=\"cd\">24</Col><Col id=\"cdNm\">24회</Col></Row><Row><Col id=\"cd\">25</Col><Col id=\"cdNm\">25회</Col></Row><Row><Col id=\"cd\">26</Col><Col id=\"cdNm\">26회</Col></Row><Row><Col id=\"cd\">27</Col><Col id=\"cdNm\">27회</Col></Row><Row><Col id=\"cd\">28</Col><Col id=\"cdNm\">28회</Col></Row><Row><Col id=\"cd\">29</Col><Col id=\"cdNm\">29회</Col></Row><Row><Col id=\"cd\">30</Col><Col id=\"cdNm\">30회</Col></Row><Row><Col id=\"cd\">31</Col><Col id=\"cdNm\">31회</Col></Row><Row><Col id=\"cd\">32</Col><Col id=\"cdNm\">32회</Col></Row><Row><Col id=\"cd\">33</Col><Col id=\"cdNm\">33회</Col></Row><Row><Col id=\"cd\">34</Col><Col id=\"cdNm\">34회</Col></Row><Row><Col id=\"cd\">35</Col><Col id=\"cdNm\">35회</Col></Row><Row><Col id=\"cd\">36</Col><Col id=\"cdNm\">36회</Col></Row><Row><Col id=\"cd\">37</Col><Col id=\"cdNm\">37회</Col></Row><Row><Col id=\"cd\">38</Col><Col id=\"cdNm\">38회</Col></Row><Row><Col id=\"cd\">39</Col><Col id=\"cdNm\">39회</Col></Row><Row><Col id=\"cd\">40</Col><Col id=\"cdNm\">40회</Col></Row><Row><Col id=\"cd\">41</Col><Col id=\"cdNm\">41회</Col></Row><Row><Col id=\"cd\">42</Col><Col id=\"cdNm\">42회</Col></Row><Row><Col id=\"cd\">43</Col><Col id=\"cdNm\">43회</Col></Row><Row><Col id=\"cd\">44</Col><Col id=\"cdNm\">44회</Col></Row><Row><Col id=\"cd\">45</Col><Col id=\"cdNm\">45회</Col></Row><Row><Col id=\"cd\">46</Col><Col id=\"cdNm\">46회</Col></Row><Row><Col id=\"cd\">47</Col><Col id=\"cdNm\">47회</Col></Row><Row><Col id=\"cd\">48</Col><Col id=\"cdNm\">48회</Col></Row><Row><Col id=\"cd\">999</Col><Col id=\"cdNm\">무제한</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_rtsd0401", this);
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"agencyCd\" type=\"STRING\" size=\"256\"/><Column id=\"reqDay\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"procTm\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"bldMngNo\" type=\"STRING\" size=\"256\"/><Column id=\"posCd\" type=\"STRING\" size=\"256\"/><Column id=\"addr1\" type=\"STRING\" size=\"256\"/><Column id=\"addr2\" type=\"STRING\" size=\"256\"/><Column id=\"statCd\" type=\"STRING\" size=\"256\"/><Column id=\"statDtlCd\" type=\"STRING\" size=\"256\"/><Column id=\"memo\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_FreeRegAmtMgnt", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"saleCd\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"amt\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_rtsd0213", this);
            obj._setContents("<ColumnInfo><Column id=\"ordDe\" type=\"STRING\" size=\"256\"/><Column id=\"saleTyCd\" type=\"STRING\" size=\"256\"/><Column id=\"rentIfReqSn\" type=\"STRING\" size=\"256\"/><Column id=\"rentIfBfistSeCd\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"iplMobNo\" type=\"STRING\" size=\"256\"/><Column id=\"iplTelNo\" type=\"STRING\" size=\"256\"/><Column id=\"istBpCd\" type=\"STRING\" size=\"256\"/><Column id=\"itemCd\" type=\"STRING\" size=\"256\"/><Column id=\"ordQy\" type=\"STRING\" size=\"256\"/><Column id=\"dlvTyDtlCd\" type=\"STRING\" size=\"256\"/><Column id=\"istReqDe\" type=\"STRING\" size=\"256\"/><Column id=\"pickupZip\" type=\"STRING\" size=\"256\"/><Column id=\"pickupBassAddr\" type=\"STRING\" size=\"256\"/><Column id=\"pickupDtlAddr\" type=\"STRING\" size=\"256\"/><Column id=\"iplZip\" type=\"STRING\" size=\"256\"/><Column id=\"iplAddr\" type=\"STRING\" size=\"256\"/><Column id=\"iplDtlAddr\" type=\"STRING\" size=\"256\"/><Column id=\"regUsrId\" type=\"STRING\" size=\"256\"/><Column id=\"ordRsn\" type=\"STRING\" size=\"256\"/><Column id=\"sendURL\" type=\"STRING\" size=\"256\"/><Column id=\"o2oYn\" type=\"STRING\" size=\"256\"/><Column id=\"city\" type=\"STRING\" size=\"256\"/><Column id=\"county\" type=\"STRING\" size=\"256\"/><Column id=\"dong\" type=\"STRING\" size=\"256\"/><Column id=\"period\" type=\"STRING\" size=\"256\"/><Column id=\"basementPsbYn\" type=\"STRING\" size=\"256\"/><Column id=\"wheelAlignment\" type=\"STRING\" size=\"256\"/><Column id=\"resultData\" type=\"STRING\" size=\"256\"/><Column id=\"tmplCd\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"channelType\" type=\"STRING\" size=\"256\"/><Column id=\"orderConfigType\" type=\"STRING\" size=\"256\"/><Column id=\"orderId\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row/></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_procType", this);
            obj._setContents("<ColumnInfo><Column id=\"procType\" type=\"STRING\" size=\"256\"/><Column id=\"procTypeNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"procType\">1030</Col><Col id=\"procTypeNm\">전문점</Col></Row><Row><Col id=\"procType\">1010</Col><Col id=\"procTypeNm\">방문</Col></Row><Row><Col id=\"procType\">1020</Col><Col id=\"procTypeNm\">P&amp;D</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_baseType", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cd\">N</Col><Col id=\"cdNm\">지상</Col></Row><Row><Col id=\"cd\">Y</Col><Col id=\"cdNm\">지하</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_time", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_timeType", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cd\">AM</Col><Col id=\"cdNm\">오전</Col></Row><Row><Col id=\"cd\">PM</Col><Col id=\"cdNm\">오후</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_tms", this);
            obj._setContents("<ColumnInfo><Column id=\"sendURL\" type=\"STRING\" size=\"256\"/><Column id=\"reqDt\" type=\"STRING\" size=\"256\"/><Column id=\"city\" type=\"STRING\" size=\"256\"/><Column id=\"county\" type=\"STRING\" size=\"256\"/><Column id=\"dong\" type=\"STRING\" size=\"256\"/><Column id=\"bhfType\" type=\"STRING\" size=\"256\"/><Column id=\"period\" type=\"STRING\" size=\"256\"/><Column id=\"address\" type=\"STRING\" size=\"256\"/><Column id=\"basementPsbYn\" type=\"STRING\" size=\"256\"/><Column id=\"wheelAlignment\" type=\"STRING\" size=\"256\"/><Column id=\"orderType\" type=\"STRING\" size=\"256\"/><Column id=\"totQty\" type=\"STRING\" size=\"256\"/><Column id=\"itemList\" type=\"STRING\" size=\"256\"/><Column id=\"dCity\" type=\"STRING\" size=\"256\"/><Column id=\"dCounty\" type=\"STRING\" size=\"256\"/><Column id=\"dDong\" type=\"STRING\" size=\"256\"/><Column id=\"dAddress\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_tmsItem", this);
            obj._setContents("<ColumnInfo><Column id=\"itemCd\" type=\"STRING\" size=\"256\"/><Column id=\"reqQy\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_orderId", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_schedule", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_agency", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_o2oAgencyInfo", this);
            obj._setContents("<ColumnInfo><Column id=\"bhfCd\" type=\"STRING\" size=\"256\"/><Column id=\"wrhCd\" type=\"STRING\" size=\"256\"/><Column id=\"bpCd\" type=\"STRING\" size=\"256\"/><Column id=\"orgzNm\" type=\"STRING\" size=\"256\"/><Column id=\"zip\" type=\"STRING\" size=\"256\"/><Column id=\"bassAddr\" type=\"STRING\" size=\"256\"/><Column id=\"dtlAddr\" type=\"STRING\" size=\"256\"/><Column id=\"saleGrpCd\" type=\"STRING\" size=\"256\"/><Column id=\"saleOffice\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_alignYn", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cd\">Y</Col><Col id=\"cdNm\">사용</Col></Row><Row><Col id=\"cd\">N</Col><Col id=\"cdNm\">미사용</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_niceDnr", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"sectionWidth\" type=\"STRING\" size=\"256\"/><Column id=\"aspectRatio\" type=\"STRING\" size=\"256\"/><Column id=\"wheelInches\" type=\"STRING\" size=\"256\"/><Column id=\"plyRating\" type=\"STRING\" size=\"256\"/><Column id=\"classCd\" type=\"STRING\" size=\"256\"/><Column id=\"makerCd\" type=\"STRING\" size=\"256\"/><Column id=\"modelCd\" type=\"STRING\" size=\"256\"/><Column id=\"contentsCd\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_agencyInfo", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"agencyCd\" type=\"STRING\" size=\"256\"/><Column id=\"agencyNm\" type=\"STRING\" size=\"256\"/><Column id=\"salesGroup\" type=\"STRING\" size=\"256\"/><Column id=\"salesGroupNm\" type=\"STRING\" size=\"256\"/><Column id=\"salesOffice\" type=\"STRING\" size=\"256\"/><Column id=\"salesOfficeNm\" type=\"STRING\" size=\"256\"/><Column id=\"posCd\" type=\"STRING\" size=\"256\"/><Column id=\"city\" type=\"STRING\" size=\"256\"/><Column id=\"street\" type=\"STRING\" size=\"256\"/><Column id=\"sidoCd\" type=\"STRING\" size=\"256\"/><Column id=\"sigunCd\" type=\"STRING\" size=\"256\"/><Column id=\"serNo\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"faxNo\" type=\"STRING\" size=\"256\"/><Column id=\"taxNo\" type=\"STRING\" size=\"256\"/><Column id=\"repNm\" type=\"STRING\" size=\"256\"/><Column id=\"busiType\" type=\"STRING\" size=\"256\"/><Column id=\"busiCond\" type=\"STRING\" size=\"256\"/><Column id=\"rentalYn\" type=\"STRING\" size=\"256\"/><Column id=\"strDay\" type=\"STRING\" size=\"256\"/><Column id=\"endDay\" type=\"STRING\" size=\"256\"/><Column id=\"posX\" type=\"STRING\" size=\"256\"/><Column id=\"posY\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regNm\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgNm\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/><Column id=\"seasonGbn\" type=\"STRING\" size=\"256\"/><Column id=\"lmYn\" type=\"STRING\" size=\"256\"/><Column id=\"fmYn\" type=\"STRING\" size=\"256\"/><Column id=\"cwYn\" type=\"STRING\" size=\"256\"/><Column id=\"olimitCnt\" type=\"STRING\" size=\"256\"/><Column id=\"lifnr\" type=\"STRING\" size=\"256\"/><Column id=\"taxRqcd\" type=\"STRING\" size=\"256\"/><Column id=\"chanLclsCd\" type=\"STRING\" size=\"256\"/><Column id=\"chanMclsCd\" type=\"STRING\" size=\"256\"/><Column id=\"opYn\" type=\"STRING\" size=\"256\"/><Column id=\"memo\" type=\"STRING\" size=\"256\"/><Column id=\"desorptCd\" type=\"STRING\" size=\"256\"/><Column id=\"desorptNm\" type=\"STRING\" size=\"256\"/><Column id=\"alignCd\" type=\"STRING\" size=\"256\"/><Column id=\"alignNm\" type=\"STRING\" size=\"256\"/><Column id=\"balanceCd\" type=\"STRING\" size=\"256\"/><Column id=\"balanceNm\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroup\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroupNm\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOffice\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOfficeNm\" type=\"STRING\" size=\"256\"/><Column id=\"prplYn\" type=\"STRING\" size=\"256\"/><Column id=\"apfdEndYn\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_etcInfo", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Div("div_custInfo", "absolute", "0", "40", "681", "273", null, null, this);
            obj.set_taborder("3");
            obj.style.set_background("@gradation");
            obj.set_scrollbars("none");
            this.addChild(obj.name, obj);
            obj = new Static("Static17", "absolute", "-1", "30", "682", "31", null, null, this.div_custInfo);
            obj.set_taborder("152");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new MaskEdit("ed_buslNo", "absolute", "337", "35", "115", "21", null, null, this.div_custInfo);
            obj.set_taborder("153");
            obj.set_type("string");
            obj.set_mask("###-##-#####");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new Static("st_buslNo", "absolute", "232", "30", "100", "31", null, null, this.div_custInfo);
            obj.set_taborder("154");
            obj.set_text("사업자번호");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.set_visible("false");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new Static("st_custTp", "absolute", "0", "30", "100", "31", null, null, this.div_custInfo);
            obj.set_taborder("155");
            obj.set_text("고객유형");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new Combo("cb_custTp", "absolute", "104", "35", "124", "21", null, null, this.div_custInfo);
            this.div_custInfo.addChild(obj.name, obj);
            obj.set_taborder("156");
            obj.set_innerdataset("@ds_custTp");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_enable("false");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new Static("st_birthDay", "absolute", "232", "30", "100", "31", null, null, this.div_custInfo);
            obj.set_taborder("157");
            obj.set_text("법정생년월일");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new MaskEdit("ed_birthDay", "absolute", "336", "35", "116", "21", null, null, this.div_custInfo);
            obj.set_taborder("158");
            obj.set_type("string");
            obj.set_mask("####-##-##");
            obj.set_enable("false");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new Static("st_custNm", "absolute", "456", "30", "100", "31", null, null, this.div_custInfo);
            obj.set_taborder("159");
            obj.set_text("고객명");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new Edit("ed_custNm", "absolute", "560", "35", "115", "21", null, null, this.div_custInfo);
            obj.set_taborder("160");
            obj.set_maxlength("80");
            obj.set_enable("false");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new Static("st_custNo", "absolute", "404", "5", "100", "20", null, null, this.div_custInfo);
            obj.set_taborder("163");
            obj.set_text("고객번호");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new Edit("ed_custNo", "absolute", "456", "5", "110", "21", null, null, this.div_custInfo);
            obj.set_taborder("164");
            obj.set_enable("false");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "-1", "60", "682", "31", null, null, this.div_custInfo);
            obj.set_taborder("167");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new Static("st_genderCd", "absolute", "0", "60", "100", "31", null, null, this.div_custInfo);
            obj.set_taborder("168");
            obj.set_text("성별");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new Edit("ed_repNm", "absolute", "104", "65", "347", "21", null, null, this.div_custInfo);
            obj.set_taborder("169");
            obj.set_maxlength("80");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new Combo("cb_genderCd", "absolute", "104", "65", "124", "21", null, null, this.div_custInfo);
            this.div_custInfo.addChild(obj.name, obj);
            obj.set_taborder("170");
            obj.set_innerdataset("@ds_genderCd");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_enable("false");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new Static("st_repNm", "absolute", "0", "60", "100", "31", null, null, this.div_custInfo);
            obj.set_taborder("171");
            obj.set_text("대표자명");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.set_visible("false");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new Static("st_lfCd", "absolute", "232", "60", "100", "31", null, null, this.div_custInfo);
            obj.set_taborder("172");
            obj.set_text("내/외국인");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new Combo("cb_lfCd", "absolute", "336", "65", "116", "21", null, null, this.div_custInfo);
            this.div_custInfo.addChild(obj.name, obj);
            obj.set_taborder("173");
            obj.set_innerdataset("@ds_lfCd");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_enable("false");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj.set_index("-1");
            obj = new Static("st_telNo", "absolute", "456", "60", "100", "31", null, null, this.div_custInfo);
            obj.set_taborder("174");
            obj.set_text("전화번호");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new Edit("ed_telNo", "absolute", "560", "65", "115", "21", null, null, this.div_custInfo);
            obj.set_taborder("175");
            obj.set_maxlength("80");
            obj.set_enable("false");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new Button("btn_custNew", "absolute", "570", "5", "41", "21", null, null, this.div_custInfo);
            obj.set_taborder("181");
            obj.set_text("신규");
            obj.getSetter("domainId").set("nexa.save");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new Button("btn_custNoSearch", "absolute", "615", "5", "65", "21", null, null, this.div_custInfo);
            obj.set_taborder("182");
            obj.set_text("고객조회");
            obj.getSetter("domainId").set("nexa.save");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new Static("Static21", "absolute", "0", "5", "80", "21", null, null, this.div_custInfo);
            obj.set_taborder("183");
            obj.set_text("고객정보");
            obj.set_cssclass("sta_WF_subTitle");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "-1", "90", "682", "31", null, null, this.div_custInfo);
            obj.set_taborder("188");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new Edit("ed_busiType", "absolute", "104", "95", "124", "21", null, null, this.div_custInfo);
            obj.set_taborder("189");
            obj.set_maxlength("80");
            obj.set_enable("false");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new Static("st_busiType", "absolute", "0", "90", "100", "31", null, null, this.div_custInfo);
            obj.set_taborder("190");
            obj.set_text("업종");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new Static("st_busiCond", "absolute", "232", "90", "100", "31", null, null, this.div_custInfo);
            obj.set_taborder("191");
            obj.set_text("업태");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new Edit("ed_busiCond", "absolute", "336", "95", "338", "21", null, null, this.div_custInfo);
            obj.set_taborder("192");
            obj.set_maxlength("80");
            obj.set_enable("false");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new Div("div_custInfoDetail", "absolute", "0", "120", "681", "152", null, null, this.div_custInfo);
            obj.set_taborder("193");
            obj.style.set_background("@gradation");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "0", "120", "681", "31", null, null, this.div_custInfo.div_custInfoDetail);
            obj.set_taborder("75");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_custInfo.div_custInfoDetail.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "-1", "0", "682", "31", null, null, this.div_custInfo.div_custInfoDetail);
            obj.set_taborder("51");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_custInfo.div_custInfoDetail.addChild(obj.name, obj);
            obj = new Edit("ed_emailAddr1", "absolute", "560", "5", "116", "21", null, null, this.div_custInfo.div_custInfoDetail);
            obj.set_taborder("52");
            obj.set_inputtype("number,english,symbol");
            obj.set_maxlength("35");
            obj.set_enable("false");
            this.div_custInfo.div_custInfoDetail.addChild(obj.name, obj);
            obj = new Static("st_emailAddr", "absolute", "456", "0", "100", "31", null, null, this.div_custInfo.div_custInfoDetail);
            obj.set_taborder("53");
            obj.set_text("e-mail주소");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_custInfo.div_custInfoDetail.addChild(obj.name, obj);
            obj = new Combo("cb_mobFirm", "absolute", "336", "5", "116", "21", null, null, this.div_custInfo.div_custInfoDetail);
            this.div_custInfo.div_custInfoDetail.addChild(obj.name, obj);
            obj.set_taborder("54");
            obj.set_innerdataset("@ds_mobFirm");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_enable("false");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new Static("st_mobFirm", "absolute", "232", "0", "100", "31", null, null, this.div_custInfo.div_custInfoDetail);
            obj.set_taborder("55");
            obj.set_text("통신사");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_custInfo.div_custInfoDetail.addChild(obj.name, obj);
            obj = new MaskEdit("ed_mobNo", "absolute", "104", "5", "124", "21", null, null, this.div_custInfo.div_custInfoDetail);
            obj.set_taborder("56");
            obj.set_type("string");
            obj.set_mask("###-####-####");
            obj.set_enable("false");
            this.div_custInfo.div_custInfoDetail.addChild(obj.name, obj);
            obj = new Static("st_mobNo", "absolute", "0", "0", "100", "31", null, null, this.div_custInfo.div_custInfoDetail);
            obj.set_taborder("57");
            obj.set_text("휴대폰");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_custInfo.div_custInfoDetail.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "-1", "30", "682", "31", null, null, this.div_custInfo.div_custInfoDetail);
            obj.set_taborder("58");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_custInfo.div_custInfoDetail.addChild(obj.name, obj);
            obj = new Edit("ed_addr1", "absolute", "336", "35", "340", "21", null, null, this.div_custInfo.div_custInfoDetail);
            obj.set_taborder("59");
            obj.set_maxlength("100");
            obj.set_enable("false");
            this.div_custInfo.div_custInfoDetail.addChild(obj.name, obj);
            obj = new Static("st_addr1", "absolute", "232", "30", "100", "31", null, null, this.div_custInfo.div_custInfoDetail);
            obj.set_taborder("60");
            obj.set_text("주소");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_custInfo.div_custInfoDetail.addChild(obj.name, obj);
            obj = new Edit("ed_posCd", "absolute", "104", "35", "124", "21", null, null, this.div_custInfo.div_custInfoDetail);
            obj.set_taborder("61");
            obj.set_inputtype("number");
            obj.set_maxlength("6");
            obj.set_enable("false");
            this.div_custInfo.div_custInfoDetail.addChild(obj.name, obj);
            obj = new Static("st_posCd", "absolute", "0", "30", "100", "31", null, null, this.div_custInfo.div_custInfoDetail);
            obj.set_taborder("62");
            obj.set_text("고객주소");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_custInfo.div_custInfoDetail.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "-1", "60", "682", "31", null, null, this.div_custInfo.div_custInfoDetail);
            obj.set_taborder("63");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_custInfo.div_custInfoDetail.addChild(obj.name, obj);
            obj = new Static("st_addr2", "absolute", "232", "60", "100", "31", null, null, this.div_custInfo.div_custInfoDetail);
            obj.set_taborder("64");
            obj.set_text("주소");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_custInfo.div_custInfoDetail.addChild(obj.name, obj);
            obj = new Edit("ed_addr12", "absolute", "336", "65", "340", "21", null, null, this.div_custInfo.div_custInfoDetail);
            obj.set_taborder("65");
            obj.set_maxlength("100");
            obj.set_enable("false");
            this.div_custInfo.div_custInfoDetail.addChild(obj.name, obj);
            obj = new Edit("ed_posCd2", "absolute", "104", "65", "124", "21", null, null, this.div_custInfo.div_custInfoDetail);
            obj.set_taborder("66");
            obj.set_inputtype("number");
            obj.set_maxlength("6");
            obj.set_enable("false");
            this.div_custInfo.div_custInfoDetail.addChild(obj.name, obj);
            obj = new Static("st_posCd2", "absolute", "0", "60", "100", "31", null, null, this.div_custInfo.div_custInfoDetail);
            obj.set_taborder("67");
            obj.set_text("근무지주소");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_custInfo.div_custInfoDetail.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "0", "90", "681", "31", null, null, this.div_custInfo.div_custInfoDetail);
            obj.set_taborder("68");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_custInfo.div_custInfoDetail.addChild(obj.name, obj);
            obj = new Static("st_nagYn", "absolute", "232", "90", "100", "31", null, null, this.div_custInfo.div_custInfoDetail);
            obj.set_taborder("71");
            obj.set_text("정보제공동의");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_custInfo.div_custInfoDetail.addChild(obj.name, obj);
            obj = new Static("st_telNo2", "absolute", "456", "90", "100", "31", null, null, this.div_custInfo.div_custInfoDetail);
            obj.set_taborder("73");
            obj.set_text("회사전화");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_custInfo.div_custInfoDetail.addChild(obj.name, obj);
            obj = new Edit("ed_telNo2", "absolute", "560", "95", "116", "21", null, null, this.div_custInfo.div_custInfoDetail);
            obj.set_taborder("74");
            obj.set_inputtype("number");
            obj.set_maxlength("6");
            obj.set_enable("false");
            this.div_custInfo.div_custInfoDetail.addChild(obj.name, obj);
            obj = new Static("st_credit", "absolute", "232", "120", "100", "31", null, null, this.div_custInfo.div_custInfoDetail);
            obj.set_taborder("78");
            obj.set_text("신용조회");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_custInfo.div_custInfoDetail.addChild(obj.name, obj);
            obj = new Button("btn_creditSelect", "absolute", "464", "125", "65", "21", null, null, this.div_custInfo.div_custInfoDetail);
            obj.set_taborder("82");
            obj.set_text("신용조회");
            obj.getSetter("domainId").set("nexa.save");
            obj.set_enable("true");
            obj.set_visible("false");
            this.div_custInfo.div_custInfoDetail.addChild(obj.name, obj);
            obj = new Combo("cb_nagYn", "absolute", "335", "95", "116", "21", null, null, this.div_custInfo.div_custInfoDetail);
            this.div_custInfo.div_custInfoDetail.addChild(obj.name, obj);
            obj.set_taborder("83");
            obj.set_displaynulltext("선택");
            obj.set_innerdataset("ds_nagYn");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_enable("false");
            obj.set_visible("true");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new Combo("cb_credit", "absolute", "337", "125", "123", "21", null, null, this.div_custInfo.div_custInfoDetail);
            this.div_custInfo.div_custInfoDetail.addChild(obj.name, obj);
            obj.set_taborder("84");
            obj.set_displaynulltext("선택");
            obj.set_innerdataset("@ds_credit");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_enable("false");
            obj.set_visible("true");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new Static("st_certification", "absolute", "0", "90", "100", "31", null, null, this.div_custInfo.div_custInfoDetail);
            obj.set_taborder("85");
            obj.set_text("본인인증");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_custInfo.div_custInfoDetail.addChild(obj.name, obj);
            obj = new Radio("ra_certification", "absolute", "104", "95", "124", "20", null, null, this.div_custInfo.div_custInfoDetail);
            this.div_custInfo.div_custInfoDetail.addChild(obj.name, obj);
            obj.set_taborder("86");
            obj.set_innerdataset("@ds_certification");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_direction("vertical");
            obj.set_enable("false");
            obj = new Static("st_certi", "absolute", "0", "120", "100", "31", null, null, this.div_custInfo.div_custInfoDetail);
            obj.set_taborder("87");
            obj.set_text("휴대폰 인증");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.set_visible("true");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_custInfo.div_custInfoDetail.addChild(obj.name, obj);
            obj = new Button("btn_certification", "absolute", "104", "125", "41", "21", null, null, this.div_custInfo.div_custInfoDetail);
            obj.set_taborder("88");
            obj.set_text("인증");
            obj.set_visible("true");
            obj.getSetter("domainId").set("nexa.save");
            obj.set_enable("false");
            this.div_custInfo.div_custInfoDetail.addChild(obj.name, obj);
            obj = new WebBrowser("nice_interface", "absolute", "151", "124", "124", "24", null, null, this.div_custInfo.div_custInfoDetail);
            obj.set_taborder("89");
            obj.set_visible("false");
            obj.set_url("https://portal.tirerental.co.kr/interface/di_safekey/main.jsp");
            this.div_custInfo.div_custInfoDetail.addChild(obj.name, obj);
            obj = new Button("btn_check", "absolute", "464", "125", "65", "21", null, null, this.div_custInfo.div_custInfoDetail);
            obj.set_taborder("90");
            obj.set_text("주문가능");
            obj.set_visible("true");
            obj.getSetter("domainId").set("nexa.save");
            obj.set_tooltiptext("사전 주문 가능 여부 확인");
            this.div_custInfo.div_custInfoDetail.addChild(obj.name, obj);
            obj = new Static("st_cCustnm", "absolute", "0", "210", "100", "31", null, null, this.div_custInfo);
            obj.set_taborder("194");
            obj.set_text("담당자명");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.set_visible("false");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new Edit("ed_Ccustnm", "absolute", "104", "215", "124", "21", null, null, this.div_custInfo);
            obj.set_taborder("195");
            obj.set_maxlength("80");
            obj.set_visible("false");
            obj.set_enable("false");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new Static("st_cTelno", "absolute", "232", "210", "100", "31", null, null, this.div_custInfo);
            obj.set_taborder("196");
            obj.set_text("담당자        전화번호");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.set_visible("false");
            obj.getSetter("domainId").set("nexa.s_condition");
            obj.style.set_align("left middle");
            obj.set_wordwrap("char");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new Edit("ed_cTelno", "absolute", "336", "215", "115", "21", null, null, this.div_custInfo);
            obj.set_taborder("197");
            obj.set_maxlength("80");
            obj.set_visible("false");
            obj.set_enable("false");
            this.div_custInfo.addChild(obj.name, obj);

            obj = new Div("div_carInfo", "absolute", "700", "190", "422", "140", null, null, this);
            obj.set_taborder("5");
            obj.style.set_background("@gradation");
            obj.set_scrollbars("none");
            obj.set_enable("false");
            obj.set_visible("true");
            this.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "0", "30", "422", "31", null, null, this.div_carInfo);
            obj.set_taborder("17");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_carInfo.addChild(obj.name, obj);
            obj = new Static("st_model", "absolute", "0", "30", "100", "31", null, null, this.div_carInfo);
            obj.set_taborder("18");
            obj.set_text("차종");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_carInfo.addChild(obj.name, obj);
            obj = new Combo("cb_makerCd", "absolute", "104", "35", "107", "21", null, null, this.div_carInfo);
            this.div_carInfo.addChild(obj.name, obj);
            obj.set_taborder("19");
            obj.set_displaynulltext("브랜드");
            obj.set_innerdataset("@ds_maker");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new Combo("cb_model", "absolute", "215", "35", "202", "21", null, null, this.div_carInfo);
            this.div_carInfo.addChild(obj.name, obj);
            obj.set_taborder("20");
            obj.set_displaynulltext("모델");
            obj.set_innerdataset("@ds_model");
            obj.set_codecolumn("rn");
            obj.set_datacolumn("mcNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new Static("Static00", "absolute", "0", "60", "422", "31", null, null, this.div_carInfo);
            obj.set_taborder("21");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_carInfo.addChild(obj.name, obj);
            obj = new Static("st_carOwner", "absolute", "0", "60", "100", "31", null, null, this.div_carInfo);
            obj.set_taborder("22");
            obj.set_text("차량소유자");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_carInfo.addChild(obj.name, obj);
            obj = new Edit("ed_carOwner", "absolute", "104", "65", "107", "21", null, null, this.div_carInfo);
            obj.set_taborder("23");
            obj.set_maxlength("60");
            this.div_carInfo.addChild(obj.name, obj);
            obj = new Edit("ed_carNo", "absolute", "299", "65", "118", "21", null, null, this.div_carInfo);
            obj.set_taborder("24");
            obj.set_maxlength("9");
            this.div_carInfo.addChild(obj.name, obj);
            obj = new Static("st_carNo", "absolute", "215", "60", "80", "31", null, null, this.div_carInfo);
            obj.set_taborder("25");
            obj.set_text("차량No");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_carInfo.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "0", "90", "422", "31", null, null, this.div_carInfo);
            obj.set_taborder("26");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_carInfo.addChild(obj.name, obj);
            obj = new Static("st_cMileage", "absolute", "0", "90", "100", "31", null, null, this.div_carInfo);
            obj.set_taborder("27");
            obj.set_text("현재주행거리");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_carInfo.addChild(obj.name, obj);
            obj = new MaskEdit("ed_cMileage", "absolute", "104", "95", "107", "21", null, null, this.div_carInfo);
            obj.set_taborder("28");
            obj.set_mask("###,###,###,##0");
            obj.set_autoselect("true");
            obj.set_autoskip("true");
            obj.set_limitbymask("both");
            this.div_carInfo.addChild(obj.name, obj);
            obj = new Edit("ed_model", "absolute", "103", "5", "120", "21", null, null, this.div_carInfo);
            obj.set_taborder("30");
            obj.set_maxlength("9");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_carInfo.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "0", "5", "80", "21", null, null, this.div_carInfo);
            obj.set_taborder("31");
            obj.set_text("차량정보");
            obj.set_cssclass("sta_WF_subTitle");
            this.div_carInfo.addChild(obj.name, obj);
            obj = new Static("st_cMileage2", "absolute", "218", "98", "25", "20", null, null, this.div_carInfo);
            obj.set_taborder("32");
            obj.set_text("Km");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_carInfo.addChild(obj.name, obj);
            obj = new Edit("ed_contentsCd", "absolute", "222", "5", "120", "21", null, null, this.div_carInfo);
            obj.set_taborder("33");
            obj.set_maxlength("9");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_carInfo.addChild(obj.name, obj);
            obj = new Edit("ed_frCd", "absolute", "372", "5", "26", "21", null, null, this.div_carInfo);
            obj.set_taborder("34");
            obj.set_maxlength("9");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_carInfo.addChild(obj.name, obj);
            obj = new Button("btn_niceDnr", "absolute", "353", "95", "65", "21", null, null, this.div_carInfo);
            obj.set_taborder("35");
            obj.set_text("차량정보");
            obj.set_visible("false");
            obj.getSetter("domainId").set("nexa.save");
            this.div_carInfo.addChild(obj.name, obj);

            obj = new Div("div_installInfo", "absolute", "0", "1262", "1122", "241", null, null, this);
            obj.set_taborder("7");
            obj.style.set_background("@gradation");
            obj.set_scrollbars("none");
            obj.set_enableevent("true");
            obj.set_enable("false");
            this.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "0", "30", "856", "31", null, null, this.div_installInfo);
            obj.set_taborder("6");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Div("Div00", "absolute", "-83.1%", "253", null, "150", "149.91%", null, this.div_installInfo);
            obj.set_taborder("1");
            obj.set_text("Div00");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Edit("ed_agencyCd", "absolute", "104", "3", "125", "21", null, null, this.div_installInfo);
            obj.set_taborder("8");
            obj.set_maxlength("80");
            obj.set_enable("false");
            obj.set_visible("false");
            obj.set_displaynulltext("장착대리점코드");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Static("Static21", "absolute", "0", "-4", "120", "21", null, null, this.div_installInfo);
            obj.set_taborder("10");
            obj.set_text("장착점정보");
            obj.set_cssclass("sta_WF_subTitle");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Edit("ed_salesOffice", "absolute", "360", "3", "125", "21", null, null, this.div_installInfo);
            obj.set_taborder("14");
            obj.set_maxlength("80");
            obj.set_enable("false");
            obj.set_visible("false");
            obj.set_displaynulltext("지점 코드");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Edit("ed_salesGroup", "absolute", "232", "3", "125", "21", null, null, this.div_installInfo);
            obj.set_taborder("15");
            obj.set_maxlength("80");
            obj.set_enable("false");
            obj.set_visible("false");
            obj.set_displaynulltext("지사 코드");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Edit("ed_posCd", "absolute", "72", "60", "125", "21", null, null, this.div_installInfo);
            obj.set_taborder("16");
            obj.set_displaynulltext("우편번호");
            obj.set_maxlength("80");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Edit("ed_city", "absolute", "194", "60", "125", "21", null, null, this.div_installInfo);
            obj.set_taborder("17");
            obj.set_displaynulltext("주소");
            obj.set_maxlength("80");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Edit("ed_street", "absolute", "320", "60", "125", "21", null, null, this.div_installInfo);
            obj.set_taborder("18");
            obj.set_displaynulltext("상세주소");
            obj.set_maxlength("80");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Edit("ed_telNo", "absolute", "453", "60", "125", "21", null, null, this.div_installInfo);
            obj.set_taborder("19");
            obj.set_displaynulltext("전화번호");
            obj.set_maxlength("80");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Edit("ed_visitYn", "absolute", "582", "60", "73", "21", null, null, this.div_installInfo);
            obj.set_taborder("20");
            obj.set_displaynulltext("방문장착");
            obj.set_maxlength("80");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Edit("ed_o2oYn", "absolute", "492", "3", "73", "21", null, null, this.div_installInfo);
            obj.set_taborder("25");
            obj.set_displaynulltext("거점여부");
            obj.set_maxlength("80");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Button("btn_visitSchd", "absolute", "304", "35", "53", "21", null, null, this.div_installInfo);
            obj.set_taborder("21");
            obj.set_text("방문일정");
            obj.getSetter("domainId").set("nexa.save");
            obj.set_visible("false");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Static("st_procDay", "absolute", "362", "30", "80", "31", null, null, this.div_installInfo);
            obj.set_taborder("12");
            obj.set_text("장착일자");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Calendar("cal_procDay", "absolute", "447", "35", "125", "21", null, null, this.div_installInfo);
            this.div_installInfo.addChild(obj.name, obj);
            obj.set_taborder("3");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_enable("true");
            obj = new Static("st_procType", "absolute", "0", "30", "80", "31", null, null, this.div_installInfo);
            obj.set_taborder("26");
            obj.set_text("장착유형");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            obj.set_enable("true");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Radio("rd_procType", "absolute", "7.93%", "31", null, "30", "76.83%", null, this.div_installInfo);
            this.div_installInfo.addChild(obj.name, obj);
            obj.set_taborder("27");
            obj.set_innerdataset("@ds_procType");
            obj.set_codecolumn("procType");
            obj.set_datacolumn("procTypeNm");
            obj.set_direction("vertical");
            obj.set_enable("false");
            obj.set_value("1030");
            obj.set_index("0");
            obj = new Static("Static00", "absolute", "0", "90", "856", "31", null, null, this.div_installInfo);
            obj.set_taborder("28");
            obj.set_cssclass("sta_WF_detailLabel2");
            obj.set_visible("true");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Static("st_agencyCd00", "absolute", "0", "90", "80", "31", null, null, this.div_installInfo);
            obj.set_taborder("29");
            obj.set_text("주소1");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            obj.set_enable("true");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Edit("ed_posCd00", "absolute", "84", "95", "140", "21", null, null, this.div_installInfo);
            obj.set_taborder("30");
            obj.set_inputtype("number");
            obj.set_maxlength("6");
            obj.set_enable("false");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Button("btn_postSearch00", "absolute", "204", "94", "20", "21", null, null, this.div_installInfo);
            obj.set_taborder("31");
            obj.set_cssclass("btn_WF_edtSch");
            obj.getSetter("domainId").set("nexa.save");
            obj.set_enable("false");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Edit("ed_addr00", "absolute", "232", "95", "210", "21", null, null, this.div_installInfo);
            obj.set_taborder("32");
            obj.set_maxlength("100");
            obj.set_enable("false");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Edit("ed_detl_addr00", "absolute", "446", "95", "245", "21", null, null, this.div_installInfo);
            obj.set_taborder("33");
            obj.set_maxlength("160");
            obj.set_enable("false");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "0", "120", "856", "31", null, null, this.div_installInfo);
            obj.set_taborder("34");
            obj.set_cssclass("sta_WF_detailLabel2");
            obj.set_visible("true");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Static("st_agencyCd01", "absolute", "0", "120", "80", "31", null, null, this.div_installInfo);
            obj.set_taborder("35");
            obj.set_text("주소2");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            obj.set_enable("true");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Edit("ed_posCd01", "absolute", "84", "125", "140", "21", null, null, this.div_installInfo);
            obj.set_taborder("36");
            obj.set_inputtype("number");
            obj.set_maxlength("6");
            obj.set_enable("false");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Button("btn_postSearch01", "absolute", "204", "124", "20", "21", null, null, this.div_installInfo);
            obj.set_taborder("37");
            obj.set_cssclass("btn_WF_edtSch");
            obj.getSetter("domainId").set("nexa.save");
            obj.set_enable("false");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Edit("ed_addr01", "absolute", "232", "125", "210", "21", null, null, this.div_installInfo);
            obj.set_taborder("38");
            obj.set_maxlength("100");
            obj.set_enable("false");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Edit("ed_detl_addr01", "absolute", "446", "125", "245", "21", null, null, this.div_installInfo);
            obj.set_taborder("39");
            obj.set_maxlength("160");
            obj.set_enable("false");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "0", "60", "856", "31", null, null, this.div_installInfo);
            obj.set_taborder("40");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Static("st_agencyCd", "absolute", "0", "60", "80", "31", null, null, this.div_installInfo);
            obj.set_taborder("7");
            obj.set_text("장착점명");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Edit("ed_agencyNm", "absolute", "84", "65", "208", "21", null, null, this.div_installInfo);
            obj.set_taborder("0");
            obj.set_maxlength("80");
            obj.set_enable("false");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Button("btn_searchAgency", "absolute", "298", "65", "41", "21", null, null, this.div_installInfo);
            obj.set_taborder("2");
            obj.set_text("대리점");
            obj.getSetter("domainId").set("nexa.save");
            obj.set_enable("true");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Static("st_procDay00", "absolute", "362", "60", "80", "31", null, null, this.div_installInfo);
            obj.set_taborder("41");
            obj.set_text("장착시간");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            obj.set_enable("true");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "0", "150", "856", "31", null, null, this.div_installInfo);
            obj.set_taborder("42");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Static("st_agencyCd02", "absolute", "0", "150", "80", "31", null, null, this.div_installInfo);
            obj.set_taborder("43");
            obj.set_text("지하여부");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            obj.set_enable("true");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Radio("rd_baseType", "absolute", "7.93%", "151", null, "30", "80.75%", null, this.div_installInfo);
            this.div_installInfo.addChild(obj.name, obj);
            obj.set_taborder("44");
            obj.set_innerdataset("@ds_baseType");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_value("N");
            obj.set_direction("vertical");
            obj.set_enable("false");
            obj.set_index("0");
            obj = new Static("st_visitTel", "absolute", "231", "150", "80", "31", null, null, this.div_installInfo);
            obj.set_taborder("23");
            obj.set_text("방문연락처");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            obj.set_visible("true");
            obj.set_enable("false");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Edit("ed_visitTel", "absolute", "316", "155", "125", "21", null, null, this.div_installInfo);
            obj.set_taborder("24");
            obj.set_maxlength("80");
            obj.set_enable("false");
            obj.set_visible("true");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Combo("cb_time", "absolute", "447", "65", "125", "21", null, null, this.div_installInfo);
            this.div_installInfo.addChild(obj.name, obj);
            obj.set_taborder("45");
            obj.set_displaynulltext("선택");
            obj.set_innerdataset("@ds_time");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_enable("false");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new Static("st_procDay01", "absolute", "580", "30", "80", "31", null, null, this.div_installInfo);
            obj.set_taborder("46");
            obj.set_text("오전/오후");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            obj.set_enable("true");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Radio("rd_timeType", "absolute", "59.27%", "31", null, "30", "28.7%", null, this.div_installInfo);
            this.div_installInfo.addChild(obj.name, obj);
            obj.set_taborder("47");
            obj.set_innerdataset("@ds_timeType");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_value("AM");
            obj.set_direction("vertical");
            obj.set_enable("false");
            obj.set_index("0");
            obj = new Button("btn_searchTime", "absolute", "796", "35", "50", "21", null, null, this.div_installInfo);
            obj.set_taborder("48");
            obj.set_text("조회");
            obj.getSetter("domainId").set("nexa.save");
            obj.set_enable("false");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Edit("ed_siNm00", "absolute", "696", "95", "51", "21", null, null, this.div_installInfo);
            obj.set_taborder("49");
            obj.set_displaynulltext("시도명");
            obj.set_maxlength("80");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Edit("ed_sggNm00", "absolute", "749", "95", "51", "21", null, null, this.div_installInfo);
            obj.set_taborder("50");
            obj.set_displaynulltext("구명");
            obj.set_maxlength("80");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Edit("ed_emdNm00", "absolute", "801", "95", "51", "21", null, null, this.div_installInfo);
            obj.set_taborder("51");
            obj.set_displaynulltext("동명");
            obj.set_maxlength("80");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Edit("ed_siNm01", "absolute", "696", "124", "51", "21", null, null, this.div_installInfo);
            obj.set_taborder("52");
            obj.set_displaynulltext("시도명");
            obj.set_maxlength("80");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Edit("ed_sggNm01", "absolute", "749", "124", "51", "21", null, null, this.div_installInfo);
            obj.set_taborder("53");
            obj.set_displaynulltext("구명");
            obj.set_maxlength("80");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Edit("ed_emdNm01", "absolute", "801", "124", "51", "21", null, null, this.div_installInfo);
            obj.set_taborder("54");
            obj.set_displaynulltext("동명");
            obj.set_maxlength("80");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new WebBrowser("kakao_interface", "absolute", "690", "186", "162", "46", null, null, this.div_installInfo);
            obj.set_taborder("55");
            obj.set_visible("false");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Static("st_procDay02", "absolute", "580", "60", "80", "31", null, null, this.div_installInfo);
            obj.set_taborder("56");
            obj.set_text("얼라인먼트");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            obj.set_enable("false");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Radio("rd_alignYn", "absolute", "59.27%", "63", null, "30", "28.7%", null, this.div_installInfo);
            this.div_installInfo.addChild(obj.name, obj);
            obj.set_taborder("57");
            obj.set_innerdataset("@ds_alignYn");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_direction("vertical");
            obj.set_enable("false");
            obj.set_value("N");
            obj.set_index("1");
            obj = new Edit("ed_directYn", "absolute", "572", "3", "92", "21", null, null, this.div_installInfo);
            obj.set_taborder("58");
            obj.set_displaynulltext("직영도매거래선여부");
            obj.set_maxlength("80");
            obj.set_enable("true");
            obj.set_visible("false");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Static("st_visitTel00", "absolute", "445", "150", "80", "31", null, null, this.div_installInfo);
            obj.set_taborder("59");
            obj.set_text("기타");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.set_enable("false");
            obj.getSetter("domainId").set("nexa.s_condition");
            obj.set_visible("true");
            this.div_installInfo.addChild(obj.name, obj);

            obj = new Div("div_salesmanInfo", "absolute", "0", "331", "1122", "70", null, null, this);
            obj.set_taborder("8");
            obj.style.set_background("@gradation");
            obj.set_scrollbars("none");
            obj.set_visible("true");
            obj.set_enable("false");
            this.addChild(obj.name, obj);
            obj = new Div("Div00", "absolute", "-82.43%", "253", null, "150", "150.09%", null, this.div_salesmanInfo);
            obj.set_taborder("63");
            obj.set_text("Div00");
            this.div_salesmanInfo.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "-1", "25", "1123", "31", null, null, this.div_salesmanInfo);
            obj.set_taborder("77");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_salesmanInfo.addChild(obj.name, obj);
            obj = new Static("Static21", "absolute", "0", "0", "120", "21", null, null, this.div_salesmanInfo);
            obj.set_taborder("88");
            obj.set_text("판매원정보");
            obj.set_cssclass("sta_WF_subTitle");
            this.div_salesmanInfo.addChild(obj.name, obj);
            obj = new Static("st_salesman", "absolute", "0", "25", "140", "31", null, null, this.div_salesmanInfo);
            obj.set_taborder("89");
            obj.set_text("판매원명");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_salesmanInfo.addChild(obj.name, obj);
            obj = new Combo("cb_orgAgent", "absolute", "144", "30", "130", "21", null, null, this.div_salesmanInfo);
            this.div_salesmanInfo.addChild(obj.name, obj);
            obj.set_taborder("93");
            obj.set_displaynulltext("선택");
            obj.set_innerdataset("@ds_rtsd0113Combo");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_enable("true");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new Edit("ed_salesmanTel", "absolute", "423", "30", "130", "21", null, null, this.div_salesmanInfo);
            obj.set_taborder("94");
            obj.set_maxlength("80");
            obj.set_enable("false");
            this.div_salesmanInfo.addChild(obj.name, obj);
            obj = new Edit("ed_1", "absolute", "701", "30", "130", "21", null, null, this.div_salesmanInfo);
            obj.set_taborder("95");
            obj.set_maxlength("80");
            obj.set_enable("false");
            this.div_salesmanInfo.addChild(obj.name, obj);
            obj = new Static("st_1", "absolute", "557", "25", "140", "31", null, null, this.div_salesmanInfo);
            obj.set_taborder("96");
            obj.set_text("판매국명");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_salesmanInfo.addChild(obj.name, obj);
            obj = new Static("st_2", "absolute", "835", "25", "140", "31", null, null, this.div_salesmanInfo);
            obj.set_taborder("97");
            obj.set_text("전화번호");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_salesmanInfo.addChild(obj.name, obj);
            obj = new Edit("ed_2", "absolute", "980", "30", "130", "21", null, null, this.div_salesmanInfo);
            obj.set_taborder("98");
            obj.set_maxlength("80");
            obj.set_enable("false");
            this.div_salesmanInfo.addChild(obj.name, obj);
            obj = new Static("st_salesmanTel", "absolute", "279", "25", "140", "31", null, null, this.div_salesmanInfo);
            obj.set_taborder("99");
            obj.set_text("전화번호");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_salesmanInfo.addChild(obj.name, obj);

            obj = new Div("div_etcInfo", "absolute", "0", "1460", "672", "101", null, null, this);
            obj.set_taborder("9");
            obj.style.set_background("@gradation");
            obj.set_scrollbars("none");
            obj.set_enableevent("true");
            obj.set_enable("false");
            this.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "-42", "27", "674", "31", null, null, this.div_etcInfo);
            obj.set_taborder("49");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_etcInfo.addChild(obj.name, obj);
            obj = new Static("Static21", "absolute", "0", "0", "120", "21", null, null, this.div_etcInfo);
            obj.set_taborder("66");
            obj.set_text("기타정보");
            obj.set_cssclass("sta_WF_subTitle");
            this.div_etcInfo.addChild(obj.name, obj);
            obj = new Static("st_ordDay", "absolute", "0", "27", "140", "31", null, null, this.div_etcInfo);
            obj.set_taborder("67");
            obj.set_text("계약일자");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_etcInfo.addChild(obj.name, obj);
            obj = new Calendar("cal_ordDay", "absolute", "145", "32", "120", "20", null, null, this.div_etcInfo);
            this.div_etcInfo.addChild(obj.name, obj);
            obj.set_taborder("68");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_enable("false");
            obj = new Static("st_agreeYn3", "absolute", "279", "27", "140", "31", null, null, this.div_etcInfo);
            obj.set_taborder("69");
            obj.set_text("신분증 첨부 필수여부");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_etcInfo.addChild(obj.name, obj);
            obj = new CheckBox("ch_pcertYn", "absolute", "425", "32", "50", "20", null, null, this.div_etcInfo);
            obj.set_taborder("70");
            this.div_etcInfo.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "-42", "57", "674", "31", null, null, this.div_etcInfo);
            obj.set_taborder("71");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_etcInfo.addChild(obj.name, obj);
            obj = new Static("st_agreeYn1", "absolute", "0", "57", "140", "31", null, null, this.div_etcInfo);
            obj.set_taborder("72");
            obj.set_text("CMS출금이체동의");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_etcInfo.addChild(obj.name, obj);
            obj = new CheckBox("ch_cmsagYn", "absolute", "146", "63", "50", "20", null, null, this.div_etcInfo);
            obj.set_taborder("73");
            this.div_etcInfo.addChild(obj.name, obj);
            obj = new Static("st_agreeYn2", "absolute", "279", "57", "140", "31", null, null, this.div_etcInfo);
            obj.set_taborder("74");
            obj.set_text("계약서 교부방법");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_etcInfo.addChild(obj.name, obj);
            obj = new Combo("cb_conMthd", "absolute", "424", "62", "123", "21", null, null, this.div_etcInfo);
            this.div_etcInfo.addChild(obj.name, obj);
            obj.set_taborder("76");
            obj.set_displaynulltext("선택");
            obj.set_innerdataset("@ds_conMthd");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_enable("false");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj.set_index("-1");

            obj = new Grid("grid_model", "absolute", "0", "1616", "679", "62", null, null, this);
            obj.set_taborder("28");
            obj.set_binddataset("ds_model");
            obj.set_readonly("false");
            obj.set_enable("true");
            obj.set_cellsizingtype("col");
            obj.set_visible("false");
            obj.set_nodatatext("지우면절대안됨");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"167\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell text=\"rn\"/><Cell col=\"1\" text=\"makerCd\"/><Cell col=\"2\" text=\"modelCd\"/><Cell col=\"3\" text=\"modelNm\"/><Cell col=\"4\" text=\"contentsCd\"/><Cell col=\"5\" text=\"conTentsNm\"/><Cell col=\"6\" text=\"frCd\"/><Cell col=\"7\" text=\"mcNm\"/></Band><Band id=\"body\"><Cell text=\"bind:rn\"/><Cell col=\"1\" text=\"bind:makerCd\"/><Cell col=\"2\" text=\"bind:modelCd\"/><Cell col=\"3\" text=\"bind:modelNm\"/><Cell col=\"4\" text=\"bind:contentsCd\"/><Cell col=\"5\" text=\"bind:conTentsNm\"/><Cell col=\"6\" text=\"bind:frCd\"/><Cell col=\"7\" text=\"bind:mcNm\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "-668", "425", "31", null, null, this);
            obj.set_taborder("35");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "1122", "0", "25", "1388", null, null, this);
            obj.set_taborder("41");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Div("div_payInfo", "absolute", "700", "40", "422", "160", null, null, this);
            obj.set_taborder("4");
            obj.style.set_background("@gradation");
            obj.set_scrollbars("none");
            obj.set_enable("false");
            this.addChild(obj.name, obj);
            obj = new Div("div_card", "absolute", "0%", "60", "422", "98", null, null, this.div_payInfo);
            obj.set_taborder("1");
            obj.style.set_background("@gradation");
            obj.set_scrollbars("none");
            obj.set_visible("false");
            this.div_payInfo.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "0", "0", "422", "31", null, null, this.div_payInfo.div_card);
            obj.set_taborder("1");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_payInfo.div_card.addChild(obj.name, obj);
            obj = new Static("st_C_custNm", "absolute", "0", "0", "80", "31", null, null, this.div_payInfo.div_card);
            obj.set_taborder("9");
            obj.set_text("카드주명");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_payInfo.div_card.addChild(obj.name, obj);
            obj = new Edit("ed_C_custNm", "absolute", "84", "5", "122", "21", null, null, this.div_payInfo.div_card);
            obj.set_taborder("0");
            obj.set_maxlength("80");
            obj.set_enable("false");
            this.div_payInfo.div_card.addChild(obj.name, obj);
            obj = new Static("st_C_ebirDay", "absolute", "210", "0", "80", "31", null, null, this.div_payInfo.div_card);
            obj.set_taborder("10");
            obj.set_text("법정생년월일");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_payInfo.div_card.addChild(obj.name, obj);
            obj = new MaskEdit("ed_C_ebirDay", "absolute", "295", "5", "122", "21", null, null, this.div_payInfo.div_card);
            obj.set_taborder("11");
            obj.set_type("string");
            obj.set_mask("######");
            obj.set_enable("false");
            this.div_payInfo.div_card.addChild(obj.name, obj);
            obj = new Static("st_C_buslNo", "absolute", "210", "0", "80", "31", null, null, this.div_payInfo.div_card);
            obj.set_taborder("12");
            obj.set_text("사업자번호");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.set_visible("false");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_payInfo.div_card.addChild(obj.name, obj);
            obj = new MaskEdit("ed_C_buslNo", "absolute", "294", "5", "123", "21", null, null, this.div_payInfo.div_card);
            obj.set_taborder("2");
            obj.set_type("string");
            obj.set_mask("###-##-#####");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_payInfo.div_card.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "0", "30", "422", "31", null, null, this.div_payInfo.div_card);
            obj.set_taborder("13");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_payInfo.div_card.addChild(obj.name, obj);
            obj = new Static("st_C_bankCd", "absolute", "0", "30", "80", "31", null, null, this.div_payInfo.div_card);
            obj.set_taborder("14");
            obj.set_text("카드사");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_payInfo.div_card.addChild(obj.name, obj);
            obj = new Combo("cb_C_bankCd", "absolute", "84", "35", "122", "21", null, null, this.div_payInfo.div_card);
            this.div_payInfo.div_card.addChild(obj.name, obj);
            obj.set_taborder("3");
            obj.set_innerdataset("@ds_C_bank");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_enable("false");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new Static("st_C_acctNo", "absolute", "210", "30", "80", "31", null, null, this.div_payInfo.div_card);
            obj.set_taborder("15");
            obj.set_text("카드번호");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_payInfo.div_card.addChild(obj.name, obj);
            obj = new Edit("ed_C_cardNo", "absolute", "294", "35", "123", "21", null, null, this.div_payInfo.div_card);
            obj.set_taborder("4");
            obj.set_maxlength("16");
            obj.set_enable("false");
            obj.set_inputtype("number");
            this.div_payInfo.div_card.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "0", "60", "422", "31", null, null, this.div_payInfo.div_card);
            obj.set_taborder("16");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_payInfo.div_card.addChild(obj.name, obj);
            obj = new Static("st_C_expireYM", "absolute", "0", "60", "80", "31", null, null, this.div_payInfo.div_card);
            obj.set_taborder("17");
            obj.set_text("유효년월");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_payInfo.div_card.addChild(obj.name, obj);
            obj = new MaskEdit("ed_C_expireY", "absolute", "140", "65", "40", "21", null, null, this.div_payInfo.div_card);
            obj.set_taborder("6");
            obj.set_type("string");
            obj.set_mask("####");
            obj.set_enable("false");
            this.div_payInfo.div_card.addChild(obj.name, obj);
            obj = new Static("st_y", "absolute", "186", "65", "20", "21", null, null, this.div_payInfo.div_card);
            obj.set_taborder("18");
            obj.set_text("년");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_payInfo.div_card.addChild(obj.name, obj);
            obj = new MaskEdit("ed_C_expireM", "absolute", "84", "65", "25", "21", null, null, this.div_payInfo.div_card);
            obj.set_taborder("5");
            obj.set_type("string");
            obj.set_mask("##");
            obj.set_enable("false");
            this.div_payInfo.div_card.addChild(obj.name, obj);
            obj = new Static("st_m", "absolute", "116", "65", "20", "21", null, null, this.div_payInfo.div_card);
            obj.set_taborder("19");
            obj.set_text("월");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_payInfo.div_card.addChild(obj.name, obj);
            obj = new Static("st_C_bankPayDay", "absolute", "210", "60", "80", "31", null, null, this.div_payInfo.div_card);
            obj.set_taborder("20");
            obj.set_text("결제일");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_payInfo.div_card.addChild(obj.name, obj);
            obj = new Combo("cb_C_bankPayDay", "absolute", "294", "65", "60", "21", null, null, this.div_payInfo.div_card);
            this.div_payInfo.div_card.addChild(obj.name, obj);
            obj.set_taborder("7");
            obj.set_displaynulltext("선택");
            obj.set_innerdataset("ds_C_bankPayDay");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj.set_index("-1");
            obj = new Button("btn_cardConfirm", "absolute", "359", "65", "58", "21", null, null, this.div_payInfo.div_card);
            obj.set_taborder("8");
            obj.set_text("카드인증");
            obj.getSetter("domainId").set("nexa.save");
            this.div_payInfo.div_card.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "0", "30", "422", "31", null, null, this.div_payInfo);
            obj.set_taborder("4");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_payInfo.addChild(obj.name, obj);
            obj = new Static("st_payMthd", "absolute", "0", "30", "80", "31", null, null, this.div_payInfo);
            obj.set_taborder("5");
            obj.set_text("결제방법");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_payInfo.addChild(obj.name, obj);
            obj = new Combo("cb_payMthd", "absolute", "84", "35", "80", "21", null, null, this.div_payInfo);
            this.div_payInfo.addChild(obj.name, obj);
            obj.set_taborder("0");
            obj.set_displaynulltext("선택");
            obj.set_innerdataset("@ds_payMthd");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new Static("st_payCustTp", "absolute", "236", "30", "54", "31", null, null, this.div_payInfo);
            obj.set_taborder("6");
            obj.set_text("구분");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_payInfo.addChild(obj.name, obj);
            obj = new Combo("cb_payCustTp", "absolute", "294", "35", "123", "21", null, null, this.div_payInfo);
            this.div_payInfo.addChild(obj.name, obj);
            obj.set_taborder("2");
            obj.set_displaynulltext("선택");
            obj.set_innerdataset("@ds_payCustTp");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_enable("false");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj.set_index("-1");
            obj = new Button("btn_payChoice", "absolute", "169", "35", "62", "21", null, null, this.div_payInfo);
            obj.set_taborder("7");
            obj.set_text("불러오기");
            obj.getSetter("domainId").set("nexa.save");
            this.div_payInfo.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "720", "-170", "425", "31", null, null, this.div_payInfo);
            obj.set_taborder("8");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_payInfo.addChild(obj.name, obj);
            obj = new Static("Static21", "absolute", "0", "5", "80", "21", null, null, this.div_payInfo);
            obj.set_taborder("9");
            obj.set_text("결제정보");
            obj.set_cssclass("sta_WF_subTitle");
            this.div_payInfo.addChild(obj.name, obj);
            obj = new CheckBox("ed_ebirDayCheck", "absolute", "84", "5", "120", "16", null, null, this.div_payInfo);
            obj.set_taborder("10");
            obj.set_text("생년월일체크");
            obj.set_value("true");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_payInfo.addChild(obj.name, obj);
            obj = new CheckBox("ed_buslNoCheck", "absolute", "204", "5", "120", "16", null, null, this.div_payInfo);
            obj.set_taborder("11");
            obj.set_text("사업자번호체크");
            obj.set_value("true");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_payInfo.addChild(obj.name, obj);
            obj = new Button("btn_custNew", "absolute", "372", "5", "50", "21", null, null, this.div_payInfo);
            obj.set_taborder("12");
            obj.set_text("신규");
            obj.getSetter("domainId").set("nexa.save");
            this.div_payInfo.addChild(obj.name, obj);
            obj = new Div("div_acc", "absolute", "0%", "60", "422", "96", null, null, this.div_payInfo);
            obj.set_taborder("3");
            obj.style.set_background("@gradation");
            obj.set_scrollbars("none");
            this.div_payInfo.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "0", "0", "422", "31", null, null, this.div_payInfo.div_acc);
            obj.set_taborder("1");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_payInfo.div_acc.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "0", "30", "422", "31", null, null, this.div_payInfo.div_acc);
            obj.set_taborder("2");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_payInfo.div_acc.addChild(obj.name, obj);
            obj = new Static("st_B_bankCd", "absolute", "0", "30", "80", "31", null, null, this.div_payInfo.div_acc);
            obj.set_taborder("3");
            obj.set_text("은행");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_payInfo.div_acc.addChild(obj.name, obj);
            obj = new Combo("cb_B_bankCd", "absolute", "85", "35", "120", "21", null, null, this.div_payInfo.div_acc);
            this.div_payInfo.div_acc.addChild(obj.name, obj);
            obj.set_taborder("5");
            obj.set_innerdataset("@ds_B_bank");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_enable("false");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new Static("st_B_acctNo", "absolute", "210", "30", "80", "31", null, null, this.div_payInfo.div_acc);
            obj.set_taborder("9");
            obj.set_text("계좌번호");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_payInfo.div_acc.addChild(obj.name, obj);
            obj = new Edit("ed_B_acctNo", "absolute", "295", "35", "120", "21", null, null, this.div_payInfo.div_acc);
            obj.set_taborder("6");
            obj.set_maxlength("20");
            obj.set_enable("false");
            obj.set_inputtype("number");
            this.div_payInfo.div_acc.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "0", "60", "422", "31", null, null, this.div_payInfo.div_acc);
            obj.set_taborder("10");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_payInfo.div_acc.addChild(obj.name, obj);
            obj = new Static("st_B_bankPayDay", "absolute", "0", "60", "80", "31", null, null, this.div_payInfo.div_acc);
            obj.set_taborder("11");
            obj.set_text("결제일");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_payInfo.div_acc.addChild(obj.name, obj);
            obj = new Combo("cb_B_bankPayDay", "absolute", "85", "65", "60", "21", null, null, this.div_payInfo.div_acc);
            this.div_payInfo.div_acc.addChild(obj.name, obj);
            obj.set_taborder("7");
            obj.set_displaynulltext("선택");
            obj.set_innerdataset("@ds_B_bankPayDay");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new Button("btn_accConfirm", "absolute", "151", "65", "50", "21", null, null, this.div_payInfo.div_acc);
            obj.set_taborder("8");
            obj.set_text("계좌인증");
            obj.getSetter("domainId").set("nexa.save");
            this.div_payInfo.div_acc.addChild(obj.name, obj);
            obj = new Static("st_B_custNm", "absolute", "0", "0", "80", "31", null, null, this.div_payInfo.div_acc);
            obj.set_taborder("12");
            obj.set_text("예금주명");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_payInfo.div_acc.addChild(obj.name, obj);
            obj = new Edit("ed_B_custNm", "absolute", "85", "5", "120", "21", null, null, this.div_payInfo.div_acc);
            obj.set_taborder("0");
            obj.set_maxlength("80");
            obj.set_enable("false");
            this.div_payInfo.div_acc.addChild(obj.name, obj);
            obj = new Static("st_B_buslNo", "absolute", "210", "0", "80", "31", null, null, this.div_payInfo.div_acc);
            obj.set_taborder("13");
            obj.set_text("사업자번호");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.set_visible("false");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_payInfo.div_acc.addChild(obj.name, obj);
            obj = new MaskEdit("ed_B_buslNo", "absolute", "295", "5", "120", "21", null, null, this.div_payInfo.div_acc);
            obj.set_taborder("14");
            obj.set_type("string");
            obj.set_mask("###-##-#####");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_payInfo.div_acc.addChild(obj.name, obj);
            obj = new MaskEdit("ed_B_ebirDay", "absolute", "295", "5", "120", "21", null, null, this.div_payInfo.div_acc);
            obj.set_taborder("4");
            obj.set_type("string");
            obj.set_mask("######");
            obj.set_enable("false");
            this.div_payInfo.div_acc.addChild(obj.name, obj);
            obj = new Static("st_B_ebirDay", "absolute", "210", "0", "80", "31", null, null, this.div_payInfo.div_acc);
            obj.set_taborder("15");
            obj.set_text("법정생년월일");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_payInfo.div_acc.addChild(obj.name, obj);
            obj = new Static("st_B_arsCall", "absolute", "210", "60", "80", "31", null, null, this.div_payInfo.div_acc);
            obj.set_taborder("16");
            obj.set_text("이체동의");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_payInfo.div_acc.addChild(obj.name, obj);
            obj = new Button("btn_arsCall", "absolute", "295", "65", "80", "21", null, null, this.div_payInfo.div_acc);
            obj.set_taborder("17");
            obj.set_text("출금이체동의");
            obj.getSetter("domainId").set("nexa.save");
            this.div_payInfo.div_acc.addChild(obj.name, obj);

            obj = new Edit("ed_grpYn", "absolute", "355", "32", "90", "20", null, null, this);
            obj.set_taborder("43");
            obj.set_enable("false");
            obj.set_displaynulltext("고객결합여부");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_grpNo", "absolute", "255", "32", "97", "20", null, null, this);
            obj.set_taborder("44");
            obj.set_enable("false");
            obj.set_displaynulltext("고객결합번호");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static17", "absolute", "0", "0", "352", "31", null, null, this);
            obj.set_taborder("47");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_ordNo", "absolute", "0", "0", "100", "31", null, null, this);
            obj.set_taborder("48");
            obj.set_text("계약번호");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_orderNo", "absolute", "104", "5", "150", "20", null, null, this);
            obj.set_taborder("49");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Button("btn_orderNoSearch", "absolute", "258", "5", "89", "21", null, null, this);
            obj.set_taborder("50");
            obj.set_text("계약번호찾기");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new CheckBox("ch_resultPayInfo", "absolute", "128", "32", "125", "16", null, null, this);
            obj.set_taborder("52");
            obj.set_text("카드인증성공여부");
            obj.set_enable("false");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new CheckBox("ch_resultArsCall", "absolute", "0", "32", "125", "16", null, null, this);
            obj.set_taborder("53");
            obj.set_text("출금이체동의여부");
            obj.set_enable("false");
            obj.set_visible("false");
            obj.set_falsevalue("0");
            obj.set_truevalue("1");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "366", "0", "406", "31", null, null, this);
            obj.set_taborder("54");
            obj.set_text("Static01");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_ContractSt", "absolute", "440", "6", "104", "20", null, null, this);
            obj.set_taborder("56");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("st_MntStd", "absolute", "362", "0", "73", "31", null, null, this);
            obj.set_taborder("57");
            obj.set_text("계약상태");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("st_grpPkgNum", "absolute", "549", "0", "119", "31", null, null, this);
            obj.set_taborder("58");
            obj.set_text("패키지번호");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_grpPkgNum", "absolute", "673", "6", "93", "20", null, null, this);
            obj.set_taborder("59");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "866", "0", "256", "31", null, null, this);
            obj.set_taborder("61");
            obj.set_text("Static01");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_prevContNum", "absolute", "866", "0", "94", "31", null, null, this);
            obj.set_taborder("62");
            obj.set_text("이전계약번호");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_preAgreNum", "absolute", "965", "6", "150", "20", null, null, this);
            obj.set_taborder("63");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "0", "417", "89", "21", null, null, this);
            obj.set_taborder("67");
            obj.set_text("판매정보");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("st_MntStd02", "absolute", "770", "0", "97", "31", null, null, this);
            obj.set_taborder("69");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Button("btnGrpContSearch", "absolute", "774", "5", "89", "21", null, null, this);
            obj.set_taborder("70");
            obj.set_text("패키지조회");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "0%", "441", null, "31", "697", null, this);
            obj.set_taborder("82");
            obj.set_text("Static05");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_SalePrdtNm", "absolute", "120", "441", "87", "31", null, null, this);
            obj.set_taborder("84");
            obj.set_text("판매상품명");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("st_BtnSalePrdt", "absolute", "0", "441", "121", "31", null, null, this);
            obj.set_taborder("85");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_SaleCd", "absolute", "44.73%", "447", null, "21", "42.81%", null, this);
            obj.set_taborder("90");
            obj.set_enable("false");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Button("btn_SalePrdtSearch", "absolute", "15", "446", "89", "21", null, null, this);
            obj.set_taborder("91");
            obj.set_text("판매상품조회");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "0", "493", "89", "21", null, null, this);
            obj.set_taborder("92");
            obj.set_text("제품정보");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Grid("Grid00", "absolute", "0", "515", null, "173", "12", null, this);
            obj.set_taborder("93");
            obj.set_autofittype("none");
            obj.set_binddataset("ds_productInfo");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"33\"/><Column size=\"90\"/><Column size=\"90\"/><Column size=\"108\"/><Column size=\"249\"/><Column size=\"89\"/><Column size=\"91\"/><Column size=\"40\"/><Column size=\"94\"/><Column size=\"87\"/><Column size=\"119\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell text=\"선택\"/><Cell col=\"1\" text=\"상품코드\"/><Cell col=\"2\" text=\"대체코드\"/><Cell col=\"3\" text=\"장착위치\"/><Cell col=\"4\" text=\"상품명\"/><Cell col=\"5\" text=\"렌탈기간\"/><Cell col=\"6\" text=\"계절구분\"/><Cell col=\"7\" text=\"본수\"/><Cell col=\"8\" text=\"렌탈등록비\"/><Cell col=\"9\" text=\"렌탈료\"/><Cell col=\"10\" text=\"판매채널할인\"/></Band><Band id=\"body\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\" text=\"bind:chk\"/><Cell col=\"1\" text=\"bind:matCd\"/><Cell col=\"2\" text=\"bind:matCdS\"/><Cell col=\"3\" text=\"bind:frNm\"/><Cell col=\"4\" text=\"bind:matNm\"/><Cell col=\"5\" text=\"bind:periodNm\"/><Cell col=\"6\" text=\"bind:seasonNm\"/><Cell col=\"7\" text=\"bind:cntNm\"/><Cell col=\"8\" displaytype=\"number\" text=\"bind:regiAmt\"/><Cell col=\"9\" displaytype=\"number\" text=\"bind:rentAmt\"/><Cell col=\"10\" displaytype=\"number\" text=\"bind:chnlSale\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Button("btnAddPrdt", "absolute", "1001", "486", "71", "22", null, null, this);
            obj.set_taborder("94");
            obj.set_text("제품추가");
            obj.set_cssclass("btn_WF_CRUD");
            this.addChild(obj.name, obj);

            obj = new Button("btnAddPrdtDel", "absolute", "1077", "486", "45", "22", null, null, this);
            obj.set_taborder("95");
            obj.set_text("삭제");
            obj.set_cssclass("btn_WF_CRUD");
            this.addChild(obj.name, obj);

            obj = new Grid("Grid01", "absolute", "0%", "724", null, "157", "12", null, this);
            obj.set_taborder("96");
            obj.set_autofittype("col");
            obj.set_binddataset("ds_ValuePrdtInfo");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"17\"/><Column size=\"84\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"30\"/><Column size=\"62\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell text=\"선택\"/><Cell col=\"1\" text=\"부가제품명\"/><Cell col=\"2\" text=\"금액\"/><Cell col=\"3\" text=\"할인금액\"/><Cell col=\"4\" text=\"실판매가\"/><Cell col=\"5\" text=\"할부\"/><Cell col=\"6\" style=\"padding: ;\" text=\"월렌탈료\"/><Cell col=\"7\" text=\"제조사\"/><Cell col=\"8\" text=\"제품군\"/><Cell col=\"9\" text=\"특징\"/></Band><Band id=\"body\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\" text=\"bind:chk\"/><Cell col=\"1\" style=\"align:left;\" text=\"bind:addGdsNm\"/><Cell col=\"2\" displaytype=\"number\" style=\"align:right;padding:0 6 0 0;\" text=\"bind:amt\" mask=\"###,###,###,##0\"/><Cell col=\"3\" displaytype=\"number\" style=\"align:right;padding:0 3 0 0;\" text=\"bind:dcAmt\" mask=\"###,###,###,##0\"/><Cell col=\"4\" displaytype=\"number\" style=\"align:right;padding:0 5 0 0;\" text=\"bind:actAmt\" mask=\"###,###,###,##0\"/><Cell col=\"5\" displaytype=\"normal\" edittype=\"none\" text=\"bind:dcYn\"/><Cell col=\"6\" displaytype=\"number\" style=\"align:right;padding:0 4 0 0;\" text=\"bind:monAmt\" mask=\"###,###,###,##0\"/><Cell col=\"7\" style=\"align:left;\" text=\"bind:makerNm\"/><Cell col=\"8\" displaytype=\"combo\" style=\"align:left;\" text=\"bind:gdsGrp\" combodataset=\"comGrp\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"9\" style=\"align:left;\" text=\"bind:gdsDesc\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static07", "absolute", "0", "701", "101", "21", null, null, this);
            obj.set_taborder("97");
            obj.set_text("부가제품정보");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Button("btnValuePrdtAdd", "absolute", null, "696", "97", "22", "62", null, this);
            obj.set_taborder("98");
            obj.set_text("부가제품추가");
            obj.set_cssclass("btn_WF_CRUD");
            this.addChild(obj.name, obj);

            obj = new Button("btnValuePrdtDel", "absolute", "1077", "696", "45", "22", null, null, this);
            obj.set_taborder("99");
            obj.set_text("삭제");
            obj.set_cssclass("btn_WF_CRUD");
            this.addChild(obj.name, obj);

            obj = new Static("Static08", "absolute", "0", "912", "111", "21", null, null, this);
            obj.set_taborder("100");
            obj.set_text("프리미엄서비스");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Grid("Grid02", "absolute", "0", "937", null, "188", "613", null, this);
            obj.set_taborder("101");
            obj.set_autofittype("col");
            obj.set_binddataset("ds_seviceCd");
            obj.set_autoupdatetype("comboselect");
            obj.set_cellclickbound("cell");
            obj.set_cellsizingtype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"144\"/><Column size=\"57\"/><Column size=\"69\"/><Column size=\"78\"/><Column size=\"87\"/><Column size=\"85\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell text=\"상세서비스\"/><Cell col=\"1\" text=\"기간\"/><Cell col=\"2\" text=\"타이어본수\"/><Cell col=\"3\" text=\"서비스횟수\"/><Cell col=\"4\" text=\"금액\"/><Cell col=\"5\" text=\"할인액\"/></Band><Band id=\"body\"><Cell text=\"bind:prsNm\"/><Cell col=\"1\" displaytype=\"normal\" style=\"align:right;padding:0 6 0 0;\" text=\"bind:periodNm\"/><Cell col=\"2\" text=\"bind:cntNm\"/><Cell col=\"3\" displaytype=\"combo\" edittype=\"combo\" text=\"bind:servCnt\" combodataset=\"ds_svrCnt\" combocodecol=\"cd\" combodatacol=\"cdNm\" combodisplay=\"display\"/><Cell col=\"4\" displaytype=\"number\" style=\"align:right;\" text=\"bind:servAmtSum\" mask=\"###,###,###,##0\"/><Cell col=\"5\" displaytype=\"number\" style=\"align:right;\" text=\"bind:saleAmt\" mask=\"###,###,###,##0\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static09", "absolute", "532", "913", "135", "21", null, null, this);
            obj.set_taborder("104");
            obj.set_text("계약상품 납부정보");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Grid("Grid03", "absolute", "531", "937", null, "188", "12", null, this);
            obj.set_taborder("105");
            obj.set_autofittype("col");
            obj.set_binddataset("ds_contactDeliInfo");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"85\"/><Column size=\"138\"/><Column size=\"54\"/><Column size=\"79\"/><Column size=\"79\"/><Column size=\"75\"/><Column size=\"80\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell style=\"align:center;\" text=\"제품/서비스코드\" wordwrap=\"char\"/><Cell col=\"1\" text=\"제품명\"/><Cell col=\"2\" text=\"렌탈기간(개월)\" wordwrap=\"char\"/><Cell col=\"3\" text=\"일시불\"/><Cell col=\"4\" text=\"월 렌탈료\"/><Cell col=\"5\" text=\"등록비\"/><Cell col=\"6\" text=\"할인액\"/></Band><Band id=\"body\"><Cell text=\"bind:matCd\" wordwrap=\"none\"/><Cell col=\"1\" text=\"bind:matNm\"/><Cell col=\"2\" text=\"bind:periodNm\"/><Cell col=\"3\" displaytype=\"number\" style=\"align:right;padding:0 9 0 0;\" text=\"bind:amt\" mask=\"###,###,###,##0\"/><Cell col=\"4\" displaytype=\"number\" style=\"align:right;padding:0 10 0 0;\" text=\"bind:rentAmt\" mask=\"###,###,###,##0\"/><Cell col=\"5\" displaytype=\"number\" style=\"align:right;padding:0 5 0 0;\" text=\"bind:regiAmt\" mask=\"###,###,###,##0\"/><Cell col=\"6\" displaytype=\"number\" style=\"align:right;padding:0 5 0 0;\" text=\"bind:dcAmt\" mask=\"###,###,###,##0\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static10", "absolute", "0", "1152", "111", "21", null, null, this);
            obj.set_taborder("106");
            obj.set_text("합계 납부정보");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Grid("Grid04", "absolute", "0", "1180", null, "51", "12", null, this);
            obj.set_taborder("107");
            obj.set_enable("true");
            obj.set_autofittype("col");
            obj.set_binddataset("ds_sumPayInfo");
            obj.set_autosizebandtype("summary");
            obj.set_createcellasync("false");
            obj.set_selecttype("row");
            obj.set_autoupdatetype("comboselect");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"58\"/><Column size=\"88\"/><Column size=\"78\"/><Column size=\"75\"/><Column size=\"84\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell text=\"등록비\"/><Cell col=\"1\" text=\"등록비조정\"/><Cell col=\"2\" text=\"일시불\"/><Cell col=\"3\" text=\"월렌탈료\"/><Cell col=\"4\" text=\"합계할인액\"/></Band><Band id=\"body\"><Cell displaytype=\"number\" edittype=\"none\" text=\"bind:regiAmt\" mask=\"###,###,###,##0\"/><Cell col=\"1\" displaytype=\"combo\" edittype=\"combo\" text=\"bind:regiAmtChg\" combodataset=\"ds_RegAmtMgnt\" combocodecol=\"cd\" combodatacol=\"cdNm\" combodisplay=\"display\"/><Cell col=\"2\" displaytype=\"number\" text=\"bind:amt\"/><Cell col=\"3\" displaytype=\"number\" text=\"bind:rentAmt\"/><Cell col=\"4\" displaytype=\"number\" text=\"bind:sumSaleAmt\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Edit("p_periodCd", "absolute", "8.37%", "490", null, "20", "82.91%", null, this);
            obj.set_taborder("108");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Div("div_preminum", "absolute", "-2", "1538", "529", "170", null, null, this);
            obj.set_taborder("109");
            obj.style.set_background("@gradation");
            obj.set_scrollbars("none");
            obj.set_enable("false");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_SaleProdNm", "absolute", "213", "447", "220", "20", null, null, this);
            obj.set_taborder("111");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Edit("p_cntCd", "absolute", "17.52%", "490", "50", "20", null, null, this);
            obj.set_taborder("112");
            obj.set_visible("false");
            obj.set_value("0");
            this.addChild(obj.name, obj);

            obj = new Button("btn_payRegiAmt", "absolute", "80.99%", "1242", null, "21", "9.07%", null, this);
            obj.set_taborder("113");
            obj.set_text("등록비 일시불납부");
            obj.set_enable("false");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Button("btn_GrpSave", "absolute", "91.37%", "1242", "76", "21", null, null, this);
            obj.set_taborder("114");
            obj.set_text("주문서저장");
            obj.set_cssclass("btn_WF_CRUD");
            this.addChild(obj.name, obj);

            obj = new Grid("Grid05", "absolute", "60.16%", "1616", null, "80", "10.9%", null, this);
            obj.set_taborder("115");
            obj.set_binddataset("ds_rtsd0401");
            obj.set_visible("false");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/></Columns><Rows><Row band=\"head\" size=\"24\"/><Row band=\"body\" size=\"24\"/></Rows><Band id=\"head\"><Cell col=\"0\" disptype=\"normal\" text=\"ordNo\"/><Cell col=\"1\" disptype=\"normal\" text=\"agencyCd\"/><Cell col=\"2\" disptype=\"normal\" text=\"reqDay\"/><Cell col=\"3\" disptype=\"normal\" text=\"procDay\"/><Cell col=\"4\" disptype=\"normal\" text=\"procTm\"/><Cell col=\"5\" disptype=\"normal\" text=\"mobNo\"/><Cell col=\"6\" disptype=\"normal\" text=\"bldMngNo\"/><Cell col=\"7\" disptype=\"normal\" text=\"posCd\"/><Cell col=\"8\" disptype=\"normal\" text=\"addr1\"/><Cell col=\"9\" disptype=\"normal\" text=\"addr2\"/><Cell col=\"10\" disptype=\"normal\" text=\"statCd\"/><Cell col=\"11\" disptype=\"normal\" text=\"memo\"/></Band><Band id=\"body\"><Cell col=\"0\" disptype=\"normal\" text=\"bind:ordNo\"/><Cell col=\"1\" disptype=\"normal\" text=\"bind:agencyCd\"/><Cell col=\"2\" disptype=\"normal\" text=\"bind:reqDay\"/><Cell col=\"3\" disptype=\"normal\" text=\"bind:procDay\"/><Cell col=\"4\" disptype=\"normal\" text=\"bind:procTm\"/><Cell col=\"5\" disptype=\"normal\" text=\"bind:mobNo\"/><Cell col=\"6\" disptype=\"normal\" text=\"bind:bldMngNo\"/><Cell col=\"7\" disptype=\"normal\" text=\"bind:posCd\"/><Cell col=\"8\" disptype=\"normal\" text=\"bind:addr1\"/><Cell col=\"9\" disptype=\"normal\" text=\"bind:addr2\"/><Cell col=\"10\" disptype=\"normal\" text=\"bind:statCd\"/><Cell col=\"11\" disptype=\"normal\" text=\"bind:memo\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Edit("p_seasonCd", "absolute", "22.41%", "490", "50", "20", null, null, this);
            obj.set_taborder("116");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Radio("ra_sale", "absolute", "99", "48", "233", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("45");
            obj.set_innerdataset("@ds_sale");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_direction("vertical");
            obj.set_visible("false");

            obj = new CheckBox("chk_rcStockYn", "absolute", "27.11%", "492", null, "20", "64.69%", null, this);
            obj.set_taborder("117");
            obj.set_text("RC재고유무");
            obj.set_visible("false");
            obj.set_falsevalue("N");
            obj.set_truevalue("Y");
            obj.set_value("N");
            this.addChild(obj.name, obj);

            obj = new Div("div_stockUseChk", "absolute", "547", "1416", "301", "26", null, null, this);
            obj.set_taborder("118");
            this.addChild(obj.name, obj);
            obj = new CheckBox("ch_chainYn", "absolute", "0.33%", "1", null, "21", "36.21%", null, this.div_stockUseChk);
            obj.set_taborder("0");
            obj.set_text("직영도매 재고사용");
            obj.set_enable("false");
            obj.set_falsevalue("N");
            obj.set_truevalue("Y");
            obj.set_value("N");
            this.div_stockUseChk.addChild(obj.name, obj);
            obj = new CheckBox("ch_winterYn", "absolute", "48.17%", "1", null, "21", "5.32%", null, this.div_stockUseChk);
            obj.set_taborder("1");
            obj.set_text("윈터 매입재고 사용");
            obj.set_enable("false");
            obj.set_falsevalue("N");
            obj.set_truevalue("Y");
            this.div_stockUseChk.addChild(obj.name, obj);

            obj = new ImageViewer("btn_refresh", "absolute", null, "6", "19", "19", "1048", null, this);
            obj.set_taborder("119");
            obj.style.set_background("URL('image::alert_confirm.png') stretch");
            obj.style.set_border("0 none #808080ff");
            obj.style.set_cursor("hand");
            obj.set_visible("false");
            obj.set_tooltiptext("갱신");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 681, 152, this.div_custInfo.div_custInfoDetail,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("193");
            		p.style.set_background("@gradation");

            	}
            );
            this.div_custInfo.div_custInfoDetail.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 681, 273, this.div_custInfo,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("3");
            		p.style.set_background("@gradation");
            		p.set_scrollbars("none");

            	}
            );
            this.div_custInfo.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 422, 140, this.div_carInfo,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("5");
            		p.style.set_background("@gradation");
            		p.set_scrollbars("none");
            		p.set_enable("false");
            		p.set_visible("true");

            	}
            );
            this.div_carInfo.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1122, 241, this.div_installInfo,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("7");
            		p.style.set_background("@gradation");
            		p.set_scrollbars("none");
            		p.set_enableevent("true");
            		p.set_enable("false");

            	}
            );
            this.div_installInfo.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1122, 70, this.div_salesmanInfo,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("8");
            		p.style.set_background("@gradation");
            		p.set_scrollbars("none");
            		p.set_visible("true");
            		p.set_enable("false");

            	}
            );
            this.div_salesmanInfo.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 672, 101, this.div_etcInfo,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("9");
            		p.style.set_background("@gradation");
            		p.set_scrollbars("none");
            		p.set_enableevent("true");
            		p.set_enable("false");

            	}
            );
            this.div_etcInfo.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 422, 98, this.div_payInfo.div_card,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("1");
            		p.style.set_background("@gradation");
            		p.set_scrollbars("none");
            		p.set_visible("false");

            	}
            );
            this.div_payInfo.div_card.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 422, 96, this.div_payInfo.div_acc,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("3");
            		p.style.set_background("@gradation");
            		p.set_scrollbars("none");

            	}
            );
            this.div_payInfo.div_acc.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 422, 160, this.div_payInfo,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("4");
            		p.style.set_background("@gradation");
            		p.set_scrollbars("none");
            		p.set_enable("false");

            	}
            );
            this.div_payInfo.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 529, 170, this.div_preminum,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("109");
            		p.style.set_background("@gradation");
            		p.set_scrollbars("none");
            		p.set_enable("false");
            		p.set_visible("false");

            	}
            );
            this.div_preminum.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 301, 26, this.div_stockUseChk,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("118");

            	}
            );
            this.div_stockUseChk.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1147, 1582, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTSDOrderRegister");
            		p.set_scrollbars("autoboth");
            		p.set_titletext("계약등록");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item24","div_custInfo.ed_buslNo","value","ds_rtsd0100","buslNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item22","div_custInfo.cb_custTp","value","ds_rtsd0100","custTp");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item25","div_custInfo.ed_birthDay","value","ds_rtsd0100","birthDay");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item27","div_custInfo.ed_custNm","value","ds_rtsd0100","custNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item23","div_custInfo.ed_custNo","value","ds_rtsd0100","custNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item28","div_custInfo.ed_repNm","value","ds_rtsd0100","repNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item29","div_custInfo.cb_genderCd","value","ds_rtsd0100","genderCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item30","div_custInfo.cb_lfCd","value","ds_rtsd0100","lfCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item31","div_custInfo.ed_telNo","value","ds_rtsd0100","telNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item26","div_payInfo.cb_payMthd","value","ds_rtsd0104","payMthd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item1","div_payInfo.div_card.ed_C_custNm","value","ds_rtre0020","custNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item2","div_payInfo.div_card.ed_C_ebirDay","value","ds_rtre0020","ebirDay");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item3","div_payInfo.div_card.ed_C_buslNo","value","ds_rtre0020","buslNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item4","div_payInfo.div_card.cb_C_bankCd","value","ds_rtre0020","cardcomCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item5","div_payInfo.div_card.ed_C_cardNo","value","ds_rtre0020","cardNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item45","div_payInfo.div_card.ed_C_expireY","value","ds_rtre0020","expireY");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item46","div_payInfo.div_card.ed_C_expireM","value","ds_rtre0020","expireM");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item9","div_payInfo.div_acc.cb_B_bankCd","value","ds_rtre0010","bankCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item10","div_payInfo.div_acc.ed_B_acctNo","value","ds_rtre0010","acctNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item11","div_carInfo.cb_makerCd","value","ds_rtsd0104","makerCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item13","div_carInfo.ed_carOwner","value","ds_rtsd0104","carOwner");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item14","div_carInfo.ed_carNo","value","ds_rtsd0104","carNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item15","div_carInfo.ed_cMileage","value","ds_rtsd0104","cMileage");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item16","div_installInfo.ed_agencyCd","value","ds_rtsd0104","agencyCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item33","div_custInfo.ed_busiType","value","ds_rtsd0100","busiType");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item34","div_custInfo.ed_busiCond","value","ds_rtsd0100","busiCond");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item12","div_carInfo.ed_model","value","ds_rtsd0104","modelCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item6","div_payInfo.div_acc.ed_B_custNm","value","ds_rtre0010","custNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item8","div_payInfo.div_acc.ed_B_buslNo","value","ds_rtre0010","buslNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item7","div_payInfo.div_acc.ed_B_ebirDay","value","ds_rtre0010","ebirDay");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item32","div_custInfo.div_custInfoDetail.ed_mobNo","value","ds_rtsd0100","mobNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item35","div_custInfo.div_custInfoDetail.cb_mobFirm","value","ds_rtsd0100","mobFirm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item36","div_custInfo.div_custInfoDetail.ed_emailAddr1","value","ds_rtsd0100","emailAddr");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item37","div_custInfo.div_custInfoDetail.ed_posCd","value","ds_rtsd0100","posCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item38","div_custInfo.div_custInfoDetail.ed_addr1","value","ds_rtsd0100","addrSum1");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item39","div_custInfo.div_custInfoDetail.ed_posCd2","value","ds_rtsd0100","posCd2");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item40","div_custInfo.div_custInfoDetail.ed_addr12","value","ds_rtsd0100","addrSum2");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item42","div_custInfo.div_custInfoDetail.ed_telNo2","value","ds_rtsd0100","telNo2");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item17","div_installInfo.cal_procDay","value","ds_rtsd0104","procDay");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item43","div_installInfo.ed_agencyNm","value","ds_rtsd0104","agencyNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item44","ed_grpNo","value","ds_rtsd0104","grpNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item47","ed_grpYn","value","ds_rtsd0104","grpYn");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item48","div_installInfo.ed_salesOffice","value","ds_rtsd0104","salesOffice");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item49","div_installInfo.ed_salesGroup","value","ds_rtsd0104","salesGroup");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item21","div_etcInfo.cal_ordDay","value","ds_rtsd0104","ordDay");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item18","div_etcInfo.cb_conMthd","value","ds_rtsd0104","conMthd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item19","div_custInfo.div_custInfoDetail.cb_credit","value","ds_rtsd0104","crdtStat");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item20","ra_sale","value","ds_rtsd0104","saleId");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item0","ed_orderNo","value","ds_rtsd0104","ordNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item41","div_custInfo.div_custInfoDetail.ra_certification","value","ds_rtsd0104","certCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item50","div_salesmanInfo.cb_orgAgent","value","ds_rtsd0104","ordAgent");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item51","div_custInfo.ed_Ccustnm","value","ds_rtsd0100","cCustnm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item52","div_custInfo.ed_cTelno","value","ds_rtsd0100","cTelno");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item53","ed_ContractSt","value","ds_rtsd0104","statNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item54","ed_grpPkgNum","value","ds_rtsd0104","grpNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item55","ed_preAgreNum","value","ds_rtsd0104","bordNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item65","ed_SaleCd","value","ds_rtsd0104","saleCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item66","div_installInfo.ed_visitTel","value","ds_rtsd0213","iplMobNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item63","div_carInfo.ed_contentsCd","value","ds_rtsd0104","contentsCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item56","ed_SaleProdNm","value","ds_rtsd0104","saleNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item57","div_carInfo.ed_frCd","value","ds_rtsd0104","frCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("bind_posCd","div_installInfo.ed_posCd00","value","ds_rtsd0104","inst1Poscd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("bind_addr1","div_installInfo.ed_addr00","value","ds_rtsd0104","inst1Addr1");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("bind_addr2","div_installInfo.ed_detl_addr00","value","ds_rtsd0104","inst1Addr2");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item58","div_installInfo.ed_posCd01","value","ds_rtsd0104","inst2Poscd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item59","div_installInfo.ed_addr01","value","ds_rtsd0104","inst2Addr1");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item60","div_installInfo.ed_detl_addr01","value","ds_rtsd0104","inst2Addr2");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item61","div_installInfo.cb_time","value","ds_rtsd0104","instTm");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTSDContractRegister.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDContractRegister.xfdl", function() {
        /***************************************************************************************************
         * 파 일 명 : RTSDContractRegister.xfdl
         * 설    명 : 주문등록
         * 작 성 자 :
         * 변경이력 :
         * 변경일자		변경자		변경내용
         * ----------	------		--------
         * ...			...			...
         * 2016-09-26	wjim		온라인장착 가능여부 추가
         * 2016-12-06	wjim		[20161206_02] 사용자그룹 추가작업
         *							- '콜센터(아웃바운드)'(13) 추가
         *							- '콜센터'(02)와 동일한 권한 부여
         * 2018-02-12	wjim		[20180212_01] 선택형 프리미엄 서비스 도입
         *							- 프리미엄 서비스 정보 세팅 시점 변경
         *							- '상품-가격정보' 선택 > 프리미엄서비스 팝업 선택
         * 2019-09-03	wjim		[20190903_01] 차량번호 체계 변경 대응
         *							- 2019.09 부터 8자리(ex.111거1234) 차량번호 배정
         *							- 차량번호 검증로직 보완
         ***************************************************************************************************/

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //include "lib::comLib.xjs";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.p_arg 			= "RTSDContractRegister";
        this.resultOrdNo 	= "0";
        this.p_modelCd  	= "";
        this.p_makerCd 		= "";
        this.p_contentsCd 	= "";
        this.p_frCd 		= "";
        this.selectGrpNo 	= "0";	//고객결합번호
        this.selectSaleCd	= 0;
        this.payAddRowFlag  = true;
        this.accCardCheck   = false;//계좌인증 확인여부. true일때만 저장가능.
        this.orgAgtel		= "";
        this.toDay 			= "";   //현재날짜
        this.addDay			= "";	//현재날짜+3
        this.addDay_2		= "";	//현재날짜+2
        this.selectChanCd	= "XX";

        //판매상품조회 관련 셋팅.
        this.SaleManCd		= "";
        this.saleManCdNm	= "";

        this.userGrp 		= application.gds_userInfo.getColumn(0,"userGrp");	//사용자 그룹 		--> *01:영업관리자, *02:콜센터, *03:지사, *04:지점, *05:대리점, *13:콜센터(아웃바운드)
        trace("this.userGrp:"+this.userGrp);
        this.userId  		= application.gds_userInfo.getColumn(0,"userId");	
        this.onlineLoginId	= "ONL_SYS";
        this.certificationFlag	= false;

        this.reRental       = false; //[김선태]재렌탈 추가
        this.regiAmtRt		= "0";	 // 재렌탈 등록비 할인율 초기화
        this.payStatCd      = "";  	// 현재 상태 초기화

        this.addPrdtAmt		= "";

        this.resultOordNo   = "0";
        this.o2oAgencyStockCnt = "0"; //20200317 kstka 거점재고정보 초기화
        this.o2oAgencyStockTot = "0"; //20200317 kstka 거점재고정보 초기화
        this.o2oAgencyYn = "N";       //20210622 kstka 거점여부 초기화
        this.beforeAfterDay = ""; //20200317 kstka 오늘 기준 D+N일뒤 일자

        this.o2oCarAreaCheck = "N"; //20200721 kstka 방문점검차량 배차 가능여부

        this.checkCanOrder = "N"; //[20220616_01] 주문가능여부 확인 플래그

        //[20230210_1] kstka 주문등록:01, 주문수정:02
        //====================================================================================
        this.ADD = "01";
        this.MODIFY = "02";

        this.orgMatNm = "";
        this.orgCntCd = "";
        this.orgAgencyCd = "";
        this.orgAgencyNm = "";
        this.orgProcDay = "";
        this.mode = this.ADD;
        //====================================================================================
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        /*★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ */
        //공통 fn_callBack START
        /*★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ */
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg,resultCnt){
        	if (strSvcId == "initRTSDContractRegister"){
        		
        		this.fn_getToday();
        		this.FN_cust01();
        		
        		var insert1 = this.ds_B_bankPayDay.insertRow( 0 );
        		this.ds_B_bankPayDay.setColumn(insert1,"cd","-1");
        		this.ds_B_bankPayDay.setColumn(insert1,"cdNm","선택");
        		
        		var insert2 = this.ds_C_bankPayDay.insertRow( 0 );
        		this.ds_C_bankPayDay.setColumn(insert2,"cd","-1");
        		this.ds_C_bankPayDay.setColumn(insert2,"cdNm","선택");

        		
        		//var orgAgentCt= this.ds_orgAgent.getRowCount();
        		//if( orgAgentCt != 0 ){
        		//	var insert = this.ds_orgAgent.insertRow( 0 );
        		//	this.ds_orgAgent.setColumn(insert,"cd"," ");
        		//	this.ds_orgAgent.setColumn(insert,"cdNm","선택");
        		//	this.div_salesmanInfo.cb_orgAgent.set_value(" ");
        		//}
        		
        		
        		//[20210806_01] 대리점인경우 직영도매 거래선 여부 확인
        		if(this.userGrp == "05"){
        			var sSvcID        	= "rentalAgencyInfo";
        			var sController   	= "rtms/sd/detailAgencyInfo.do";
        			var sInDatasets   	= "";
        			var sOutDatasets  	= "ds_agencyInfo=ds_output";
        			var sArgs 			= "";	
        			var fn_callBack		= "fn_callBack";
        			this.ds_agencyInfo.deleteAll();
        			sArgs += Ex.util.setParam("agencyCd" , this.userId);
        			sArgs += Ex.util.setParam("userId"   , "");
        			sArgs += Ex.util.setParam("userGrp"   , "");
        			Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        		}
        	}
        	if(strSvcId == "rentalAgencyInfo"){
        		//this.alert(this.ds_agencyInfo.getColumn(0, "chainYn"));
        	}
        	if(strSvcId == "sRtsd0113UserGrp"){
        		var rtsd0113Cnt = this.ds_rtsd0113.getRowCount();
        		var regId 		= this.ds_rtsd0100.getColumn(0,"regId");
        		var custTp 		= this.ds_rtsd0100.getColumn(0,"custTp");

        		if( rtsd0113Cnt != 0 ){
        			//[20161206_02]
        			//[20230210_1] kstka
        			//===========================================================================================================================================================
        			if( (this.userGrp == "02") || (this.userGrp == "09") || (this.userGrp == "13") || (this.userGrp == "01" && regId != this.onlineLoginId && custTp != "02" ) ){
        			//if( (this.userGrp == "02") || (this.userGrp == "09") || (this.userGrp == "13") || (this.userGrp == "01" && regId != this.onlineLoginId && custTp == "02" ) ){
        			//=============================================================================================================================================================
        				for( var i = 0 ; i < rtsd0113Cnt ; i++ ){
        					var cd   = this.ds_rtsd0113.getColumn(i, "cd");
        					var cdNm = this.ds_rtsd0113.getColumn(i, "cdNm");
        					var nRow = this.ds_rtsd0113Combo.addRow();
        					this.ds_rtsd0113Combo.setColumn(nRow, "cd", cd);
        					this.ds_rtsd0113Combo.setColumn(nRow, "cdNm", cdNm);
        				}
        				trace("this.userGrp:"+this.userGrp);
        				if( this.userGrp == "09" ){
        					var findRow = this.ds_rtsd0113Combo.findRow( "cd", this.userId );
        					if(	findRow != -1 ){
        						this.div_salesmanInfo.cb_orgAgent.set_value(this.userId);
        						this.div_salesmanInfo.cb_orgAgent.set_enable(false);
        						
        						//판매상품정보 조회위한 셋팅.
        						this.SaleManCd		= nvl(this.userId);

        					}else{
        						alert("판매불가한 판매원입니다.");
        						return this.go("sd::RTSDContractRegister.xfdl");
        					}
        				}else{
        					this.div_salesmanInfo.cb_orgAgent.set_enable(true);
        				}
        			}
        		}
        	}
        	/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        	if(strSvcId == "getToday"){
         		var sSvcID      	= "selectFirstDay";  
         		var sController   	= "/rtms/sd/selectFirstDay.do";
        		var sInDatasets   	= "";
         		var sOutDatasets  	= "";
         		var sArgs 			= "";	
         		var fn_callBack		= "fn_callBack";
         		sArgs += Ex.util.setParam("toDay"	,this.toDay); 
         		sArgs += Ex.util.setParam("term"	,"2");
         		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);

        	}
        	/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        	if(strSvcId == "selectFirstDay"){		
        		
        		var sSvcID      	= "selectBeforeAfterDay";  
        		var sController   	= "/rtms/sd/selectBeforeAfterDay.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= Ex.util.setParam("serchGb", "+");	
        		    sArgs 			+= Ex.util.setParam("days", "2");
        		    sArgs           += Ex.util.setParam("stdDay",this.toDay); 
        		var fn_callBack		= "fn_callBack";		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        	/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        	if(strSvcId == "selectBeforeAfterDay"){	
        		
        		//2021년 12월 31일 주문접수 불가 처리 (영업관리자/콜센터제외)
        		if(this.userGrp != "01" && this.userGrp != "02"){
        			if(this.toDay == "20211231"){
        				this.btn_orderNoSearch.set_enable(false);
        				this.btn_GrpSave.set_enable(false);
        				this.div_custInfo.set_enable(false);
        				this.alert("당일은 주문접수가 불가합니다.");
        			}else{
        				this.btn_orderNoSearch.set_enable(true);
        				this.btn_GrpSave.set_enable(true);
        				this.div_custInfo.set_enable(true);
        			}
        		}
        	}
        	/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        	if(strSvcId == "listRtsd0104"){
        		
        		var rtsd0104Cnt = this.ds_rtsd0104.getRowCount();
        		
        		if( rtsd0104Cnt != 0 ){
        			if(nvl(this.ds_rtsd0104.getColumn(0,"grpNo")) != '' && nvl(this.ds_rtsd0104.getColumn(0,"grpNo").substring(0,1)) == 'D') {
        				alert("단체계약건은 단체주문등록 메뉴를 이용해 주시기 바랍니다.");
        				this.FN_initializationDataSet();
        				return;
        			}
        			if(nvl(this.ds_rtsd0104.getColumn(0,"ordNo").substring(0,1)) == 'L') {
        				alert("일시불 주문등록은 일시불 주문등록 메뉴를 이용해 주시기 바랍니다.");
        				this.FN_initializationDataSet();
        				return;
        			}
        			if(nvl(this.ds_rtsd0104.getColumn(0,"ordNo").substring(0,1)) == 'P') {
        				alert("멤버십 주문등록은 멤버십 주문등록 메뉴를 이용해 주시기 바랍니다.");
        				this.FN_initializationDataSet();
        				return;
        			}
        			
        			
        			this.p_makerCd 		= nvl(this.ds_rtsd0104.getColumn(0,"makerCd"));
        			this.p_modelCd 		= nvl(this.ds_rtsd0104.getColumn(0,"modelCd"));
        			this.p_contentsCd 	= nvl(this.ds_rtsd0104.getColumn(0,"contentsCd"));
        			this.p_frCd 		= nvl(this.ds_rtsd0104.getColumn(0,"frCd"));
        			
        			this.div_carInfo_cb_makerCd_onitemchanged();
        			
        			//판매상품조회 2018.10.25 추가
        			this.ed_SaleProdNm.set_value(nvl(this.ds_rtsd0104.getColumn(0,"saleNm")));
        			//this.ed_SalePrdtNm.set_value(nvl(this.ds_rtsd0104.getColumn(0,"prdtGrpNm")));
        			//this.ed_SaleChanNm.set_value(nvl(this.ds_rtsd0104.getColumn(0,"chanNm")));
        			//this.ed_SaleHshopGbNm.set_value(nvl(this.ds_rtsd0104.getColumn(0,"hshopGbNm")));
        			
        			this.periodCd = nvl(this.ds_rtsd0104.getColumn(0,"periodCd"));
        			
        			if(this.periodCd != ''){
        				this.p_periodCd.set_value(this.periodCd);
        			}
        			
        			var payMthd = nvl(this.ds_rtsd0104.getColumn(0,"payMthd"));
        			var payDd 	= nvl(this.ds_rtsd0104.getColumn(0,"payDd"));
        			if( payMthd == "A" ){
        				this.div_payInfo.div_acc.cb_B_bankPayDay.set_value(payDd);
        			}else if( payMthd == "C" ){
        				this.div_payInfo.div_card.cb_C_bankPayDay.set_value(payDd);
        			}else{
        			
        			}
        			
        			this.ds_rtsd0104.getColumn(0,"cmsagYn") == "Y" ?  this.div_etcInfo.ch_cmsagYn.set_value(true) : this.div_etcInfo.ch_cmsagYn.set_value(false);
        			this.ds_rtsd0104.getColumn(0,"pcertYn") == "Y" ?  this.div_etcInfo.ch_pcertYn.set_value(true) : this.div_etcInfo.ch_pcertYn.set_value(false);
        			
        			this.div_salesmanInfo_cb_orgAgent_onitemchanged();
        			
        			//this.FN_listRtsd0106();

        			if(nvl(this.ds_rtsd0104.getColumn(0,"ordNo")) != "") {
        				//this.fn_SalePrdtSearch();	// 계약별 판매상품 불러오기
        				this.fn_searchProduct(); 	// 계약별 제품정보 불러오기
        				this.fn_searchAdtProduct(); // 계약별 부가상품 불러오기
        				this.fn_searchPrmmSrvc(); 	// 계약별 프리미엄 서비스  불러오기	
        				this.fn_cntPrdPymInfoList(); // 계약상품 납부정보 
        			}

        			//판매상품관련 버튼 활성, 비활성 처리
        			if(nvl(this.ds_rtsd0104.getColumn(0,"statCd")) == "00") {
        				this.btn_payRegiAmt.set_enable(true);
        				this.btn_SalePrdtSearch.set_enable(false);
        				
        				this.btnAddPrdtDel.set_enable(true);
        				this.btnValuePrdtAdd.set_enable(true);
        				this.btnValuePrdtDel.set_enable(true);
        				//this.btnSvcAdd.set_enable(true);
        				//this.btnSvcDel.set_enable(true);
        				
        				//-----2+2미허용
        				if(this.ds_productInfo.getRowCount() < 1){ 					
        					this.btnAddPrdt.set_enable(false);
        				}else{
        					this.btnAddPrdt.set_enable(true);				
        				}
        				
        				//-----2+2허용
        				// this.btnAddPrdt.set_enable(true);	
        			
        			} else {
        				this.btn_payRegiAmt.set_enable(false);
        				this.btn_SalePrdtSearch.set_enable(false);
        				this.btnAddPrdt.set_enable(false);
        				this.btnAddPrdtDel.set_enable(false);
        				this.btnValuePrdtAdd.set_enable(false);
        				this.btnValuePrdtDel.set_enable(false);
        				//this.btnSvcAdd.set_enable(false);
        				//this.btnSvcDel.set_enable(false);
        			}
        		
        			
        		}else{
        			alert("계약조회 :계약정보가 없습니다.");
        		}
        		
        		var rtsd0100Cnt = this.ds_rtsd0100.getRowCount();
        		if( rtsd0100Cnt != 0 ){
        			this.div_custInfo_cb_custTp_onitemchanged();
        			this.FN_telNoChange();
        			this.div_custInfo.cb_custTp.set_value(this.ds_rtsd0100.getColumn(0,"custTp"));
        		}else{
        			alert("계약조회 : 고객정보가 없습니다.");
        		}
        		
        		var rtsd0110Cnt = this.ds_rtsd0110.getRowCount();
        		if( rtsd0110Cnt != 0 ){
        			this.div_custInfo.div_custInfoDetail.ra_certification.set_value( this.ds_rtsd0110.getColumn(0, "certCd") );
        			var certCd = nvl(this.ds_rtsd0110.getColumn(0, "certCd"));
        			if(certCd == "02"){
        				this.div_etcInfo.ch_pcertYn.set_value(true);
        			}else{
        				this.div_etcInfo.ch_pcertYn.set_value(false);
        				this.certificationFlag = true; // 2016-06-13 이영근, 휴대폰 인증한 경우
        			}
        		}else{
        			//alert("계약조회 : 본인인증 이력정보가 없습니다.");
        		}
        		
        		var rtsd0111Cnt = this.ds_rtsd0111.getRowCount();
        		if( rtsd0111Cnt != 0 ){
        			this.div_custInfo.div_custInfoDetail.cb_nagYn.set_value( this.ds_rtsd0111.getColumn(this.ds_rtsd0111.rowposition, "nagYn") );
        		}else{
        			//alert("계약조회 : 개인정보제공 동의정보가 없습니다.");
        		}
        		
        		
        		var rtre0010Cnt = this.ds_rtre0010.getRowCount();
        		var rtre0020Cnt = this.ds_rtre0020.getRowCount();
        		if( rtre0010Cnt != 0 ){
        			this.div_payInfo.cb_payCustTp.set_value( this.ds_rtre0010.getColumn(0,"custTp") );
        			this.ch_resultPayInfo.set_value( this.ds_rtre0010.getColumn(0,"accChk") == "Y" ? true : false);
        			this.payAddRowFlag = false;
        			this.div_payInfo_cb_payMthd_onitemchanged();
        			this.FN_payInfo_enable(true);
        		}else{
        		}
        		if( rtre0020Cnt != 0 ){
        			//[20230210_1] kstka
        			//===============================================================================================
        			//this.ds_rtre0020.set_updatecontrol(false);
        			//===============================================================================================
        			var sExpireYm = nvl(this.ds_rtre0020.getColumn(0,"expireYm"));
        			var sExpireY = "";
        			var sExpireM = "";
        			if(sExpireYm != ""){
        				if(sExpireYm.length == 6){
        					sExpireY = sExpireYm.substr(0,4);
        					sExpireM = sExpireYm.substr(4,2);
        				}
        			}
        			this.ds_rtre0020.setColumn(0, "expireY", sExpireY);
        			this.ds_rtre0020.setColumn(0, "expireM", sExpireM);
        			//[20230210_1] kstka
        			//===============================================================================================
        			//this.ds_rtre0020.setRowType(0, Dataset.ROWTYPE_NORMAL);			
        			//this.ds_rtre0020.set_updatecontrol(true);
        			//===============================================================================================
        			this.div_payInfo.cb_payCustTp.set_value( this.ds_rtre0020.getColumn(0,"custTp") );
        			this.ch_resultPayInfo.set_value( this.ds_rtre0020.getColumn(0,"bkeyChk") == "Y" ? true : false);
        			this.payAddRowFlag = false;
        			this.div_payInfo_cb_payMthd_onitemchanged();
        			this.FN_payInfo_enable(true);
        		}else{
        		}
        		
        		if( rtre0010Cnt == 0 && rtre0020Cnt == 0 ){
        			//alert("계약조회 : 결제정보가 없습니다.");
        		}
        		this.FN_divChangeTrue();
        		
        		//[20230210_1] kstka
        		//=====================================================================
        		this.btn_SalePrdtSearch.set_enable(true);
        		
        		//주문관련 정보 정상조회되면 수정모드로 변경
        		if( rtsd0104Cnt == 0 || rtsd0100Cnt == 0 || (rtre0010Cnt == 0 && rtre0020Cnt == 0)  ){
        			this.mode = this.ADD;
        		}else{
        			this.mode = this.MODIFY;
        			
        			//화면명 변경
        			var objs = this.parent.components;
        			for( var i=0; i<objs.length; i++ ) {
        				var object 		= objs[i];
        				var name		= object.name.replace("ds_div_form_","");
        				if(name == "Static20"){
        					object.set_text("주문등록(수정)");
        				}
        			}
        		}
        		//=====================================================================
        		
        		this.payStatCd= nvl(this.ds_rtsd0104.getColumn(this.ds_rtsd0104.rowposition, "statCd"));
        		
        		if(this.payStatCd == '00'){
        			this.Grid04.setCellProperty("body", this.Grid04.getBindCellIndex("body", "regiAmtChg"), "displaytype", "combo");
        			this.Grid04.setCellProperty("body", this.Grid04.getBindCellIndex("body", "regiAmtChg"), "edittype", "combo");
        			this.btn_payRegiAmt.set_enable(true);
        			this.btn_GrpSave.set_enable(true);	// 저장버튼
        		}else{
        			this.Grid04.setCellProperty("body", this.Grid04.getBindCellIndex("body", "regiAmtChg"), "displaytype", "normal");
        			this.Grid04.setCellProperty("body", this.Grid04.getBindCellIndex("body", "regiAmtChg"), "edittype", "none");
        			this.btn_payRegiAmt.set_enable(false);  // 등록비 일시불납부 버튼
        			//this.btn_GrpSave.set_enable(false);
        			this.div_custInfo.btn_custNoSearch.set_enable(false);			//고객조회 disable (20190208)
        	
        			//[20230210_1] kstka
        			//=====================================================================
        			this.FN_divChangeFalse();
        			//=====================================================================
        		}

        	}		
        	/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        	if(strSvcId == "listRtsd0106"){
        		var prdInfoCnt = this.ds_productInfo.getRowCount(); // 제품정보
        		if( prdInfoCnt == 0 ){
        			this.alert("계약조회 : 제품정보가 없습니다.");
        		}
        		
        		/*
        		var rtsd0106Cnt= this.ds_rtsd0106.getRowCount();
        		if( rtsd0106Cnt != 0){
        		}else{
        		}
        		
        		var priceCnt = this.ds_price.getRowCount();
        		if( priceCnt != 0 ){
        			this.ds_price.setColumn(0,"cDcamt", this.ds_rtsd0104.getColumn(0,"cDcamt"));
        			this.ds_price.setColumn(0,"campYn", this.ds_rtsd0104.getColumn(0,"campYn"));
        			this.ds_price.setColumn(0,"gDcrate", this.ds_rtsd0104.getColumn(0,"gDcrate"));
        			this.ds_price.setColumn(0,"gDcamt", this.ds_rtsd0104.getColumn(0,"gDcamt"));
        			this.ds_price.setColumn(0,"lDcrate", this.ds_rtsd0104.getColumn(0,"lDcrate"));
        			this.ds_price.setColumn(0,"lDcamt", this.ds_rtsd0104.getColumn(0,"lDcamt"));
        			this.ds_price.setColumn(0,"fDcamt", this.ds_rtsd0104.getColumn(0,"fDcamt"));
        			
        			this.ds_price.setColumn(0,"monAmt", this.ds_rtsd0106.getColumn(0,"monAmt"));
        			this.ds_price.setColumn(0,"matDesc", this.ds_rtsd0106.getColumn(0,"matDesc"));
        		}else{
        			alert("계약조회 : 상품 정보가 없습니다.");
        		}
        		
        		var rtsd0013Cnt = this.ds_rtsd0013.getRowCount();
        		if( rtsd0013Cnt != 0 ){
        		}else{
        			//alert("계약조회 : 계약별 프리미엄서비스 정보가 없습니다.");
        		}
        		
        		var rtsd0014Cnt = this.ds_rtsd0014.getRowCount();
        		if( rtsd0014Cnt != 0 ){
        		}else{
        			//alert("계약조회 : 계약별 캠페인적용 정보가 없습니다.");
        		}
        		*/
        	}
        	/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        	if(strSvcId == "listModelCombo"){
        		if( nvl(this.p_modelCd) != "" && nvl(this.p_makerCd) != "" && nvl(this.p_contentsCd) != "" && nvl(this.p_frCd) ){
        			var nRow = this.ds_model.findRowExpr("makerCd == '"+nvl(this.p_makerCd)+"'&& modelCd == '"+nvl(this.p_modelCd)+"'&& contentsCd == '"+nvl(this.p_contentsCd)+"'&& frCd == '" + nvl(this.p_frCd) +"'",-1);
        			var selectRow = this.ds_model.set_rowposition(nRow);
        			this.div_carInfo.cb_model.set_value( this.ds_model.getColumn(selectRow,"rn") );
        			this.p_modelCd="";
        			this.p_makerCd="";
        			this.p_contentsCd="";
        			this.p_frCd="";
        		}
        		
        		//[20210726_01] nice dnr 모듈 연동
        		if(this.ds_niceDnr.rowcount > 0){						
        			var modelCd = this.ds_niceDnr.getColumn(0, "modelCd");			
        			var nRow = this.ds_model.findRow("modelCd", modelCd);
        			this.div_carInfo.cb_model.set_index(nRow);
        		}
        		
        		//판매상품 조회버튼 제어
        		var cb_orgAgent = nvl(this.div_salesmanInfo.cb_orgAgent.value);
        		var ed_agencyCd = nvl(this.div_installInfo.ed_agencyCd.value);

        		//this.payStatCd= nvl(this.ds_rtsd0104.getColumn(this.ds_rtsd0104.rowposition, "statCd"));

        		if(this.payStatCd == ''){
        			if((cb_orgAgent != null && cb_orgAgent != "")
        				|| (ed_agencyCd != null && ed_agencyCd != "")
        				|| this.userGrp == '01' || this.userGrp == '05' || this.userGrp == '16') {
        				this.btn_SalePrdtSearch.set_enable(true);
        			} else {
        				this.btn_SalePrdtSearch.set_enable(false);
        			}
        		} else {
        			if(this.reRental) {
        				if(nvl(this.ds_rtsd0104.getColumn(0, "statCd") == '')) {
        					if((cb_orgAgent != null && cb_orgAgent != "")
        						|| (ed_agencyCd != null && ed_agencyCd != "")
        						|| this.userGrp == '01') {
        						this.btn_SalePrdtSearch.set_enable(true);
        					} else {
        						this.btn_SalePrdtSearch.set_enable(false);
        					}
        				} else {
        					this.btn_SalePrdtSearch.set_enable(false);
        				}
        			} else {			
        				//[20230210_1] kstka
        				//========================================================================
        				//this.btn_SalePrdtSearch.set_enable(false);
        				
        				if(this.userGrp == '01' || this.userGrp == '02') {
        					this.btn_SalePrdtSearch.set_enable(true);
        					this.btnAddPrdt.set_enable(true);
        					this.btnAddPrdtDel.set_enable(true);
        				}else{
        					this.btn_SalePrdtSearch.set_enable(false);
        				}
        				//========================================================================
        			}
        		}
        	
        	}
        	/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        	if(strSvcId == "listCustInfo"){
        		//고객결합여부
        		if( nvl(this.selectGrpNo) != "0" ){
        			this.ed_grpNo.set_value(nvl(this.selectGrpNo));
        			this.ed_grpYn.set_value("Y");
        		}else{
        			this.ed_grpNo.set_value("");
        			this.ed_grpYn.set_value("N");
        		}
        		
        		var rtsd0110Cnt = this.ds_rtsd0110.getRowCount();
        		if( rtsd0110Cnt != 0){
        			var certCd = nvl(this.ds_rtsd0110.getColumn(0, "certCd"));
        			this.div_custInfo.div_custInfoDetail.ra_certification.set_value( certCd );
        			if(certCd == "02"){
        				this.div_etcInfo.ch_pcertYn.set_value(true);
        			}else{
        				this.div_etcInfo.ch_pcertYn.set_value(false);
        				this.certificationFlag = true; // 2016-06-13 이영근, 휴대폰 인증한 경우
        			}
        		}else{
        			//alert("계약조회 : 본인인증 이력정보가 없습니다.");
        		}
        		
        		var rtsd0111Cnt = this.ds_rtsd0111.getRowCount();
        		if( rtsd0111Cnt != 0){
        			this.div_custInfo.div_custInfoDetail.cb_nagYn.set_value( this.ds_rtsd0111.getColumn(this.ds_rtsd0111.rowposition, "nagYn") );
        		}else{
        			//alert("계약조회 : 개인정보제공 동의정보가 없습니다.");
        		}
        	}
        	/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        // 	if(strSvcId == "selectRtsd0108SaleCdCount"){
        // 		if( nvl(this.selectSaleCd) != 0 ){
        // 			this.ra_sale.set_value("02");
        // 		}else{
        // 			this.ra_sale.set_value("01");
        // 		}
        // 	}
        	
        	if(strSvcId == "selectRtsd0108SaleCdCount"){
        		if( this.reRental == true){ //[김선태]재렌탈 추가
        			this.ra_sale.set_value("04");
        		}else{
        			this.ra_sale.set_value("01");
        		}
        	}
        	/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        	/* if(strSvcId == "listRateAmt"){
        		var cnt = this.ds_rateAmt.getRowCount();
        		if( cnt != 0 ){
        			this.ds_price.setColumn(0, "cDcamt", this.ds_rateAmt.getColumn(0, "cDcamt"));
        			this.ds_price.setColumn(0, "campYn", this.ds_rateAmt.getColumn(0, "campYn"));
        			this.ds_price.setColumn(0, "gDcrate", this.ds_rateAmt.getColumn(0, "gDcrate"));
        			this.ds_price.setColumn(0, "gDcamt", this.ds_rateAmt.getColumn(0, "gDcamt"));
        			this.ds_price.setColumn(0, "lDcrate", this.ds_rateAmt.getColumn(0, "lDcrate"));
        			this.ds_price.setColumn(0, "lDcamt", this.ds_rateAmt.getColumn(0, "lDcamt"));
        			this.ds_price.setColumn(0, "fDcamt", this.ds_rateAmt.getColumn(0, "fDcamt"));
        			this.ds_price.setColumn(0, "monAmt", this.ds_rateAmt.getColumn(0, "monAmt"));
        			
        			this.FN_applyRtsd0014();
        		}
        	} */
        	/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        	/* if(strSvcId == "preminumList"){
        		var cnt = this.ds_rtsd0013.getRowCount();
        		if( cnt != 0 ){
        			for( var i = 0 ; i < this.ds_rtsd0013.getRowCount() ; i++){
        				this.ds_rtsd0013.setColumn(i, "servCnt0", this.ds_rtsd0013.getColumn(i, "servVnt"));
        				this.ds_rtsd0013.setColumn(i, "servCntr", this.ds_rtsd0013.getColumn(i, "servVnt"));
        			}
        		}else{
        			
        		}
        	} */
        	/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        	if (strSvcId == "saveContractRegister"){
        		if(nErrorCode != "0"){
        			this.btn_GrpSave.set_enable(true);
        		}
        		
        		if(nErrorCode == "-2"){
        			alert(strErrorMsg);
        		}else if( nErrorCode == "0" && this.resultOrdNo != "0" ){
        		
        			if( confirm( strErrorMsg +"\n저장된 계약번호는 \'"+this.resultOrdNo+"\' 입니다." + "\n저장된 계약번호로 조회하시겠습니까?") ){
        				this.accCardCheck   = false;
        				this.ds_sumPayInfo.clearData();
        				//alert(this.resultOordNo);
        				this.FN_listRtsd0104( this.resultOrdNo );
        				//this.fn_regiAmtPayPass( this.resultOrdNo );c
        			}else{
        				//this.fn_regiAmtPayPass( this.resultOrdNo );
        				this.reload();
        			}
        		}else{
        			alert(strErrorMsg);
        		}
        	}
        	/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        	if(strSvcId == "niceTrustInfoCnt") {
        		if(this.dsNice.getRowCount() > 0) {
        			var userCrGrade = this.dsNice.getColumn(0, "crGrade");	//사용자권한
        			var commCrGrade = this.dsNice.getColumn(0, "cdLevel");	//체크권한	

        			//if(parseInt(userCrGrade) > commCrGrade) {
        			if(parseInt(userCrGrade) < commCrGrade) {	//[20201214_01] kstka 신용등급 -> 신용평점 상위점수일수록 높은등급 (600점부터)
        				alert('신용결과 계약불가입니다.');
        				this.div_custInfo.div_custInfoDetail.cb_credit.set_value("N");
        				return;
        			}else{
        				this.div_custInfo.div_custInfoDetail.cb_credit.set_value("Y");
        				//this.div_custInfo.div_custInfoDetail.btn_check.set_enable(true);
        				this.FN_divChangeTrue();
        			}
        		} else {	//저장된 자료가 없는경우 새롭게 인증진행
        			var safekey = nvl(this.ds_rtsd0100.getColumn(0,"safekey"));
        			var sSvcID        	= "niceTrustInfo";                    
        			var sController   	= "rtms/sd/niceTrustInfo.do";
        			var sInDatasets   	= "";
        			var sOutDatasets  	= "dsNice2=dsNiceCheck";
        			var sArgs 			= "";	
        			var fn_callBack		= "fn_callBack";
        			sArgs += Ex.util.setParam("safekey",safekey);
        			Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        		}
        	}
        	/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        	if(strSvcId == "niceTrustInfo") {
        		var returnCode = this.dsNice2.getColumn(0, "returnCode");	//성공여부
        		var commCrGrade = this.dsNice2.getColumn(0, "cdLevel");		//체크권한
        		var userCrGrade = this.dsNice2.getColumn(0, "trustLevel");	//사용자권한
        		if( returnCode == "P000" ){
        			//if(parseInt(userCrGrade) > commCrGrade) {
        			if(parseInt(userCrGrade) < commCrGrade) {	//[20201214_01] kstka 신용등급 -> 신용평점 상위점수일수록 높은등급
        				alert('신용결과 계약불가입니다.');
        				this.div_custInfo.div_custInfoDetail.cb_credit.set_value("N");
        				return;
        			}else{
        				this.div_custInfo.div_custInfoDetail.cb_credit.set_value("Y");
        				//this.div_custInfo.div_custInfoDetail.btn_check.set_enable(true);
        				this.FN_divChangeTrue();
        			}
        		}else{
        			//this.alert(application.gv_host);
        			if(application.gv_host == "http://localhost/" || application.gv_host == "http://1.254.67.135:9080/" || application.gv_host == "http://211.215.175.231:9080/"){
        				alert("개발용: 신용조회 무시");
        				this.div_custInfo.div_custInfoDetail.cb_credit.set_value("Y");
        				this.div_custInfo.div_custInfoDetail.btn_check.set_enable(true);
        				this.FN_divChangeTrue();			
        			}else{
        				alert("신용조회를 실패하였습니다.");	
        			}
        		}
        	}
        	/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        	if(strSvcId == "checkCancOrder") {	
        	
        		if(nErrorCode == "-1"){
        			this.div_custInfo.div_custInfoDetail.cb_credit.set_value("N");
        		}else{
        			this.div_custInfo.div_custInfoDetail.cb_credit.set_value("Y");
        			this.FN_divChangeTrue();
        		}
        	}
        	
        	/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        	if(strSvcId == "existsBisinessSearch") {
        		if(this.dsBis2.getRowCount() > 0) {
        			var yn = this.dsBis2.getColumn(0, "gradeYn");//신용평가정보가 존재하는경우....grade정보 유효성체크
        			if(yn == "N") {
        				alert("해당 법인의 사업자번호는 주문을 진행하실수 없습니다.");
        				return false;
        			}else{
        			
        			}
        		} else {
        		
        			this.createNiceBusinessInfo();//당일 법인등록기준이 없는경우 법인신용평가Interface실행
        		}
        	}
        	/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        	if(strSvcId == "niceBisinessSearch") {
        		var  gradeYn = this.dsBis.getColumn(0, "gradeYn");
        		if(gradeYn == "N") {
        			alert("해당 법인의 사업자번호는 주문을 진행하실수 없습니다.");
        			return false;
        		}else{
        		
        		}
        	}
        	/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        	if(strSvcId == "batchService"){
        		if(nvl(this.dsBatch.getColumn(0,"res_cd")) == "0000" && nvl( this.dsBatch.getColumn(0, "batchKey") ) != "" ) {
        			alert("카드인증을 성공하였습니다.");
        			this.ch_resultPayInfo.set_value(true);
        			this.div_payInfo.set_enable(false);
        			this.ds_rtre0020.setColumn(0,"batchKey",nvl( this.dsBatch.getColumn(0, "batchKey") ) );
        		}else{
        			if(application.gv_host == "http://localhost/" || application.gv_host == "http://1.254.67.135:9080/" || application.gv_host == "http://211.215.175.231:9080/"){
        				alert("개발용: 카드조회 무시");
        				this.ch_resultPayInfo.set_value(true);
        				this.div_payInfo.set_enable(false);
        				this.ds_rtre0020.setColumn(0,"batchKey","1234567890" );			
        			}else{		
        				alert("카드인증을 실패하였습니다.");
        				this.ch_resultPayInfo.set_value(false);
        			}
        		}
        		this.accCardCheck = true;
        		this.saveBatchResult();
        	}
        	/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        	if(strSvcId == "batchResultService"){
        		
        	}
        	/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        	if(strSvcId == "kftcCmsDocInfo"){
        		if(nvl(this.dsBatch.getColumn(0,"returnCode")) == "0000") {
        			alert('계좌인증 성공하였습니다');
        			this.ch_resultPayInfo.set_value(true);
        			//this.div_payInfo.set_enable(false);
        			this.div_payInfo.div_acc.ed_B_custNm.set_enable(false);
        			this.div_payInfo.div_acc.cb_B_bankCd.set_enable(false);
        			this.div_payInfo.div_acc.ed_B_acctNo.set_enable(false);
        		}
        		else {
        			if(application.gv_host == "http://localhost/" || application.gv_host == "http://1.254.67.135:9080/" || application.gv_host == "http://211.215.175.231:9080/"){
        				alert("개발용: 계좌인증 무시");
        				this.ch_resultPayInfo.set_value(true);
        				this.div_payInfo.div_acc.ed_B_custNm.set_enable(false);
        				this.div_payInfo.div_acc.cb_B_bankCd.set_enable(false);
        				this.div_payInfo.div_acc.ed_B_acctNo.set_enable(false);			
        			}else{		
        				alert('계좌인증 실패하였습니다');
        				this.ch_resultPayInfo.set_value(false);
        			}
        		}
        		this.accCardCheck = true;
        	}
        	if(strSvcId == "arsCallService"){
        		if(nErrorCode != "0"){
        			//this.alert("출금이체동의에 실패하였습니다.\n["+strErrorMsg+"]");
        			//this.ch_resultArsCall.set_value(false);
        			if (application.gv_host == "http://localhost/" || application.gv_host == "http://1.254.67.135:9080/" || application.gv_host == "http://211.215.175.231:9080/") {
        				alert("개발용: 출금이체동의 무시");
        				this.ch_resultArsCall.set_value(true);
        			} else {
        				this.alert("출금이체동의에 실패하였습니다.\n["+strErrorMsg+"]");
        				this.ch_resultArsCall.set_value(false);
        			}
        		}else{
        			this.alert(strErrorMsg);
        			this.ch_resultArsCall.set_value(true);
        			//this.div_payInfo.div_acc.cb_B_bankCd.set_enable(false);
        			//this.div_payInfo.div_acc.ed_B_acctNo.set_enable(false);
        			//this.div_payInfo.set_enable(false);
        		}	
        	}
        	/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        	//if(strSvcId == "selectSalesmanTel"){
        	//	if( this.orgAgtel != "" ){
        	//		this.div_salesmanInfo.ed_salesmanTel.set_value(FN_numberHyphenInReturn(this.orgAgtel));
        	//	}
        	//}
        	/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        	if(strSvcId == "sRtsd0104ChanCd"){
        		if( (nvl(this.selectChanCd) == "XX") || (nvl(this.selectChanCd) == "") ){
        			alert("채널구분 정보 오류입니다. 영업관리팀 문의바랍니다.");
        			return false;
        		}else{
        			var nRow0104 = this.ds_rtsd0104.rowposition;
        			this.ds_rtsd0104.setColumn( nRow0104, "chanCd", nvl(this.selectChanCd));	
        			
        			//20191217 OMS연계
        			var o2oYn = "N";
        			//온라인, 방판, 오픈몰만 대상
        			//[20210601_01] TEST
        			if((nvl(this.selectChanCd) == "02" || nvl(this.selectChanCd) == "03" || nvl(this.selectChanCd) == "04") && nvl(this.div_installInfo.ed_o2oYn.value) == "Y"){
        			//if((nvl(this.selectChanCd) == "01" || nvl(this.selectChanCd) == "02" || nvl(this.selectChanCd) == "03" || nvl(this.selectChanCd) == "04") && nvl(this.div_installInfo.ed_o2oYn.value) == "Y"){
        				o2oYn = "Y";
        			}else{
        				o2oYn = "N";
        			}
        			this.ds_rtsd0213.setColumn(nRow0104, "o2oYn", nvl(o2oYn));
        			
        			this.FN_goSave();
        		}
        	}
        	if(strSvcId == "insertRtsd0110"){
        		if(nErrorCode != "0"){
        			alert("본인인증을 실패하였습니다.");
        			this.certificationFlag	= false;		

        		}else{
        			alert("본인인증을 성공하였습니다.");
        			this.certificationFlag	= true;		
        		}
        	}
        	
        	if(strSvcId == "checkReRenatal"){//[김선태]재렌탈 추가
        	
        		this.reRental = false;
        		if(this.ds_reRental.rowcount > 0){
        			//20190306 재렌탈 혜택 팝업 제거
        			//if( confirm("재렌탈 대상고객입니다. 재렌탈 혜택을 적용하시겠습니까?") ){
        			
        			//20190416 재렌탈 혜택 선택여부 권한 - 콜센터만 부여
        			var res = false;
        			if(this.userGrp == "02") {
        				res = confirm("재렌탈 대상고객입니다. 재렌탈 혜택을 적용하시겠습니까?");
        			}else {
        				this.alert("재렌탈 대상고객입니다. 재렌탈 혜택이 적용됩니다.");
        				res = true;
        			}
        			
        			if(res){
        				
        				this.reRental = true; //재렌탈
        				this.Grid04.setCellProperty("body", this.Grid04.getBindCellIndex("body", "regiAmtChg"), "displaytype", "normal");
        				this.Grid04.setCellProperty("body", this.Grid04.getBindCellIndex("body", "regiAmtChg"), "edittype", "none");
        				this.btn_payRegiAmt.set_enable(false);  // 등록비 일시불납부 버튼
        				
        				this.fn_regiAmtRt();
        			}	
        				
        			
        			//}else{
        			//	this.reRental = false;
        			//}
        		} else{
        //this.alert("재렌탈 고객아님 " + this.ds_reRental.rowcount);
        			
        			if(nvl(this.payStatCd,'') == '00' || nvl(this.payStatCd,'') == ''){
        				this.Grid04.setCellProperty("body", this.Grid04.getBindCellIndex("body", "regiAmtChg"), "displaytype", "combo");
        				this.Grid04.setCellProperty("body", this.Grid04.getBindCellIndex("body", "regiAmtChg"), "edittype", "combo");
        				if(nvl(this.payStatCd,'') == '') {
        					this.btn_payRegiAmt.set_enable(false);  // 등록비 일시불납부 버튼
        				} else {
        					this.btn_payRegiAmt.set_enable(true);  // 등록비 일시불납부 버튼
        				}

        			} else {
        				this.Grid04.setCellProperty("body", this.Grid04.getBindCellIndex("body", "regiAmtChg"), "displaytype", "normal");
        				this.Grid04.setCellProperty("body", this.Grid04.getBindCellIndex("body", "regiAmtChg"), "edittype", "none");
        				this.btn_payRegiAmt.set_enable(false);  // 등록비 일시불납부 버튼
        			}
        		}
        		
        // 		var osDayF = nvl(this.ds_reRental.getColumn(0, "col1")); //계약만료 3개월전
        // 		var osDayT = nvl(this.ds_reRental.getColumn(0, "col2")); //계약만료일
        // 		var procDayF = nvl(this.ds_reRental.getColumn(1, "col1")); //장착일
        // 		var procDayT = nvl(this.ds_reRental.getColumn(1, "col2")); //장착후 5년
        // 		var zeroService = nvl(this.ds_reRental.getColumn(2, "col1"));
        // 		var payYn = nvl(this.ds_reRental.getColumn(3, "col1"));
        // 		
        // 		//계약만료 3개월전 부터 장착후 5년이내
        // 		if(osDayF <= this.toDay && procDayT >= this.toDay){
        // 			//if(osDayF <= this.toDay && osDayT >= this.toDay){
        // 				if(payYn == "Y"){
        // 					if( confirm("재렌탈 대상고객입니다. 재렌탈 혜택을 적용하시겠습니까?") ){
        // 						this.reRental = true; //재렌탈
        // 					}else{
        // 						this.reRental = false;
        // 					}
        // 				}
        // 			//}
        // 		}
        	}
        	
        	//판매상품조회 후 값 가져오기
        	if(strSvcId == "saleItemList") {
        		
        		this.ed_SaleProdNm.set_value(nvl(this.ds_saleItemList.getColumn(0,"saleNm")));
        		//this.ed_SalePrdtNm.set_value(nvl(this.ds_saleItemList.getColumn(0,"prdtGrpNm")));
        		//this.ed_SaleChanNm.set_value(nvl(this.ds_saleItemList.getColumn(0,"chanNm")));
        		//this.ed_SaleHshopGbNm.set_value(nvl(this.ds_saleItemList.getColumn(0,"hshopGbNm")));
        		
        		if(nvl(this.ed_SaleCd.value,"") == "") {
        			this.ed_SaleCd.set_value(nvl(this.ds_saleItemList.getColumn(0,"saleCd")));
        		}
        		this.div_salesmanInfo.cb_orgAgent.set_enable(false);
        		this.ds_sumPayInfo.addRow();
        		if(this.ds_rtsd0104.getColumn(0,"statCd")=="01"){
        		
        		}else{
        		
        		}
        		
        		this.contactRowChg();
        		
        		/*
        		this.btnValuePrdtAdd.set_enable(trsue);
        		this.btnValuePrdtDel.set_enable(true);
        		this.btnSvcAdd.set_enable(true);
        		this.btnSvcDel.set_enable(true);
        		*/
        	}	
        	/*
        	if(strSvcId == "saleRegiAmtInfo") {
        		
        		this.ds_sumPayInfo.addRow();
        		this.ds_sumPayInfo.setColumn(0,"regiAmtChg"," ");
        	}
        	*/
        	
        	//제품정보
        	if(strSvcId == "listAddSelProduct") {
        		//등록비 관련 데이타 조회(2018.10.30)
        		//this.FN_saleRegiAmt();
        		if(this.ed_orderNo.value != ''){	
        			var sPeriod = 0;
        			this.p_periodCd.set_value(this.ds_productInfo.getColumn(0,"periodCd") ); // 처음 등록일 경우
        		
        			if(nvl(this.p_periodCd.value) == '') {
        				sPeriod = 0;
        			} else {
        				sPeriod = this.p_periodCd.value;
        			}
        			//trace("sPeriod:"+sPeriod);
        			
        			
        			
        			this.p_cntCd.set_value(this.getTotCntCd());
        			
        		}
        		
        		//[20230210_1] kstka
        		//==========================================================================================
        		if(this.mode == this.MODIFY) {
        		
        			this.orgMatNm = this.ds_productInfo.getColumn(0, "matNm");
        			this.orgCntCd = this.ds_rtsd0104.getColumn(0, "cntCd");
        			this.orgAgencyCd = this.ds_rtsd0104.getColumn(0, "agencyCd");
        			this.orgAgencyNm = this.ds_rtsd0104.getColumn(0, "agencyNm");
        			this.orgProcDay = this.ds_rtsd0104.getColumn(0, "procDay");
        		}
        		//==========================================================================================
        	}
        	
        	
        	if(strSvcId == "cntPrdPymInfoList"){
        		this.ds_sumPayInfo.addRow();
        		
        		//계약번호 찾기로 조회할경우 합계정보
        		if(this.ds_rtsd0104.getColumn(0,"statCd")!= "00" ){
        			this.ds_sumPayInfo.setColumn(0,"regiAmt",nvl(this.ds_rtsd0104.getColumn(0,"regiAmt")));
        			this.ds_sumPayInfo.setColumn(0,"regiAmtChg",nvl(this.ds_rtsd0104.getColumn(0,"regiAmt")));
        			this.ds_sumPayInfo.setColumn(0,"rentAmt",nvl(this.ds_rtsd0104.getColumn(0,"sumMonAmt")));
        		}
        		
        		var regiAmt = nvl(this.ds_rtsd0104.getColumn(0,"regiAmt")) == ""?"0":nvl(this.ds_rtsd0104.getColumn(0,"regiAmt"));
        		var sumMonAmt = nvl(this.ds_rtsd0104.getColumn(0,"sumMonAmt")) == ""?"0":nvl(this.ds_rtsd0104.getColumn(0,"sumMonAmt"));

        		//계약번호 찾기로 조회할경우 합계납부정보조회
        		/*this.rtsd0104Loadset(regiAmt, sumMonAmt);*/
        			
        	}

        	// 상품별 프리미엄 서비스 조회 화면
        	if(strSvcId == "srvcOrdList"){
        		if(nvl(this.ds_seviceCd.getColumn(0, "servInfYN")) == ""){
        			this.alert("해당타이어 " + this.p_cntCd.value + " 본수에 제공되는 프리미엄 상품은 없습니다.");	
        		}
        		
        		//자유렌탈상품 서비스횟수 fix (20201029)
        		//자유렌탈일경우 서비스횟수 0으로(20190222)
        // 		if(this.ds_saleItemList.getColumn(0,"prdtGrpDtl")=='04'){
        // 			for(var i=0;i<this.ds_seviceCd.getRowCount();i++){
        // 				this.ds_seviceCd.setColumn(i,"servCnt","0");
        // 			}
        // 		}
        		
        		// 무제한 선택여부 
        		if(nvl(this.ds_seviceCd.getColumn(0, "servInfYN")) == 'Y' || this.ds_saleItemList.getColumn(0,"prdtGrpDtl")=='04'){			//무제한이거나 자유렌탈일경우
        		//if(nvl(this.ds_seviceCd.getColumn(0, "servInfYN")) == 'Y'){			//자유렌탈 상품은 제외
        			this.Grid02.setCellProperty("body", this.Grid02.getBindCellIndex("body", "servCnt"), "displaytype", "combo");
        			this.Grid02.setCellProperty("body", this.Grid02.getBindCellIndex("body", "servCnt"), "edittype", "combo");

        		}else{
        			this.Grid02.setCellProperty("body", this.Grid02.getBindCellIndex("body", "servCnt"), "displaytype", "normal");
        			this.Grid02.setCellProperty("body", this.Grid02.getBindCellIndex("body", "servCnt"), "edittype", "none");			
        		}	
        		
        		this.set_prmmAdd_dsCntPrdPymInfo();	//계약상품 납부정보 추가
        		
        	}

        	// 주문별 프리미엄 서비스 조회 화면
        	if(strSvcId == "prmmSrvcOrdList"){
        //this.alert(this.ds_rtsd0013.getColumn(0, "servInfYN"));
        		// 무제한 선택여부 
        		if(nvl(this.ds_seviceCd.getColumn(0, "servInfYN")) == 'Y' || this.ds_saleItemList.getColumn(0,"prdtGrpDtl")=='04'){
        			this.Grid02.setCellProperty("body", this.Grid02.getBindCellIndex("body", "servCnt"), "displaytype", "combo");
        			this.Grid02.setCellProperty("body", this.Grid02.getBindCellIndex("body", "servCnt"), "edittype", "combo");
        		}else{
        			this.Grid02.setCellProperty("body", this.Grid02.getBindCellIndex("body", "servCnt"), "displaytype", "normal");
        			this.Grid02.setCellProperty("body", this.Grid02.getBindCellIndex("body", "servCnt"), "edittype", "none");			
        		}	
        		//this.set_prmmAdd_dsCntPrdPymInfo();	//계약상품 납부정보 추가		
        	}

        	// 등록비 할인율 여부
        	if(strSvcId == "regiAmtRt"){
        	
        		//this.alert("parseInt(this.regiAmtRt):"+parseInt(this.regiAmtRt));
        		// 등록비 할인율에 따른 버튼 및 계약접수 변경 
        		
        		if(parseInt(this.regiAmtRt) == 100){
        			this.Grid04.setCellProperty("body", this.Grid04.getBindCellIndex("body", "regiAmtChg"), "displaytype", "normal");
        			this.Grid04.setCellProperty("body", this.Grid04.getBindCellIndex("body", "regiAmtChg"), "edittype", "none");
        			this.btn_payRegiAmt.set_enable(false);  // 등록비 일시불납부 버튼
        			this.payStatCd = '01'; //STAT_CD = '01' // 계약접수
        		}else{
        			this.Grid04.setCellProperty("body", this.Grid04.getBindCellIndex("body", "regiAmtChg"), "displaytype", "combo");
        			this.Grid04.setCellProperty("body", this.Grid04.getBindCellIndex("body", "regiAmtChg"), "edittype", "combo");
        			this.btn_payRegiAmt.set_enable(true);  // 등록비 일시불납부 버튼
        			this.payStatCd = ''; //STAT_CD = '01' // 계약접수
        		}
        	}
        	
        	
        	if (strSvcId == "regiAmtPay"){	
        		this.ds_sumPayInfo.clearData();		
        		if( nErrorCode == "0"){
        			//this.alert("정상 처리되었습니다.");
        			this.accCardCheck   = false;
        			this.FN_listRtsd0104( this.resultOrdNo );
        		}else{
        			this.reload();
        			alert(strErrorMsg);
        		}
        	}

        	//tms스케쥴 조회
        	if(strSvcId == "tmsSchedules"){
        		if(nErrorCode != "200"){
        			this.alert(strErrorMsg);
        		}else{
        			if(this.ds_time.rowcount == 0){
        				this.alert("해당 거점의 사용가능한 스케쥴이 존재하지 않습니다.");
        			}else{
        				this.div_installInfo.cb_time.set_enable(true);
        				this.div_installInfo.rd_baseType.set_enable(true);
        				this.div_installInfo.ed_visitTel.set_enable(true);
        			}
        		}
        	
        	}
        	
        	if(strSvcId == "o2oAgencyInfo"){
        	
        		//초기화
        		this.div_installInfo.ed_agencyCd.set_value("");
        		this.div_installInfo.ed_salesGroup.set_value("");
        		this.div_installInfo.ed_salesOffice.set_value("");
        		this.div_installInfo.ed_agencyNm.set_value("");
        		this.div_installInfo.ed_o2oYn.set_value("");	
        		this.div_installInfo.ed_posCd.set_value("");
        		this.div_installInfo.ed_city.set_value("");
        		this.div_installInfo.ed_street.set_value("");		
        				
        		if(this.ds_o2oAgencyInfo.rowcount == 0){
        			this.alert("해당 거점 정보를 찾을 수 없습니다.");
        		}else{
        			this.div_installInfo.ed_agencyCd.set_value(this.ds_o2oAgencyInfo.getColumn(0, "bpCd")); //대리점코드
        			this.div_installInfo.ed_salesGroup.set_value(this.ds_o2oAgencyInfo.getColumn(0, "saleGrpCd")); //sales group
        			this.div_installInfo.ed_salesOffice.set_value(this.ds_o2oAgencyInfo.getColumn(0, "saleOffice")); //sales office
        			
        			this.div_installInfo.ed_posCd.set_value(this.ds_o2oAgencyInfo.getColumn(0, "zip")); //우편번호
        			this.div_installInfo.ed_city.set_value(this.ds_o2oAgencyInfo.getColumn(0, "bassAddr")); //주소
        			this.div_installInfo.ed_street.set_value(this.ds_o2oAgencyInfo.getColumn(0, "dtlAddr")); //상세주소
        	
        			
        			//[20210601_01] TEST
        // 			if(this.userGrp == "05"){
        // 				this.div_installInfo.ed_posCd00.set_value(this.ds_o2oAgencyInfo.getColumn(0, "zip")); //우편번호
        // 				this.div_installInfo.ed_addr00.set_value(this.ds_o2oAgencyInfo.getColumn(0, "bassAddr")); //주소
        // 				this.div_installInfo.ed_detl_addr00.set_value(this.ds_o2oAgencyInfo.getColumn(0, "dtlAddr")); //상세주소
        // 			}
        			
        			//대리점명
        			this.div_installInfo.ed_agencyNm.set_value(this.ds_o2oAgencyInfo.getColumn(0, "orgzNm"));
        			this.div_installInfo.ed_o2oYn.set_value("Y"); //o2o여부

        		}
        	}
        	
        	if(strSvcId == "o2oAgencyTime"){
        		this.div_installInfo.cb_time.set_enable(true);
        	}
        	
        	if(strSvcId == "o2oAgencyStock"){
        		if(this.o2oAgencyStockCnt <= 0){			
        			this.alert("해당 제품의 거점의 재고가 존재하지 않습니다.");
        			//[20210713_01] kstka 해당 거점에 재고가 없는 경우 현재 선택된 상품 삭제
        			//[20221101_01] 재고 없을시 block처리 해제
        			//this.ds_productInfo.setColumn(0, "chk", 1);
        			//this.btnAddPrdtDel_onclick();
        			this.chk_rcStockYn.set_value(false);
        			return;
        		}
        	}
        	
        	if(strSvcId == "o2oAgencyStockTot"){
        		if(this.o2oAgencyStockTot <= 0){
        			this.alert("해당 제품의 거점의 재고가 존재하지 않습니다.");
        			return;
        		}
        		
        		this.div_installInfo.cal_procDay.set_value(this.toDay);
        	}
        	
        	if(strSvcId == "o2oCarAreaCheck"){
        		var procType = this.div_installInfo.rd_procType.value;
        		if(procType == "1010" && procType == "1020"){
        			if(this.o2oCarAreaCheck == "Y"){
        				
        			}else{
        				this.alert("해당 거점은 방문장착/P&D서비스가 불가합니다.");
        				return;
        			}
        		}
        	}
        	
        	if(strSvcId == "beforeOrderConfirm"){
        		
        		if(nErrorCode == -1){			
        			this.div_custInfo.div_custInfoDetail.cb_credit.set_value("N");
        			this.alert(strErrorMsg);
        		}else{		
        			this.div_custInfo.div_custInfoDetail.cb_credit.set_value("Y");
        			this.FN_divChangeTrue();
        		}
        	}

        	if( strSvcId == "checkHDate" ){
        		if(this.resultCnt != '0') {
        			alert("선택하신 날짜는 휴무일 입니다.");
        			this.div_installInfo.cal_procDay.set_value("");
        		}
        	}
        	
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        /*★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ */
        //fn_callBack END
        /*★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ */
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

        

        

        

        

        
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        /*★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ */
        //ONLOAD FUNCTION START
        /*★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ */
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.RTSDContractRegister_onload = function(obj,e){
        //FORM ONLOAD FUNCTION
        	Ex.core.init(obj);
        	this.fn_init(); 
        	
        	
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //UserFunction : 상품-가격정보 변경 및 SELECT BOX DATA SELECT
        this.fn_init = function(){
        	if(this.parent.parent.components[0].id == "div_work"){
        		this.parent.parent.setButton("N|GR|PK", this);
        	}else{
        		this.parent.setButton("N|GR|PK", this);
        	}	
        	
        	/*2018.10.25 상품-가격정보 visible : false로 인한 막음 처리
        	if( this.userGrp == "05" ){
        		this.div_productInfo.grid_price.setRealColSize( this.div_productInfo.grid_price.getBindCellIndex( "body", "cDcamt"), 	"0");
        		this.div_productInfo.grid_price.setRealColSize( this.div_productInfo.grid_price.getBindCellIndex( "body", "campYn"), 	"0");
        		this.div_productInfo.grid_price.setRealColSize( this.div_productInfo.grid_price.getBindCellIndex( "body", "gDcrate"), 	"0");
        		this.div_productInfo.grid_price.setRealColSize( this.div_productInfo.grid_price.getBindCellIndex( "body", "gDcamt"), 	"0");
        		this.div_productInfo.grid_price.setRealColSize( this.div_productInfo.grid_price.getBindCellIndex( "body", "lDcrate"), 	"0");
        		this.div_productInfo.grid_price.setRealColSize( this.div_productInfo.grid_price.getBindCellIndex( "body", "lDcamt"), 	"0");
        		this.div_productInfo.grid_price.setRealColSize( this.div_productInfo.grid_price.getBindCellIndex( "body", "fDcamt"), 	"0");
        		this.div_productInfo.grid_price.setRealColSize( this.div_productInfo.grid_price.getBindCellIndex( "body", "rentAmt"), 	"0");
        	}else{
        		this.div_productInfo.grid_price.setRealColSize( this.div_productInfo.grid_price.getBindCellIndex( "body", "cDcamt"), 	"100");
        		this.div_productInfo.grid_price.setRealColSize( this.div_productInfo.grid_price.getBindCellIndex( "body", "campYn"), 	"100");
        		this.div_productInfo.grid_price.setRealColSize( this.div_productInfo.grid_price.getBindCellIndex( "body", "gDcrate"), 	"100");
        		this.div_productInfo.grid_price.setRealColSize( this.div_productInfo.grid_price.getBindCellIndex( "body", "gDcamt"), 	"100");
        		this.div_productInfo.grid_price.setRealColSize( this.div_productInfo.grid_price.getBindCellIndex( "body", "lDcrate"), 	"100");
        		this.div_productInfo.grid_price.setRealColSize( this.div_productInfo.grid_price.getBindCellIndex( "body", "lDcamt"), 	"100");
        		this.div_productInfo.grid_price.setRealColSize( this.div_productInfo.grid_price.getBindCellIndex( "body", "fDcamt"), 	"100");
        		this.div_productInfo.grid_price.setRealColSize( this.div_productInfo.grid_price.getBindCellIndex( "body", "rentAmt"), 	"100");
        	}
        	*/
        	
        	var sSvcID      	= "initRTSDContractRegister";  
        	var sController   	= "rtms/sd/initRTSDContractRegister.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	sOutDatasets += " ds_custTp=mapDsCustTp ";
        	sOutDatasets += " ds_certification=mapDsCertification ";
        	sOutDatasets += " ds_genderCd=mapDsGenderCd ";
        	sOutDatasets += " ds_lfCd=mapDsLfcd ";
        	sOutDatasets += " ds_mobFirm=mapDsMobFirm ";
        	sOutDatasets += " ds_payMthd=mapDsPayMthd ";
        	sOutDatasets += " ds_payCustTp=mapDsPayCustTp ";
        	sOutDatasets += " ds_B_bank=mapDsBBank ";
        	sOutDatasets += " ds_C_bank=mapDsCBank ";
        	sOutDatasets += " ds_B_bankPayDay=mapDsBankPayDay ";
        	sOutDatasets += " ds_C_bankPayDay=mapDsCardPayDay ";
        	sOutDatasets += " ds_maker=mapDsMaker ";
        	sOutDatasets += " ds_nagYn=mapDsNagYn ";
        	sOutDatasets += " ds_credit=mapDsCredit ";
        	sOutDatasets += " ds_conMthd=mapDsConMthd ";
        	sOutDatasets += " ds_sale=maptDsSale ";
        	//sOutDatasets += " ds_orgAgent=maptDsSalesman ";
        	//sOutDatasets += " ds_orgAgent2=maptDsSalesman2 ";
        	sOutDatasets += " ds_holiDays=maptDsHoliDays ";		// 240926 백인천 - 휴일정보를 구성
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	
        	//부가제품정보 공통추가(2018.10.26)
        	var sSvcID        	= "listCommInfo";                    
        	var sController   	= "/rtms/sd/listAddProductCommInfo.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "comGrp=com_grp";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 	
        	
        	//[20230210_1] kstka
        	//=============================================================================
        	if(this.userGrp == "05"){
        		this.btn_orderNoSearch.set_enable(false);
        	}
        	//=============================================================================
        	
        	//초기로딩시 판매상품관련 버튼 비활성화
        	this.btn_SalePrdtSearch.set_enable(false);
        	this.btnAddPrdt.set_enable(false);
        	this.btnAddPrdtDel.set_enable(false);
        	this.btnValuePrdtAdd.set_enable(false);
        	this.btnValuePrdtDel.set_enable(false);
        	this.btn_payRegiAmt.set_enable(false);
        	//this.btnSvcAdd.set_enable(false);
        	//this.btnSvcDel.set_enable(false);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //UserFunction : SYSDATE
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
        /*★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ */
        //ONLOAD FUNCTION END
        /*★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ */
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

        

        

        

        

        
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        /*★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ */
        //고객정보 START
        /*★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ */
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //BUTTON EVENT
        this.div_custInfo_btn_custNew_onclick = function(obj,e){
        	if( confirm( "고객등록 화면으로 이동 하시겠습니까?\n※등록하셨던 내용은 사라집니다." ) ){
        		this.go( "sd::RTSDCustRegister.xfdl" );
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //BUTTON EVENT
        this.div_custInfo_btn_custNoSearch_onclick = function(obj,e){
        	var args ={p_arg : this.p_arg};
        	Ex.core.popup(this,"고객찾기","comm::RTCOMMCust_pop.xfdl",args, "modaless=false");
        }
        this.returnCustInfo = function(ds){
        	
        	this.FN_divChangeFalse();
         	if(ds[0].rowcount > 0){
         		this.FN_initializationDataSet();
         		this.ds_rtsd0100.copyData(ds[0]);
         		
         		var contactRow = this.ds_rtsd0104.addRow();
         		
         		//[20230210_1] kstka
         		//=================================================
         		//20191205 kstka 거점정보
         		//this.ds_rtsd0213.addRow();
         		//=================================================
         		
         		//this.ds_rtsd0106.addRow();
         		//this.ds_price.addRow();
         		this.ds_rtsd0104.setColumn(contactRow,"carOwner",ds[0].getColumn(0, "custNm"));
         		
         		this.div_custInfo_cb_custTp_onitemchanged();//고객유형 CHANCE EVENT
         		
         		this.div_payInfo.cb_payMthd.set_enable(true);
         		this.div_payInfo.btn_payChoice.set_visible(true);
         		
         		this.FN_telNoChange();
         		this.fn_initSetValue();
         		this.FN_listCustInfo( ds[0].getColumn(0, "custNo") );
         		
         		var regId   = nvl( ds[0].getColumn(0,"regId")  );
         		var custTp  = nvl( ds[0].getColumn(0,"custTp") );
         		if( this.userGrp == "01" && regId != this.onlineLoginId && custTp == "02" ){//B2B
         			this.FN_divChangeTrue();
         		}

         		this.payAddRowFlag = true;
         		
         		//판매상품조회 버튼 활성화
         		//this.btn_SalePrdtSearch.set_enable(true);

         		//재렌탈 대상 확인
         		this.checkReRental(ds[0].getColumn(0, "custNo"));
         	}
        }

        this.checkReRental = function(custNo){
        	
        	var sSvcID      	= "checkReRenatal";  
        	var sController   	= "/rtms/sd/getReRentalInfo.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_reRental=mapDSReRental";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("custNo",custNo);
        	//alert(custNo);
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 	
        	
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //USER FUNCTION : DATA SET CLEAR
        this.FN_initializationDataSet = function(){
        	this.ds_rtsd0100.clearData();
        	this.ds_rtsd0110.clearData();
        	this.ds_rtsd0111.clearData();
        	this.ds_rtsd0104.clearData();
        	//this.ds_rtsd0106.clearData();
        	//this.ds_price.clearData();
        	//this.ds_rateAmt.clearData();
        	this.ds_rtre0010.clearData();
        	this.ds_rtre0020.clearData();
        	this.ds_rtsd0013.clearData();
        	//this.ds_rtsd0014.clearData();
        	this.dsNice.clearData();
        	this.dsNice2.clearData();
        	
        	//20191205 kstka 거점정보
        	this.ds_rtsd0213.clearData();
        	
        	//판매상품관련 Dataset 초기화
        	this.ed_SaleProdNm.set_value("");
        	this.ed_SaleCd.set_value("");
        	this.ds_productInfo.clearData();
        	this.ds_ValuePrdtInfo.clearData();
        	this.ds_seviceCd.clearData();
        	this.ds_contactDeliInfo.clearData();
        	this.ds_sumPayInfo.clearData();
        	
        	this.div_payInfo.div_acc.cb_B_bankPayDay.set_value("-1");
        	this.div_payInfo.div_card.cb_C_bankPayDay.set_value("-1");
        	this.div_carInfo.cb_model.set_index(-1);
        	this.div_payInfo.div_card.ed_C_expireY.set_value("");
        	this.div_payInfo.div_card.ed_C_expireM.set_value("");
        	this.ch_resultArsCall.set_value(false);
        	
        	//[20230223_1] kstka
        	//계약정보가 모두 조회되기 전까지는 수정모드가 아님.
        	//===========================================
        	this.mode = this.ADD;
        	//===========================================
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //USER FUNCTION : 전화번호 FN_numberHyphenInReturn
        this.FN_telNoChange = function(){
        	var telNo  = nvl(this.ds_rtsd0100.getColumn(0,"telNo"));
        	var telNo2 = nvl(this.ds_rtsd0100.getColumn(0,"telNo2"));
        	var cTelno = nvl(this.ds_rtsd0100.getColumn(0,"cTelno"));
        	
        	if( telNo != "" ){ 	this.div_custInfo.ed_telNo.set_value( FN_numberHyphenInReturn(telNo) ); 						}
        	if( telNo2 != "" ){ this.div_custInfo.div_custInfoDetail.ed_telNo2.set_value( FN_numberHyphenInReturn(telNo2) ); 	}
        	if( cTelno != "" ){ this.div_custInfo.ed_cTelno.set_value( FN_numberHyphenInReturn(cTelno) ); 						}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //USER FUNCTION
        this.fn_initSetValue = function(){
        	this.div_installInfo.cal_procDay.set_value(this.toDay);
        	this.div_etcInfo.cal_ordDay.set_value(this.toDay);
        	
        	if( this.userGrp == "05" ){
        		this.div_installInfo.btn_searchAgency.set_visible(false);
        		this.div_installInfo.ed_agencyNm.set_width(370);
        		this.div_installInfo.ed_agencyCd.set_value(application.gds_userInfo.getColumn(0, "agentId"));
        		this.div_installInfo.ed_agencyNm.set_value(application.gds_userInfo.getColumn(0, "agentNm"));
        		this.div_installInfo.ed_salesGroup.set_value(application.gds_userInfo.getColumn(0, "vkgrp"));
        		this.div_installInfo.ed_salesOffice.set_value(application.gds_userInfo.getColumn(0, "vkbur"));
        		
        		//[20210806_01] 대리점중 직영도매 거래선여부 확인
        		var chainYn = nvl(this.ds_agencyInfo.getColumn(0, "chainYn"));
        		if(chainYn == "Y"){
        			this.div_stockUseChk.ch_chainYn.set_enable(true);
        		}
        		
        		//[20221110_1] 윈터타이어 매입재고 사용 확인
        		//this.div_stockUseChk.ch_winterYn.set_enable(true);
        		
        		//[20210601_01] TEST
        		if(application.gds_userInfo.getColumn(0, "vkgrp") == "RC1"){
        			this.o2oAgencyInfo(application.gds_userInfo.getColumn(0, "agentId"));
        		}
        	}else{
        		this.div_installInfo.btn_searchAgency.set_visible(true);
        		this.div_installInfo.ed_agencyNm.set_width(320);
        		this.div_stockUseChk.ch_chainYn.set_enable(false);
        		this.div_stockUseChk.ch_winterYn.set_enable(false);
        	}
        	
        	var regId 	= this.ds_rtsd0100.getColumn(0,"regId");
        	var custTp 	= this.ds_rtsd0100.getColumn(0,"custTp");
        	// [20161206_02]
        	if( (this.userGrp == "02") || (this.userGrp == "09") || (this.userGrp == "13") ||(this.userGrp == "01" && regId != this.onlineLoginId && custTp == "02" ) ){
        		this.div_installInfo.cal_procDay.set_value( this.addDay_2 );
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //USER FUNCTION : 본인인증이력 및 개인정보제공동의 조회
        this.FN_listCustInfo = function(custNo ){
        	var sSvcID        	= "listCustInfo";                    
        	var sController   	= "rtms/sd/listCustInfo.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";
        	var fn_callBack		= "fn_callBack";
        	sOutDatasets += " ds_rtsd0110=mapRtsd0110 ";	//본인인증이력
        	sOutDatasets += " ds_rtsd0111=mapRtsd0111 ";	//개인정보제공동의
        	this.ds_rtsd0111.clearData();
        	this.ds_rtsd0110.clearData();
        	sArgs += Ex.util.setParam("custNo",custNo);
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //USER FUNCTION
        this.FN_rtsd0113UserGrp = function(){
        	var sSvcID      	= "sRtsd0113UserGrp";  
        	var sController   	= "/rtms/sd/sRtsd0113UserGrp.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_rtsd0113=mapRtsd0113UserGrp";
        	var sArgs 			= Ex.util.setParam("userGrp",this.userGrp);
        	var fn_callBack		= "fn_callBack";
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 	
        }

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //USER FUNCTION : FN_divChangeTrue <-> FN_divChangeFalse, 결제정보, 차량정보, 상품-가격정보, 장착점정보, 프리미엄서비스, 판매원정보 TRUE
        this.FN_divChangeTrue = function(){
        	this.div_custInfo_cb_custTp_onitemchanged();
        	this.div_payInfo.set_enable(true);
        	this.div_payInfo.cb_payCustTp.set_enable(false);
        	this.div_carInfo.set_enable(true);
        	//this.div_productInfo.set_enable(true);
        	this.div_installInfo.set_enable(true);
        	//this.div_preminum.set_enable(true);

        	var regId   = nvl( this.ds_rtsd0100.getColumn(0,"regId")  );
        	var custTp  = nvl( this.ds_rtsd0100.getColumn(0,"custTp") );
        	
        	// [20161206_02]
        	//[20230210_1] kstka
        	//=======================================================================================================================================================================================
        	if( (this.userGrp == "02") || (this.userGrp == "09") || (this.userGrp == "13") || (this.userGrp == "01" && regId != this.onlineLoginId && custTp != "02") ){
        		this.div_salesmanInfo.set_enable(true);//판매원정보
        		this.FN_rtsd0113UserGrp();
        	}
        	//=======================================================================================================================================================================================
        	
        	//if( this.userGrp == "01" && regId != this.onlineLoginId && custTp == "02" ){
        	//	this.div_salesmanInfo.cb_orgAgent.set_innerdataset(this.ds_orgAgent2);
        	//}else{
        	//	this.div_salesmanInfo.cb_orgAgent.set_innerdataset(this.ds_orgAgent);
        	//}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //USER FUNCTION : FN_divChangeTrue <-> FN_divChangeFalse, 결제정보, 차량정보, 상품-가격정보, 장착점정보, 프리미엄서비스, 판매원정보 FALSE
        this.FN_divChangeFalse = function(){
        	this.div_custInfo_cb_custTp_onitemchanged();
        	this.div_payInfo.set_enable(false);
        	this.div_payInfo.cb_payCustTp.set_enable(false);	
        	this.div_carInfo.set_enable(false);
        	
        	//[20230210_1] kstka
        	//====================================================================
        	if(this.mode == this.MODIFY) {
        		this.div_carInfo.set_enable(true);
        	}
        	//====================================================================
        	
        	//this.div_productInfo.set_enable(false);
        	this.div_installInfo.set_enable(false);
        	//this.div_preminum.set_enable(false);
        	
        	var regId   = nvl( this.ds_rtsd0100.getColumn(0,"regId")  );
        	var custTp  = nvl( this.ds_rtsd0100.getColumn(0,"custTp") );
        	
        	// [20161206_02]
        	//[20230210_1] kstka
        	//==========================================================================================================================
        	if( (this.userGrp == "13") || (this.userGrp == "01" && regId != "ONL_SYS" && custTp == "02") ){
        	//if( (this.userGrp == "02") || (this.userGrp == "13") || (this.userGrp == "01" && regId != "ONL_SYS" && custTp == "02") ){
        		this.div_salesmanInfo.set_enable(false);
        	}
        	//==========================================================================================================================
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //SELECT BOX FUNCTION : 고객유형 변경
        this.div_custInfo_cb_custTp_onitemchanged = function(obj,e){
        	if( this.div_custInfo.cb_custTp.value != "undefined"){
        		if( this.div_custInfo.cb_custTp.value == "01" ){
        			this.FN_cust01();
        		}else if( this.div_custInfo.cb_custTp.value == "02" ){
        			this.FN_cust02();
        		}else{
        			this.FN_cust01();
        		}
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //UserFunction : FN_cust01<->FN_cust02 , 고객정보
        this.FN_cust01 = function(){
        	this.div_custInfo.div_custInfoDetail.setOffsetTop(90);
        	this.div_custInfo.st_custNm.set_text("고객명");
        	this.div_custInfo.div_custInfoDetail.st_telNo2.set_text("전화번호");
        	this.div_custInfo.st_birthDay.set_visible(true);						//법정생년월일
        	this.div_custInfo.ed_birthDay.set_visible(true);						//법정생년월일
        	this.div_custInfo.st_buslNo.set_visible(false);							//사업자번호
        	this.div_custInfo.ed_buslNo.set_visible(false);							//사업자번호
        	this.div_custInfo.st_genderCd.set_visible(true);						//성별
        	this.div_custInfo.cb_genderCd.set_visible(true);						//성별
        	this.div_custInfo.st_repNm.set_visible(false);							//대표자명
        	this.div_custInfo.ed_repNm.set_visible(false);							//대표자명
        	this.div_custInfo.st_busiType.set_visible(false);						//업종
        	this.div_custInfo.ed_busiType.set_visible(false);						//업종
        	this.div_custInfo.st_busiCond.set_visible(false);						//업태
        	this.div_custInfo.ed_busiCond.set_visible(false);						//업태
        	this.div_custInfo.st_lfCd.set_visible(true);							//내/외국인
        	this.div_custInfo.cb_lfCd.set_visible(true);							//내/외국인
        	this.div_custInfo.div_custInfoDetail.st_certification.set_visible(true);//본인인증
        	this.div_custInfo.div_custInfoDetail.ra_certification.set_visible(true);//본인인증
        	this.div_custInfo.div_custInfoDetail.st_credit.set_visible(true);
        	this.div_custInfo.div_custInfoDetail.cb_credit.set_visible(true);
        	this.div_custInfo.div_custInfoDetail.btn_creditSelect.set_visible(true);
        	this.div_custInfo.div_custInfoDetail.st_nagYn.set_visible(true);
        	this.div_custInfo.div_custInfoDetail.cb_nagYn.set_visible(true);
        	//this.div_custInfo.div_custInfoDetail.btn_check.set_visible(true);
        	this.div_custInfo.st_cCustnm.set_visible(false);
        	this.div_custInfo.ed_Ccustnm.set_visible(false);
        	this.div_custInfo.st_cTelno.set_visible(false);
        	this.div_custInfo.ed_cTelno.set_visible(false);
        	
        	//콜센터인경우에만 장착유형 선택가능
        	if(this.userGrp == "02"){
        		this.div_installInfo.rd_procType.set_enable(true);
        		this.div_installInfo.rd_alignYn.set_enable(true);
        		
        		// KCP 연동 웹페이지 URL을 접속 호스트에 따라 동적 변경 
        		if (application.gv_host == "http://localhost/") {						//LOCAL
        			this.div_installInfo.kakao_interface.set_url("http://localhost/interface/map/searchMap.jsp");
        		} else if (application.gv_host == "http://1.254.67.135:9080/") {		//개발기
        			this.div_installInfo.kakao_interface.set_url("http://1.254.67.135:9080/interface/map/searchMap.jsp");
        		} else if (application.gv_host == "https://portal.tirerental.co.kr/") {	//운영기
        			this.div_installInfo.kakao_interface.set_url("https://portal.tirerental.co.kr/interface/map/searchMap.jsp");
        		} else if (application.gv_host == "http://1.254.67.157:8180/") {	//운영기2
        			this.div_installInfo.kakao_interface.set_url("https://portal.tirerental.co.kr/interface/map/searchMap.jsp");
        		} else {																//기타=개발기 적용
        			this.alert("호스트 정보가 유효하지 않습니다 : " + application.gv_host);
        			this.div_installInfo.kakao_interface.set_url("http://172.17.0.135:9080/interface/map/searchMap.jsp");
        		}
        		
        		this.div_installInfo.kakao_interface.show();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //UserFunction : FN_cust01<->FN_cust02 , 고객정보
        this.FN_cust02 = function(){
        	this.div_custInfo.div_custInfoDetail.setOffsetTop(120);
        	this.div_custInfo.st_custNm.set_text("법인명");
        	this.div_custInfo.div_custInfoDetail.st_telNo2.set_text("회사전화");
        	this.div_custInfo.st_birthDay.set_visible(false);						 //법정생년월일
        	this.div_custInfo.ed_birthDay.set_visible(false);						 //법정생년월일
        	this.div_custInfo.st_buslNo.set_visible(true);							 //사업자번호
        	this.div_custInfo.ed_buslNo.set_visible(true);							 //사업자번호
        	this.div_custInfo.st_genderCd.set_visible(false);						 //성별
        	this.div_custInfo.cb_genderCd.set_visible(false);						 //성별
        	this.div_custInfo.st_repNm.set_visible(true);							 //대표자명
        	this.div_custInfo.ed_repNm.set_visible(true);							 //대표자명
        	this.div_custInfo.st_busiType.set_visible(true);						 //업종
        	this.div_custInfo.ed_busiType.set_visible(true);						 //업종
        	this.div_custInfo.st_busiCond.set_visible(true);						 //업태
        	this.div_custInfo.ed_busiCond.set_visible(true);						 //업태
        	this.div_custInfo.st_lfCd.set_visible(false);							 //내/외국인
        	this.div_custInfo.cb_lfCd.set_visible(false);							 //내/외국인
        	this.div_custInfo.div_custInfoDetail.st_certification.set_visible(false);//본인인증
        	this.div_custInfo.div_custInfoDetail.ra_certification.set_visible(false);//본인인증
        	this.div_custInfo.div_custInfoDetail.st_credit.set_visible(false);
        	this.div_custInfo.div_custInfoDetail.cb_credit.set_visible(false);
        	this.div_custInfo.div_custInfoDetail.btn_creditSelect.set_visible(false);
        	this.div_custInfo.div_custInfoDetail.st_nagYn.set_visible(false);
        	this.div_custInfo.div_custInfoDetail.cb_nagYn.set_visible(false);
        	this.div_custInfo.div_custInfoDetail.btn_check.set_visible(false);
        	this.div_custInfo.st_cCustnm.set_visible(true);
        	this.div_custInfo.ed_Ccustnm.set_visible(true);
        	this.div_custInfo.st_cTelno.set_visible(true);
        	this.div_custInfo.ed_cTelno.set_visible(true);
        	
        	//콜센터인경우에만 장착유형 선택가능
        	if(this.userGrp == "02"){
        		this.div_installInfo.rd_procType.set_enable(true);
        		this.div_installInfo.rd_alignYn.set_enable(true);
        	}
        }

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //휴일 체크
        this.FN_hDateCheck = function(hDate) {
        	var sSvcID        	= "checkHDate";
        	var sController   	= "rtms/cm/checkHDate.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("hDate",hDate);
        	sArgs += Ex.util.setParam("hGubun","HOLI");
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //BUTTON EVENT
        this.div_custInfo_div_custInfoDetail_btn_creditSelect_onclick = function(obj,e){
        	var custTp  = nvl( this.ds_rtsd0100.getColumn(0,"custTp") );
        	var safekey = nvl(this.ds_rtsd0100.getColumn(0,"safekey"));
        	var nagYn	= nvl(this.div_custInfo.div_custInfoDetail.cb_nagYn.value); 
        	
        	if( custTp == "01" ){//개인c
        		if( safekey != "" ){
        			// [20161206_02]
        			trace("nagYn:"+nagYn);
        			trace("userGrp:"+this.userGrp);
        			if( (nagYn == "Y") || (this.userGrp == "02") || (this.userGrp == "13") || (this.userGrp == "09") ){
        				var sSvcID        	= "niceTrustInfoCnt";                    
        				var sController   	= "ntrms/sd/niceTrustInfoCnt.do";
        				var sInDatasets   	= "";
        				var sOutDatasets  	= "dsNice=dsNiceCheck";
        				var sArgs 			= "";	
        				var fn_callBack		= "fn_callBack";
        				sArgs += Ex.util.setParam("safekey",safekey);
        				Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        			}else{
        				alert("정보제공동의가 미동의입니다.");
        			}
        		}else{
        			alert("safekey가 없습니다.");
        		}
        	}else if( custTp == "02" ){//사업자
        		//var buslNo 			=  nvl(this.div_custInfo.ed_buslNo.value);
        		//var sSvcID        	= "existsBisinessSearch";                    
        		//var sController   	= "ntrms/sd/existsBisinessSearch.do";
        		//var sInDatasets   	= "";
        		//var sOutDatasets  	= "dsBis2=ds_bis_out";
        		//var sArgs 			= "";	
        		//var fn_callBack		= "fn_callBack";
        		//sArgs += " businessNo=" + buslNo;
        		//Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        	}else{
        	
        	}
        	/*
        	//개발일경우 TEST
        	this.div_custInfo.div_custInfoDetail.cb_credit.set_value("Y");
        	this.FN_divChangeTrue();
        	*/
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //USER FUNCTION :  법인신용조회
        this.createNiceBusinessInfo = function(obj,e){
        	var businessNo 		= nvl(this.div_custInfo.ed_buslNo.value);
        	var sSvcID        	= "niceBisinessSearch";                    
        	var sController   	= "ntrms/sd/niceBisinessSearch.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "dsBis=ds_bis_out";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	sArgs += " businessNo=" + businessNo;
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //BUTTON EVENT
        this.btn_orderNoSearch_onclick = function(obj,e){
        	var args ={ p_arg : this.p_arg, "p_crList" : "Y" };
        	Ex.core.popup(this,"계약번호 조회","comm::RTCOMMOrderNo_pop.xfdl",args, "modaless=false");	
        }
        this.returnOrderNoInfo = function(ordNo){
        	//this.FN_divChangeFalse();
        	this.ds_sumPayInfo.clearData();
        	
        	this.reRental       = false; // 재렌탈 초기화
        	this.regiAmtRt		= "0";	 // 재렌탈 등록비 할인율 초기화
        	this.payStatCd      = "00";  // 현재 상태 초기화

        	this.FN_listRtsd0104(ordNo);
        	this.div_custInfo.div_custInfoDetail.btn_creditSelect.set_visible(false);
        	
        	//[20230210_1] kstka
        	//=================================================
        	this.btn_refresh.set_visible(true);
        	//=================================================
        	
        	if( this.userGrp == "05" ){
        		this.div_installInfo.btn_searchAgency.set_visible(false);
        		this.div_installInfo.ed_agencyNm.set_width(370);
        	}else{
        		this.div_installInfo.btn_searchAgency.set_visible(true);
        		this.div_installInfo.ed_agencyNm.set_width(320);
        	}	
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //USER FUNCTION : 계약정보 SELECT
        this.FN_listRtsd0104 = function(ordNo ){
        	this.FN_initializationDataSet();
        	var sSvcID        	= "listRtsd0104";                    
        	var sController   	= "rtms/sd/listRtsd0104.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	sOutDatasets += " ds_rtsd0104=mapRtsd0104 ";//계약정보
        	sOutDatasets += " ds_rtsd0100=mapRtsd0100 ";//고객마스터
        	sOutDatasets += " ds_rtsd0110=mapRtsd0110 ";//본인인증이력
        	sOutDatasets += " ds_rtsd0111=mapRtsd0111 ";//개인정보제공동의
        	sOutDatasets += " ds_rtre0010=mapRtre0010 ";//고객계좌정보
        	sOutDatasets += " ds_rtre0020=mapRtre0020 ";//고객카드정보
        	sOutDatasets += " ds_rtsd0115=mapRtsd0015 ";//SAP인터페이스정보
        	sArgs += Ex.util.setParam("ordNo", 	ordNo);
        	sArgs += Ex.util.setParam("ordType", "N");
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);		
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //USER FUNCTION : 계약상품 SELECT
        /*this.FN_listRtsd0106 = function(ordNo){
        	var ordNo		= nvl(this.ds_rtsd0104.getColumn(0,"ordNo"));
        	var modelCd 	= nvl(this.ds_rtsd0104.getColumn(0,"modelCd"));
        	var contentsCd 	= nvl(this.ds_rtsd0104.getColumn(0,"contentsCd"));
        	var psCd 		= nvl(this.ds_rtsd0104.getColumn(0,"psCd"));
        	var ordDay 		= nvl(this.ds_rtsd0104.getColumn(0,"ordDay"));	
        	
        	if( ordNo == "" ){
        		alert("계약번호 값이 없습니다.");
        		return false;
        	}else if( modelCd == "" ){
        		alert("차종 값이 없습니다.");
        		return false;
        	}else if( contentsCd == "" ){
        		alert("사양 값이 없습니다.");
        		return false;
        	}else if( psCd == "" ){
        		alert("프리미엄서비스코드 값이 없습니다.");
        		return false;
        	}else if( ordDay == "" ){
        		alert("접수일자 값이 없습니다.");
        		return false;
        	}else{
        		var sSvcID        	= "listRtsd0106";                    
        		var sController   	= "rtms/sd/listRtsd0106.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		sOutDatasets += " ds_rtsd0106=mapRtsd0106 ";	//계약상품정보
        		sOutDatasets += " ds_price=mapProductAndprice ";
        		sOutDatasets += " ds_rtsd0013=mapRtsd0013 ";	//계약별프리미엄서비스
        		sOutDatasets += " ds_rtsd0014=mapRtsd0014 ";	//계약별캠페인적용
        		
        		sArgs += Ex.util.setParam("ordNo", ordNo);
        		sArgs += Ex.util.setParam("modelCd", modelCd);
        		sArgs += Ex.util.setParam("contentsCd", contentsCd);
        		sArgs += Ex.util.setParam("psCd", psCd);
        		sArgs += Ex.util.setParam("ordDay", ordDay);
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        	}
        } */
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        /*★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ */
        //고객정보 END
        /*★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ */
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

        

        

        

        

        
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        /*★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ */
        //결제정보 START
        /*★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ */
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //BUTTON EVENT : 결제정보 신규버튼
        this.div_payInfo_btn_custNew_onclick = function(obj,e){
        	var nRow0104	= this.ds_rtsd0104.rowposition;
        	var chanCd 		= nvl(this.ds_rtsd0104.getColumn(nRow0104, "chanCd"));
        	var statCd 		= nvl(this.ds_rtsd0104.getColumn(nRow0104, "statCd"));
        	
        	//[20230210_1] kstka
        	//=============================================================================================
        	if( chanCd == "02" ){
        	//if( chanCd == "02" || chanCd == "03" ){
        		//alert("온라인, 방판 정보는 수정 처리가 불가 합니다!");
        		alert("온라인 주문은 수정 처리가 불가 합니다!");
        		return false;
        	}
        	//=============================================================================================
        	
        	if( statCd=="03" || statCd=="04" || statCd=="06" ){
        		alert("장착대기, 장착완료, 계약취소 정보는 수정  처리가 불가 합니다!");
        		return false;
        	}
        	
        	this.payAddRowFlag = true;
        	this.div_payInfo.cb_payMthd.set_enable(true);
        	this.div_payInfo.cb_payCustTp.set_enable(true);
        	this.div_payInfo.cb_payMthd.setFocus(true);
        	this.div_payInfo.btn_payChoice.set_visible(true);
        	this.ds_rtre0010.clearData();
        	this.ds_rtre0020.clearData();
        	this.div_payInfo.div_acc.cb_B_bankPayDay.set_enable(false);
        	this.div_payInfo.div_card.cb_C_bankPayDay.set_enable(false);
        	this.div_payInfo.cb_payMthd.set_index(-1);
        	this.div_payInfo.cb_payCustTp.set_index(-1);
        	this.div_payInfo.cb_payCustTp.set_enable(false);
        	this.div_payInfo.div_acc.btn_accConfirm.set_enable(true);
        	this.div_payInfo.div_card.btn_cardConfirm.set_enable(true);
        	this.ch_resultPayInfo.set_value(false);
        	this.ch_resultArsCall.set_value(false);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //SELECT BOX : 결제정보-결제방법
        this.div_payInfo_cb_payMthd_onitemchanged = function(obj,e){
        	if( this.payAddRowFlag ){
        		this.ds_rtre0010.addRow();
        		this.ds_rtre0020.addRow();
        	}		
        	
        	var rowposition = this.ds_rtsd0100.rowposition;
        	var custTp		= nvl(this.ds_rtsd0100.getColumn(rowposition, "custTp"));
        	var custTp2		= nvl(this.ds_rtsd0100.getColumn(rowposition, "custTp2"));
        	
        	if( this.payAddRowFlag){
        		this.div_payInfo.cb_payCustTp.set_value(custTp);
        	}
        	
        	if( custTp2 == "0002"){
        		this.div_payInfo.cb_payCustTp.set_enable(true);
        	}else{
        		this.div_payInfo.cb_payCustTp.set_enable(false);
        	}
        	
        	if( this.div_payInfo.cb_payMthd.value == "A" ){
        		this.ds_rtre0020.clearData();
        		this.div_payInfo.div_acc.set_visible(true);
        		this.div_payInfo.div_card.set_visible(false);
        	}else if( this.div_payInfo.cb_payMthd.value == "C" ){
        		this.ds_rtre0010.clearData();
        		this.div_payInfo.div_acc.set_visible(false);
        		this.div_payInfo.div_card.set_visible(true);
        	}
        	
        	this.div_payInfo_cb_payCustTp_onitemchanged();
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //SELECT BOX : 결제방법-구분
        this.div_payInfo_cb_payCustTp_onitemchanged = function(obj,e){
        	var rowposition = this.ds_rtsd0100.rowposition;
        	var custTp		= nvl(this.ds_rtsd0100.getColumn(rowposition, "custTp"));
        	var custTp2		= nvl(this.ds_rtsd0100.getColumn(rowposition, "custTp2"));
        	var custNm		= nvl(this.ds_rtsd0100.getColumn(rowposition, "custNm"));
        	var repNm		= nvl(this.ds_rtsd0100.getColumn(rowposition, "repNm"));
        	var oCustnm		= nvl(this.ds_rtsd0100.getColumn(rowposition, "oCustnm"));
        	var buslNo		= nvl(this.ds_rtsd0100.getColumn(rowposition, "buslNo"));
        	var birthDay	= nvl(this.ds_rtsd0100.getColumn(rowposition, "birthDay"));
        	if(birthDay != "") birthDay = birthDay.substr(2);
        	var oBirthday	= nvl(this.ds_rtsd0100.getColumn(rowposition, "oBirthday"));
        	if(oBirthday != "") oBirthday = oBirthday.substr(2);
        	var payMthd =  this.div_payInfo.cb_payMthd.value;
        	var payCustTp =  this.div_payInfo.cb_payCustTp.value;
        	
        	if( payCustTp == "01" ){//개인
        		if( payMthd == "A" ){//계좌
        			this.div_payInfo.div_acc.st_B_ebirDay.set_visible(true);
        			this.div_payInfo.div_acc.ed_B_ebirDay.set_visible(true);
        			
        			this.div_payInfo.div_acc.st_B_buslNo.set_visible(false);
        			this.div_payInfo.div_acc.ed_B_buslNo.set_visible(false);
        			
        			this.div_payInfo.div_acc.ed_B_custNm.set_enable(true);
        			this.div_payInfo.div_acc.ed_B_ebirDay.set_enable(false);
        			this.div_payInfo.div_acc.ed_B_buslNo.set_enable(false);
        			this.div_payInfo.div_acc.cb_B_bankCd.set_enable(true);
        			this.div_payInfo.div_acc.ed_B_acctNo.set_enable(true);
        			this.div_payInfo.div_acc.cb_B_bankPayDay.set_enable(true);
        			
        			this.div_payInfo.div_acc.st_B_arsCall.set_enable(true);
        			this.div_payInfo.div_acc.btn_arsCall.set_enable(true);
        			
        			if( this.payAddRowFlag ){
        				this.div_payInfo.div_acc.ed_B_custNm.set_value(custNm);
        				this.div_payInfo.div_acc.ed_B_ebirDay.set_value(birthDay);
        			}
        			if( custTp2 == "0002" && this.payAddRowFlag ){//개인사업자
        				this.div_payInfo.div_acc.ed_B_custNm.set_value(repNm);
        				this.div_payInfo.div_acc.ed_B_ebirDay.set_enable(true);
        				this.div_payInfo.div_acc.ed_B_buslNo.set_value("");
        			}
        		}
        		
        		if( payMthd == "C" ){//카드
        			this.div_payInfo.div_card.st_C_ebirDay.set_visible(true);
        			this.div_payInfo.div_card.ed_C_ebirDay.set_visible(true);
        			
        			this.div_payInfo.div_card.st_C_buslNo.set_visible(false);
        			this.div_payInfo.div_card.ed_C_buslNo.set_visible(false);
        			
        			this.div_payInfo.div_card.ed_C_custNm.set_enable(true);
        			this.div_payInfo.div_card.ed_C_buslNo.set_enable(false);
        			this.div_payInfo.div_card.cb_C_bankCd.set_enable(true);
        			this.div_payInfo.div_card.ed_C_cardNo.set_enable(true);
        			this.div_payInfo.div_card.ed_C_expireY.set_enable(true);
        			this.div_payInfo.div_card.ed_C_expireM.set_enable(true);
        			
        			this.div_payInfo.div_card.cb_C_bankPayDay.set_enable(true);
        			
        			if( this.payAddRowFlag ){
        				this.div_payInfo.div_card.ed_C_custNm.set_value(custNm);
        				this.div_payInfo.div_card.ed_C_ebirDay.set_value(birthDay);
        			}
        			if( custTp2 == "0002" && this.payAddRowFlag ){//개인사업자
        				this.div_payInfo.div_card.ed_C_custNm.set_value(repNm);
        				this.div_payInfo.div_acc.ed_B_ebirDay.set_enable(true);
        				this.div_payInfo.div_card.ed_C_buslNo.set_value("");
        			}
        		}
        	}
        	
        	if( payCustTp == "02" ){//사업자
        		if( payMthd == "A" ){//계좌
        			this.div_payInfo.div_acc.st_B_ebirDay.set_visible(false);
        			this.div_payInfo.div_acc.ed_B_ebirDay.set_visible(false);
        			
        			this.div_payInfo.div_acc.st_B_buslNo.set_visible(true);
        			this.div_payInfo.div_acc.ed_B_buslNo.set_visible(true);
        			
        			
        			this.div_payInfo.div_acc.ed_B_custNm.set_enable(true);
        			this.div_payInfo.div_acc.ed_B_ebirDay.set_enable(false);
        			this.div_payInfo.div_acc.ed_B_buslNo.set_enable(false);
        			this.div_payInfo.div_acc.cb_B_bankCd.set_enable(true);
        			this.div_payInfo.div_acc.ed_B_acctNo.set_enable(true);
        			this.div_payInfo.div_acc.cb_B_bankPayDay.set_enable(true);
        			
        			this.div_payInfo.div_acc.st_B_arsCall.set_enable(true);
        			this.div_payInfo.div_acc.btn_arsCall.set_enable(true);			
        			
        			if( this.payAddRowFlag ){
        				this.div_payInfo.div_acc.ed_B_custNm.set_value(custNm);
        				this.div_payInfo.div_acc.ed_B_ebirDay.set_value("");
        				this.div_payInfo.div_acc.ed_B_buslNo.set_value(buslNo);
        			}
        		}
        		
        		if( payMthd == "C" ){//카드
        			this.div_payInfo.div_card.st_C_ebirDay.set_visible(false);
        			this.div_payInfo.div_card.ed_C_ebirDay.set_visible(false);
        			
        			this.div_payInfo.div_card.st_C_buslNo.set_visible(true);
        			this.div_payInfo.div_card.ed_C_buslNo.set_visible(true);
        			
        			this.div_payInfo.div_card.ed_C_custNm.set_enable(true);
        			this.div_payInfo.div_card.ed_C_buslNo.set_enable(false);
        			this.div_payInfo.div_card.cb_C_bankCd.set_enable(true);
        			this.div_payInfo.div_card.ed_C_cardNo.set_enable(true);
        			this.div_payInfo.div_card.ed_C_expireY.set_enable(true);
        			this.div_payInfo.div_card.ed_C_expireM.set_enable(true);
        			this.div_payInfo.div_card.cb_C_bankPayDay.set_enable(true);
        			
        			if( this.payAddRowFlag ){
        				this.div_payInfo.div_card.ed_C_custNm.set_value(custNm);
        				this.div_payInfo.div_card.ed_C_ebirDay.set_value("");
        				this.div_payInfo.div_card.ed_C_buslNo.set_value(buslNo);
        			}
        		}
        	}
        }

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_payInfo_btn_payChoice_onclick = function(obj,e){
        	var payMthd	= nvl(this.div_payInfo.cb_payMthd.value);
        	var custNo	= nvl(this.div_custInfo.ed_custNo.value);
        	var args	= {p_arg : this.p_arg, p_custNo : custNo, p_gubun : payMthd};
        	
        	if( payMthd == "A" ){
        		Ex.core.popup(this,"고객계좌선택 팝업","comm::RTCOMMAccount_pop.xfdl",args, "modaless=false");
        		this.ch_resultArsCall.set_value(false);
        		//this.ch_resultPayInfo.set_value(false);
        	}else if( payMthd == "C" ){
        		Ex.core.popup(this,"고객계좌선택 팝업","comm::RTCOMMCard_pop.xfdl",args, "modaless=false");
        	}else{
        		alert( this.div_payInfo.st_payMthd.text + "을 선택해주세요.");
        		return this.div_payInfo.cb_payMthd.setFocus(true);
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.returnAccount = function(ds,p_arg){
        	if( ds[0].rowcount > 0 ) {
        		this.ds_rtre0010.clearData();
        		this.ds_rtre0020.clearData();
        		this.payAddRowFlag = false;
        		this.ds_rtre0010.copyData(ds[0]);

        		this.div_payInfo.cb_payMthd.set_value( nvl(this.ds_rtre0010.getColumn(0,"payMthd")) );
        		this.div_payInfo.cb_payCustTp.set_value( nvl(this.ds_rtre0010.getColumn(0,"custTp")) );
        		var accChk = nvl(this.ds_rtre0010.getColumn(0,"accChk"));
        		// 2016-08-01 이영근, 계좌 불러오기 후 재계좌인증하도록 변경
        		/*
        		if( accChk == "Y" ) accChk = true;
        		else 				accChk = false;
        		this.ch_resultPayInfo.set_value(accChk);
        		*/
        		
        		this.div_payInfo_cb_payMthd_onitemchanged();
        		this.div_payInfo.cb_payMthd.set_enable(false);
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.returnCard = function(ds,p_arg){
        	if( ds[0].rowcount > 0 ) {
        		this.ds_rtre0010.clearData();
        		this.ds_rtre0020.clearData();
        		this.payAddRowFlag = false;
        		this.ds_rtre0020.copyData(ds[0]);

        		this.div_payInfo.cb_payMthd.set_value( nvl(this.ds_rtre0020.getColumn(0,"payMthd")) );
        		this.div_payInfo.cb_payCustTp.set_value( nvl(this.ds_rtre0020.getColumn(0,"custTp")) );
        		var bkeyChk = nvl(this.ds_rtre0020.getColumn(0,"bkeyChk"));
        		if( bkeyChk == "Y" ) bkeyChk = true;
        		else 				 bkeyChk = false;
        		this.ch_resultPayInfo.set_value(bkeyChk);

        		this.div_payInfo_cb_payMthd_onitemchanged();
        		this.div_payInfo.cb_payMthd.set_enable(false);
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_payInfo_div_acc_ed_B_ebirDay_onchanged = function(obj,e){
        	var checkEbirDay = FN_YYMMDDCheck(this.div_payInfo.div_acc.ed_B_ebirDay.value)//comLib 생년월일체크
        	if( !checkEbirDay ){
        		alert("생년월일 다시 확인 해 주세요.");
        		this.div_payInfo.ed_ebirDayCheck.set_value("false");
        		this.div_payInfo.div_acc.ed_B_ebirDay.set_value("");
        		this.div_payInfo.div_acc.ed_B_ebirDay.setFocus(true);
        		return false;
        	}else{
        		this.div_payInfo.ed_ebirDayCheck.set_value("true");
        		return true;
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_payInfo_div_card_ed_C_ebirDay_onchanged = function(obj,e){
        	var checkEbirDay = FN_YYMMDDCheck(this.div_payInfo.div_card.ed_C_ebirDay.value)//comLib 생년월일체크
        	if( !checkEbirDay ){
        		alert("생년월일 다시 확인 해 주세요.");
        		this.div_payInfo.ed_ebirDayCheck.set_value("false");
        		this.div_payInfo.div_card.ed_C_ebirDay.set_value("");
        		this.div_payInfo.div_card.ed_C_ebirDay.setFocus(true);
        		return false;
        	}else{
        		this.div_payInfo.ed_ebirDayCheck.set_value("true");
        		return true;
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_payInfo_div_acc_ed_B_buslNo_onchanged = function(obj,e){
        	var checkBuslNo = FN_buslNoCheck(this.div_payInfo.div_acc.ed_B_buslNo.value)//comLib 사업자번호체크
        	if( !checkBuslNo ){
        		alert("사업자번호를 다시 확인 해 주세요.");
        		this.div_payInfo.ed_buslNoCheck.set_value("false");
        		this.div_payInfo.div_acc.ed_B_buslNo.set_value("");
        		this.div_payInfo.div_acc.ed_B_buslNo.setFocus(true);
        		return false;
        	}else{
        		this.div_payInfo.ed_buslNoCheck.set_value("true");
        		return true;
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_payInfo_div_card_ed_C_buslNo_onchanged = function(obj,e){
        	var checkBuslNo = FN_buslNoCheck(this.div_payInfo.div_card.ed_C_buslNo.value)//comLib 사업자번호체크
        	if( !checkBuslNo ){
        		alert("사업자번호를 다시 확인 해 주세요.");
        		this.div_payInfo.ed_buslNoCheck.set_value("false");
        		this.div_payInfo.div_card.ed_C_buslNo.set_value("");
        		this.div_payInfo.div_card.ed_C_buslNo.setFocus(true);
        		return false;
        	}else{
        	
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_payInfo_div_card_ed_C_cardNo_canchange = function(obj,e){
        	var carNoLength = obj.value.length;
        	if(carNoLength > 16){
        		alert("카드번호는 13 ~ 16자리만 입력가능합니다.");
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_payInfo_div_acc_btn_accConfirm_onclick = function(obj,e){
        	var btn_nm = obj.id;
        	this.fn_accConfirm(btn_nm);
        }
        /*계좌인증|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_accConfirm = function(btn_nm) {
        	var userType = nvl(this.div_payInfo.cb_payCustTp.value);			//개인/사업자
        	var bankCd	 = nvl(this.div_payInfo.div_acc.cb_B_bankCd.value);		//은행코드
        	var acctCd 	 = nvl(this.div_payInfo.div_acc.ed_B_acctNo.text);		//계좌번호
        	var bizNo	 = "";	//생년월일 또는 사업자번호
        	if(nvl(this.div_payInfo.cb_payCustTp.value) == "01"){ 				//개인
        		if(btn_nm == "btn_accConfirm")
        			bizNo = nvl(this.div_payInfo.div_acc.ed_B_ebirDay.value);		//생년월일	
        		else
        			bizNo = nvl(this.div_custInfo.ed_birthDay.value);		//생년월일(출금이체동의)
        	}else{
        		bizNo = nvl(this.div_payInfo.div_acc.ed_B_buslNo.value);		//사업자번호
        	}
        	
        	var custNo	 	= nvl(this.ds_rtsd0100.getColumn(this.ds_rtsd0100.rowposition,"custNo"));	//고객번호
        	var custNm	 	= nvl(this.ds_rtsd0100.getColumn(this.ds_rtsd0100.rowposition,"custNm"));	//고객명
        	var ownerNm	 	= nvl(this.div_payInfo.div_acc.ed_B_custNm.value);							//예금주명
        	var bankPayDay	= nvl(this.div_payInfo.div_acc.cb_B_bankPayDay.value);						//결제일
        	
        	var acctCdLen 	= acctCd.length;
        	var acctSubstr	= acctCd.substr(0,3);
        	
        	var bankNm	 = nvl(this.div_payInfo.div_acc.cb_B_bankCd.text);
        	var mobNo	 = nvl(this.div_custInfo.div_custInfoDetail.ed_mobNo.value);
        	
        	
        	if( userType == "" ){
        		alert("개인/사업자 값이 없습니다.");
        		return false;
        	}else if( bankCd == "" ){
        		alert("은행코드 값이 없습니다.");
        		return false;
        	}else if( acctCd == "" ){
        		alert("계좌번호 값이 없습니다.");
        		return false;
        	}else if( bizNo == "" ){
        		alert("생년월일 또는 사업자번호 값이 없습니다.");
        		return false;
        	}else if( custNo == "" ){
        		alert("고객번호 값이 없습니다.");
        		return false;
        	}else if( custNm == "" ){
        		alert("고객명 값이 없습니다.");
        		return false;
        	}else if( ownerNm == "" ){
        		alert("예금주명 값이 없습니다.");
        		return false;
        	}else if( bankPayDay == "" || bankPayDay == -1 ){
        		alert("결제일 값이 없습니다.");
        		return false;
        	}else if( (bankCd == '003') && ((acctCdLen == 10) || (acctCdLen == 11)) ){
        		alert("평생계좌는 자동이체 신청이 불가능합니다.\n기업은행 : 계좌번호가 10자리, 11자리\n신한은행 : 계좌번호가 10자리~14자리면서 앞번호 010 시작");
        		return false;
        	}else if( (bankCd == '088') && ((acctCdLen == 10) || (acctCdLen == 11) || (acctCdLen == 12) || (acctCdLen == 13) || (acctCdLen == 14)) && (acctSubstr == "010") ){
        		alert("평생계좌는 자동이체 신청이 불가능합니다.\n기업은행 : 계좌번호가 10자리, 11자리\n신한은행 : 계좌번호가 10자리~14자리면서 앞번호 010 시작");
        		return false;
        	}else if(this.div_custInfo.div_custInfoDetail.ra_certification.value == "02" || this.certificationFlag == false){
        		if(application.gv_host == "http://localhost/" || application.gv_host == "http://1.254.67.135:9080/"){
        			if(btn_nm == "btn_accConfirm"){
        				var sSvcID        	= "kftcCmsDocInfo";                    
        				var sController   	= "rtms/sms/kftcCmsDocInfo.do";		
        			}else{
        				// 계좌인증 불가시간대 ARS테스트 시 주석처리(시작)
        				if(this.ch_resultPayInfo.value != true){
        					alert("계좌인증 후 진행해주시기 바랍니다.");
        					return;				
        				}
        				// 계좌인증 불가시간대 ARS테스트 시 주석처리(끝)
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
        			trace(sArgs);

        			Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        		}else{	
        			// 2016-06-13 이영근, 신분증으로 본인인증한 경우 CMS 등록하지 못하도록 처리
        			alert("결제방법이 'CMS'인 경우, 휴대폰으로 본인인증한 회원만 신청이 가능합니다.");
        			this.div_custInfo.div_custInfoDetail.ra_certification.set_enable( true);
        			this.div_custInfo.div_custInfoDetail.btn_certification.set_enable(true);
        			this.div_custInfo.div_custInfoDetail.ra_certification.set_value("01");
        			this.div_custInfo.div_custInfoDetail.btn_certification.setFocus();
        			return false;	
        		}
        	}else{
        		if(btn_nm == "btn_accConfirm"){
        			var sSvcID        	= "kftcCmsDocInfo";                    
        			var sController   	= "rtms/sms/kftcCmsDocInfo.do";		
        		}else{
        			// 계좌인증 불가시간대 ARS테스트 시 주석처리(시작)
        			if(this.ch_resultPayInfo.value != true){
        				alert("계좌인증 후 진행해주시기 바랍니다.");
        				return;				
        			}
        			// 계좌인증 불가시간대 ARS테스트 시 주석처리(끝)
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
        		trace(sArgs);

        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_payInfo_div_card_btn_cardConfirm_onclick = function(obj,e){
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
        	
        	var payCustTp = nvl(this.div_payInfo.cb_payCustTp.value);				//구분
        	var custNm  	= nvl(this.div_payInfo.div_card.ed_C_custNm.value);		//카드주명
        	var ebirDay 	= nvl(this.div_payInfo.div_card.ed_C_ebirDay.value);	//법정생년월일
        	var buslNo  	= nvl(this.div_payInfo.div_card.ed_C_buslNo.value);		//사업자번호
        	var bankCd 		= nvl(this.div_payInfo.div_card.cb_C_bankCd.value);		//카드사
        	var cardNo 		= nvl(this.div_payInfo.div_card.ed_C_cardNo.value);		//카드번호
        	var expireM 	= nvl(this.div_payInfo.div_card.ed_C_expireM.value);	//유효년월-월
        	var expireY  	= nvl(this.div_payInfo.div_card.ed_C_expireY.value);	//유효년월-년
        	var bankPayDay  = nvl(this.div_payInfo.div_card.cb_C_bankPayDay.value);	//결제일
        	var msg			= " 값이 없습니다.";
        	
        	if( payCustTp == "" ){
        		alert("구분" + msg);
        		this.div_payInfo.cb_payCustTp.setFocus(true);
        		return false;
        	}
        	if( custNm == "" ){
        		alert("카드주명" + msg);
        		this.div_payInfo.ed_C_custNm.setFocus(true);
        		return false;
        	}
        	
        	if( payCustTp == "01" ){
        		if( ebirDay == "" ){
        			alert("법정생년월일" + msg);
        			this.div_payInfo.ed_C_ebirDay.setFocus(true);
        			return false;
        		}
        	}
        	
        	if( payCustTp == "02" ){
        		if( buslNo == "" ){
        			alert("사업자번호" + msg);
        			this.div_payInfo.ed_C_buslNo.setFocus(true);
        			return false;
        		}
        	}
        	
        	if( bankCd == "" ){
        		alert("카드사" + msg);
        		this.div_payInfo.cb_C_bankCd.setFocus(true);
        		return false;
        	}
        	
        	if( expireM == "" ){
        		alert("유효년월" + msg);
        		this.div_payInfo.ed_C_expireM.setFocus(true);
        		return false;
        	}
        	
        	if( expireM < 1 || expireM > 12 ){
        		alert("유효년월 값을 확인하세요.");
        		this.div_payInfo.ed_C_expireM.setFocus(true);
        		return false;
        	}
        	
        	if( expireY == "" ){
        		alert("유효년월" + msg);
        		this.div_payInfo.ed_C_expireY.setFocus(true);
        		return false;
        	}
        	
        	var expire = expireY+expireM;
        	if( this.toDay > expire ){
        		alert("유효년월" + msg);
        		this.div_payInfo.ed_C_expireY.setFocus(true);
        		return false;
        	}
        	if( bankPayDay == "" || bankPayDay == -1 ){
        		alert("결제일" + msg);
        		this.div_payInfo.cb_C_bankPayDay.setFocus(true);
        		return false;
        	}
        	
        	var sSvcID 			= "batchService";
        	var sInDatasets 	= "";
        	var sOutDatasets 	= "dsBatch=batch_output";
        	var sController 	= "/rtms/cms/kcphubBatch.do";
        	var fn_callBack 	= "fn_callBack";
        	var args 			= "";
        	args += " site_cust_id=" + nvl(this.ds_rtsd0100.getColumn(0,"custNo"));			//고객아이디
        	args += " group_id=" 	 + application.gv_group_id ;							//그룹번호
        	args += " cust_name=" 	 + nvl(this.div_payInfo.div_card.ed_C_custNm.value);	//카드소유자명
        	args += " pay_owner_nm=" + nvl(this.div_custInfo.ed_custNm.value);				//카드주명
        	args += " pay_type=" 	 + application.gv_pay_type;								//결제수단	
        	args += " pay_id=" 		 + nvl(this.div_payInfo.div_card.ed_C_cardNo.value);	//카드번호
        	args += " pay_expiry_yy="+ nvl(this.div_payInfo.div_card.ed_C_expireY.value);	//유효년월-년
        	args += " pay_expiry_mm="+ nvl(this.div_payInfo.div_card.ed_C_expireM.value);	//유효년월-월
        	args += " pay_cert_no="  + nvl(this.div_payInfo.div_card.ed_C_ebirDay.value);	//법정생년월일
        	args += " cmbGubun=" 	 + nvl(this.div_payInfo.cb_payCustTp.value);			//구분
        	args += " busl_no=" 	 + nvl(this.div_payInfo.div_card.ed_C_buslNo.value);	//사업자번호
        	args += " cardcomCd=" 	 + nvl(this.div_payInfo.div_card.cb_C_bankCd.value);	//카드사
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, args, fn_callBack);
        }
        /*카드인증후 처리함수|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
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
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.FN_payInfo_enable = function(bFlag){
        	this.div_payInfo.cb_payMthd.set_enable(bFlag);
        	this.div_payInfo.cb_payCustTp.set_enable(bFlag);
        	
        	this.div_payInfo.div_card.ed_C_custNm.set_enable(bFlag);
        	this.div_payInfo.div_card.ed_C_ebirDay.set_enable(bFlag);
        	this.div_payInfo.div_card.ed_C_buslNo.set_enable(bFlag);
        	this.div_payInfo.div_card.cb_C_bankCd.set_enable(bFlag);
        	this.div_payInfo.div_card.ed_C_cardNo.set_enable(bFlag);
        	this.div_payInfo.div_card.ed_C_expireY.set_enable(bFlag);
        	this.div_payInfo.div_card.ed_C_expireM.set_enable(bFlag);

        	this.div_payInfo.div_acc.ed_B_custNm.set_enable(bFlag);
        	this.div_payInfo.div_acc.ed_B_ebirDay.set_enable(bFlag); 
        	this.div_payInfo.div_acc.ed_B_buslNo.set_enable(bFlag);
        	this.div_payInfo.div_acc.cb_B_bankCd.set_enable(bFlag);
        	this.div_payInfo.div_acc.ed_B_acctNo.set_enable(bFlag);
        	
        	this.div_payInfo.btn_payChoice.set_visible(bFlag);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        /*★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ */
        //결제정보 END
        /*★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ */
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

        

        

        

        

        
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        /*★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ */
        //차량정보 START
        /*★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ */
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //SELECT BOX FUNCTION : 차종-브랜드
        this.div_carInfo_cb_makerCd_onitemchanged = function(obj,e){
        	this.div_carInfo.cb_model.set_index(-1);
        	this.FN_priceDeleteAll();
        	var sSvcID      	= "listModelCombo";  
        	var sController   	= "rtms/comm/listModelCombo.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_model=mapModelCombo";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	sArgs += Ex.util.setParam("makerCd", nvl(this.div_carInfo.cb_makerCd.value));
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //SELECT BOX FUNCTION : 차종-모델
        this.div_carInfo_cb_model_onitemchanged = function(obj,e){
        	nRow = this.ds_model.findRowExpr("rn == '"+this.div_carInfo.cb_model.value+"'&& mcNm == '"+this.div_carInfo.cb_model.text +"'",-1);
        	this.div_carInfo.ed_frCd.set_value(this.ds_model.getColumn(nRow,"frCd"));
        	
        	this.ds_model.set_rowposition(nRow);
        	
        	//제품추가버튼 활성화
        	
        	//-----2+2미허용
        	if(this.ds_productInfo.getRowCount() < 1){ 					
        		this.btnAddPrdt.set_enable(true);
        		this.btnAddPrdtDel.set_enable(true);
        	}

        	this.FN_priceDeleteAll();

        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //USER FUNCTION : DATASET CLEAR
        this.FN_priceDeleteAll = function(){
        	//this.ds_price.clearData();
        	//this.ds_price.addRow();
        	this.ds_rtsd0013.clearData();
        	this.ds_rtsd0014.clearData();
        	
        	//[20230210_1] kstka
        	//================================================================================
        	if(this.mode == this.MODIFY) {
        		this.p_periodCd.set_value("");
        		this.p_seasonCd.set_value("");
        		this.p_cntCd.set_value(0);
        		this.ed_SaleCd.set_value("");
        		this.ed_SaleProdNm.set_value("");
        			
        		this.ds_productInfo.clearData();			//제품정보
        		this.ds_ValuePrdtInfo.clearData();			//부가제품정보
        		this.ds_seviceCd.clearData();				//프리미엄서비스
        		this.ds_contactDeliInfo.clearData();		//계약정보
        		this.ds_sumPayInfo.clearData();				//합계금액
        		this.ds_RegAmtMgnt.clearData();				//등록비조정
        		this.ds_FreeRegAmtMgnt.clearData();				//등록비조정
        	}
        	//================================================================================
        }

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //EDIT FUNCTION : 차량번호 변경
        this.div_carInfo_ed_carNo_onchanged = function(obj,e){
        	/*
        	//var pattern1      = /\d{2}[가-힣ㄱ-ㅎㅏ-ㅣ\x20]\d{4}/g; 					 			// 12저3456
        	//var pattern2 	   	= /[가-힣ㄱ-ㅎㅏ-ㅣ\x20]{2}\d{1}|d{2}[가-힣ㄱ-ㅎㅏ-ㅣ\x20]\d{4}/g; 	// 서울12치1234
        	var pattern1       	= /\d{2}[가-힣ㄱ-ㅎㅏ-ㅣ\x20]\d{4}/g; 				 				// 12저3456
        	var pattern2 	   	= /[가-힣ㄱ-ㅎㅏ-ㅣ\x20]{2}\d{2}[가-힣ㄱ-ㅎㅏ-ㅣ\x20]\d{4}/g; 		// 서울12치1234
        	var carNoVal 		= nvl(this.div_carInfo.ed_carNo.value);
        	var carNoValLen 	= carNoVal.length;
        	
        	if( carNoValLen == 7 ){
        		if( !pattern1.test(carNoVal) ){
        			alert(nvl(this.div_carInfo.st_carNo.text) + " 를 확인하세요.");
        			this.div_carInfo.ed_carNo.setFocus(true);
        			this.div_carInfo.ed_carNo.setSelect();
        			return false;
        		}else{
        			this.selectRtsd0108SaleCdCount();
        		}
        	}else if( carNoValLen == 8 || carNoValLen == 9){
        		if( !pattern2.test(carNoVal) ){
        			alert(nvl(this.div_carInfo.st_carNo.text) + " 를 확인하세요.");
        			this.div_carInfo.ed_carNo.setFocus(true);
        			this.div_carInfo.ed_carNo.setSelect();
        			return false;
        		}else{
        			this.selectRtsd0108SaleCdCount();
        		}
        	}else{
        		alert(nvl(this.div_carInfo.st_carNo.text) + " 를 확인하세요.");
        		this.div_carInfo.ed_carNo.setFocus(true);
        		this.div_carInfo.ed_carNo.setSelect();
        		return false;
        	}
        	*/
        	//if(this.carNoCheck()){
        	//	this.selectRtsd0108SaleCdCount();
        	//}
        	
        	//[20230210_1] kstka
        	//=============================================================
        	//this.FN_priceDeleteAll();
        	//=============================================================
        }

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_carInfo_ed_carNo_onkillfocus = function(obj,e)
        {

        	if(this.carNoCheck()){
        	//	this.selectRtsd0108SaleCdCount();
        	}
        }

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //DATASET FUNCTION : ROWPOSITION이 변경되었을때
        this.ds_model_onrowposchanged = function(obj,e){
        	this.div_carInfo.ed_model.set_value( this.ds_model.getColumn(this.ds_model.rowposition,"modelCd") );
        	this.div_carInfo.ed_contentsCd.set_value( this.ds_model.getColumn(this.ds_model.rowposition,"contentsCd") ); // 2018.12.20 추가수정
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //EDIT FUNCTION : 차량소유자 -> ENTER KEY -> 차량번호로 FOUCS이동
        this.div_carInfo_ed_carOwner_onkeyup = function(obj,e){
        	if ( e.keycode == 13 ){
        		this.div_carInfo.ed_carNo.setFocus(true);
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //EDIT FUNCTION : 차량번호 -> ENTER KEY -> 현재주행거리로 FOUCS이동
        this.div_carInfo_ed_carNo_onkeyup = function(obj,e){
        	if ( e.keycode == 13 ){
        		this.div_carInfo.ed_cMileage.setFocus(true);
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //EDIT FUNCTION : 현재주행거리 체크
        this.div_carInfo_ed_cMileage_onchanged = function(obj,e){
        	if( obj.value.length > 7){
        		alert("최대자리수는 7자리입니다.");
        		this.div_carInfo.ed_cMileage.set_value();
        		this.div_carInfo.ed_cMileage.setFocus(true);
        	}
        	if( obj.value < 0){
        		alert("현재주행거리는 0보다 큰 수만 입력가능합니다.");
        		this.div_carInfo.ed_cMileage.set_value();
        		this.div_carInfo.ed_cMileage.setFocus(true);
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        /*★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ */
        //차량정보 END
        /*★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ */
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

        

        

        

        

        
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        /*★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ */
        //상품-가격정보 START
        /*★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ */
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //GRID CLICK FUNCTION
        /*this.div_productInfo_grid_price_oncellclick = function(obj:Grid, e:nexacro.GridClickEventInfo){
        	var carNo = nvl(this.div_carInfo.ed_carNo.value);
        	if( carNo == "" ){
        		alert("차량No가 없습니다.");
        		this.div_carInfo.ed_carNo.setFocus(true);
        		return false;
        	}
        	if( !this.carNoCheck() ){
        		return false;
        	}
        	
        	this.selectRtsd0108SaleCdCount();
        	
        	if(e.cell == 0){
        		var brandVal	= nvl( this.div_carInfo.cb_makerCd.value );
        		var modelVal 	= nvl( this.div_carInfo.cb_model.value );
        		var makerTxt	= nvl( this.div_carInfo.cb_makerCd.text );
        		var modelTxt 	= nvl( this.div_carInfo.cb_model.text );
        		
        		var idx 		= this.ds_model.rowposition;
        		
        		var modelCd 	= nvl(this.ds_model.getColumn(idx, "modelCd"));
        		var contentsCd 	= nvl(this.ds_model.getColumn(idx, "contentsCd"));
        		var frCd 		= nvl(this.ds_model.getColumn(idx, "frCd"));
        		var ordDay		= nvl(this.div_etcInfo.cal_ordDay.value);
        		
        		var idx 		= this.ds_price.rowposition;
        		var periodCd	= nvl(this.ds_price.getColumn(idx, "periodCd"))
        		var cntCd		= nvl(this.ds_price.getColumn(idx, "cntCd"))
        		var matNm		= nvl(this.ds_price.getColumn(idx, "matNm"))
        		var regiAmt		= nvl(this.ds_price.getColumn(idx, "regiAmt"))
        		var rentAmt		= nvl(this.ds_price.getColumn(idx, "rentAmt"))
        		var seasonCd	= nvl(this.ds_price.getColumn(idx, "seasonCd"))

        		//*S031:01-일반
        		//*S031:02-재렌탈
        		//*S031:03-AS성
        		var saleId		= nvl(this.ra_sale.value);
        		var carNo 		= nvl(this.div_carInfo.ed_carNo.value);
        		
        		if( brandVal == "" ){
        			alert("브랜드명 값이 없습니다.");
        			this.div_carInfo.cb_makerCd.setFocus(true);
        		}else if( modelVal == "" ){
        			alert("모델명 값이 없습니다.");
        			this.div_carInfo.cb_model.setFocus(true);
        		}else{
        			var arr ={
        						  p_arg 		: this.p_arg
        						, p_makerTxt	: makerTxt
        						, p_modelTxt	: modelTxt
        						, p_modelCd		: modelCd
        						, p_contentsCd	: contentsCd
        						, p_frCd		: frCd
        						, p_ordDay 		: ordDay
        						, p_periodCd	: periodCd
        						, p_cntCd		: cntCd
        						, p_matNm		: matNm
        						, p_regiAmt		: regiAmt
        						, p_rentAmt		: rentAmt
        						, p_saleId		: saleId
        						, p_carNo		: carNo
        						, p_seasonCd	: seasonCd
        					};
        			Ex.core.popup(this,"상품 및 가격 조회","comm::RTCOMMProductAndPrice_pop.xfdl",arr, "modaless=false");
        		}
        	}
        }*/

        
        /* this.returnProPriInfo = function(ds){
        	if (ds[0].rowcount > 0) {
        		this.ds_price.clearData();
        		this.ds_rtsd0013.clearData();
        		this.ds_rtsd0014.clearData();
        		this.ds_price.copyData(ds[0]);
        		
        		this.FN_searchRateAmt();
        		//this.FN_searchPreminum();	// [20180212_01] 프리미엄 서비스 조회기능 팝업 선택으로 이관
        	}
        } */

        
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //USER FUNCTION : 차량번호체크
        this.carNoCheck = function(){
        	//var pattern1      = /\d{2}[가-힣ㄱ-ㅎㅏ-ㅣ\x20]\d{4}/g; 					 			// 12저3456
        	//var pattern2 	   	= /[가-힣ㄱ-ㅎㅏ-ㅣ\x20]{2}\d{1}|d{2}[가-힣ㄱ-ㅎㅏ-ㅣ\x20]\d{4}/g; 	// 서울12치1234
        	var pattern1       	= /\d{2}[가-힣ㄱ-ㅎㅏ-ㅣ\x20]\d{4}/g; 				 				// 12저3456
        	var pattern2 	   	= /[가-힣ㄱ-ㅎㅏ-ㅣ\x20]{2}\d{2}[가-힣ㄱ-ㅎㅏ-ㅣ\x20]\d{4}/g; 		// 서울12치1234
        	var pattern3 	   	= /[가-힣ㄱ-ㅎㅏ-ㅣ\x20]{2}\d{1}[가-힣ㄱ-ㅎㅏ-ㅣ\x20]\d{4}/g; 		// 서울1치1234 // 2016-06-02 이영근, 패턴 추가
        	var pattern4 	   	= /\d{3}[가-힣ㄱ-ㅎㅏ-ㅣ\x20]\d{4}/g;                          		// 123저4567    // [20190903_01] 패턴 추가
        	var carNoVal 		= nvl(this.div_carInfo.ed_carNo.value);
        	var carNoValLen 	= carNoVal.length;
        	
        	if( carNoValLen == 7 ){
        		if( !pattern1.test(carNoVal) ){
        			alert(nvl(this.div_carInfo.st_carNo.text) + " 를 확인하세요.");
        			this.div_carInfo.ed_carNo.setFocus(true);
        			this.div_carInfo.ed_carNo.setSelect();
        			return false;
        		}else{
        			return true;
        		}
        	}else if( carNoValLen == 9){
        		if( !pattern2.test(carNoVal) ){
        			alert(nvl(this.div_carInfo.st_carNo.text) + " 를 확인하세요.");
        			this.div_carInfo.ed_carNo.setFocus(true);
        			this.div_carInfo.ed_carNo.setSelect();
        			return false;
        		}else{
        			return true;
        		}
        	// [20190903_01] 에 의해 패턴 추가
        	}else if( carNoValLen == 8){ 
        		if( !pattern3.test(carNoVal) && !pattern4.test(carNoVal) ){
        			alert(nvl(this.div_carInfo.st_carNo.text) + " 를 확인하세요.");
        			this.div_carInfo.ed_carNo.setFocus(true);
        			this.div_carInfo.ed_carNo.setSelect();
        			return false;
        		}else{
        			return true;
        		}		
        	}else{
        		alert(nvl(this.div_carInfo.st_carNo.text) + " 를 확인하세요.");
        		this.div_carInfo.ed_carNo.setFocus(true);
        		this.div_carInfo.ed_carNo.setSelect();
        		return false;
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //USER FUNCTION : 계약유형조회
        this.selectRtsd0108SaleCdCount = function(){
        	var carNo = nvl(this.div_carInfo.ed_carNo.value);
        	if( carNo != "" ){
        		var sSvcID        	= "selectRtsd0108SaleCdCount";                    
        		var sController   	= "rtms/sd/selectRtsd0108SaleCdCount.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";
        		var fn_callBack		= "fn_callBack";
        		sArgs += Ex.util.setParam("carNo",carNo);
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}else{
        		alert("차량번호가 없습니다.");
        		this.div_carInfo.ed_carNo.setFocus(true);
        	}
        }

        // 재개약 할인율 조회
        this.fn_regiAmtRt = function(){
        	var sSvcID        	= "regiAmtRt";                    
        	var sController   	= "/rtms/sd/regiAmtRt.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";
        	var fn_callBack		= "fn_callBack";
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //USER FUNCTION : 할인관리
        /* this.FN_searchRateAmt = function(){
        	var matCd 		= nvl(this.ds_price.getColumn(0,"matCd"));
        	var custNo 		= nvl(this.ds_rtsd0100.getColumn(0,"custNo"));
        	var cntCd 		= nvl(this.ds_price.getColumn(0,"cntCd"));
        	var periodCd 	= nvl(this.ds_price.getColumn(0,"periodCd"));
        	var rentAmt 	= nvl(this.ds_price.getColumn(0,"rentAmt"));
        	var ordDay 		= nvl(this.ds_rtsd0104.getColumn(0,"ordDay"));
        	
        	if( matCd == "" ){ 			alert("상품코드 값이 없습니다."); 	return false;
        	}else if( custNo == "" ){ 	alert("고객번호 값이 없습니다."); 	return false;
        	}else if( cntCd == "" ){ 	alert("타이어본수 값이 없습니다."); 	return false;
        	}else if( periodCd == "" ){ alert("렌탈기간 값이 없습니다."); 	return false;
        	}else if( rentAmt == "" ){ 	alert("월렌탈료 값이 없습니다."); 	return false;
        	}else if( ordDay == "" ){ 	alert("가격적용일 값이 없습니다."); 	return false;
        	}else{
        		var sSvcID        	= "listRateAmt";                    
        		var sController   	= "rtms/sd/listRateAmt.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_rateAmt=mapRateAmt";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		this.ds_rateAmt.clearData();
        		sArgs += Ex.util.setParam("matCd"	,matCd);
        		sArgs += Ex.util.setParam("custNo"	,custNo);
        		sArgs += Ex.util.setParam("cntCd"	,cntCd);
        		sArgs += Ex.util.setParam("periodCd",periodCd);
        		sArgs += Ex.util.setParam("rentAmt"	,parseInt(rentAmt));
        		sArgs += Ex.util.setParam("ordDay"	,ordDay);
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        } */
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //USER FUNCTION : 계약별캠페인적용
        /* this.FN_applyRtsd0014 = function(){
        	var matCd 		= nvl(this.ds_price.getColumn(0,"matCd"));
        	var custNo 		= nvl(this.ds_rtsd0100.getColumn(0,"custNo"));
        	var cntCd 		= nvl(this.ds_price.getColumn(0,"cntCd"));
        	var periodCd 	= nvl(this.ds_price.getColumn(0,"periodCd"));
        	//var rentAmt 	= nvl(this.ds_price.getColumn(0,"rentAmt"));
        	var ordDay 		= nvl(this.ds_rtsd0104.getColumn(0,"ordDay"));
        	
        	if( matCd == "" ){ 			alert("상품코드 값이 없습니다.");	return false;
        	}else if( custNo == "" ){ 	alert("고객번호 값이 없습니다."); 	return false;
        	}else if( cntCd == "" ){ 	alert("타이어본수 값이 없습니다."); 	return false;
        	}else if( periodCd == "" ){ alert("렌탈기간 값이 없습니다."); 	return false;
        	}else if( ordDay == "" ){ 	alert("가격적용일 값이 없습니다."); 	return false;
        	}else{
        		var sSvcID        	= "applyRtsd0014";                    
        		var sController   	= "rtms/sd/applyRtsd0014.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_rtsd0014=mapRtsd0014";//계약별캠페인적용
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		this.ds_rtsd0014.clearData();
        		sArgs += Ex.util.setParam("matCd"	,matCd);
        		sArgs += Ex.util.setParam("custNo"	,custNo);
        		sArgs += Ex.util.setParam("cntCd"	,cntCd);
        		sArgs += Ex.util.setParam("periodCd",periodCd);
        		//sArgs += Ex.util.setParam("rentAmt"	,parseInt(rentAmt));
        		sArgs += Ex.util.setParam("ordDay"	,ordDay);
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        } */
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //USER FUNCTION : 프리미엄정보
        /* this.FN_searchPreminum = function(){
        	var cntCd 		= nvl(this.ds_price.getColumn(this.ds_price.rowposition, "cntCd"));
        	var seasonCd 	= nvl(this.ds_price.getColumn(this.ds_price.rowposition, "seasonCd"));
        	var periodCd 	= nvl(this.ds_price.getColumn(this.ds_price.rowposition, "periodCd"));
        	var ordDay  	= nvl(this.ds_rtsd0104.getColumn(this.ds_rtsd0104.rowposition, "ordDay"));
        	
        	if( cntCd == "" ){ 			alert("프리미엄정보 : 타이어 값이 없습니다."); 		return false;
        	}else if( seasonCd == "" ){ alert("프리미엄정보 : 계절용 값이 없습니다."); 		return false;
        	}else if( ordDay == "" ){ 	alert("프리미엄정보 : 적용일자 값이 없습니다."); 	return false;
        	}else{
        		var sSvcID        	= "preminumList";                    
        		var sController   	= "rtms/comm/preminumList.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_rtsd0013=preminumMap";
        		var sArgs 			= "";
        		var fn_callBack		= "fn_callBack";
        		sArgs += Ex.util.setParam("applyDate", 	ordDay);
        		sArgs += Ex.util.setParam("cnt", 		cntCd);
        		sArgs += Ex.util.setParam("season", 	seasonCd);
        		sArgs += Ex.util.setParam("periodCd", 	periodCd);
        		this.ds_rtsd0013.clearData();
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        } */
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        /*★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ */
        //상품-가격정보 END
        /*★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ */
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

        

        

        

        

        
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        /*★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ */
        //장착점정보 START
        /*★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ */
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_installInfo_btn_searchAgency_onclick = function(obj,e){
        	/*
        	 * 대리점조회 팝업
        	 * - 온라인장착 가능여부 파라미터 추가
        	 */
        	var args ={p_arg : this.p_arg, p_opYn : "Y"};	
        	Ex.core.popup(this,"대리점조회","comm::RTCOMMAgencyOrd_pop.xfdl",args, "modaless=false");
        }
        this.FN_returnAgency = function(arr){
        	this.div_installInfo.ed_agencyCd.set_value(arr[0]);
        	this.div_installInfo.ed_agencyNm.set_value(arr[1]);
        	this.div_installInfo.ed_salesGroup.set_value(arr[2]);
        	this.div_installInfo.ed_salesOffice.set_value(arr[3]);
        	this.div_installInfo.ed_posCd.set_value(arr[4]);
        	this.div_installInfo.ed_city.set_value(arr[5]);
        	this.div_installInfo.ed_street.set_value(arr[6]);
        	this.div_installInfo.ed_telNo.set_value(arr[7]);
        	// 20181220 방문장착관련 시작
        	this.div_installInfo.ed_visitYn.set_value(arr[8]);
        	
        	//20191209 o2o연계
        	trace("o2oYn:" + arr[9]);
        	this.div_installInfo.ed_o2oYn.set_value(arr[9]);
        	
        	if (this.ds_rtsd0401.getRowCount() > 0) {
        		this.ds_rtsd0401.deleteAll();
        	}
        	
        	// 장착점이 방문장착점인 경우
        	if ("Y" == arr[8]) {
        		this.alert("방문장착점을 선택하셨습니다.\n방문 스케쥴 확인 후 장착일자 등록바랍니다.");
        		
        		var rowIdx = this.ds_rtsd0401.addRow();
        		
        		this.ds_rtsd0401.setColumn(rowIdx, "agencyCd" , arr[0]);
        		this.ds_rtsd0401.setColumn(rowIdx, "procTm"   , "0000");
        		this.ds_rtsd0401.setColumn(rowIdx, "mobNo"    , this.ds_rtsd0100.getColumn(0, "mobNo"));
        		this.ds_rtsd0401.setColumn(rowIdx, "bldMngNo" , this.ds_rtsd0100.getColumn(0, "bldMngNo"));
        		this.ds_rtsd0401.setColumn(rowIdx, "posCd"    , this.ds_rtsd0100.getColumn(0, "posCd"));
        		this.ds_rtsd0401.setColumn(rowIdx, "addr1"    , this.ds_rtsd0100.getColumn(0, "addr1"));
        		this.ds_rtsd0401.setColumn(rowIdx, "addr2"    , this.ds_rtsd0100.getColumn(0, "addr2"));
        		this.ds_rtsd0401.setColumn(rowIdx, "statCd"   , "01");
        		this.ds_rtsd0401.setColumn(rowIdx, "statDtlCd", "0101");
        		
        		this.div_installInfo.btn_visitSchd.set_visible(true);
        		this.div_installInfo.st_visitTel.set_visible(true);
        		this.div_installInfo.StaticVisit.set_visible(true);
        		this.div_installInfo.ed_visitTel.set_visible(true);
        	}
        	// 20181220 방문장착관련 끝

        	this.ds_time.clearData();
        	this.div_installInfo.cb_time.set_enable(false);
        	this.div_installInfo.ed_posCd00.set_value("");
        	this.div_installInfo.ed_addr00.set_value("");
        	this.div_installInfo.ed_detl_addr00.set_value("");
        			
        	// 장착점이 거점인 경우
        	// 장착유형 변경은 영업관리자(01), 콜센터(02), 방문판매(09) 권한만 가능
        	if(this.userGrp == "01" || this.userGrp == "02" || this.userGrp == "09"){
        		if("Y" == arr[9]){
        			this.div_installInfo.ed_posCd00.set_value(arr[4]);
        			this.div_installInfo.ed_addr00.set_value(arr[5]);
        			this.div_installInfo.ed_detl_addr00.set_value(arr[6]);
        			// 장착점이 거점인 경우 20200211
        			//this.div_installInfo.cal_procDay.set_enable(true);
        			this.div_installInfo.cal_procDay.setFocus(true);
        			//this.div_installInfo.rd_procType.set_enable(true);
        			
        			this.div_installInfo.rd_alignYn.set_enable(true);
        			
        			//장착시간 초기화
        			this.initTmsInfo();
        			
        			//20200317 kstka 거점 스케쥴 정보 조회
        			this.o2oAgencyTime(arr[0]);
        		}else{
        			this.div_installInfo.cb_time.set_enable(false);
        			
        			this.div_installInfo.rd_alignYn.set_value("N");
        			this.div_installInfo.rd_alignYn.set_enable(false);
        			//this.div_installInfo.rd_procType.set_enable(false);
        		}
        	}
        }

        // 20181220 방문장착관련 시작
        /**
         * 방문일정 버튼의 클릭 이벤트 처리
         * - 방문일정조회 팝업
         */
        this.div_installInfo_btn_visitSchd_onclick = function(obj,e) {
        	var args = {
        		  p_arg          : this.p_arg
        		, p_agencyCd     : this.div_installInfo.ed_agencyCd.value
        		, p_agencyNm     : this.div_installInfo.ed_agencyNm.value
        		, p_visitFromDay : this.addDay
        	};
        		
        	Ex.core.popup(this,"방문일정 조회","sd::RTSDVisitSchedule_pop.xfdl",args, "modaless=false");
        }
        // 20181220 방문장착관련 끝

        
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_installInfo_cal_procDay_onchanged = function(obj,e){
        	var regId = this.ds_rtsd0100.getColumn(0,"regId");
        	var custTp = this.ds_rtsd0100.getColumn(0,"custTp");
        	var procType = this.div_installInfo.rd_procType.value;
        	
        	// 240926 백인천 - 휴일 체크
        	this.FN_hDateCheck( nvl(this.div_installInfo.cal_procDay.value) );
        	
        	// [20161206_02]
        	if( (this.userGrp == "02") || (this.userGrp == "09") || (this.userGrp == "13") || (this.userGrp == "01" && this.onlineLoginId && custTp == "02" ) ){
        		
        		//TMS정보초기화
        		this.initTmsInfo();
        			
        		//240912 백인천 - 거점 스케쥴 정보 조회
        		this.o2oAgencyTime(this.div_installInfo.ed_agencyCd.value);
        		
        		
        		//방문장착, P&D - 재고 있으면 당일부터 재고 없으면 3일이후부터
        		if(procType == "1010" || procType == "1020"){
        // 			if(this.o2oAgencyStockTot > 0){
        // 				if( this.div_installInfo.cal_procDay.value < this.toDay ){
        // 					alert("오늘 이전 날짜는 등록하실 수 없습니다.");
        // 					this.div_installInfo.cal_procDay.set_value( this.toDay );
        // 					return false;
        // 				}
        // 			}else{
        // 				if( this.div_installInfo.cal_procDay.value < this.addDay ){
        // 					alert("장착일자는 계약일자로부터 3~15일후 등록하실 수 있습니다.");
        // 					this.div_installInfo.cal_procDay.set_value( this.addDay );
        // 					return false;
        // 				}
        // 			}
        		}else{ //전문점 장착은 거점재고를 체크할 수 없어 3일이후만 가능
        			if( this.div_installInfo.cal_procDay.value < this.addDay_2 ){
        				alert("장착일자는 계약일자로부터 2~14일후 등록하실 수 있습니다.");
        				this.div_installInfo.cal_procDay.set_value( this.addDay_2 );
        				return false;
        			}
        		}
        		
        		
        	}else{
        		if( this.div_installInfo.cal_procDay.value < this.toDay ){
        			alert("오늘 이전 날짜는 등록하실 수 없습니다.");
        			this.div_installInfo.cal_procDay.set_value( this.toDay );
        			return false;
        		}
        	}
        }

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        /*★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ */
        //장착점정보 END
        /*★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ */
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

        

        

        

        

        
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        /*★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ */
        //프리미엄서비스 START - 현재 버튼 비활성화
        /*★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ */
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        /*this.div_etcInfo_btn_preminum_onclick = function(obj:Button,  e:nexacro.ClickEventInfo){
        	var cntCd 	 = nvl(this.ds_price.getColumn(this.ds_price.rowposition, "cntCd"));
        	var seasonCd = nvl(this.ds_price.getColumn(this.ds_price.rowposition, "seasonCd"));
        	var periodCd = nvl(this.ds_price.getColumn(this.ds_price.rowposition, "periodCd"));
        	var ordDay   = nvl(this.ds_price.getColumn(this.ds_rtsd0104.rowposition, "ordDay"));	
        	
        	if (this.ds_price.getRowCount() > 0 ) {
        		if (cntCd == "" ) {
        			alert("타이어갯수 값이 없습니다.");
        			this.div_productInfo.setFocus(true);
        			return false;
        		} else if (seasonCd == "") {
        			alert("계절 값이 없습니다.");
        			this.div_productInfo.setFocus(true);
        			return false;
        		} else {
        			//args = {p_arg : this.p_arg, cntCd : cntCd, seasonCd : seasonCd, ordDay : ordDay};
        			//Ex.core.popup(this,"프리미엄서비스 조회","comm::RTCOMMPreminumService_pop.xfdl",args, "modaless=false");		
        			
        			//this.alert("ordDay = [" + ordDay + "]");
        			//this.alert("seasonCd = [" + seasonCd + "]");
        			//this.alert("cntCd = [" + cntCd + "]");
        			//this.alert("periodCd = [" + periodCd + "]");
        			
        			args = {dayTp : "TODAY", applyDate : "", ordId : "01", chanCd : "01", seasonCd : seasonCd, cntCd : cntCd, periodCd : periodCd};
        			Ex.core.popup(this,"프리미엄서비스 조회","comm::RTCOMMPreminumService2_pop.xfdl",args, "modaless=false");		
        		}
        	} else {
        		alert("상품을 먼저 추가하세요.");
        		this.grid_price.setFocus(true);
        	}
        	
        }

        this.returnPreminum = function(ds){
        	if (ds[0].rowcount > 0) {
        		this.ds_rtsd0013.clearData();
        		this.ds_rtsd0013.copyData(ds[0]);
        	}
        }
        */

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        /*★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ */
        //프리미엄서비스 END
        /*★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ */
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

        

        

        

        

        
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        /*★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ */
        //기타정보 START
        /*★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ */
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        /*★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ */
        //기타정보 END
        /*★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ */
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

        

        

        

        

        
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        /*★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ */
        //판매인정보 START
        /*★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ */
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_salesmanInfo_ed_salesmanTel_onkeyup = function(obj,e){
        	FN_numberHyphenIn(obj, e);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_salesmanInfo_cb_orgAgent_onitemchanged = function(obj,e){
        	var salesman = nvl(this.div_salesmanInfo.cb_orgAgent.value);
        	this.setSalesmanTel();
        	//if( salesman != "" ){
        	//	var sSvcID      	= "selectSalesmanTel";  
        	//	var sController   	= "rtms/sd/selectSalesmanTel.do";
        	//	var sInDatasets   	= "";
        	//	var sOutDatasets  	= "";
        	//	var sArgs 			= "";	
        	//	var fn_callBack		= "fn_callBack";
        	//	sArgs += Ex.util.setParam("ordAgent",salesman);
        	//	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	//}else{
        	//	this.div_salesmanInfo.ed_salesmanTel.set_value("");
        	//}
        	
        	this.ds_rtsd0113.clearData();
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.setSalesmanTel = function(){
        	var cd 	 = nvl(this.div_salesmanInfo.cb_orgAgent.value);
        	var cdNm = nvl(this.div_salesmanInfo.cb_orgAgent.text);
        	
        	this.SaleManCd		= nvl(this.div_salesmanInfo.cb_orgAgent.value);
        	this.saleManCdNm	= nvl(this.div_salesmanInfo.cb_orgAgent.text);

        	if(this.userGrp == '01') {
        		//판매상품조회 버튼 활성화
        		this.btn_SalePrdtSearch.set_enable(true);
        	} else {
        		if( cd != "" && cdNm != "" ){	
        			var nRow = this.ds_rtsd0113.findRowExpr("cd == '"+cd+"'&&cdNm == '"+cdNm+"'",-1);
        			var tel = nvl(this.ds_rtsd0113.getColumn(nRow, "tel"));
        			if( tel != "" ){
        				this.div_salesmanInfo.ed_salesmanTel.set_value( FN_numberHyphenInReturn(tel) );
        			}
        			
        			//판매상품조회 버튼 활성화
        			this.btn_SalePrdtSearch.set_enable(true);
        		}
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        /*★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ */
        //판매인정보 END
        /*★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ */
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

        

        

        

        

        
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        /*★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ */
        //공통 BUTTON START
        /*★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ */
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_add = function(obj,e){
        	if( confirm( "추가 클릭시 기존 입력내용은 사라집니다." ) ){
        		this.reload();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_save = function(obj,e){
        	var nRow0100 = this.ds_rtsd0100.rowposition;
        	
        	var nRow0104				= this.ds_rtsd0104.rowposition;
        	var contactRowType 			= this.ds_rtsd0104.getRowType(nRow0104);
        	
        	//var priceRow 				= this.ds_price.rowposition;
        	var modelRow 				= this.ds_model.rowposition;
        	
        	//var nRow0106 				= this.ds_rtsd0106.rowposition;
        	//var contractProductRowType 	= this.ds_rtsd0106.getRowType(nRow0106);
        	
        	var payDd 					= "";
        	var payMthd 				= nvl(this.ds_rtsd0104.getColumn(nRow0104, "payMthd"));
        	var accBankPayDay 			= nvl(this.div_payInfo.div_acc.cb_B_bankPayDay.value);
        	var cardBankPayDay 			= nvl(this.div_payInfo.div_card.cb_C_bankPayDay.value);
        	
        	var accountRow 				= this.ds_rtre0010.rowposition;
        	var accountType 			= this.ds_rtre0010.getRowType(accountRow);
        	var cardRow 				= this.ds_rtre0020.rowposition;
        	var cardType 				= this.ds_rtre0020.getRowType(cardRow);
        	var payCustTp 				= nvl(this.div_payInfo.cb_payCustTp.value);
        	
        	var msg						= " 값이 없습니다.";
        	
        	var chanCd = nvl(this.ds_rtsd0104.getColumn(nRow0104, "chanCd"));
        	var statCd = nvl(this.ds_rtsd0104.getColumn(nRow0104, "statCd"));
        	var regId  = nvl(this.ds_rtsd0104.getColumn(nRow0104, "regId"));
        	
        	var resultPayInfo = this.ch_resultPayInfo.value;
        	
        	//[20230210_1] kstka
        	//======================================================================================
        	var instCd  = nvl(this.ds_rtsd0104.getColumn(nRow0104, "instCd"));
        	if( nvl(instCd) == "1010" || nvl(instCd) == "1020" ) {
        		alert("방문장착/P&D주문은 수정 처리가 불가 합니다!");
        		return false;
        	}
        	//======================================================================================
        	
        	
        	if( chanCd == "02" || ( chanCd == "03" && this.onlineLoginId == regId ) ){
        		alert("온라인, 방판 정보는 수정 처리가 불가 합니다!");
        		return false;
        	}	
        	
        	if( statCd=="03" || statCd=="04" || statCd=="06" ){
        		alert("장착대기, 장착완료, 계약취소 정보는 수정  처리가 불가 합니다!");
        		return false;
        	}
        	
        	if( this.div_payInfo.ed_buslNoCheck.value == false){
        		alert("사업자번호를 확인하세요.");
        		return false;
        	}
        	
        	if( this.div_payInfo.ed_ebirDayCheck.value == false){
        		alert("법정생년월일을  확인하세요.");
        		return false;
        	}
        	
        	if( nvl(this.div_custInfo.div_custInfoDetail.ed_posCd.value) == "" || nvl(this.div_custInfo.div_custInfoDetail.ed_addr1.value) == ""){
        		alert("주소를 확인하세요.");
        		return false;
        	}
        	
        	var makerCd = nvl(this.ds_rtsd0104.getColumn(nRow0104, "makerCd"));
        	if( makerCd == "" ){
        		alert( "차종 값이" + msg);
        		return this.div_carInfo.cb_makerCd.setFocus(true);
        		return false;
        	}
        	
        	var modelCd = nvl(this.ds_rtsd0104.getColumn(nRow0104, "modelCd"));
        	if( modelCd == "" ){
        		alert( "차종 값이" + msg);
        		return this.div_carInfo.cb_model.setFocus(true);
        		return false;
        	}
        	
        	var contentsCd = nvl(this.ds_model.getColumn( modelRow, "contentsCd"));
        	if( contentsCd == "" ){
        		alert("차종 사양" + msg);
        		return false;
        	}
        	
        	var frCd = nvl(this.ds_model.getColumn( modelRow, "frCd"));
        	if( frCd == "" ){
        		alert("차종 전후" + msg);
        		return false;
        	}
        	
        	//20190410 kstka 전후 규격이 다른 차종의 경우 제품 선택후 전후구분 변경시 선택된 제품이 리프레쉬가 되지 않는 현상 발생
        	if(this.ds_productInfo.rowcount == 1){
        		if(frCd != this.ds_productInfo.getColumn(0, "frCd")){
        			alert("선택한 차종 전후구분이 제품의 전후구분과 다릅니다.\n제품을 다시 선택해 주세요");
        			return;
        		}
        	}
        	
        	var carNo = nvl(this.ds_rtsd0104.getColumn(nRow0104, "carNo"));
        	if( carNo == "" ){
        		alert("차량No" + msg);
        		return false;
        	}
        	
        	//[20230210_1] kstka
        	//===========================================================================================
        	if(this.mode == this.ADD) {
        	//===========================================================================================
        	
        		if( payMthd == "" ){ 
        			alert( "결제방법" + msg);
        			this.div_payInfo.cb_payMthd.setFocus(true);
        			return false;
        		}else{
        			
        			//C	카드이체	//A	CMS
        			if( this.accCardCheck == false ){
        				if( payMthd == "A"){
        					alert("계좌인증을 하지 않았습니다.");
        					return false;
        				}
        				if( payMthd == "C"){
        					alert("카드인증을 하지 않았습니다.");
        					return false;
        				}
        			}
        			
        			if( payMthd == "A" ){
        				
        				if( resultPayInfo == false ){
        					alert("계좌인증 실패 : 계좌인증을 다시 시도해주세요.");
        					return false;
        				}
        				
        				if( accBankPayDay == "" || accBankPayDay == "-1" ){
        					alert( "결제일" + msg);
        					this.div_payInfo.div_acc.cb_B_bankPayDay.setFocus(true);
        					return false;
        				}else{
        					payDd = accBankPayDay;
        					this.ds_rtsd0104.setColumn( nRow0104, "accStat", "0");														//계좌신청상태
        				}
        				
        				//[20230210_1] kstka
        				//===================================================================================================
        				this.ds_rtsd0104.setColumn( nRow0104, "crdSeq", "");
        				this.ds_rtsd0104.setColumn( nRow0104, "batchKey", "");
        				//===================================================================================================
        				
        				this.ds_rtsd0104.setColumn( nRow0104, "accChk", this.ch_resultPayInfo.value == true ? "Y" : "N");				//계좌확인상태
        				this.ds_rtsd0104.setColumn( nRow0104, "bkeyChk", "N");															//배치키생성여부(카드)
        				// 2016-06-8 이영근, ARS 출금동의 확인
        				if(this.ch_resultArsCall.value == "0")
        				{
        					this.alert("출금이체동의 버튼을 클릭해주세요.");
        					this.div_payInfo.div_acc.btn_arsCall.setFocus();
        					return false;
        				}
        			}else if( payMthd == "C" ){
        			
        				if( resultPayInfo == false ){
        					alert("카드인증 실패 : 카드인증을 다시 시도해주세요.");
        					return false;
        				}
        				
        				var batchKey = nvl(this.ds_rtre0020.getColumn(0, "batchKey"));
        				if( batchKey == "" ){
        					alert("BATCHKEY"+ msg);
        					return false;
        				}
        				
        				if( cardBankPayDay == "" || cardBankPayDay == "-1" ){
        					alert( "결제일" + msg);
        					this.div_payInfo.div_card.cb_C_bankPayDay.setFocus(true);
        					return false;
        				}else{
        					payDd = cardBankPayDay;
        					this.ds_rtsd0104.setColumn( nRow0104, "batchKey", batchKey );												//BATCHKEY
        					this.ds_rtsd0104.setColumn( nRow0104, "accStat", "5");														//계좌신청상태
        				}
        				
        				//[20230210_1] kstka
        				//===================================================================================================
        				this.ds_rtsd0104.setColumn( nRow0104, "accSeq", "");
        				//===================================================================================================
        				
        				this.ds_rtsd0104.setColumn( nRow0104, "accChk", "N");															//계좌확인상태
        				this.ds_rtsd0104.setColumn( nRow0104, "bkeyChk",this.ch_resultPayInfo.value == true ? "Y" : "N");				//배치키생성여부(카드)
        			}else{
        				alert("결제방법 코드 : ERROR");
        				return this.div_payInfo.cb_payMthd.setFocus(true);
        			}
        		}
        	} else {
        		payDd = nvl(this.ds_rtsd0104.getColumn(0,"payDd"));
        	}
        	
        	//var engNm = nvl(this.ds_rtsd0104.getColumn(nRow0104, "engNm"));
        	//if( engNm == "" ){
        	//	alert("장착기사" + msg);
        	//	this.div_installInfo.ed_engNm.setFocus(true);
        	//	return false;
        	//}
        	
        	var agencyCd = nvl(this.ds_rtsd0104.getColumn(nRow0104, "agencyCd"));
        	if( agencyCd == "" ){
        		alert("장착점명" + msg);
        		this.div_installInfo.btn_searchAgency.setFocus(true);
        		return false;
        	}
        	
        	//var cntPrice = this.ds_price.getRowCount();
        	//if( cntPrice <= 0){
        	//	alert("상품-가격 정보가 없습니다.");
        	//	this.div_productInfo.setFocus(true);
        	//	return false;
        	//}else{
        	//}
        	
        	if (nvl(this.ed_SaleCd.value) == "") {
        		alert("판매상품 정보가 없습니다.");
        		this.btn_SalePrdtSearch.setFocus(true);
        		return false;
        	}
        	
        	var cntPrdtInfo = this.ds_productInfo.getRowCount();
        	if( cntPrdtInfo <= 0 ) {
        		alert("제품정보 정보가 없습니다.");
        		this.btnAddPrdt.setFocus(true);
        		return false;
        	}
        	
        	//[20221101_1] RC재고가 없는 경우 대체코드 미입력시 주문 진행 불가 처리
        	var rcStockYn = this.chk_rcStockYn.value;
        	var replaceMatCd = this.ds_productInfo.getColumn(0, "matCdS");
        	
        	//[20230210_1] kstka
        	//=====================================================================
        // 	if(rcStockYn == "N" && nvl(replaceMatCd) == ""){
        // 		alert("재고가 없는 상품입니다. 대체코드를 입력해주세요.");
        // 		return false;
        // 	}
        	
        	if(this.mode == this.ADD && rcStockYn == "N" && nvl(replaceMatCd) == ""){
        		alert("재고가 없는 상품입니다. 대체코드를 입력해주세요.");
        		return false;
        	}
        	//=====================================================================
        	
        	//var cntRtsd0013 = this.ds_rtsd0013.getRowCount();
        	//if( cntRtsd0013 <= 0){
        	//	alert("프리미엄서비스 정보가 없습니다.");
        	//	this.div_preminum.btn_preminum.setFocus(true);
        	//	return false;
        	//}else{
        	//}
        	
        	/*
        	var cntPrimiumSvc = this.ds_seviceCd.getRowCount();
        	if( cntPrimiumSvc <= 0 ) {
        		alert("프리미엄서비스 정보가 없습니다.");
        		this.btnSvcAdd.setFocus(true);
        		return false;
        	} 
        	*/
        	
        	/*
        	var cntRtsd0014 = this.ds_rtsd0014.getRowCount();
        	if( cntRtsd0014 > 0){
        		alert("계약별 캠페인적용 정보가 없습니다.");
        		return false;
        	}else{
        	}
        	*/
        														
        	var ordAgent = nvl(this.ds_rtsd0104.getColumn(nRow0104, "ordAgent"));													//판매인번호
        	var regId    = nvl( this.ds_rtsd0100.getColumn(0,"regId")  );
        	var custTp   = nvl( this.ds_rtsd0100.getColumn(0,"custTp") );
        	// [20161206_02]
        	if( (this.userGrp == "02") || (this.userGrp == "09") || (this.userGrp == "13") || (this.userGrp == "01" && regId != this.onlineLoginId && custTp == "02") ){
        		if( ordAgent == "" ){
        			alert("판매원명 값이 없습니다.");
        			this.div_salesmanInfo.cb_orgAgent.setFocus(true);
        			return false;
        		}
        	}

        	this.ds_rtsd0104.setColumn( nRow0104, "contentsCd", 	contentsCd);													//사양
        	this.ds_rtsd0104.setColumn( nRow0104, "conMthd",		this.div_etcInfo.cb_conMthd.value);
        	
        	//20190508 주문저장시 전후구분을 범용, 앞, 뒤 모두 가능하게 변경
        	//this.ds_rtsd0104.setColumn( nRow0104, "frCd", 			"Z");  														//전후 구분
        	this.ds_rtsd0104.setColumn( nRow0104, "frCd", 			frCd);  														//전후 구분
        	//this.ds_rtsd0104.setColumn( nRow0104, "conMthd",		this.div_etcInfo.ch_conMthd.value ? "Y" : "N");					//계약서 교부방법
        	this.ds_rtsd0104.setColumn( nRow0104, "pcertYn",		this.div_etcInfo.ch_pcertYn.value ? "Y" : "N");					//신분증 첨부 필수여부
        	//this.ds_rtsd0104.setColumn( nRow0104, "periodCd",		nvl(this.ds_price.getColumn( priceRow, "periodCd")) );			//기간코드
        	this.ds_rtsd0104.setColumn( nRow0104, "periodCd",		this.p_periodCd.value);			//기간코드
        	//this.ds_rtsd0104.setColumn( nRow0104, "cntCd",			nvl(this.ds_price.getColumn( priceRow, "cntCd")) );			//타이어본수
        	
        	this.ds_rtsd0104.setColumn( nRow0104, "saleCd",			nvl(this.ds_productInfo.getColumn(0, "saleCd")) );				//판매코드

        	
        	this.ds_rtsd0104.setColumn( nRow0104, "payGb",			"1" );				//납부구분(1:렌탈)
        	
        	//합계납부정보 set
        	var cntSumCd = 0;
        	for(var i=0; i < this.ds_productInfo.rowcount; i++) {
        		if(nvl(this.ds_productInfo.getColumn(i, "cntCd"),0) == 0) {
        			cntSumCd = parseInt(cntSumCd) + 0;
        		} else {
        			cntSumCd = parseInt(cntSumCd) + parseInt(this.ds_productInfo.getColumn(i, "cntCd"));
        		}
        	}
        	
        	if(cntSumCd > 9) {
        		cntSumCd = cntSumCd;
        	} else {
        		cntSumCd = "0"+cntSumCd;
        	}
        	
        	this.ds_rtsd0104.setColumn( nRow0104, "cntCd",			nvl(cntSumCd) );				//타이어본수
        	this.ds_rtsd0104.setColumn( nRow0104, "regiCd",			"ZZZZ");			//등록비코드
        	this.ds_rtsd0104.setColumn( nRow0104, "custNo",			nvl(this.ds_rtsd0100.getColumn(nRow0100,"custNo")) );			//고객번호
        	this.ds_rtsd0104.setColumn( nRow0104, "custTp",			nvl(this.ds_rtsd0100.getColumn(nRow0100, "custTp")) );			//고객유형
        	this.ds_rtsd0104.setColumn( nRow0104, "safekey",		nvl(this.ds_rtsd0100.getColumn(nRow0100, "safekey")) );			//인증번호
        	this.ds_rtsd0104.setColumn( nRow0104, "campYn",			"N" );			//캠페인적용여부
        	this.ds_rtsd0104.setColumn( nRow0104, "cDcamt",			"0");			//캠페인할인금액
        	this.ds_rtsd0104.setColumn( nRow0104, "cDcrate",		"" );			//캠페인할인율
        	this.ds_rtsd0104.setColumn( nRow0104, "gDcrate",		"");			//결합할인율
        	this.ds_rtsd0104.setColumn( nRow0104, "gDcamt",			"0");			//결합할인액
        	this.ds_rtsd0104.setColumn( nRow0104, "lDcrate",		"10");			//제한할인율
        	this.ds_rtsd0104.setColumn( nRow0104, "lDcamt",			"0");			//제한할인액
        	this.ds_rtsd0104.setColumn( nRow0104, "fDcrate",		"" );			//최종할인율
        	this.ds_rtsd0104.setColumn( nRow0104, "fDcamt",			"0");			//최종할인액
        	this.ds_rtsd0104.setColumn( nRow0104, "payDd", 			payDd);															//이체일
        	//this.ds_rtsd0104.setColumn( nRow0104, "fcDay", "")																	//최초청구일자
        	//this.ds_rtsd0104.setColumn( nRow0104, "inputDt", "")																	//PAD입력일시
        	//this.ds_rtsd0104.setColumn( nRow0104, "filePath", "")																	//계약서 파일경로
        	//this.ds_rtsd0104.setColumn( nRow0104, "fileName", "")																	//계약서 파일명
        	this.ds_rtsd0104.setColumn( nRow0104, "psCd", "999999");							//프리미엄서비스코드
        	//this.ds_rtsd0104.setColumn( nRow0104, "psCd", nvl(this.ds_rtsd0104.getColumn(0, "psCd")));								//프리미엄서비스코드
        	this.ds_rtsd0104.setColumn( nRow0104, "seasonCd", nvl(this.ds_productInfo.getColumn(0, "seasonCd")));																//계절구분
        	
        	this.ds_rtsd0104.setColumn( nRow0104, "regiAmt", nvl(this.ds_sumPayInfo.getColumn(0, "regiAmt")));					//렌탈등록비

        	var c0104SumMonAmt = 0;
        	for(var i=0; i < this.ds_contactDeliInfo.rowcount; i++) {
        		if(nvl(this.ds_contactDeliInfo.getColumn(i,"rentAmt")) == "") {
        			c0104SumMonAmt = c0104SumMonAmt + 0;
        		} else {
        			c0104SumMonAmt = parseInt(c0104SumMonAmt) + parseInt(nvl(this.ds_contactDeliInfo.getColumn(i,"rentAmt")));
        		}
        	}
        	
        	var c0104DcAmt = 0;
        	for(var i=0; i < this.ds_contactDeliInfo.rowcount; i++) {
        		if(nvl(this.ds_contactDeliInfo.getColumn(i,"dcAmt")) == "") {
        			c0104DcAmt = c0104DcAmt + 0;
        		} else {
        			c0104DcAmt = parseInt(c0104DcAmt)  + parseInt(nvl(this.ds_contactDeliInfo.getColumn(i,"dcAmt")));
        		}
        	}
        	//10원단위 절삭 추가 (20190218)	
        	var monAmt_temp = this.mathFloor(eval(parseInt(nvl(this.ds_sumPayInfo.getColumn(0, "rentAmt"))) + parseInt(c0104DcAmt) ));
        	//[20210216_01] kstka 10원단위 절삭 -> 절상으로 변경
        	//rentAmt계산시 이미 10원 미만 절삭처리가 되어 절상처리를 해야 총 렌탈료는 문제 없음
        	//var monAmt_temp = this.mathRound(eval(parseInt(nvl(this.ds_sumPayInfo.getColumn(0, "rentAmt"))) + parseInt(c0104DcAmt) ));
        	
        	trace("rentAmt" + this.ds_sumPayInfo.getColumn(0, "rentAmt"));
        	trace("Math.round(parseInt(c0104DcAmt)/10) * 10 )" + Math.round(parseInt(c0104DcAmt)/10) * 10  );
        	trace("c0104DcAmt::" + c0104DcAmt);
        	trace("monAmt_temp::" + monAmt_temp);
        	
        	
        	//월 렌탈료 마이너스 불가  (20190218)
        	if(nvl(this.ds_sumPayInfo.getColumn(0, "rentAmt")) < 0){
        		alert("월 렌탈료는 0원이하의 금액은 주문하실 수 없습니다.");
        		return false;
        	}
        	
        	this.ds_rtsd0104.setColumn( nRow0104, "sumMonAmt", nvl(this.ds_sumPayInfo.getColumn(0, "rentAmt")));														//합계 월 렌탈료
        	this.ds_rtsd0104.setColumn( nRow0104, "monAmt",  monAmt_temp );					//월렌탈료
        	//this.ds_rtsd0104.setColumn( nRow0104, "statCd", nvl(this.ds_rtsd0104.getColumn(nRow0104, "statCd")));
        	
        /** --------2019/02/07 등록비 일시불 후불로 수정 
        // 	if(this.payStatCd  == '01' && statCd == ''){
        // 		this.ds_rtsd0104.setColumn( nRow0104, "statCd", this.payStatCd);																//"00" : 계약대기 
        // 	}else if(this.payStatCd  == '' && statCd == ''){
        // 		this.ds_rtsd0104.setColumn( nRow0104, "statCd", "00");																//"00" : 계약대기 
        // 	}else if(statCd == '00'){
        // 		this.ds_rtsd0104.setColumn( nRow0104, "statCd", "00");																//"01" : 계약대기
        // 	}else if(statCd == '01'){
        // 		this.ds_rtsd0104.setColumn( nRow0104, "statCd", "01");																//"01" : 계약접수
        // 	}
        **/
        	this.ds_rtsd0104.setColumn( nRow0104, "statCd", "01");																//"01" : 계약접수
        	
        	
        	//20200211 kstka 장착유형추가
        	//방문/전문점/pickup장착 주소
        	var posCd00 = this.div_installInfo.ed_posCd00.value;
        	var addr00 = this.div_installInfo.ed_addr00.value;
        	var detl_addr00 = this.div_installInfo.ed_detl_addr00.value;
        	
        	//delivery 주소
        	var posCd01 = this.div_installInfo.ed_posCd01.value;
        	var addr01 = this.div_installInfo.ed_addr01.value;
        	var detl_addr01 = this.div_installInfo.ed_detl_addr01.value;
        	
        	var instCd = this.div_installInfo.rd_procType.value;

        	trace("posCd00::" + posCd00);
        	trace("posCd01::" + posCd01);
        	
        	var o2oYn = this.div_installInfo.ed_o2oYn.value;
        	//영업관리자(01), 콜센터(02), 방문판매(09) 권한에서만 주문 입력
        	//[202210601_01] TEST
        	if(this.userGrp == "01" || this.userGrp == "02" || this.userGrp == "09"){
        	//if(this.userGrp == "01" || this.userGrp == "02" || this.userGrp == "09" || this.userGrp == "05"){
        		//거점인경우에만 저장
        		if(nvl(o2oYn) == "Y"){
        			this.ds_rtsd0104.setColumn( nRow0104, "instCd", instCd); //장착유형
        			this.ds_rtsd0104.setColumn( nRow0104, "inst1Poscd", posCd00); 						     //우편번호
        			this.ds_rtsd0104.setColumn( nRow0104, "inst1Addr1", addr00); 							 //주소
        			this.ds_rtsd0104.setColumn( nRow0104, "inst1Addr2", detl_addr00); 						 //상세주소
        			
        			this.ds_rtsd0104.setColumn( nRow0104, "inst2Poscd", posCd01); 							 //우편번호
        			this.ds_rtsd0104.setColumn( nRow0104, "inst2Addr1", addr01); 							 //주소
        			this.ds_rtsd0104.setColumn( nRow0104, "inst2Addr2", detl_addr01); 						 //상세주소
        		}
        	}
        	//20200211 장착유형 추가
        	
        	//[20210727_01] 직영도매 재고사용여부
        	var chainYn = this.div_stockUseChk.ch_chainYn.value;
        	//[20221101_01] 윈터타이어 재고사용여부
        	var winterYn = this.div_stockUseChk.ch_winterYn.value;
        	
        	this.ds_rtsd0104.setColumn( nRow0104, "outStockYn", "N");															//자사재고 사용여부
        	this.ds_rtsd0104.setColumn( nRow0104, "outStockType", "00");
        	
        	if(chainYn == "Y"){
        		this.ds_rtsd0104.setColumn( nRow0104, "outStockYn", "Y");															//자사재고 사용여부
        		this.ds_rtsd0104.setColumn( nRow0104, "outStockType", "01");															//자사재고 사용여부
        	}else if(winterYn == "Y"){
        		this.ds_rtsd0104.setColumn( nRow0104, "outStockYn", "Y");															//자사재고 사용여부
        		this.ds_rtsd0104.setColumn( nRow0104, "outStockType", "02");															//자사재고 사용여부
        	}
        	
        	if( contactRowType =="2" ){
        		this.ds_rtsd0104.setColumn( nRow0104, "ordId", "01");																//계약구분 : 렌탈
        		
        		//if( this.userGrp == "02" ){
        		//	this.ds_rtsd0104.setColumn( nRow0104, "chanCd", "04");															//채널구분 : 입점몰
        		//}else if( this.userGrp == "01" && regId != this.onlineLoginId && custTp == "02" ){
        		//	this.ds_rtsd0104.setColumn( nRow0104, "chanCd", "06");															//채널구분 : B2B
        		//}else{
        		//	this.ds_rtsd0104.setColumn( nRow0104, "chanCd", "01");															//채널구분 : 대리점
        		//}
        		
        		this.ds_rtsd0104.setColumn( nRow0104, "billYn", "N");																//세금계산서발행여부
        		//this.ds_rtsd0104.setColumn( nRow0104, "statCd", "01");																//상태 : RTCM0051-CD_GRP_CD='S032'
        		this.ds_rtsd0104.setColumn( nRow0104, "agDay", nvl(this.ds_rtsd0111.getColumn(0, "agDay")));							//개인정보제공동의일
        		this.ds_rtsd0104.setColumn( nRow0104, "agSeq", nvl(this.ds_rtsd0111.getColumn(0, "seq")));							//개인정보제공동의순번
        		this.ds_rtsd0104.setColumn( nRow0104, "cmsagYn","N");																//CMS출금이제동의
        		this.ds_rtsd0104.setColumn( nRow0104, "certStat","Y" );																//본인인증상태
        		//this.ds_rtsd0104.setColumn( nRow0104, "saleId",  "01");															//계약유형 : 일반
        		//this.ds_rtsd0104.setColumn( nRow0104, "grpYn", "N");																//고객결합여부
        		//this.ds_rtsd0104.setColumn( nRow0104, "grpNo", );																	//고객결합번호
        		//this.ds_rtsd0104.setColumn( nRow0104, "fDcrate", );																//최종할인율
        		//this.ds_rtsd0104.setColumn( nRow0104, "cDcrate", );																//캠페인할인율
        		//this.ds_rtsd0104.setColumn( nRow0104, "payMthd", payMthd );														//결제구분
        		//this.ds_rtsd0104.setColumn( nRow0104, "ordNo",);																	//계약번호
        		//this.ds_rtsd0104.setColumn( nRow0104, "ordDay");																	//접수일자
        		//this.ds_rtsd0104.setColumn( nRow0104, "bordNo", );																//이전주문번호
        		//this.ds_rtsd0104.setColumn( nRow0104, "procDay",  );																//장착일자
        		//this.ds_rtsd0104.setColumn( nRow0104, "cancDay", );																//취소일자
        		//this.ds_rtsd0104.setColumn( nRow0104, "agencyCd", );																//장착 대리점
        		//this.ds_rtsd0104.setColumn( nRow0104, "salesGroup", );															//지점
        		//this.ds_rtsd0104.setColumn( nRow0104, "salesOffice", );															//지사
        		//this.ds_rtsd0104.setColumn( nRow0104, "engNm", );																	//장착기사
        		//this.ds_rtsd0104.setColumn( nRow0104, "agDesc", );    															//특이사항(장착점")
        		//this.ds_rtsd0104.setColumn( nRow0104, "carNo");																	//차량번호
        		//this.ds_rtsd0104.setColumn( nRow0104, "carOwner",);																//차량소유자
        		//this.ds_rtsd0104.setColumn( nRow0104, "cMileage",);																//현재주행거리
        		//this.ds_rtsd0104.setColumn( nRow0104, "reqText",);																//비고(기타정보)
        		//this.ds_rtsd0104.setColumn( nRow0104, "accSeq",);																	//계좌순번
        		//this.ds_rtsd0104.setColumn( nRow0104, "crdSeq",);																	//카드순번
        		//this.ds_rtsd0104.setColumn( nRow0104, "crdtStat");																//신용조회상태
        		//this.ds_rtsd0104.setColumn( nRow0104, "certCd");																	//본인인증방법
        		//this.ds_rtsd0104.setColumn( nRow0104, "orgCd");																	//판매조직
        		//this.ds_rtsd0104.setColumn( nRow0104, "orgHq");																	//판매본부
        		//this.ds_rtsd0104.setColumn( nRow0104, "orgL1");																	//판매조직-1LV
        		//this.ds_rtsd0104.setColumn( nRow0104, "orgL2");																	//판매조직-2LV
        		//this.ds_rtsd0104.setColumn( nRow0104, "orgL3");																	//판매조직-3LV
        		//this.ds_rtsd0104.setColumn( nRow0104, "orgL4");																	//판매조직-4LV
        		//this.ds_rtsd0104.setColumn( nRow0104, "insOrg");																	//입력조직
        		//this.ds_rtsd0104.setColumn( ds_rtsd0104, "tcgrpNo");																//통합청구번호
        		//this.ds_rtsd0104.setColumn( ds_rtsd0104, "vbeln");																//SO번호
        		//this.ds_rtsd0104.setColumn( ds_rtsd0104, "regId");																//등록자 ID
        		//this.ds_rtsd0104.setColumn( ds_rtsd0104, "regDt");																//등록일
        		//this.ds_rtsd0104.setColumn( ds_rtsd0104, "chgId");																//변경자 ID
        		//this.ds_rtsd0104.setColumn( ds_rtsd0104, "chgDt");																//변경일
        	}
        	
        	//this.ds_rtsd0106.setColumn( nRow0106, "planDay", 	nvl(this.ds_rtsd0104.getColumn(nRow0104, "procDay")) );		//	장착예정일
        	//this.ds_rtsd0106.setColumn( nRow0106, "periodCd", 	nvl(this.ds_price.getColumn( priceRow, "periodCd")) );		//	기간코드
        	//this.ds_rtsd0106.setColumn( nRow0106, "cntCd",	 	nvl(this.ds_price.getColumn( priceRow, "cntCd")) );			//	타이어본수
        	//this.ds_rtsd0106.setColumn( nRow0106, "regiCd",	 	nvl(this.ds_price.getColumn( priceRow, "regiCd")) );		//	등록비코드
        	//this.ds_rtsd0106.setColumn( nRow0106, "frCd", 		nvl(this.ds_price.getColumn( priceRow, "frCd")) );			//	장착위치
        	//this.ds_rtsd0106.setColumn( nRow0106, "matCd", 		nvl(this.ds_price.getColumn( priceRow, "matCd")) );			//	상품코드
        	//this.ds_rtsd0106.setColumn( nRow0106, "ordQty", 	nvl(this.ds_price.getColumn( priceRow, "ordQty")) );		//	수량
        	//this.ds_rtsd0106.setColumn( nRow0106, "regiAmt", 	nvl(this.ds_price.getColumn( priceRow, "regiAmt")) );		//	렌탈등록비
        	//this.ds_rtsd0106.setColumn( nRow0106, "rentAmt", 	nvl(this.ds_price.getColumn( priceRow, "rentAmt")) );		//	월렌탈료(조견표)
        	//this.ds_rtsd0106.setColumn( nRow0106, "fDcamt",		nvl(this.ds_price.getColumn( priceRow, "fDcamt")));			//	최종할인액
        	//this.ds_rtsd0106.setColumn( nRow0106, "monDcamt",	nvl(this.ds_price.getColumn( priceRow, "fDcamt")));			//	월렌탈료 할인액 : 최종할인액동일함
        	// this.ds_rtsd0106.setColumn( nRow0106, "monAmt",		nvl(this.ds_price.getColumn( priceRow, "monAmt")));			//	월렌탈료 : [20180212_01] 이전
        	//this.ds_rtsd0106.setColumn( nRow0106, "matDesc", 	nvl(this.ds_price.getColumn( priceRow, "matDesc")));		//	비고
        	
        	// 프리미엄서비스에 의한 추가 렌탈료 감안 [20180212_01]
        	//var monAmt   = nvl(this.ds_price.getColumn(priceRow, "monAmt"));		// 최초 월렌탈료 = 조견표상 렌탈료
        	//var servPAmt = nvl(this.ds_rtsd0013.getColumn(0, "servPAmt"));			// 프리미엄서비스에 의한 추가 렌탈료
        		
        	//if (servPAmt == "") servAmt = 0;
        	//if (monAmt   == "") monAmt  = 0;
        	
        	//this.ds_rtsd0106.setColumn( nRow0106, "rentpAmt", servPAmt)														//	추가렌탈료(프리미엄서비스) [20180212_01]
        	//this.ds_rtsd0106.setColumn( nRow0106, "monAmt"  , nexacro.toNumber(monAmt) + nexacro.toNumber(servPAmt));		//	최종 월렌탈료 : 기존 월렌탈료 + 추가렌탈료 [20180212_01]
        	

        	

        	//if( contractProductRowType == "2" ){
        		//this.ds_rtsd0106.setColumn( nRow0106, "ordId","01");														//	주문구분 01:렌탈 S029
        		//this.ds_rtsd0106.setColumn( nRow0106, "instYn", "N");														//	장착여부
        		//this.ds_rtsd0106.setColumn( nRow0106, "valYn", "N");														//	유효여부
        		//this.ds_rtsd0106.setColumn( nRow0106, "osId", "N");															//	소유권이전구분
        		//this.ds_rtsd0106.setColumn( nRow0106, "statCd", "01");														//	상태 : S032
        		//this.ds_rtsd0106.setColumn( nRow0106, "flYn", "N");															//	장착위-앞,왼쪽
        		//this.ds_rtsd0106.setColumn( nRow0106, "frYn", "N");															//	장착위치-앞,오른쪽
        		//this.ds_rtsd0106.setColumn( nRow0106, "rlYn", "N");															//	장착위치-뒤,왼쪽
        		//this.ds_rtsd0106.setColumn( nRow0106, "rrYn", "N");															//	장착위치-뒤,오른쪽
        		//this.ds_rtsd0106.setColumn( nRow0106, "ordNo",);															//	계약번호
        		//this.ds_rtsd0106.setColumn( nRow0106,"seq",);																//	순번
        		//this.ds_rtsd0106.setColumn( nRow0106, "lrCd", );															//	좌우
        		//this.ds_rtsd0106.setColumn( nRow0106, "rentpAmt",);														//	추가렌탈료(프리미엄서비스)
        		//this.ds_rtsd0106.setColumn( nRow0106, "fDcrate",);														//	최종할인율
        		//this.ds_rtsd0106.setColumn( nRow0106, "planTm",);															//	장착예정시간(HHMM)
        		//this.ds_rtsd0106.setColumn( nRow0106, "instDay",);														//	장착일
        		//this.ds_rtsd0106.setColumn( nRow0106, "instTm",);															//	장착시간(HHMM)
        		//this.ds_rtsd0106.setColumn( nRow0106, "equNo", );															//	설비번호
        		//this.ds_rtsd0106.setColumn( nRow0106, "osDay", );															//	소유권이전일자(예정)
        			
        		//this.ds_rtsd0106.setColumn( nRow0106, "regId", );															//	등록자 ID 
        		//this.ds_rtsd0106.setColumn( nRow0106, "regDt", );															//	등록일
        		//this.ds_rtsd0106.setColumn( nRow0106, "chgId", );															//	변경자 ID 
        		//this.ds_rtsd0106.setColumn( nRow0106, "chgDt", );															//	변경일
        	//}

        	if( (accountType == "2" || accountType == "4" ) && payMthd == "A" ){
        		this.ds_rtre0010.setColumn( accountRow, "custNo", nvl(this.ds_rtsd0100.getColumn(nRow0100,"custNo")));
        		this.ds_rtre0010.setColumn( accountRow, "custTp", payCustTp);
        		this.ds_rtre0010.setColumn( accountRow, "useYn", "Y");
        		this.ds_rtre0010.setColumn( accountRow, "accChk", this.ch_resultPayInfo.value == true ? "Y" : "N" );
        	}
        	
        	if( (cardType == "2" || cardType == "4") && payMthd == "C" ){
        		this.ds_rtre0020.setColumn( cardRow, "custNo", nvl(this.ds_rtsd0100.getColumn(nRow0100,"custNo")));
        		this.ds_rtre0020.setColumn( cardRow, "custTp", payCustTp);
        		this.ds_rtre0020.setColumn( cardRow, "useYn", "Y");
        		this.ds_rtre0020.setColumn( cardRow, "bkeyChk",  this.ch_resultPayInfo.value == true ? "Y" : "N" );	
        		this.ds_rtre0020.setColumn( cardRow, "batchKey", this.ds_rtre0020.getColumn(0, "batchKey"));
        		var expireY = nvl(this.div_payInfo.div_card.ed_C_expireY.value);
        		var expireM = nvl(this.div_payInfo.div_card.ed_C_expireM.value);
        		var expireYm = expireY+expireM;
        		this.ds_rtre0020.setColumn( cardRow, "expireYm", expireYm);
        	}
        	
        	if( this.ds_rtre0010.getRowCount() != 0 && payMthd == "A" ){
        		if( nvl(this.ds_rtre0010.getColumn( accountRow, "custTp")) == "" ){
        			alert("결제정보 : 구분" + msg);
        			return false;
        		}else if( nvl(this.ds_rtre0010.getColumn( accountRow, "custNm")) == "" ){
        			alert("결제정보 : 예금주" + msg);
        			return false;
        		}else if( nvl(this.ds_rtre0010.getColumn( accountRow, "custTp")) == "01" && nvl(this.ds_rtre0010.getColumn( accountRow, "ebirDay")) == "" ){
        			alert("결제정보 : 법정생년월일" + msg);
        			return false;
        		}else if( nvl(this.ds_rtre0010.getColumn( accountRow, "custTp")) == "02" && nvl(this.ds_rtre0010.getColumn( accountRow, "buslNo")) == "" ){
        			alert("결제정보 : 사업자번호" + msg);
        			return false;
        		}else if( nvl(this.ds_rtre0010.getColumn( accountRow, "bankCd")) == "" ){
        			alert("결제정보 : 은행" + msg);
        			return false;
        		}else if( nvl(this.ds_rtre0010.getColumn( accountRow, "acctNo")) == "" ){
        			alert("결제정보 : 계좌번호" + msg);
        			return false;
        		}else{
        			
        		}
        		
        	}else if( this.ds_rtre0020.getRowCount() != 0 && payMthd == "C"){
        		if( nvl(this.ds_rtre0020.getColumn( cardRow, "custTp")) == "" ){
        			alert("결제정보 : 구분" + msg);
        			return false;
        		}else if( nvl(this.ds_rtre0020.getColumn( cardRow, "custNm")) == "" ){
        			alert("결제정보 : 카드주" + msg);
        			return false;
        		}else if( nvl(this.ds_rtre0020.getColumn( cardRow, "custTp")) == "01" && nvl(this.ds_rtre0020.getColumn( cardRow, "ebirDay")) == "" ){
        			alert("결제정보 : 법정생년월일" + msg);
        			return false;
        		}else if( nvl(this.ds_rtre0020.getColumn( cardRow, "custTp")) == "02" && nvl(this.ds_rtre0020.getColumn( cardRow, "buslNo")) == "" ){
        			alert("결제정보 : 사업자번호" + msg);
        			return false;
        		}else if( nvl(this.ds_rtre0020.getColumn( cardRow, "cardcomCd")) == "" ){
        			alert("결제정보 : 카드사" + msg);
        			return false;
        		}else if( nvl(this.ds_rtre0020.getColumn( cardRow, "cardNo")) == "" ){
        			alert("결제정보 : 카드번호" + msg);
        			return false;
        		}else if( nvl(this.ds_rtre0020.getColumn( cardRow, "expireYm")) == "" ){
        			alert("결제정보 : 유효년월" + msg);
        			return false;
        		}else{
        			
        		}

        	}else{
        		return false;
        	}
        	
        	/* if( this.ds_rtsd0104.getRowType(0) == 1 || this.ds_rtsd0104.getRowType(0) == 2 || this.ds_rtsd0104.getRowType(0) == 4){
        		var cnt = this.ds_rtsd0013.getRowCount();
        		this.ds_rtsd0013.set_updatecontrol(false);
        		for( var i = 0 ; i < cnt ; i++){
        			this.ds_rtsd0013.setRowType(i, Dataset.ROWTYPE_INSERT);
        		}
        		this.ds_rtsd0013.set_updatecontrol(true);

        		this.ds_rtsd0014.set_updatecontrol(false);
        		for( var i = 0 ; i < cnt ; i++){
        			this.ds_rtsd0014.setRowType(i, Dataset.ROWTYPE_INSERT);
        		}
        		this.ds_rtsd0014.set_updatecontrol(true);
        	}else{
        	
        	} */

        
        	//[20230210_1] kstka
        	//=============================================================================================================	
        	if(this.mode == this.MODIFY) {
        	
        		var matNm = this.ds_productInfo.getColumn(0, "matNm");
        		var procDay = this.ds_rtsd0104.getColumn(0, "procDay");
        		var cntCd = this.ds_rtsd0104.getColumn(0, "cntCd");
        		var agencyNm = this.ds_rtsd0104.getColumn(0, "agencyNm");
        		
        		trace(this.orgMatNm + "::" + matNm);
        		trace(this.orgCntCd + "::" + cntCd);
        		trace(this.orgAgencyCd + "::" + agencyCd);
        		trace(this.orgProcDay + "::" + procDay);
        		
        		if( (this.orgMatNm != matNm) || (this.orgCntCd != cntCd) || (this.orgAgencyCd != agencyCd) || (this.orgProcDay != procDay) ) {
        			var alarmMsg = "패턴/사이즈/본수가 달라 주문 저장이 불가합니다.";
        				alarmMsg += "========================================================\r\n";
        			    alarmMsg += "제품:" + this.orgMatNm + "->" + matNm + "\r\n";
        			    alarmMsg += "본수:" + this.orgCntCd + "->" + cntCd + "\r\n";
        			    alarmMsg += "대리점:" + this.orgAgencyCd + "->" + agencyNm + "\r\n";
        			    alarmMsg += "장착일자:" + this.orgProcDay + "->" + procDay + "\r\n";
        			    alarmMsg += "========================================================\r\n";
        			    
        			this.alert(alarmMsg);
        			return false;
        		}
        	}
        	//=============================================================================================================
        	
        	
        	//[김선태]재렌탈 추가
        	if(this.reRental){
        		this.ds_rtsd0104.setColumn( nRow0104, "saleId",	   "04" );
        		this.ds_rtsd0104.setColumn( nRow0104, "bordNo", nvl(this.ds_reRental.getColumn(0,"ordNo")));
        		//this.ds_rtsd0104.setColumn( nRow0104, "regiCd",	   "ZZZZ" );
        		//this.ds_rtsd0106.setColumn( nRow0106, "regiCd",    "ZZZZ" );
        		//this.ds_rtsd0106.setColumn( nRow0106, "regiAmt", 	0 );
        	} else {
        		this.ds_rtsd0104.setColumn( nRow0104, "saleId",	   "01" );
        	}
        	var ordAgent = nvl(this.div_salesmanInfo.cb_orgAgent.value);
        	var agencyCd = nvl(this.div_installInfo.ed_agencyCd.value);
        	
        	//[20230210_1] kstka 
        	//================================================================================
        	//20191205 kstka 거점장착정보	
        	this.ds_rtsd0213.clearData();
        	var nRowOms = this.ds_rtsd0213.addRow();
        	//var nRowOms = this.ds_rtsd0213.rowposition;
        	//================================================================================
        	
        	this.ds_rtsd0213.setColumn(nRowOms, "ordDe", nvl(this.ds_rtsd0104.getColumn(0, "ordDay")));
        	this.ds_rtsd0213.setColumn(nRowOms, "saleTyCd", "1102");
        	this.ds_rtsd0213.setColumn(nRowOms, "rentIfReqSn", "1");
        	this.ds_rtsd0213.setColumn(nRowOms, "rentIfBfistSeCd", "01");
        	this.ds_rtsd0213.setColumn(nRowOms, "custNm", encodeURI(nvl(this.ds_rtsd0100.getColumn(0, "custNm"))));
        	this.ds_rtsd0213.setColumn(nRowOms, "carNo", encodeURI(nvl(this.ds_rtsd0104.getColumn(0, "carNo"))));
        	this.ds_rtsd0213.setColumn(nRowOms, "iplMobNo", nvl(this.div_installInfo.ed_visitTel.value));
        	this.ds_rtsd0213.setColumn(nRowOms, "iplTelNo", "");
        	
        	var _agencyCd = "";
        	var str = "";
        	for(var i=0; i<10-agencyCd.length; i++){
        		str += "0";
        	}
        	_agencyCd = str + agencyCd;
        	
        // 	if(nvl(this.div_installInfo.ed_posCd.value) == ""){
        // 		this.alert("대리점 정보에 우편번호가 존재하지 않습니다.");
        // 		return;
        // 	}

        	this.ds_rtsd0213.setColumn(nRowOms, "sendURL", "/rentalapi/sd/rentalOpertRegTMS.do");
        	this.ds_rtsd0213.setColumn(nRowOms, "istBpCd", _agencyCd);
        	this.ds_rtsd0213.setColumn(nRowOms, "itemCd", nvl(this.ds_productInfo.getColumn(this.ds_productInfo.rowposition, "matCd")));
        	this.ds_rtsd0213.setColumn(nRowOms, "ordQy", nvl(this.ds_rtsd0104.getColumn(0, "cntCd")));
        	this.ds_rtsd0213.setColumn(nRowOms, "dlvTyDtlCd", nvl(this.div_installInfo.rd_procType.value));
        	this.ds_rtsd0213.setColumn(nRowOms, "istReqDe", nvl(this.ds_rtsd0104.getColumn(0, "procDay")));
        	
        	//방문장착, 픽업, 전문점
        	var siNm00 = nvl(this.div_installInfo.ed_siNm00.value);
        	var sggNm00 = nvl(this.div_installInfo.ed_sggNm00.value);
        	var emdNm00 = nvl(this.div_installInfo.ed_emdNm00.value);
        	
        	//딜리버리
        	var siNm01 = nvl(this.div_installInfo.ed_siNm01.value);
        	var sggNm01 = nvl(this.div_installInfo.ed_sggNm01.value);
        	var emdNm01 = nvl(this.div_installInfo.ed_emdNm01.value);
        	
        	if(nvl(instCd) == "1010" || nvl(instCd) == "1030"){ //방문장착, 전문점장착
        		this.ds_rtsd0213.setColumn(nRowOms, "pickupZip", "");
        		this.ds_rtsd0213.setColumn(nRowOms, "pickupBassAddr", "");
        		this.ds_rtsd0213.setColumn(nRowOms, "pickupDtlAddr", "");
        		this.ds_rtsd0213.setColumn(nRowOms, "iplZip", nvl(encodeURI(posCd00)));
        		this.ds_rtsd0213.setColumn(nRowOms, "iplAddr", nvl(encodeURI(addr00)));
        		this.ds_rtsd0213.setColumn(nRowOms, "iplDtlAddr", nvl(encodeURI(detl_addr00)));
        		
        		this.ds_rtsd0213.setColumn(nRowOms, "city", nvl(encodeURI(siNm00)));
        		this.ds_rtsd0213.setColumn(nRowOms, "county", nvl(encodeURI(sggNm00)));
        		this.ds_rtsd0213.setColumn(nRowOms, "dong", nvl(encodeURI(emdNm00)));
        		
        	}else if(nvl(instCd) == "1020"){ //pickup&delivery
        		this.ds_rtsd0213.setColumn(nRowOms, "pickupZip", nvl(encodeURI(posCd00)));
        		this.ds_rtsd0213.setColumn(nRowOms, "pickupBassAddr", nvl(encodeURI(addr00)));
        		this.ds_rtsd0213.setColumn(nRowOms, "pickupDtlAddr", nvl(encodeURI(detl_addr00)));
        		this.ds_rtsd0213.setColumn(nRowOms, "iplZip", nvl(encodeURI(posCd01)));
        		this.ds_rtsd0213.setColumn(nRowOms, "iplAddr", nvl(encodeURI(addr01)));
        		this.ds_rtsd0213.setColumn(nRowOms, "iplDtlAddr", nvl(encodeURI(detl_addr01)));	
        		
        		this.ds_rtsd0213.setColumn(nRowOms, "city", nvl(encodeURI(siNm00 + "," + siNm01)));
        		this.ds_rtsd0213.setColumn(nRowOms, "county", nvl(encodeURI(sggNm00 + "," + sggNm01)));
        		this.ds_rtsd0213.setColumn(nRowOms, "dong", nvl(encodeURI(emdNm00 + "," + emdNm01)));

        	}

        	this.ds_rtsd0213.setColumn(nRowOms, "regUsrId", "rentalusr");
        	this.ds_rtsd0213.setColumn(nRowOms, "ordRsn", "R43");
        	
        	//20200310 kstka 추가 컬럼	
        	this.ds_rtsd0213.setColumn(nRowOms, "period", encodeURI(this.div_installInfo.rd_timeType.value));
        	this.ds_rtsd0213.setColumn(nRowOms, "basementPsbYn", encodeURI(this.div_installInfo.rd_baseType.value));
        	
        	//20201210 kstka 얼라인먼트 사용여부 추가
        	var alignYn = nvl(this.div_installInfo.rd_alignYn.value);
        	this.ds_rtsd0213.setColumn(nRowOms, "wheelAlignment", alignYn);
        	
        	//20200619 kstka 추가컬럼
        	this.ds_rtsd0213.setColumn(nRowOms, "tmplCd", "NXO2O000000000000020");
        	
        	this.ds_orderId.set_filterstr("cd==" + this.div_installInfo.cb_time.value);
        	//tmsOrderId
        	this.ds_rtsd0104.setColumn(0, "tmsOrderId", this.ds_orderId.getColumn(0, "cdNm"));

        	this.ds_rtsd0213.setColumn(nRowOms, "orderId", this.ds_orderId.getColumn(0, "cdNm"));
        	
        	//전문점 장착(거점)인 경우 resultData의 json구조를 임의 생성하여 전송처리
        	var timeToJson = "";
        	if(nvl(instCd) == "1010" || nvl(instCd) == "1020"){
        		this.ds_schedule.set_filterstr("cd==" + this.div_installInfo.cb_time.value);
        		timeToJson = this.ds_schedule.getColumn(0, "cdNm");
        	}else{
        		timeToJson = "{\"time\":\"" + this.div_installInfo.cb_time.value + "\"}";
        		
        		//[20210601_01] TEST
        // 		if(this.userGrp == "05"){
        // 			timeToJson = "{\"time\":\"0000\"}";
        // 		}
        		
        		//20200309 kstka item목록 생성
        // 		this.ds_tmsItem.clearData();
        // 		this.ds_tmsItem.addRow();
        // 		this.ds_tmsItem.setColumn(0, "itemCd", encodeURI(nvl(this.ds_productInfo.getColumn(this.ds_productInfo.rowposition, "matCd"))));
        // 		this.ds_tmsItem.setColumn(0, "reqQy", encodeURI(Number(nvl(this.ds_rtsd0104.getColumn(0, "cntCd")))));
        // 		
        // 		//20201221 kstka 얼라인먼트 서비스 선택시 item추가
        // 		if(alignYn == "Y"){
        // 			this.ds_tmsItem.addRow();
        // 			this.ds_tmsItem.setColumn(1, "itemCd", "700882");
        // 			this.ds_tmsItem.setColumn(1, "reqQy", "1");
        // 		}
        	}
        	
        	//20200309 kstka item목록 생성
        	this.ds_tmsItem.clearData();
        	this.ds_tmsItem.addRow();
        	this.ds_tmsItem.setColumn(0, "itemCd", encodeURI(nvl(this.ds_productInfo.getColumn(this.ds_productInfo.rowposition, "matCd"))));
        	this.ds_tmsItem.setColumn(0, "reqQy", encodeURI(Number(nvl(this.ds_rtsd0104.getColumn(0, "cntCd")))));
        	
        	//20201221 kstka 얼라인먼트 서비스 선택시 item추가
        	if(alignYn == "Y"){
        		this.ds_tmsItem.addRow();
        		this.ds_tmsItem.setColumn(1, "itemCd", "700882");
        		this.ds_tmsItem.setColumn(1, "reqQy", "1");
        	}
        	
        	this.ds_rtsd0213.setColumn(nRowOms, "resultData", encodeURI(timeToJson.toString()));
        	
        	//[20220203_01] kstka 추가컬럼
        	this.ds_rtsd0213.setColumn(nRowOms, "custNo", this.ds_rtsd0100.getColumn(0, "custNo"));
        	
        	this.ds_etcInfo.set_filterstr("cd=='channelType'");
        	this.ds_rtsd0213.setColumn(nRowOms, "channelType", this.ds_etcInfo.getColumn(0, "cdNm"));
        	
        	this.ds_etcInfo.set_filterstr("cd=='orderConfigType'");
        	this.ds_rtsd0213.setColumn(nRowOms, "orderConfigType", this.ds_etcInfo.getColumn(0, "cdNm"));
        		
        	if(nvl(instCd) == "1010" || nvl(instCd) == "1020"){
        		if(nvl(this.div_installInfo.cb_time.value) == ""){
        			this.alert("장착시간을 선택해주세요.");
        			return false;
        		}
        		
        		if(nvl(this.div_installInfo.ed_agencyCd.value) == ""){
        			this.alert("대리점코드가 입력되지 않았습니다.");
        			return false;
        		}
        		
        		if(nvl(this.div_installInfo.ed_salesGroup.value) == ""){
        			this.alert("sales group이 입력되지 않았습니다.");
        			return false;
        		}
        		
        		if(nvl(this.div_installInfo.ed_salesOffice.value) == ""){
        			this.alert("sales office가 입력되지 않았습니다.");
        			return false;
        		}
        		
        	}else if(nvl(instCd) == "1030"){
        		if((this.div_installInfo.ed_o2oYn.value) == "Y" && nvl(this.div_installInfo.cb_time.value) == ""){
        			//[20210601_01] TEST
        			//if(this.userGrp == "01" || this.userGrp == "02" || this.userGrp == "09"){
        			if(this.userGrp == "02" || this.userGrp == "09"){
        				this.alert("장착시간을 선택해주세요.");
        				return false;
        			}
        		}
        	
        	}
        	
        	//[김선태]방판(판매대행) 추가
        // 	if(ordAgent == "100001") {
        // 		this.ds_rtsd0104.setColumn( nRow0104, "saleId",  "05");															//계약유형 : 방판(판매대행)
        // 	}
        	
        	//[김선태]10월 등록비제외 프로모션-재렌탈제외
        	//alert(this.toDay);
        	/*var ordDay = this.ds_rtsd0104.getColumn(nRow0104, "ordDay");
        	if(ordDay >= '20181001' && ordDay <= '20190131') {
        		this.ds_rtsd0104.setColumn( nRow0104, "regiCd",	   "ZZZZ" );
        		this.ds_rtsd0106.setColumn( nRow0106, "regiCd",    "ZZZZ" );
        		this.ds_rtsd0106.setColumn( nRow0106, "regiAmt", 	0 );
        	}*/
        	var sSvcID      	= "sRtsd0104ChanCd";  
        	var sController   	= "/rtms/sd/sRtsd0104ChanCd.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	sArgs += Ex.util.setParam("inPath"	, "R");
        	sArgs += Ex.util.setParam("ordAgent", ordAgent);
        	sArgs += Ex.util.setParam("agencyCd", agencyCd);
        	trace(sArgs);
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.FN_goSave = function(){
        	if( confirm( "저장하시겠습니까?") ){
        	
        		if(!this.chk_prmmAdd_dsCntPrdPymInfo()){
        			alert("프리미엄서비스 금액을 확인하세요! ");
        			return false;
        		}

        		this.fn_addSmsMsg(); // 2016-07-28 이영근, 문자메시지 발송 기능 추가
        	   
        		// 제품정보 저장	
        		var ds_productInfo_cnt = this.ds_productInfo.getRowCount();
        		this.ds_productInfo.set_updatecontrol(false);
        		for( var i = 0 ; i < ds_productInfo_cnt ; i++){
        		/*
        			this.ds_productInfo.setColumn(i,"regiCd",nvl(this.ds_sumPayInfo.getColumn(0,"regiAmt")));
        			this.ds_productInfo.setColumn(i,"fDcamt",nvl(this.ds_sumPayInfo.getColumn(0,"sumSaleAmt")));
        			this.ds_productInfo.setColumn(i,"monDcamt",nvl(this.ds_sumPayInfo.getColumn(0,"sumSaleAmt")));
        			this.ds_productInfo.setColumn(i,"monAmt",nvl(this.ds_sumPayInfo.getColumn(0,"rentAmt")));
        		*/
        			this.ds_productInfo.setColumn(i,"planDay",nvl(this.div_installInfo.cal_procDay.value));
        			this.ds_productInfo.setRowType(i, Dataset.ROWTYPE_INSERT);
        		}
        		this.ds_productInfo.set_updatecontrol(true);
        			
        		//프리미엄서비스 SET
        		var cnt = this.ds_seviceCd.getRowCount();
        		if( cnt != 0 ){
        			for( var i = 0; i < this.ds_seviceCd.getRowCount(); i++){
        				this.ds_seviceCd.setColumn(i, "servCnt0", this.ds_seviceCd.getColumn(i, "servCnt"));
        				this.ds_seviceCd.setColumn(i, "servCntr", this.ds_seviceCd.getColumn(i, "servCnt"));
        				this.ds_seviceCd.setColumn(i, "psCd", "999999");
        			}
        		}

        		this.ds_seviceCd.set_updatecontrol(false);
        		for( var i = 0 ; i < cnt ; i++){
        			this.ds_seviceCd.setRowType(i, Dataset.ROWTYPE_INSERT);
        		}
        		this.ds_seviceCd.set_updatecontrol(true);		
        		
        		//부가제품정보 SET
        		var ds_ValuePrdtInfo_cnt = this.ds_ValuePrdtInfo.getRowCount();
        		this.ds_ValuePrdtInfo.set_updatecontrol(false);
        		for( var j = 0 ; j < ds_ValuePrdtInfo_cnt ; j++){
        			this.ds_ValuePrdtInfo.setRowType(j, Dataset.ROWTYPE_INSERT);
        		}
        		this.ds_ValuePrdtInfo.set_updatecontrol(true);		
        		
        		var sSvcID        	= "saveContractRegister";                    
        		var sController   	= "rtms/sd/saveContractRegister.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";
        		
        		//[20230210_1] kstka
        		//=====================================================================================================
        		if(this.mode == this.ADD) {
        			sInDatasets			+= " dsRtre0010=ds_rtre0010:A ";
        			sInDatasets			+= " dsRtre0020=ds_rtre0020:A ";
        			sInDatasets   		+= " dsRtsd0104=ds_rtsd0104:A ";
        			//sInDatasets			+= " dsRtsd0106=ds_rtsd0106:A ";
        			//sInDatasets			+= " dsRtsd0013=ds_rtsd0013:A ";
        			sInDatasets			+= " dsRtsd0014=ds_rtsd0014:A ";
        			sInDatasets			+= " dsRtsd0205=ds_rtsd0205:A ";
        			sInDatasets			+= " dsRtsd0106=ds_productInfo:A ";
        			sInDatasets			+= " dsRtsd0041=ds_ValuePrdtInfo:A ";
        			sInDatasets			+= " dsRtsd0013=ds_seviceCd:A ";
        			sInDatasets			+= " dsRtsd0401=ds_rtsd0401:A "; // 20181220 방문장착관련
        			sInDatasets			+= " dsRtsd0213=ds_rtsd0213:A "; // 20191205 거점정보 
        			sInDatasets         += " ds_tmsItem=ds_tmsItem:A "; // 20201222 스케쥴산정추가정보
        		} else {
        			sInDatasets			+= " dsRtre0010=ds_rtre0010 ";
        			sInDatasets			+= " dsRtre0020=ds_rtre0020 ";
        			sInDatasets   		+= " dsRtsd0104=ds_rtsd0104:U ";
        			sInDatasets			+= " dsRtsd0014=ds_rtsd0014:U ";
        			sInDatasets			+= " dsRtsd0205=ds_rtsd0205:U ";
        			sInDatasets			+= " dsRtsd0106=ds_productInfo:U ";
        			sInDatasets			+= " dsRtsd0041=ds_ValuePrdtInfo:U ";
        			sInDatasets			+= " dsRtsd0013=ds_seviceCd:U ";
        			sInDatasets			+= " dsRtsd0401=ds_rtsd0401:U "; // 20181220 방문장착관련
        			sInDatasets			+= " dsRtsd0213=ds_rtsd0213:U "; // 20191205 거점정보 
        			sInDatasets         += " ds_tmsItem=ds_tmsItem:U "; // 20201222 스케쥴산정추가정보
        		}
        		//=====================================================================================================
        		
        		var fn_callBack		= "fn_callBack";
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}else{
        		this.btn_GrpSave.set_enable(true);
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        /*★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ */
        //공통 BUTTON END
        /*★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ */
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

        this.div_cust_btn_certificationConfirm_onclick = function(obj,e){
        	var popGb = this.div_custInfo.div_custInfoDetail.ra_certification.value;
        	var doc = this.div_custInfo.div_custInfoDetail.nice_interface.document;

        	if(popGb == '01') {			//휴대폰인증인경우
        		doc.getElementById("di_fn_popup").click();
        	} else if(popGb == '02') {	//신분증
        		doc.getElementById("fn_popup").click();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.web_onusernotify = function(obj,e){
        	var obj 				= this.div_custInfo.div_custInfoDetail.nice_interface.document;
        	var sName 				= nvl(obj.getElementById("sName").value);
        	var sBirthDate 			= nvl(obj.getElementById("sBirthDate").value);
        	var sGender 			= nvl(obj.getElementById("sGender").value);
        	var sNationalInfo 		= nvl(obj.getElementById("sNationalInfo").value);
        	var sNational 			= "";
        	var custNm 				= nvl(this.div_custInfo.ed_custNm.value);
        	var birthDay 			= nvl(this.div_custInfo.ed_birthDay.value);
        	var genderCd 			= nvl(this.div_custInfo.cb_genderCd.value);
        	var lfCd 	 			= nvl(this.div_custInfo.cb_lfCd.value);
        	
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
        	this.ds_rtsd0110.setColumn(nRowRtsd0110, 	"safekey",	nvl(this.ds_rtsd0100.getColumn(0,"safekey")) );
        	this.ds_rtsd0110.setColumn(nRowRtsd0110, 	"certCd",	nvl(this.div_custInfo.div_custInfoDetail.ra_certification.value) );
        	this.ds_rtsd0110.setColumn(nRowRtsd0110, 	"certYn",	"Y");
        	this.ds_rtsd0110.setColumn(nRowRtsd0110, 	"mobNo",	nvl(this.ds_rtsd0100.getColumn(0,"mobNo")) );
        	this.ds_rtsd0110.setColumn(nRowRtsd0110, 	"mobFirm",	nvl(this.ds_rtsd0100.getColumn(0,"mobFirm")) );
        	this.ds_rtsd0110.setColumn(nRowRtsd0110, 	"custNo",	nvl(this.ds_rtsd0100.getColumn(0,"custNo")) );

        	var sSvcID        	= "insertRtsd0110";                    
        	var sController   	= "rtms/sd/insertRtsd0110.do";
        	var sInDatasets   	= "input2=ds_rtsd0110:U";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";
        	var fn_callBack		= "fn_callBack";
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        // 2016-07-28 이영근, 문자메시지 발송 기능 추가
        // this.fn_addSmsMsg = function(){
        // 	this.ds_rtsd0205.clearData();
        // 	var nRowRtsd0205 = this.ds_rtsd0205.addRow();
        // 	var matNm = nvl(this.ds_price.getColumn( 0, "matNm"));
        // 	var ordQty = nvl(this.ds_price.getColumn( 0, "ordQty"));
        // 	var agencyNm = this.div_installInfo.ed_agencyNm.text;
        // 	var city = this.div_installInfo.ed_city.text;
        // 	var street = this.div_installInfo.ed_street.text;
        // 	var telNo = this.div_installInfo.ed_telNo.text;
        // 	
        // 	var smsMsg = "[NEXT LEVEL] " + matNm + " " + ordQty + "개 /" + agencyNm + "/" + city + " " + street + "/" + telNo;
        // 	this.ds_rtsd0205.setColumn(nRowRtsd0205, 	"chanCd",	nvl(this.ds_rtsd0104.getColumn(0, "chanCd")) );
        // 	this.ds_rtsd0205.setColumn(nRowRtsd0205, 	"custNm",	nvl(this.ds_rtsd0100.getColumn(0,"custNm")) );
        // 	this.ds_rtsd0205.setColumn(nRowRtsd0205, 	"mobNo",	nvl(this.ds_rtsd0100.getColumn(0,"mobNo")) );
        // 	this.ds_rtsd0205.setColumn(nRowRtsd0205, 	"smsMsg",	smsMsg);
        // }

        
        this.fn_addSmsMsg = function(){
        	this.ds_rtsd0205.clearData();
        	var nRowRtsd0205 = this.ds_rtsd0205.addRow();
        	
        	var custNm = nvl(this.ds_rtsd0100.getColumn(0, "custNm"));
        	//var matNm = nvl(this.ds_price.getColumn( 0, "matNm"));
        	//var ordQty = nvl(this.ds_price.getColumn( 0, "ordQty"));
        	var periodCd = nvl(this.ds_rtsd0104.getColumn(0, "periodCd"));
        	var procDay = nvl(this.ds_rtsd0104.getColumn(0, "procDay"));
        	var regiAmt = nvl(this.ds_rtsd0106.getColumn(0, "regiAmt"));
        	var rentAmt = nvl(this.ds_rtsd0106.getColumn(0, "rentAmt"));
        	var agencyNm = this.div_installInfo.ed_agencyNm.text;
        	var city = this.div_installInfo.ed_city.text;
        	var street = this.div_installInfo.ed_street.text;
        	var telNo = this.div_installInfo.ed_telNo.text;
        	
        	/*
        	var smsMsg = "[넥센타이어] " + custNm + " 고객님 타이어 렌탈 서비스를 이용해 주셔서 감사합니다.";
        	smsMsg += "(렌탈 계약정보) 계약자명: " + custNm + ", 계약 상품: " + matNm + ", 계약 수량: " + ordQty + "개, 계약기간: " + periodCd + "개월, 최초 등록비: " + regiAmt + "(1회), 월 렌탈료: " + rentAmt;
        	smsMsg += "(장착점 안내) 상호명: " + agencyNm + ", 주소: " + city + " " + street + " " + agencyNm + ", 전화번호: " + telNo + ", 장착 예정일:" + procDay ;
        	smsMsg += "※장착점 내방시 계약자 신분증, 장착 차량의 차량등록증을 반드시 지참해주세요.";
        	*/
        	
        	var smsMsg = "[넥센타이어] " + custNm + " 고객님 타이어 렌탈 서비스를 이용해 주셔서 감사합니다.";
        	smsMsg += "(렌탈 계약정보) 계약자명: " + custNm + ", 계약기간: " + periodCd + "개월, 최초 등록비: " + regiAmt + "(1회), 월 렌탈료: " + rentAmt;
        	smsMsg += "(장착점 안내) 상호명: " + agencyNm + ", 주소: " + city + " " + street + " " + agencyNm + ", 전화번호: " + telNo + ", 장착 예정일:" + procDay ;
        	smsMsg += "※장착점 내방시 계약자 신분증, 장착 차량의 차량등록증을 반드시 지참해주세요.";

        	this.ds_rtsd0205.setColumn(nRowRtsd0205, 	"chanCd",	nvl(this.ds_rtsd0104.getColumn(0, "chanCd")) );
        	this.ds_rtsd0205.setColumn(nRowRtsd0205, 	"custNm",	nvl(this.ds_rtsd0100.getColumn(0,"custNm")) );
        	this.ds_rtsd0205.setColumn(nRowRtsd0205, 	"mobNo",	nvl(this.ds_rtsd0100.getColumn(0,"mobNo")) );
        	this.ds_rtsd0205.setColumn(nRowRtsd0205, 	"smsMsg",	smsMsg);
        }

        /********************2018.10.25 이후 추가*******************************************/
        //패키지조회 팝업 호출
        this.btnGrpContSearch_onclick = function(obj,e)
        {
        	var p_argGrpNo = this.ed_grpPkgNum.value;
        	
        	var args ={ 'p_argGrpNo' : p_argGrpNo };
        	Ex.core.popup(this,"패키지계약조회","sd::RTSDGroupContractPopupF.xfdl",args, "modaless=false");	

        }

        
        //판매상품조회
        this.btn_SalePrdtSearch_onclick = function(obj,e)
        {
        	var sChanCd 	= "";
        	var saleCustTp 	= "";
        	var saleAge		= "";
        	
        	if(nvl(this.SaleManCd,"") != "") {
        		sChanCd = this.SaleManCd;
        	} else {
        		if(this.userGrp == '16') {
        			sChanCd = '';
        		} else {
        			sChanCd = this.userGrp;
        		}
        	}
        	
        	if(nvl(this.div_custInfo.cb_custTp.value) != "" && nvl(this.div_custInfo.cb_custTp.value) == '01') {
        		saleCustTp = 'P';
        	} else if(nvl(this.div_custInfo.cb_custTp.value) != "" && nvl(this.div_custInfo.cb_custTp.value) == '02') {
        		saleCustTp = 'B';
        	}
        	
        	var year = parseInt(new Date().getYear());
        	
        	var age  = nvl(this.div_custInfo.ed_birthDay.value);
        	var ck   = parseInt(age.substr(0,4));
        	saleAge  = (year-ck)+1;

        	
        		
        	var args = {p_formId:this.p_arg,p_prdtGrp:"01", p_custTp:saleCustTp, p_saleAge:saleAge, p_sChanCd:sChanCd}; 
        	Ex.core.popup(this,"판매상품조회","comm::RTCOMMSellProduct_pop.xfdl",args, "modaless=false");
        }

        this._setSaleReturn = function(arg) {
        	var saleCd = nvl(arg[0]);

        	this.p_periodCd.set_value("");
        	this.p_seasonCd.set_value("");
        	this.p_cntCd.set_value(0);
        	this.ed_SaleCd.set_value("");
        		
        	this.ds_productInfo.clearData();			//제품정보
        	this.ds_ValuePrdtInfo.clearData();			//부가제품정보
        	this.ds_seviceCd.clearData();				//프리미엄서비스
        	this.ds_contactDeliInfo.clearData();		//계약정보
        	this.ds_sumPayInfo.clearData();				//합계금액
        	this.ds_RegAmtMgnt.clearData();				//등록비조정
        	this.ds_FreeRegAmtMgnt.clearData();				//등록비조정
        	
        	this.btnAddPrdt.set_enable(true);	//-----------------2+2미허용 			
        	this.fn_SalePrdtSearch(saleCd); //판매상품조회
        }

        //판매상품조회
        this.fn_SalePrdtSearch = function(saleCd)
        {
        	if(nvl(saleCd,'') == '') {
        		var saleCd = nvl(this.ed_SaleCd.value);
        	}

        	var sSvcID        	= "saleItemList";                    
        	var sController   	= "/ntrms/sd/saleItemList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sOutDatasets		+= " ds_saleItemList=saleItemOutput";
        	sOutDatasets 		+= " ds_FreeRegAmtMgnt=saleRegAmtOutput";
        	
        	sArgs += Ex.util.setParam("saleCd", 		saleCd);
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }

        //제품추가 팝업 버튼
        this.btnAddPrdt_onclick = function(obj,e)
        {
        	var idx 		= this.ds_model.rowposition;
        	var modelCd 	= nvl(this.div_carInfo.ed_model.value);
        	var makerTxt	= nvl(this.div_carInfo.cb_makerCd.text );
        	var modelTxt 	= nvl(this.div_carInfo.cb_model.text );
        	var contentsCd 	= nvl(this.div_carInfo.ed_contentsCd.value); // 2018.12.20 추가수정
        	var saleCd 		= "";
        	var frCd 		= nvl(this.div_carInfo.ed_frCd.value);	// 20190110
        	var cntCd		= nvl(parseInt(this.p_cntCd.value));	// 20190110
        	
        	if(nvl(this.ed_SaleCd.value,"") == "") {
        		saleCd = nvl(this.ed_SaleCd.set_value(nvl(this.ds_saleItemList.getColumn(0,"saleCd"))),"");
        	} else {
        		saleCd = nvl(this.ed_SaleCd.value,"");
        	}
        	var periodCd 	= nvl(this.p_periodCd.value );
        	var seasonCd	= nvl(this.p_seasonCd.value );
        	trace("saleCd:"+saleCd);
        	if(saleCd == "") {
        		this.alert("판매상품을 선택하여 주십시오.");
        		return;
        	}
        	
        	var args ={"p_formId" : "RTSDContractRegister", 
        	           "p_modelCd" : modelCd, 
        	           "p_contentsCd" : contentsCd, 
        	           "p_makerTxt" : makerTxt, 
        	           "p_modelTxt" : modelTxt, 
        	           "p_periodCd" : periodCd, 
        	           "p_saleCd" : saleCd , 
        	           "p_frCd" : frCd,
        	           "p_cntCd" : cntCd,
        	           "p_seasonCd" : seasonCd};
        	           
        	Ex.core.popup(this,"제품추가","sd::RTSDAddProduct_pop.xfdl",args, "modaless=false");
        }

        this._setReturn = function(arr) {
        	
        	this.ds_productInfo.clearData;
        	var rowCnt = arr[0].rowcount;
        	var arrList = new Array();

        	
        	var regiSum	= 0;
        	var rentSum = 0;
        	
        	if(parseInt(this.getTotCntCd()) >= 6){
        		this.alert("등록 가능한 타이어 본수는 최대 6본 입니다.");
        		return;
        	}
        	
        	if(this.ds_productInfo.rowcount > 0) {
        		
        		for(var i=0; i < this.ds_productInfo.rowcount; i++) {
        			arrList[i] = nvl(this.ds_productInfo.getColumn(i, "prsPk"));
        		}
        		for(var i=0; i < rowCnt; i++) {
        			if(arrList.length > 0){
        				var chk = true;				
        								
        				var chkValid	= arr[0].getColumn(i, "prsPk");
        				
        				var prsPk		= arr[0].getColumn(i, "prsPk");
        				var saleGdsCd	= arr[0].getColumn(i, "saleGdsCd");
        				var standard	= arr[0].getColumn(i, "standard");
        				var amt			= arr[0].getColumn(i, "amt");
        				var matCd 		= arr[0].getColumn(i, "matCd");
        				var matNm		= arr[0].getColumn(i, "matNm");
        				var periodCd	= arr[0].getColumn(i, "periodCd");
        				var periodNm	= arr[0].getColumn(i, "periodNm");
        				var seasonCd	= arr[0].getColumn(i, "seasonCd");
        				var seasonNm	= arr[0].getColumn(i, "seasonNm");
        				var cntCd		= arr[0].getColumn(i, "cntCd");
        				var cntNm		= arr[0].getColumn(i, "cntNm");
        				var regiAmt		= arr[0].getColumn(i, "regiAmt");
        				var rentAmt		= arr[0].getColumn(i, "amt");
        				var groupSale	= arr[0].getColumn(i, "groupSale");
        				var chnlSale	= arr[0].getColumn(i, "chnlSale");
        				var frCd		= arr[0].getColumn(i, "frCd");
        				var frNm		= arr[0].getColumn(i, "frNm");
        				
        				for(var k=0; k<arrList.length; k++) {
        					if(arrList[k] == chkValid){
        						chk = false;
        						break;
        					}				
        				}
        				if(chk){
        					if(this.getFrCdChk(nvl(arr[0].getColumn(i, "frCd")))){
        						this.alert("동일 장착위치를 선택 할 수 없습니다.");
        						continue;
        					}
        	
        					var nRow = this.ds_productInfo.addRow();
        					this.ds_productInfo.setColumn(nRow,"prsPk", prsPk);
        					this.ds_productInfo.setColumn(nRow,"saleGdsCd", saleGdsCd);
        					this.ds_productInfo.setColumn(nRow,"standard", standard);
        					this.ds_productInfo.setColumn(nRow,"ordNo", nvl(this.resultOrdNo));
        					this.ds_productInfo.setColumn(nRow,"seq", i+1);
        					this.ds_productInfo.setColumn(nRow,"ordId","01");
        					this.ds_productInfo.setColumn(nRow,"periodCd",periodCd);
        					//최초 등록일 경우
        					if(nvl(this.p_periodCd.value,"") == "") {
        						this.p_periodCd.set_value(periodCd);
        					}
        					this.ds_productInfo.setColumn(nRow,"cntCd",cntCd);
        					//this.ds_productInfo.setColumn(nRow,"regiCd",nvl(this.ds_sumPayInfo.getColumn(0,"regiAmt")));
        					/*
        					if(nvl(this.ds_rtsd0104.getColumn(0,"frCd")) == '') {
        						this.ds_productInfo.setColumn(nRow,"frCd","Z");
        					} else {
        						this.ds_productInfo.setColumn(nRow,"frCd",nvl(this.ds_rtsd0104.getColumn(0,"frCd")));
        					}
        					*/
        					this.ds_productInfo.setColumn(nRow,"frCd",frCd); // 2018.12.20 추가수정
        					this.ds_productInfo.setColumn(nRow,"frNm",frNm); //	2018.12.20 추가수정
        					
        					this.ds_productInfo.setColumn(nRow,"lrCd","");
        					this.ds_productInfo.setColumn(nRow,"matCd",matCd);
        					this.ds_productInfo.setColumn(nRow,"matCdS",matCd); //[20210713_02] TEST 오프라인렌탈 consignment 대응
        					this.ds_productInfo.setColumn(nRow,"ordQty",cntCd.substring(1,2));
        					this.ds_productInfo.setColumn(nRow,"regiAmt",regiAmt);
        					this.ds_productInfo.setColumn(nRow,"rentAmt",rentAmt);
        					this.ds_productInfo.setColumn(nRow,"rentpAmt", "");
        					this.ds_productInfo.setColumn(nRow,"fDcrate","");
        					//this.ds_productInfo.setColumn(nRow,"fDcamt",nvl(this.ds_sumPayInfo.getColumn(0,"sumSaleAmt")));
        					//this.ds_productInfo.setColumn(nRow,"monDcamt",nvl(this.ds_sumPayInfo.getColumn(0,"sumSaleAmt")));
        					//this.ds_productInfo.setColumn(nRow,"monAmt",nvl(this.ds_sumPayInfo.getColumn(0,"rentAmt")));
        					this.ds_productInfo.setColumn(nRow,"planDay",nvl(this.ds_rtsd0104.getColumn(0, "procDay")));
        					this.ds_productInfo.setColumn(nRow,"planTm","");
        					this.ds_productInfo.setColumn(nRow,"instDay","");
        					this.ds_productInfo.setColumn(nRow,"instTm","");
        					this.ds_productInfo.setColumn(nRow,"instYn", "N");
        					this.ds_productInfo.setColumn(nRow,"valYn", "N");	
        					this.ds_productInfo.setColumn(nRow,"equNo", "N");
        					this.ds_productInfo.setColumn(nRow,"osId", "N");	
        					this.ds_productInfo.setColumn(nRow,"osDay","");
        					
        					/*
        					if(nvl(this.ds_rtsd0104.getColumn(0, "statCd")) == '') {
        						this.ds_productInfo.setColumn(nRow,"statCd", "01");
        					} else {
        						this.ds_productInfo.setColumn(nRow,"statCd", nvl(this.ds_rtsd0104.getColumn(0, "statCd")));
        					}
        					*/
        					this.ds_productInfo.setColumn(nRow,"statCd", "01");
        					
        					this.ds_productInfo.setColumn(nRow, "flYn", "N");															//	장착위-앞,왼쪽
        					this.ds_productInfo.setColumn(nRow, "frYn", "N");															//	장착위치-앞,오른쪽
        					this.ds_productInfo.setColumn(nRow, "rlYn", "N");															//	장착위치-뒤,왼쪽
        					this.ds_productInfo.setColumn(nRow, "rrYn", "N");	
        					this.ds_productInfo.setColumn(nRow, "matDesc", "N");	
        					
        					this.ds_productInfo.setColumn(nRow,"matNm",matNm);
        					this.ds_productInfo.setColumn(nRow,"periodNm",periodNm);
        					this.ds_productInfo.setColumn(nRow,"seasonCd",seasonCd);
        					if(nvl(this.p_seasonCd.value,"") == "") {
        						this.p_seasonCd.set_value(seasonCd);
        					}
        					this.ds_productInfo.setColumn(nRow,"seasonNm",seasonNm);
        					this.ds_productInfo.setColumn(nRow,"cntNm",cntNm);
        					this.ds_productInfo.setColumn(nRow,"chnlSale",chnlSale);
        					this.ds_productInfo.setColumn(nRow,"groupSale",groupSale);
        					this.ds_productInfo.setColumn(nRow,"saleCd", nvl(this.ds_rtsd0104.getColumn(0,"saleCd")));
        					this.ds_productInfo.setColumn(nRow,"gdsGb", "1");
        					this.ds_productInfo.setColumn(nRow,"gdsGrp", "1");
        					this.ds_productInfo.setColumn(nRow,"amt", amt);
        					
        					this.ds_productInfo.setColumn(nRow,"regiCd","ZZZZ");
        					
        					if(nvl(groupSale,"") != '') {
        						if(nvl(groupSale,0) == '') {
        							this.ds_productInfo.setColumn(nRow,"fDcamt",0);
        							this.ds_productInfo.setColumn(nRow,"monDcamt",0);
        						} else {
        							this.ds_productInfo.setColumn(nRow,"fDcamt",nvl(groupSale,0));
        							this.ds_productInfo.setColumn(nRow,"monDcamt",nvl(groupSale,0));
        						}
        					} else {
        						if(nvl(chnlSale,0) == '') {
        							this.ds_productInfo.setColumn(nRow,"fDcamt",0);
        							this.ds_productInfo.setColumn(nRow,"monDcamt",0);
        						} else {
        							this.ds_productInfo.setColumn(nRow,"fDcamt",nvl(chnlSale,0));
        							this.ds_productInfo.setColumn(nRow,"monDcamt",nvl(chnlSale,0));
        						}
        					}
        					
        					//this.ds_productInfo.setColumn(nRow,"monDcamt",nvl(this.ds_sumPayInfo.getColumn(0,"sumSaleAmt")));
        					this.ds_productInfo.setColumn(nRow,"monAmt",nvl(rentAmt));
        					
        					//계약상품 납품정보  SET
        					var cRow = this.ds_contactDeliInfo.addRow();
        					this.ds_contactDeliInfo.setColumn(cRow,"prsPk", prsPk);
        					this.ds_contactDeliInfo.setColumn(cRow,"matCd", matCd);
        					this.ds_contactDeliInfo.setColumn(cRow,"matNm", matNm);
        					this.ds_contactDeliInfo.setColumn(cRow,"periodCd",periodCd);
        					this.ds_contactDeliInfo.setColumn(cRow,"periodNm",periodNm);
        					this.ds_contactDeliInfo.setColumn(cRow,"rentAmt",rentAmt);
        					this.ds_contactDeliInfo.setColumn(cRow,"regiAmt",regiAmt);
        					this.ds_contactDeliInfo.setColumn(cRow,"dcAmt",nvl(chnlSale,0)+nvl(groupSale,0));
        					
        					this.p_cntCd.set_value(this.getTotCntCd()); // 선택한 타이어 본수 합			
        					
        					//등록비 관련 데이타 조회(2018.10.30)
        					//this.FN_saleRegiAmt();
        					trace("제품:");
        					this.contactRowChg();
        				}
        			}
        		}

        	} else {
        		for(var i=0; i < rowCnt; i++) {
        			var prsPk		= arr[0].getColumn(i, "prsPk");
        			var saleGdsCd	= arr[0].getColumn(i, "saleGdsCd");
        			var standard	= arr[0].getColumn(i, "standard");
        			var amt			= arr[0].getColumn(i, "amt");
        			var matCd 		= arr[0].getColumn(i, "matCd");
        			var matNm		= arr[0].getColumn(i, "matNm");
        			var periodCd	= arr[0].getColumn(i, "periodCd");
        			var periodNm	= arr[0].getColumn(i, "periodNm");
        			var seasonCd	= arr[0].getColumn(i, "seasonCd");
        			var seasonNm	= arr[0].getColumn(i, "seasonNm");
        			var cntCd		= arr[0].getColumn(i, "cntCd");
        			var cntNm		= arr[0].getColumn(i, "cntNm");
        			var regiAmt		= arr[0].getColumn(i, "regiAmt");
        			var rentAmt		= arr[0].getColumn(i, "amt");
        			var groupSale	= arr[0].getColumn(i, "groupSale");
        			var chnlSale	= arr[0].getColumn(i, "chnlSale");
        			var frCd		= arr[0].getColumn(i, "frCd");
        			var frNm		= arr[0].getColumn(i, "frNm");

        			var nRow = this.ds_productInfo.addRow();
        			
        			this.ds_productInfo.setColumn(nRow,"prsPk", prsPk);
        			this.ds_productInfo.setColumn(nRow,"saleGdsCd", saleGdsCd);
        			this.ds_productInfo.setColumn(nRow,"standard", standard);
        			this.ds_productInfo.setColumn(nRow,"ordNo", nvl(this.resultOrdNo));
        			this.ds_productInfo.setColumn(nRow,"seq", i+1);
        			this.ds_productInfo.setColumn(nRow,"ordId","01");
        			this.ds_productInfo.setColumn(nRow,"periodCd",periodCd);
        			this.ds_productInfo.setColumn(nRow,"cntCd",cntCd);
        			//this.ds_productInfo.setColumn(nRow,"regiCd",nvl(this.ds_sumPayInfo.getColumn(0,"regiAmt")));
        			
        			this.ds_productInfo.setColumn(nRow,"frCd",frCd); // 2018.12.20 추가수정
        			this.ds_productInfo.setColumn(nRow,"frNm",frNm); //	2018.12.20 추가수정
        			
        			this.ds_productInfo.setColumn(nRow,"lrCd","");
        			this.ds_productInfo.setColumn(nRow,"matCd",matCd);
        			this.ds_productInfo.setColumn(nRow,"matCdS",matCd); //[20210713_02] TEST 오프라인렌탈 consignment 대응
        			this.ds_productInfo.setColumn(nRow,"ordQty",cntCd.substring(1,2));
        			this.ds_productInfo.setColumn(nRow,"regiAmt",regiAmt);
        			this.ds_productInfo.setColumn(nRow,"rentAmt",rentAmt);
        			this.ds_productInfo.setColumn(nRow,"rentpAmt", "");
        			this.ds_productInfo.setColumn(nRow,"fDcrate","");
        			
        			//this.ds_productInfo.setColumn(nRow,"fDcamt",nvl(this.ds_sumPayInfo.getColumn(0,"sumSaleAmt")));
        			//this.ds_productInfo.setColumn(nRow,"monDcamt",nvl(this.ds_sumPayInfo.getColumn(0,"sumSaleAmt")));
        			//this.ds_productInfo.setColumn(nRow,"monAmt",nvl(this.ds_sumPayInfo.getColumn(0,"rentAmt")));
        			
        			this.ds_productInfo.setColumn(nRow,"planDay",nvl(this.ds_rtsd0104.getColumn(0, "procDay")));
        			this.ds_productInfo.setColumn(nRow,"planTm","");
        			this.ds_productInfo.setColumn(nRow,"instDay","");
        			this.ds_productInfo.setColumn(nRow,"instTm","");
        			this.ds_productInfo.setColumn(nRow,"instYn", "N");
        			this.ds_productInfo.setColumn(nRow,"valYn", "N");	
        			this.ds_productInfo.setColumn(nRow,"equNo", "N");
        			this.ds_productInfo.setColumn(nRow,"osId", "N");	
        			this.ds_productInfo.setColumn(nRow,"osDay","");
        			
        			/*
        			if(nvl(this.ds_rtsd0104.getColumn(0, "statCd")) == '') {
        				this.ds_productInfo.setColumn(nRow,"statCd", "01");
        			} else {
        				this.ds_productInfo.setColumn(nRow,"statCd", nvl(this.ds_rtsd0104.getColumn(0, "statCd")));
        			}
        			*/
        			this.ds_productInfo.setColumn(nRow,"statCd", "01");
        					
        			this.ds_productInfo.setColumn(nRow, "flYn", "N");															//	장착위-앞,왼쪽
        			this.ds_productInfo.setColumn(nRow, "frYn", "N");															//	장착위치-앞,오른쪽
        			this.ds_productInfo.setColumn(nRow, "rlYn", "N");															//	장착위치-뒤,왼쪽
        			this.ds_productInfo.setColumn(nRow, "rrYn", "N");	
        			this.ds_productInfo.setColumn(nRow, "matDesc", "N");	
        			
        			this.ds_productInfo.setColumn(nRow,"matNm",matNm);
        			this.ds_productInfo.setColumn(nRow,"periodNm",periodNm);
        			this.ds_productInfo.setColumn(nRow,"seasonCd",seasonCd);
        			this.ds_productInfo.setColumn(nRow,"seasonNm",seasonNm);
        			this.ds_productInfo.setColumn(nRow,"cntNm",cntNm);
        			this.ds_productInfo.setColumn(nRow,"chnlSale",chnlSale);
        			this.ds_productInfo.setColumn(nRow,"groupSale",groupSale);
        			this.ds_productInfo.setColumn(nRow,"saleCd", nvl(this.ds_rtsd0104.getColumn(0,"saleCd")));
        			this.ds_productInfo.setColumn(nRow,"gdsGb", "1");
        			this.ds_productInfo.setColumn(nRow,"gdsGrp", "1");
        			this.ds_productInfo.setColumn(nRow,"amt", amt);
        			
        			this.ds_productInfo.setColumn(nRow,"regiCd","ZZZZ");
        			if(nvl(groupSale,"") != '') {
        				if(nvl(groupSale,0) == '') {
        					this.ds_productInfo.setColumn(nRow,"fDcamt",0);
        					this.ds_productInfo.setColumn(nRow,"monDcamt",0);
        				} else {
        					this.ds_productInfo.setColumn(nRow,"fDcamt",nvl(groupSale,0));
        					this.ds_productInfo.setColumn(nRow,"monDcamt",nvl(groupSale,0));
        				}
        			} else {
        				if(nvl(chnlSale,0) == '') {
        					this.ds_productInfo.setColumn(nRow,"fDcamt",0);
        					this.ds_productInfo.setColumn(nRow,"monDcamt",0);
        				} else {
        					this.ds_productInfo.setColumn(nRow,"fDcamt",nvl(chnlSale,0));
        					this.ds_productInfo.setColumn(nRow,"monDcamt",nvl(chnlSale,0));
        				}
        			}
        			
        			//this.ds_productInfo.setColumn(nRow,"monDcamt",nvl(this.ds_sumPayInfo.getColumn(0,"sumSaleAmt")));
        			this.ds_productInfo.setColumn(nRow,"monAmt",nvl(rentAmt));
        			
        					
        			this.p_periodCd.set_value(periodCd);
        			this.p_seasonCd.set_value(seasonCd);
        			/*
        			this.ds_productInfo.setColumn(nRow,"reRentalSaleAmt",reRentalSaleAmt);
        			this.ds_productInfo.setColumn(nRow,"employeeSaleAmt",employeeSaleAmt);
        			*/
        			
        			//계약상품 납품정보  SET
        			var cRow = this.ds_contactDeliInfo.addRow();
        			this.ds_contactDeliInfo.setColumn(cRow,"prsPk", prsPk);
        			this.ds_contactDeliInfo.setColumn(cRow,"matCd", matCd);
        			this.ds_contactDeliInfo.setColumn(cRow,"matNm", matNm);
        			this.ds_contactDeliInfo.setColumn(cRow,"periodCd",periodCd);
        			this.ds_contactDeliInfo.setColumn(cRow,"periodNm",periodNm);
        			this.ds_contactDeliInfo.setColumn(cRow,"rentAmt",rentAmt);
        			this.ds_contactDeliInfo.setColumn(cRow,"regiAmt",regiAmt);
        			
        			this.ds_contactDeliInfo.setColumn(cRow,"dcAmt",nvl(chnlSale,0)+nvl(groupSale,0));
        			
        			//등록비 관련 데이타 조회(2018.10.30)
        			//this.FN_saleRegiAmt();
        			this.p_cntCd.set_value(this.getTotCntCd()); // 선택한 타이어 본수 합			
        			trace("제품:");
        			this.contactRowChg();
        		}
        		this.btnAddPrdt.set_enable(false);			//-------2+2미허용
        	}
        	
        	//[20210713_01] TEST 오프라인렌탈 consignment 주문 대응
        	//거점인 경우 대체코드 입력란 활성화
        	var o2oYn = this.div_installInfo.ed_o2oYn.value;
        	
        	if(this.userGrp == "05" && o2oYn == "Y"){
        		this.Grid00.setCellProperty("body", 2, "edittype", "normal");	
        	}else{
        		this.Grid00.setCellProperty("body", 2, "edittype", "none");
        	}	
        	
        	//[20221101_1] 겨울용타이어인경우 윈터타이어 매입재고 체크박스 활성화
        	var seasonCd = this.ds_productInfo.getColumn(0, "seasonCd");
        	this.div_stockUseChk.ch_winterYn.set_value(0);
        	if(nvl(seasonCd) == "02"){
        		this.div_stockUseChk.ch_winterYn.set_enable(true);
        	}else{
        		this.div_stockUseChk.ch_winterYn.set_enable(false);
        	}
        	
        	//부가제품등록, 삭제 버튼 활성화
        	this.btnValuePrdtAdd.set_enable(true);
        	this.btnValuePrdtDel.set_enable(true);
        		
        	//프리미엄 서비스 등록, 삭제 버튼 활성화
        	//this.btnSvcAdd.set_enable(true);
        	//this.btnSvcDel.set_enable(true);
        	this.p_cntCd.set_value(this.getTotCntCd()); // 선택한 타이어 본수 합	
        	this.fn_getPrmmSrvc();

        	if(o2oYn == "Y" && this.userGrp == "05"){
        		this.o2oAgencyStock(application.gds_userInfo.getColumn(0, "agentId"), this.ds_productInfo.getColumn(0, "matCd"));
        	}
        		
        	//계약서 발송 방법 default세팅 - 우편발송
        	this.div_etcInfo.cb_conMthd.set_index(1);

        }

        //제품정보 삭제
        this.btnAddPrdtDel_onclick = function(obj,e)
        {
        	var dsObj = this.ds_productInfo;	
            var dsPObj = this.ds_contactDeliInfo;	

        	var arry = [];
        	var parry = [];
        	
        	for (var i=0; i<dsObj.getRowCount(); i++) {
        		if(dsObj.getColumn(i, "chk") == 1){	
        			arry[i] = i;
        			parry[i] = dsObj.getColumn(i, "matCd")+dsObj.getColumn(i, "periodNm").replace(/[^0-9]/g, '')+dsObj.getColumn(i, "cntCd").replace(/[^0-9]/g, '');
        		}
        	}
        	dsObj.deleteMultiRows(arry);
        	
        	var arryTemp = new Array();
        	for (var j=0; j<dsPObj.getRowCount(); j++) {

        		if(dsPObj.getColumn(j, "prsPk") === undefined){
        			continue;		
        		}else{
        			for(var k=0; k<parry.length; k++) {
        				//console.log("select : " + parry[k] + " : " + dsPObj.getColumn(j, "prsPk"));	
        				if(parry[k] == dsPObj.getColumn(j, "prsPk")){
        					arryTemp[k] = j;	
        				}
        			}
        		}			
        	
        	}
        		
        	dsPObj.deleteMultiRows(arryTemp); // 계약상품 납부정보 삭제
        	//등록비 관련 데이타 조회(2018.10.30)
        	//this.FN_saleRegiAmt();
        	
        	// 신규추가일 렌탈기간을 전체 삭제시 다시 할 수 있도록 활성화 
        	var contactRowType = this.ds_rtsd0104.getRowType(this.ds_rtsd0104.rowposition);
        	
        	//-----------------2+2허용 script---------------- 
        	//if(dsObj.getRowCount() == 0 && (contactRowType =="2"){
        	//	this.p_periodCd.set_value('');
        	//	this.p_seasonCd.set_value('');	
        	//}
        	
        	//-----------------2+2미허용 ---------------- 
        	if(dsObj.getRowCount() == 0){
        		this.p_periodCd.set_value('');
        		this.p_seasonCd.set_value('');	
        		
        		this.btnAddPrdt.set_enable(true);			
        	}
        	this.p_cntCd.set_value(this.getTotCntCd());
        	this.fn_getPrmmSrvc();
        	this.contactRowChg();
        	
        	
        }

        //부가제품 추가 팝업
        this.btnValuePrdtAdd_onclick = function(obj,e)
        {
        	var saleCd = "";
        	
        	if(nvl(this.ed_SaleCd.value,"") == "") {
        		saleCd = this.ed_SaleCd.set_value(nvl(this.ds_saleItemList.getColumn(0,"saleCd")));
        	} else {
        		saleCd = this.ed_SaleCd.value;
        	}
        	
        	var args = {p_saleCd:saleCd}; 
        	Ex.core.popup(this,"부가제품추가","sd::RTSDValueProductAddPopup.xfdl",args, "modaless=false");
        }

        this._setReturnProductAdd = function(arr) {
        	
        	var rowCount 	= arr[0].rowcount;
        	var arrList 	= new Array();
        	
        	if( this.ds_ValuePrdtInfo.rowcount > 0) {
        		for(var i=0; i < this.ds_ValuePrdtInfo.rowcount; i++) {
        			arrList[i] = this.ds_ValuePrdtInfo.getColumn(i, "addGdsCd");
        		}
        		
        		for(var i=0; i < rowCount; i++) {
        			if(arrList.length > 0){
        				var chk = true;
        				var addGdsCd 	= arr[0].getColumn(i, "addGdsCd");
        				var addGdsNm 	= arr[0].getColumn(i, "addGdsNm");
        				var amt 		= arr[0].getColumn(i, "amt");
        				var makerNm 	= arr[0].getColumn(i, "makerNm");
        				var gdsDesc 	= arr[0].getColumn(i, "gdsDesc");
        				var gdsGrp 		= arr[0].getColumn(i, "gdsGrp");
        				var dcAmt 		= arr[0].getColumn(i, "dcAmt");
        				var actAmt 		= arr[0].getColumn(i, "actAmt");
        				var dcYn 		= arr[0].getColumn(i, "dcYn");
        				
        				for(var k=0; k<arrList.length; k++) {
        					if(arrList[k] == addGdsCd){
        						chk = false;
        						break;
        					}				
        				}
        				if(chk){
        					var nRow = this.ds_ValuePrdtInfo.addRow();
        					this.ds_ValuePrdtInfo.setColumn(nRow,"addGdsCd",addGdsCd);
        					this.ds_ValuePrdtInfo.setColumn(nRow,"addGdsNm",addGdsNm);
        					this.ds_ValuePrdtInfo.setColumn(nRow,"amt",amt);
        					this.ds_ValuePrdtInfo.setColumn(nRow,"dcAmt",dcAmt);
        					this.ds_ValuePrdtInfo.setColumn(nRow,"actAmt",actAmt);
        					this.ds_ValuePrdtInfo.setColumn(nRow,"dcYn",dcYn);

        					var sMonAmt = actAmt/this.ds_productInfo.getColumn(0,"periodCd");
        					var monAmt = Math.floor(sMonAmt/100)*100;
        					
        					//부가제품정보 할부여부 클릭 시 전역변수에 기존 값 저장.
        					this.addPrdtAmt = nvl(monAmt,0);
        						
        					if(dcYn == 'N') {
        						this.ds_ValuePrdtInfo.setColumn(nRow,"monAmt","0");
        					} else {
        						this.ds_ValuePrdtInfo.setColumn(nRow,"monAmt",this.addPrdtAmt);
        					}
        					this.ds_ValuePrdtInfo.setColumn(nRow,"makerNm",makerNm);
        					this.ds_ValuePrdtInfo.setColumn(nRow,"gdsGrp",gdsGrp);
        					this.ds_ValuePrdtInfo.setColumn(nRow,"gdsDesc",gdsDesc);

        					//계약상품 납품정보  SET
        					var cRow = this.ds_contactDeliInfo.addRow();
        					this.ds_contactDeliInfo.setColumn(cRow,"prsPk", "");
        					this.ds_contactDeliInfo.setColumn(cRow,"matCd", addGdsCd);
        					this.ds_contactDeliInfo.setColumn(cRow,"matNm", addGdsNm);
        					
        					if(this.ds_ValuePrdtInfo.getColumn(nRow, "dcYn") == 'Y') {
        						this.ds_contactDeliInfo.setColumn(cRow, "periodCd", this.ds_productInfo.getColumn(0, "periodCd"));
        						this.ds_contactDeliInfo.setColumn(cRow, "periodNm", this.ds_productInfo.getColumn(0, "periodNm"));
        						this.ds_contactDeliInfo.setColumn(cRow, "amt","0");
        						this.ds_contactDeliInfo.setColumn(cRow,"rentAmt", this.addPrdtAmt);
        					} else {
        						this.ds_contactDeliInfo.setColumn(cRow, "periodCd", "");
        						this.ds_contactDeliInfo.setColumn(cRow, "periodNm", "");
        						this.ds_contactDeliInfo.setColumn(cRow, "amt",actAmt);
        						this.ds_contactDeliInfo.setColumn(cRow,"rentAmt", "0");
        					}
        					
        					
        					//this.ds_contactDeliInfo.setColumn(cRow,"dcAmt",nvl(dcAmt,0));
        					this.ds_contactDeliInfo.setColumn(cRow,"dcAmt","0");

        					//등록비 관련 데이타 조회(2018.10.30)
        					//this.FN_saleRegiAmt();
        					this.contactRowChg();
        				
        				}
        			}
        		}

        	} else {
        		for(var i=0; i < rowCount; i++) {
        			var addGdsCd 	= arr[0].getColumn(i, "addGdsCd");
        			var addGdsNm 	= arr[0].getColumn(i, "addGdsNm");
        			var amt 		= arr[0].getColumn(i, "amt");
        			var makerNm 	= arr[0].getColumn(i, "makerNm");
        			var gdsDesc 	= arr[0].getColumn(i, "gdsDesc");
        			var gdsGrp 		= arr[0].getColumn(i, "gdsGrp");
        			var dcAmt 		= arr[0].getColumn(i, "dcAmt");
        			var actAmt 		= arr[0].getColumn(i, "actAmt");
        			var dcYn 		= arr[0].getColumn(i, "dcYn");
        			//var monAmt 		= arr[0].getColumn(i, "monAmt");

        			var nRow = this.ds_ValuePrdtInfo.addRow();
        			this.ds_ValuePrdtInfo.setColumn(nRow,"addGdsCd",addGdsCd);
        			this.ds_ValuePrdtInfo.setColumn(nRow,"addGdsNm",addGdsNm);
        			this.ds_ValuePrdtInfo.setColumn(nRow,"amt",amt);
        			this.ds_ValuePrdtInfo.setColumn(nRow,"dcAmt",dcAmt);
        			this.ds_ValuePrdtInfo.setColumn(nRow,"actAmt",actAmt);
        			this.ds_ValuePrdtInfo.setColumn(nRow,"dcYn",dcYn);

        			var sMonAmt = actAmt/this.ds_productInfo.getColumn(0,"periodCd");
        			var monAmt = Math.floor(sMonAmt/100)*100;
        			
        			//부가제품정보 할부여부 클릭 시 전역변수에 기존 값 저장.
        			this.addPrdtAmt = nvl(monAmt,0);
        			
        			if(dcYn == 'N') {
        				this.ds_ValuePrdtInfo.setColumn(nRow,"monAmt","0");
        			} else {
        				this.ds_ValuePrdtInfo.setColumn(nRow,"monAmt",this.addPrdtAmt);
        			}
        			this.ds_ValuePrdtInfo.setColumn(nRow,"makerNm",makerNm);
        			this.ds_ValuePrdtInfo.setColumn(nRow,"gdsGrp",gdsGrp);
        			this.ds_ValuePrdtInfo.setColumn(nRow,"gdsDesc",gdsDesc);

        			//계약상품 납품정보  SET
        			var cRow = this.ds_contactDeliInfo.addRow();
        			this.ds_contactDeliInfo.setColumn(cRow,"prsPk", "");
        			this.ds_contactDeliInfo.setColumn(cRow,"matCd", addGdsCd);
        			this.ds_contactDeliInfo.setColumn(cRow,"matNm", addGdsNm);
        			
        			if(this.ds_ValuePrdtInfo.getColumn(nRow, "dcYn") == 'Y') {
        				this.ds_contactDeliInfo.setColumn(cRow, "periodCd", this.ds_productInfo.getColumn(0, "periodCd"));
        				this.ds_contactDeliInfo.setColumn(cRow, "periodNm", this.ds_productInfo.getColumn(0, "periodNm"));
        				this.ds_contactDeliInfo.setColumn(cRow, "amt","0");
        				this.ds_contactDeliInfo.setColumn(cRow,"rentAmt", this.addPrdtAmt);
        			} else {
        				this.ds_contactDeliInfo.setColumn(cRow, "periodCd", "");
        				this.ds_contactDeliInfo.setColumn(cRow, "periodNm", "");
        				this.ds_contactDeliInfo.setColumn(cRow, "amt",actAmt);
        				this.ds_contactDeliInfo.setColumn(cRow,"rentAmt", "0");
        			}
        			
        			//this.ds_contactDeliInfo.setColumn(cRow,"dcAmt",nvl(dcAmt,0));
        			this.ds_contactDeliInfo.setColumn(cRow,"dcAmt","0");
        			
        			//등록비 관련 데이타 조회(2018.10.30)
        			//this.FN_saleRegiAmt();
        			this.contactRowChg();
        		
        		}
        		
        	}
        }

        //부가제품 삭제
        this.btnValuePrdtDel_onclick = function(obj,e)
        {
        	var dsObj = this.ds_ValuePrdtInfo;	
            var dsPObj = this.ds_contactDeliInfo;	
        	var arry = [];
        	var parry = [];
        	
        	for (var i=0; i<dsObj.getRowCount(); i++) {
        		if(dsObj.getColumn(i, "chk") == 1){	
        			arry[i] = i;
        			parry[i] = dsObj.getColumn(i, "addGdsCd");
        		}
        	}
        	dsObj.deleteMultiRows(arry);
        	
        	var arryTemp = new Array();
        	for (var j=0; j<dsPObj.getRowCount(); j++) {

        		if(dsPObj.getColumn(j, "matCd") === undefined){
        			continue;		
        		}else{
        			for(var k=0; k<parry.length; k++) {
        				//console.log("select : " + parry[k] + " : " + dsPObj.getColumn(j, "prsPk"));	
        				if(parry[k] == dsPObj.getColumn(j, "matCd")){
        					arryTemp[k] = j;	
        				}
        			}
        		}			
        	
        	}
        		
        	dsPObj.deleteMultiRows(arryTemp); // 계약상품 납부정보 삭제
        	//등록비 관련 데이타 조회(2018.10.30)
        	//this.FN_saleRegiAmt();
        	this.contactRowChg();
        	
        }

        
        this.saleMonAmtChg = function(obj,e)
        {
        	var sColId 		= e.columnid;
        	var nRow 		= e.row;
        	
        	if(sColId == "dcYn"){ //할인금액 입력 시
        		
        		if(obj.getColumn(nRow, "dcYn") == 'N') {
        			obj.setColumn(nRow, "monAmt", "0"); //월 렌탈료 0 초기화
        		} else {
        			obj.setColumn(nRow, "monAmt", this.addPrdtAmt); //월 렌탈료 값 셋팅
        		}
        	}
        }

        //프리미엄 서비스 등록 팝업
        /*
        this.btnSvcAdd_onclick = function(obj:Button,  e:nexacro.ClickEventInfo)
        {
        	var periodCd = nvl(this.p_periodCd.value );
        	var saleCd 	 = nvl(this.ds_rtsd0104.getColumn(0,"saleCd"));
        	
        	var args = {p_formId :"RTCOMMSeviceOrdNew_pop", p_periodCd : periodCd, p_saleCd : saleCd }; // popup에 parameter 전달
        	Ex.core.popup(this,"프리미엄서비스조회","comm::RTCOMMSeviceOrdNew_pop.xfdl",args, "modaless=false");
        	
        }

        this._setPopPrmmSrvcOrdList = function(arr) {
        	

        	var rowCnt 	= arr[0].rowcount;
        	var arrList	= new Array();
        	
        	if( this.ds_seviceCd.rowcount > 0) {
        		for(var i=0; i < this.ds_seviceCd.rowcount; i++) {
        			arrList[i] = this.ds_seviceCd.getColumn(i, "prsPk");
        		}
        		
        		for(var i=0; i < rowCnt; i++) {
        			if(arrList.length > 0){
        				var chk = true;
        				var prsPk 		= arr[0].getColumn(i, "prsPk");
        				var saleCd 		= arr[0].getColumn(i, "saleCd");
        				var prsDcd 		= arr[0].getColumn(i, "prsDcd");
        				var prsNm 		= arr[0].getColumn(i, "prsNm");
        				var periodCd 	= arr[0].getColumn(i, "periodCd");
        				var periodNm 	= arr[0].getColumn(i, "periodNm");
        				var cntCd 		= arr[0].getColumn(i, "cntCd");
        				var cntNm 		= arr[0].getColumn(i, "cntNm");
        				var servCnt 	= arr[0].getColumn(i, "servCnt");
        				var servAmt 	= arr[0].getColumn(i, "servAmt");
        				var psCd		= arr[0].getColumn(i, "psCd");
        				
        				for(var k=0; k<arrList.length; k++) {
        					if(arrList[k] == prsPk){
        						chk = false;
        						break;
        					}				
        				}
        				if(chk){
        					var nRow = this.ds_seviceCd.addRow();
        			
        					this.ds_seviceCd.setColumn(nRow,"prsPk", 	prsPk);
        					this.ds_seviceCd.setColumn(nRow,"prsDcd", 	prsDcd);
        					this.ds_seviceCd.setColumn(nRow,"prsNm", 	prsNm);
        					this.ds_seviceCd.setColumn(nRow,"periodCd", periodCd);
        					this.ds_seviceCd.setColumn(nRow,"periodNm", periodNm);
        					this.ds_seviceCd.setColumn(nRow,"cntCd", 	cntCd);
        					this.ds_seviceCd.setColumn(nRow,"cntNm", 	cntNm);
        					this.ds_seviceCd.setColumn(nRow,"servCnt", 	servCnt);
        					this.ds_seviceCd.setColumn(nRow,"servAmt", 	servAmt);
        					this.ds_seviceCd.setColumn(nRow,"psCd", 	psCd);
        					
        					
        					//계약상품 납품정보  SET
        					var cRow = this.ds_contactDeliInfo.addRow();
        					this.ds_contactDeliInfo.setColumn(cRow,"prsPk", prsPk);
        					this.ds_contactDeliInfo.setColumn(cRow,"matCd", prsDcd);
        					this.ds_contactDeliInfo.setColumn(cRow,"matNm", prsNm);
        					this.ds_contactDeliInfo.setColumn(cRow, "periodCd", periodCd);
        					this.ds_contactDeliInfo.setColumn(cRow, "periodNm", periodNm);
        					
        					this.ds_contactDeliInfo.setColumn(cRow,"rentAmt", servAmt);
        					this.ds_contactDeliInfo.setColumn(cRow,"dcAmt","0");
        					
        					
        				}
        			}
        		}
        		
        		
        	} else {
        		for(var i=0; i < rowCnt; i++) {
        			var prsPk 		= arr[0].getColumn(i, "prsPk");
        			var saleCd 		= arr[0].getColumn(i, "saleCd");
        			var prsDcd 		= arr[0].getColumn(i, "prsDcd");
        			var prsNm 		= arr[0].getColumn(i, "prsNm");
        			var periodCd 	= arr[0].getColumn(i, "periodCd");
        			var periodNm 	= arr[0].getColumn(i, "periodNm");
        			var cntCd 		= arr[0].getColumn(i, "cntCd");
        			var cntNm 		= arr[0].getColumn(i, "cntNm");
        			var servCnt 	= arr[0].getColumn(i, "servCnt");
        			var servAmt 	= arr[0].getColumn(i, "servAmt");
        			var psCd		= arr[0].getColumn(i, "psCd");
        			
        			var nRow = this.ds_seviceCd.addRow();
        			
        			this.ds_seviceCd.setColumn(nRow,"prsPk", 	prsPk);
        			this.ds_seviceCd.setColumn(nRow,"prsDcd", 	prsDcd);
        			this.ds_seviceCd.setColumn(nRow,"prsNm", 	prsNm);
        			this.ds_seviceCd.setColumn(nRow,"periodCd", periodCd);
        			this.ds_seviceCd.setColumn(nRow,"periodNm", periodNm);
        			this.ds_seviceCd.setColumn(nRow,"cntCd", 	cntCd);
        			this.ds_seviceCd.setColumn(nRow,"cntNm", 	cntNm);
        			this.ds_seviceCd.setColumn(nRow,"servCnt", 	servCnt);
        			this.ds_seviceCd.setColumn(nRow,"servAmt", 	servAmt);
        			this.ds_seviceCd.setColumn(nRow,"psCd", 	psCd);
        			
        			//계약상품 납품정보  SET
        			var cRow = this.ds_contactDeliInfo.addRow();
        			this.ds_contactDeliInfo.setColumn(cRow,"prsPk", prsPk);
        			this.ds_contactDeliInfo.setColumn(cRow,"matCd", prsDcd);
        			this.ds_contactDeliInfo.setColumn(cRow,"matNm", prsNm);
        			this.ds_contactDeliInfo.setColumn(cRow, "periodCd", periodCd);
        			this.ds_contactDeliInfo.setColumn(cRow, "periodNm", periodNm);
        			
        			this.ds_contactDeliInfo.setColumn(cRow,"rentAmt", servAmt);
        			this.ds_contactDeliInfo.setColumn(cRow,"dcAmt","0");
        			
        			//등록비 관련 데이타 조회(2018.10.30)
        			//this.FN_saleRegiAmt();
        			this.contactRowChg();
        		}
        		
        	}
        	

        }
        */
        /*
        //프리미엄 서비스 삭제
        this.btnSvcDel_onclick = function(obj:Button,  e:nexacro.ClickEventInfo)
        {
        	var dsObj = this.ds_seviceCd;
        	var dsPObj = this.ds_contactDeliInfo;		
        	//this.alert(dsObj.getRowCount());
        	var arry = new Array();
        	var parry = new Array();
        		
        	for (var i=0; i<dsObj.getRowCount(); i++) {
        		if(dsObj.getColumn(i, "check") == 1){	
        			arry[i] = i;
        			parry[i] = dsObj.getColumn(i, "prsPk");
        		}
        	}
        	
        	dsObj.deleteMultiRows(arry); // 프리미엄 서비스 삭제
        	
        	
        	var arryTemp = new Array();
        	for (var j=0; j<dsPObj.getRowCount(); j++) {

        		if(dsPObj.getColumn(j, "prsPk") === undefined){
        			continue;		
        		}else{
        			for(var k=0; k<parry.length; k++) {
        				if(parry[k] == dsPObj.getColumn(j, "prsPk")){
        					arryTemp[k] = j;	
        				}
        			}
        		}			
        	
        	}
        		
        	dsPObj.deleteMultiRows(arryTemp); // 계약상품 납부정보 삭제
        	//등록비 관련 데이타 조회(2018.10.30)
        	//this.FN_saleRegiAmt();	
        	this.contactRowChg();
        }
        */

        // 프리미엄 상품추가시 계약상품 납부정보에 추가
        this.set_prmmAdd_dsCntPrdPymInfo = function(){
        	var dsPObj = this.ds_contactDeliInfo;  	
        	var dsObj = this.ds_seviceCd;	// popup dataset	
        	var idx = true;
        	
        //console.log(this.ds_cntPrdPymInfo.saveXML());
        //console.log(this.ds_rtsd0013.saveXML());
        	// 부모창에 dataset 의 pk 값을 가져와 array 에 담는다.
        	
        	// 프리미엄 서비스를 전체 삭제한다. 'B' 로시작되는단어
        	var arrd = new Array();
        	for (var i=0; i<dsPObj.getRowCount(); i++){
        		if(nvl(dsPObj.getColumn(i, "prsPk")) != ""){
        			if(dsPObj.getColumn(i, "prsPk").indexOf("B") == 0){
        				arrd[i] = i;
        			}
        		}
        	}
        	dsPObj.deleteMultiRows(arrd); 
        	
        	// 프리미엄 서비스 추가			
        	for (var i=0; i<dsObj.getRowCount(); i++) {
        		var nRow = dsPObj.addRow();			
        		dsPObj.setColumn(nRow,"prsPk", dsObj.getColumn(i, "prsDcd"));
        		dsPObj.setColumn(nRow,"cntCd", dsObj.getColumn(i, "cntCd"));
        		dsPObj.setColumn(nRow,"matCd", dsObj.getColumn(i, "prsDcd"));
        		dsPObj.setColumn(nRow,"matNm", dsObj.getColumn(i, "prsNm"));
        		dsPObj.setColumn(nRow,"periodCd", dsObj.getColumn(i, "periodCd"));
        		dsPObj.setColumn(nRow,"periodNm", dsObj.getColumn(i, "periodNm"));
        		dsPObj.setColumn(nRow,"amt", "0");
        		dsPObj.setColumn(nRow,"rentAmt", dsObj.getColumn(i, "servAmtSum"));
        		dsPObj.setColumn(nRow,"regiAmt", "0");
        		dsPObj.setColumn(nRow,"dcAmt", dsObj.getColumn(i, "saleAmt"));
        	}	
        	
        	this.contactRowChg();
        }

        
        this.chk_prmmAdd_dsCntPrdPymInfo = function(){
        	var dsPObj = this.ds_contactDeliInfo;  	
        	var dsObj = this.ds_seviceCd;	// popup dataset	

        	var matCd = "";
        	var rentAmt = "";
        	var result = true;
        	for (var i=0; i<dsPObj.getRowCount(); i++) {
        		if(dsPObj.getColumn(i, "prsPk").indexOf("B") == 0){
        			matCd = dsPObj.getColumn(i, "matCd");
        			rentAmt = dsPObj.getColumn(i, "rentAmt");
        			for (var j=0; j<dsObj.getRowCount(); j++) {
        				if(matCd == dsObj.getColumn(j, "prsDcd")){
        					if(rentAmt != dsObj.getColumn(j, "servAmtSum")){	
        						result = false;
        					}
        				}
        			}
        		}
        	}
        	
        	return result;
        }

        
        this.FN_saleRegiAmt = function() {
        /*
        	var sSvcID        	= "saleRegiAmtInfo";                    
        	var sController   	= "/ntrms/sd/saleRegiAmtInfo.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_RegAmtMgnt=mapDsSaleRegiAmt";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("saleCd", 		nvl(this.ds_rtsd0104.getColumn(0,"saleCd")));
        	this.ds_sumPayInfo.clearData();
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        */
        }

        //합계납부정보 등록비조정 컬럼
        this.grdRegiChg = function(obj,e)
        {
        	var sColId 		= e.col;
        	var nRow 		= e.row;
        	var cRegiAmt = 0;
        	obj.dropdownCombo();

        	for(var i=0; i < this.ds_contactDeliInfo.rowcount ; i++) {
        		//계약상품 납품정보 등록비 합계 구하기
        		if(nvl(this.ds_contactDeliInfo.getColumn(i,"regiAmt")) == "") {
        			cRegiAmt = parseInt(cRegiAmt) + 0;
        		} else {
        			cRegiAmt = parseInt(cRegiAmt) + parseInt(this.ds_contactDeliInfo.getColumn(i,"regiAmt"));
        		}
        	}
        	//자유렌탈일경우
        	if(nvl(this.ds_saleItemList.getColumn(0,"prdtGrpDtl"))=="04"){
        	
        	var saleRegAmtList = this.ds_FreeRegAmtMgnt.getRowCount();
        	if(this.ds_RegAmtMgnt.getRowCount()<8){
        		for( var i = 0 ; i < saleRegAmtList ; i++ ){		
        			this.ds_RegAmtMgnt.addRow();
        			this.ds_RegAmtMgnt.setColumn(i,"cd",nvl(this.ds_FreeRegAmtMgnt.getColumn(i, "amt")));
        			this.ds_RegAmtMgnt.setColumn(i,"cdNm",nvl(this.ds_FreeRegAmtMgnt.getColumn(i, "amt")));
        			}
        		}
        	}else{
        	this.ds_RegAmtMgnt.clearData();
        		for (var i=0; i<3; i++) {
        			this.ds_RegAmtMgnt.addRow();
        			this.ds_RegAmtMgnt.setColumn(i,"cd", cRegiAmt*i);
        			this.ds_RegAmtMgnt.setColumn(i,"cdNm", cRegiAmt*i);		
        		}
        	}
        	//this.setRegiAmt();
        }

        this.setRegiAmt = function(obj,e)
        {
        	var sColId 		= e.columnid;
        	var nRow 		= e.row;	
        	
        	if(sColId == "regiAmtChg") {
        		obj.setColumn(0, "regiAmt", obj.getColumn(0, "regiAmtChg")); //등록비 수정
        		
        		this.contactRowChg();
        	}
        		
        	//등록비 관련 데이타 조회(2018.10.30)
        	//this.FN_saleRegiAmt();
        	
        	
        	
        }

        //------------ 계약별 정보 조회 -------------------------------------------------------------------------------
        // 계약번호별 제품정보 조회
        this.fn_searchProduct = function(){
        	this.idx	= this.ds_model.rowposition;
        	var modelCd = nvl(this.div_carInfo.ed_model.value);
        	var ordNo = nvl(this.ed_orderNo.value);
        	var saleCd = nvl(this.ed_SaleCd.value);
        	var contentsCd = nvl(this.div_carInfo.ed_contentsCd.value); // 2018.12.20 추가수정
        	/*this.alert("modelCd : " + modelCd + "  ordNo : " + ordNo + "  saleCd : " + saleCd);*/
        	
        	var sSvcID        	= "listAddSelProduct";                    
        	var sController   	= "/rtms/sd/listAddSelProduct.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_productInfo=listAddSelProduct";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	sArgs += Ex.util.setParam("ordNo",   ordNo);			// 계약번호
        	sArgs += Ex.util.setParam("modelCd", modelCd);			// 모델코드
        	sArgs += Ex.util.setParam("saleCd", saleCd);			// 판매코드
        	sArgs += Ex.util.setParam("contentsCd", contentsCd);	// 차량상세코드 2018.12.20 추가수정
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        // 상품별 프리미엄 서비스 정보조회 
        this.fn_getPrmmSrvc = function(){
        	var saleCd = nvl(this.ed_SaleCd.value);
        	var periodCd = nvl(this.p_periodCd.value);
        	var cntCd = nvl(this.p_cntCd.value);
        	//this.alert("saleCd : " + saleCd + " periodCd : " + periodCd + " cntCd : " + cntCd);
        	var sSvcID        	= "srvcOrdList";                    
        	var sController   	= "rtms/comm/srvcOrdList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_seviceCd=srvcOrdListMap";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	this.ds_rtsd0013.clearData();  // dataset clear 한다.
        	sArgs += Ex.util.setParam("p_saleCd", saleCd);		// 판매코드
        	sArgs += Ex.util.setParam("p_periodCd", periodCd);	// 장착개월수
        	sArgs += Ex.util.setParam("p_cntCd", cntCd);		// 타이어본수
        		
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        // 계약번호별 부가상품 정보조회
        this.fn_searchAdtProduct = function(){
        	this.ordNo = nvl(this.ed_orderNo.value);
        	
        	var sSvcID        	= "listProductInfoSch";                    
        	var sController   	= "/rtms/sd/listProductInfoSch.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_ValuePrdtInfo=listProductInfoSch";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	sArgs += Ex.util.setParam("ordNo",   this.ordNo);
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        // 계약번호별 프리미엄 서비스  정보조회
        this.fn_searchPrmmSrvc = function(){
        	this.ordNo = nvl(this.ed_orderNo.value);
        	
        	var sSvcID        	= "prmmSrvcOrdList";                    
        	var sController   	= "/rtms/sd/prmmSrvcOrdList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_seviceCd=prmmSrvcOrdList";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	sArgs += Ex.util.setParam("ordNo",   this.ordNo);
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        // 계약상품 납부정보
        this.fn_cntPrdPymInfoList = function(){
        	var sSvcID        	= "cntPrdPymInfoList";                    
        	var sController   	= "/rtms/sd/cntPrdPymInfoList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_contactDeliInfo=cntPrdPymInfoMap";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        		sArgs += Ex.util.setParam("ordNo",   this.ordNo);
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        //패키지(묶음)처리
        this.fn_pkgBundleProc = function(obj,e){
        	var p_argGrpNo = this.ed_grpPkgNum.value;
        	var args ={ p_formId:"popupTestForm", p_grpCd : p_argGrpNo };
        	Ex.core.popup(this,"패키지(묶음)처리","sd::RTSDOrderNo2_pop.xfdl",args, "modaless=false");
        }

        //패키지 해지
        this.fn_grpTermiProc = function(obj,e){
        	var p_argGrpNo = this.ed_grpPkgNum.value;
        	var args ={ p_argGrpNo : p_argGrpNo };
        	Ex.core.popup(this,"패키지(묶음)해지","sd::RTSDGroupPackageCancel_PopupF.xfdl",args, "modaless=false");
        }

        this.contactRowChg = function()
        {
        	var sPeriod			= 0;
        	if(nvl(this.p_periodCd.value) == '') {
        		sPeriod = 0;
        	} else {
        		sPeriod = this.p_periodCd.value;
        	}
        	
        	trace("sPeriod:"+sPeriod);
        	
        	if( sPeriod > 0) {
        		
        		
        		var sRentAmt = 0;
        		var cRegiAmt = 0;
        		var sSaleAmt = 0;
        		var sAmt	 = 0;
        		
        		if(this.ds_contactDeliInfo.rowcount > 0) {

        			
        			for(var i=0; i < this.ds_contactDeliInfo.rowcount ; i++) {
        				//계약상품 납품정보 월렌탈료 합계 구하기
        				if(nvl(this.ds_contactDeliInfo.getColumn(i,"rentAmt"),0) == "") {
        					sRentAmt = parseInt(sRentAmt) + 0;
        				} else {
        					sRentAmt = parseInt(sRentAmt) + parseInt(this.ds_contactDeliInfo.getColumn(i,"rentAmt"));
        				}
        				
        				//계약상품 납품정보 등록비 합계 구하기
        				if(nvl(this.ds_contactDeliInfo.getColumn(i,"regiAmt"),0) == "") {
        					cRegiAmt = parseInt(cRegiAmt) + 0;
        				} else {
        					cRegiAmt = parseInt(cRegiAmt) + parseInt(this.ds_contactDeliInfo.getColumn(i,"regiAmt"));
        				}
        				
        				//계약상품 납품정보에서 일시납 합계 구하기
        				if(nvl(this.ds_contactDeliInfo.getColumn(i, "amt"),0) == "") {
        					sAmt = parseInt(sAmt) + 0;
        				} else {
        					sAmt = parseInt(sAmt) + parseInt(this.ds_contactDeliInfo.getColumn(i, "amt"));
        				}
        				
        				//계약상품 납품정보에서 할인액 합계 구하기
        				if(nvl(this.ds_contactDeliInfo.getColumn(i, "dcAmt"),0) == "") {
        					sSaleAmt = parseInt(sSaleAmt) + 0;
        					sSaleAmt = Math.floor(eval(sSaleAmt)/10)*10; //각 항목별 원단위 절사
        				} else {
        					sSaleAmt = parseInt(sSaleAmt) + parseInt(this.ds_contactDeliInfo.getColumn(i, "dcAmt"));
        					sSaleAmt = Math.floor(eval(sSaleAmt)/10)*10; //각 항목별 원단위 절사
        					
        					trace("sSaleAmt::" + sSaleAmt);
        					trace("dcAmt::" + this.ds_contactDeliInfo.getColumn(i, "dcAmt"));
        				}
        			}
        		}
        		
        		var sumRentAmt 		= 0;
        		var totRegiAmt 		= 0;
        		var sRegiAmt		= 0;
        		var sRegAmtChg		= 0;
        		var sChanSaleAmt	= 0;
        		var sGrpSaleAmt		= 0;
        		var sSaleTotSum		= 0;
        		var lastTotRentAmt	= 0;
        		var lastRentAmt		= 0;
        		//trace("sRentAmt:"+sRentAmt);
        		
        		/*
        		if(nvl(this.ds_sumPayInfo.getColumn(0, "regiAmt"),0) == '') {
        			sRegiAmt = 0;
        		} else {
        			sRegiAmt = this.ds_sumPayInfo.getColumn(0, "regiAmt");
        		}
        		*/
        		
        		this.regiAmtRt = parseInt(this.regiAmtRt); // 등록비 할인율
        		
        		if(this.regiAmtRt > 0){
        			cRegiAmt = this.mathFloor(cRegiAmt - (cRegiAmt * this.regiAmtRt)/100);
        		} else {
        			cRegiAmt = cRegiAmt;
        		}
        		
        		//trace("등록비수정:"+nvl(this.ds_sumPayInfo.getColumn(0, "regiAmtChg"),0));
        		if(nvl( this.ds_sumPayInfo.getColumn(0, "regiAmtChg"), "") == '') {
        			sRegAmtChg = parseInt(nvl(cRegiAmt,0));
        		} else {
        			//sRegAmtChg = parseInt(nvl(cRegiAmt,0)) - parseInt(nvl(this.ds_sumPayInfo.getColumn(0, "regiAmtChg"),0));
        			sRegAmtChg = parseInt(nvl(this.ds_sumPayInfo.getColumn(0, "regiAmtChg"),0));
        		}
        		
        		//trace("등록비최종:"+sRegAmtChg);
        		this.ds_sumPayInfo.setColumn(0,"regiAmt", sRegAmtChg);
        		
        	
        		//일시납 합계
        		this.ds_sumPayInfo.setColumn(0,"amt", sAmt);
        		//trace("월렌탈료:"+sRentAmt);
        		//합계렌탈료
        		sumRentAmt = parseInt(nvl(sRentAmt,0)) * parseInt(sPeriod);
        		
        		
        		//총 렌탈료
        		totRegiAmt = parseInt(sumRentAmt) + (parseInt(nvl(cRegiAmt,0)) - parseInt(sRegAmtChg));
        		//trace("합계렌탈료:"+sumRentAmt);
        		//trace("렌탈등록비:"+sRegAmtChg);
        		//trace("총렌탈료:"+totRegiAmt);
        		
        		//할인액합계
        		//sSaleTotSum = Math.floor(eval(sSaleAmt)/10)*10;
        		sSaleTotSum = sSaleAmt;
        		//[20210209_01] kstka 총렌탈료 계산단계에서 10원미만 절사 하고 있어 해당로직 제외
        		//sSaleTotSum = sSaleAmt;
        		//trace("sSaleAmt:"+sSaleAmt);
        		
        		this.ds_sumPayInfo.setColumn(0,"sumSaleAmt", sSaleTotSum)
        		
        		//최종 총 렌탈료
        		//lastTotRentAmt = totRegiAmt - sSaleTotSum;
        		lastTotRentAmt = totRegiAmt;
        		//trace("최종 렌탈료:"+lastTotRentAmt);
        		//alert("lastTotRentAmt :"+lastTotRentAmt);
        		//alert("sPeriod :"+sPeriod);
        		
        		//변경 월 렌탈료
        		lastRentAmt = Math.floor(((lastTotRentAmt / sPeriod)-sSaleTotSum)/10)*10;
        		
        		trace("sumRentAmt" + sumRentAmt); 
        		trace("cRegiAmt" + cRegiAmt); 
        		trace("sRegAmtChg" + sRegAmtChg); 
        		trace("lastTotRentAmt" + lastTotRentAmt); 
        		trace("sSaleAmt" + sSaleAmt); 
        		trace("sSaleTotSum" + sSaleTotSum);
        		trace("lastRentAmt" + lastRentAmt);
        		
        		//this.ds_sumPayInfo.set_updatecontrol(true);
        		this.ds_sumPayInfo.setColumn(0,"rentAmt", lastRentAmt);
        		
        		//등록비 일시납 납부 버튼 활성, 비활성화 체크
        		if(nvl(this.payStatCd,"") != '00') {
        			this.btn_payRegiAmt.set_enable(false);
        		} else {
        			if(nvl(this.regiAmtRt,0) == '100' && nvl(sAmt,0) == '0') {
        				this.btn_payRegiAmt.set_enable(false);
        			} else {
        				this.btn_payRegiAmt.set_enable(true);
        			}
        		}
        	}
        }

        
        // 기존 계약정보 조회할경우 합계납부정보조회
        // this.rtsd0104Loadset = function(regiAmt, sumMonAmt) 
        // {
        // 	
        // 	var sPeriod			= 0;
        // 	if(nvl(this.p_periodCd.value) == '') {
        // 		sPeriod = 0;
        // 	} else {
        // 		sPeriod = this.p_periodCd.value;
        // 	}
        // 	
        // 	
        // 	if( sPeriod > 0) {
        // 		var sRentAmt = 0;
        // 		var cRegiAmt = 0;
        // 		var sSaleAmt = 0;
        // 		var sAmt	 = 0;
        // 		
        // 		if(this.ds_contactDeliInfo.rowcount > 0) {
        // 			for(var i=0; i < this.ds_contactDeliInfo.rowcount ; i++) {
        // 				//계약상품 납품정보 월렌탈료 합계 구하기
        // 				if(nvl(this.ds_contactDeliInfo.getColumn(i,"rentAmt"),0) == "") {
        // 					sRentAmt = parseInt(sRentAmt) + 0;
        // 				} else {
        // 					sRentAmt = parseInt(sRentAmt) + parseInt(this.ds_contactDeliInfo.getColumn(i,"rentAmt"));
        // 				}
        // 				
        // 				//계약상품 납품정보 등록비 합계 구하기
        // 				if(nvl(this.ds_contactDeliInfo.getColumn(i,"regiAmt"),0) == "") {
        // 					cRegiAmt = parseInt(cRegiAmt) + 0;
        // 				} else {
        // 					cRegiAmt = parseInt(cRegiAmt) + parseInt(this.ds_contactDeliInfo.getColumn(i,"regiAmt"));
        // 				}				
        // 				
        // 				//계약상품 납품정보에서 일시납 합계 구하기
        // 				if(nvl(this.ds_contactDeliInfo.getColumn(i, "amt"),0) == "") {
        // 					sAmt = parseInt(sAmt) + 0;
        // 				} else {
        // 					sAmt = parseInt(sAmt) + parseInt(this.ds_contactDeliInfo.getColumn(i, "amt"));
        // 				}
        // 				
        // 				//계약상품 납품정보에서 할인액 합계 구하기
        // 				if(nvl(this.ds_contactDeliInfo.getColumn(i, "dcAmt"),0) == "") {
        // 					sSaleAmt = parseInt(sSaleAmt) + 0;
        // 				} else {
        // 					sSaleAmt = parseInt(sSaleAmt) + parseInt(this.ds_contactDeliInfo.getColumn(i, "dcAmt"));
        // 				}
        // 			}
        // 		}
        // 		
        // 		var sumRentAmt 		= 0;
        // 		var totRegiAmt 		= 0;
        // 		var sRegiAmt		= 0;
        // 		var sRegAmtChg		= 0;
        // 		var sChanSaleAmt	= 0;
        // 		var sGrpSaleAmt		= 0;
        // 		var sSaleTotSum		= 0;
        // 		var lastTotRentAmt	= 0;
        // 		var lastRentAmt		= 0;
        // 		
        // 		/*
        // 		if(nvl(this.ds_sumPayInfo.getColumn(0, "regiAmt"),0) == '') {
        // 			sRegiAmt = 0;
        // 		} else {
        // 			sRegiAmt = this.ds_sumPayInfo.getColumn(0, "regiAmt");
        // 		}
        // 		*/
        // 		//trace("cRegiAmt:"+cRegiAmt);
        // 		//trace("regiAmtChg:"+nvl(this.ds_sumPayInfo.getColumn(0, "regiAmtChg"),0));
        // 		
        // 		this.regiAmtRt = parseInt(this.regiAmtRt); // 등록비 할인율
        // 		
        // 		if(this.regiAmtRt > 0){
        // 			regiAmt = this.mathFloor(regiAmt - (regiAmt * this.regiAmtRt)/100);
        // 		} else {
        // 			regiAmt = regiAmt;
        // 		}
        // 		 
        // 		if(nvl( this.ds_sumPayInfo.getColumn(0, "regiAmtChg"), "") == '') {
        // 			sRegAmtChg = parseInt(nvl(regiAmt,0));
        // 		} else {
        // 			//sRegAmtChg = parseInt(nvl(cRegiAmt,0)) - parseInt(nvl(this.ds_sumPayInfo.getColumn(0, "regiAmtChg"),0));
        // 			sRegAmtChg = parseInt(nvl(this.ds_sumPayInfo.getColumn(0, "regiAmtChg"),0));
        // 		}
        // 		
        // 		//this.alert("sRegAmtChg:"+sRegAmtChg);
        // 		this.ds_sumPayInfo.setColumn(0,"regiAmt", sRegAmtChg);
        // 		
        // 		this.ds_sumPayInfo.setColumn(0,"regiAmtChg", regiAmt);
        // 	
        // 		//this.ds_sumPayInfo.setColumn(0,"regiAmtChg", regiAmt);
        // 		
        // 		
        // 	
        // 		//일시납 합계
        // 		this.ds_sumPayInfo.setColumn(0,"amt", sAmt);
        // 		//this.alert("sAmt:"+sAmt);
        // 		//합계렌탈료
        // 		sumRentAmt = parseInt(nvl(sRentAmt,0)) * parseInt(sPeriod);
        // 		//trace("sumRentAmt:"+sumRentAmt);
        // 		
        // 		//총 렌탈료
        // 		totRegiAmt = parseInt(sumRentAmt) + (parseInt(nvl(cRegiAmt),0) - parseInt(sRegAmtChg));
        // 		//this.alert("totRegiAmt:"+totRegiAmt);
        // 		
        // 		//할인액합계
        // 		sSaleTotSum = Math.floor(eval(sSaleAmt)/10)*10;
        // 		//trace("sSaleAmt:"+Math.floor(eval(sSaleAmt)/10)*10);
        // 		this.ds_sumPayInfo.setColumn(0,"sumSaleAmt", sSaleTotSum)
        // 		
        // 		//최종 총 렌탈료
        // 		//lastTotRentAmt = totRegiAmt - sSaleTotSum;
        // 		//trace("lastTotRentAmt:"+lastTotRentAmt);
        // 		//this.alert("lastTotRentAmt:"+lastTotRentAmt);
        // 		//trace("sPeriod :"+sPeriod);
        // 		
        // 		//변경 월 렌탈료
        // 		//lastRentAmt = Math.floor(((lastTotRentAmt / sPeriod)-sSaleTotSum)/10)*10;
        // 		lastRentAmt = Math.floor(((totRegiAmt / sPeriod)-sSaleTotSum)/10)*10;
        // 		
        // 		//this.ds_sumPayInfo.set_updatecontrol(true);
        // 		this.ds_sumPayInfo.setColumn(0,"rentAmt", lastRentAmt);
        // 		
        // 		//등록비 일시납 납부 버튼 활성, 비활성화 체크
        // 		if(nvl(this.payStatCd,"") != '00') {
        // 			this.btn_payRegiAmt.set_enable(false);
        // 		} else {
        // 			if(nvl(this.regiAmtRt,0) == '100' && nvl(sAmt,0) == '0') {
        // 				this.btn_payRegiAmt.set_enable(false);
        // 			} else {
        // 				this.btn_payRegiAmt.set_enable(true);
        // 			}
        // 		}
        // 
        // 		if(nvl(this.regiAmtRt,0) == '100') {
        // 			this.Grid04.setCellProperty("body", this.Grid04.getBindCellIndex("body", "regiAmtChg"), "displaytype", "normal");
        // 			this.Grid04.setCellProperty("body", this.Grid04.getBindCellIndex("body", "regiAmtChg"), "edittype", "none");
        // 		}
        // 
        // 	}
        // }

        // 타이어본수 계산
        this.getTotCntCd = function(){
        	var totTotCntCd = 0;
        	for(var i=0; i< this.ds_productInfo.rowcount; i++){
        		if(this.ds_productInfo.getColumn(i, "cntCd") !== undefined && this.ds_productInfo.getColumn(i, "cntCd") != "" ){
        			totTotCntCd += parseInt(this.ds_productInfo.getColumn(i, "cntCd")); 
        		}	
        	}	
        	return totTotCntCd;
        } 

        
        // 타이어장착위치 검증
        this.getFrCdChk = function(frcd){

        	var frCdChk = false;
        	for(var i=0; i< this.ds_productInfo.rowcount; i++){
        		if(this.ds_productInfo.getColumn(i, "frCd") !== undefined && this.ds_productInfo.getColumn(i, "frCd") == frcd && frcd != "Z"){
        			frCdChk = true;
        			break;
        		}	
        	}	
        	return frCdChk;
        }

        // 프리미엄 서비스횟수 무제한 콤보세팅
        this.prmmSvrComboSet = function(obj,e){
        	
        	var pCd = nvl(this.ds_seviceCd.getColumn(e.row, "servCntOrg"))=='999'?nvl(this.ds_seviceCd.getColumn(e.row, "servCntTemp")):nvl(this.ds_seviceCd.getColumn(e.row, "servCntOrg"));
        	if(nvl(this.ds_saleItemList.getColumn(0,"prdtGrp"),"") == "") {							//값을 불러올때		
        		if(this.ds_rtsd0104.getColumn(0,"prdtGrp")=='01'){									//렌탈상품코드
        			if(this.ds_rtsd0104.getColumn(0,"prdtGrpDtl")=='04'){							//자유렌탈 일경우
        				if(nvl(this.ds_seviceCd.getColumn(e.row, "servInfYN"))!="Y"){				//무제한이 아닐경우
        					if(e.col == 3) {
        						if(this.ds_seviceCd.getColumn(e.row,"prsDcd") == "B00007"){			//프리미엄서비스 일경우 본수이하(20190219)
        							this.ds_svrCnt.filter("cd <= " + this.p_cntCd.value);
        						}else{
        							this.ds_svrCnt.filter("cd != '999'");								//무제한제외
        						}
        					}
        				}else{																		//자유렌탈 무제한일경우 (20190219)
        					if(this.ds_seviceCd.getColumn(e.row,"prsDcd") == "B00007"){
        						this.ds_svrCnt.filter("cd == '999' || cd <= " +  this.p_cntCd.value);
        					}else{
        						this.ds_svrCnt.filter("cd != '999' || cd =='999'");
        					}
        				}
        			}else{
        				if(nvl(this.ds_seviceCd.getColumn(e.row, "servInfYN"))=="Y"){				//무제한일경우
        					if(e.col == 3) {
        						this.ds_svrCnt.filter("cd == '999' || cd == " +  pCd);				//본인 + 무제한포함
        					}
        				}else{
        					if(e.col == 3) {
        						this.ds_svrCnt.filter("cd == " +  pCd);								//본인만 나옴
        					}
        				}
        			}
        		}
        	} else {																				//새로 주문을 할경우
        		if(this.ds_saleItemList.getColumn(0,"prdtGrp")=='01'){
        			if(this.ds_saleItemList.getColumn(0,"prdtGrpDtl")=='04'){
        				if(nvl(this.ds_seviceCd.getColumn(e.row, "servInfYN"))!="Y"){
        					if(e.col == 3) {
        // 						if(this.ds_seviceCd.getColumn(e.row,"prsDcd") == "B00007"){
        // 							this.ds_svrCnt.filter("cd <= " + this.p_cntCd.value);
        // 						}else{
        // 							this.ds_svrCnt.filter("cd != '999'");								//무제한제외
        // 						}
        						
        						//[20201103] kstka 자유렌탈인경우 선택할 수 있는 서비스 횟수를 max로 세팅
        						var servCnt = nvl(this.ds_seviceCd.getColumn(e.row,"servCnt"));
        						if(this.ds_seviceCd.getColumn(e.row,"prsDcd") == "B00010"){
        							this.ds_svrCnt.filter("cd == " + servCnt);
        						}else{							
        							this.ds_svrCnt.filter("cd <= " + servCnt);
        						}
        					}

        				}else{																		//자유렌탈 무제한일경우 
        					if(this.ds_seviceCd.getColumn(e.row,"prsDcd") == "B00007"){
        						this.ds_svrCnt.filter("cd == '999' || cd <= " +  this.p_cntCd.value);
        					}else{
        						this.ds_svrCnt.filter("cd != '999' || cd =='999'");
        					}
        				}
        			}else{
        				if(nvl(this.ds_seviceCd.getColumn(e.row, "servInfYN"))=="Y"){
        					if(e.col == 3) {
        						this.ds_svrCnt.filter("cd == '999' || cd == " +  pCd);				//본인+무제한
        					}
        				}else{
        					if(e.col == 3) {
        						this.ds_svrCnt.filter("cd == " +  pCd);								//본인만 나옴
        					}
        				}
        			}
        		}
        	}
        }

        // 프리미엄 서비스횟수 콤보 발생 이벤트 
        this.prmmSvrComboGet = function(obj,e){
        	
        	var pCd = nvl(obj.getColumn(e.row, "servCntOrg"))=='999'?nvl(obj.getColumn(e.row, "servCntTemp")):nvl(obj.getColumn(e.row, "servCntOrg"));
        	var dcRate =  nvl(obj.getColumn(e.row, "dcRate")) == ''?0:obj.getColumn(e.row, "dcRate");

        	if(obj.getColumn(e.row, "servCnt") == '999'){
        		obj.setColumn(e.row, "servAmtSum", obj.getColumn(e.row, "servInfAmt"));
        		obj.setColumn(e.row, "saleAmt", parseInt(obj.getColumn(e.row, "servInfAmt")) * dcRate/100);
        	}else{
        		if(nvl(this.ds_saleItemList.getColumn(0,"prdtGrp"),"") == "") {
        		
        			if(this.ds_rtsd0104.getColumn(0,"prdtGrp")=='01'){
        				if(this.ds_rtsd0104.getColumn(0,"prdtGrpDtl")=='04'){
        					var c =obj.getColumn(e.row, "servCnt");
        					var servA = nvl(obj.getColumn(e.row,"servAmt"+c));
        					
        					console.log("1-1 : " + servA);
        					
        					obj.setColumn(e.row, "servAmtSum", servA);
        					obj.setColumn(e.row, "saleAmt", servA * dcRate/100);
        				}else{
        					console.log("1-2 : ");
        					obj.setColumn(e.row, "servAmtSum", obj.getColumn(e.row, "servAmtSumOrg"));
        					obj.setColumn(e.row, "saleAmt", parseInt(obj.getColumn(e.row, "servAmtSumOrg")) * dcRate/100);
        				}
        			}
        		} else {
        			if(this.ds_saleItemList.getColumn(0,"prdtGrp")=='01'){
        				if(this.ds_saleItemList.getColumn(0,"prdtGrpDtl")=='04'){
        			
         					var c =obj.getColumn(e.row, "servCnt");		//횟수 					
         					var servA = nvl(obj.getColumn(e.row,"servAmt"+c)); 					
         
         					console.log("2-1 : " + servA);

        					
         					obj.setColumn(e.row, "servAmtSum", servA);
          					obj.setColumn(e.row, "saleAmt", servA * dcRate/100);
        				}else{
        					console.log("2-2 : ");
        					obj.setColumn(e.row, "servAmtSum", obj.getColumn(e.row, "servAmtSumOrg"));
        					obj.setColumn(e.row, "saleAmt", parseInt(obj.getColumn(e.row, "servAmtSumOrg")) * dcRate/100);
        				}
        			}
        		}
        	}	
        	// 프리미엄서비스 서비스 회수 조정시 계약상품 납부정보 금액 변경 및 재 계산
        	this.set_prmmAdd_dsCntPrdPymInfo();
        }

        // 등록비 납부 팝업 호출
        this.btn_payRegiAmt_onclick = function(obj,e)
        {
        	
        	var p_ordNo 	= nvl(this.ed_orderNo.value);
        	var p_matNm 	= nvl(this.ed_SaleProdNm.value);  // ds_agencyPop_Cp
        	var p_custNo 	= nvl(this.div_custInfo.ed_custNo.value);
        	var p_custNm 	= nvl(this.div_custInfo.ed_custNm.value); 
        	var p_mobNo 	= nvl(this.div_custInfo.div_custInfoDetail.ed_mobNo.value);
        	var p_regiAmt 	= this.ds_sumPayInfo.getColumn(0,"regiAmt");
        	var p_onePymnt 	= this.ds_sumPayInfo.getColumn(0,"amt");
        	var p_birthDay 	= nvl(this.div_custInfo.ed_birthDay.value);
        	var p_buslNo 	= nvl(this.div_custInfo.ed_buslNo.value);
        	
        	var p_bizNo = p_birthDay==""?p_buslNo:p_birthDay;
        	
        	var p_recpTp	    = "90";
        	
        	if(p_ordNo == ""){
        		alert("주문서자장을 먼저 하세요!");
        		return;
        	}
        	
        	if(p_regiAmt != '0' || p_onePymnt != 0){
        		//this.alert("ordNo : " + p_ordNo + "\n" + "matNm : " +p_matNm + "\n" + "custNo : " + p_custNo + "\n" + "custNm : " + p_custNm + "\n" + "mobNo : " + p_mobNo + "\n" + "regiAmt : " + p_regiAmt + "\n" + "onePymnt : " + p_onePymnt + "\n" + "bizNo : " + p_bizNo);
        		var args = {"ordNo" : p_ordNo, "matNm" : p_matNm, "custNo" : p_custNo, "custNm" : p_custNm, "mobNo" : p_mobNo, "regiAmt" : p_regiAmt, "onePymnt" : p_onePymnt, "bizNo" : p_bizNo, "recpTp" : p_recpTp};
        		Ex.core.popup(this,"등록비결제","re::RTREPrcmAmtNOnePymntRecp_pop.xfdl", args, "modaless=false");
        	}else{
        		this.fn_popupCallback();
        	}
        }

        // 10단위 절삭
        this.mathFloor = function(num){
        	num = Math.floor(eval(num)/10)*10;	
        	return num;
        }

        // 10단위 절상
        this.mathRound = function(num){
        	num = Math.round(eval(num)/10)*10;	
        	return num;
        }

        // 등록비 선납
        this.fn_regiAmtPay = function(){
        	var ordNo =	nvl(this.ed_orderNo.value);
        	var sSvcID        	= "regiAmtPay";                    
        	var sController   	= "/rtms/sd/regiAmtPay.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= Ex.util.setParam("ordNo", ordNo);
        	var fn_callBack		= "fn_callBack";
        	var bAsync	  = false;			//동기화추가(20190220)

        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack, true, bAsync);
        }

        // 등록비 후납
        this.fn_regiAmtPayPass = function(ordNo){
        	var sSvcID        	= "regiAmtPay";                    
        	var sController   	= "/rtms/sd/regiAmtPay.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= Ex.util.setParam("ordNo", ordNo);
        	var fn_callBack		= "fn_callBack";

        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        // 수납후 callback 함수 호추 
        this.fn_popupCallback = function(){

        	this.Grid04.setCellProperty("body", this.Grid04.getBindCellIndex("body", "regiAmtChg"), "displaytype", "normal");
        	this.Grid04.setCellProperty("body", this.Grid04.getBindCellIndex("body", "regiAmtChg"), "edittype", "none");
        	this.btn_payRegiAmt.set_enable(false);  // 등록비 일시불납부 버튼
        	//this.btn_GrpSave.set_enable(false);	
        	
        	this.payStatCd = '01';
        	
        	this.fn_regiAmtPay();	
        }

        // 주문서저장버튼 클릭시
        this.btn_GrpSave_onclick = function(obj,e)
        {
        	this.btn_GrpSave.set_enable(false);
        	if(this.fn_save() == false){
        		this.btn_GrpSave.set_enable(true);
        	};
        }

        //장착유형 선택시 주소 입력창 선택여부
        this.div_installInfo_rd_procType_onitemchanged = function(obj,e)
        {
        	this.div_installInfo.btn_postSearch00.set_enable(false);
        	this.div_installInfo.btn_postSearch01.set_enable(false);
        	this.div_installInfo.btn_searchAgency.set_enable(false);
        	this.div_installInfo.btn_searchTime.set_enable(false);
        	this.div_installInfo.rd_baseType.set_enable(false);
        	this.div_installInfo.rd_timeType.set_enable(true);
        	this.div_installInfo.ed_visitTel.set_enable(false);
        	
        	this.div_installInfo.ed_posCd00.set_value("");
        	this.div_installInfo.ed_addr00.set_value("");
        	this.div_installInfo.ed_detl_addr00.set_value("");
        	
        	this.div_installInfo.ed_posCd01.set_value("");
        	this.div_installInfo.ed_addr01.set_value("");
        	this.div_installInfo.ed_detl_addr01.set_value("");
        		
        	this.ds_time.clearData();
        	this.ds_orderId.clearData();
        	this.ds_schedule.clearData();
        	this.ds_agency.clearData();
        		
        	trace("procType::" + nvl(obj.value));
        	trace("addDay::" + this.addDay);
        	this.div_installInfo.cal_procDay.set_value(this.addDay);
        	if(nvl(obj.value) == "1010"){ //방문장착
        		this.div_installInfo.btn_postSearch00.set_enable(true);
        		this.div_installInfo.btn_searchTime.set_enable(true);
        		this.div_installInfo.rd_baseType.set_enable(true);
        		this.div_installInfo.rd_timeType.set_enable(true);
        		this.div_installInfo.ed_visitTel.set_enable(true);
        		this.div_installInfo.rd_alignYn.set_enable(true);
        		
        		this.div_installInfo.cal_procDay.set_value(this.addDay);		
        	}else if(nvl(obj.value) == "1020"){ //Pickup&Delivery	
        		this.div_installInfo.btn_postSearch00.set_enable(true);
        		this.div_installInfo.btn_postSearch01.set_enable(true);
        		this.div_installInfo.btn_searchTime.set_enable(true);
        		this.div_installInfo.rd_baseType.set_enable(true);
        		this.div_installInfo.rd_timeType.set_enable(true);
        		this.div_installInfo.ed_visitTel.set_enable(true);
        		this.div_installInfo.rd_alignYn.set_enable(true);
        		
        		this.div_installInfo.cal_procDay.set_value(this.addDay);
        	}else{	//전문점장착		
        		this.div_installInfo.btn_searchAgency.set_enable(true);
        		this.div_installInfo.rd_timeType.set_enable(false);
        		
        		this.div_installInfo.cal_procDay.set_value(this.addDay_2);
        	}
        }

        this.div_installInfo_btn_postSearch00_onclick = function(obj,e)
        {
        	var args ={p_arg : "RTSDCustRegister_1"};
        	Ex.core.popup(this,"우편번호 조회","comm::RTCOMMPostCode_pop.xfdl",args, "modaless=false");
        }

        this.div_installInfo_btn_postSearch01_onclick = function(obj,e)
        {
        	var args ={p_arg : "RTSDCustRegister_2"};
        	Ex.core.popup(this,"우편번호 조회","comm::RTCOMMPostCode_pop.xfdl",args, "modaless=false");
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.FN_postCd = function(res,division ){
        	if( division == "addr1"){
        		this.div_installInfo.ed_detl_addr00.set_enable(true);
        		this.div_installInfo.ed_posCd00.set_value( res[0] );
        		this.div_installInfo.ed_addr00.set_value( res[1] );
        		this.div_installInfo.ed_detl_addr00.set_value( res[2] );

        		//20200304 kstka 시군구동명 추가
        		this.div_installInfo.ed_siNm00.set_value( res[4] );
        		this.div_installInfo.ed_sggNm00.set_value( res[5] );
        		this.div_installInfo.ed_emdNm00.set_value( res[6] );
        	}else{
        		this.div_installInfo.ed_detl_addr01.set_enable(true);
        		this.div_installInfo.ed_posCd01.set_value( res[0] );
        		this.div_installInfo.ed_addr01.set_value( res[1] );
        		this.div_installInfo.ed_detl_addr01.set_value( res[2] );
        		
        		//20200304 kstka 시군구동명 추가
        		this.div_installInfo.ed_siNm01.set_value( res[4] );
        		this.div_installInfo.ed_sggNm01.set_value( res[5] );
        		this.div_installInfo.ed_emdNm01.set_value( res[6] );
        	}

        	//장착시간 초기화
        	this.initTmsInfo();	

        	//거점 재고 조회 (관할거점기준 전체), 콜센터(방문장착, P&D)
        	var procType = this.div_installInfo.rd_procType.value;
        	trace("FN_postCd:" + procType);
        	if(this.userGrp == "02"){
        		if(procType == "1010" || procType == "1020"){
        			//[20220503_01] 오프라인 거점주문의 경우에도 재고 조회
        			//this.o2oAgencyStock(application.gds_userInfo.getColumn(0, "agentId"), this.ds_productInfo.getColumn(0, "matCd"));
        	
        			this.div_installInfo.kakao_interface.document.getElementById("address").value = res[1] + res[2];
        			this.div_installInfo.kakao_interface.document.getElementById("fn_map").click();
        		}
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_installInfo_kakao_interface_onusernotify = function(obj,e)
        {
        	var doc = this.div_installInfo.kakao_interface.document;
        	
        	var xcoords = doc.getElementById("xcoords").value;
        	var ycoords = doc.getElementById("ycoords").value;
        	
        	var siNm = this.div_installInfo.ed_siNm01.value;
        	var sggNm = this.div_installInfo.ed_sggNm01.value;
        	var emdNm = this.div_installInfo.ed_emdNm01.value;
        	
        	trace(siNm + " " + sggNm + " " + emdNm + " " + xcoords + " " + ycoords);
        	//거점재고 조회
        	this.o2oAgencyStockTot(siNm, sggNm, emdNm, xcoords, ycoords);
        }

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_installInfo_btn_searchTime_onclick = function(obj,e)
        {
        	var procType = this.div_installInfo.rd_procType.value;
        	var procDay = this.div_installInfo.cal_procDay.value;
        	var timeType = this.div_installInfo.rd_timeType.value;
        	var agencyCd = this.div_installInfo.ed_agencyCd.value;
        	var baseType = this.div_installInfo.rd_baseType.value;
        	var period = this.div_installInfo.rd_timeType.value;
        	var cntCd = this.ds_productInfo.getColumn(this.ds_productInfo.rowposition,"cntCd");
        	var matCd = this.ds_productInfo.getColumn(this.ds_productInfo.rowposition,"matCd");
        	//20201210 kstka 얼라인먼트 사용여부 추가
        	var alignYn = nvl(this.div_installInfo.rd_alignYn.value);
        	
        	if(nvl(procType) == ""){
        		this.alert("장착유형을 선택해주세요.");
        		return;
        	}
        	if(nvl(procDay) == ""){
        		this.alert("장착일자를 선택해주세요.");
        		return;
        	}
        	if(nvl(period) == ""){
        		this.alert("오전/오후 구분을 선택해주세요.");
        		return;
        	}
        	if(nvl(baseType) == ""){
        		this.alert("지하여부 구분을 선택해주세요.");
        		return;
        	}
        	if(nvl(alignYn) == ""){
        		this.alert("얼라인먼트 사용여부를 선택해주세요.");
        		return;
        	}
        	
        	//방문장착, 전문점장착
        	var posCd0 = this.div_installInfo.ed_posCd00.value;
        	var addr00 = this.div_installInfo.ed_addr00.value;
        	var detlAddr00 = this.div_installInfo.ed_detl_addr00.value;
        	
        	var siNm00 = this.div_installInfo.ed_siNm00.value;
        	var sggNm00 = this.div_installInfo.ed_sggNm00.value;
        	var emdNm00 = this.div_installInfo.ed_emdNm00.value;
        	
        	//픽업앤딜리버리
        	var posCd01 = this.div_installInfo.ed_posCd01.value;
        	var addr01 = this.div_installInfo.ed_addr01.value;
        	var detlAddr01 = this.div_installInfo.ed_detl_addr01.value;
        	
        	var siNm01 = this.div_installInfo.ed_siNm01.value;
        	var sggNm01 = this.div_installInfo.ed_sggNm01.value;
        	var emdNm01 = this.div_installInfo.ed_emdNm01.value;
        	
        	var city = "";
        	var county = "";
        	var dong = "";
        	
        	var procTypeNm = "";
        	
        	//방문장착 및 전문점장착
        	if(procType == "1010" || procType == "1030"){
        		posCd01 = "";
        		addr01 = "";
        		detlAddr01 = "";
        		
        		if(nvl(siNm00) == "세종특별자치시"){ //세종특별자치시인경우 구가 존재하지 않음.
        			if(nvl(siNm00) == "" || nvl(emdNm00) == ""){
        				this.alert("주소1을 입력해 주세요.");
        				return;
        			}
        		}else{
        			if(nvl(siNm00) == "" || nvl(sggNm00) == "" || nvl(emdNm00) == ""){
        				this.alert("주소1을 입력해 주세요.");
        				return;
        			}
        		}
        		
        	}else{ //픽업앤딜리버리
        		if(nvl(siNm00) == "세종특별자치시"){ //세종특별자치시인경우 구가 존재하지 않음.
        			if(nvl(siNm00) == "" || nvl(emdNm00) == ""){
        				this.alert("주소1을 입력해 주세요.");
        				return;
        			}
        			if(nvl(siNm01) == "" || nvl(emdNm01) == ""){
        				this.alert("주소2를 입력해 주세요.");
        				return;
        			}
        		}else{
        			if(nvl(siNm00) == "" || nvl(sggNm00) == "" || nvl(emdNm00) == ""){
        				this.alert("주소1을 입력해 주세요.");
        				return;
        			}
        			if(nvl(siNm01) == "" || nvl(sggNm01) == "" || nvl(emdNm01) == ""){
        				this.alert("주소2를 입력해 주세요.");
        				return;
        			}
        		}		
        	}
        	
        	//yyyy-mm-dd 날짜타입 변경
        	var procDay = nvl(this.div_installInfo.cal_procDay.value);
        	var procDayFormat = procDay.substring(0, 4) + "-" + procDay.substring(4, 6) + "-" + procDay.substring(6, 8);
        	
        	this.ds_tms.clearData();
        	this.ds_tmsItem.clearData();
        	this.ds_tms.addRow();
        	this.ds_tmsItem.addRow();
        	
        	//[20220906_1] kstka tms조회시 대리점 매핑코드 조회를 하지 못하는 현상이 발생하여
        	//기존에 조회되었던 내역 초기화
        	this.ds_agency.clearData();
        	
        	this.div_installInfo.ed_agencyCd.set_value("");
        	this.div_installInfo.ed_agencyNm.set_value("");
        	this.div_installInfo.ed_salesGroup.set_value("");
        	this.div_installInfo.ed_salesOffice.set_value("");
        	
        	if(procType == "1010"){ //방문장착
        		this.ds_tms.setColumn(0, "sendURL", "/rentalapi/tms/allocationTMS.do");
        		this.ds_tms.setColumn(0, "orderType", encodeURI("visit")); //방문장착
        	}else if(procType == "1020"){ //픽업앤딜리버리
        		this.ds_tms.setColumn(0, "sendURL", "/rentalapi/tms/pndAllocationTMS.do");
        		this.ds_tms.setColumn(0, "orderType", encodeURI("pickup")); //픽업앤딜리버리
        	}
        	
        	var bhfType = "";
        		
        	//D+3일 이후 - 재고체크 안함
        	if(procDay >= this.addDay){
        		bhfType = "RDC";
        	}else{
        		bhfType = "BHF";
        	}
        	
        	this.ds_tms.setColumn(0, "reqDt", encodeURI(procDayFormat));
        	this.ds_tms.setColumn(0, "city", encodeURI(siNm00));
        	this.ds_tms.setColumn(0, "county", encodeURI(sggNm00));
        	this.ds_tms.setColumn(0, "dong", encodeURI(emdNm00));
        	this.ds_tms.setColumn(0, "bhfType", encodeURI(bhfType));
        	this.ds_tms.setColumn(0, "period", encodeURI(period));
        	this.ds_tms.setColumn(0, "address", encodeURI(addr00 + detlAddr00));
        	this.ds_tms.setColumn(0, "basementPsbYn", encodeURI(baseType));
        	this.ds_tms.setColumn(0, "wheelAlignment", encodeURI(alignYn));
        	this.ds_tms.setColumn(0, "totQty", encodeURI(Number(cntCd)));
        	
        	//pickup&delivery
        	this.ds_tms.setColumn(0, "dCity", encodeURI(siNm01));
        	this.ds_tms.setColumn(0, "dCounty", encodeURI(sggNm01));
        	this.ds_tms.setColumn(0, "dDong", encodeURI(emdNm01));
        	this.ds_tms.setColumn(0, "dAddress", encodeURI(addr01 + detlAddr01));
        	
        	//20200309 kstka item목록 생성
        	this.ds_tmsItem.setColumn(0, "itemCd", encodeURI(matCd));
        	this.ds_tmsItem.setColumn(0, "reqQy", encodeURI(Number(cntCd)));
        	
        	//20201221 kstka 얼라인먼트 서비스 선택시 item추가
        	if(alignYn == "Y"){
        		this.ds_tmsItem.addRow();
        		this.ds_tmsItem.setColumn(1, "itemCd", "700882");
        		this.ds_tmsItem.setColumn(1, "reqQy", "1");
        	}

        	//[20220203_01] kstka 고객번호 세팅
        	this.ds_tms.setColumn(0, "custNo", this.ds_rtsd0100.getColumn(0, "custNo"));
        	
        	var sSvcID        	= "tmsSchedules";                    
        	var sController   	= "/rtms/sd/tmsSchedules.do";
        	var sInDatasets   	= " ds_tms=ds_tms ";
        	    sInDatasets    += " ds_tmsItem=ds_tmsItem ";
        	var sOutDatasets  	= " ds_time=timeTables ";
        		sOutDatasets   += " ds_orderId=orderIds ";
        		sOutDatasets   += " ds_schedule=schedules ";
        		sOutDatasets   += " ds_agency=agencys ";
        		sOutDatasets   += " ds_etcInfo=etcInfos ";
        	var sArgs 			= "";		
        	var fn_callBack		= "fn_callBack";

        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);

        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_installInfo_cb_time_onitemclick = function(obj,e)
        {
        	var agencyCd_oms = "";
        	
        	var procType = this.div_installInfo.rd_procType.value;

        	if(procType == "1010" || procType == "1020"){
        		//[20220718] kstka 시간을 선택시 대리점코드 editbox가 정상 clear되지 않아보여 이벤트 초기에 clear로직 추가
        		this.div_installInfo.ed_agencyCd.set_value("");
        		this.div_installInfo.ed_salesGroup.set_value("");
        		this.div_installInfo.ed_salesOffice.set_value("");
        		
        		//[20220721_01] kstka obj.value는 이전값을 가져오기 때문에 e.index로 변경
        		agencyCd_oms = nvl(this.ds_agency.getColumn(e.index, "cdNm"));

        	   
        		//대리점코드, 대리점명,  sales office, sales group
        		this.o2oAgencyInfo(agencyCd_oms);
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.o2oAgencyYn = function(agencyCd){

        	var sSvcID        	= "o2oAgencyYn";                    
        	var sController   	= "/rtms/sd/o2oAgencyYn.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= Ex.util.setParam("agencyCd", agencyCd);
        	var fn_callBack		= "fn_callBack";

        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.o2oAgencyInfo = function(agencyCd){

        	var sSvcID        	= "o2oAgencyInfo";                    
        	var sController   	= "/rtms/sd/o2oAgencyInfo.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= " ds_o2oAgencyInfo=o2oAgencyInfo ";
        	var sArgs 			= Ex.util.setParam("agencyCd", agencyCd);		
        	var fn_callBack		= "fn_callBack";

        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.o2oAgencyTime = function(agencyCd){
        	
        	var sSvcID        	= "o2oAgencyTime";                    
        	var sController   	= "/rtms/sd/o2oAgencyTime.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= " ds_time=o2oAgencyTime ";
        	var sArgs 			= Ex.util.setParam("agencyCd", agencyCd);		
        	    sArgs 			+= Ex.util.setParam("procDay", this.div_installInfo.cal_procDay.value);
        	    sArgs 			+= Ex.util.setParam("cnt", Number(this.ds_rtsd0104.getColumn(0, "cntCd")));
        	    sArgs 			+= Ex.util.setParam("alignmentYn", nvl(this.div_installInfo.rd_alignYn.value));
        	var fn_callBack		= "fn_callBack";

        	this.ds_time.clearData();
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.o2oAgencyStock = function(agencyCd,matCd){

        	var sSvcID        	= "o2oAgencyStock";                    
        	var sController   	= "/rtms/sd/o2oAgencyStock.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= Ex.util.setParam("agencyCd", agencyCd);
        	    sArgs 			+= Ex.util.setParam("matCd", matCd);
        	var fn_callBack		= "fn_callBack";

        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.o2oAgencyStock = function(agencyCd,matCd,fn_callBack){

        	var sSvcID        	= "o2oAgencyStock";                    
        	var sController   	= "/rtms/sd/o2oAgencyStock.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= Ex.util.setParam("agencyCd", agencyCd);
        	    sArgs 			+= Ex.util.setParam("matCd", matCd);

        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.o2oAgencyStock2 = function(agencyCd,matCd,sectionWidth,aspectRatio,wheelInches,petternCd){

        	var sSvcID        	= "o2oAgencyStock2";                    
        	var sController   	= "/rtms/sd/o2oAgencyStock2.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= Ex.util.setParam("agencyCd", agencyCd);
        	    sArgs 			+= Ex.util.setParam("matCd", matCd);
        	    sArgs 			+= Ex.util.setParam("sectionWidth", sectionWidth);
        	    sArgs 			+= Ex.util.setParam("aspectRatio", aspectRatio);
        	    sArgs 			+= Ex.util.setParam("wheelInches", wheelInches);
        	    sArgs 			+= Ex.util.setParam("petternCd", petternCd);
        	var fn_callBack		= "fn_callBack";

        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.o2oAgencyStockTot = function(siNm,sggNm,emdNm,xcoords,ycoords){

        	var cntCd = nvl(this.ds_productInfo.getColumn(this.ds_productInfo.rowposition,"cntCd"));
        	var matCd = nvl(this.ds_productInfo.getColumn(this.ds_productInfo.rowposition,"matCdS"));
        	var o2oYn = this.div_installInfo.ed_o2oYn.value;
        	
        //  거점 대리점 주문일 경우 대체코드로 거점재고 확인
        // 	if(this.userGrp == "05" && o2oYn == "Y"){
        // 		matCd = nvl(this.ds_productInfo.getColumn(this.ds_productInfo.rowposition,"matCdS"));
        // 	}
        	
        	var sSvcID        	= "o2oAgencyStockTot";                    
        	var sController   	= "/rtms/sd/o2oAgencyStockTot.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= Ex.util.setParam("cntCd", Number(cntCd));
        	    sArgs 			+= Ex.util.setParam("matCd", matCd);
        	    sArgs 			+= Ex.util.setParam("siNm", siNm);
        	    sArgs 			+= Ex.util.setParam("sggNm", sggNm);
        	    sArgs 			+= Ex.util.setParam("emdNm", emdNm);
        	    sArgs 			+= Ex.util.setParam("xcoord", xcoords);
        	    sArgs 			+= Ex.util.setParam("ycoord", ycoords);
        	var fn_callBack		= "fn_callBack";

        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_installInfo_rd_baseType_onitemchanged = function(obj,e)
        {
        	this.initTmsInfo();
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_installInfo_rd_timeType_onitemchanged = function(obj,e)
        {
        	this.initTmsInfo();
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.initTmsInfo = function(){
        	
        	var procTm = this.div_installInfo.cb_time.value;
        	
        	//장착시간이 있을경우 초기화
        	if(nvl(procTm) != ""){
        		this.ds_time.clearData();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_o2oCarAreaCheck = function(){

        	var procDay = this.div_installInfo.cal_procDay.value;
        	var siNm = this.div_installInfo.ed_siNm00.value;
        	var sggNm = this.div_installInfo.ed_sggNm00.value;
        	var emdNm = this.div_installInfo.ed_emdNm00.value;
        	
        	var sSvcID        	= "o2oCarAreaCheck";                    
        	var sController   	= "/rtms/sd/o2oCarAreaCheck.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= Ex.util.setParam("procDay", procDay);
        	    sArgs 			+= Ex.util.setParam("siNm", siNm);
        	    sArgs 			+= Ex.util.setParam("sggNm", sggNm);
        	    sArgs 			+= Ex.util.setParam("emdNm", emdNm);
        	var fn_callBack		= "fn_callBack";

        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        this.div_installInfo_rd_alignYn_onclick = function(obj,e)
        {	
        	var o2oYn = nvl(this.div_installInfo.ed_o2oYn.value);
        	var nRow = this.ds_seviceCd.findRowExpr("prsDcd=='B00008'");
        	var servCnt = nvl(this.ds_seviceCd.getColumn(nRow, "servCnt"));
        	var procType = this.div_installInfo.rd_procType.value;
        	
        	if(o2oYn == "N"){
        		this.div_installInfo.rd_alignYn.set_value("N");
        		this.alert("거점만 얼라인먼트 사용여부를 선택 가능합니다.");
        		return;
        	}
        	
        	if(nRow == -1){ //얼라인먼트 서비스가 없는 경우
        		this.div_installInfo.rd_alignYn.set_value("N");
        		this.alert("얼라인먼트 서비스 선택 대상이 아닙니다.1");
        		return;
        	}else{
        		if(servCnt == "0"){ //얼라인먼트 서비스가 있으나 서비스 횟수가 0인경우
        			this.div_installInfo.rd_alignYn.set_value("N");
        			this.alert("얼라인먼트 서비스 선택 대상이 아닙니다.3");
        			return;
        		}
        	}
        }

        this.ds_productInfo_onvaluechanged = function(obj,e)
        {
        	//[20210713_02] TEST 대체규격컬럼이 변경되면
        	if(e.col == 50){
        		if(nvl(e.oldvalue) != ""){
        			this.o2oAgencyStock(application.gds_userInfo.getColumn(0, "agentId"), this.ds_productInfo.getColumn(0, "matCdS"));
        		}
        	}
        }

        this.div_custInfo_btn_niceDnr_onclick = function(obj,e)
        {
        	var args ={p_arg : "RTSDNiceDnr"};
        	Ex.core.popup(this,"차종정보 조회","comm::RTCOMMNiceDnr_pop.xfdl",args, "modaless=false");
        }

        this.returnNiceDnrInfo = function(ds){
        			
        	this.ds_niceDnr.copyData(ds);
        	
        	var sectionWidth = this.ds_niceDnr.getColumn(0, "sectionWidth");
        	var aspectRatio = this.ds_niceDnr.getColumn(0, "aspectRatio");
        	var wheelInches = this.ds_niceDnr.getColumn(0, "wheelInches");
        	var plyRating = this.ds_niceDnr.getColumn(0, "plyRating");
        	var classCd = this.ds_niceDnr.getColumn(0, "classCd");
        	var makerCd = this.ds_niceDnr.getColumn(0, "makerCd");
        	var modelCd = this.ds_niceDnr.getColumn(0, "modelCd");
        	var contentsCd = this.ds_niceDnr.getColumn(0, "contentsCd");
        	var carNo = this.ds_niceDnr.getColumn(0, "carNo");
        	
        	trace(makerCd);
        	trace(modelCd);

        	
        	this.div_carInfo.cb_makerCd.set_value(makerCd);
        	this.div_carInfo.ed_carNo.set_value(carNo);
        	
        	this.div_carInfo_cb_makerCd_onitemchanged();	
        	
        }

        //중복주문여부 확인
        this.isDupOrder = function(){
        			
        	var custNo = this.ds_rtsd0104.getColumn(0, "custNo");
        	var saleNm = this.ds_productInfo.getColumn(0,"saleCd");
        	var periodCd = this.ds_rtsd0104.getColumn(0, "periodCd");
        	var matCd = this.ds_productInfo.getColumn(0,"matCd");
        	var cntCd = this.ds_rtsd0104.getColumn(0, "cntCd");
        	var carNo = this.ds_rtsd0104.getColumn(0, "carNo");
        	
        	var sSvcID        	= "isDupOrder";                    
        	var sController   	= "/rtms/sd/getIsDupOrder.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= Ex.util.setParam("custNo", custNo);
        	    sArgs 			+= Ex.util.setParam("saleNm", saleNm);
        	    sArgs 			+= Ex.util.setParam("matCd", matCd);
        	    sArgs 			+= Ex.util.setParam("cntCd", cntCd);
        	    sArgs 			+= Ex.util.setParam("carNo", carNo);
        	    sArgs 			+= Ex.util.setParam("periodCd", periodCd);
        	    
        	var fn_callBack		= "fn_callBack";

        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);	
        	
        }

        //주문가능여부 체크
        this.div_custInfo_div_custInfoDetail_btn_check_onclick = function(obj,e)
        {
        	var custNo = this.ds_rtsd0100.getColumn(0, "custNo");
        	var chanCd = "02";
        	//[20220905_1] kstka 로그인 그룹이 대리점인경우만 체크
        	console.log("로그인 그룹 : " + this.userGrp);
        	if(this.userGrp == "05"){
        		chanCd = "01";
        	}
        		
        	var sSvcID        	= "beforeOrderConfirm";                    
        	var sController   	= "/rtms/sd/beforeOrderConfirm.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= Ex.util.setParam("custNo", custNo);
        		sArgs 			+= Ex.util.setParam("birth", this.div_custInfo.ed_birthDay.value);
        		sArgs 			+= Ex.util.setParam("chanCd", chanCd);
        		sArgs 			+= Ex.util.setParam("safekey", nvl(this.ds_rtsd0100.getColumn(0, "safekey")));
        	    
        	var fn_callBack		= "fn_callBack";

        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        
        this.div_stockUseChk_ch_stockUseYn_onchanged = function(obj,e)
        {
        	var len = this.div_stockUseChk.components.length;
        	for(var i=0; i<len; i++){
        		var id = this.div_stockUseChk.components[i].id;
        		if(obj.id != id){
        			this.div_stockUseChk.components[i].set_value(false);
        		}
        	}
        }

        //[20230210_1] kstka
        //==================================================================================
        this.btn_refresh_onclick = function(obj,e)
        {
        	var ordNo = this.ed_orderNo.value;
        	if(nvl(ordNo) != ""){
        		this.returnOrderNoInfo(ordNo);
        	}
        }
        //==================================================================================
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.ds_model.addEventHandler("onrowposchanged", this.ds_model_onrowposchanged, this);
            this.ds_productInfo.addEventHandler("onvaluechanged", this.ds_productInfo_onvaluechanged, this);
            this.ds_ValuePrdtInfo.addEventHandler("oncolumnchanged", this.saleMonAmtChg, this);
            this.ds_seviceCd.addEventHandler("oncolumnchanged", this.prmmSvrComboGet, this);
            this.ds_sumPayInfo.addEventHandler("oncolumnchanged", this.setRegiAmt, this);
            this.addEventHandler("onload", this.RTSDContractRegister_onload, this);
            this.div_custInfo.cb_custTp.addEventHandler("onitemchanged", this.div_custInfo_cb_custTp_onitemchanged, this);
            this.div_custInfo.btn_custNew.addEventHandler("onclick", this.div_custInfo_btn_custNew_onclick, this);
            this.div_custInfo.btn_custNoSearch.addEventHandler("onclick", this.div_custInfo_btn_custNoSearch_onclick, this);
            this.div_custInfo.div_custInfoDetail.btn_creditSelect.addEventHandler("onclick", this.div_custInfo_div_custInfoDetail_btn_creditSelect_onclick, this);
            this.div_custInfo.div_custInfoDetail.btn_certification.addEventHandler("onclick", this.div_cust_btn_certificationConfirm_onclick, this);
            this.div_custInfo.div_custInfoDetail.nice_interface.addEventHandler("onusernotify", this.web_onusernotify, this);
            this.div_custInfo.div_custInfoDetail.btn_check.addEventHandler("onclick", this.div_custInfo_div_custInfoDetail_btn_check_onclick, this);
            this.div_custInfo.ed_cTelno.addEventHandler("onkeyup", this.div_cust_ed_cTelno_onkeyup, this);
            this.div_carInfo.cb_makerCd.addEventHandler("onitemchanged", this.div_carInfo_cb_makerCd_onitemchanged, this);
            this.div_carInfo.cb_model.addEventHandler("onitemchanged", this.div_carInfo_cb_model_onitemchanged, this);
            this.div_carInfo.ed_carOwner.addEventHandler("onkeyup", this.div_carInfo_ed_carOwner_onkeyup, this);
            this.div_carInfo.ed_carNo.addEventHandler("onkeyup", this.div_carInfo_ed_carNo_onkeyup, this);
            this.div_carInfo.ed_carNo.addEventHandler("onchanged", this.div_carInfo_ed_carNo_onchanged, this);
            this.div_carInfo.ed_carNo.addEventHandler("onkillfocus", this.div_carInfo_ed_carNo_onkillfocus, this);
            this.div_carInfo.ed_cMileage.addEventHandler("onchanged", this.div_carInfo_ed_cMileage_onchanged, this);
            this.div_carInfo.btn_niceDnr.addEventHandler("onclick", this.div_custInfo_btn_niceDnr_onclick, this);
            this.div_installInfo.btn_visitSchd.addEventHandler("onclick", this.div_installInfo_btn_visitSchd_onclick, this);
            this.div_installInfo.cal_procDay.addEventHandler("onchanged", this.div_installInfo_cal_procDay_onchanged, this);
            this.div_installInfo.rd_procType.addEventHandler("onitemchanged", this.div_installInfo_rd_procType_onitemchanged, this);
            this.div_installInfo.btn_postSearch00.addEventHandler("onclick", this.div_installInfo_btn_postSearch00_onclick, this);
            this.div_installInfo.btn_postSearch01.addEventHandler("onclick", this.div_installInfo_btn_postSearch01_onclick, this);
            this.div_installInfo.ed_detl_addr01.addEventHandler("oneditclick", this.div_installInfo_ed_detl_addr01_oneditclick, this);
            this.div_installInfo.btn_searchAgency.addEventHandler("onclick", this.div_installInfo_btn_searchAgency_onclick, this);
            this.div_installInfo.rd_baseType.addEventHandler("onitemchanged", this.div_installInfo_rd_baseType_onitemchanged, this);
            this.div_installInfo.cb_time.addEventHandler("onitemclick", this.div_installInfo_cb_time_onitemclick, this);
            this.div_installInfo.rd_timeType.addEventHandler("onitemchanged", this.div_installInfo_rd_timeType_onitemchanged, this);
            this.div_installInfo.btn_searchTime.addEventHandler("onclick", this.div_installInfo_btn_searchTime_onclick, this);
            this.div_installInfo.kakao_interface.addEventHandler("onusernotify", this.div_installInfo_kakao_interface_onusernotify, this);
            this.div_installInfo.rd_alignYn.addEventHandler("onitemchanged", this.div_installInfo_rd_alignYn_onclick, this);
            this.div_salesmanInfo.cb_orgAgent.addEventHandler("onitemchanged", this.div_salesmanInfo_cb_orgAgent_onitemchanged, this);
            this.div_salesmanInfo.ed_salesmanTel.addEventHandler("onkeyup", this.div_salesmanInfo_ed_salesmanTel_onkeyup, this);
            this.div_salesmanInfo.ed_1.addEventHandler("onkeyup", this.div_salesmanInfo_ed_salesmanTel_onkeyup, this);
            this.div_salesmanInfo.ed_2.addEventHandler("onkeyup", this.div_salesmanInfo_ed_salesmanTel_onkeyup, this);
            this.div_payInfo.div_card.ed_C_ebirDay.addEventHandler("onchanged", this.div_payInfo_div_card_ed_C_ebirDay_onchanged, this);
            this.div_payInfo.div_card.ed_C_buslNo.addEventHandler("onchanged", this.div_payInfo_div_card_ed_C_buslNo_onchanged, this);
            this.div_payInfo.div_card.ed_C_cardNo.addEventHandler("canchange", this.div_payInfo_div_card_ed_C_cardNo_canchange, this);
            this.div_payInfo.div_card.btn_cardConfirm.addEventHandler("onclick", this.div_payInfo_div_card_btn_cardConfirm_onclick, this);
            this.div_payInfo.cb_payMthd.addEventHandler("onitemchanged", this.div_payInfo_cb_payMthd_onitemchanged, this);
            this.div_payInfo.cb_payCustTp.addEventHandler("onitemchanged", this.div_payInfo_cb_payCustTp_onitemchanged, this);
            this.div_payInfo.btn_payChoice.addEventHandler("onclick", this.div_payInfo_btn_payChoice_onclick, this);
            this.div_payInfo.btn_custNew.addEventHandler("onclick", this.div_payInfo_btn_custNew_onclick, this);
            this.div_payInfo.div_acc.btn_accConfirm.addEventHandler("onclick", this.div_payInfo_div_acc_btn_accConfirm_onclick, this);
            this.div_payInfo.div_acc.ed_B_buslNo.addEventHandler("onchanged", this.div_payInfo_div_acc_ed_B_buslNo_onchanged, this);
            this.div_payInfo.div_acc.ed_B_ebirDay.addEventHandler("onchanged", this.div_payInfo_div_acc_ed_B_ebirDay_onchanged, this);
            this.div_payInfo.div_acc.btn_arsCall.addEventHandler("onclick", this.div_payInfo_div_acc_btn_accConfirm_onclick, this);
            this.btn_orderNoSearch.addEventHandler("onclick", this.btn_orderNoSearch_onclick, this);
            this.btnGrpContSearch.addEventHandler("onclick", this.btnGrpContSearch_onclick, this);
            this.btn_SalePrdtSearch.addEventHandler("onclick", this.btn_SalePrdtSearch_onclick, this);
            this.btnAddPrdt.addEventHandler("onclick", this.btnAddPrdt_onclick, this);
            this.btnAddPrdtDel.addEventHandler("onclick", this.btnAddPrdtDel_onclick, this);
            this.btnValuePrdtAdd.addEventHandler("onclick", this.btnValuePrdtAdd_onclick, this);
            this.btnValuePrdtDel.addEventHandler("onclick", this.btnValuePrdtDel_onclick, this);
            this.Grid02.addEventHandler("oncellclick", this.prmmSvrComboSet, this);
            this.Grid04.addEventHandler("oncellclick", this.grdRegiChg, this);
            this.btn_payRegiAmt.addEventHandler("onclick", this.btn_payRegiAmt_onclick, this);
            this.btn_GrpSave.addEventHandler("onclick", this.btn_GrpSave_onclick, this);
            this.ra_sale.addEventHandler("onitemchanged", this.ra_sale_onitemchanged, this);
            this.div_stockUseChk.ch_chainYn.addEventHandler("onchanged", this.div_stockUseChk_ch_stockUseYn_onchanged, this);
            this.div_stockUseChk.ch_winterYn.addEventHandler("onchanged", this.div_stockUseChk_ch_stockUseYn_onchanged, this);
            this.btn_refresh.addEventHandler("onclick", this.btn_refresh_onclick, this);

        };

        this.loadIncludeScript("RTSDContractRegister.xfdl");

       
    };
}
)();
