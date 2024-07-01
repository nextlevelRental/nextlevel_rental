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
                this._setFormPosition(0,0,1147,637);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_custTp", this);
            obj.set_firefirstcount("0");
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

            obj = new Dataset("ds_payMthd", this);
            obj.set_firefirstcount("0");
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
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"ordDay\" type=\"STRING\" size=\"256\"/><Column id=\"ordId\" type=\"STRING\" size=\"256\"/><Column id=\"chanCd\" type=\"STRING\" size=\"256\"/><Column id=\"saleId\" type=\"STRING\" size=\"256\"/><Column id=\"periodCd\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"regiCd\" type=\"STRING\" size=\"256\"/><Column id=\"campYn\" type=\"STRING\" size=\"256\"/><Column id=\"cDcrate\" type=\"STRING\" size=\"256\"/><Column id=\"cDcamt\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custTp\" type=\"STRING\" size=\"256\"/><Column id=\"safekey\" type=\"STRING\" size=\"256\"/><Column id=\"grpYn\" type=\"STRING\" size=\"256\"/><Column id=\"grpNo\" type=\"STRING\" size=\"256\"/><Column id=\"gDcrate\" type=\"STRING\" size=\"256\"/><Column id=\"gDcamt\" type=\"STRING\" size=\"256\"/><Column id=\"lDcrate\" type=\"STRING\" size=\"256\"/><Column id=\"lDcamt\" type=\"STRING\" size=\"256\"/><Column id=\"fDcrate\" type=\"STRING\" size=\"256\"/><Column id=\"fDcamt\" type=\"STRING\" size=\"256\"/><Column id=\"bordNo\" type=\"STRING\" size=\"256\"/><Column id=\"statCd\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"cancDay\" type=\"STRING\" size=\"256\"/><Column id=\"agencyCd\" type=\"STRING\" size=\"256\"/><Column id=\"salesGroup\" type=\"STRING\" size=\"256\"/><Column id=\"salesOffice\" type=\"STRING\" size=\"256\"/><Column id=\"engNm\" type=\"STRING\" size=\"256\"/><Column id=\"agDesc\" type=\"STRING\" size=\"256\"/><Column id=\"makerCd\" type=\"STRING\" size=\"256\"/><Column id=\"modelCd\" type=\"STRING\" size=\"256\"/><Column id=\"contentsCd\" type=\"STRING\" size=\"256\"/><Column id=\"frCd\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"carOwner\" type=\"STRING\" size=\"256\"/><Column id=\"cMileage\" type=\"STRING\" size=\"256\"/><Column id=\"reqText\" type=\"STRING\" size=\"256\"/><Column id=\"payMthd\" type=\"STRING\" size=\"256\"/><Column id=\"payDd\" type=\"STRING\" size=\"256\"/><Column id=\"accSeq\" type=\"STRING\" size=\"256\"/><Column id=\"crdSeq\" type=\"STRING\" size=\"256\"/><Column id=\"accChk\" type=\"STRING\" size=\"256\"/><Column id=\"accStat\" type=\"STRING\" size=\"256\"/><Column id=\"bkeyChk\" type=\"STRING\" size=\"256\"/><Column id=\"batchKey\" type=\"STRING\" size=\"256\"/><Column id=\"billYn\" type=\"STRING\" size=\"256\"/><Column id=\"crdtStat\" type=\"STRING\" size=\"256\"/><Column id=\"certCd\" type=\"STRING\" size=\"256\"/><Column id=\"certStat\" type=\"STRING\" size=\"256\"/><Column id=\"ordAgent\" type=\"STRING\" size=\"256\"/><Column id=\"orgCd\" type=\"STRING\" size=\"256\"/><Column id=\"orgHq\" type=\"STRING\" size=\"256\"/><Column id=\"orgL1\" type=\"STRING\" size=\"256\"/><Column id=\"orgL2\" type=\"STRING\" size=\"256\"/><Column id=\"orgL3\" type=\"STRING\" size=\"256\"/><Column id=\"orgL4\" type=\"STRING\" size=\"256\"/><Column id=\"insOrg\" type=\"STRING\" size=\"256\"/><Column id=\"psCd\" type=\"STRING\" size=\"256\"/><Column id=\"cmsagYn\" type=\"STRING\" size=\"256\"/><Column id=\"conMthd\" type=\"STRING\" size=\"256\"/><Column id=\"pcertYn\" type=\"STRING\" size=\"256\"/><Column id=\"tcgrpNo\" type=\"STRING\" size=\"256\"/><Column id=\"vbeln\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/><Column id=\"agencyNm\" type=\"STRING\" size=\"256\"/><Column id=\"fcDay\" type=\"STRING\" size=\"256\"/><Column id=\"agDay\" type=\"STRING\" size=\"256\"/><Column id=\"agSeq\" type=\"STRING\" size=\"256\"/><Column id=\"inputDt\" type=\"STRING\" size=\"256\"/><Column id=\"filePath\" type=\"STRING\" size=\"256\"/><Column id=\"fileName\" type=\"STRING\" size=\"256\"/><Column id=\"seasonCd\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_rtsd0106", this);
            obj.set_firefirstcount("0");
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
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/><Column id=\"tel\" type=\"STRING\" size=\"256\"/><Column id=\"chanCd\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_rtsd0113Combo", this);
            obj.set_firefirstcount("0");
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


            
            // UI Components Initialize
            obj = new Div("div_custInfo", "absolute", "0", "40", "681", "244", null, null, this);
            obj.set_taborder("3");
            obj.style.set_background("@gradation");
            obj.set_scrollbars("none");
            this.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "-1", "60", "682", "31", null, null, this.div_custInfo);
            obj.set_taborder("167");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "-1", "90", "682", "31", null, null, this.div_custInfo);
            obj.set_taborder("188");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_custInfo.addChild(obj.name, obj);
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
            obj = new Div("div_custInfoDetail", "absolute", "0", "120", "681", "124", null, null, this.div_custInfo);
            obj.set_taborder("193");
            obj.style.set_background("@gradation");
            this.div_custInfo.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "0", "90", "681", "31", null, null, this.div_custInfo.div_custInfoDetail);
            obj.set_taborder("68");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_custInfo.div_custInfoDetail.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "-1", "60", "682", "31", null, null, this.div_custInfo.div_custInfoDetail);
            obj.set_taborder("63");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_custInfo.div_custInfoDetail.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "-1", "30", "682", "31", null, null, this.div_custInfo.div_custInfoDetail);
            obj.set_taborder("58");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_custInfo.div_custInfoDetail.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "-1", "0", "682", "31", null, null, this.div_custInfo.div_custInfoDetail);
            obj.set_taborder("51");
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
            obj = new Edit("ed_addr12", "absolute", "336", "65", "340", "21", null, null, this.div_custInfo.div_custInfoDetail);
            obj.set_taborder("65");
            obj.set_maxlength("100");
            obj.set_enable("false");
            this.div_custInfo.div_custInfoDetail.addChild(obj.name, obj);
            obj = new Static("st_addr2", "absolute", "232", "60", "100", "31", null, null, this.div_custInfo.div_custInfoDetail);
            obj.set_taborder("64");
            obj.set_text("주소");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
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

            obj = new Div("div_carInfo", "absolute", "700", "22", "422", "140", null, null, this);
            obj.set_taborder("5");
            obj.style.set_background("@gradation");
            obj.set_scrollbars("none");
            obj.set_enable("false");
            obj.set_visible("true");
            this.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "0", "46", "422", "31", null, null, this.div_carInfo);
            obj.set_taborder("17");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_carInfo.addChild(obj.name, obj);
            obj = new Static("st_model", "absolute", "0", "46", "100", "31", null, null, this.div_carInfo);
            obj.set_taborder("18");
            obj.set_text("차종");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_carInfo.addChild(obj.name, obj);
            obj = new Combo("cb_makerCd", "absolute", "104", "51", "107", "21", null, null, this.div_carInfo);
            this.div_carInfo.addChild(obj.name, obj);
            obj.set_taborder("19");
            obj.set_displaynulltext("브랜드");
            obj.set_innerdataset("@ds_maker");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new Combo("cb_model", "absolute", "215", "51", "202", "21", null, null, this.div_carInfo);
            this.div_carInfo.addChild(obj.name, obj);
            obj.set_taborder("20");
            obj.set_displaynulltext("모델");
            obj.set_innerdataset("@ds_model");
            obj.set_codecolumn("rn");
            obj.set_datacolumn("mcNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new Static("Static00", "absolute", "0", "76", "422", "31", null, null, this.div_carInfo);
            obj.set_taborder("21");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_carInfo.addChild(obj.name, obj);
            obj = new Static("st_carOwner", "absolute", "0", "76", "100", "31", null, null, this.div_carInfo);
            obj.set_taborder("22");
            obj.set_text("차량소유자");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_carInfo.addChild(obj.name, obj);
            obj = new Edit("ed_carOwner", "absolute", "104", "81", "107", "21", null, null, this.div_carInfo);
            obj.set_taborder("23");
            obj.set_maxlength("60");
            this.div_carInfo.addChild(obj.name, obj);
            obj = new Edit("ed_carNo", "absolute", "299", "81", "118", "21", null, null, this.div_carInfo);
            obj.set_taborder("24");
            obj.set_maxlength("9");
            this.div_carInfo.addChild(obj.name, obj);
            obj = new Static("st_carNo", "absolute", "215", "76", "80", "31", null, null, this.div_carInfo);
            obj.set_taborder("25");
            obj.set_text("차량No");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_carInfo.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "0", "106", "422", "31", null, null, this.div_carInfo);
            obj.set_taborder("26");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_carInfo.addChild(obj.name, obj);
            obj = new Static("st_cMileage", "absolute", "0", "106", "100", "31", null, null, this.div_carInfo);
            obj.set_taborder("27");
            obj.set_text("현재주행거리");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_carInfo.addChild(obj.name, obj);
            obj = new MaskEdit("ed_cMileage", "absolute", "104", "111", "107", "21", null, null, this.div_carInfo);
            obj.set_taborder("28");
            obj.set_mask("###,###,###,##0");
            obj.set_autoselect("true");
            obj.set_autoskip("true");
            obj.set_limitbymask("both");
            this.div_carInfo.addChild(obj.name, obj);
            obj = new Edit("ed_model", "absolute", "103", "21", "120", "21", null, null, this.div_carInfo);
            obj.set_taborder("30");
            obj.set_maxlength("9");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_carInfo.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "0", "21", "80", "21", null, null, this.div_carInfo);
            obj.set_taborder("31");
            obj.set_text("차량정보");
            obj.set_cssclass("sta_WF_subTitle");
            this.div_carInfo.addChild(obj.name, obj);
            obj = new Static("st_cMileage2", "absolute", "218", "114", "25", "20", null, null, this.div_carInfo);
            obj.set_taborder("32");
            obj.set_text("Km");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_carInfo.addChild(obj.name, obj);

            obj = new Div("div_productInfo", "absolute", "0", "298", "1122", "110", null, null, this);
            obj.set_taborder("6");
            obj.style.set_background("@gradation");
            obj.set_scrollbars("none");
            obj.set_visible("true");
            obj.set_enable("false");
            this.addChild(obj.name, obj);
            obj = new Grid("grid_price", "absolute", "0", "22", "1122", "80", null, null, this.div_productInfo);
            obj.set_taborder("16");
            obj.set_binddataset("ds_price");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"120\"/><Column size=\"250\"/><Column size=\"80\"/><Column size=\"60\"/><Column size=\"0\"/><Column size=\"100\"/><Column size=\"410\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell/><Cell col=\"1\" text=\"상품코드\"/><Cell col=\"2\" text=\"상품명\"/><Cell col=\"3\" text=\"계절구분\"/><Cell col=\"4\" text=\"본수\"/><Cell col=\"5\" text=\"렌탈등록비\"/><Cell col=\"6\" text=\"최종렌탈료\"/><Cell col=\"7\" text=\"비고\"/><Cell col=\"8\" text=\"월렌탈료조견표\"/><Cell col=\"9\" text=\"캠페인할인금액\"/><Cell col=\"10\" text=\"캠페인적용여부\"/><Cell col=\"11\" text=\"결합할인율\"/><Cell col=\"12\" text=\"결합할인액\"/><Cell col=\"13\" text=\"제한할인율\"/><Cell col=\"14\" text=\"제한할인액\"/><Cell col=\"15\" text=\"최종할인액\"/></Band><Band id=\"body\"><Cell displaytype=\"button\" edittype=\"button\" text=\"선택\"/><Cell col=\"1\" text=\"bind:matCd\"/><Cell col=\"2\" text=\"bind:matNm\"/><Cell col=\"3\" text=\"bind:seasonNm\"/><Cell col=\"4\" text=\"bind:ordQty\"/><Cell col=\"5\" text=\"bind:regiAmt\"/><Cell col=\"6\" displaytype=\"number\" style=\"align:right;\" text=\"bind:monAmt\" mask=\"###,###,###,##0\"/><Cell col=\"7\" displaytype=\"text\" edittype=\"text\" text=\"bind:matDesc\"/><Cell col=\"8\" displaytype=\"number\" style=\"align:right;\" text=\"bind:rentAmt\" mask=\"###,###,###,##0\"/><Cell col=\"9\" displaytype=\"number\" style=\"align:right;\" text=\"bind:cDcamt\" mask=\"###,###,###,##0\"/><Cell col=\"10\" text=\"bind:campYn\"/><Cell col=\"11\" displaytype=\"number\" style=\"align:right;\" text=\"bind:gDcrate\" mask=\"###,###,###,##0\"/><Cell col=\"12\" displaytype=\"number\" style=\"align:right;\" text=\"bind:gDcamt\" mask=\"###,###,###,##0\"/><Cell col=\"13\" style=\"align:right;\" text=\"bind:lDcrate\"/><Cell col=\"14\" displaytype=\"number\" style=\"align:right;\" text=\"bind:lDcamt\" mask=\"###,###,###,##0\"/><Cell col=\"15\" displaytype=\"number\" style=\"align:right;\" text=\"bind:fDcamt\" mask=\"###,###,###,##0\"/></Band></Format></Formats>");
            this.div_productInfo.addChild(obj.name, obj);
            obj = new Static("Static21", "absolute", "0", "-4", "120", "21", null, null, this.div_productInfo);
            obj.set_taborder("19");
            obj.set_text("상품-가격정보");
            obj.set_cssclass("sta_WF_subTitle");
            this.div_productInfo.addChild(obj.name, obj);

            obj = new Div("div_installInfo", "absolute", "0", "411", "680", "120", null, null, this);
            obj.set_taborder("7");
            obj.style.set_background("@gradation");
            obj.set_scrollbars("none");
            obj.set_enableevent("true");
            obj.set_enable("false");
            this.addChild(obj.name, obj);
            obj = new Div("Div00", "absolute", "-83.1%", "253", null, "150", "149.91%", null, this.div_installInfo);
            obj.set_taborder("1");
            obj.set_text("Div00");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "0", "22", "680", "31", null, null, this.div_installInfo);
            obj.set_taborder("6");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Static("st_agencyCd", "absolute", "0", "22", "80", "31", null, null, this.div_installInfo);
            obj.set_taborder("7");
            obj.set_text("장착점명");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Edit("ed_agencyCd", "absolute", "104", "3", "125", "21", null, null, this.div_installInfo);
            obj.set_taborder("8");
            obj.set_maxlength("80");
            obj.set_enable("false");
            obj.set_visible("false");
            obj.set_displaynulltext("장착대리점코드");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Static("Static21", "absolute", "0", "0", "120", "21", null, null, this.div_installInfo);
            obj.set_taborder("10");
            obj.set_text("장착점정보");
            obj.set_cssclass("sta_WF_subTitle");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Edit("ed_agencyNm", "absolute", "85", "27", "320", "21", null, null, this.div_installInfo);
            obj.set_taborder("0");
            obj.set_maxlength("80");
            obj.set_enable("false");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Static("st_procDay", "absolute", "458", "22", "80", "31", null, null, this.div_installInfo);
            obj.set_taborder("12");
            obj.set_text("장착일자");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Calendar("cal_procDay", "absolute", "543", "27", "116", "21", null, null, this.div_installInfo);
            this.div_installInfo.addChild(obj.name, obj);
            obj.set_taborder("3");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Button("btn_searchAgency", "absolute", "413", "27", "41", "21", null, null, this.div_installInfo);
            obj.set_taborder("2");
            obj.set_text("대리점");
            obj.getSetter("domainId").set("nexa.save");
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
            obj = new Edit("ed_posCd", "absolute", "72", "51", "125", "21", null, null, this.div_installInfo);
            obj.set_taborder("16");
            obj.set_displaynulltext("우편번호");
            obj.set_maxlength("80");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Edit("ed_city", "absolute", "194", "51", "125", "21", null, null, this.div_installInfo);
            obj.set_taborder("17");
            obj.set_displaynulltext("주소");
            obj.set_maxlength("80");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Edit("ed_street", "absolute", "320", "51", "125", "21", null, null, this.div_installInfo);
            obj.set_taborder("18");
            obj.set_displaynulltext("상세주소");
            obj.set_maxlength("80");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_installInfo.addChild(obj.name, obj);
            obj = new Edit("ed_telNo", "absolute", "453", "51", "125", "21", null, null, this.div_installInfo);
            obj.set_taborder("19");
            obj.set_displaynulltext("전화번호");
            obj.set_maxlength("80");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_installInfo.addChild(obj.name, obj);

            obj = new Div("div_salesmanInfo", "absolute", "0", "571", "1122", "70", null, null, this);
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
            obj = new Static("st_salesmanTel", "absolute", "279", "25", "140", "31", null, null, this.div_salesmanInfo);
            obj.set_taborder("91");
            obj.set_text("전화번호");
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

            obj = new Div("div_etcInfo", "absolute", "0", "475", "680", "101", null, null, this);
            obj.set_taborder("9");
            obj.style.set_background("@gradation");
            obj.set_scrollbars("none");
            obj.set_enableevent("true");
            obj.set_enable("false");
            this.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "0", "27", "678", "31", null, null, this.div_etcInfo);
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
            obj = new Static("st_agreeYn3", "absolute", "319", "27", "140", "31", null, null, this.div_etcInfo);
            obj.set_taborder("69");
            obj.set_text("신분증 첨부 필수여부");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_etcInfo.addChild(obj.name, obj);
            obj = new CheckBox("ch_pcertYn", "absolute", "465", "32", "50", "20", null, null, this.div_etcInfo);
            obj.set_taborder("70");
            this.div_etcInfo.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "0", "57", "678", "31", null, null, this.div_etcInfo);
            obj.set_taborder("71");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_etcInfo.addChild(obj.name, obj);
            obj = new Static("st_agreeYn2", "absolute", "0", "57", "140", "31", null, null, this.div_etcInfo);
            obj.set_taborder("74");
            obj.set_text("계약서 교부방법");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_etcInfo.addChild(obj.name, obj);
            obj = new Combo("cb_conMthd", "absolute", "145", "62", "123", "21", null, null, this.div_etcInfo);
            this.div_etcInfo.addChild(obj.name, obj);
            obj.set_taborder("76");
            obj.set_displaynulltext("선택");
            obj.set_innerdataset("@ds_conMthd");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_enable("false");
            obj.getSetter("domainId").set("nexa.name;nexa.code");

            obj = new Div("div_preminum", "absolute", "693", "411", "429", "170", null, null, this);
            obj.set_taborder("20");
            obj.style.set_background("@gradation");
            obj.set_scrollbars("none");
            obj.set_enable("false");
            this.addChild(obj.name, obj);
            obj = new Button("btn_preminum", "absolute", "359", "0", "70", "20", null, null, this.div_preminum);
            obj.set_taborder("66");
            obj.set_text("조회");
            obj.set_cssclass("btn_WF_CRUD");
            obj.getSetter("domainId").set("nexa.save");
            obj.set_visible("false");
            this.div_preminum.addChild(obj.name, obj);
            obj = new Grid("grid_preminum", "absolute", "0", "22", "429", "132", null, null, this.div_preminum);
            obj.set_taborder("67");
            obj.set_binddataset("ds_rtsd0013");
            obj.set_autosizebandtype("body");
            obj.set_autofittype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"131\"/><Column size=\"175\"/><Column size=\"110\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"프리미엄서비스\"/><Cell col=\"1\" text=\"상세서비스\"/><Cell col=\"2\" text=\"서비스횟수\"/></Band><Band id=\"body\"><Cell text=\"bind:psNm\"/><Cell col=\"1\" text=\"bind:prsNm\"/><Cell col=\"2\" text=\"bind:servCnt0\"/></Band></Format></Formats>");
            this.div_preminum.addChild(obj.name, obj);
            obj = new Static("Static21", "absolute", "0", "0", "120", "21", null, null, this.div_preminum);
            obj.set_taborder("68");
            obj.set_text("프리미엄서비스");
            obj.set_cssclass("sta_WF_subTitle");
            this.div_preminum.addChild(obj.name, obj);
            obj = new Static("st_searchRdDngNm2", "absolute", null, "3", "220", "20", "0", null, this.div_preminum);
            obj.set_taborder("69");
            obj.set_text("(※엔진오일교환은 장착 3개월 후 가능)");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_preminum.addChild(obj.name, obj);

            obj = new Grid("grid_model", "absolute", "-1", "640", "679", "62", null, null, this);
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

            obj = new Static("Static00", "absolute", "1122", "0", "25", "636", null, null, this);
            obj.set_taborder("41");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
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


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 681, 124, this.div_custInfo.div_custInfoDetail,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("193");
            		p.style.set_background("@gradation");

            	}
            );
            this.div_custInfo.div_custInfoDetail.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 681, 244, this.div_custInfo,
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
            obj = new Layout("default", "", 1122, 110, this.div_productInfo,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("6");
            		p.style.set_background("@gradation");
            		p.set_scrollbars("none");
            		p.set_visible("true");
            		p.set_enable("false");

            	}
            );
            this.div_productInfo.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 680, 120, this.div_installInfo,
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
            obj = new Layout("default", "", 680, 101, this.div_etcInfo,
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
            obj = new Layout("default", "", 429, 170, this.div_preminum,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("20");
            		p.style.set_background("@gradation");
            		p.set_scrollbars("none");
            		p.set_enable("false");

            	}
            );
            this.div_preminum.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1147, 637, this,
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

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTSDB2BContractRegister.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDB2BContractRegister.xfdl", function() {
        /***************************************************************************************************
         * 파 일 명 : RTSDContractRegister.xfdl
         * 설    명 : 주문등록
         * 작 성 자 :
         * 변경이력 :
         * 변경일자		변경자		변경내용
         * ----------	------		--------
         * ...			...			...
         * 2016-09-26	임욱재		온라인장착 가능여부 추가
         ***************************************************************************************************/

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //include "lib::comLib.xjs";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.p_arg 			= "RTSDB2BContractRegister";
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
        this.selectChanCd	= "XX";

        this.userGrp 		= application.gds_userInfo.getColumn(0,"userGrp");	//사용자 그룹 		--> *01:영업관리자, *02:콜센터, *03:지사, *04:지점, *05:대리점, *13:콜센터(아웃바운드)
        this.userId  		= application.gds_userInfo.getColumn(0,"userId");	
        this.onlineLoginId	= "ONL_SYS";
        this.certificationFlag	= false;
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        /*★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ */
        //공통 fn_callBack START
        /*★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ */
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg){
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
        	}
        	if(strSvcId == "sRtsd0113UserGrp"){
        		this.ds_rtsd0113.filter("chanCd=='09'");
        		var rtsd0113Cnt = this.ds_rtsd0113.getRowCount();
        		var regId 		= this.ds_rtsd0100.getColumn(0,"regId");
        		var custTp 		= this.ds_rtsd0100.getColumn(0,"custTp");
        		if( rtsd0113Cnt != 0 ){
        			//[20161206_02]
        			if( (this.userGrp == "02") || (this.userGrp == "09") || (this.userGrp == "13") || (this.userGrp == "01" && regId != this.onlineLoginId && custTp == "02" ) ){
        				for( var i = 0 ; i < rtsd0113Cnt ; i++ ){
        					var cd   = this.ds_rtsd0113.getColumn(i, "cd");
        					var cdNm = this.ds_rtsd0113.getColumn(i, "cdNm");
        					var nRow = this.ds_rtsd0113Combo.addRow();
        					this.ds_rtsd0113Combo.setColumn(nRow, "cd", cd);
        					this.ds_rtsd0113Combo.setColumn(nRow, "cdNm", cdNm);
        				}
        				
        				if( this.userGrp == "09" ){
        					var findRow = this.ds_rtsd0113Combo.findRow( "cd", this.userId );
        					if(	findRow != -1 ){
        						this.div_salesmanInfo.cb_orgAgent.set_value(this.userId);
        						this.div_salesmanInfo.cb_orgAgent.set_enable(false);
        					}else{
        						alert("판매불가한 판매원입니다.");
        						return this.go("sd::RTSDB2BContractRegister.xfdl");
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
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        	/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        	if(strSvcId == "selectFirstDay"){
        		
        	}
        	/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        	if(strSvcId == "listRtsd0104"){
        		var rtsd0104Cnt = this.ds_rtsd0104.getRowCount();
        		if( rtsd0104Cnt != 0 ){
        			this.p_makerCd 		= nvl(this.ds_rtsd0104.getColumn(0,"makerCd"));
        			this.p_modelCd 		= nvl(this.ds_rtsd0104.getColumn(0,"modelCd"));
        			this.p_contentsCd 	= nvl(this.ds_rtsd0104.getColumn(0,"contentsCd"));
        			this.p_frCd 		= nvl(this.ds_rtsd0104.getColumn(0,"frCd"));
        			this.div_carInfo_cb_makerCd_onitemchanged();
        			
        			this.ds_rtsd0104.getColumn(0,"pcertYn") == "Y" ?  this.div_etcInfo.ch_pcertYn.set_value(true) : this.div_etcInfo.ch_pcertYn.set_value(false);
        			
        			this.div_salesmanInfo_cb_orgAgent_onitemchanged();
        			
        			this.FN_listRtsd0106();
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

        		this.FN_divChangeTrue();
        	}		
        	/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        	if(strSvcId == "listRtsd0106"){
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
        	}
        	/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        	if(strSvcId == "listCustInfo"){
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
        	}
        	/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        	if(strSvcId == "selectRtsd0108SaleCdCount"){
        		if( nvl(this.selectSaleCd) != 0 ){
        			this.ra_sale.set_value("02");
        		}else{
        			this.ra_sale.set_value("01");
        		}
        	}
        	/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        	if(strSvcId == "listRateAmt"){
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
        	}
        	/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        	if(strSvcId == "preminumList"){
        		var cnt = this.ds_rtsd0013.getRowCount();
        		if( cnt != 0 ){
        			for( var i = 0 ; i < this.ds_rtsd0013.getRowCount() ; i++){
        				this.ds_rtsd0013.setColumn(i, "servCnt0", this.ds_rtsd0013.getColumn(i, "servVnt"));
        				this.ds_rtsd0013.setColumn(i, "servCntr", this.ds_rtsd0013.getColumn(i, "servVnt"));
        			}
        		}else{
        			
        		}
        	}
        	/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        	if (strSvcId == "saveContractRegister"){
        		if(nErrorCode == "-2"){
        			alert(strErrorMsg);
        		}else if( nErrorCode == "0" && this.resultOrdNo != "0" ){
        			if( confirm( strErrorMsg +"\n저장된 계약번호는 \'"+this.resultOrdNo+"\' 입니다." + "\n저장된 계약번호로 조회하시겠습니까?") ){
        				this.accCardCheck   = false;
        				this.FN_listRtsd0104( this.resultOrdNo );
        			}else{
        				this.reload();
        			}
        		}else{
        			alert(strErrorMsg);
        		}
        	}
        	/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        	if(strSvcId == "sRtsd0104ChanCd"){
        		if( (nvl(this.selectChanCd) == "XX") || (nvl(this.selectChanCd) == "") ){
        			alert("채널구분 정보 오류입니다. 영업관리팀 문의바랍니다.");
        			return false;
        		}else{
        			var nRow0104 = this.ds_rtsd0104.rowposition;
        			this.ds_rtsd0104.setColumn( nRow0104, "chanCd", nvl(this.selectChanCd));	
        			this.FN_goSave();
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
        	this.parent.setButton("C|N", this);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //UserFunction : 상품-가격정보 변경 및 SELECT BOX DATA SELECT
        this.fn_init = function(){
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
        	sOutDatasets += " ds_maker=mapDsMaker ";
        	sOutDatasets += " ds_nagYn=mapDsNagYn ";
        	sOutDatasets += " ds_credit=mapDsCredit ";
        	sOutDatasets += " ds_conMthd=mapDsConMthd ";
        	sOutDatasets += " ds_sale=maptDsSale ";
        	//sOutDatasets += " ds_orgAgent=maptDsSalesman ";
        	//sOutDatasets += " ds_orgAgent2=maptDsSalesman2 ";
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
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
        		this.ds_rtsd0106.addRow();
        		this.ds_price.addRow();
        		this.ds_rtsd0104.setColumn(contactRow,"carOwner",ds[0].getColumn(0, "custNm"));
        		this.div_custInfo_cb_custTp_onitemchanged();//고객유형 CHANCE EVENT
        		this.FN_telNoChange();
        		this.fn_initSetValue();
        		this.FN_listCustInfo( ds[0].getColumn(0, "custNo") );
        		
        		var regId   = nvl( ds[0].getColumn(0,"regId")  );
        		var custTp  = nvl( ds[0].getColumn(0,"custTp") );
        		
        		this.FN_divChangeTrue();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //USER FUNCTION : DATA SET CLEAR
        this.FN_initializationDataSet = function(){
        	this.ds_rtsd0100.clearData();
        	this.ds_rtsd0110.clearData();
        	this.ds_rtsd0111.clearData();
        	this.ds_rtsd0104.clearData();
        	this.ds_rtsd0106.clearData();
        	this.ds_price.clearData();
        	this.ds_rateAmt.clearData();
        	this.ds_rtsd0013.clearData();
        	this.ds_rtsd0014.clearData();
        	this.dsNice.clearData();
        	this.dsNice2.clearData();

        	this.div_carInfo.cb_model.set_index(-1);
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
        	}else{
        		this.div_installInfo.btn_searchAgency.set_visible(true);
        		this.div_installInfo.ed_agencyNm.set_width(320);
        	}
        	
        	var regId 	= this.ds_rtsd0100.getColumn(0,"regId");
        	var custTp 	= this.ds_rtsd0100.getColumn(0,"custTp");
        	// [20161206_02]
        	if( (this.userGrp == "02") || (this.userGrp == "09") || (this.userGrp == "13") ||(this.userGrp == "01" && regId != this.onlineLoginId && custTp == "02" ) ){
        		this.div_installInfo.cal_procDay.set_value( this.addDay );
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
        	this.div_carInfo.set_enable(true);
        	this.div_productInfo.set_enable(true);
        	this.div_installInfo.set_enable(true);
        	this.div_preminum.set_enable(true);

        	var regId   = nvl( this.ds_rtsd0100.getColumn(0,"regId")  );
        	var custTp  = nvl( this.ds_rtsd0100.getColumn(0,"custTp") );

        	// [20161206_02]
        	if( (this.userGrp == "02") || (this.userGrp == "09") || (this.userGrp == "13") || (this.userGrp == "01" && regId != this.onlineLoginId && custTp == "02") ){
        		this.div_salesmanInfo.set_enable(true);//판매원정보
        		this.FN_rtsd0113UserGrp();
        	}
        	
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
        	this.div_carInfo.set_enable(false);
        	this.div_productInfo.set_enable(false);
        	this.div_installInfo.set_enable(false);
        	this.div_preminum.set_enable(false);
        	
        	var regId   = nvl( this.ds_rtsd0100.getColumn(0,"regId")  );
        	var custTp  = nvl( this.ds_rtsd0100.getColumn(0,"custTp") );
        	
        	// [20161206_02]
        	if( (this.userGrp == "02") || (this.userGrp == "13") || (this.userGrp == "01" && regId != "ONL_SYS" && custTp == "02") ){
        		this.div_salesmanInfo.set_enable(false);
        	}
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
        	this.div_custInfo.st_cCustnm.set_visible(false);
        	this.div_custInfo.ed_Ccustnm.set_visible(false);
        	this.div_custInfo.st_cTelno.set_visible(false);
        	this.div_custInfo.ed_cTelno.set_visible(false);
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
        	this.div_custInfo.st_cCustnm.set_visible(true);
        	this.div_custInfo.ed_Ccustnm.set_visible(true);
        	this.div_custInfo.st_cTelno.set_visible(true);
        	this.div_custInfo.ed_cTelno.set_visible(true);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //BUTTON EVENT
        this.btn_orderNoSearch_onclick = function(obj,e){
        	var args ={ p_arg : this.p_arg };
        	Ex.core.popup(this,"계약번호 조회","comm::RTCOMMOrderNo_pop.xfdl",args, "modaless=false");	
        }
        this.returnOrderNoInfo = function(ordNo){
        	//this.FN_divChangeFalse();
        	this.FN_listRtsd0104(ordNo);
        	
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
        	sArgs += Ex.util.setParam("ordNo", 	ordNo);
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);		
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //USER FUNCTION : 계약상품 SELECT
        this.FN_listRtsd0106 = function(ordNo){
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
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        /*★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ */
        //고객정보 END
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
        	this.ds_model.set_rowposition(nRow);
        	this.FN_priceDeleteAll();
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //USER FUNCTION : DATASET CLEAR
        this.FN_priceDeleteAll = function(){
        	this.ds_price.clearData();
        	this.ds_price.addRow();
        	this.ds_rtsd0013.clearData();
        	this.ds_rtsd0014.clearData();
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
        	if(this.carNoCheck()){
        	//	this.selectRtsd0108SaleCdCount();
        	}
        	this.FN_priceDeleteAll();
        }

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //DATASET FUNCTION : ROWPOSITION이 변경되었을때
        this.ds_model_onrowposchanged = function(obj,e){
        	this.div_carInfo.ed_model.set_value( this.ds_model.getColumn(this.ds_model.rowposition,"modelCd") );
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
        this.div_productInfo_grid_price_oncellclick = function(obj,e){
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
        			Ex.core.popup(this,"상품 및 가격 조회","comm::RTCOMMB2BProductAndPrice_pop.xfdl",arr, "modaless=false");
        		}
        	}
        }
        this.returnProPriInfo = function(ds){
        	if(ds[0].rowcount > 0) {
        		this.ds_price.clearData();
        		this.ds_rtsd0013.clearData();
        		this.ds_rtsd0014.clearData();
        		this.ds_price.copyData(ds[0]);
        		
        		this.FN_searchRateAmt();
        		this.FN_searchPreminum();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //USER FUNCTION : 차량번호체크
        this.carNoCheck = function(){
        	//var pattern1      = /\d{2}[가-힣ㄱ-ㅎㅏ-ㅣ\x20]\d{4}/g; 					 			// 12저3456
        	//var pattern2 	   	= /[가-힣ㄱ-ㅎㅏ-ㅣ\x20]{2}\d{1}|d{2}[가-힣ㄱ-ㅎㅏ-ㅣ\x20]\d{4}/g; 	// 서울12치1234
        	var pattern1       	= /\d{2}[가-힣ㄱ-ㅎㅏ-ㅣ\x20]\d{4}/g; 				 				// 12저3456
        	var pattern2 	   	= /[가-힣ㄱ-ㅎㅏ-ㅣ\x20]{2}\d{2}[가-힣ㄱ-ㅎㅏ-ㅣ\x20]\d{4}/g; 		// 서울12치1234
        	var pattern3 	   	= /[가-힣ㄱ-ㅎㅏ-ㅣ\x20]{2}\d{1}[가-힣ㄱ-ㅎㅏ-ㅣ\x20]\d{4}/g; 		// 서울1치1234 // 2016-06-02 이영근, 패턴 추가
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
        	}else if( carNoValLen == 8){
        		if( !pattern3.test(carNoVal) ){
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
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //USER FUNCTION : 할인관리
        this.FN_searchRateAmt = function(){
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
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //USER FUNCTION : 계약별캠페인적용
        this.FN_applyRtsd0014 = function(){
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
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //USER FUNCTION : 프리미엄정보
        this.FN_searchPreminum = function(){
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
        }
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
        	Ex.core.popup(this,"대리점조회","comm::RTCOMMAgency_pop.xfdl",args, "modaless=false");
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

        	this.div_installInfo.cal_procDay.setFocus(true);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_installInfo_cal_procDay_onchanged = function(obj,e){
        	var regId = this.ds_rtsd0100.getColumn(0,"regId");
        	var custTp = this.ds_rtsd0100.getColumn(0,"custTp");
        	// [20161206_02]
        	if( (this.userGrp == "02") || (this.userGrp == "09") || (this.userGrp == "13") || (this.userGrp == "01" && this.onlineLoginId && custTp == "02" ) ){
        		if( this.div_installInfo.cal_procDay.value < this.addDay ){
        			alert("장착일자는 계약일자로부터 3~15일후 등록하실 수 있습니다.");
        			this.div_installInfo.cal_procDay.set_value( this.addDay );
        			return false;
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
        this.div_etcInfo_btn_preminum_onclick = function(obj,e){
        	var cntCd 	 = nvl(this.ds_price.getColumn(this.ds_price.rowposition, "cntCd"));
        	var seasonCd = nvl(this.ds_price.getColumn(this.ds_price.rowposition, "seasonCd"));
        	var ordDay   = nvl(this.ds_price.getColumn(this.ds_rtsd0104.rowposition, "ordDay"));
        	
        	if( this.ds_price.getRowCount() > 0 ){
        		if( cntCd == "" ){ 			alert("타이어갯수 값이 없습니다."); 	this.div_productInfo.setFocus(true); return false;
        		}else if( seasonCd == "" ){ alert("계절 값이 없습니다."); 		this.div_productInfo.setFocus(true); return false;
        		}else{
        			args ={ p_arg : this.p_arg, cntCd : cntCd, seasonCd : seasonCd, ordDay : ordDay};
        			Ex.core.popup(this,"프리미엄서비스 조회","comm::RTCOMMPreminumService_pop.xfdl",args, "modaless=false");		
        		}
        	}else{
        		alert("상품을 먼저 추가하세요.");
        		this.grid_price.setFocus(true);
        	}
        	
        }
        this.returnPreminum = function(ds){
        	if(ds[0].rowcount > 0){
        		this.ds_rtsd0013.clearData();
        		this.ds_rtsd0013.copyData(ds[0]);
        	}
        }
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
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.setSalesmanTel = function(){
        	var cd 	 = nvl(this.div_salesmanInfo.cb_orgAgent.value);
        	var cdNm = nvl(this.div_salesmanInfo.cb_orgAgent.text);
        	if( cd != "" && cdNm != "" ){	
        		var nRow = this.ds_rtsd0113.findRowExpr("cd == '"+cd+"'&&cdNm == '"+cdNm+"'",-1);
        		var tel = nvl(this.ds_rtsd0113.getColumn(nRow, "tel"));
        		if( tel != "" ){
        			this.div_salesmanInfo.ed_salesmanTel.set_value( FN_numberHyphenInReturn(tel) );
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
        	
        	var priceRow 				= this.ds_price.rowposition;
        	var modelRow 				= this.ds_model.rowposition;
        	
        	var nRow0106 				= this.ds_rtsd0106.rowposition;
        	var contractProductRowType 	= this.ds_rtsd0106.getRowType(nRow0106);
        	
        	var payDd 					= "";
        	var payMthd 				= nvl(this.ds_rtsd0104.getColumn(nRow0104, "payMthd"));
        	
        	var msg						= " 값이 없습니다.";
        	
        	var chanCd = nvl(this.ds_rtsd0104.getColumn(nRow0104, "chanCd"));
        	var statCd = nvl(this.ds_rtsd0104.getColumn(nRow0104, "statCd"));
        	var regId  = nvl(this.ds_rtsd0104.getColumn(nRow0104, "regId"));

        	if( chanCd == "02" || ( chanCd == "03" && this.onlineLoginId == regId ) ){
        		alert("온라인, 방판 정보는 수정 처리가 불가 합니다!");
        		return false;
        	}
        	
        	if( statCd=="03" || statCd=="04" || statCd=="06" ){
        		alert("장착대기, 장착완료, 계약취소 정보는 수정  처리가 불가 합니다!");
        		return false;
        	}
        	
        // 	if( this.div_payInfo.ed_buslNoCheck.value == false){
        // 		alert("사업자번호를 확인하세요.");
        // 		return false;
        // 	}
        // 	
        // 	if( this.div_payInfo.ed_ebirDayCheck.value == false){
        // 		alert("법정생년월일을  확인하세요.");
        // 		return false;
        // 	}
        	
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
        	
        	var carNo = nvl(this.ds_rtsd0104.getColumn(nRow0104, "carNo"));
        	if( carNo == "" ){
        		alert("차량No" + msg);
        		return false;
        	}

        	this.ds_rtsd0104.setColumn( nRow0104, "accChk", "N");				//계좌확인상태
        	this.ds_rtsd0104.setColumn( nRow0104, "bkeyChk", "N");
        	this.ds_rtsd0104.setColumn( nRow0104, "batchKey", "" );												//BATCHKEY
        	this.ds_rtsd0104.setColumn( nRow0104, "accStat", "5");

        	this.ds_rtsd0104.setColumn( nRow0104, "grpYn", "N"); //고객결합여부
        	this.ds_rtsd0104.setColumn( nRow0104, "payMthd", "A"); //결제구분
        	this.ds_rtsd0104.setColumn( nRow0104, "cmsAgYn", "N"); //출금이체동의
        	payDd = "05";										 //이체일
        	
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

        	var cntPrice = this.ds_price.getRowCount();
        	if( cntPrice <= 0){
        		alert("상품-가격 정보가 없습니다.");
        		this.div_productInfo.setFocus(true);
        		return false;
        	}else{
        	}

        	var cntRtsd0013 = this.ds_rtsd0013.getRowCount();
        	if( cntRtsd0013 <= 0){
        		alert("프리미엄서비스 정보가 없습니다.");
        		this.div_preminum.btn_preminum.setFocus(true);
        		return false;
        	}else{
        	}

        	var cntRtsd0014 = this.ds_rtsd0014.getRowCount();
        	if( cntRtsd0014 <= 0){
        		alert("계약별 캠페인적용 정보가 없습니다.");
        		return false;
        	}else{
        	}
        										
        	var ordAgent = nvl(this.ds_rtsd0104.getColumn(nRow0104, "ordAgent"));													//판매인번호
        	var regId   = nvl( this.ds_rtsd0100.getColumn(0,"regId")  );
        	var custTp  = nvl( this.ds_rtsd0100.getColumn(0,"custTp") );
        	// [20161206_02]
        	if( (this.userGrp == "02") || (this.userGrp == "09") || (this.userGrp == "13") || (this.userGrp == "01" && regId != this.onlineLoginId && custTp == "02") ){
        		if( ordAgent == "" ){
        			alert("판매원명 값이 없습니다.");
        			this.div_salesmanInfo.cb_orgAgent.setFocus(true);
        			return false;
        		}
        	}

        	this.ds_rtsd0104.setColumn( nRow0104, "contentsCd", 	contentsCd);													//사양
        	this.ds_rtsd0104.setColumn( nRow0104, "frCd", 			frCd);  														//전후 구분
        	//this.ds_rtsd0104.setColumn( nRow0104, "conMthd",		this.div_etcInfo.ch_conMthd.value ? "Y" : "N");					//계약서 교부방법
        	this.ds_rtsd0104.setColumn( nRow0104, "pcertYn",		this.div_etcInfo.ch_pcertYn.value ? "Y" : "N");					//신분증 첨부 필수여부
        	this.ds_rtsd0104.setColumn( nRow0104, "periodCd",		nvl(this.ds_price.getColumn( priceRow, "periodCd")) );			//기간코드
        	this.ds_rtsd0104.setColumn( nRow0104, "cntCd",			nvl(this.ds_price.getColumn( priceRow, "cntCd")) );				//타이어본수
        	this.ds_rtsd0104.setColumn( nRow0104, "regiCd",			nvl(this.ds_price.getColumn( priceRow, "regiCd")) );			//등록비코드
        	this.ds_rtsd0104.setColumn( nRow0104, "custNo",			nvl(this.ds_rtsd0100.getColumn(nRow0100,"custNo")) );			//고객번호
        	this.ds_rtsd0104.setColumn( nRow0104, "custTp",			nvl(this.ds_rtsd0100.getColumn(nRow0100, "custTp")) );			//고객유형
        	this.ds_rtsd0104.setColumn( nRow0104, "safekey",		nvl(this.ds_rtsd0100.getColumn(nRow0100, "safekey")) );			//인증번호
        	this.ds_rtsd0104.setColumn( nRow0104, "campYn",			nvl(this.ds_price.getColumn( priceRow, "campYn")) );			//캠페인적용여부
        	this.ds_rtsd0104.setColumn( nRow0104, "cDcamt",			nvl(this.ds_price.getColumn( priceRow, "cDcamt")) );			//캠페인할인금액
        	this.ds_rtsd0104.setColumn( nRow0104, "gDcrate",		nvl(this.ds_price.getColumn( priceRow, "gDcrate")));			//결합할인율
        	this.ds_rtsd0104.setColumn( nRow0104, "gDcamt",			nvl(this.ds_price.getColumn( priceRow, "gDcamt")));				//결합할인액
        	this.ds_rtsd0104.setColumn( nRow0104, "lDcrate",		nvl(this.ds_price.getColumn( priceRow, "lDcrate")));			//제한할인율
        	this.ds_rtsd0104.setColumn( nRow0104, "lDcamt",			nvl(this.ds_price.getColumn( priceRow, "lDcamt")));				//제한할인액
        	this.ds_rtsd0104.setColumn( nRow0104, "fDcamt",			nvl(this.ds_price.getColumn( priceRow, "fDcamt")));				//최종할인액
        	this.ds_rtsd0104.setColumn( nRow0104, "payDd", 			payDd);															//이체일
        	//this.ds_rtsd0104.setColumn( nRow0104, "fcDay", "")																	//최초청구일자
        	//this.ds_rtsd0104.setColumn( nRow0104, "inputDt", "")																	//PAD입력일시
        	//this.ds_rtsd0104.setColumn( nRow0104, "filePath", "")																	//계약서 파일경로
        	//this.ds_rtsd0104.setColumn( nRow0104, "fileName", "")																	//계약서 파일명
        	this.ds_rtsd0104.setColumn( nRow0104, "psCd", nvl(this.ds_rtsd0013.getColumn(0, "psCd")));								//프리미엄서비스코드
        	this.ds_rtsd0104.setColumn( nRow0104, "seasonCd", nvl(this.ds_price.getColumn(0, "seasonCd")));							//계절구분

        	if( contactRowType =="2" ){
        		this.ds_rtsd0104.setColumn( nRow0104, "ordId", "02");																//계약구분 : 렌탈
        		
        		//if( this.userGrp == "02" ){
        		//	this.ds_rtsd0104.setColumn( nRow0104, "chanCd", "04");															//채널구분 : 입점몰
        		//}else if( this.userGrp == "01" && regId != this.onlineLoginId && custTp == "02" ){
        		//	this.ds_rtsd0104.setColumn( nRow0104, "chanCd", "06");															//채널구분 : B2B
        		//}else{
        		//	this.ds_rtsd0104.setColumn( nRow0104, "chanCd", "01");															//채널구분 : 대리점
        		//}
        		
        		this.ds_rtsd0104.setColumn( nRow0104, "billYn", "N");																//세금계산서발행여부
        		this.ds_rtsd0104.setColumn( nRow0104, "statCd", "03");																//상태 : RTCM0051-CD_GRP_CD='S032'
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
        	
        	this.ds_rtsd0106.setColumn( nRow0106, "planDay", 	nvl(this.ds_rtsd0104.getColumn(nRow0104, "procDay")) );		//	장착예정일
        	this.ds_rtsd0106.setColumn( nRow0106, "periodCd", 	nvl(this.ds_price.getColumn( priceRow, "periodCd")) );		//	기간코드
        	this.ds_rtsd0106.setColumn( nRow0106, "cntCd",	 	nvl(this.ds_price.getColumn( priceRow, "cntCd")) );			//	타이어본수
        	this.ds_rtsd0106.setColumn( nRow0106, "regiCd",	 	nvl(this.ds_price.getColumn( priceRow, "regiCd")) );		//	등록비코드
        	this.ds_rtsd0106.setColumn( nRow0106, "frCd", 		nvl(this.ds_price.getColumn( priceRow, "frCd")) );			//	장착위치
        	this.ds_rtsd0106.setColumn( nRow0106, "matCd", 		nvl(this.ds_price.getColumn( priceRow, "matCd")) );			//	상품코드
        	this.ds_rtsd0106.setColumn( nRow0106, "ordQty", 	nvl(this.ds_price.getColumn( priceRow, "ordQty")) );		//	수량
        	this.ds_rtsd0106.setColumn( nRow0106, "regiAmt", 	nvl(this.ds_price.getColumn( priceRow, "regiAmt")) );		//	렌탈등록비
        	this.ds_rtsd0106.setColumn( nRow0106, "rentAmt", 	nvl(this.ds_price.getColumn( priceRow, "rentAmt")) );		//	월렌탈료(조견표)
        	this.ds_rtsd0106.setColumn( nRow0106, "fDcamt",		nvl(this.ds_price.getColumn( priceRow, "fDcamt")));			//	최종할인액
        	this.ds_rtsd0106.setColumn( nRow0106, "monDcamt",	nvl(this.ds_price.getColumn( priceRow, "fDcamt")));			//	월렌탈료 할인액 : 최종할인액동일함
        	this.ds_rtsd0106.setColumn( nRow0106, "monAmt",		nvl(this.ds_price.getColumn( priceRow, "monAmt")));			//	월렌탈료
        	this.ds_rtsd0106.setColumn( nRow0106, "matDesc", 	nvl(this.ds_price.getColumn( priceRow, "matDesc")));		//	비고

        	if( contractProductRowType == "2" ){
        		this.ds_rtsd0106.setColumn( nRow0106, "ordId","02");														//	주문구분 01:렌탈 S029
        		this.ds_rtsd0106.setColumn( nRow0106, "instYn", "N");														//	장착여부
        		this.ds_rtsd0106.setColumn( nRow0106, "valYn", "N");														//	유효여부
        		this.ds_rtsd0106.setColumn( nRow0106, "osId", "N");															//	소유권이전구분
        		this.ds_rtsd0106.setColumn( nRow0106, "statCd", "03");														//	상태 : S032
        		this.ds_rtsd0106.setColumn( nRow0106, "flYn", "N");															//	장착위-앞,왼쪽
        		this.ds_rtsd0106.setColumn( nRow0106, "frYn", "N");															//	장착위치-앞,오른쪽
        		this.ds_rtsd0106.setColumn( nRow0106, "rlYn", "N");															//	장착위치-뒤,왼쪽
        		this.ds_rtsd0106.setColumn( nRow0106, "rrYn", "N");															//	장착위치-뒤,오른쪽
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
        	}

        	if( this.ds_rtsd0104.getRowType(0) == 1 || this.ds_rtsd0104.getRowType(0) == 2 || this.ds_rtsd0104.getRowType(0) == 4){
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
        	
        	}

        	var ordAgent = nvl(this.div_salesmanInfo.cb_orgAgent.value);
        	var agencyCd = nvl(this.div_installInfo.ed_agencyCd.value);
        	
        	var sSvcID      	= "sRtsd0104ChanCd";  
        	var sController   	= "/rtms/sd/sRtsd0104ChanCd.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	sArgs += Ex.util.setParam("inPath"	, "R");
        	sArgs += Ex.util.setParam("ordAgent", ordAgent);
        	sArgs += Ex.util.setParam("agencyCd", agencyCd);
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.FN_goSave = function(){
        	if( confirm( "저장하시겠습니까?") ){
        		this.fn_addSmsMsg(); // 2016-07-28 이영근, 문자메시지 발송 기능 추가
        	
        		var sSvcID        	= "saveContractRegister";                    
        		var sController   	= "rtms/sd/saveB2BContractRegister.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";

        		sInDatasets   		+= " dsRtsd0104=ds_rtsd0104:A ";
        		sInDatasets			+= " dsRtsd0106=ds_rtsd0106:A ";
        		sInDatasets			+= " dsRtsd0013=ds_rtsd0013:A ";
        		sInDatasets			+= " dsRtsd0014=ds_rtsd0014:A ";
        		sInDatasets			+= " dsRtsd0205=ds_rtsd0205:A ";
        		
        		var fn_callBack		= "fn_callBack";
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
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
        // 2016-07-28 이영근, 문자메시지 발송 기능 추가
        this.fn_addSmsMsg = function(){
        	this.ds_rtsd0205.clearData();
        	var nRowRtsd0205 = this.ds_rtsd0205.addRow();
        	var matNm = nvl(this.ds_price.getColumn( 0, "matNm"));
        	var ordQty = nvl(this.ds_price.getColumn( 0, "ordQty"));
        	var agencyNm = this.div_installInfo.ed_agencyNm.text;
        	var city = this.div_installInfo.ed_city.text;
        	var street = this.div_installInfo.ed_street.text;
        	var telNo = this.div_installInfo.ed_telNo.text;
        	
        	var smsMsg = "[NEXT LEVEL] " + matNm + " " + ordQty + "개 /" + agencyNm + "/" + city + " " + street + "/" + telNo;
        	this.ds_rtsd0205.setColumn(nRowRtsd0205, 	"chanCd",	nvl(this.ds_rtsd0104.getColumn(0, "chanCd")) );
        	this.ds_rtsd0205.setColumn(nRowRtsd0205, 	"custNm",	nvl(this.ds_rtsd0100.getColumn(0,"custNm")) );
        	this.ds_rtsd0205.setColumn(nRowRtsd0205, 	"mobNo",	nvl(this.ds_rtsd0100.getColumn(0,"mobNo")) );
        	this.ds_rtsd0205.setColumn(nRowRtsd0205, 	"smsMsg",	smsMsg);
        }
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.ds_model.addEventHandler("onrowposchanged", this.ds_model_onrowposchanged, this);
            this.addEventHandler("onload", this.RTSDContractRegister_onload, this);
            this.div_custInfo.ed_cTelno.addEventHandler("onkeyup", this.div_cust_ed_cTelno_onkeyup, this);
            this.div_custInfo.cb_custTp.addEventHandler("onitemchanged", this.div_custInfo_cb_custTp_onitemchanged, this);
            this.div_custInfo.btn_custNew.addEventHandler("onclick", this.div_custInfo_btn_custNew_onclick, this);
            this.div_custInfo.btn_custNoSearch.addEventHandler("onclick", this.div_custInfo_btn_custNoSearch_onclick, this);
            this.div_carInfo.cb_makerCd.addEventHandler("onitemchanged", this.div_carInfo_cb_makerCd_onitemchanged, this);
            this.div_carInfo.cb_model.addEventHandler("onitemchanged", this.div_carInfo_cb_model_onitemchanged, this);
            this.div_carInfo.ed_carOwner.addEventHandler("onkeyup", this.div_carInfo_ed_carOwner_onkeyup, this);
            this.div_carInfo.ed_carNo.addEventHandler("onkeyup", this.div_carInfo_ed_carNo_onkeyup, this);
            this.div_carInfo.ed_carNo.addEventHandler("onchanged", this.div_carInfo_ed_carNo_onchanged, this);
            this.div_carInfo.ed_cMileage.addEventHandler("onchanged", this.div_carInfo_ed_cMileage_onchanged, this);
            this.div_productInfo.grid_price.addEventHandler("oncellclick", this.div_productInfo_grid_price_oncellclick, this);
            this.div_installInfo.cal_procDay.addEventHandler("onchanged", this.div_installInfo_cal_procDay_onchanged, this);
            this.div_installInfo.btn_searchAgency.addEventHandler("onclick", this.div_installInfo_btn_searchAgency_onclick, this);
            this.div_salesmanInfo.cb_orgAgent.addEventHandler("onitemchanged", this.div_salesmanInfo_cb_orgAgent_onitemchanged, this);
            this.div_salesmanInfo.ed_salesmanTel.addEventHandler("onkeyup", this.div_salesmanInfo_ed_salesmanTel_onkeyup, this);
            this.div_salesmanInfo.ed_1.addEventHandler("onkeyup", this.div_salesmanInfo_ed_salesmanTel_onkeyup, this);
            this.div_salesmanInfo.ed_2.addEventHandler("onkeyup", this.div_salesmanInfo_ed_salesmanTel_onkeyup, this);
            this.div_preminum.btn_preminum.addEventHandler("onclick", this.div_etcInfo_btn_preminum_onclick, this);
            this.ra_sale.addEventHandler("onitemchanged", this.ra_sale_onitemchanged, this);
            this.btn_orderNoSearch.addEventHandler("onclick", this.btn_orderNoSearch_onclick, this);

        };

        this.loadIncludeScript("RTSDB2BContractRegister.xfdl");

       
    };
}
)();
